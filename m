Received: by 2002:a5d:4850:0:0:0:0:0 with SMTP id n16csp473206wrs;
        Wed, 14 Aug 2019 00:14:53 -0700 (PDT)
X-Google-Smtp-Source: APXvYqy+GEu2fOXRV5l+1Nn0awTEohMqrYgK5+NFRvKxRl09QMKrcy6+/ZzCz7BZxVPXSKfK7INM
X-Received: by 2002:ac8:41d7:: with SMTP id o23mr28196768qtm.268.1565766893493;
        Wed, 14 Aug 2019 00:14:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1565766893; cv=none;
        d=google.com; s=arc-20160816;
        b=mHbt2himNR497ZlXljBJBg4YUgclCkV59oNvColVhCXZMnb8FAPL7fA0fNsLGMWLgF
         Vm7ULK44qoZsMTdJ8Pkon8bgfFiNdQNBeHlkv5S1K2r1QcsSToIt9p03K7IQGgrCU/tp
         coYyToeXndfxwd2mbat7JthgoqyuBLSAnQXzSTg6bEwvt5eY5GGm3bXk9ubwXXXg75MX
         JEPwHc/9nLjhS6igOQ7wPWgS/OheemsYEcUQitLicwlHCJpDDAbCf/xrtBgV68M6N/Hu
         4RWMs3LV7whdbWilv5/XUB88dYR+irAyXzJNyOEzqcBZ2jO9g6yjp0U6v1ckEIEozt9j
         IJQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:message-id:date:to:from
         :dkim-signature;
        bh=RncU1uPuVeOAdD09JRhpLrLDwrbmT2eeqdYkuhqdQeU=;
        b=ep9OI9G7OWKo8SZIQW0epdDMCmghpg1iD4h4pQk2299w2LVweKt6qN/+WBf/y+kmO9
         S1XgR1EkJKlF63Rfw7RBwKZYLvTKsvTNqkwTwcCjMfRzPgrEtpkwyXjFL/dcEKiLjecY
         76ZgRxBVXKf2/eR3taprS3ePmm133sR8uiaqadi494fVHbugpZDUdD4wvDZ7UfY3z4BW
         /ArwlIhG5AmfTFu6v9kvi0W363J6t/9tqnRinIy0YKuSW1r6xWuUm+NCzTGPLxBqqZlm
         kznd2+SDkS/6GtdKnVNM8jlZ7o/2JQGzCN24umczFLVZc2SFeIAwD5lk/jGtCLCwKMz2
         zwmA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=sLolwH3t;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 17si1435709qvf.163.2019.08.14.00.14.53
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 14 Aug 2019 00:14:53 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=sLolwH3t;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:57670 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hxnUj-0002M6-0q
	for alex.bennee@linaro.org; Wed, 14 Aug 2019 03:14:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59283)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <rashmica.g@gmail.com>) id 1hxnUb-0002Ll-RJ
 for qemu-arm@nongnu.org; Wed, 14 Aug 2019 03:14:46 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <rashmica.g@gmail.com>) id 1hxnUa-00089l-Th
 for qemu-arm@nongnu.org; Wed, 14 Aug 2019 03:14:45 -0400
Received: from mail-pf1-x443.google.com ([2607:f8b0:4864:20::443]:45752)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <rashmica.g@gmail.com>)
 id 1hxnUa-00088t-N3; Wed, 14 Aug 2019 03:14:44 -0400
Received: by mail-pf1-x443.google.com with SMTP id w26so7776015pfq.12;
 Wed, 14 Aug 2019 00:14:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=RncU1uPuVeOAdD09JRhpLrLDwrbmT2eeqdYkuhqdQeU=;
 b=sLolwH3tg2Dz5RBq6LnEPpaZwFhvTKuBgYr5TUe+fUOLs1SAYLTuZCp+4/RViNtUke
 MTKJ67gWLj6r8RQcvastVv0rdyTMEQhKeqiejX5Y+43I6bdur4T5h2+SyiSk2UYspQyz
 ssNQD81AdQ9fbWdgO+xNhNXKXil/PqEyTyMDrB+zINgszKC7ukAgDGHUkTI952odmqVe
 8Qxf7+yFV9IgJ9lLZwQ3mFrS3Xrsu1TUTfQwIw8nQiB2rYNugFp+taAJeP6JkPCARh9+
 sKqz4ovC1cUs57Sl6XroGnagXhqI9EahNLORC9gMBwPOmZPKG1S3rdvhxXeBveAFAaU7
 RVHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=RncU1uPuVeOAdD09JRhpLrLDwrbmT2eeqdYkuhqdQeU=;
 b=gafgV4R+iusuGIbca9FdX7vPJnNhq6uZ6MLeWMjWJEqZszKO4umLfk32tMdSjnKY4Q
 HJRQ0Q0Ose35SZpBBDmxPPHKtc6r7gL1nhALvU5TH5xspYdD/vQswv/6rtZhuTxRjHng
 uV9dt5uTO/PkXhB0GE7fgMOSIdwjrOcEGo0eSdR0AkDdcZECoKS0nFIl49OJuUBqm44g
 HzPfuip99pmyJYCgczk8RW5f90PfiBC9719DDNZapnbxHeRhKu9Md8Jg9b6jHFuB7nCx
 UGjhgVqO5hmIVzb7CmUiqzssD4PeeTcAQaXQxaypeB/+OOv12VUPZmQnEkx87UQCPjH1
 wDwQ==
X-Gm-Message-State: APjAAAWdksvC7W9WEp6YIZOx7LjirEblSGAXFZSGoHWZkhKliRBLnu5R
 rhnNAbi+++799v8yo9dp0y0=
X-Received: by 2002:a63:2a08:: with SMTP id q8mr37439392pgq.415.1565766883039; 
 Wed, 14 Aug 2019 00:14:43 -0700 (PDT)
Received: from rashmica.ozlabs.ibm.com ([122.99.82.10])
 by smtp.gmail.com with ESMTPSA id j187sm20086474pfg.178.2019.08.14.00.14.39
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Wed, 14 Aug 2019 00:14:42 -0700 (PDT)
From: Rashmica Gupta <rashmica.g@gmail.com>
To: peter.maydell@linaro.org,
	qemu-arm@nongnu.org
Date: Wed, 14 Aug 2019 17:14:30 +1000
Message-Id: <20190814071433.22243-1-rashmica.g@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::443
Subject: [Qemu-arm] [PATCH v4 0/3] Add Aspeed GPIO controller model
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: andrew@aj.id.au, qemu-devel@nongnu.org, aik@ozlabs.ru, joel@jms.id.au,
 Rashmica Gupta <rashmica.g@gmail.com>, clg@kaod.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: VJHIQ5s6M3zP

v4:
- proper interupt handling thanks to Andrew
- switch statements for reading and writing suggested by Peter
- some small cleanups suggested by Alexey

v3:
- didn't have each gpio set up as an irq 
- now can't access set AC on ast2400 (only exists on ast2500)
- added ast2600 implementation (patch 3)
- renamed a couple of variables for clarity

v2: Addressed Andrew's feedback, added debounce regs, renamed get/set to
read/write to minimise confusion with a 'set' of registers.

Rashmica Gupta (3):
  hw/gpio: Add basic Aspeed GPIO model for AST2400 and AST2500
  aspeed: add a GPIO controller to the SoC
  hw/gpio: Add in AST2600 specific implementation

 hw/arm/aspeed_soc.c           |   17 +
 hw/gpio/Makefile.objs         |    1 +
 hw/gpio/aspeed_gpio.c         | 1054 +++++++++++++++++++++++++++++++++
 include/hw/arm/aspeed_soc.h   |    3 +
 include/hw/gpio/aspeed_gpio.h |  107 ++++
 slirp                         |    2 +-
 6 files changed, 1183 insertions(+), 1 deletion(-)
 create mode 100644 hw/gpio/aspeed_gpio.c
 create mode 100644 include/hw/gpio/aspeed_gpio.h

-- 
2.20.1

