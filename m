Received: by 10.28.71.155 with SMTP id m27csp955903wmi;
        Fri, 23 Mar 2018 14:43:50 -0700 (PDT)
X-Google-Smtp-Source: AIpwx4+J2TaOq9h9G+uSBX7SaoVNbBbBCUp2Pa+9L+JjA/tAS9wKCbBG1ASTJWndLV64CPZPqTtR
X-Received: by 10.237.45.132 with SMTP id i4mr15247038qtd.64.1521841430432;
        Fri, 23 Mar 2018 14:43:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1521841430; cv=none;
        d=google.com; s=arc-20160816;
        b=XrukrirsUdskrtVa+bcUqJe6BFfMxsk8GImV7BOwHw+2blndz4R6vKYo99wH4BkAX/
         x795LiQqFY9t1d0yykrNYIwkvXSASCISBXOP6N/XvfTvN2tXPdPUb6GgA1ezdS1PMRjZ
         MaRDLWT8kKBVGaBrsFNVyeubQmGg7LzBEAiJHTr3ae2wSxBEmg8l/4QjgAYahUGc+Ytk
         56vkv0rObEon3SLmZ6cqm9qxpdkWScdBnI1obXP3W0fVyK4K0zoKbJ+TYgmQ8wC94puG
         vUKbkIGzCi2OV0tue+nsS5zgKl6bQR59obANmcVQpZKf19TIfrjydaJX1hRZv3zJF1BY
         98Lg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-signature:arc-authentication-results;
        bh=eX2J2g0aJayXRlA5wdtH6IjLx/RHhQKe0Cicc0ENZqI=;
        b=DaiGoAepZc3ZM5LD8k6D1NacQiRoT8hj3YI12fMIvDuPfkuvdK1noYXfMvFtNQypG2
         4YbC8S74+Sves01tGutojskVVcvzY0/cKRCj5z/+OB6aPvwSlBMkmGeFityLvlZsrpdZ
         0weIx7oprnnXUZBeIvI3Qo2SIC42yaEMdO20owPoQrwc7hl+54SFKSDIkQlZCkO40xKB
         QofNXCCrVF7QBzR3vv2QmuSjYXr5sa8Z62PHKBzZJDxA/YCpO6kbIFE5o6593QaqnMey
         aC4PjFNqwO+HvqGcKVtxYrr0EQP/M/w4dUdib6bPoVYcH++jhEncCM2nM5uBkCKfIVbt
         cZGA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=I6CLxjBs;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id z85si3992318qkb.362.2018.03.23.14.43.50
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 23 Mar 2018 14:43:50 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=I6CLxjBs;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:39957 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ezUTV-00069f-VF
	for alex.bennee@linaro.org; Fri, 23 Mar 2018 17:43:50 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59810)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <onursahin08@gmail.com>) id 1ezUTM-00067W-2i
	for qemu-arm@nongnu.org; Fri, 23 Mar 2018 17:43:42 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <onursahin08@gmail.com>) id 1ezUTL-0006A0-4E
	for qemu-arm@nongnu.org; Fri, 23 Mar 2018 17:43:40 -0400
Received: from mail-qk0-x242.google.com ([2607:f8b0:400d:c09::242]:46084)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <onursahin08@gmail.com>)
	id 1ezUTG-000664-Kx; Fri, 23 Mar 2018 17:43:34 -0400
Received: by mail-qk0-x242.google.com with SMTP id o184so14457121qkd.13;
	Fri, 23 Mar 2018 14:43:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=eX2J2g0aJayXRlA5wdtH6IjLx/RHhQKe0Cicc0ENZqI=;
	b=I6CLxjBs8knh0nTA3c35oqRaLVjUj/YuxCqHbEt6OcPkPahB123qzYELDK+HZkG+n+
	OPfNbXzQoLF89hZRU6htRqFzuVfBNuSL9n22SHxvzbT4TbV5C4s3RfSbf2TULKQgIV3N
	5mLKTZlfXJ9uJrfz5z4bOC9X5qi8OmVx7DSh++Vk1OQfymm8D1/MRi/xsllXBwNia0Hj
	YaDCoH7jq+A1b7ZBP5MgNCd7twJtd2sHxbg+7uJjD83C6nz4IARtqF2YAJdSv+UahPKz
	ig+WTmdN2jMAdj6An0Fj50HBNFB5CAwDhwCZRRieH4yKUT7eNgJIGCSNIEoEratJw3m+
	bBog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=eX2J2g0aJayXRlA5wdtH6IjLx/RHhQKe0Cicc0ENZqI=;
	b=tqd8FS3Rzcn7fB5PEDvDpaczNIhwMK3z23OhZ7Tcg1QQihoQ3CWhiCl9kPE5CsIlUj
	pfQo/Qc+aKDyNseFXC9xMT4s6Aw6UW+zM0CzWSDf+HMEJWuvUntHc33H0uC2P8KB873m
	RhLwgCFk2zadZHRN0yVOMtBYlBP7KZLHFO29LaLhQfMXQPmZC0NAepQevYRCJl7QiOYV
	MYDFcnuXV4wi8FHndkfO24VWRNmk+O5c5HlInN7vxWavNaKA1YSDKA9QbrEd9NUIaaGe
	Cw1WHhItYXYwilSs6RxJZ5TVToanrXohJTyau0gxN+4LBn2Tbo/KZ+pR/tYszGmbESzy
	hICw==
X-Gm-Message-State: AElRT7HR0f1FtIleFtHmpvZOjtjydSl9z/lC5SveKMmf4TW9vOmf63WO
	eTTrCwyBhU10a64Q+OfhsUeNWAi4
X-Received: by 10.55.4.129 with SMTP id 123mr16022086qke.203.1521841413559;
	Fri, 23 Mar 2018 14:43:33 -0700 (PDT)
Received: from dhcp-acadmin-128-197-176-145.bu.edu (proteus.bu.edu.
	[128.197.176.135])
	by smtp.gmail.com with ESMTPSA id p2sm7320102qkf.71.2018.03.23.14.43.31
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 23 Mar 2018 14:43:32 -0700 (PDT)
From: Onur Sahin <onursahin08@gmail.com>
To: qemu-devel@nongnu.org
Date: Fri, 23 Mar 2018 17:43:06 -0400
Message-Id: <1521841386-27498-1-git-send-email-onursahin08@gmail.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <CAFEAcA9G3xVjmjys2R4-NXRHiZwLVLRO7ZQDZ0AhNMHHFhHV8A@mail.gmail.com>
References: <CAFEAcA9G3xVjmjys2R4-NXRHiZwLVLRO7ZQDZ0AhNMHHFhHV8A@mail.gmail.com>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c09::242
Subject: [Qemu-arm] [PATCH v2] target-arm: Check undefined opcodes for SWP
 in A32 decoder
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
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org,
	Onur Sahin <onursahin08@gmail.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 3f0jcWoUJ6Ui

Thanks for the feedback Peter. Removing the redundant check on bit
23 and adding checks for the "should be" bits as well (bits [11:8]).

The following patch should make sure we are not treating
architecturally Undefined instructions as a SWP, by verifying
the opcodes as per section A8.8.229 of ARMv7-A specification.

Best,
Onur

Signed-off-by: Onur Sahin <onursahin08@gmail.com>
---
 target/arm/translate.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/target/arm/translate.c b/target/arm/translate.c
index ba6ab7d..1fb0b8f 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -9227,11 +9227,14 @@ static void disas_arm_insn(DisasContext *s, unsigned int insn)
                             }
                         }
                         tcg_temp_free_i32(addr);
-                    } else {
+                    } else if ((insn & 0x00300f00) == 0) {
+                        /* 0bcccc_0001_0x00_xxxx_xxxx_0000_1001_xxxx
+                        *  - SWP, SWPB
+                        */
+
                         TCGv taddr;
                         TCGMemOp opc = s->be_data;
 
-                        /* SWP instruction */
                         rm = (insn) & 0xf;
 
                         if (insn & (1 << 22)) {
@@ -9249,6 +9252,8 @@ static void disas_arm_insn(DisasContext *s, unsigned int insn)
                                                 get_mem_index(s), opc);
                         tcg_temp_free(taddr);
                         store_reg(s, rd, tmp);
+                    } else {
+                        goto illegal_op;
                     }
                 }
             } else {
-- 
1.8.3.1

