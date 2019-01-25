Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp832815wrt;
        Fri, 25 Jan 2019 15:02:34 -0800 (PST)
X-Google-Smtp-Source: ALg8bN6JoDiHiq4tRazZ7SJhCbzJ9m/qAZ+dn4hVCvtgyjQyAD4TPFSDa7uTQBpjPp2mMuSYMp9e
X-Received: by 2002:a1c:9d57:: with SMTP id g84mr8571613wme.16.1548457354422;
        Fri, 25 Jan 2019 15:02:34 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1548457354; cv=none;
        d=google.com; s=arc-20160816;
        b=Ziw9nptx6y0fMUQKIM4lIbkjm8N5q+ueagN+50JW8xJAtGzTVCxLceGlewEDgIqSAD
         FaT3TrVcqtVd5LbmwPULJ4DoMsfKdc22QD+ehhlgNeM7Fwen4spOs2WNY4mengzf8FXx
         juIiKOFg4qs3OleoA225ep7xP7trvJ68piqDpnX2fCANOZ6uocTFFGIFqgU/9bkLAYx7
         efuo5Kr0GutpTcu3hzTgYdcp63cv048oeXQAKmiRf09CNeIMt0KwhUuENZfVJq2VDj0I
         tLO5ky3pEKGAroCFu3MjG5w888lhUHZjP/QpLPE9kVAtmEieSO0haAnojMjmILQFMBTo
         1QaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=D9u5bCqAnq81VB8RrezB5khBBldw1IfFtHLixj9b37c=;
        b=0Rep92D9sJ3FILF33ns0C8BNFQMvk1VqH+xaaN9i9qFrduGk9rVT46Bar5k5ASEkRj
         VsUgoxIu7E+jsteywqdMlwikOJSiCBaNwEgixnQ/UrCkcrYvIpgJ5m2VxUaWDGjmIjL3
         33hH+Mvb0dCc4/YaE6+pNo0c/dNplUwQ07GnqptkmXIzJbgBBEhUGuw9nIQdMUPQI6J1
         naHyouhCwwEgZt0SMIyvZX+4EPf/8dihHiiZB4/i5WQCrOrnokywgvinwmd6AEMW5U+f
         8R5eDN3Eq30CCdEW2XMHEsT1OwJ1nns1L1BGY1pDYYNx1Mfow1TgkedwkbI5Ju/sHrse
         FejA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v76si29860267wmf.105.2019.01.25.15.02.34
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 25 Jan 2019 15:02:34 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([127.0.0.1]:52081 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gnAUb-00016P-DJ
	for alex.bennee@linaro.org; Fri, 25 Jan 2019 18:02:33 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52455)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <remi@remlab.net>) id 1gn9M5-0001SG-QC
	for qemu-arm@nongnu.org; Fri, 25 Jan 2019 16:49:42 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <remi@remlab.net>) id 1gn9M4-00031j-Ro
	for qemu-arm@nongnu.org; Fri, 25 Jan 2019 16:49:41 -0500
Received: from poy.remlab.net ([2001:41d0:2:5a1a::]:42980
	helo=ns207790.ip-94-23-215.eu) by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <remi@remlab.net>)
	id 1gn9M4-0002wd-4s; Fri, 25 Jan 2019 16:49:40 -0500
Received: from basile.remlab.net (ip6-localhost [IPv6:::1])
	by ns207790.ip-94-23-215.eu (Postfix) with ESMTP id 7918C5FA32;
	Fri, 25 Jan 2019 22:49:26 +0100 (CET)
From: =?UTF-8?q?R=C3=A9mi=20Denis-Courmont?= <remi@remlab.net>
To: qemu-arm@nongnu.org
Date: Fri, 25 Jan 2019 23:49:24 +0200
Message-Id: <20190125214926.3204-1-remi@remlab.net>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <1648289.tQCHxfjYn9@basile.remlab.net>
References: <1648289.tQCHxfjYn9@basile.remlab.net>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2001:41d0:2:5a1a::
X-Mailman-Approved-At: Fri, 25 Jan 2019 18:02:18 -0500
Subject: [Qemu-arm] [PATCH 1/3] target/arm: fix AArch64 virtual address
 space size
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: gq0IB+/I9/hJ

From: Remi Denis-Courmont <remi.denis.courmont@huawei.com>

Since QEMU does not support the ARMv8.2-LVA, Large Virtual Address,
extension (yet), the VA address space is signed 48-bits. User mode can
only handle the positive half of the address space, so that makes a
limit of 47 bits.

(With LVA, it would be 52 and 51 bits respectively.)

The incorrectly large address space conflicts with PAuth instructions,
which bits 48-54 and 56-63 for the pointer authentication code. This
also conflicts with (as yet unsupported by QEMU) data tagging and with
the ARMv8.5-MTE extension.

Signed-off-by: Remi Denis-Courmont <remi.denis.courmont@huawei.com>
---
 target/arm/cpu.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index ff81db420d..2ccd04b8f7 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -2503,7 +2503,7 @@ bool write_cpustate_to_list(ARMCPU *cpu);
=20
 #if defined(TARGET_AARCH64)
 #  define TARGET_PHYS_ADDR_SPACE_BITS 48
-#  define TARGET_VIRT_ADDR_SPACE_BITS 64
+#  define TARGET_VIRT_ADDR_SPACE_BITS 47
 #else
 #  define TARGET_PHYS_ADDR_SPACE_BITS 40
 #  define TARGET_VIRT_ADDR_SPACE_BITS 32
--=20
2.20.1

