Received: by 10.28.173.206 with SMTP id w197csp85195wme;
        Fri, 12 Jan 2018 17:11:12 -0800 (PST)
X-Google-Smtp-Source: ACJfBot6/Sd9Sn6Aulu7pTEWC4UhUPUVHyDyW8dOctEwV+E6vZZtTNhhMzCxZXBuaJPHV2AIbJ9g
X-Received: by 10.37.162.205 with SMTP id c13mr9428964ybn.136.1515805872563;
        Fri, 12 Jan 2018 17:11:12 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1515805872; cv=none;
        d=google.com; s=arc-20160816;
        b=l6ePDasVftMmZ6tKwI8AQG60vtXCXHixZb8GPmZxtTMIqpdw8PIA0D3E7UnjaDaFwC
         MLDFUNP0HQxKKnnsBFMtFvhUYt6t4pDfeaauoDPmRJQFHO1F1ga5iuVjbPOOgUhSbhaJ
         0faeqpqRm1WVfVJ0K4rv/8HelgfF5PDgN+bxxdX9nvlKCsfWPLGxB82oekvZxHzJo/xT
         QlzBCO6HX30dWaH0BjvL0q60ywjLhEpjWM1Mez8IxKElVCpTvz1RZIYh5dEpjM8KO7za
         Em/bmMuQHrE6KjuZJ4k1koG9+quOVHj1FGNTfXvRjdzXh4d3GC6BAhXqaprFlj+6sQlM
         ZG8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:to:message-id:date:from:references
         :in-reply-to:mime-version:dkim-signature:arc-authentication-results;
        bh=5D3kgCYcWq3dBUkSvJ6K4TWMNiOOxw1TDqtcgy2KRk8=;
        b=Jo7L0oAJ5UeYGBG3fVI0aXM1a/bVOazh5/MYkKv4ysCXAD9FifEe5gxAuVz4omdRqn
         oejonJLIdkxbbNEspeFIjWpK+/P8S+KA3OyY6Ny/XmVdyRI0vnRPJHIQZnCfs+jkANBg
         wD5/eeUV6k/RkHs6vv8CYiw3WKGByuxdSYZhr6hcXr/I1Zu1Pf7vElbK2wM5TxApiU6Z
         LYsVflXVL0UmgEw0HCHaxMiI8nHjn8DaarUhhN20m168O+93V7UfdMSzV8B5YAZKLAbF
         fjkkl+ZF+vua/h835XhMtYvSCUxzsTQuYMFNQzpT+WkqACTEJSFH6fnrF7nuPEzyNYUu
         4Miw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=S3z1Anp0;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id t62si4730294ywt.703.2018.01.12.17.11.12
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 12 Jan 2018 17:11:12 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=S3z1Anp0;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:53411 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eaALo-0008Bp-07
	for alex.bennee@linaro.org; Fri, 12 Jan 2018 20:11:12 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40565)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1eaALe-0008AW-Lj
	for qemu-arm@nongnu.org; Fri, 12 Jan 2018 20:11:03 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1eaALd-0004Fc-N5
	for qemu-arm@nongnu.org; Fri, 12 Jan 2018 20:11:02 -0500
Received: from mail-wm0-x244.google.com ([2a00:1450:400c:c09::244]:34650)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <alistair23@gmail.com>)
	id 1eaALb-0004B9-HN; Fri, 12 Jan 2018 20:10:59 -0500
Received: by mail-wm0-x244.google.com with SMTP id 81so4552536wmb.1;
	Fri, 12 Jan 2018 17:10:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-transfer-encoding;
	bh=5D3kgCYcWq3dBUkSvJ6K4TWMNiOOxw1TDqtcgy2KRk8=;
	b=S3z1Anp0WITHE1WsMQ4DUaejL/+eolmycaYa3YH/O7rD0Ix9Oe/S6A1MQwysbYwLNy
	CI5vuG0a2kED3gpTGTOTR4Fy36Ow6kAiY0UWH/Pe9qQIOvwW/ymkzTjIxXeMxWZBOUbt
	IAYS4awcpIP0o/ZMsOKq5z74bG/McxmmiYJPj0x03zb3OQS4AP7+7GwTqOVjyNH+Eglp
	kjlIkLmsJ+mXUuQRv3RAgwWYd7N6stbPNNt6CD/6z/rvI/WK7vw36Un4KFiVtgAv7c1r
	Az6wzZt9QD2EQkj4b8iRUBzCb+ujK2fLa74/JjAkyZSPoj5Pult+la1GKIUvtxmoAPr0
	6wfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
	:date:message-id:subject:to:cc:content-transfer-encoding;
	bh=5D3kgCYcWq3dBUkSvJ6K4TWMNiOOxw1TDqtcgy2KRk8=;
	b=Xq1qHqKc1iK4ktGmcESaMyOQTdJ0szNp9t/w2b1BgzNjP7exbfbK9JaolmbudgaJ2P
	tfsw9MXLbkByolIZ+6ZHK2K7+Yem4NaVNingKjtAMZ+7tQs5Ccgkb6w68ng0mJtF2flW
	QYQV9K4xi44rphRF7nmdIi12f69mW6lwVSMXlxuvCEAQSlLwph72hPrpAw1lfsTJFHhr
	6q56E7hNSjX3j7bDr+T1ALuDcL9GWORB5JjAGGpUU/7lHDujG1aRelT0aPRFcB+RQX1B
	vhDBSOgZy8P/zhNo9lOwK7VPFbyho1UqeyxU/dNQ8VGt5pYeLJRSfy52jd4pzzfcCI8d
	1ooA==
X-Gm-Message-State: AKwxytcz8PMCeEpyR/oQnrhHjD6taUOWCEBBT1a4oXsABheD9j5f0iwk
	3Btb9PGaGkWZLvMCMNJnX5x/SZYrQNMHDlc2XLw=
X-Received: by 10.28.17.76 with SMTP id 73mr5661829wmr.104.1515805858670; Fri,
	12 Jan 2018 17:10:58 -0800 (PST)
MIME-Version: 1.0
Received: by 10.28.164.69 with HTTP; Fri, 12 Jan 2018 17:10:28 -0800 (PST)
In-Reply-To: <20180111205626.23291-18-f4bug@amsat.org>
References: <20180111205626.23291-1-f4bug@amsat.org>
	<20180111205626.23291-18-f4bug@amsat.org>
From: Alistair Francis <alistair.francis@xilinx.com>
Date: Fri, 12 Jan 2018 17:10:28 -0800
X-Google-Sender-Auth: A2kIbi2rnhtXyS47tLKs5OsKDvc
Message-ID: <CAKmqyKP5DAuo8SHupP=_CAQoJ6kXzrAzJgiA6yhWCw40QX7WPg@mail.gmail.com>
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:400c:c09::244
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v6 17/21] sdhci: add Spec v4.2
 register definitions
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: "Edgar E . Iglesias" <edgar.iglesias@xilinx.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Prasad J Pandit <pjp@fedoraproject.org>,
	=?UTF-8?Q?Gr=C3=A9gory_Estrade?= <gregory.estrade@gmail.com>,
	Andrey Smirnov <andrew.smirnov@gmail.com>,
	"qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Alistair Francis <alistair.francis@xilinx.com>,
	Sai Pavan Boddu <saipava@xilinx.com>,
	Igor Mitsyanko <i.mitsyanko@gmail.com>, qemu-arm <qemu-arm@nongnu.org>,
	Clement Deschamps <clement.deschamps@antfield.fr>,
	Andrew Baumann <Andrew.Baumann@microsoft.com>,
	Jean-Christophe Dubois <jcd@tribudubois.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 5j9g9tWDzE9W

On Thu, Jan 11, 2018 at 12:56 PM, Philippe Mathieu-Daud=C3=A9
<f4bug@amsat.org> wrote:
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>

Reviewed-by: Alistair Francis <alistair.francis@xilinx.com>

Alistair

> ---
>  hw/sd/sdhci-internal.h | 8 ++++++++
>  1 file changed, 8 insertions(+)
>
> diff --git a/hw/sd/sdhci-internal.h b/hw/sd/sdhci-internal.h
> index ac4704eb61..b82e847636 100644
> --- a/hw/sd/sdhci-internal.h
> +++ b/hw/sd/sdhci-internal.h
> @@ -191,6 +191,10 @@ FIELD(SDHC_HOSTCTL2, V18_ENA,          3, 1); /* UHS=
-I only */
>  FIELD(SDHC_HOSTCTL2, DRIVER_STRENGTH,  4, 2); /* UHS-I only */
>  FIELD(SDHC_HOSTCTL2, EXECUTE_TUNING,   6, 1); /* UHS-I only */
>  FIELD(SDHC_HOSTCTL2, SAMPLING_CLKSEL,  7, 1); /* UHS-I only */
> +FIELD(SDHC_HOSTCTL2, UHS_II_ENA,       8, 1); /* since v4 */
> +FIELD(SDHC_HOSTCTL2, ADMA2_LENGTH,    10, 1); /* since v4 */
> +FIELD(SDHC_HOSTCTL2, CMD23_ENA,       11, 1); /* since v4 */
> +FIELD(SDHC_HOSTCTL2, VERSION4,        12, 1); /* since v4 */
>  FIELD(SDHC_HOSTCTL2, ASYNC_INT,       14, 1);
>  FIELD(SDHC_HOSTCTL2, PRESET_ENA,      15, 1);
>
> @@ -219,12 +223,16 @@ FIELD(SDHC_CAPAB, DRIVER_TYPE_C,      37, 1); /* si=
nce v3 */
>  FIELD(SDHC_CAPAB, DRIVER_TYPE_D,      38, 1); /* since v3 */
>  FIELD(SDHC_CAPAB, TIMER_RETUNNING,    40, 4); /* since v3 */
>  FIELD(SDHC_CAPAB, SDR50_TUNNING,      45, 1); /* since v3 */
> +FIELD(SDHC_CAPAB, CLK_MUL,            48, 8); /* since v4.20 */
> +FIELD(SDHC_CAPAB, ADMA3,              59, 1); /* since v4.20 */
> +FIELD(SDHC_CAPAB, V18_VDD2,           60, 1); /* since v4.20 */
>
>  /* HWInit Maximum Current Capabilities Register 0x0 */
>  #define SDHC_MAXCURR                   0x48
>  FIELD(SDHC_MAXCURR, V33_VDD1,          0, 8);
>  FIELD(SDHC_MAXCURR, V30_VDD1,          8, 8);
>  FIELD(SDHC_MAXCURR, V18_VDD1,         16, 8);
> +FIELD(SDHC_MAXCURR, V18_VDD2,         32, 8); /* since v4.20 */
>
>  /* W Force Event Auto CMD12 Error Interrupt Register 0x0000 */
>  #define SDHC_FEAER                     0x50
> --
> 2.15.1
>
>
