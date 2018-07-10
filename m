Received: by 2002:a5d:4308:0:0:0:0:0 with SMTP id h8-v6csp3739822wrq;
        Tue, 10 Jul 2018 09:08:49 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpeG01lWrQG/F6HmY2C+AZMLxEtrNOvFrRjIqbw0Chu1ItvPPD8OrbmmWocoz+Bw4CynM9GJ
X-Received: by 2002:a37:2dc7:: with SMTP id t190-v6mr21539124qkh.229.1531238929304;
        Tue, 10 Jul 2018 09:08:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1531238929; cv=none;
        d=google.com; s=arc-20160816;
        b=mFzqGblYytRYVVeQT4Za7McyxUhWcF9PlDkAkLXLBDQE4SDGVJ5oWNUVLFYJ4XmNnS
         NOv08b1KYaytqtg0kFA+BuGRkijyP/Etd/344B6LkHyqzUnQJbrgdVyTUsSDrAgyWD0/
         /rweXr5JCUPje5UUgjzVvEPlOPZsk7jnTHZwBNBhgxIRRuyt2NKsc7vMPc186Zu4EZqZ
         oxWYqEnwQRmzyLZBnD9KJJLLc65rqIRdq+3xyQk4eLxNcrfgh0aiDY9JjvDXDnAIGB0v
         mhSn1vLW5KLPVz8TKoIKj13ZYl7uHPPBK+LY/OXF133Rz6Tk63cgRJRtQ78nSKn4APz5
         ig0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=xs2RSs30EKDk4pgsmHp9W7N2DODqiEAZ8UtMWOVqXmk=;
        b=SUJk/slXFjuDhOPGXTDDkd71kpLkg582+77bN00fHBamO7oXXT82Vp0ciqqM2+c3qT
         w6suwclgkpqIR68vJago02YDmVklRAyzbi8LyXw57rrbDYJbT2ibW9YxNUIt2hOx3+nD
         Hh4ksCdyugJ8qpyFM4jKNrYnT2azZpkrE5gR8vgHfV0ftTCuRNWRlFdBOvlso5LSbyam
         15XDBqUirCyx5THD890fssdTOCoPRaNCXgHDgUifnbVvbekw4hm6UFQRd12NEYL0gG3P
         F5R1FV0Tb5EiLDQgBgjdvUj3EqdrrfI9RzIal6LnWJPlcWEmo91L0c44DpQVJAxvICP6
         1uqQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id m40-v6si9790177qtc.259.2018.07.10.09.08.49
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 10 Jul 2018 09:08:49 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:48662 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fcvC4-0001GR-Oe
	for alex.bennee@linaro.org; Tue, 10 Jul 2018 12:08:48 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49076)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1fcv41-0003UD-Tp
	for qemu-devel@nongnu.org; Tue, 10 Jul 2018 12:00:30 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1fcv41-0002JS-1j
	for qemu-devel@nongnu.org; Tue, 10 Jul 2018 12:00:30 -0400
Received: from orth.archaic.org.uk ([2001:8b0:1d0::2]:43370)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <pm215@archaic.org.uk>)
	id 1fcv3y-0002Aw-QG; Tue, 10 Jul 2018 12:00:26 -0400
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.89)
	(envelope-from <pm215@archaic.org.uk>)
	id 1fcv3o-0001ot-Hx; Tue, 10 Jul 2018 17:00:16 +0100
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Tue, 10 Jul 2018 17:00:09 +0100
Message-Id: <20180710160013.26559-3-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20180710160013.26559-1-peter.maydell@linaro.org>
References: <20180710160013.26559-1-peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2001:8b0:1d0::2
Subject: [Qemu-devel] [PATCH 2/6] accel/tcg: Handle get_page_addr_code()
 returning -1 in hashtable lookups
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
Cc: patches@linaro.org, KONRAD Frederic <frederic.konrad@adacore.com>,
	"Emilio G . Cota" <cota@braap.org>,
	=?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	Paolo Bonzini <pbonzini@redhat.com>, Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: bh8teKubkYs+

When we support execution from non-RAM MMIO regions, get_page_addr_code()
will return -1 to indicate that there is no RAM at the requested address.
Handle this in the cpu-exec TB hashtable lookup code, treating it as
"no match found".

Note that the call to get_page_addr_code() in tb_lookup_cmp() needs
no changes -- a return of -1 will already correctly result in the
function returning false.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 accel/tcg/cpu-exec.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/accel/tcg/cpu-exec.c b/accel/tcg/cpu-exec.c
index c738b7f7d6e..6bcb6d99bd7 100644
--- a/accel/tcg/cpu-exec.c
+++ b/accel/tcg/cpu-exec.c
@@ -332,6 +332,9 @@ TranslationBlock *tb_htable_lookup(CPUState *cpu, target_ulong pc,
     desc.trace_vcpu_dstate = *cpu->trace_dstate;
     desc.pc = pc;
     phys_pc = get_page_addr_code(desc.env, pc);
+    if (phys_pc == -1) {
+        return NULL;
+    }
     desc.phys_page1 = phys_pc & TARGET_PAGE_MASK;
     h = tb_hash_func(phys_pc, pc, flags, cf_mask, *cpu->trace_dstate);
     return qht_lookup_custom(&tb_ctx.htable, &desc, h, tb_lookup_cmp);
-- 
2.17.1

