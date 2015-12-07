Received: by 10.182.158.201 with SMTP id ww9csp2085789obb;
        Sun, 6 Dec 2015 21:01:27 -0800 (PST)
X-Received: by 10.140.17.102 with SMTP id 93mr34829573qgc.32.1449464487469;
        Sun, 06 Dec 2015 21:01:27 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id h95si24184209qge.82.2015.12.06.21.01.27
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sun, 06 Dec 2015 21:01:27 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@gmail.com;
       dmarc=fail (p=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:52514 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1a5nvT-0004sh-7T
	for alex.bennee@linaro.org; Mon, 07 Dec 2015 00:01:27 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43110)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <crosthwaitepeter@gmail.com>) id 1a5nvR-0004qU-RH
	for qemu-arm@nongnu.org; Mon, 07 Dec 2015 00:01:26 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <crosthwaitepeter@gmail.com>) id 1a5nvR-0001gA-0U
	for qemu-arm@nongnu.org; Mon, 07 Dec 2015 00:01:25 -0500
Received: from mail-wm0-x236.google.com ([2a00:1450:400c:c09::236]:35619)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <crosthwaitepeter@gmail.com>)
	id 1a5nvP-0001fj-0w; Mon, 07 Dec 2015 00:01:23 -0500
Received: by wmuu63 with SMTP id u63so125566400wmu.0;
	Sun, 06 Dec 2015 21:01:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=2vpIV1RcdcDhdFlWwlH8CY3LlwyWAsnreqZxiiBAR6Q=;
	b=CFASZIPxeHJOXp5fIuDy60UaZInEzWXSNN/CERLHNIahxGfksqWXXyf4HO0qNdvBjt
	KCKwFaiGbCAQQ/prkowAQOGfDG2Z2C/i/uxd6nGHyF6W3ULDvE6aVrkIx5F4N9nG7x1G
	/lFNppMdY8dsxnN2ezEx9e1XicdBBgnzsaUDxPtE59bUq3c1nEg/0bHsl3+gt07b3FGq
	9RN+GTp29ThIYbWKhEsHuJ5+APfqbm8O77bnAzM4D0vAdSootJihWRYab2UubLzeSP1C
	j9n5Rhj5Mc3G7ydjFAomdZUU1aDs6gFcCWMejqWSes8XHyLhx4hn9TVdoc5jSN5juUgl
	LfkQ==
MIME-Version: 1.0
X-Received: by 10.28.18.9 with SMTP id 9mr17925015wms.96.1449464482356; Sun,
	06 Dec 2015 21:01:22 -0800 (PST)
Received: by 10.28.88.11 with HTTP; Sun, 6 Dec 2015 21:01:22 -0800 (PST)
In-Reply-To: <edf36adfc0a1a1f4d2994473001549857d7ed192.1449000671.git.jcd@tribudubois.net>
References: <cover.1449000671.git.jcd@tribudubois.net>
	<edf36adfc0a1a1f4d2994473001549857d7ed192.1449000671.git.jcd@tribudubois.net>
Date: Sun, 6 Dec 2015 21:01:22 -0800
Message-ID: <CAPokK=qmX4vBFS6r7q-GjkOBeQtex1yJQT2UbA=_qfd+cVvcYg@mail.gmail.com>
From: Peter Crosthwaite <crosthwaitepeter@gmail.com>
To: Jean-Christophe Dubois <jcd@tribudubois.net>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2a00:1450:400c:c09::236
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	"qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
Subject: Re: [Qemu-arm] [PATCH v5 1/4] i.MX: Fix i.MX31 default/reset
	configuration.
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
X-TUID: aZsQS/FxOtT6

On Tue, Dec 1, 2015 at 12:25 PM, Jean-Christophe Dubois
<jcd@tribudubois.net> wrote:
> Linux on i.MX31/KZM is expecting the CCM to use the CKIH ref clock instead
> of the CKIL plus the FPM multiplier.
>
> We change the CCMR reg reset value to match linux expected config.
>
> This allow the CCM to provide a 39MHz clk (as expected by linux) instead of
> the actual 50MHz.
>
> With this change the "sleep 60" command on linux is time accurate with
> "real world time".
>
> Signed-off-by: Jean-Christophe Dubois <jcd@tribudubois.net>
> ---
>
> Changes since v1:
>  * Not present
>
> Changes since v2:
>  * Not present
>
> Changes since v3:
>  * Not present
>
> Changes since v4:
>  * Not present
>
>  hw/misc/imx_ccm.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/hw/misc/imx_ccm.c b/hw/misc/imx_ccm.c
> index 4cc2bbc..500dda5 100644
> --- a/hw/misc/imx_ccm.c
> +++ b/hw/misc/imx_ccm.c
> @@ -123,7 +123,7 @@ static void imx_ccm_reset(DeviceState *dev)
>  {
>      IMXCCMState *s = IMX_CCM(dev);
>
> -    s->ccmr = 0x074b0b7b;
> +    s->ccmr = 0x074b0b7d;

So a few PDFs later it looks like this is actually user configurable
via a jumper on the KZM board (JP10). I'm tempted to say that Linux's
expectations is a good for the default value, so this change looks
good to me.

Reviewed-by: Peter Crosthwaite <crosthwaite.peter@gmail.com>

>      s->pdr0 = 0xff870b48;
>      s->pdr1 = 0x49fcfe7f;
>      s->mpctl = PLL_PD(1) | PLL_MFD(0) | PLL_MFI(6) | PLL_MFN(0);
> --
> 2.5.0
>
