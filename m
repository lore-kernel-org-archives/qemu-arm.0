Received: by 2002:a17:505:2d08:b0:1be7:c013:c773 with SMTP id xy8csp426421njc;
        Mon, 24 Jun 2024 06:17:35 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUSIVqmfskws74C3p7bzEw7euHXRxbW/qe/TL2++GjQZXsYnHArjzp7zTpH4hPW8W4IzulMo9T606Uf+VDPUWeLWg1GmV4L
X-Google-Smtp-Source: AGHT+IFcxA292HMsLedOgHc5i4nttpwAcae9kQtI4Ze9zWDbBRRqJ9rfaCkMkJS6g/19pXdoMRda
X-Received: by 2002:a05:6214:d2:b0:6b0:6965:511 with SMTP id 6a1803df08f44-6b5409a53d2mr46438556d6.7.1719235055604;
        Mon, 24 Jun 2024 06:17:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1719235055; cv=none;
        d=google.com; s=arc-20160816;
        b=rxt/Yetg5ygVSH5Xq+QxUNRxzRscpcSMH1mrVMMLHc8bjj7cWhlzi9tAiVxOwtOLeb
         +8xAKCn/Q8ydy47dHgL4NAcL9OsyTWj0ZXXqPZqbwnCZCsU7Vg0M7omgSn5cuzOzX+NL
         GDX/jO1vaUGIL7vt0mXuy0S7IThx0lc1AGWaa+7MQbVNkHZ3WnIct5l3wJeYMvW8FY/D
         E/e+Emc518TyXffSyBZIoMyDYkPJyloJ3JzlIinNjV5Z6UK/QFAOqUD8PsLw+CRbrkq5
         yNDwnfXR+sRQiVXYHutqgyyKPBwyazQWojjhm2RiZxYGaLZH5t4J3HITRF6h03McU/x5
         LMNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:content-transfer-encoding
         :mime-version:message-id:date:subject:from;
        bh=NrevwmYejJfVyW1DPyTTrBK2c4yBAb2dYSYDx2GrhG0=;
        fh=2XNni5tFqqNsYuVOJGxzVTMSzHzZnaSMOOPrr5cXMU4=;
        b=CSxEAdyRrLRSK3T2FPWVwPChs7wcQJYeUX8T+5kcFsy6u3F10yWbrx1IegekfFzgsm
         BQW3OXmPNIh3r6wV9pUeoOpOiwQGqrwhJXwgxSLTQaDnlSaL3fSkMdA3t6qRl8BM6jCy
         oPx9MyhAiBqcSOGM6wq8q/rSQSq2c08c756uCY7GesmkIZLAgVEWeO+MCfjsMx/kEs4P
         +pBSJbXi2DcF/EK2tWh9i+iqsmdzNWn+2iGSEp1ZTgXV02l7G0Lx+N1L3gUw3d0mado4
         4pP8Ns72LSBVsEyn05M5lJ9EYyZWOZtgpPzbnc88VHnxhstrFXM+YIub6+fRkxzME7n0
         gazQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6b51ef58f79si84443896d6.568.2024.06.24.06.17.35
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 24 Jun 2024 06:17:35 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sLjWs-0001Hi-8X; Mon, 24 Jun 2024 09:14:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcin.juszkiewicz@linaro.org>)
 id 1sLjWq-0001Fg-RK; Mon, 24 Jun 2024 09:14:40 -0400
Received: from muminek.juszkiewicz.com.pl ([213.251.184.221])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcin.juszkiewicz@linaro.org>)
 id 1sLjWo-0004rd-N6; Mon, 24 Jun 2024 09:14:40 -0400
Received: from localhost (localhost [127.0.0.1])
 by muminek.juszkiewicz.com.pl (Postfix) with ESMTP id 23E22260662;
 Mon, 24 Jun 2024 15:14:35 +0200 (CEST)
X-Virus-Scanned: Debian amavis at juszkiewicz.com.pl
Received: from muminek.juszkiewicz.com.pl ([127.0.0.1])
 by localhost (muminek.juszkiewicz.com.pl [127.0.0.1]) (amavis, port 10024)
 with ESMTP id 2XfFuepCScNn; Mon, 24 Jun 2024 15:14:33 +0200 (CEST)
Received: from applejack.lan (83.11.22.244.ipv4.supernova.orange.pl
 [83.11.22.244])
 by muminek.juszkiewicz.com.pl (Postfix) with ESMTPSA id A1D9C260720;
 Mon, 24 Jun 2024 15:14:32 +0200 (CEST)
From: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
Subject: [PATCH v2 0/2] tests/avocado: updates for sbsa-ref testing
Date: Mon, 24 Jun 2024 15:14:21 +0200
Message-Id: <20240624-b4-move-to-freebsd-v2-0-64ea7b04998f@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAC1xeWYC/x3MOwqAMBBF0a3I1A5IjB/cilgk5kWn0EgiIoh7N
 1ie4t6HEqIg0VA8FHFJkrBnqLKgeTX7AhaXTapSumqVZqt5Cxf4DOwjYJNjY7yD7Rr4uqccHhF
 e7n86Tu/7AVg415VkAAAA
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Leif Lindholm <quic_llindhol@quicinc.com>, 
 Radoslaw Biernacki <rad@semihalf.com>, 
 Peter Maydell <peter.maydell@linaro.org>, Cleber Rosa <crosa@redhat.com>, 
 =?utf-8?q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>, 
 Wainer dos Santos Moschetta <wainersm@redhat.com>, 
 Beraldo Leal <bleal@redhat.com>, 
 Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
X-Mailer: b4 0.13.0
Received-SPF: softfail client-ip=213.251.184.221;
 envelope-from=marcin.juszkiewicz@linaro.org; helo=muminek.juszkiewicz.com.pl
X-Spam_score_int: -11
X-Spam_score: -1.2
X-Spam_bar: -
X-Spam_report: (-1.2 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_SOFTFAIL=0.665 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
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
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: Jaun49iDgSZQ

We want to have some non-Linux OS in testing in case one of changes keep
Linux booting but crash elsewhere. So far OpenBSD was used for it but we
move to FreeBSD 14.x due to longer support cycles.

At same time we add test to run on default cpu settings. For now it is
plain Neoverse-N2 but we are considering either disabling PAuth or going
with 'impdef' way.

Signed-off-by: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>

---
Marcin Juszkiewicz (2):
      tests/avocado: sbsa-ref: switch from OpenBSD to FreeBSD
      tests/avocado: add test for default sbsa-ref cpu

 tests/avocado/machine_aarch64_sbsaref.py | 72 +++++++++++++++++---------------
 1 file changed, 38 insertions(+), 34 deletions(-)
---
base-commit: c9ba79baca7c673098361e3a687f72d458e0d18a
change-id: 20240624-b4-move-to-freebsd-aafdeb75ef38

Best regards,
-- 
Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>

