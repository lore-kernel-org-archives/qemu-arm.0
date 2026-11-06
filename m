Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63697606A326
	for <qemu-arm@archiver.kernel.org>; Fri,  6 Nov 2026 07:13:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=zoLY3OHU
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xPE7m-0002uv-Rq; Fri, 06 Nov 2026 02:12:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <manos.pitsidianakis@linaro.org>)
 id 1xPE7P-0002jm-Ff
 for qemu-arm@nongnu.org; Fri, 06 Nov 2026 02:12:16 -0500
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <manos.pitsidianakis@linaro.org>)
 id 1xPE7M-0005zF-EH
 for qemu-arm@nongnu.org; Fri, 06 Nov 2026 02:12:11 -0500
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-4a5720b0a57so8257615e9.0
 for <qemu-arm@nongnu.org>; Thu, 05 Nov 2026 23:12:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1793949127; x=1794553927; darn=nongnu.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :content-type:mime-version:subject:date:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=gJmyz6DjtNLprHs1YyidXkr9eyMRwX95i2Jfmpx+GYo=;
 b=zoLY3OHUyy/P+5Dm0Z2WWAuHasjUSaCnxmi1AB7Qlh4HoLq3RTVkDb76ckzGxkeKhe
 AXOJp+nfOr2I/j70RuTFxtpSoJva/9RprSLz9zEFn9fjXZZ1yIWGA176wz3vp6wmuor/
 rJ1/wXBi6ix50+gYJPvirtxALY9+cnHZU03VCt7CxpEQCJ3J8uJdfO4aPbqnea5PTIKD
 T24jqbQTj6U6VOrRZeY3ezQaJYh222ZyfNO1rpfaegR7CNJn9i9Mr8E8ySe90UnH5wbM
 qFaX8EnrUJOvMJjoQBQHc3mB5L4p+Z7gTsW5bMfD799XIuQRyGw6RzDKrfew6bZzY8vM
 cOcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793949127; x=1794553927;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :content-type:mime-version:subject:date:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=gJmyz6DjtNLprHs1YyidXkr9eyMRwX95i2Jfmpx+GYo=;
 b=eI+VuC7UnoogApKF5Q5n7VZmp2Mh8vC6gAMi32cLe+ej4PY7u8C+UKegEi1YKZnpSl
 ZjTv6LkLQxAE0cxCSvUv1Jy28huu71i27tuI0oIenS8XxulM3E07wlnoDKRp6UAa2CtZ
 VyvcO9uhlfVHsYJY2AUtcvol51eyDBxgLUZ+od8uEPH/9VneRi2M9SkOujlNJs80gej8
 doovm/PivyeJ0MfoIYNDI0pLeplPw2KUDtaMylKa16ROd6xXzBUx7FN8RcUlRuosPBI8
 mVMBfT/5fdp2AK2KwbUXKhQjnuB2A+31DIyoxWGRz1Ja6qys9U+bp7uGHXnZ6eVPSRRa
 rcsQ==
X-Forwarded-Encrypted: i=1;
 AKwUvBw1DL8MJNRQMh73ByxZVYO6yvgydMNF0079WSLh7ABcdThZsEgm4AO9nQrovdGOV2hmJR6FSVOhFg==@nongnu.org
X-Gm-Message-State: APuU4Z9G2nFRg70jK65nu8tNmZ49kEzgTOzUxJzMCH76JWfqIbaWvmHA
 pH9hSKJmgKlpFgla5vqwhwoQzqm931IS55IViHqcs8XKVAr2bNCz2Vje4XDBuEkqEN4=
X-Gm-Gg: AYBFou0s5tpZkNrrvBwU7BrfVaz9TbNNGnxB/GbfY1dl3WiGLAA0f8ud8W8vhECWirQ
 4kBGawZ2zpk9QoqgrlAfQesCXe+VBPZgmpQW4Ow4kh7F5c/dnFevM6l3/lq9TFGKgPraV6ruxvo
 PaFuTnJU+zMKdUrESgM+LWg7Rq/5KANtOJDOn32qljAZTRjHwfZqkuEIZKWN+oMSqlehuycIyZn
 w34/rhgcTK53nWpo3LoMDKRRm+l0n57U5V3aEwgcPmDYOrUcHq9HILRnQqgJ00YS6TTM3tq02vm
 +Mehn5933injjsZTZVgPMcUzPExjAZIS3+gAueZ4yv4dKR5EjJLa4NSJIUgtbvyGtbt0LuLz8YM
 8bwCeIHx15PL+4oRj+haeruuM1txSv7LaLghZTHUNvh9wPIgvG3TEyzKvFKz3c+1zCpdkT4yibb
 C3KXFpn9jZ1IpU+YF6E6oiiY2ffis2udcPpNs09VA9qi+4e5m7mck/s+nceqB5x7hZae+WSz2s9
 Z2lc3WjDc1IcpQizvUzaVQygWhb2R2NivkTBOveA2MVZ+EJkQFJEY2Va/GPSCjGwpJ2R4yZF/Q5
 nvuTH/wkT4gc3Q/sUskI+1dVxZax/3nZ5GIj0vWizK3TVbUDJzqyXksKMgIAZi8ESIPIev155Ev
 xsoKo7m/rsjLEudvjG5cJzhpd7RUBEEzQDmmT60Q7RuT12Dzd8YDgHDJlm/BSl8TWjhGtpUeiLO
 ex8i8i9kHBgu9Q
X-Received: by 2002:a05:600c:a013:b0:4a0:20b4:ba93 with SMTP id
 5b1f17b1804b1-4b6e091ed5amr20610965e9.16.1793949126796; 
 Thu, 05 Nov 2026 23:12:06 -0800 (PST)
Received: from satan.lan ([94.66.192.55]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4b571f46489sm113916495e9.3.2026.11.05.23.12.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Nov 2026 23:12:06 -0800 (PST)
From: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
Date: Fri, 06 Nov 2026 09:12:00 +0200
Subject: [PATCH v2 1/2] gicv2: do not hardcode minimum binary point
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261106-gic_read_bpr_from_property-v2-1-9f096cce4814@linaro.org>
References: <20261106-gic_read_bpr_from_property-v2-0-9f096cce4814@linaro.org>
In-Reply-To: <20261106-gic_read_bpr_from_property-v2-0-9f096cce4814@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-stable@nongnu.org, Peter Maydell <peter.maydell@linaro.org>, 
 qemu-arm@nongnu.org, Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=6623;
 i=manos.pitsidianakis@linaro.org; h=from:subject:message-id;
 bh=7F9/b/GIJggRESZ15qqnA8p3iz15P+V5oTVFjL1s/dE=;
 b=owEBbQKS/ZANAwAKAXcpx3B/fgnQAcsmYgBq7X3ENJ47XidzqU8nNpy8EJ60IB8oap99xt8X6
 DfvVB+D3nuJAjMEAAEKAB0WIQTMXBtORKBW84dwHRB3Kcdwf34J0AUCau19xAAKCRB3Kcdwf34J
 0L0/D/9aqi4fbWWkxorPRhkQQy2gtvbHkRaVQBFetPryROykjiqH7debkuP2FgP723vD77v34od
 WnGQQnovObWCaqx5Mn91ukQDtrF8qCLxZkxTG1DwQF9YsDbgM5xSo3M4ZChnRwZwe9TAIF9ZreX
 JPZ3QMGiJmFi18aqqX+0z7lxiaS4R4nR2hnb6Gm/uUQkQD6XXx1QGIRlN0J40KJW7lY8uVPyXxc
 /ke5VSe3KYr/jT+WEnbEJAe5hCs96zXaNcGLYD+dH9XDod1g93rluDCXgRzhyd0l3otaFkjPpcz
 8q3qrfzjK52IdBXMNoSjwlqkQp55f3cQKBZ9WlbOPiEHAvu+nRWai3UWQo9Wisl/xLtPP2uHjyx
 NIz3tnS8QI2v5DE3JAq9neQJfAUmgQowBhfMjCnk6a1B7Huz8WFa7ErUKCXwIzA3JEI0g2Fd7k4
 4ZQGNSdEtrRDGm2hfjoxOGM1jwkVw6ZHmyCppPG1fdVuiMcsVjE4Ue6SFbs9LxkIhY4wUikbSyy
 kgri6wFxjw1nSdigkyip7cSuk1OqroBvRzz6XvrowGtr+vMrNfcBdUpLmlYCiGqUj4+ijvkcsMM
 n55fO+Qv2k1Yn/vVgrDStv1Jofedt/q78+0lL34w0HuFuA6Cxou1hJLn77yfp6n8p9ZmjeYHhyg
 VAb/a7E5uPvtApA==
X-Developer-Key: i=manos.pitsidianakis@linaro.org; a=openpgp;
 fpr=7C721DF9DB3CC7182311C0BF68BC211D47B421E1
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=manos.pitsidianakis@linaro.org; helo=mail-wm1-x335.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
X-Spam-Status: No, score=-23.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_PASS,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The number of priority bits is implementation defined, and indeed
machines such as a9mpcore and arm11mpcore define it in the
num-priority-bits property. However we still hardcoded GIC_MIN_BPR.

This commit replaces the GIC_MIN_BPR and GIC_MIN_ABPR defs with macros
that read the property.

The calculation is based on "Table 4-47 Active Priorities register
implementation" in the GICv2 spec (page 4-150 of ARM IHI 0048B.b
ID072613):

+---------------+---------------+---------------+
|               |               |    Maximum    |
| Minimum value | Minimum value |    number of  |
|   of Secure   | of Non-secure |     group     |
|   GICC_BPR    |   GICC_BPR    | priority bits |
+===============+===============+===============+
|             3 |             4 |             4 |
|             2 |             3 |             5 |
|             1 |             2 |             6 |
|             0 |             1 |             7 |
+---------------+---------------+---------------+

Resolves: https://gitlab.com/qemu-project/qemu/-/work_items/4375
Signed-off-by: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
---
 hw/intc/arm_gic.c                | 14 +++++++-------
 hw/intc/arm_gic_common.c         |  4 ++--
 include/hw/intc/arm_gic.h        |  2 --
 include/hw/intc/arm_gic_common.h | 18 ++++++++++++++++--
 4 files changed, 25 insertions(+), 13 deletions(-)

diff --git a/hw/intc/arm_gic.c b/hw/intc/arm_gic.c
index 4d4b79e6f3408c43eae19c222edc75e41987b7ea..79a68a8648467c1f18dab69cf691f8e44ec2f011 100644
--- a/hw/intc/arm_gic.c
+++ b/hw/intc/arm_gic.c
@@ -479,7 +479,7 @@ static void gic_activate_irq(GICState *s, int cpu, int irq)
      * and update the running priority.
      */
     int prio = gic_get_group_priority(s, cpu, irq);
-    int min_bpr = gic_is_vcpu(cpu) ? GIC_VIRT_MIN_BPR : GIC_MIN_BPR;
+    int min_bpr = gic_is_vcpu(cpu) ? GIC_VIRT_MIN_BPR : gic_min_bpr(s);
     int preemption_level = prio >> (min_bpr + 1);
     int regno = preemption_level / 32;
     int bitno = preemption_level % 32;
@@ -521,7 +521,7 @@ static int gic_get_prio_from_apr_bits(GICState *s, int cpu)
         if (!apr) {
             continue;
         }
-        return (i * 32 + ctz32(apr)) << (GIC_MIN_BPR + 1);
+        return (i * 32 + ctz32(apr)) << (gic_min_bpr(s) + 1);
     }
     return 0x100;
 }
@@ -1561,7 +1561,7 @@ static inline uint32_t gic_apr_ns_view(GICState *s, int cpu, int regno)
     /* Return the Nonsecure view of GICC_APR<regno>. This is the
      * second half of GICC_NSAPR.
      */
-    switch (GIC_MIN_BPR) {
+    switch (gic_min_bpr(s)) {
     case 0:
         if (regno < 2) {
             return s->nsapr[regno + 2][cpu];
@@ -1592,7 +1592,7 @@ static inline void gic_apr_write_ns_view(GICState *s, int cpu, int regno,
                                          uint32_t value)
 {
     /* Write the Nonsecure view of GICC_APR<regno>. */
-    switch (GIC_MIN_BPR) {
+    switch (gic_min_bpr(s)) {
     case 0:
         if (regno < 2) {
             s->nsapr[regno + 2][cpu] = value;
@@ -1731,10 +1731,10 @@ static MemTxResult gic_cpu_write(GICState *s, int cpu, int offset,
                 /* WI when CBPR is 1 */
                 return MEMTX_OK;
             } else {
-                s->abpr[cpu] = MAX(value & 0x7, GIC_MIN_ABPR);
+                s->abpr[cpu] = MAX(value & 0x7, gic_min_abpr(s));
             }
         } else {
-            int min_bpr = gic_is_vcpu(cpu) ? GIC_VIRT_MIN_BPR : GIC_MIN_BPR;
+            int min_bpr = gic_is_vcpu(cpu) ? GIC_VIRT_MIN_BPR : gic_min_bpr(s);
             s->bpr[cpu] = MAX(value & 0x7, min_bpr);
         }
         break;
@@ -1746,7 +1746,7 @@ static MemTxResult gic_cpu_write(GICState *s, int cpu, int offset,
             /* unimplemented, or NS access: RAZ/WI */
             return MEMTX_OK;
         } else {
-            s->abpr[cpu] = MAX(value & 0x7, GIC_MIN_ABPR);
+            s->abpr[cpu] = MAX(value & 0x7, gic_min_abpr(s));
         }
         break;
     case 0xd0: case 0xd4: case 0xd8: case 0xdc:
diff --git a/hw/intc/arm_gic_common.c b/hw/intc/arm_gic_common.c
index 304d89cf56219bf76eeeb24e55dbfe60be23ba43..7ffd94561202f49d767315893085df57a4f984d8 100644
--- a/hw/intc/arm_gic_common.c
+++ b/hw/intc/arm_gic_common.c
@@ -249,8 +249,8 @@ static inline void arm_gic_common_reset_irq_state(GICState *s, int cidx,
         s->current_pending[i] = 1023;
         s->running_priority[i] = 0x100;
         s->cpu_ctlr[i] = 0;
-        s->bpr[i] = gic_is_vcpu(i) ? GIC_VIRT_MIN_BPR : GIC_MIN_BPR;
-        s->abpr[i] = gic_is_vcpu(i) ? GIC_VIRT_MIN_ABPR : GIC_MIN_ABPR;
+        s->bpr[i] = gic_is_vcpu(i) ? GIC_VIRT_MIN_BPR : gic_min_bpr(s);
+        s->abpr[i] = gic_is_vcpu(i) ? GIC_VIRT_MIN_ABPR : gic_min_abpr(s);
 
         if (!gic_is_vcpu(i)) {
             for (j = 0; j < GIC_INTERNAL; j++) {
diff --git a/include/hw/intc/arm_gic.h b/include/hw/intc/arm_gic.h
index be923f7ed8861620d17fbf3d8569c42ae7c95487..a1f4a2eebab5fd0fde6dd4b73464f3df3d32313f 100644
--- a/include/hw/intc/arm_gic.h
+++ b/include/hw/intc/arm_gic.h
@@ -72,8 +72,6 @@
 
 /* Number of SGI target-list bits */
 #define GIC_TARGETLIST_BITS 8
-#define GIC_MAX_PRIORITY_BITS 8
-#define GIC_MIN_PRIORITY_BITS 4
 
 #define TYPE_ARM_GIC "arm_gic"
 typedef struct ARMGICClass ARMGICClass;
diff --git a/include/hw/intc/arm_gic_common.h b/include/hw/intc/arm_gic_common.h
index b169394e6ca28d787d70e9c103ebbe5b12202ecc..db7370a80ab4011f33dff30fdffb0ba953a80fea 100644
--- a/include/hw/intc/arm_gic_common.h
+++ b/include/hw/intc/arm_gic_common.h
@@ -37,8 +37,8 @@
 #define MAX_NR_GROUP_PRIO 128
 #define GIC_NR_APRS (MAX_NR_GROUP_PRIO / 32)
 
-#define GIC_MIN_BPR 0
-#define GIC_MIN_ABPR (GIC_MIN_BPR + 1)
+#define GIC_MAX_PRIORITY_BITS 8
+#define GIC_MIN_PRIORITY_BITS 4
 
 /* Architectural maximum number of list registers in the virtual interface */
 #define GIC_MAX_LR 64
@@ -151,6 +151,20 @@ struct GICState {
 };
 typedef struct GICState GICState;
 
+
+static inline uint32_t gic_min_bpr(GICState *s)
+{
+    uint32_t num_preemption_bits = s->n_prio_bits == 8 ? 7 : s->n_prio_bits;
+    assert(!(s->n_prio_bits > GIC_MAX_PRIORITY_BITS
+             || s->n_prio_bits < GIC_MIN_PRIORITY_BITS));
+    return 7 - num_preemption_bits;
+}
+
+static inline uint32_t gic_min_abpr(GICState *s)
+{
+    return gic_min_bpr(s) + 1;
+}
+
 #define TYPE_ARM_GIC_COMMON "arm_gic_common"
 typedef struct ARMGICCommonClass ARMGICCommonClass;
 DECLARE_OBJ_CHECKERS(GICState, ARMGICCommonClass,

-- 
2.43.0


