Received: by 2002:ac2:4c26:0:0:0:0:0 with SMTP id u6csp3751798lfq;
        Mon, 21 Sep 2020 00:56:59 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzhbsJPlUabDZzKp0SyuZZvg2BHf8DOpRngUpY0sXyh0Z7RH1WD6aByNyjO487jG+y0it7y
X-Received: by 2002:a25:2413:: with SMTP id k19mr23439523ybk.362.1600675019092;
        Mon, 21 Sep 2020 00:56:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1600675019; cv=none;
        d=google.com; s=arc-20160816;
        b=CttrE7QoGqwu6S8Djw3b45mk0zZhaycno1WbsExkws5amUm0TDaWo6S+BgjgFoGchF
         RZAhLMiZ4VelFPXV3iaYR3+qINwZxL8SwU6VjN9gc2918gfgzeitRoKbbJ95bqRHSXRk
         lLhPTGdHbB1Ny5tYgdPlAYU9kLVjfDpMlD5MwfOEdZetaVBl4CcsZQ5GGKX03bDmaS2z
         ERWSqb2TbeQLsmCXn+tUUw5uQHZTHjkh6FpmmTblRZWxYp7uALAR5YyNmaobgIZjoUfi
         tQJ0+NtvmrpHeIpgnmMqP0bXr3U3FvGPg/jrRK8vcio17Mkz4GxWfxWQRLAAFHfb7mdM
         C1dQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from:dkim-signature;
        bh=VMvA0Z0WfDzdBI45eX0ZzpLNjmr5IxT8BujbQ8SXxhI=;
        b=IqvZ10Xpq+zgPjn0XNVMsVbJ3CkMX1GyyGnNKN1C5kVu7fC30fjd/Yf2v87+rXH18H
         9zM3l+ehsf3qUApYtIboKau4sjQKBH6c3L6x2Ig565un2yLwcEJQ5l+MDMlB+vMYH7z2
         TEOFLMaSb8taOD93NS/IB3Cm1PjeTrmZYuOSN27N4CTLC76RTUkb3TITRCPJ6M1kQgg9
         zZH0clkCpLWJeX8gN0/y56SDXWCs/dlRvIO3Gj9dryrBsayXpnv3uluE75LVspxeoah9
         HKwmPaSb5hrf0E+EwwWYN5Pq66IWBTyX3OHyfGZ02vLKacabTABXe1xep30Nq4UQVMMC
         44bw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b="J5JfV/Ja";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id n1si13225951ybk.306.2020.09.21.00.56.58
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 21 Sep 2020 00:56:59 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b="J5JfV/Ja";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Received: from localhost ([::1]:48592 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kKGh0-0004UG-FU
	for alex.bennee@linaro.org; Mon, 21 Sep 2020 03:56:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41956)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kKGgc-0004Sx-TN; Mon, 21 Sep 2020 03:56:34 -0400
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343]:33686)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kKGgb-0005tW-69; Mon, 21 Sep 2020 03:56:34 -0400
Received: by mail-wm1-x343.google.com with SMTP id e11so10923968wme.0;
 Mon, 21 Sep 2020 00:56:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=VMvA0Z0WfDzdBI45eX0ZzpLNjmr5IxT8BujbQ8SXxhI=;
 b=J5JfV/JaXC4SsrYBzKXwvFG7cInVGr98n0rnLpB1/uPa4UvPW4CcxyTtmHN0tOwLdP
 mjpOT5LjNr7EuNg4eYpf1UsncAQ1Kkr+Opl7Zuzwk1+/7qHp51tpdjDUIn99ka3Nmt0o
 64Q/wEM3g07LxkJBH6vs6RY3EIjcUSAYwjgjeLT0S0oD4ElgMsMDOICvZdPgBZgg43Mx
 +Xnz6lIeeSAnVU6CYYXCDbhKFfzmo8PPxg8Dvh76ykgj/8QXzRtElNRCtuCV1yF4wOce
 Gou0NRNX3CuH04L1Vql2kcJ/P9/9QqWXdtUO0NfVLqhF8jyiqrNcyNtL9vOzkrMDimXK
 XzcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=VMvA0Z0WfDzdBI45eX0ZzpLNjmr5IxT8BujbQ8SXxhI=;
 b=YyuyVX3l2DzRvZojWftd8pUUegf+fBm1Txhg2GM84sTHtevaDjNOBkuG7/WmrpJvq0
 1/c8uGhaIqp5qjuigH6OrMpimWATQhTMugmp2Gh3GjMPJ9Ab1TsfTQ+iyWNL5dJTHnfa
 mtdIdGEXQ2JmUojbXJ6m3aIengZoHB2P1QbmLv0g8TC2a+RWj2oY8YJe1n5uxcjzI63Q
 E7PgUGqyQKqdfUNt0+lca2Blz3drjhlalwiVtEYY2NIGUImLbVSTn0EQpwQXnzHpJQ0d
 /Nyo7qt0ZxiZKxHddZaO34Pmrg+7igBroSgFM8nmAtbU14CdzBy766D3MMZ2fEjDF9qi
 qzQA==
X-Gm-Message-State: AOAM532T54UAC8sw/GzIQhJ/5u7jphWjT4ADoB0mxbxz7YAju3Mb79PK
 JfhelxCRH+tCVPrDziwH30tnNZZ+jqI=
X-Received: by 2002:a05:600c:2159:: with SMTP id
 v25mr30653666wml.180.1600674990479; 
 Mon, 21 Sep 2020 00:56:30 -0700 (PDT)
Received: from localhost.localdomain (65.red-83-57-170.dynamicip.rima-tde.net.
 [83.57.170.65])
 by smtp.gmail.com with ESMTPSA id o15sm17807538wmh.29.2020.09.21.00.56.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Sep 2020 00:56:29 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 0/8] hw/arm/raspi: QOM housekeeping to be able to add more
 machines
Date: Mon, 21 Sep 2020 09:56:20 +0200
Message-Id: <20200921075628.466506-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::343;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x343.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Andrew Baumann <Andrew.Baumann@microsoft.com>,
 Paul Zimmerman <pauldzim@gmail.com>, qemu-arm@nongnu.org,
 Luc Michel <luc.michel@greensocs.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: HGnvjK/EQG/J

Machine-specific patches extracted from v2 [*] and rebased.

Housekeeping the QOM model to easily add more machines.

Patches missing review: 1-3,7.

[*] https://www.mail-archive.com/qemu-devel@nongnu.org/msg680135.html

Based-on: <20200921035257.434532-1-f4bug@amsat.org>

Philippe Mathieu-Daudé (8):
  hw/arm/raspi: Display the board revision in the machine description
  hw/arm/raspi: Load the firmware on the first core
  hw/arm/raspi: Move arm_boot_info structure to RaspiMachineState
  hw/arm/raspi: Avoid using TypeInfo::class_data pointer
  hw/arm/raspi: Use more specific machine names
  hw/arm/raspi: Introduce RaspiProcessorId enum
  hw/arm/raspi: Use RaspiProcessorId to set the firmware load address
  hw/arm/raspi: Remove use of the 'version' value in the board code

 hw/arm/raspi.c | 152 +++++++++++++++++++++++++++----------------------
 1 file changed, 83 insertions(+), 69 deletions(-)

-- 
2.26.2

