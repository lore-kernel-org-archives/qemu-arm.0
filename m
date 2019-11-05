Received: by 2002:adf:db01:0:0:0:0:0 with SMTP id s1csp453782wri;
        Tue, 5 Nov 2019 01:12:54 -0800 (PST)
X-Google-Smtp-Source: APXvYqxakPiK3yAP+0G9K3O88tnlWY1V5DLQimAXopmCPWLniXc8P2/VZbKoJ445g4ViNK0wtGcO
X-Received: by 2002:a37:9146:: with SMTP id t67mr332493qkd.288.1572945173882;
        Tue, 05 Nov 2019 01:12:53 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1572945173; cv=none;
        d=google.com; s=arc-20160816;
        b=GLW0NDpqKuz8qf+OyqBelmcSW0VqaH/9eh4d9dVNwEJjAT1ZCCzahm+u73oroEadkn
         YQ6PGz6PKpSRLF7WKnn0eWkdeoSRMlzMo57vuJZv+0wdyvFNtkl9HhPhdpz64QbbDApr
         fGh6ddMt7b6nVPE5jcBiYP5VujyMUaCuKpomw9N09RoiAj5zO2j4E0jCjobws3uayhPw
         JqcVLN1xOHhX3oOGfVJLGPHl8v9jgcjpVEv0e+AhmxAvvOJGAaRi00NfQcU/31BVNJFa
         OGBT8uSuyCptA9bNROSFdmd1U9fBuS7mYfrvZig1khPcGZtj0nhcOr8av91O4eCe5OEN
         hcrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from;
        bh=N5aYYvxLUorAL+XkTxYm0sixUVv1o6wyOafZcsj7tCQ=;
        b=ptex7mXaVdKKjQ42LUNlzrzp9dMQaMFWOg8uzAdd0GSnfi2cJW5R1yoURDn7u49+Rl
         6C1bfUl5XmJplzKvHmIms/8toKDhDqmI015GBoPvOF8RcIXckMvaxT9Xu1k09pco75La
         MwkU/T58w0aYH6lNFs9nKqhC12/iqRvES41ldrpp1GoNVa5WuBd9DN3WCO3RKE6kc2Yl
         jaA2T9oD3n9uynK1Pl4FGpbFRtv/EtUVM7WGuU1CQgv6yGz8XALQ+W58AbyxZ5/c6y1K
         med3EnC/VVafSoLlGbYkoacvChG2qH0TOT4oCSMC96ueDbkDaqRROiTU6PvSf7Sxxu3q
         h6BQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h15si8387047qke.212.2019.11.05.01.12.53
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 05 Nov 2019 01:12:53 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:41810 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iRutQ-0005Zt-Tj
	for alex.bennee@linaro.org; Tue, 05 Nov 2019 04:12:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42946)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <guoheyi@huawei.com>) id 1iRusu-00051K-O7
 for qemu-arm@nongnu.org; Tue, 05 Nov 2019 04:12:22 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <guoheyi@huawei.com>) id 1iRust-0007jr-An
 for qemu-arm@nongnu.org; Tue, 05 Nov 2019 04:12:20 -0500
Received: from szxga04-in.huawei.com ([45.249.212.190]:2192 helo=huawei.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <guoheyi@huawei.com>)
 id 1iRuss-0007hm-V6; Tue, 05 Nov 2019 04:12:19 -0500
Received: from DGGEMS404-HUB.china.huawei.com (unknown [172.30.72.59])
 by Forcepoint Email with ESMTP id 2B7146A7B79F7F75ACDF;
 Tue,  5 Nov 2019 17:12:13 +0800 (CST)
Received: from linux-OtBuvb.huawei.com (10.175.104.212) by
 DGGEMS404-HUB.china.huawei.com (10.3.19.204) with Microsoft SMTP Server id
 14.3.439.0; Tue, 5 Nov 2019 17:12:06 +0800
From: Heyi Guo <guoheyi@huawei.com>
To: <qemu-arm@nongnu.org>, <qemu-devel@nongnu.org>
Subject: [RFC v2 07/14] arm/sdei: add support to trigger event by GIC
 interrupt ID
Date: Tue, 5 Nov 2019 17:10:49 +0800
Message-ID: <20191105091056.9541-8-guoheyi@huawei.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <20191105091056.9541-1-guoheyi@huawei.com>
References: <20191105091056.9541-1-guoheyi@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.175.104.212]
X-CFilter-Loop: Reflected
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 45.249.212.190
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
Cc: Mark Rutland <mark.rutland@arm.com>,
 Peter Maydell <peter.maydell@linaro.org>, Marc Zyngier <marc.zyngier@arm.com>,
 James Morse <james.morse@arm.com>, Heyi Guo <guoheyi@huawei.com>,
 wanghaibin.wang@huawei.com, Dave Martin <Dave.Martin@arm.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 0utb1qzv+xj/

Add an external interface to trigger an SDEI event bound to an
interrupt by providing GIC interrupt ID.

Signed-off-by: Heyi Guo <guoheyi@huawei.com>
Cc: Peter Maydell <peter.maydell@linaro.org>
Cc: Dave Martin <Dave.Martin@arm.com>
Cc: Marc Zyngier <marc.zyngier@arm.com>
Cc: Mark Rutland <mark.rutland@arm.com>
Cc: James Morse <james.morse@arm.com>
---
 target/arm/sdei.c | 37 +++++++++++++++++++++++++++++++++++++
 target/arm/sdei.h |  7 +++++++
 2 files changed, 44 insertions(+)

diff --git a/target/arm/sdei.c b/target/arm/sdei.c
index 6af4a9044b..713ac97775 100644
--- a/target/arm/sdei.c
+++ b/target/arm/sdei.c
@@ -476,6 +476,28 @@ static int64_t sdei_version(QemuSDEState *s, CPUStat=
e *cs, struct kvm_run *run)
            (0ULL << SDEI_VERSION_MINOR_SHIFT);
 }
=20
+static bool inject_event(QemuSDEState *s, CPUState *cs, int32_t event, i=
nt irq)
+{
+    QemuSDE *sde;
+
+    if (event < 0) {
+        return false;
+    }
+    sde =3D get_sde_no_check(s, event, cs);
+    if (sde->event_id =3D=3D SDEI_INVALID_EVENT_ID) {
+        put_sde(sde, cs);
+        return false;
+    }
+    if (irq > 0 && sde->prop->interrupt !=3D irq) {
+        /* Someone unbinds the interrupt! */
+        put_sde(sde, cs);
+        return false;
+    }
+    sde->pending =3D true;
+    dispatch_single(s, sde, cs);
+    return true;
+}
+
 static int64_t unregister_single_sde(QemuSDEState *s, int32_t event,
                                      CPUState *cs, bool force)
 {
@@ -1104,6 +1126,21 @@ void sdei_handle_request(CPUState *cs, struct kvm_=
run *run)
     }
 }
=20
+bool trigger_sdei_by_irq(int cpu, int irq)
+{
+    QemuSDEState *s =3D sde_state;
+
+    if (!s || irq >=3D ARRAY_SIZE(s->irq_map)) {
+        return false;
+    }
+
+    if (s->irq_map[irq] =3D=3D SDEI_INVALID_EVENT_ID) {
+        return false;
+    }
+
+    return inject_event(s, qemu_get_cpu(cpu), s->irq_map[irq], irq);
+}
+
 static void sde_array_init(QemuSDE **array, int count)
 {
     int i;
diff --git a/target/arm/sdei.h b/target/arm/sdei.h
index 828f70bbf1..5ecc32d667 100644
--- a/target/arm/sdei.h
+++ b/target/arm/sdei.h
@@ -31,4 +31,11 @@
=20
 void sdei_handle_request(CPUState *cs, struct kvm_run *run);
=20
+/*
+ * Trigger an SDEI event bound to an interrupt.
+ * Return true if event has been triggered successfully.
+ * Return false if event has not been triggered for some reason.
+ */
+bool trigger_sdei_by_irq(int cpu, int irq);
+
 #endif
--=20
2.19.1

