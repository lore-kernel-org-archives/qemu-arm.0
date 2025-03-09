Received: by 2002:a17:505:8f44:b0:1be9:327d:8ee3 with SMTP id jy4csp508403njc;
        Sun, 9 Mar 2025 01:39:52 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCXmVamvi/n1Ey/n8wuG5BWfxTk0jj79vWGjS1XYKVrdMldgR4+LHjAnmaZuikrjWAj+nmfFtoUNTgYxJQ==@linaro.org
X-Google-Smtp-Source: AGHT+IFvGeE1AVkg2k0+j32GIfRm//QfnX4XkRITJzQ3MVqfrx33XCZTqyTuN3equ+CLr6LzLPur
X-Received: by 2002:a05:622a:11c9:b0:476:8595:fa09 with SMTP id d75a77b69052e-4768596039dmr4537001cf.40.1741513192720;
        Sun, 09 Mar 2025 01:39:52 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1741513192; cv=none;
        d=google.com; s=arc-20240605;
        b=UBTIalb250MGyWtklQy1rS++QJb6Dp6jypznj7NJ0gbpHz6eO0p3CsUBKnf2DX+rCy
         AIi+NM2T8ePKzfgvDIr0fN/N7Dz/ju43q6946GG1/hfRp/KxpIvzc1cmixQOtbcyduYF
         dTlCNxRImVxK4La55v9Qixrh+wg2y9LP5ngYP88NqJbQ0ZFVsyS2qZlEq0fiEtX6/3P/
         MAOtW5R7aLqbT1FJ/U8p80Gf8dC9B6CfJweJBLWSKe25+OVIvnqhI1UqB9+FO6fE4t/6
         oMWK0FQRza0o61yIvdmJ0KNTcVlbpTRB857WBhBlbJ9/hwlH2wkGPCUhg/FGGGIhKw6M
         K6tw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:references:in-reply-to:subject:cc:to:from
         :date:dkim-signature;
        bh=ax5IGd/4eNrwA4i2MUZdcYcXCJmnFhS/qG7yJ/UodEE=;
        fh=n39CKkSDZlUySfUcoI8b8D1cpo1iXV9BKuoT4lgh3UY=;
        b=OZcx6EJw0o0NpvreQbysa6w5xwF8coQy/gw1hsJyOrkQ5Se6cII0kCh5HV8pPaczod
         FSCtWKLMJL9IpOwtZaaigI1uAAVuD46huuWGjF7FQrxtwAw0WvxaAtduWca32mHxixpD
         8de1ZS7pqWxokftROmiuPtSk7aHmzf/fVZkT7wbQpoOx+lkXJGHnXY+M9p7Qq9R3oLlG
         w3hTInbQH4i8YbQzWaOxWGO/oc6rHba17WgJomq0jHYSVAV8EBFuJVhV8EnJ53V+Yio/
         Cf0Z/a27aSHCwMxcg/Fosm0G+vhlIghvNBTnG6/OY8Vz9E+egtTs4tE22AyQHdLkh3ze
         QRRg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=EEhiOvJN;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-4766527c2d9si30303251cf.649.2025.03.09.01.39.52
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 09 Mar 2025 01:39:52 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=EEhiOvJN;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1trD7l-00068D-Da; Sun, 09 Mar 2025 05:39:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1trD7Y-00065f-1a; Sun, 09 Mar 2025 05:38:57 -0400
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1trD7V-0003Km-CG; Sun, 09 Mar 2025 05:38:54 -0400
Received: by mail-ed1-x52e.google.com with SMTP id
 4fb4d7f45d1cf-5e5b572e45cso5655671a12.0; 
 Sun, 09 Mar 2025 01:38:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1741513118; x=1742117918; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:subject:cc:to:from:date:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ax5IGd/4eNrwA4i2MUZdcYcXCJmnFhS/qG7yJ/UodEE=;
 b=EEhiOvJNDaIADPjKkeqQQ1P3/Q/aULVUHB/dRfKfc80P49DnMR0QgVD2+m/X9YzcqO
 hykVQ4o96tqRJKyaV4yjPyR3PFFK6YUHLoJIS/zeGoV3zrSmF4NbHuenGnvufEGtx5Ci
 vui0XjEm7N53KPhYLEIoMAJs5Jn8AiGLn+NGWlzspNJ5LA8euT6mWooom3bZS90JyngQ
 HHWJBFHnzpePJ0uRME35dL5Df8kL7JB470fLKsrhb9taNCRS2yseRNWLD/SknN0ZLmkS
 oan9RcqfKDx9ymoQS3TJqqu5DOTSkX96l1zOwHxK5WMckP+TtWrHXI//x1ZpCDyykHiS
 20Nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741513118; x=1742117918;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ax5IGd/4eNrwA4i2MUZdcYcXCJmnFhS/qG7yJ/UodEE=;
 b=ulsN40s/2xCJgJP01iQ5f1DBLceOIsQAz44cf1uR/Uh+DAmIjO/ZFplez3q5hGeSTr
 G5BDv+ez6KjeV/tM+YH+/p8Dnv7mJwmRa2M9LKrWsOG0uhZ1c95EtolyFj587IjnKPti
 jJAm9O7HznuzFWyaCnKiCVQZVCI7I87/Jg1vtzg1Uj8tFjakDQeBYrOsvKwb4THy4mvK
 uUQsuchrG/JpDF6kmVKCbTofKVW+YgAadP0Ry/3pgDoLWMtsSSfEQvjV78UMAl4SuetJ
 n1X3kC3XvzPGwbnk3bFKbSMn/qFuKjUj5kLyp2R8Noyp7u0EW/5m16U1vn/UFLcos2dm
 UqAQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUhOlxMtHAU8MInElw185Mk4S+M4jguYlRpGKD6zcXZMMFLv5K5C+fuAgsXMhvpwv8eEpZfc6fq78DfRg==@nongnu.org,
 AJvYcCWl/gWZplBkfITkQveX75goUpAmX4HFaGJmMW51m4PF6RD10z7nNlLYn0JdEOM40fdUlX/BkQ+xY9a5UQ==@nongnu.org,
 AJvYcCWq4fYhoOtB7UUY6k/hdJVN0LqilF6vncdgD8tlBr+yw5emMjK/I7/vHr2chg/HcJPMFMzwWRw53Q==@nongnu.org,
 AJvYcCXheXhvwgfB9orBe2kSXcKbDwXuStKrf1Mgj20Vbbt48xXm7XN3kKssy1SRqUnSrSY5vTdJnHjRgeI=@nongnu.org
X-Gm-Message-State: AOJu0Yw+ntLoeCZgwxRexDy8f1/az6sFgtfFuUhB3eGbpcR23aRCm+rv
 s8ca8lK1Q6o1aSApcEzJXL2X3e2t7b61tB6eaWYlg6XrVaghCU3p
X-Gm-Gg: ASbGncsm095FM7IliNcuORTqEEGHwvM4A728hrC/OFSCrggTvh/ywrvgbhe/2KfJjsx
 +BJ3GlcfI7oVj4mv7z75jMzRL7fZC4/3bpVc80vt860G89mw4oioEWfq6cFfhqC0f0o7EdbVwak
 y+miGA4mRj2lb90dVTvKf38FjJd8/a5osEctIoaWtJIizfalzOGXDhQbM4YLumD6U30sKsMCVN0
 YUzwYl02U2khCyNB0Bgga1pUZRWRWBqyAZc1QYEx9EpLJVTLYBdfC5AtRTr9UivsAIauIPPtFSJ
 8gaKmMVyuIqcw61QiffcrzMdEkolJllRFoSw+lXiNlCjJSx7QvGGj4HfvMhjwxZWErx8qcCHMe/
 LPDyVwNxDNpAvKJsswhX1xrcjvh1zdQhZr7q5kjCCJRLK4RQe36uF
X-Received: by 2002:a17:907:c302:b0:ac2:4b70:cb97 with SMTP id
 a640c23a62f3a-ac2526ce371mr1005320066b.28.1741513118066; 
 Sun, 09 Mar 2025 01:38:38 -0800 (PST)
Received: from ?IPv6:::1?
 (dynamic-2a02-3100-1a10-8c00-69d2-56f6-a5af-50a8.310.pool.telefonica.de.
 [2a02:3100:1a10:8c00:69d2:56f6:a5af:50a8])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ac23973a756sm573848466b.94.2025.03.09.01.38.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 09 Mar 2025 01:38:37 -0800 (PST)
Date: Sun, 09 Mar 2025 09:27:12 +0000
From: Bernhard Beschow <shentey@gmail.com>
To: =?ISO-8859-1?Q?Philippe_Mathieu-Daud=E9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org, BALATON Zoltan <balaton@eik.bme.hu>
CC: =?ISO-8859-1?Q?Daniel_P=2E_Berrang=E9?= <berrange@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-ppc@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>,
 Andrey Smirnov <andrew.smirnov@gmail.com>,
 Jean-Christophe Dubois <jcd@tribudubois.net>,
 Guenter Roeck <linux@roeck-us.net>, qemu-block@nongnu.org,
 Bin Meng <bmeng.cn@gmail.com>, qemu-arm@nongnu.org
Subject: Re: [PATCH v4 09/14] hw/sd/sdhci: Unify default MemoryRegionOps
In-Reply-To: <20250308213640.13138-10-philmd@linaro.org>
References: <20250308213640.13138-1-philmd@linaro.org>
 <20250308213640.13138-10-philmd@linaro.org>
Message-ID: <6FAA573C-D92D-451B-B69B-F4B9095F9F0C@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::52e;
 envelope-from=shentey@gmail.com; helo=mail-ed1-x52e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: 5Xd5k8FZ3DNC



Am 8=2E M=C3=A4rz 2025 21:36:35 UTC schrieb "Philippe Mathieu-Daud=C3=A9" =
<philmd@linaro=2Eorg>:
>Note, sdhci_mmio_le_ops[] was missing =2Eimpl=2Eaccess_size =3D 4=2E
>
>Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro=2Eorg>
>---
> hw/sd/sdhci=2Ec | 46 ++++++++++++++++++++--------------------------
> 1 file changed, 20 insertions(+), 26 deletions(-)
>
>diff --git a/hw/sd/sdhci=2Ec b/hw/sd/sdhci=2Ec
>index a2e7162e289=2E=2E23af3958a1d 100644
>--- a/hw/sd/sdhci=2Ec
>+++ b/hw/sd/sdhci=2Ec
>@@ -1372,30 +1372,22 @@ sdhci_write(void *opaque, hwaddr offset, uint64_t=
 val, unsigned size)
>                        value >> shift, value >> shift);
> }
>=20
>-static const MemoryRegionOps sdhci_mmio_le_ops =3D {
>-    =2Eread =3D sdhci_read,
>-    =2Ewrite =3D sdhci_write,
>-    =2Evalid =3D {
>-        =2Emin_access_size =3D 1,
>-        =2Emax_access_size =3D 4,
>-        =2Eunaligned =3D false
>+static const MemoryRegionOps sdhci_mmio_ops[2] =3D {
>+    [0 =2E=2E=2E 1] =3D {
>+        =2Eread =3D sdhci_read,
>+        =2Ewrite =3D sdhci_write,
>+        =2Eimpl =3D {
>+            =2Emin_access_size =3D 4,
>+            =2Emax_access_size =3D 4,
>+        },
>+        =2Evalid =3D {
>+            =2Emin_access_size =3D 1,
>+            =2Emax_access_size =3D 4,
>+            =2Eunaligned =3D false
>+        },
>     },
>-    =2Eendianness =3D DEVICE_LITTLE_ENDIAN,
>-};
>-
>-static const MemoryRegionOps sdhci_mmio_be_ops =3D {
>-    =2Eread =3D sdhci_read,
>-    =2Ewrite =3D sdhci_write,
>-    =2Eimpl =3D {
>-        =2Emin_access_size =3D 4,
>-        =2Emax_access_size =3D 4,
>-    },
>-    =2Evalid =3D {
>-        =2Emin_access_size =3D 1,
>-        =2Emax_access_size =3D 4,
>-        =2Eunaligned =3D false
>-    },
>-    =2Eendianness =3D DEVICE_BIG_ENDIAN,
>+    [0]=2Eendianness =3D DEVICE_LITTLE_ENDIAN,
>+    [1]=2Eendianness =3D DEVICE_BIG_ENDIAN,
> };

We introduced sdhci_mmio_be_ops and the endianness property specifically f=
or the e500 machine=2E We always lied about the endianness property to be i=
mplemented for all SDHC types, e=2Eg=2E USDHC doesn't implement it=2E Since=
 you'll introduce a dedicated FSL_ESDHC type a few commits later, along wit=
h its own MemoryRegionOps, I think we should drop the endianness property a=
nd sdhci_mmio_ops doesn't need to become an array=2E Dropping the endiannes=
s property also results in avoiding the error conditions you have to deal w=
ith in the realize method=2E

Best regards,
Bernhard

P=2ES=2E: IIRC, the Layerscape SoCs also use the fsl,esdhc IP core and the=
ir endianness can be switched at runtime(!)=2E Since we don't model Layersc=
ape we can simplify, i=2Ee=2E hardcode the endianness to big endian for now=
=2E

>=20
> static void sdhci_init_readonly_registers(SDHCIState *s, Error **errp)
>@@ -1443,10 +1435,12 @@ void sdhci_common_realize(SDHCIState *s, Error **=
errp)
>     ERRP_GUARD();
>     SDHCIClass *sc =3D SYSBUS_SDHCI_GET_CLASS(s);
>     const char *class_name =3D object_get_typename(OBJECT(s));
>+    unsigned ops_index;
>=20
>-    s->io_ops =3D sc->io_ops ?: (s->endianness =3D=3D DEVICE_BIG_ENDIAN =
?
>-                               &sdhci_mmio_be_ops : &sdhci_mmio_le_ops);
>-    if (s->io_ops->endianness !=3D s->endianness) {
>+    ops_index =3D s->endianness =3D=3D DEVICE_BIG_ENDIAN ? 1 : 0;
>+
>+    s->io_ops =3D sc->io_ops ?: &sdhci_mmio_ops[ops_index];
>+    if (s->io_ops->endianness !=3D sdhci_mmio_ops[ops_index]=2Eendiannes=
s) {
>         error_setg(errp, "Invalid endianness for SD controller");
>         return;
>     }
