Received: by 2002:a17:504:998a:b0:1be9:327d:8ee3 with SMTP id i10csp3808378njn;
        Thu, 16 Jan 2025 07:01:36 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWdm6m/cB0mInYHNbhnF4g7qPOedeWTF2BUPDNc5HUSKPo5quu2ojKUGsDgG0A1rFDL1NM/ZASCVX5gCg==@linaro.org
X-Google-Smtp-Source: AGHT+IHN0ccYIapPuF/JYYFoRMx9zS2ockM/I+M7kHZ7lvj28gKT5LPGC8wQILekFzcc8F+O5OaA
X-Received: by 2002:a05:6000:710:b0:385:e0d6:fb73 with SMTP id ffacd0b85a97d-38a872da4ccmr28413019f8f.15.1737039696491;
        Thu, 16 Jan 2025 07:01:36 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1737039696; cv=none;
        d=google.com; s=arc-20240605;
        b=eLg5jtSXwJvtl/NEEsrarCBj7MixkgHyechMeS/auDer3tnYdr1xjxSbY3ntSEy7yP
         mi4eAvrvQVMEbzf3QkHeq+9m9iK072jmVO7VWhu6YvLVACk3MS4bCh9Q1f8N6b+3Qoed
         IwoazX2hDUG2/n8/hFHOHb8cKl0pRDCqKhaW1IKdfOXMrdPFGXeBfv1hEUpYM35lEGiz
         m2r3lNWFpexrpTf1dOIGehAirWsqDiKKNkXwEMMCefSGNdQHby5X3SDuy14sXnBv62Mg
         szlD8WIiQ2AZZgZ1Nu2CPV/t+DPasONdegA+yet6b0hIHj+KyeQGA9GsL2J+FHKyzmNc
         VZZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=lzaMM/optD2vwl9fO9YSInAfvs4juuVTuQgymT75y4I=;
        fh=27gvLr+Za8ChlrQomVfoZ4LwEVQPDx2id32F04gQvjQ=;
        b=Fhqzt80o6jvA10SPChZ6RGlj0kgR47LizTllODY+oOcXnX0OHep3LDDvhYaOzdPKEW
         BJMP3YofK/mRecQN2Gojwdek2GFmtOKomYfYLVH5Iz3Zw8sdjPvY56PGnRcVqJujcdzo
         ROwjLgKZvTxL8xqIhbeFZ1qB8gviwXnoHpHU0YXnKGbfv5vV5IeBPNbrD4WFk2Ul0UuF
         bE46WDu6XZSlB0sRuaGJHX8Km96txcggECv5abvaTmlxkzxHnI+jSnrr8AOpYTNx42DX
         7kggZM9xLzbpBe38Un3O7KDJHEjim/DffCTpsJsqey+2uS915W+2jxzHQJzm3jrVMAKo
         xaTw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=JCjwccNk;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 5b1f17b1804b1-4388b18e03fsi15325225e9.21.2025.01.16.07.01.36
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 16 Jan 2025 07:01:36 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=JCjwccNk;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tYRLk-0001zP-S4; Thu, 16 Jan 2025 10:00:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tYRLj-0001z7-J6
 for qemu-arm@nongnu.org; Thu, 16 Jan 2025 09:59:59 -0500
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tYRLi-0008H4-1z
 for qemu-arm@nongnu.org; Thu, 16 Jan 2025 09:59:59 -0500
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-43690d4605dso6794365e9.0
 for <qemu-arm@nongnu.org>; Thu, 16 Jan 2025 06:59:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1737039596; x=1737644396; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=lzaMM/optD2vwl9fO9YSInAfvs4juuVTuQgymT75y4I=;
 b=JCjwccNk/UcRx0aa8OWOARQBLyjFjuJlMDkdAMtgbRlC2WmHnBw+k8tr/6HhdaiNiB
 4Y3HygaE5E5iCo74ef/Hv3zLzP1KtDMCtUeGLC/buXxwr70M8SBnu6eY4v98oT9xj/Dk
 +hz/QNDdXL5X5LEYX/MaY8VbKYamHo3aYYeAtDypU2q83cU/XExQbzowDFG0YvPGZHZC
 xO9gbxxjpIJE7BAi0lxrbAzWBKQFJnM1F7MHekeWrV7kurc6Le9mupiDkC9vemTdTKOk
 mCIxGWrk50oXmU2VMHnhHbCANdboFODZQ530WuWyE50VFPoxwcIa2QqujenuGhWZANnl
 EgLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737039596; x=1737644396;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=lzaMM/optD2vwl9fO9YSInAfvs4juuVTuQgymT75y4I=;
 b=dLPUWpSU9in/R/FhFWnlAav1mYQMPY/j/atd2geYszpyR6tPzYOi1mdIoNQ195IHUN
 TwjvzpB228us6UVR5yv95qVIPGuwZEI9uS7os9sz7a/L+JEq5pHSDBzMiYAgj2b9kLmq
 rtSiW87HFJBg0Qw2aHILsiQwgqtx/SBAdUaCyxiJf8BBp8AqxOgc8SoBhZ2S29otDWAp
 LFNVSkwMhhzBB3U3GGfjeD7Qaf1C/0fDjWZfTrjMc/ih56aXRc+BWmsvFlG84xFYZqz0
 44RM+p15AliZ0JxyFF8GZ/a9pjBwrtLttTKK/nQh2uuo9gbiQnEmg9GLbZcVYnirI++M
 5mLw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUKJR/XhDunC88RUTsrn8yqyVP9SDNhOYb8bzeI2FJI6q00Y86QH15J3GBoxazr8RfTW0hXwOK28w==@nongnu.org
X-Gm-Message-State: AOJu0Yze68nbY9twlmc9YpMSoOYflM3w9GCqEEp92DtulQzCe9uPmZ4k
 bvgiIBxDp37SmKF/RffXFbpF72a224Z5oHpccnEYWzfTEPIzZPA3WdAQztT2Io4=
X-Gm-Gg: ASbGnct01hPo2hcPY1rOXybomWX4IMC78fMBWgdMrF7dFeHFtoNEE4aaNsUQiK6cZSE
 1Ozo8NtrVm+cPURg1BRuYJmRbF5z146sUBJz1Lw4ZN/DjfmbaPtsXkwhnBHjgQq1bOCNREigCuc
 agh2J9GCGqQYM2QO3mTAiUMOrE1RKWGOzQ/rPiLQNSYmQlNmrMMe/uE55iYPqeGggiQgBsWY5W6
 fc4eML2pXuc0UJGEmky5L/EMZAn+F6c7iqQD7w2iP3ke9+y9nPYLnZ/ecTgKTM/fM+2Er6J+gsV
 3PkX2+yQCIWS1jTKkAfnDgExtX7igNU=
X-Received: by 2002:a05:6000:18a2:b0:382:49f9:74bb with SMTP id
 ffacd0b85a97d-38a872f3202mr33624267f8f.35.1737039596605; 
 Thu, 16 Jan 2025 06:59:56 -0800 (PST)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38bf327e1fdsm64753f8f.94.2025.01.16.06.59.55
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 16 Jan 2025 06:59:56 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Igor Mammedov <imammedo@redhat.com>,
 Andrew Jones <ajones@ventanamicro.com>, Thomas Huth <thuth@redhat.com>,
 Shannon Zhao <shannon.zhaosl@gmail.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Ani Sinha <anisinha@redhat.com>,
 qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH-for-10.1 v2 02/13] hw/arm/virt: Remove
 VirtMachineClass::no_pmu field
Date: Thu, 16 Jan 2025 15:59:33 +0100
Message-ID: <20250116145944.38028-3-philmd@linaro.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250116145944.38028-1-philmd@linaro.org>
References: <20250116145944.38028-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x334.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: hvY8PUYouZrt

The VirtMachineClass::no_pmu field was only used by
virt-2.6 machine, which got removed. Remove it and
simplify machvirt_init().

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Thomas Huth <thuth@redhat.com>
---
 include/hw/arm/virt.h | 1 -
 hw/arm/virt.c         | 4 ----
 2 files changed, 5 deletions(-)

diff --git a/include/hw/arm/virt.h b/include/hw/arm/virt.h
index c8e94e6aedc..27c5bb585cb 100644
--- a/include/hw/arm/virt.h
+++ b/include/hw/arm/virt.h
@@ -120,7 +120,6 @@ struct VirtMachineClass {
     bool disallow_affinity_adjustment;
     bool no_its;
     bool no_tcg_its;
-    bool no_pmu;
     bool claim_edge_triggered_timers;
     bool smbios_old_sys_ver;
     bool no_highmem_compact;
diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 3bb8a9c7bd6..0080577e1a9 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -2262,10 +2262,6 @@ static void machvirt_init(MachineState *machine)
             object_property_set_bool(cpuobj, "kvm-steal-time", false, NULL);
         }
 
-        if (vmc->no_pmu && object_property_find(cpuobj, "pmu")) {
-            object_property_set_bool(cpuobj, "pmu", false, NULL);
-        }
-
         if (vmc->no_tcg_lpa2 && object_property_find(cpuobj, "lpa2")) {
             object_property_set_bool(cpuobj, "lpa2", false, NULL);
         }
-- 
2.47.1

