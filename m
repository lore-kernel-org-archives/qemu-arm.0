Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4A2FFF886F
	for <qemu-arm@archiver.kernel.org>; Thu, 30 Apr 2026 09:43:16 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wINrJ-0005UQ-J2; Thu, 30 Apr 2026 05:39:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wINrE-0005JA-Eo
 for qemu-arm@nongnu.org; Thu, 30 Apr 2026 05:38:56 -0400
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wINr0-0002oY-3M
 for qemu-arm@nongnu.org; Thu, 30 Apr 2026 05:38:56 -0400
Received: by mail-wr1-x42b.google.com with SMTP id
 ffacd0b85a97d-445795cf6f1so438266f8f.1
 for <qemu-arm@nongnu.org>; Thu, 30 Apr 2026 02:38:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1777541920; x=1778146720; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=vtdY7obMueMpd5fltY9RwFbeo9ZZ7O0JQvizv+LAkKE=;
 b=fLe45RvtvmVkEnlIjl7r+jNg8ytO+U08qtOi+TJgGs6zpKonyCIMZTR5FfHmEEdn9z
 O7BHJCiW7QJqB8otZDcDj/0LyNwd2DnhMwtGSxbHs2L0xTc+dEj2MEGh8khJinRi9+c6
 QK+lZPnxgpkHsFkTD64av5J/gwTFgm7JRldhD3Ks1zz2a2hRELuCZ0feCLB/UFwskPlD
 rsnuIsoAZRdoWx61z58flUJSp72HGjlTiI4BZmMwN/PtnB1i6jn4ILkh8xdBfvt7/ujs
 zFLmEvtD5so8K9IW2ZgdmYXGqu3kSQb4UcFsQzAWYzjMckrH16zflNx9WMFXcPh3HdSD
 RO/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1777541920; x=1778146720;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=vtdY7obMueMpd5fltY9RwFbeo9ZZ7O0JQvizv+LAkKE=;
 b=k4q79N9glPgN9cJQ7e9eTCsBSqvFBVHAXHXoCLzt/0g1JB3vXDWrC5v5klfATHqUil
 O9ZXiQW3VBDFqA8JyZn7g8WNCpqyRy1rjabOwXKjw3qwim74s9/qViGh3hAGKZTHU/lB
 wj/ZrN5Kel1hwfIqGldhu6AX6mzhWaqO1PUU9AFQkasf3CQqnOAzngGl/HB38HTTHu4a
 ScuEAPO6TsM+/9NGSKULKXpVsmurxPcLSO4R/tSAx0lPOe4x7eaWxzz6z4xy/ojhUQ8u
 rPAChqkoeLFc3HXI6SgK8UpkwUlLDNeKBzbG2/PJadTbgcHsOrcGwpAE78zfEbMkCVwa
 6Lww==
X-Gm-Message-State: AOJu0Yyd5YF4yt2cfE3IxEsMcsdE/eu3IHLVSyQPVRQs/W5Tt2XTS6Dr
 RS4p6LgJdmQL4c5ZfPtX98+a4JuX3OCxN+/J5Njmjg/CeaYzsBnymYBrHZUiCX2UAIg=
X-Gm-Gg: AeBDieuxGb9qF5Wty4BFRfZSxq1QeI8F+1skD7jUS/oT4T+/mDEryelXdDCsHlpThPL
 645v7ZsFWSEcm3FPOJ3uC0RDQXMxGONk5J3xYsP+qdgScVHV5WXcniPy8apqEHnk/KG0tmah2MM
 RlSK26kIOJLe7omsP0U0VCnLi4LhWahFwj3LxGeup4r1iSdrw2FyMlPhE8ElIQRlarxaQAVbFes
 TsyfCGQWMI2dyk612gMjYnXhvkCmAqm3L2fap5VSnRfFMz1epE7dTr/PQaYdrBF1NeHVBJU4S2i
 PNBUDaTRCFfPE2Ztaj4MRVH2pdaKjLKl/o+AC46TT9NtCtZwxz6+RBv7hr8ufLZUCZfB8GHrkSp
 8c0VWmDTnwJZBNCWYvA35NHgwEa0NDj5stbVQBPhp+aZP5fCOTc+uVQRtXkLgjAzETKScafRJZB
 BG3CPtWNYOdcyqjsE3To4724ltOVumQc/3zYfYVjEQtsKMphbPoNtnGMcwRS+pUSgA3bQ6Q9xB+
 gIx98grd4Y8g3rfajntLakkcQaIswf1VVvutnzTIJWlZC4AhCJn
X-Received: by 2002:a05:6000:2f8a:b0:43d:7828:1f81 with SMTP id
 ffacd0b85a97d-449400c5308mr3332206f8f.41.1777541920392; 
 Thu, 30 Apr 2026 02:38:40 -0700 (PDT)
Received: from lanath.. (wildly.archaic.org.uk. [81.2.115.145])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-447b421721fsm10816795f8f.15.2026.04.30.02.38.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Apr 2026 02:38:39 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org,
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
 Artyom Tarasenko <atar4qemu@gmail.com>, Max Filippov <jcmvbkbc@gmail.com>
Subject: [PATCH v2 22/25] target/xtensa/xtensa-semi: Use
 cpu_translate_for_debug()
Date: Thu, 30 Apr 2026 10:38:07 +0100
Message-ID: <20260430093810.2762539-23-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260430093810.2762539-1-peter.maydell@linaro.org>
References: <20260430093810.2762539-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42b.google.com
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
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

We want to remove the cpu_get_phys_addr_debug() function; update the
xtensa semihosting code to use cpu_translate_for_debug() instead.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/xtensa/xtensa-semi.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/target/xtensa/xtensa-semi.c b/target/xtensa/xtensa-semi.c
index 9a6a9c8b4e..3340bd1d41 100644
--- a/target/xtensa/xtensa-semi.c
+++ b/target/xtensa/xtensa-semi.c
@@ -215,15 +215,20 @@ void HELPER(simcall)(CPUXtensaState *env)
             uint32_t len_done = 0;
 
             while (len > 0) {
-                hwaddr paddr = cpu_get_phys_addr_debug(cs, vaddr);
+                TranslateForDebugResult tres;
                 uint32_t page_left =
                     TARGET_PAGE_SIZE - (vaddr & (TARGET_PAGE_SIZE - 1));
                 uint32_t io_sz = page_left < len ? page_left : len;
                 hwaddr sz = io_sz;
-                void *buf = address_space_map(as, paddr, &sz, !is_write, attrs);
+                void *buf = NULL;
                 uint32_t io_done;
                 bool error = false;
 
+                if (cpu_translate_for_debug(cs, vaddr, &tres)) {
+                    buf = address_space_map(as, tres.physaddr, &sz,
+                                            !is_write, attrs);
+                }
+
                 if (buf) {
                     vaddr += io_sz;
                     len -= io_sz;
-- 
2.43.0


