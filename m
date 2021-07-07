Received: by 2002:ac2:5485:0:0:0:0:0 with SMTP id t5csp2657039lfk;
        Tue, 6 Jul 2021 18:19:55 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxSJCXafUfuxMA77Kkz6pgh8E9QqF8dLNaVddIH2At7RgJC8pzAlJDGWMReU3wnF3hMlxeT
X-Received: by 2002:ac8:544:: with SMTP id c4mr20179144qth.299.1625620795724;
        Tue, 06 Jul 2021 18:19:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1625620795; cv=none;
        d=google.com; s=arc-20160816;
        b=JYXgRGakvQJskcv0mKDpDxMQ35iebdc9MaRMIXkitQmBniYw0EslSBbFxtK2wMhMXT
         coWUmM2m3HMPr2PPDlMo8f+J78Ubm5s0MH82iTm4IvHijYjaCeDnz1RNrQsZ7+IJ5Jp+
         V+qEL8W9h3tNv3MjGj/VgQwBj/95NJU9Z39AHVxuJGrJ/kp3gQgRCPXIuTsSAOw/xa6j
         Ec5fxEbEG5O9VC2OlCJudHZDoligZeo/FuixduzwOjyCuqA78z+EE/OmdDF0mHNFLf/n
         B/A2dNU7kMlag05jWEYwQTT6S9s1Bkp3EkFup7fLORXsGxxotv/6R+vHZfBo/0yWeRdi
         qhFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=opj+ng4w4Yim+hYbb1T85HQ0PUvAfkPdcQBveX+/6Fw=;
        b=tS7xOe9Z5TBH/NyIpZDcw0yrePJvRiUivCabCTk1bE99gB9S7ICW5yYCyUVuTMngTE
         L5vQssHo3KKaPtJDCXHi41c6ata0btxpRqHKBslxzmmDqfOutQQHmRqT+LO96q5bUUE6
         AxkeSvObp4J2Zod16hfM9i79RoaknkvDCSmbCBOXPaNeu36OgOlBm4E1/DQt4f8/k37N
         sDoc9Kjy6DrPVJYQAUHRVmGbqhMWxMgSgaFme8juWpPltA/qzqkN3cp/G8mcswr/K6Uk
         jYGowlBZafa7ZhGaQdpyQnyTzzWYoyD4Sw4mDYb0uWnpkSbsRvktRNkhUML51BeWzG/u
         NMwA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=tEI6QoJV;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id q64si11998760qkf.71.2021.07.06.18.19.55
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 06 Jul 2021 18:19:55 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=tEI6QoJV;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:55138 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1m0wEE-0005YS-US
	for alex.bennee@linaro.org; Tue, 06 Jul 2021 21:19:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39832)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m0wDs-0005Vm-KC
 for qemu-arm@nongnu.org; Tue, 06 Jul 2021 21:19:32 -0400
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029]:36455)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m0wDq-0004s2-9c
 for qemu-arm@nongnu.org; Tue, 06 Jul 2021 21:19:32 -0400
Received: by mail-pj1-x1029.google.com with SMTP id
 d9-20020a17090ae289b0290172f971883bso2070593pjz.1
 for <qemu-arm@nongnu.org>; Tue, 06 Jul 2021 18:19:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=opj+ng4w4Yim+hYbb1T85HQ0PUvAfkPdcQBveX+/6Fw=;
 b=tEI6QoJVb06Abd7dXKSuWLfBfM2UCBe5FszpchG6FXuakNExuK5CpPgW3drEUBLxpw
 nglmFvTuaYXhKt4ZVXMOArsTH4Ufz+J8jHiwrPDOFbV/KBll8kBDDMaDGsGBQH48v/N8
 bBoRzWc3inlkghiCJO/DGEhpKyVFeTmHHrdb/PxY09VrUh5SK8lHGP6YFVPmChnIfGIV
 q4I86XTp0C0CwFRzwLX01kBgUXhWNqO15eB0ANxh7oreRUhM2c8X2EM4/4ONVAXzOvhm
 2bFk4kCGJZceK4+2lViMOUMV8ZcLU8KyeHMFHtvUNNpgzOPZqNPVkNqa90JJEtdt0kOs
 CPSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=opj+ng4w4Yim+hYbb1T85HQ0PUvAfkPdcQBveX+/6Fw=;
 b=c4nzsjFZp5Ahs25FF5et3qzWSTvGPGHhRNb1B03wSLMm3+9g/GklgB2w5hL+JZuPjm
 MvN84Txj+heVC8Y72YEfEFkdyezTmqb+X8RrLxShp2I95G3pmIeKay6PGMgk+p8TEqSK
 4BlIpb3BbjckJwQ8moiX1p0kx2w3MyxsMD+232FQuM+orI9UOP/4qM250Pv0YSZV0bcW
 6QxBHQ/mjLf1U41tJDk5elNG6Wr1+WzxAKhn1WHGCexsabFXJlTmJbIZtj/vu2QDwPwp
 eaklfyLRfhFIpUhx19+luBkIaW4eR+ppbfu9+SiB3efrDE9jpunbNYW80sPlcKre+gNT
 UnJw==
X-Gm-Message-State: AOAM533eCbMKzNI+MUg9i0AN4flNSWtc3K93GrhJNyZqIyi/njJCmBOF
 +q+pBNkoCDmKKCqOM0tFg6jqUw==
X-Received: by 2002:a17:902:9a8c:b029:113:d891:2eaf with SMTP id
 w12-20020a1709029a8cb0290113d8912eafmr19071586plp.61.1625620768521; 
 Tue, 06 Jul 2021 18:19:28 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id y1sm20501482pgr.70.2021.07.06.18.19.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 06 Jul 2021 18:19:28 -0700 (PDT)
Subject: Re: [PATCH 02/11] hw/gpio/pl061: Convert DPRINTF to tracepoints
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210702104018.19881-1-peter.maydell@linaro.org>
 <20210702104018.19881-3-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <783b1b33-fe92-c35b-897b-937b5ef714bf@linaro.org>
Date: Tue, 6 Jul 2021 18:19:26 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210702104018.19881-3-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1029;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1029.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Maxim Uvarov <maxim.uvarov@linaro.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: WoR3V3SRXNot

On 7/2/21 3:40 AM, Peter Maydell wrote:
> Convert the use of the DPRINTF debug macro in the PL061 model to
> use tracepoints.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   hw/gpio/pl061.c      | 27 +++++++++------------------
>   hw/gpio/trace-events |  6 ++++++
>   2 files changed, 15 insertions(+), 18 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
