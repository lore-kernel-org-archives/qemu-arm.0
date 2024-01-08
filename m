Received: by 2002:a17:906:6951:b0:a28:f940:7a27 with SMTP id c17csp44694ejs;
        Mon, 8 Jan 2024 14:28:45 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE/gw1fLiO56RFdAodEYn1n0a3VPQ9u1N/6I8QtToekepwLkj10fZMzbjrXtO6LMnWJ4TFL
X-Received: by 2002:a05:620a:490f:b0:781:8c5f:f4e9 with SMTP id vy15-20020a05620a490f00b007818c5ff4e9mr5138034qkn.28.1704752924962;
        Mon, 08 Jan 2024 14:28:44 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1704752924; cv=none;
        d=google.com; s=arc-20160816;
        b=ZRQ61G3FQh2qJNQjdFu24es6gm5kLlJo98JUYjPes2pYUs0cASqTYCzyqYQCiEWSpt
         OEOOz52uvMCxT6fEtEbqpV0woQ0sZ5OO0OCoN3hqjDk+AJDkpzvWdE4EF6fze9xTumMj
         rS8x+WpnTy/L+HN1kkUizsJOUlv8KJOUXpbnmAg1FAZeKRB4eb3m9avLpqRRl9ZedG8t
         yyCc4GOebbhyJqAf7BqdvuKs8rUBgKC45LeuIuf3Cwgq+s+m5UbUZCyE2WpYK8ytCCym
         6rr8uEn0yC20d3Rnr47gPtnWIgefCaELDYeGvRSZt8RYor3ULyIMIsGSn98QI4EkD0QM
         hnyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:from:subject:message-id
         :references:mime-version:in-reply-to:date:dkim-signature;
        bh=9qBmftjLlpxjKXWRYQwSt7KsKP2Es44SquIQV1JrY0s=;
        fh=+aVB0apLn7P4p3cMF9Qg7nFZ6+AnRx2Fcri+oFjNFtM=;
        b=ZxKfdqJHGtaMW/pZpr95vZHRiKkuVI8qChM210c1+JyG8vkPh9oMVZi5shSjtvXZui
         55eqCgAJYlSpXhP6Fj6SmY4t/e6uHpH2FSk3o6vDHkj3T/qw2lG6nmxcBvsAkFuRUlMN
         6qj1e9WnHWYVtrxRJ1xIdyrF9X4NmK0Y+KmGGCMyUyfrRhmt3l8LdrwDs0S/eaIyGMIf
         N7P2x+psTU9EgOuIvIWryE30t8hU77N2h16jMJoqB8zGcVTvUVzAMwfG3B0TbqZxmruG
         0beuOLO2WwsRsNP6vbZzTrRTWRjq493yRDJTxyPPEExP7yM+pa1jjGTlAiRFExl57/rO
         KfnQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b=ylkOFiRs;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m18-20020a05620a221200b00781935e3a74si667054qkh.104.2024.01.08.14.28.44
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 08 Jan 2024 14:28:44 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b=ylkOFiRs;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rMy6C-0006lk-PB; Mon, 08 Jan 2024 17:28:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <363acZQwKCH4pcdkjguvghcpiqqing.eqosgow-ctopqpipw.qti@flex--nabihestefan.bounces.google.com>)
 id 1rMy6A-0006kl-F1
 for qemu-arm@nongnu.org; Mon, 08 Jan 2024 17:27:58 -0500
Received: from mail-yb1-xb4a.google.com ([2607:f8b0:4864:20::b4a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <363acZQwKCH4pcdkjguvghcpiqqing.eqosgow-ctopqpipw.qti@flex--nabihestefan.bounces.google.com>)
 id 1rMy68-000444-Sg
 for qemu-arm@nongnu.org; Mon, 08 Jan 2024 17:27:58 -0500
Received: by mail-yb1-xb4a.google.com with SMTP id
 3f1490d57ef6-daee86e2d70so1700652276.0
 for <qemu-arm@nongnu.org>; Mon, 08 Jan 2024 14:27:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1704752875; x=1705357675; darn=nongnu.org;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=9qBmftjLlpxjKXWRYQwSt7KsKP2Es44SquIQV1JrY0s=;
 b=ylkOFiRsNDJ02hi5JayjXn/Rpz9r768Ql/vRSJD7Y3Zqz0lNxoEYXPvyL7B9WsR3a+
 5qi/0ZvAJnzUetcdGARNoudxCFjsh/S/BfQXIADW+iGAhPG8jUi7xMwX6p5n41xM/FS6
 QtPBXy9eJoGAltl6GlZ1STn79Vo35MJxWEVrmiXY/BEybPKmz1uRZFrrrE+n/PwT6AZc
 ZPehxOQcw15uQa8JH51NKQGlWXgdCu/La72r67Oo6LIz8rGzrFmEQ+Ko1iiDv5/1h/VN
 5TV1pBUrqmEkTq2G9DcFqB16cEixYrBbHXc5K/pULuUQ/LDJP5y+1onWNMXFYkU1wt7g
 THeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704752875; x=1705357675;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=9qBmftjLlpxjKXWRYQwSt7KsKP2Es44SquIQV1JrY0s=;
 b=VmzBIZOJuHRhhp1acGUhL6xQNUjO1dK1T/TCgkNa6zh3/RBqsMj4xL4avUR+gegRxF
 ZIEw2KvmDFR54Y8LV6R91k82WNI7jfagRKfXL/2/fcKGV1IzfeodqaEDP0HV0m42l9y2
 Es3FCVVokhgHY50y5vziJXS2kvH9ZzAOPcLGf06kf4iKxidnuICy8WiWK578YYDGjPv1
 Dz1qXOLbJl5wzmd5nAXtBQ9xs5cJxQ8guSV99IuSQXmsIoLboj3bmfgTtiU3fH3Q6cZ8
 moXrJ6RUKdQI2LXB+FjQL/gQ7MlBeKCHeZYgkQGx0bqVzB0A9NGqmklhzM61ZiqcPJQh
 lXfA==
X-Gm-Message-State: AOJu0YykrXocWqf+PTEJPNoDjrsAKEg1EAVibhTxxmIrW/mj0gjEcHoP
 Z4+NJBSFr/ETlB6/z1clJfC/cDfk+civtRHhisGMjpgOOA==
X-Received: from nabihestefan.c.googlers.com
 ([fda3:e722:ac3:cc00:20:ed76:c0a8:2737])
 (user=nabihestefan job=sendgmr) by 2002:a05:6902:56d:b0:dbe:aab3:4371 with
 SMTP id a13-20020a056902056d00b00dbeaab34371mr142411ybt.8.1704752875360; Mon,
 08 Jan 2024 14:27:55 -0800 (PST)
Date: Mon,  8 Jan 2024 22:27:39 +0000
In-Reply-To: <20240108222747.2453106-1-nabihestefan@google.com>
Mime-Version: 1.0
References: <20240108222747.2453106-1-nabihestefan@google.com>
X-Mailer: git-send-email 2.43.0.472.g3155946c3a-goog
Message-ID: <20240108222747.2453106-3-nabihestefan@google.com>
Subject: [PATCH v10 02/10] hw/arm: Add PCI mailbox module to Nuvoton SoC
From: Nabih Estefan <nabihestefan@google.com>
To: peter.maydell@linaro.org
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, kfting@nuvoton.com, 
 wuhaotsh@google.com, jasowang@redhat.com, avi.fishman@nuvoton.com, 
 nabihestefan@google.com, kwliu@nuvoton.com, tomer.maimon@nuvoton.com, 
 Hila.Miranda-Kuzi@nuvoton.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b4a;
 envelope-from=363acZQwKCH4pcdkjguvghcpiqqing.eqosgow-ctopqpipw.qti@flex--nabihestefan.bounces.google.com;
 helo=mail-yb1-xb4a.google.com
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
X-TUID: TossLHJCWNm7

From: Hao Wu <wuhaotsh@google.com>

This patch wires the PCI mailbox module to Nuvoton SoC.

Change-Id: I14c42c628258804030f0583889882842bde0d972
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

