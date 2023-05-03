Received: by 2002:a17:906:779e:b0:94e:fe67:1757 with SMTP id s30csp2652577ejm;
        Wed, 3 May 2023 00:08:50 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ60hP2CR5vud0PVrCql0QkPYibDXoFBXjRlxXSTm3blP0zi/28I+8Mb5RZE5Me5JGzIQmNr
X-Received: by 2002:a05:622a:2ca:b0:3ef:3b9b:c62e with SMTP id a10-20020a05622a02ca00b003ef3b9bc62emr32329649qtx.16.1683097730048;
        Wed, 03 May 2023 00:08:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1683097730; cv=none;
        d=google.com; s=arc-20160816;
        b=tVvGGphvPgsVbzfrBLpkLvTO3TN19cL5Wp0aEsWj/kyF3YCESVKiFclSmyu4A4yFpr
         zl2h8yzKjyYXR+Yh7OS1jg588UHjM3Bgs0dYHyxzO02OX/zgGz4bnvnkXNFLmL5VhBo7
         9mvbcrBSGfoliZXJfSoSkulJrqK7Oe2gzdto+h4TyB3W5Dz1+0QtAYOTKQ5G5f8W6gSk
         9RWFYkLFWChISqIoN11tzDyh5+Ic9GAPZAi4Dvd8tMUfudM0+lXOWALNFzCFr9hO+NWX
         4z7t6VFcEA1oiNkLRxi1CY0zycWSSJfEzji8Hy8EysY8CtesPh+LjTOJO0rTtK6HksQG
         G4qw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=WrmqAOuR2/yJANGPopXn5FwM+vXCIwdTliCaNgd+uz0=;
        b=aDRHjyZQP0Wjo1LqSzBZnpaJfSVz4HGisKgKasOuB2FWeZRSKxeTRI0Rb9gQLCNkjq
         01eAE3xb/G9JWCoU2FrCsdmptfkCwik27b9z42sLgfHSPhuiYBJtic0gEv6EUpF0Kyv3
         IDbKnfPJPNiWZSdb5sx94wdgpRrXF9y4p6rGes4P1rEZoe8yVm11f8w7UDKSrdF32YKy
         oDVeOVzPEaO4vU8mYiU9twzFtyMwXtgDHBXrTsXSM9NiqXuU+crghWUOeks0ssUwYTUp
         x9ZPwVrvt4TiMTQEo1Pr/x02IW3EqhjPJN88MRPyzyHxLqODjEB17hYiY4Sa3XmwqPW1
         8owg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=rIe0c8cD;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id b17-20020a05620a0f9100b0074e068fe08bsi18113491qkn.139.2023.05.03.00.08.49
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 03 May 2023 00:08:50 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=rIe0c8cD;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pu6Vk-00017Z-JR; Wed, 03 May 2023 03:02:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pu6UU-0006bk-2U
 for qemu-devel@nongnu.org; Wed, 03 May 2023 03:01:31 -0400
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pu6UD-0003EN-2i
 for qemu-devel@nongnu.org; Wed, 03 May 2023 03:01:29 -0400
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-3f1738d0d4cso28980505e9.1
 for <qemu-devel@nongnu.org>; Wed, 03 May 2023 00:01:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683097271; x=1685689271;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=WrmqAOuR2/yJANGPopXn5FwM+vXCIwdTliCaNgd+uz0=;
 b=rIe0c8cDjTdQXCVqJl0v2jHbBvxP94mqgoiBFUlb6wCjzTVMUZ2ay7iC16pASFX+Nr
 sZbyVmrS32XDDdghaZOEz7m677JEm8R4jAsUbFzT3IrusSUicR9IQ6mmZHDI2aJMnz2I
 Xcf+XzHScDty3o3pSX3Dc5dDatE2N3tLB5OYrby3ceF+oOWwha7hPilAR0HgO/wNuXDV
 4VNZmekGqTWf/uEPTVu5ZOLSuuzjkhGi8R6Lh6Dn6gNfVSEMXINZ/datHdeFD7HDsLBk
 4/Kyo+XlQGHYeI+ovIPxN8sjty1+f5iXR7zvexXrefUv9Nc+BSMA+tf/Hg8GW3Jaus8n
 hpfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683097271; x=1685689271;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=WrmqAOuR2/yJANGPopXn5FwM+vXCIwdTliCaNgd+uz0=;
 b=A9ciTxEfzSZ1UHVs+K3i3sAOhpBlLOHhIz8wT7Ta/2KES4aBe+0VuSE5f7CZtCJWAz
 Rvo0a/JOe09DiPRlGSipJ+qodwLiNSKuXNivnXdS2RRoNCFcvnfruXxV0/uythcVdhWg
 mbSKA9r1YFbHX1WCzAdT61fcKD/iIlnLPrDicc7GkV4JJJDcQce3EaTFTNpz/iU2cFrq
 eqlGh6elxyFLx78snnifeIbdqKHiEGi3XS242vVY8kF27UnfJw54uMKHN4+9igYQsT1s
 vC2IMPxGRpjJ85dmAfMZA9BpFmos6UQbzUDlomf4sa48IQSYPGHINP76X3Vj638135G7
 oq0Q==
X-Gm-Message-State: AC+VfDzibLOpg3rjthICIb7djtkl9xf+/Qaf9scblLy8P08Bi16Knn3R
 tAk8bxZapzC/m38CZ4D6LcrckMdVpPwkfoTk0kpFdQ==
X-Received: by 2002:a7b:c4cd:0:b0:3f0:9a90:a5e7 with SMTP id
 g13-20020a7bc4cd000000b003f09a90a5e7mr14076370wmk.28.1683097271174; 
 Wed, 03 May 2023 00:01:11 -0700 (PDT)
Received: from stoup.Home ([2a02:c7c:74db:8d00:c01d:9d74:b630:9087])
 by smtp.gmail.com with ESMTPSA id
 l2-20020a1ced02000000b003f19b3d89e9sm905035wmh.33.2023.05.03.00.01.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 May 2023 00:01:10 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: git@xen0n.name, philmd@linaro.org, qemu-arm@nongnu.org,
 qemu-riscv@nongnu.org, qemu-s390x@nongnu.org
Subject: [PATCH v4 53/54] tcg/s390x: Use ALGFR in constructing softmmu host
 address
Date: Wed,  3 May 2023 07:57:28 +0100
Message-Id: <20230503065729.1745843-54-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230503065729.1745843-1-richard.henderson@linaro.org>
References: <20230503065729.1745843-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x32c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: 7t2OL9HxvxcD

Rather than zero-extend the guest address into a register,
use an add instruction which zero-extends the second input.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/s390x/tcg-target.c.inc | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/tcg/s390x/tcg-target.c.inc b/tcg/s390x/tcg-target.c.inc
index dfcf4d9e34..dd13326670 100644
--- a/tcg/s390x/tcg-target.c.inc
+++ b/tcg/s390x/tcg-target.c.inc
@@ -149,6 +149,7 @@ typedef enum S390Opcode {
     RRE_ALGR    = 0xb90a,
     RRE_ALCR    = 0xb998,
     RRE_ALCGR   = 0xb988,
+    RRE_ALGFR   = 0xb91a,
     RRE_CGR     = 0xb920,
     RRE_CLGR    = 0xb921,
     RRE_DLGR    = 0xb987,
@@ -1853,10 +1854,11 @@ static TCGLabelQemuLdst *prepare_host_addr(TCGContext *s, HostAddress *h,
     tcg_out_insn(s, RXY, LG, h->index, TCG_REG_R2, TCG_REG_NONE,
                  offsetof(CPUTLBEntry, addend));
 
-    h->base = addr_reg;
     if (TARGET_LONG_BITS == 32) {
-        tcg_out_ext32u(s, TCG_REG_R3, addr_reg);
-        h->base = TCG_REG_R3;
+        tcg_out_insn(s, RRE, ALGFR, h->index, addr_reg);
+        h->base = TCG_REG_NONE;
+    } else {
+        h->base = addr_reg;
     }
     h->disp = 0;
 #else
-- 
2.34.1

