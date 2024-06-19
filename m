Received: by 2002:a17:907:60c:b0:a6f:8e2c:4d9d with SMTP id wp12csp1401532ejb;
        Wed, 19 Jun 2024 06:46:04 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCW2r3wb8NKgWPc056QTXED/tl3VrobqGs4xPhY9exet/p/uJzzt/hvRRM4xqjKLV4irxSIJxLdiMXNMhJ+G0/PYY4hg26Qy
X-Google-Smtp-Source: AGHT+IE0ba5koxfYoknwJNWjmGpE/IAKZc6vXd1deqr2F/TRtgc1V9ugPvv/lWTuouSh3Isklpu3
X-Received: by 2002:a05:622a:1394:b0:440:51af:2986 with SMTP id d75a77b69052e-444a7a5e1bbmr26538141cf.57.1718804762795;
        Wed, 19 Jun 2024 06:46:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1718804762; cv=none;
        d=google.com; s=arc-20160816;
        b=KN6RjnS+KBf0lDPMdvO/YeAC7ynCD4EN0KqsErY2IWDD9kQkHIaI/qp3FADSouTKpx
         fsUMb3aAwcqnwcEqSQRCZPwNGur6BKy94GpKVOlY/hJRtWQkGLzWXsibC2nws/GyQ5dl
         /yOcX9Ocz86W29fQRbND6aSFmwmuRr8dUYaT8CFB40Vl7ntb+9KC6JHR68IJxgvkLU3k
         pYJ4userjJNq5Hfo+kWEB06OQeeiiZlYdW7+fYPql+XyhS1gyhOlcf6vpEYZhiNtxjtK
         YmrIXu9kyzKtV8l430WV+XJ+lp/cfkDa1qwWh/jpGck1bOdIyNuOQXNebAfhir/QppEs
         6JXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from;
        bh=yW7cNuHG57ahTZ6Z0a7Ck6lBhsGf7sVF2TrfDkE4dCw=;
        fh=sMw5wUJBWGBtSuNC/py39k2nZzHQbArBDjR2xR28Mfo=;
        b=LNu3LJ+u9OlnfbTGhozsqPvUSh4oTyH52QmtOkyWqqKx86Sq+VjBxLgjGw/NHcZtr9
         OqWHSlMH/ndvSSsDnIOeBvBJTT17lZ0fJXeaL1EFBa64+j7Qul7xbK8zVk5mcBCDK6r1
         5f0T6CaSvly2uxWBfCQoyVZgbqWjSAOFQ3ptiBIL7CORWcbCxx8s/m2+yZoaCi6LqWvq
         w0xQpbAIZc9wFwkFenYN3hE1Ydd9VbygTAxBzmCb10gUyDGCKfQAOpsPV0lz6VUuQGP/
         xENvHGSs34o96hGCj0F4//Q0vw+wiAE5ZNgAsc2oy5xRfQMSYkRbPtteK8BlDC7iQcMc
         s9pg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-442136e8e92si150697641cf.148.2024.06.19.06.46.02
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 19 Jun 2024 06:46:02 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sJvcw-0006ro-7F; Wed, 19 Jun 2024 09:45:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcin.juszkiewicz@linaro.org>)
 id 1sJvcu-0006qY-JI; Wed, 19 Jun 2024 09:45:28 -0400
Received: from muminek.juszkiewicz.com.pl ([213.251.184.221])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcin.juszkiewicz@linaro.org>)
 id 1sJvcs-0001Yo-Nb; Wed, 19 Jun 2024 09:45:28 -0400
Received: from localhost (localhost [127.0.0.1])
 by muminek.juszkiewicz.com.pl (Postfix) with ESMTP id 048832608AB;
 Wed, 19 Jun 2024 15:45:23 +0200 (CEST)
X-Virus-Scanned: Debian amavis at juszkiewicz.com.pl
Received: from muminek.juszkiewicz.com.pl ([127.0.0.1])
 by localhost (muminek.juszkiewicz.com.pl [127.0.0.1]) (amavis, port 10024)
 with ESMTP id Y8V-fgRnT4P0; Wed, 19 Jun 2024 15:45:21 +0200 (CEST)
Received: from applejack.lan (83.11.22.244.ipv4.supernova.orange.pl
 [83.11.22.244])
 by muminek.juszkiewicz.com.pl (Postfix) with ESMTPSA id 5F78C2600D9;
 Wed, 19 Jun 2024 15:45:20 +0200 (CEST)
From: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Leif Lindholm <quic_llindhol@quicinc.com>,
 Radoslaw Biernacki <rad@semihalf.com>, Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, qemu-arm@nongnu.org,
 Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
Subject: [PATCH 1/1] tests/avocado: use default amount of cores on sbsa-ref
Date: Wed, 19 Jun 2024 15:45:12 +0200
Message-ID: <20240619134512.595506-1-marcin.juszkiewicz@linaro.org>
X-Mailer: git-send-email 2.45.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: softfail client-ip=213.251.184.221;
 envelope-from=marcin.juszkiewicz@linaro.org; helo=muminek.juszkiewicz.com.pl
X-Spam_score_int: -11
X-Spam_score: -1.2
X-Spam_bar: -
X-Spam_report: (-1.2 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_SOFTFAIL=0.665, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
X-TUID: KJA2BhFxnyQU

I was wondering why avocado tests passed with firmware which crashes
when anyone else is using it.

Turned out that amount of cores matters. Have to find out why still.

Signed-off-by: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
---
 tests/avocado/machine_aarch64_sbsaref.py | 2 --
 1 file changed, 2 deletions(-)

diff --git a/tests/avocado/machine_aarch64_sbsaref.py b/tests/avocado/machine_aarch64_sbsaref.py
index 6bb82f2a03..136b495096 100644
--- a/tests/avocado/machine_aarch64_sbsaref.py
+++ b/tests/avocado/machine_aarch64_sbsaref.py
@@ -75,8 +75,6 @@ def fetch_firmware(self):
             f"if=pflash,file={fs0_path},format=raw",
             "-drive",
             f"if=pflash,file={fs1_path},format=raw",
-            "-smp",
-            "1",
             "-machine",
             "sbsa-ref",
         )
-- 
2.45.1

