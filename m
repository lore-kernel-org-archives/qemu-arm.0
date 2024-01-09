Received: by 2002:a17:906:6951:b0:a28:f940:7a27 with SMTP id c17csp82362ejs;
        Mon, 8 Jan 2024 16:04:55 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG17E5Pi6qCTImGwuBkRyQ4X+c1Wd0KESo4ErT3I9Gh+23YA7nSoLRTuB8pokJxGf76o+vD
X-Received: by 2002:a05:6214:20e7:b0:67f:2fde:1678 with SMTP id 7-20020a05621420e700b0067f2fde1678mr4859389qvk.42.1704758695414;
        Mon, 08 Jan 2024 16:04:55 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1704758695; cv=none;
        d=google.com; s=arc-20160816;
        b=iEbnYWjRTIwGufqVMXJRu6qhjGjqI9wReGyd1Xu8YT5GtnB3VQrXVW/sRZmwJYuzbR
         jmeBDKBIatrwQI4gjCEMJsuBNeB3Yan/G/Tz/G0gvjBtKzuvdDmn3K4GscKBsHj6oT98
         +bTJByIwg9kZDpQeZxwS0LJsRwT94Fz8ocNcSWJuYh+K25fKvHJfzCcYw0S8WRFFSiKr
         6um+2d6ziKuWwJhrFFfulUJifkwr6f+w8Cx3EYaPwXwldfKl5OLLRVSzPmxMF+MurhmM
         DTqZG1vsV5vsUS1hpZAORavX4O8cs9oE5O7ZhrsmEl7BrB1VrE23YCyC7O/3fkofKYXe
         difQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:from:subject:message-id
         :references:mime-version:in-reply-to:date:dkim-signature;
        bh=9qBmftjLlpxjKXWRYQwSt7KsKP2Es44SquIQV1JrY0s=;
        fh=+aVB0apLn7P4p3cMF9Qg7nFZ6+AnRx2Fcri+oFjNFtM=;
        b=YmyLyr7uLH3UiG3pMC1VG+prlzka4g0fPfwZ7hSIEqahh6TWDntQkQJmEHuK6o/1v3
         0xjuZQOeoGwUqhKIwDcdLeOibPBaCYVzn03SZefY93lGUaQ+49sh5V0K/dCYXSLZP+JO
         xUV1gnrZS+8rQTlZZr1Ybj/uPNuNaRez3nl1B5t5oLaFcaH4FiNfzGlIJweIGrSg59zR
         YRNVzOWQXK1bRDlH3GyF8E/7SH1aj+hMnZJfVT3NxS85ROdaEot5VHXF85nwVf9C0AFo
         ARijNicaS/0TKRUs0JwM/7N0AsFoMsg39bBHaDp7NwoI59EwdKbCzDj1ptQp1KBS1aYV
         VZbA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b=QHFNIFYk;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u12-20020a0c8dcc000000b0067f82cb3ab6si1037006qvb.470.2024.01.08.16.04.55
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 08 Jan 2024 16:04:55 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b=QHFNIFYk;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1rMzZy-0002KV-Ij; Mon, 08 Jan 2024 19:02:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3II2cZQwKCt8OBCJIFTUFGBOHPPHMF.DPNRFNV-EFWFMOPOHOV.PSH@flex--nabihestefan.bounces.google.com>)
 id 1rMzZw-0002J9-No
 for qemu-devel@nongnu.org; Mon, 08 Jan 2024 19:02:48 -0500
Received: from mail-pg1-x549.google.com ([2607:f8b0:4864:20::549])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3II2cZQwKCt8OBCJIFTUFGBOHPPHMF.DPNRFNV-EFWFMOPOHOV.PSH@flex--nabihestefan.bounces.google.com>)
 id 1rMzZu-0002qR-Dz
 for qemu-devel@nongnu.org; Mon, 08 Jan 2024 19:02:48 -0500
Received: by mail-pg1-x549.google.com with SMTP id
 41be03b00d2f7-5cde2b113e7so616526a12.2
 for <qemu-devel@nongnu.org>; Mon, 08 Jan 2024 16:02:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1704758561; x=1705363361; darn=nongnu.org;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=9qBmftjLlpxjKXWRYQwSt7KsKP2Es44SquIQV1JrY0s=;
 b=QHFNIFYkz/mBima62QUKJ+A1HOi1kSkPhCSBvVE5OIzJ6rbAWmPpsdBvi2YnFEYW4V
 /87Ec2S1aKYeDx8NiMuf91mIDVGYNXyge3YF+nTNuVYiebO1n2JRqiDGR5m9fQbJucAz
 BhL0y4cCiiteDTPQXugTE6iffQmdSU3BvUxzhHsJgJhMxw6KvtV+1tJmkTuVSjsOPeYR
 WTOyofTSVZ4XIP9d5p9RpRUklw9iV7y/6bD2ERgYQRmFJ7crjVjmD+/FAiuOhO9J8Z5t
 kg35hhSbvl9ifZyzNuxa5ABtDxe2vmic8TahQ3Y6jrDjOsNBqSjV7B6B40/5b+V0hACH
 s8Fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704758561; x=1705363361;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=9qBmftjLlpxjKXWRYQwSt7KsKP2Es44SquIQV1JrY0s=;
 b=jaEjGkMMgp5FHAq5A0GXfOL77BODfNhx03t5xiUMDI7i5fe972BTPgLZGggLLydABa
 R4FIU2ZRKcGXVr0Q3L7crugo0T8VZZxb4iBWt2+283ovnPNRMJ35cp2EGR3IhIsu3aPG
 KlHXDsNWcnX/tHmVuNHpYGOfMSiSJes46DYRNubqZm1T90U2425gdWdeOKJGoW3qQsno
 D2M60Vt/v7mjPjPvtKbcB4h6eFQVhjloKd8t0gchPjFLiWA2eGGHYasBTRC9twK0hbjg
 hgsJiQ+LjxcvTst5l9BYipyYXdPvkkQGdLR99rz4PXJuxQiMJqSPAjyoz1vrM41IQ4oM
 CEpQ==
X-Gm-Message-State: AOJu0YxVTO1UYKnEl1Qlyp1OldDuiXX//Tf1Yyx/vLJsqXShYm9zPKrv
 q8hpOYEjC0cdvAxQCV+GD0gq1fzdA09aPWXsYocxf8i/oQ==
X-Received: from nabihestefan.c.googlers.com
 ([fda3:e722:ac3:cc00:20:ed76:c0a8:2737])
 (user=nabihestefan job=sendgmr) by 2002:a65:620d:0:b0:5ce:98f:4492 with SMTP
 id d13-20020a65620d000000b005ce098f4492mr23950pgv.6.1704758560901; Mon, 08
 Jan 2024 16:02:40 -0800 (PST)
Date: Tue,  9 Jan 2024 00:02:26 +0000
In-Reply-To: <20240109000234.2799153-1-nabihestefan@google.com>
Mime-Version: 1.0
References: <20240109000234.2799153-1-nabihestefan@google.com>
X-Mailer: git-send-email 2.43.0.472.g3155946c3a-goog
Message-ID: <20240109000234.2799153-3-nabihestefan@google.com>
Subject: [PATCH v11 02/10] hw/arm: Add PCI mailbox module to Nuvoton SoC
From: Nabih Estefan <nabihestefan@google.com>
To: peter.maydell@linaro.org
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, kfting@nuvoton.com, 
 wuhaotsh@google.com, jasowang@redhat.com, avi.fishman@nuvoton.com, 
 nabihestefan@google.com, kwliu@nuvoton.com, tomer.maimon@nuvoton.com, 
 Hila.Miranda-Kuzi@nuvoton.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::549;
 envelope-from=3II2cZQwKCt8OBCJIFTUFGBOHPPHMF.DPNRFNV-EFWFMOPOHOV.PSH@flex--nabihestefan.bounces.google.com;
 helo=mail-pg1-x549.google.com
X-Spam_score_int: -95
X-Spam_score: -9.6
X-Spam_bar: ---------
X-Spam_report: (-9.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01,
 USER_IN_DEF_DKIM_WL=-7.5 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: cH2HPFATxWyX

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

