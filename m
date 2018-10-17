Received: by 2002:a5d:4c4c:0:0:0:0:0 with SMTP id n12-v6csp23470wrt;
        Tue, 16 Oct 2018 18:39:24 -0700 (PDT)
X-Google-Smtp-Source: ACcGV61OmgAdQPELwFH0ovDOC4o6Hy+YaImyCc+z81JY9q6pO07SOS8YuUWClpip7mTlO9RRKQNq
X-Received: by 2002:a37:4250:: with SMTP id p77-v6mr18334768qka.91.1539740364542;
        Tue, 16 Oct 2018 18:39:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1539740364; cv=none;
        d=google.com; s=arc-20160816;
        b=i/znSGtntPHtd2awvAcVDPWOI1o5PxgDXOQkO5T6q5l1RiW/m2rIwY7eN4tdh4Fj/F
         lJBtk41OX4rDYk1jK3lg2rtKABwRgDiAekk3GIldT+4mLwKYaXLDWqr3lI4PZ6vDaSh8
         6Bh/XwsJ3mTNqKUHzecfGaJvWofV0qfT4HuYHMlhA7916PW10uBZFYtTk8rFzZRLyaRc
         eG/mAhLYf64WyjuPCWUbgv9IKcwk6PwrdCBr9HrqX4ZVW5vDYri18uNfem/U2aOVVkfV
         TS0nJQBAzbK68eM+W7nj8LsfkZXpNwAZML4UNurXmDrU5sMCGmgCpMV3qd++36joTCLY
         8QDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:from:mime-version
         :references:in-reply-to:message-id:date;
        bh=tHzcH9J8QDiHaTsaum5M1FHW+3yOlnP4uBHD4k3lgVc=;
        b=nEtE5g/wAxylzJbgj5q60i2kQW53oe4yYRDeFRSV0Ht+i/7jt+RaRAXIOFfGqFwGMf
         QTgO843LhFUeK4nrDo1wlr7KnLx7Hw7k9zjBWr+3tDIETBXaZ1BFR4vBAWBJ+UoAE2kA
         T9D98cWaHDXHpd75jxLeMrBHSF0Z2AWZOmkti7a2IKhYToBgcwUiDJQ9fI2pLGsQvQ+i
         3+gik6/ZvXg0hYmDc7fbvly/WciJ1KgZztb1C2o6tuO4CqVOHgI1dPoDZtg/T24BJtZ6
         u7vDQzgr+iiBOnS3DPthzEXNNO942i5+qM0dtLJ8AeW6Zv1T8nNIk1Kt+2bBTudWoYV6
         sllQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id n79-v6si1745699qka.101.2018.10.16.18.39.24
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 16 Oct 2018 18:39:24 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:33332 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gCao0-0006iR-2r
	for alex.bennee@linaro.org; Tue, 16 Oct 2018 21:39:24 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:44715)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peng.hao2@zte.com.cn>) id 1gCanq-0006i5-FW
	for qemu-arm@nongnu.org; Tue, 16 Oct 2018 21:39:15 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peng.hao2@zte.com.cn>) id 1gCanl-0006Hs-FA
	for qemu-arm@nongnu.org; Tue, 16 Oct 2018 21:39:14 -0400
Received: from mx7.zte.com.cn ([202.103.147.169]:47596 helo=mxct.zte.com.cn)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <peng.hao2@zte.com.cn>)
	id 1gCanl-0006Eq-27; Tue, 16 Oct 2018 21:39:09 -0400
Received: from mse02.zte.com.cn (unknown [10.30.3.21])
	by Forcepoint Email with ESMTPS id 07BC4ADE840A34ABDDA6;
	Wed, 17 Oct 2018 09:39:06 +0800 (CST)
Received: from kjyxapp05.zte.com.cn ([10.30.12.204])
	by mse02.zte.com.cn with SMTP id w9H1cwb5093160;
	Wed, 17 Oct 2018 09:38:58 +0800 (GMT-8)
	(envelope-from peng.hao2@zte.com.cn)
Received: from mapi (kjyxapp01[null]) by mapi (Zmail) with MAPI id mid14;
	Wed, 17 Oct 2018 09:39:00 +0800 (CST)
Date: Wed, 17 Oct 2018 09:39:00 +0800 (CST)
X-Zmail-TransId: 2b035bc692b45a845fe0
X-Mailer: Zmail v1.0
Message-ID: <201810170939000153425@zte.com.cn>
In-Reply-To: <7847659e-4514-6f4c-a0d7-7434ed486227@linaro.org>
References: 1539768207-18209-1-git-send-email-peng.hao2@zte.com.cn,
	7847659e-4514-6f4c-a0d7-7434ed486227@linaro.org
Mime-Version: 1.0
From: <peng.hao2@zte.com.cn>
To: <richard.henderson@linaro.org>
Content-Type: multipart/mixed;
	boundary="=====_001_next====="
X-MAIL: mse02.zte.com.cn w9H1cwb5093160
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 202.103.147.169
Subject: Re: [Qemu-arm] 
 =?utf-8?q?=5BQemu-devel=5D_=5BPATCH=5D_target/arm_=3A?=
 =?utf-8?q?_add_pvpanic_mmio_device?=
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
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ATFC1Cg6yVrd



--=====_001_next=====
Content-Type: multipart/alternative;
	boundary="=====_003_next====="


--=====_003_next=====
Content-Type: text/plain;
	charset="UTF-8"
Content-Transfer-Encoding: base64

Pk9uIDEwLzE3LzE4IDI6MjMgQU0sIFBlbmcgSGFvIHdyb3RlOgo+PiArKysgYi9ody9taXNjL3B2
cGFuaWMtbW1pby5jCj4+IEBAIC0wLDAgKzEsNzYgQEAKPj4gKyNpbmNsdWRlICJxZW11L29zZGVw
LmgiCj4KPk5ldyBmaWxlIHJlcXVpcmVzIGZpbGUgaGVhZGVyIHcvIGNvcHlyaWdodCBhbmQgbGlj
ZW5zZS4KSSB3aWxsIGhhbmRsZSBpdCBpbiBuZXcgdmVyc2lvbiAuVGhhbmtzCgo+cn4=


--=====_003_next=====--

--=====_001_next=====--

