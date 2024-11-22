Received: by 2002:a17:505:a60a:b0:1be9:327d:8ee3 with SMTP id qv10csp5748565njc;
        Fri, 22 Nov 2024 14:52:05 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCVOFHGHdSHT58ShLOwCV+ocJZyvNShZYa2yYpCerXAuHvDP17Sw8n7kY81ccqHRBSooRYB56VfWiJsi1g==@linaro.org
X-Received: by 2002:a17:903:18f:b0:20e:55b0:35f2 with SMTP id d9443c01a7336-2129f217e22mr76419925ad.1.1732315924918;
        Fri, 22 Nov 2024 14:52:04 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1732315924; cv=none;
        d=google.com; s=arc-20240605;
        b=F2hBGfiHUVBMEgoetxwJfHyCX5jr9UX76zspUYi8hT7J3/7x9zfKSoAm/PMT/lKYFL
         kB97LXG0j9O1G6dHWdVk/QC/fmqP1NkmP395qaODHuJ3UYE3FTTlJNA542lOE2b616Xl
         LH4yhB624/QLTkuJ3DqleSErZ/65TbEDMd3OBLcF+y5NRuQ6LtRRiwMOnj1NLSv61Pjt
         ZEfK1eDVEjpAFeFwXD9jYRpdYnAa9yjUiei6Y34fPaJ3svnlfyFNOIE/G9KlMpegcCDn
         Ub7xy03pu5nTatDVThXub0yo1XIFV6df7HZQZyxA+vURBBInU2auFdo/DiCf1UaiQ4A5
         h1Jg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=9YFLbZLOczXBElPPKg8w5+mMH+iVSKvrslYIT3YcYvo=;
        fh=yiHtDwlKf1W0DsJTzf1c+SVz0YO6R9xz3CINSiz49tE=;
        b=CfFkvVmonhu6ge5sqvnqUiXXZ4s4P05pt+/jZql7YyIKZltfsidVSL5ZhOd89yqgCw
         FhXzKf+kiGsarcBmv56ekCoiVYh4dzVjcWyEr4a8Tzlul4bJZjxEuXRtZAYuvuNAc7Rr
         3bLTRJFStBZARUvNVBTaykq/Fi5MKOrb/DsPypJoRMz+XtznFe9Pqazm9yiSy+misIRi
         Kd7e9nTNFrtTjQZb7tUlSPIMsUxw+ifc5nhjds+vJMtIBiDCs3UuLoAg8mbPqU/Akn0S
         QSCmCCuhqxTkH0jJzHM22iqCbwDeOuqbrK0e3kKHwB53W9O1UvudAmHpbBxQJCdj2yaO
         sFHA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Q3L9rTbI;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d9443c01a7336-2129db4b6e8sor19615195ad.4.2024.11.22.14.52.04
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 22 Nov 2024 14:52:04 -0800 (PST)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Q3L9rTbI;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1732315924; x=1732920724; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9YFLbZLOczXBElPPKg8w5+mMH+iVSKvrslYIT3YcYvo=;
        b=Q3L9rTbIZRtAdmwtesgv8Uh7FxxFu6jvFDnHRfNAkh7TIrVJlHHBu2aHbpwCeEu3rs
         Ekh9RMvcZGa2BEPGfdXrxitGhHldRau/x6+2hwEbaIEKoXLb5MNW8YFyOSn7FYKTX61H
         R4ZmcQuzrbGU+LLuLn2u1CHw9/hJ/9rs+KK3ToY3OnYzctIbnD4CMNGDGQhFUxkaFt9Q
         85dWmXiAAjGHEoUcx7M1MAr0TJKn3/DpMVmeD2rmyCy5OFPIojQAw0W+Qh18/P8xX27j
         vhws1lwa43rkm8Q9nawkMVRh50TviEmLc52+1EulS9gydzZ6/2dCpuTNUs7PmDvGD4AC
         mOIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732315924; x=1732920724;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9YFLbZLOczXBElPPKg8w5+mMH+iVSKvrslYIT3YcYvo=;
        b=hlzGfoSawc4DVf3GhdkZTr6wFR4V30jJnztFQ6mWTeDMPEDOJum4LayV1R0CQ0hDXU
         ssny+fYJHKr5RybqsKcca1Tiz8ICvtFkgOcxdbECd/SGw6rYvABpYRGwdMuHf12Re1Jg
         6oJhN1h2juAOKvi3Vt44Ws2M+nqYrv0m37dn1uwEd+9oFAoJvB6nxwXKUNsyZuTuBMKn
         iBj+UATUP5jPQNLOPXlmgL8FHlauxgsMJggJHLgWXOh5OK3Fj0F900rCsOtH2zo6DtwR
         gQQOHS6vGdGxswKEU6TUygfLiqqmp9uvsTvC3Zs4U9mAXN8SY0/piWhZe7adyuoe5por
         aS0Q==
X-Forwarded-Encrypted: i=1; AJvYcCUuQ/URcI1YhRWmgavi8x62IjoTqwxlxTpv8i5gLFSdZEOHtbnKYa6yYyKOt8l0AxPSQKdHwuXS65icCg==@linaro.org
X-Gm-Message-State: AOJu0Yw99THTe5ywd2cZB4wGba7ceI7a4hh3gaKB2wi8PU/SSzwdX432
	7zxFGhVBsdHewGwHdASzxM6R26LxRXmWQlubRUltiVOKZPKjg2sCIinoDrHOjjD4lQ==
X-Gm-Gg: ASbGncssTNUv5ixvrqec/XPELnTiH4odU7EC7HOdhG34shlYFQqKYgJe5YwVRZK+Wxv
	xUfedL5ob6RMspQ7FmuwYtzlxQ37gRrbVGkzamJnVwSCj7FlLGK+BHlgupzE8Qm0JgYbYBU/nKb
	EN/ktcJ4FDhSK01sScJL2l3+KaC3V4vOUOWYqnrhStZsUx674aPRB01B6K3ewgUZAnVDFppcnQk
	NT1X7s9a2CWmEZnGUwLpwHoIz3buOZ08Z50y6be6EBs47LfO1m8lWLh9P3coOYi1eFemFRBRG/4
	s/6rWfZbkehTVQ==
X-Google-Smtp-Source: AGHT+IHUaAPqGY0pVQ2KVgG0CwtD+igzfbJyv2dYuIam3jB2EpwZQnkhSl0ziQwdQPVdfVJaXddVVA==
X-Received: by 2002:a17:902:cec4:b0:20c:ab33:f8b8 with SMTP id d9443c01a7336-2129f226036mr65032875ad.15.1732315924506;
        Fri, 22 Nov 2024 14:52:04 -0800 (PST)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from linaro.. (216-180-64-156.dyn.novuscom.net. [216.180.64.156])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2129dc1539fsm21450335ad.192.2024.11.22.14.52.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Nov 2024 14:52:02 -0800 (PST)
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
	alex.bennee@linaro.org,
	Steven Lee <steven_lee@aspeedtech.com>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	Richard Henderson <richard.henderson@linaro.org>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	Niek Linnenbank <nieklinnenbank@gmail.com>,
	qemu-arm@nongnu.org,
	=?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
	Troy Lee <leetroy@gmail.com>,
	Jamin Lin <jamin_lin@aspeedtech.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Joel Stanley <joel@jms.id.au>,
	Alistair Francis <alistair@alistair23.me>,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH 01/12] docs/system/arm/emulation: mention armv9
Date: Fri, 22 Nov 2024 14:50:38 -0800
Message-Id: <20241122225049.1617774-2-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241122225049.1617774-1-pierrick.bouvier@linaro.org>
References: <20241122225049.1617774-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: C+4uV92VRTIr

Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
---
 docs/system/arm/emulation.rst | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/docs/system/arm/emulation.rst b/docs/system/arm/emulation.rst
index a2a388f0919..2956c22a1b7 100644
--- a/docs/system/arm/emulation.rst
+++ b/docs/system/arm/emulation.rst
@@ -3,8 +3,8 @@
 A-profile CPU architecture support
 ==================================
 
-QEMU's TCG emulation includes support for the Armv5, Armv6, Armv7 and
-Armv8 versions of the A-profile architecture. It also has support for
+QEMU's TCG emulation includes support for the Armv5, Armv6, Armv7,
+Armv8 and Armv9 versions of the A-profile architecture. It also has support for
 the following architecture extensions:
 
 - FEAT_AA32BF16 (AArch32 BFloat16 instructions)
@@ -153,7 +153,7 @@ the following architecture extensions:
 - FEAT_XNX (Translation table stage 2 Unprivileged Execute-never)
 
 For information on the specifics of these extensions, please refer
-to the `Armv8-A Arm Architecture Reference Manual
+to the `Arm Architecture Reference Manual for A-profile architecture
 <https://developer.arm.com/documentation/ddi0487/latest>`_.
 
 When a specific named CPU is being emulated, only those features which
-- 
2.39.5
