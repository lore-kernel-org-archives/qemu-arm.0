Received: by 2002:a17:906:6951:b0:a28:f940:7a27 with SMTP id c17csp1258754ejs;
        Wed, 10 Jan 2024 11:54:09 -0800 (PST)
X-Received: by 2002:a05:600c:3505:b0:40e:44eb:c3a with SMTP id h5-20020a05600c350500b0040e44eb0c3amr857463wmq.31.1704916448901;
        Wed, 10 Jan 2024 11:54:08 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1704916448; cv=none;
        d=google.com; s=arc-20160816;
        b=ygWASY9MNZn42iNdiq8oSsvApinf4ZrQOtIppMIy5Kt5eIKYNTDlCWR16Mv4HaVK1W
         DkAyKXUbg65cbwpdvEK0z+yY1UoJ944l+vvQySdoWArNrJuRvEY9q9NmHRuOm16ZowUw
         IevewU86Mz+k7BgMtypyfvME8jwDa2zmREt9RyzMi95o+9pbAmxx0o/CuUkUclVh3EO8
         Fr2+EYQehAJBnWA/b7DnOtyIFcWD+m9TRvDzMVL0u0gnV1uoWJrKgvJ/xvyTU+XUYN0L
         eMxyBq5zKge+sNNni3gKE4N8FcFXMwkzldZy9Rpf9Wpey3gu5q/cWDvC9oOWizUzgypH
         akvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=+Lqyw2xeJxP0nadk2efU9Sx5aGl4DyqfaFeDtt0siLg=;
        fh=0Bn9ysFO5uhdOoEvdDNDnkwY7yFMuDt2XLw3k0zcWt8=;
        b=vTGWRLxW+Mqqhl8eQA3KmmgE048BeEjADdtJqJrniAl0xnoRtDHxA+t9ZJreaIYfop
         Sh5mDR5UsRN2DmLC83ZKnqxgtQNukoKaP76OnqMZzCfSsAKwb3wFHx62NyLGj6k6e9QN
         ZufsK58UjvHN/95QJo6DqJt427jld1Ztg+/LyKtbUE2zerkCOzcz1TCIxiQvT3ru2kXm
         ebRWIRgeFs5EG99MhMBpKf12cSD+xCmef3uplcGWprTNBdk5x37srpb8kvZtMHzxVYkH
         YZHb06JDpOVqT78w5Z6HzmucPFTHb/8zZ2ehUYjzdNUKxRJ67MW/imElfjKIl4sdpyMh
         ndCg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="TmWx3/hZ";
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id u25-20020adfae59000000b003375a22a78asor1684132wrd.10.2024.01.10.11.54.08
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 10 Jan 2024 11:54:08 -0800 (PST)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="TmWx3/hZ";
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1704916448; x=1705521248; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+Lqyw2xeJxP0nadk2efU9Sx5aGl4DyqfaFeDtt0siLg=;
        b=TmWx3/hZ+ttHQdkt3G0u9tqS7pwV9WaMWTIov2DEin76HieWqdIlFHWYrhXYTyHUYS
         5cmGL0cEzIFhfNybne4s3FdemAlbzPZBSSRooGH4GWktIVLl3L0PIiIrIrCSkGNxg8f7
         bgPgeBfv+ZMLtTuRs1G1/UCefgraz7nTLwAVpZfJthdaGie5X/aFCOgvaMzZyd8VBqTi
         lMMLFOBMCFenICcx0lgNzyMnuCp97gzOlI5kr86lrATu3tOTeP2CzVrTC1yycX3QP42s
         czndX2BHZjUfeBjP5VYGI5X21WCuHZgbd8bp07njiPgpkeAm1w3ERFZyXVY9dUOiagBb
         ZS+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704916448; x=1705521248;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+Lqyw2xeJxP0nadk2efU9Sx5aGl4DyqfaFeDtt0siLg=;
        b=i4ZGtNEKk4KaF2DAh5CMyponPwifo68xXVn7vFAXFcObX9QHFQEKynvOiKxYLQquQG
         WEtzR+Qda22gHTNbkFNftux1PLRdLqkfZVt3kuHFaHk+S3nt/9g65Ldcvpl7WiGTosKI
         6M33S8BwcpxdtIhgwJqhH64R1+Bry0G00eXItwxFV13oXadGS19O9Q4PBZy9bPQc10SX
         rZ5RBDQ1zBaTztVwMVDsZYy283QK0T/+WlIcYTBasX9RSEpvyAY32ijgkPYZzOHjo5ks
         D05WbfY2QNrlQr9wQz4R6NtrvtvoKix47z/itVqFdqADX3YLuQBzP4unCwal1q+5i0QR
         dejA==
X-Gm-Message-State: AOJu0YwHMnenmXQ841FDM6+DoM/Dnk1en7Iqh3xBHz1WZGiM2uMCCNfK
	UezWKk+O2hHwUnHAztV4Nornv65bHssKRhZr
X-Google-Smtp-Source: AGHT+IH7Le0gG0qCcI+8M09SN9A/YfAepwlqDkxfVaho46g9uVvNTxP1ta35tm/cvlgibSAWK/Yc9g==
X-Received: by 2002:adf:f102:0:b0:337:6566:f9cf with SMTP id r2-20020adff102000000b003376566f9cfmr2200wro.98.1704916448613;
        Wed, 10 Jan 2024 11:54:08 -0800 (PST)
Return-Path: <philmd@linaro.org>
Received: from m1x-phil.lan (vau06-h02-176-184-43-236.dsl.sta.abo.bbox.fr. [176.184.43.236])
        by smtp.gmail.com with ESMTPSA id r4-20020adff104000000b00336a0c083easm5602722wro.53.2024.01.10.11.54.06
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 10 Jan 2024 11:54:08 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>,
	qemu-arm@nongnu.org,
	Kevin Wolf <kwolf@redhat.com>,
	Igor Mitsyanko <i.mitsyanko@gmail.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Radoslaw Biernacki <rad@semihalf.com>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	Leif Lindholm <quic_llindhol@quicinc.com>,
	Rob Herring <robh@kernel.org>,
	Markus Armbruster <armbru@redhat.com>,
	Alistair Francis <alistair@alistair23.me>,
	Peter Maydell <peter.maydell@linaro.org>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v3 05/14] hw/arm: Prefer arm_feature(M_SECURITY) over object_property_find()
Date: Wed, 10 Jan 2024 20:53:19 +0100
Message-ID: <20240110195329.3995-6-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240110195329.3995-1-philmd@linaro.org>
References: <20240110195329.3995-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: Kvb7K07p5X5E

Both "idau" and "init-svtor" properties are added to ARMCPU
when the ARM_FEATURE_M_SECURITY feature is available. Rather
than checking whether the QOM properties are present, directly
check the feature.

Since we are sure the "init-svtor" is present, the
object_property_set_uint() can't fail.
Instead of using &error_abort, replace:

  object_property_set_uint(OBJECT(s->cpu), "init-svtor",
                           s->init_svtor, &error_abort);
by:

  qdev_prop_set_uint32(cpudev, "init-svtor", s->init_svtor);

which is a one-to-one replacement.

Suggested-by: Markus Armbruster <armbru@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/arm/armv7m.c | 9 ++-------
 1 file changed, 2 insertions(+), 7 deletions(-)

diff --git a/hw/arm/armv7m.c b/hw/arm/armv7m.c
index 530729f42e..8350267d96 100644
--- a/hw/arm/armv7m.c
+++ b/hw/arm/armv7m.c
@@ -311,16 +311,11 @@ static void armv7m_realize(DeviceState *dev, Error **errp)
     qdev_prop_set_bit(cpudev, "start-powered-off", s->start_powered_off);
     qdev_prop_set_uint32(cpudev, "init-nsvtor", s->init_nsvtor);
 
-    if (object_property_find(OBJECT(s->cpu), "idau")) {
+    if (arm_feature(&s->cpu->env, ARM_FEATURE_M_SECURITY)) {
+        qdev_prop_set_uint32(cpudev, "init-svtor", s->init_svtor);
         object_property_set_link(OBJECT(s->cpu), "idau", s->idau,
                                  &error_abort);
     }
-    if (object_property_find(OBJECT(s->cpu), "init-svtor")) {
-        if (!object_property_set_uint(OBJECT(s->cpu), "init-svtor",
-                                      s->init_svtor, errp)) {
-            return;
-        }
-    }
     if (object_property_find(OBJECT(s->cpu), "vfp")) {
         if (!object_property_set_bool(OBJECT(s->cpu), "vfp", s->vfp, errp)) {
             return;
-- 
2.41.0
