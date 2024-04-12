Received: by 2002:a17:906:4a51:b0:a52:fc6:5c40 with SMTP id a17csp416117ejv;
        Fri, 12 Apr 2024 01:14:35 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUahjnpO5qNRt4rxGNJXNfhOqmmutCawf+TVp2dY3orCKyRxtaQdyiO1eLgIl4HhRyxCrtdRHvpVP5qb8TQVTQi6NLAPNJ5
X-Google-Smtp-Source: AGHT+IE8CbP6Wu5lnPjMWvdCGrI5t5nkzB60m6gXcQADAnuMwDBNsVa2LLOvzuTRmJMp57LdsrOn
X-Received: by 2002:a05:6122:3c54:b0:4d8:4a7f:c166 with SMTP id fv20-20020a0561223c5400b004d84a7fc166mr2241210vkb.12.1712909675304;
        Fri, 12 Apr 2024 01:14:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1712909675; cv=none;
        d=google.com; s=arc-20160816;
        b=brczj3NjVDkf5+ddUqt9BmFGZxismfjHnZkRlrW6LKcGTGCAu3RvRgr7PCccZqsv/G
         WLqQx+bbqwzgybu6rj6RjvK0JN68UVZwG9KHOtkjHioKWaBjwbjNYL+HrIo6Z9lQF02t
         JQffR6aZaJ1FAdo+rbS3mNtZIvcOT3lohTAuDG0ugGHVN5oDKR04VVBrJjEbRGMrcd9i
         UciYG6chfmYxoiVUwAsU9RZrpltmI8k0Wqdo6hAVMXYh7m3is7OlMjcElZ3xIUivfhLs
         wkhr7K1g55mNH49eHAepuB60lp0EQxXaUvtPoMg23dnLjpuxDwCeD3VgaexQS/rnOtao
         13+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from;
        bh=ol8CrzhQ9MotHBu90NBLuuAo1prWbtCerUdfoRprWiI=;
        fh=djCCtpo7S9qh+gHA1UFb5Brabs3zgoMT14nUZxLb1lU=;
        b=sf1YD+aLGy7SMqwagIKmn3k2G1Psgu9CV/FkyJ7OtTFeW5a2y6J/DIZy0MxnzKUuTO
         vtvuuKOr86kJTlr0lO7zIwMcLL6F/9NIZMvWLTLlXvoal8C2Lmtwcl2F6NODod4R7kRF
         lWUmUzMsjVJtFMq8cGSSBKYODkH9usu3m09o+M2R/VlTevgIEeXyfMPnpl/tATuaWcUs
         g/XQrRC8POSMMV1JKp0K23rySWmEFI1Y7qd+BQ7LGA+SFOh5mkYwc/KNAAowcMPfq83B
         sBpSaeVlvKFPAQnFks8683wxIlR0zFUuPwoy+2bes3mZAHkjBNOAzCNCMNIVjHdYZl8k
         PmLQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id q8-20020a05620a038800b0078d459c829bsi3160430qkm.435.2024.04.12.01.14.35
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 12 Apr 2024 01:14:35 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1rvC32-00017n-Ly; Fri, 12 Apr 2024 04:14:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <adiupina@astralinux.ru>)
 id 1rvC30-00017V-F0; Fri, 12 Apr 2024 04:14:10 -0400
Received: from new-mail.astralinux.ru ([51.250.53.244])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <adiupina@astralinux.ru>)
 id 1rvC2y-0006PD-90; Fri, 12 Apr 2024 04:14:10 -0400
Received: from rbta-msk-lt-302690.astralinux.ru (unknown [10.177.236.225])
 by new-mail.astralinux.ru (Postfix) with ESMTPA id 4VG8Ts37rXzyf3;
 Fri, 12 Apr 2024 11:13:53 +0300 (MSK)
From: Alexandra Diupina <adiupina@astralinux.ru>
To: Alistair Francis <alistair@alistair23.me>
Cc: Alexandra Diupina <adiupina@astralinux.ru>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org, sdl.qemu@linuxtesting.org
Subject: [PATCH RFC] prevent overflow in xlnx_dpdma_desc_get_source_address()
Date: Fri, 12 Apr 2024 11:13:28 +0300
Message-Id: <20240412081328.11183-1-adiupina@astralinux.ru>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-DrWeb-SpamScore: -100
X-DrWeb-SpamState: legit
X-DrWeb-SpamDetail: gggruggvucftvghtrhhoucdtuddrgedvfedrvdehuddgtddvucetufdoteggodetrfcurfhrohhfihhlvgemucfftfghgfeunecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvfevufffkffoggfgsedtkeertdertddtnecuhfhrohhmpeetlhgvgigrnhgurhgrucffihhuphhinhgruceorgguihhuphhinhgrsegrshhtrhgrlhhinhhugidrrhhuqeenucggtffrrghtthgvrhhnpeduleetfeehffekueeuffektefgudfgffeutdefudfghedvieffheehleeuieehteenucffohhmrghinheplhhinhhugihtvghsthhinhhgrdhorhhgnecukfhppedutddrudejjedrvdefiedrvddvheenucfrrghrrghmpehhvghloheprhgsthgrqdhmshhkqdhlthdqfedtvdeiledtrdgrshhtrhgrlhhinhhugidrrhhupdhinhgvthepuddtrddujeejrddvfeeirddvvdehmeehheefiedvpdhmrghilhhfrhhomheprgguihhuphhinhgrsegrshhtrhgrlhhinhhugidrrhhupdhnsggprhgtphhtthhopeejpdhrtghpthhtoheprghlihhsthgrihhrsegrlhhishhtrghirhdvfedrmhgvpdhrtghpthhtoheprgguihhuphhinhgrsegrshhtrhgrlhhinhhugidrrhhupdhrtghpthhtohepvggughgrrhdrihhglhgvshhirghssehgmhgrihhlrdgtohhmpdhrtghpthhtohepphgvthgvrhdrmhgrhiguvghllheslhhinhgrrhhordhorhhgpdhrtghpthhtoh
 epqhgvmhhuqdgrrhhmsehnohhnghhnuhdrohhrghdprhgtphhtthhopehqvghmuhdquggvvhgvlhesnhhonhhgnhhurdhorhhgpdhrtghpthhtohepshgulhdrqhgvmhhusehlihhnuhigthgvshhtihhnghdrohhrgh
X-DrWeb-SpamVersion: Vade Retro 01.423.251#02 AS+AV+AP Profile: DRWEB;
 Bailout: 300
X-AntiVirus: Checked by Dr.Web [MailD: 11.1.19.2307031128,
 SE: 11.1.12.2210241838, Core engine: 7.00.62.01180, Virus records: 12591016,
 Updated: 2024-Apr-12 06:38:41 UTC]
Received-SPF: pass client-ip=51.250.53.244;
 envelope-from=adiupina@astralinux.ru; helo=new-mail.astralinux.ru
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: O8WwKpREOWbh

Overflow can occur in a situation where desc->source_address
has a maximum value (pow(2, 32) - 1), so add a cast to a
larger type before the assignment.

Found by Linux Verification Center (linuxtesting.org) with SVACE.

Fixes: d3c6369a96 ("introduce xlnx-dpdma")
Signed-off-by: Alexandra Diupina <adiupina@astralinux.ru>
---
 hw/dma/xlnx_dpdma.c | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/hw/dma/xlnx_dpdma.c b/hw/dma/xlnx_dpdma.c
index 1f5cd64ed1..224259225c 100644
--- a/hw/dma/xlnx_dpdma.c
+++ b/hw/dma/xlnx_dpdma.c
@@ -175,24 +175,24 @@ static uint64_t xlnx_dpdma_desc_get_source_address(DPDMADescriptor *desc,
 
     switch (frag) {
     case 0:
-        addr = desc->source_address
-            + (extract32(desc->address_extension, 16, 12) << 20);
+        addr = (uint64_t)(desc->source_address
+            + (extract32(desc->address_extension, 16, 12) << 20));
         break;
     case 1:
-        addr = desc->source_address2
-            + (extract32(desc->address_extension_23, 0, 12) << 8);
+        addr = (uint64_t)(desc->source_address2
+            + (extract32(desc->address_extension_23, 0, 12) << 8));
         break;
     case 2:
-        addr = desc->source_address3
-            + (extract32(desc->address_extension_23, 16, 12) << 20);
+        addr = (uint64_t)(desc->source_address3
+            + (extract32(desc->address_extension_23, 16, 12) << 20));
         break;
     case 3:
-        addr = desc->source_address4
-            + (extract32(desc->address_extension_45, 0, 12) << 8);
+        addr = (uint64_t)(desc->source_address4
+            + (extract32(desc->address_extension_45, 0, 12) << 8));
         break;
     case 4:
-        addr = desc->source_address5
-            + (extract32(desc->address_extension_45, 16, 12) << 20);
+        addr = (uint64_t)(desc->source_address5
+            + (extract32(desc->address_extension_45, 16, 12) << 20));
         break;
     default:
         addr = 0;
-- 
2.30.2

