Received: by 2002:a5d:51d0:0:0:0:0:0 with SMTP id n16csp3958808wrv;
        Mon, 29 Jul 2019 22:45:20 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxRy34UqRRYIn8N5lq2N12mdzDFXlBwFZSPZv0Ly43prsxSqa7QyD2TS0c1LO/SmqV+sE0o
X-Received: by 2002:a17:907:2130:: with SMTP id qo16mr33235816ejb.235.1564465520346;
        Mon, 29 Jul 2019 22:45:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1564465520; cv=none;
        d=google.com; s=arc-20160816;
        b=OmjShqbN68dmJPAHizasR9l+rSsoruhA26eYVn5v5Q0PjWYra7SKeyGD6qLp7wD6p/
         VQEXIttEE6FuO7wdcXtdUmw/HO3c4P6FVBbZG7SW9DgZnN4PAjriYe5N7jrhhSq9lsul
         WJFBlFDj1gQ7qa8dfFVN6TrkyCDFgoYDqy9p8lsPeewNjRHDdoWd7Cw+dQteHJ1/68RG
         DJ3N8gWURTgydOpft9SpLstnPqe+RgkXJqJBbPWaEbK5hc3MjsVXQ0sUKSfRnwjp+G2b
         0xdz7nVhrMcXFWzXyxCm+lqDoOH43kEdsoPOkYUGiLWq+teN0moGQF9z9tJRs9WSE453
         oVMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:message-id:date:to:from
         :dkim-signature;
        bh=0c5Fk5uuse8MwbXJXkiQRerY3AzzOY/o674bSmI3StM=;
        b=zN/I+FrOOphANMym1xWU4WSGAOVJAuYkvlSItVjISG27wqvmaGvusfzlLBDY8xOBFk
         ckeGi86i46+DUfRgfLmpJb0vEe8B+zD9QrWrZ73kuFAS1xuCAV/v/lfebVkiKT7MfOfK
         k4yfSN3hM65NP6lRaCRjAusd7Ei/67lfpSbiAmAn87EmXGBbDzO7HR6oHWclMCCCwQlp
         ATh0H5YjK7duugqPkZcTuuD/iy5/LFZV1+jpVpMTZ7MinSkOc//aEOp0h3z6WoLRIpQD
         a3+pog1MW/l5XKB3l+3U+PGWkywy76cVHL9n0UB6gQtph49w4OA9mZr3GcZcE5yOMH+I
         eg2Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=qddvOICz;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id si2si16938735ejb.335.2019.07.29.22.45.20
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 29 Jul 2019 22:45:20 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=qddvOICz;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:58076 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hsKwp-00023p-FG
	for alex.bennee@linaro.org; Tue, 30 Jul 2019 01:45:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49280)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <rashmica.g@gmail.com>) id 1hsKwk-00023T-A9
 for qemu-arm@nongnu.org; Tue, 30 Jul 2019 01:45:15 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <rashmica.g@gmail.com>) id 1hsKwj-0002iM-Ad
 for qemu-arm@nongnu.org; Tue, 30 Jul 2019 01:45:14 -0400
Received: from mail-pl1-x643.google.com ([2607:f8b0:4864:20::643]:39276)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <rashmica.g@gmail.com>)
 id 1hsKwj-0002hp-2f; Tue, 30 Jul 2019 01:45:13 -0400
Received: by mail-pl1-x643.google.com with SMTP id b7so28475381pls.6;
 Mon, 29 Jul 2019 22:45:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=0c5Fk5uuse8MwbXJXkiQRerY3AzzOY/o674bSmI3StM=;
 b=qddvOICzjQlP2YToI0YL4IEWmZdTvJKs+dxCFSEpyvyAnBbo+e9XRpCuS72br/ubQz
 v+Z9PM/eRvh+xJQZpatsV976LpIDYP60yDo7sH6EBwY1ylHZDvXRIl7MItkss9RXgtr1
 ypLIDrK8pLqNLrq6JIw3mgXw8HbQxguEXto8amAK6iaIMBek6xY9Ifk5E6Qvoq9oeBCm
 qkKSv/DEuRe7oQeHMIZU3yqSlOk8ILgJB+c971XX2O51k/UDESlI428RbblItkzXxN8+
 bgTOaVP7+gi59Ia/jbULUOP1J0XoVOD55mR5kQDzlu1pd5xNXoALaeBdLfjldYPVfGSt
 U31Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=0c5Fk5uuse8MwbXJXkiQRerY3AzzOY/o674bSmI3StM=;
 b=aVC/JnTcKWmDoFI5LqF2hLNAz7l9hkcWwBnITv6Keh8IKkfKjPLC8oyM4CgSXpfIOy
 CN9PLoYONxYXAYsN46SIeFIpB1xW4k8qxdXHi1qZcHNI8zblwqhuj2+AKgXC7bx5kplD
 5wF22CYzoPPF2zTqVVLn1EsM6WAAfnqV1IESpdTQSVBZI4SrYbRygaRy5YxeGxlARFSL
 N0qWW8ZXc47oHELbsWYaC4eVNjSER5ZcXX8P/WBpVdYjQYEkzLh4Q3JooW995ZEeTdCE
 qU7bXfaIugzxPx8D+mN8bFZ37zbjKDzzQ7gbiAzgqSdAv8pAIHvytkNX0aLI1uHF/+ga
 uEtg==
X-Gm-Message-State: APjAAAXmu2/1ikBwXOq9AFQd+6+OUQMNaODuzttxa7CpMBHTK6baKgGg
 Sa6v9er8Yw32SU/ci/gsDhU=
X-Received: by 2002:a17:902:d892:: with SMTP id
 b18mr106373896plz.165.1564465511916; 
 Mon, 29 Jul 2019 22:45:11 -0700 (PDT)
Received: from rashmica.ozlabs.ibm.com ([122.99.82.10])
 by smtp.gmail.com with ESMTPSA id 81sm99171221pfx.111.2019.07.29.22.45.08
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 29 Jul 2019 22:45:11 -0700 (PDT)
From: Rashmica Gupta <rashmica.g@gmail.com>
To: peter.maydell@linaro.org
Date: Tue, 30 Jul 2019 15:44:58 +1000
Message-Id: <20190730054501.32727-1-rashmica.g@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::643
Subject: [Qemu-arm] [PATCH v3 0/3] Add Aspeed GPIO controller model
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
Cc: andrew@aj.id.au, qemu-devel@nongnu.org, qemu-arm@nongnu.org, joel@jms.id.au,
 Rashmica Gupta <rashmica.g@gmail.com>, clg@kaod.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 0+outwXKN4x4

There are a couple of things I'm not confident about here:
- what should be in init vs realize?
- should the irq state be in vmstate?
- is there a better way to do composition of classes (patch 3)?

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
 hw/gpio/aspeed_gpio.c         | 1103 +++++++++++++++++++++++++++++++++
 include/hw/arm/aspeed_soc.h   |    3 +
 include/hw/gpio/aspeed_gpio.h |   91 +++
 5 files changed, 1215 insertions(+)
 create mode 100644 hw/gpio/aspeed_gpio.c
 create mode 100644 include/hw/gpio/aspeed_gpio.h

-- 
2.20.1

