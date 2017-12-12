Received: by 10.223.159.74 with SMTP id f10csp4087174wrg;
        Tue, 12 Dec 2017 09:33:32 -0800 (PST)
X-Google-Smtp-Source: ACJfBotvU5dF4ncCPXGty8LIzVfWpVLspfLYfkhugMMPbIL2+px5IC9jB8U3P7O6KekUkZVMEC1l
X-Received: by 10.37.40.3 with SMTP id o3mr3619034ybo.244.1513100012888;
        Tue, 12 Dec 2017 09:33:32 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1513100012; cv=none;
        d=google.com; s=arc-20160816;
        b=QklH/qg75d8yBrE9xubSSfbaEQKyG4eCX30z0QA9FNI2ny+yWSipFts1M3LWKrVZ5o
         vE9xOXeNZw8O353JJN9Ij4KAtOHyHE4x6LQT9ldVd3Mya1WNNVgc+nPIRNUGE6kwFI93
         WaE5jcyNynIgALEDP38fWDH4IeR8i4vpyEcXkqSYSYV1fTf4HpSItSWapQFoblYa2kym
         7/BZXykYMaITathCAAocd8oFwFSVvAerIDtBMoWWhQPWmYdcLe296wgzWaKG3xmSTFlQ
         FORnKkckWLFUnZlkRR/wG4jc9wMxkUkOWwvG106yzGBJftRPkIc+/gR4q+qtb4l8oWzA
         UW2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:to:message-id:date:from:references
         :in-reply-to:mime-version:dkim-signature:arc-authentication-results;
        bh=ORaCejUCvmDJ4sQccUHHJ15gHVSfTU9WVySPEq9+pYw=;
        b=fr8gBu0BSxSm4OWYyvOb2UvRA2wT0r9PrgTH8DOQq3gtXsIcsWPgaS1escpe16rI2/
         W6KI0U+Xq/Rcg2pXf9tTDeOwaH48ImLtlrBSDocAmynq8LlhCQpAC9yGb2kHZGxiT888
         mj1EWOiFY04K+9NmNvcXw/Jz9aGVRfk/p1KxSGXCDgzci7OTdXGvKwGl2NekKcpUE1M+
         nIVoZOq0IQCAsOWw33Q4goju54uYjQQvEwuDJlcGJskXNsjyBUBqbrJrcOGfvjqy5jGJ
         RyKWN5ElWLh8EkVSn7M+vWGgf7HgCCKAejDPPB5mFKl96jDenJ9qv86eYglIwFjpftz/
         pj+A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Gp5Io2cw;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id i204si3498671ybb.29.2017.12.12.09.33.32
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 12 Dec 2017 09:33:32 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Gp5Io2cw;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:59715 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eOoQu-0000Lc-9x
	for alex.bennee@linaro.org; Tue, 12 Dec 2017 12:33:32 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56030)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1eOoQg-0000JM-VA
	for qemu-arm@nongnu.org; Tue, 12 Dec 2017 12:33:19 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1eOoQg-0003B5-5w
	for qemu-arm@nongnu.org; Tue, 12 Dec 2017 12:33:18 -0500
Received: from mail-ot0-x236.google.com ([2607:f8b0:4003:c0f::236]:38797)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1eOoQg-0003Aq-0u
	for qemu-arm@nongnu.org; Tue, 12 Dec 2017 12:33:18 -0500
Received: by mail-ot0-x236.google.com with SMTP id p3so18463166oti.5
	for <qemu-arm@nongnu.org>; Tue, 12 Dec 2017 09:33:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=ORaCejUCvmDJ4sQccUHHJ15gHVSfTU9WVySPEq9+pYw=;
	b=Gp5Io2cw4gp0jJN/TKIY6fhr021ssxe9IZpobq/AbNGijwT53mWmq6xo86+RUw/jbq
	+TplN1IOM1Vnr9szVR8oUyDekVqFIJTR65043mqIZQWk8bpTgHdGqobCTudv3bqMZBQB
	Z4w7NPahqDnbiUvAs6CTjCrSLMXo5kFXqK64o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=ORaCejUCvmDJ4sQccUHHJ15gHVSfTU9WVySPEq9+pYw=;
	b=b6v4bHzhsH8ksD9Db9LAT3Yr8txPTVxzp5Xu8mGc/o2FHnSwHjMvFKAST3bYAgToaJ
	x/Nzk+vNalr8w1TDHcGIteFlJYeph6UgKk/46VaXAWi82dyJrXpyDJHECaOM4z1XbwY9
	/Ak1kg6X9rR8109LUn7F7rPDJ5T9H1hPpIaDxW99Yf7PG/7W0avwOV6iLh+daSlVKQTB
	PBgcP3oMiHRuO+nUS3KTMZv7iyCXe9/eW3UGr/Emk8siyQupNEfa8xJpQxbD6N8gf36f
	QbbwLr9Fn84bXlSSR3Bnwuc8Rr/6cNh7wVOPlaIaCqjyqkiTYvibHIOQD0zS5CzuQajG
	MrwA==
X-Gm-Message-State: AKGB3mLN3z6o7Ywb9N4x5G/s3TS2cI653baX7rXCFxr+bv1g3fyv6Ya/
	r4qNob77BMBu3thNm3I7/bNXF7t4EBFZpZwVpWXsyg==
X-Received: by 10.157.37.173 with SMTP id q42mr3909432ota.116.1513099997347;
	Tue, 12 Dec 2017 09:33:17 -0800 (PST)
MIME-Version: 1.0
Received: by 10.157.63.74 with HTTP; Tue, 12 Dec 2017 09:32:56 -0800 (PST)
In-Reply-To: <20171211213007.7353-12-andrew.smirnov@gmail.com>
References: <20171211213007.7353-1-andrew.smirnov@gmail.com>
	<20171211213007.7353-12-andrew.smirnov@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 12 Dec 2017 17:32:56 +0000
Message-ID: <CAFEAcA_+o0KsdBMBzEC86xqi6YpRgUC=DdLftThj0ZRP60JnFg@mail.gmail.com>
To: Andrey Smirnov <andrew.smirnov@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c0f::236
Subject: Re: [Qemu-arm] [PATCH 11/13] imx_fec: Reserve full
 FSL_IMX25_FEC_SIZE page for the register file
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
X-TUID: HKV4ZkpXRGS5

On 11 December 2017 at 21:30, Andrey Smirnov <andrew.smirnov@gmail.com> wro=
te:
> Some i.MX SoCs (e.g. i.MX7) have FEC registers going as far as offset
> 0x614, so to avoid getting aborts when accessing those on QEMU, extend
> the register file to cover FSL_IMX25_FEC_SIZE(16K) of address space
> instead of just 1K.
>
> Cc: Peter Maydell <peter.maydell@linaro.org>
> Cc: Jason Wang <jasowang@redhat.com>
> Cc: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> Cc: qemu-devel@nongnu.org
> Cc: qemu-arm@nongnu.org
> Cc: yurovsky@gmail.com
> Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
