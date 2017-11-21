Received: by 10.223.159.82 with SMTP id f18csp1007485wrg;
        Tue, 21 Nov 2017 10:23:40 -0800 (PST)
X-Google-Smtp-Source: AGs4zMYZqWTK2q3AypdCltGGcV0pEQMM3ax5BnZsHzkLI5MQ/3JZ2hlerS3jZk3z8vIAc8NAEFfv
X-Received: by 10.129.9.135 with SMTP id 129mr11616718ywj.127.1511288620787;
        Tue, 21 Nov 2017 10:23:40 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1511288620; cv=none;
        d=google.com; s=arc-20160816;
        b=z/cKEUE71pYeJu/MSkJOZrnGQOK5QSc3UigQx/PwMUVc7cbvWNLyNOOk3JDuvflF14
         bd/2GT7JfFwTUmlycntsoSLJEg7a1zNo2Bg9vfe9LjFnPlpuMKyURa7WMjM/k/sZUTVh
         /svf9dds9piSjOa4ByYD6lxXvf0yQ6splB39saRcs8tIrHCEKsbpnSrYQpk4LByWAT/S
         ap6cNWlH17q1mxX5rq3jwALp7iBabvGux7aepUSJLxv9fmEGGcqTMkSo4XVbMsMrKFFU
         tW1VGsYjLaAoLUtR0OjYpwgvttYTRmhtAkjCWA0oYdGjTGD3nS43FdJ0w7cLUFZ61CLK
         2s2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:to:message-id:date:from:references
         :in-reply-to:mime-version:dkim-signature:arc-authentication-results;
        bh=PDPCnwTSapPHtUAxn9zY83K8gbn+4LUKnfvZboHlf2k=;
        b=r/bm4Yb/P6E+Y7rSu5QeMq7R3cbmOz4MA1nM7IjomJnSRux1wnWhGZpMwDUu4IzJ/v
         aln8JEtnHsc6vYRxrF2yGK9yFoyiboMYP3NwH1kqq0XZjktHEx+k89T2yiHzhUmclpS4
         5QZfjJy6Oi/QN1v1j5irg+/5rmPlJtkT+VDEVuBguaHIzwEn52Z3wSvIPe315ufUTJ0R
         ZkSJry/YY4Mk5jPwwswHoBfmnaOEFp1KvFxKJiLWXZgou+Kkri2c72QMu65CRSm7GJxt
         m4pfnjoekimnk44VciQ5hduSrVId5e9W5snWkT4S5R0huoYzx5GYoDySllAYUHKIlMah
         Zg/g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=dutKfcRb;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id i74si3016671ywe.273.2017.11.21.10.23.40
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 21 Nov 2017 10:23:40 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=dutKfcRb;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:35953 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eHDCu-0001JT-9L
	for alex.bennee@linaro.org; Tue, 21 Nov 2017 13:23:40 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53019)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1eHDA2-0007hG-CD
	for qemu-arm@nongnu.org; Tue, 21 Nov 2017 13:20:43 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1eHDA1-0003yO-Ha
	for qemu-arm@nongnu.org; Tue, 21 Nov 2017 13:20:42 -0500
Received: from mail-ot0-x22f.google.com ([2607:f8b0:4003:c0f::22f]:42748)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1eHDA1-0003y3-CD
	for qemu-arm@nongnu.org; Tue, 21 Nov 2017 13:20:41 -0500
Received: by mail-ot0-x22f.google.com with SMTP id 18so11333983oty.9
	for <qemu-arm@nongnu.org>; Tue, 21 Nov 2017 10:20:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=PDPCnwTSapPHtUAxn9zY83K8gbn+4LUKnfvZboHlf2k=;
	b=dutKfcRbqkSZAvrP4GIijcZ0YQztT/Gfijn3rH+fVCCvrwMoOeByhQxeNggO4nc47q
	7mpuCeoWZqG8XucdzOp4mjujHVlUgaqwNInwordkUnHlorsskmkadoDCee5zuikOTc5e
	3f3gqk3JOksThblJO53sYhGsIvAuVDQMekyjM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=PDPCnwTSapPHtUAxn9zY83K8gbn+4LUKnfvZboHlf2k=;
	b=XVDwgX1e8kXklEtPAUiu6YRdAcgZGkvI/BNjdCYDK6WziBe0xJOi2rI9J3yaD5rEk2
	ORm0rg0ZvvaG2JyLmtQd/kW1c5YfVenwVl8Y0PHBjrvPpSfh0LMd5ML4M+H/9OqOsX44
	eox3xqW46VU2j78F3Sw1rIv5kweliod/cKHdOLNpWzAofVlecu+WU3JyWcglBhT/I4GP
	+tdAbvsuK0sWS79Y4DMc5pd+ZFmXTHayYo8RU0ZYbDymBQineyVdTTLPa9zNeg5He5MZ
	MNcdEs5IQz0AoT9ZpzBSc21RrHS8Ghh7w7ldLlU3VwgPsI2/MvM2hfHawpQt93pLGrhY
	+jmg==
X-Gm-Message-State: AJaThX4n++QeMUZIu7KUY8IyLB5Z3ZR2gUaPnCMYJhsc+GCtz8LPgW6b
	JOeZs1R4PNARz5DKhDSDUksgJAV8l4WZypKstu+Fow==
X-Received: by 10.157.37.61 with SMTP id k58mr11598167otb.110.1511288440757;
	Tue, 21 Nov 2017 10:20:40 -0800 (PST)
MIME-Version: 1.0
Received: by 10.157.63.74 with HTTP; Tue, 21 Nov 2017 10:20:20 -0800 (PST)
In-Reply-To: <20171106154813.19936-20-andrew.smirnov@gmail.com>
References: <20171106154813.19936-1-andrew.smirnov@gmail.com>
	<20171106154813.19936-20-andrew.smirnov@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 21 Nov 2017 18:20:20 +0000
Message-ID: <CAFEAcA_Ug=6cYD0VD93CorVt+rv_u4WWsa_Gk3k+c18G07bDRg@mail.gmail.com>
To: Andrey Smirnov <andrew.smirnov@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c0f::22f
Subject: Re: [Qemu-arm] [PATCH v3 19/30] i.MX: Add code to emulate SDMA IP
 block
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
X-TUID: KlPeN94MHblP

On 6 November 2017 at 15:48, Andrey Smirnov <andrew.smirnov@gmail.com> wrot=
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
>  hw/dma/Makefile.objs      |  1 +
>  hw/dma/imx_sdma.c         | 99 +++++++++++++++++++++++++++++++++++++++++=
++++++
>  include/hw/dma/imx_sdma.h | 22 +++++++++++
>  3 files changed, 122 insertions(+)
>  create mode 100644 hw/dma/imx_sdma.c
>  create mode 100644 include/hw/dma/imx_sdma.h
>

Does Linux really insist on reads-as-written behaviour?
(ie can you get away with just using
create_unimplemented_device() ?)

thanks
-- PMM
