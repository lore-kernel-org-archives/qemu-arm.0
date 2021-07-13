Received: by 2002:a19:7b1b:0:0:0:0:0 with SMTP id w27csp307545lfc;
        Tue, 13 Jul 2021 00:02:24 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJymhsTYwbEQCQO7NRoKfLUHIBQh2hcs7FgBO7vg/dONcWePe2va+zWge/TxNBfI8fuNYGoJ
X-Received: by 2002:a67:7d8b:: with SMTP id y133mr4182929vsc.60.1626159744067;
        Tue, 13 Jul 2021 00:02:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1626159744; cv=none;
        d=google.com; s=arc-20160816;
        b=KmEGimjuvV0I0Toxc6bkgbN0VCXZn+DNwRme/eMFdKfYHCYqn0fQPdR94AQ1bRK6aQ
         Q8lZYI8eY/tkvEtVYE+qPMBlaOk26MNk8zfk5HX+IvAjj6Hke/sGaTYFnkKQkV+jmgxr
         IPH1mF7V3zLe0CliDKAtJVhN/DO6cO79j++aZdtHlUxQNdGkyI9kNhnJoEvK+WguW0FG
         yCUFfvXlZcmTrBDfC7ujDJt8klIMB32ZFPjRpQIK/baa87DTx67ivKA8/gDw1jPxE1Vh
         3z/wpoxacmORFNr4As97r3eCmRiC/aDluYcUEh5O9k24M7laoCvKnEN12hhQHcdl1x04
         Ydew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from:dkim-signature;
        bh=cDs3bdfAQMPC9lkUzbAT0OAQiURncrmQf0DNcbcYf7w=;
        b=0r+W+qB5EXwLPxbB+X/IS1r8WJtV7xhysE4+QstaFCQ0Uc6w6aWaCLLy2kPpclE39h
         oF+RlDE0Km86WuFZEN5J618wuW6clV9fxERs/CdEWKhvdyWheuFlmre1SU2B9keaPigh
         HjvbYupZJrBDy7CMcn0+yf9rwW9q/a4Lock1VDwqdHmB6lBOfrm++0oXszbTEN74KRAB
         QaO/yzUzrWaPsYoxUFKjofqLjSG8+GM12n/KVRocrAhMeyVPjxoQJ911g0LESmwA4hLI
         ImtONw3XUX6sjwnaf4RdBpiXUwDDrYljDfADJz+9gXrb937dm6vGFZwtqsglzkaPDt6G
         TszQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b="jqR43t/Z";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id n11si18752697uaa.79.2021.07.13.00.02.23
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 13 Jul 2021 00:02:24 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b="jqR43t/Z";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:54554 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1m3CQw-0000pP-Rl
	for alex.bennee@linaro.org; Tue, 13 Jul 2021 03:02:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53204)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joel.stan@gmail.com>)
 id 1m3CNo-0006l3-ES; Tue, 13 Jul 2021 02:59:10 -0400
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433]:42538)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <joel.stan@gmail.com>)
 id 1m3CNm-0001vP-Ad; Tue, 13 Jul 2021 02:59:08 -0400
Received: by mail-pf1-x433.google.com with SMTP id y4so18665054pfi.9;
 Mon, 12 Jul 2021 23:59:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=cDs3bdfAQMPC9lkUzbAT0OAQiURncrmQf0DNcbcYf7w=;
 b=jqR43t/Z3IQNMI4x2BWgwN/LueCdX3aH6ovQF1gzecGy8bmliVe0+ImMSM1Pn1eBXJ
 gThkccXitAL0SlaFX/MvYtUiJqXvnaApQlResV1VSm16gVxczZ5FoMzMkNp/FqGYBGMD
 jFzIrB0wT3vB6pfsMhG8t7BkTKm5CF6BnpAmVu1hixs4jd9q8EHhRJNATQAadjFOMXEz
 7A1rqGd6MsDZrIVAR555D467gHSf5ujuiqwRF/zjlGbISSogK+jDES1huOWx0Rfhv4Qn
 FM+gmcD1GxjICBt5313YgQQy7qgpDzmdplP/U5PDVyjrEeLwM1/lP1M98plDtZUmRSfd
 3/JQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=cDs3bdfAQMPC9lkUzbAT0OAQiURncrmQf0DNcbcYf7w=;
 b=LEWni2ZZU+jSiiolS+BtyKUYz22wvuk+avU5+mi2ZtsVok7wYXln+ltosAYgEIleVC
 zMCBnDqGcT8OCllibDVnppnX8quQYnicijAhC14ScFfwn8QmFKUnfi5hh3vBpAblmA3U
 iirhKWNWeFzV+21fC5uD4MH3fujk1yAI0ztwaeBQBtZtaV7sKXw5ZAo0JbC6AOGnePel
 V/iPd4EscKL6D1L226R3bOy+o3fssnhMNt7DP2tby3lKAmHY1QN1ZfJunJ/vLrIEGdIc
 ws2pHiURseBTz15RA/heN9//On78RsGD1KmhMvSamaW2LeYpAXmLlbyrvnuPeYavqU7D
 bI5w==
X-Gm-Message-State: AOAM531V6MBs+PurJwg+AgJsG/+A2P27H3w3jujtTJi4IKdUY0t/36k/
 Mu1ThuGI2lIrwm9rMrvkSIM=
X-Received: by 2002:a62:2bc6:0:b029:2e7:a7c2:201 with SMTP id
 r189-20020a622bc60000b02902e7a7c20201mr3231560pfr.64.1626159544320; 
 Mon, 12 Jul 2021 23:59:04 -0700 (PDT)
Received: from localhost.localdomain ([45.124.203.14])
 by smtp.gmail.com with ESMTPSA id o184sm20334846pga.18.2021.07.12.23.59.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Jul 2021 23:59:03 -0700 (PDT)
From: Joel Stanley <joel@jms.id.au>
To: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Subject: [PATCH v2 0/3] hw: aspeed_gpio: MMIO region fix and cleanups
Date: Tue, 13 Jul 2021 16:28:51 +0930
Message-Id: <20210713065854.134634-1-joel@jms.id.au>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::433;
 envelope-from=joel.stan@gmail.com; helo=mail-pf1-x433.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
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
Cc: Andrew Jeffery <andrew@aj.id.au>, Rashmica Gupta <rashmica.g@gmail.com>,
 qemu-arm@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: gKe0qYf80D/r

This fixes the MMIO region so that the rtc works again on the ast2600.
The two patches after that are cleanups.

Joel Stanley (3):
  hw: aspeed_gpio: Fix memory size
  hw: aspeed_gpio: Simplify 1.8V defines
  hw: aspeed_gpio: Clarify GPIO controller name

 hw/gpio/aspeed_gpio.c | 100 +++++++++++++++++++++---------------------
 1 file changed, 49 insertions(+), 51 deletions(-)

-- 
2.32.0

