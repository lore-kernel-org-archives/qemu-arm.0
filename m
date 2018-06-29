Received: by 2002:a5d:4301:0:0:0:0:0 with SMTP id h1-v6csp911809wrq;
        Fri, 29 Jun 2018 09:18:11 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpc72HIleyf3/B/GV9wUqFwXXGwRUrCPJ4Z21T84cmcXKKLLyaSaImZzUnfwZ6gOaJTmRgZW
X-Received: by 2002:a0c:d4d7:: with SMTP id y23-v6mr13756753qvh.234.1530289091848;
        Fri, 29 Jun 2018 09:18:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1530289091; cv=none;
        d=google.com; s=arc-20160816;
        b=tW+fP7UtiFovcKpA6F76ez+gKBa9ANwlUe9OmRqZS2PY8aE+NLML3CnlYHOjP1kWtq
         e0NEvVcImEoOjE7xau3pFUyRfM8xfjj0MVswpsjn+FLRfjraXZlckaj/YNVxVAWsoqSR
         O5ASdmfPJ94lb4FhJlxd5B/wrsLoJ0nx2JIGpjg08JiOkbywaD6PnaL3V1ETTw6nWGf0
         +Tu4rG/beSz+sOU8Hz/pVjPUBIBUDXDnNZeyirmjqAGdEqq0HGKgcOycaDHZZz9+L7z0
         8mvpmc9ZNYI2qiPgHMS6f/q5zaK2CZpAHDaQLiAyCCELCAykjQFw8gEJlNqxI8AEF9Br
         b6Dw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:message-id:date:to:from
         :arc-authentication-results;
        bh=61H8h6GUCmDzUos1DkQRzMR4o7ILsqzJYLKiHRpqir4=;
        b=JZhKf+ayuUoK9qqNRLmFFv1JDsf4GxmdRGOrAKHQK4Y+xh3Br8LBZDRCaZ82FLcvnt
         b9/NJYlBClTfKUj6c3q+E+MBPNAnSLt5CTCFq85uBibNf1K9YCA5UAKV2W4EAgYIV/eE
         jOzXQ3VifSh174dQfREiu4pF3ULGRJEwpVhFAyk6E1vkHT5EJgzSk+QzTUe1f1+0IsDo
         vRfbOe5IunSwUnfMq28u6GHG8CbWELJwpCCmck1wZYmkXnDTf8yS/h1fFDLCsR5Asal7
         OfKe1rnXD3D/wiwgCNIfpkmDLQ8sOCxDQK1e2bwS0giDRTbyMvhbkS3ioGrl/sfWEwMU
         SioA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id p34-v6si2293892qvp.83.2018.06.29.09.18.11
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 29 Jun 2018 09:18:11 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:43332 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fYw67-0005yi-Bt
	for alex.bennee@linaro.org; Fri, 29 Jun 2018 12:18:11 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57527)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1fYw5a-0005wg-2S
	for qemu-devel@nongnu.org; Fri, 29 Jun 2018 12:17:38 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1fYw5Z-0002gE-7T
	for qemu-devel@nongnu.org; Fri, 29 Jun 2018 12:17:38 -0400
Received: from orth.archaic.org.uk ([2001:8b0:1d0::2]:43136)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <pm215@archaic.org.uk>)
	id 1fYw5W-0002Zz-Rd; Fri, 29 Jun 2018 12:17:34 -0400
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.89)
	(envelope-from <pm215@archaic.org.uk>)
	id 1fYw5U-0004vC-4g; Fri, 29 Jun 2018 17:17:32 +0100
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Fri, 29 Jun 2018 17:17:31 +0100
Message-Id: <20180629161731.16239-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.17.1
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2001:8b0:1d0::2
Subject: [Qemu-devel] [PATCH for-3.0] accel/tcg: Don't treat invalid TLB
 entries as needing recheck
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: patches@linaro.org, Laurent Vivier <laurent@vivier.eu>,
	Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: S8W7E7ckc/Ig

In get_page_addr_code() when we check whether the TLB entry
is marked as TLB_RECHECK, we should not go down that code
path if the TLB entry is not valid at all (ie the TLB_INVALID
bit is set).

Reported-by: Laurent Vivier <laurent@vivier.eu>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
This fixes the abort that Laurent was seeing with his m68k test case.

 accel/tcg/cputlb.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/accel/tcg/cputlb.c b/accel/tcg/cputlb.c
index eebe97dabb7..a55296583b9 100644
--- a/accel/tcg/cputlb.c
+++ b/accel/tcg/cputlb.c
@@ -967,7 +967,8 @@ tb_page_addr_t get_page_addr_code(CPUArchState *env, target_ulong addr)
         }
     }
 
-    if (unlikely(env->tlb_table[mmu_idx][index].addr_code & TLB_RECHECK)) {
+    if (unlikely((env->tlb_table[mmu_idx][index].addr_code &
+                  (TLB_RECHECK | TLB_INVALID_MASK)) == TLB_RECHECK)) {
         /*
          * This is a TLB_RECHECK access, where the MMU protection
          * covers a smaller range than a target page, and we must
-- 
2.17.1

