Received: by 2002:a17:505:a60a:b0:1be9:327d:8ee3 with SMTP id qv10csp5748590njc;
        Fri, 22 Nov 2024 14:52:07 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCU+kLG0uWzpNO7AUHPYI19R7YrMkCj0sQoMKAt6sONR6Q0qxY9t2P4rjK0vRcmurx5K4xOBazBeV/vo2g==@linaro.org
X-Received: by 2002:a17:902:c94b:b0:20c:9821:6998 with SMTP id d9443c01a7336-2129f731601mr56411585ad.10.1732315927043;
        Fri, 22 Nov 2024 14:52:07 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1732315927; cv=none;
        d=google.com; s=arc-20240605;
        b=F+hYXOadm4gnGsdCBwVzJgFDjuiz2Knl65qwLy4qMumFQ4xdYSNkioDN+LQBGQNe+R
         PsbCaeyl1TY0tgTmhNhpoXFfj8N2HzkOy3lQtprR9UiWbkcAEE5glsk5rIYvI+dJlcYi
         o2GlQlO9CHBR/e6DkwLM6Lqj/LuKJKecD46/GFxYAwatp5mwXFf+07mW1UXl57N09Bkm
         Ch/OBUvcz9BwZhEvegS+Qi7I3JXgcDhp0mcRQV93bu2dUjQ1JXy0+FaEi2KlLnT6D68k
         wQwr8GC1ajCI4heM+aBqX56eRcqMxasHcgvHZUnkvwZP1HwrCpvpS/eBa6Eg+ab0zsVP
         Tkaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=Px0xDe5+quVoadfeWboWHp/rKvNNinVDrxKYT34EqKI=;
        fh=eGgR77s/ckPedzfm+haSMlOabkr5gLlG0ZyhjK8bCYU=;
        b=dg4LvOgfPS2s7rtOh2IyHG+zyg6Qgx0+CnuosoWk+g2HYZOwMW3x5m/3Pz1UF3Duu/
         t0iuRSDu6jdC+JMYNlWt56s+96zljDxSRaDqJOKj4XgU5jzfL8l6Suys92tVXb/yqEqh
         HVqS2u2o5PRab2Ic6B3q2JDnkSrpcJ3DH/fc5vObysjRRzn1/5G/oP1WexyGci5nsehL
         nu+VsrUppBA8NkTQn3haOtWJ/ha5OLT2EN+2/eOZj5SQXdrgLHCMdbGNdam0OtGKgVKQ
         GjlUpPZCvD8t6I0R97pzsrDtakogPtKmfptQDHxWNn36SptzxMjJAw2BF1wJuzwjG9tM
         rlXQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=KFf68M8n;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d9443c01a7336-2129dc90cb4sor19091665ad.11.2024.11.22.14.52.06
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 22 Nov 2024 14:52:07 -0800 (PST)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=KFf68M8n;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1732315926; x=1732920726; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Px0xDe5+quVoadfeWboWHp/rKvNNinVDrxKYT34EqKI=;
        b=KFf68M8neSgXiryCDPw03aIvwTdLpaxGzV1ccErT2TBofQpHaZWM1SJu5bc69RH2YL
         o7LH9uuHHdJVaQCQF61KBn5QeaIaIOVyimHZKlRb0DZvEA/nDuhxWNfBxtPVnpNYC0aF
         cDyj/83oVL6OSX+F6yYV/h3RSsd/iY7w9F+3f27WcC3EtETlR/3nDuHwdCQ5IE9bQC0u
         GfgrKAX9C8QY4ZjJ18bBtlK7mzcE5t4Pv8AfdJs+CxAx4msbfCG0hmwWms98KFfMj7XK
         HkG2DoagHH4yqKjIBW2Oq+DrJRyOCxIr80eOHqAtIaj5Utqe4XIxiGO1ttnacmfSK+EK
         T6cQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732315926; x=1732920726;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Px0xDe5+quVoadfeWboWHp/rKvNNinVDrxKYT34EqKI=;
        b=GCyQ0JmRVNSO4N428SYr2oJ+sscSo5ESucjNaUhyyJN14OkjiJjRVD20xDKrUtyfcC
         u+BBkcySBUQyZXuabSdZoFYSaJNF/UXGDOEl1cWpDlvS+ZxtjFLzVWGSJbx3FNV5EQUI
         HX2ykCxd1mwEgiNR/zZY02Y8/5jVrirhHyU/VilctFq7u9u+m3lBmC4JQZhj4RM4TiFE
         PfjXA8LoF0QJx1CAhWJNtWYBUGr0g+25sOScPsev2QCuFLUlABWy1nVJvVCtexbFKRZl
         4I2T/+YQSVMpDUcJSV2ug5624XgmfIIqwT4wr3bjfAC42wvkgf15xHsdLNKfEGKMeR4p
         A36w==
X-Forwarded-Encrypted: i=1; AJvYcCXu//fqxSUezEnQhHMlBMUtsSDohN3Z7J3qJDciu8W8afQd5R28fdH9ToyfZVl8Ylxu9ykbUYIx+6/Mlw==@linaro.org
X-Gm-Message-State: AOJu0YzVS1A0tzMtrs4Pe9ySBcYsbZa4c2SlOd3TXKkhlme/KNpyomA4
	ygWC7fn/vXzJBog7cAvZ+3lhoDep+c5xrT0iKeA/TRNiB3GTcLlzKXjGyrkeHFDtBQ==
X-Gm-Gg: ASbGncsAezah+eI7MiTQSstakpaFfObiI/CqbFFSWdEi59RMzXAW8otQPC82VC75ewb
	i0QWpKnuB1N7/qiVOCle7pwCGL6PQMR9AyOKDBoFw7S6oDhd5vyZjuZy3M/UmJzWx7gb9s8pFXA
	9EbLTzorw4eOX4ST63nPikDpg91otCxoWz/xdAOIF7WMm0W5zWaXJUNQZQGxOx4X1NTk/sEMzR2
	OGDvpMRyTyI+H1E655EbFs5Hq1Ar4oTbGknnuC7xlxzurTodJz7OrTisiLTjik2uvSdp7ENJMpm
	gVrKLRd36WVE3Q==
X-Google-Smtp-Source: AGHT+IHjP7cDF7bjSkQtSaziaMNTwr8YpUvG9RAE8YpTO+DYBNjpmmQAoAlj39xHNrM2CdiAEJ42qQ==
X-Received: by 2002:a17:902:f705:b0:20b:fd73:32bb with SMTP id d9443c01a7336-2129f730378mr62433145ad.2.1732315926655;
        Fri, 22 Nov 2024 14:52:06 -0800 (PST)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from linaro.. (216-180-64-156.dyn.novuscom.net. [216.180.64.156])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2129dc1539fsm21450335ad.192.2024.11.22.14.52.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Nov 2024 14:52:06 -0800 (PST)
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
Subject: [PATCH 03/12] docs/system/arm/emulation: add FEAT_SSBS2
Date: Fri, 22 Nov 2024 14:50:40 -0800
Message-Id: <20241122225049.1617774-4-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241122225049.1617774-1-pierrick.bouvier@linaro.org>
References: <20241122225049.1617774-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: WtTWmUmhjXeB

Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
---
 docs/system/arm/emulation.rst | 1 +
 1 file changed, 1 insertion(+)

diff --git a/docs/system/arm/emulation.rst b/docs/system/arm/emulation.rst
index af613b9c8b8..50d0250b1eb 100644
--- a/docs/system/arm/emulation.rst
+++ b/docs/system/arm/emulation.rst
@@ -137,6 +137,7 @@ the following architecture extensions:
 - FEAT_SVE2 (Scalable Vector Extension version 2)
 - FEAT_SPECRES (Speculation restriction instructions)
 - FEAT_SSBS (Speculative Store Bypass Safe)
+- FEAT_SSBS2 (MRS and MSR instructions for SSBS version 2)
 - FEAT_TGran16K (Support for 16KB memory translation granule size at stage 1)
 - FEAT_TGran4K (Support for 4KB memory translation granule size at stage 1)
 - FEAT_TGran64K (Support for 64KB memory translation granule size at stage 1)
-- 
2.39.5
