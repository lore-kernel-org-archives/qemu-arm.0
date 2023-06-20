Received: by 2002:a17:906:6dca:b0:989:33b4:be89 with SMTP id j10csp183499ejt;
        Tue, 20 Jun 2023 03:31:04 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ42qjn2II2WCbP3SEMn7nAmOYdNNBZvh3e39VEtClsIdSrHUMjpIvJyQnZsE5ItUsTFeRbD
X-Received: by 2002:a05:622a:2c5:b0:3f3:8d64:f6a6 with SMTP id a5-20020a05622a02c500b003f38d64f6a6mr4191322qtx.18.1687257064409;
        Tue, 20 Jun 2023 03:31:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1687257064; cv=none;
        d=google.com; s=arc-20160816;
        b=v5FtlG/jSc0aOPQAZpi8Kzud++I1tMHDMG6KDgsuR+Q2yu3fNjEJGvFd2UbrJaFZly
         D6DyaiwQM9pUqYGPDxUvl022MBkbMelkKtINsNxNj6YCNzEqQCfgY8+eKQi5ZfRPhi77
         V4cAdeY+KSTpwLD10sNu9vUL3bUyGIHsxnZn4L5uXdraRgyOFuln+I/njqBlz340lsDK
         bNugaq+dejuyRRKST6XckruoQmqgKUbz7zJ/TRZp1ZsjQYshtLH0MexRt3fUiWNYshNn
         Y4Lk1+jyrsJt6MdnRMWQdPEZPISv7ex3XAsHxIr6ouRF+H4kfU1cEO/qQHDfddr2/71B
         aH4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=ClpX5cEhMJ84qtuDhZeVacC8rTiIqSalkuU37T9uZrI=;
        b=ZwM/7R1ias0VuFTlOl5DLnywa0UEHgs1KAAT4ir1TxfcnW0SsOokuk8ARYzbPtz0+b
         +5kTKtgziZV7Nb2p8vmnggJSOdvaWURB4K4AAeqV1f65zwcK7MH8oaqHqpaP+dWb7kW9
         b55ThxckRAVBgBMHddyrRN3VlpOulnztBXJrDD68Lg0wU8ksnTItAGetuKCN4/e31EtV
         RlEivunpZ5TBqv4w99jT6YP0QXw1xepHt/ybwTu+9Q1bTyqSyZIIyA/aJJ9WTGiFbHDP
         In0jmahY1XdL8yNf0YmQBQpFzD3DNIDc60j3//dtxqk9XdWhnNvPFr5J9EeXKb6HN5TI
         j4Ow==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=AIAPY9Y8;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s8-20020ac85cc8000000b003f51f102527si651363qta.760.2023.06.20.03.31.04
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 20 Jun 2023 03:31:04 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=AIAPY9Y8;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1qBYd1-0005xv-UZ; Tue, 20 Jun 2023 06:30:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1qBYcy-0005wd-88
 for qemu-devel@nongnu.org; Tue, 20 Jun 2023 06:30:24 -0400
Received: from mail-lf1-x133.google.com ([2a00:1450:4864:20::133])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1qBYcq-0001yk-6Y
 for qemu-devel@nongnu.org; Tue, 20 Jun 2023 06:30:23 -0400
Received: by mail-lf1-x133.google.com with SMTP id
 2adb3069b0e04-4f86d8a8fd4so3256853e87.3
 for <qemu-devel@nongnu.org>; Tue, 20 Jun 2023 03:30:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1687257013; x=1689849013;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=ClpX5cEhMJ84qtuDhZeVacC8rTiIqSalkuU37T9uZrI=;
 b=AIAPY9Y8Y4mvIzcuNUAJe1jmpC529LT4u88SaSDTcrqwreQ18yNiVEULz/UVBJnw/Z
 djJ3Br8XjF5a8EaRcf7oJM6HtXV++HYMyZHSTRzojoMAWI8lijd5NKLPARkVZinvpXtK
 vZ2ZVrnXfwr/dYqG1CPaMc9mkw7yt94VSA6E2/pFZyDgWsNBtKvhIXzB2ncM3l2ML/A5
 SLwNCFyG3XKEnjPgD1YJbmMgihU6KM6uyo4pU/3fZfb9WO0mohx7JJrLsXQ2dgRMFrYJ
 0nYH0y05JIJDlU8RkQ9PQFEf0Sje2n7nPYVy0bVHVLJ88E9uHLK5CHQnmDhY9PZmRTQu
 XkOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687257013; x=1689849013;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ClpX5cEhMJ84qtuDhZeVacC8rTiIqSalkuU37T9uZrI=;
 b=PDq7bjVLxADzQecMriGpa0RToaRhRXZ74I6LKS2nPbRMl1FiaC/ip4IopvytOnHUnd
 KWiObx/z1Q3hetgT/kjHJJPRGld5qxJMpEVgwJv79Tw4/0JZ5/uptoU3stHo0S29e6Dv
 ze2sVuViIx4wzhqeyS2ktaAVQNxlIPAcaHWx78LGUMY+zCgvJ/P2Wfvh0AtY2QwoTK6V
 6f2t+Ij7S+EOrM1chfavDOTrOmBZnQc0dQPgoRU1QH2VfDxCJMXyUJofyGoDR/t5VxNM
 grm/4oeQvIsCMUWKySqAdE/UneNwpfwRgk9k+cTnPEL4ME4ttTsA9wOFfBb7/NRZF+tY
 7p6Q==
X-Gm-Message-State: AC+VfDwy1Vm7DrHQ5wBQnSq4ToARfHvLb+lTT9iuEgRAkZaN76dfLarq
 wvC9zJNNyDZWAiciPGtc7TgT/Q==
X-Received: by 2002:a19:e346:0:b0:4f8:3b17:e0c7 with SMTP id
 c6-20020a19e346000000b004f83b17e0c7mr6379049lfk.7.1687257013542; 
 Tue, 20 Jun 2023 03:30:13 -0700 (PDT)
Received: from [192.168.69.129] ([176.176.183.29])
 by smtp.gmail.com with ESMTPSA id
 j7-20020aa7ca47000000b0051a5437a6c5sm941075edt.22.2023.06.20.03.30.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 20 Jun 2023 03:30:13 -0700 (PDT)
Message-ID: <5feda935-d68e-7b71-62a2-156b1c5b83d4@linaro.org>
Date: Tue, 20 Jun 2023 12:30:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v3 20/34] target/arm/tcg: Reduce 'helper-sve.h.inc'
 inclusion
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>
References: <20230619154302.80350-1-philmd@linaro.org>
 <20230619155510.80991-1-philmd@linaro.org>
 <20230619155510.80991-8-philmd@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230619155510.80991-8-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::133;
 envelope-from=richard.henderson@linaro.org; helo=mail-lf1-x133.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.09,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: 6yBLnm0Jx1lO

On 6/19/23 17:54, Philippe Mathieu-Daudé wrote:
> Instead of including helper-sve.h.inc via helper.h which
> is included by all TCG files, restrict it to the few files
> that require it.
> 
> Signed-off-by: Philippe Mathieu-Daudé<philmd@linaro.org>
> ---
>   target/arm/helper.h            | 1 -
>   target/arm/tcg/sve_helper.c    | 4 ++++
>   target/arm/tcg/translate-sme.c | 4 ++++
>   target/arm/tcg/translate-sve.c | 6 ++++++
>   target/arm/tcg/vec_helper.c    | 4 ++++
>   5 files changed, 18 insertions(+), 1 deletion(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
