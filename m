Received: by 2002:a05:6512:3aa:0:0:0:0 with SMTP id v10csp6437863lfp;
        Tue, 18 Feb 2020 11:12:19 -0800 (PST)
X-Google-Smtp-Source: APXvYqxJC8HTCeVgLyJhQ6mirTQ22U7F+HY6fyXChKSiMHyb50XWAkjQ9xwkLEH8260GTjgKqJZc
X-Received: by 2002:a0c:f910:: with SMTP id v16mr18158587qvn.108.1582053138992;
        Tue, 18 Feb 2020 11:12:18 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1582053138; cv=none;
        d=google.com; s=arc-20160816;
        b=BgEKWDFCLYjPKvJqQKWJgZvFNifXAnAo5Wn9ePbrTybqq4HnQkAe4DkGrcnXPnP88R
         rjm0eDIiga5mq3BU2jz/IcP7mCEyrhuU9dro4BVyFFJEMVjnvT6sEp5PmHh6vjCSmGHK
         /0URpndLYcPWBCcFs2QSPb+MXorWHEcioWlYh9uIhF8o5yLr9CYrP0KLwr4Fgveq+z77
         dc6olkUrjQYj/asHUvPBeVxx6l7KXHAdN5FP+xaDc4s5iDMbsDyHVFhjL3/gGH6TRq8M
         UEL5czdQRHvh58rOHWb1+ygbpWS4Rul3Kq1sk3s9IKXWAKPFnS0mnGQ+zToZoSzA0Z5+
         dunw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from:dkim-signature;
        bh=hM3BmODxHsfSDsqzi/dhi4yKt4/pOP8vyrMHfxPPoU8=;
        b=H2CDDLxRdxic1cgHK5gTMiupsEQEwhdLZadLx0JcDzdqZrNG77VQOAMLs2ZDWzifi/
         bqpNG2MSmn42K+PLbRCigMJdbNXCPn8ONCciwmeC7I1orq4e3QeTRUimVx8XwW8HHs/V
         NGKoJ/vNYlGvALqvIWFe1THlR8HRiQLJx/vVrLDL7bNLuvvSP45Fke54HiQuJaDCt/0K
         87Akq7tgOKKb+gOJzHdy0g7L0J3C6AYnLS8QzhyWx+pCIKBbFIhyVHV00Gk7kkd0G3M5
         UQT/rosTrCGjE2ySw/QChtYcbkplzkykQLPhHGuVSQepIK49MtOWwdIcxkCU4A4f9bRn
         9HHg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=IMBlvJvT;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u27si2222425qtb.355.2020.02.18.11.12.18
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 18 Feb 2020 11:12:18 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=IMBlvJvT;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:40504 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1j48I5-0007n0-AX
	for alex.bennee@linaro.org; Tue, 18 Feb 2020 14:12:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46542)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1j48Fv-0004pc-No
 for qemu-arm@nongnu.org; Tue, 18 Feb 2020 14:10:04 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1j48Fu-0001hc-Fl
 for qemu-arm@nongnu.org; Tue, 18 Feb 2020 14:10:03 -0500
Received: from mail-pj1-x1044.google.com ([2607:f8b0:4864:20::1044]:52793)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1j48Fu-0001fv-83
 for qemu-arm@nongnu.org; Tue, 18 Feb 2020 14:10:02 -0500
Received: by mail-pj1-x1044.google.com with SMTP id ep11so1443137pjb.2
 for <qemu-arm@nongnu.org>; Tue, 18 Feb 2020 11:10:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=hM3BmODxHsfSDsqzi/dhi4yKt4/pOP8vyrMHfxPPoU8=;
 b=IMBlvJvTdEw1le/3ggdyZaL/x4azzyTn9ALiuudKi/gYoDduoPBbtbgN0FTMOgO1j8
 qVHFGBwbMq3b4Rjrb2l5g9rTthaiXLYucS6ZH6XlZmYwpmB4Q8WKlDdXauqVl8fWQwpK
 zFdeJintzrAHSRklojRfLwFZWLU32CwF5usFIZ8WrhmFKSS9SqcrmQVzfyOXZFhIALff
 mkEU4zCbV2Lu0xPZwhu9AYL7KB2OP0UJimvuwmi2ZCNGv+UzmlHFYT58sSFolgyILC7d
 8fWWsl7FETkgJ/L5COdZOHId4kR95hk4l/Klh9d/BBCsSs7GDoB952t1RvzzPE7Mw2EX
 j5eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=hM3BmODxHsfSDsqzi/dhi4yKt4/pOP8vyrMHfxPPoU8=;
 b=mtpvF+dZ91lSN/tR0ugOoVholZO98wJMplEM04WMsjNcWLKAnJU8+ZDXcX2+HVSJEv
 cTa4WHwmt2bjnSz8pE74kEp22KnbL33mfiQV7kYlXq5j4xt9q3YdkyckXKIVtenW1OCs
 iPWW4T5m4487h+ErUhZ+o6fG0etEv3Wqc/oXP4+c/XJjPAx/dag4L8QlDHEB5mK4nN3L
 zv6iV2zCOhm1T4J17XrVgx/wnobf8POWYUqS7Pvdp0Uc1B6pjvPGK7iE0JyyCM3cFyjC
 JG73W6XnU9bj8tXn0TP58Q9SI1oPb6uD0z0mV/5xGzvPyD26oNI/nLaAdXhsFNj718QY
 FLag==
X-Gm-Message-State: APjAAAW6/VqXOZ1IVcTH+XN8i+N/v9y/G0rQa+ML+lJkTAKdGV8XheMC
 y5DDyk9HU3CKvlRlxI66p0cQJPhr+N8=
X-Received: by 2002:a17:902:204:: with SMTP id
 4mr22688063plc.266.1582053000912; 
 Tue, 18 Feb 2020 11:10:00 -0800 (PST)
Received: from localhost.localdomain (97-126-123-70.tukw.qwest.net.
 [97.126.123.70])
 by smtp.gmail.com with ESMTPSA id i68sm5139399pfe.173.2020.02.18.11.09.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Feb 2020 11:10:00 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 0/7] target/arm: Honor more HCR_EL2 traps
Date: Tue, 18 Feb 2020 11:09:51 -0800
Message-Id: <20200218190958.745-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::1044
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
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: hSjkwmLTVP9N

Based-on: 20200214175116.9164-1-peter.maydell@linaro.org
("arm: ARMv8.1- and v8.4-PMU, ID reg cleanup, [H]ACTLR2")

Patch 1 is a latent error that I noticed while reviewing
Peter's patch set.

Patches 2 and 3 have already appeared separately on list,
with patch 2 bearing a v2.  Thus this patch set is labeled v3.

Patch 4 is dependant on Peter's [H]ACTLR2 fix, and the reason
for the Based-on tag.


r~


Richard Henderson (7):
  target/arm: Set ID_MMFR4.HPDS for aarch64_max_initfn
  target/arm: Honor the HCR_EL2.{TVM,TRVM} bits
  target/arm: Honor the HCR_EL2.TSW bit
  target/arm: Honor the HCR_EL2.TACR bit
  target/arm: Honor the HCR_EL2.TPCP bit
  target/arm: Honor the HCR_EL2.TPU bit
  target/arm: Honor the HCR_EL2.TTLB bit

 target/arm/cpu64.c  |   1 +
 target/arm/helper.c | 284 ++++++++++++++++++++++++++++++--------------
 2 files changed, 196 insertions(+), 89 deletions(-)

-- 
2.20.1

