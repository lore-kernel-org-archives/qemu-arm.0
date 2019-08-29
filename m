Received: by 2002:a5d:4850:0:0:0:0:0 with SMTP id n16csp2525912wrs;
        Thu, 29 Aug 2019 11:21:10 -0700 (PDT)
X-Google-Smtp-Source: APXvYqy/nsn9LMZ6WsIr4gd0W48hW/ZftzxJ7LLEjB9VlBUg9FOiO3gvwW6bkK5LQE+m4k1A9pMQ
X-Received: by 2002:a17:907:39a:: with SMTP id ss26mr9687643ejb.278.1567102870405;
        Thu, 29 Aug 2019 11:21:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1567102870; cv=none;
        d=google.com; s=arc-20160816;
        b=GTC80TkQJhXCMzI9MTr9QCyTHbeYHZEsEugnAuWW528z8tBaFhDy2jiUaK+HGWLF7x
         jpsc5/D5gAusf6j3q//VZEdVVb3Bl0/+54pMzuE1+2nCP8ChNM3RTNUzZi8TNbH8AM4o
         r0Avj7ImuSw9p3GnJlSbIWl3XbM0Uaw4opxumsAF467d6VJDqxl5hur1slBGoV49+Qao
         OhobCZOG57BSJlZCPh7Uv1mRJkQuVnApei8pj2hv1hfy3kwsLLI5JM3PPzCwyRA54CEv
         FE5m4XPFHJzmL+sxFQRrXm+RXk5FrOaIKLKu0Aow0dISU2yZgJGB13cokOAFx/ZHhid0
         ob9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to;
        bh=cxpybPJrkEvgHevJ3oDOrkMAVzTMBQR2ivG0w3aY10c=;
        b=LKBuMx2KEEb1lI9xLqmwg1D9k7qQ2cUABJMUxfClZmnYDmglTOgFkRF/prlbTGeC+Q
         IOafO+aXXd3k2eWS71re+MghX1Y6kz2Uwg9pkJtVpAJx3fS02h4ggUitxFJh5MxH253H
         eDqbTXPdGhL8zpmJaE7ZhOredcR+rOG+XQKEU+YJ/Tnkz2eVflVK7cNKyx0CyR+Qflhf
         GwDmzMIZohoBV3XYSu3sfB7uDT0Rj3grvw9JGgqlzMFYlq4NRFQEq9f/B8jKJoHnROek
         AV/U1O/AU60bMs/20DxFmZQIhEMk2SxXW0+nB7samp7oUwzPnMyLQkxtdKKJ/DtRn/Cn
         G8DQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s1si17256ejq.220.2019.08.29.11.21.10
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 29 Aug 2019 11:21:10 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:53238 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1i3P2j-0000Rb-7J
	for alex.bennee@linaro.org; Thu, 29 Aug 2019 14:21:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43408)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1i3P1G-0007cb-IL
 for qemu-arm@nongnu.org; Thu, 29 Aug 2019 14:19:39 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1i3P1C-0000Aq-6i
 for qemu-arm@nongnu.org; Thu, 29 Aug 2019 14:19:38 -0400
Received: from mx1.redhat.com ([209.132.183.28]:37998)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1i3P1B-0000AE-Ua
 for qemu-arm@nongnu.org; Thu, 29 Aug 2019 14:19:34 -0400
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 01A423C928
 for <qemu-arm@nongnu.org>; Thu, 29 Aug 2019 18:19:33 +0000 (UTC)
Received: by mail-wr1-f72.google.com with SMTP id j10so2507137wrb.16
 for <qemu-arm@nongnu.org>; Thu, 29 Aug 2019 11:19:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ft41ontdbYJfOC6ya31P4ldTQo622VBKEw+p0mV3ByI=;
 b=N7FJpvRklj7xjDsLVL0CVAVX3ARj3FNhRpE77nbHo6NKza/7B326l5+xcgDY+yIv6g
 sEFrJSvbswcLTP3oBfy7SbYr6LP4wJGlqakkUIjAoyHha2DUHeY2Ql3tXSxmFtdSODRj
 rmGxHkqKcN4z1p/xFvuupHXm7TpN+5zh15YRq7eiW9TJ/dVH4zqy82aUWxxtnncEm0GK
 AS3Nb5wHTvvzGRkIuvK2ltuatH42ABNWl875Sqaq2PuMpiymUN+kMQlFfRQLKhIPTNFY
 2jvk7ui3RTap/bO8p2YIszG3sOZTEPE4SDacQK9mI05zL7lpnEfnoN/+RJFYuSO5gPuk
 fJ3Q==
X-Gm-Message-State: APjAAAXqZY+GvpqQed3KgG+KJXE1GlXNaJMQ866RkoZn91DymBpwSDbP
 K5CXKZMnGaNwZ9CdOKju737rKB0LC9ENVja5qrJT16YdcP5KP7WnTPixM3mAAovOhxD9yzgDlac
 +fR9GsgWBv6sI
X-Received: by 2002:a1c:96c6:: with SMTP id y189mr6826261wmd.160.1567102771752; 
 Thu, 29 Aug 2019 11:19:31 -0700 (PDT)
X-Received: by 2002:a1c:96c6:: with SMTP id y189mr6826245wmd.160.1567102771530; 
 Thu, 29 Aug 2019 11:19:31 -0700 (PDT)
Received: from [192.168.1.41] (251.red-88-10-102.dynamicip.rima-tde.net.
 [88.10.102.251])
 by smtp.gmail.com with ESMTPSA id w15sm523972wru.53.2019.08.29.11.19.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 29 Aug 2019 11:19:30 -0700 (PDT)
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org
References: <20190823135811.13883-1-philmd@redhat.com>
 <20190823135811.13883-4-philmd@redhat.com>
 <98da7855-40eb-2d58-8f0a-b75a041aba4c@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Openpgp: id=89C1E78F601EE86C867495CBA2A3FD6EDEADC0DE;
 url=http://pgp.mit.edu/pks/lookup?op=get&search=0xA2A3FD6EDEADC0DE
Message-ID: <91b9cdcd-fe85-5283-8d03-c0e948f72f45@redhat.com>
Date: Thu, 29 Aug 2019 20:19:30 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <98da7855-40eb-2d58-8f0a-b75a041aba4c@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [PATCH 3/4] RFC target/arm: Do not build pre-ARMv7
 cpus when using KVM
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-arm@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: oM1rYJ57NyDM

Hi Thomas,

On 8/23/19 4:28 PM, Thomas Huth wrote:
> On 8/23/19 3:58 PM, Philippe Mathieu-Daud=C3=A9 wrote:
>> A KVM-only build won't be able to run pre-ARMv7 cpus, disable them.
>>
>> If KVM is not enabled, they are enabled by default.
> [...]
>>  config CHEETAH
>>      bool
>> +    select ARM_V4
>>      select OMAP
>>      select TSC210X
>=20
> Are you sure about the "enabled by default" ? There is not "default y"
> here, is it?

What I mean is if you build with --disable-kvm, this selects
--enable-tcg which provides the pre-ARMv7 cpus. So to make no changes, I
also added:

  config ARM_V4
      default y

Which include the "default y".

>=20
> Also I'm not sure whether it's such a good idea to always disable the
> config switches in default-configs/arm-softmmu.mak ... if somebody want=
s
> to build such a restricted QEMU, don't they have to maintain their own
> set of config files anyway?

Ah... I followed your example:

$ git show 9e5c2056d1e
commit 9e5c2056d1e80f344a0c412d7a3d847db1f4e034
Author: Thomas Huth <thuth@redhat.com>
Date:   Tue Jan 29 10:42:14 2019 +0100

    s390x: express dependencies with Kconfig

    Instead of hard-coding all config switches in the config file
    default-configs/s390x-softmmu.mak, let's use the new Kconfig files
    to express the necessary dependencies: The S390_CCW_VIRTIO config swi=
tch
    for the "s390-ccw-virtio" machine now selects all non-optional device=
s.

    And since we already have the VIRTIO_PCI and VIRTIO_MMIO config switc=
hes
    for the other two virtio transports, this patch also introduces a new
    config switch VIRTIO_CCW for the third, s390x-specific virtio transpo=
rt,
    so that all three virtio transports are now handled in the same way.

diff --git a/default-configs/s390x-softmmu.mak
b/default-configs/s390x-softmmu.mak
@@ -1,9 +1,13 @@
-CONFIG_PCI=3Dy
-CONFIG_VIRTIO_PCI=3Dy
-CONFIG_SCLPCONSOLE=3Dy
-CONFIG_TERMINAL3270=3Dy
-CONFIG_S390_FLIC=3Dy
-CONFIG_WDT_DIAG288=3Dy
+# Default configuration for s390x-softmmu
+
+# Uncomment the following lines to disable these optional devices:
+#
+#CONFIG_TERMINAL3270=3Dn
+#CONFIG_VFIO_AP=3Dn
+#CONFIG_VFIO_CCW=3Dn
+#CONFIG_VIRTIO_PCI=3Dn
+#CONFIG_WDT_DIAG288=3Dn
+
+# Boards:
+#
 CONFIG_S390_CCW_VIRTIO=3Dy
-CONFIG_VFIO_CCW=3Dy
-CONFIG_VFIO_AP=3Dy

OK now I see, I should have added your comment and use the opposite form
(because now these boards are all enabled) so 's/=3Dy/=3Dn' in my patch.

> I think we should maybe rather rework the default-configs directory:
> Rename the default to "config/default/" instead and then we can add
> other subfolders with such special configurations, e.g. config/nemu/ or
> config/lean-kvm/ or however you want to call it. Then add a new switch
> to the configure script to be able to use the configs from such a
> different folder.

OK so if someone wants a special config, he'd know the config values to
select, so it is pointless/confusing to keep them commented.
Are you suggesting to simply remove the default entries? Such:

-- >8 --
@@ -9,34 +9,33 @@ CONFIG_ARM_V7M=3Dy
 CONFIG_ARM_VIRT=3Dy
 CONFIG_CUBIEBOARD=3Dy
 CONFIG_EXYNOS4=3Dy
-CONFIG_HIGHBANK=3Dy
-CONFIG_INTEGRATOR=3Dy
 CONFIG_FSL_IMX31=3Dy
-CONFIG_MUSICPAL=3Dy
 CONFIG_MUSCA=3Dy
-CONFIG_CHEETAH=3Dy
-CONFIG_SX1=3Dy
-CONFIG_NSERIES=3Dy
 CONFIG_STELLARIS=3Dy
 CONFIG_REALVIEW=3Dy
-CONFIG_VERSATILE=3Dy
 CONFIG_VEXPRESS=3Dy
 CONFIG_ZYNQ=3Dy
-CONFIG_MAINSTONE=3Dy
-CONFIG_GUMSTIX=3Dy
-CONFIG_SPITZ=3Dy
-CONFIG_TOSA=3Dy
-CONFIG_Z2=3Dy
-CONFIG_COLLIE=3Dy
-CONFIG_ASPEED_SOC=3Dy
 CONFIG_NETDUINO2=3Dy
 CONFIG_MPS2=3Dy
 CONFIG_RASPI=3Dy
-CONFIG_DIGIC=3Dy
 CONFIG_SABRELITE=3Dy
 CONFIG_EMCRAFT_SF2=3Dy
-CONFIG_MICROBIT=3Dy
-CONFIG_FSL_IMX25=3Dy
 CONFIG_FSL_IMX7=3Dy
 CONFIG_FSL_IMX6UL=3Dy
 CONFIG_SEMIHOSTING=3Dy
---

Thanks,

Phil.
