Received: by 2002:a17:906:d96:b0:a23:4dac:818 with SMTP id m22csp1779396eji;
        Tue, 19 Dec 2023 13:34:06 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHk6LjMov92fjgeWfp40Ggu7U65z4xvoLCahSmVH0tBOjhQOw4MBdAYkTacbTJ2MGFfAXI2
X-Received: by 2002:ac8:7e93:0:b0:427:8436:5b63 with SMTP id w19-20020ac87e93000000b0042784365b63mr583902qtj.33.1703021645890;
        Tue, 19 Dec 2023 13:34:05 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1703021645; cv=none;
        d=google.com; s=arc-20160816;
        b=VG0Ogmqyqu7iZnpuQkJrLUTmQ3svv/jDyQT07GFCa4SsHPljpScCTk7z+udvzuvsIh
         fQiKfis2pypDZHpz6Ajuw++jlPWBtoDySNI33j++ZYqfXBpczRKxM3KvHYLwxiB7V0OI
         s5c72sQN7MhbJqLHkt/MUy6BxQirqllqdQb6WXJ8B6bZ1gjJlRZ9dI/dmry/ygiS+DlE
         rpFiihuDhXgZjuBdpW+3DvnWwvP0aC7x+nRlb+dUFJOuaHl7RMQ7L+Grt0F7FUulPT6M
         2KMLeQmRXigfaGFonFu4BxJqLQrsV2+0IO1dMIVeLqNItg7B42qVE0Ao4ZcrVUnXnBEC
         MgXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:from:subject:message-id
         :references:mime-version:in-reply-to:date:dkim-signature;
        bh=BX4IdZYRgiKfdW8QDai6gKwzIL2KGGmpL9NjzBR93ME=;
        fh=+aVB0apLn7P4p3cMF9Qg7nFZ6+AnRx2Fcri+oFjNFtM=;
        b=c1OkysaFN2knCSaOLPYbYtefpugKSnkE4PImq8lbGLZeSA8f/gjTg2eMHX1LyQq0ig
         Fimqq84sAtKcdwyPGJNm7Fk7Eue121m30RawoEy66NKnZtwnK7LeswE7dk/3l+A0VVCx
         eKgtIhs/a0y66bzsqpDka7xWWuSDaqjcq5KQ7ELzGxcZtosdIe9Rp0RP0olxJkLB9zwO
         wOge0WkX/bO0/+SBxhXyQVxkEmI0z/nfaegurhcn1Zt5lfIfVVDjzBvR3M83/x5CRWoT
         mn+K/g/dD4kaBYTyanQZBXVVw/chv41KME0EuWaAK3bYGmN7NNzG1xaif0fLK3dgVPkn
         pPlA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b="jn7sy/Eh";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i8-20020ac84888000000b0042581a7c1a5si24716967qtq.631.2023.12.19.13.34.05
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 19 Dec 2023 13:34:05 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b="jn7sy/Eh";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rFhip-0007aA-MM; Tue, 19 Dec 2023 16:33:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3GgyCZQwKCG0YLMTSPdePQLYRZZRWP.NZXbPXf-LcXYZYRYf.ZcR@flex--nabihestefan.bounces.google.com>)
 id 1rFhiK-0007QZ-GW
 for qemu-arm@nongnu.org; Tue, 19 Dec 2023 16:33:20 -0500
Received: from mail-yw1-x114a.google.com ([2607:f8b0:4864:20::114a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3GgyCZQwKCG0YLMTSPdePQLYRZZRWP.NZXbPXf-LcXYZYRYf.ZcR@flex--nabihestefan.bounces.google.com>)
 id 1rFhiG-0003sx-MC
 for qemu-arm@nongnu.org; Tue, 19 Dec 2023 16:33:20 -0500
Received: by mail-yw1-x114a.google.com with SMTP id
 00721157ae682-5ca26c07848so66119267b3.0
 for <qemu-arm@nongnu.org>; Tue, 19 Dec 2023 13:33:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1703021594; x=1703626394; darn=nongnu.org;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=BX4IdZYRgiKfdW8QDai6gKwzIL2KGGmpL9NjzBR93ME=;
 b=jn7sy/EhwHc9W3hXtnpzbXKJdI38c+DffNe2VTBnQpRZ7kBMv2evjpTiwoohS+o1Cm
 PcdUcAtnbMaOxz1oRpVdjMUv/SueUx+iePUMErTz7c+pGVWuzkQZDNEASLFc/CkB/xR2
 XCBN9Py9JnVIIsLd5mAm069x33+Uigs0W8tp0qxx2c/M/7kyiArrIadvLyaXOQpXQ6Xy
 94ZPRo0c/n/IF2hjH4NzKt09WhomJ4xqpp7i8zpBm2UNg1Um/QNkFE2OgFbxG/Q48SHn
 cBGZ3adQ3wrNxVu6Pu9i81nH7MhNkNre4lMtI9uM6sAZ/6AnOpoJuI3ehGeNUZ5SAv3x
 oa/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1703021594; x=1703626394;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=BX4IdZYRgiKfdW8QDai6gKwzIL2KGGmpL9NjzBR93ME=;
 b=ZYEk/rJfiibCwcl8BGPUmkghIAMwYmg2G7MoTXQzdaayAwQoNpMkaW6jqIPW1Ek1oB
 zB42IV+BhTpuYlIRPuqbp4Q8cq0gVhZSjuPNKjOu/q9zaS/LRcW81U80mKpH8rAUUq0Z
 LkbuRLAIH34Mp/QUQcAImK8fKJONeYqzYVVqWt/ZG7xUd9CqllLw5ssLgZWXKnCPYqao
 ic0o7u8/xQ/h8tSFDa0trV94zPtoKXtBuAzM1AJqJTqtA1Vf+8ptXcKYhsgM0Kkc13XO
 hxEDXocoVYfGnBmMuPioUOMd9BMUCQrEoao1JOO9+prwWIT219qrN6TsyBf/WOKXb5Fg
 UoNQ==
X-Gm-Message-State: AOJu0YzuP7eMjRcXkKQctV430DXSf2A5jkbtpYyJ9IcDmIA+e0QZd0Eg
 N7SHEgRvsOC8OM0W/XkLUb9DkJFET4AhRs+DOpk=
X-Received: from nabihestefan.c.googlers.com
 ([fda3:e722:ac3:cc00:20:ed76:c0a8:2737])
 (user=nabihestefan job=sendgmr) by 2002:a05:690c:a90:b0:5e6:579e:65e9 with
 SMTP id ci16-20020a05690c0a9000b005e6579e65e9mr2221885ywb.2.1703021594229;
 Tue, 19 Dec 2023 13:33:14 -0800 (PST)
Date: Tue, 19 Dec 2023 21:32:47 +0000
In-Reply-To: <20231219213255.604535-1-nabihestefan@google.com>
Mime-Version: 1.0
References: <20231219213255.604535-1-nabihestefan@google.com>
X-Mailer: git-send-email 2.43.0.472.g3155946c3a-goog
Message-ID: <20231219213255.604535-3-nabihestefan@google.com>
Subject: [PATCH v9 02/10] hw/arm: Add PCI mailbox module to Nuvoton SoC
From: Nabih Estefan <nabihestefan@google.com>
To: peter.maydell@linaro.org
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, kfting@nuvoton.com, 
 wuhaotsh@google.com, jasowang@redhat.com, avi.fishman@nuvoton.com, 
 nabihestefan@google.com, kwliu@nuvoton.com, tomer.maimon@nuvoton.com, 
 Hila.Miranda-Kuzi@nuvoton.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::114a;
 envelope-from=3GgyCZQwKCG0YLMTSPdePQLYRZZRWP.NZXbPXf-LcXYZYRYf.ZcR@flex--nabihestefan.bounces.google.com;
 helo=mail-yw1-x114a.google.com
X-Spam_score_int: -95
X-Spam_score: -9.6
X-Spam_bar: ---------
X-Spam_report: (-9.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01,
 USER_IN_DEF_DKIM_WL=-7.5 autolearn=ham autolearn_force=no
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
X-TUID: f4bev4rIob5K

From: Hao Wu <wuhaotsh@google.com>

This patch wires the PCI mailbox module to Nuvoton SoC.

Signed-off-by: Hao Wu <wuhaotsh@google.com>
Signed-off-by: Nabih Estefan <nabihestefan@google.com>
Reviewed-by: Tyrone Ting <kfting@nuvoton.com>
---
 docs/system/arm/nuvoton.rst | 2 ++
 hw/arm/npcm7xx.c            | 2 ++
 include/hw/arm/npcm7xx.h    | 1 +
 3 files changed, 5 insertions(+)

diff --git a/docs/system/arm/nuvoton.rst b/docs/system/arm/nuvoton.rst
index 0424cae4b0..e611099545 100644
--- a/docs/system/arm/nuvoton.rst
+++ b/docs/system/arm/nuvoton.rst
@@ -50,6 +50,8 @@ Supported devices
  * Ethernet controller (EMC)
  * Tachometer
  * Peripheral SPI controller (PSPI)
+ * BIOS POST code FIFO
+ * PCI Mailbox
 
 Missing devices
 ---------------
diff --git a/hw/arm/npcm7xx.c b/hw/arm/npcm7xx.c
index 1c3634ff45..c9e87162cb 100644
--- a/hw/arm/npcm7xx.c
+++ b/hw/arm/npcm7xx.c
@@ -462,6 +462,8 @@ static void npcm7xx_init(Object *obj)
         object_initialize_child(obj, "pspi[*]", &s->pspi[i], TYPE_NPCM_PSPI);
     }
 
+    object_initialize_child(obj, "pci-mbox", &s->pci_mbox,
+                            TYPE_NPCM7XX_PCI_MBOX);
     object_initialize_child(obj, "mmc", &s->mmc, TYPE_NPCM7XX_SDHCI);
 }
 
diff --git a/include/hw/arm/npcm7xx.h b/include/hw/arm/npcm7xx.h
index 273090ac60..cec3792a2e 100644
--- a/include/hw/arm/npcm7xx.h
+++ b/include/hw/arm/npcm7xx.h
@@ -105,6 +105,7 @@ struct NPCM7xxState {
     OHCISysBusState     ohci;
     NPCM7xxFIUState     fiu[2];
     NPCM7xxEMCState     emc[2];
+    NPCM7xxPCIMBoxState pci_mbox;
     NPCM7xxSDHCIState   mmc;
     NPCMPSPIState       pspi[2];
 };
-- 
2.43.0.472.g3155946c3a-goog

