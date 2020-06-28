Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp2441225lfm;
        Sun, 28 Jun 2020 14:42:46 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwoSgSYEsXeL6+nV840+Hofobmbr4CaUpbZ28N2rzv7gJYcoYH1N6HomZy3ONS1u5k7cHBy
X-Received: by 2002:a5b:90d:: with SMTP id a13mr22165046ybq.336.1593380566427;
        Sun, 28 Jun 2020 14:42:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1593380566; cv=none;
        d=google.com; s=arc-20160816;
        b=hSJGsSuoa+Rbn7BSkM0a3QL64OF9WrKyFBK4bhfFPcVgsSiPdU4kMOk4ZBTni/7i73
         4DV3C9BbI3/z1egcfwkKeIeqs14VPlzxYTJ7lxiDQ+wwkRj+efsBKm5oPyDtwxkkp8x8
         DNybfe3EsM3kuMzcy+lAf7NPchmrWFbsZpL3pYEnt+9Nw6P2B4WbsWpoKsPbfUjZD8YF
         8iF+N8MWJEUAyl7+cpMFBRIRnCkN7rgYQ33AKlgVQi5zVK1SVox16j8GrbZJkfthP+B6
         0xtfPptBmUJyfKm8v0H1KZnpzZT8McZRbEpaIRVgWs48i9Tw+MVTOPCeZt2ljJXpI3HT
         MGbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from:dkim-signature;
        bh=0L5wQryvAxZg2uQOIJc+wY6esS/MPxiWmAjOVxgL35o=;
        b=DeFtc+Ra+iaEpn0hhcwCJqvdO1dp6+MkIAH0TOtgOHUY4COP6fyQswo7z7zIM0WvTv
         tHS+0+ZnA8KYA/RulMIC58c16Abp0/62TsMMaiXX6uWSKGPEssIBZf0r9ouSz38w8OTg
         t7j5jrNv8MeymMZLcXamls0tMcNdeoqdl8aq/Q1drnPoVfYJ1+7O+jCiw7lBNeT2K49H
         9Nfa3aCk0k3l2mbNtYmPknoCi8Mw84seTqOqfORRuYRZYFfsUQaAphvAfGo7HQOPcDHP
         9wsgFSe99wTk12CgCZDjO86VZ5e1NTNxIowLEqPcYym5QKVru7emgutmEq3PeRq8gwD+
         WVFQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=VdGIgsvZ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c16si7235065ybq.491.2020.06.28.14.42.46
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 28 Jun 2020 14:42:46 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=VdGIgsvZ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:58258 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jpf4X-0008Du-NM
	for alex.bennee@linaro.org; Sun, 28 Jun 2020 17:42:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57728)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jpf4O-0008De-FH
 for qemu-arm@nongnu.org; Sun, 28 Jun 2020 17:42:36 -0400
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442]:40323)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jpf4M-000728-In
 for qemu-arm@nongnu.org; Sun, 28 Jun 2020 17:42:36 -0400
Received: by mail-wr1-x442.google.com with SMTP id h5so14648789wrc.7
 for <qemu-arm@nongnu.org>; Sun, 28 Jun 2020 14:42:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=0L5wQryvAxZg2uQOIJc+wY6esS/MPxiWmAjOVxgL35o=;
 b=VdGIgsvZYEvdI6unwaENYbt63e2u2rDQs9AQP4C8wCtXuc9jPhE1KEidMfb7tGsJsV
 cdY6pMoU1Q1WsDyVXnJUGiuj+lRhlDUW8C/C7u7ZjiY1jez/naScgBn+gWxqYYEfOUDp
 PULu9t8zZajuRG+KMdTcyF2TW9uiKLOgOnh7RE9acXp04bcCvAB2P/UDnmziDcodMpC4
 xXsgm/WA+A1rhJKFrXzj3KqMxQ6ZChnTgycWlGQLgoA5DQG3vDFUZcWjENo2vxE0aN5I
 jHQ2cMhJAxkgD+SKEvtXIkUS5ingtloY9KfKLuwOk+919/14SRDH0loP42HCx2gcbOka
 WtAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=0L5wQryvAxZg2uQOIJc+wY6esS/MPxiWmAjOVxgL35o=;
 b=L3xc7b8AwfkVMhfMFidLbnu8OEqfJghwOPBb6F2d3bctnNC5a5elcIT/orJbpfNMz0
 zdhBHdvOhn+cF/QELyK7C68mW7hQoZt4X2r8h/gOdLK3AFJBZPae2MY0zIW66Tq4fFxg
 Kj2VoTkQ/v6t4OC8nMlLgDUBl1zFRYOxSCKVBr82B+WCKb7BW7evZOulFXsjkRLcnSCm
 Ek9JLAThEEEJcL4b8ifFK3vzyw5WnGGLGCiLsIaA8DMbKm7G9iWXywPxNcgmRks3nBMi
 q4U+uTJLWBF/AgYtT9vffYzG7kYETJMDe5Wjugan9+vC4/gRdi4HqeWxM5SYE/hp+bdH
 vcsw==
X-Gm-Message-State: AOAM5324gVITC9d9AEzStBFPE3Savw3UQu09wpuFe7z0PKmXhpbZpPfQ
 vlzCvfE6BNYlA7hcMgVnh9j8cz+rhcOYIw==
X-Received: by 2002:adf:f984:: with SMTP id f4mr14088274wrr.221.1593380552472; 
 Sun, 28 Jun 2020 14:42:32 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id t16sm26300948wru.9.2020.06.28.14.42.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 28 Jun 2020 14:42:31 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 0/2] hw/arm/palm.c: Fix Coverity issue CID 1421944
Date: Sun, 28 Jun 2020 22:42:28 +0100
Message-Id: <20200628214230.2592-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::442;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x442.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: Andrzej Zaborowski <balrogg@gmail.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: +L9z9ANzPD8d

As for spitz and tosa, fix the Coverity issue CID 1421944 which
points out that memory returned from qemu_allocate_irqs() is leaked
by encapsulating the GPIO handling into a simple device.
As with the other series, detabify the file first.

thanks
-- PMM

Peter Maydell (2):
  hw/arm/palm.c: Detabify
  hw/arm/palm.c: Encapsulate misc GPIO handling in a device

 hw/arm/palm.c | 111 ++++++++++++++++++++++++++++++++++----------------
 1 file changed, 77 insertions(+), 34 deletions(-)

-- 
2.20.1

