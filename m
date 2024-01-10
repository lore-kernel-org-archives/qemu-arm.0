Received: by 2002:a17:906:6951:b0:a28:f940:7a27 with SMTP id c17csp1258591ejs;
        Wed, 10 Jan 2024 11:53:48 -0800 (PST)
X-Received: by 2002:a05:600c:468c:b0:40e:4181:a549 with SMTP id p12-20020a05600c468c00b0040e4181a549mr571249wmo.163.1704916428111;
        Wed, 10 Jan 2024 11:53:48 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1704916428; cv=none;
        d=google.com; s=arc-20160816;
        b=QXF0G4btFswt/FevZzjhcYbco/WLH7u+vW5J7WynmedU4jnPBdjeN3co97ywzLMoev
         F2w2z504Oz9e3oVayEaammflEvyZeun6OWKLiXt8ofFeNPENheySLIQyo/z0KqQ8VUp/
         WlorRAuukkvE9DJIcHCRuowUe9qgQMma8Ip7Q8ooGWAgaxvL7wqgN7QEk09RZ3GMFRk8
         NOQn6jzDsx2IM8yWVIBhxXL/MX9hD93b5uJSk7tDkRD4sLKCU5gXWM4+xjKcsJVw8AES
         c28wMaxS52k0F7PPsMP9NhMbBqyfjcmXxbBPC/XUTVITyNrrdmwDRsuw987SL+Biq2yz
         OHXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=mdirajlt6qC945MCVDYIpUTSXSVbweTZjiyf2mppVOc=;
        fh=0Bn9ysFO5uhdOoEvdDNDnkwY7yFMuDt2XLw3k0zcWt8=;
        b=vnDJ05ifHPg3jzrpXMXMNZksgMcmp11HWJTeXGmjBDEM5sgmtbcmH/EOCEDHoi5CeO
         8ksuHs1bihr4SaJdjW61cZGH5sToeRF0WfsR6E2PV9gMHNzpALgzTZGN8NH8e7t8iE2d
         HwNIdjs13WNVJ/K3Bo7gQj4QPp5u3Y3Pa4tLdWc1t+j0QPPLaY5H2olUT68aU+QxP17I
         ftcVHzhIKan9vHeqc1jfuK/F1A4tQ9fiaSEqXOkpWps7Tst+HPV7ldL68pXlgYN6lTon
         dqSRWbU4R8kFq/VU1x0d9DJh7G83j4+ScIYliCu4HgN/BfOe2SfCxUzALJ6M1Tx3vFf9
         kuAw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Slpojhwn;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id z14-20020a05600c220e00b0040d4f2d8455sor633335wml.5.2024.01.10.11.53.48
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 10 Jan 2024 11:53:48 -0800 (PST)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Slpojhwn;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1704916428; x=1705521228; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mdirajlt6qC945MCVDYIpUTSXSVbweTZjiyf2mppVOc=;
        b=SlpojhwnsE6EfCdFvlA3RwNjOQQzb+aD/ociKHHgT5WMlOGm1wqmUWhKmVQw7XG6ZK
         mWwGACVv2aca+/OQZ1uyzFaWwKu3jCl081ixWS6tjK9C3lhXbMCpkpfL7jclMGNjy7bI
         X/giEk9wMzcvFPsGNzrmErf7hlmPWW8hVr1cesItV+n7CJJl+PrgTf+92bWmr19SR7cL
         cnpDrTF/8fU7jBUiTxMMZ0TaOAEimHtZE90xwInm8AOTTGBX/D9YbFUWN61weYeHkvbB
         4/uEchedilWAtC6bJZ/Hdm8f9jUQ8D7n6Pt7temS3xIUAyleS180pcwEP7kNp/RsYV3i
         rClg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704916428; x=1705521228;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mdirajlt6qC945MCVDYIpUTSXSVbweTZjiyf2mppVOc=;
        b=F+87qRWM4BlFX07Qn3VTVPUOlQyWqRSdwYEziq2kLL50nSzvJM6XdrZ8YUDzJgDtZF
         velHVn7vO4vcAQdeJEXrtuwjrAzydGoRErjhlzz61WwqvhEYkNrZqXiIsdRht7UdzS5w
         XhpZimGlFwX9tloCOw/m1j2f45Zs2VZbKXW4d1+wJ8haxA0namgISktJEy4ijUtvVYHD
         gg5Z8kSaTm408p5c16ZxvGYBLPjxzeFH87wQ/jgoMZi7zRbHayMqa5xsn4od0t3o+cli
         a51kKAdJZWVZKrvJEWYdZyTXbXetAE66q957DfARli+ydG0pXAssNVqkM0gqkv5Fb4tZ
         bcvQ==
X-Gm-Message-State: AOJu0YwlvIR4nC5qjPqKW/7Y6olZAgfZo2Yo5FeJWPygLGvf4AY+GCFl
	oGdIdNQxqukKeluc+uxgqedLIbD2SXsP2bKf
X-Google-Smtp-Source: AGHT+IEM5mBA0vZDP7an5Du71JWNSy2KsfIX9laU0cGrvyWevak0CP3DGoYOyKFOF1yj1S3cqIiJHw==
X-Received: by 2002:a05:600c:35c9:b0:40e:4557:4d0a with SMTP id r9-20020a05600c35c900b0040e45574d0amr515035wmq.252.1704916427834;
        Wed, 10 Jan 2024 11:53:47 -0800 (PST)
Return-Path: <philmd@linaro.org>
Received: from m1x-phil.lan (vau06-h02-176-184-43-236.dsl.sta.abo.bbox.fr. [176.184.43.236])
        by smtp.gmail.com with ESMTPSA id k20-20020a05600c1c9400b0040e54f15d3dsm3212195wms.31.2024.01.10.11.53.45
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 10 Jan 2024 11:53:47 -0800 (PST)
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
Subject: [PATCH v3 02/14] hw/arm/armv7m: Ensure requested CPU type implements ARM_FEATURE_M
Date: Wed, 10 Jan 2024 20:53:16 +0100
Message-ID: <20240110195329.3995-3-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240110195329.3995-1-philmd@linaro.org>
References: <20240110195329.3995-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: bBfqraEu/Tdk

ARMV7M container can only accept M-profile CPU types.
Check requested type is valid once to allow further simplifications.

Suggested-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/arm/armv7m.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/hw/arm/armv7m.c b/hw/arm/armv7m.c
index d239468558..8900730e53 100644
--- a/hw/arm/armv7m.c
+++ b/hw/arm/armv7m.c
@@ -300,6 +300,10 @@ static void armv7m_realize(DeviceState *dev, Error **errp)
         error_propagate(errp, err);
         return;
     }
+    if (!arm_feature(&s->cpu->env, ARM_FEATURE_M)) {
+        error_setg(errp, "armv7m: CPU must be of Cortex-M family");
+        return;
+    }
     cpudev = DEVICE(s->cpu);
 
     object_property_set_link(OBJECT(s->cpu), "memory", OBJECT(&s->container),
-- 
2.41.0
