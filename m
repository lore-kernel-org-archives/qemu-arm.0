Received: by 2002:a5d:4308:0:0:0:0:0 with SMTP id h8-v6csp739593wrq;
        Fri, 13 Jul 2018 07:17:17 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpcApGr9jjug9tNA/jNGWs6tPxBCYEMubgLhG6rKvz0NbkG8tMidEbaqPNpoEdo/9cdSl0Of
X-Received: by 2002:a0c:ae89:: with SMTP id j9-v6mr7327835qvd.174.1531491437415;
        Fri, 13 Jul 2018 07:17:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1531491437; cv=none;
        d=google.com; s=arc-20160816;
        b=QeAkrM2YSq3cBL6LDyaml0DoRXojH+9pyTh1j6tN+q5D8WzzDsX9jFllyFOO6K19sB
         LWxWB1FJfoNfsWw6jSGgN1eaNWYOqMzvpAPeid2tbXJSUR1/4GvySRWBl8tVm0pEV5kZ
         G7P30y90gaB9b6CC4LB3ZR1eslDGuhSxNjxBms+xHMSfZeJuwMh0igGI1L9kWO8LcYYb
         GX38jgyw+2gAgKRlzPX52trJoZt5Kfx5R097ck6j2vMYJTSGcDfWTBf5NzXLASp2cHbX
         jJR5lYK+Q2kpnZDm36Vxynh5UPxcK8S3kaZEzMtfk8qVIY2aCev1DeudWYc3TrDsHYVU
         xffg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=SD5e5hzs6ZzvclHvHWTZww8cXsMls0cFfKi0pc49Zn4=;
        b=WOqgonY+eaGYKY2iyHzMA4CvwkFo4OR4GCqK5B2/yPJhT1zEsLoKyChZQ6nhZR0hca
         CoYSLkk9T2qF+WIjvJ2US/H0JJUINGw9MbhqHdFbIrUyLy4PPGxhVNjNenb4Gv7aX5WV
         TayBqvwfTmZKSoc/ty00i6q5E6bEKFI3CCS8pcdcQgicmBph+2/li2DuoQcru1lfbHrj
         CqvE/OIrvVkpfdurcF1yJGXBO/lREGde6XWw+s6hcI0e0mFSc+NEHegdpu0E9egyjiXC
         oL8h/riAT0XBb8Rt9JUfEMf6Wl86DaDVHDwrzhqmmJkRCzR8F9V5SGC4LA+ELN4Et+T8
         jyrQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id k11-v6si1296631qke.75.2018.07.13.07.17.17
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 13 Jul 2018 07:17:17 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:37598 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fdysm-0006qi-V1
	for alex.bennee@linaro.org; Fri, 13 Jul 2018 10:17:16 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58322)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1fdysK-0006pZ-Np
	for qemu-devel@nongnu.org; Fri, 13 Jul 2018 10:16:49 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1fdysJ-0003az-Pj
	for qemu-devel@nongnu.org; Fri, 13 Jul 2018 10:16:48 -0400
Received: from orth.archaic.org.uk ([2001:8b0:1d0::2]:43518)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <pm215@archaic.org.uk>)
	id 1fdysE-0003Uz-KN; Fri, 13 Jul 2018 10:16:42 -0400
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.89)
	(envelope-from <pm215@archaic.org.uk>)
	id 1fdysA-0005Oh-3J; Fri, 13 Jul 2018 15:16:38 +0100
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Fri, 13 Jul 2018 15:16:35 +0100
Message-Id: <20180713141636.18665-2-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20180713141636.18665-1-peter.maydell@linaro.org>
References: <20180713141636.18665-1-peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2001:8b0:1d0::2
Subject: [Qemu-devel] [PATCH for-3.0 1/2] accel/tcg: Use correct test when
 looking in victim TLB for code
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
Cc: Richard Henderson <rth@twiddle.net>, patches@linaro.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: S6MFJX/M+Ykh

In get_page_addr_code(), we were incorrectly looking in the victim
TLB for an entry which matched the target address for reads, not
for code accesses. This meant that we could hit on a victim TLB
entry that indicated that the address was readable but not
executable, and incorrectly bypass the call to tlb_fill() which
should generate the guest MMU exception. Fix this bug.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 accel/tcg/cputlb.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/accel/tcg/cputlb.c b/accel/tcg/cputlb.c
index 20c147d6554..2d5fb15d9a3 100644
--- a/accel/tcg/cputlb.c
+++ b/accel/tcg/cputlb.c
@@ -967,7 +967,7 @@ tb_page_addr_t get_page_addr_code(CPUArchState *env, target_ulong addr)
     index = (addr >> TARGET_PAGE_BITS) & (CPU_TLB_SIZE - 1);
     mmu_idx = cpu_mmu_index(env, true);
     if (unlikely(!tlb_hit(env->tlb_table[mmu_idx][index].addr_code, addr))) {
-        if (!VICTIM_TLB_HIT(addr_read, addr)) {
+        if (!VICTIM_TLB_HIT(addr_code, addr)) {
             tlb_fill(ENV_GET_CPU(env), addr, 0, MMU_INST_FETCH, mmu_idx, 0);
         }
     }
-- 
2.17.1

