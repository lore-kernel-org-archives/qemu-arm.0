Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48205D65C56
	for <qemu-arm@archiver.kernel.org>; Wed, 17 Dec 2025 14:34:05 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vVsaC-0001hD-TJ; Wed, 17 Dec 2025 09:32:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vVsZa-0001Zw-3C
 for qemu-arm@nongnu.org; Wed, 17 Dec 2025 09:32:18 -0500
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vVsZX-00073o-Da
 for qemu-arm@nongnu.org; Wed, 17 Dec 2025 09:32:13 -0500
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-47795f6f5c0so37707895e9.1
 for <qemu-arm@nongnu.org>; Wed, 17 Dec 2025 06:32:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1765981928; x=1766586728; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=XUlJJIjbDM2EiiD+qKMGI+yB0A491EkhhPxVSB2GOUQ=;
 b=cdz/JGkV7QX2BMX2n47OwCzpmXVH+BQQPpHMSUX5+p87LEhHM2ZdYYc0D9BsyidC09
 xD8svLMUk4l+MtsNj2PEJW5d5FFEhAXreBTuABJV2naOlfGWmCsvDQUhoDtZfgxbRBlX
 GRqX0wg0cso3Pr3SwPqvtcG71RzJUm9aGsCEx1kIvMki7yoZPtWAzefVYppr9AVAwPtX
 P+3XM8vYPxOjKKqcLw6rZvyKdEwywuKZ6SwHZFPvGaDNZfKjcyU498blH9a+vc5MQ+fy
 91vRBTPB0l5vOp7zbfV9/WUJdv1qcCPLJlPp4IC+NSPnwTfTIOV9US08Tl3t4H1jTr6z
 hSuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1765981928; x=1766586728;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=XUlJJIjbDM2EiiD+qKMGI+yB0A491EkhhPxVSB2GOUQ=;
 b=HJm7rP96OewjV7E999t+zXG5uzXmTGqYC3IhhPmymP9BPuf7gbs0JBZ0BqML7zrjw9
 G62FPkIVxBdqYJjM7zuxhLAqLKsf+MTXjjg82U9mzoWWNAQ3ZUB/pS9XrYXJ1s3tIqoC
 tyJ882Fyf5jVAuZ0V1pXxqv5TmyojH04t2wvZNurmQPuTVhYlTs7jli3qGyTqQmQDEUf
 /p8mi4dyElRY1dcg5jB6HcRiHd8CoCVdB8PT9V0HUbtX73pO/HIZG+MuIs+DzG3CL+kQ
 lMskZ/4N5CV3HIPi6rZJ3Yw42FFmVexDqkBfnLusxQVoY96nJlxw5ZIGCZWGFTc3hKxO
 S/ZA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWC5y5lzgaW5TSG5ZZ7wS+Ofnoy0+EFZB/bnNEy6HB4r4f5/VOCV70yzfq8Wf12snOyYpmc36b8Fg==@nongnu.org
X-Gm-Message-State: AOJu0YzVW5gGAB/gmYj9UDIYh3DPMI0cZWyuf4L413SkijbJU/ZBPbjv
 g1RO+wlb0H+FHj9edKDjIMCp+i1fRPkHyw3HbYdwBu2Sfu7qLjrffJI7kUzs4j0zeaI=
X-Gm-Gg: AY/fxX65fG0olpi+ncw299oi6rJTaMe/98p79W0T/ATwSU0p6psV9oZTUWOJZrq4MYT
 whCSts5CqzbRyizZYrhMdzFWM3rsqq8ShfbuSAqSCKgHVq+u/xqfJso4WxA763dGM5jVlK/nIUE
 Hg2XsCEaqbQSXJZkByx/+YjWxG3TQehr6OGmPbQ9JW7720bxFGAaZbJ4qK2npshNNxaNsKKYYoc
 dBw8ShsrWJzHj+A7+ZGf2cp1a8L5qnmcBw1tDI5Xp8LYF1hO6Fxo3ohsgTyur8Xt/86n96oQyfu
 nE6XmRtCvEfR2wCPcOFl6PYgupQ0QSkhmq24t/eWFmHzBqoQGd6xb+MY5HLYVhRTf9Nn1GL9RTN
 leYXI4KrgZMnBh5/JgRBjpQkNExbJUaYJXeaihHQewEHeDS1jIsIpe+VmgANVUcLjG+08JlyUKL
 s8x8kQR3yZKKdbLREqE6xhxG6MQlSfoEd3CRTGaxhUx76OEd6qVYSS2szma2N5
X-Google-Smtp-Source: AGHT+IGX4yLhEa44exEf/Rh/CWISlnBAjJ9PAnCC0J8qGzSzYorg7KAW+nrmR2GBZzPYfw+iesWwjw==
X-Received: by 2002:a05:600c:3f08:b0:477:9c73:2680 with SMTP id
 5b1f17b1804b1-47bdd99afdcmr20270145e9.23.1765981928310; 
 Wed, 17 Dec 2025 06:32:08 -0800 (PST)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4310ade81absm4996784f8f.21.2025.12.17.06.32.06
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 17 Dec 2025 06:32:07 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Anton Johansson <anjo@rev.ng>, qemu-arm@nongnu.org,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Paolo Bonzini <pbonzini@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Artyom Tarasenko <atar4qemu@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 David Hildenbrand <david@kernel.org>, Peter Xu <peterx@redhat.com>
Subject: [PATCH 02/14] target/sparc: Update MMU page table using stl_phys()
Date: Wed, 17 Dec 2025 15:31:38 +0100
Message-ID: <20251217143150.94463-3-philmd@linaro.org>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251217143150.94463-1-philmd@linaro.org>
References: <20251217143150.94463-1-philmd@linaro.org>
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

stl_phys_notdirty() is supposed to do an optimized CODE
path store. Here we update the page table via the DATA
path, so can use the normal stl_phys() helper.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 target/sparc/mmu_helper.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/sparc/mmu_helper.c b/target/sparc/mmu_helper.c
index 217580a4d8c..46bf500ea83 100644
--- a/target/sparc/mmu_helper.c
+++ b/target/sparc/mmu_helper.c
@@ -189,7 +189,7 @@ static int get_physical_address(CPUSPARCState *env, CPUTLBEntryFull *full,
         if (is_dirty) {
             pde |= PG_MODIFIED_MASK;
         }
-        stl_phys_notdirty(cs->as, pde_ptr, pde);
+        stl_phys(cs->as, pde_ptr, pde);
     }
 
     /* the page can be put in the TLB */
-- 
2.52.0


