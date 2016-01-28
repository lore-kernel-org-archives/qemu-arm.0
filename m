Received: by 10.25.159.19 with SMTP id i19csp553068lfe;
        Thu, 28 Jan 2016 11:23:05 -0800 (PST)
X-Received: by 10.140.106.165 with SMTP id e34mr5847635qgf.23.1454008985142;
        Thu, 28 Jan 2016 11:23:05 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 38si11040128qku.112.2016.01.28.11.23.04
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 28 Jan 2016 11:23:05 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:58224 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aOs9o-00046B-40
	for alex.bennee@linaro.org; Thu, 28 Jan 2016 14:23:04 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36342)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <jcd@tribudubois.net>) id 1aOs9l-00045l-0V
	for qemu-arm@nongnu.org; Thu, 28 Jan 2016 14:23:02 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <jcd@tribudubois.net>) id 1aOs9f-00007M-T8
	for qemu-arm@nongnu.org; Thu, 28 Jan 2016 14:23:00 -0500
Received: from zose-mta02.web4all.fr ([185.49.20.43]:33276)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <jcd@tribudubois.net>)
	id 1aOs9f-00005s-IC; Thu, 28 Jan 2016 14:22:55 -0500
Received: from localhost (localhost [127.0.0.1])
	by zose-mta02.web4all.fr (Postfix) with ESMTP id 9C162404A7;
	Thu, 28 Jan 2016 20:22:53 +0100 (CET)
Received: from zose-mta02.web4all.fr ([127.0.0.1])
	by localhost (zose-mta02.web4all.fr [127.0.0.1]) (amavisd-new,
	port 10032)
	with ESMTP id iEDM9NPzBcEf; Thu, 28 Jan 2016 20:22:53 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by zose-mta02.web4all.fr (Postfix) with ESMTP id 0BDFE40A5E;
	Thu, 28 Jan 2016 20:22:53 +0100 (CET)
X-Virus-Scanned: amavisd-new at zose-mta-02.w4a.fr
Received: from zose-mta02.web4all.fr ([127.0.0.1])
	by localhost (zose-mta02.web4all.fr [127.0.0.1]) (amavisd-new,
	port 10026)
	with ESMTP id E_U4Md7DUwTu; Thu, 28 Jan 2016 20:22:52 +0100 (CET)
Received: from [192.168.1.128] (smm49-1-78-235-240-156.fbx.proxad.net
	[78.235.240.156])
	by zose-mta02.web4all.fr (Postfix) with ESMTPSA id B2293404A7;
	Thu, 28 Jan 2016 20:22:52 +0100 (CET)
To: Peter Maydell <peter.maydell@linaro.org>
References: <1453844678-26279-1-git-send-email-jcd@tribudubois.net>
	<CAFEAcA_xk8ChTA0YppK=mbTZptiL8AGy8RDKQTBS-L0SDaKRXA@mail.gmail.com>
From: Jean-Christophe DUBOIS <jcd@tribudubois.net>
Message-ID: <56AA6A8C.6030906@tribudubois.net>
Date: Thu, 28 Jan 2016 20:22:52 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.5.1
MIME-Version: 1.0
In-Reply-To: <CAFEAcA_xk8ChTA0YppK=mbTZptiL8AGy8RDKQTBS-L0SDaKRXA@mail.gmail.com>
Content-Type: multipart/mixed; boundary="------------020701030306050700050507"
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 185.49.20.43
Cc: qemu-arm@nongnu.org, QEMU Developers <qemu-devel@nongnu.org>
Subject: Re: [Qemu-arm] [PATCH 0/6] Add i.MX6 (Single/Dual/Quad) support
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: EzX98XnMn8zo

This is a multi-part message in MIME format.
--------------020701030306050700050507
Content-Type: multipart/alternative;
 boundary="------------010807010309090104010003"


--------------010807010309090104010003
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable

Hello Peter,

Le 28/01/2016 15:57, Peter Maydell a =C3=A9crit :
> On 26 January 2016 at 21:44, Jean-Christophe Dubois <jcd@tribudubois.ne=
t> wrote:
>> This patch series adds support for the Freescale i.MX6 processor.
>>
>> For now we only support the following devices:
>> * up to 4 Cortex A9 cores
>> * A9 MPCORE (SCU, GIC, TWD)
>> * 5 i.MX UARTs
>> * 2 EPIT timers
>> * 1 GPT timer
>> * 7 GPIO controllers
>> * 6 SDHC controllers
>> * 1 CCM device
>> * 1 SRC device
>> * various ROM/RAM areas.
>>
>> This also adds the sabrelite board as a an actual platform for i.MX6.
>>
>> This series was tested by booting a 4.4 linux kernel (using the
>> imx_v6_v7_defconfig file as kernel configuration).
>>
>> Note: In order for Linux to work I had to customize a bit the
>> arch/arm/boot/dts/imx6qdl-sabrelite.dtsi device tree file.
> What changes did you have to make to the dt, and why?

Please find attached the diff file for the linux imx6qdl-sabrelite.dtsi=20
file.

Basically, it boils down to the following:

  * Sabrelite uses uart2 for console but on qemu, this is uart1 that is
    wired to the default stdout. Consequently, I changed stdout-path in
    "chosen" to uart1.
  * For now i.MX6 SOC code does not emulate SPI controller. During the
    boot Linux was getting stuck trying to access a SPI device that is
    supposed to be there. Therefore I disabled the SPI controller in the
    device tree.
  * The sabrelite is supposed to have a bunch of push buttons (home,
    power, back, vol up, vol down) wired to various GPIOs. I guess these
    buttons might have pull up or pull down resistors on the real
    hardware but obviously on qemu we have no such things. As a results
    the GPIOs were triggering a lot of interrupts for nothing. So I
    commented out the GPIO sections were the buttons were defined.

Regards

JC

>
> thanks
> -- PMM
>


--------------010807010309090104010003
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: quoted-printable

<html>
  <head>
    <meta content=3D"text/html; charset=3Dutf-8" http-equiv=3D"Content-Ty=
pe">
  </head>
  <body text=3D"#000000" bgcolor=3D"#FFFFFF">
    <div class=3D"moz-cite-prefix">Hello Peter,<br>
      <br>
      Le 28/01/2016 15:57, Peter Maydell a =C3=A9crit=C2=A0:<br>
    </div>
    <blockquote
cite=3D"mid:CAFEAcA_xk8ChTA0YppK=3DmbTZptiL8AGy8RDKQTBS-L0SDaKRXA@mail.gm=
ail.com"
      type=3D"cite">
      <pre wrap=3D"">On 26 January 2016 at 21:44, Jean-Christophe Dubois =
<a class=3D"moz-txt-link-rfc2396E" href=3D"mailto:jcd@tribudubois.net">&l=
t;jcd@tribudubois.net&gt;</a> wrote:
</pre>
      <blockquote type=3D"cite">
        <pre wrap=3D"">This patch series adds support for the Freescale i=
.MX6 processor.

For now we only support the following devices:
* up to 4 Cortex A9 cores
* A9 MPCORE (SCU, GIC, TWD)
* 5 i.MX UARTs
* 2 EPIT timers
* 1 GPT timer
* 7 GPIO controllers
* 6 SDHC controllers
* 1 CCM device
* 1 SRC device
* various ROM/RAM areas.

This also adds the sabrelite board as a an actual platform for i.MX6.

This series was tested by booting a 4.4 linux kernel (using the
imx_v6_v7_defconfig file as kernel configuration).

Note: In order for Linux to work I had to customize a bit the
arch/arm/boot/dts/imx6qdl-sabrelite.dtsi device tree file.
</pre>
      </blockquote>
      <pre wrap=3D"">
What changes did you have to make to the dt, and why?</pre>
    </blockquote>
    <br>
    Please find attached the diff file for the linux
    imx6qdl-sabrelite.dtsi file.<br>
    <br>
    Basically, it boils down to the following:<br>
    <ul>
      <li>Sabrelite uses uart2 for console but on qemu, this is uart1
        that is wired to the default stdout. Consequently, I changed
        stdout-path in "chosen" to uart1.</li>
      <li>For now i.MX6 SOC code does not emulate SPI controller. During
        the boot Linux was getting stuck trying to access a SPI device
        that is supposed to be there. Therefore I disabled the SPI
        controller in the device tree.</li>
      <li>The sabrelite is supposed to have a bunch of push buttons
        (home, power, back, vol up, vol down) wired to various GPIOs. I
        guess these buttons might have pull up or pull down resistors on
        the real hardware but obviously on qemu we have no such things.
        As a results the GPIOs were triggering a lot of interrupts for
        nothing. So I commented out the GPIO sections were the buttons
        were defined.<br>
      </li>
    </ul>
    Regards<br>
    <br>
    JC<br>
    <br>
    <blockquote
cite=3D"mid:CAFEAcA_xk8ChTA0YppK=3DmbTZptiL8AGy8RDKQTBS-L0SDaKRXA@mail.gm=
ail.com"
      type=3D"cite">
      <pre wrap=3D"">

thanks
-- PMM

</pre>
    </blockquote>
    <br>
  </body>
</html>

--------------010807010309090104010003--

--------------020701030306050700050507
Content-Type: text/x-patch;
 name="imx6qdl-sabrelite.dtsi.diff"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="imx6qdl-sabrelite.dtsi.diff"

diff --git a/arch/arm/boot/dts/imx6qdl-sabrelite.dtsi b/arch/arm/boot/dts/imx6qdl-sabrelite.dtsi
index 1a69a34..760020e 100644
--- a/arch/arm/boot/dts/imx6qdl-sabrelite.dtsi
+++ b/arch/arm/boot/dts/imx6qdl-sabrelite.dtsi
@@ -44,7 +44,8 @@
 
 / {
 	chosen {
-		stdout-path = &uart2;
+                bootargs = "console=ttymxc0,115200";
+		stdout-path = &uart1;
 	};
 
 	memory {
@@ -96,6 +97,7 @@
 		};
 	};
 
+/*
 	gpio-keys {
 		compatible = "gpio-keys";
 		pinctrl-names = "default";
@@ -138,6 +140,7 @@
 			linux,code = <KEY_VOLUMEDOWN>;
 		};
 	};
+*/
 
 	sound {
 		compatible = "fsl,imx6q-sabrelite-sgtl5000",
@@ -245,7 +248,7 @@
 	cs-gpios = <&gpio3 19 0>;
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_ecspi1>;
-	status = "okay";
+	/* status = "okay"; */
 
 	flash: m25p80@0 {
 		compatible = "sst,sst25vf016b", "jedec,spi-nor";

--------------020701030306050700050507--
