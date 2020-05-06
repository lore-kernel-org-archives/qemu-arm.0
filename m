Received: by 2002:a19:ee01:0:0:0:0:0 with SMTP id g1csp785765lfb;
        Wed, 6 May 2020 01:25:54 -0700 (PDT)
X-Google-Smtp-Source: APiQypKkfk5aVLH4dkDCo62tOZLHpi4OsCnD31ICiiKJqGnUy4601hmUHRl1FRQC9OTVT0NG4psb
X-Received: by 2002:a37:4755:: with SMTP id u82mr7979092qka.296.1588753553926;
        Wed, 06 May 2020 01:25:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1588753553; cv=none;
        d=google.com; s=arc-20160816;
        b=07iVscqU+ffHQN+/5BjmRZ3jGdeIBNtU+Da73MzGvzfPf6ko/224wX0t+CGuXj83Ay
         qkFlY/TPnXzwwMv3zCcIKsSw8YT0gvSleDohL0EZ03FACAOY5+3FDkkJrrmGeSNtHJMF
         y+Qysq129Wk1RIM8ilzxKo7RB/7ijpjOcZRu3mHPKiJNNsGNG2pb+5wVo7AUkj45CAQT
         qRzsX3I8BMmaSDZROC3LgWYoXoi3LopBesZp5ilzmtpYxMdY/pJY1KZ3WhH9PilzImcp
         Tn2G0NsMh7biygjvBZVtiHf+yH+eNGfj8thioeDqWoHnthTJNQ6di9+9S636kKbq4Cjr
         pP6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=//+JWd43/4O3dB9EDE7PhPq8qRYGVfcDp0Lpx8dJUyE=;
        b=e/FZsVif9QNjOfI0hIWn4N2fAhwiAiGWdMIyDh524wGH8HnYN16zp6GsImJMAMwpOJ
         A5/4R2ub2QIynJe8v0QjrwoLyuuRWMVZldFrXrw0GPOoap36hTKdTpYpM8ZvCg3cOKU7
         i5ZB8NJvB30C4/QodzV/tkbJR7oC/GTblzbsQ1PZnMjqbvCBGSJ59njlqzGatgLkKVnd
         W2Fqpgk+dPLIVnVAob5wQWIyEb+269V/i716BI9C69k6/dFJQbVRsFkvUW4JfFGXdBMy
         gxJftCqPg0xbx33ARY/DicFauIVvjmdOsKd2HrCTczPH0sSYDTgyvuJ3Vspx0QeRlvgr
         w4uA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=KDTK5KqK;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:470:142::17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:470:142::17])
        by mx.google.com with ESMTPS id g65si212726qtd.231.2020.05.06.01.25.53
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 06 May 2020 01:25:53 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:470:142::17 as permitted sender) client-ip=2001:470:142::17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=KDTK5KqK;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:470:142::17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:41716 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jWFNJ-0004fm-7L
	for alex.bennee@linaro.org; Wed, 06 May 2020 04:25:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38200)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <edgar.iglesias@gmail.com>)
 id 1jWFMm-0004dD-7Y; Wed, 06 May 2020 04:25:20 -0400
Received: from mail-lj1-x242.google.com ([2a00:1450:4864:20::242]:46348)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <edgar.iglesias@gmail.com>)
 id 1jWFMk-0006uw-V9; Wed, 06 May 2020 04:25:19 -0400
Received: by mail-lj1-x242.google.com with SMTP id f18so1362306lja.13;
 Wed, 06 May 2020 01:25:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=//+JWd43/4O3dB9EDE7PhPq8qRYGVfcDp0Lpx8dJUyE=;
 b=KDTK5KqKoTV/vkHTlwwwh+4lNzuw4lBa6bUS72Zjeko1LxKkL01BIEFV6Q+LZ0tw7q
 IZud1XGE6/0yitQ7pi5FGipqV8pGdFsWpX6FA3Mfx2e7TSDtsNHy596KUqUBw988dH8s
 eVfyzMSePZj/5Oyq0FqfUfP7MU1KdL93o664uKaAT1UZ7aZRecOTJdAvLOXT0tSvi2Da
 PrRwqijFsEg2t90/y1g0g+caRoRCpBs11BUBREPkwcbQ+gwoldFW6qr4CeSZ4owscqIB
 u2QcYFhyNoBWGs64rqrYA78k41JsF0nOO98ka2RxClgkTCcuRARB21TCWvlEQiPnLqCM
 rjHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=//+JWd43/4O3dB9EDE7PhPq8qRYGVfcDp0Lpx8dJUyE=;
 b=RySEQcXRv0TaZqIU/UDBQGYWL+80N7Izw4c+Vb2HS9VDXTYkK5oD+HanDuZ8o9ClCI
 hHMtiUfntre4o+tDF4JCyZOB3bp0XD7laywNOFdpM7+D6rtQyDqLdTq9YdbAJGVI3UwL
 g8gY4Z4kHPF+m0GFTSxX2rDtdSUDI2YDKU+jw24S3Xrf/4Eg9efjYngbB8FiVLbgf1DD
 tmPSky9mf9v6WM82iDHjdal8eh4V0NSl8AbFYc+yHeCbiNh4JTj1ZRCmJOksnUs4tZzz
 mR7FoZMuPCId3mRsbwoIbdbDBmLdyBvgNFULYbeIrRK4CdGwRHRo09N684T/jnYxUhFV
 Es1A==
X-Gm-Message-State: AGi0PuZEYN0SclnlyfoWPiV5VrNi3cwXyD4cHw7tckD4O1Um42g7/nEZ
 oc/mXupyRUDcmFg1bkygIEyyNk2RC3s=
X-Received: by 2002:a2e:7613:: with SMTP id r19mr4085012ljc.29.1588753516502; 
 Wed, 06 May 2020 01:25:16 -0700 (PDT)
Received: from gmail.com (81-231-232-130-no39.tbcn.telia.com. [81.231.232.130])
 by smtp.gmail.com with ESMTPSA id i2sm1053163lfg.67.2020.05.06.01.25.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 May 2020 01:25:15 -0700 (PDT)
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 1/9] hw/net/xilinx_axienet: Auto-clear PHY Autoneg
Date: Wed,  6 May 2020 10:25:05 +0200
Message-Id: <20200506082513.18751-2-edgar.iglesias@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200506082513.18751-1-edgar.iglesias@gmail.com>
References: <20200506082513.18751-1-edgar.iglesias@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::242;
 envelope-from=edgar.iglesias@gmail.com; helo=mail-lj1-x242.google.com
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
X-TUID: x/dIBWtQl4SZ

From: "Edgar E. Iglesias" <edgar.iglesias@xilinx.com>

Auto-clear PHY CR Autoneg bits. This makes this model
work with recent Linux kernels.

Reviewed-by: Francisco Iglesias <frasse.iglesias@gmail.com>
Signed-off-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>
---
 hw/net/xilinx_axienet.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/net/xilinx_axienet.c b/hw/net/xilinx_axienet.c
index 704788811a..0f97510d8a 100644
--- a/hw/net/xilinx_axienet.c
+++ b/hw/net/xilinx_axienet.c
@@ -149,8 +149,8 @@ tdk_write(struct PHY *phy, unsigned int req, unsigned int data)
             break;
     }
 
-    /* Unconditionally clear regs[BMCR][BMCR_RESET] */
-    phy->regs[0] &= ~0x8000;
+    /* Unconditionally clear regs[BMCR][BMCR_RESET] and auto-neg */
+    phy->regs[0] &= ~0x8200;
 }
 
 static void
-- 
2.20.1

