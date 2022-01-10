Received: by 2002:a19:ca48:0:0:0:0:0 with SMTP id h8csp998782lfj;
        Mon, 10 Jan 2022 08:48:41 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwV2zLtDJjssBcdOZsENKFuztaz4wlcSEMAQJzH1dQ6p9wq8M2X2NbHq0ab1+MiVHF/by5C
X-Received: by 2002:a05:6638:4192:: with SMTP id az18mr305956jab.252.1641833320888;
        Mon, 10 Jan 2022 08:48:40 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1641833320; cv=none;
        d=google.com; s=arc-20160816;
        b=uVtTr2/w3WMDtOh7OHvZWEpcNBOvChq34HirIrx/fiPODgPrrfCfrevfwSNvQdV8bW
         cLIBBn4CUBc6u4diiRJPFfKiDZKlU286n5gEj1OgRllHblrHejEzJM/r1Lzp7eTEVtxz
         diRIshX9YetmUn1OqZcCqxY1UkujyV8JAiJsJSOrInaGNO7IrT8TE4WLOO1cqtx36k4l
         Y1nYFQLUmODv7Gh/0Q2bYGbv4wgXrdqUm1fT4RwOBYd2SawSa1/WR2GCG8ogT30WjcYl
         sEH9J1SKNePy6h2YJ14UYjdIjPhS9yO++8dCCoZB4OD2KjrzUruyvTdq41z5Sa9lbYgi
         XZOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from:dkim-signature;
        bh=bWz+GDXFq4fJAP3l4tZ4PlPfWq5GNP7ANcps1Ic0QYU=;
        b=y8dazlv+qocbybKLxUvzcrXRrsTfQm9v8XpxelsdHzJydx378xWft5eBHRbhZrTwFF
         Wda1YU2H7VxDUkr6DUEwpKmzsgFSx1IU1PwpXTwfQkQQxxOoWwNGZrbROREWiY4mMbs6
         AbZC3jgPWam5SBFbjT0eeRMJK2F0JVeyn5c8Tq8NBRRgY7NGBrL4OCuOasoxwBRanMoH
         SO7411OChH1Iod3FSjIXJRCjS3BEpPJgUvAAbu2EnhPSPldT8umfoL88V5KWBTRtnZgx
         NCzO066TSUt7cpT2defz7fcX/T4RFb6En2Hpcib+fFLn7K0cqlJyCUm1j+odkn0DxPD3
         OR+Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20210112 header.b="G/btdhKw";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id k18si3627140jad.85.2022.01.10.08.48.40
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 10 Jan 2022 08:48:40 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20210112 header.b="G/btdhKw";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:43846 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1n6xqa-00044Q-11
	for alex.bennee@linaro.org; Mon, 10 Jan 2022 11:48:40 -0500
Received: from eggs.gnu.org ([209.51.188.92]:33696)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <idan.horowitz@gmail.com>)
 id 1n6xq4-0003dy-IN; Mon, 10 Jan 2022 11:48:08 -0500
Received: from [2a00:1450:4864:20::42d] (port=43975
 helo=mail-wr1-x42d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <idan.horowitz@gmail.com>)
 id 1n6xq3-0004Xm-2y; Mon, 10 Jan 2022 11:48:08 -0500
Received: by mail-wr1-x42d.google.com with SMTP id o3so27903246wrh.10;
 Mon, 10 Jan 2022 08:48:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=bWz+GDXFq4fJAP3l4tZ4PlPfWq5GNP7ANcps1Ic0QYU=;
 b=G/btdhKwSXGNN0DQoRIl/1x3GtG7wQZgnZVIAdTSuPHYFLnWZ+e3r5KP+skJ02Zjeo
 b2QNUa+rRq0zsgSUUYIArg7Q+/Y1bGNrnPlIvSX4FYFl+BN9AYEpqGU0tv9bynGVX+Xq
 A367Rt6MqRQYuC/iw5snzLYMIah6Tc6z2Ttf66ESe19WkRjdw5dK2mv5RrQxFyVhlLjE
 p5wl+r+h5lqas7lSmZ9vbhGQG8d5+DMRs3wpFreKmcdQIQ++W4n1g8RS5PqlE56wxX+N
 /LmsfJvl+onho455nDUaqWlOfOraXYrJ4W40UOpH1sNBsdm2mnyamzhYN/HlqOMbF7/Q
 PIrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=bWz+GDXFq4fJAP3l4tZ4PlPfWq5GNP7ANcps1Ic0QYU=;
 b=IN889it5HjKOP3gJkAVVctNmuNVPUANJUZsCYVUXZu+cOMmmfI/mN4GqGv3e2FBvMp
 SLx1iVRcL2zdfELh/lbVukFDxIOeEdjjMNzKQGm9UsoIT3J/RxRdJ1qqW78l1gUlfkft
 ObYHNKj6zZiRwHK+iqNdfc7h++JM9DRdBjIDKQtuqik8rnxr46mu9ulnPBxppuP9RDmw
 kAfYw1yeakeqRIZTVKH3bDq9I9a1RQcc325Y5PT4mpKPkmn7C1kxvMCD4DzKAe9M9Ukk
 IAEMO2mur+Akl0O+eEe9m9+D/yWqqLkyn27d3Wa8H5dt+NkRSdW8VsMpElfvNjDaN3oJ
 ANNw==
X-Gm-Message-State: AOAM530Xv1drlIVlFwgz/tmjdswSIxTLiwgS7dZDWkLs8UyonjBCB0x+
 i2mdYl6wW+9MzrrCTzdNEE8qGRBzITfJCA==
X-Received: by 2002:a5d:5912:: with SMTP id v18mr415291wrd.144.1641833284889; 
 Mon, 10 Jan 2022 08:48:04 -0800 (PST)
Received: from li-142ea8cc-3370-11b2-a85c-c55585c2aa0e.ibm.com.com
 (bzq-79-176-247-38.red.bezeqint.net. [79.176.247.38])
 by smtp.gmail.com with ESMTPSA id a6sm3922079wrq.22.2022.01.10.08.48.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Jan 2022 08:48:04 -0800 (PST)
From: Idan Horowitz <idan.horowitz@gmail.com>
To: qemu-arm@nongnu.org
Subject: [PATCH 1/2] accel/tcg: Optimize jump cache flush during tlb range
 flush
Date: Mon, 10 Jan 2022 18:47:53 +0200
Message-Id: <20220110164754.1066025-1-idan.horowitz@gmail.com>
X-Mailer: git-send-email 2.33.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::42d
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=idan.horowitz@gmail.com; helo=mail-wr1-x42d.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: peter.maydell@linaro.org, richard.henderson@linaro.org,
 Idan Horowitz <idan.horowitz@gmail.com>, qemu-devel@nongnu.org,
 pbonzini@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: lBT8qiTL4Vr/

When the length of the range is large enough, clearing the whole cache is
faster than iterating over the (possibly extremely large) set of pages
contained in the range.

This mimics the pre-existing similar optimization done on the flush of the
tlb itself.

Signed-off-by: Idan Horowitz <idan.horowitz@gmail.com>
---
 accel/tcg/cputlb.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/accel/tcg/cputlb.c b/accel/tcg/cputlb.c
index 5e0d0eebc3..926d9a9192 100644
--- a/accel/tcg/cputlb.c
+++ b/accel/tcg/cputlb.c
@@ -783,6 +783,15 @@ static void tlb_flush_range_by_mmuidx_async_0(CPUState *cpu,
     }
     qemu_spin_unlock(&env_tlb(env)->c.lock);
 
+    /*
+     * If the length is larger than the jump cache size, then it will take
+     * longer to clear each entry individually than it will to clear it all.
+     */
+    if (d.len >= (TARGET_PAGE_SIZE * TB_JMP_CACHE_SIZE)) {
+        cpu_tb_jmp_cache_clear(cpu);
+        return;
+    }
+
     for (target_ulong i = 0; i < d.len; i += TARGET_PAGE_SIZE) {
         tb_flush_jmp_cache(cpu, d.addr + i);
     }
-- 
2.33.1

