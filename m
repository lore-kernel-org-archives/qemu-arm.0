Received: by 2002:a19:e20e:0:0:0:0:0 with SMTP id z14csp1272053lfg;
        Thu, 6 May 2021 06:38:29 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy0b5SBlx24/sq2xmtD6FASX4H8Xm35AFMoasIMeKx1ZHM1XRQ8q58+rmeYbdLXm1xgyHP+
X-Received: by 2002:a05:6402:2050:: with SMTP id bc16mr5167886edb.179.1620308308880;
        Thu, 06 May 2021 06:38:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1620308308; cv=none;
        d=google.com; s=arc-20160816;
        b=0F1cjc7z4o1sj8NZq8gTzCbIqp2f6985tN73czcuSpAzHn0HL+pkMPBbA0MrEBdUQj
         WcZf37WXsf9Z87DCV58yKOh2S0phIxIcVSXm1zF8TbJGSI22eD1rfqAjVDhzYW/9yyqX
         EECrV/6lMbV40d9Q6yKfpB3AqTE/6Cs8+oxjezCpo6JUZRCLyWbBg19utXKC6GTYjXoM
         vuxMuzS2dVNhCWpcsWRe2E4U+QBUJ7qHlz5h8oUOAC0Li177GkXJxtTRSciOZJEMzHCh
         NWEBG7uVWd9oZIubl4cShTWT0KfYa84f9Lp/qjt/xw2nFXmbEgX5ukxP99vNuvXKKmgb
         u/zA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=B3vDcPc2Lwo5z0s8ItWutJUQDssHj4SCpM1PcCRAn5U=;
        b=iaP8RdbLap6aGVWFCaLSRxoTZdAhTKLto0/FT4adFG3kIVjs7w77MDSgdk5XXPEGvA
         iSuSHGdyxUiVKbTN6I9TsJPg4WvrtwPP0Qk792Ynootg63I2CfKt0JgZDf3rJHP1ZRcK
         Jn50B1O0FgpbGDmji96viSCkyiJpeDAxrZqbZLvrj6iqmhr3PZydmZJD8yQOw+iCYTPR
         L/MQfzuXHi1GzcNhS+ezhSC5IEb6hlO5tL7gjBmCP+FTZcTaaTupzuFg1S68youCa9Vl
         16A3PP1oIbWKSNCtpm9n3cMnKWqfMHjaq9Zs8rVC6ooJmuKTGZU5KYL5yVZhxLpcRbsg
         WM5g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=QRau2uHS;
       spf=pass (google.com: domain of philmd@redhat.com designates 216.205.24.124 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <philmd@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [216.205.24.124])
        by mx.google.com with ESMTPS id t4si2454706edd.446.2021.05.06.06.38.28
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 06 May 2021 06:38:28 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@redhat.com designates 216.205.24.124 as permitted sender) client-ip=216.205.24.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=QRau2uHS;
       spf=pass (google.com: domain of philmd@redhat.com designates 216.205.24.124 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1620308307;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=B3vDcPc2Lwo5z0s8ItWutJUQDssHj4SCpM1PcCRAn5U=;
	b=QRau2uHS6G+HWVTwmcDOgVnRuVh3MkMaP2cYoeOnezZG8xw6K5TwSN4n4uLMsAtuWe7x6y
	OVbGWnk3NbBR+1aompcBchjeJ8nAtI25UpR/fYlEPHXwIhxad7WuoUfIf5Vd77yV+gJce6
	CkEnqrYkWeCNuMJBzkDSftPQ5JazNS8=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-561-bwzcIbcGOfuO_SQYWwAycw-1; Thu, 06 May 2021 09:38:25 -0400
X-MC-Unique: bwzcIbcGOfuO_SQYWwAycw-1
Received: by mail-wr1-f72.google.com with SMTP id 93-20020adf93e60000b029010d9bb1923eso2221306wrp.4
        for <alex.bennee@linaro.org>; Thu, 06 May 2021 06:38:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=B3vDcPc2Lwo5z0s8ItWutJUQDssHj4SCpM1PcCRAn5U=;
        b=CDfED+DjdI/kh8CLayI18Pk5E/94eZW7PEwHuQNajk1GDj9aYYmpcgwEfa22RFipzD
         fBSyK98qhqfuHLsDczng2FKJZe8Y0BnO75my8hZeW/w8FVlddbvVS5YLpuI4wdHrWFcW
         UBAGx5iWUpfnmpbQq2gQ3dMu0IJd+fCRo5lgIz8CKLr1zF8yl4rmMlR9Gf5wgcy0WIPW
         iMuaiuwavurm90sbTabPbd1Dnv0h4MTQNG8qlJ7ao/nvIv/+0suebvCsBF++DBOmImA8
         Yk4pHXn5atEgKzj5vpSqGiSnr1X2BxmFAFX3dE4G6dmMHYKXlNWKwxyXqqLRt/spmc/M
         6V2Q==
X-Gm-Message-State: AOAM5330swZO2vXYNYaiK1j9QvWYy3lJH26iH27CIBQrDf1YCfHK8TDl
	S7NyG/9ogZccflovQ7kevGcEN92u611YcW0Ab1RlEcNSfD8gkgzeTpyzKGmWQj6GwR69Bw+4KNM
	IIHO1NgA6mkJLlbpx
X-Received: by 2002:a5d:48c3:: with SMTP id p3mr4659221wrs.150.1620308304640;
        Thu, 06 May 2021 06:38:24 -0700 (PDT)
X-Received: by 2002:a5d:48c3:: with SMTP id p3mr4659202wrs.150.1620308304482;
        Thu, 06 May 2021 06:38:24 -0700 (PDT)
Return-Path: <philmd@redhat.com>
Received: from localhost.localdomain (astrasbourg-652-1-219-60.w90-40.abo.wanadoo.fr. [90.40.114.60])
        by smtp.gmail.com with ESMTPSA id c15sm4424312wrr.3.2021.05.06.06.38.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 May 2021 06:38:24 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Cc: kvm@vger.kernel.org,
	qemu-ppc@nongnu.org,
	qemu-arm@nongnu.org,
	Gerd Hoffmann <kraxel@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: [PATCH v2 5/9] gdbstub: Constify GdbCmdParseEntry
Date: Thu,  6 May 2021 15:37:54 +0200
Message-Id: <20210506133758.1749233-6-philmd@redhat.com>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210506133758.1749233-1-philmd@redhat.com>
References: <20210506133758.1749233-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: LhkahMO2QTht

Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 gdbstub.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/gdbstub.c b/gdbstub.c
index 9103ffc9028..83d47c67325 100644
--- a/gdbstub.c
+++ b/gdbstub.c
@@ -1981,7 +1981,7 @@ static void handle_v_kill(GdbCmdContext *gdb_ctx, void *user_ctx)
     exit(0);
 }
 
-static GdbCmdParseEntry gdb_v_commands_table[] = {
+static const GdbCmdParseEntry gdb_v_commands_table[] = {
     /* Order is important if has same prefix */
     {
         .handler = handle_v_cont_query,
@@ -2324,7 +2324,7 @@ static void handle_set_qemu_phy_mem_mode(GdbCmdContext *gdb_ctx, void *user_ctx)
 }
 #endif
 
-static GdbCmdParseEntry gdb_gen_query_set_common_table[] = {
+static const GdbCmdParseEntry gdb_gen_query_set_common_table[] = {
     /* Order is important if has same prefix */
     {
         .handler = handle_query_qemu_sstepbits,
@@ -2342,7 +2342,7 @@ static GdbCmdParseEntry gdb_gen_query_set_common_table[] = {
     },
 };
 
-static GdbCmdParseEntry gdb_gen_query_table[] = {
+static const GdbCmdParseEntry gdb_gen_query_table[] = {
     {
         .handler = handle_query_curr_tid,
         .cmd = "C",
@@ -2420,7 +2420,7 @@ static GdbCmdParseEntry gdb_gen_query_table[] = {
 #endif
 };
 
-static GdbCmdParseEntry gdb_gen_set_table[] = {
+static const GdbCmdParseEntry gdb_gen_set_table[] = {
     /* Order is important if has same prefix */
     {
         .handler = handle_set_qemu_sstep,
-- 
2.26.3
