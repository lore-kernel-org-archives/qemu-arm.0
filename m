Received: by 2002:a17:906:9417:b0:98e:baa:bd63 with SMTP id q23csp314157ejx;
        Sat, 24 Jun 2023 18:59:27 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ6HX/6w2Mo++S1KXhcdAzSFAVL0c1R1mq8hOZovTja/XxkpyhtiGybnlD17pIBxSjBWvVZ/
X-Received: by 2002:a05:620a:e17:b0:75b:23a1:364b with SMTP id y23-20020a05620a0e1700b0075b23a1364bmr22916759qkm.12.1687658367532;
        Sat, 24 Jun 2023 18:59:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1687658367; cv=none;
        d=google.com; s=arc-20160816;
        b=ByVv2W9EEqf4ArWPXB2qGAsfdQpXP96wh4NLmK8Fn+pR+vBuxndpWjKQIyOCWeLmLt
         q1WcCIrEr9W1y3Hekgj1yVF7zAcx/4IoJ7VmohVBfOIML5kb52xfFVqViuf8K6dHAIHd
         GZIKcAVQSUgqmDc9TwzWNl1eWwuVrdsN24Az66aAp4QUe0AGWKgaey7bvit/X1+r4Syl
         jKEft1GHo+XZhYiTFZ9Z2EF4bvU5jIy88lmkkcwjWNwNpytxGKRqcGuXD9WVWP7o1apI
         Eh0wQ7/cmk5ZRfQRszdAAg5lOuXsUX5u3TtRDyHnAibZoGRnUkYQy1orQ1MX937gLN3h
         7VRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:feedback-id
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from;
        bh=LyjMKOB8wDfS6GJPUG8sO3EsP7uI/oVjLkbKrtt2x4I=;
        fh=u/dg7BYWhV94tEn9nc2iTiCYxM6O4KWA5PXh8TwOXwc=;
        b=fwXlgDvlEgdv+pk4jBmoQj8r7D0IP3mZ9yRQppzv1+qY0pS6xQSVBo0S7ZjB0/NsOC
         8xpUB5ji2OhlmwvvTzCshgt/eft5jvT9PrM0o1WW18DSvkAR1UnG8u53h+tcnR0SnAaF
         ilUbPqQmCX70TC8mkIb1mXZy42CfkMFVwT5FBGH1Y28snubzN37J31F2C1/ggq+WLIGk
         hxlPQJ0MAZmTRYI0mn3Bkam6cp5EoMJ/XYH83MElaiFM5OVfueXBj/b8BGRGR4tlqW/W
         BgGEcmRDDJikvjCpGAD0DkIBNSrzVcB9zG8zXwmLUzfh9fBa9m+7v+9Phs/Ic7wG/d8E
         Necw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a7-20020a05620a438700b0076395d8a560si948642qkp.46.2023.06.24.18.59.27
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 24 Jun 2023 18:59:27 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1qDF1T-0001WC-HK; Sat, 24 Jun 2023 21:58:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng@tinylab.org>)
 id 1qDF1R-0001Vu-U2; Sat, 24 Jun 2023 21:58:37 -0400
Received: from bg4.exmail.qq.com ([43.155.67.158])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng@tinylab.org>)
 id 1qDF1Q-0002je-5j; Sat, 24 Jun 2023 21:58:37 -0400
X-QQ-mid: bizesmtp75t1687658032t9nasj0i
Received: from ubuntu.. ( [111.196.130.174]) by bizesmtp.qq.com (ESMTP) with 
 id ; Sun, 25 Jun 2023 09:53:51 +0800 (CST)
X-QQ-SSF: 00200000000000E0G000000A0000000
X-QQ-FEAT: t8fpqlBPu6qJ8hXdfEjkkXfPawsLS015n2oeohl4nPjBP9iT21tn36OcqKjft
 xyGhKgQDd8mnKF+fZR0SYXnv9nWRZTfXczseblTS7f0V9HeNBDouLTXLPka4w6wcUPQomCU
 pRR6V58VxxdC/fLZAjgzYBK3kDcckuM5DPpkqZyQyWJXk/yI+cJIcDpLuhxkv9G2m5xlrrH
 iDjPYuuhxxLSBXEWSZwE4O6IUCiHfxc6CxQKrNiXkmvo0fzL5Toqmdrp0O0OOyArL0RjQ4y
 9jMdDzOHHTqfGBNCgUkum/U5R4DjE3E2sP8OUw8344WZAaIePf3n+vW4+0+3eTBkvaFANI4
 DgUMWNbA2/wajA+b6AI63qy023BLagAMggENcR8
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 5247651207143805087
From: Bin Meng <bmeng@tinylab.org>
To: Jason Wang <jasowang@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
Cc: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Andrew Jeffery <andrew@aj.id.au>, Joel Stanley <joel@jms.id.au>,
 qemu-arm@nongnu.org
Subject: [PATCH v7 9/9] hw/net: ftgmac100: Drop the small packet check in the
 receive path
Date: Sun, 25 Jun 2023 09:53:21 +0800
Message-Id: <20230625015321.77987-10-bmeng@tinylab.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230625015321.77987-1-bmeng@tinylab.org>
References: <20230625015321.77987-1-bmeng@tinylab.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:tinylab.org:qybglogicsvrgz:qybglogicsvrgz7a-0
Received-SPF: pass client-ip=43.155.67.158; envelope-from=bmeng@tinylab.org;
 helo=bg4.exmail.qq.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001, RCVD_IN_SBL=0.141,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
X-TUID: VYK0lFrhtpo8

Now that we have implemented unified short frames padding in the
QEMU networking codes, the small packet check logic in the receive
path is no longer needed.

Suggested-by: Cédric Le Goater <clg@kaod.org>
Signed-off-by: Bin Meng <bmeng@tinylab.org>

---

Changes in v7:
- new patch: "hw/net: ftgmac100: Drop the small packet check in the receive path"

 hw/net/ftgmac100.c | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/hw/net/ftgmac100.c b/hw/net/ftgmac100.c
index d3bf14be53..702b001be2 100644
--- a/hw/net/ftgmac100.c
+++ b/hw/net/ftgmac100.c
@@ -968,14 +968,6 @@ static ssize_t ftgmac100_receive(NetClientState *nc, const uint8_t *buf,
         return -1;
     }
 
-    /* TODO : Pad to minimum Ethernet frame length */
-    /* handle small packets.  */
-    if (size < 10) {
-        qemu_log_mask(LOG_GUEST_ERROR, "%s: dropped frame of %zd bytes\n",
-                      __func__, size);
-        return size;
-    }
-
     if (!ftgmac100_filter(s, buf, size)) {
         return size;
     }
-- 
2.34.1

