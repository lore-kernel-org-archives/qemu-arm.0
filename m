Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21525F433CD
	for <qemu-arm@archiver.kernel.org>; Wed, 15 Apr 2026 21:57:48 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wD8DH-0002FS-Hq; Wed, 15 Apr 2026 17:55:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1wD8DG-0002EV-5q
 for qemu-arm@nongnu.org; Wed, 15 Apr 2026 17:55:58 -0400
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1wD8DE-0002fz-Mv
 for qemu-arm@nongnu.org; Wed, 15 Apr 2026 17:55:57 -0400
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-488a29e6110so77607405e9.3
 for <qemu-arm@nongnu.org>; Wed, 15 Apr 2026 14:55:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1776290155; x=1776894955; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=jHqQq9mgfz0/IbHwfpAA/ZimJYVnAn25wtx09Q5wcT0=;
 b=eq0xDjgjWtN1ErEI6QXip1IE3qJrJ5spiDesBpP/e59VghsVMAZDbc3TiWwefmwFjz
 ci3RRIftPxU+ZQimrmHk04duDHRgRv+hFsYiWeqPQJm5d15o+fiLAPZEzXsm2P96TaHA
 79HPAyDiQGZe0lIkWGRlV1Fnk9KHmiOWnwST1gVBTN0Ea8fd0nxCI3K9zg3zsC05k1YZ
 CRRnVO8rRIHuY2yhX8pB8ThyiggqdZkN2bRmeemxloM9qSPCKmxfp9jQezAnQxfpcS+S
 UwBkLmrAXPxmV3XQsA3s9D9iMKW/OOrExruD9933w79jNZFzHJooAMULoV4qWacLG/WX
 NS9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1776290155; x=1776894955;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=jHqQq9mgfz0/IbHwfpAA/ZimJYVnAn25wtx09Q5wcT0=;
 b=Lcz05s2uTH3GV+Uph+eFVyJ6viZgeUmS2iFIbSx8e8krSpYuMOo+B8DYj6M5vIeYoV
 w6Yxy4t8WDpuuytCUNUVGht6s4iQd+72k3bFWJyWqnTHzF9YR+RWMhu4xYcWlzrrE/MP
 sKOWbm3X1g1UzUeR+bmlqPG8HeoslgHfLtQhDhN2CIMtdrJ284JbwgydkWLGmb4eLx5F
 lQs0jlyXJu3YwNsxD5nm+cmPjSc632M5G/k34TXt2WyxE6q/xx1uux9MKOU7T4ZzY6J5
 3o+cPErK/hH+JtqaEU0u2knqbGK+9gYfIv0aTl3/5rS3xI0KdLyMUl5ki+NtoSEbmicZ
 tucw==
X-Gm-Message-State: AOJu0YxSEvV4NPhdRHLNYGukPE+6OtnsOpTubM7m4lXlOgedQs7ZEqbL
 AURBa1b3X6vnhu9WXLAG36MJ7sz738CvPuZwtuLoL1BOuOOYyLE7/kYcexv9J9oauRs=
X-Gm-Gg: AeBDievq22Q2lPJDjYKffm5mal1HQ6o6oYNqqIV5iArUlF4cozi8fVPZ7qh5JHVfnwa
 Tlglsab5iupzLo7mgUtjFntJyME7eFbHpYBb2c65bM3abPYxtuEGAwZuk40ucXBr25GR0EkkeA3
 xRd2Du9rGH1/dnhlHPwSe6UW55y7uXzK3jBwXtQHi+F8kiHhfCVkqKqbcXYv0bBiOu5Bs8GwXnO
 Skk4ABuvCrHXXwl07qt+65/nGeadEfSR09rNN5kZTys2KbDnaEXDHM6WXIREPDOi3NchIc60uA4
 uaBhuUrWV7XvqJ4ijdesuNRf/zCLWuuNuxmhkIV6uEIPJa1H/5JCIgjPpG9R6FcPN5RCpwQNEp0
 SKGhMV/gkdzUChHgnz7qVvHd8e0gFMVujaaR00NJA8lDfMKisl/4BPD3/bVrPedeuPxSt6nn14n
 Pt7GVtK9ODAdAMjGAfgLdAEXtADAYYn66o5fn/YgNUjxN00+xgwnWnVu677IGfkdl4t91NbIKF6
 4iA9vop+Uw=
X-Received: by 2002:a05:600c:8595:b0:485:3b00:f93b with SMTP id
 5b1f17b1804b1-488d6ab8082mr238560215e9.31.1776290155006; 
 Wed, 15 Apr 2026 14:55:55 -0700 (PDT)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-488f57da2aesm2566985e9.0.2026.04.15.14.55.53
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 15 Apr 2026 14:55:54 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-s390x@nongnu.org, qemu-riscv@nongnu.org,
 qemu-block@nongnu.org
Subject: [PATCH 2/8] cocci: Do not initialize variable used by QSLIST_FOREACH
 macro
Date: Wed, 15 Apr 2026 23:55:33 +0200
Message-ID: <20260415215539.92629-3-philmd@linaro.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260415215539.92629-1-philmd@linaro.org>
References: <20260415215539.92629-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x335.google.com
X-Spam_score_int: 4
X-Spam_score: 0.4
X-Spam_bar: /
X-Spam_report: (0.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 SUSPICIOUS_RECIPS=2.51 autolearn=no autolearn_force=no
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

The QSLIST_FOREACH() macro, defined in "qemu/queue.h",
always assigns its iterator variable when entering the
loop. Remove the pointless and possibly misleading
assignment.

Mechanical patch using the following coccinelle spatch:

  @@
  type T;
  identifier e;
  iterator FOREACH_MACRO =~ ".*_FOREACH.*";
  statement S;
  @@
  -    T *e = ...;
  +    T *e;
       ... when != e
       FOREACH_MACRO(e, ...) S

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 ebpf/ebpf.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/ebpf/ebpf.c b/ebpf/ebpf.c
index 2d73beb4796..a8d441b02c1 100644
--- a/ebpf/ebpf.c
+++ b/ebpf/ebpf.c
@@ -40,7 +40,7 @@ void ebpf_register_binary_data(int id, const void *data, size_t datalen)
 
 const void *ebpf_find_binary_by_id(int id, size_t *sz, Error **errp)
 {
-    struct ElfBinaryDataEntry *it = NULL;
+    struct ElfBinaryDataEntry *it;
     QSLIST_FOREACH(it, &ebpf_elf_obj_list, node) {
         if (id == it->id) {
             *sz = it->datalen;
-- 
2.53.0


