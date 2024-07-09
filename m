Received: by 2002:a05:7022:1005:b0:83:cb6b:1575 with SMTP id em5csp1559733dlb;
        Tue, 9 Jul 2024 08:27:15 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVhKp6fLKPIlAVlZB/jWUdhuHvibcKPijVJOUpk03tGodjS+z/9aGzkTbfbIfHWiXQdf5V4uBbhy0Tv5uSvs6fTXkGEvYtG
X-Google-Smtp-Source: AGHT+IFjHon0NhDL9K1UamHxEEh+n9LZEHrGtADSVlV8ZCQFUwUAZl9PLqzPDNzqTBwr7AXr6ZEk
X-Received: by 2002:a05:6102:2acf:b0:48f:e9f5:2e37 with SMTP id ada2fe7eead31-490332b056fmr1708265137.6.1720538835419;
        Tue, 09 Jul 2024 08:27:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1720538835; cv=none;
        d=google.com; s=arc-20160816;
        b=Kc88jTV7Mstpctk+K7wWe2LRQ7X649p29ngLNWwRkzPN28+Rj/GblodE8SIy8yz7Ih
         zv5EUsLo3O+J+w9cTgnZYovrw6IIG2EKc50mC3ZaMboN7/A2IFSgemqDAw02aKN19O0j
         fNreqVi3pZQ4n5etqHT4WUtES+ytT1hZZwdtPoG1zr1iHk/Y/NZHyYcU8lZaeT/fPj02
         Y7u0ZQoykGtHaLx7WM+qQMNnclpx/vS7xY+rgch/k/dJvTByArHWha8lKtszNxbg3qut
         7rgCd8dwXdTnAhBlk+dp0PPapmrsTko7Wd0Q3/HDZ+x9sQQFnZnZwcEzbk2yj8ktFhO2
         FHjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=RJVHkR25AopDRjvaFAHlUdf7mDVai3uQRUgz1HxXftQ=;
        fh=zTR2DIZxB+EjUIADI17pmMbbiq3j3O+7JcocDxdvvR4=;
        b=Z93tz54BhYWJUsWXC08uZAguPm5FtghC2rOADx1IanqQuAJFsZxEgjjbZAftM4KUIe
         gyIbm39E/gnW7GWoahSXK0yERxbeX325rKoYFN3Jyr5UulY0Zd+Kg7fjOwFQORHf4GIh
         VvjBqnpybK6UzWL5km73mnaDuFpEihy4ipDzYmybdnYEwwB9C7aBUakDExIunuedwVGK
         LDTDtH7hoeQavHa9ONpYg9xmeq+mZh9K49O+egDIuVx/ZWhXE+gCzcclrY7L+4dmZE+y
         v+12LBssPd6KP+W5G3pLSsXItMjt4+oKg8ZgetQpELZIAo/hG9ofdMXkCcvH2qzcv+fq
         d6aA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=gr49xS0I;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ada2fe7eead31-49031740de9si336296137.418.2024.07.09.08.27.15
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 09 Jul 2024 08:27:15 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=gr49xS0I;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1sRCjk-0003ll-O3; Tue, 09 Jul 2024 11:26:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1sRCjZ-0003eH-HR
 for qemu-devel@nongnu.org; Tue, 09 Jul 2024 11:26:25 -0400
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1sRCjW-0006DW-I6
 for qemu-devel@nongnu.org; Tue, 09 Jul 2024 11:26:25 -0400
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-426685732dcso16438035e9.1
 for <qemu-devel@nongnu.org>; Tue, 09 Jul 2024 08:26:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1720538780; x=1721143580; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=RJVHkR25AopDRjvaFAHlUdf7mDVai3uQRUgz1HxXftQ=;
 b=gr49xS0INqsXUOZsO2U+iBM3QZI8ngbkFFmN1CowDLIv4UXD2j5jvZ4okSLbaX0nM8
 UglTSTcGXGoOe65s/r9twpXEew9YKUB+MRDJceq/TfJSCxH4us0Bw9EnvtZQgZLx9w60
 rGLOjTN1ofxtcA7Yq3Tei/ar1895NLSyubmuC2ElnEc/f38bu1P3YfURcr99B/SE5knV
 ZqkA9nCRf32qQY5rLT4W0HR8slFZbimhINWbBiw3er9bBr7ofjwCXomDVOODBDjtNTcf
 PgHEja097UJLCNuM/ZRPkgvs4khQg/otTrMAAgaD1+jmo6Djkz3enUscxU1+fmviEE3s
 wqNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720538780; x=1721143580;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=RJVHkR25AopDRjvaFAHlUdf7mDVai3uQRUgz1HxXftQ=;
 b=Ocu0PuaMG1z+k+zoBpMaOr+dCmUeNSms9PT6PHJl8syFwo58ahpq3op9r1l4kQ+neT
 1HlEEPDTqGmm2uMfJKeTJThgwkFtAQhJdmsZUZWBpL3hKET4FVo7jrY7VpBO1EWm7L9T
 VcOsdNIWcHYDIx/jOlWaWUpHpBVvWo7KcmMVt9M1H09kXElMsVyXciKLfZjKplCoAZYG
 B2DRBfMQm7okGbqh1PDNCBAvq/y1wUWWPy4m0X362fHi5RCvYS24iQr30Q/4IOaAGm+A
 JS84BoeJXQdC4xdNCgCL14GaZiZmZ/hAIqrZihdBfW6LvNpiql+X1HF2BlWNjfsaHO/p
 PgnA==
X-Gm-Message-State: AOJu0YzpZtq04OQgXgiRDor4Ah9nb0dGJLV5cFvtDFuZvoEUBeRCXSS3
 BbDnzCvSZQmWu9HKEUKuzDjw6OEhVTEZrfiFct2b3uO/0qdmMIsQczLD8rNrTlYlCVySlH399Kq
 e
X-Received: by 2002:a5d:5f88:0:b0:367:402f:805b with SMTP id
 ffacd0b85a97d-367cea46b51mr2726113f8f.2.1720538780582; 
 Tue, 09 Jul 2024 08:26:20 -0700 (PDT)
Received: from m1x-phil.lan (vau06-h02-176-184-43-20.dsl.sta.abo.bbox.fr.
 [176.184.43.20]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-367cde846a3sm2870777f8f.30.2024.07.09.08.26.18
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 09 Jul 2024 08:26:20 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Andrew Jeffery <andrew@codeconstruct.com.au>, qemu-block@nongnu.org,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Bin Meng <bmeng.cn@gmail.com>, Joel Stanley <joel@jms.id.au>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Jamin Lin <jamin_lin@aspeedtech.com>,
 Steven Lee <steven_lee@aspeedtech.com>, Troy Lee <leetroy@gmail.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@redhat.com>
Subject: [PATCH v47 03/19] hw/sd/sdcard: Register unimplemented command
 handlers
Date: Tue,  9 Jul 2024 17:25:40 +0200
Message-ID: <20240709152556.52896-4-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240709152556.52896-1-philmd@linaro.org>
References: <20240709152556.52896-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: cQ6NyRvefq+p

Per the spec v4.3 these commands are mandatory,
but we don't implement them.

Reviewed-by: Cédric Le Goater <clg@redhat.com>
Tested-by: Cédric Le Goater <clg@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Message-Id: <20240628070216.92609-85-philmd@linaro.org>
---
 hw/sd/sd.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/hw/sd/sd.c b/hw/sd/sd.c
index eb50862adb..097c9cc61f 100644
--- a/hw/sd/sd.c
+++ b/hw/sd/sd.c
@@ -2390,24 +2390,33 @@ static const SDProto sd_proto_emmc = {
         [0]  = {0,  sd_bc,   "GO_IDLE_STATE", sd_cmd_GO_IDLE_STATE},
         [1]  = {0,  sd_bcr,  "SEND_OP_COND", sd_cmd_SEND_OP_COND},
         [2]  = {0,  sd_bcr,  "ALL_SEND_CID", sd_cmd_ALL_SEND_CID},
+        [4]  = {0,  sd_bc,   "SEND_DSR", sd_cmd_unimplemented},
         [7]  = {0,  sd_ac,   "(DE)SELECT_CARD", sd_cmd_DE_SELECT_CARD},
         [9]  = {0,  sd_ac,   "SEND_CSD", sd_cmd_SEND_CSD},
         [10] = {0,  sd_ac,   "SEND_CID", sd_cmd_SEND_CID},
+        [11] = {1,  sd_adtc, "READ_DAT_UNTIL_STOP", sd_cmd_unimplemented},
         [12] = {0,  sd_ac,   "STOP_TRANSMISSION", sd_cmd_STOP_TRANSMISSION},
         [13] = {0,  sd_ac,   "SEND_STATUS", sd_cmd_SEND_STATUS},
+        [14] = {0,  sd_adtc, "BUSTEST_R", sd_cmd_unimplemented},
         [15] = {0,  sd_ac,   "GO_INACTIVE_STATE", sd_cmd_GO_INACTIVE_STATE},
         [16] = {2,  sd_ac,   "SET_BLOCKLEN", sd_cmd_SET_BLOCKLEN},
         [17] = {2,  sd_adtc, "READ_SINGLE_BLOCK", sd_cmd_READ_SINGLE_BLOCK},
+        [19] = {0,  sd_adtc, "BUSTEST_W", sd_cmd_unimplemented},
+        [20] = {3,  sd_adtc, "WRITE_DAT_UNTIL_STOP", sd_cmd_unimplemented},
         [23] = {2,  sd_ac,   "SET_BLOCK_COUNT", sd_cmd_SET_BLOCK_COUNT},
         [24] = {4,  sd_adtc, "WRITE_SINGLE_BLOCK", sd_cmd_WRITE_SINGLE_BLOCK},
         [27] = {4,  sd_adtc, "PROGRAM_CSD", sd_cmd_PROGRAM_CSD},
         [28] = {6,  sd_ac,   "SET_WRITE_PROT", sd_cmd_SET_WRITE_PROT},
         [29] = {6,  sd_ac,   "CLR_WRITE_PROT", sd_cmd_CLR_WRITE_PROT},
         [30] = {6,  sd_adtc, "SEND_WRITE_PROT", sd_cmd_SEND_WRITE_PROT},
+        [31] = {6,  sd_adtc, "SEND_WRITE_PROT_TYPE", sd_cmd_unimplemented},
         [35] = {5,  sd_ac,   "ERASE_WR_BLK_START", sd_cmd_ERASE_WR_BLK_START},
         [36] = {5,  sd_ac,   "ERASE_WR_BLK_END", sd_cmd_ERASE_WR_BLK_END},
         [38] = {5,  sd_ac,   "ERASE", sd_cmd_ERASE},
+        [39] = {9,  sd_ac,   "FAST_IO", sd_cmd_unimplemented},
+        [40] = {9,  sd_bcr,  "GO_IRQ_STATE", sd_cmd_unimplemented},
         [42] = {7,  sd_adtc, "LOCK_UNLOCK", sd_cmd_LOCK_UNLOCK},
+        [49] = {0,  sd_adtc, "SET_TIME", sd_cmd_unimplemented},
         [55] = {8,  sd_ac,   "APP_CMD", sd_cmd_APP_CMD},
         [56] = {8,  sd_adtc, "GEN_CMD", sd_cmd_GEN_CMD},
     },
-- 
2.41.0

