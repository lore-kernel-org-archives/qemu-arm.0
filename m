Received: by 2002:a5d:51d0:0:0:0:0:0 with SMTP id n16csp7042585wrv;
        Mon, 22 Jul 2019 08:48:10 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxfl/jxqChE0i72i9u9KiTlT8P6tdjqAy5EBH7mXXQdNIz3VAO9XD/7+3RKpfwOBecci6wZ
X-Received: by 2002:a67:8081:: with SMTP id b123mr43958563vsd.117.1563810490795;
        Mon, 22 Jul 2019 08:48:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1563810490; cv=none;
        d=google.com; s=arc-20160816;
        b=kJW+pQOJyQJ6dLn9LRKXrZDY5kixxSj0zK5+1wpWTeWLfUi68iUAVBK99VstriBzlP
         GNRXWBY1S6LYzlQYk+/WWALwuvyudB2ULN/B51r9SdSfkjVRvKxmAm4f5gK9DSyAIzzx
         HkXImJR2G6EOXiMSu8tjlf6mXBV9iX27WjRuFzsvD37rpERsJAAO1zwCupooStb4prVf
         Y17zgeVwCNBoQARtRY2cMmGkgB6PDCnSusSKX8xiIClJRaGhbPtz/v4KEoVAhRpK6DFj
         Prxznk0/vwI2l+RkA6dQrTHO4eZH6nqbRuPWBOIneTs1jD05ssS/Idmcp+l81DKwq03+
         CBDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:content-language
         :accept-language:in-reply-to:references:message-id:date:thread-index
         :thread-topic:to:from;
        bh=8HOZrlr6Y6uei3bLliqEFmiPLvfjT4QoTZN4MQUx+mk=;
        b=pfh+ehezu2dPvK/4XNKPl3200z9LdKKAtYOOOmvZNyalxUUF6yJvMOebdAN0LZDBvQ
         K+863pTlntsKUu8nnzKpLRE1FjEBZ9a/dGJNME0kjItckwyFOcAqdjYgLjKJwSxvsLkK
         o9T99CeiNPvq8H+5racmWB/gxq0Y9yRTjsLebht93cdvxusLjRdapCbYBFn1g95x7mRr
         wM8NfboTm0C1tCdiQUK3uvZ7IhsYVv4WHbpcMtOyMbeDKAA2xJqqWc8s0eZlIu/gf+Ah
         upVj/Vyp9z9lgYD0IAA37eoXfonYu0WhnvNdGazyOy0jTEFfHcO8XhgzEbXC2D/jOKko
         K7xA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=bt.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id k70si9800802vsd.57.2019.07.22.08.48.10
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 22 Jul 2019 08:48:10 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=bt.com
Received: from localhost ([::1]:34926 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hpaXq-0001m2-6U
	for alex.bennee@linaro.org; Mon, 22 Jul 2019 11:48:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53420)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <tony.nguyen@bt.com>) id 1hpaXU-0000tP-0u
 for qemu-devel@nongnu.org; Mon, 22 Jul 2019 11:47:49 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <tony.nguyen@bt.com>) id 1hpaXQ-0007D1-1G
 for qemu-devel@nongnu.org; Mon, 22 Jul 2019 11:47:46 -0400
Received: from smtpe1.intersmtp.com ([213.121.35.78]:11937)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <tony.nguyen@bt.com>)
 id 1hpaX5-00071G-16; Mon, 22 Jul 2019 11:47:23 -0400
Received: from tpw09926dag18e.domain1.systemhost.net (10.9.212.18) by
 BWP09926083.bt.com (10.36.82.114) with Microsoft SMTP Server (version=TLS1_2, 
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.1.1713.5; Mon, 22
 Jul 2019 16:45:56 +0100
Received: from tpw09926dag18e.domain1.systemhost.net (10.9.212.18) by
 tpw09926dag18e.domain1.systemhost.net (10.9.212.18) with Microsoft SMTP
 Server (TLS) id 15.0.1395.4; Mon, 22 Jul 2019 16:45:56 +0100
Received: from tpw09926dag18e.domain1.systemhost.net
 ([fe80::a946:6348:ccf4:fa6c]) by tpw09926dag18e.domain1.systemhost.net
 ([fe80::a946:6348:ccf4:fa6c%12]) with mapi id 15.00.1395.000; Mon, 22 Jul
 2019 16:45:56 +0100
From: <tony.nguyen@bt.com>
To: <qemu-devel@nongnu.org>
Thread-Topic: [Qemu-devel] [PATCH v2 08/20] target/mips: Access MemoryRegion
 with MemOp
Thread-Index: AQHVQKSNE9Apjwo+sUuRTOACfuKYCQ==
Date: Mon, 22 Jul 2019 15:45:56 +0000
Message-ID: <1563810356505.44472@bt.com>
References: <e9c6e5310b1a4863be45d45bf087fc3d@tpw09926dag18e.domain1.systemhost.net>
In-Reply-To: <e9c6e5310b1a4863be45d45bf087fc3d@tpw09926dag18e.domain1.systemhost.net>
Accept-Language: en-AU, en-GB, en-US
Content-Language: en-AU
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.187.101.37]
MIME-Version: 1.0
X-detected-operating-system: by eggs.gnu.org: Windows 7 or 8 [fuzzy]
X-Received-From: 213.121.35.78
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
X-Content-Filtered-By: Mailman/MimeDel 2.1.23
Subject: [Qemu-devel] [PATCH v2 08/20] target/mips: Access MemoryRegion with
 MemOp
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
Cc: peter.maydell@linaro.org, walling@linux.ibm.com, mst@redhat.com,
 palmer@sifive.com, mark.cave-ayland@ilande.co.uk, Alistair.Francis@wdc.com,
 arikalo@wavecomp.com, david@redhat.com, pasic@linux.ibm.com,
 borntraeger@de.ibm.com, rth@twiddle.net, atar4qemu@gmail.com,
 ehabkost@redhat.com, sw@weilnetz.de, qemu-s390x@nongnu.org,
 qemu-arm@nongnu.org, david@gibson.dropbear.id.au, qemu-riscv@nongnu.org,
 cohuck@redhat.com, claudio.fontana@huawei.com, alex.williamson@redhat.com,
 qemu-ppc@nongnu.org, amarkovic@wavecomp.com, pbonzini@redhat.com,
 aurelien@aurel32.net
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: fG+RZmUEFk1L

Signed-off-by: Tony Nguyen <tony.nguyen@bt.com>
---
 target/mips/op_helper.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/target/mips/op_helper.c b/target/mips/op_helper.c
index 9e2e02f..dccb8df 100644
--- a/target/mips/op_helper.c
+++ b/target/mips/op_helper.c
@@ -24,6 +24,7 @@
 #include "exec/helper-proto.h"
 #include "exec/exec-all.h"
 #include "exec/cpu_ldst.h"
+#include "exec/memop.h"
 #include "sysemu/kvm.h"

 /*************************************************************************=
****/
@@ -4740,11 +4741,11 @@ void helper_cache(CPUMIPSState *env, target_ulong a=
ddr, uint32_t op)
     if (op =3D=3D 9) {
         /* Index Store Tag */
         memory_region_dispatch_write(env->itc_tag, index, env->CP0_TagLo,
-                                     8, MEMTXATTRS_UNSPECIFIED);
+                                     SIZE_MEMOP(8), MEMTXATTRS_UNSPECIFIED=
);
     } else if (op =3D=3D 5) {
         /* Index Load Tag */
         memory_region_dispatch_read(env->itc_tag, index, &env->CP0_TagLo,
-                                    8, MEMTXATTRS_UNSPECIFIED);
+                                    SIZE_MEMOP(8), MEMTXATTRS_UNSPECIFIED)=
;
     }
 #endif
 }
--
1.8.3.1


