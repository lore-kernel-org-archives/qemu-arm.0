Received: by 2002:a19:6b17:0:0:0:0:0 with SMTP id d23csp2560159lfa;
        Sat, 17 Oct 2020 11:11:09 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyQKcwbvPU5OP4qy1l3eaYWbCVkPFk9UgqoS/dSznm8yNBE1vVGU8VLN9VvPhBFuiUUqel8
X-Received: by 2002:ae9:ed17:: with SMTP id c23mr9183937qkg.182.1602958269524;
        Sat, 17 Oct 2020 11:11:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1602958269; cv=none;
        d=google.com; s=arc-20160816;
        b=wZmnCHWGMvrb/HvzBPdW8p/nKltStV5KANfLdt2kCnVDZxMo/1QAQHlYldkDgzmduP
         HAfS3CnZKFTSzAHn4tmZwwqFLvdyQiMjZKO/Xln/67I5wy4A6u6LvF8KGycvN7XKPg0N
         RLnyDAEbec0M9tKPCGxKN3p5M0VqeAcMDts2tNGEN44OGzZ9q4DTgqUPFEbZrCNfbJ/L
         fe17fXSrfDLHemZVq4IyD7KsaOTzxQSu/n9qp/vxcpYWW3lhK8TtaTXQCJyoBVaO2TRJ
         IBTHLp55e1wEz4A4+8cwYXa0f/Hs7YEMkYr/wY/AmKcNf8ZK8wVKbHvQQPTpqljiPU1M
         PMzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=fV1sc6OWYGYAEKTgUKDN1x3UErFGbkghLLV029wOF5g=;
        b=WEyXG8vKFFfdGZejtsF2o6Oz1uJrbrdu0y3VoUoLL9rQCncBWXdeu8kkCncCApcilt
         l759U2bnQ93iZbOUiFN9w6/gPzCuH0TNSqFv95PLcmo/zTs8q49MkMg7tlYEiePXhq5l
         1KArwlYtbhPiCYpLCO/YdYVx/QRy53Vcsy3kpvyKYvPRNDfLFT0lMqDdQ7bvzyN4dB1B
         g7QqB3PuboOU5bFGNTbptl4IRaAnT7r9SOPOL2zWCoqqKWUjLiM33oHXNjfyqV4oK/wb
         CsDBTgFjGdeOq6/ZW1eiQpHefntNx1z/bKvGdmWLIhIHUcslfaCSDjMgKkdmRjH6d9cH
         Dy+A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=YUFg92JV;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id k9si3577708qki.296.2020.10.17.11.11.09
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 17 Oct 2020 11:11:09 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=YUFg92JV;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Received: from localhost ([::1]:57912 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kTqfc-0002oC-VW
	for alex.bennee@linaro.org; Sat, 17 Oct 2020 14:11:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42704)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kTqcN-0000Kt-6W; Sat, 17 Oct 2020 14:07:47 -0400
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444]:35583)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kTqcL-00051l-La; Sat, 17 Oct 2020 14:07:46 -0400
Received: by mail-wr1-x444.google.com with SMTP id n15so7009419wrq.2;
 Sat, 17 Oct 2020 11:07:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=fV1sc6OWYGYAEKTgUKDN1x3UErFGbkghLLV029wOF5g=;
 b=YUFg92JVjU8rwd9lMc/qsrM++qm1N9XutE5OAb2vJg8hfMZhFmMKvAGXxIDB/o7FrV
 liqv7DUE2rrR4c9RUgglY6gPvc7w4QTTA7iwGgptg3RTorg07NYZEBxXjj8DZ0wRise8
 KHwQ+BBVpxLz4mQ8diPXSh9BXVpqIFXL+mLP3RDZ4fNuLVE9hbn+0JoHKWFz561Wv49c
 EgJWq1vL+J1JI/pDheP/kWf8zFgOEIJkiybomMth8TtaQ/Y95Qj1xiwIAAvjNF65YWo4
 Ryddfk00/A7Z8508c1tRO7kIym2KsDe9HtfwSvSwi1xMfu/FpodI1OqU0ScygUS+Kz4b
 7s0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=fV1sc6OWYGYAEKTgUKDN1x3UErFGbkghLLV029wOF5g=;
 b=fRdfIW3Lh49i+8DNgbreTH2VSdBv2Hr9zbsNeLvmW9YJGy333YoEyugW2weEMLTZg7
 VyZdCb285ePKkyCmQP7opFiqG+5Ve+QPEdfDTChXjxfw9UvlhBiH8pS/tdBzVcCow1Xg
 0Xieh0LdQAp2AAZSZ5kT9FsXjSJQTXkRbtfKAZjyvIjDfyEpfvL5fdFOq23ZlV3Te1d1
 K/L75aoqZf+TBgX84wNLvDIx2WZAtHTIdJDBjPpJE2DoCpgVZYTYXsbV/t9Fm7AE83yc
 /oftXdJyhEIDzFeNoZRfyTLEZJg2XaNbNQ1rwD9gohP1IxIcbg0zB0Fo9E4gYsyT1rhu
 0EBw==
X-Gm-Message-State: AOAM531Sv1l7GeoCnm3tF54VvJTfLBIJm5JfqBmMFFWgy1sMmYbhftmk
 sTp6DRqFFhC298dtv00pqN0FtS3E3sI=
X-Received: by 2002:adf:e6c4:: with SMTP id y4mr11531583wrm.423.1602958063882; 
 Sat, 17 Oct 2020 11:07:43 -0700 (PDT)
Received: from localhost.localdomain
 (117.red-83-52-172.dynamicip.rima-tde.net. [83.52.172.117])
 by smtp.gmail.com with ESMTPSA id 205sm8753097wme.38.2020.10.17.11.07.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 17 Oct 2020 11:07:43 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 2/2] hw/intc/bcm2836_control: Use IRQ definitions instead of
 magic numbers
Date: Sat, 17 Oct 2020 20:07:31 +0200
Message-Id: <20201017180731.1165871-3-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201017180731.1165871-1-f4bug@amsat.org>
References: <20201017180731.1165871-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::444;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x444.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 Luc Michel <luc@lmichel.fr>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Andrew Baumann <Andrew.Baumann@microsoft.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 0j9baHDIMRdJ

The IRQ values are defined few lines earlier, use them instead of
the magic numbers.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/intc/bcm2836_control.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/hw/intc/bcm2836_control.c b/hw/intc/bcm2836_control.c
index 53dba0080ca..2ead76ffdce 100644
--- a/hw/intc/bcm2836_control.c
+++ b/hw/intc/bcm2836_control.c
@@ -157,22 +157,22 @@ static void bcm2836_control_set_local_irq(void *opaque, int core, int local_irq,
 
 static void bcm2836_control_set_local_irq0(void *opaque, int core, int level)
 {
-    bcm2836_control_set_local_irq(opaque, core, 0, level);
+    bcm2836_control_set_local_irq(opaque, core, IRQ_CNTPSIRQ, level);
 }
 
 static void bcm2836_control_set_local_irq1(void *opaque, int core, int level)
 {
-    bcm2836_control_set_local_irq(opaque, core, 1, level);
+    bcm2836_control_set_local_irq(opaque, core, IRQ_CNTPNSIRQ, level);
 }
 
 static void bcm2836_control_set_local_irq2(void *opaque, int core, int level)
 {
-    bcm2836_control_set_local_irq(opaque, core, 2, level);
+    bcm2836_control_set_local_irq(opaque, core, IRQ_CNTHPIRQ, level);
 }
 
 static void bcm2836_control_set_local_irq3(void *opaque, int core, int level)
 {
-    bcm2836_control_set_local_irq(opaque, core, 3, level);
+    bcm2836_control_set_local_irq(opaque, core, IRQ_CNTVIRQ, level);
 }
 
 static void bcm2836_control_set_gpu_irq(void *opaque, int irq, int level)
-- 
2.26.2

