Received: by 2002:a17:906:c0c2:b0:a52:4db9:938b with SMTP id bn2csp579790ejb;
        Wed, 24 Apr 2024 05:54:20 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUg81RYhlENUGsyP+tbthOIdPg2tknSpCKw0m0oBzWCcUIJsVKUsY4xj/LYDmN4Igl8PX6zoWM+NlZtOpJhhcBFgxbrsk5R
X-Google-Smtp-Source: AGHT+IHzN1vRXMwDYtSPJtYwp78WfwUcc5EaVULCiRh8y3hRvVfUFTyq1uRBYVgMgxp64UAtrBw0
X-Received: by 2002:a05:6808:1a06:b0:3c8:43b9:d8a0 with SMTP id bk6-20020a0568081a0600b003c843b9d8a0mr2180025oib.14.1713963260557;
        Wed, 24 Apr 2024 05:54:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1713963260; cv=none;
        d=google.com; s=arc-20160816;
        b=cGF2xakZBZE1gs5Z6BOJJDXJqtJRwpp68IxEAAD4lPSVx+wQ3wcnXf9nQ5R2smV7bo
         HhOxZwDbJrfr+IdCYQKR24p3vnOwlFiDqJvVlYyRytB9RS2wQitb4CkzH49GPQ/UO4I7
         mB5RMkpTV4cbK2zFjP+S5Hk9JhFysCV5AsI9TIGBQxtworEqMC2bBlz8RFN4gO10ZqcB
         QsZ3WM4C5TrU8S46xlIPxUkrK5Kl51biDHUxvug332r43mJs6rPB0eduFPsVNZov7Wso
         810z1/BeZQ5Zn76ka8hsTMsPoUFO8ne8gWTVKCYC8LRq+/BpkrpU/J/PPh4QIwppKMVD
         wjaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from;
        bh=/i2g5nJjz9mu56gUr0SkTiR8+Nf3+K4cXKvgWC8jfeE=;
        fh=/0MHjUAmI/wL40Gy3mvvC19IqtVRkTQxODnHjMieUFU=;
        b=jsoiajVwIGwyP3X/StiDBjkYkJ/M9FIU63kFma1cMhauEvMvbdYxsQl0odXJToVCOl
         auu5qcYcUfaf9+jZODlLPR0ioPE3n6dhksL7DdIk+x8HsLEO3x5U6Gdabc9sQ012ai6q
         TSO+dk4EhzHJPVLcCHt21e93PMJfhHxfgksbgyfAeX5IOx+81fUOoXj+juaYI/Sx5onE
         HraoV9OL4IiRhfxB5peDhGVsrrMiH+FGrtyQdOiwSLmeofHy8TUHbF5wuwOw2Q2td3/i
         Q0VNngoNiBBE0hWpSJdH41Zb9kcOdY3QV5hBsceu+IOom92KJZBL+EdmjzRfBHdnSQ/F
         7leQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id xq10-20020a05620a5caa00b0078efcffadf2si14436389qkn.315.2024.04.24.05.54.20
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 24 Apr 2024 05:54:20 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rzc8c-0002ng-Vy; Wed, 24 Apr 2024 08:54:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <adiupina@astralinux.ru>)
 id 1rzc8b-0002n2-2N; Wed, 24 Apr 2024 08:54:13 -0400
Received: from new-mail.astralinux.ru ([51.250.53.164])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <adiupina@astralinux.ru>)
 id 1rzc8Y-0007U8-SA; Wed, 24 Apr 2024 08:54:12 -0400
Received: from rbta-msk-lt-302690.astralinux.ru (unknown [10.177.236.253])
 by new-mail.astralinux.ru (Postfix) with ESMTPA id 4VPf7S5hhRzqSQj;
 Wed, 24 Apr 2024 15:53:56 +0300 (MSK)
From: Alexandra Diupina <adiupina@astralinux.ru>
To: Alistair Francis <alistair@alistair23.me>
Cc: Alexandra Diupina <adiupina@astralinux.ru>,
 "Konrad, Frederic" <Frederic.Konrad@amd.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org, sdl.qemu@linuxtesting.org
Subject: [PATCH v2 RFC] fix host-endianness bug and prevent overflow
Date: Wed, 24 Apr 2024 15:53:24 +0300
Message-Id: <20240424125324.1628-1-adiupina@astralinux.ru>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <CAFEAcA9JXOxkbQP6-1uTK+hG5yvYRcO31PYFZSxGjfrPis1nYA@mail.gmail.com>
References: 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-DrWeb-SpamScore: -100
X-DrWeb-SpamState: legit
X-DrWeb-SpamDetail: gggruggvucftvghtrhhoucdtuddrgedvfedrvdehuddgtddvucetufdoteggodetrfcurfhrohhfihhlvgemucfftfghgfeunecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvfevufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeetlhgvgigrnhgurhgrucffihhuphhinhgruceorgguihhuphhinhgrsegrshhtrhgrlhhinhhugidrrhhuqeenucggtffrrghtthgvrhhnpeefkedufedvkeffuedtgfdugeeutdegvdffffejfffgleffieduhfejvdelffdvudenucffohhmrghinheplhhinhhugihtvghsthhinhhgrdhorhhgnecukfhppedutddrudejjedrvdefiedrvdehfeenucfrrghrrghmpehhvghloheprhgsthgrqdhmshhkqdhlthdqfedtvdeiledtrdgrshhtrhgrlhhinhhugidrrhhupdhinhgvthepuddtrddujeejrddvfeeirddvheefmeefjedufeekpdhmrghilhhfrhhomheprgguihhuphhinhgrsegrshhtrhgrlhhinhhugidrrhhupdhnsggprhgtphhtthhopeekpdhrtghpthhtoheprghlihhsthgrihhrsegrlhhishhtrghirhdvfedrmhgvpdhrtghpthhtoheprgguihhuphhinhgrsegrshhtrhgrlhhinhhugidrrhhupdhrtghpthhtohephfhrvgguvghrihgtrdfmohhnrhgrugesrghmugdrtghomhdprhgtphhtthhopegvughgrghrrdhighhlvghsihgrshesghhmrghilhdrtghomhdprhgtphhtth
 hopehpvghtvghrrdhmrgihuggvlhhlsehlihhnrghrohdrohhrghdprhgtphhtthhopehqvghmuhdqrghrmhesnhhonhhgnhhurdhorhhgpdhrtghpthhtohepqhgvmhhuqdguvghvvghlsehnohhnghhnuhdrohhrghdprhgtphhtthhopehsughlrdhqvghmuheslhhinhhugihtvghsthhinhhgrdhorhhg
X-DrWeb-SpamVersion: Vade Retro 01.423.251#02 AS+AV+AP Profile: DRWEB;
 Bailout: 300
X-AntiVirus: Checked by Dr.Web [MailD: 11.1.19.2307031128,
 SE: 11.1.12.2210241838, Core engine: 7.00.62.01180, Virus records: 12628564,
 Updated: 2024-Apr-24 10:54:44 UTC]
Received-SPF: pass client-ip=51.250.53.164;
 envelope-from=adiupina@astralinux.ru; helo=new-mail.astralinux.ru
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: JhXyD1+VyqdE

Add a type cast and use extract64() instead of extract32()
to avoid integer overflow on addition. Fix bit fields
extraction according to documentation.
Also fix host-endianness bug by swapping desc fields from guest
memory order to host memory order after dma_memory_read().

Found by Linux Verification Center (linuxtesting.org) with SVACE.

Fixes: d3c6369a96 ("introduce xlnx-dpdma")
Signed-off-by: Alexandra Diupina <adiupina@astralinux.ru>
---
 hw/dma/xlnx_dpdma.c | 38 ++++++++++++++++++++++++++++----------
 1 file changed, 28 insertions(+), 10 deletions(-)

diff --git a/hw/dma/xlnx_dpdma.c b/hw/dma/xlnx_dpdma.c
index dd66be5265..d22b942274 100644
--- a/hw/dma/xlnx_dpdma.c
+++ b/hw/dma/xlnx_dpdma.c
@@ -175,24 +175,24 @@ static uint64_t xlnx_dpdma_desc_get_source_address(DPDMADescriptor *desc,
 
     switch (frag) {
     case 0:
-        addr = desc->source_address
-            + (extract32(desc->address_extension, 16, 12) << 20);
+        addr = (uint64_t)desc->source_address
+            + (extract64(desc->address_extension, 16, 16) << 32);
         break;
     case 1:
-        addr = desc->source_address2
-            + (extract32(desc->address_extension_23, 0, 12) << 8);
+        addr = (uint64_t)desc->source_address2
+            + (extract64(desc->address_extension_23, 0, 16) << 32);
         break;
     case 2:
-        addr = desc->source_address3
-            + (extract32(desc->address_extension_23, 16, 12) << 20);
+        addr = (uint64_t)desc->source_address3
+            + (extract64(desc->address_extension_23, 16, 16) << 32);
         break;
     case 3:
-        addr = desc->source_address4
-            + (extract32(desc->address_extension_45, 0, 12) << 8);
+        addr = (uint64_t)desc->source_address4
+            + (extract64(desc->address_extension_45, 0, 16) << 32);
         break;
     case 4:
-        addr = desc->source_address5
-            + (extract32(desc->address_extension_45, 16, 12) << 20);
+        addr = (uint64_t)desc->source_address5
+            + (extract64(desc->address_extension_45, 16, 16) << 32);
         break;
     default:
         addr = 0;
@@ -660,6 +660,24 @@ size_t xlnx_dpdma_start_operation(XlnxDPDMAState *s, uint8_t channel,
             break;
         }
 
+        /* Convert from LE into host endianness.  */
+        desc.control = le32_to_cpu(desc.control);
+        desc.descriptor_id = le32_to_cpu(desc.descriptor_id);
+        desc.xfer_size = le32_to_cpu(desc.xfer_size);
+        desc.line_size_stride = le32_to_cpu(desc.line_size_stride);
+        desc.timestamp_lsb = le32_to_cpu(desc.timestamp_lsb);
+        desc.timestamp_msb = le32_to_cpu(desc.timestamp_msb);
+        desc.address_extension = le32_to_cpu(desc.address_extension);
+        desc.next_descriptor = le32_to_cpu(desc.next_descriptor);
+        desc.source_address = le32_to_cpu(desc.source_address);
+        desc.address_extension_23 = le32_to_cpu(desc.address_extension_23);
+        desc.address_extension_45 = le32_to_cpu(desc.address_extension_45);
+        desc.source_address2 = le32_to_cpu(desc.source_address2);
+        desc.source_address3 = le32_to_cpu(desc.source_address3);
+        desc.source_address4 = le32_to_cpu(desc.source_address4);
+        desc.source_address5 = le32_to_cpu(desc.source_address5);
+        desc.crc = le32_to_cpu(desc.crc);
+
         xlnx_dpdma_update_desc_info(s, channel, &desc);
 
 #ifdef DEBUG_DPDMA
-- 
2.30.2

