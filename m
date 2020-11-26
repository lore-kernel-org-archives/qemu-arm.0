Received: by 2002:a19:ee0a:0:0:0:0:0 with SMTP id g10csp1784938lfb;
        Thu, 26 Nov 2020 13:50:54 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxTqFpV7TXL32Y4hLuTqcgwui6++NAPFTUlapSVsWEtZnY99ZyslKOFkIPPRjhjhklfQ9zi
X-Received: by 2002:a25:df05:: with SMTP id w5mr9745099ybg.20.1606427454133;
        Thu, 26 Nov 2020 13:50:54 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1606427454; cv=none;
        d=google.com; s=arc-20160816;
        b=cgluVCH1oNwMRwJCOh6+3VZkzs2xXdDJR9O+d9pVv7LO1M23XbK7ESLvU0Lh5O0oPq
         Sc+WH2n5Y09vb8d04GLeNfZfso5WwmHQgxYxoQ5eUaq0huTYBsvUn8V8FmzyUB9iNdQP
         M8CwLacBOQShmKEOBz8iHVv9PfyImEQ9Aay9ipkB7OfF7MpFZUWPK/fHykA3748KID/V
         EJqtjOqTA4/PHQb4db/qNb7sRftrZMFg9b6TdlPz7ry8M08iHP001BoVretvaKpQphlD
         1RXAv0RdVblTd4jj43zJXzRmQ4dH/44CpBEHGRf7r63kesRMB07N72jGIPzIsgUuHPPp
         gU+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from;
        bh=dmxHnJbhGBQZpiidUCYRdIyLNVPFN0gCA8qJqG0CTs8=;
        b=pUHEV2KPZOVOm/UrI3+Cv0YHemsm/tRulV3RpqGm8cfkCGpjxnh6ivc4a45NpljO30
         Sw9KuyU0QiiBM5UZow6NeUMYsm/Vg+J0cMq7uuex5HB14a2BdCkk2GI6s+IJujmMkrC7
         V9Jpx1lsC082sjQuJEZ+VAQeFF+ugezdyhKw7kat1EMUKa+d3xZnBCA/DB9Opju/ws1r
         PbNxD7d/s7NLn6uz5F25uiBh97PHkYedO9Uui+oGFGX4y7Ixgqbl8TN1AluvLKqJDa49
         Li0lFu2LRO07I+e8S58U+ha0hiQUO1iU5rplFeDAICWLiaMUjO3OHfbnV90MUbY0dQVI
         Kh4Q==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a67si6553498ybg.316.2020.11.26.13.50.53
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 26 Nov 2020 13:50:54 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:57784 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kiPAD-0002Iw-HA
	for alex.bennee@linaro.org; Thu, 26 Nov 2020 16:50:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36332)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <agraf@csgraf.de>)
 id 1kiP9r-0001rP-Ph; Thu, 26 Nov 2020 16:50:31 -0500
Received: from mail.csgraf.de ([188.138.100.120]:60546
 helo=zulu616.server4you.de) by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <agraf@csgraf.de>)
 id 1kiP9i-0005kM-Mh; Thu, 26 Nov 2020 16:50:31 -0500
Received: from localhost.localdomain
 (dynamic-077-009-187-158.77.9.pool.telefonica.de [77.9.187.158])
 by csgraf.de (Postfix) with ESMTPSA id 88DE53900581;
 Thu, 26 Nov 2020 22:50:19 +0100 (CET)
From: Alexander Graf <agraf@csgraf.de>
To: qemu-devel@nongnu.org
Subject: [PATCH 3/8] arm: Set PSCI to 0.2 for HVF
Date: Thu, 26 Nov 2020 22:50:12 +0100
Message-Id: <20201126215017.41156-4-agraf@csgraf.de>
X-Mailer: git-send-email 2.24.3 (Apple Git-128)
In-Reply-To: <20201126215017.41156-1-agraf@csgraf.de>
References: <20201126215017.41156-1-agraf@csgraf.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=188.138.100.120; envelope-from=agraf@csgraf.de;
 helo=zulu616.server4you.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Cameron Esfahani <dirty@apple.com>, Roman Bolshakov <r.bolshakov@yadro.com>,
 qemu-arm@nongnu.org, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: NFJypHLSohOI

In Hypervisor.framework, we just pass PSCI calls straight on to the QEMU emulation
of it. That means, if TCG is compatible with PSCI 0.2, so are we. Let's transpose
that fact in code too.

Signed-off-by: Alexander Graf <agraf@csgraf.de>
---
 target/arm/cpu.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index 07492e9f9a..db6f7c34ed 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -1062,6 +1062,10 @@ static void arm_cpu_initfn(Object *obj)
     if (tcg_enabled()) {
         cpu->psci_version = 2; /* TCG implements PSCI 0.2 */
     }
+
+    if (hvf_enabled()) {
+        cpu->psci_version = 2; /* HVF uses TCG's PSCI */
+    }
 }
 
 static Property arm_cpu_gt_cntfrq_property =
-- 
2.24.3 (Apple Git-128)

