Received: by 2002:adf:b2b8:0:0:0:0:0 with SMTP id g53-v6csp1082040wrd;
        Fri, 31 Aug 2018 15:10:03 -0700 (PDT)
X-Google-Smtp-Source: ANB0VdbaLRK+tpBtCQbzenF2yh49miPyJNg8n/+dgtdIh7DRGoCTz67Nn3eKloIwtW987J6JlRLb
X-Received: by 2002:a0c:d21c:: with SMTP id m28-v6mr17289166qvh.86.1535753403456;
        Fri, 31 Aug 2018 15:10:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1535753403; cv=none;
        d=google.com; s=arc-20160816;
        b=f3IZumRWYmiWeSEHK4pF1eL7EXhbsb+ghPhpMesRu2jIVrQ0xvXKE5Ymqpzj/sY2cR
         T66kSuz4LC84cesXpkfQ4f0oj/H3Q5HHmFaTD9Q+W7XtiXeaYhZS737FXSl8zUO0acl+
         RlPGWQNjFQSwF35s/vYTIs+aQ2RxhQIXW7ypfAJ6QzWXGA1JJ1+cQCbBeiWTz06eMClH
         myiW606/P01tecu+gvvJeESFwXoG/9QY4EDDPxlp0bmlOF/+hwy8mg9IItpPOX85eFUk
         a85GABie2N65VOG268rjvgesC7zbIkGkg7he+E3j5UQGe0tgoFKq8YIyOYkhG+ADCDlI
         ANRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-signature:arc-authentication-results;
        bh=Rg3wVxt7rFRes9qU+lBCVF26M2ACVOvZSLkqEDwOn4M=;
        b=aDizfjeVXUHljK/ibK/o/kDy7bwXkj0sF9t2wuLzmj/YeuYoEONJqSZGZc3qLp1aUO
         UNSWDaEZt2CJBgMCrcIhNiv3zH7JgejsLLG3W9Xjj554hy4ltWNx55FQ7LUSJNhy71za
         fnBK75cOb/MS7+hj/tLmoG7jlUQP3y+Ky7+SLWiBqvOqYLY618FEHLWidmmDh7ZFuTps
         g6k2jvs9Bkas+w4oIej5t23K0eKNWjsMgAzhydAznZEX3wa2Db0Qpo5eHw5JY4n7XpOa
         2H6meFrIN/uY7BXIZUIR5RNjn97Y583KaDpgwsBl10OrCr+Nckv3a6Vn8P9gTV1peWDE
         z2Qg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=EpxTRKq4;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id f126-v6si2272652qkj.400.2018.08.31.15.10.03
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 31 Aug 2018 15:10:03 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=EpxTRKq4;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:58630 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fvrcA-0004hp-SA
	for alex.bennee@linaro.org; Fri, 31 Aug 2018 18:10:02 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52136)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <joel.stan@gmail.com>) id 1fvrbr-0004en-LA
	for qemu-arm@nongnu.org; Fri, 31 Aug 2018 18:09:45 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <joel.stan@gmail.com>) id 1fvrbn-0004pU-0r
	for qemu-arm@nongnu.org; Fri, 31 Aug 2018 18:09:43 -0400
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432]:35564)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <joel.stan@gmail.com>)
	id 1fvrbe-0004gx-TL; Fri, 31 Aug 2018 18:09:31 -0400
Received: by mail-pf1-x432.google.com with SMTP id p12-v6so6109189pfh.2;
	Fri, 31 Aug 2018 15:09:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=Rg3wVxt7rFRes9qU+lBCVF26M2ACVOvZSLkqEDwOn4M=;
	b=EpxTRKq4Pcrd/6Dz+75A/bWPbiNkELo12QUKJqf26jtx2c4afdcObTS5XJGPTx/Lav
	CczWzFdx6V028Gs5bbrxP72EkaSgmkA3pbn4f0sNAfBB9LToR5nbZmNCSJNAIci/h1Nv
	fQX4U/qQWndIUDnxkBi+SW+bGsovq30rBr0jKQum178DiOmfLla98G1fjOM5ELpABunk
	FVll9gQKVW2CBC0UcBIpZZq09ks+UK0fj+QC+BPtwkdq6oi9C8Am0XdWwl46Tl9vMNVC
	qkIXP7vhyRK6SJiCA7MtW/Jfmu08xhPk8B0Bv/+8JtiniUctRY/1R+qq6crPm12I7hPX
	OmHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references;
	bh=Rg3wVxt7rFRes9qU+lBCVF26M2ACVOvZSLkqEDwOn4M=;
	b=VyxHCMBcJsiLOBw0ZEF9l7OCt6OSr4fVumVgQIJpSC64S23gLI5Y9bK8U+0LPzA4tm
	8gEO9KWSlE0z1FlmB5h73P9XvB3cTxvQAVPdi9uEmV6siXtnXYCiaBe0pY9yP1b3ZAcT
	+/NmHcAcdPt9DsRQlBx4/Ffqi/RYua4p5IaThRu8G6RJPQpmDozLAIYKn1M/vVKRJv4n
	YpJJyu1dMLaI11zI/Mwpkis479Nui0CB89+7SHxxGkFD9ypoYa8pVIIlr4R94k9XrVQH
	OHEYxGstoFjguC45HSIlBKR5mqXKC7w/tqfwWe4IN4ioOArZbmPOSnAcGMcfaOiUNphU
	DOyg==
X-Gm-Message-State: APzg51BcOsyztS3QkfN7IFgPzzFabAa6ACzKs2EPaAUVBrnU90nTd9qr
	sBeKqwWYHT4p1vu9QWt4ODs=
X-Received: by 2002:a63:4e5f:: with SMTP id
	o31-v6mr16248702pgl.256.1535753369832; 
	Fri, 31 Aug 2018 15:09:29 -0700 (PDT)
Received: from aurora.jms.id.au ([72.28.92.217])
	by smtp.gmail.com with ESMTPSA id
	w69-v6sm22400873pgd.37.2018.08.31.15.09.27
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Fri, 31 Aug 2018 15:09:29 -0700 (PDT)
Received: by aurora.jms.id.au (sSMTP sendmail emulation);
	Fri, 31 Aug 2018 15:09:27 -0700
From: Joel Stanley <joel@jms.id.au>
To: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 31 Aug 2018 15:09:18 -0700
Message-Id: <20180831220920.27113-2-joel@jms.id.au>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20180831220920.27113-1-joel@jms.id.au>
References: <20180831220920.27113-1-joel@jms.id.au>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::432
Subject: [Qemu-arm] [PATCH v6 1/3] MAINTAINERS: Add NRF51 entry
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
Cc: Stefan Hajnoczi <stefanha@gmail.com>,
	=?UTF-8?q?Steffen=20G=C3=B6rtz?= <contrib@steffen-goertz.de>,
	qemu-devel@nongnu.org, qemu-arm@nongnu.org,
	Jim Mussared <jim.mussared@gmail.com>, Julia Suvorova <jusual@mail.ru>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: dm+Pn2wcoFEC

This contains the NRF51, and the machine that uses it, the BBC
micro:bit.

Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Joel Stanley <joel@jms.id.au>
---
v3:
  fix spelling of mailing list
  add stefan's reviewed-by
v6:
 Add Peter's reviewed-by
---
 MAINTAINERS | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index d12518c08f10..d30f23f127ba 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -670,6 +670,14 @@ F: include/hw/*/*aspeed*
 F: hw/net/ftgmac100.c
 F: include/hw/net/ftgmac100.h
 
+NRF51
+M: Joel Stanley <joel@jms.id.au>
+L: qemu-arm@nongnu.org
+S: Maintained
+F: hw/arm/nrf51_soc.c
+F: hw/arm/microbit.c
+F: include/hw/arm/nrf51_soc.h
+
 CRIS Machines
 -------------
 Axis Dev88
-- 
2.17.1

