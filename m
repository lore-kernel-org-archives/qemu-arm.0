Received: by 10.25.0.6 with SMTP id 6csp215014lfa;
        Fri, 26 May 2017 02:21:40 -0700 (PDT)
X-Received: by 10.200.44.41 with SMTP id d38mr1075238qta.182.1495790500470;
        Fri, 26 May 2017 02:21:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1495790500; cv=none;
        d=google.com; s=arc-20160816;
        b=YHj4ejrYB4cbK/rasYe7yPEbrIZLbRPu5adM2ewomPMUT/U7kmfLjWZbRJpyoSxp4Q
         LM4oRKbq8815G860x6TKByDoImvBwKvfiFhkd6C4znnxQydrxJuXO8/RPaAZti8B0r2a
         nd3btG2+2zFCftFNKTsSHcUSyihzpbbc8kElKzQGTroW2ungn2NMv8nv/t3UN54vUnZ0
         9p+peZqS+0zQj0SbNKWTqhS7eFyt2kcIflEbhkIBI59jy4itY/Edzn8HdL3zN+Sy/You
         KOVfFMjhxtFU3q8YU58KNQVqfmdJ0fKbmkjqu3lxMYezgTXS10wFqUW+7KoH6hY1fh89
         RfPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:message-id:date:to:from
         :dkim-signature:arc-authentication-results;
        bh=xmSOBugnzod5hsQ0IP0RULesJBbqU9Csmf3ydk8znJk=;
        b=ugG3+w0D+zMre48D5yY3bj9VQQZ8J1lBkX1jh+ewO73oftT+ExI0Majg2Xgeu+FOTp
         O9UlgiFbV7HIFbtNQIKO5pCUO/KknhJlqIbw4pWGs4Ky5ETmzE3dVYdwMce1ir5lI+t0
         l1SApkIg5Bl5Ols/AxrwqGDmkXefc7QB2XyqmtiahdpAD3s/M+b6bqETUNlCpoq2/e2n
         s78F3VFurLe20RBRLh0oeWwcJ5NCMwr3a+1Eo1dpbF9xiaBq1Gc3Oh70OgM5TbEBrfDV
         Dx4svb2B88jgdzzhx1jW0a6m85NQfPvLqMe0yv/dNjjcKngeQtMWBDz5rDvAmcIxvMyI
         sQsA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id y52si225582qty.173.2017.05.26.02.21.40
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 26 May 2017 02:21:40 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:35646 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dEBRD-0002dj-QA
	for alex.bennee@linaro.org; Fri, 26 May 2017 05:21:39 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45364)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhlcindy@gmail.com>) id 1dEBR3-0002dV-4W
	for qemu-arm@nongnu.org; Fri, 26 May 2017 05:21:29 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <zhlcindy@gmail.com>) id 1dEBQy-0005Wm-Ak
	for qemu-arm@nongnu.org; Fri, 26 May 2017 05:21:29 -0400
Received: from mail-pf0-x241.google.com ([2607:f8b0:400e:c00::241]:35637)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <zhlcindy@gmail.com>)
	id 1dEBQy-0005WZ-5t; Fri, 26 May 2017 05:21:24 -0400
Received: by mail-pf0-x241.google.com with SMTP id u26so1513347pfd.2;
	Fri, 26 May 2017 02:21:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=xmSOBugnzod5hsQ0IP0RULesJBbqU9Csmf3ydk8znJk=;
	b=p1dYRoNYNxZQ9O+h8qvuQCDBI1/CXP1DGhRS9oTmt5q/5sVSFIxRs97UgRgkZmF4RJ
	7149GuBLMxbA+n4BnLR64llPw2xcWx7LV4wNjwDIFSllNm7TrODp1XZrFOKdnLKtI6Lb
	f96Xqqdg6O0brxNEzLzlaADMbLxjZPAudjMAHWiIRI+o72QhgH84aYWJBWZLrDwdO2DA
	P54pU4J1f7ECEnNvtTdibjHmEPOSpoiX5jq+nZVoFjWZIWw95RNA5QJ96tfyaxJ97zcE
	xdLgrX7YhB6IWgaC3DAj+RDIENyg1+mjaIzgqlTAgEW11Zq05zI4dKHi0OAE6SXucjjx
	tcBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=xmSOBugnzod5hsQ0IP0RULesJBbqU9Csmf3ydk8znJk=;
	b=ivNVegapYCm4fhKfrLmFnZRQUIxnzJqES8hd9sRcCLYdtjjWxBslX0PZNdpbiGuFHG
	LKemLJppBbCFPxcjgHjeYYp6XfTupaeeVrUcLPHBzFLVgDnBfQaJnrvi3yG0jbxhNWfd
	9IMEKTF+qnWvzGF+ilNE3VTB6cA4xaDXD6npsnUeWs2rYbVDBz9fpi0gVCmiY9kM/yEf
	/Rx5KxLW1bG3ZNDF62o6kMmaEQhCJCbOBFLNABJISsOzrJrDQeSd3uxb9FJeExzVovLE
	1F5acdyRKjNiGSItRslfx/DlPvwvy7gOAyNWxvqEo/UUKH8id1ny0zT/CBPOCkY7Tp7X
	7lNw==
X-Gm-Message-State: AODbwcA8Yco0auVTsiomJXfBlUcB+6mM73Zut31M9ZwNJ7FHPZcBXh4p
	sVqw6XOPHSVLkg==
X-Received: by 10.99.123.81 with SMTP id k17mr1181280pgn.125.1495790482847;
	Fri, 26 May 2017 02:21:22 -0700 (PDT)
Received: from control2.hxtcorp.net ([223.203.96.18])
	by smtp.gmail.com with ESMTPSA id b2sm602187pgc.16.2017.05.26.02.21.19
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 26 May 2017 02:21:21 -0700 (PDT)
From: Li Zhang <zhlcindy@gmail.com>
To: peter.maydell@linaro.org,
	qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Fri, 26 May 2017 17:21:05 +0800
Message-Id: <1495790468-23862-1-git-send-email-zhlcindy@gmail.com>
X-Mailer: git-send-email 2.7.4
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c00::241
Subject: [Qemu-arm] [PATCH 0/3] arm/virt: refine virt.c code and implement
 hot_add_cpu interface
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Li Zhang <li.zhang@hxt-semitech.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: l2j2iWUd/6RL

From: Li Zhang <li.zhang@hxt-semitech.com>

virt machine doesn't support hot_add_cpu interface. This patchset is to implement
hot_add_cpu interface. A CPU can be added by QMP command with QEMU monitor.

Here is command to add a CPU with QMP command.

* qemu-system-aarch64 -machine virt -cpu cortex-a15 -smp 1,maxcpus=4 \
    -monitor telnet:127.0.0.1:4444,server,nowait -nographic
* connect monitor:      telnet 127.0.0.1 4444
* execute qmp command:  cpu-add 1

Currently, when KVM is enabled and add a CPU with QMP command, QEMU 
reports error "kvm_init_vcpu failed: Device or resourc busy". KVM can't
create a new CPU when vgic has been initialized and irqchip_in_kernel in
function kvm_arch_vcpu_create. It needs to change KVM code in the future.

Li Zhang (3):
  arm/virt: Refine fdt_add_cpu_nodes code
  arm/virt: Refine code of machvirt_init
  arm/virt: Implement hot_add_cpu interface

 hw/arm/virt.c | 344 ++++++++++++++++++++++++++++++++++------------------------
 1 file changed, 202 insertions(+), 142 deletions(-)

-- 
2.7.4

