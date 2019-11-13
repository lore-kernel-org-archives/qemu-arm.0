Received: by 2002:adf:fb8f:0:0:0:0:0 with SMTP id a15csp4667830wrr;
        Wed, 13 Nov 2019 14:13:13 -0800 (PST)
X-Received: by 2002:a62:ae11:: with SMTP id q17mr7129549pff.103.1573683193518;
        Wed, 13 Nov 2019 14:13:13 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1573683193; cv=none;
        d=google.com; s=arc-20160816;
        b=QJQAJoRXa3HLyUfIT9FyWQ9JvcRqcakeODGYaqTWB0aKWRovwHYKLaW/YtaXE8DsKb
         R8OFzcVhPoAvgZxx1Lx6PGnU2fhKaO+QCX2vU+XLDfOJEgvhlT5jIIxwGf/2igt2QZ2s
         Ua6fk+DTyT37qvUQP5pLOUdXiEIyC+h7WFaF0MxwhS/LspZelOwTlUhXVav7a9coyius
         DG0+mtXaHRVxjWN8sjuMqKLVk3RAKFO3NifIYkwNgfAyXgu/hIYk9AsDg+1O4GefKxob
         ZeT0wo9r5hVQD5o2QoTJNz6mO2QnGhX+cQ6OaPbEiZDbRw4ZBmRX/ElgFXeJD/VtI1su
         zFUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:dkim-signature;
        bh=ufOagEkF5eMwDKIkGywA+c2/zP6DlOH3JxK6kKvdjE8=;
        b=u3Must0e4Gc6n/woTuufCFmp9WlSwzqXZX2gL/HbY2GC9M50g0Fk2dKJshuoaBDI1g
         UE6pBXN61s9TZjOe0zdzPCkm1CnpQLyC//n5gaEF1WJOqN6JMMl+BZJ3d5ZPDML9bNYB
         UWCfwu4s5ubuTHI8md3Pfo+ffIruqz/MVoEZ+D6S8/+7Q+UZB9/5Y7A8OCUrVkV030Bc
         aUOv2MPwnmqF6LcxuGNQr25iunc3mMDXAXl/Q79+5/QTHxdmdMPZN3vXN5SQzQ7Fxxto
         MbpUMcL7WSz9ZNMmeEfEplvxDnAJx0pFRbIsjNijRfjCjPpuzk4h/RYIy8/SSxRT9/QM
         YFOA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=CYSnFNi9;
       spf=pass (google.com: domain of joel.stan@gmail.com designates 209.85.220.65 as permitted sender) smtp.mailfrom=joel.stan@gmail.com
Return-Path: <joel.stan@gmail.com>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id 59sor4313166pla.6.2019.11.13.14.13.13
        (Google Transport Security);
        Wed, 13 Nov 2019 14:13:13 -0800 (PST)
Received-SPF: pass (google.com: domain of joel.stan@gmail.com designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=CYSnFNi9;
       spf=pass (google.com: domain of joel.stan@gmail.com designates 209.85.220.65 as permitted sender) smtp.mailfrom=joel.stan@gmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ufOagEkF5eMwDKIkGywA+c2/zP6DlOH3JxK6kKvdjE8=;
        b=CYSnFNi91bJlOKbK/Oh6pt2YKRWLIjBx6Gj1HXL01lyESCT/tnz6bgqaDp5/upyESZ
         FYA4HRSDbg9sEYrXhbQvmKLFghRlhDAHf9P+aE+lEs6UBjGgtE2fTQMTA/C0YpreEuth
         WcysJua/ze6L/9JBV7a5QBV2e+0WhN3eripZ7a1NwVFEFB/+pSlF1bd+8heofmxk7636
         eEO4oo7mh7H86mBognxeasVVNqpXn3ULRQ8Dhu5ZUNPlvupRWQnWMsOoWdFo+lSn8B2y
         zi/RQsOWrO53qjJtVSjfYMwjQXz1m3BtZNDHHhMhOUpcXVobxI9ijJf/suzrlPz9S1CO
         lnRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :mime-version:content-transfer-encoding;
        bh=ufOagEkF5eMwDKIkGywA+c2/zP6DlOH3JxK6kKvdjE8=;
        b=rbTsxPDcljXxRH1AdVfdHCwNNq4SWlOBdTXZpFiS8SjPPsLcnUpdrWZAei2rruZPrt
         xWZNNIZJkeYg4V1S+w8I6AuVDtgfMo6MpxR96gKfcJ7An1+2Na1tZD1rtd25lrJ80Sy/
         Q0CDfcBm9kRaj+tQegNaKkQ4IRrIgSBKCXcH78fkLHFljG8G7x6ab/5yxdeqSzum1+By
         kHozzTTBNnzv5k2jwcOMY7a7xgCdZG0jzj0/geHGRWqEnednnUAev8XDzIHYX/xStx7Z
         ly44aLMwzEwfRPCCc8O5uqQKm9eZs6+dC6jOC1KXcyzFg0rTeG6M3DTDa69AfPRo7lL2
         ayYw==
X-Gm-Message-State: APjAAAUEtWzuDszegl/jQeEOpFvP2uiRFyZtRNbc51ufmXhoF4XpIS8l
	+68P5YHTL8z4aaaIJDO8a/fgaaH5AwE=
X-Google-Smtp-Source: APXvYqz2DQ5LizG9g65X9Em+nEhcxKPI+Te+nQPxr2SxI8WMKsHrdvy3UBFsT+sdogErrdyWLjw1dg==
X-Received: by 2002:a17:902:9683:: with SMTP id n3mr5933541plp.53.1573683192123;
        Wed, 13 Nov 2019 14:13:12 -0800 (PST)
Return-Path: <joel.stan@gmail.com>
Received: from voyager.lan ([45.124.203.14])
        by smtp.gmail.com with ESMTPSA id w69sm5252005pfc.164.2019.11.13.14.13.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Nov 2019 14:13:11 -0800 (PST)
Sender: "joel.stan@gmail.com" <joel.stan@gmail.com>
From: Joel Stanley <joel@jms.id.au>
To: Peter Maydell <peter.maydell@linaro.org>,
	=?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Cc: Andrew Jeffery <andrew@aj.id.au>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH v3 0/4] arm/aspeed: Watchdog and SDRAM fixes
Date: Thu, 14 Nov 2019 08:42:57 +1030
Message-Id: <20191113221301.8768-1-joel@jms.id.au>
X-Mailer: git-send-email 2.24.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: MwR04AC3fCEu

Three of these are fixes for ast2600 models that I found when testing
master. The forth is a usability improvement that is helpful when
diagnosing why a watchdog is biting.

v3 adds some comments and fixes whitespace, and r-b from Alex. Thanks
for the review Alex.

v2 fixes some review comments from Cédric and adds his r-b.

Joel Stanley (4):
  aspeed/sdmc: Make ast2600 default 1G
  aspeed/scu: Fix W1C behavior
  watchdog/aspeed: Improve watchdog timeout message
  watchdog/aspeed: Fix AST2600 frequency behaviour

 hw/misc/aspeed_scu.c             | 15 +++++++++++----
 hw/misc/aspeed_sdmc.c            |  6 +++---
 hw/watchdog/wdt_aspeed.c         | 24 +++++++++++++++++++-----
 include/hw/watchdog/wdt_aspeed.h |  1 +
 4 files changed, 34 insertions(+), 12 deletions(-)

-- 
2.24.0
