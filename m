Received: by 2002:adf:e804:0:0:0:0:0 with SMTP id o4csp3536191wrm;
        Mon, 7 Oct 2019 02:00:59 -0700 (PDT)
X-Google-Smtp-Source: APXvYqytar9i+iPxxwx82on3kJ+2xczo+X51oZ6tDeMICHvCQcufuFh4FVIqVSXdXl7MHmmwtZ4z
X-Received: by 2002:a17:906:5c07:: with SMTP id e7mr22752863ejq.127.1570438858959;
        Mon, 07 Oct 2019 02:00:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1570438858; cv=none;
        d=google.com; s=arc-20160816;
        b=i68HutKGcnvYRkhBOB9qq2UvTs5WSHvgCSFW3pxK9narBycaWonH7nFpOBCFisDIFY
         fOp2zK8q2m8w/QB/HHiF+MdNY8E+6v3Dt4GKFmJ4waHtrXfzRHvwiZ7wYStLkvPBnuav
         F+Fdd6AcdI0FlpkwHYZ6fPtyLg/kn6ACTBkLgPBk/sADRasLe+gzYtvxNgbK0g+Xzq5q
         +POHZa1xrIlupt4J4Ohr1FuzWtsGjN0QPYG86wTIaA5T7K7HV2JkFIf0s5MD1q0KCenC
         ZoUQe0Y0yRf8ibJRy99JRXUw903ieGDnuNHY/YPAFC+rq3nDc8NalpSyu1hVEXWbNbHo
         y2Cg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:user-agent:in-reply-to
         :content-transfer-encoding:content-disposition:mime-version
         :references:message-id:subject:to:from:date;
        bh=2mpH4Ugy9/Oa6ReWsoDL+YtOjgGW70O4N98QRChpJ5I=;
        b=pOXezPOM5oTxWZejwEYYrLKiYY/ayxP9Eh8tPt/9fhNDkS/C46q/S5KdIVGN4aWeKK
         rSspP8WvjeE2b3Uar76Vjib10LT1uuoPdiPyO32jWkrizo81e9te7R01CdAV9rSrjrbu
         6CUK97CkCRRxnE4Y1ZSFqEdnLNbIcSHVlGqJIN5WoVw6yH7PB6IBO5L8JCfbNwZv4GjM
         c/7fY8INnHcxtDGhCF3RVwx24GJpizEih0bodRNMFrLgBi3BQHh97kxlZ5N6omg/M8Kt
         YCPFk37F67oVDZ+hs03nARzbDbvQ2pxDF0DpI1oTH+B6fCIorvLp38CWxTtOUU2jP0A+
         ovuA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=kernel.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id z5si8666623edk.157.2019.10.07.02.00.58
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 07 Oct 2019 02:00:58 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=kernel.org
Received: from localhost ([::1]:41898 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iHOsz-00008Y-Rn
	for alex.bennee@linaro.org; Mon, 07 Oct 2019 05:00:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51422)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <k.kozlowski.k@gmail.com>) id 1iHOsQ-0008RE-3w
 for qemu-arm@nongnu.org; Mon, 07 Oct 2019 05:00:26 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <k.kozlowski.k@gmail.com>) id 1iHOsP-0003sG-34
 for qemu-arm@nongnu.org; Mon, 07 Oct 2019 05:00:22 -0400
Received: from mail-wr1-f65.google.com ([209.85.221.65]:45027)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <k.kozlowski.k@gmail.com>)
 id 1iHOsI-0003pE-Sc; Mon, 07 Oct 2019 05:00:15 -0400
Received: by mail-wr1-f65.google.com with SMTP id z9so14190584wrl.11;
 Mon, 07 Oct 2019 02:00:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=2mpH4Ugy9/Oa6ReWsoDL+YtOjgGW70O4N98QRChpJ5I=;
 b=MhPoKHfCDGG3/fwNUEO+snGAAVGtzN9lcGtw3zQ2K/K5tzKI16NuUTrzAO2n4/LNfG
 bz+xpJTJY1uuV+8du6G6cmrMNEgKaqNZFf2un0LdJCdOsAGVS3WKi/d4GbLwKBko9HK0
 H1Y7EEJNQbraTRfpLy4GHGvmRZ5q92n8cTg7qdxPZkDkhR+alpoEcC+/ftAUXQfgQsHe
 mFST3X8HnLUg7WmjPhQWDDSnrjWgLyU1b0LI+QOd34mpI33Wye6eWI4lHzma6TcnF9j3
 AMm2VMBcfSiCnsXa3LLJJowCdOIXEOaIA/FBATi5/KV+M+NAKK3cj3K41OBNtsPA3ii3
 /K5Q==
X-Gm-Message-State: APjAAAWw9fUd4QbcgqiSschVp0hQyXZ/gHYY0dl/y1vKoFy7rhrIWTb/
 2qK0rLtdql3z5wLx3us/FtHQ7q/9K8s=
X-Received: by 2002:adf:97cb:: with SMTP id t11mr15560441wrb.312.1570438813748; 
 Mon, 07 Oct 2019 02:00:13 -0700 (PDT)
Received: from pi3 ([194.230.155.145])
 by smtp.googlemail.com with ESMTPSA id h14sm22824821wro.44.2019.10.07.02.00.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Oct 2019 02:00:13 -0700 (PDT)
Date: Mon, 7 Oct 2019 11:00:10 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: Re: [PATCH 4/5] hw/arm/exynos4210: Use the Samsung s3c SDHCI
 controller
Message-ID: <20191007090010.GB541@pi3>
References: <20191005154748.21718-1-f4bug@amsat.org>
 <20191005154748.21718-5-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20191005154748.21718-5-f4bug@amsat.org>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.85.221.65
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
X-TUID: 2POW2vEf6f9b

On Sat, Oct 05, 2019 at 05:47:47PM +0200, Philippe Mathieu-Daud=C3=A9 wrote:
> The Exynos SoC has specific SDHCI registers. Use the s3c SDHCI
> model which handle these specific registers.
>=20
> This silents the following "SDHC ... not implemented" warnings so
> we can focus on the important registers missing:
>=20
>   $ qemu-system-arm ... -d unimp \
>     -append "... root=3D/dev/mmcblk0 rootfstype=3Dext4 rw rootwait" \
>     -drive file=3Dlinux-build-test/rootfs/arm/rootfs-armv5.ext2,if=3Dsd,f=
ormat=3Draw
>   [...]
>   [   25.744858] sdhci: Secure Digital Host Controller Interface driver
>   [   25.745862] sdhci: Copyright(c) Pierre Ossman
>   [   25.783188] s3c-sdhci 12530000.sdhci: clock source 2: mmc_busclk.2 (=
12000000 Hz)
>   SDHC rd_4b @0x80 not implemented
>   SDHC wr_4b @0x80 <- 0x00000020 not implemented
>   SDHC wr_4b @0x8c <- 0x00030000 not implemented
>   SDHC rd_4b @0x80 not implemented
>   SDHC wr_4b @0x80 <- 0xc0004100 not implemented
>   SDHC wr_4b @0x84 <- 0x80808080 not implemented
>   [   26.013318] mmc0: SDHCI controller on samsung-hsmmc [12530000.sdhci]=
 using ADMA
>   [   26.032318] Synopsys Designware Multimedia Card Interface Driver
>   [   42.024885] Waiting for root device /dev/mmcblk0...
>=20
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> ---
>  hw/arm/exynos4210.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Krzysztof Kozlowski <krzk@kernel.org>

Best regards,
Krzysztof

