Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C273CAC5BB
	for <qemu-arm@archiver.kernel.org>; Wed,  1 Oct 2025 15:09:23 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1v3yQV-0001Oo-J7; Wed, 01 Oct 2025 11:07:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1v3yQS-0001LA-K0
 for qemu-arm@nongnu.org; Wed, 01 Oct 2025 11:07:28 -0400
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1v3yPS-0000id-Hx
 for qemu-arm@nongnu.org; Wed, 01 Oct 2025 11:07:27 -0400
Received: by mail-wr1-x42c.google.com with SMTP id
 ffacd0b85a97d-3f99ac9acc4so2134917f8f.3
 for <qemu-arm@nongnu.org>; Wed, 01 Oct 2025 08:06:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1759331178; x=1759935978; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=RXiufQH5EAW3mbZqGPR1CdCZqjBiKmbzGv2nAPHWxfY=;
 b=pXhjnL85IyKt+hGjHeX6IAZANq3pAU5IPQ/uxm2W9DrYfqV6ZJ7r/iAUtC6csAmOnI
 s0Wfk4ligFfyKxl1lvxCjewflBeNjpXbrKo2MLd+3Mh7lz9csV14xGyEbRmKp3CfOUGI
 2utrXljI6Ww+VP/iypLvYmBQul9Ve9uKpEdAZWhx2xI0oiUkRbeBoz0wAIUIuuPyVjGT
 Nyb3NMZzEuaSbFThXl+AOOyyZW9KyBb1LIAokG+W4HLg5xLD5q7nUTvit/5VvJlElJSa
 1aHbZDMz7vKCgBNHfZG1Hb3ZgGE4EVSo2L8DS95SU1oVds+AIvxveZpFiOXB9o3qw6zR
 4b+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759331178; x=1759935978;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=RXiufQH5EAW3mbZqGPR1CdCZqjBiKmbzGv2nAPHWxfY=;
 b=Ntu2+NmX51X5VpkNVH0bEKeMtVIhEfqwLKxNG7A6eb32XnzqV675Z1Y/oXuNVOCl9g
 kd1mfqswh/nF8eU5eqKAjqMdMvS5EPFVdLBkJ7faWg+diZ+I899r5a+5ydhOjMho9dLI
 RXPKXVhHZeoOEfVP8UFM8yIytlojqGkNLQfefCb5DAp68d5CoTU+CpM4eFtl1s+cpNdx
 iMRbe1VRml7zDrSwM1aH1isO3ac1DMhTwSUWabANL/1vnUTH5PAiBn8gf0EUCsmscdJP
 /Aip+WVsrKNVYZ8pNtVDZTXtlV9XGeOlGM1lxqQ+yWfD5PT8Pdv/aWM28IATZI1G1ztW
 /zWQ==
X-Gm-Message-State: AOJu0Yy4Qm/7BE98GmAG15agR40oEee5JyhJ3efxpPLCpDzgel86MRg9
 fbFSim6qAM2BKovhgOhSb/6Lzi6zGSp8SSiVn5tuux90dqBZPF88A6ID9x+4DzDLzkc=
X-Gm-Gg: ASbGncsx0zGMIT8q4zqP1hhjUDRSckDUfidSfhO5iTf4z8irkz4Tu7GJZrYzj5Kk3M0
 nBTvK2pvW+1sWe4kaYu4uFhhJpBJfFCvnpBgYiaTSpJePqt7HXwAaLsEdhGdSxV9huOQG8R1G/o
 /kaqBIr6FTp/4izWHM+7g4lDOAOR7W4OGAKj39umueV+uMvYTMHnFqlYGsTvbekZ9stsQ002Hyu
 tzzmIjK+7dJ4M4swSbjjGgOKxX3cQz65XfRkgrWE6Jcs11tF9ckJyVvazcaWgRSsK5fLWKDTz0h
 dGkw5szlZXEVXCwuH21DE9vMvaXnSNYzGSTAfz35XbkJAaGEqoZJb8u99qxIYvxXXimI0ejTLgo
 1BQQSaF/UmgljG9LHFV2tusQ//78oXJ4UB8QK2/X3tLCcPdxJYUN2YC32VmZJJzqjSr8N851NGs
 tWGI0PVjCbFep8Bvd0ATAN
X-Google-Smtp-Source: AGHT+IHBUXklOX5Spm8syYkMk9ISyumF021Wa7HC8KxhD0Lb2XRrKY7V61vtZJg6R5cgGsRJL8zBcQ==
X-Received: by 2002:adf:f70a:0:b0:3fd:3bcc:c239 with SMTP id
 ffacd0b85a97d-425577e4affmr2382604f8f.5.1759331177796; 
 Wed, 01 Oct 2025 08:06:17 -0700 (PDT)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-40fc5603161sm27834537f8f.35.2025.10.01.08.06.16
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 01 Oct 2025 08:06:17 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-s390x@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>, qemu-riscv@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>, qemu-ppc@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>,
 Peter Xu <peterx@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH 09/22] semihosting: Get cpu first addr space with
 cpu_get_address_space()
Date: Wed,  1 Oct 2025 17:05:14 +0200
Message-ID: <20251001150529.14122-10-philmd@linaro.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251001150529.14122-1-philmd@linaro.org>
References: <20251001150529.14122-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42c.google.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_INVALID=0.1,
 DKIM_SIGNED=0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

In order to remove the convenient CPUState::as field, access
the vcpu first address space using the cpu_get_address_space()
helper.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 semihosting/arm-compat-semi.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/semihosting/arm-compat-semi.c b/semihosting/arm-compat-semi.c
index 61001267965..4c282aea5d6 100644
--- a/semihosting/arm-compat-semi.c
+++ b/semihosting/arm-compat-semi.c
@@ -149,12 +149,14 @@ static bool find_ram_cb(Int128 start, Int128 len, const MemoryRegion *mr,
 
 static LayoutInfo common_semi_find_bases(CPUState *cs)
 {
+    AddressSpace *as;
     FlatView *fv;
     LayoutInfo info = { 0, 0, 0, 0 };
 
     RCU_READ_LOCK_GUARD();
 
-    fv = address_space_to_flatview(cs->as);
+    as = cpu_get_address_space(cs, 0);
+    fv = address_space_to_flatview(as);
     flatview_for_each_range(fv, find_ram_cb, &info);
 
     /*
-- 
2.51.0


