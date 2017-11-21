Received: by 10.223.159.82 with SMTP id f18csp992229wrg;
        Tue, 21 Nov 2017 10:09:24 -0800 (PST)
X-Google-Smtp-Source: AGs4zMaZy2NyDSiYsUt+LGKvq9G3Usu0tUYxL9gJ8i07ZU6vUKIBcr+q1gZDwO5SuScSaX/3hK7S
X-Received: by 10.129.78.137 with SMTP id c131mr11567992ywb.212.1511287764114;
        Tue, 21 Nov 2017 10:09:24 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1511287764; cv=none;
        d=google.com; s=arc-20160816;
        b=xLBOQehyTnkjg6VJAVpnRFLn1Sac2nRd5axVloVjrM8dJKFqfsKxAwu8W8lzxlAb+V
         Vyu2GHUyDRoCqTkjDdyRn3XBupJRryEBOOQ8v+eZZnwpnldkOPbQu2NZ7+WmBmrQ4diV
         RY+7YXTuM9GL1duWqM3HDprLKCrh2+/Gp1wJs6s8oG+PfQ+ZdYJLSeMPZO0rjaKdLSIu
         Eli2trw4xCk8QvnrigD0LzpWi+XVbkawfGluEbaQVde6HsrrUEiAc7BrBFBIUFVvAYFT
         0e9jfUd40qeMhLpBrvwvhIrhvHDwUcg+OeXJaqPqwu1N5XZxUmnK2t8LqUi/Hrae+tz2
         2rsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:to:message-id:date:from:references
         :in-reply-to:mime-version:dkim-signature:arc-authentication-results;
        bh=nmQwou3VvaIRIPXAIt4Bfnq1fuRLZ/SlKgrVrpwGhJE=;
        b=zJQlMB3ADxQZlpwb5/mUgfu94GuEP5HdMAsXK4fvnKGC195P65jxAdjDONIrPBl8oK
         VoJTSMf3xwcnChpPG8UkewuwlDtxOtolMj0E16DPF8xZVEp9rCJEMbzsZ4+Qg1a8skLs
         2v85XhyOEEgX8JvuApVOrXrzjQROrmnejEOVO4OoISfL/soF3wKl3nURy+R4VodbvQgu
         o2d5oODewrIGxlYxiCWnlQeIomlFsyk0voUHR35eMsrrvL2ZCAieSHS2JWAkD0+ab8KY
         dUs+2NVZTkeT1W8bXlhCGqY39ROlFpT4mSzlYIVGr+cyK2B0N34I77n3jX581goUV/tM
         IEZg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Faae9rFS;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id y68si2852318ybf.98.2017.11.21.10.09.23
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 21 Nov 2017 10:09:24 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Faae9rFS;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:35881 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eHCz5-0000jV-Iv
	for alex.bennee@linaro.org; Tue, 21 Nov 2017 13:09:23 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48777)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1eHCyy-0000j9-Cu
	for qemu-arm@nongnu.org; Tue, 21 Nov 2017 13:09:17 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1eHCyx-0008QC-GY
	for qemu-arm@nongnu.org; Tue, 21 Nov 2017 13:09:16 -0500
Received: from mail-ot0-x242.google.com ([2607:f8b0:4003:c0f::242]:45159)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1eHCyx-0008Pw-Bq
	for qemu-arm@nongnu.org; Tue, 21 Nov 2017 13:09:15 -0500
Received: by mail-ot0-x242.google.com with SMTP id u10so11296357otc.12
	for <qemu-arm@nongnu.org>; Tue, 21 Nov 2017 10:09:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=nmQwou3VvaIRIPXAIt4Bfnq1fuRLZ/SlKgrVrpwGhJE=;
	b=Faae9rFSgMWFdZmv66Nx01f2Hl68Py/f6c96Nw2ZY0ybB1BKr0C01NRnsTERR5sfUb
	vTJtRGEq8QSxgcFEtQM9j9DMp1HqbLyjitDDR9i1+2fGfad3iSMDPmLdWS56ouib9EJy
	C6g1C7hK+QNw8xQXXe1Jis5Qx6Kmxg1KMXbUQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=nmQwou3VvaIRIPXAIt4Bfnq1fuRLZ/SlKgrVrpwGhJE=;
	b=Nyjv0evghvXK2VInEaNEgrlIHYyzn9SqWsq0Wm5mYh4J4b76suiSi7qrV10pLLCWv0
	7PBv2gH4e3Wv0HiNdgSsba2AO2UH8igtlj6wTZPAiDvBPlQ1pUdCHE9mBQjESO22QOzw
	fdGW3I1Qrj8QrTno6Bt4DZAPm2o0iNPNkqIYKBntYp1cvEGUBBPQUDY2QueKTfrybFLH
	BYa9Z9goJ94Svpz+eU8ALbWNpyhPXe9YDmwNJXhMUNsye0ZKVlTOFxUCxWT8WBRl73SY
	ouvMV1MjLYlmPisChDJqlE7oGoGm7bQd7RulmYwqjRVPjYOJhwDuDu9G4wGYoQXI9cZX
	PHSg==
X-Gm-Message-State: AJaThX5p5BQOOXb62lj5tQzzxQC8IR4gLApMj9EbCOhCdhwSmDR1ckWf
	oXMUO8OB5w7dBQdBX9LZ0/ha5RIaUIard40VAQpjxw==
X-Received: by 10.157.37.173 with SMTP id q42mr11058530ota.116.1511287754625; 
	Tue, 21 Nov 2017 10:09:14 -0800 (PST)
MIME-Version: 1.0
Received: by 10.157.63.74 with HTTP; Tue, 21 Nov 2017 10:08:54 -0800 (PST)
In-Reply-To: <20171106154813.19936-14-andrew.smirnov@gmail.com>
References: <20171106154813.19936-1-andrew.smirnov@gmail.com>
	<20171106154813.19936-14-andrew.smirnov@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 21 Nov 2017 18:08:54 +0000
Message-ID: <CAFEAcA-NHA1Pya+p659F3ZWXvcwbA3SRJTb1tPzzqW2mzytSxw@mail.gmail.com>
To: Andrey Smirnov <andrew.smirnov@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c0f::242
Subject: Re: [Qemu-arm] [PATCH v3 13/30] i.MX: Add code to emulate i.MX7 CCM,
 PMU and ANALOG IP blocks
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
Cc: Jason Wang <jasowang@redhat.com>, qemu-arm <qemu-arm@nongnu.org>,
	=?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
	Andrey Yurovsky <yurovsky@gmail.com>,
	QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: tvKr/Vk81t6h

On 6 November 2017 at 15:47, Andrey Smirnov <andrew.smirnov@gmail.com> wrot=
e:
> Add minimal code needed to allow upstream Linux guest to boot.
>
> Cc: Peter Maydell <peter.maydell@linaro.org>
> Cc: Jason Wang <jasowang@redhat.com>
> Cc: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> Cc: qemu-devel@nongnu.org
> Cc: qemu-arm@nongnu.org
> Cc: yurovsky@gmail.com
> Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>
> ---
>  hw/misc/Makefile.objs      |   1 +
>  hw/misc/imx7_ccm.c         | 233 +++++++++++++++++++++++++++++++++++++++=
++++++
>  include/hw/misc/imx7_ccm.h | 130 +++++++++++++++++++++++++
>  3 files changed, 364 insertions(+)
>  create mode 100644 hw/misc/imx7_ccm.c
>  create mode 100644 include/hw/misc/imx7_ccm.h
>
> diff --git a/hw/misc/Makefile.objs b/hw/misc/Makefile.objs
> index 29fb922cef..ac1be05a03 100644
> --- a/hw/misc/Makefile.objs
> +++ b/hw/misc/Makefile.objs
> @@ -34,6 +34,7 @@ obj-$(CONFIG_IMX) +=3D imx31_ccm.o
>  obj-$(CONFIG_IMX) +=3D imx25_ccm.o
>  obj-$(CONFIG_IMX) +=3D imx6_ccm.o
>  obj-$(CONFIG_IMX) +=3D imx6_src.o
> +obj-$(CONFIG_IMX) +=3D imx7_ccm.o
>  obj-$(CONFIG_MILKYMIST) +=3D milkymist-hpdmc.o
>  obj-$(CONFIG_MILKYMIST) +=3D milkymist-pfpu.o
>  obj-$(CONFIG_MAINSTONE) +=3D mst_fpga.o
> diff --git a/hw/misc/imx7_ccm.c b/hw/misc/imx7_ccm.c
> new file mode 100644
> index 0000000000..2876164cfa
> --- /dev/null
> +++ b/hw/misc/imx7_ccm.c
> @@ -0,0 +1,233 @@
> +/*
> + * Copyright (c) 2017, Impinj, Inc.
> + *
> + * i.MX7 CCM, PMU and ANALOG IP blocks emulation code

Should these really all be in one single device rather
than one device per IP block ?

thanks
-- PMM
