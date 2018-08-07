Received: by 2002:a5d:6782:0:0:0:0:0 with SMTP id v2-v6csp3916203wru;
        Tue, 7 Aug 2018 00:58:26 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpfVhzxFgUuKUJ3LnMMiVDJHeDbJr2QOP8rhNXDWhwO2dQnMPTBKzclpLUncoXcyKopwqb1r
X-Received: by 2002:a0c:c130:: with SMTP id f45-v6mr16042695qvh.7.1533628706313;
        Tue, 07 Aug 2018 00:58:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1533628706; cv=none;
        d=google.com; s=arc-20160816;
        b=oVYBAopvxmm6RmBnhPa3bhRoeQE8ybxkdYY+BSJYFy9tTrmO9QW6mC6EbCA2FvViHs
         yR9N6W5PwcxicclKzTFgUuQ7DzEc0/9zuMDU7umTO3dhfjC5u7vmkhoc2IFysopYmQdx
         ZrP1jdG/s+5kZcEyWxGIS+6lQfu5uB8HEfg/+oN4lyUD77bhq3b1QEEu2eCFMzbPKcXM
         koTPxzT6ol/W4JHfikevbP98t3NOYPxgX5lqRTaSAUvBEPHPFNehvMNY0TEMGgXbgYBJ
         jVthiCC6uuHribS+sgywPSirsjy2c7A+7AGR/XJSrxo+z9o0e3B5KPy9/4cFjcahnPhA
         tAww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-signature:arc-authentication-results;
        bh=pM0KI2p90mEy8ReropfVQoaeacLNStOyD/+HuoyhGWs=;
        b=JwdfmWzP3+0HsGL6AehRsHv3gzcZHUAIxlrz1r6UaCCqczwBb4FDLhR0v5vkqjmKKv
         zftTFQEnDn55jw8RaiV8asTA/EbMuy2lgrNruRePo/zMzuCPmKRXWOpHoma9ND2DDbZ6
         vni3X9tPAgdTmDTKPJ7Rh6iWzn3UXdbqB4s7F09X8kjFRpbkoQNjefLwM2AJaAmD0Sft
         KKaziNUS281nnAbzWVtjyPAVPVRCbwYqUnGAU4JOxUIxLrvSj5vdLxgUlzmyROoeLBrZ
         lmmp6FkBsUS/HjOrvxZYvg1eYQi1+YnFixTRWbf/6fU1hIoUr7Y582ROU4/+kdSIBd20
         1EvQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=EwIORujb;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id l32-v6si675667qta.376.2018.08.07.00.58.26
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 07 Aug 2018 00:58:26 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=EwIORujb;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:37800 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fmwsr-0002VA-Pw
	for alex.bennee@linaro.org; Tue, 07 Aug 2018 03:58:25 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60630)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <joel.stan@gmail.com>) id 1fmwsg-0002TB-1T
	for qemu-arm@nongnu.org; Tue, 07 Aug 2018 03:58:14 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <joel.stan@gmail.com>) id 1fmwsf-0005Sv-Bu
	for qemu-arm@nongnu.org; Tue, 07 Aug 2018 03:58:14 -0400
Received: from mail-pf1-x444.google.com ([2607:f8b0:4864:20::444]:45112)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <joel.stan@gmail.com>)
	id 1fmwsf-0005Sh-4r; Tue, 07 Aug 2018 03:58:13 -0400
Received: by mail-pf1-x444.google.com with SMTP id i26-v6so8152420pfo.12;
	Tue, 07 Aug 2018 00:58:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=pM0KI2p90mEy8ReropfVQoaeacLNStOyD/+HuoyhGWs=;
	b=EwIORujbUy9WtEYETd877sURJNukH9wz3KYbihICBhQVgIfjZy//JT+D3dnlhDqhjR
	mKozZHWa5Nl/O6fNFFLGkFd4x6pgzfHS8SvAbuHquLO4nf29pLMxtzXkOu/My4ohCyvQ
	6Qm1dXnQMWJMGu2of9bCHfDa/RzQlbw+0cvH+DUkI1fo9TEx+roiEHZSUTGbS18rxvX+
	HWbOp7J/mWLeJBxPIoFRDHy+MtNb6tLU9gHVRCoTsj8hwMZfpUb0+SmmCf/5154GMNM3
	PPPXSqqz27oECw5/DFAAFZa6tBgymNDEMY2yfc+9fW4Bgt/GCeIsQu62EKwhbdN2S8FK
	rL4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references;
	bh=pM0KI2p90mEy8ReropfVQoaeacLNStOyD/+HuoyhGWs=;
	b=EL+0d7RuajF/8rODFDikS2J6/DSqJuOyIlBVqIyf6JL2Zi2w1XpGyolcO/GT0mz2N7
	hJ0aGIsPbLVSS3NIUIKhMC2h6jYjSYtWY7hzVv7MtLMOOU7bRWPTr2PYjBo2SwLZaPVV
	GlzlYVDYKWqOipioR8tP5HjDiKKUcbwplO9vSD7YUUitZyd9FwtyGRsE4ucTx36NEs7E
	birKCDYmrbaliMoH/WlYMAso23c/YgPgDhvblgzJdn22i0pN//MTnZQSbVPtfC/OyIhK
	BQHhxvBr2Qqa1HvQrGSNJxXykT5uc9uChBOZDpYkv/uOTxbM6Gyab+yrhqR9Zx5MY3VV
	tRYQ==
X-Gm-Message-State: AOUpUlH8K9SSpTzT4En4MAov0/Uw5GlQ9vqvcADW/vzPGpZXu3tcFwX6
	AV9pVmbYG4xuaZs4UWtUT0I=
X-Received: by 2002:a63:5350:: with SMTP id
	t16-v6mr17341411pgl.196.1533628692103; 
	Tue, 07 Aug 2018 00:58:12 -0700 (PDT)
Received: from aurora.jms.id.au ([45.124.203.18])
	by smtp.gmail.com with ESMTPSA id
	p73-v6sm1466263pfk.186.2018.08.07.00.58.08
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 07 Aug 2018 00:58:11 -0700 (PDT)
Received: by aurora.jms.id.au (sSMTP sendmail emulation);
	Tue, 07 Aug 2018 17:28:05 +0930
From: Joel Stanley <joel@jms.id.au>
To: Peter Maydell <peter.maydell@linaro.org>,
	=?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Date: Tue,  7 Aug 2018 17:27:51 +0930
Message-Id: <20180807075757.7242-2-joel@jms.id.au>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20180807075757.7242-1-joel@jms.id.au>
References: <20180807075757.7242-1-joel@jms.id.au>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::444
Subject: [Qemu-arm] [PATCH 1/7] aspeed_sdmc: Extend number of valid registers
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
Cc: Andrew Jeffery <andrew@aj.id.au>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: k5hm+t8vbRpe

The SDMC on the ast2500 has 170 registers.

Signed-off-by: Joel Stanley <joel@jms.id.au>
---
 include/hw/misc/aspeed_sdmc.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/hw/misc/aspeed_sdmc.h b/include/hw/misc/aspeed_sdmc.h
index 551c8afdf4be..682f0f5d56dc 100644
--- a/include/hw/misc/aspeed_sdmc.h
+++ b/include/hw/misc/aspeed_sdmc.h
@@ -14,7 +14,7 @@
 #define TYPE_ASPEED_SDMC "aspeed.sdmc"
 #define ASPEED_SDMC(obj) OBJECT_CHECK(AspeedSDMCState, (obj), TYPE_ASPEED_SDMC)
 
-#define ASPEED_SDMC_NR_REGS (0x8 >> 2)
+#define ASPEED_SDMC_NR_REGS (0x174 >> 2)
 
 typedef struct AspeedSDMCState {
     /*< private >*/
-- 
2.17.1

