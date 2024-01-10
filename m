Received: by 2002:a17:906:6951:b0:a28:f940:7a27 with SMTP id c17csp1258796ejs;
        Wed, 10 Jan 2024 11:54:16 -0800 (PST)
X-Received: by 2002:a05:600c:358f:b0:40e:4156:6180 with SMTP id p15-20020a05600c358f00b0040e41566180mr430391wmq.146.1704916455757;
        Wed, 10 Jan 2024 11:54:15 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1704916455; cv=none;
        d=google.com; s=arc-20160816;
        b=Ss5mfXbAuNL37DNL0AuiK1PVixJ/d90JhZGKzyG3x9xTlvXZix3QeP+MNzewSnYD/w
         3NTEQ1NLDT3Gi56aG1b6NabUwC12Wcq8WGF7RkdSGJHpIZnFrJ9dkijt6dyR1q3taKMa
         TvnEqki5W+lItaviloPmw7TuHaLmBgfVN5LkY8RoDXoDmcC09tAqJ5Z0IXPsNaAsQrNd
         3b3UJZ8kOUjLyz/NoVnCG1KuhgWENxbsFf441htPCbgwF5wElUsWx6srE4Yti0kn3Bot
         UwOklwoqyLuMzhWk/XMCqMjvSm88f3DMejv6va9NXfp5pdD6D7QfM7rsSRWomNmbxw5i
         BLaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=5n6b/Kfb2q1nuszk7kQnrf8+ZzcUeVpd0islGk5jF8M=;
        fh=0Bn9ysFO5uhdOoEvdDNDnkwY7yFMuDt2XLw3k0zcWt8=;
        b=tny4ppMgbzFFNK9/b/Y8vJYc7b57yk+kQIkmmpRA4KIKBoJILdUAdGMB5KCU8n07i0
         X+AQ6nAJe4LgW3h/Jq5ZP3pbMB0L64KbCSa7pcI0Hm0aDyIPuMILCdlRHd6RA2Cn5Orv
         3JmYEUkn5mv0lJ3pYZwNT2xM3zhB48FWEL2C4fCYYZjfaYuFPIwT/kbrlHKHvyjrNgsW
         hcaH7GpsmYzceiDQzi59flOSBGpAqFwOyoeMpW9dn+F8CO1z7x5Qm9XNataUAzf/W/YF
         6s4at2ja2HPcmd56hucn1xpCSgGbrbbCC3bJS9qwYEGs212kymSAVeWbUFsUU7oOl5dy
         VPGw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=EEtEpQzX;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 6-20020a05600c028600b0040d7fd44912sor2064091wmk.4.2024.01.10.11.54.15
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 10 Jan 2024 11:54:15 -0800 (PST)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=EEtEpQzX;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1704916455; x=1705521255; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5n6b/Kfb2q1nuszk7kQnrf8+ZzcUeVpd0islGk5jF8M=;
        b=EEtEpQzXp/WCiZzUWpXlUYfxNThx6+h6wCWlxN3M6nqGBLqMWUFwgP1GvMyNPkLni7
         Oskv5OJyVMdYPC/EZ3SNMIi9LsDUaryhzWy5ejQsyVsfyosXqDcGcb+iRYhmMu0RyjRb
         CgNd/UJa08EPTm/xZ2Vuq0KF1sfVpayUw9LhoSIxbWMdbv3i4hUTxW+XXJERjNOytDdR
         HCB+cMvV+FPOYuSfW3W8Vbvh5TDg8aAHBazdOZstAvVR5x4J9V2ElGQCeqokXR5LQ9Ou
         vynytHzbCNTCFK4BuhUcxUovtwJXPJnFx0INc+57bhigGMCDM34YWqe8QIRpJqfQh4pU
         Sspg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704916455; x=1705521255;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5n6b/Kfb2q1nuszk7kQnrf8+ZzcUeVpd0islGk5jF8M=;
        b=myrbyr5EeAtlobMteKWdYfLx2lk+7E29lEmlXvVbChDtwOumRHeNcaH9PIcXKpPHgC
         kg0YzVU8y4ibkJm7KEHD26xriCdNROyTC6wSbHHs4lYQ2RzeFDJX07sR66hMHJVyk1Jn
         A7lTJasuFY5Y4x+QyGnCmMvNJKxuhqWo9zEuAT+qs0auw+ObC/P2INnL9FxDIG58Kcqd
         PhMWVaqZ/UXdp41RZyvU84/nOu+Tt5DApGn06ydfVdd4Cx7KGN2GiZgU/Ymc2eCddMy+
         7y9Anjc8DGSAUjeM10m0fYX6vCV0m1nt5qOzvrCxePD0b0kY48pUQR4nAKGcRB0C2xsu
         Y+uA==
X-Gm-Message-State: AOJu0Ywd8H8lWmp4YsdMIpFulU5SDrOGOiQEfPxh46I56CP3hx5Hvx7/
	AmyplNddmiuqI8lcjNydgtVAvzly0hIocVR6
X-Google-Smtp-Source: AGHT+IH8sOsgTZDUqFMN3Ep1ODw2mDHry8n2BVIQjjK05VVGEZgLbzTvarQBOazX7WqS2O+WNNjfgw==
X-Received: by 2002:a05:600c:538e:b0:40e:5cf9:9826 with SMTP id hg14-20020a05600c538e00b0040e5cf99826mr4786wmb.127.1704916455452;
        Wed, 10 Jan 2024 11:54:15 -0800 (PST)
Return-Path: <philmd@linaro.org>
Received: from m1x-phil.lan (vau06-h02-176-184-43-236.dsl.sta.abo.bbox.fr. [176.184.43.236])
        by smtp.gmail.com with ESMTPSA id z6-20020a05600c0a0600b0040e49045e0asm3209717wmp.48.2024.01.10.11.54.13
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 10 Jan 2024 11:54:15 -0800 (PST)
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
Subject: [PATCH v3 06/14] hw/arm: Prefer arm_feature(THUMB_DSP) over object_property_find(dsp)
Date: Wed, 10 Jan 2024 20:53:20 +0100
Message-ID: <20240110195329.3995-7-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240110195329.3995-1-philmd@linaro.org>
References: <20240110195329.3995-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: 8dzMBYwc55+L

The "dsp" property is added to ARMCPU when the ARM_FEATURE_THUMB_DSP
feature is available. Rather than checking whether the QOM property
is present, directly check the feature.

Suggested-by: Markus Armbruster <armbru@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/arm/armv7m.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/arm/armv7m.c b/hw/arm/armv7m.c
index 8350267d96..0a7ad2b762 100644
--- a/hw/arm/armv7m.c
+++ b/hw/arm/armv7m.c
@@ -321,7 +321,7 @@ static void armv7m_realize(DeviceState *dev, Error **errp)
             return;
         }
     }
-    if (object_property_find(OBJECT(s->cpu), "dsp")) {
+    if (arm_feature(&s->cpu->env, ARM_FEATURE_THUMB_DSP)) {
         if (!object_property_set_bool(OBJECT(s->cpu), "dsp", s->dsp, errp)) {
             return;
         }
-- 
2.41.0
