Received: by 2002:a19:690d:0:0:0:0:0 with SMTP id e13csp9104087lfc;
        Fri, 19 Feb 2021 07:21:12 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzwwhoCPS1rj548sX5SrmT6W5hJi0UbmTN96EyDh6xOmCSYxtAzHV5Ieph2WRu7bkjSY0i2
X-Received: by 2002:a25:778d:: with SMTP id s135mr13398991ybc.126.1613748072483;
        Fri, 19 Feb 2021 07:21:12 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1613748072; cv=none;
        d=google.com; s=arc-20160816;
        b=IF77ApauVcbuQbuWsvn4PVdAwf2P+FBgB47cktc5OwKzLZWOBDOirp2G4IE44xx+fB
         /m5aL/8JAo7av7965eI6di3HBjd5ZuCp61VuUkV8bjqcb35TD6hahoo2Sh4IlJ+AhERu
         yYpNxXLMnxaCbDvtkS5V3ByUyWWQO8gPC1xjBkBzD3V0fi1wuEJf5wIk8Jnv06ksTGJW
         IRHdjuthJiKFmXHO63IRyLfom0xYh7CwKlaIU0IU327WMjRa9gGxMiTYMDkJ5BO923Z2
         e1FyIzRH3QsqGg+hD1COgcMON+KyiOJz464QkvUJtIQCcHgbg5aBFB1S6wHhz/ovDzeg
         7sQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=6R2H7Db1FqG+TCsnIWopGNIyqmv4t5RlxdvA/d2HL4A=;
        b=qKAIg/zolspRittA68m7qQbN1unvZBSbEfvEqLF1O0q1un/xjnEG0p5QOW/ytscTcE
         Kw+l3p+bPOT8jjPJBFtWsYZ1uUi/mT2F6IzsdYqce0E6Glk5JiVe+v77icTGugD26TfW
         N21gskdlaWvOutPyy92Z3KscQa3di5XZxyfBPuwT2DLAxEN6RocetgndYkH6RnFePE4W
         xio43JYXgMNqIGzI35r1IR0+4AvcGXkhwk7mJzL+du8eS5Tk/y27dQuWmsWrS1tFHHhm
         Y/crZ7bbD91348r6d2bp/eZ8WqMv0efD7RQAeXruNdPbSFBESgrkxLuLwB8P9hdEm0FV
         HKNA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=nTqc9Afg;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id n22si9436060ybg.348.2021.02.19.07.21.12
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 19 Feb 2021 07:21:12 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=nTqc9Afg;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:48940 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lD7ah-00060g-Ql
	for alex.bennee@linaro.org; Fri, 19 Feb 2021 10:21:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34310)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lD73s-0002mF-TO
 for qemu-arm@nongnu.org; Fri, 19 Feb 2021 09:47:16 -0500
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436]:45679)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lD73R-0003ei-1P
 for qemu-arm@nongnu.org; Fri, 19 Feb 2021 09:47:16 -0500
Received: by mail-wr1-x436.google.com with SMTP id f7so7727486wrt.12
 for <qemu-arm@nongnu.org>; Fri, 19 Feb 2021 06:46:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=6R2H7Db1FqG+TCsnIWopGNIyqmv4t5RlxdvA/d2HL4A=;
 b=nTqc9AfgNxxUsn9fG5s84VIFprLWXCgd7o8kxyNuo+ptpRLrwHJLo5OaLBBB1PUBde
 l/94HMAeMzm//VJsiPR00g5S4vBk6sw9Yjmz1x6el7oqtlNpA/otZDNm49BcDx4DnQZo
 CTmbWFOBddFOb0tQpXhBGhXOe0ZrcSCQ7jDRUaQQpENuYxpDzeFZ9RJyO+DfmztpoJ0x
 cTrW0sBifEW2wSUaDt3xwyPRAPs/qIj+5sHmaTFa2lQT+4vqppwEFc8PgSdqPJWZudcg
 ALsJpEUsSLBH9AbM2OSvz7GJsRM91M6ZoG0SiLXy75Zd9bK1LeevqURusthd2WEZtrFA
 bs1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=6R2H7Db1FqG+TCsnIWopGNIyqmv4t5RlxdvA/d2HL4A=;
 b=iKupWdhhbb1i4IOXVGrnX3SW2qlR4Et3PCD1D3iPMJQO+ltxhunsBv5heCNunqmwZj
 tHZjVMlOzgE04TjVISbP5J0ighFm2cxM0DX/Bho9YAzzg6CTRjVe5pg2N0vmfU+le6mu
 fmMiSNSvwOvg4bCYdmWSQ0LJSowZZNfzn/dtDf+/Hgik4d6MfVatQoCmWM/TZWOcFLxX
 lshXC66iGfm96HTkK2KKmiz5elMLzBowJB0Beb0HhVsLi1D7SpTbq1Sm3D5V5Dy11JmC
 Htv17dPVFxDbP/yBKriI588pZCt28dN9Z9d7+c12Ty6M9iIktPj8bQzn3UsfOokSfe/g
 qQ4Q==
X-Gm-Message-State: AOAM5306KNodbfgVIEcEWHs8dfrPyuNSSMZqqmGryFI4rSvN+++neQh7
 DbwVDqsrvg5PSb/puz4Cxwu5kMBBCdnIZA==
X-Received: by 2002:adf:82b3:: with SMTP id 48mr9255686wrc.22.1613746007635;
 Fri, 19 Feb 2021 06:46:47 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id q18sm2263628wrw.91.2021.02.19.06.46.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Feb 2021 06:46:47 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 37/44] hw/misc/mps2-fpgaio: Fold counters subsection into main
 vmstate
Date: Fri, 19 Feb 2021 14:46:10 +0000
Message-Id: <20210219144617.4782-38-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210219144617.4782-1-peter.maydell@linaro.org>
References: <20210219144617.4782-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x436.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
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
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ILl6t1/1YtZ0

We've already broken migration compatibility for all the MPS
boards, so we might as well take advantage of this to simplify
the vmstate for the FPGAIO device by folding the counters
subsection into the main vmstate description.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/misc/mps2-fpgaio.c | 30 +++++-------------------------
 1 file changed, 5 insertions(+), 25 deletions(-)

diff --git a/hw/misc/mps2-fpgaio.c b/hw/misc/mps2-fpgaio.c
index 76308543fcb..e3fabd58b7b 100644
--- a/hw/misc/mps2-fpgaio.c
+++ b/hw/misc/mps2-fpgaio.c
@@ -285,41 +285,21 @@ static void mps2_fpgaio_realize(DeviceState *dev, Error **errp)
     }
 }
 
-static bool mps2_fpgaio_counters_needed(void *opaque)
-{
-    /* Currently vmstate.c insists all subsections have a 'needed' function */
-    return true;
-}
-
-static const VMStateDescription mps2_fpgaio_counters_vmstate = {
-    .name = "mps2-fpgaio/counters",
+static const VMStateDescription mps2_fpgaio_vmstate = {
+    .name = "mps2-fpgaio",
     .version_id = 2,
     .minimum_version_id = 2,
-    .needed = mps2_fpgaio_counters_needed,
     .fields = (VMStateField[]) {
+        VMSTATE_UINT32(led0, MPS2FPGAIO),
+        VMSTATE_UINT32(prescale, MPS2FPGAIO),
+        VMSTATE_UINT32(misc, MPS2FPGAIO),
         VMSTATE_INT64(clk1hz_tick_offset, MPS2FPGAIO),
         VMSTATE_INT64(clk100hz_tick_offset, MPS2FPGAIO),
         VMSTATE_UINT32(counter, MPS2FPGAIO),
         VMSTATE_UINT32(pscntr, MPS2FPGAIO),
         VMSTATE_INT64(pscntr_sync_ticks, MPS2FPGAIO),
         VMSTATE_END_OF_LIST()
-    }
-};
-
-static const VMStateDescription mps2_fpgaio_vmstate = {
-    .name = "mps2-fpgaio",
-    .version_id = 1,
-    .minimum_version_id = 1,
-    .fields = (VMStateField[]) {
-        VMSTATE_UINT32(led0, MPS2FPGAIO),
-        VMSTATE_UINT32(prescale, MPS2FPGAIO),
-        VMSTATE_UINT32(misc, MPS2FPGAIO),
-        VMSTATE_END_OF_LIST()
     },
-    .subsections = (const VMStateDescription*[]) {
-        &mps2_fpgaio_counters_vmstate,
-        NULL
-    }
 };
 
 static Property mps2_fpgaio_properties[] = {
-- 
2.20.1

