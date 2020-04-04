Received: by 2002:ac2:5937:0:0:0:0:0 with SMTP id v23csp1820203lfi;
        Sat, 4 Apr 2020 05:27:39 -0700 (PDT)
X-Google-Smtp-Source: APiQypJNsowkC/bVJdKnMZQzGHXJrrCFt9iPGFwesWRSnUVKXQdQiRqBYtGuBbJqssWBobH5Aagk
X-Received: by 2002:a37:74c5:: with SMTP id p188mr13641654qkc.475.1586003258992;
        Sat, 04 Apr 2020 05:27:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1586003258; cv=none;
        d=google.com; s=arc-20160816;
        b=EPp9CwECrUMr15XXVPYAUZq834WYTaMk363TWOU1/iw3w7cUutKznoHBq9czKJBJo4
         /ONeDQLc29Llk7pi1k5CcP+TL8rA09K3GIbVc3LlAvzAiY4XgiQHE/ZYv5E4clxzNRc0
         mgLjd4bte7vT2aFswZUWiXNQlTY5ZrbC+sYBBAf7NtLLv//Wi69fPVd+5VCwihJpZpMN
         Jp21K+VYSkBCmUEeGmTtvzzThH8YGZlJ+o9r8WxINyAke42gBrRIqrOdTR4dR7G5rz/U
         bwAPKWjvIUjesK6T9n4Plj6ZX/PMJEYO5rBfY0aXiOiGXyEzGeA5OveU+KfL/F3kR3Fu
         PRag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from:dkim-signature;
        bh=8zHSVDhG2VqQJYu54V1syJCEbfw+DP1r4lsTcrXvAfg=;
        b=zL1nJmi3MlHySiubvcD7F6+PG/G0kbqnTOInAuw2MGF6AwTZDTErIc2gyB9dpzD61x
         WnY/NBvzkyN2RUmnTwpn5ZidsTkdClcX2bXf+4KZL4UL5abH9h55QCqpt07lEfaoQHLI
         jeT0C5dkgR5koe3Sp0enxmjAwd0jTyQndvc7fojCdUVw2R2w5AmgFcBx6xG5Ys6em9LO
         Q+279B2IpM+9k1RWDzh4ubGEsOqL6IHN1yWIl1QG5tOBYZLvhSLkBFAqGa7s7vg9jfOn
         zQ7pYDaK/KKaZ9fERmu5ijRs89h3aWmflBLMnsGbbJwAmClXot26Zu4I7gig9c8+m83g
         2AEw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=jk6xQx45;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l62si7124382qkf.189.2020.04.04.05.27.38
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 04 Apr 2020 05:27:38 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=jk6xQx45;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:38442 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jKhti-0006F3-Ce
	for alex.bennee@linaro.org; Sat, 04 Apr 2020 08:27:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54578)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <edgar.iglesias@gmail.com>) id 1jKhsJ-0004xV-RL
 for qemu-devel@nongnu.org; Sat, 04 Apr 2020 08:26:12 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <edgar.iglesias@gmail.com>) id 1jKhsI-00073n-PT
 for qemu-devel@nongnu.org; Sat, 04 Apr 2020 08:26:11 -0400
Received: from mail-lf1-x144.google.com ([2a00:1450:4864:20::144]:45954)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <edgar.iglesias@gmail.com>)
 id 1jKhsI-00072z-Hu; Sat, 04 Apr 2020 08:26:10 -0400
Received: by mail-lf1-x144.google.com with SMTP id f8so6658681lfe.12;
 Sat, 04 Apr 2020 05:26:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=8zHSVDhG2VqQJYu54V1syJCEbfw+DP1r4lsTcrXvAfg=;
 b=jk6xQx45H2adb8koM7GjVxSRextpy3F96p99hEEPrFQ19fqFHIqr1YL09JWjuK08Ic
 Rui89rmFp4rccQMxrgAPBZxfxGA2ueKRkj2trCYYX7LSPFH8l6pEPGldHeRUpp8xlNYj
 o0DzTKLji9jXrZFHcZNuAhEDRdHyNFk70xuRlApEzqxDXRHBz8HUPbhChDWrn9wtZ09a
 /sO1FqnLjZHezgg3r2GWiFwW2/dnrWPxLGaYHI6mWc9LWANciil7nQtXsCkZWhnb8gcy
 588gyuFMYSk1w5t/vQeS1qbBzwwc1etb6lDPOgAVXQa9w5zvx+m0yhFUcSJkJzuO0NWT
 onFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=8zHSVDhG2VqQJYu54V1syJCEbfw+DP1r4lsTcrXvAfg=;
 b=gjKF/Yj38tLzSVZqQVK2jItuKK4D6j6JuEY/Oy/M1ue5bgXussdBANJZc+t953dhie
 Fywoa7qyiif0ESpp52p/4Ghgi1B9zKBvIYaVhyo9jMg80oz8i091110R2A3WlWyhXkLY
 j7r/E9gX15qnJDYR+ZJ9KWgEVP2ZoxWJ31Q8vojdaL6vo5atlY+QY1Fv666nI85kEfjl
 rK7EXCAysLNw04S6GyefACl8gJzfB5Z9PQKQvxGpNP0T7LxmzlHsXg3ZepcrkR62R6kZ
 tYVrXBq53SE/XennnANxYyFHOjSVXii2gFcnqSkUMtctoJzn/ry4j7bStB8M6LxqFNO4
 M05A==
X-Gm-Message-State: AGi0PualDFE6FjC7aXuRXMykfLbdeY7lj9NeHqoNsZd2WjNWFkNlXpj1
 XyMA3vuJCRBdtEDSvB9I5scjWIAjatkfRw==
X-Received: by 2002:a19:ac41:: with SMTP id r1mr8220395lfc.113.1586003168752; 
 Sat, 04 Apr 2020 05:26:08 -0700 (PDT)
Received: from localhost (81-231-232-130-no39.tbcn.telia.com. [81.231.232.130])
 by smtp.gmail.com with ESMTPSA id n23sm6515545lji.59.2020.04.04.05.26.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 04 Apr 2020 05:26:07 -0700 (PDT)
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v1 0/2] dma/xlnx-zdma: Fix descriptor loading wrt host
 endianness
Date: Sat,  4 Apr 2020 14:27:16 +0200
Message-Id: <20200404122718.25111-1-edgar.iglesias@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::144
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
Cc: figlesia@xilinx.com, peter.maydell@linaro.org, sstabellini@kernel.org,
 edgar.iglesias@xilinx.com, sai.pavan.boddu@xilinx.com,
 frasse.iglesias@gmail.com, alistair@alistair23.me,
 richard.henderson@linaro.org, frederic.konrad@adacore.com, qemu-arm@nongnu.org,
 philmd@redhat.com, luc.michel@greensocs.com
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: W3nfGiyeadKO

From: "Edgar E. Iglesias" <edgar.iglesias@xilinx.com>

Hi,

This fixes the endinannes related bugs with descriptor loading
that Peter pointed out.

Cheers,
Edgar

Edgar E. Iglesias (2):
  dma/xlnx-zdma: Fix descriptor loading (MEM) wrt endianness
  dma/xlnx-zdma: Fix descriptor loading (REG) wrt endianness

 hw/dma/xlnx-zdma.c | 25 +++++++++++++++++--------
 1 file changed, 17 insertions(+), 8 deletions(-)

-- 
2.20.1

