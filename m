Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5EB79CCD1BF
	for <qemu-arm@archiver.kernel.org>; Fri, 24 Oct 2025 19:09:48 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vCN9v-0004Ei-2q; Fri, 24 Oct 2025 15:09:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vCN9o-0004DG-HW
 for qemu-arm@nongnu.org; Fri, 24 Oct 2025 15:09:00 -0400
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vCN9m-0005ei-2H
 for qemu-arm@nongnu.org; Fri, 24 Oct 2025 15:08:59 -0400
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-47117f92e32so22671225e9.1
 for <qemu-arm@nongnu.org>; Fri, 24 Oct 2025 12:08:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1761332936; x=1761937736; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=0bJEm1B8ks9h5HyZDKkIUNIPRZdg3XjuMbaxmF/lz1I=;
 b=OMZLuMlgScbEpVJTEMU1XaZyLgGJ7+vQ+SEhnl69IIRwatyNc19aGSC7CXlj4Blr2B
 kMjes+FWEHqwKTXDKlndrlxEvdBoyz0L0lJCPn1UN2MS+ZDZtLJW1sQAfNv9bw/3iltf
 /+61GYUtRz7EEl6CW/krM2T2sM7gym4OPXk+gpLP8bXP/QM9C5jSMN2UjT7MMY0RwnCK
 X3Nt0E8ifraKdGOwYxC024ceR/Us1Q8V+PjdDgaKXbYEvSmZff+pLXny4On1dOVoQ/Cy
 xLrVOvI8sZdmkaG6CIPUkNxvTF14o2BkSM8lbyQZb0TPg8RTt0byDmP9a2ZEvw1NJjh4
 LiZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761332936; x=1761937736;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=0bJEm1B8ks9h5HyZDKkIUNIPRZdg3XjuMbaxmF/lz1I=;
 b=vlSW+DZE3+0RfrIUTb5JyQbe6D0E1kOnUcj5zJbJ+EBunYe4QpfiDgWyvYfQnH1w8g
 Xyva1FzkCosOdSZcDDdnPwHhRxwLoSIFB+XJ5K7cQgtnmtglde60KRPKktzCwm1FI7kQ
 fQUelgEHJ2bso6ypF57kAOUp0VkS2u4XJyTdFKDqcJ8sho5vdaT0xUqELKkXaUzNPvcA
 dX84djMNtXygn2IramoQpVRasnIprSSP34GDdKJcGQOzlPtLEm8ehcso7UIphDSl/wFT
 cEvCI08InEKEhkNUOpuFdvEXZuwlh9xhujAh+O81VoY4PRtEAuS+wYuGS0Bbs5WnYm0y
 Vfzg==
X-Gm-Message-State: AOJu0YwbBguYWNNRDizzW0BnTxBlJYaC01i7ZV38D85kO70sBZPaTf7Z
 Z/lhiuc4FQPjh44q1nbJJZCKC1lPOzbcbxTI2IgtHWYrk8sCeh7u3B8vTbishztTTVY=
X-Gm-Gg: ASbGncvZBUUv4RNvp0M+d9eidPmaKGi+PiBiod8Ll6N6VZ8huKieDKXPcr8HtXmYyyJ
 RnQvS9G0DSGQwyoJdPq/uOmBDpN5QtzTQH1Esc0vG9IdI9lU3UbOagNbpSdQLhekRMP49eML9Xt
 peF6iO+KPGAFcOH4RURRR01pMW0tW3HLjNAo4Xbrcd8lS3cyDWgzDHqg2BVT+1u27wC5RnC7rKz
 1+8nkO+k/ELGRDsCdG8iC3+x43tZLR7Rf1gVxohH6Bf30i25V7izd+5hE3NF1CKdcyWvsV5emQt
 udcsjMEtud4CMGMkjQlQDBKTWvyQKggNDYYDZpJ+A8Cqwk9XupuRwsun0C8PoEsYYIB7xatvr9w
 iMQP65Nh9A7qjtsfj2GdMxWRtO/cWvd6nJh+remBB50rHupoRvUKin3JTc3OABwGxoqPMQd/GHt
 r2m86miFBc51ItZjlZ0TZskpV9KtIfkseVHQvKfpLZuyc0B5RFLQ==
X-Google-Smtp-Source: AGHT+IH7uFP2VbAwVOM4jvgZOI8OcnuQri3rTPILars/XP8JloR9dg5JJpRLnjtpmhZBeq5akwoqNA==
X-Received: by 2002:a05:600d:630a:b0:471:1b25:fa00 with SMTP id
 5b1f17b1804b1-4711b25fd7cmr146316775e9.36.1761332936522; 
 Fri, 24 Oct 2025 12:08:56 -0700 (PDT)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47496d269dbsm87481825e9.11.2025.10.24.12.08.54
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 24 Oct 2025 12:08:55 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-riscv@nongnu.org, qemu-block@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>
Subject: [PATCH 03/27] hw/sysbus: Use memory_region_name()
Date: Fri, 24 Oct 2025 21:03:50 +0200
Message-ID: <20251024190416.8803-4-philmd@linaro.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251024190416.8803-1-philmd@linaro.org>
References: <20251024190416.8803-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32c.google.com
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

MemoryRegion::name is kind of internal. Use the proper
memory_region_name() accessor, which might return a different
name.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/core/sysbus.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/core/sysbus.c b/hw/core/sysbus.c
index ae447c1196a..d33be6b2b52 100644
--- a/hw/core/sysbus.c
+++ b/hw/core/sysbus.c
@@ -154,7 +154,7 @@ void sysbus_mmio_map(SysBusDevice *dev, int n, hwaddr addr)
 int sysbus_mmio_map_name(SysBusDevice *dev, const char *name, hwaddr addr)
 {
     for (int i = 0; i < dev->num_mmio; i++) {
-        if (!strcmp(dev->mmio[i].memory->name, name)) {
+        if (!strcmp(memory_region_name(dev->mmio[i].memory), name)) {
             sysbus_mmio_map(dev, i, addr);
             return i;
         }
-- 
2.51.0


