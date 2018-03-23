Received: by 10.28.71.155 with SMTP id m27csp22303wmi;
        Thu, 22 Mar 2018 21:31:41 -0700 (PDT)
X-Google-Smtp-Source: AG47ELs1MK6vd20Ih67Dt9ta4xEAkrcV+TZkrO91/c7WJJ+JGO/lS0TpJeNguHrWRkGRdzXMQBpN
X-Received: by 10.55.215.139 with SMTP id t11mr37611827qkt.90.1521779501828;
        Thu, 22 Mar 2018 21:31:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1521779501; cv=none;
        d=google.com; s=arc-20160816;
        b=xfe3IwEAdrncWEDfkQDHCY6fQc906hGUVtGO4BqfVE8WXiEmFctrv+8+YoWr2cbRxT
         3klsF7ANZ/FUJ1dOvEj8+QhR4spAEFPvxGAjtxKwgPScj4XsDYRVC7uUEUot8ugZoy/7
         6XQ+09VrnRmodsv5L0N1lZD1ZR7rcNC3lTTG607hZ1WSRail73YOQXXL0eMTSVgU9nBs
         LcdqpKhEQ7kP/PStxNTxNsYqat4b7LI9DgY53ttNS3GLxFdK2Kg1hqGKLPkxuy9fvbsZ
         T3L7gYTDmgtVT9eQwBKrGrVNiNBml+dRSd4yUA5zrUxM/uhR4YozgKoHBvgpqmk6EgxP
         rbPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:message-id:date:to:from
         :dkim-signature:arc-authentication-results;
        bh=lJUASgodcFn9OKFGmR6nIQiPT6Oj9UMk3rCbB4nR7bY=;
        b=CXon+28gxKjSmXo8Rabdv9L99iaoIZhTkdSm0yvHe/336gNYDFgeGg+eWtur9nsu3h
         FLL35VSUGOK9R7DPGArbrT3p/QwffibzxPv3FS/wf+J2vmYlkGIaLBLuql5RTeggi5vM
         QFcuXyeKnjvqp3AIpbkJ3bUhXSiFADP7TjfGxdUy8VDPHUqbHCCaYZHEgzpCarNDhNQG
         sRQOZ37nDofZPNYAf/wCbJXwHF0eIdd3HX3ywomu4+lgIru8ud8JiBJfuszkIpp65Qac
         1xIlM5mEK44DsdrFvpZFlRyDiynBT3Ng/bFT/4gvkKMCavQqvcmYIAC9aEVUdbDwDW8m
         UsDw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=ufqIDITc;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id a192si207415qkb.446.2018.03.22.21.31.41
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 22 Mar 2018 21:31:41 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=ufqIDITc;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:35973 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ezEMf-0005YY-2Q
	for alex.bennee@linaro.org; Fri, 23 Mar 2018 00:31:41 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60162)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <onursahin08@gmail.com>) id 1ezDr5-00067z-Rl
	for qemu-arm@nongnu.org; Thu, 22 Mar 2018 23:59:04 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <onursahin08@gmail.com>) id 1ezDr5-0003mW-29
	for qemu-arm@nongnu.org; Thu, 22 Mar 2018 23:59:03 -0400
Received: from mail-qt0-x241.google.com ([2607:f8b0:400d:c0d::241]:33256)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <onursahin08@gmail.com>)
	id 1ezDr0-0003kn-O1; Thu, 22 Mar 2018 23:58:58 -0400
Received: by mail-qt0-x241.google.com with SMTP id i8so11301701qtj.0;
	Thu, 22 Mar 2018 20:58:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=lJUASgodcFn9OKFGmR6nIQiPT6Oj9UMk3rCbB4nR7bY=;
	b=ufqIDITcTiLDdcE5fyJISpXAMOwcg3NEJtlVZ6nZGY1dPk2tmQK0Qyh0InwksTShPz
	eDPI4QACADk+Vnd1i9VvYVOJsMp3DCMrCDESGf5adU0Hy+CNlG44Lk9IF2Txxw6Q+VbB
	2D+IMDX8QkRPFYXAqU3a2cG1tqQ+XO0LDg3M4Wy75/02s+RajEcj4uLXQXagzG2bjILw
	CwMpojTce/Gi7pUlWQfxVVdecpqWu97qx58Vcmvb6HB5o4xTPKPBKvwWbilvz4U8qFWO
	9WcuU0zUgjLwF4n8ylSrrG7YYvwOGotJ+uQbDJHkaKVD41OTm5VpQXOarCYeYfEgDZUV
	/zCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=lJUASgodcFn9OKFGmR6nIQiPT6Oj9UMk3rCbB4nR7bY=;
	b=skwaDr0buLrGFT1kqm45rg/ZXdnUKvCmgzXAKY66YvSI+Ijyaf2L1/4u9oBdjwZiRN
	udDZ97C1qmFKbk6pkO+BZCyTBhAQfDx+iirx8pgZMewmRoenEetxkY5ZqC7v9sMpAYeg
	H8B60iZ05wMHJhb9ki4Rmecm9Y5AoyIxfWCkrniuKBKQp1DTzWSNMs69WsFG8l9kXe+t
	CRW4VTIczy82sati61onBCEwlsQfeO4tD+TDpssDkhSFINmolYi2oG//21QVSiJiU9pB
	op0sAlRLs3qtuIPL8f6Cpgk4NhuwWOl32erqaQYxQH1fYxsbvWUaOniZqN26zSGY9NTV
	QCPA==
X-Gm-Message-State: AElRT7HGo5iYvcg7xx7IlEDCf52jWrA5GORzCUpo+xow+4fAvd7Lz6Tr
	Qh3tXNH3eY4ANBehTpYllxYPAq4Q
X-Received: by 10.237.47.227 with SMTP id m90mr40715800qtd.33.1521777537448;
	Thu, 22 Mar 2018 20:58:57 -0700 (PDT)
Received: from dhcp-acadmin-128-197-176-145.bu.edu (proteus.bu.edu.
	[128.197.176.135]) by smtp.gmail.com with ESMTPSA id
	w18sm6202079qkw.35.2018.03.22.20.58.56
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 22 Mar 2018 20:58:56 -0700 (PDT)
From: Onur Sahin <onursahin08@gmail.com>
To: qemu-devel@nongnu.org
Date: Thu, 22 Mar 2018 23:58:29 -0400
Message-Id: <1521777509-22896-1-git-send-email-onursahin08@gmail.com>
X-Mailer: git-send-email 1.8.3.1
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::241
X-Mailman-Approved-At: Fri, 23 Mar 2018 00:31:14 -0400
Subject: [Qemu-arm] [PATCH] target-arm: Check undefined opcodes for SWP in
 A32 decoder
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
Cc: qemu-arm@nongnu.org, Onur Sahin <onursahin08@gmail.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: H48PodKLwPs6

Hi all,

I have noticed that the decoding part in ARM/A32 does not verify the
opcodes for SWP instructions. The opcode field ([23:20]) for SWP
instructions should be 0 or 4, and QEMU does not check against these
values.

Other opcode values less than 8 are Undefined within the encoding
space of sychronization primitives (e.g., SWP, LDREX*). See section
A5.2.10 of ARMv7-A manual for reference. Because of the missing opcode
check, QEMU happily executes these Undefined cases as a SWP instruction.

The following fix adds proper opcode checks before assuming a valid SWP.

Best,
Onur

Signed-off-by: Onur Sahin <onursahin08@gmail.com>
---
 target-arm/translate.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/target-arm/translate.c b/target-arm/translate.c
index bd5d5cb..fb31c12 100644
--- a/target-arm/translate.c
+++ b/target-arm/translate.c
@@ -8831,7 +8831,7 @@ static void disas_arm_insn(DisasContext *s, unsigned int insn)
                             }
                         }
                         tcg_temp_free_i32(addr);
-                    } else {
+                    } else if (!(insn & 0x00B00000)) {
                         /* SWP instruction */
                         rm = (insn) & 0xf;
 
@@ -8852,6 +8852,9 @@ static void disas_arm_insn(DisasContext *s, unsigned int insn)
                         tcg_temp_free_i32(addr);
                         store_reg(s, rd, tmp2);
                     }
+                    else {
+                        goto illegal_op;
+                    }
                 }
             } else {
                 int address_offset;
-- 
1.8.3.1

