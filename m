Received: by 2002:a17:906:6951:b0:a28:f940:7a27 with SMTP id c17csp553125ejs;
        Tue, 9 Jan 2024 10:10:25 -0800 (PST)
X-Received: by 2002:a7b:c7d6:0:b0:40e:4833:5da4 with SMTP id z22-20020a7bc7d6000000b0040e48335da4mr1494751wmk.0.1704823825499;
        Tue, 09 Jan 2024 10:10:25 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1704823825; cv=none;
        d=google.com; s=arc-20160816;
        b=ZlebaQkeLK4CPLVpOagUf3sj8xiUUcTOD4ZIK56rIm1niEQ1oe5epX8YxA4PnngMuh
         +4rExeC/BXnHhV00jlqJGps443bJpJiyagOLVT0bIljgQU4Os1iV2iC3YirRmR22lOEA
         K8lEFxqNSmgNV+a570mtisXZYLT5rBuyYTOxJBij4pCSTKCJLEgmzhN7SRcxqBjI1Set
         yTgjOa4fROd+qz/QnVSNWMHbsoLJJ41jqxYTCgwjqzJrj3lCRtn2sw/27wFyGxa1VXqK
         VnRdSTcOv7yGZKmWFRuhHaL4Smf3EdZL030hWG/HNFX9ZwS5LWKmOeNgE96rJmvlwE4d
         +t+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=4lFs+peHffZXBVVkShWxuZ7VjcO+rV+nUwkZ0/LL7Zg=;
        fh=v69mdd+nxs/0WeTIWzLZOPCx0ynE2o0vtvId2fSwkBY=;
        b=ux2lKLflXhGWj8Q87auDHN0y3PAhkm4baG2uvhsmnqXn4Mmi30mpFsCGtwnoY12Z0D
         jEpf5SDGVRWzysf9P2FOItOf3CA0GCcY3WwfQTgj3kLr1XpBlrALrCt2IlvPh9xA2+mG
         w6DHOyeFofF9gcC6kfwxrypV7kSA+ogK8MFEm/PeEy6AefToGXcAF68i6UsYgisySRT8
         aa3xN3JZYXB4gelhQsvfCQAgMOViPyGk6sAjw2rC0RvG/2bRfYrVMzFyhLqMauo6cxbt
         NvuF5KpxbQ/uwOk9LKa7YEy2rY0qB+dVe9J5zbNsqXUh7dvn3wSwbg01TwaCSwbUBt8M
         lE2g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=K+6b7ugh;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id m39-20020a05600c3b2700b0040d6e097c69sor1056880wms.2.2024.01.09.10.10.25
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 09 Jan 2024 10:10:25 -0800 (PST)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=K+6b7ugh;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1704823825; x=1705428625; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4lFs+peHffZXBVVkShWxuZ7VjcO+rV+nUwkZ0/LL7Zg=;
        b=K+6b7ugh8TgX3Rx+Rj6Kw1Vw3i9H/oAy1NfIYWS913lSFckKpYb9eSN0XXjijpFJDg
         oFJ8rE7cok3HBd3XJVb+aGUvuSBkNMXM/HwpjdMyRRCEgg0nspsuqBAi8lnpWnfwnasg
         QQSKL5hezqRfyGqbsCv7qRC0AbqfV6ZpLHXZCC5BP8yk4FhhJp3X4PFSRVM6ohGTKmUc
         V82J7ev7GAQgJMAcdLimUiite3GwIF5En3po1/3jjCv9fG72frls6fcL88HasgZT8wpq
         hoYZ0qEzMBPOdrlZxeSZfFFODzkQGeCGe3CJDaM8yrcPOp8WgE2R1x+wuaVhvJljG5my
         ag4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704823825; x=1705428625;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4lFs+peHffZXBVVkShWxuZ7VjcO+rV+nUwkZ0/LL7Zg=;
        b=T1vUUmi3MHJ45FyOacBq2bEsE6fyyv6GdNRlivFed6E7b+UlM8EfHbYxJEahubMAwL
         cV+Bi62mLZwJmpNoxhgm1RNmG+rDD70YMnQetKBT7lKlkGZKE45iq42HC2LtAx/m2j4W
         nbaW6/sFDxg/i7rg0WqcqResikG9ufdFU2Lav7xzMhrawiD918FgOEvA+HEqLop0q6JJ
         PvIE4RvKWmClW/GfpfXI2N3VGdnMH5nbtus0LquYWKJ9jwnhXrnNpH+T9oG00P8pm213
         Xw8sVPCjnrz4VV6vbooABdzHVfU9UICQCiqfPD63LFz/EGkOm/11N2QWWM0AXojYD95z
         srRw==
X-Gm-Message-State: AOJu0Yx/ZXNNBRz6cyqj03DZtXBWWJrc9H65aPxLshakAdjFmLSKE8ov
	oPNyqxKKZh+eXyMUNA+dkRkqeEKr1vpgPl/l
X-Google-Smtp-Source: AGHT+IEGHFLG0iHvKFqIy/F5s5ED2yVLqMd13FUOQDWy1aiWFAwOslzm5seU52dNFSOuQwbSjsxr9w==
X-Received: by 2002:a05:600c:3143:b0:40d:7247:b00c with SMTP id h3-20020a05600c314300b0040d7247b00cmr3411464wmo.163.1704823825185;
        Tue, 09 Jan 2024 10:10:25 -0800 (PST)
Return-Path: <philmd@linaro.org>
Received: from m1x-phil.lan (rsa59-h02-176-184-32-47.dsl.sta.abo.bbox.fr. [176.184.32.47])
        by smtp.gmail.com with ESMTPSA id je4-20020a05600c1f8400b0040e38b7cfdasm15763276wmb.4.2024.01.09.10.10.22
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 09 Jan 2024 10:10:24 -0800 (PST)
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
Subject: [PATCH v2 08/14] hw/arm: Prefer arm_feature(V7) over object_property_find(pmsav7-dregion)
Date: Tue,  9 Jan 2024 19:09:23 +0100
Message-ID: <20240109180930.90793-9-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240109180930.90793-1-philmd@linaro.org>
References: <20240109180930.90793-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: 3Ae96YzHijE4

The "pmsav7-dregion" property is added to ARMCPU when the
ARM_FEATURE_V7 feature is available. Rather than checking
whether the QOM property is present, directly check the
feature.

Suggested-by: Markus Armbruster <armbru@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/arm/armv7m.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/arm/armv7m.c b/hw/arm/armv7m.c
index 0a7ad2b762..7f15318ae3 100644
--- a/hw/arm/armv7m.c
+++ b/hw/arm/armv7m.c
@@ -338,8 +338,8 @@ static void armv7m_realize(DeviceState *dev, Error **errp)
                    "mpu-ns-regions and mpu-s-regions properties must have the same value");
         return;
     }
-    if (s->mpu_ns_regions != UINT_MAX &&
-        object_property_find(OBJECT(s->cpu), "pmsav7-dregion")) {
+    if (s->mpu_ns_regions != UINT_MAX && arm_feature(&s->cpu->env,
+                                                     ARM_FEATURE_V7)) {
         if (!object_property_set_uint(OBJECT(s->cpu), "pmsav7-dregion",
                                       s->mpu_ns_regions, errp)) {
             return;
-- 
2.41.0
