Received: by 2002:a17:906:d149:b0:a5d:17e5:aef9 with SMTP id br9csp1629854ejb;
        Fri, 24 May 2024 04:33:58 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUNkhCFKJJMlqAclc2+gmvqRJeq117lQEVJhOakCXjF4U8rJk15d19g+I2SjkYGOo8mzhgDEMocrSJZ4CcFkSfFtpRm92hf
X-Google-Smtp-Source: AGHT+IE1toR3nDdlCT/uXWHS7LNfOIoq4E3ykK8pk/kklxzLdBibXI/6Mu3zvfp4g2YJ4+LS5OEx
X-Received: by 2002:ae9:e713:0:b0:790:f4dc:ba36 with SMTP id af79cd13be357-794ab0c253dmr244855185a.33.1716550437854;
        Fri, 24 May 2024 04:33:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1716550437; cv=none;
        d=google.com; s=arc-20160816;
        b=i1ZQfjp/5tdf7HI+fV8DLhY/BR2J0mubC3AgAJQbYpWypX70aWeNOixn3OfXOP/oeV
         DvD8u1gmm8NffBm6jfqAm1A2/rGVmnFvkATmbVFuqv9DO+NyqxH+zaoqwLdLBQOHrH2m
         4Oa8D+b9vP9emG/ruLy4XHO6rujBqm0dVR1TghC6L7B8gYeNztiOLYNO2obHTQ6N40kh
         cxc77kF5CYItqWNIe/eL00mLEO7Thn8x8gWgQ29UHGsqbbRswIJ7km/2WHpI1EBPVWwk
         CayGBRgY3co47BSQg6tXGqBrJzeYMCFAnx1N9rPavArYWoKcdqIFS4XbJaoyuyA4gkE2
         IHhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from;
        bh=PfKmQLweMdrZKhK/1R0uAgncFqU8++bllF7zjSpylWo=;
        fh=c2LyUu5T4HvIPebxySNfbc/Fi+5MyC4524KDSeSAZYk=;
        b=x2jb0h/W9XaZvvPXa9MYTZ1g43IMrlZmyIuqOIZvKpssv3moJEBi5V8aiTrox3VXmR
         H1TNQTb0pBwaxQWTkmt8N2CkUhyAb8kt+ypwWGkqyCRz+EbAKrH4/0qxvDdcYAUII4j+
         mwfVa/+zwAgeR/Idr8EDk/uT/nlLUPBuuQFUtF78iJGfagBA3sc5mVeiRFl72oLhkcT4
         IghWY98Md38Vm5bFz8HYPylIh4apqNsFZThm2/N6jX9I/OP3sfPHxzfdMfoP6niQmiIm
         D/vDffVk8+wIoCXtiLAyha1mRGaMS18ZYTC+DQIjIFwP/r7afD6p3SDTXQimyCSb7Lg/
         u3jA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-794abcac258si133348285a.118.2024.05.24.04.33.57
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 24 May 2024 04:33:57 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1sATAf-00081k-83; Fri, 24 May 2024 07:33:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sebastian.huber@embedded-brains.de>)
 id 1sATAb-00080E-85; Fri, 24 May 2024 07:33:09 -0400
Received: from dedi548.your-server.de ([85.10.215.148])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sebastian.huber@embedded-brains.de>)
 id 1sATAZ-00085z-Mv; Fri, 24 May 2024 07:33:08 -0400
Received: from sslproxy02.your-server.de ([78.47.166.47])
 by dedi548.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
 (Exim 4.96.2) (envelope-from <sebastian.huber@embedded-brains.de>)
 id 1sATAT-000HaK-1i; Fri, 24 May 2024 13:33:01 +0200
Received: from [82.100.198.138] (helo=mail.embedded-brains.de)
 by sslproxy02.your-server.de with esmtpsa (TLS1.3) tls TLS_AES_256_GCM_SHA384
 (Exim 4.96) (envelope-from <sebastian.huber@embedded-brains.de>)
 id 1sATAU-000A7y-0h; Fri, 24 May 2024 13:33:01 +0200
Received: from localhost (localhost [127.0.0.1])
 by mail.embedded-brains.de (Postfix) with ESMTP id 18937480197;
 Fri, 24 May 2024 13:33:01 +0200 (CEST)
Received: from mail.embedded-brains.de ([127.0.0.1])
 by localhost (zimbra.eb.localhost [127.0.0.1]) (amavis, port 10032)
 with ESMTP id m3kjKpI6PHYS; Fri, 24 May 2024 13:33:00 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by mail.embedded-brains.de (Postfix) with ESMTP id C07674801F0;
 Fri, 24 May 2024 13:33:00 +0200 (CEST)
X-Virus-Scanned: amavis at zimbra.eb.localhost
Received: from mail.embedded-brains.de ([127.0.0.1])
 by localhost (zimbra.eb.localhost [127.0.0.1]) (amavis, port 10026)
 with ESMTP id FWfNSfQ2wmVS; Fri, 24 May 2024 13:33:00 +0200 (CEST)
Received: from zimbra.eb.localhost (unknown [192.168.96.242])
 by mail.embedded-brains.de (Postfix) with ESMTPSA id 8DC43480049;
 Fri, 24 May 2024 13:33:00 +0200 (CEST)
From: Sebastian Huber <sebastian.huber@embedded-brains.de>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Luc Michel <luc@lmichel.fr>
Subject: [PATCH v2 0/2] Fix GICv2 handling of pending interrupts
Date: Fri, 24 May 2024 13:32:54 +0200
Message-Id: <20240524113256.8102-1-sebastian.huber@embedded-brains.de>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Authenticated-Sender: smtp-embedded@poldi-networks.de
X-Virus-Scanned: Clear (ClamAV 1.0.3/27285/Fri May 24 10:30:55 2024)
Received-SPF: pass client-ip=85.10.215.148;
 envelope-from=sebastian.huber@embedded-brains.de; helo=dedi548.your-server.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: 99dMpBvvsswJ

v2:

* Fix handling of SPIs.

* Remove pending state if not in new target list.

Sebastian Huber (2):
  hw/intc/arm_gic: Fix set pending of PPIs
  hw/intc/arm_gic: Fix writes to GICD_ITARGETSRn

 hw/intc/arm_gic.c | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

--=20
2.35.3

