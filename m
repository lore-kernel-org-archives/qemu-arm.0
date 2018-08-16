Received: by 2002:a5d:6782:0:0:0:0:0 with SMTP id v2-v6csp1908449wru;
        Thu, 16 Aug 2018 07:18:04 -0700 (PDT)
X-Google-Smtp-Source: AA+uWPzpcCHtFexl6WrmvgY9XlTTk6uAcOodPjg6Kk3rwCAMf3/4IryO4+fC7vZBytCZHEPT7BAo
X-Received: by 2002:ac8:6790:: with SMTP id b16-v6mr30821835qtp.66.1534429084434;
        Thu, 16 Aug 2018 07:18:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1534429084; cv=none;
        d=google.com; s=arc-20160816;
        b=KYYhTTVHeaF88TzMmZRAi+xVQjb3E9UNVlvYmdAbgmngBK1R2NTA+2hkF8l5BplCiF
         a7WxqfRMylKEMKt78Vs/jrKKFBMuANKKXIOo6XdSKv14OvJrLmqUtnH9NfNzxw/QI+/x
         eZPCu/cwnHKIGkqADgmlW6ug3y8a3HjTNO9vX+hbmvo8HzN01KfwN43LfoxyshHWG+IG
         BZwsd1PRLy2/PhuXgTK5SHwHeQ7qSVP0TZ4ZabeIYR2P3uo4KNx35wWfxC8U3ZMiiZU6
         COGJWvRRXDxkBt+1MdncN+czHAosaZOy6EiKQhQzrWz9tIDdwXRFVQ+MMhp9W9+MyQfE
         JxoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-signature:arc-authentication-results;
        bh=KwnVk0FZbRL5sACB19TJDzQlDaPoBQkUgoOUVam8cLY=;
        b=ygRKIyGG6GVheMv2/7sJ+J+si/vjABDX6ni9bqqbKV2ew4wfJsrYeJO9ljb18oloTi
         ABddHkDQ0L8SzxlqaHDDjkB9apRKKjXLVcel/TqlwdaLhRNssN3n55wTmrlIeVcUOIrJ
         /p5go7oVEga3UHfxeTm6Mq2g52SVcyttTI2pMUMJ3+Gwtlf78HhPuELCrhQqLzJjWl92
         3ZF3tQ5C4FA4Etq+pVCjQXhcLoYTg0QPR+gx4k2F3XRkhy7O4ITNAm3dkKsqUyUDUvTX
         U4aZmVf5HxcbkrV38iPvjBWbftpgS60H78y9xnZZXot640dHC/Gx345HoOV2ksgpsJII
         P5lg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=X8pRFrTG;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id e64-v6si2744919qkb.255.2018.08.16.07.18.04
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 16 Aug 2018 07:18:04 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=X8pRFrTG;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:55948 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fqJ6B-0001Uo-Uk
	for alex.bennee@linaro.org; Thu, 16 Aug 2018 10:18:03 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42597)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <joel.stan@gmail.com>) id 1fqJ1u-0006aG-L6
	for qemu-arm@nongnu.org; Thu, 16 Aug 2018 10:13:39 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <joel.stan@gmail.com>) id 1fqJ1t-0004QR-DY
	for qemu-arm@nongnu.org; Thu, 16 Aug 2018 10:13:38 -0400
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432]:41730)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <joel.stan@gmail.com>)
	id 1fqJ1l-0004Jx-Hr; Thu, 16 Aug 2018 10:13:30 -0400
Received: by mail-pf1-x432.google.com with SMTP id y10-v6so2083721pfn.8;
	Thu, 16 Aug 2018 07:13:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=KwnVk0FZbRL5sACB19TJDzQlDaPoBQkUgoOUVam8cLY=;
	b=X8pRFrTGUtSLi0g1TjIvFw6wRO7d04PPrQJghiSAd9PBbmNSCnhCiklMn6CIRjM8NO
	PcZPGnvPyN1iRKuC6wSd6me8LknJ1dQ5LEW0CBpS9JCaJKwfOcW9o22CPMQ+uGIG/KtU
	S1EoyaTSTb89DlIK+5QBZVcKl0N1ZcRhakCQ/9OnH2wtHRCBSNKM5+q9NO79uWEl43wI
	sh/zfKPbRbzT8begRR2kuWEn2OKNUyzyk6OL67iBOEd5iw7wPe+4rPZN44gniS7jkW8d
	NA+wtsx7pxaviBBWNGxJGcHvyybHVL5JlNQkSRIFn0HkDHsYol3k2aEZTyJvU5WM9z8J
	KINg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references;
	bh=KwnVk0FZbRL5sACB19TJDzQlDaPoBQkUgoOUVam8cLY=;
	b=rrQzlLGAvFlhEx2QzU7qrzbgr4aUePE7090Erbinxvg5VQdvaftaNih0qVi6Rsx05O
	SeY8+bDRGxbZmsFCW7TUqi7l6e17lAYPMQn45iKfmjHcNAvo/cct+jOKfI0A2synpRXR
	ySVsfq3e6FNk3vGGojoKwzwf5Gy86XBzLyn6CBFRsK+bjKpMKWVGblW1MA3WzDeTrCB1
	pr0LpCdmb6IWwzY+08buwUkxXhg7MCVxn7x2Fd6xEJF4g3nAhfcXF1JxscdpElMkBn6t
	rlUPHfCia1KNyNg5FIouD8RKU0W1Z9aL3Zh078/7GuFJgryIUq4W4mPfwpWVLnlBA37+
	2v9Q==
X-Gm-Message-State: AOUpUlEgyFSyzBpAucAyQkUIcW6qQQEADAuj6MyyasbDP4V2T/XeYbp/
	MG+WI7uMAb6/o+Ah+ou6wyQ=
X-Received: by 2002:a63:dd49:: with SMTP id
	g9-v6mr28991934pgj.356.1534428808214; 
	Thu, 16 Aug 2018 07:13:28 -0700 (PDT)
Received: from aurora.jms.id.au ([45.124.203.18])
	by smtp.gmail.com with ESMTPSA id
	c66-v6sm47934034pfc.138.2018.08.16.07.13.23
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Thu, 16 Aug 2018 07:13:27 -0700 (PDT)
Received: by aurora.jms.id.au (sSMTP sendmail emulation);
	Thu, 16 Aug 2018 23:43:19 +0930
From: Joel Stanley <joel@jms.id.au>
To: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 16 Aug 2018 23:43:01 +0930
Message-Id: <20180816141303.20518-2-joel@jms.id.au>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20180816141303.20518-1-joel@jms.id.au>
References: <20180816141303.20518-1-joel@jms.id.au>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::432
Subject: [Qemu-arm] [PATCH v5 1/3] MAINTAINERS: Add NRF51 entry
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
X-TUID: Fxsb5I46Hzps

This contains the NRF51, and the machine that uses it, the BBC
micro:bit.

Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
Signed-off-by: Joel Stanley <joel@jms.id.au>
---
v3:
  fix spelling of mailing list
  add stefan's reviewed-by
---
 MAINTAINERS | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index c48d9271cf15..5a0d2e327d4a 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -656,6 +656,14 @@ F: include/hw/*/*aspeed*
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

