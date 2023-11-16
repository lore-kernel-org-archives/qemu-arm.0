Received: by 2002:a17:906:5a52:b0:9d0:bf65:29fa with SMTP id my18csp3321200ejc;
        Wed, 15 Nov 2023 23:54:36 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHLVh101Xlo+Ko5XdbL+93pJSNqo06zZd3ZZipMHF0A5CZv4m6YS77WeTfZv0zz+1B2Eih9
X-Received: by 2002:a05:6102:20da:b0:461:da:54b with SMTP id i26-20020a05610220da00b0046100da054bmr10238512vsr.23.1700121276014;
        Wed, 15 Nov 2023 23:54:36 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1700121275; cv=none;
        d=google.com; s=arc-20160816;
        b=FTEoeEG+qnJm5nYbiZrRE7bGWivCbDpkzvUThdadavXNRcVCMZKYtjKoX7XEtq2PAb
         GXgv+VqOH5YWdELCDCF6SW2H3T8Pc77/WtUPB78lt8byocVwF+G32nPmWALaOisuF0qU
         hph5vMDrKrRCcXxvzMhMfvhPFjC7M4TziMX6tzAUg6RA1n1bHRfuuSfJj1pMzPu661ni
         0rX7LucAmJn2+TYgDYQbqB1YlX1fcS8zT+yQ6LRMZq0eRYVBj7bGdlzEHJr6QsbASOE3
         Bx1Bw0cJzwOtJWV885gqNqq6ZMlVYhJKGLQiFOEBxMfQh7W0J5tGzDHtUr8Oep96fKl2
         KPmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=bRfQ6Fok2eTonPLBPNc1tqXnMZnV+oCGWm5xG6hbQnY=;
        fh=MNy/s+eWWV9V6tfmhb2gUwit/2o7TQkLbQD1zQm6hqY=;
        b=rayGmC/6vew4NQUMpZfwA3/z/A89rbnFc2xQVW8ktBBiIwHqM8+JmHIBSd/VpGQTju
         RTnor1ynFdZhWgdKNwbBYodF8+PHHQI75XT7kBUYMZat8i/+sQrdImXomzT+cZ+YsVGu
         xrwE3aMybGVIr2AUO2ccwhw3Z1X9giSpM3KB0/FM4H946vFM5sNKD7TTuncjkpZOS+K1
         UvRA6y2sj+CPrIxN8mCb6Bu2vuwxpvEOLVJrHg3C9nZ/iSEDj3Twg06M6QWWJW7D76bY
         ypwKlnP7F3zMXrl7gKq/DhucubmmIotDgXqr1oE/vXeEmG1RsMFSP28jOE4WUKDUT0wS
         8RUg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="O5/p+DDU";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w11-20020ac857cb000000b004055a48136fsi10989960qta.129.2023.11.15.23.54.35
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 15 Nov 2023 23:54:35 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="O5/p+DDU";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1r3XCb-00062P-2J; Thu, 16 Nov 2023 02:54:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1r3XCU-0005qS-AB
 for qemu-arm@nongnu.org; Thu, 16 Nov 2023 02:54:11 -0500
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1r3XCB-0001If-Cy
 for qemu-arm@nongnu.org; Thu, 16 Nov 2023 02:54:09 -0500
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-4083f61312eso3987285e9.3
 for <qemu-arm@nongnu.org>; Wed, 15 Nov 2023 23:53:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1700121229; x=1700726029; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=bRfQ6Fok2eTonPLBPNc1tqXnMZnV+oCGWm5xG6hbQnY=;
 b=O5/p+DDU04Ujp6kmbQV/U3QlfeYwyZ87+hgETiR/2UP3jiBUv6BDwBZKmk7phHTr4B
 koFwBEcFrta71NIty0+g+B84zLbw0PnQhpH+OHbrVnM9QrzkJhsLmzMpMLaEwr1AYgBn
 DG/ym2+Del0So83Zh/MZQGyDdTBEA5OfSDXqzeb0BriVmOtUFbEfmMQubglKyRKfS4rV
 KtijaRagX5LUPTu72wwsj3PYPeVuZJwOE3fC/5FwkCaGguen1pv8MACLvGlAIoQPu5xr
 ZgGVvs7u2aXEsuHGAZhIP7kJcSvxqwUuLXct02EcVYG4O8BQ245D6tRE/I4iAaSOu7WU
 Pnrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700121229; x=1700726029;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=bRfQ6Fok2eTonPLBPNc1tqXnMZnV+oCGWm5xG6hbQnY=;
 b=kZwj+MiO6iMpbUNY/WALvoggD41WPuZ6mUreb2sO0HVMYKx8K1+Y2vR6B3rOmQsfQz
 R8QAjbD+wvocO3KCXkLVGRl/CjKRnmm0H0N7jO8rMu3Qp4mDiG5ob4ltyMcL8lwgBeM5
 WU12T8YERItahipFDMQKx9/Ow4ihRFnCSV6my1/o1tLOwHdPtNTVpU94S/m8kRJh22hL
 R67eW9brBkxli4TUlVP1jAmAjtLilgkuXet/uQxo2rQd9PLdPspcuF3l6Mpdl4hpyJag
 lmVYaDMmRm5b9VH2ZWHNd+aZIvlo62tO9seHOicdMVz/v/+dE/IAgU/W7C5bLLrRCfyH
 lOvQ==
X-Gm-Message-State: AOJu0YzvPBdhdPN8lLGJ76fJP/JugNLlT8tlXHBD+5RyUlVrvOEC2Skg
 NH6BWKak5cn6Z2ZHOKFFHh6fyA==
X-Received: by 2002:a05:600c:4f4a:b0:40a:4432:6b01 with SMTP id
 m10-20020a05600c4f4a00b0040a44326b01mr12410764wmq.20.1700121228896; 
 Wed, 15 Nov 2023 23:53:48 -0800 (PST)
Received: from [192.168.69.100] ([176.187.220.205])
 by smtp.gmail.com with ESMTPSA id
 m4-20020a056000024400b0032fb0e2087asm12582889wrz.82.2023.11.15.23.53.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 15 Nov 2023 23:53:48 -0800 (PST)
Message-ID: <2858cbe4-8c5e-4712-a744-b318b301f922@linaro.org>
Date: Thu, 16 Nov 2023 08:53:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 15/31] target/mips: Use generic cpu_list()
Content-Language: en-US
To: Gavin Shan <gshan@redhat.com>, qemu-arm@nongnu.org
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, qemu-ppc@nongnu.org,
 imp@bsdimp.com, kevans@freebsd.org, richard.henderson@linaro.org,
 pbonzini@redhat.com, peter.maydell@linaro.org, imammedo@redhat.com,
 b.galvani@gmail.com, strahinja.p.jankovic@gmail.com, sundeep.lkml@gmail.com,
 kfting@nuvoton.com, wuhaotsh@google.com, nieklinnenbank@gmail.com,
 rad@semihalf.com, quic_llindhol@quicinc.com, marcin.juszkiewicz@linaro.org,
 eduardo@habkost.net, marcel.apfelbaum@gmail.com, wangyanan55@huawei.com,
 laurent@vivier.eu, vijai@behindbytes.com, palmer@dabbelt.com,
 alistair.francis@wdc.com, bin.meng@windriver.com, liwei1518@gmail.com,
 dbarboza@ventanamicro.com, zhiwei_liu@linux.alibaba.com, mrolnik@gmail.com,
 edgar.iglesias@gmail.com, bcain@quicinc.com, gaosong@loongson.cn,
 aurelien@aurel32.net, jiaxun.yang@flygoat.com, aleksandar.rikalo@syrmia.com,
 chenhuacai@kernel.org, shorne@gmail.com, npiggin@gmail.com, clg@kaod.org,
 ysato@users.sourceforge.jp, kbastian@mail.uni-paderborn.de,
 jcmvbkbc@gmail.com, shan.gavin@gmail.com
References: <20231114235628.534334-1-gshan@redhat.com>
 <20231114235628.534334-16-gshan@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20231114235628.534334-16-gshan@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, T_SCC_BODY_TEXT_LINE=-0.01,
 T_SPF_TEMPERROR=0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: 6rBkTFA3kmve

On 15/11/23 00:56, Gavin Shan wrote:
> Before it's applied:
> 
> [gshan@gshan q]$ ./build/qemu-system-mips64 -cpu ?
> MIPS '4Kc'
> MIPS '4Km'
> MIPS '4KEcR1'
> MIPS 'XBurstR1'
> MIPS '4KEmR1'
> MIPS '4KEc'
> MIPS '4KEm'
> MIPS '24Kc'
> MIPS '24KEc'
> MIPS '24Kf'
> MIPS '34Kf'
> MIPS '74Kf'
> MIPS 'XBurstR2'
> MIPS 'M14K'
> MIPS 'M14Kc'
> MIPS 'P5600'
> MIPS 'mips32r6-generic'
> MIPS 'I7200'
> MIPS 'R4000'
> MIPS 'VR5432'
> MIPS '5Kc'
> MIPS '5Kf'
> MIPS '20Kc'
> MIPS 'MIPS64R2-generic'
> MIPS '5KEc'
> MIPS '5KEf'
> MIPS 'I6400'
> MIPS 'I6500'
> MIPS 'Loongson-2E'
> MIPS 'Loongson-2F'
> MIPS 'Loongson-3A1000'
> MIPS 'Loongson-3A4000'
> MIPS 'mips64dspr2'
> MIPS 'Octeon68XX'
> 
> After it's applied:
> 
> [gshan@gshan q]$ ./build/qemu-system-mips64 -cpu ?
> Available CPUs:
>    20Kc
>    24Kc
>    24KEc
>    24Kf
>    34Kf
>    4Kc
>    4KEc
>    4KEcR1
>    4KEm
>    4KEmR1
>    4Km
>    5Kc
>    5KEc
>    5KEf
>    5Kf
>    74Kf
>    I6400
>    I6500
>    I7200
>    Loongson-2E
>    Loongson-2F
>    Loongson-3A1000
>    Loongson-3A4000
>    M14K
>    M14Kc
>    mips32r6-generic
>    mips64dspr2
>    MIPS64R2-generic
>    Octeon68XX
>    P5600
>    R4000
>    VR5432
>    XBurstR1
>    XBurstR2
> 
> Signed-off-by: Gavin Shan <gshan@redhat.com>
> ---
>   target/mips/cpu-defs.c.inc | 9 ---------
>   target/mips/cpu.h          | 4 ----
>   2 files changed, 13 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

