Received: by 2002:a05:6512:3aa:0:0:0:0 with SMTP id v10csp1107373lfp;
        Fri, 31 Jan 2020 13:12:25 -0800 (PST)
X-Google-Smtp-Source: APXvYqzmu55qLVEum93O8bmJ46N5H4vtIBJauiFX2/TGtuADsz9H+ur09ba3xGgbmE1ZW3ViTmQx
X-Received: by 2002:ad4:4dc3:: with SMTP id cw3mr12185277qvb.130.1580505145298;
        Fri, 31 Jan 2020 13:12:25 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1580505145; cv=none;
        d=google.com; s=arc-20160816;
        b=kMJpO1DoSSdgd5ZmWd+sybCYzJ2Wyx5XunNckPsQAHEV8dx1q0ADuQlPBYvTCouFUc
         gNEAwzOLWgglJ0jvPzAQBaF0MN1rMGOMzkOcCvLI1NTeut0aLbpMhzE2KblqvY8ijah3
         Lmm9gzFcbDoFRjlKg7tZuD2UYMM+6CZtIaa4LyNO/Tf/w3cRlpymk9xC0gFaVsaQDVea
         tAWZSvYwiF0eNO5jakwg3VS6BZKtraHny1+mTz2U3PKJPM2LFZCUxiXS/s5eo6OHxWFf
         IPBB8MsYfpmvd6GQ5apRjsDSPeIQ7YE1l5zdfYDJEiI1sSD0EN4dDmbbbXyzsA1j6/qI
         EdgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from:dkim-signature;
        bh=V2AmHIlbU76zIkcF/u/ceGhk60yLlbr1/AGmeHDgj7Q=;
        b=xwB+g669kHZI2pSrqNZjba1C0V6B6fNQ0jTKoVtlZZe4rBeeRYSSmIow0WtwyFLqSB
         0/ebb52HSp6pRVlVq/uJAUP8b2jpZSlePgUniFrbM1DUyzvq1nmF0FYuXw2SULV2tRIu
         wJWQky3A59KxWpojfE2g1J8PEN4CR2+7ik6mBor+044tFTAUcn9lWOQJrNOPdsxtbWTV
         ohcQG0+pra//nXJz+nUijxEVeMzKM6XQHMkfNCjGp/iPwWEeBA7FONDeqTzXTncX5rSJ
         B2H17lOHLbL8uugfnFWeM4VdoNaNL/KN07Qd4PubXhcsKDFAkB2lmZKxQzPR58J7H5OQ
         JyDw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=vch9QieT;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h2si6948701qvk.96.2020.01.31.13.12.25
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 31 Jan 2020 13:12:25 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=vch9QieT;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Received: from localhost ([::1]:59574 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ixdaS-00048d-Oo
	for alex.bennee@linaro.org; Fri, 31 Jan 2020 16:12:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60530)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1ixdZD-0002r0-QP
 for qemu-devel@nongnu.org; Fri, 31 Jan 2020 16:11:08 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1ixdZC-00036M-NT
 for qemu-devel@nongnu.org; Fri, 31 Jan 2020 16:11:07 -0500
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442]:37439)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1ixdZC-00033v-Ex; Fri, 31 Jan 2020 16:11:06 -0500
Received: by mail-wr1-x442.google.com with SMTP id w15so10303584wru.4;
 Fri, 31 Jan 2020 13:11:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=V2AmHIlbU76zIkcF/u/ceGhk60yLlbr1/AGmeHDgj7Q=;
 b=vch9QieTrt2vV8Vxr2DnkzzFKYP07yX+t93oPBqOAZuBCd7Lry+L77DvLSxpFeaoGY
 t3pGyAtinKZyX3PQmE7HytBwHzgCyvZnk4ap/C6twZ4bbJ2XFT1FhTxYgXrFrsGhqT3l
 Wy6PIaqF0KWIGmW8dLYhoVQOAp3T3nzrKuK0exy/F314wR0Iop9nnMjbWogz/2mhUqDr
 xFt0KPmSBTn2aoeVPw16XlDZHU5C2EGAzDjf6hmA2c9vnb+6x8fKrU0r16zaOW7ZDPHj
 LHNl3g+BvvByzG/xWA1aeWLj03Kh68BxmWUX58BEFQf+rR8TeZIM2A7TwlpRU58UO4os
 Ye5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=V2AmHIlbU76zIkcF/u/ceGhk60yLlbr1/AGmeHDgj7Q=;
 b=s/sr51iFSKF6nEvIAzMhzMrvOnos4SJXWiBCyySMAkoSplhBtiZnMzeNigdDRnvF56
 V7rrO06GFM2EI2gxhqQk0z8J6/JdLjhoSd7YfvkbWK7fT+/ohB6vofjgXx1Y2XV9bXPk
 993RzKBYAWFbaFbrBD7jjkDpVxcxp6v+zfyIwOMH8AI/Td+tf5ZrtErqpNDvSxVUWnW9
 4mcMJMuLKyDCKE8pM1ULnZs8xa6m1oFwQAzDxJahXcP0cLiLKCXxPN13ort7z1L2v7fe
 1jJpxvInFcd4vhnC8hqUtShu4pRJJUT6RP180YceDnJHYlFSKKAJ92xdUC8PzAGVOG7c
 hqEQ==
X-Gm-Message-State: APjAAAXJmrpPs8PeLXdpESNe30UlQJzfx6jqEnOb3I6UpUVVTR0s0nuA
 O883pFB/HWf0cJm4UDqi950tS46i
X-Received: by 2002:adf:fe43:: with SMTP id m3mr316471wrs.213.1580505065011;
 Fri, 31 Jan 2020 13:11:05 -0800 (PST)
Received: from x1w.redhat.com (113.red-83-57-172.dynamicip.rima-tde.net.
 [83.57.172.113])
 by smtp.gmail.com with ESMTPSA id d204sm12236025wmd.30.2020.01.31.13.11.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 31 Jan 2020 13:11:03 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/2] tests/acceptance/integratorcp: Verify Tux is displayed on
 framebuffer
Date: Fri, 31 Jan 2020 22:11:00 +0100
Message-Id: <20200131211102.29612-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.21.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::442
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 qemu-arm@nongnu.org, Gerd Hoffmann <kraxel@redhat.com>,
 Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: tpwGGpnt7GWG

Hi,

This is a simple Avocado test that use OpenCV to find the
Tux logo on the framebuffer screen dump.

It is very fast, around 4 seconds on my laptop.

Tux found by OpenCV: https://pasteboard.co/ISz7kr8.png

Regards,

Phil.

Based-on: <20200131170233.14584-1-thuth@redhat.com>
"tests/acceptance: Add a test for the integratorcp arm machine"
https://www.mail-archive.com/qemu-devel@nongnu.org/msg675828.html

Philippe Mathieu-Daudé (2):
  tests/acceptance: Extract boot_integratorcp() from test_integratorcp()
  tests/acceptance/integratorcp: Verify Tux is displayed on framebuffer

 tests/acceptance/machine_arm_integratorcp.py | 67 ++++++++++++++++++--
 1 file changed, 61 insertions(+), 6 deletions(-)

-- 
2.21.1

