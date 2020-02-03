Received: by 2002:a05:6512:3aa:0:0:0:0 with SMTP id v10csp3665752lfp;
        Mon, 3 Feb 2020 00:27:25 -0800 (PST)
X-Google-Smtp-Source: APXvYqxYA4imrzKytqHtPfWAafCW+gnP5jiyr7jq8QIlqtRtFZJTawWUMI06vejv2XuQ3cQYEzzY
X-Received: by 2002:ae9:e115:: with SMTP id g21mr21886454qkm.187.1580718445729;
        Mon, 03 Feb 2020 00:27:25 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1580718445; cv=none;
        d=google.com; s=arc-20160816;
        b=DXgJMitG8ipSuYkfymHQDF+xVztAdlT9odqQ3B6pZ5eObzWmheO0WpkPGMLVWWYr1X
         8/SRt/Fne2uqJmZjhwCtT1SZSVenVEzRWsxBCHnk7XHtJpqOiPtrpDJ5Uf2MWKxhxOJg
         7hLbjQp7x90FxxrXMsrcZQIGvk9OhMA4vMOlQ65lAAVGoT737F3MHvowsW/CexIemunq
         k1G5iowp7AELr/eZ6eTO+L8JGsHJvLpHsj/39OdTDiMJFv5DPhWJbHAwkFJ7vQmaqTAz
         gP869sOKrxXxtMJWw7arLIFbzM4Y31cbguwCxJO9qI/dvBoxsZvJFWh5Sk5QsZSz8qCl
         TIWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from:dkim-signature;
        bh=g4iVHbwgCmNd1DbL09TKtjuok03u9PtQxqOUHrdldGE=;
        b=O59KPQkwTA9RuO9ON//v/GsA4fQhYb8VTLBzV0S8QC+BbQ93U7SXfQzi2+LGCv3rFw
         YO8ccxY03g8SlA9hZniLZE7YIzl5X8tP+/oeFqu/0cVkdseyIctx7R3Px4h4hU3p6Za1
         N7aSD3+IUZVwOLoDFLt58NS3soXhuhi2wM3RBDaDnSg+CRQwC/SU1r85ZaDa8KA04Buh
         j9wUq7r/Kwc34x9WGncdk2z6nt940yyjth+n482eCsU/o8qA0y2I+FTchTIiQLSuqV7o
         ne07qtP2g7t4H4Gbb7gC07GJPOZEoXPGuqq+dsGUv8NF/WkC3YDBFCIbSN7eFsIftYX+
         w4/A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=Icnl9IP7;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s18si10474275qvm.144.2020.02.03.00.27.25
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 03 Feb 2020 00:27:25 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=Icnl9IP7;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Received: from localhost ([::1]:36020 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iyX4n-0003F7-5u
	for alex.bennee@linaro.org; Mon, 03 Feb 2020 03:27:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34708)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1iyX3o-0002B1-PS
 for qemu-devel@nongnu.org; Mon, 03 Feb 2020 03:26:25 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1iyX3n-0000wt-O2
 for qemu-devel@nongnu.org; Mon, 03 Feb 2020 03:26:24 -0500
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443]:46553)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1iyX3n-0000vM-IK; Mon, 03 Feb 2020 03:26:23 -0500
Received: by mail-wr1-x443.google.com with SMTP id z7so16656933wrl.13;
 Mon, 03 Feb 2020 00:26:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=g4iVHbwgCmNd1DbL09TKtjuok03u9PtQxqOUHrdldGE=;
 b=Icnl9IP7F9aNN8+pmOZJSNWHaxwPzj2tFY/L+SgPLN8UlFgsA4dCIDel/REi3EWB0/
 zq9FFh3H0QXI80P924B4fH8dz7w/XsCrtsYMd6av6IrQyr7y0ExoGAdJEfxEudRalu7p
 nHD2sXdz1Nx4ZhUw21/PhOVFrYzLiU1v1dP4iKm38dspxF4qVXgVktWW1GVRKlOexlZ5
 jF4XDHEmfxAsMRSBSKJTzfoD6bXsFADU587jrphx/eAr7sq1Ge6MaKNHYO5AGSxnOY3G
 CT6GKYWbwN2muBH8Q6+FTUyFLXXc8hmZfFvs9FtBIuefRJsbPjFez8VAifOZ4WkvRvhD
 JOvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=g4iVHbwgCmNd1DbL09TKtjuok03u9PtQxqOUHrdldGE=;
 b=Gh5HHyCBbteM0KYBf3NhnrG3C6NbNqow91gskSKNU/dCD5BqPW3Wr9aCUT2MpQa7eq
 LQMoTCTOHFImmSyez4vqKBY3/SB2dIgjBQdMzx8qB+j6yY8GYG75gaCqxiz5T43VmZu7
 aqh0uky/CarbpkhLpMZkaVKGkP7s04xBR8hrcaNFkMrQxn/WcLGibBArRtzcu0+/BCfU
 +8uExUCx0Tm90PPeBqWupFae7O6gNChZIHodqu4aHJANZoGgrnnLVeYdtJEekm7iPj3o
 e6Y7QNOoXsDeKGvzIPYM0E60IwvAEinH7stXnXImxK1od5YEto2GVtKzQJFoqD7uPu1j
 uO2Q==
X-Gm-Message-State: APjAAAXJElGBnhOmDKVhlrjoAadHSXbtCDt52aj12B//MYvI9yj8Rnqw
 y+0v+dFOo8WUuDFih9ndlPdLZS8a
X-Received: by 2002:a5d:4cc9:: with SMTP id c9mr13726271wrt.70.1580718381987; 
 Mon, 03 Feb 2020 00:26:21 -0800 (PST)
Received: from localhost.localdomain (162.red-83-52-55.dynamicip.rima-tde.net.
 [83.52.55.162])
 by smtp.gmail.com with ESMTPSA id w20sm22396778wmk.34.2020.02.03.00.26.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 Feb 2020 00:26:21 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/6] hw/arm/raspi: Dynamically create machines based on the
 board revision
Date: Mon,  3 Feb 2020 09:26:13 +0100
Message-Id: <20200203082619.7426-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.21.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::443
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Alistair Francis <alistair@alistair23.me>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Andrew Baumann <Andrew.Baumann@microsoft.com>, qemu-arm@nongnu.org,
 Igor Mammedov <imammedo@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 0TIAMQRkNAps

Hi,

These patches simplify adding the raspi0/raspi1/raspi4 boards.

I still need some time to figure out what is the best way to
organize the SoC code because since these socs use different
ARM cores, the interrupt controller are different too.

Igor has been working in his "refactor main RAM allocation to use
hostmem backend" series, and now v4 [1] is almost reviewed.
His raspi patch [2] clashes with my work, Since it is easier for
him to apply his on top of mine, I am sending these patches first.

Please review,

Phil.

[1] https://www.mail-archive.com/qemu-devel@nongnu.org/msg675738.html
[2] https://www.mail-archive.com/qemu-devel@nongnu.org/msg675752.html

Philippe Mathieu-Daudé (6):
  hw/arm/raspi: Use BCM2708 machine type with pre Device Tree kernels
  hw/arm/raspi: Get board version from board revision code
  hw/arm/raspi: Get the SoC type name from the revision code
  hw/arm/raspi: Get board RAM size from board revision code
  hw/arm/raspi: Dynamically create machines based on the board revision
  hw/arm/raspi: Get the CPU core count from the revision code

 hw/arm/raspi.c | 178 +++++++++++++++++++++++++++++++++++++------------
 1 file changed, 135 insertions(+), 43 deletions(-)

-- 
2.21.1

