Received: by 2002:adf:e804:0:0:0:0:0 with SMTP id o4csp3535098wrm;
        Mon, 7 Oct 2019 02:00:01 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzmG1Fzl+Wc362Jcna+FQEYgefrRm6kcD5oGiX2aK0m46WGx55CrfnraPMyYVWAO97iPvfI
X-Received: by 2002:ac8:21dc:: with SMTP id 28mr28281551qtz.102.1570438801039;
        Mon, 07 Oct 2019 02:00:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1570438801; cv=none;
        d=google.com; s=arc-20160816;
        b=gLz/C2gY+PZopVQvVowip+FiHmkwMwFLbmNLabpfdPDNDuO+pFRMgKiLaAsRps5j2R
         p/5ujMUWR9Ng9x7MxeYqSeGYZvDJixk9I4ebDmT/bVa3zK6LqM67h7eMWyrg+VVtPyO+
         SS5Uti0TLrkddZaGYxjj6tMXRM9TB8bOxIEuE56k3ARlgH3qDjqLxQQgNArN0ljHGLXz
         2LC6OYXe1K8mjNHNZhgxOS7Yj5ahFvXKaDWDNbACGTmVV9/NyG2socaZjMGNV1eojE5H
         l2oBAN6toAwf6VlB8pvudk4kDxihMLngQVANXnFvjHPOwPVHHAXTa2+v/MB11nGyMTAh
         2OvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:user-agent:in-reply-to
         :content-transfer-encoding:content-disposition:mime-version
         :references:message-id:subject:to:from:date;
        bh=utwvcIpWoCf4fLYtGad1B4OrN11KTAkB3AP1bTyt7PQ=;
        b=WBrt1ec8L76N34JiOO7I+fIr/Rhs/vYCfB1fHqC1PYxNSxYAR7CidDUmq17vi95zJD
         DIxONqM3IWdKhWaHTy42AGPR2qgorq3nI6a3i5EYVfopI0oa3+T3EoE5y5puDXa4X98g
         ZZpaAA7s9V1sR4OI4WfGNzRp/Z+6w5IqI1VG+4MKZOzepVnwz1+dxtzksdzOhR2xbeBf
         2G6HNc76B8yBED/wPskQMx9RuHeq1ei9MOKWxwRSJmKgx+8sC6Hj+RuFdl7PEbk4Bwyl
         Y5lS4ubYOaOsdLmgbQ8sgLXbdy9I1dDYkqJVwtx8ppjDRTCZVrmZTfPvC4E0UrAM9bD0
         nPUg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=kernel.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a24si12487508qka.71.2019.10.07.02.00.00
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 07 Oct 2019 02:00:01 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=kernel.org
Received: from localhost ([::1]:41882 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iHOs3-0007v2-De
	for alex.bennee@linaro.org; Mon, 07 Oct 2019 04:59:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51303)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <k.kozlowski.k@gmail.com>) id 1iHOrj-0007uC-OQ
 for qemu-arm@nongnu.org; Mon, 07 Oct 2019 04:59:40 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <k.kozlowski.k@gmail.com>) id 1iHOri-00038k-KO
 for qemu-arm@nongnu.org; Mon, 07 Oct 2019 04:59:39 -0400
Received: from mail-wr1-f68.google.com ([209.85.221.68]:43265)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <k.kozlowski.k@gmail.com>)
 id 1iHOrf-00037g-Pp; Mon, 07 Oct 2019 04:59:35 -0400
Received: by mail-wr1-f68.google.com with SMTP id j18so13427340wrq.10;
 Mon, 07 Oct 2019 01:59:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=utwvcIpWoCf4fLYtGad1B4OrN11KTAkB3AP1bTyt7PQ=;
 b=HOmrljLX8QaJ3gZlRUZ2IzOeRa66JbzbLaZonyzIKoVdsYSnzybVjf3+qXi1fX8CaV
 seKZdZpWG6/9m5ySyqI7LEwOUlaxCkNnwTJTFwCC/UaQO4HkFb5qnskrkCOEuVwafecH
 YulAuEz+iG+dTB0uweq8ILDq5Rqi796/fmcmPASvjhiBDEiBVOfdHhtakXHz1l8aNTsD
 p0YlAQsIaXt/JoeoanXIFZbkJlogMOiW1DEyI21Ah7sDM4H1K0PZ0GaFUE/M4HfeL3UA
 waoj7WGb2OxUgLtK64DzekP1W1CLQDV5x6J1ommuNf+1gUppl5O+sk03Ne8UDU5Sc0BT
 2qyw==
X-Gm-Message-State: APjAAAXgzBEQ45IuESbHpvSogDGfydiyPPW7FCjSJACjvslCg+xT6ZmE
 1EKIFFknlsfV3K7QcAYZvwo=
X-Received: by 2002:a5d:5692:: with SMTP id f18mr23288468wrv.68.1570438774311; 
 Mon, 07 Oct 2019 01:59:34 -0700 (PDT)
Received: from pi3 ([194.230.155.145])
 by smtp.googlemail.com with ESMTPSA id r13sm24744576wrn.0.2019.10.07.01.59.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Oct 2019 01:59:33 -0700 (PDT)
Date: Mon, 7 Oct 2019 10:59:31 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: Re: [PATCH 3/5] hw/sd/sdhci: Add dummy Samsung SDHCI controller
Message-ID: <20191007085931.GA541@pi3>
References: <20191005154748.21718-1-f4bug@amsat.org>
 <20191005154748.21718-4-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20191005154748.21718-4-f4bug@amsat.org>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.85.221.68
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
Cc: =?utf-8?B?RnLDqWTDqXJpYw==?= Basse <contact@fredericb.info>,
 Peter Maydell <peter.maydell@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Evgeny Voevodin <e.voevodin@samsung.com>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Igor Mitsyanko <i.mitsyanko@gmail.com>, qemu-devel@nongnu.org,
 Jean-Christophe Dubois <jcd@tribudubois.net>, qemu-arm@nongnu.org,
 Dmitry Solodkiy <d.solodkiy@samsung.com>, Cleber Rosa <crosa@redhat.com>,
 Maksim Kozlov <m.kozlov@samsung.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Guenter Roeck <linux@roeck-us.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: U5nENhAFPYJU

On Sat, Oct 05, 2019 at 05:47:46PM +0200, Philippe Mathieu-Daud=C3=A9 wrote:
> The Linux kernel access few S3C-specific registers [1] to set some
> clock. We don't care about this part for device emulation [2]. Add
> a dummy device to properly ignore these accesses, so we can focus
> on the important registers missing.

The CONTROL2  has also few other settings, not clock related, but they
can be skipped as well.

Reviewed-by: Krzysztof Kozlowski <krzk@kernel.org>

Best regards,
Krzysztof

>=20
> [1] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tr=
ee/drivers/mmc/host/sdhci-s3c-regs.h?h=3Dcc014f3
> [2] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tr=
ee/drivers/mmc/host/sdhci-s3c.c?h=3Dv5.3#n263
>=20
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> ---
> Eventually we should add the ADMA changes Igor sent in this patch:
> https://patchwork.ozlabs.org/patch/181854/
> They might solve the boot timing issues when using SD cards.
> ---
>  hw/sd/sdhci.c         | 65 +++++++++++++++++++++++++++++++++++++++++++
>  include/hw/sd/sdhci.h |  2 ++
>  2 files changed, 67 insertions(+)
>=20
