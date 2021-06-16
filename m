Received: by 2002:a19:f807:0:0:0:0:0 with SMTP id a7csp734235lff;
        Wed, 16 Jun 2021 14:45:10 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyqFIgd+FkCUi8HECMArXf0DPyc90y5H3prrRyUwo/qneB6fjDFGa8vlcok1+FHb9nkaGAG
X-Received: by 2002:a1f:4a43:: with SMTP id x64mr1529768vka.1.1623879910078;
        Wed, 16 Jun 2021 14:45:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1623879910; cv=none;
        d=google.com; s=arc-20160816;
        b=Asn9+2ET61sZzSihFr8qg05/thxyMOz3dgLMh+1jMBup1hHqU95x679Yx3xZQ9w/ma
         tJ/caiNQXLTKeSbnI7ie4XKXV/UK0bdRrS0ZOEDebDk1tHg2GHmw+b5J5OFNn89pPEGV
         CcXMPJA9CqHNVTnw0C8iOAwUiMbNkAZFOCsC57RtI5sFpQbdprYEfIe12pHaYK2B0D+b
         mW4QOTzQvhoUfyVuUxYnlmenRDX3YZeYDjyqDNE9JEEW/QiLEltGHVErW7pq3Q/gkKC1
         G3Yx5JO04ZDB40H7gEjcdm70Pw4m2on4d8fBiu5iHoTJA+LQfEaaueOa0VYO1oAOMTpF
         LH6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=KW5lTjsputo7N25OpKrD+E7Eo0jAOCluFxXj3IjGob4=;
        b=XGazM8pS1BCC/U35JTNckIgDb5HDdr786esUUw72FPOZ8Uz/VlYg6s786PJScO9lh7
         v1MGPAsuc4mCtSoRsYX+pg0fTtcjBNllZG1t0pUB00hmK6xf7o8I9hY8xeGYGZ2x5dkg
         MZqHYofOykmUEX1IoxG3EItjmsSv48WxHe6eI85kGrGVZRtOvWTTcZjvF6RmFGrPRYhC
         kFE/xZHgxuOXgnnDfTs4EN0/EPN5cLf5P39vLoNrombzJ5DRzB6gfBJ6K6g05HVecL1k
         MeYYG2uJXjS+JDC1AowA6e818eVVI7eEIoKDeICrksbb6UQ3EtiwigK/DzIUwjQWpQgR
         leDw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=tMy4VHt4;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id q15si2540974uaj.102.2021.06.16.14.45.09
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 16 Jun 2021 14:45:10 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=tMy4VHt4;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Received: from localhost ([::1]:41776 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ltdLR-0003ns-75
	for alex.bennee@linaro.org; Wed, 16 Jun 2021 17:45:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48762)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1ltdJd-0000VX-2k; Wed, 16 Jun 2021 17:43:18 -0400
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435]:35597)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1ltdJb-0006F6-J9; Wed, 16 Jun 2021 17:43:16 -0400
Received: by mail-wr1-x435.google.com with SMTP id m18so4268417wrv.2;
 Wed, 16 Jun 2021 14:43:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=KW5lTjsputo7N25OpKrD+E7Eo0jAOCluFxXj3IjGob4=;
 b=tMy4VHt4cCksI+edMUqDzMEwYxEhb9sNwPo6gTSjNBcXCCFuAFHDTD8zWcxZ0ByPPS
 U4tyU6SnDoT8+reloz2RWfUF+HZWwy4cAQ3flszzzpoJMURWEj5xHRcck2e60wJckVF3
 OdHD4aUa3hDsGUwr9Y0CDJWte67UJUzKve2nqoHNKqxQj7pATwo1COD6hxuhXX6EUK6m
 R476B+f5fAcG76Ckie6Xde5bxk4DpNwnes0TppWsZ/2C2Db7gZ04kH+lkOkEKzt1/Mp+
 chgG/dbfl2RKnaJv5Yjafz7H5tUNZKISzCsWMy/98jkHNnSjhnjECeAoXyAhvIawP+5s
 iNvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=KW5lTjsputo7N25OpKrD+E7Eo0jAOCluFxXj3IjGob4=;
 b=X3SGqKoC4jukA6G+0DLM8nlMt25vSBnkYamNSDglN8TR0/c9QqdfZsY+B3ZJQjLo/o
 pcIMu/Bv+x3aH+tRHpo8EUDCsM2GiQaOWt0PRo+MJ7HEYKanlUxXw+hPQzB4d4f0yT3s
 vUA4XN73D6SmGExtwDlBIPexF90P+46WR+DRCZ1qqzrCJgsxYdW1E3sFQkuYGBmzSOQS
 Qv6rVGqQaaZBy2aahCge/RQ7mroH+ua92IoUfwlDHhUyuNo+FKXPB5vyDM3LRmuW3BEm
 PKi6J61DCPHfbhQsNTncTTPTDtAKX+PNPMYEaEpJ5uGa2Y1bystAJ0poUskw6YER5WAd
 05mQ==
X-Gm-Message-State: AOAM531dCZWFmmxvKUo4FZdMCC/PmYqVILAdOUHGvWxQ5ZBW7u2bWYHE
 McMkXr+kavWkt6do6gGOmSHsCNnqxnSpBw==
X-Received: by 2002:adf:deca:: with SMTP id i10mr1469987wrn.344.1623879793348; 
 Wed, 16 Jun 2021 14:43:13 -0700 (PDT)
Received: from x1w.. (93.red-83-35-24.dynamicip.rima-tde.net. [83.35.24.93])
 by smtp.gmail.com with ESMTPSA id l16sm6257864wmj.47.2021.06.16.14.43.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Jun 2021 14:43:12 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 03/15] hw/display/sm501: Simplify sm501_i2c_write() logic
Date: Wed, 16 Jun 2021 23:42:42 +0200
Message-Id: <20210616214254.2647796-4-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210616214254.2647796-1-f4bug@amsat.org>
References: <20210616214254.2647796-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x435.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Corey Minyard <cminyard@mvista.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 KONRAD Frederic <frederic.konrad@adacore.com>, qemu-arm@nongnu.org,
 qemu-ppc@nongnu.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 5Zh5Tv+0Fg+B

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Acked-by: Corey Minyard <cminyard@mvista.com>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/display/sm501.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/hw/display/sm501.c b/hw/display/sm501.c
index 8789722ef27..f276276f7f1 100644
--- a/hw/display/sm501.c
+++ b/hw/display/sm501.c
@@ -1036,8 +1036,9 @@ static void sm501_i2c_write(void *opaque, hwaddr addr, uint64_t value,
                 int res = i2c_start_transfer(s->i2c_bus,
                                              s->i2c_addr >> 1,
                                              s->i2c_addr & 1);
-                s->i2c_status |= (res ? SM501_I2C_STATUS_ERROR : 0);
-                if (!res) {
+                if (res) {
+                    s->i2c_status |= SM501_I2C_STATUS_ERROR;
+                } else {
                     int i;
                     for (i = 0; i <= s->i2c_byte_count; i++) {
                         res = i2c_send_recv(s->i2c_bus, &s->i2c_data[i],
-- 
2.31.1

