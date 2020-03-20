Received: by 2002:a19:5509:0:0:0:0:0 with SMTP id n9csp1065521lfe;
        Fri, 20 Mar 2020 09:06:38 -0700 (PDT)
X-Google-Smtp-Source: ADFU+vu5Qo/G9dkAJdCoUqvXGMtdVNTVqe332RqcNqfem2xjNz4jiTUbA6xRR8c0OJD9GklLkm8/
X-Received: by 2002:ac8:7b26:: with SMTP id l6mr8923646qtu.64.1584720398641;
        Fri, 20 Mar 2020 09:06:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1584720398; cv=none;
        d=google.com; s=arc-20160816;
        b=XhY9o40+nBr/hWCSle2HBMNalxqjEA3kwcE9z0GuvywZ8Le8UmXkKkHMAjUJP8D03F
         WVbbNMyorV5cDNZYwVyxR0eE7hs/Ll9GKiLFGCjWq2P3AUL+6CcP1m+fCop7ct2qivvT
         ut5jYFCgJkkUhNxyrBc587AQ+i5onYMb1brTnYGkjhmeAWayCd0Ffarq83wEAEtQhZ4q
         8bFkeWTklGJIe+bXQsAhY3rlqQSZyccpKk6To6nIuhvlG+/RLUHQs9WZWYSiG1mhPqdh
         KbQAa4ZAB1SH023V6Ts1BskEizdbjKOP20Q1E53goyj/ltQEiqTAJzNeEgOsWVOKn3nq
         uyKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from:dkim-signature;
        bh=2qwsnnZRpJ70PFD94LRZPv0e2iao9t6qg05HQ61q8lY=;
        b=n3uyretdTrLO+2Xwi2rx0qywM6qSUZBAKfJzLgEvk36rjdT9BHbLbrTp6fWF9D/561
         5jGZUKIrmiB0j1KufAcTeY4mft3w/BwG/uLrKQtBugyiLzK5JvmnVumgZvd3nfCC0w2T
         9PZt/RVIyPWQnXc3KejxqGzlJ4o+HECNGLAjajRch5dVYDkSkGGgoMce14RYtzCkunEL
         9bR4rgRILtGaINzF3WLAnG71dcM0gZXwk2BQyZtLQQbeu7MNOuOgxpCYQ7fHf4GOgMdP
         92iE7bipiWTcRTAdvdYZMJRPuKmScN0/4nD93b9au4t684GuwEB9aVxFGntRo4OhmmHX
         q0Rw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=dDXroowW;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d11si3560660qtq.196.2020.03.20.09.06.38
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 20 Mar 2020 09:06:38 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=dDXroowW;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:55254 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jFKAQ-0001xm-0c
	for alex.bennee@linaro.org; Fri, 20 Mar 2020 12:06:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39772)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1jFKAF-0001v6-7b
 for qemu-arm@nongnu.org; Fri, 20 Mar 2020 12:06:28 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1jFKAE-0001ZR-2z
 for qemu-arm@nongnu.org; Fri, 20 Mar 2020 12:06:26 -0400
Received: from mail-pj1-x1043.google.com ([2607:f8b0:4864:20::1043]:33468)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1jFKAD-0001Yk-MS
 for qemu-arm@nongnu.org; Fri, 20 Mar 2020 12:06:26 -0400
Received: by mail-pj1-x1043.google.com with SMTP id dw20so3595060pjb.0
 for <qemu-arm@nongnu.org>; Fri, 20 Mar 2020 09:06:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=2qwsnnZRpJ70PFD94LRZPv0e2iao9t6qg05HQ61q8lY=;
 b=dDXroowWhGQLETvjZrBc6u3bap48GxzC51fp3jfrj4ni74n88qYIfxuBiOJeZdQ30o
 eO2YyqyxY41CTuNeYxCNct4WDopcQh3rFBnfeih/rAOjzl6IesUYiJ5uNOqI6CbuM2uR
 5hRjQpfOVqZe9+ShHX65evIfxTZU+yneEnT2SAB9d5w88q1ZkLIvqYvFd7y1Kamci9Gg
 4+EXR+K044pOxlEjFsoxdoAOKkgtJx4Fo4bbpV0waYWhcybdgV6yJS1mp6uY885Knkmw
 J22/tUo/cw983UIqzT99HtmUs+BMW++SNEdgbKqodPrXScY+czq+hcf08tjsC7fQRVgQ
 LcnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=2qwsnnZRpJ70PFD94LRZPv0e2iao9t6qg05HQ61q8lY=;
 b=sYr6iKkKxjV78wfABkOnoX8ZXGCrACur/GHlYTrxuf1LDVh5OuEB8O6Go3KiIBbwTp
 oUhRAaeX3grEDhJ8VPX0dBMwqNiV5///QZCMQzc/r4CQLD7TBECl30JYoD3HDXWQUNP/
 8+roRj6EJXXw156fW8S2naUoSPwsiGC8Z7chcEZHphG0fpywEMPDLhdunG2rRMEgdONH
 /tkuXtftdjYWN8htdkzDLEcwhtEgNygO19Yku+Kp+tFneO+y4VbuJJyA068VnpmmsQEP
 ONmA83Cju7k8WKLqtP8oYVnMVAuumtOQpObmOGuiKZfR+2K1r0ObbFGhTT4SAKQe1b0i
 bHew==
X-Gm-Message-State: ANhLgQ24r6TYU1l7xew/9MH+rZTr5kRp6LMmPO3YwE02wP6a2kT2/Y6f
 D76tv5MVlTmO9TQpPl5azR+CIA==
X-Received: by 2002:a17:90b:370e:: with SMTP id
 mg14mr8778881pjb.16.1584720384226; 
 Fri, 20 Mar 2020 09:06:24 -0700 (PDT)
Received: from localhost.localdomain (97-126-123-70.tukw.qwest.net.
 [97.126.123.70])
 by smtp.gmail.com with ESMTPSA id nu13sm5272745pjb.22.2020.03.20.09.06.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Mar 2020 09:06:23 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/3] target/arm: Coverity tweaks
Date: Fri, 20 Mar 2020 09:06:19 -0700
Message-Id: <20200320160622.8040-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::1043
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
X-TUID: 91OVbXcElADB

Only the first of these appears to be a real bug.
The other two are adjustments to help satisfy Coverity.


r~


Richard Henderson (3):
  target/arm: Rearrange disabled check for watchpoints
  target/arm: Assert immh != 0 in disas_simd_shift_imm
  target/arm: Move computation of index in handle_simd_dupe

 target/arm/helper.c        | 11 ++++++-----
 target/arm/translate-a64.c |  6 +++++-
 2 files changed, 11 insertions(+), 6 deletions(-)

-- 
2.20.1

