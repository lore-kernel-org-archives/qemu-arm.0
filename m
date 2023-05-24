Received: by 2002:a17:906:d7a2:b0:96f:a786:ac5c with SMTP id pk2csp2469931ejb;
        Wed, 24 May 2023 04:15:25 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ6wguNBYR0EB1Elfm3yR7ZQ0tWYoebHy3k+TGjeiTI04p5h6pWlyOwARUV8iVfXcCA5l91P
X-Received: by 2002:a05:622a:15c5:b0:3f6:4892:c77a with SMTP id d5-20020a05622a15c500b003f64892c77amr26028486qty.58.1684926924881;
        Wed, 24 May 2023 04:15:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1684926924; cv=none;
        d=google.com; s=arc-20160816;
        b=qbnCYGoRIyswxStHPvJ1hTlyWulf2/0o3KRwsDo4Iii6mCUe19uyyZpjzXUXhDQzyY
         /40IlRo4NSg/SXTmocqzg5BoW3vA2yJl0oqPJidtys+snYVsCw9N3eLeU5W6vZf9SZ2U
         G9LxrNDwN3f2QWpWIZizZJLYCQGb0B0jl9IjtyM0og/hqUD1wUjU76Ug8bSn7HOH4QLG
         ZWP2UhulP1vk3uAaVIDgi27k/KDH4aVaD/Ow8oJehSGvOADBqZn9+buULR2bNq01VnAR
         x8bBqmC9z5mKREa9HRyzTxS+8OuvB31yow1ICGixekwh7EAhM6IWdkP+Dr166GaXWSj/
         FR+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from;
        bh=NTrC6Ys5TbvxcXDUHwaPNVHFGnprqGp6mr6qhXhoj1E=;
        b=0H1OZR/kPfeNE/Icy/xJJI9ruvwjX17fhRLnIaehjUJaHWl+wjJf2HkGzFvEgFuFVk
         5qfEu82n2pEgkHbh+DJmuD3tmZ+GwPiDOCcFnw4hEDkEXB81LtBPJ0QCfp80q39HIMkO
         AHSTjvZLGy4D/DMJNsGKuny7h1pyny2apawE3nkuNQ52viph9l/zojSVXQFNlh/uFVvd
         2exXbtTvFob67wFk0WUwPVxt8HVgOxaho4RNOwpDD2n1MgoKNnkBn4rYWaIz889yhGdR
         oVP1dwMWfQnwwQb3lUqp8yNpXLZzemEnyXUKO9aoEfcRct7YOe4+Fq+W4ycB8WJ2mYJf
         pbSw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a17-20020ac85b91000000b003f54c82e1basi6617696qta.115.2023.05.24.04.15.24
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 24 May 2023 04:15:24 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1q1mSB-0006X2-GV; Wed, 24 May 2023 07:14:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcin.juszkiewicz@linaro.org>)
 id 1q1mS6-0006Pq-9Q; Wed, 24 May 2023 07:14:46 -0400
Received: from muminek.juszkiewicz.com.pl ([213.251.184.221])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcin.juszkiewicz@linaro.org>)
 id 1q1mS3-0003vx-GY; Wed, 24 May 2023 07:14:45 -0400
Received: from localhost (localhost [127.0.0.1])
 by muminek.juszkiewicz.com.pl (Postfix) with ESMTP id 6A9632609C0;
 Wed, 24 May 2023 13:14:41 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at juszkiewicz.com.pl
Received: from muminek.juszkiewicz.com.pl ([127.0.0.1])
 by localhost (muminek.juszkiewicz.com.pl [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id eBWoya-aSsRS; Wed, 24 May 2023 13:14:39 +0200 (CEST)
Received: from applejack.lan (83.21.125.167.ipv4.supernova.orange.pl
 [83.21.125.167])
 by muminek.juszkiewicz.com.pl (Postfix) with ESMTPSA id BC882260B8B;
 Wed, 24 May 2023 13:14:37 +0200 (CEST)
From: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Leif Lindholm <quic_llindhol@quicinc.com>,
 Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
Subject: [PATCH v4 3/3] hw/arm/sbsa-ref: set default display to Bochs
Date: Wed, 24 May 2023 13:14:13 +0200
Message-Id: <20230524111413.833912-4-marcin.juszkiewicz@linaro.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230524111413.833912-1-marcin.juszkiewicz@linaro.org>
References: <20230524111413.833912-1-marcin.juszkiewicz@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: softfail client-ip=213.251.184.221;
 envelope-from=marcin.juszkiewicz@linaro.org; helo=muminek.juszkiewicz.com.pl
X-Spam_score_int: -11
X-Spam_score: -1.2
X-Spam_bar: -
X-Spam_report: (-1.2 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_SOFTFAIL=0.665, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
X-TUID: 1eNbY88VP+9J

This way we can use pci_vga_init() and have Bochs by default while still
have an option to run with other VGA cards.

Signed-off-by: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
---
 hw/arm/sbsa-ref.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/hw/arm/sbsa-ref.c b/hw/arm/sbsa-ref.c
index 9c3e670ec6..ed7ed00b3d 100644
--- a/hw/arm/sbsa-ref.c
+++ b/hw/arm/sbsa-ref.c
@@ -647,9 +647,9 @@ static void create_pcie(SBSAMachineState *sms)
 
             pci_nic_init_nofail(nd, pci->bus, nd->model, NULL);
         }
-    }
 
-    pci_create_simple(pci->bus, -1, "bochs-display");
+        pci_vga_init(pci->bus);
+    }
 
     create_smmu(sms, pci->bus);
 }
@@ -863,6 +863,7 @@ static void sbsa_ref_class_init(ObjectClass *oc, void *data)
     mc->default_ram_size = 1 * GiB;
     mc->default_ram_id = "sbsa-ref.ram";
     mc->default_cpus = 4;
+    mc->default_display = "bochs-display";
     mc->possible_cpu_arch_ids = sbsa_ref_possible_cpu_arch_ids;
     mc->cpu_index_to_instance_props = sbsa_ref_cpu_index_to_props;
     mc->get_default_cpu_node_id = sbsa_ref_get_default_cpu_node_id;
-- 
2.40.1

