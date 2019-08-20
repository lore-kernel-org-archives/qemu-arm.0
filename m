Received: by 2002:a5d:4850:0:0:0:0:0 with SMTP id n16csp4045720wrs;
        Tue, 20 Aug 2019 07:31:23 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxb+am30SWtnCtaPOHF4gV0eMaVl79cR2mIXCXrNHUZwGfrK1JPaHvAJfmZs+dEEqZak194
X-Received: by 2002:a50:90c5:: with SMTP id d5mr31820674eda.28.1566311483915;
        Tue, 20 Aug 2019 07:31:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1566311483; cv=none;
        d=google.com; s=arc-20160816;
        b=C31crDbtVB45tSbQnLU7ugXJa/UAbAyCV5FOIumkgq7FrRrGpyfJNfHVZXylJnH/tG
         6bjt5zNqPmrG8DDIHdvpliTe/czut35BLufROU5J+q6Cpb64fwgdpN3jM9RUWYDAhu8l
         AkC3XpiSaGFImhJpFnZkXrItR6v9hLmV1Z5aYiGeHFwDHw0EkAl2jIfw0aWP6b1JVCNA
         QfSbRAMHKxo+MlpA/LAi63TbCVfHY0FY5oQjXiISAKfOGLsVKI17ZETQtej6f0LkONab
         r2lFTjNuR85EcHLdwDn8qiXDPAFaJXlGX132FbGvjlagKBhV/B+aOKJmRj8QZO3H9psi
         xjog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:dkim-signature;
        bh=TjKlcReLpXlh05Iw2h9/M1+xRcBBUqLQ42/Ni8tXUE4=;
        b=gKaswoVqEPSXY+xZp+lWYrSaWYXSC/wnawuYTyd2XvJIjInzNL1cec4sRHiqkN9xW6
         Xk4AyMvDTnPYr3Ip3c+5JhjrUcqDoOl51m4fl8/qR610ZclW0d2FnWGuRp7R30ouI9Kb
         Vf60SIHOdHqofELWYREzIQLuQKNXgUBsTW43H9bsfrp5jyy9MakNpd4vfmzggFYIygaZ
         Sjpa3YtkIlH3qbOXsAIStr0HF+mr9uorUwazXwh1qVxv8HuvENhbazBmeCHAuJ8PEJjB
         p4z/3Dxz0LFcHeUw4QVDIVvNiRJtjJ7SrYmf+q8ymhwBAqcED3O0OeM50+nrPuitEBwD
         F+Pw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b="F2lI6F/c";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v8si8013996ejh.248.2019.08.20.07.31.23
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 20 Aug 2019 07:31:23 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b="F2lI6F/c";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:37998 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1i05AQ-0002Iz-SJ
	for alex.bennee@linaro.org; Tue, 20 Aug 2019 10:31:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54438)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <groeck7@gmail.com>) id 1i05AH-0002Ic-5L
 for qemu-arm@nongnu.org; Tue, 20 Aug 2019 10:31:14 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <groeck7@gmail.com>) id 1i05AF-0002nu-Sq
 for qemu-arm@nongnu.org; Tue, 20 Aug 2019 10:31:13 -0400
Received: from mail-pf1-x443.google.com ([2607:f8b0:4864:20::443]:42508)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <groeck7@gmail.com>)
 id 1i05AF-0002mw-NA; Tue, 20 Aug 2019 10:31:11 -0400
Received: by mail-pf1-x443.google.com with SMTP id i30so3495391pfk.9;
 Tue, 20 Aug 2019 07:31:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=TjKlcReLpXlh05Iw2h9/M1+xRcBBUqLQ42/Ni8tXUE4=;
 b=F2lI6F/cZRER26JlzzNhSMSLlWa4hkfpA2x2x/ATPMby5dDloMYTFav06T5D+aWU0D
 RNRyLCKDLQgSVMEdoc2wPH16SX/cJAr6RszFJ6zFIgL7rBryHIGt3VzMnSx1f9SZvAND
 fLyP+InrAEkRaQkI14uccmILO5gXL3JizU47Mf2laMjrn86sRR9eHpTiMprumIK13EmJ
 iSWHgpUwyuKHT5L+QY9TwEG3+rpqmlPzDbuwfgFA0W2j044LDSEYCe3FRUbhVjE6bQmJ
 fCJDe3uoQpeYWQxvaOJyAlRsLDptNbqdCXLMVzoz9Ka0t3/q8qYvZiQZ0pqFUN7dm2vP
 tv5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=TjKlcReLpXlh05Iw2h9/M1+xRcBBUqLQ42/Ni8tXUE4=;
 b=UvjL+l1aF6jGMm9Mcv8HM2Fltr6pK1px3FncB/+Hv2ho95KWmmE2ARNLTuPspQ9/hf
 2+J3dedbKQhGdIhJdKVwdxxqS0lxzV3lzqeO2rO/OOnwu6hmmgKXwpU2TEzU7qKiMC0A
 qgqFb7BL78xE4Dd/2dTI5n38d3xRNLgNVcdYxhNvKb5FYE7wQPtcy/2LdPJ7eINkKk2h
 pUQ8iVb78muGCImWFOhbtMK7XRzlv13gz9sJgXFBuSyph6+pCY9UlxqPWeOGIFJZPULq
 SCPp5W2HVHzzwe31i8OCK32+37mDLtHfw8JufQg7/AGlOmFV3qx782+d2+dc/0QMArMb
 MORw==
X-Gm-Message-State: APjAAAUZUY2/n/xpj+qD69LPTvDhMm8gfkVAumBGCGFE8HTNN+ym5Rov
 AkrJuBhd2iAE885FRL44WbA=
X-Received: by 2002:aa7:8f2e:: with SMTP id y14mr30446880pfr.113.1566311470241; 
 Tue, 20 Aug 2019 07:31:10 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id
 b19sm10936832pgs.10.2019.08.20.07.31.08
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 20 Aug 2019 07:31:09 -0700 (PDT)
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
References: <20190820123417.27930-1-philmd@redhat.com>
From: Guenter Roeck <linux@roeck-us.net>
Message-ID: <3e3fcb30-1e12-eaf4-07a2-47d09aea2511@roeck-us.net>
Date: Tue, 20 Aug 2019 07:31:08 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190820123417.27930-1-philmd@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::443
Subject: Re: [Qemu-arm] [RFC PATCH 0/2] hw/char/bcm2835_aux: Provide full
 16550 UART support
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Andrew Baumann <Andrew.Baumann@microsoft.com>, qemu-arm@nongnu.org,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 0ziBYTDAiD0h

On 8/20/19 5:34 AM, Philippe Mathieu-Daudé wrote:
> Hi,
> 
> Since there has been some activity on the list asking about
> Rasberry PI USB support, I had a look a some previous unfinished
> work and rebased it to share, in case it helps hobbyist interested
> in improving these machines.
> 
> This series is some proof-of-concept on improving the AUX UART
> support. See the commit description for various TODO/questions.
> 
> This can be tested using files documented by Peter Maydell in
> his blog post:
> https://translatedcode.wordpress.com/2018/04/25/debian-on-qemus-raspberry-pi-3-model/
> 
> And using the kernel command line arguments suggested by Guenter Roeck:
> 
> qemu-system-aarch64 -M raspi3 -m 1024 \
>    -kernel raspi3/bootpart/vmlinuz-4.14.0-3-arm64 \
>    -initrd raspi3/bootpart/initrd.img-4.14.0-3-arm64 \
>    -dtb raspi3/bootpart/bcm2837-rpi-3-b.dtb \
>    -append 'earlycon=uart8250,mmio32,0x3f215040 rdinit=/sbin/init panic=-1 console=ttyS1,115200' \
>    -drive file=raspi3/2018-01-08-raspberry-pi-3-buster-PREVIEW.img,format=raw,if=sd \
>    -serial null -serial stdio \
>    -d unimp,guest_errors -trace bcm283\*

[ ... ]

> [    3.123313] Unpacking initramfs...
> 
> Here it hangs, even with CPRMAN patch from Guenter:
> https://lists.gnu.org/archive/html/qemu-devel/2018-07/msg03153.html
> 

This command line works for me:

qemu-system-aarch64 -M raspi3 -kernel arch/arm64/boot/Image -no-reboot \
	-nographic -snapshot -smp 4 -m 1G \
	-drive file=rootfs.ext2,format=raw,if=sd \
	-serial null -serial stdio -monitor none -no-reboot \
	--append 'panic=-1 slub_debug=FZPUA root=/dev/mmcblk0 rootwait earlycon=uart8250,mmio32,0x3f215040 console=ttyS1,115200' \
	-dtb arch/arm64/boot/dts/broadcom/bcm2837-rpi-3-b.dtb

or, with initrd:

qemu-system-aarch64 -M raspi3 -kernel arch/arm64/boot/Image -no-reboot \
	-nographic \
	-initrd rootfs.cpio \
	-m 1G -serial null -serial stdio -monitor none -no-reboot \
	--append 'panic=-1 slub_debug=FZPUA rdinit=/sbin/init earlycon=uart8250,mmio32,0x3f215040 console=ttyS1,115200' \
	-dtb arch/arm64/boot/dts/broadcom/bcm2837-rpi-3-b.dtb

This is with the mainline kernel.

I don't see a significant difference to your patch series.

I tested with qemu 4.0, 4.1, and mainline (with my patch series applied on top of each).
One problem I do see is that booting mainline (as of right now) is _slow_ compared
to released versions of qemu. It takes some 35 seconds to get to "Unpacking initramfs",
compared to ~8 seconds for v4.1 and earlier. Otherwise it works.

One possibility might be that your initrd has a problem. Can you boot without your patch
series, or is it always stuck ?

Thanks,
Guenter
