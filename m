Received: by 2002:a19:6b17:0:0:0:0:0 with SMTP id d23csp3991380lfa;
        Mon, 19 Oct 2020 08:57:41 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwg0NJGQrqYN4jLqKwX+xayC69p+ZL+A7vt9GGH8gq0HDb0zbd7AM5zfnE+zQnGFfAwSSfB
X-Received: by 2002:a25:24b:: with SMTP id 72mr536855ybc.138.1603123061177;
        Mon, 19 Oct 2020 08:57:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1603123061; cv=none;
        d=google.com; s=arc-20160816;
        b=GK0wiad30PysP1UIa4rOjdCxa5oBLubeOenv34o9D9xKxW/utXCrbBp6sYq6RFXClk
         LHzNW2R5dI3F/7dNeY4xHWj/oNOU3AW0vMfmaktuug0K17Z4fR1cx858JlDZKShR+A4x
         f3S6oj8jUsxGLZWK24YHgvr2K+LhGN5ZQkHSr30n6DxPqgj26tIIRqEqy9kKV5B0mMU9
         0ak18P8awbY9FjuppxIJfuOu5TX5+O/dBDTbfntOc/WpugZ/Pt+mqHY3uTUAdK1I4VSY
         JsO1lHxPC44/5hkBi7/g04F50OPUzg3cgaSZ85vPm0MLt75KJsuBrAEhGo0mtt+QMGyK
         cN4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=vAhVBxMYUODQU0vjWNSBtUAbQfWsvWH/MyQUcKmeFEQ=;
        b=iEYvrNm1DKT9zfaySgM8zAaNLQDpbfoTCRKaZnzkO5FzSwUDIeisEE6TKUDVsdXE0O
         rE1OBPLFjPTzz7Xtuv/+FCfrKvvkLGgXEQaMxFc5Ncpg1Lwz9/JaqfLwineaXTa3GqEI
         VgjMnqOWioiyEz8/Wy5GNbMBxeyUBnhghqDh/xeBhnVcwhoINT890pnGhpPImDEs0ws8
         ZQTJGZsUHkFQCaKUfN1wkGI82sIW0X2nd0i4wj6rJMKkUPwjGSEITJ6mwOQe8ssbE1/S
         KlqeKsnvW4odxIL6sLH5FUiwq68YQlG81J6Pd7L+GM+rraDnAyiUS6nuM6nedPj9NwO/
         Ur2g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=fczoxVaK;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l66si300314ybl.362.2020.10.19.08.57.41
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 19 Oct 2020 08:57:41 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=fczoxVaK;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:59288 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kUXXY-0005h9-Io
	for alex.bennee@linaro.org; Mon, 19 Oct 2020 11:57:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52550)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kUXXM-0005f5-4E
 for qemu-arm@nongnu.org; Mon, 19 Oct 2020 11:57:28 -0400
Received: from mail-pj1-x1043.google.com ([2607:f8b0:4864:20::1043]:39690)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kUXXK-0000Vo-AB
 for qemu-arm@nongnu.org; Mon, 19 Oct 2020 11:57:27 -0400
Received: by mail-pj1-x1043.google.com with SMTP id gv6so699pjb.4
 for <qemu-arm@nongnu.org>; Mon, 19 Oct 2020 08:57:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=vAhVBxMYUODQU0vjWNSBtUAbQfWsvWH/MyQUcKmeFEQ=;
 b=fczoxVaKF7j5Ka5EDrEBV9cOTLcrAO5BIuSKGcLzG3/qMNvRB23ZP8Mr7hOLNncUE8
 Lo5oEvXAVMxXclZEl0qCsW8RGsUb3+0nas4Zmqt17z6gaZJaF1Y+TF8os5OcPv9G0V2R
 KF+Dn80cwfLwJakoVSpeNOhfGAR6QlT9IkHfOZP7JSb+j8EM4waxBI5DY3ZgzFYN2ARb
 8DuRr4mmlixVOHbW/fx7KwCHbAZjm5r9r1dVxFQv4i+qrA/EXTdCYdEbIte32WrzUuXq
 ypo21isluuuGJEWuhCh+Zu+YYqC6bklZasWowJPxmsyqmtb5uXEe6vD2rC1/WRuKz31x
 v6Yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=vAhVBxMYUODQU0vjWNSBtUAbQfWsvWH/MyQUcKmeFEQ=;
 b=dMVjy36E4whH2QFi80dW38R2mN7Dt/iPDgtnIIGOUggT4Ej6MsLcVm8oFTzgAW5xHd
 W3K8E2IU7+3u34tqGt/CSwp8KNnE9Ru81Hwp+XLx1XYc1s7XSwL8nyj+oYYOe8407tL8
 SXWY5LRRAL2FG/rtVp5xl3Lrw7g5A09lpGjSPNu45/XKqiKhN/XpOJxSBZZR9F6rrs10
 I/taHYU4UY30vUyX7E6VpbB1BuoQJ4W07Pe2a5Bu5Zgvzkj1OobFSQgNTjv138pCMIW+
 I+PZ/D2RB1B9cBBrLvXf3XQ/9wyU0Ke3wZKvfZPqYwgQRmXuTQY4CQwsSs4voe9f4fJy
 Onxw==
X-Gm-Message-State: AOAM5323ldMfVjDAj1jLGvyQ/Lyg3W7sXm8WFfWYlcN+SYwUKRyFdRdn
 iSMifXTyG0gknDMsbu8pJjginw==
X-Received: by 2002:a17:902:8205:b029:d5:dc92:a1d4 with SMTP id
 x5-20020a1709028205b02900d5dc92a1d4mr271567pln.41.1603123044644; 
 Mon, 19 Oct 2020 08:57:24 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.141.89])
 by smtp.gmail.com with ESMTPSA id n18sm254382pff.129.2020.10.19.08.57.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 19 Oct 2020 08:57:23 -0700 (PDT)
Subject: Re: [PATCH v2 09/10] target/arm: Allow M-profile CPUs with FP16 to
 set FPSCR.FP16
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20201019151301.2046-1-peter.maydell@linaro.org>
 <20201019151301.2046-10-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <e3fc4b0e-d6c1-05e3-451e-e17419a02858@linaro.org>
Date: Mon, 19 Oct 2020 08:57:21 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201019151301.2046-10-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1043;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1043.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
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
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: RjfAne82FPF/

On 10/19/20 8:13 AM, Peter Maydell wrote:
> M-profile CPUs with half-precision floating point support should
> be able to write to FPSCR.FZ16, but an M-profile specific masking
> of the value at the top of vfp_set_fpscr() currently prevents that.
> This is not yet an active bug because we have no M-profile
> FP16 CPUs, but needs to be fixed before we can add any.
> 
> The bits that the masking is effectively preventing from being
> set are the A-profile only short-vector Len and Stride fields,
> plus the Neon QC bit. Rearrange the order of the function so
> that those fields are handled earlier and only under a suitable
> guard; this allows us to drop the M-profile specific masking,
> making FZ16 writeable.
> 
> This change also makes the QC bit correctly RAZ/WI for older
> no-Neon A-profile cores.
> 
> This refactoring also paves the way for the low-overhead-branch
> LTPSIZE field, which uses some of the bits that are used for
> A-profile Stride and Len.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  target/arm/vfp_helper.c | 47 ++++++++++++++++++++++++-----------------
>  1 file changed, 28 insertions(+), 19 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

