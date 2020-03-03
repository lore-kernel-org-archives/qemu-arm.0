Received: by 2002:ac2:4942:0:0:0:0:0 with SMTP id o2csp640661lfi;
        Tue, 3 Mar 2020 09:50:11 -0800 (PST)
X-Google-Smtp-Source: ADFU+vsJ8Eb38Du5UU0Km3f0kUp9Bkg0YvyHpL7lZoEpOjX9ZFHbuhZxSF3z6ib3RYKHfWh/BL9s
X-Received: by 2002:ac8:1194:: with SMTP id d20mr5535122qtj.243.1583257811119;
        Tue, 03 Mar 2020 09:50:11 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1583257811; cv=none;
        d=google.com; s=arc-20160816;
        b=cbEz/RjJX5VdO/C1M2qL5FYohmF3Lf1PrFkYdDUKnTRua/GqFUCTQsDnYQO44TGd80
         J6JH9KEmEfiahXJilVaNiGZ2BpiKuvhYMRO51+BV1DLFh4UqdfAn6vyEb7zZRxwMm2jn
         Qq5dAcgW33WJpTPFnyhO6nPUrNBx8UGHocWnS5TtsMQG2uOBY8LnV4QGuhC5582UMr/b
         FHPf/LnDKC8jkEDEe7Yofuf6fmxkawRgc5i7R/tBVTrQiuMUy/YDncL6gbK7XzMhkD1n
         7CX9qi0p/ltf3rHq0f9Kcl8phzX7kmiDGcjxTncQgMCSjiJEocqs0u6utpGyJ8ISCXDP
         JbdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=BW8r3OV+Pyq8lB5xngUwKNwFXrFswSLDbGpWItcOSxQ=;
        b=yxnccQYWBWR7qoLhzaV1xFAmPUXdQgZW2scW2tfjhKh8as7xnIjrrK/k8LpWNbgFDc
         MCEaC6as6tQItSYYN9Ffmk2cMhEe58MHAHeXrG8fQ8/MzanfRRsMdl0vb5KYuG8LxexZ
         3SJHirKN2sEiWqhe80swiD9sHPTiX4K9e5xpzH7ok58CbIPMv3qJe4l5w+YVaa5U3yZy
         VzJVIVvdHDuLylKD81w2P8oxDpkJcOSYdCRg94aoq8MgAsDMX/ZD01vZoLBigS0fJwOP
         5QYqDSni2oH67Kai5lgEjAYSPtpZjJJ6RmOuJljnbcE8G28xWs4gfHqfAyzPrO3mNh3j
         maoQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Q4PtLl7+;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m55si5635931qtf.194.2020.03.03.09.50.10
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 03 Mar 2020 09:50:11 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Q4PtLl7+;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:51212 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1j9BgI-0007fE-HJ
	for alex.bennee@linaro.org; Tue, 03 Mar 2020 12:50:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41100)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1j9Bg4-0007Up-18
 for qemu-arm@nongnu.org; Tue, 03 Mar 2020 12:49:57 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1j9Bg3-0006JV-2v
 for qemu-arm@nongnu.org; Tue, 03 Mar 2020 12:49:55 -0500
Received: from mail-wm1-x344.google.com ([2a00:1450:4864:20::344]:35825)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1j9Bg2-0006J7-Ti
 for qemu-arm@nongnu.org; Tue, 03 Mar 2020 12:49:55 -0500
Received: by mail-wm1-x344.google.com with SMTP id m3so3813842wmi.0
 for <qemu-arm@nongnu.org>; Tue, 03 Mar 2020 09:49:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=BW8r3OV+Pyq8lB5xngUwKNwFXrFswSLDbGpWItcOSxQ=;
 b=Q4PtLl7+HZQYu7VMFn3dxi920sKXxwV2P7w6itTsq8iyzTwEfwZfG4aIul8mqwqMed
 R8qJV4HoFvWmm/tYYMEzQhEuHpxHqWzQH+AEi3VL7R76f6Cc6MRFmfJnLcMwwoWamjZU
 lMsEvUE/rqBF5jYRITmWZzSEIONBa8D7tb2hDeGbQ9IJtV+4yNwkU7fKUxsu9jBxDi4c
 mNMCSQ/L/VWbFnXbQF9zT39dg0NwNUrgvUeikTTXXgmiqctHiDZdmNOa3O4lz2tbgbKt
 EA3nCznqn6DHBOtb+/l5DgXlzYoU8Su925O6k8JoLV/+NnNoc0DPbzG5dzxAmwh2kHPh
 EtgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=BW8r3OV+Pyq8lB5xngUwKNwFXrFswSLDbGpWItcOSxQ=;
 b=S0xJ2LIpr5k6d/m0Gr/GTvTNpXXhcZ5+o2+tm3EKOK5SRFs9jPikpYKM15VsqW0xSV
 7k3WSeLhRvMWOEfaePd2IMP2OfjlK2+prIrK92LaUSPXDqdDKq0kdwFrJflr7ds3AzmX
 4yo/AhW56i/OkSukc3+zX8cmQW5PmwFjBkpnly2GTL3EmD2UcH7llxomCG87Y+nUFHPQ
 wT1PdLeWfCCtRTFZ46WjAGHTjdBuA3MM56grc63tEAAQzp8ZyhGAgYSstW1cSnjJ/8Lr
 iyW4+N6Tw9gXzNR2Vie6kmIrAQzERBtSPuXhhWi1rO42qdUwzMV/drGXXd4MRRSebJaK
 brQQ==
X-Gm-Message-State: ANhLgQ1z1/501zEFA97PMwr+XDuK2EYBBzTE9hvciGocDxlF7qaA2Jqs
 7pP53ubbdEvzyCH268ex+xAI/HN3dAAqKw==
X-Received: by 2002:a1c:4b0d:: with SMTP id y13mr5450958wma.4.1583257793657;
 Tue, 03 Mar 2020 09:49:53 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id d63sm4867576wmd.44.2020.03.03.09.49.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Mar 2020 09:49:53 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 1/4] hw/intc/armv7m_nvic: Rebuild hflags on reset
Date: Tue,  3 Mar 2020 17:49:47 +0000
Message-Id: <20200303174950.3298-2-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200303174950.3298-1-peter.maydell@linaro.org>
References: <20200303174950.3298-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::344
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Richard Henderson <richard.henderson@linaro.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: j9Bci9Gqk50D

Some of an M-profile CPU's cached hflags state depends on state that's
in our NVIC object. We already do an hflags rebuild when the NVIC
registers are written, but we also need to do this on NVIC reset,
because there's no guarantee that this will happen before the
CPU reset.

This fixes an assertion due to mismatched hflags which happens if
the CPU is reset from inside a HardFault handler.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/intc/armv7m_nvic.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/hw/intc/armv7m_nvic.c b/hw/intc/armv7m_nvic.c
index a62587eb3f0..1ad35e55292 100644
--- a/hw/intc/armv7m_nvic.c
+++ b/hw/intc/armv7m_nvic.c
@@ -2593,6 +2593,12 @@ static void armv7m_nvic_reset(DeviceState *dev)
             s->itns[i] = true;
         }
     }
+
+    /*
+     * We updated state that affects the CPU's MMUidx and thus its hflags;
+     * and we can't guarantee that we run before the CPU reset function.
+     */
+    arm_rebuild_hflags(&s->cpu->env);
 }
 
 static void nvic_systick_trigger(void *opaque, int n, int level)
-- 
2.20.1

