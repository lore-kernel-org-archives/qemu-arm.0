Received: by 2002:ac2:5937:0:0:0:0:0 with SMTP id v23csp1994251lfi;
        Thu, 2 Apr 2020 06:48:33 -0700 (PDT)
X-Google-Smtp-Source: APiQypIdM96QJtMgVRe0mrdk1yJ03A4CojulnqL3byFJZxPfAfr+0J4RId5/XuzrESloG+qpb1/P
X-Received: by 2002:a37:2e42:: with SMTP id u63mr3172743qkh.181.1585835313169;
        Thu, 02 Apr 2020 06:48:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1585835313; cv=none;
        d=google.com; s=arc-20160816;
        b=qa+VE2B544VDgEDsR+zsTRljaZ27N+oI8hhQJBszb8NxDbL4c/YRRgRM9a5+rzUa8E
         mHQpS54YCEefOsijIlG00wyoqsusCS2in3t07PgYQ4yu9QHk7KkolBv6r2Ew1kYZ9nbJ
         KdjrtZEfCSVLWov6qGDFo4dg5twhe/vqt4ofOkWyJ9jqoS+FR98sM3m8n3DE2hj4q4DW
         xj7g4MGmBZqxIZH/j+qvDSoWKDb4gnL8aFDd/LjA3rcDEH0qk4uXuP8nhH5kWuqoPS14
         7eujxsrvAE5OvsA0224qDLQQ9cowkAMuqxbnB+m+aP+VTcfUBQJ7dwN5INLn8QKira3s
         1MsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=+8YyPg1A/CL32UVNeLjMOcghy1faoRoeDPxjhkZR1lM=;
        b=VNEI49MiXfm6RI5k9kTiMFdlKZVO0aHIDCaANqeVWFOl+doViTjB5bUQrfTuHNjv8z
         efVAMQb6fCQj2sUeP+xWeiGhoO5MmxPXH9CjUMzu8nRV53XFzg24D1Gy/rU6YwT9KXTF
         P2Ppr+OR6FFAzjKKbFoXuDZ2lOULmHAAHaXDGvoV9wIaBA/YK08FLaunax5rhtTeJrzC
         kk+c29xQzpQ9nuhdm6JUrgliZXVcF26WMFEnYLMqnba49LQ3IfZQlRoADpKihjE5nETs
         1tSl7hrzlOyIu2FdJz6DbyE3dyuumZc+zRPVwP6LpblyeR3Qt0E7iLM2BZL2lNUq1RoI
         3PJg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=YpkEbU6m;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id b18si3561616qkc.346.2020.04.02.06.48.33
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 02 Apr 2020 06:48:33 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=YpkEbU6m;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:40286 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jK0Cu-0000IB-JB
	for alex.bennee@linaro.org; Thu, 02 Apr 2020 09:48:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50771)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <edgar.iglesias@gmail.com>) id 1jK0Am-0006Xm-TT
 for qemu-devel@nongnu.org; Thu, 02 Apr 2020 09:46:21 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <edgar.iglesias@gmail.com>) id 1jK0Am-00023C-1Q
 for qemu-devel@nongnu.org; Thu, 02 Apr 2020 09:46:20 -0400
Received: from mail-lj1-x243.google.com ([2a00:1450:4864:20::243]:35582)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <edgar.iglesias@gmail.com>)
 id 1jK0Al-00020w-Q7; Thu, 02 Apr 2020 09:46:19 -0400
Received: by mail-lj1-x243.google.com with SMTP id k21so3325356ljh.2;
 Thu, 02 Apr 2020 06:46:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=+8YyPg1A/CL32UVNeLjMOcghy1faoRoeDPxjhkZR1lM=;
 b=YpkEbU6mz/HHVLXjiZh/5b9VswChu+B4iNYIXIOaXzzB+LXAZBFeoVc2OaB9Bv3Dx8
 7RC8P0USB6f73+ZLWRQK3UQ2zypqXwbNMIovEhJFPMXCibepwPf+sM6PAodyUPgKwYVe
 AGEkUtrVKuKELHpOO9+GrU46HS0US1WeEidy7172nn0ZrR8kfuyFHr+6Ygyh3EFN96q2
 bNqVIUIZngZ0lyOE9Ev/1Z+AQE6Z8D62L+nLK224RXQBLUzclL35BKmUhb76uXE1yBjk
 z4YOCd9UWJ5h+nu1Leq4L2+i9uW/LsRFEC3ufEzixN4TIJIvgANpfCZqO2mh79frfydf
 dbDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=+8YyPg1A/CL32UVNeLjMOcghy1faoRoeDPxjhkZR1lM=;
 b=HSICFy3uW3gvEbWDp4w4pX2LpHlDEOfPB1KpujapJhAHb2lhzgOzwqluf2Rkp+eL8/
 xqG/iRoTJKP68CA0emx0ROlT3CaLj+CytIbA90/c34IWaYUNQztRENH88POcra/YsvvE
 FVcWvrWIA7tfq4xzVr0PnA726c/TTOVG6cACh3+6FKnjc2FHudX0repbLtU2rdeqh3rq
 RJkPQE3Z2vfwodM+xiEF3yQB9oQS3mHCS5AtdD7qq1f3Ri9Vlxds3vXVwwlFJWRWv4qD
 VTEAQGOuAEeBiztFyro7v63/pFrY/0t1XQ62TF9s4mYD61407j1i429Z+RhekDAebVej
 8zJw==
X-Gm-Message-State: AGi0PuZ05C1tHCLJUE9ixbKlAqW25MhDS5YRwUdFUpAaZWP0W18l1PMs
 3LkCNzOMQbgjLc9hizAmX0E9AmjI2pMtVg==
X-Received: by 2002:a2e:4942:: with SMTP id b2mr2145000ljd.135.1585835177363; 
 Thu, 02 Apr 2020 06:46:17 -0700 (PDT)
Received: from localhost (81-231-232-130-no39.tbcn.telia.com. [81.231.232.130])
 by smtp.gmail.com with ESMTPSA id t13sm3846647lfc.68.2020.04.02.06.46.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Apr 2020 06:46:16 -0700 (PDT)
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v1 4/5] dma/xlnx-zdma: Advance the descriptor address when
 stopping
Date: Thu,  2 Apr 2020 15:47:20 +0200
Message-Id: <20200402134721.27863-5-edgar.iglesias@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200402134721.27863-1-edgar.iglesias@gmail.com>
References: <20200402134721.27863-1-edgar.iglesias@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::243
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
Cc: figlesia@xilinx.com, peter.maydell@linaro.org, sstabellini@kernel.org,
 edgar.iglesias@xilinx.com, sai.pavan.boddu@xilinx.com,
 frasse.iglesias@gmail.com, alistair@alistair23.me,
 richard.henderson@linaro.org, frederic.konrad@adacore.com, qemu-arm@nongnu.org,
 philmd@redhat.com, luc.michel@greensocs.com
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: p2hchNPoywSu

From: "Edgar E. Iglesias" <edgar.iglesias@xilinx.com>

Advance the descriptor address when stopping the channel.

Signed-off-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>
---
 hw/dma/xlnx-zdma.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/hw/dma/xlnx-zdma.c b/hw/dma/xlnx-zdma.c
index dd893bc420..e856d233f2 100644
--- a/hw/dma/xlnx-zdma.c
+++ b/hw/dma/xlnx-zdma.c
@@ -514,7 +514,6 @@ static void zdma_process_descr(XlnxZDMA *s)
     if (ptype == PT_REG || src_cmd == CMD_STOP) {
         ARRAY_FIELD_DP32(s->regs, ZDMA_CH_CTRL2, EN, 0);
         zdma_set_state(s, DISABLED);
-        return;
     }
 
     if (src_cmd == CMD_HALT) {
-- 
2.20.1

