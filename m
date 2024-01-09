Received: by 2002:a17:906:6951:b0:a28:f940:7a27 with SMTP id c17csp552631ejs;
        Tue, 9 Jan 2024 10:09:40 -0800 (PST)
X-Received: by 2002:a05:600c:1d28:b0:40e:540a:dc22 with SMTP id l40-20020a05600c1d2800b0040e540adc22mr173772wms.182.1704823780610;
        Tue, 09 Jan 2024 10:09:40 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1704823780; cv=none;
        d=google.com; s=arc-20160816;
        b=rgmaKs42Lh+lIxOrYds0p7z2aqh2wRP6vA2RDviXmz/TE1k0gYZj5uB8NZnbU/+xKP
         XnMLN46RzaiP1HpVngsCGXnQ7V++JjzaYEno+IEc5C3Geq8dl3akVZdxnOG0kE4wb92J
         /dCCmYTo+7gJcTaHmdvZNDpfWuC6DUgnjpe3vywqLedmBRkP/pNLU9aKdTW6/rMxYqEq
         sv7oapiNewXOUpVx4n9ImsgBh6D6pDlMzbNw8UnYdUJQfQZCQqQMbQWC5Nzd1WCrOmsB
         u9j30JPTTTbJz13JcNxuUECEN4AZLisntDV/RaYitScZM9k9pdkDC8FAZ42Te21m9pVY
         qIBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=m5j2p6OKwzJC1ZEqQVM4irz5Oy7NtypkEBAv8Xtr+qU=;
        fh=v69mdd+nxs/0WeTIWzLZOPCx0ynE2o0vtvId2fSwkBY=;
        b=uLxZRTdvvpSvew7v5ealNRdCJ8DPkAzaihyexe2I0hY0nn30dEeW2Oif/xzhIy1+x0
         4BLm/vtC6Zush1RyfElqJnW46pP/STpb2uOf12h9D+4XyGwRJwtaCOsQEHcBTB/aGntD
         gRMTUoj3Ps2wDVVsxpRGRJphcB+W/soDHNne1lLD57SvFw3M/S9G+ZI62dwsWx6HTGRw
         xabXQUB/f01nQxaic+CJDnIt/xXX5UoVjpPT7SU5/fSPEFpHodJmCdfY7jQLk7GuVyds
         mCbrh1OM5BPFuwPRgpsBkh56PbZgQs0PTSkB9qeupHpYH/tRq6aoKCV2DjOylf8LmTpX
         t+lA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="ux5AdK/j";
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id f20-20020a7bc8d4000000b0040e47b7fdccsor1048378wml.13.2024.01.09.10.09.40
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 09 Jan 2024 10:09:40 -0800 (PST)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="ux5AdK/j";
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1704823780; x=1705428580; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=m5j2p6OKwzJC1ZEqQVM4irz5Oy7NtypkEBAv8Xtr+qU=;
        b=ux5AdK/jcY/k0OMe8+miLJvJu9dWk6BHEk2XLtYqAJtbzvif+hH85aLNHZ9DLPXixx
         o+FRoCFSWNdzJnROMv9abGOLoQNbfx/g6xPEieSA/nQfrakURBRJZk1UFQUs/HYpCaeC
         okNXYhvxfxfIlVinlkzsCeS0OJq6JyOD/MFw/abs/0KHo9ARMCKOkbEvXfwRZ9vx3ifs
         YB2D3Js8QrvmoVoD/W2I3cZUcqNiWvKQtBvbnpgnxM5AZmVt8AD+WoGK/fZ217P2mcBN
         zv3Ukr5UhH2JA5oddT6NlBtQPpmnFhCl/BFGdZHoBjCqnr7Xv38jKdv8MP3arxsVrPlE
         tz8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704823780; x=1705428580;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=m5j2p6OKwzJC1ZEqQVM4irz5Oy7NtypkEBAv8Xtr+qU=;
        b=Wtut9PHS7G4Ql3MbAopLh3uaVfPyOOBMfOdlkN0uvW24JvEeQz0iX52TS+8ci+2O5h
         QyoADF4g+C2OWdZ41im6iykG32BLXLYt13X9yKLlmE0nFHWR26ABfI7GYpYQPsv+KDqB
         ZDu1uchGqxDJPsYO6efkdcZrgb+5bDqhstjwEUFEgDtWmU864q7m6tGM75/uMrjIWuoM
         UEkcx7/Zj6mRcErCNXJC4gWimlen1nlVBpRYts0I0PVJPmIC12fPuN9hi5BJyGl+mFea
         rHnSpppK2samwEqxBJrZ+HnzMBGRUx2ez1jPJdDJ2tLTOcQhwKveHBp5uOldBYhkE/ly
         Xszg==
X-Gm-Message-State: AOJu0YwNsI+FWAbUDf8Pse7r9uXkJ+oeM+vluV8HgcpLwlHGV0I9quUj
	x8dWRVrgPgCd25JQuWi5Nh9qEAw9toH8HVge
X-Google-Smtp-Source: AGHT+IHV9YSsFjhJsNkaNRxtL2ZWaA4NYuAVVSfCkzcK/wAgLO9QVTkYuMRe13iW4oHxzjynZlEiCQ==
X-Received: by 2002:a05:600c:b56:b0:40e:52e0:baca with SMTP id k22-20020a05600c0b5600b0040e52e0bacamr368437wmr.129.1704823780337;
        Tue, 09 Jan 2024 10:09:40 -0800 (PST)
Return-Path: <philmd@linaro.org>
Received: from m1x-phil.lan (rsa59-h02-176-184-32-47.dsl.sta.abo.bbox.fr. [176.184.32.47])
        by smtp.gmail.com with ESMTPSA id i12-20020adff30c000000b00336b8461a5esm2980486wro.88.2024.01.09.10.09.38
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 09 Jan 2024 10:09:39 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Leif Lindholm <quic_llindhol@quicinc.com>,
	Radoslaw Biernacki <rad@semihalf.com>,
	Kevin Wolf <kwolf@redhat.com>,
	Markus Armbruster <armbru@redhat.com>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	Igor Mitsyanko <i.mitsyanko@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Alistair Francis <alistair@alistair23.me>,
	Peter Maydell <peter.maydell@linaro.org>,
	Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v2 01/14] target/arm/cpu: Simplify checking A64_MTE bit in FEATURE_ID register
Date: Tue,  9 Jan 2024 19:09:16 +0100
Message-ID: <20240109180930.90793-2-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240109180930.90793-1-philmd@linaro.org>
References: <20240109180930.90793-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: ne3Et7QRC7q6

cpu_isar_feature(aa64_mte, cpu) is testing a AArch64-only ID
register. The ARM_FEATURE_AARCH64 check is redundant.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 target/arm/cpu.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index 1c8b787482..c828b333c9 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -1690,8 +1690,7 @@ void arm_cpu_post_init(Object *obj)
     }
 
 #ifndef CONFIG_USER_ONLY
-    if (arm_feature(&cpu->env, ARM_FEATURE_AARCH64) &&
-        cpu_isar_feature(aa64_mte, cpu)) {
+    if (cpu_isar_feature(aa64_mte, cpu)) {
         object_property_add_link(obj, "tag-memory",
                                  TYPE_MEMORY_REGION,
                                  (Object **)&cpu->tag_memory,
-- 
2.41.0
