Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C9D9CCF9E0
	for <qemu-arm@archiver.kernel.org>; Tue, 28 Oct 2025 18:23:17 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vDoLg-0006dJ-6v; Tue, 28 Oct 2025 14:23:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vDoLG-0005wi-9D
 for qemu-arm@nongnu.org; Tue, 28 Oct 2025 14:22:51 -0400
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vDoL5-0002m6-8Q
 for qemu-arm@nongnu.org; Tue, 28 Oct 2025 14:22:42 -0400
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-4710683a644so1715745e9.0
 for <qemu-arm@nongnu.org>; Tue, 28 Oct 2025 11:22:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1761675745; x=1762280545; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=W84UIv/lTOoO7nPMc2XCHCkjsy4aJN+uqWbkHrcZ9FM=;
 b=caaGyTTpavepaS7GhXnulPvqJuDaMyYkgV5A43NAj5A44HJFsF9LC2W6MzOZyx1cAh
 5dRfusbJkIRP47a7ECBfbrySRcKJ8ptyuL2W3YVP31fMgazfEpcG/KPcDzCvoP1yc+bc
 ruDbS2XYBtcC3LhKfL7HnHXIzsIcs7XhXP+0PLn5xOARNYc6tum8Y7AGLwtJBCyrA57c
 BnPiuo3KYGZwLO5RFHLregi8EluDaF5/KBRYQdMsqGx95GWJOZqpv9MnDCm8vsaJX8cv
 nN5MahEKEC00Utl3QJ8lTk9R7wfr4+kRTX0Guqrlzp5EA+Nh9qZC7mBQpky7ZGsYaerr
 nY0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761675745; x=1762280545;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=W84UIv/lTOoO7nPMc2XCHCkjsy4aJN+uqWbkHrcZ9FM=;
 b=EKZGC/oglGEnnPO0z55nfV3ftAnDzIGqugA2qDgLPy9GC9PMSH9vCD/uOHss7pg80P
 oEo4L6PFTVE9EOLDyoLR7PmSGVKoz890fN9mvWgBYqB85EmzZT/wnxAjqC8llqNiIE6K
 3H3EINFTuRijKvKTqqXU69sNJtBvQhkTN1EDwOiumc9l+pCXfRbmL+Tg26FcZ45wibna
 xz99IVCY7zz6Qn0w9aCAswMuCh7JdwF+CPo2SEP/nCIExxzaZS+kJuxPIjNuuIWq72dW
 umgIZz4ZDqk8OwoYfKcIkm3mhlWINvSDFpUq3+VTYFITdno3FM4bC//t7YyEkeZQ+b2v
 RKmA==
X-Forwarded-Encrypted: i=1;
 AJvYcCX8W9JcjXhUptx4wUjprz3J7c8hC58LzpaSxbBnom1aI6qaxYqWWZfQX+a4LnmFEVZnl2C46vzybA==@nongnu.org
X-Gm-Message-State: AOJu0YzzB84yM/5DH3cABabAi2UBRrMNuZ0oJHZzFdF78ofCf5M+nmMj
 WQwp/exopv6CGCbzvKTZCd+zVE28LCgxjRrI162/n+OLdEcVev3jqlPEfB10XBSX/cE=
X-Gm-Gg: ASbGnctqX9mmY1jCcIQExooMiyRwpLsSJOKMKE9fueERr6qkfxPemXDS0sl234TJFDE
 jpKdZjqqozzzIyz4DvaZQ0kjTPNlkqxN5kMo+BeJjiMdQwdPG/i3T/yE2M95VmjrE91MssquOaN
 d2xWEzbbTu7Z/LDSEkEyT4y/YYSp+cOYzkAcm9RZqt1+4jly91bH2aaYfbTRNK4UJSaLwGe86in
 JTVbk72goFd87+wGcj+U66wAEI3u3AsJcyS1eUPWE+sTOe4os+qYA1OJ1D6CzK4fkjCl/7TOT5M
 0F/ctCNkHZFhn+XroeWbEw7KraJrDMr0H38hYBlfHsk4zAefwodD6vhpqiD3MNF8Ywv3/gZXEG2
 3pNT84rSCU5sq3RLpYjn9FbCkG7STL/d5BikzlkGQ1DDi3wOgP7DWlZGK5C182duhCsmhamMyeX
 cP7PXhKahpb1dg9aZnIZVBLW4/DrEdYUIzfZL5xxujVR01MaGETg==
X-Google-Smtp-Source: AGHT+IHoIWA9q0RB9bwHfvDWf20UMqmMOg5jqKWauXSldNNnghGNAT3/AIE9q0U5PgZ4q/ePm3Vq2A==
X-Received: by 2002:a05:600c:8595:b0:475:d278:1ab8 with SMTP id
 5b1f17b1804b1-477180f3b38mr27235385e9.2.1761675745118; 
 Tue, 28 Oct 2025 11:22:25 -0700 (PDT)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4771e196a4bsm6202165e9.6.2025.10.28.11.22.23
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 28 Oct 2025 11:22:24 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Mark Cave-Ayland <mark.caveayland@nutanix.com>, qemu-ppc@nongnu.org,
 qemu-riscv@nongnu.org, qemu-block@nongnu.org,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 qemu-arm@nongnu.org, qemu-s390x@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Matthew Rosato <mjrosato@linux.ibm.com>,
 Eric Farman <farman@linux.ibm.com>, Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Thomas Huth <thuth@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 David Hildenbrand <david@redhat.com>, Ilya Leoshkevich <iii@linux.ibm.com>
Subject: [PATCH v3 09/25] hw/s390x: Use memory_region_size()
Date: Tue, 28 Oct 2025 19:12:43 +0100
Message-ID: <20251028181300.41475-10-philmd@linaro.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251028181300.41475-1-philmd@linaro.org>
References: <20251028181300.41475-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x331.google.com
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

MemoryRegion::size is private data of MemoryRegion,
use the proper memory_region_size() getter to get it.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/s390x/s390-pci-inst.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/s390x/s390-pci-inst.c b/hw/s390x/s390-pci-inst.c
index a3bb5aa2216..5841dfc4fec 100644
--- a/hw/s390x/s390-pci-inst.c
+++ b/hw/s390x/s390-pci-inst.c
@@ -396,7 +396,7 @@ static MemoryRegion *s390_get_subregion(MemoryRegion *mr, uint64_t offset,
     uint64_t subregion_size;
 
     QTAILQ_FOREACH(subregion, &mr->subregions, subregions_link) {
-        subregion_size = int128_get64(subregion->size);
+        subregion_size = memory_region_size(subregion);
         if ((offset >= subregion->addr) &&
             (offset + len) <= (subregion->addr + subregion_size)) {
             mr = subregion;
-- 
2.51.0


