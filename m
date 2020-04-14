Received: by 2002:ac2:52b1:0:0:0:0:0 with SMTP id r17csp4916740lfm;
        Tue, 14 Apr 2020 05:09:52 -0700 (PDT)
X-Google-Smtp-Source: APiQypIiZ66CdksMvWt9RlPBckSgbp9K0PeO7w5M4pKxN1N6WaEEJjpPzgynKGkj/seRMiN8TmRk
X-Received: by 2002:aed:3ec2:: with SMTP id o2mr12040776qtf.334.1586866192263;
        Tue, 14 Apr 2020 05:09:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1586866192; cv=none;
        d=google.com; s=arc-20160816;
        b=oKrOlCffRTX+WLpz92cuzmZbd/+5Z0TTn9JAONGOa3Nk0dGNbOnBZAWCBGE5zy9kwP
         qoVmWsp1hFxUe8mtOz5YiiLCelSRlm7kEu0R8rAHwgPiIlkyM57jbTT2qJEUfH7+Ko18
         AnnxFmUF+1qWO4HN6VUa69Yz1/7aGCt4FZmaIT+3VcqxSsulMv8g5UdB7ZyxCbziyzl6
         40U0z2pocX4ZqFq8SyL87khntxiJe7Yc86ZGWU8QowlTDq/RQtbizx89GNUHhfmdc+j+
         ppW10HfjtT+09kxCt8BtRK0Ef/jTLj2HXIbnM2dcWgbbLz5LQnR6EpHiO5RXmEc1aEbm
         nWjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from:dkim-signature;
        bh=v6Zv+pX1jlJqPpGlzzS0UHccRy5au45iW1uB7VR0uRk=;
        b=JpedWJGr5Ytq0KwYo/bPJRCl8u0fzMQUQ0nbxYS/BsfoRJngme7ClFI4z7rpG4ooml
         GWosUPhV17WCwmNQvAWs99ygWkFhQeBy6LZcn+EZN0dgmp7S4ZPvB+Sc3ckArdml9XnU
         Gwp08oFAQip9zGUSNWE2x5R3VaszTT/hI/eGp3GhVWNpm7bLwUpUyFUQTPNdKcYvuW7O
         joXiLNOsDHep3TphnqxNA3M4vtRJ2VaxyS4AS8JXdTHBkrJ08FhAL+MVRhcT7mhcXHbL
         IAjRgditUeiUnkd6JF99I512oeS1durQ7llg5IMDPLYIFuH8iHCiiimKtentE5fcxKEI
         pYvg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="A/lkR0fi";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s20si7373788qtb.249.2020.04.14.05.09.52
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 14 Apr 2020 05:09:52 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="A/lkR0fi";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:59290 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jOKNz-00071B-N7
	for alex.bennee@linaro.org; Tue, 14 Apr 2020 08:09:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59139)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1jOKNo-00070S-PS
 for qemu-arm@nongnu.org; Tue, 14 Apr 2020 08:09:41 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1jOKNn-0004o1-Gq
 for qemu-arm@nongnu.org; Tue, 14 Apr 2020 08:09:40 -0400
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443]:46404)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1jOKNn-0004nh-AE
 for qemu-arm@nongnu.org; Tue, 14 Apr 2020 08:09:39 -0400
Received: by mail-wr1-x443.google.com with SMTP id f13so14008698wrm.13
 for <qemu-arm@nongnu.org>; Tue, 14 Apr 2020 05:09:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=v6Zv+pX1jlJqPpGlzzS0UHccRy5au45iW1uB7VR0uRk=;
 b=A/lkR0fi6W7ZdKckfOiXkVnUHfqVDwqevglnG0zorUNwGX+Y981e96h8lc1NRmxIYm
 SzD+udUTZvDoOnyQAlKYwHN41FVFeSR90RpiMEF6I081FclcBbXRxwGw/dK2qirPFHFT
 wbzyDkZJJ1WfuQyGYvkfMcK15/GPvoISje721IzdlqPfYpBd6OXoXeST+fpa/Izl+isn
 7/IOHQpAgX2YT5g1rQ1oP0CXP/E2DLeOch/0+hUJlAKgvJjNIbGeHcx0WczkNb8L4Wvm
 dQ3D8gUgQte5bAGat9QhvTf5zV7LqvOLrBsRhz3GqyVWSrFDP5yEJAiDlIpMQfhUnENO
 JqFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=v6Zv+pX1jlJqPpGlzzS0UHccRy5au45iW1uB7VR0uRk=;
 b=h2XTEipN4Gos+XiDNmiKmkqAtSjGivxJtl5kbIfYNnBf4vj4gV423AUgwPnO6a5O1Q
 L1fQvo0XmVUY9Wsqxv6ZoRFtq/mgkTaybB1w1Pr9SqUQ0HA4q7PhhvTljqAPN5DEWGo/
 zJkWxzNG7Xxw6zgi/Cj1qLD9R+ylerIOL0YVWLvDp176W8agto76aiQrHHkpoPOUOYNY
 7He/zYAgWN/muzKDnsYWOo1wN06II26R7nfNMT4y6HnRCm+JhE8VI6+HUR9RxbueOzKc
 pjXFVj/nCBMa4D9Vf1OCesUKkcUzHF33NjesnV1tZVu6C8hrJoutgvyNJdAymhyvgWQx
 Z1yg==
X-Gm-Message-State: AGi0Pubk7zQuGklTWpwGqGdFR9em6ukQ0rGDE97CXrh2xt+8vPyQQhDl
 L4LC2e6Os8+ayTq7P1RKWyEPH0V86nhLag==
X-Received: by 2002:a5d:6645:: with SMTP id f5mr24741897wrw.280.1586866177813; 
 Tue, 14 Apr 2020 05:09:37 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id i25sm18391406wml.43.2020.04.14.05.09.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Apr 2020 05:09:37 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [for-5.0] Deprecate KVM support for AArch32
Date: Tue, 14 Apr 2020 13:09:35 +0100
Message-Id: <20200414120935.12719-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::443
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: vovMiLe+sEiy

The Linux kernel has dropped support for allowing 32-bit Arm systems
to host KVM guests (kernel commit 541ad0150ca4aa663a2, which just
landed upstream in the 5.7 merge window).  Mark QEMU's support for
this configuration as deprecated, so that we can delete that support
code in 5.2.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
I was reading the 5.7 merge window writeup on LWN this weekend
and saw that the dropping of 32-bit support had gone in; just
enough time to squeeze our deprecation warning into 5.0 so we
can drop the code in 5.2 rather than 6.0...

 docs/system/deprecated.rst | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/docs/system/deprecated.rst b/docs/system/deprecated.rst
index c633fe2beff..3142fac3865 100644
--- a/docs/system/deprecated.rst
+++ b/docs/system/deprecated.rst
@@ -336,6 +336,14 @@ The ``compat`` property used to set backwards compatibility modes for
 the processor has been deprecated. The ``max-cpu-compat`` property of
 the ``pseries`` machine type should be used instead.
 
+KVM guest support on 32-bit Arm hosts (since 5.0)
+'''''''''''''''''''''''''''''''''''''''''''''''''
+
+The Linux kernel has dropped support for allowing 32-bit Arm systems
+to host KVM guests as of the 5.7 kernel. Accordingly, QEMU is deprecating
+its support for this configuration and will remove it in a future version.
+Running 32-bit guests on a 64-bit Arm host remains supported.
+
 System emulator devices
 -----------------------
 
-- 
2.20.1

