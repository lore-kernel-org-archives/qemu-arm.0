Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76838F436BF
	for <qemu-arm@archiver.kernel.org>; Fri, 17 Apr 2026 17:34:36 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wDn3C-0007YN-Na; Fri, 17 Apr 2026 13:32:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wDn2b-0006tU-66
 for qemu-arm@nongnu.org; Fri, 17 Apr 2026 13:31:48 -0400
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wDn2V-0002CH-7v
 for qemu-arm@nongnu.org; Fri, 17 Apr 2026 13:31:39 -0400
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-43d7a5e77b1so683983f8f.1
 for <qemu-arm@nongnu.org>; Fri, 17 Apr 2026 10:31:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1776447092; x=1777051892; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Otb+V+N26YB8iFs+WkqEaZZLt8iUFfx2rXXM3vvsWPA=;
 b=qEDpCrsDXqn+5Py8XwHYcs35g5vtZt2N2AxhAddKbYZyMjnVjoN1jd/OQx/QP4utHI
 RdBKvVuZLZZxTeBMCJH+xJdxLyChZ5nhxqsyLWtjaV20wP+M+8MaXjiBhRuiVSPU0c+1
 PVkfiYDS+EVmPg1/jrhQf2fdOmQ4pd6X/bcyLkWwH5xz+eWc2FecuB4orRumiCnz+us+
 NQwvKzOUHiQimJ3e92Tb1krHjixslzyXdcOzPQKOITozX+x3CwhvX1zpc7CjLncYCiTh
 W34d0AvmbEUPaKklIZvHSBwu7xn7W7VfJsk7t6hn0GxAMK4lUT7gzSohS+Odq7KbllBC
 Ssgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1776447092; x=1777051892;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=Otb+V+N26YB8iFs+WkqEaZZLt8iUFfx2rXXM3vvsWPA=;
 b=GBhkUwu01mASyZtMyhSR9z9uT/ov9T7FiqOfuQI7Ceqevo2+nhFDRS5vtfcMwjBWSm
 wZsNXrOd+l5AR81g/EYgtCZ/2EZps4I5oor/b9gl1ulXvxlzq9vJbNMXwX+ADwT3N7hE
 8wje2HnoPAJMsWQdmXfqKgbadEW6IUlKb8hJ8T8+laTxtZY96SFEgooHFoA2LnioTPoS
 +4y5Vrd0Gb52z0aJdz+leL/UEkZWaYPj/NMRAiDp0wadPzPc+RNQtl1kQIjfIKWV4oT5
 ew7r7oBW1MPAqiucdn85ewu3k1l2QTDJgmHp8KQHfIl3ALzWa53CvsPfV3mlLumelevP
 YKrA==
X-Gm-Message-State: AOJu0Yxmn10mZRmAIoAP09cFe07r73yyR/QIWCEIfCKN7Ds8veuJsuYg
 qHGQlnjroepY7YrhcC9f5sqjf3ujh60hprfa2LP25Wzvn+GFo0qhmbwUyq04aqjWUSUyHYTV00r
 WyNfdZlY=
X-Gm-Gg: AeBDiesCD6ErSaURPeF8C2TprrSbYyLPjjGf8PYoLL+HFS5tiM8/JhN6w8v0ByygPnK
 E8eOVgTUCl973Jtv3doJwZtDWIEZ/yZNiWTXbPTQjqsPgL0+3T6nspaH9+AUrDUnvtLUhM8EIMz
 4Xb7NStDRgieYoez80ocAH7DK/29pFKSWFmQSVqjYx/yCBQKJEJs/MzdcVU/s6HnYOYltViEFFr
 Sj830wiF6aoZhhjG9gQC6ALgGGLe6gKNtbnA/ZLrOQ6eFQadhNItSfcbcgAHAHvjTtDd+ajx2g6
 9Xvy7Fut52Y5ezbaJ753Y/Db5IfhWeANIyy1lEZgUj2mNGbaW317e2AAiZf6PZJJ7RdyU5+ko72
 Pl8G3D/l3bdf/lTlNQgdLFnv8Zz1Ty0+sPDbwOTbxydub1FOO/c1+eLVjgmX63pQ8P3JEdFEPVl
 kQ7JjH6wdKpOEUXJAlhb8rL131LCMv8RN/Qy6gXpiZeFXifF+gyqYkBrWPQkwdZ8NbaKPGl2EEf
 hXHKeD5L08zyFb6adle1nT0E7PrP7lbGVH5Nu853g==
X-Received: by 2002:a05:6000:290c:b0:43d:772d:2b61 with SMTP id
 ffacd0b85a97d-43fe4073831mr5520140f8f.15.1776447092385; 
 Fri, 17 Apr 2026 10:31:32 -0700 (PDT)
Received: from lanath.. (wildly.archaic.org.uk. [81.2.115.145])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43fe4e4ffa8sm5819650f8f.35.2026.04.17.10.31.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Apr 2026 10:31:31 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, qemu-riscv@nongnu.org, qemu-s390x@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Yanan Wang <wangyanan55@huawei.com>, Zhao Liu <zhao1.liu@intel.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 "Dr. David Alan Gilbert" <dave@treblig.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Alexandre Iooss <erdnaxe@crans.org>,
 Mahmoud Mandour <ma.mandourr@gmail.com>, Peter Xu <peterx@redhat.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Nicholas Piggin <npiggin@gmail.com>,
 Chinmay Rath <rathc@linux.ibm.com>, Glenn Miles <milesg@linux.ibm.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Weiwei Li <liwei1518@gmail.com>,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Chao Liu <chao.liu.zevorn@gmail.com>, Ilya Leoshkevich <iii@linux.ibm.com>,
 David Hildenbrand <david@kernel.org>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Artyom Tarasenko <atar4qemu@gmail.com>
Subject: [PATCH 12/17] monitor: hmp_gva2gpa: Don't page-align
 cpu_get_phys_addr_debug() arg and return
Date: Fri, 17 Apr 2026 18:31:00 +0100
Message-ID: <20260417173105.1648172-13-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260417173105.1648172-1-peter.maydell@linaro.org>
References: <20260417173105.1648172-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x432.google.com
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

In hmp_gva2gpa() we currently have a workaround for not all implementations
of get_phys_addr_debug handling non-page-aligned addresses: we round the
input address from the user down to the target page boundary before the
call and then add the page offset back to the returned value.

Now that we guarantee that all implementations will return the correct
exact physaddr for a virtual address, we can drop this handling.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 monitor/hmp-cmds.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/monitor/hmp-cmds.c b/monitor/hmp-cmds.c
index e6d8322bcc..f8380bda58 100644
--- a/monitor/hmp-cmds.c
+++ b/monitor/hmp-cmds.c
@@ -720,12 +720,11 @@ void hmp_gva2gpa(Monitor *mon, const QDict *qdict)
         return;
     }
 
-    gpa  = cpu_get_phys_addr_debug(cs, addr & TARGET_PAGE_MASK);
+    gpa  = cpu_get_phys_addr_debug(cs, addr);
     if (gpa == -1) {
         monitor_printf(mon, "Unmapped\n");
     } else {
-        monitor_printf(mon, "gpa: 0x%" HWADDR_PRIx "\n",
-                       gpa + (addr & ~TARGET_PAGE_MASK));
+        monitor_printf(mon, "gpa: 0x%" HWADDR_PRIx "\n", gpa);
     }
 }
 
-- 
2.43.0


