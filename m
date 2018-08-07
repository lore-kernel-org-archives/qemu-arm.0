Received: by 2002:a5d:6782:0:0:0:0:0 with SMTP id v2-v6csp3916441wru;
        Tue, 7 Aug 2018 00:58:45 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpcnLjRxYb+HIAfZD+Fq23nfZ7rLmzN4fY4WdovDtgGc/0ZwH3O9afj0N9Z4E8ihLtlg64EW
X-Received: by 2002:a37:9306:: with SMTP id v6-v6mr16236159qkd.36.1533628724962;
        Tue, 07 Aug 2018 00:58:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1533628724; cv=none;
        d=google.com; s=arc-20160816;
        b=npNt6/bC6NECJnZmctXwhAOCwphMBDSytaqjIfdDPmfv+De1oNHV50FKC8fvUA2di9
         GFnvcqV/hWwMxZnY4cyGxd/TvQe0/tfJZBoEKtu0U1YbISTZJPR7V22UW2JfW4o9/m6L
         s2W8y1cHjkcfCtMD53oOeuayakQgKDKPHM/i4fw6Xiubdq0QvOlMdGR/2zBOKJMSRCnD
         o3vCTAUMLrUM0c79qzHw98Mhs+pb1p/ZLbRPYZE2fMaNQ1oruXffSw3qPztmQ/ikLkjB
         4sO9qFRo39n4jw5DXSebTRPQWCq2yiUYbwCRcGrHa/vAev7HyO+QS0PBsQ48kvdk/4dQ
         sLbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-signature:arc-authentication-results;
        bh=IwxgDWYwXXaZerE0XDTDwsloGi00V2OC1UcWga4a5gM=;
        b=T+1l83+qzDPT+lKApCG32jUld2b3IceZsg7Aw+jNaz8p7IvpyOGUsqRUI7F+hKOgO+
         fjcmsB6dKbpqGfwxUBLH4PW5PgVU81oHAQS5g2v7S1SKf2yBlUG8XimADdwZOFWqDBQ+
         EkBsipT2oF7VmSzLtElF8DPW0EZ0GqhVgE7VshedH1ZFaEdjtjO0YOe+IsOw1sCyeKqf
         +zl1bUrFjcH8kZXLUxqE0KLRF/IgjrhqGPoGVMSeKlU+c7bZT7yFaBTDDpXnia5+yrNU
         lhw+M8GgIX1YexIh2fRFtMsD1qY7x3lfIJ+UtJk7GB+PseQteSKQPcWTFQBrBiLlHz8B
         oZfA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=lhkKUzoN;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id m187-v6si628161qkb.191.2018.08.07.00.58.44
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 07 Aug 2018 00:58:44 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=lhkKUzoN;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:37802 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fmwtA-0002jn-Dw
	for alex.bennee@linaro.org; Tue, 07 Aug 2018 03:58:44 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60696)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <joel.stan@gmail.com>) id 1fmwsu-0002hQ-Ss
	for qemu-arm@nongnu.org; Tue, 07 Aug 2018 03:58:31 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <joel.stan@gmail.com>) id 1fmwsu-0005Xz-4Q
	for qemu-arm@nongnu.org; Tue, 07 Aug 2018 03:58:28 -0400
Received: from mail-pl0-x242.google.com ([2607:f8b0:400e:c01::242]:38402)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <joel.stan@gmail.com>)
	id 1fmwst-0005Xa-TT; Tue, 07 Aug 2018 03:58:28 -0400
Received: by mail-pl0-x242.google.com with SMTP id u11-v6so6777552plq.5;
	Tue, 07 Aug 2018 00:58:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=IwxgDWYwXXaZerE0XDTDwsloGi00V2OC1UcWga4a5gM=;
	b=lhkKUzoNTYy+pvdb/wqFZzoHgaNzpvjeBhP912q+kEd79EDjdpRxRaWp9AWPAJtnFK
	a5hKXzpZTdprf8ZoSozMrzTWge1c9zmXoNIncJ9V2OlXVPpT3zTu8+PSJ+4GNg8DvM4A
	sxYWj5iH5YduCNRI+G3IV3ctV6rA8EW1+hcTiPbj74RVD94BBd0QTWwKei7w4iWNt68E
	i0E26Wkx9LpBKb3O3btnI4ctfXHK6hr6B6n0kjp/TWSGGF03B2AKRKISzznNxDUgX/Gn
	m0Xzvd4ipI5vbEpl3xxfJIAZZyavNFJoDfQ99OKZsxzRDO1BcR3Wsq1YZaYj9oQFNFsm
	lICA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references;
	bh=IwxgDWYwXXaZerE0XDTDwsloGi00V2OC1UcWga4a5gM=;
	b=s1oq+qdGMNDO1izsOPQpp1C2F9oCnzVGUzIWRsGGGfBfVOe8w0oNdWnVT69eU0p0uD
	NVZReK+8+Mk8rZHRUfmPbjfBJg5e4fOuiOiib4dfF34YA/JJaVUcOuGzR0XCXXySPz5N
	asR6OVbe6lH9tyfQZOlbnpbI93DIr1u6QG9JqbaLmIvjTLRRbSc3QmPYL3M6GOVskRFp
	vMfUxNa9vlUpi+IDp0Nk8GfX4VGqsJHJ+N1BeZMJHC7HjAMZFWtJ/KT3vjJHuLsLRtAx
	56NgDtapF4RssppisC+TtmqM+FRjxEEje9qrTU8zVm49FzSQVn7iH/xZzwgpiJUWRa7X
	aXDA==
X-Gm-Message-State: AOUpUlE+B7vgBqzDE7Bfuyr3SuTTB/cx7iAaDFVaM8J+qVBP7OIyWlGO
	q/LU2BN7iJTf3AzZutDwtIg=
X-Received: by 2002:a17:902:d706:: with SMTP id
	w6-v6mr16747940ply.158.1533628706942; 
	Tue, 07 Aug 2018 00:58:26 -0700 (PDT)
Received: from aurora.jms.id.au ([45.124.203.18])
	by smtp.gmail.com with ESMTPSA id
	a191-v6sm991550pge.45.2018.08.07.00.58.23
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 07 Aug 2018 00:58:26 -0700 (PDT)
Received: by aurora.jms.id.au (sSMTP sendmail emulation);
	Tue, 07 Aug 2018 17:28:19 +0930
From: Joel Stanley <joel@jms.id.au>
To: Peter Maydell <peter.maydell@linaro.org>,
	=?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Date: Tue,  7 Aug 2018 17:27:53 +0930
Message-Id: <20180807075757.7242-4-joel@jms.id.au>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20180807075757.7242-1-joel@jms.id.au>
References: <20180807075757.7242-1-joel@jms.id.au>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c01::242
Subject: [Qemu-arm] [PATCH 3/7] aspeed_sdmc: Set 'cache initial sequence'
 always true
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
X-TUID: aJ55Svd+3HkX

The SDRAM training routine sets the 'Enable cache initial' bit, and then
waits for the 'cache initial sequence' to be done.

Have it always return done, as there is no other side effects that the
model needs to implement. This allows the upstream u-boot training to
proceed on the ast2500-evb board.

Signed-off-by: Joel Stanley <joel@jms.id.au>
---
 hw/misc/aspeed_sdmc.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/misc/aspeed_sdmc.c b/hw/misc/aspeed_sdmc.c
index 24fd4aee2d82..9ece545c4ffa 100644
--- a/hw/misc/aspeed_sdmc.c
+++ b/hw/misc/aspeed_sdmc.c
@@ -226,6 +226,7 @@ static void aspeed_sdmc_realize(DeviceState *dev, Error **errp)
         s->ram_bits = ast2500_rambits(s);
         s->fixed_conf = ASPEED_SDMC_HW_VERSION(1) |
             ASPEED_SDMC_VGA_APERTURE(ASPEED_SDMC_VGA_64MB) |
+            ASPEED_SDMC_CACHE_INITIAL_DONE |
             ASPEED_SDMC_DRAM_SIZE(s->ram_bits);
         break;
     default:
-- 
2.17.1

