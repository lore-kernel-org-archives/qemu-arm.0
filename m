Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3E84CA0EEB
	for <qemu-arm@archiver.kernel.org>; Fri, 22 Aug 2025 13:53:53 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1upSD5-0005iK-Ue; Fri, 22 Aug 2025 09:53:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cjchen@igel.co.jp>) id 1upO1U-0005h4-T3
 for qemu-arm@nongnu.org; Fri, 22 Aug 2025 05:25:25 -0400
Received: from mail-pg1-x529.google.com ([2607:f8b0:4864:20::529])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <cjchen@igel.co.jp>) id 1upO1S-0007AS-KA
 for qemu-arm@nongnu.org; Fri, 22 Aug 2025 05:25:24 -0400
Received: by mail-pg1-x529.google.com with SMTP id
 41be03b00d2f7-b49c1c130c9so225903a12.0
 for <qemu-arm@nongnu.org>; Fri, 22 Aug 2025 02:25:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=igel-co-jp.20230601.gappssmtp.com; s=20230601; t=1755854721; x=1756459521;
 darn=nongnu.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=CPBXmwU1P2JOttDvf/F4AUriHtbYHkfUE8krSjFXNTI=;
 b=0hyhumnHT+wzjxI3l5lQ9w0ReGx82Z/8UJBX6STsFLkQFkhwawLw0/dGvjvrhxs7v5
 9MW2s+0D0fWAQKH5SZQENaXmS71uF+FfJDu+pQqoNNemiw4c13CWb/Ec99L6iX49yQLw
 9EGCOpA5xDTW+lRicn0IxN6hDpbR6VbcK3WsB8ieV2DcL743e7eu8AzqtcNnvFIBvrNj
 YVm7wP/GJKDHCDSPA6s0KjFaO6V60xBClkkTk6Zb4AoEPKYnk/A3NLq9A6gczX+hd+H/
 d0RHzTUDG2/m3GKGFl5I3bx3b0BvrwIfbIXRQX3w/9mOZHQVIM0x01CERVWSP1MRSdMr
 3biA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755854721; x=1756459521;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=CPBXmwU1P2JOttDvf/F4AUriHtbYHkfUE8krSjFXNTI=;
 b=h1shwBq8jJKkrYugeHo2aNP73oDKhwsBe60/1f20Ldcign3yFsjGiV6oNKbPOtfQug
 /hVbzuXFKczxb+pFnAky4hzb24YAICT7v66RYMrVuVAmKgZCn1+2asGFwKyG/Ukjbd7N
 ri/fqWwBCGjevB8sC6j9I8MnLT1HaM5938SkJXB+qkHHoR1UqOf91l2qZenuKrEAyi9y
 9EgUbej5Z2TRxCDsQs8PziyONEWlcsT8YSHDssxbz8GrSTsBwYKh7yz32YiSapji3erI
 kHadbpfmODs6hU/LlxwkQSxuZ5piB5yP0JhBExgdyiqfPNWbvGEevN4FJbShQ9JoGIRQ
 YaBg==
X-Forwarded-Encrypted: i=1;
 AJvYcCU3/LEPG5GUGHjiRtFMqxzquiV8wMsfwWx7QqRA94uCgKzBB2DKt9VLzE1PLeKfpMKxJwbC+vCTrQ==@nongnu.org
X-Gm-Message-State: AOJu0Yyeb+JTixiYWVDMejqUw6lCVprqMWb0DQA22MxHTQj2uGe4+MnB
 Vz7wGXzLNnn4acDgPlCdmr2TZoViT1ta/mGLLadYsWkpOdrWsSlJ49ZoZaECeDrJ2lI=
X-Gm-Gg: ASbGncvwyKAkiGQhmuVllpPq9dDVw8NHW0BR30gv/dDJ3CkeJz2phyRMid4/PAnxw+6
 3EZH/1xlC4SIcozckxqfXURum9DaIDP4/7Gb7pZ8+E0ZFZwezWECau5SNrA8XMsK0ddhewdwZjZ
 069hVXm2Fv8aQGcL3zBQfeZ9tr06AYdx6zAxuEAeCwqg8MeQ2GkYhqz/Rx86bDjiZe4HlhTuIUY
 gKQ+L2wNaM2QPs1K2FUTZhk1Bwp7HbqJjiNhZMHmN6iajnL3F09mY0C79zIzz0KUr7fD9ezuU+I
 RrWj5+9LAYSfaUNqOzIk8XMSpyE9FAfwgK8jOgg54iXG/74TAhyxOBBSETm6iWStCM5xEMaFAQG
 hHyC+35Z1Rp0ymojx1KKM9Vw7WIrpf6igJOvyxT2uFhcDMBWvZtPh
X-Google-Smtp-Source: AGHT+IFjvo9bWFDlURrx68v+zTGIpikr6/j0R2yKpRo9yWHk3zInG5YNv7tU7I9P2qs4WDy/XMZHDA==
X-Received: by 2002:a17:902:da85:b0:234:c8f6:1afb with SMTP id
 d9443c01a7336-2462eb37ab9mr32227985ad.0.1755854720839; 
 Fri, 22 Aug 2025 02:25:20 -0700 (PDT)
Received: from warg.hq.igel.co.jp (napt.igel.co.jp. [219.106.231.132])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-245ed4c6fb7sm78560215ad.89.2025.08.22.02.25.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 Aug 2025 02:25:20 -0700 (PDT)
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
Subject: [RFC PATCH v2 3/9] hw: npcm7xx_fiu and mx_pic change .impl.unaligned
 = true
Date: Fri, 22 Aug 2025 18:24:04 +0900
Message-Id: <20250822092410.25833-4-cjchen@igel.co.jp>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250822092410.25833-1-cjchen@igel.co.jp>
References: <20250822092410.25833-1-cjchen@igel.co.jp>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::529;
 envelope-from=cjchen@igel.co.jp; helo=mail-pg1-x529.google.com
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

By setting .impl.unaligned = true, we allow QEMU to pass along
unaligned requests directly as-is, rather than splitting them into
multiple aligned sub-requests that might cause repeated device
callbacks or unintended side effects.

Signed-off-by: CJ Chen <cjchen@igel.co.jp>
Tested-by: CJ Chen <cjchen@igel.co.jp>
Acked-by: Tomoyuki Hirose <hrstmyk811m@gmail.com>
Reported-by: Tomoyuki Hirose <hrstmyk811m@gmail.com>
---
 hw/ssi/npcm7xx_fiu.c | 3 +++
 hw/xtensa/mx_pic.c   | 3 +++
 2 files changed, 6 insertions(+)

diff --git a/hw/ssi/npcm7xx_fiu.c b/hw/ssi/npcm7xx_fiu.c
index 056ce13394..10ee4deb31 100644
--- a/hw/ssi/npcm7xx_fiu.c
+++ b/hw/ssi/npcm7xx_fiu.c
@@ -255,6 +255,9 @@ static const MemoryRegionOps npcm7xx_fiu_flash_ops = {
         .max_access_size = 8,
         .unaligned = true,
     },
+    .impl = {
+        .unaligned = true,
+    },
 };
 
 /* Control register read handler. */
diff --git a/hw/xtensa/mx_pic.c b/hw/xtensa/mx_pic.c
index 8211c993eb..6bf524a918 100644
--- a/hw/xtensa/mx_pic.c
+++ b/hw/xtensa/mx_pic.c
@@ -270,6 +270,9 @@ static const MemoryRegionOps xtensa_mx_pic_ops = {
     .valid = {
         .unaligned = true,
     },
+    .impl = {
+        .unaligned = true,
+    },
 };
 
 MemoryRegion *xtensa_mx_pic_register_cpu(XtensaMxPic *mx,
-- 
2.25.1


