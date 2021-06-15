Received: by 2002:a19:f807:0:0:0:0:0 with SMTP id a7csp3253278lff;
        Tue, 15 Jun 2021 12:29:16 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwZhPGYGajzuBNHZlx0vkBMmJ94hRG5E6QSA0IssxIS33/RlfR5yIPomPLB9G1ZT+HPHY7k
X-Received: by 2002:a17:906:6d95:: with SMTP id h21mr1273388ejt.260.1623785356166;
        Tue, 15 Jun 2021 12:29:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1623785356; cv=none;
        d=google.com; s=arc-20160816;
        b=El7oy7WFmk3dTO2h09iGEMyCjCf1BbTu0nUj5I4j+0TBniwbvXRq7ypZ6Se6IXQ1tU
         gEtYNDpWax5vpDu4aXkdO7Xwui9cbYIODLNlbko93gMXIFjZiHGciSLuX4TpIAMjfd55
         xyJb4kg2QPKLofRUm8YziqcHJS5PMdqozsQK59fYF7MLjFZSwqTYy3kon0fnn1FyR3lU
         W012gNcazBucWbnexWEA5TSR4zqZWgidpPi1GPdM1Au5rdHQBm4c3IRT5tp2YTx2EMi3
         jRZ40BTu0uXc+un/kmnXldfk0kRKegz9WTAg4SLEvYyTHu+CECdemM22UgT6ck1a9AwE
         YOUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:from:subject:references
         :mime-version:message-id:in-reply-to:date:dkim-signature;
        bh=VjHcyKz7IcO3+lfizDLewpT9r55V7U5GRVD9+yON5LY=;
        b=qSwC+a1ZUrbZvk63lprtFimXzP+CY88Bg+sCFpGAqnWEZGQaWnDlpCnJo/iQ/Bb6oy
         JjceI2v+nim42C7S9uY5i4/0AXQUhtyupqOx0HHGSBA0fuTTI8eIvqv5hewsIa/tSsLe
         pB5PyDBlK5HMCPSM9cAyl8nh8RkUOiZFEbQqIXGgKc6/cLrzSVUCUvktiChmA/4BelJs
         fsI/YxZF4qDoMkpsv/NYXnOzJ7RMvO53OgOOc/EBs37RhXBQPAFfRSIRvGaJO2YPDCOl
         ilc2ZsLdhfTwEO+tuMoqkEgdoi7gTXis5Ei14+ixMfk05XA08nNgRWThiRQDrR2Mnkry
         7QKw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20161025 header.b=VWauZ7EM;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id n20si15435374ejl.414.2021.06.15.12.29.16
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 15 Jun 2021 12:29:16 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20161025 header.b=VWauZ7EM;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Received: from localhost ([::1]:56094 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ltEkN-00036Y-7n
	for alex.bennee@linaro.org; Tue, 15 Jun 2021 15:29:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43334)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3ff_IYAcKCKwhQZfgdQSaaSXQ.OaYcQYg-MdYZaZSZg.adS@flex--venture.bounces.google.com>)
 id 1ltEkC-00032u-I8
 for qemu-arm@nongnu.org; Tue, 15 Jun 2021 15:29:04 -0400
Received: from mail-yb1-xb49.google.com ([2607:f8b0:4864:20::b49]:39872)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3ff_IYAcKCKwhQZfgdQSaaSXQ.OaYcQYg-MdYZaZSZg.adS@flex--venture.bounces.google.com>)
 id 1ltEkB-0003Ls-1p
 for qemu-arm@nongnu.org; Tue, 15 Jun 2021 15:29:04 -0400
Received: by mail-yb1-xb49.google.com with SMTP id
 r5-20020a2582850000b02905381b1b616eso21610077ybk.6
 for <qemu-arm@nongnu.org>; Tue, 15 Jun 2021 12:29:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:in-reply-to:message-id:mime-version:references:subject:from:to
 :cc; bh=VjHcyKz7IcO3+lfizDLewpT9r55V7U5GRVD9+yON5LY=;
 b=VWauZ7EMD4kRAFF6ZqEqU1kW4RSoOabFdnPU0fuZQzo6QVYvVouH2T+b5eGwn6KWj6
 NVrurf3kH02NvXx6padWFvWEj0Mf2kqlX9T0MyXIJIXtsI6ULdluq3p5cxlgO0Bq2jXF
 /5OZBNWTWvS+aF9MlnWE74pttUOK8++M592PD8an0vVdxJrIfP9TdVA48MfV5ul063s6
 9kh0wdc0UT1eTnhJOWMISJR4yxWgsRje5bVii7OJPYPWz576dR82airB3a9O6v+tqYoj
 1XftV+sDmQr2c4/4PpsbdQ2oai9MojcvITF/y3Do0i1amONK2Xn9bAhmEWE3RxeUdCkJ
 GVaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=VjHcyKz7IcO3+lfizDLewpT9r55V7U5GRVD9+yON5LY=;
 b=eBtr/kUqzCS+IYU43qFhLIocSBHJa3MpzY7WKQp7Qq6H49ScHFh6u+1KGh9EJ/fxlv
 TKepu6LJ6J3vHwtHD40Cxx8A4i39WJi0QaTkJabGjFLzvnP1AcY36b5OTJB0NJjIo2EA
 NrVsfFqWFNsTejdvWhdVJgS8gjOpEe/0umL4qgzBWYzVU8NoUtoiYuZdUDksO6SlgCXf
 pcI81IVV3roxQz0NaJKEMwDQzKh0vismPDoNRfciBb2ZjrLSxyzFfFBJteA13XOBKLbC
 ieRB2nZwPWv69eFBswCCAYti8UY7IVRnr7etg8vqWm89tc8gToTk0GPWRDe9hZf8iURY
 PF7A==
X-Gm-Message-State: AOAM532KY9Ny6k3gJqt48JuK7WabernxMFsVYVUYJ5Q5Te/KaBBLb/Un
 KZP0kWX6d0tu+FD215s+Xm/i5h52v1zp
X-Received: from venture.svl.corp.google.com
 ([2620:15c:2a3:200:abe8:110a:b827:ef39])
 (user=venture job=sendgmr) by 2002:a25:d913:: with SMTP id
 q19mr980039ybg.397.1623785341225; Tue, 15 Jun 2021 12:29:01 -0700 (PDT)
Date: Tue, 15 Jun 2021 12:28:47 -0700
In-Reply-To: <20210615192848.1065297-1-venture@google.com>
Message-Id: <20210615192848.1065297-2-venture@google.com>
Mime-Version: 1.0
References: <20210615192848.1065297-1-venture@google.com>
X-Mailer: git-send-email 2.32.0.272.g935e593368-goog
Subject: [PATCH 1/2] docs/system/arm: Add quanta-q7l1-bmc reference
From: Patrick Venture <venture@google.com>
To: hskinnemoen@google.com, kfting@nuvoton.com, peter.maydell@linaro.org, 
 clg@kaod.org, andrew@aj.id.au, joel@jms.id.au
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, 
 Patrick Venture <venture@google.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b49;
 envelope-from=3ff_IYAcKCKwhQZfgdQSaaSXQ.OaYcQYg-MdYZaZSZg.adS@flex--venture.bounces.google.com;
 helo=mail-yb1-xb49.google.com
X-Spam_score_int: -95
X-Spam_score: -9.6
X-Spam_bar: ---------
X-Spam_report: (-9.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 USER_IN_DEF_DKIM_WL=-7.5 autolearn=ham autolearn_force=no
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 2FeI5hCCvrf5

Adds a line-item reference to the supported quanta-q71l-bmc aspeed
entry.

Signed-off-by: Patrick Venture <venture@google.com>
---
 docs/system/arm/aspeed.rst | 1 +
 1 file changed, 1 insertion(+)

diff --git a/docs/system/arm/aspeed.rst b/docs/system/arm/aspeed.rst
index 57ee2bd94f..cec87e3743 100644
--- a/docs/system/arm/aspeed.rst
+++ b/docs/system/arm/aspeed.rst
@@ -13,6 +13,7 @@ etc.
 AST2400 SoC based machines :
 
 - ``palmetto-bmc``         OpenPOWER Palmetto POWER8 BMC
+- ``quanta-q71l-bmc``      OpenBMC Quanta BMC
 
 AST2500 SoC based machines :
 
-- 
2.32.0.272.g935e593368-goog

