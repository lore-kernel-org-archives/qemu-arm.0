Received: by 2002:a17:906:5a52:b0:9d0:bf65:29fa with SMTP id my18csp2199408ejc;
        Tue, 14 Nov 2023 09:27:21 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEw5ykac94TNSsfvLyDFp2nvlw6d8Dl1UBrgPEg3GephzFdOjKZ5A4DLJnKi6wui9n8XM+7
X-Received: by 2002:ac8:5952:0:b0:41e:20e8:a279 with SMTP id 18-20020ac85952000000b0041e20e8a279mr3100891qtz.43.1699982840982;
        Tue, 14 Nov 2023 09:27:20 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1699982840; cv=none;
        d=google.com; s=arc-20160816;
        b=EF4d+LoqybZOiQ14sWH6eXdi2CCytsB+KDHGoAQTnVDD44jnlZ03I8gP15w1AeHHm3
         7fEKgKwSCH/Xpe6JegIJkGd9Ej+9bkoU9lpdPy2yFbStnAb08yJt2KnpDrSR9yfmV/wc
         0Gkqp42EB5YIDnnUbICjeKDWZQu0VLKg27RiDI/bZcZ855p2Wr+2+ZPGnjgTHtko7yoL
         niAbwnJZxLBQcRwUqNrv6Kx0E/IPXgWcGVQzH5kPsyU7GKYou8/2+xzHOd02uw0ULCpH
         0Vh1f8Fn+CyfccYh9Z05jkR2CAqeY2eIQraFu/W+8uk33iN2Hku+wAqMl9dYsYGMvo04
         87vw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=aByQA5qmzql9xsLx/xcn8ZEzU30AG61TvPWwUn+kHqw=;
        fh=CSMI7pw6GP6sILb5r3pw/FVw/AVMc/EkCesGZrEI5tA=;
        b=uEpE9jyNxN+RNJ78vD23ZdkCI+4fR1hTJgc4Az2RKyDvmxbWmUwHyoIGCnWkeLbTD7
         iko/uDW2OJIJdjqjhRnuVyxuR5ES/u5sB9qpgpbw+cF8lCfPH8PSowhtYmSrIUyFOX8O
         QPJjRUf0PqNID0Zmwt9drnwqdVaqkxgx3D47c3bK8SW3qVCKWxIIcN6VWW3O6PLS86sD
         9zAGuCyEgzJm6UBvIeGOcAf96J4MdE8KX1fYw9QwXi7OvVL8tmn9Fgg5b+bNxODvNs+B
         LLsb8+hkvMY1vZ4Dn/Yf42DcmT9mPJWcwSanvg/c/tSFJTETGw7sjjmxLqudBQWKwM4k
         7NLg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@codethink.co.uk header.s=imap4-20230908 header.b=CkzhEHnb;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=REJECT sp=NONE dis=QUARANTINE) header.from=codethink.co.uk
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v8-20020a05622a130800b004181e519799si7359952qtk.100.2023.11.14.09.27.20
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 14 Nov 2023 09:27:20 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@codethink.co.uk header.s=imap4-20230908 header.b=CkzhEHnb;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=REJECT sp=NONE dis=QUARANTINE) header.from=codethink.co.uk
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1r2xBS-00081d-30; Tue, 14 Nov 2023 12:26:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <srv_ts003@codethink.com>)
 id 1r2xBP-0007zT-UR; Tue, 14 Nov 2023 12:26:39 -0500
Received: from imap4.hz.codethink.co.uk ([188.40.203.114])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <srv_ts003@codethink.com>)
 id 1r2xBM-0001vP-M2; Tue, 14 Nov 2023 12:26:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=codethink.co.uk; s=imap4-20230908; h=Sender:Content-Transfer-Encoding:
 MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=aByQA5qmzql9xsLx/xcn8ZEzU30AG61TvPWwUn+kHqw=; b=CkzhEHnbCS9Nztqxu+61Hct5K3
 bQX+vtTmwjFaXfBIdiBNSfEoCNhbz3eJ9AIrxrxjbEl1ZmFZYl2AD8YkHJd0smu0fUy4+CHz2EFWt
 Yof8JE5b7YcLDTxhvzFp7IdeHhp2ga3cy/y6tzlV+HbaqumCmhTBojBDKK0B0qg5OpJAWXEODme1x
 n7jGNAkV3fT93ZJc4hn/XWuIG4K48+ocdayl4LnAxzBhCopGETLNTNlyIHltJzj1LycXsES/cEffb
 sq3TYJ5LTT+4IfUbeo0SgoF7BvABx+bR2L5KwEFFougwH7BcFmhQo67m8z5+w0ZgVLoIUgvZ5/o63
 NRRtIZLA==;
Received: from [167.98.27.226] (helo=rainbowdash)
 by imap4.hz.codethink.co.uk with esmtpsa  (Exim 4.94.2 #2 (Debian))
 id 1r2wfu-001nru-Bl; Tue, 14 Nov 2023 16:54:06 +0000
Received: from ben by rainbowdash with local (Exim 4.97)
 (envelope-from <ben@rainbowdash>) id 1r2wft-00000002rNP-3u5E;
 Tue, 14 Nov 2023 16:54:05 +0000
From: Ben Dooks <ben.dooks@codethink.co.uk>
To: peter.maydell@linaro.org
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org,
 Ben Dooks <ben.dooks@codethink.co.uk>
Subject: [PATCH] hw/intc/arm_gicv3: ICC_PMR_EL1 high bits should be RAZ
Date: Tue, 14 Nov 2023 16:54:04 +0000
Message-Id: <20231114165404.681826-1-ben.dooks@codethink.co.uk>
X-Mailer: git-send-email 2.37.2.352.g3c44437643
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=188.40.203.114;
 envelope-from=srv_ts003@codethink.com; helo=imap4.hz.codethink.co.uk
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: 6tHYkD8xCoqo

The ICC_PMR_ELx bit msak returned from icc_fullprio_mask
should technically also remove any bit above 7 as these
are marked reserved (read 0) and should therefore should
not be written as anything other than 0.

Signed-off-by: Ben Dooks <ben.dooks@codethink.co.uk>
---
 hw/intc/arm_gicv3_cpuif.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/intc/arm_gicv3_cpuif.c b/hw/intc/arm_gicv3_cpuif.c
index d07b13eb27..986044df79 100644
--- a/hw/intc/arm_gicv3_cpuif.c
+++ b/hw/intc/arm_gicv3_cpuif.c
@@ -803,7 +803,7 @@ static uint32_t icc_fullprio_mask(GICv3CPUState *cs)
      * with the group priority, whose mask depends on the value of BPR
      * for the interrupt group.)
      */
-    return ~0U << (8 - cs->pribits);
+    return (~0U << (8 - cs->pribits)) & 0xff;
 }
 
 static inline int icc_min_bpr(GICv3CPUState *cs)
-- 
2.37.2.352.g3c44437643

