Received: by 10.28.173.206 with SMTP id w197csp6849799wme;
        Thu, 18 Jan 2018 10:22:43 -0800 (PST)
X-Google-Smtp-Source: ACJfBotn7hPCK0hbNMiHt5+/KtwhRv780eLoxa/CX+mb3n0ElvTeNY6xedv6zLCIGe2HgMRvbB4x
X-Received: by 10.13.224.65 with SMTP id j62mr6521087ywe.185.1516299763123;
        Thu, 18 Jan 2018 10:22:43 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1516299763; cv=none;
        d=google.com; s=arc-20160816;
        b=jyVN67q6/EjBEXZs9PJObpqRqwl2NVXIYqnWvJay3UDmmCgT50brNxLtBYJFkw4WfT
         xX0G1s76dAfdGSWqkBsYYtYqyqJzo+cjz4aiiDOG9UbNqXWvyNDnECHmJ9BHl7GXEL/u
         PTsnOsZaH4nqIAZQIwoaIkB7XSMl91KJ1xUMlMemxoAy7Zaj6Siv/+HfWiW6w7NB0Z8z
         OBB+S/qRVVIo89CkjikH9UTlJHo0luyLRYTQFD28U9syJPhufjvX9uT10i0XHqKYbL7u
         sDzDEj8r8R/+utzLxU1ZfGBLftqUnLZW5z8WgSPMPD3tm92rHZQNIG0qQGks++1xZC68
         IIEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:to:message-id:date:from:references
         :in-reply-to:mime-version:dkim-signature:arc-authentication-results;
        bh=EXu/9tEJu/De1gzTHi/UfnihXeddWAKEZgcrXucSPjs=;
        b=lORkuUDBPgCqJcly02vWKQlOCXQDXypnSdWHs27RMYhNLjSBF4vhQPIZUJImgz4cT6
         cedj9DTxPJszdbKtXRckS2T6XimJPFyS5J8btMQ7JXYv/6gnYuhP70q5ait0bY4at/L+
         omqPJl/nOgf/9of87ZMD4o2VGoXmhu/rhP+cfcJae2aWIHqShKRkjJaQvr+wQ3csmgZ7
         qudwl77p3hVczzcdGMF0IRJbDVWbshaklMv7hC28HsP4XYf2CxM/IFWzc8DrrZTNz+V0
         FsMiaE/2E8MBCS192/bje9/tmN2X+aeSu14Ciz/inMVLKVCDYDQuvK5oD6piHLwN9Qto
         jkvA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=lU99gEvX;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id v71si243334ybi.150.2018.01.18.10.22.42
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 18 Jan 2018 10:22:43 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=lU99gEvX;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:46245 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ecEpm-0001tt-G2
	for alex.bennee@linaro.org; Thu, 18 Jan 2018 13:22:42 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35042)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1ecEpJ-0001rW-7V
	for qemu-devel@nongnu.org; Thu, 18 Jan 2018 13:22:14 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1ecEpI-0003zO-Ab
	for qemu-devel@nongnu.org; Thu, 18 Jan 2018 13:22:13 -0500
Received: from mail-lf0-x241.google.com ([2a00:1450:4010:c07::241]:42505)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <alistair23@gmail.com>)
	id 1ecEpI-0003yT-2V; Thu, 18 Jan 2018 13:22:12 -0500
Received: by mail-lf0-x241.google.com with SMTP id q17so17653920lfa.9;
	Thu, 18 Jan 2018 10:22:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-transfer-encoding;
	bh=EXu/9tEJu/De1gzTHi/UfnihXeddWAKEZgcrXucSPjs=;
	b=lU99gEvXiMHfvya6tHU3FoX9sZoDOclQX/uk5Ei/UgrX3XN75Waz9XaXnH7rDWLvC+
	9KRsMsav2qfGKY+9YX9a/hBUvihY9EmYhpewos4/mbFJePfM8lQztGjtFA4rvJS7wcEq
	Xf/8rsfDrsti/HbV7QfOJSVTP2ukG37rWeLldwL7CRhIcG3EixxeEtqpuo3B8fgpslZU
	B50mZUeYqzc5QtOEO66qD+eAmxfcJNs8tBMfBh0RCb9aQjjzviXRVwHBn/+EuuwwYyhj
	5+eQ6pxLHH+TTle84eRvwUtS8cbwArnWr2tXK0vzUY2GL06AsZqVsUAhmC9IR+iDOuDG
	DI0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
	:date:message-id:subject:to:cc:content-transfer-encoding;
	bh=EXu/9tEJu/De1gzTHi/UfnihXeddWAKEZgcrXucSPjs=;
	b=cRyyT5jylGyFmxZRTQuej9NQL8Dh+MGC6QtT7Sg0x1YQWzVXVepmiKR6hNDhUfGCPX
	AoWngZrkmW8mSRQ/LBHZPBFwM4URL0CPdecgZDjCflJQzCWkK0AIVdyOdhzI0vNJDZ0Y
	F5pqzLDNb9z2Guz6gNF3pxBB//LS25G0oBq/yjaKDFRVZLpsoDzVWaOhfA/w45SZK7qs
	SLolNbfpwfmNtFqUerZpXbJHPmd65hPQYB7YPPrKVJJqiLBMzXGl8Vyw5wGUTVYxdZHg
	lTLXU6PyVzdCEkfyoBCvV822KPU7uOzOTlUhdjEz/mA3B4jb4DvOZJRLR6+jbUfQVFy1
	4RZA==
X-Gm-Message-State: AKwxytfpuNtzhVIIQwrkJKmVV/MEwErrZdtbzpGCXywH3o0HjWDOC9V9
	gXjiWGT5NApSF+DNMqZgsQmeO8XTveo2jkZrTYk=
X-Received: by 10.25.209.139 with SMTP id i133mr14531281lfg.137.1516299730818; 
	Thu, 18 Jan 2018 10:22:10 -0800 (PST)
MIME-Version: 1.0
Received: by 10.46.0.86 with HTTP; Thu, 18 Jan 2018 10:21:40 -0800 (PST)
In-Reply-To: <20180108154303.6522-32-f4bug@amsat.org>
References: <20180108154303.6522-1-f4bug@amsat.org>
	<20180108154303.6522-32-f4bug@amsat.org>
From: Alistair Francis <alistair.francis@xilinx.com>
Date: Thu, 18 Jan 2018 10:21:40 -0800
X-Google-Sender-Auth: TnSOhsYRt2s6YvXNzCAF8qDzD9E
Message-ID: <CAKmqyKMMN2ted8N4a6a8cM9Z4t0fQ--_nNCqjEZTR4Ck-3z=5A@mail.gmail.com>
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4010:c07::241
Subject: Re: [Qemu-devel] [PATCH v5 31/31] sdhci: add Spec v4.2 register
 definitions
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: "Edgar E . Iglesias" <edgar.iglesias@xilinx.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Prasad J Pandit <pjp@fedoraproject.org>,
	=?UTF-8?Q?Gr=C3=A9gory_Estrade?= <gregory.estrade@gmail.com>,
	Andrey Smirnov <andrew.smirnov@gmail.com>,
	Peter Crosthwaite <crosthwaite.peter@gmail.com>,
	"qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Alistair Francis <alistair.francis@xilinx.com>,
	Sai Pavan Boddu <saipava@xilinx.com>,
	Igor Mitsyanko <i.mitsyanko@gmail.com>, qemu-arm <qemu-arm@nongnu.org>,
	Clement Deschamps <clement.deschamps@antfield.fr>,
	Andrew Baumann <Andrew.Baumann@microsoft.com>,
	Jean-Christophe Dubois <jcd@tribudubois.net>,
	Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Vmixp5JS7eKp

On Mon, Jan 8, 2018 at 7:43 AM, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.or=
g> wrote:
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>

Acked-by: Alistair Francis <alistair.francis@xilinx.com>

Alistair

> ---
>  hw/sd/sdhci-internal.h | 8 ++++++++
>  1 file changed, 8 insertions(+)
>
> diff --git a/hw/sd/sdhci-internal.h b/hw/sd/sdhci-internal.h
> index 1da91a27b4..8193aa1821 100644
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
