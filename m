Received: by 2002:a19:f015:0:0:0:0:0 with SMTP id p21csp798559lfc;
        Thu, 12 Mar 2020 08:43:26 -0700 (PDT)
X-Google-Smtp-Source: ADFU+vsRCUrqrC2CFHKJlk823i7KLcBKiaLi6nvTurmNskgTmNZSVkkcWlM8WKEvfg+xhWEHhnJw
X-Received: by 2002:a37:b944:: with SMTP id j65mr8286402qkf.374.1584027806659;
        Thu, 12 Mar 2020 08:43:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1584027806; cv=none;
        d=google.com; s=arc-20160816;
        b=r2s24RZ0TliXE4iTEx5OuNnPm61Bpob0/VBjwsFSoarpYgISFexHaQlZA/oT1IBNIr
         f7cEp5bWjXPvKz6Km0KUodlaB/MblZVsPfnXd4CdrnD4R2KdpEw5OPXaN0L7zpWb+Hfi
         qRzVgeYun3fUPHzWJmc3UZas/6ctdAJqgo6rnId3PUV/UMN1n0hhZMZBHEpw/1l+yQLl
         kn19pNc17mpiRsTGDzd5vAa2ACOfRcgiXqnI+S4hTtC7t/j1a50KKOrCzsIE0TqbeDBY
         0Jz9rsloDDnttMpVtOV4iY25cgFOYJDjuussAWU3Elm7lxbC48Ii6MARs6PpQWApQNaF
         lRzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:content-transfer-encoding:list-subscribe:list-help
         :list-post:list-archive:list-unsubscribe:list-id:precedence:cc
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=o7uOCWKDJiT/jsE9S4PCqkrvL+UPwe798TBdfqna+3E=;
        b=lsnkCPEPs2UXcCBGDCs53TTnqaknDqnHw1gCdOiWxXoD2JvczhZOydMsBWPK0KnXnO
         LMPEi6+hd0zJvoHQiCmAwFyuyhIC8iUy6NakQnFILXVgRc4ySfvcDtmwjtTkBlj74Q92
         UAQs5f8A76JnB5drj3IdJKMmZ5GpGCApdxbLyddw/CGtUuUMQlhH3wq/z6mvAD0JIHNS
         hAb35b5usIIi2rAKLhxMzvkINaxYt4rHJq+lHOFXZVeEeG3g91ktKDlBsL7hc683G+jn
         6T0DhZ46lmqEKeayY4LrdUXfKKhUPKGlZ31o0fX2TIdO/HGmZT2CMjA91Axi7xCYs52d
         GXnQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@redhat.com header.s=mimecast20190719 header.b=DWHL4uRn;
       spf=pass (google.com: domain of kvmarm-bounces@lists.cs.columbia.edu designates 128.59.11.253 as permitted sender) smtp.mailfrom=kvmarm-bounces@lists.cs.columbia.edu;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <kvmarm-bounces@lists.cs.columbia.edu>
Received: from mm01.cs.columbia.edu (mm01.cs.columbia.edu. [128.59.11.253])
        by mx.google.com with ESMTP id y53si857589qta.30.2020.03.12.08.43.26;
        Thu, 12 Mar 2020 08:43:26 -0700 (PDT)
Received-SPF: pass (google.com: domain of kvmarm-bounces@lists.cs.columbia.edu designates 128.59.11.253 as permitted sender) client-ip=128.59.11.253;
Authentication-Results: mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@redhat.com header.s=mimecast20190719 header.b=DWHL4uRn;
       spf=pass (google.com: domain of kvmarm-bounces@lists.cs.columbia.edu designates 128.59.11.253 as permitted sender) smtp.mailfrom=kvmarm-bounces@lists.cs.columbia.edu;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost (localhost [127.0.0.1])
	by mm01.cs.columbia.edu (Postfix) with ESMTP id 59CF54A4A3;
	Thu, 12 Mar 2020 11:43:26 -0400 (EDT)
X-Virus-Scanned: at lists.cs.columbia.edu
X-Spam-Flag: NO
X-Spam-Score: 0.909
X-Spam-Level: 
X-Spam-Status: No, score=0.909 required=6.1 tests=[BAYES_00=-1.9,
	DKIM_SIGNED=0.1, DNS_FROM_AHBL_RHSBL=2.699,
	RCVD_IN_DNSWL_NONE=-0.0001, T_DKIM_INVALID=0.01] autolearn=no
Authentication-Results: mm01.cs.columbia.edu (amavisd-new); dkim=softfail
	(fail, message has been altered) header.i=@redhat.com
Received: from mm01.cs.columbia.edu ([127.0.0.1])
	by localhost (mm01.cs.columbia.edu [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Kk23qTGThefl; Thu, 12 Mar 2020 11:43:25 -0400 (EDT)
Received: from mm01.cs.columbia.edu (localhost [127.0.0.1])
	by mm01.cs.columbia.edu (Postfix) with ESMTP id 69A5F4A5A8;
	Thu, 12 Mar 2020 11:43:25 -0400 (EDT)
Received: from localhost (localhost [127.0.0.1])
 by mm01.cs.columbia.edu (Postfix) with ESMTP id 0D63C4A4A3
 for <kvmarm@lists.cs.columbia.edu>; Thu, 12 Mar 2020 11:43:24 -0400 (EDT)
X-Virus-Scanned: at lists.cs.columbia.edu
Received: from mm01.cs.columbia.edu ([127.0.0.1])
 by localhost (mm01.cs.columbia.edu [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Bk6VIBYvKCyH for <kvmarm@lists.cs.columbia.edu>;
 Thu, 12 Mar 2020 11:43:23 -0400 (EDT)
Received: from us-smtp-delivery-1.mimecast.com
 (us-smtp-delivery-1.mimecast.com [207.211.31.120])
 by mm01.cs.columbia.edu (Postfix) with ESMTP id 02B244A3A5
 for <kvmarm@lists.cs.columbia.edu>; Thu, 12 Mar 2020 11:43:22 -0400 (EDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1584027802;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5QgGQR5lmCzHdU2tw8u26Dp0LVz138MaKuXfv7AyzLc=;
 b=DWHL4uRnZ0cBj/QyaibOtIzF3mOUlQ0lNgViMJySENzimbhfsrMImmL0KBqDKOVGrnnyo7
 NMYtw5D3OPtMbO1VYMLT/Eou7rq8hfqEHTheQUBsF2/cUS5QQTjjWOyx01WIocO016eMhh
 +EnDEabyl9T+8958ql9cPZsvPqIzzm4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-401-dOckM3WQOfWuveQhk9MwrQ-1; Thu, 12 Mar 2020 11:43:20 -0400
X-MC-Unique: dOckM3WQOfWuveQhk9MwrQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E847A100550E;
 Thu, 12 Mar 2020 15:43:17 +0000 (UTC)
Received: from laptop.redhat.com (unknown [10.36.118.12])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C4D215C1B5;
 Thu, 12 Mar 2020 15:43:12 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, maz@kernel.org,
 kvmarm@lists.cs.columbia.edu, kvm@vger.kernel.org, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org
Subject: [kvm-unit-tests PATCH v3 01/12] arm64: Provide read/write_sysreg_s
Date: Thu, 12 Mar 2020 16:42:50 +0100
Message-Id: <20200312154301.9130-2-eric.auger@redhat.com>
In-Reply-To: <20200312154301.9130-1-eric.auger@redhat.com>
References: <20200312154301.9130-1-eric.auger@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Cc: andrew.murray@arm.com, andre.przywara@arm.com
X-BeenThere: kvmarm@lists.cs.columbia.edu
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: Where KVM/ARM decisions are made <kvmarm.lists.cs.columbia.edu>
List-Unsubscribe: <https://lists.cs.columbia.edu/mailman/options/kvmarm>,
 <mailto:kvmarm-request@lists.cs.columbia.edu?subject=unsubscribe>
List-Archive: <https://lists.cs.columbia.edu/pipermail/kvmarm>
List-Post: <mailto:kvmarm@lists.cs.columbia.edu>
List-Help: <mailto:kvmarm-request@lists.cs.columbia.edu?subject=help>
List-Subscribe: <https://lists.cs.columbia.edu/mailman/listinfo/kvmarm>,
 <mailto:kvmarm-request@lists.cs.columbia.edu?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kvmarm-bounces@lists.cs.columbia.edu
Sender: kvmarm-bounces@lists.cs.columbia.edu
X-TUID: B6p5oUNkVlAm

From: Andrew Jones <drjones@redhat.com>

Sometimes we need to test access to system registers which are
missing assembler mnemonics.

Signed-off-by: Andrew Jones <drjones@redhat.com>
Reviewed-by: Alexandru Elisei <alexandru.elisei@arm.com>
---
 lib/arm64/asm/sysreg.h | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/lib/arm64/asm/sysreg.h b/lib/arm64/asm/sysreg.h
index a03830b..a45eebd 100644
--- a/lib/arm64/asm/sysreg.h
+++ b/lib/arm64/asm/sysreg.h
@@ -38,6 +38,17 @@
 	asm volatile("msr " xstr(r) ", %x0" : : "rZ" (__val));	\
 } while (0)
 
+#define read_sysreg_s(r) ({					\
+	u64 __val;						\
+	asm volatile("mrs_s %0, " xstr(r) : "=r" (__val));	\
+	__val;							\
+})
+
+#define write_sysreg_s(v, r) do {				\
+	u64 __val = (u64)v;					\
+	asm volatile("msr_s " xstr(r) ", %x0" : : "rZ" (__val));\
+} while (0)
+
 asm(
 "	.irp	num,0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30\n"
 "	.equ	.L__reg_num_x\\num, \\num\n"
-- 
2.20.1

_______________________________________________
kvmarm mailing list
kvmarm@lists.cs.columbia.edu
https://lists.cs.columbia.edu/mailman/listinfo/kvmarm
