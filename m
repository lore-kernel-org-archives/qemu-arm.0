Received: by 2002:a17:907:d504:b0:9b2:89ee:1eb8 with SMTP id wb4csp1019044ejc;
        Tue, 26 Sep 2023 04:23:57 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGXetg36mtJWMIpQUMr6SMxESI4Wl7V2zvyy58NAV05Tl5cIRJJcGQ90ra3V8rppC8//OGS
X-Received: by 2002:a05:622a:438d:b0:418:1057:d835 with SMTP id em13-20020a05622a438d00b004181057d835mr6070643qtb.34.1695727436656;
        Tue, 26 Sep 2023 04:23:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1695727436; cv=none;
        d=google.com; s=arc-20160816;
        b=NwmXBQSaQKumKBMQCiSYqpEVbX0lgSq92nU7raf5Zhfu92cv8u+z+q2/wW2ZOJKlG8
         5HVh/D6ZJln0ZYEQWzY6X7Y4RYjMZQmQeDy+Ve8MhtCuAjn8dH4wJWx7utrFXVO+4mFc
         5LF+MMCCpBbBO1Pvu7zdRjLJgYULOwELblKj9Ri8dj4SjDA4eci3HRX8/LrX2A85sOVt
         tdOnlQd3IuFKooUzuExDBnQ/UBeqJNUlqGi29daf1ZZtO2z6Rg6hm0//bYbBNvvwfR0p
         uR5qsgNs7I+53pXez+W0x+QUTLkg9eWWwYaXZz6aK9u4SEdyhqJ4Ot6DUl1+jba85ya7
         it5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :organization:subject:from:cc:to:content-language:user-agent
         :mime-version:date:message-id:dkim-signature;
        bh=Nm20C0Aigymb/jcI46Gxfp/COqzQsE6pYT/7Tn3bfvw=;
        fh=VR8r4lSHgVovpvN1XE+X3t8xE2S5OWslu4BXqgCP0VQ=;
        b=RaZPrXaXaVxxdC/Xxuwxm69wuOrjLjkOxBueJftlA6M1w1PNPf+c1cXcdyPYj0Wemy
         +ZthXp0xkH5rluEkEIP5DIQ1tH+EDq+z7UP8mcTjNFfPtcyZYABQMPuMkiEngusTXm28
         gPiD+LggoLcoc/UD47tUHIeRsMQUvbKAoUNoZ48pmNjsRAFIFH0WSef2xKChDqlCUhJm
         PS7ocvkpnNKMuzX4P31buzmy6NGcPqpay2WYWay30rxVfIuhS0I5v2pGzbws/qbZ+PDu
         GrPbdYwJPUhBf1+GEjsfvIr8d6W6q852tdzloYIGx/LqIQRE6rq7dlic4Hdg2VsxuFG8
         ibAg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=BOrJxltP;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d15-20020ac85acf000000b00418113fb90asi3295567qtd.425.2023.09.26.04.23.56
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 26 Sep 2023 04:23:56 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=BOrJxltP;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1ql6AU-0004Ta-DF; Tue, 26 Sep 2023 07:23:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcin.juszkiewicz@linaro.org>)
 id 1ql6AT-0004TG-3D
 for qemu-arm@nongnu.org; Tue, 26 Sep 2023 07:23:53 -0400
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcin.juszkiewicz@linaro.org>)
 id 1ql6AQ-00040f-V6
 for qemu-arm@nongnu.org; Tue, 26 Sep 2023 07:23:52 -0400
Received: by mail-ej1-x634.google.com with SMTP id
 a640c23a62f3a-99c3d3c3db9so1024956066b.3
 for <qemu-arm@nongnu.org>; Tue, 26 Sep 2023 04:23:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1695727429; x=1696332229; darn=nongnu.org;
 h=content-transfer-encoding:organization:subject:from:cc:to
 :content-language:user-agent:mime-version:date:message-id:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Nm20C0Aigymb/jcI46Gxfp/COqzQsE6pYT/7Tn3bfvw=;
 b=BOrJxltPsqz46zy+dc6QkCaq7SVyQc1+J5HOI/8Jo7dRJh8QOJZSD7mQscFwqWH5qf
 3e2V04JG1AV3N9cda8QJV9ZtbCTU/4WoAwIV50vPMpX3Jo/2y25+Lq6q9IbR08qH8El0
 6XeqqSAM5rgPsMrkVTDEv5XhcTFAo2NV1Y0Pvy7U4roPCeqzCytzrQQbpsJ9vx07+SgW
 9mDlrb34KzjJufpT5vfeJZXLha326dZHDCfM1BgpQ63kYcZMoSZhavcFAw4VHWK8Qs6V
 xpyGUd6FwyxRx4YmzckRgXBRybRls+CR0flZKUTZKL3kC9NWXSDscjo1Oj+7CyZ6YUE1
 UAHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695727429; x=1696332229;
 h=content-transfer-encoding:organization:subject:from:cc:to
 :content-language:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Nm20C0Aigymb/jcI46Gxfp/COqzQsE6pYT/7Tn3bfvw=;
 b=cNEmgWVpOaOlgw3vwYdJQXQuKkdkM9p3N1iFR1yTJam+vooPytf3UgR1EsDEksfxhk
 3AFdTh93HKbV+VJMYHiVlrvhKp4gc+p45p/ojqeTlxCgia53uDxROJxphE90fJEk2cNV
 BsbCO8OCu+mHjgvPjsI5J+mVD7iY1fTZPrbNZEw+2u7a2/qwsJVQX+tJ4jgmoraDJQoh
 mKLLU9c5KSGowD9o30Yq1K1LmRfewhq4wCMLz4WHDhFgpolu5fI/91TBfktgCPOOTG8s
 tAGLTNYY7GtrKfDbFcenJkJpEI9lRJtrlapmtuPtA+kz5HxHkCRpHAxgqUdaiHMyhNB+
 BFLg==
X-Gm-Message-State: AOJu0Yx1mhb7xBynLQ0L2B2VJDlAJ1Xp1Mz6319tupk+eCUFWv+FPydJ
 535kSQZbDvCXmXrY0jiMtTAFnw==
X-Received: by 2002:a17:907:75ce:b0:99c:c50f:7fb4 with SMTP id
 jl14-20020a17090775ce00b0099cc50f7fb4mr7509034ejc.1.1695727428866; 
 Tue, 26 Sep 2023 04:23:48 -0700 (PDT)
Received: from [192.168.200.206] (83.11.3.58.ipv4.supernova.orange.pl.
 [83.11.3.58]) by smtp.gmail.com with ESMTPSA id
 rv7-20020a17090710c700b009adc81bb544sm7619368ejb.106.2023.09.26.04.23.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 26 Sep 2023 04:23:48 -0700 (PDT)
Message-ID: <b7e00b36-2ac8-44fa-9847-b2025ebe05f6@linaro.org>
Date: Tue, 26 Sep 2023 13:23:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: pl-PL, en-GB, en-HK
To: QEMU Developers <qemu-devel@nongnu.org>
Cc: qemu-arm <qemu-arm@nongnu.org>, Niklas Cassel <nks@flawful.org>,
 John Snow <jsnow@redhat.com>, qemu-block@nongnu.org,
 Damien Le Moal <dlemoal@kernel.org>,
 Leif Lindholm <quic_llindhol@quicinc.com>,
 Ard Biesheuvel <ardb+tianocore@kernel.org>
From: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
Subject: FreeBSD 13.2 installer does not see AHCI devices on aarch64/sbsa-ref
 and x86-64/q35
Organization: Linaro
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::634;
 envelope-from=marcin.juszkiewicz@linaro.org; helo=mail-ej1-x634.google.com
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
X-TUID: iZQuTQz5gUkX

I work on SBSA Reference Platform (sbsa-ref) at Linaro. And yesterday I
wanted to check how non-Linux operating systems work on sbsa-ref machine.

One of them was FreeBSD 13.2 - the latest one. Fetched bootonly ISO
image [1] and booted system.

1. https://download.freebsd.org/releases/arm64/aarch64/ISO-IMAGES/13.2/FreeBSD-13.2-RELEASE-arm64-aarch64-bootonly.iso

QEMU command line arguments:

-drive if=ide,file=disks/FreeBSD-13.2-RELEASE-arm64-aarch64-bootonly.iso,media=cdrom
-machine sbsa-ref
-m 4096
-smp 2
-cpu neoverse-n1
-drive file=fat:rw:/home/marcin/devel/linaro/sbsa-qemu/sbsa-ref-status/disks/virtual/,format=raw
-drive format=raw,file=/home/marcin/devel/linaro/sbsa-qemu/sbsa-ref-status/disks/full-debian.hddimg
-watchdog-action none
-no-reboot
-monitor telnet::45454,server,nowait
-serial stdio
-device igb
-nographic
-drive if=pflash,file=SBSA_FLASH0.fd,format=raw
-drive if=pflash,file=SBSA_FLASH1.fd,format=raw


Firmware loaded FreeBSD loader, kernel booted but it does not see
any AHCI devices:

ahci0: <AHCI SATA controller> iomem 0x60100000-0x6010ffff irq 1 on acpi0
ahci0: AHCI v1.00 with 6 1.5Gbps ports, Port Multiplier not supported
ahci0: Caps: 64bit NCQ 1.5Gbps 32cmd 6ports
ahcich0: <AHCI channel> at channel 0 on ahci0
ahcich0: Caps:
[..]
ahcich0: AHCI reset...
ahcich0: SATA connect time=0us status=00000113
ahcich0: AHCI reset: device found
ahcich0: AHCI reset: device ready after 0ms
ahcich1: AHCI reset...
ahcich1: SATA connect time=0us status=00000113
ahcich1: AHCI reset: device found
ahcich1: AHCI reset: device ready after 0ms
ahcich2: AHCI reset...
ahcich2: SATA connect time=0us status=00000113
ahcich2: AHCI reset: device found
ahcich2: AHCI reset: device ready after 0ms
[..]
Trying to mount root from cd9660:/dev/iso9660/13_2_RELEASE_AARCH64_BO [ro]...
Root mount waiting for: CAM
[..]
Root mount waiting for: CAM
ahcich0: Poll timeout on slot 1 port 0
ahcich0: is 00000000 cs 00000002 ss 00000000 rs 00000002 tfd 170 serr 00000000 cmd 0000c017

And finally it gives up.


v8.1.1 was bad, v8.0.5 was bad so I did git bisecting.
Which gave me this commit:

commit 7bcd32128b227cee1fb39ff242d486ed9fff7648
Author: Niklas Cassel <niklas.cassel@wdc.com>
Date:   Fri Jun 9 16:08:40 2023 +0200

     hw/ide/ahci: simplify and document PxCI handling

     The AHCI spec states that:
     For NCQ, PxCI is cleared on command queued successfully.



I built x86_64-softmmu target and checked both "pc" and "q35"
machines.

./build/x86_64-softmmu/qemu-system-x86_64
-cdrom FreeBSD-13.2-RELEASE-amd64-bootonly.iso
-m 2048 -serial stdio  -monitor telnet::45454,server,nowait

PC target ("-M pc") booted fine. But Q35 ("-M q35") failed
similar way as aarch64/sbsa-ref did:

ahci0: <Intel ICH9 AHCI SATA controller> port 0xc060-0xc07f mem 0xfebd5000-0xfebd5fff irq 16 at device 31.2 on pci0
ahci0: attempting to allocate 1 MSI vectors (1 supported)
msi: routing MSI IRQ 26 to local APIC 0 vector 52
ahci0: using IRQ 26 for MSI
ahci0: AHCI v1.00 with 6 1.5Gbps ports, Port Multiplier not supported
ahci0: Caps: 64bit NCQ 1.5Gbps 32cmd 6ports
ahcich0: <AHCI channel> at channel 0 on ahci0
ahcich0: Caps:
ahcich1: <AHCI channel> at channel 1 on ahci0
ahcich1: Caps:
ahcich2: <AHCI channel> at channel 2 on ahci0
ahcich2: Caps:
[..]
ahcich2: AHCI reset...
ahcich2: SATA connect time=0us status=00000113
ahcich2: AHCI reset: device found
ahcich2: AHCI reset: device ready after 0ms
[..]
Trying to mount root from cd9660:/dev/iso9660/13_2_RELEASE_AMD64_BO [ro]...
ahcich2: Poll timeout on slot 1 port 0
ahcich2: is 00000000 cs 00000002 ss 00000000 rs 00000002 tfd 170 serr 00000000 cmd 0000c017
(aprobe2:ahcich2:0:0:0): SOFT_RESET. ACB: 00 00 00 00 00 00 00 00 00 00 00 00
(aprobe2:ahcich2:0:0:0): CAM status: Command timeout
(aprobe2:ahcich2:0:0:0): Error 5, Retries exhausted
ahcich2: Poll timeout on slot 2 port 0
ahcich2: is 00000000 cs 00000006 ss 00000000 rs 00000004 tfd 170 serr 00000000 cmd 0000c017
(aprobe2:ahcich2:0:0:0): SOFT_RESET. ACB: 00 00 00 00 00 00 00 00 00 00 00 00
(aprobe2:ahcich2:0:0:0): CAM status: Command timeout
(aprobe2:ahcich2:0:0:0): Error 5, Retries exhausted
mountroot: waiting for device /dev/iso9660/13_2_RELEASE_AMD64_BO...
Mounting from cd9660:/dev/iso9660/13_2_RELEASE_AMD64_BO failed with error 19.

Same thing happens with current qemu HEAD:

commit 494a6a2cf7f775d2c20fd6df9601e30606cc2014
Merge: 29578f5757 b821109583
Author: Stefan Hajnoczi <stefanha@redhat.com>
Date:   Mon Sep 25 10:10:30 2023 -0400

     Merge tag 'pull-request-2023-09-25' of https://gitlab.com/thuth/qemu into staging


Any ideas?
