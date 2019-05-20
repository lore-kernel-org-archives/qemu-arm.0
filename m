Received: by 2002:adf:c793:0:0:0:0:0 with SMTP id l19csp381183wrg;
        Mon, 20 May 2019 09:36:24 -0700 (PDT)
X-Google-Smtp-Source: APXvYqyC+Cg1zma0Iif2fGcJGLGet48MAjGf2oeSNb4ndLFnNBcx5Y697JaKm9eKkuFNjy0mAseD
X-Received: by 2002:a17:906:8398:: with SMTP id p24mr44741766ejx.8.1558370184351;
        Mon, 20 May 2019 09:36:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1558370184; cv=none;
        d=google.com; s=arc-20160816;
        b=s9AvRX5twppH7skqF5/gI7zFz/dKd21eQ9EZLCn51XpWNsQLg7yvJIzem/0YNZXcgJ
         cYdYO3IoYAGLBoqC4SsgRTllH0JcAlGDDmykrpwwePsld4l89oECLCQgjTcrtUD5Fq49
         S2NcU9v2vBi+IEX1zuxCN+ydDCuVpSuA54dpITaaMlbYNVs8i1vyErWExl7iGRqLWr4f
         e5g28ZklwnqlwC5syTG1SgLF3qfcciGmZnUySaSehyfNYLak4Kb1XkShli59jyKfeYcE
         E20Sbf8N4/jXQxpczWWJzGGtq0xF3TCWqvCsMkih64kwJKqJORE0iAL0qS9UEUOUJnsg
         g8dA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature;
        bh=cEu3plm2JnEz4zF57Dl9xMi74nNuVpPFcKATYhpH4io=;
        b=LGDX0mHkzhvH8c7M4WzmX38xauxR1Rvvg1OclJ1eAwokVQ4L1PafR7i3aFqFba80ky
         d7Q5E7KH1CV89rQN5ee7ZiIwtW230lwPRNcWBy2h9a3FuRKf1oZRxjNe96z3BHI7e0NG
         +cYgw9LsiXqL3p9oQXdwNQyGVCrbd5rBMqwIbndfKklbrqWKoxNhY27oekJ2YXmkqPOl
         pZyVlVeNrMrsj3mLENKyitD+77Ho4cbpJXlJd9DrHMLIQIxSl/Y5JTPp0ecGlNfV/Nj3
         yN4zn1ARs6HSW9RKarJCL0CBpY/RzbrD3AmEGOu6gPpZLoRjz5c40+be1Eoh7UflMsA4
         lNcg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=qkz0Jidp;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v23si14135653edc.331.2019.05.20.09.36.24
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 20 May 2019 09:36:24 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=qkz0Jidp;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([127.0.0.1]:38348 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hSlGx-0000TL-B6
	for alex.bennee@linaro.org; Mon, 20 May 2019 12:36:23 -0400
Received: from eggs.gnu.org ([209.51.188.92]:42707)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1hSl9B-00031W-K1
	for qemu-arm@nongnu.org; Mon, 20 May 2019 12:28:22 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1hSl98-0001Fy-2c
	for qemu-arm@nongnu.org; Mon, 20 May 2019 12:28:19 -0400
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341]:35761)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1hSl95-0001DM-Sb
	for qemu-arm@nongnu.org; Mon, 20 May 2019 12:28:17 -0400
Received: by mail-wm1-x341.google.com with SMTP id q15so12709wmj.0
	for <qemu-arm@nongnu.org>; Mon, 20 May 2019 09:28:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=cEu3plm2JnEz4zF57Dl9xMi74nNuVpPFcKATYhpH4io=;
	b=qkz0JidpSNoylM3MLl+G/1xILgwruSaa0LidMNP2QzD4hAIsK38BUX3FD1j9YZL6+7
	i0+EJHW60XWI2mCLmDP5qESUX1MFZ8sDWPQHZjCss1cU/px3Sbb93egRJSWUGV5SbjP0
	EK/pu/KqdQohweqbdJdiXssoXVCntTbTNQ5AxcDnIOhTw+toXQaMVVXeEyeVe5+yhbmg
	jrFTJpqwswULv6YT3pjiichaQuUouJVszIShqgQ+zPzaLcfymrmoZ6pzF0KIju2lrChr
	jsP9l4/laWS6nyLniItVXsrrM3ikxMvhwlggS2qyub07USqGlPX9WuOO5E8on/eOMnjA
	b6EQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=cEu3plm2JnEz4zF57Dl9xMi74nNuVpPFcKATYhpH4io=;
	b=IQe6rF0JSrCnU79XzorFRdwyLBl2pPwkwr8WieGbXgX09OfAPHgeLfJYCiUEqsNQ7I
	ZMGOpE5QQIKriX26BGY1LLRgEL2fYm0hCqFFsqfn/mu/qj0MiaK6u8ol8meTxGsUiBtb
	dfoMDFdBi+PC1MwwDAv9SpriCgcE9zCF6gR/aL3ioNDEfes1ul6Xp86iCbzGUszNQD5o
	a8q0AW+zrAJiuGGqPffUl48XdZ0f9fJXqhSUE52vknFGF8v2V/6N9EEin+qpGvF5ecBZ
	pfpdBL4OxbweMO7R3nlg+Z6fF5+6ifHHgs/GXoJzPZkhkx+bBvol34befgsqB4RwepGh
	JQGA==
X-Gm-Message-State: APjAAAUubYpvrGfKZiT5yZr6qScfEAly09L8RzcaazZ0TtiF3zltb780
	a3M+YRi/81Fb713HeeDzof/zmKn9l0A=
X-Received: by 2002:a1c:e906:: with SMTP id q6mr2872014wmc.47.1558369693589;
	Mon, 20 May 2019 09:28:13 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
	by smtp.gmail.com with ESMTPSA id x2sm5830394wrs.39.2019.05.20.09.28.12
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 20 May 2019 09:28:12 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Mon, 20 May 2019 17:28:06 +0100
Message-Id: <20190520162809.2677-2-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190520162809.2677-1-peter.maydell@linaro.org>
References: <20190520162809.2677-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::341
Subject: [Qemu-arm] [PATCH 1/4] hw/intc/arm_gicv3: Fix decoding of ID
 register range
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Kfp+P5/2Y/d8

The GIC ID registers cover an area 0x30 bytes in size
(12 registers, 4 bytes each). We were incorrectly decoding
only the first 0x20 bytes.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/intc/arm_gicv3_dist.c   | 2 +-
 hw/intc/arm_gicv3_redist.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/intc/arm_gicv3_dist.c b/hw/intc/arm_gicv3_dist.c
index 53c55c57291..335386ff3ac 100644
--- a/hw/intc/arm_gicv3_dist.c
+++ b/hw/intc/arm_gicv3_dist.c
@@ -533,7 +533,7 @@ static MemTxResult gicd_readl(GICv3State *s, hwaddr offset,
         }
         return MEMTX_OK;
     }
-    case GICD_IDREGS ... GICD_IDREGS + 0x1f:
+    case GICD_IDREGS ... GICD_IDREGS + 0x2f:
         /* ID registers */
         *data = gicv3_idreg(offset - GICD_IDREGS);
         return MEMTX_OK;
diff --git a/hw/intc/arm_gicv3_redist.c b/hw/intc/arm_gicv3_redist.c
index 3b0ba6de1ab..9bb11423382 100644
--- a/hw/intc/arm_gicv3_redist.c
+++ b/hw/intc/arm_gicv3_redist.c
@@ -233,7 +233,7 @@ static MemTxResult gicr_readl(GICv3CPUState *cs, hwaddr offset,
         }
         *data = cs->gicr_nsacr;
         return MEMTX_OK;
-    case GICR_IDREGS ... GICR_IDREGS + 0x1f:
+    case GICR_IDREGS ... GICR_IDREGS + 0x2f:
         *data = gicv3_idreg(offset - GICR_IDREGS);
         return MEMTX_OK;
     default:
-- 
2.20.1

