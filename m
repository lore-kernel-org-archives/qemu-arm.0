Received: by 2002:a17:906:d7a2:b0:96f:a786:ac5c with SMTP id pk2csp2400802ejb;
        Wed, 24 May 2023 01:40:07 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ4a7W7FSPXEVcFv2pb+l8xeX1NnLEx4+viHziG0ktZQXig1uVzZ8A8I8mWA9S4JvdY4gokH
X-Received: by 2002:a05:6214:c43:b0:5dd:5c8d:866f with SMTP id r3-20020a0562140c4300b005dd5c8d866fmr25041344qvj.23.1684917607536;
        Wed, 24 May 2023 01:40:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1684917607; cv=none;
        d=google.com; s=arc-20160816;
        b=Rq+PY3p1XjlOUYDmbnR4ObAPHbuVtmfhpdbPKEn0njnLOIMMQ6W0utG8ykn8g6k6R2
         agoFyMR4u9kvjXbAtvPhublz7yZyggOUy4KLbrp79vD8yVflt7N4ZiUN8+izaBiVze6N
         KsW6BHJ7NRve8MHYvhlt1Ms26U0xg3ru0nzaLhBZs/WAHTgSbG7TJZFYogaXXVZJf3f7
         rAtN+gmDukjKetUqJBdALnDLPbB+Abj49I6n+b8mW9iCTEEjYDnRVTrVTjAlV6ERCP3b
         h+ANE5bacbOocrTzaW6cRllrTjloIOxEPctvaX8+laFQorAjYNd415TpEEJzly+h72Wh
         Q7Dw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from;
        bh=i2eHc6EduuRy9IXt0IrW6LdtP5rNELiZJU7Gubi9OL4=;
        b=n8M/PoKCvAAFl7ALlWtPmw0PV7y2dr00BeG9Cx8paee6piRHY6zOcXN19sJqDdTJDe
         tKjfr7PI1gRTdy9B+FsW7lRX2sRlFDvW6Up0TjYowaqdwh5Ul+goLCRXjZNIMTetOZj0
         KtIavgaH5/H7/n48VMCTUwn++cJI8ZUadi1PunCXxfl5dzVThjieQYQcxB/MM0oczHVj
         NCIHB4nAUmmypWg8rOcenu4aSlt3BE1ViXgFJD26uIlEl/b6a4CSZeTWR79zfzQJlama
         GcMHABlOeXLGdJTsrKalosOzie2Fe9oswhy+n5z8nd6h8ReoEBkPkvT0HprpP4qnwEKF
         LQZg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id gi12-20020a056214248c00b0062106dae71esi6275793qvb.339.2023.05.24.01.40.07
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 24 May 2023 01:40:07 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1q1k1o-00059D-HZ; Wed, 24 May 2023 04:39:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcin.juszkiewicz@linaro.org>)
 id 1q1k1l-00057d-Me; Wed, 24 May 2023 04:39:25 -0400
Received: from muminek.juszkiewicz.com.pl ([213.251.184.221])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcin.juszkiewicz@linaro.org>)
 id 1q1k1j-0000MF-Ve; Wed, 24 May 2023 04:39:25 -0400
Received: from localhost (localhost [127.0.0.1])
 by muminek.juszkiewicz.com.pl (Postfix) with ESMTP id F2B62260249;
 Wed, 24 May 2023 10:39:21 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at juszkiewicz.com.pl
Received: from muminek.juszkiewicz.com.pl ([127.0.0.1])
 by localhost (muminek.juszkiewicz.com.pl [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Yf7YzVSS_ZN1; Wed, 24 May 2023 10:39:20 +0200 (CEST)
Received: from applejack.lan (83.21.125.167.ipv4.supernova.orange.pl
 [83.21.125.167])
 by muminek.juszkiewicz.com.pl (Postfix) with ESMTPSA id 400D6260ACC;
 Wed, 24 May 2023 10:39:18 +0200 (CEST)
From: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Leif Lindholm <quic_llindhol@quicinc.com>,
 Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
Subject: [PATCH 3/3] hw/arm/sbsa-ref: use MachineClass->default_display
Date: Wed, 24 May 2023 10:39:13 +0200
Message-Id: <20230524083913.696175-3-marcin.juszkiewicz@linaro.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230524083913.696175-1-marcin.juszkiewicz@linaro.org>
References: <e682f6d5-acbe-7910-54ef-4d75c88a3d28@redhat.com>
 <20230524083913.696175-1-marcin.juszkiewicz@linaro.org>
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
Reply-To: 20230524082037.1620952-1-thuth@redhat.com
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: 9Tcfn2Q6buQa

Mark the default graphica via the new MachineClass->default_display
setting so that the machine-defaults code in vl.c can decide whether the
default graphics is usable or not (for example when compiling with the
"--without-default-devices" configure switch).

Signed-off-by: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
---
 hw/arm/sbsa-ref.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/hw/arm/sbsa-ref.c b/hw/arm/sbsa-ref.c
index 9a3d77d6b6..30ce7f7db4 100644
--- a/hw/arm/sbsa-ref.c
+++ b/hw/arm/sbsa-ref.c
@@ -649,7 +649,7 @@ static void create_pcie(SBSAMachineState *sms)
         }
 
         if (vga_interface_type != VGA_NONE) {
-            pci_create_simple(pci->bus, -1, "bochs-display");
+            pci_create_simple(pci->bus, -1, mc->default_display);
         }
     }
 
@@ -865,6 +865,7 @@ static void sbsa_ref_class_init(ObjectClass *oc, void *data)
     mc->default_ram_size = 1 * GiB;
     mc->default_ram_id = "sbsa-ref.ram";
     mc->default_cpus = 4;
+    mc->default_display = "bochs-display";
     mc->possible_cpu_arch_ids = sbsa_ref_possible_cpu_arch_ids;
     mc->cpu_index_to_instance_props = sbsa_ref_cpu_index_to_props;
     mc->get_default_cpu_node_id = sbsa_ref_get_default_cpu_node_id;
-- 
2.40.1

