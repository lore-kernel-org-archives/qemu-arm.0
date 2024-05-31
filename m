Received: by 2002:a17:906:7fcb:b0:a66:557b:2f6e with SMTP id r11csp573962ejs;
        Fri, 31 May 2024 08:09:53 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVsRaiAYaKbs8DicG0IXMcLgPilUN5rRwMZETTc+9YoBG1W7JPaFgACNISgiLViE4z1J72Q2yvzfb9ztF/f2b9XbEEJYo9d
X-Google-Smtp-Source: AGHT+IH+ZCAqj5AUTbWuwefgdf+l2JzncaddAQNGhwAUSuAsD/rEAdCPQ7+gSPAFa5kQf4NLoo2T
X-Received: by 2002:a05:6214:3104:b0:6ae:23:9859 with SMTP id 6a1803df08f44-6aecd71f10fmr25938386d6.56.1717168192739;
        Fri, 31 May 2024 08:09:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1717168192; cv=none;
        d=google.com; s=arc-20160816;
        b=FYJKsjHz/CZbEVHucVmnRfCx/uJmdlbn7cMAMPyI4vjor9/8rv4OM5l/2FLFwbJ9EI
         W2TmIWGomy7+jxZx4XfyV+2C42VR3kVuVCY0YwZY+0k1ntQfPFiPS5maWeCMPmrQudLg
         sKeVsspWmrTqZgqEnSM+xpnWDkbshuTO6+FWhBh6Zn2C4ZUuHz1zTIFMt58FxFDEofez
         tUiw/l9EsWRHY4dh4AXd9uKgTpiL/RItiTtARJeXbWE6ueTjW/8PaOZKWS3CRkMfj9Ya
         UEF6O/IiARM0NZaAwkCazZjHoSi1qiZzbcToG09hpZ+OB3MbNjrePn9S+5F43u8Qa1E+
         BsOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:in-reply-to:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :dkim-signature;
        bh=vujZepglms1bK1s11/iMyFJ7QfJ32dqmj6z2Azg2PoE=;
        fh=aNzj73WX3t0PkjegG85NtxREodrxtnBfCXF3VBQB8NI=;
        b=EpAiH5lhlLCTOOQQ9FbDuL+RiUK6TH6BWbf+x3rz1KFU3DifglpU9AfNlMteC/X0SQ
         TbH6rGtj3fg1AdOX8Y5DUzjL7xdRuZ1PaWTt5wcOkESRMPSEPjjAP6/GtYkVXQq325ST
         h0la9LPCMOlFlkyQ/dPdfbVWP7MPbwyvF2J3Wv7LXVlfPKuR/MPSSh1g3mybVDJM0s/1
         P/cwTv7QA05WTURNTg8O3iIVcRNiOcoukuGnthIzlJdpQ+ggp2kwTHp0qHisQG8qC7gg
         B8sdqw/cmiaBsJCX5+JUaE+4lShtEyTcgXUL4bS2PKmd+25FHPLYbeY1tORE14sjs+KW
         u8VA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=OEXwxN5M;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6ae4b42b6d6si22308666d6.456.2024.05.31.08.09.52
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 31 May 2024 08:09:52 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=OEXwxN5M;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sD3sY-0007hF-E2; Fri, 31 May 2024 11:09:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jean-philippe@linaro.org>)
 id 1sD3sX-0007fF-20
 for qemu-arm@nongnu.org; Fri, 31 May 2024 11:09:13 -0400
Received: from mail-lf1-x12f.google.com ([2a00:1450:4864:20::12f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jean-philippe@linaro.org>)
 id 1sD3sU-00059D-D7
 for qemu-arm@nongnu.org; Fri, 31 May 2024 11:09:12 -0400
Received: by mail-lf1-x12f.google.com with SMTP id
 2adb3069b0e04-52b7ffd9f6eso1543320e87.3
 for <qemu-arm@nongnu.org>; Fri, 31 May 2024 08:09:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1717168148; x=1717772948; darn=nongnu.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=vujZepglms1bK1s11/iMyFJ7QfJ32dqmj6z2Azg2PoE=;
 b=OEXwxN5MSRWU0ClaHh2JfJKnJaQsA1xocSZDpE6lBAdiIbL/Tq8ymjagg20ZhhOfcT
 t0WcnVStAqdO+Q3SWtbtumpk30K5ICbhOsoG8ddVpiNNGaIkW8wllrQo7L5o72LnFp8A
 LjAz9fMW4t8x7n0cpgvCNp0sX+7jGa9Jco5VeK10SfRgiA3XZevvrrTtyC4Jq2EkmXps
 k9T32AbnDDk5Txulxj45rHzUW0i+I2UMu8NzHqet85mcpCbsbrCcwnULNv5hbWAYX082
 a1wusy3Ax2BhWU/XOBKQvvYbylwYy9JIOEeA2wc/Jx05lgb7fp/sE+DYMacxBMMRujHx
 ZnzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1717168148; x=1717772948;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=vujZepglms1bK1s11/iMyFJ7QfJ32dqmj6z2Azg2PoE=;
 b=wjZkXHukux8VCHfyxk8eKfSzi3AKBKSAy6x/i6euHn23XXhpgV6qFwj1K5zyMNV/F2
 zr3XwHlTlr4Jg74gjAZOaRLl1ueAy5RGVVjDqiUMKaeEhGq7Xqn3qTiRt1wJVylP/qML
 V83/t4pOPxqON+Ix+wXspf+PyD/s/cMSVWWQw/ZbXWd3dWqimENIlnFX5NleGhV/68aL
 3vRHxvAxbqljbS79nuCmB4M0DNZXuzb4d7N1lBO7M5AjgHjjGlrFi1lCQUQA0tJyhiVe
 HQPhSl/PDBGHr1RzIKTD8SJIOO2BvtXou8Ud/dfneWqDy0nj7/9jdowZIqMXn2jGAtSK
 tUJQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXZOyyjmefU3x0+W8ut4pyFxLjHBcSlT869th2/0a/CXzaGd3glNjbLa56Zo4fBpOmNHd5iOibHuHZ5avfJeLXP0jnq
X-Gm-Message-State: AOJu0Yzty3q0sPorft3m8HM5CSRXSNogG83DdnnFV88OLSdbGGsn2FLR
 kWJISYCA2+VNhQpEvhGzaOuYj2wmnTkM7dhqjb+GEBUTs8sPyFJbhI8OsYE+brk=
X-Received: by 2002:a05:6512:2eb:b0:52b:79c2:1aa7 with SMTP id
 2adb3069b0e04-52b896d48f6mr1463581e87.62.1717168148117; 
 Fri, 31 May 2024 08:09:08 -0700 (PDT)
Received: from myrica ([2.221.137.100]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-421330d2a27sm12412585e9.42.2024.05.31.08.09.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 31 May 2024 08:09:07 -0700 (PDT)
Date: Fri, 31 May 2024 16:09:22 +0100
From: Jean-Philippe Brucker <jean-philippe@linaro.org>
To: Gavin Shan <gshan@redhat.com>
Cc: Itaru Kitayama <itaru.kitayama@linux.dev>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org, qemu-arm <qemu-arm@nongnu.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Ard Biesheuvel <ardb@kernel.org>
Subject: Re: Unexpected error in rme_configure_one() at
 ../target/arm/kvm-rme.c:159
Message-ID: <20240531150922.GA83195@myrica>
References: <0C6F517A-5686-4BCE-8D08-1CED02CB470E@linux.dev>
 <4e7aa598-1a5d-47e1-aaa3-78af05947eeb@linaro.org>
 <CB05CAA2-9301-45F6-8AE3-A2E27A160CDF@linux.dev>
 <cbd630d7-01e8-49ba-9c8b-a6514d898ed2@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cbd630d7-01e8-49ba-9c8b-a6514d898ed2@redhat.com>
Received-SPF: pass client-ip=2a00:1450:4864:20::12f;
 envelope-from=jean-philippe@linaro.org; helo=mail-lf1-x12f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: ju12x5LFHlmw

Hi Gavin,

On Fri, May 31, 2024 at 04:23:13PM +1000, Gavin Shan wrote:
> I got a chance to try CCA software components, suggested by [1]. However, the edk2
> is stuck somewhere. I didn't reach to stage of loading guest kernel yet. I'm replying
> to see if anyone has a idea.
...
> INFO:    BL31: Preparing for EL3 exit to normal world
> INFO:    Entry point address = 0x60000000
> INFO:    SPSR = 0x3c9
> UEFI firmware (version  built at 01:31:23 on May 31 2024)
> 
> The boot is stuck and no more output after that. I tried adding more verbose output
> from edk2 and found it's stuck at the following point.
> 
> 
> ArmVirtPkg/PrePi/PrePi.c::PrePiMain
> rmVirtPkg/Library/PlatformPeiLib/PlatformPeiLib.c::PlatformPeim
> 
>  #ifdef MDE_CPU_AARCH64
>   //
>   // Set the SMCCC conduit to SMC if executing at EL2, which is typically the
>   // exception level that services HVCs rather than the one that invokes them.
>   //
>   if (ArmReadCurrentEL () == AARCH64_EL2) {
>     Status = PcdSetBoolS (PcdMonitorConduitHvc, FALSE);       // The function is never returned in my case
>     ASSERT_EFI_ERROR (Status);
>   }
>  #endif

I'm able to reproduce this even without RME. This code was introduced
recently by c98f7f755089 ("ArmVirtPkg: Use dynamic PCD to set the SMCCC
conduit"). Maybe Ard (Cc'd) knows what could be going wrong here.

A slightly reduced reproducer:

$ cd edk2/
$ build -b DEBUG -a AARCH64 -t GCC5 -p ArmVirtPkg/ArmVirtQemuKernel.dsc
$ cd ..

$ git clone https://github.com/ARM-software/arm-trusted-firmware.git tf-a
$ cd tf-a/
$ make -j CROSS_COMPILE=aarch64-linux-gnu- PLAT=qemu DEBUG=1 LOG_LEVEL=40 QEMU_USE_GIC_DRIVER=QEMU_GICV3 BL33=../edk2/Build/ArmVirtQemuKernel-AARCH64/DEBUG_GCC5/FV/QEMU_EFI.fd all fip && \
  dd if=build/qemu/debug/bl1.bin of=flash.bin && \
  dd if=build/qemu/debug/fip.bin of=flash.bin seek=64 bs=4096
$ qemu-system-aarch64 -M virt,virtualization=on,secure=on,gic-version=3 -cpu max -m 2G -smp 8 -monitor none -serial mon:stdio -nographic -bios flash.bin

Thanks,
Jean
