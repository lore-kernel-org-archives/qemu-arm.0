Received: by 2002:a05:6000:88:0:0:0:0 with SMTP id m8csp3894162wrx;
        Tue, 16 Apr 2019 05:59:17 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxr6fHjzfx9IFaYHmayHJmYGjW0b8DbtuFKvCuhYMCN5K4W6NnW/wJmoSELOXd3nZREKWSY
X-Received: by 2002:a05:6000:120c:: with SMTP id e12mr30239388wrx.187.1555419557372;
        Tue, 16 Apr 2019 05:59:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1555419557; cv=none;
        d=google.com; s=arc-20160816;
        b=lpumDzmQ6R4xf/lmjBdNKvsOJngu464f8gmvff8MpAv35o0gAMwwZoT1gUpJ5k6EPt
         N0UTF9gZFLSCPeDCvShb1+ZIyGDqwK+mSIWiin//GeHpTRqMeRBQhX7tH+0iHSFgyfw6
         2W7SHVt1U8VKBLD/D07ExRQ9tub65BmadxzvQMpTJA8nW3NJjFNNG6UcqZ158Hu6pXco
         nsTLQIjcbuCA+mmj6vG7TrVKD3S+EOon6dbWp+S4Mz0s+pcshpspFDRNqMWMeA9huYmk
         LR7pwpwPboUItrnCO5t3Zgv0WQJzLX56H/tEFF7M6wKoIiu/RFB48qMlkXMiIlo6bnZq
         6FFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature;
        bh=Cdsm6rjvWmI4e6EeMdiLshilhoveyvisAWdYOPDLvS8=;
        b=zQIP3M4s/Kkhc3IdJvii4IKC9buwsjpHnhbTGC8z/uA8F2PvA8yGIkEL1Hv1t+JceW
         u+aMFohorFEObUnBoeNyGZMUI9op0Hpq1Q1tMaUuEqrLd/iI+PMJrLURAAwyK8HqPtBp
         +s2eZKhXzM69HABIAQVESKpinMqR84EBwfNi51pFuO8vHLcmU9jqhXey3CxYDbJ2R0OP
         Yyj0wFyV8zUMnYEORI22+pFAKlfDt9/UkpcPA/Lt3s6L+IRPCHXC2Q7ELOmueRt008bs
         lrfmEN3IGuN9l0ziYwT7a3CAFKTsJh0fJaZCqATGLrGygVdUUphRUGHmdMyzr0qiTFuO
         GZ5w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=UbcPRQfM;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m10si34706724wrw.230.2019.04.16.05.59.17
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 16 Apr 2019 05:59:17 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=UbcPRQfM;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([127.0.0.1]:36264 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hGNgC-0005WM-Er
	for alex.bennee@linaro.org; Tue, 16 Apr 2019 08:59:16 -0400
Received: from eggs.gnu.org ([209.51.188.92]:34325)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1hGNez-0004SS-6w
	for qemu-arm@nongnu.org; Tue, 16 Apr 2019 08:58:02 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1hGNex-00014q-7A
	for qemu-arm@nongnu.org; Tue, 16 Apr 2019 08:58:00 -0400
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343]:36040)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1hGNet-00011P-DA
	for qemu-arm@nongnu.org; Tue, 16 Apr 2019 08:57:57 -0400
Received: by mail-wm1-x343.google.com with SMTP id h18so25325547wml.1
	for <qemu-arm@nongnu.org>; Tue, 16 Apr 2019 05:57:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=Cdsm6rjvWmI4e6EeMdiLshilhoveyvisAWdYOPDLvS8=;
	b=UbcPRQfMjFKcki+y5mz4nyoIqifqrFfEvVWwpycZV2t0/2oKu0Lz5rb66YOk8dVH6k
	H+gynXOiulmANFAe2qguw+VjG2W66JVSYZ9qRXku0v6Xq8o/Y1RWFMdE9WsZEqCEQZ4v
	RkJbFT2htqCrk12xUiZjBmZ7EKSwIUkzmlK6Q7XJon+Ae9Yma0+CNogP+8rb1d9sk81F
	wtx4EtltNb5oA1JWEyYhsKsVEW5RwwEjm13xaFOje8hCZXd9l8rS0H7Rq22UDbFAQmOa
	MQJs7Q270tXx3lT37sWvIVPM8LeyvngaBB0ZgBLkT/pjldDazV7f1NfBXkpHDn9jglOP
	nU+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=Cdsm6rjvWmI4e6EeMdiLshilhoveyvisAWdYOPDLvS8=;
	b=DfV47ZrjZJwnrRQ1b3IFjFwYL3j53DNGFF8OcA1nvKLK10Ykx2V6g/b+iCJWixSQtg
	mFYJLu/Vfhun1JfttaxnMwvhV1z/y09bxxvxwwCFYUyPsh0/fFbsAkTDoxPwx57ifcTH
	FJCrn+b54bL/wCHSGoftOMC0VpEKP1d1jcZb692Xs2+FMEgoJMAH1tptQbxYzZfP9mfd
	AsiHethVS+PtoyYvKD4dj/I/8qHKwX9hFewJMHryM67secbs9qNm0RFruB27cRB+VhUm
	O/NmXIsba1XCA/71ryMA3M9s7PcZmchPCj16uQQLXUsYW5ohSVTI0jKbMk+oOicGjUvY
	xdpQ==
X-Gm-Message-State: APjAAAUTmJ1W2uXqZBVdFcIhA087OXEQuz7lLwjus8unMInS2Q/dNtyU
	vCoFjylQPSyaWGNLMNoLRkntRxaxF38=
X-Received: by 2002:a1c:eb07:: with SMTP id j7mr25520428wmh.138.1555419471361; 
	Tue, 16 Apr 2019 05:57:51 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
	by smtp.gmail.com with ESMTPSA id
	v184sm39476572wma.6.2019.04.16.05.57.49
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 16 Apr 2019 05:57:49 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Tue, 16 Apr 2019 13:57:20 +0100
Message-Id: <20190416125744.27770-3-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190416125744.27770-1-peter.maydell@linaro.org>
References: <20190416125744.27770-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::343
Subject: [Qemu-arm] [PATCH 02/26] hw/intc/armv7m_nvic: Allow reading of
 M-profile MVFR* registers
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
X-TUID: hO5dnzy1V4Wq

For M-profile the MVFR* ID registers are memory mapped, in the
range we implement via the NVIC. Allow them to be read.
(If the CPU has no FPU, these registers are defined to be RAZ.)

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/intc/armv7m_nvic.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/hw/intc/armv7m_nvic.c b/hw/intc/armv7m_nvic.c
index ab822f42514..45d72f86bdf 100644
--- a/hw/intc/armv7m_nvic.c
+++ b/hw/intc/armv7m_nvic.c
@@ -1222,6 +1222,12 @@ static uint32_t nvic_readl(NVICState *s, uint32_t offset, MemTxAttrs attrs)
             return 0;
         }
         return cpu->env.v7m.sfar;
+    case 0xf40: /* MVFR0 */
+        return cpu->isar.mvfr0;
+    case 0xf44: /* MVFR1 */
+        return cpu->isar.mvfr1;
+    case 0xf48: /* MVFR2 */
+        return cpu->isar.mvfr2;
     default:
     bad_offset:
         qemu_log_mask(LOG_GUEST_ERROR, "NVIC: Bad read offset 0x%x\n", offset);
-- 
2.20.1

