Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E97DCA0EED
	for <qemu-arm@archiver.kernel.org>; Fri, 22 Aug 2025 13:56:26 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1upSDC-0005mE-EU; Fri, 22 Aug 2025 09:53:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cjchen@igel.co.jp>) id 1upO1v-00061D-2C
 for qemu-arm@nongnu.org; Fri, 22 Aug 2025 05:25:51 -0400
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <cjchen@igel.co.jp>) id 1upO1s-0007HI-VA
 for qemu-arm@nongnu.org; Fri, 22 Aug 2025 05:25:50 -0400
Received: by mail-pl1-x632.google.com with SMTP id
 d9443c01a7336-2461864f7f8so12490565ad.2
 for <qemu-arm@nongnu.org>; Fri, 22 Aug 2025 02:25:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=igel-co-jp.20230601.gappssmtp.com; s=20230601; t=1755854747; x=1756459547;
 darn=nongnu.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=vh5PW27wq4M7UAgJQHpY8LHqZa1HVp12yT5xQoyQ7OE=;
 b=UGyWLktXP+T/8V7c0/X8qAODv/OFjVnqd5lZPVMbVVULNzbjUr9KNapfEcgOMGoJVI
 9r/KgA/yBdFvs/fPzae1bFpskpNZs4OqQw0Pv9NvePuw7WW0qa7K0VkEWfx/DTOFzWBw
 MJeIrniS2cOL/YICSWtqQPPNV/UWgZSffK2E2GLZqCKWjmuDRZ/0TtlaYYjVqouMbZKw
 Pw+Z9jxaFgem1sstZ5JcYBUwwxxE4iTaXytkkI4K6aO2nFxXA2t60u2+UgLGhedS3LrH
 GEm/VObHijO8G2nHpq69lZTZ2Q9ny3wmm/H2a/Y9LuPdiajlMYmkIQAJpmdFQMikLk9J
 HF+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755854747; x=1756459547;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=vh5PW27wq4M7UAgJQHpY8LHqZa1HVp12yT5xQoyQ7OE=;
 b=InVcuxjEG1KDnc+8+px8JVaWASQGNeBvRHfcFBL2nPigG82KQ3s/wx1jaD6/YpM0XH
 zaAtUpHmRpyAfGKA5ZrmBpgHuv81haCDfTjs+7maahbPq0aMeI10qWbqtQE3ESVYjvfi
 BCdlL/6E5l3mz3nqfT7GzdqbfCB0ozAByyVw3p6rX1vQoesb4ZEIq2QfwpP9LOMx2MYA
 5y5d0L0L5W61AtGwE/xZh2uIH/MGLU8qRz+wE//HgFDiUtxne6xUoXpLU4aYYqyVTgrq
 5TwS1v4P/XCzJG98JkxJ+2vWO24Wi6MATeygSsRh55zn7DsADWsNEGc5XR8b2u0TetOQ
 2Yqw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUUnBtqG5ZM1loQzYhVymJcLToYiNxeFjVmuocW2eJfpB6oH1nIHU1k1bWSzXti3Z/WWzbz16YSIg==@nongnu.org
X-Gm-Message-State: AOJu0YxCYy3Nze0INYZfL95QjK3unRTrSi9QIaFha1YAg1ESAOJl4YjQ
 HSDl9V7KLGz2eYpYGutJz8wcH2Qd/pJCrJmmoHXL3AdD2hqsHrSMo7BBAmHz236m4y4=
X-Gm-Gg: ASbGncv5RDvv178nJ19QAEvmKkXv/9PPbKuV7EnH8jgUa4Qk1HeYmQNNU3U0Zis2KiG
 v9sR+mgEuy3rE3/OgRqxW2oeAODesqSQyLPbZcbHwbddqRMpERlMIaxYt8jurWyGIx3vPSpQymy
 pw7dS+c7Qteoqvxm42RhrSX0XsMF3iRsju5V9iSUPyinaKjDsHl1L73nDPJPL0BPcBOZ8MP1i2T
 kIa6K6CMgUAZ6f/0OlDy9A0vFNNkGxdhZAePIYh7ka2fq/ugBRUABaZpHLkGuoCfv+/jk1RA+/D
 vgdMuC5I9TGzD1WukuQyI9iU+b4AG+n/XSBar901C2Wc6lUmDhvT+g13ntOgdGHo+A2UjIuNSmy
 1Zyycre1J4jfqNxElTrNTVWbnAzjCWw4mMAfmijBTpA==
X-Google-Smtp-Source: AGHT+IFqrkDmltRg7rBvuIoosHiBNJHGiYIXbN8rlbL3FhYZHp7oXOt3yH4etsE7arp7mbrFo0zW5g==
X-Received: by 2002:a17:902:f68e:b0:243:7cf:9bcf with SMTP id
 d9443c01a7336-2462ee0be0bmr37041655ad.2.1755854746463; 
 Fri, 22 Aug 2025 02:25:46 -0700 (PDT)
Received: from warg.hq.igel.co.jp (napt.igel.co.jp. [219.106.231.132])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-245ed4c6fb7sm78560215ad.89.2025.08.22.02.25.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 Aug 2025 02:25:46 -0700 (PDT)
From: CJ Chen <cjchen@igel.co.jp>
To: qemu-devel@nongnu.org, qemu-block@nongnu.org, qemu-riscv@nongnu.org,
 qemu-arm@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, Keith Busch <kbusch@kernel.org>,
 Klaus Jensen <its@irrelevant.dk>, Jesper Devantier <foss@defmacro.it>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Weiwei Li <liwei1518@gmail.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Tyrone Ting <kfting@nuvoton.com>, Hao Wu <wuhaotsh@google.com>,
 Max Filippov <jcmvbkbc@gmail.com>, Peter Xu <peterx@redhat.com>,
 David Hildenbrand <david@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Fabiano Rosas <farosas@suse.de>, Laurent Vivier <lvivier@redhat.com>,
 Tomoyuki Hirose <hrstmyk811m@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>, CJ Chen <cjchen@igel.co.jp>
Subject: [RFC PATCH v2 7/9] system/memory: assert on invalid unaligned combo
Date: Fri, 22 Aug 2025 18:24:08 +0900
Message-Id: <20250822092410.25833-8-cjchen@igel.co.jp>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250822092410.25833-1-cjchen@igel.co.jp>
References: <20250822092410.25833-1-cjchen@igel.co.jp>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::632;
 envelope-from=cjchen@igel.co.jp; helo=mail-pl1-x632.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Fri, 22 Aug 2025 09:53:38 -0400
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

When it comes to this pattern: .valid.unaligned = false and
impl.unaligned = true, is effectlvely contradictory. The .valid
structure indicates that unaligned access should be rejected at
the access validation phase, yet .impl suggests the underlying
device implementation can handle unaligned operations. As a result,
the upper-layer code will never even reach the .impl logic, leading
to confusion.

Signed-off-by: CJ Chen <cjchen@igel.co.jp>
Tested-by: CJ Chen <cjchen@igel.co.jp>
Suggested-by: Peter Xu <peterx@redhat.com>
Acked-by: Tomoyuki Hirose <hrstmyk811m@gmail.com>
---
 system/memory.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/system/memory.c b/system/memory.c
index d6071b4414..b536a62ce9 100644
--- a/system/memory.c
+++ b/system/memory.c
@@ -1654,6 +1654,7 @@ void memory_region_init_io(MemoryRegion *mr,
                            const char *name,
                            uint64_t size)
 {
+    g_assert(!ops || !(ops->impl.unaligned && !ops->valid.unaligned));
     memory_region_init(mr, owner, name, size);
     mr->ops = ops ? ops : &unassigned_mem_ops;
     mr->opaque = opaque;
-- 
2.25.1


