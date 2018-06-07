Received: by 2002:a5d:4301:0:0:0:0:0 with SMTP id h1-v6csp2037420wrq;
        Thu, 7 Jun 2018 05:28:03 -0700 (PDT)
X-Google-Smtp-Source: ADUXVKJBsHbMbwNBVK3Rao/xPPv48b/ofUYnJqxJhQL4x5rSw2rt6RerQKusLo+mjbKIBrAqXKOB
X-Received: by 2002:aed:3c27:: with SMTP id t36-v6mr1427138qte.398.1528374483287;
        Thu, 07 Jun 2018 05:28:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1528374483; cv=none;
        d=google.com; s=arc-20160816;
        b=viGxLOLd492wIdTrnAWR0WB7oTs5ekbVFJCo/eItS6tVJAFW4ChsHuQLGJMRiaJ0fn
         rHlnwYkqR37n5yR4rXVX9mUwST9pdBGRJrDxR9sBS7CfJHbZWW4kc4kUPVrokrB4Vkqa
         kTb+iVOHS6Tf74T+Rm1BPzZ7zbRuGHZBABcj1F+3lMKpzGEQIcqW97Ic1pZ1fWVMFtjC
         VDn+4IsB4brlNxoQLbhXzyIVan26ikqDUUtgCRrBuL2NfHd3NhONA+DzkuHYqEceXn0z
         6Uc4m7F1i7fnW82g2tTlOokswNLrUCA10+PSnK+TMt3Swo/7m6ulIB87EnlsxeR7IkTl
         V8tw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:mime-version:message-id
         :date:to:from:arc-authentication-results;
        bh=tI7FWMc2nrno6hBzpUV61K6qVb0nsqXtQ7aVauTpFSY=;
        b=ILumVsL2wxdJNdtCO2fgSTU5vE6fZ5n9iP8wlkxyCjP0Qgp/1ZoH5ZkT6XPxQA6+mm
         iDbd5mkjXRBkahITkJMbu1SpJEpF6hDXzFPY9uuhItYoPWbO98C40/zcsA4hxFiTuigO
         00BmjU9Sm4bZa9ZeVXzutNcU4ZGLgbLOdKUtvyHtbcL0XGh3TyDIxU3n6PSJeTugz3Qo
         R32UduzHE45spCawNhR7nKoEQifIHG5H0DYKWsH2jFPy9UfQmJD3IBqZkjVpd170UhNX
         TVSTkbtijJ/RJMTQfPAVjOqJlIad3VxSLCHSKq/F57ifshRPwuhkmCdN22sl2sfTYNVG
         CGag==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 9-v6si834549qtn.162.2018.06.07.05.28.03
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 07 Jun 2018 05:28:03 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:57524 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fQu1K-0004pt-Pd
	for alex.bennee@linaro.org; Thu, 07 Jun 2018 08:28:02 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42997)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <gengdongjiu@huawei.com>) id 1fQtzF-00039o-13
	for qemu-arm@nongnu.org; Thu, 07 Jun 2018 08:25:54 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <gengdongjiu@huawei.com>) id 1fQtzA-0005my-0Q
	for qemu-arm@nongnu.org; Thu, 07 Jun 2018 08:25:53 -0400
Received: from [45.249.212.35] (port=47999 helo=huawei.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <gengdongjiu@huawei.com>)
	id 1fQtz9-0005l4-Ic; Thu, 07 Jun 2018 08:25:47 -0400
Received: from DGGEMS404-HUB.china.huawei.com (unknown [172.30.72.58])
	by Forcepoint Email with ESMTP id 60DEAC6BE3AC5;
	Thu,  7 Jun 2018 20:25:42 +0800 (CST)
Received: from localhost.localdomain (10.143.28.90) by
	DGGEMS404-HUB.china.huawei.com (10.3.19.204) with Microsoft SMTP Server
	id 14.3.382.0; Thu, 7 Jun 2018 20:25:36 +0800
From: Dongjiu Geng <gengdongjiu@huawei.com>
To: <peter.maydell@linaro.org>, <james.morse@arm.com>, <qemu-arm@nongnu.org>, 
	<qemu-devel@nongnu.org>, <gengdongjiu@huawei.com>, <linuxarm@huawei.com>
Date: Fri, 8 Jun 2018 04:30:58 +0800
Message-ID: <1528403460-30526-1-git-send-email-gengdongjiu@huawei.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.143.28.90]
X-CFilter-Loop: Reflected
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [fuzzy]
X-Received-From: 45.249.212.35
Subject: [Qemu-arm] [PATCH v3 RFC 0/2] add support for VCPU event states
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 0atz9HSiNFCs

support for KVM_GET/SET_VCPU_EVENTS to get/set the SError exception
state, and support the state migration.

change since v2:
1. add header definition for arm platform

change since v1:
1. update the code to fix the build errors

Dongjiu Geng (2):
  linux-headers: sync linux headers
  target: arm: Add support for VCPU event states

 linux-headers/asm-arm/kvm.h   | 12 ++++++++
 linux-headers/asm-arm64/kvm.h | 13 +++++++++
 linux-headers/linux/kvm.h     |  1 +
 target/arm/cpu.h              |  5 ++++
 target/arm/kvm64.c            | 64 +++++++++++++++++++++++++++++++++++++++++++
 target/arm/machine.c          |  3 ++
 6 files changed, 98 insertions(+)

-- 
1.8.3.1

