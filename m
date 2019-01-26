Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp1136508wrt;
        Fri, 25 Jan 2019 22:52:47 -0800 (PST)
X-Google-Smtp-Source: ALg8bN44S/ZvIqxeSaNFNJImq7lFtNleLv+Z0YnOzt5ODgi6vEQinc4sX7tKNC1ujQ6DsaO9a6hC
X-Received: by 2002:a5d:50c5:: with SMTP id f5mr13506239wrt.37.1548485567350;
        Fri, 25 Jan 2019 22:52:47 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1548485567; cv=none;
        d=google.com; s=arc-20160816;
        b=e2d+9y9yVUey2wBCmlxhQc0keoWfKG+hK+Q2XsG2HBFMDudhDHsKewo5oUtDN29Mo4
         7gwg8FdU9Us8BCjtn1uxjCSJ9NMiothRqowCSVMBVnkHdno8Vowyl9Vl5CXTTzR131Ds
         7ztsqb5wCaB8nFEi2xjOAOrq89Oq7UKv7HAjhDnhUb/K/TN6KJp4Y3wj+G2/6x1UO9hN
         sZoQWnaIoqZjN4lLzQBS5K9vxSx/UFad+r3jEvX2SfJkIcNxz36qDIWjXzXlxHzPKzJP
         bT5GTGRnLeqsXDfOZNUNH7+Yv4643OZzQAdS7uWh+mfZ9KYZ6ZcObWkN00FO62hqAdBP
         6woA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=6n5S0HitPg5PBIMFio60bXr1XdC6GUkPIy/w8YsSf9M=;
        b=b+6fjF12gtCB3yMMWkPQ+NUUlqd7aFFwgER3hi6EZS9/frtj/0qq4SsixlGoIyAq2r
         QxGf6L/TfkjKGB0FS+ecQOrhUm/trIS+4JHhDkVAIPeP8ed2xms0V2ZGZ8YtXxNlVngz
         rBHb0ZH6I2j0t3irjDEK2RB9qw1RTuXqP/Z7Tn9i5bf4aAkyCtBloJ3oKLA6C6uXNUwQ
         UvhFryEEofTnIwugwf28491AYoQW4rSQcTim4Tx0idfUL13ZTS5QvzW7IKA+O0m6sFGM
         5IvCdo3FJSlv6nbGIXEDXM17atHklhi2aIgdX/qhulkkVoNBvZCkRxti5/62cmvRYvGM
         eqbg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id z83si42309328wmg.180.2019.01.25.22.52.47
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 25 Jan 2019 22:52:47 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([127.0.0.1]:55901 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gnHpe-0004Pm-Fn
	for alex.bennee@linaro.org; Sat, 26 Jan 2019 01:52:46 -0500
Received: from eggs.gnu.org ([209.51.188.92]:33482)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <remi@remlab.net>) id 1gnHpT-0004Pb-CJ
	for qemu-arm@nongnu.org; Sat, 26 Jan 2019 01:52:36 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <remi@remlab.net>) id 1gnHp8-00012s-UV
	for qemu-arm@nongnu.org; Sat, 26 Jan 2019 01:52:16 -0500
Received: from poy.remlab.net ([2001:41d0:2:5a1a::]:48100
	helo=ns207790.ip-94-23-215.eu) by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <remi@remlab.net>)
	id 1gnHp8-0000yD-JQ; Sat, 26 Jan 2019 01:52:14 -0500
Received: from basile.remlab.net (ip6-localhost [IPv6:::1])
	by ns207790.ip-94-23-215.eu (Postfix) with ESMTP id C98715FA43;
	Sat, 26 Jan 2019 07:52:11 +0100 (CET)
From: =?UTF-8?q?R=C3=A9mi=20Denis-Courmont?= <remi@remlab.net>
To: qemu-arm@nongnu.org
Date: Sat, 26 Jan 2019 08:52:10 +0200
Message-Id: <20190126065211.3587-1-remi@remlab.net>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <1648289.tQCHxfjYn9@basile.remlab.net>
References: <1648289.tQCHxfjYn9@basile.remlab.net>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2001:41d0:2:5a1a::
Subject: [Qemu-arm] [PATCHv2 1/3] target/arm: fix AArch64 virtual address
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
X-TUID: 66B6mGBgocUk

From: Remi Denis-Courmont <remi.denis.courmont@huawei.com>

Since QEMU does not support the ARMv8.2-LVA, Large Virtual Address,
extension (yet), the VA address space is 48-bits plus a sign bit. User
mode can only handle the positive half of the address space, so that
makes a limit of 48 bits.

(With LVA, it would be 53 and 52 bits respectively.)

The incorrectly large address space conflicts with PAuth instructions,
which bits 48-54 and 56-63 for the pointer authentication code. This
also conflicts with (as yet unsupported by QEMU) data tagging and with
the ARMv8.5-MTE extension.

Signed-off-by: Remi Denis-Courmont <remi.denis.courmont@huawei.com>
---
 target/arm/cpu.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index ff81db420d..a3781600ba 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -2503,7 +2503,7 @@ bool write_cpustate_to_list(ARMCPU *cpu);
=20
 #if defined(TARGET_AARCH64)
 #  define TARGET_PHYS_ADDR_SPACE_BITS 48
-#  define TARGET_VIRT_ADDR_SPACE_BITS 64
+#  define TARGET_VIRT_ADDR_SPACE_BITS 48
 #else
 #  define TARGET_PHYS_ADDR_SPACE_BITS 40
 #  define TARGET_VIRT_ADDR_SPACE_BITS 32
--=20
2.20.1

