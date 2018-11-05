Received: by 2002:adf:a111:0:0:0:0:0 with SMTP id o17-v6csp2886062wro;
        Mon, 5 Nov 2018 09:58:14 -0800 (PST)
X-Google-Smtp-Source: AJdET5fRiTnPK1309zbvlKGSmzumobNZdqFfeF7EDJpCLzZmue0tI+ZQD/5d4dkfGlUMToTTLaEf
X-Received: by 2002:aed:2a64:: with SMTP id k33mr10895600qtf.102.1541440694413;
        Mon, 05 Nov 2018 09:58:14 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1541440694; cv=none;
        d=google.com; s=arc-20160816;
        b=hwtad5yx9PJBPjpA/6O5jt4Dn+XYCZGdejfaCrT1YJUEnap01PHqLvFEzfzqxDQbkF
         hgicD7eNK50ibUGjaHVH9USyMPVxOVsBGh29moWdAekEJWeyipd/A1LMnU5yZdo8ipGK
         V2kxJ86EIA4+06tGaBC+/Oh68O1rFq5zQrDozdmp12/6/TP9yGTaIQzcptPuX7ZoUssQ
         IdKwuU4z0qubQtQJofrcBlt3sTrOSuacSr2iUX7zsqbARIUCD4osIl/czb/IMQfHjxIj
         mhOuWmRZJI8/mZ8SkO01MY+e2hycaKqRj2PZzwGagx1Mv22WyMhhnAOid4ayjOWa0thH
         OD0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature;
        bh=yfjEgnj7WPeyf+Xu9fH22GW8f5lAu1kQ0pLpTl2vtrY=;
        b=yteRKh4eTihZvwNst3YE+y3+8YZINmgqIpbIJ+myLFiLOl75TCCHhKTvaKpls+Dlih
         3aiOIueFlWeqOKJiPSGQokl8qNCFj8R9/HZnjGcTi0xtVxGa38PLkWVjRoMamoNzgDgr
         LxCXZrb+cZ1VeMPcTegMx6JoiKNzpKjKf6JHy6ZMm0WctkfMnvc3R/JMVIvgi1K8fOKH
         2iistfNS+g1J4fqdhSp05+2SgKtq2kyBBUR2XG0IS97IOhR7WeYu5uiSjjrpU7A6vzaM
         bAYuVMguz54gZQMkGfov+j1L2CUETYqUUWiVJ1zfAjV3mXRNpKqTrRc6DT/xAOH2gGFM
         fmUg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=eky9LbUV;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 4-v6si4386163qtb.309.2018.11.05.09.58.14
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 05 Nov 2018 09:58:14 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=eky9LbUV;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:36797 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gJj8f-0003Qs-VA
	for alex.bennee@linaro.org; Mon, 05 Nov 2018 12:58:14 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54731)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1gJj8V-0003Ky-8a
	for qemu-arm@nongnu.org; Mon, 05 Nov 2018 12:58:04 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1gJj8U-0001WL-9i
	for qemu-arm@nongnu.org; Mon, 05 Nov 2018 12:58:03 -0500
Received: from mail-oi1-x244.google.com ([2607:f8b0:4864:20::244]:44200)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1gJj8S-0001TM-Ck
	for qemu-arm@nongnu.org; Mon, 05 Nov 2018 12:58:02 -0500
Received: by mail-oi1-x244.google.com with SMTP id k19-v6so8249473oic.11
	for <qemu-arm@nongnu.org>; Mon, 05 Nov 2018 09:57:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=yfjEgnj7WPeyf+Xu9fH22GW8f5lAu1kQ0pLpTl2vtrY=;
	b=eky9LbUViSB2jdzkxRuLJzPgAyS5pUrLkoziWddsFkW4JjOnoHT4CVZUE+Roh2TpHW
	TuxNCB45cTKpvAXsYgRVKIb/KfQJlV5EudJ2JjtAxj1mxognwmpWv1wI/zzxagnd1lsC
	2JD/cct5tZvskPJG32K47/rC9puwJf2swwixk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=yfjEgnj7WPeyf+Xu9fH22GW8f5lAu1kQ0pLpTl2vtrY=;
	b=NSTh9d0IWtyTJTrJ1agnCWEHsEQXNVmk4JWLC7JpyfpN2/9dJwv/g11EYn8O7V0yDH
	1v3yyOio9VVrO3VzeHY9t+7NrgmYQFZU3i9wvTjHynsH5Yp00REbNYjFitlwFqRMH06M
	WP2wzqi+6w7eB8gIkGjL6Zlyib6rPuzoVH0kdZdOWSiocyNC/ZVwYngJ0ipuVIG9cUNp
	BGl6xxGnu3eDeR6qNAt1op06xLWZo+b9T4W1rk2Kyp2ev6ZPIannDFk1yf8+S8kjPrxT
	4PeD6Tx/z+4rK4XZqOx9SpbZI+YOmCQb54JJTCVQNWjKhburnHnQVZkVZt5JLQVdrf7d
	6G6Q==
X-Gm-Message-State: AGRZ1gKwGWSq9g+4kESTld6eckcKhktcwE7+ayjMyhZvdgw8ohPfFPgv
	Ruv3GAFhmjWYgzAfgDWy4X7QdaIwaxZG0z0qRedFZml7qSg=
X-Received: by 2002:aca:ef56:: with SMTP id
	n83-v6mr12683965oih.146.1541440679134; 
	Mon, 05 Nov 2018 09:57:59 -0800 (PST)
MIME-Version: 1.0
Received: by 2002:a9d:4b0e:0:0:0:0:0 with HTTP;
	Mon, 5 Nov 2018 09:57:38 -0800 (PST)
In-Reply-To: <MWHPR21MB018970A4F8FA0E42B5DD48229ECA0@MWHPR21MB0189.namprd21.prod.outlook.com>
References: <20181102001303.32640-1-f4bug@amsat.org>
	<20181102001303.32640-2-f4bug@amsat.org>
	<CAFEAcA-DZMivo-epUmM6NxPzCUbGCfSU+SxEjszTNLdVaB8UxQ@mail.gmail.com>
	<MWHPR21MB018970A4F8FA0E42B5DD48229ECA0@MWHPR21MB0189.namprd21.prod.outlook.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 5 Nov 2018 17:57:38 +0000
Message-ID: <CAFEAcA-=Y80ZgFOJfVzCxqjaJvG1yO5aBR7efX4OGtOKSXeq2w@mail.gmail.com>
To: Andrew Baumann <Andrew.Baumann@microsoft.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::244
Subject: Re: [Qemu-arm] [PATCH for 3.1 v2 1/7] MAINTAINERS: Add an entry for
 the Raspberry Pi machines
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
Cc: qemu-arm <qemu-arm@nongnu.org>,
	=?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
	Guenter Roeck <linux@roeck-us.net>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: fH6fYBI9Dgea

On 5 November 2018 at 17:06, Andrew Baumann
<Andrew.Baumann@microsoft.com> wrote:
> From: Peter Maydell <peter.maydell@linaro.org>
>> Andrew, as the original submitter of the Raspberry Pi code would you like to
>> be listed as a maintainer for it?
>
> Thanks for asking; probably not -- I'm happy to review the odd patch
> if my input would be helpful, but I haven't worked on it for years,
> and I don't have spare cycles, so I'd just be a bottleneck.

Sure, no problem. Would you like to be listed as a "reviewer"
(means people will CC you on patches, basically), or not at all?

We could maybe downgrade it to Orphan from Odd Fixes, unless
Philippe wants to volunteer as an "odd fixes" maintainer...

thanks
-- PMM
