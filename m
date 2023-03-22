Received: by 2002:a17:906:b2c6:b0:930:eaf4:5c09 with SMTP id cf6csp5404654ejb;
        Wed, 22 Mar 2023 08:13:16 -0700 (PDT)
X-Google-Smtp-Source: AKy350Zz9X7P922f5uNqI49kQqZN9svEj3uuCRIwCj4g4tI4GAkUvF8oNXC5VPGCklcf7y6BgbFD
X-Received: by 2002:a0d:ca56:0:b0:545:638f:2688 with SMTP id m83-20020a0dca56000000b00545638f2688mr198875ywd.8.1679497996436;
        Wed, 22 Mar 2023 08:13:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1679497996; cv=none;
        d=google.com; s=arc-20160816;
        b=OsqBWdRsdGFYUuJe8bY63gPBVpdCl4WfUd22meO0li3m7LYBV7C/7Kq40EvmcsuzGJ
         buZ261rj2Sr159Uyit1EQU5ultLrq8ehdcMOtYLyxt066Xk0GusnK4JIXoSeNqw13J3m
         +bQzqv6v+B6cfCsdIQ6YXiU+n5v3Ca5Z5t541ybl/GFNWcqFcqujU5ENdpeUOhEUZjIB
         RtqX6wzqeYRtPhxj8PTuLccJYtcHz6tNUp4GL8tKMuk+fuTsTDb+ICBId6h9u/nOv6bh
         K+zea9uXTII0QMiKpmag5FA5JNHPcYG/GYTV+t88SOhmXsXY1D2JC893tlq2pMUExZ1d
         E4QA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=zcclF7SqqbPPsha7eyGhQDcCrUmtIaUQmO3Md6O8lvc=;
        b=AGIoCYmikRvfmWihMSLfui/Z1CNwP54UNd/LvJCH9F4voyqvmsbxHG60IiG7Z/KxxL
         NbpUTjbNQo336vH1uXEYyBI6uVOn6Mq+59ALrUyVhYLJq9KMYOrCV0VDDRc50HRHbQHk
         wr6J0NbbBDNcc5eR4g51HUCLipj+75Qk9JLLQezpeGJHMzwRgKYesW/hUH/qZ2XEDaQO
         4hJ7fo4qSeMLGRix+ql1YXVCapMq8qZh5h4XDosVpBlvvI9jIGDkVTjuJzmxnysK3f9f
         Me9/SE9IwMjoHWQvdhzj0Y+XFbm0M7a6QFG2jgcykdhVR+XymOEv/WcRqznEDYm1S2lD
         ETQA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=GBp4bTVl;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id r17-20020a05610204b100b00425cb607acfsi2913164vsa.3.2023.03.22.08.13.16
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 22 Mar 2023 08:13:16 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=GBp4bTVl;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pf09I-00050o-Bq; Wed, 22 Mar 2023 11:13:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pf09H-00050X-JM
 for qemu-arm@nongnu.org; Wed, 22 Mar 2023 11:13:11 -0400
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pf09F-0004SP-68
 for qemu-arm@nongnu.org; Wed, 22 Mar 2023 11:13:11 -0400
Received: by mail-pj1-x1032.google.com with SMTP id
 gp15-20020a17090adf0f00b0023d1bbd9f9eso23946325pjb.0
 for <qemu-arm@nongnu.org>; Wed, 22 Mar 2023 08:13:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1679497987;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=zcclF7SqqbPPsha7eyGhQDcCrUmtIaUQmO3Md6O8lvc=;
 b=GBp4bTVlyLFBwGCjMUrGF0K3BKRZ4jhqt8NcOCW4yhoGusIIPcaXVhK5dojA7kHYzy
 PVGnYp1u0vEPC5cjpoZQcYk8tsiJ5k6g2C4LveMq+gpFIJ+iLynunYHP/qTCL0uZ7LNT
 SPIWetkSSV0+IWNm0ovP6NVI4wNbE5/UgeYmSuJzYsjnJQzM0IchiOiCZxaNSVv8wL9d
 GjCc3YUdrV2J0SJJVYFHoJg6t9qnX15+5jOvTpBcB0GZGViBjmCv2NxgSNvl/zVcyEMl
 WVxKJyDU+s7L9vlozI33HtnLLaXLPue/TzrGKQaV1n1xtoIEJF9m8XSWsbahOtuxJ4GE
 tNoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679497987;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=zcclF7SqqbPPsha7eyGhQDcCrUmtIaUQmO3Md6O8lvc=;
 b=mmbca1s0cEOULvyFmePPOC2dGuwaGvcPnoc5ckeqFrRMVXbHGTXOmkWgHaN24vPrbg
 KuESNTYM3Z2XTtbZdzvKidcEokakQWi70NiLuQjrVH26FSyoPQu7hwKvQZqUfJYwMxIA
 FqLbA+ir4DVyJrTP3ZxJplIUiSmVIzMKNLhcqW57LeQaxV59WqNeFjLA3SB75N5Xw9iW
 uT67B9lB57Ye5iwSLm8FhFvJJpxaJQZdQT5zCD727ZQJKGFtJdFBJIo30nd2Rz4F9UyL
 4MoAqo1sUGmS/vWvihmhoW3CXmXk4tFIusA/9axMXwqqhScfEtHSOpem0FjCOae9M7Zp
 Wtfw==
X-Gm-Message-State: AO0yUKWbt68qJKut3bZFd+DVVSp7zp75+4toSopVB+3KLV4vn8WaonxC
 evSmDpf6UiymVANuAWxojeZ7WA==
X-Received: by 2002:a17:902:e5cd:b0:19f:8bbf:9c56 with SMTP id
 u13-20020a170902e5cd00b0019f8bbf9c56mr3660423plf.3.1679497987508; 
 Wed, 22 Mar 2023 08:13:07 -0700 (PDT)
Received: from [192.168.7.190] (24-113-166-229.wavecable.com. [24.113.166.229])
 by smtp.gmail.com with ESMTPSA id
 bd8-20020a170902830800b0019cb6222698sm10661905plb.266.2023.03.22.08.13.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 22 Mar 2023 08:13:07 -0700 (PDT)
Message-ID: <792569ef-327f-7038-7f21-1038b1295a7a@linaro.org>
Date: Wed, 22 Mar 2023 08:13:03 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH-for-8.0 2/2] target/arm/gdbstub: Only advertise M-profile
 features if TCG available
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, Fabiano Rosas
 <farosas@suse.de>, Claudio Fontana <cfontana@suse.de>, qemu-arm@nongnu.org
References: <20230322142902.69511-1-philmd@linaro.org>
 <20230322142902.69511-3-philmd@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230322142902.69511-3-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1032;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1032.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: vZK/BEY6nOLF

On 3/22/23 07:29, Philippe Mathieu-Daudé wrote:
> Cortex-M profile is only emulable from TCG accelerator. Restrict
> the GDBstub features to its availability in order to avoid a link
> error when TCG is not enabled:
> 
>    Undefined symbols for architecture arm64:
>      "_arm_v7m_get_sp_ptr", referenced from:
>          _m_sysreg_get in target_arm_gdbstub.c.o
>      "_arm_v7m_mrs_control", referenced from:
>          _arm_gdb_get_m_systemreg in target_arm_gdbstub.c.o
>    ld: symbol(s) not found for architecture arm64
>    clang: error: linker command failed with exit code 1 (use -v to see invocation)
> 
> Fixes: 7d8b28b8b5 ("target/arm: Implement gdbstub m-profile systemreg and secext")
> Signed-off-by: Philippe Mathieu-Daudé<philmd@linaro.org>
> ---
>   target/arm/gdbstub.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
