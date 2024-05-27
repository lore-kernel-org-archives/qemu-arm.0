Received: by 2002:a17:906:d149:b0:a5d:17e5:aef9 with SMTP id br9csp3145878ejb;
        Mon, 27 May 2024 05:43:42 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVdoO/rNOs+W7Vl9W/UvyWIUJIeDl/Z5VuylboN7LlxuNEnjegnMmY1bgoNrUXlgykotuo0HiTRph2ChWzAjEEANgV2KMso
X-Google-Smtp-Source: AGHT+IHO+hlkQ9si45lP38c8EoMT4WjiGQxFYuQdrxIRFE/zC/tLpeNdPfp4Uf1Nka09nMh41A0v
X-Received: by 2002:a5d:50d2:0:b0:355:513:f08b with SMTP id ffacd0b85a97d-35522186e6cmr5541507f8f.27.1716813821993;
        Mon, 27 May 2024 05:43:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1716813821; cv=none;
        d=google.com; s=arc-20160816;
        b=LABLFvSozsIVXiKe0IZ7OnBtzAHr7i4OY4OUyxabHjUlmqBIZ/T2NedFzSuWg+vTXI
         3ChejbxoHgZ6C3AK3UjL3izel7IjFxpHs96t68YA4DbIS5Qe7bTCz7n7nzK6N3W4Jz+v
         dSgsUg0CG/pmgUeWBqRkuZ7dADTLCLTxyDSFD0+T4ADjqWgF5YBzSbCploBS+G9ws1OT
         Afbw0VigELzUWPdteMNVGSRm4jEwsB4V+0vz+nGBlT9JQTX/9qSHCYasfcUOwvo0Ywc0
         9rBy4J2TRwPmoErWFvYzcGvyXLE33xNFiziQ3H2mBmSBfsCbSzpuIkn7veHdStUnWfkp
         p3/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=GsSo7ggYXEy2RsZ9Fjk6S+D1m5a9eQJCeX/Gs9rTaKo=;
        fh=8SfxjoPwua0GnXch0v0E5vHe79gER9apAKfSsmA7aIg=;
        b=IpD1RP6u0NCoBFlEOIEgXMTwVtD1RaQy59AJ0Pu5p8cYNL/XdbfB+r2abvPLfXwCP+
         NItwlC+4NtuVm80dSE2GK1060u/cXcWUhWRkLsqas8jgJyAlgxxbZ6voJtYVtExB7IOi
         l1ocMyeM4W6nRJJavJZcByyPCrYUQdI33kcIbudJQSL44vrcv697ofJo9LM1KtcRgZBr
         EYt6WPm+/INd8puSsiId3UsLj66531LmURpSRYt8DBrx2PheCDp3L0UH1i+PxebMbzSg
         IXSm3/Dt6xWZ/W1/wtU4IMUTzmD0g/RGJZAfQRs9nMUgGYflrGCttJtmuhl2sM/yqZEG
         6uOg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=PpPeMROz;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ffacd0b85a97d-3558922c8b0si3945288f8f.1082.2024.05.27.05.43.41
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 27 May 2024 05:43:41 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=PpPeMROz;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sBZhO-00017N-Uh; Mon, 27 May 2024 08:43:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@redhat.com>) id 1sBZhJ-00014I-Kj
 for qemu-arm@nongnu.org; Mon, 27 May 2024 08:43:31 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@redhat.com>) id 1sBZhI-0006Y8-32
 for qemu-arm@nongnu.org; Mon, 27 May 2024 08:43:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1716813806;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=GsSo7ggYXEy2RsZ9Fjk6S+D1m5a9eQJCeX/Gs9rTaKo=;
 b=PpPeMROzsNhkeNPL6W57nnUQzgCID7vCvuRz1FPj+xgAczrJ1QLk9+9Y1+PH3+l6Q3cybO
 4FOcTBFRojryFEmkTGzzCdkLs/UR6LYX1kVS2p714diUHIxZ8zwvIBV1ms8I/PTYdSrLza
 ac4CXoO0V1NMSBx/DnCxJ9KKIxYDWPA=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-630-1KkSo3sPN1K04e0bg1GMRQ-1; Mon, 27 May 2024 08:43:22 -0400
X-MC-Unique: 1KkSo3sPN1K04e0bg1GMRQ-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 81F32185A780;
 Mon, 27 May 2024 12:43:22 +0000 (UTC)
Received: from corto.redhat.com (unknown [10.39.193.246])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2632E492BC6;
 Mon, 27 May 2024 12:43:19 +0000 (UTC)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Jamin Lin <jamin_lin@aspeedtech.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@redhat.com>
Subject: [PATCH] aspeed/smc: Reintroduce "dram-base" property for AST2700
Date: Mon, 27 May 2024 14:43:15 +0200
Message-ID: <20240527124315.35356-1-clg@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.9
Received-SPF: pass client-ip=170.10.133.124; envelope-from=clg@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.034,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: 9bqp7S46Zyil

The Aspeed SMC device model use to have a 'sdram_base' property. It
was removed by commit d177892d4a48 ("aspeed/smc: Remove unused
"sdram-base" property") because previous changes simplified the DMA
transaction model to use an offset in RAM and not the physical
address.

The AST2700 SoC has larger address space (64-bit) and a new register
DMA DRAM Side Address High Part (0x7C) is introduced to deal with the
high bits of the DMA address. To be able to compute the offset of the
DMA transaction, as done on the other SoCs, we will need to know where
the DRAM is mapped in the address space. Re-introduce a "dram-base"
property to hold this value.

Signed-off-by: Cédric Le Goater <clg@redhat.com>
---
 include/hw/ssi/aspeed_smc.h | 1 +
 hw/ssi/aspeed_smc.c         | 1 +
 2 files changed, 2 insertions(+)

diff --git a/include/hw/ssi/aspeed_smc.h b/include/hw/ssi/aspeed_smc.h
index 8e1dda556b91..8791cc0ecb11 100644
--- a/include/hw/ssi/aspeed_smc.h
+++ b/include/hw/ssi/aspeed_smc.h
@@ -76,6 +76,7 @@ struct AspeedSMCState {
     AddressSpace flash_as;
     MemoryRegion *dram_mr;
     AddressSpace dram_as;
+    uint64_t     dram_base;
 
     AspeedSMCFlash flashes[ASPEED_SMC_CS_MAX];
 
diff --git a/hw/ssi/aspeed_smc.c b/hw/ssi/aspeed_smc.c
index 6e1a84c19713..7075bc9d61b0 100644
--- a/hw/ssi/aspeed_smc.c
+++ b/hw/ssi/aspeed_smc.c
@@ -1220,6 +1220,7 @@ static const VMStateDescription vmstate_aspeed_smc = {
 
 static Property aspeed_smc_properties[] = {
     DEFINE_PROP_BOOL("inject-failure", AspeedSMCState, inject_failure, false),
+    DEFINE_PROP_UINT64("dram-base", AspeedSMCState, dram_base, 0),
     DEFINE_PROP_LINK("dram", AspeedSMCState, dram_mr,
                      TYPE_MEMORY_REGION, MemoryRegion *),
     DEFINE_PROP_END_OF_LIST(),
-- 
2.45.1

