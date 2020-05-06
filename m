Received: by 2002:a19:ee01:0:0:0:0:0 with SMTP id g1csp785692lfb;
        Wed, 6 May 2020 01:25:43 -0700 (PDT)
X-Google-Smtp-Source: APiQypJa2PqvBkBLOhPT/boBvggeAV33xiGb7o1scdtPkRt2c+ZY/nqvUf+sh/y6g/Jtg0gq0Rjq
X-Received: by 2002:a37:a50d:: with SMTP id o13mr7460966qke.121.1588753543787;
        Wed, 06 May 2020 01:25:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1588753543; cv=none;
        d=google.com; s=arc-20160816;
        b=GgxHxgUzXfWUDP3mcIoOZAoFViDOUdJZdilzHZ1L9gjsSf9INg3EEVnLpvoTshHL84
         jTodGR7m1gSBq6I7rQ22onP71Ycfbw8vBcTLbe6MfRjdDOzin+2VL17H5DJ4puVO2qMl
         q1N+eOXG+TWgGCZbiY3zj3n+pzl1k1OUrS7XjF+WbceXkIpuTaFt7XgYwYZURmcPcH7Y
         NVmLObRy0PPHxrWnoJhRkE4uHMSJ1p0O0/4JjetFmT8NPyvnuN4r/5GEFyScNPpunNqk
         p9en3s/Uuf5kHONCri/E27wcKANcOXVasWqOwKUt+7yfuTnIvHD9K41FmMORWG80UQQ8
         Oi9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=lMH/u7Oj5tLeyniMPvnIISL2brcdK2XDklGgIHlpRtY=;
        b=GTy4gmLzzpcn2Cq7u+VB8bIM+TGpwdoZn+f7npIoFY0VQ+wB+dFr2PtoKt4EsjSmWi
         1YwAWop7r9X/U5B5NujbehkLVd6D21XbORsNlKPfQg/WYp6PBNLVHPM70sCmBv7A4hM+
         0c/a5xlJnZLYfRjI0mK/ArwVj3kC/sPhm9AfCF4THhR4XDeU3Deb9Idteuw0e2LQBANT
         GHQNYnlrC7NvYPMpVEVGR5t15Lu4bVqzLaUt2K7LpYRLE5Iw1Wz2sNMPvI8KtWxCLlQf
         uG0QTAFn/CHkBwwSKhUZjxiOn+rVx0i5pZXoahleRorE2kz9mYWwBc9DYTuSjQ3zVnXR
         Ugxw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=K6Ulz+Bh;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:470:142::17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:470:142::17])
        by mx.google.com with ESMTPS id l7si520232qtd.230.2020.05.06.01.25.43
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 06 May 2020 01:25:43 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:470:142::17 as permitted sender) client-ip=2001:470:142::17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=K6Ulz+Bh;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:470:142::17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:42872 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jWFN9-0005I2-36
	for alex.bennee@linaro.org; Wed, 06 May 2020 04:25:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38208)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <edgar.iglesias@gmail.com>)
 id 1jWFMn-0004eb-CD; Wed, 06 May 2020 04:25:21 -0400
Received: from mail-lj1-x243.google.com ([2a00:1450:4864:20::243]:34777)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <edgar.iglesias@gmail.com>)
 id 1jWFMm-0006v9-DB; Wed, 06 May 2020 04:25:21 -0400
Received: by mail-lj1-x243.google.com with SMTP id f11so1422056ljp.1;
 Wed, 06 May 2020 01:25:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=lMH/u7Oj5tLeyniMPvnIISL2brcdK2XDklGgIHlpRtY=;
 b=K6Ulz+Bh5OQhZUSM8TQ/4hS5Y5fLyGEvm0M8Ylow6zAdh++d0dE+5iU9J/S4mzZ0tC
 rUTZXe3vpTdl/RmL6Jtq6WNBMPPo0HDXnleQTwQgoYyNO/r+YT9woxub+Gr8QwikGBkX
 BQIT7zN4FShvb6sgbFDngubtGtDTVy4yNfSaIAYiZ+V+zgMckj4Umrn9fDFTlMW+q2iJ
 q8SgQ+oG8vqbXTqlFBrNNeLUBW9+ZJ4pp+VoOcSZF4vccOohY7C03Fg7nz8ESr65Id/Z
 5dnViZjQzh1i1yott90vuUx7FL+PRdgrqO2XtIQ/9o2r5k3zqqWm11whrBWQDzxzmREg
 qFBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=lMH/u7Oj5tLeyniMPvnIISL2brcdK2XDklGgIHlpRtY=;
 b=ggICDpvhbS/TTnDIQ2Xxtulh6aHrf9WDx0x4WSEIuDye1HzvsdEwGhmLXpkLri1Nd4
 lsQ1oBWb6kkCFD8rt2Q6Uej29opRuXKBdwZNRWpEU0Is7/Ka7c8/Gki+wOvMTx+3XMzy
 n7BDBmhXTVm/N8cusH4RVVfGu5taKYSyKogjzMPrRxzs1u/M6V2uHRbbEkZINsenknoW
 hMOk+Ba/gGEJ3LhK3itLIYFFbqUw7P+1cOWC0NWo4QdZRRrHB2rX6uPeW2x/wI5FCQkB
 fYXse6qap8LtJcvF6GyHafzktJdKw5Ps3vyt29RJ1eJqhStzSdKk8sQtFP+BTmXqj8UK
 KFQA==
X-Gm-Message-State: AGi0PuaZ2rPFkm5IoM/oy+kAeBuQ/LxnD4Ui8dkimrJ/K/CpwFqem5Tz
 N5ZUmtQFVe/B+rXMpPmMzomB087MP84=
X-Received: by 2002:a2e:3a0a:: with SMTP id h10mr3950339lja.54.1588753517711; 
 Wed, 06 May 2020 01:25:17 -0700 (PDT)
Received: from gmail.com (81-231-232-130-no39.tbcn.telia.com. [81.231.232.130])
 by smtp.gmail.com with ESMTPSA id o6sm798746lja.70.2020.05.06.01.25.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 May 2020 01:25:17 -0700 (PDT)
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 2/9] hw/net/xilinx_axienet: Cleanup stream->push assignment
Date: Wed,  6 May 2020 10:25:06 +0200
Message-Id: <20200506082513.18751-3-edgar.iglesias@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200506082513.18751-1-edgar.iglesias@gmail.com>
References: <20200506082513.18751-1-edgar.iglesias@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::243;
 envelope-from=edgar.iglesias@gmail.com; helo=mail-lj1-x243.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: 13
X-Spam_score: 1.3
X-Spam_bar: +
X-Spam_report: (1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 FSL_HELO_FAKE=3.399, RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Cc: damien.hedde@greensocs.com, peter.maydell@linaro.org,
 sstabellini@kernel.org, edgar.iglesias@xilinx.com, sai.pavan.boddu@xilinx.com,
 frasse.iglesias@gmail.com, jasowang@redhat.com, alistair@alistair23.me,
 frederic.konrad@adacore.com, qemu-arm@nongnu.org, philmd@redhat.com,
 luc.michel@greensocs.com, figlesia@xilinx.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: VCOtEaekhTNT

From: "Edgar E. Iglesias" <edgar.iglesias@xilinx.com>

Split the shared stream_class_init function to assign
stream->push with better type-safety.

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Francisco Iglesias <frasse.iglesias@gmail.com>
Signed-off-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>
---
 hw/net/xilinx_axienet.c | 18 ++++++++++++------
 1 file changed, 12 insertions(+), 6 deletions(-)

diff --git a/hw/net/xilinx_axienet.c b/hw/net/xilinx_axienet.c
index 0f97510d8a..84073753d7 100644
--- a/hw/net/xilinx_axienet.c
+++ b/hw/net/xilinx_axienet.c
@@ -1029,11 +1029,19 @@ static void xilinx_enet_class_init(ObjectClass *klass, void *data)
     dc->reset = xilinx_axienet_reset;
 }
 
-static void xilinx_enet_stream_class_init(ObjectClass *klass, void *data)
+static void xilinx_enet_control_stream_class_init(ObjectClass *klass,
+                                                  void *data)
 {
     StreamSlaveClass *ssc = STREAM_SLAVE_CLASS(klass);
 
-    ssc->push = data;
+    ssc->push = xilinx_axienet_control_stream_push;
+}
+
+static void xilinx_enet_data_stream_class_init(ObjectClass *klass, void *data)
+{
+    StreamSlaveClass *ssc = STREAM_SLAVE_CLASS(klass);
+
+    ssc->push = xilinx_axienet_data_stream_push;
 }
 
 static const TypeInfo xilinx_enet_info = {
@@ -1048,8 +1056,7 @@ static const TypeInfo xilinx_enet_data_stream_info = {
     .name          = TYPE_XILINX_AXI_ENET_DATA_STREAM,
     .parent        = TYPE_OBJECT,
     .instance_size = sizeof(struct XilinxAXIEnetStreamSlave),
-    .class_init    = xilinx_enet_stream_class_init,
-    .class_data    = xilinx_axienet_data_stream_push,
+    .class_init    = xilinx_enet_data_stream_class_init,
     .interfaces = (InterfaceInfo[]) {
             { TYPE_STREAM_SLAVE },
             { }
@@ -1060,8 +1067,7 @@ static const TypeInfo xilinx_enet_control_stream_info = {
     .name          = TYPE_XILINX_AXI_ENET_CONTROL_STREAM,
     .parent        = TYPE_OBJECT,
     .instance_size = sizeof(struct XilinxAXIEnetStreamSlave),
-    .class_init    = xilinx_enet_stream_class_init,
-    .class_data    = xilinx_axienet_control_stream_push,
+    .class_init    = xilinx_enet_control_stream_class_init,
     .interfaces = (InterfaceInfo[]) {
             { TYPE_STREAM_SLAVE },
             { }
-- 
2.20.1

