Received: by 2002:a8a:1193:0:0:0:0:0 with SMTP id m19csp438885ocs;
        Wed, 28 Sep 2022 10:09:06 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM4W5m7UA2haR3QeBWPCHDqgOPFxJ9+TA98PZvtjdW37DmFB5xiIQUIqwl83ES7Y1dM0jo/f
X-Received: by 2002:ae9:ed90:0:b0:6cd:ef01:d3fa with SMTP id c138-20020ae9ed90000000b006cdef01d3famr22097646qkg.168.1664384946563;
        Wed, 28 Sep 2022 10:09:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1664384946; cv=none;
        d=google.com; s=arc-20160816;
        b=zSl0Oh5spRGlRqvJ7w+8iHBXj6+wJUBN1kLTG6tlpiFmMquZsQJG5kBUf1XwglchV7
         KZ7fgPgIRIr8WO67YKbaunCh0Hq7mnMzXazz0IvK0wZIFLuwoHap4lDKdgfCGQRDExRG
         INYVYioJaO4iaa82jHk+5kco5MEF+mCwLoaQdXsNxuRwHAP/FjXKcngS8dJRqcWPN8Gq
         EpQTk8onbn8gM5scgO60yAgR+bGLRB8fCpAzQfeFGfMUfcLW+ytvfkSKBHtjDeL5Q4/0
         Eta0IGyQK0tJ3bEE9feMbzGN2Np3rGZOmpt0LJldousQWInfuWzvavQb4YQ6TQO0tE+C
         eIQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from;
        bh=5i652ayWuK6513y1S0lBp2GyYIX0iLsNeh3VnhIJFQ8=;
        b=kUKsLpoP7Y5/nqAMpCiETPxojdEQWSNGUskceMbdxWAfkxIyR0oyI69/Ztaq5GUro+
         WBsVDQRizOXuDvRgjUU6CIQUspwQPnAWO6s0fq1uDua0EblLpFQiabSqZGQuy+iD4IWH
         TfpcGWI7HfLqddflh/sBfzLhWLjdeMKOrqeLFMctxVkjGKjiEOvTM5Gn3T3WwdW7dEpQ
         c+wHyie69GmBhuVAS+SOKgAuKuNAJSPMh7vi3XwzavZu3ugH5bv3DkXhaF5paip429eQ
         6VdBN5Ww3K/C7dysh7wzpFldVTN7QnIXUA1Tj/ALuPvqWQb5PLzlByHS3mMQZjg88/qd
         qoFQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u18-20020a05622a011200b00342f8191b5asi3630762qtw.213.2022.09.28.10.09.06
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 28 Sep 2022 10:09:06 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:60008 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1odaYU-0000Zy-4p
	for alex.bennee@linaro.org; Wed, 28 Sep 2022 13:09:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53702)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=OEEd=Z7=kaod.org=clg@ozlabs.org>)
 id 1odaDk-0003id-VX; Wed, 28 Sep 2022 12:47:44 -0400
Received: from gandalf.ozlabs.org ([150.107.74.76]:53779)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=OEEd=Z7=kaod.org=clg@ozlabs.org>)
 id 1odaDj-0001HI-6r; Wed, 28 Sep 2022 12:47:40 -0400
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 by gandalf.ozlabs.org (Postfix) with ESMTP id 4Md2Ts6Vmsz4xGh;
 Thu, 29 Sep 2022 02:47:29 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4Md2Tq2QRRz4xGT;
 Thu, 29 Sep 2022 02:47:27 +1000 (AEST)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Subject: [PATCH 0/2] ast2600: Disable NEON and VFPv4-D32
Date: Wed, 28 Sep 2022 18:47:17 +0200
Message-Id: <20220928164719.655586-1-clg@kaod.org>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=150.107.74.76;
 envelope-from=SRS0=OEEd=Z7=kaod.org=clg@ozlabs.org; helo=gandalf.ozlabs.org
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.25, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: UPohPE+2UmyG

Hello,

Currently, the CPU features exposed to the AST2600 QEMU machines are :

  half thumb fastmult vfp edsp neon vfpv3 tls vfpv4 idiva idivt
  vfpd32 lpae evtstrm

But, the features of the Cortex A7 CPU on the Aspeed AST2600 A3 SoC
are :

  half thumb fastmult vfp edsp vfpv3 vfpv3d16 tls vfpv4 idiva idivt
  lpae evtstrm

NEON support should be dropped and, in that case, QEMU should
advertise a VFPv4 unit with 16 double-precision registers, and not 32
registers.

This problem was raised by a buildroot rootfs compiled with vfpv4.
Boot went fine under QEMU but on real HW, user space binaries had
issues with output. Compiling buildroot with vfpv4d16 fixed it and
I didn't dig further. Nevertheless, it would be nice to catch such
issues with QEMU.

Thanks,

C. 

Cédric Le Goater (2):
  target/arm: Disable VFPv4-D32 when NEON is not available
  ast2600: Drop NEON from the CPU features

 hw/arm/aspeed_ast2600.c | 2 ++
 target/arm/cpu.c        | 4 ++++
 2 files changed, 6 insertions(+)

-- 
2.37.3

