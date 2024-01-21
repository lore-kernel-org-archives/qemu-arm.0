Received: by 2002:a17:906:2b99:b0:a2e:1324:ea5c with SMTP id m25csp2165141ejg;
        Sun, 21 Jan 2024 13:33:53 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHvM7w7+TZFKjUHgJTjY2kJfXyQBOgfMAef8yRzekOCRo5BOOTeAzaEjDZkwuESgOKlw6tW
X-Received: by 2002:a05:6214:d41:b0:686:174a:de12 with SMTP id 1-20020a0562140d4100b00686174ade12mr3396386qvr.0.1705872833376;
        Sun, 21 Jan 2024 13:33:53 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1705872833; cv=none;
        d=google.com; s=arc-20160816;
        b=vJM1Z2JSEEYlIzBZugbpYYaxzOOrCdh+G9AelrgEPY/sqqxCRS13xGIiK0QvZDbN5M
         lIIcIybClbrUMxARysNjTnpeLsEAzxsFfNghfiTFcwawjUI8XCNB2HdHIHhf97zj6WTx
         3FHgrf9zj/vSrpvKASEp8MeeJ1LsDK/o58DPO5aMUnxLhSKlgYneJ7Ijjq19a75VwbuX
         UghKhdJUAT7Fc1za6FFM5E7QmekXGjYEUhLTS4LD6fknLwxEvcr7sp5in8Jk9Yhc+d13
         mXW1KvxO8ybEZ+7qqa1Nf20CS73daDg9mqDvoWM4NGwu5+h4IgNPSQcKMS3hz9qnGT40
         UNNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=DclWoef/Xxy5MXxfzCbZwQWBvJ+vWC+KibsxSNkJcvs=;
        fh=FgCJm4MxJh559bXCb/+hyfhFYn4hS0Enm8//qMZ+kqQ=;
        b=LdljYDNDCifInSL4MB/gUZa1YPilAvT+tZ/1gNgBtjbzepFhAAZkQM1vCBzrhhu4Ro
         bJvuoWl9IYpdn8oTy7q2m5K6bCwU0wotD/MKHN+iY2ChwrK5bt8oE0IYlQq29v4f30Y9
         GTkvbaEU4BPqpUKJtTq7v0Fo8e9whHz+RGth4COtIeym6taqSddn34QB8n8vOIEAe1m7
         1muLIaimSzii7Stvray1atKQDdKX0Y8Xv4qm1+fp9zyXORMXSLgzfwnsDNCafh/bNpqD
         QFshgekXgAKYi3BAFlZSClOM9rwgVry1P+4GOe+Ev5N4VnlBulPOzYicN6+VuZ/QNkzv
         ysyg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=LGndrbPO;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a2-20020a0c8bc2000000b0067f827316e6si4361118qvc.83.2024.01.21.13.33.53
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 21 Jan 2024 13:33:53 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=LGndrbPO;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rRfRm-0005sm-AH; Sun, 21 Jan 2024 16:33:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <caseorum@gmail.com>)
 id 1rRfAM-0003nP-89; Sun, 21 Jan 2024 16:15:42 -0500
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <caseorum@gmail.com>)
 id 1rRfAK-0001lp-Jy; Sun, 21 Jan 2024 16:15:42 -0500
Received: by mail-ed1-x52f.google.com with SMTP id
 4fb4d7f45d1cf-55783b7b47aso2963152a12.0; 
 Sun, 21 Jan 2024 13:15:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1705871737; x=1706476537; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=DclWoef/Xxy5MXxfzCbZwQWBvJ+vWC+KibsxSNkJcvs=;
 b=LGndrbPOT0XUFHIMJExAbJ/c3yxtzrpU5Ft0aOjk5yHkbPIsETkW/Dg+V9VpRHUFPA
 zimduB0Z0P73D3MDsspFKgh8MiIbkgad6CvhPvu0xpgqLcdjRJjpN6jl0ohLynjLqAJK
 BkC1614xS1Xm3J6PufKbDwY6ORx7siTNd4eaAYLKlE8Q7fi5i3CshncUMAy+MQBYzrZi
 9ZYcF82lBQ11OQSjVhcNyotbTsbHohQSBLpOgZzC8YZVIscLj8iJXGh+ciD/5QJEEUGH
 3oiPZanuRM+08ObNBoQm+he6lfLpnJNOYqNN6qvqzdq2EvTZ9UoTL/aHwENJ2VXmerhz
 uoAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1705871737; x=1706476537;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=DclWoef/Xxy5MXxfzCbZwQWBvJ+vWC+KibsxSNkJcvs=;
 b=XBk54Gz/lZuo03cU6qEe0JdcAcDuuN5V7x/kz2camKfjagwLRnPfOBudaKQ0P092oD
 sGUcMxmiBS6MOfHN8R+M3SwBOKTUoo39fsFZQm6lSyHqomc0RlNJEKkkE+DLCQm1QE2B
 eiTwshbkPMKVjbyus66QM57oP+4/r7lB0ERjIGZn1KB7TK/jaFNvehh8Kth//slxPmbF
 TTcb4jSmtKc3cr1S+gkVsA4Cc4zoIJ/UU5kTwDX2CuyiRXGSMBiE7svdiX3th1xwLewZ
 WmFg2WJssBDzOZzvqVg+Mk/r1dsSPDpCDISBNwXXU1IagpplGMJIxWi6GA3E9J+d/q6C
 k04Q==
X-Gm-Message-State: AOJu0YzCf9HObjczb7gNTAlwEfLPD2hx4GDwJDVewKbfZHAN25d+o7gk
 gprDXJXisIwC92y+rLL0IbNeS2bvfa+71ZsPb85YIH/j+GXpNHb4l3W6hJNY
X-Received: by 2002:a17:907:3203:b0:a2c:96a1:ba05 with SMTP id
 xg3-20020a170907320300b00a2c96a1ba05mr2412806ejb.103.1705871737170; 
 Sun, 21 Jan 2024 13:15:37 -0800 (PST)
Received: from localhost.. ([77.22.20.148]) by smtp.gmail.com with ESMTPSA id
 tb21-20020a1709078b9500b00a2f24da8baasm4310351ejc.39.2024.01.21.13.15.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 21 Jan 2024 13:15:36 -0800 (PST)
From: Joseph Burt <caseorum@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-stable@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 qemu-arm@nongnu.org (open list:ARM TCG target)
Subject: [PATCH] tcg/arm: Fix SIGILL in tcg_out_qemu_st_direct
Date: Sun, 21 Jan 2024 21:14:39 +0000
Message-ID: <20240121211439.100829-1-caseorum@gmail.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52f;
 envelope-from=caseorum@gmail.com; helo=mail-ed1-x52f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Sun, 21 Jan 2024 16:33:41 -0500
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
X-TUID: 3Sws3vC7zZ+o

When tcg_out_qemu_st_{index,direct} were merged, the direct case for
MO_64 was omitted, causing qemu_st_i64 to be encoded as 0xffffffff due
to underflow when adding h.base and h.index.

Fixes: 1df6d611bdc2("tcg/arm: Introduce HostAddress")
Signed-off-by: Joseph Burt <caseorum@gmail.com>
---
 tcg/arm/tcg-target.c.inc | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/tcg/arm/tcg-target.c.inc b/tcg/arm/tcg-target.c.inc
index fc78566494..a9aa8aa91c 100644
--- a/tcg/arm/tcg-target.c.inc
+++ b/tcg/arm/tcg-target.c.inc
@@ -1662,6 +1662,9 @@ static void tcg_out_qemu_st_direct(TCGContext *s, MemOp opc, TCGReg datalo,
             } else {
                 tcg_out_strd_r(s, h.cond, datalo, h.base, h.index);
             }
+        } else if (h.index < 0) {
+            tcg_out_st32_12(s, h.cond, datalo, h.base, 0);
+            tcg_out_st32_12(s, h.cond, datahi, h.base, 4);
         } else if (h.index_scratch) {
             tcg_out_st32_rwb(s, h.cond, datalo, h.index, h.base);
             tcg_out_st32_12(s, h.cond, datahi, h.index, 4);
-- 
2.42.0

