Received: by 2002:a17:505:8d87:b0:1be9:327d:8ee3 with SMTP id ri7csp2225247njc;
        Mon, 22 Jul 2024 18:04:26 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCU8dibnDA5uRVKDpcTqPt3yRjyBVaWmsehdch7y5uzgTeB27DU0FE6/6ileU40B6LChXSH2iYLBxGCxMhxzJxndwWJ0aLcP
X-Google-Smtp-Source: AGHT+IHJNwOyXeZkMBmN4kFTPScaF6hW7L1ZyYUWAxxp0U8zq5HPp9KTnsUettYS05+8xgNpPLpM
X-Received: by 2002:a05:6902:2843:b0:e08:75d2:dd43 with SMTP id 3f1490d57ef6-e08b590db1emr1771764276.40.1721696666699;
        Mon, 22 Jul 2024 18:04:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1721696666; cv=none;
        d=google.com; s=arc-20160816;
        b=yvcqJilDx+mbVij8laLvfXQRVnE6lWoiNHeHQ9PgiJcBaT8tqdg9+7GPzwXWPzZm2v
         KCd/W1hgX9ZxYKh3dEZOkOoDei6Upg/JiGMfA7DctuftWhaoxFnwmWnY8/PwvWso4l2U
         N6p7z6pp6bRQ9FMKjPppqeeYs+cstKTyZsIcRQsl9H4blJ63AMVdXWTJXNZYYCnpFgTw
         0u9WTY8zMFiPKTNIt3+NWN6Glk2Cg9QSqLY0zxh1/M/fo/3r39RwgTSylAzYpOiSYA/n
         enSuafztY0aHAxRnQpexJ1CbbnpwfT1ZOl6/gItF8w+3sd96rjDV8mwbZZ78suY5d2an
         ZjhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=M9Jepm4/txH3Vn+yfotJrT47ME8cKpqiDJMuGOJpXX0=;
        fh=uJkpqDobvRRSPb/nGjkYP8xotbMwWVoXMPB17SgABjo=;
        b=qI/ooQ0Ltt084uqSUKBUml+pBylqxCJua6RinTlaXfRn8AEwvdfqk468P/Uqn439Ze
         igKC007CBWcYJFJGZBqGpvmR+CcZyNUfkIBGlb8zQS33SgUGEDAUmye5+RRTrH7s2Loc
         KD0PbBdte/aKiDwpEsoc9d926cyOzQBNJWxUYiZcGu1uzEJB1SLRcSepPwnotFVxXBcL
         raKsiGh+haIuXQL48l+TaLppLPxMlHyRs2aWSdBo6FE78wtz19LPHG9YS/Ao/SDRJ9Pl
         HeokuPvrIYJMi9CMFj/Hvu73gu42sWsKCmjljUtrt2FE9oh1GVh9WJUNiqW3cjwNbjVD
         uyDw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=m9Wx9a4N;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6b7ac7a0c6esi86949786d6.52.2024.07.22.18.04.26
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 22 Jul 2024 18:04:26 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=m9Wx9a4N;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sW3wp-0005FF-GT; Mon, 22 Jul 2024 21:04:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1sW3wn-0005E8-Nd
 for qemu-arm@nongnu.org; Mon, 22 Jul 2024 21:04:09 -0400
Received: from mail-pg1-x533.google.com ([2607:f8b0:4864:20::533])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1sW3wk-00084d-IK
 for qemu-arm@nongnu.org; Mon, 22 Jul 2024 21:04:09 -0400
Received: by mail-pg1-x533.google.com with SMTP id
 41be03b00d2f7-7a23fbb372dso188740a12.0
 for <qemu-arm@nongnu.org>; Mon, 22 Jul 2024 18:04:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1721696643; x=1722301443; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=M9Jepm4/txH3Vn+yfotJrT47ME8cKpqiDJMuGOJpXX0=;
 b=m9Wx9a4NGjJ59ltIqmM0/vgunB5TVEl7PR71HFiyKhLgj+257toBA4cISDKiJXkhSE
 zDtQ3yoaqyh1eac8Prl/z1lQYWCLmQ410rbFUvv1PoseZKUALpVZgjTfzNobdGfsLdZs
 HKnSLemZeI0nA0ZrkIdE9iafJUmwAWwLxxebObRlT0XUGN1OKeasC8y5zLFm72fbz6xb
 tuEAA8KmL95zHVCJP7Ve6EoHHp48+rw2LKTwY+1AKvrfCcaGlvBT28TJarpxta9sm8Jd
 ZD+L7bpJWRJtu7gWc31ND7t8Q9TiWJPM+mvbJjSCNbFXJkJa80ctuvMVt/L0z7oBVDVI
 e0Hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721696643; x=1722301443;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=M9Jepm4/txH3Vn+yfotJrT47ME8cKpqiDJMuGOJpXX0=;
 b=Mp3c+zBQ24owxERCRdPxkmfb2J6PE1FuA2xIi3M0jLNy5qjK3HoXvZhSXRN7pt66Jo
 AHE01JpLYwOabhqfz9ZTdddESuJp7PraKzjsGwWFokWi62S5usL1amXnCtjKvRhQutT3
 G9ewho8JBWgbL6R9CEJlcwvUotxplqcs2GiZGdXqvgqHk+rJmD277E4QULf8nzZW1fiL
 60ZnQxv1zThg8eH3BKBITDk+NIl1VYWM2t5HAyt5aDKoUGWJrWDnNky5dKnXqxkXec11
 +FUVgB/SbVZwB1zCg10amuoa+8DMgJXnzKfIbhR9Uz3ElXl1ovdNGr5achMBQB7zVm2Y
 oSyA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVSVjTUCNqfzmHxLkX+H71mwAGaKpeeqmBEuwnm3MbI3JeTRceRuHMQ7unkqcFJBN98CIooI3h+YUxcyae4K6XmUFKP
X-Gm-Message-State: AOJu0YyicLuNC9WvfjuWi9JEuQ3t969T9PLalxCbyTYCNwUpbV2UFdqm
 Rq9emAYkTVP1MjvKSAMfpIp6+N8jfrh7pipx/3bav6jLFEyxCXtWCQsGoN3V0BE=
X-Received: by 2002:a05:6a21:385:b0:1c3:cfc2:2b1f with SMTP id
 adf61e73a8af0-1c44f934a35mr1651517637.37.1721696643014; 
 Mon, 22 Jul 2024 18:04:03 -0700 (PDT)
Received: from [192.168.1.113] ([203.56.128.103])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-1fd6f486648sm61737305ad.282.2024.07.22.18.03.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 22 Jul 2024 18:04:02 -0700 (PDT)
Message-ID: <c5585673-f0c7-4da7-8dea-d87701ccfb0d@linaro.org>
Date: Tue, 23 Jul 2024 11:03:56 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 09/14] bsd-user: Simplify the implementation of execve
To: Warner Losh <imp@bsdimp.com>, qemu-devel@nongnu.org
Cc: Kyle Evans <kevans@freebsd.org>, qemu-arm@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>, Doug Rabson <dfr@rabson.org>
References: <20240722214313.89503-1-imp@bsdimp.com>
 <20240722214313.89503-10-imp@bsdimp.com>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20240722214313.89503-10-imp@bsdimp.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::533;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x533.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: 7jCiMqFqIa4Q

On 7/23/24 07:43, Warner Losh wrote:
> From: Doug Rabson<dfr@rabson.org>
> 
> This removes the logic which prepends the emulator to each call to
> execve and fexecve. This is not necessary with the existing
> imgact_binmisc support and it avoids the need to install the emulator
> binary into jail environments when using 'binmiscctl --pre-open'.
> 
> Signed-off-by: Doug Rabson<dfr@rabson.org>
> Reviewed-by: Warner Losh<imp@bsdimp.com>
> Signed-off-by: Warner Losh<imp@bsdimp.com>
> ---
>   bsd-user/freebsd/os-proc.c | 118 +------------------------------------
>   bsd-user/main.c            |  18 ------
>   2 files changed, 3 insertions(+), 133 deletions(-)

Acked-by: Richard Henderson <richard.henderson@linaro.org>

r~
