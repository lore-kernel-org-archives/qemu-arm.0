Received: by 2002:a17:505:1909:b0:1be9:327d:8ee3 with SMTP id az9csp1208626njb;
        Tue, 10 Sep 2024 02:48:48 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUu3fXhOc3yck7KTDZWBjXi8vvTqN5IBxJZa9KT8CrNQBU9TRFhtC+Ob+ETbqv5i2GPeGqEQ5d0L+r3lA==@linaro.org
X-Google-Smtp-Source: AGHT+IER9kP5dffOqK+nYBCKM1DtOAKzwV9Y575FFC04R30EWgkJaP0pGGs91zKr9KT3mbz3QX7X
X-Received: by 2002:a05:6214:5411:b0:6c4:79df:a2e5 with SMTP id 6a1803df08f44-6c5283f96c5mr147536646d6.20.1725961728249;
        Tue, 10 Sep 2024 02:48:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1725961728; cv=none;
        d=google.com; s=arc-20240605;
        b=HV6LUskVoc3OMIRJ7AxlHzulQpy6oH5KoXF95piqKNgW9pJiVWZD3030imEnktY4yr
         9eHnSGkZcF73qSIeayDyugCXgW3DfuQqYkDyPKWcPnKnFXkKgfO2Smxvci8FlYV82Ftp
         tlvABnaWFZuniQGn4B4+pPBwC26j3uF4+sLo3vFYGfoVy812srRCQor67EPBpfKSVY2S
         MXH8xxYEvnNMehL52RfNp7476mg0JmKM1l/eKNPW/s6hsTemma42E2oZW2eaC3aQ2CWj
         gzYdSF8Io0rzkoeFNPwR4zBqthxp+6Z4bdJ2vwo/3QJx5GvrJXvAsMdmMgbK8+lbZKF/
         pq2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:content-transfer-encoding
         :mime-version:message-id:date:subject:from;
        bh=ur0/kwNxSD+kuAV/sTsqKX2Fogf3Q+p/AjmDkJYS/q4=;
        fh=2XNni5tFqqNsYuVOJGxzVTMSzHzZnaSMOOPrr5cXMU4=;
        b=CHw0nuT9uZk9hR+ACz7dwhlz6KX2IW7uy+dJ4GFmwtBLL31OOTkvk0ld+s38rVVoMH
         N4XsRn6WcfDd+VIt7j+mlW1IxiOl+czaLJkTUJbdNOXMMVrslceWR+i1FEMudhafgbe3
         4IH0LlE6g7+NXEqaj7IXtzb2qij5I+48BZa5JDVZVUXgmVJzuFNIyLA5P6aKjsS04aIO
         c7AWJUGAubd0uzbmQ1erGX3DdGTTXjrb7wERB8wfdUXPqbvSJNozxokyoKG9OiDyQ5m6
         hpuataZ6V3eFZh2/DsD/KN5lSj1NC93P3lmqIxZQiFLYvd0BfwcsUI46UMtRZV5LHCks
         vYaQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6c5348ca096si72871206d6.595.2024.09.10.02.48.48
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 10 Sep 2024 02:48:48 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1snxUD-0006VT-J0; Tue, 10 Sep 2024 05:48:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcin.juszkiewicz@linaro.org>)
 id 1snxUB-0006TV-Ju; Tue, 10 Sep 2024 05:48:35 -0400
Received: from muminek.juszkiewicz.com.pl ([213.251.184.221])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcin.juszkiewicz@linaro.org>)
 id 1snxU9-0000M9-TM; Tue, 10 Sep 2024 05:48:35 -0400
Received: from localhost (localhost [127.0.0.1])
 by muminek.juszkiewicz.com.pl (Postfix) with ESMTP id D349A260BA2;
 Tue, 10 Sep 2024 11:48:30 +0200 (CEST)
X-Virus-Scanned: Debian amavis at juszkiewicz.com.pl
Received: from muminek.juszkiewicz.com.pl ([127.0.0.1])
 by localhost (muminek.juszkiewicz.com.pl [127.0.0.1]) (amavis, port 10024)
 with ESMTP id X2CWEUwOFf_u; Tue, 10 Sep 2024 11:48:28 +0200 (CEST)
Received: from applejack.lan (83.11.24.101.ipv4.supernova.orange.pl
 [83.11.24.101])
 by muminek.juszkiewicz.com.pl (Postfix) with ESMTPSA id BD1552602C9;
 Tue, 10 Sep 2024 11:48:17 +0200 (CEST)
From: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
Subject: [PATCH v5 0/4] tests: updates for aarch64/sbsa-ref
Date: Tue, 10 Sep 2024 11:48:07 +0200
Message-Id: <20240910-b4-move-to-freebsd-v5-0-0fb66d803c93@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIANcV4GYC/4XNTQrCMBCG4atI1kbyM20aV95DXCR20ga0kaQEp
 fTupt2IKLp8P5hnJpIwekxkv5lIxOyTD0OJarsh594MHVLfliaCCWC1AGqBXkNGOgbqIqJNLTX
 GtWhVhU42pBzeIjp/X9HjqXTv0xjiY/2RxbL+5LKgjNaARlkGWjfucPGDiWEXYkcWL8v/hiyG4
 qBr6zjXLXwY8DIUk18NKAZTXHOnq6aS7M2Y5/kJcm/hlj0BAAA=
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Leif Lindholm <quic_llindhol@quicinc.com>, 
 Radoslaw Biernacki <rad@semihalf.com>, 
 Peter Maydell <peter.maydell@linaro.org>, Cleber Rosa <crosa@redhat.com>, 
 =?utf-8?q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>, 
 Wainer dos Santos Moschetta <wainersm@redhat.com>, 
 Beraldo Leal <bleal@redhat.com>, 
 Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
X-Mailer: b4 0.14.0
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
X-TUID: jgz9xvhuJwn8

We want test to run on default cpu settings. For now it is plain
Neoverse-N2 but we are considering either disabling PAuth or going with
'impdef' way.

We want to have some non-Linux OS in testing in case one of changes keep
Linux booting but crash elsewhere. So far OpenBSD was used for it but we
move to FreeBSD 14.x due to longer support cycles (OpenBSD 7.3 we use is
already EoL).

Signed-off-by: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>

---
Changes in v5:
- update to post-avocado system
- drop all OpenBSD tests
- Link to v4: https://lore.kernel.org/r/20240703-b4-move-to-freebsd-v4-0-07191f958530@linaro.org

Changes in v4:
- hide OpenBSD test behind AVOCADO_TEST_LEGACY_OS switch
- Link to v3: https://lore.kernel.org/r/20240624-b4-move-to-freebsd-v3-0-71496bf119d4@linaro.org

Changes in v3:
- kept OpenBSD/Cortex-A57 test for local runs (by request of Philippe)
- Link to v2: https://lore.kernel.org/r/20240624-b4-move-to-freebsd-v2-0-64ea7b04998f@linaro.org

---
Marcin Juszkiewicz (4):
      tests: use default cpu for aarch64/sbsa-ref
      tests: add FreeBSD tests for aarch64/sbsa-ref
      tests: expand timeout information for aarch64/sbsa-ref
      tests: drop OpenBSD tests for aarch64/sbsa-ref

 tests/functional/test_aarch64_sbsaref.py | 58 +++++++++++++++++---------------
 1 file changed, 31 insertions(+), 27 deletions(-)
---
base-commit: 1581a0bc928d61230ed6e43bcb83f2f6737d0bc0
change-id: 20240624-b4-move-to-freebsd-aafdeb75ef38

Best regards,
-- 
Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>

