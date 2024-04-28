Received: by 2002:a17:906:c1cf:b0:a52:4db9:938b with SMTP id bw15csp1733871ejb;
        Sun, 28 Apr 2024 11:12:18 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWaMP+6lRw8wNzzQmR0A4K/Py+uAkaW6J17ytOhA+nGRr+u+++j4Pyei6sINBu9x5rmo7hW1HgVNirweV0BMZNTQszrMU7v
X-Google-Smtp-Source: AGHT+IFSjY6aAy/65zGzFdhGJ1XvfFmM6Z9/ZAeZobyRCu0knSkIjfIuXAs0AKhGq53trVZsj1sQ
X-Received: by 2002:a05:6122:469d:b0:4cb:56c5:580e with SMTP id di29-20020a056122469d00b004cb56c5580emr8698480vkb.11.1714327938426;
        Sun, 28 Apr 2024 11:12:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1714327938; cv=none;
        d=google.com; s=arc-20160816;
        b=WfSLfwQLWyvvre91YUhCjbTmzaQsU9Br6Z4hYoPXHuwC2RytJ+0zyr4Uz/ZQpuAa0I
         xreujvC47uF4JAbFoXxkSPexOb4nVIIPY6Q4S15OneG7zbsugHOzLwYpUd4MC2U2btUE
         hyrQ9N1WwqE6Jtz8FEJLrjKkB05ciZf1p+tsOB/nqaG2JoLyols3D6uUI39yzS7skWuO
         AcisP9k+CbzdNRK+aT0gfeG5fFBmfJfPwhpiILZVeEJ3qo2reWaaxWABbRGJuSaJrQSK
         ANk7MivLZQapseUqHnQjrDQA7kJdF7560q2iKAZj4CcD877idZ7D7DazYl8h6pOWOgjZ
         sQwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from;
        bh=O7tsyiq9zaZaMdgIuHgOJf9OO6b9piKrb9MTDrbA5rY=;
        fh=/0MHjUAmI/wL40Gy3mvvC19IqtVRkTQxODnHjMieUFU=;
        b=kX/x83szqWljrhlnluGMErplzAHtAXO8fG6kbykMNEwXUBTnfjcQGtf/aEADT8w6Hp
         ESCvWYgZ33tuZ2sjvpcQnBuCHvE1VkygM/eZWnWHQT+DmepGWVSRiO3RLIcSadT7XjMN
         Oge9vRjPLApmzmGVHjBkZxsU8ucxIDXQMhkLvub7DBFDI+2oCtVxV82euwxFoiwRgQOf
         NdMTx+wQlek1WhYvNfszBZP0cQg+Qcw0Oadd70k/r7Tw+UWKtM42lm2mVoMNo3DOUWfN
         CqROruYkoukyZTytTH9QODR9JHvaTfvi3l44qBgxE/rsm59g7pr88z6rlViOYaC/s8nM
         hZTg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v25-20020a05620a091900b00790f5c422ccsi651477qkv.673.2024.04.28.11.12.18
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 28 Apr 2024 11:12:18 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1s190S-0001rt-6M; Sun, 28 Apr 2024 14:12:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <adiupina@astralinux.ru>)
 id 1s190R-0001rY-3T; Sun, 28 Apr 2024 14:12:07 -0400
Received: from new-mail.astralinux.ru ([51.250.53.244])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <adiupina@astralinux.ru>)
 id 1s190O-0007A3-Qf; Sun, 28 Apr 2024 14:12:06 -0400
Received: from rbta-msk-lt-302690.astralinux.ru (unknown [10.177.236.220])
 by new-mail.astralinux.ru (Postfix) with ESMTPA id 4VSF0Q3WpTzlW8L;
 Sun, 28 Apr 2024 21:11:50 +0300 (MSK)
From: Alexandra Diupina <adiupina@astralinux.ru>
To: Alistair Francis <alistair@alistair23.me>
Cc: Alexandra Diupina <adiupina@astralinux.ru>,
 "Konrad, Frederic" <Frederic.Konrad@amd.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org, sdl.qemu@linuxtesting.org
Subject: [PATCH v2] fix bit fields extraction and prevent overflow
Date: Sun, 28 Apr 2024 21:11:31 +0300
Message-Id: <20240428181131.23801-1-adiupina@astralinux.ru>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-DrWeb-SpamScore: -100
X-DrWeb-SpamState: legit
X-DrWeb-SpamDetail: gggruggvucftvghtrhhoucdtuddrgedvfedrvdehuddgtddvucetufdoteggodetrfcurfhrohhfihhlvgemucfftfghgfeunecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvfevufffkffoggfgsedtkeertdertddtnecuhfhrohhmpeetlhgvgigrnhgurhgrucffihhuphhinhgruceorgguihhuphhinhgrsegrshhtrhgrlhhinhhugidrrhhuqeenucggtffrrghtthgvrhhnpeduleetfeehffekueeuffektefgudfgffeutdefudfghedvieffheehleeuieehteenucffohhmrghinheplhhinhhugihtvghsthhinhhgrdhorhhgnecukfhppedutddrudejjedrvdefiedrvddvtdenucfrrghrrghmpehhvghloheprhgsthgrqdhmshhkqdhlthdqfedtvdeiledtrdgrshhtrhgrlhhinhhugidrrhhupdhinhgvthepuddtrddujeejrddvfeeirddvvddtmeefvdekkeeipdhmrghilhhfrhhomheprgguihhuphhinhgrsegrshhtrhgrlhhinhhugidrrhhupdhnsggprhgtphhtthhopeekpdhrtghpthhtoheprghlihhsthgrihhrsegrlhhishhtrghirhdvfedrmhgvpdhrtghpthhtoheprgguihhuphhinhgrsegrshhtrhgrlhhinhhugidrrhhupdhrtghpthhtohephfhrvgguvghrihgtrdfmohhnrhgrugesrghmugdrtghomhdprhgtphhtthhopegvughgrghrrdhighhlvghsihgrshesghhmrghilhdrtghomhdprhgtphhtthhope
 hpvghtvghrrdhmrgihuggvlhhlsehlihhnrghrohdrohhrghdprhgtphhtthhopehqvghmuhdqrghrmhesnhhonhhgnhhurdhorhhgpdhrtghpthhtohepqhgvmhhuqdguvghvvghlsehnohhnghhnuhdrohhrghdprhgtphhtthhopehsughlrdhqvghmuheslhhinhhugihtvghsthhinhhgrdhorhhg
X-DrWeb-SpamVersion: Vade Retro 01.423.251#02 AS+AV+AP Profile: DRWEB;
 Bailout: 300
X-AntiVirus: Checked by Dr.Web [MailD: 11.1.19.2307031128,
 SE: 11.1.12.2210241838, Core engine: 7.00.62.01180, Virus records: 12643460,
 Updated: 2024-Apr-28 16:43:47 UTC]
Received-SPF: pass client-ip=51.250.53.244;
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
X-TUID: ahV6gaa0jS05

Add a type cast and use extract64() instead of extract32()
to avoid integer overflow on addition. Fix bit fields
extraction according to documentation.

Found by Linux Verification Center (linuxtesting.org) with SVACE.

Fixes: d3c6369a96 ("introduce xlnx-dpdma")
Signed-off-by: Alexandra Diupina <adiupina@astralinux.ru>
---
v2: fix typo
 hw/dma/xlnx_dpdma.c | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/hw/dma/xlnx_dpdma.c b/hw/dma/xlnx_dpdma.c
index 1f5cd64ed1..530717d188 100644
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
-- 
2.30.2

