Received: by 2002:adf:ef42:0:0:0:0:0 with SMTP id c2csp812334wrp;
        Thu, 3 Oct 2019 14:41:10 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxn4jnzYED99/iJU80HHL7FyjERyMAol41K/SMIf7omZrD8imb0JMfHuXHR/oX4xUiovubZ
X-Received: by 2002:ac8:46d8:: with SMTP id h24mr12473203qto.235.1570138870536;
        Thu, 03 Oct 2019 14:41:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1570138870; cv=none;
        d=google.com; s=arc-20160816;
        b=crliKe42tfZx8OxCZk1sOzaj9acg5WEEMK5MLXsFy726jFGmzfafJn9I9ibFA2U2w7
         bhG0XyPP3UQxoBJfvbWTUEL3e7KU6UYZDW/XsYzaxgsys3snWjCjy4+W/J+VtB53zniB
         dZ+bPSfMkIDSVTJVEn+2fy86bK4jh3IeCux8eK1CJd+EI1/rOnfiKpGDFirUzJ+g7gnz
         AGs26nFEiVXS50I0rbwGogjuE0Lzgn+y/lo+RndRvKx8Z+B5N47LYiKovWmZbOsUnVri
         hv1ka4RonPYz83HQobEnusg61/TE3bnKMpN0OcBhC347/7lSmP+GzoTBmm5lyUJKPPTo
         8MMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=Oiie/5BoLYvBLnYujIkzYtsCTPZmL/d7Jgw3LTxPJ9M=;
        b=m19ijQyQDqYC7sRlpe7hBN4012nGBf8ll1BA7yJ8H4nHjlsOc5vfmqB0WzbIN4TPlR
         w9mQw0T4oM4j/gZV2W80+G8cLsTeWok0k2FLLoee5iBMhcrT3S2cnN1ApFAvBmNm+d0k
         aom4BeD2pxK/1qdRTH3B74nAYvuo3SMeCcZG8ajaKUA936grHDWpzbgj9LR3CAP/qj+T
         n7WxnTvBPrIGFyWw1j5TyG8ehXryYt/Uvif2acTEjFRXnfzyB1ssjeSrHb3T/+cF/ml9
         4uOL4ta0bypyNS8oFI8LHTuSsw37jPhBrNrI/gQ2gG+1Y1vEM0JilBXoZgi166ovGRyR
         FqAw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=T0rNqlxa;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 21si3581300qki.323.2019.10.03.14.41.10
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 03 Oct 2019 14:41:10 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=T0rNqlxa;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:40288 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iG8qT-0002Sn-V9
	for alex.bennee@linaro.org; Thu, 03 Oct 2019 17:41:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56519)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1iG8qK-0002SO-5X
 for qemu-arm@nongnu.org; Thu, 03 Oct 2019 17:41:02 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1iG8qG-0002dx-Bv
 for qemu-arm@nongnu.org; Thu, 03 Oct 2019 17:40:58 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:27291
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1iG8q9-0002V3-Du
 for qemu-arm@nongnu.org; Thu, 03 Oct 2019 17:40:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1570138845;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Oiie/5BoLYvBLnYujIkzYtsCTPZmL/d7Jgw3LTxPJ9M=;
 b=T0rNqlxa53nxxvRzhCtsLZRbcs5dUm1WUnqRnVGPrQqZYchB6LTvIgCMUd3jj82n/L6odu
 dfq1IWvoXBEDD1Ciz4DMH3LYiqw1QQJladJ2iKOjtpgDl45zYp/9SjrT4tCkRZAgl107yG
 weMIw4pRScHB6mCznyWIA5n9bAsa3+Y=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-162-pvOGYoJ4O3KsEbxHY5Brbg-1; Thu, 03 Oct 2019 17:40:42 -0400
Received: by mail-wm1-f72.google.com with SMTP id r187so2946470wme.0
 for <qemu-arm@nongnu.org>; Thu, 03 Oct 2019 14:40:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=tOf5KBlaCBTyfqyZJRcF2KlfUtLrLdbL5dPGhD9CX2A=;
 b=Isft9wcKt5NgkfgGuDQVkece2UpcQTDCH8QlMqJhKQ8MJpGxQ7VnWiC3NEvmbzczLt
 Seck8NokHWIqYFQmDMlLlsB4amOfX9YMyZB1LzJMlBwIGE9GaLU+7BOhF+t8FlQFv2qu
 QLlzaPTNhhIFTr/dftAidrHb3SBti3tD4Rf+1Li0o/ls2n8QGTWxwstXkf5BcMNHh3nx
 o1Pn3AHVGFJx981D8Y184ckbE6IX6lalqa3TlU8rZdME4zjk3KDlCbyWMW65T85z+yOt
 bA8N7e302jvopabWZscetL0eujhGC/bTxS0jPzhx09QVEviSIk0axDJXaEPMILbRpotT
 oCAQ==
X-Gm-Message-State: APjAAAUmuvl8s4sPBNI9ePp/1ArI091sOlMxpXaohKc9o3Cr4C/sJRcL
 0hZFfPqHl3+PFuI6KpgLlgEIVV9xjA2pW2kx0TSibgdP7v+uRXB0lnc3XwPJ6zSzoDpns7/igvS
 F967SwHLXiVJ9
X-Received: by 2002:a7b:c35a:: with SMTP id l26mr8614186wmj.81.1570138841409; 
 Thu, 03 Oct 2019 14:40:41 -0700 (PDT)
X-Received: by 2002:a7b:c35a:: with SMTP id l26mr8614173wmj.81.1570138841043; 
 Thu, 03 Oct 2019 14:40:41 -0700 (PDT)
Received: from [192.168.1.35] (240.red-88-21-68.staticip.rima-tde.net.
 [88.21.68.240])
 by smtp.gmail.com with ESMTPSA id p7sm4778733wma.34.2019.10.03.14.40.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 03 Oct 2019 14:40:40 -0700 (PDT)
Subject: Re: [U-Boot] U-Boot build for i.MX board won't boot in corresponding
 QEMU machine
To: Bin Meng <bmeng.cn@gmail.com>, Waseem ALKurdi <waseem19992009@outlook.com>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
References: <AM0PR01MB5795656B2DB2EA6E760BA8A8D79C0@AM0PR01MB5795.eurprd01.prod.exchangelabs.com>
 <CAEUhbmUYt=kNzJMyhZWouuktSKkqRtwkzxSQeFygMTid-M=QUw@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <77dd4faa-77b9-2156-3f6a-ece8c7b6f1df@redhat.com>
Date: Thu, 3 Oct 2019 23:40:38 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.0
MIME-Version: 1.0
In-Reply-To: <CAEUhbmUYt=kNzJMyhZWouuktSKkqRtwkzxSQeFygMTid-M=QUw@mail.gmail.com>
Content-Language: en-US
X-MC-Unique: pvOGYoJ4O3KsEbxHY5Brbg-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 205.139.110.120
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
 "u-boot@lists.denx.de" <u-boot@lists.denx.de>, qemu-arm@nongnu.org,
 Jean-Christophe Dubois <jcd@tribudubois.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 6j6nFFonJ1+0

Cc'ing the SABRELITE maintainers:

$ ./scripts/get_maintainer.pl -f hw/misc/imx6_ccm.c
Peter Maydell <peter.maydell@linaro.org> (odd fixer:SABRELITE / i.MX6)
Jean-Christophe Dubois <jcd@tribudubois.net> (reviewer:SABRELITE / i.MX6)
qemu-arm@nongnu.org (open list:SABRELITE / i.MX6)

On 10/3/19 1:54 PM, Bin Meng wrote:
> +QEMU developers ML
> On Thu, Oct 3, 2019 at 7:37 PM Waseem ALKurdi
> <waseem19992009@outlook.com> wrote:
>>
>> I'm trying to get mainline U-Boot to boot on mainline QEMU 4.1.0 for the=
 'sabrelite' board, using the configuration 'mx6qsabrelite_defconfig'.
>>
>> It's not booting at all. Actually, not a single U-Boot build for an i.MX=
 board would boot, with the exception of 'imx25-pdk'.
>>
>> I'm compiling U-Boot by un-tarring the source tarball and running the fo=
llowing commands:
>>
>> $ time CROSS_COMPILE=3D/path/to/toolchain/arm-2014.05/bin/arm-none-linux=
-gnueabi- make ARCH=3Darm clean
>> $ time CROSS_COMPILE=3D/path/to/toolchain/arm-2014.05/bin/arm-none-linux=
-gnueabi- make ARCH=3Darm mrproper
>> $ time CROSS_COMPILE=3D/path/to/toolchain/arm-2014.05/bin/arm-none-linux=
-gnueabi- make ARCH=3Darm mx6qsabrelite_defconfig
>>
>> then after the build finishes:
>>
>> $ qemu-system-arm -M sabrelite -m 512M -kernel ~/Downloads/u-boot-2019.1=
0-rc3/u-boot.imx -monitor stdio
>>
>> And other variations on this command as well.
>> No amount of kernel commandline options or anything would make it boot. =
What should I do?

Running QEMU with '-d in_asm,cpu' shows the guest is looping polling a=20
mmio mapped register:

IN: arch_cpu_init
0x17803264:  e5943150  ldr      r3, [r4, #0x150]
0x17803268:  f57ff05f  dmb      sy
0x1780326c:  e3130080  tst      r3, #0x80
0x17803270:  0afffffb  beq      #0x17803264

R00=3D00000000 R01=3D00000000 R02=3D00000001 R03=3D04000000
R04=3D020c8000 R05=3D17864a7c R06=3D17864a78 R07=3D00000000
R08=3D00000000 R09=3D0093dde0 R10=3D00000000 R11=3D00000000
R12=3D0093dee8 R13=3D0093ddc8 R14=3D178033e4 R15=3D17803264
PSR=3D400001d3 -Z-- A S svc32
R00=3D00000000 R01=3D00000000 R02=3D00000001 R03=3D04000000
R04=3D020c8000 R05=3D17864a7c R06=3D17864a78 R07=3D00000000
R08=3D00000000 R09=3D0093dde0 R10=3D00000000 R11=3D00000000
R12=3D0093dee8 R13=3D0093ddc8 R14=3D178033e4 R15=3D17803264
PSR=3D400001d3 -Z-- A S svc32

R04 + 0x150 =3D 0x020c8000 + 0x150 =3D 0x020c8150, which is the=20
CCM_ANALOG_MISC0 register.

Looking at u-boot arch/arm/mach-imx/mx6/soc.c we have:

int arch_cpu_init(void)
{
=09struct mxc_ccm_reg *ccm =3D (struct mxc_ccm_reg *)CCM_BASE_ADDR;

=09init_aips();

=09/* Need to clear MMDC_CHx_MASK to make warm reset work. */
=09clear_mmdc_ch_mask();

=09/*
=09 * Disable self-bias circuit in the analog bandap.
=09 * The self-bias circuit is used by the bandgap during startup.
=09 * This bit should be set after the bandgap has initialized.
=09 */
=09init_bandgap();

         ...

With:

static void init_bandgap(void)
{
=09struct anatop_regs *anatop =3D (struct anatop_regs *)ANATOP_BASE_ADDR;
=09struct ocotp_regs *ocotp =3D (struct ocotp_regs *)OCOTP_BASE_ADDR;
=09struct fuse_bank *bank =3D &ocotp->bank[1];
=09struct fuse_bank1_regs *fuse =3D
=09=09(struct fuse_bank1_regs *)bank->fuse_regs;
=09uint32_t val;

=09/*
=09 * Ensure the bandgap has stabilized.
=09 */
=09while (!(readl(&anatop->ana_misc0) & 0x80))
=09=09;

QEMU returns R03=3D04000000 which comes from hw/misc/imx6_ccm.c:

static void imx6_ccm_reset(DeviceState *dev)
{
     ...
     s->analog[PMU_MISC0] =3D 0x04000000;
     s->analog[PMU_MISC1] =3D 0x00000000;
     s->analog[PMU_MISC2] =3D 0x00272727;

Changing the PMU_MISC0 register to return the bit u-boot is polling with=20
this snippet (I have no clue what this does) with:

-- >8 --
diff --git a/hw/misc/imx6_ccm.c b/hw/misc/imx6_ccm.c
index 7fec8f0a47..3a52ea640a 100644
--- a/hw/misc/imx6_ccm.c
+++ b/hw/misc/imx6_ccm.c
@@ -450,7 +450,7 @@ static void imx6_ccm_reset(DeviceState *dev)
      s->analog[PMU_REG_3P0] =3D 0x00000F74;
      s->analog[PMU_REG_2P5] =3D 0x00005071;
      s->analog[PMU_REG_CORE] =3D 0x00402010;
-    s->analog[PMU_MISC0] =3D 0x04000000;
+    s->analog[PMU_MISC0] =3D 0x04000080;
      s->analog[PMU_MISC1] =3D 0x00000000;
      s->analog[PMU_MISC2] =3D 0x00272727;
---

I see u-boot going further.

> I suspect mainline QEMU sabrelite machine only supports booting the
> Linux kernel directly, but not booting U-Boot.

Note this u-boot code is ~4 years old:

commit 1f516faa45611aedc8c2e3f303b3866f615d481e
Author: Peng Fan <Peng.Fan@freescale.com>
Date:   Thu Jan 15 14:22:32 2015 +0800

     ARM: imx6: disable bandgap self-bias after boot

     The self-bias circuit is used by the bandgap during startup.
     Once the bandgap has stabilized, the self-bias circuit should
     be disabled for best noise performance of analog blocks.
     Also this bit should be disabled before the chip enters STOP mode or
     when ever the regular bandgap is disabled.

The QEMU device code was added later:

commit a66d815cd558193182b09fb23211f7ebf88d0661
Author: Jean-Christophe Dubois <jcd@tribudubois.net>
Date:   Wed Mar 16 17:06:00 2016 +0000

     i.MX: Add i.MX6 CCM and ANALOG device.

So I believe QEMU never booted u-boot on the i.MX6.

Waseem, you can enable some QEMU i.MX debug changing DEBUG_IMX*=20
definitions, such:

-- >8 --
diff --git a/hw/misc/imx6_ccm.c b/hw/misc/imx6_ccm.c
index 7fec8f0a47..3a52ea640a 100644
--- a/hw/misc/imx6_ccm.c
+++ b/hw/misc/imx6_ccm.c
@@ -17,7 +17,7 @@
  #include "qemu/module.h"

  #ifndef DEBUG_IMX6_CCM
-#define DEBUG_IMX6_CCM 0
+#define DEBUG_IMX6_CCM 1
  #endif

  #define DPRINTF(fmt, args...) \
---

There are more:

$ git grep ifndef.*DEBUG_IMX
hw/char/imx_serial.c:29:#ifndef DEBUG_IMX_UART
hw/gpio/imx_gpio.c:28:#ifndef DEBUG_IMX_GPIO
hw/i2c/imx_i2c.c:29:#ifndef DEBUG_IMX_I2C
hw/intc/imx_avic.c:25:#ifndef DEBUG_IMX_AVIC
hw/misc/imx25_ccm.c:20:#ifndef DEBUG_IMX25_CCM
hw/misc/imx31_ccm.c:22:#ifndef DEBUG_IMX31_CCM
hw/misc/imx6_ccm.c:19:#ifndef DEBUG_IMX6_CCM
hw/misc/imx6_src.c:21:#ifndef DEBUG_IMX6_SRC
hw/misc/imx_ccm.c:19:#ifndef DEBUG_IMX_CCM
hw/net/imx_fec.c:38:#ifndef DEBUG_IMX_FEC
hw/net/imx_fec.c:50:#ifndef DEBUG_IMX_PHY
hw/ssi/imx_spi.c:18:#ifndef DEBUG_IMX_SPI
hw/timer/imx_epit.c:24:#ifndef DEBUG_IMX_EPIT
hw/timer/imx_gpt.c:23:#ifndef DEBUG_IMX_GPT

Regards,

Phil.

