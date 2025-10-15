Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E49A3CCD18E
	for <qemu-arm@archiver.kernel.org>; Wed, 15 Oct 2025 09:24:28 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1v8xeL-0001wd-GS; Wed, 15 Oct 2025 05:18:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <corvin.koehne@gmail.com>)
 id 1v8xe1-0001nK-V1
 for qemu-arm@nongnu.org; Wed, 15 Oct 2025 05:18:08 -0400
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <corvin.koehne@gmail.com>)
 id 1v8xdl-0007Cr-Bm
 for qemu-arm@nongnu.org; Wed, 15 Oct 2025 05:18:05 -0400
Received: by mail-ej1-x634.google.com with SMTP id
 a640c23a62f3a-b403bb7843eso1312499866b.3
 for <qemu-arm@nongnu.org>; Wed, 15 Oct 2025 02:17:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1760519865; x=1761124665; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=baDgYgvzr/dXlXUXldhfL3pSR8JkqjCM4XJ76RH788g=;
 b=YCsrt3XSQrzCFXHfydZQ/Nib2E94QUXzVOqM4L6dnS72bPn9Su2/Cd7OGSzSyusBZ5
 //yLfaghPqIrZGcaUS0w3uaJ+uPXLrgSwLgjU/KAiBTrumbJ+6EbkA15vNIgNhyo07Sz
 U/0ohlYHHW9GClrevsSCnlSfXkq30me0bZ1W+2tqsWWKD/9AtTEbm+tjrtnSpEQW5fot
 9fYcBC3mgTGrHMo1+Pbvt9IKdtvebr2/chJN1uf870E9uROJyrf85NwpKwHrhudLHL76
 ekRAYr03uZvsy1E711ZJTaPqb3xWGmSqdtKIsXqOye6EzlojCDLGLk9GKzhqCrOoJWrN
 ff8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760519865; x=1761124665;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=baDgYgvzr/dXlXUXldhfL3pSR8JkqjCM4XJ76RH788g=;
 b=KjroiG+KPcc4Dkd+1wKuYUNAerPHx/V89NVK7MsUWNcuzA/e9BtwhhnZQ0nhl7/iTV
 1GFhuPSpdPkHdljlaM4KPGoP/0hzaQIa4TdUiBCkROiz6dBvyzzgPuSfAR0NWVNHKtGW
 V3E2Lg6nRLuhIqzqED5lAP+9pQHloAoybxzAqWRRhry5U0hP/nehOIxu4n7QgePyDVjG
 hoA9RnT7hhL/G+vIc4LGG4dGMFrb0pHzVSt4zuJkklMuOqTilttjF1ehkr+qYe4X6ExK
 AGAVONSR2epRZyTyRs+RB9b0IXvGcB0ijqSf821kwpJFbP6/rrK+XMMTTvxqdq3a9epR
 XH2A==
X-Forwarded-Encrypted: i=1;
 AJvYcCVGeB37YWXkdH2SGqs6HnGL+yjTytEWTxkf/5S74a6ktph/KOrpIYrXXub/ASvaExWFK1fsd6qlXw==@nongnu.org
X-Gm-Message-State: AOJu0Yz65wLFGeL17emLBn/GmMDt6cUlRVSN128lB8Zhq16bQW4QDV8S
 lELGNL9N7rFW6UjDHD0mB6mYWzQgejjLL9Ro7LecpCeIIVwg2jgXxDup
X-Gm-Gg: ASbGnctb7WHaFtyVkDblift7sYSvDwYDkEkOwnI4vX5BlrOc5RMbG12FQDUjMb0ou56
 te1tkFp2lv/mYzVdrVAKjo6tXxHdrT+lclQE6e0ooKrHo3cvutW537/CiB86CHqXY0jbqnPCPeJ
 m5RxQLO94AgAvKg/iOp9U3xVepUDUjOFWQjHCV1HztJBiHQsb43cFarZcwQYAU2bjkY386S8pix
 NN+AjFb9YQ55C/hWFw6zWIKphKGuUGVebiFBV/nmE+zSAcIops/TPF3CMaeJfedk2kN1r6Nasuy
 udocGcjb7DoPyGmrP5gXJlX8cAXkorhNJsux4QbAe8NqLli+sOeGBjEFIKYnB8Rmj45oanscyo8
 jDmJp692kSvmbDAKN/EnalAvqz3yNhQtv+xT/Ol3C1XQyyeDMdj9HJBy6VScBPpf2tcM5JFYJ
X-Google-Smtp-Source: AGHT+IGytdFse3HoFRdqgE/u92lvDWAJzEzdBBmxgsEmtKzwprTw1/OgX+vjm8Hlaaa+Upama61Icw==
X-Received: by 2002:a17:907:9448:b0:b50:9863:dbe0 with SMTP id
 a640c23a62f3a-b50abfd6e35mr2935573066b.37.1760519865171; 
 Wed, 15 Oct 2025 02:17:45 -0700 (PDT)
Received: from PC-DA2D10.beckhoff.com ([195.226.174.194])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b5cb9e7a23dsm182069966b.23.2025.10.15.02.17.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Oct 2025 02:17:44 -0700 (PDT)
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
 YannickV <Y.Vossen@beckhoff.com>,
 "Edgar E. Iglesias" <edgar.iglesias@amd.com>
Subject: [PATCH v3 04/14] hw/arm/zynq-devcfg: Prevent unintended unlock during
 initialization
Date: Wed, 15 Oct 2025 11:17:19 +0200
Message-ID: <20251015091729.33761-5-corvin.koehne@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251015091729.33761-1-corvin.koehne@gmail.com>
References: <20251015091729.33761-1-corvin.koehne@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::634;
 envelope-from=corvin.koehne@gmail.com; helo=mail-ej1-x634.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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

From: YannickV <Y.Vossen@beckhoff.com>

During the emulation startup, all registers are reset, which triggers the
`r_unlock_post_write` function with a value of 0. This led to an
unintended memory access disable, making the devcfg unusable.

During startup, the memory space no longer gets locked.

Signed-off-by: YannickV <Y.Vossen@beckhoff.com>
Reviewed-by: Edgar E. Iglesias <edgar.iglesias@amd.com>
---
 hw/dma/xlnx-zynq-devcfg.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/hw/dma/xlnx-zynq-devcfg.c b/hw/dma/xlnx-zynq-devcfg.c
index f11d0e1b1c..72d73e93c7 100644
--- a/hw/dma/xlnx-zynq-devcfg.c
+++ b/hw/dma/xlnx-zynq-devcfg.c
@@ -221,7 +221,9 @@ static void r_unlock_post_write(RegisterInfo *reg, uint64_t val)
 {
     XlnxZynqDevcfg *s = XLNX_ZYNQ_DEVCFG(reg->opaque);
     const char *device_prefix = object_get_typename(OBJECT(s));
-
+    if (device_is_in_reset(DEVICE(s))) {
+        return;
+    }
     if (val == R_UNLOCK_MAGIC) {
         DB_PRINT("successful unlock\n");
         s->regs[R_CTRL] |= R_CTRL_PCAP_PR_MASK;
-- 
2.47.3


