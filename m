Received: by 2002:ac2:5544:0:0:0:0:0 with SMTP id l4csp2583455lfk;
        Sat, 11 Dec 2021 11:11:51 -0800 (PST)
X-Received: by 2002:a05:600c:4e8f:: with SMTP id f15mr26322725wmq.76.1639249911575;
        Sat, 11 Dec 2021 11:11:51 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1639249911; cv=none;
        d=google.com; s=arc-20160816;
        b=IP9kxEj4YPTzXdtiHCyYmNec76m3mHAn8gLoL3SUzrRqMVdALm0avW/uGNv+PqDxfs
         H/6ThsoYzJe6yrUrDvdw2+/M/Fa1rmnoiDGlaC6+RzhQr48P/er9RYIPYPi3Rhmm1y1X
         zHzvMimt2DYxMqkPy8yZIGgJI4vo6V//po4bTm0shCr28NphXFeUnkMDzQpj9vAXZIRS
         TIJQ2i2LFecCbRyMcl7w4uPZuWv9cF+TwZFoAdrY9Os4f7JjEwmGpmZGfwAvYVRa0k62
         +BrOUM2N74p45SYMT/Oue4cNkj4As0xjlGJk0CIClgCnA9ve7/hYaf3269GL3ubwB+53
         0kCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=svyDuO08plqqfke9+oyDo+51L/6esQWi/ZoR3/dgCe0=;
        b=ulgV9aJEKx1PhCHYEcgm6CiDb7NCNuxKpx7uX2Nxk6iRSQsmZLJkthxULGuXlQ2zBt
         0FGazJpwDvH6dN5BpunJvW2R3HiZh58x7WxO1T3JvR+70FG4jx/aGwZUSnKkfcIMqA3c
         7xxNT+nYbyNuiIDq5OGUJxVqMUx+wumkuLIJsonIECrr8s52IWUuZ0pz0+Ru/45VARDl
         jMIfMzCxXjXplqnB6WNGcFkqxeBaV6mZYgxuA9QG3tuZ6UcPftKOyklz02YT7TiKpsSd
         y1XyWHLhO729w9d9PqS3Qlok4k8hCjlUIzWzbMuMIGu9X1S8Y73sOYq/yj0AV27ruMeT
         JiQg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=a3k3KJWu;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id f8sor1039228wmg.26.2021.12.11.11.11.51
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Sat, 11 Dec 2021 11:11:51 -0800 (PST)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=a3k3KJWu;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=svyDuO08plqqfke9+oyDo+51L/6esQWi/ZoR3/dgCe0=;
        b=a3k3KJWuEzvy1ztXgvlmCp4M6VN0cT4u0EzIb7X7ypAZ/kazvYKVN6Iea4o4C47BSe
         O8BP86150gTusj9Y2rITLpBKph03k7B+W9oorGVVyTPHjN0JdTIz2SC4AhVvkXrVfg7v
         FKj7eXin6J5URrNIUTagcXV0aAUZlqk3tnrl39xoR/obH1RchlqlAQVj7+Buo8UiFyWF
         kyXnJy7IbiDkILdAa74DK1rIqoqkqNylrUWqnZ+gtfS9OzGmTofY4l5P4mzT/sXexhNE
         BaFa1QkdqamgeBRtWN+IJAefhnb1qQcjkm2ASsfe+BkM3O5N5arQkhE0fq7UA6km5m91
         GXqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=svyDuO08plqqfke9+oyDo+51L/6esQWi/ZoR3/dgCe0=;
        b=CkqKl469KPnpkDLjdnxvUbEIfkhc+Vnp6UPBmiI7sXe8Lq60P/4wuo3wO/8a2x3ktj
         pJ0TreYw7/1zZ4Gmj1NzT0+6KcgyMVZCupj3fBawXZM8imlqrjMfZMUC66uGt5DYUePc
         xwM6GwCZu1TAInLP+AG99c3CSV+14sLaZw6IEyILqAVvDYuztPVQYTy+Er4+p9xizz+H
         AVCJ6mgNoKdMfRBjerg7WCW2IxBlSnFx3NewOg0DcJeXpJQcEprk9YCCuU/suirA/Coq
         Ii2WNv+cu2dDV0Sucy5Nvk4btP9G1pbOIbIPIbZywhiaPVVm5sfX/R5d8PbLSOMCbGk4
         oXnA==
X-Gm-Message-State: AOAM5331UAjKv5Z1J616EvQd/loGyFmEkhpcz474f2slTDSzVKZxgt9l
	iwAb2rKF8Ql+0mvy8yKETyHGcrmplDVCuWzn
X-Google-Smtp-Source: ABdhPJx/gsv2aHjPQvNoag23Tf4OW+HcMBUI4fXiJ4a3VR4+NuWF46mpDQIaJRRd25Um6WRpL6pHmw==
X-Received: by 2002:a1c:a982:: with SMTP id s124mr20854494wme.191.1639249911294;
        Sat, 11 Dec 2021 11:11:51 -0800 (PST)
Return-Path: <peter.maydell@linaro.org>
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
        by smtp.gmail.com with ESMTPSA id m20sm2205300wmq.11.2021.12.11.11.11.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Dec 2021 11:11:51 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Shashi Mallela <shashi.mallela@linaro.org>
Subject: [PATCH 18/26] hw/intc/arm_gicv3_its: Fix handling of process_its_cmd() return value
Date: Sat, 11 Dec 2021 19:11:27 +0000
Message-Id: <20211211191135.1764649-19-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211211191135.1764649-1-peter.maydell@linaro.org>
References: <20211211191135.1764649-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: raYuI6DdLPeR

process_its_cmd() returns a bool, like all the other process_ functions.
However we were putting its return value into 'res', not 'result',
which meant we would ignore it when deciding whether to continue
or stall the command queue. Fix the typo.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/intc/arm_gicv3_its.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/intc/arm_gicv3_its.c b/hw/intc/arm_gicv3_its.c
index e6b380f663c..32cf18c10af 100644
--- a/hw/intc/arm_gicv3_its.c
+++ b/hw/intc/arm_gicv3_its.c
@@ -676,10 +676,10 @@ static void process_cmdq(GICv3ITSState *s)
 
         switch (cmd) {
         case GITS_CMD_INT:
-            res = process_its_cmd(s, data, cq_offset, INTERRUPT);
+            result = process_its_cmd(s, data, cq_offset, INTERRUPT);
             break;
         case GITS_CMD_CLEAR:
-            res = process_its_cmd(s, data, cq_offset, CLEAR);
+            result = process_its_cmd(s, data, cq_offset, CLEAR);
             break;
         case GITS_CMD_SYNC:
             /*
-- 
2.25.1
