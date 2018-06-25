Received: by 2002:a5d:4301:0:0:0:0:0 with SMTP id h1-v6csp3846195wrq;
        Mon, 25 Jun 2018 07:01:28 -0700 (PDT)
X-Google-Smtp-Source: ADUXVKLkIJXvtUNxgJb5OgJcjsrkuQihcBsQO4dhCp/aPhZ2L/RH5ryFhAIQiK2dLZJSdlEOxBjV
X-Received: by 2002:a37:cf43:: with SMTP id e64-v6mr10401132qkj.249.1529935288081;
        Mon, 25 Jun 2018 07:01:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1529935288; cv=none;
        d=google.com; s=arc-20160816;
        b=TV17dmWO7OCav0LYAeAHW8dv0jxGPczz/Jl5n5Q5zMocSEdDFrq6lx/LJ+MSZ9LeN1
         AejHdfm7KWOzTQMf49w935gsEoOmQCfQd+ZJZ+G0/4QK4/QFjPcmsLqcoDsI7SxgqzLa
         QYG89QepYlf23c04RcY7uZsLtjJ4zA7HrdiyHaNTiC8z3IrNp0Q1ilFv5Wvkxn7jNZys
         /dIp4hi34TruC6tzxdiwtHfDxg8UYNFZdnivosJgf0E9J7/d9PNOd6sPzboZgIFoBWgk
         1r6rYTcfI/dOTsJHKieLWXxuO0AZSZ3ieqqG8UkrHOAZWVHOJxBJgvpjpQkXqJ38Wmiu
         WWwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:message-id:date:to:from
         :dkim-signature:arc-authentication-results;
        bh=tCQC3Fxam7kFkvLEt9Czb1pTglOnztSHjeg73+vr4kI=;
        b=a/MXGUP/eI6sdonohKfrBAxHUJJtGDmgRhi9mKmFEWFrQ0+F9Of52NTJhYXNHbzWzf
         YWRYg3HShTKeCKvdqEMLMGG08BLNGXCMz0a2U7PGe9MEjOVXkmzWUMG/JZSX8+4jSO5s
         KgGkzShGZGNG7nswbqK5iUTaFPsq63Kf7BR/w4DKlOh4CD6QZaHt88JGM6ua3KCOue8J
         hlRMy8zYsd8+C6ET+Ze5qLUqyFTnQ4OM4RA2P+XAcrsw6jSOEONvgc0v/4iZP139Nu3b
         uulz77SZC+OfPDoyuSUZ19ktKQx/6FyCxHT23ESbDEzVyPax9Mf2hmiK2K0xmYLNRhUL
         /Qrw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=BszDlmJv;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id p127-v6si2371054qka.116.2018.06.25.07.01.27
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 25 Jun 2018 07:01:28 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=BszDlmJv;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:47363 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fXS3b-0001VB-8Q
	for alex.bennee@linaro.org; Mon, 25 Jun 2018 10:01:27 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51012)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <joel.stan@gmail.com>) id 1fXS3O-0001TR-8f
	for qemu-arm@nongnu.org; Mon, 25 Jun 2018 10:01:15 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <joel.stan@gmail.com>) id 1fXS3I-0001wb-K5
	for qemu-arm@nongnu.org; Mon, 25 Jun 2018 10:01:14 -0400
Received: from mail-pg0-x241.google.com ([2607:f8b0:400e:c05::241]:35364)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <joel.stan@gmail.com>)
	id 1fXS3I-0001wJ-EG; Mon, 25 Jun 2018 10:01:08 -0400
Received: by mail-pg0-x241.google.com with SMTP id i7-v6so6112596pgp.2;
	Mon, 25 Jun 2018 07:01:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=tCQC3Fxam7kFkvLEt9Czb1pTglOnztSHjeg73+vr4kI=;
	b=BszDlmJvRZWkbkOmDTdwAYdgH+f9qOa/ABBwclTZ/h6C06SdnLAWAQwGJxPGIu/2WU
	VAIXeMU4+n+5puYVgZzqtgqcLtKp18GRyu+GNgyec03BTiFMobf4sMcRn5psjKKQw7oH
	IlE60BcGInVR8IogWD+UZaAP0t5SbBQOGXGw419nS5sYAjkq3s8uPvLeIdx/vWLIrIc+
	nB3H4hLI2iR8YN9DJg2oWCYb4WfoE4s1NaYDXrwzPADfj2lRagMCo4hrfJ3kDy/89zR+
	32IFJKbmRIH/fhEu58S1OYGEFN/4zgxQeoyrR1Rrhj6BxrSGyXD5v1f4AOPU6gKXeQLQ
	43vQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:mime-version:content-transfer-encoding;
	bh=tCQC3Fxam7kFkvLEt9Czb1pTglOnztSHjeg73+vr4kI=;
	b=SsgclVtIc3PgHV3TlG895KoNsn08JpHi2u7oFSFi8TPDdihhL1MWDLvAVoWVgUbSMG
	n7voY87tOoF/eGFviANlEp6rLyZw4eeGE7Xm7DcFQTNFNOrOJQ94sJOvFTZYtcaKV81o
	WPVg2/wJYovVwIYSm4cnbbEK3jCMKXqVnw7BupB1TjFFIix+zudVardKx7xvAQ2t7Yr4
	isQZdanvLhlxu8kwTxoBstzZe3EICJCgdKILOLG5kRwnE8g9DZguNOkKQIDWNXqonK+1
	sjTH1/21vUY/oemiehotA3WiaECIiGA02OvACkFLNfhtYR61INEYhtOKY1yvZ5aEqOGg
	e7eA==
X-Gm-Message-State: APt69E2gyPfHxYAAnJK9x5faM16FAGiH+c8pcmk7jYmK3EdWqGNibV/+
	sk2rDFBSL2WqxCxvbA1phdI3p56X
X-Received: by 2002:a65:6491:: with SMTP id
	e17-v6mr10825829pgv.44.1529935265478; 
	Mon, 25 Jun 2018 07:01:05 -0700 (PDT)
Received: from aurora.jms.id.au ([45.124.203.19])
	by smtp.gmail.com with ESMTPSA id
	k71-v6sm6493970pga.62.2018.06.25.07.01.00
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 25 Jun 2018 07:01:04 -0700 (PDT)
Received: by aurora.jms.id.au (sSMTP sendmail emulation);
	Mon, 25 Jun 2018 23:30:56 +0930
From: Joel Stanley <joel@jms.id.au>
To: qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 25 Jun 2018 23:30:55 +0930
Message-Id: <20180625140055.32223-1-joel@jms.id.au>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c05::241
Subject: [Qemu-arm] [PATCH v2] MAINTAINERS: Add ASPEED BMCs
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
Cc: Andrew Jeffery <andrew@aj.id.au>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	=?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>, qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Y7jKEIpH2e3t

This adds Cedric as the maintainer, with Andrew and I as reviewers, for
the ASPEED boards and the peripherals we have developed.

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Andrew Jeffery <andrew@aj.id.au>
Acked-by: Cédric Le Goater <clg@kaod.org>
Signed-off-by: Joel Stanley <joel@jms.id.au>
--
v2: fix includes path
---
 MAINTAINERS | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 2874ddce6097..5706cd89a053 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -644,6 +644,17 @@ M: Subbaraya Sundeep <sundeep.lkml@gmail.com>
 S: Maintained
 F: hw/arm/msf2-som.c
 
+ASPEED BMCs
+M: Cédric Le Goater <clg@kaod.org>
+R: Andrew Jeffery <andrew@aj.id.au>
+R: Joel Stanley <joel@jms.id.au>
+L: qemu-arm@nongnu.org
+S: Maintained
+F: hw/*/*aspeed*
+F: include/hw/*/*aspeed*
+F: hw/net/ftgmac100.c
+F: include/hw/net/ftgmac100.h
+
 CRIS Machines
 -------------
 Axis Dev88
-- 
2.17.1

