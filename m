Received: by 2002:a19:ee01:0:0:0:0:0 with SMTP id g1csp1375575lfb;
        Tue, 12 May 2020 10:56:45 -0700 (PDT)
X-Google-Smtp-Source: APiQypKQEvOxiwk1Iop+ZVv7sDLIOxOP1JVTiGW+t1d+RQD6uMy2cIYrDUPxGR1QCRD3rlrdsduD
X-Received: by 2002:aed:3907:: with SMTP id l7mr24565572qte.62.1589306205515;
        Tue, 12 May 2020 10:56:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1589306205; cv=none;
        d=google.com; s=arc-20160816;
        b=quaz1Jf780JD5pKAGcBxK1K8XFmqAyRsMieAAb2X+0w7Q4mwEvGDL4qVzdQYH/YoKJ
         uIsuRsyjnKhSgtzFzX1Ve5uC4CGpvCSjkcvBtjkApo2oiy3lpsa4C8YMOpUG+iO5hLdW
         Rmda9dKt8zkqU6Vwc7JliwejHANIvLyCn9GTsQJWKSDVNdnuM/eHIFxQeDqHNRh9lMRd
         Nx2vmtQv1XtLqv1vUq8Nye33uKa4DGvHCH0bw9OTNkV8cvk6wwO+fZrgEhI2pPNhpKtq
         lvRQcyRe0H1waFrXMlbM18TIoJLYLnxppv1QYS6sc3aGoEWPCZPjMw7BhLAVGjhf4M2/
         Yq1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:message-id:date:subject:to:from
         :dkim-signature;
        bh=avK/Z/6wqRuOjH2arcvxV3LyvE6xojjat6vnYZ0J980=;
        b=ZPu/lq+xkEBGRleyTi7BJoNCXGbBnKwvcPJR1RJgjr30pnE3lNo4M0jd3EKUIZB0om
         lZV3P5kNbFQ3+rTCXRmivvN1SnHErkIZJ0FmRwnontIXw63lOvDj2PYFHkGPWHUzIL9D
         SKHrAe0SfsDUix4f0OZ/vKFHzmq/3VLadcieNST1zwW18igQqbfOdsZ9LuaquKtnhY6I
         166SVuBdsshDXYN/B/jdvFr/jBIu6xSEld8W7puIJFRx0z+diD5yH1XYkktxz8PNc1Ao
         HrzCNek0Iz/hmt7bKkSQWs8chMK5T63Yqwwjityq3H3nfCA7h3zUG/28W6VBEjKBkcpN
         FU1Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@semihalf-com.20150623.gappssmtp.com header.s=20150623 header.b=W3m7XaTA;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u24si7786199qtv.232.2020.05.12.10.56.45
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 12 May 2020 10:56:45 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@semihalf-com.20150623.gappssmtp.com header.s=20150623 header.b=W3m7XaTA;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:53534 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jYZ92-00042m-VE
	for alex.bennee@linaro.org; Tue, 12 May 2020 13:56:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54940)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rad@semihalf.com>) id 1jYYN8-0007xW-1j
 for qemu-arm@nongnu.org; Tue, 12 May 2020 13:07:14 -0400
Received: from mail-lf1-x144.google.com ([2a00:1450:4864:20::144]:46622)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <rad@semihalf.com>) id 1jYYN5-00071L-Qo
 for qemu-arm@nongnu.org; Tue, 12 May 2020 13:07:13 -0400
Received: by mail-lf1-x144.google.com with SMTP id v5so7109287lfp.13
 for <qemu-arm@nongnu.org>; Tue, 12 May 2020 10:07:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=semihalf-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id;
 bh=avK/Z/6wqRuOjH2arcvxV3LyvE6xojjat6vnYZ0J980=;
 b=W3m7XaTAzx2SnS6KIhm0qcuQjCKmTlTgsEys3eS5uLR4a92ZV3iXeqMGB/ED1Slo+q
 Y7BPFmCHSBmS/xoOWHKuXIzJ2kLDz6zfJ1ux0z5rJ/kok0ZlGSsV3XgedL8K7dr5nPqw
 RrHoIZC9f9r4yxlJ7FNcxRpUDi4M3gka8YFDwXIzxbB+v4qG1TfAxV1dqT+6mS8a4CiL
 SanfpeiyJBdRU7XBm0UovBsipGlRas3PNoH+oe21JBMApUvqiy5kAVsQW/3m76J4EVBz
 Y4yIWB1XWqCjqkDQfkaegXvaNxCm9IxWRh4yLwtySjb/q3TW8Gc9BYeDwTyYnh5X2AmA
 JOqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=avK/Z/6wqRuOjH2arcvxV3LyvE6xojjat6vnYZ0J980=;
 b=qxwmwvorj6NJqsm2zd9Qpqbx3sv0+DRm71vmG3ijyALF6iVYXHMUGk+XM26WofCehP
 VC84RLVJbPdNpmlOEvN9vH8iU1CFXR8dIls593yiQmEuNDW7K43O5rH2q38KpQJ5WCDK
 9WhmqFVybSEFLiEv77WTRMWaaWD5ebvQn7h9vS7QIKiXwFobyTxMnDJup2caaEKbCTQa
 NE3i3oH++oBXzvjsZFTL8rTmz3qSkxnmlZiwWqkQBzts7RJuYrR32sWeafE5p/Y7OXDk
 ErlNS6W8uGsch9pu3SMNDIvebmbjyuA3q1Hb1j/3F8wun9BKrOFPYXNfZGKapz1LLHX4
 Rlag==
X-Gm-Message-State: AOAM533vG9qj1CXqdQ+rUmBAla/Zh0ptaA/13EvHYWKF42yPD4WCtngX
 NjBaRz7Av4841MmR8VSBqnA+GQ==
X-Received: by 2002:a05:6512:1051:: with SMTP id
 c17mr14582634lfb.206.1589303228751; 
 Tue, 12 May 2020 10:07:08 -0700 (PDT)
Received: from unknown.lan (ip-179-133.ists.pl. [93.180.179.133])
 by smtp.gmail.com with ESMTPSA id w203sm14350355lff.38.2020.05.12.10.07.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 May 2020 10:07:08 -0700 (PDT)
From: Radoslaw Biernacki <rad@semihalf.com>
To: Peter Maydell <peter.maydell@linaro.org>,
 Leif Lindholm <leif@nuviainc.com>, qemu-arm <qemu-arm@nongnu.org>
Subject: [PATCH] MAINTAINERS: Update Radoslaw Biernacki email address
Date: Tue, 12 May 2020 19:07:04 +0200
Message-Id: <20200512170704.9290-1-rad@semihalf.com>
X-Mailer: git-send-email 2.17.1
Received-SPF: none client-ip=2a00:1450:4864:20::144;
 envelope-from=rad@semihalf.com; helo=mail-lf1-x144.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
X-Spam_action: no action
X-Mailman-Approved-At: Tue, 12 May 2020 13:56:32 -0400
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
Cc: philmd@redhat.com, qemu-devel <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: bXS+AfN7+n+h

My Linaro account is no longer active and stop forwarding emails to me.
Changing it to my current employer domain.

Signed-off-by: Radoslaw Biernacki <rad@semihalf.com>
---
 .mailmap    | 1 +
 MAINTAINERS | 2 +-
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/.mailmap b/.mailmap
index 6412067bde..668da447e3 100644
--- a/.mailmap
+++ b/.mailmap
@@ -46,6 +46,7 @@ Aleksandar Rikalo <aleksandar.rikalo@rt-rk.com> <arikalo@wavecomp.com>
 Anthony Liguori <anthony@codemonkey.ws> Anthony Liguori <aliguori@us.ibm.com>
 James Hogan <jhogan@kernel.org> <james.hogan@imgtec.com>
 Leif Lindholm <leif@nuviainc.com> <leif.lindholm@linaro.org>
+Radoslaw Biernacki <rad@semihalf.com> <radoslaw.biernacki@linaro.org>
 Paul Burton <pburton@wavecomp.com> <paul.burton@mips.com>
 Paul Burton <pburton@wavecomp.com> <paul.burton@imgtec.com>
 Paul Burton <pburton@wavecomp.com> <paul@archlinuxmips.org>
diff --git a/MAINTAINERS b/MAINTAINERS
index 1f84e3ae2c..a9d6893036 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -799,7 +799,7 @@ F: include/hw/misc/imx6_*.h
 F: include/hw/ssi/imx_spi.h
 
 SBSA-REF
-M: Radoslaw Biernacki <radoslaw.biernacki@linaro.org>
+M: Radoslaw Biernacki <rad@semihalf.com>
 M: Peter Maydell <peter.maydell@linaro.org>
 R: Leif Lindholm <leif@nuviainc.com>
 L: qemu-arm@nongnu.org
-- 
2.17.1

