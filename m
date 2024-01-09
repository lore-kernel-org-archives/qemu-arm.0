Received: by 2002:a17:906:6951:b0:a28:f940:7a27 with SMTP id c17csp553391ejs;
        Tue, 9 Jan 2024 10:10:51 -0800 (PST)
X-Received: by 2002:a5d:5e8a:0:b0:336:6dd3:bfcf with SMTP id ck10-20020a5d5e8a000000b003366dd3bfcfmr1078913wrb.121.1704823851099;
        Tue, 09 Jan 2024 10:10:51 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1704823851; cv=none;
        d=google.com; s=arc-20160816;
        b=TKzP9mw9yZY8Fp9MyXHE4QzmgGit7hkpn8jDEZyKmZru321Z27Z5x29NsnTkqxE1hm
         RX+HE5K7GoDb0SrxVm7JWbvkqqUBdt3yQeAiY51ZHPBwDfBQoy0HoUGWRSlLOPDMFjez
         m8KWQMMq3xOKIo9i2cr3Wb+2dpfoplwPVw8ASljWoTzXLFD5H8ocIE11tHjWn5ByxNcf
         iyj9o8cXGu/YUWiczIPHMY+eQPDXrytD4K0TS0DJ70UtDRxz/6wS365kd9YqLsygSqs2
         7wUydux8Tx5PddhOhmrhHr6asJyChIolT5isLfHgh1P+dg2dZkThR18Ztr7cOZvCR1yw
         5brg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=6/Hk2SmJl7pABngKVtRs+8Jo9OKAAK/e6Yxa8zZeHcw=;
        fh=v69mdd+nxs/0WeTIWzLZOPCx0ynE2o0vtvId2fSwkBY=;
        b=YFl99YNc8lGEqRaojCFxUSKe+LszRM5n7pKgZ7jC8B63kc3CJFxGXrwRxwFGAhpFb6
         NzWQldIEmStKt6unq6kYkjsuxm2z/uDK3aI5bVLS23O9We04mCPo1KHo70L1cej7EsNF
         xoLMJ9C+6u+l8fOAUzx0V5yq/5N8zVtzqij2DOMIV7kXBAD5qEGFVf9Ejftw4Vyi0o/Z
         rFvbgXNMOCPBVv4o4SU+jfduazKRux2j2lu+vH3bbmcD5wJ0aZgwbPDTPm508n26aoAz
         FF8l13n1DLwWNdHmLJWbC/fXqsRDjarZkNOzHNx1VVRpqBXeLjULXTuRMj0o5yCjdl+8
         qe8Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Ln+9xtmC;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id h27-20020adfa4db000000b0033687c6e13bsor834000wrb.1.2024.01.09.10.10.51
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 09 Jan 2024 10:10:51 -0800 (PST)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Ln+9xtmC;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1704823851; x=1705428651; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6/Hk2SmJl7pABngKVtRs+8Jo9OKAAK/e6Yxa8zZeHcw=;
        b=Ln+9xtmC5Bk1E+0I6EMPEIRiDkyjwIl6Q/169nFsVS2IlhYOqYlg/6P4BaQXx4wwSk
         wcDmMi3YboPaURliUkF6gb6q70GuCTKaigGb9Ny2WtLi8FxRxyoEOJWLc3ac5UnOqq/y
         qvswsuxKUdHzpN1CpFOBJhuXbmeqJYi0zhWKCi5NV6Jt2p+hkoEVYa1lQup+b/uH/z9u
         MVPqmKKaT1pB5Hy/nj9ar7dwsebb/Tzr3C72TmgjxdfcwiCKvt5bRkrpINNfhwvLjN1Y
         rOZ1daJMzSKHtU6IicrROshAmHap5R3j+irdIt8kyY0IvvkYRzzGZYyveWWa1P/8T1TT
         lilw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704823851; x=1705428651;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6/Hk2SmJl7pABngKVtRs+8Jo9OKAAK/e6Yxa8zZeHcw=;
        b=GGFtCfdA1LMPHWjI8gHCs5xPsO0gWbV6EIIocuFa0DygRDLcBGqN+KW6uO/FoywjBz
         fUJl5yVZ2IGZ04oVHNFGDojmd3AswYszvIWFdrz6UTKCvkxE1s3DzkqLvFr0qBLESRva
         3oRzDjyE9pv5yx7IQw/z2+13UcolvqHmE71HKF6j3ryPXf1FOMYv2mH5TrFr4h6gKdKy
         hBSN/cp9RFmg94tacwWr4X+Igqu/1F3iFWoOAOLAe2LnieqgMab5AY9gJsgX3FKKXE32
         NPNc1lWUkvYJRR75DsJG70Y8pMktfR43TUcv1U6pBokVxOk8sw9MPHENs/2lvY/6k1bI
         sG4w==
X-Gm-Message-State: AOJu0YxX3flYO/1UJlUVI61Dl1pvEByidm/sH1Fk120lvwRsGx6jvnGm
	51i7y9oazOdMieOjIkgJIF8naPlOR2lBodJY
X-Google-Smtp-Source: AGHT+IG6SDRF1HikcCuasNNF5WnbAgjNpyY8+e0PFZnSHKwJdhTPUaJzLv6rB04SysNAE0qTuR7vew==
X-Received: by 2002:a5d:4cc9:0:b0:336:c4c1:2d77 with SMTP id c9-20020a5d4cc9000000b00336c4c12d77mr740810wrt.73.1704823850830;
        Tue, 09 Jan 2024 10:10:50 -0800 (PST)
Return-Path: <philmd@linaro.org>
Received: from m1x-phil.lan (rsa59-h02-176-184-32-47.dsl.sta.abo.bbox.fr. [176.184.32.47])
        by smtp.gmail.com with ESMTPSA id l8-20020adfe9c8000000b003365951cef9sm2990208wrn.55.2024.01.09.10.10.48
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 09 Jan 2024 10:10:50 -0800 (PST)
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
Subject: [PATCH v2 12/14] hw/arm: Prefer arm_feature(PMU) over object_property_find(pmu)
Date: Tue,  9 Jan 2024 19:09:27 +0100
Message-ID: <20240109180930.90793-13-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240109180930.90793-1-philmd@linaro.org>
References: <20240109180930.90793-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: X1OlG/PPSLmi

The "pmu" property is added to ARMCPU when the
ARM_FEATURE_PMU feature is available. Rather than
checking whether the QOM property is present, directly
check the feature.

Suggested-by: Markus Armbruster <armbru@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/arm/virt.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 7e7350fec2..6d1cb24a6e 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -2160,7 +2160,7 @@ static void machvirt_init(MachineState *machine)
             object_property_set_bool(cpuobj, "kvm-steal-time", false, NULL);
         }
 
-        if (vmc->no_pmu && object_property_find(cpuobj, "pmu")) {
+        if (arm_feature(cpu_env(cs), ARM_FEATURE_PMU) && vmc->no_pmu) {
             object_property_set_bool(cpuobj, "pmu", false, NULL);
         }
 
-- 
2.41.0
