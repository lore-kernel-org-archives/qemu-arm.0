Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8F2ECCD196
	for <qemu-arm@archiver.kernel.org>; Wed, 15 Oct 2025 09:19:53 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1v8xeb-00029W-6D; Wed, 15 Oct 2025 05:18:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <corvin.koehne@gmail.com>)
 id 1v8xeV-00026E-Nj
 for qemu-arm@nongnu.org; Wed, 15 Oct 2025 05:18:35 -0400
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <corvin.koehne@gmail.com>)
 id 1v8xdt-0007H8-7V
 for qemu-arm@nongnu.org; Wed, 15 Oct 2025 05:18:35 -0400
Received: by mail-ej1-x635.google.com with SMTP id
 a640c23a62f3a-b48d8deafaeso1310496666b.1
 for <qemu-arm@nongnu.org>; Wed, 15 Oct 2025 02:17:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1760519874; x=1761124674; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=1IEAaSPzmzz5B3AM/apm91VbHSHgHQnwVHyZGTcUVH8=;
 b=JSiUqZ1HxyOiUxhm1C2USBNqRWyBodi0CJd5jNnnukWYTMFYdpr5uYJUUmnTsGflDW
 rAtbFrRuzaWayYFK2Q66cenxCWRMY9qiyyhAszOG1kvD8LKeMWpyAeCDz919PkyN73r1
 NStWwnv3ohQ+2pQlD1LJvpOgO5wEqyErqXOMJBL+A1NPPCoHrrZWo5Gn4UYO8JWycv3t
 Db3rdx1AyrIIpNozUm3T5aTjWeqWya4DMeWrY4ATCItRL1L95Og3nUR5rv2moxRK0Zrx
 02VX92IYhE9m+R9rHSzN70koAf5DjT+2yLM1oryMkDaM5r0ru+p1VB7GS0k4oBz2Eg6x
 0VTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760519874; x=1761124674;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=1IEAaSPzmzz5B3AM/apm91VbHSHgHQnwVHyZGTcUVH8=;
 b=eaJNNon4nenWjC+t/4p2InnIgpr5fZY68ttsz3N/AGNngYy8cn46hwIG9UnZbr3E2u
 XSnSrQs+EZvqf109J9BS2kvbXHVjsC9pPzOkD/CJ0sGMyEH1w4Q22QcoO0RkIXWv2EbZ
 pI+b3Oy2b5pwYo/Zh5jGj9Feetks4pqw5F81YNnZO7sPxtvs2QiVj4/tERwXYMV8/tdB
 PL5FfZaY/u1dwihLxMURhzzyF5Ulrq54H7XMxt+uAKx+bwphFPR1ceJbZfiEvsf8z3mg
 hUmfBiUNx8FQl/OZhk2l6mRkCwWq4LlymnEFO7/fbjU+VymjyNMEfaq21QGf593trtEa
 qugg==
X-Forwarded-Encrypted: i=1;
 AJvYcCV8K8jhdLANdW+P1SMkNy3kSfyvlN90eEltu4ypnLm7ytz3vD04E50Mc3MiSXhaOoTpwM3VRcS7iA==@nongnu.org
X-Gm-Message-State: AOJu0YzJBZL939EC4448K0d/9CNC5vGtE9LBSDGvcrx92nlfXBja83sL
 bj9bAiN/lvMeSC9raQU/OX6VVORw+91q7FXiBxhon/jng98JzYYnyD76
X-Gm-Gg: ASbGncv7iWDLVgwsF8TflH5pfsLgxo7ibak6bTwUdajoMi+/cgWx3xnfTnxoQIOpIKp
 e9l/fBcplmqqYPaRYpZIgBNiBjOwNsQYcUQdwIg8ORf+Ms/oO8Uf20pNjIFt8H+KY2VQKAHaw75
 bZY8U0IZVEiLXtW3sJPp1QM14qYy3OiVaKX+BuK3XwDRrIKEYrZgpV0ArjRYMvJS8E0g53xbR0g
 KPYh3oKkN/3hMOg1nygJ5OrXcJsBIFvuT8VBh5JZfBKlGhubhOqDntVvv9z79cH5on6H1wlKn33
 ydghZtzMZAXNuvsvGipbILFWIUVdPUtVetQErvTkcPM4WPVh/kbksuGgRUMDW6BYW8mV933E+MD
 5GV2jMXmyEFGDuZ2a3maVXQuH8MGVldVztAwzYKRf0Cj2JgKV6sd6Bpc7UwAsaGU0wz4RxjPB
X-Google-Smtp-Source: AGHT+IHLAZzJLN1bKOsiOe3mqN1XhP0eiIwCDbtX9fDYf91M3S2gHD5OBU7BbYanHg8raMaeLOUjMQ==
X-Received: by 2002:a17:907:3f1c:b0:b3e:26ae:7288 with SMTP id
 a640c23a62f3a-b50aa48e3b6mr2986592866b.8.1760519873543; 
 Wed, 15 Oct 2025 02:17:53 -0700 (PDT)
Received: from PC-DA2D10.beckhoff.com ([195.226.174.194])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b5cb9e7a23dsm182069966b.23.2025.10.15.02.17.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Oct 2025 02:17:53 -0700 (PDT)
From: =?UTF-8?q?Corvin=20K=C3=B6hne?= <corvin.koehne@gmail.com>
To: qemu-devel@nongnu.org
Cc: Kevin Wolf <kwolf@redhat.com>,
 =?UTF-8?q?Yannick=20Vo=C3=9Fen?= <y.vossen@beckhoff.com>,
 Alistair Francis <alistair@alistair23.me>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-arm@nongnu.org,
 Hanna Reitz <hreitz@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 qemu-block@nongnu.org,
 =?UTF-8?q?Corvin=20K=C3=B6hne?= <c.koehne@beckhoff.com>,
 YannickV <Y.Vossen@beckhoff.com>
Subject: [PATCH v3 12/14] hw/block/m25p80: Add HAS_SR_TB flag for is25lp016d
Date: Wed, 15 Oct 2025 11:17:27 +0200
Message-ID: <20251015091729.33761-13-corvin.koehne@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251015091729.33761-1-corvin.koehne@gmail.com>
References: <20251015091729.33761-1-corvin.koehne@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::635;
 envelope-from=corvin.koehne@gmail.com; helo=mail-ej1-x635.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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

From: YannickV <Y.Vossen@beckhoff.com>

The is25lp016d has 4 Block Write Protect Bits. BP3 specifies
whether the upper or lower range should be protected. Therefore,
we add the HAS_SR_TB flag to the is25lp016d flags.

Signed-off-by: YannickV <Y.Vossen@beckhoff.com>
---
 hw/block/m25p80.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/hw/block/m25p80.c b/hw/block/m25p80.c
index a5336d92ff..1df223ee81 100644
--- a/hw/block/m25p80.c
+++ b/hw/block/m25p80.c
@@ -217,7 +217,8 @@ static const FlashPartInfo known_devices[] = {
     /* ISSI */
     { INFO("is25lq040b",  0x9d4013,      0,  64 << 10,   8, ER_4K) },
     { INFO("is25lp080d",  0x9d6014,      0,  64 << 10,  16, ER_4K) },
-    { INFO("is25lp016d",  0x9d6015,      0,  64 << 10,  32, ER_4K) },
+    { INFO("is25lp016d",  0x9d6015,      0,  64 << 10,  32,
+           ER_4K | HAS_SR_TB) },
     { INFO("is25lp032",   0x9d6016,      0,  64 << 10,  64, ER_4K) },
     { INFO("is25lp064",   0x9d6017,      0,  64 << 10, 128, ER_4K) },
     { INFO("is25lp128",   0x9d6018,      0,  64 << 10, 256, ER_4K) },
-- 
2.47.3


