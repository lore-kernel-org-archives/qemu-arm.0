Received: by 2002:a19:ee01:0:0:0:0:0 with SMTP id g1csp786565lfb;
        Wed, 6 May 2020 01:27:17 -0700 (PDT)
X-Google-Smtp-Source: APiQypJfvngXznJKWI/SurEJd4ajPmla85zrGfOHPxBcrGkjUW3Ui64rdvCb84QrMbDZDrL7cc70
X-Received: by 2002:ac8:71d8:: with SMTP id i24mr6890159qtp.223.1588753637305;
        Wed, 06 May 2020 01:27:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1588753637; cv=none;
        d=google.com; s=arc-20160816;
        b=N/JbMBgw316dD6UhJSjtOuIAXq6RsNJw5HXXJecu+9SWE5kYT5G63rqvW5AqIY0Tm3
         C3Y8VkZLbcbfSu2ierOxWT3NR7tuXq+jR4Gp8m6ZlBKRJc2HCdjE4E7AZ+vIL6tvChJr
         4+a/pKhxJfCirJmt/lMBWoKC3K3qcEolW2FDWPNMO0oJlZx6dtlagiL32RHVLHBTvUYY
         MGgqhpx816QJbJw/1TVKMw+ClUyHd762Hx/7p/miQyT99Sn71IWRMAfWZ4rikDwgpgu+
         k2CYD1iAQ8mM3T/E34kAKYWAx/hY92rSWawOylAAzV3fAa5KLybOUfmKhXLtFr5I4G2I
         85Qg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=NaSEyUeZ9S0dTahKUfWHsZLASINecx9/Ty+xCY+lnUM=;
        b=ue9QM89xp2AOwNGqPlEoAmRxnav0VRBqv5uFhPGG8m5MS+sb6N/93zRFJlSYTjNzu1
         ie3nHDaolEqoV0Uf4XPw6/OUfk65xbKlIOv8lZUooWqNMThloYoPpg0K/SKuDcNS3Q50
         Eu0Kl2j+Gz5exwISQG6W9cFB6rS/qFfRLFLrtcR48zWDzeRMmye4Zfe8clYimB5C1iay
         BNwiRQi1l9jQm65vROUTzanRDYb7HB3dCWfC6EDd0SJ+IU1917MGjz+U/MtTWlz1ViiI
         u9xYJPCJFbAK1VwGpbtCao0hvfD2Bl/LVa4axZh+ZV83YhJZYaByP/xg+dt56Bhqw74C
         +VHA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=jlpJrtf1;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:470:142::17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:470:142::17])
        by mx.google.com with ESMTPS id 92si107593qtf.147.2020.05.06.01.27.17
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 06 May 2020 01:27:17 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:470:142::17 as permitted sender) client-ip=2001:470:142::17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=jlpJrtf1;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:470:142::17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:48138 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jWFOe-0007Od-NL
	for alex.bennee@linaro.org; Wed, 06 May 2020 04:27:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38248)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <edgar.iglesias@gmail.com>)
 id 1jWFMu-00051Q-Ul; Wed, 06 May 2020 04:25:28 -0400
Received: from mail-lf1-x141.google.com ([2a00:1450:4864:20::141]:38442)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <edgar.iglesias@gmail.com>)
 id 1jWFMu-00073Z-42; Wed, 06 May 2020 04:25:28 -0400
Received: by mail-lf1-x141.google.com with SMTP id b26so590738lfa.5;
 Wed, 06 May 2020 01:25:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=NaSEyUeZ9S0dTahKUfWHsZLASINecx9/Ty+xCY+lnUM=;
 b=jlpJrtf1UygfuR3unn7/nIQAbh6KbBdWELtRxn1KR49MTDuEni7FYFCvnkGZ89Gwfx
 j87SsFkCGJAL+T00jPThFEiYtMklBS6hE0VoXQHpHb4pKnLQsMclaDiPFDAY4j6ztL20
 Z1G/zzw6ZDQJFQyPB7WVKJqVS4UABXFLy2uqGfJzkGHjJxnJhnKxuZXuc1qxycpzPbJX
 7sEFMmEEy/xkOJNzRvGa9kvi/Ti+p/Hj5SxJz9Pm55VGW8XSeRjrNvLsUNv+r7BNjiU1
 Gumg3bzSMsp0sKqB9QdTmgGjwrY3DR+a2n5HrXRhuJwqPT5/6JHc3my/jbHTyr6kOWM8
 OhQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=NaSEyUeZ9S0dTahKUfWHsZLASINecx9/Ty+xCY+lnUM=;
 b=icicGE+9O7VAtr10NMVMYWtVO2X0ZpllOBoHUTaOq+IhbKB4auRt+q1wGnyNfAbxvs
 dcU1Bc1DYs9771RdMgz54OtfNKW1qPC5XQcx6FsEOnKasr08kI7He8Z5iH0h0qrjVq9d
 ZdUadZG0jqFUy8FKRLAj4y49XB4EeVyV+A9La3JYlKx4mmCFhsPHVWT9uuop7wkvBEer
 c/pKjfYDZwE9muKp30KPGHA4Vi1p8hdQLndPvfxT2W22LB/JTOMUtcWMxcZR31bbMhgn
 eyIeLKAcG5SF7zCh7WOvKDbwhPRht1GCXHBQMwYT9sMI2DxvzpHFbu5t6ieuv+C4IgO+
 9Jjg==
X-Gm-Message-State: AGi0PuaNlPJLYqIWpSIKvHfbbmVIMc93Z0msAW/x+aOqemVVjohiBUP6
 XBnBvM7CKtlRXR5vyopipS9lp2p3B1U=
X-Received: by 2002:ac2:5091:: with SMTP id f17mr4468696lfm.166.1588753525933; 
 Wed, 06 May 2020 01:25:25 -0700 (PDT)
Received: from gmail.com (81-231-232-130-no39.tbcn.telia.com. [81.231.232.130])
 by smtp.gmail.com with ESMTPSA id a13sm808910ljm.25.2020.05.06.01.25.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 May 2020 01:25:25 -0700 (PDT)
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 8/9] hw/dma/xilinx_axidma: s2mm: Support stream fragments
Date: Wed,  6 May 2020 10:25:12 +0200
Message-Id: <20200506082513.18751-9-edgar.iglesias@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200506082513.18751-1-edgar.iglesias@gmail.com>
References: <20200506082513.18751-1-edgar.iglesias@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::141;
 envelope-from=edgar.iglesias@gmail.com; helo=mail-lf1-x141.google.com
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
Cc: damien.hedde@greensocs.com, peter.maydell@linaro.org,
 sstabellini@kernel.org, edgar.iglesias@xilinx.com, sai.pavan.boddu@xilinx.com,
 frasse.iglesias@gmail.com, jasowang@redhat.com, alistair@alistair23.me,
 frederic.konrad@adacore.com, qemu-arm@nongnu.org, philmd@redhat.com,
 luc.michel@greensocs.com, figlesia@xilinx.com
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: SRO73BDuQgr/

From: "Edgar E. Iglesias" <edgar.iglesias@xilinx.com>

Add support for stream fragments.

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Signed-off-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>
---
 hw/dma/xilinx_axidma.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/hw/dma/xilinx_axidma.c b/hw/dma/xilinx_axidma.c
index 101d32a965..87be9cade7 100644
--- a/hw/dma/xilinx_axidma.c
+++ b/hw/dma/xilinx_axidma.c
@@ -110,6 +110,7 @@ struct Stream {
 
     int nr;
 
+    bool sof;
     struct SDesc desc;
     unsigned int complete_cnt;
     uint32_t regs[R_MAX];
@@ -174,6 +175,7 @@ static void stream_reset(struct Stream *s)
 {
     s->regs[R_DMASR] = DMASR_HALTED;  /* starts up halted.  */
     s->regs[R_DMACR] = 1 << 16; /* Starts with one in compl threshold.  */
+    s->sof = true;
 }
 
 /* Map an offset addr into a channel index.  */
@@ -321,12 +323,11 @@ static void stream_process_mem2s(struct Stream *s, StreamSlave *tx_data_dev,
 }
 
 static size_t stream_process_s2mem(struct Stream *s, unsigned char *buf,
-                                   size_t len)
+                                   size_t len, bool eop)
 {
     uint32_t prev_d;
     unsigned int rxlen;
     size_t pos = 0;
-    int sof = 1;
 
     if (!stream_running(s) || stream_idle(s)) {
         return 0;
@@ -352,16 +353,16 @@ static size_t stream_process_s2mem(struct Stream *s, unsigned char *buf,
         pos += rxlen;
 
         /* Update the descriptor.  */
-        if (!len) {
+        if (eop) {
             stream_complete(s);
             memcpy(s->desc.app, s->app, sizeof(s->desc.app));
             s->desc.status |= SDESC_STATUS_EOF;
         }
 
-        s->desc.status |= sof << SDESC_STATUS_SOF_BIT;
+        s->desc.status |= s->sof << SDESC_STATUS_SOF_BIT;
         s->desc.status |= SDESC_STATUS_COMPLETE;
         stream_desc_store(s, s->regs[R_CURDESC]);
-        sof = 0;
+        s->sof = eop;
 
         /* Advance.  */
         prev_d = s->regs[R_CURDESC];
@@ -426,8 +427,7 @@ xilinx_axidma_data_stream_push(StreamSlave *obj, unsigned char *buf, size_t len,
     struct Stream *s = &ds->dma->streams[1];
     size_t ret;
 
-    assert(eop);
-    ret = stream_process_s2mem(s, buf, len);
+    ret = stream_process_s2mem(s, buf, len, eop);
     stream_update_irq(s);
     return ret;
 }
-- 
2.20.1

