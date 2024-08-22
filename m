Received: by 2002:a17:505:917:b0:1be9:327d:8ee3 with SMTP id hq23csp702589njb;
        Thu, 22 Aug 2024 09:22:40 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWOVgsSIY7HRVLvjFU9woWyXWI7qYf5Iocu1fysdNdiisHs9hlhyFb2gnl6xqUvUYDEdG+eBZqoYacMMw==@linaro.org
X-Google-Smtp-Source: AGHT+IFxxB2uUf1P/+/78E87duJArzpFPOVxBPl9yTl71Sk8YyLQYZbr14eEFz3r0ksSdnpV1J0J
X-Received: by 2002:a05:6102:4650:b0:48f:b5c1:7269 with SMTP id ada2fe7eead31-498e204f75fmr2370401137.0.1724343760036;
        Thu, 22 Aug 2024 09:22:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1724343760; cv=none;
        d=google.com; s=arc-20160816;
        b=1JYKv/BGwX9DMINLoRf1hAItI+80WesV6CeykidC/rlkxkqZdHUpZjMU9a/N+ANsdx
         gbmlXViw/Koq5EXY2IIsrWFxCY+cBjXTR7yWqC98Vy6yWRFwTv9PQ+rGruqNbxP5tTIb
         vYdYPgmjlkE4Pq3atWm9+SmwwW8OLvZMB3kXm5L80eGyceYehBpSjD2eHLwKv2c1bpOP
         Su0GuM1v3jsR5YGuA5HJuRfqpoHsToe3VaXFwzXW36ao+9ZtOYanadpyRfm/DYEA2Qkg
         TfLKEV4K48+/SZuDzZy7ZYhm6N6D3y+1/qoCgnlCbV++Yl/aJnaArUbTX6yHuIGFCCr2
         sYWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=WaN7NC9uHrEwXd29tH1+I6/CGeGFysWI1W1y0Mcbdjo=;
        fh=eKvyMq82ozF2pexIVE339+mXcynob0ROL80gQzK9b2g=;
        b=e0YCQ7WVYN28rzxTZv0OnkGP/H4AEmptzi4WSHZGw/I2y6PDEW7Nmd72hVYyMGqt6j
         RB2iOI0unFTa/EzHAN+hjO6oMfNwh4/bcdgUSmRh3cwFbKoelog1/poR+BDDYPa4OIUj
         DOgSZWchdPs6wRP4EZfquPL5QC97F8pq1Y1NZbvpcJeCbvcTR2KmUFijilbFJufRhYdz
         8nvuszrPW7ZF7JH9KhTn6L3L1Nop0PO2HMRvGBlE6y0XfmlPWDwt46FgES+ZGbMgwEJt
         lNfXEfHDZf/eJezBPbcfGSi5tVpukHzaxpfgi7G7o37hz8pi5OZcbRffaiJO2aYthaoK
         IA5w==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="ycL3p/Cx";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ada2fe7eead31-498e496d4f0si426616137.801.2024.08.22.09.22.39
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 22 Aug 2024 09:22:40 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="ycL3p/Cx";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1shAZ9-0004wP-G8; Thu, 22 Aug 2024 12:21:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1shAZ5-0004tm-VZ
 for qemu-arm@nongnu.org; Thu, 22 Aug 2024 12:21:36 -0400
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1shAZ2-0007K4-5S
 for qemu-arm@nongnu.org; Thu, 22 Aug 2024 12:21:35 -0400
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-428e0d184b4so7210535e9.2
 for <qemu-arm@nongnu.org>; Thu, 22 Aug 2024 09:21:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1724343690; x=1724948490; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=WaN7NC9uHrEwXd29tH1+I6/CGeGFysWI1W1y0Mcbdjo=;
 b=ycL3p/CxwDjA9aCs4o2zK6NceNnnCy9CzXj5b2NG5XH0J+MAwa+WbGXseG6OIkHobU
 Xvtkc7vugvzTXfKUSZZ8rcSkE3E3BKYVwICNrrX57pxYwksF3PpTwLKmEPITvTnot6oR
 hIz0qVyXhYmC8k6OIwo1Ynn3LAkO7U+opNeGp6fUF8uWcvjIGOv7TooPzuAIszMPk4uX
 MMBbAnQzUcPFb1GqsqKaCujKMvgKuNlg2Myy1LaDyfROqZ4FmjEB6xAxsVpQRuVXH2rn
 nQkgJjxx4iDZleYOToRZpxTL4GABP3FWuj7egMSsxortyXe7InhG3pj0HrM3yJhsEXRR
 M2kQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724343690; x=1724948490;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=WaN7NC9uHrEwXd29tH1+I6/CGeGFysWI1W1y0Mcbdjo=;
 b=FB4L0RhgxDI2Zxw7S5QitlMNarihPL+/GwLmdqfdUpykkqX/C1dyCFg8m2VNyCbn85
 iefApDqQpdOZ3w9OAKQ0piFGHH9KwveTyogVHdldVzUVHLXkiPm40NAtobUlkg55z3CZ
 jDIpW295M5hOo9LOQaX9RC2tKNtF+kW1dfHaN0bOEFZOVvnfOxulddKO5o8CM8G4vIxq
 wcsYaWVf5SQSCj5nVE0KD0QI/L1J3ggrtVH7GnEhN8xAJf/C2yzdx8//LAchQLXXtapZ
 6HdQ7YyxR/OLi0aTbx+UXVIJ85l1pftOyK20qbiADyuRkfRyivRqh9gJXxq980DXP1Q5
 JWSA==
X-Gm-Message-State: AOJu0YyVJa9g64lnHqfoi3VED/D6iKsLLBvtyDXupX858dWjUiYYoPD8
 aYOhtF+Q+lfvFfHyLMU1gQsg9ZRAyTOLVcsjreGaMmEOpxTWQCk6pEwnQ8qJJWWGq2s/KdSNo/O
 X
X-Received: by 2002:a05:6000:1087:b0:368:5a8c:580b with SMTP id
 ffacd0b85a97d-37308c1809emr1629814f8f.19.1724343689838; 
 Thu, 22 Aug 2024 09:21:29 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-42ac5162347sm28928485e9.23.2024.08.22.09.21.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Aug 2024 09:21:29 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Alistair Francis <alistair@alistair23.me>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Francisco Iglesias <francisco.iglesias@amd.com>
Subject: [PATCH for-9.2 1/6] hw/misc/xlnx-versal-cfu: destroy fifo in finalize
Date: Thu, 22 Aug 2024 17:21:22 +0100
Message-Id: <20240822162127.705879-2-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240822162127.705879-1-peter.maydell@linaro.org>
References: <20240822162127.705879-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x335.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
X-TUID: fSXbgdXE9KEE

Since the TYPE_XNLX_VERSAL_CFU_FDRO device creates a FIFO in its
instance_init method, we must destroy the FIFO in instance_finalize
to avoid a memory leak for the QOM introspection
"instantiate-examine-finalize" cycle:

Direct leak of 8192 byte(s) in 1 object(s) allocated from:
    #0 0x55ec89eae7ee in malloc (/mnt/nvmedisk/linaro/qemu-from-laptop/qemu/build/asan/qemu-system-aarch64+0x294d7ee) (BuildId: 6d508874816cc47d17c8dd775e8f809ae520e8cb)
    #1 0x7f697018f738 in g_malloc debian/build/deb/../../../glib/gmem.c:128:13
    #2 0x55ec8d98d98d in fifo8_create util/fifo8.c:27:18
    #3 0x55ec8aa2a624 in fifo32_create /mnt/nvmedisk/linaro/qemu-from-laptop/qemu/include/qemu/fifo32.h:35:5
    #4 0x55ec8aa2a33c in cfu_fdro_init hw/misc/xlnx-versal-cfu.c:397:5
    #5 0x55ec8ce75da1 in object_init_with_type qom/object.c:420:9
    #6 0x55ec8ce5d07b in object_initialize_with_type qom/object.c:562:5
    #7 0x55ec8ce5e91d in object_new_with_type qom/object.c:782:5
    #8 0x55ec8ce5e9f1 in object_new qom/object.c:797:12
    #9 0x55ec8d65c81d in qmp_device_list_properties qom/qom-qmp-cmds.c:144:11

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/misc/xlnx-versal-cfu.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/hw/misc/xlnx-versal-cfu.c b/hw/misc/xlnx-versal-cfu.c
index 6bb82e51c15..2284b407eab 100644
--- a/hw/misc/xlnx-versal-cfu.c
+++ b/hw/misc/xlnx-versal-cfu.c
@@ -397,6 +397,13 @@ static void cfu_fdro_init(Object *obj)
     fifo32_create(&s->fdro_data, 8 * KiB / sizeof(uint32_t));
 }
 
+static void cfu_fdro_finalize(Object *obj)
+{
+    XlnxVersalCFUFDRO *s = XLNX_VERSAL_CFU_FDRO(obj);
+
+    fifo32_destroy(&s->fdro_data);
+}
+
 static void cfu_fdro_reset_enter(Object *obj, ResetType type)
 {
     XlnxVersalCFUFDRO *s = XLNX_VERSAL_CFU_FDRO(obj);
@@ -539,6 +546,7 @@ static const TypeInfo cfu_fdro_info = {
     .instance_size = sizeof(XlnxVersalCFUFDRO),
     .class_init    = cfu_fdro_class_init,
     .instance_init = cfu_fdro_init,
+    .instance_finalize = cfu_fdro_finalize,
     .interfaces = (InterfaceInfo[]) {
         { TYPE_XLNX_CFI_IF },
         { }
-- 
2.34.1

