Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E93DCCF9E0
	for <qemu-arm@archiver.kernel.org>; Tue, 28 Oct 2025 18:34:27 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vDoWB-0006kA-UA; Tue, 28 Oct 2025 14:34:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vDoVb-0006QB-TP
 for qemu-arm@nongnu.org; Tue, 28 Oct 2025 14:33:30 -0400
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vDoVQ-0004C6-Tp
 for qemu-arm@nongnu.org; Tue, 28 Oct 2025 14:33:24 -0400
Received: by mail-wr1-x42f.google.com with SMTP id
 ffacd0b85a97d-4270491e9easo5226869f8f.2
 for <qemu-arm@nongnu.org>; Tue, 28 Oct 2025 11:33:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1761676385; x=1762281185; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=7j5BIJP17+UqRO/W8Lo+TNqHDVnZzxsQi9DL2cIQNS0=;
 b=uUSZq0AZ2+NE+FjHjxXlJPjfvrdR9V5t0OUJQvQqNjGbOWmMRlH4OJ9+ytdatimHjl
 tt53IUpylOvKrcq1orPIVFtN82oM390AsP/Ddyflngw1vv65v9b+hXHRBJMEYlFFGPiT
 +JVDF3Ja38+yuVlv4s5Od2vcfh6+5J49W65bU/672MzlJd4wr6ydVV8l1WtqIffdm/if
 W4JR23oQ/N6+SeC+FTRkAGRDt/KxEh4RijhPEM3XI4edArJ4PRRobPURjqqTX551LwhK
 255B1361Jy41nUJxd6gXlIiF0BPqozgl5o1Y3SWGgdvbQqHq7ERhGj4ofQsB6T/b86bP
 qoDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761676385; x=1762281185;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=7j5BIJP17+UqRO/W8Lo+TNqHDVnZzxsQi9DL2cIQNS0=;
 b=jpvaH18tCXKbBKope4RrignSrxx99i7hFujmTQE47MNSeeGlgIdavhSAhRnN7K86bL
 NlkwC4zeK+ZlhpJdfWjDzyfpRCvvnQ/ka/ba0k++EwJRWZUffEuWOJ7HBSnS9MSvVSIh
 N6qYW+D6Z8cMp9Qy/JUXBKKPO4vDLQHodlP1iJ3/KJalvgW7ruPPQiKGYeZWwE4Ri6xR
 7S8ye5yQ7U5Op4TIflWJlbklsBjSvLuOoqz73mJRYVQ38ztRelZDzfpY/5u58P9hvkX8
 XM0zdZ/28sV8Lt91G0V7hdRgyBVwEgrWIHNbDhcdklCXX4WJlLYSRXfOVTXW5JUnfD81
 Pgdw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXFQYEzZNQcvzN5+roiXJhWlyHeCgd9VJet02NRfJzgjK+6gmoR4EJF0J78ziTYOCy7YUDkE8fK1Q==@nongnu.org
X-Gm-Message-State: AOJu0YwYq5PdY7cS/AHm0GfH4Jt/LopA7gRe1OhAsbe4mEV8NGBn3t7n
 qFtWQrqSddROCT644LbkZpoVUChY3bamxizdnebCON6ucuTaRpF+WtTAtthdKxOzsO4=
X-Gm-Gg: ASbGncv1IwDroS+I07oky0Q4jhAtBfv3QM4QeBISJtGHifePrX26atvl8SYPYt1bv6a
 dE2VABHk4uRKqHDdt6emkEsFHO8iHzXi75/ghTr2JLE72v137T1JD8dtv0pmV756HHYUXF3cN/W
 UthaE0fg0CMPFKqF0peDvt/gq6yXDkglI1ZOk81m+/Nj/3pSzCp9fG/0Vyx2vSvb1Q/JEMjfSTG
 BLFFeJWNQTutkqOOYPcayIBBazi5d9d96owaPzUj2vuI6L63UEHfun6u5zqMvdEqkG76Y/r9Lfm
 gZ0mCKtEMWDtx2clpkeVLIRWOubo0HtKqeqxDWUm8NGVFRMc3G7ggxkMtb9GDx+kkrc04Zkr1/C
 YZMtxCyiqKxVS4I/TYavAo6Apd8heKBJjCij0zf89cpw6jDAdPmOAk7H7rlX86CXT9sXh8t053J
 K7JREx7Ju7XG9EomIippTG46D8OJxm6dgGvzY1+jS5D5yXxIE2ln9HbtdhinaN
X-Google-Smtp-Source: AGHT+IHGiWmEGr7Mocg3dTC4g97uHTSqAkS1iH5OLYhopZsv0+nhnWDP5kXiVjZvDYeQlZsSjlXfNw==
X-Received: by 2002:a05:6000:2313:b0:429:8d21:572a with SMTP id
 ffacd0b85a97d-429aefbdb9amr35337f8f.34.1761676385531; 
 Tue, 28 Oct 2025 11:33:05 -0700 (PDT)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-429952b7b43sm22092394f8f.6.2025.10.28.11.33.04
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 28 Oct 2025 11:33:04 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Mark Cave-Ayland <mark.caveayland@nutanix.com>, qemu-ppc@nongnu.org,
 qemu-riscv@nongnu.org, qemu-block@nongnu.org,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 qemu-arm@nongnu.org, qemu-s390x@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Subject: [PATCH v3 17/25] hw/timer/hpet: Use memory_region_get_address()
Date: Tue, 28 Oct 2025 19:12:51 +0100
Message-ID: <20251028181300.41475-18-philmd@linaro.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251028181300.41475-1-philmd@linaro.org>
References: <20251028181300.41475-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42f.google.com
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

MemoryRegion::addr is private data of MemoryRegion, use
memory_region_get_address() to access it.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/timer/hpet.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/timer/hpet.c b/hw/timer/hpet.c
index c1b96d0a89f..e2cd0c9cccb 100644
--- a/hw/timer/hpet.c
+++ b/hw/timer/hpet.c
@@ -677,7 +677,7 @@ static void hpet_reset(DeviceState *d)
     s->hpet_offset = 0ULL;
     s->config = 0ULL;
     hpet_fw_cfg.hpet[s->hpet_id].event_timer_block_id = (uint32_t)s->capability;
-    hpet_fw_cfg.hpet[s->hpet_id].address = mr->addr;
+    hpet_fw_cfg.hpet[s->hpet_id].address = memory_region_get_address(mr);
 
     /* to document that the RTC lowers its output on reset as well */
     s->rtc_irq_level = 0;
-- 
2.51.0


