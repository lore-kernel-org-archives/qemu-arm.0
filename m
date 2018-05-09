Received: by 10.28.4.212 with SMTP id 203csp49104wme;
        Wed, 9 May 2018 10:56:04 -0700 (PDT)
X-Google-Smtp-Source: AB8JxZr/TaTMGnO2KfLqTH67DMUALWxYjOxgu3plRVJe6hgp8MiW+QNLiiXsOzORvsT1m0PiOYEo
X-Received: by 2002:a0c:a892:: with SMTP id x18-v6mr22358166qva.118.1525888564545;
        Wed, 09 May 2018 10:56:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1525888564; cv=none;
        d=google.com; s=arc-20160816;
        b=HeUqKo/Zg2tf/rU+tccy2WfXScNYxK3IZaa7mpIEbz7vb/aBje5k1DGa0dBeJLyIqc
         HsC39BOFSNptcKdjVPSUzRu8GGRm0aigc28zJbDTB0fq1zr27vKqRPSeYGdToYdMOAoW
         c7K9oP+UHXv0VQrAu4sBZd0ozcDFxlwJYxIaBuCZQQJEKHnfHh+VuiC/9TrISKUvHTvS
         rsqlJ/Mr5amL2oDPf+AqjlbgI8M3EGMwB8SIbPCsHqJgb26Q1GBi0wknovB+0RC4Pizz
         3+VG4B2cBgGRxlVvMie3PEgaSPPJMRW2LsNzV0z9dtJYRhWscma0KR7Ch53cbRTIBaxa
         eQsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-signature:arc-authentication-results;
        bh=UdW6ZcuE9nsn1byu2ubWFKPxBVxEQbHx4DVNMO8t0cA=;
        b=LtdSGvE2xFyPv1FMjVJ+vIYoyo50DlNrWal+KbxKGINNa3IpQjWY0dEO5UAQ90dcqH
         WMOjzh83JbkynTHFUN+adUFPcKzqx6QNsHPgjTm6qw1VE5MdF+mSw7cPKJj3/VrmjCgE
         L60b/OYnbSfOj1hHG/ZEnHxtJvaKtf9h/zu2U7fBolk8TFsT1AlmVOxVs8Fo4WfqZ7kz
         LeYUjxZjMwcUAKhBV8Wnn8N0T7yXVuut0tDcffrdXpqdvLCvr8Qm8zUixwqDPVRT0Kwn
         6kWK8Kn57BIE62/3siUD6QqgkveR7dz+CP1NxwD+j+C+SFvh7FvXgDKIR4UojWS2HCKd
         x/EQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=LXbzOvV/;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id f39-v6si1598997qvd.52.2018.05.09.10.56.04
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 09 May 2018 10:56:04 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=LXbzOvV/;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:58081 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fGTJs-0005cD-0k
	for alex.bennee@linaro.org; Wed, 09 May 2018 13:56:04 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47846)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1fGTJ3-0004SG-Ko
	for qemu-arm@nongnu.org; Wed, 09 May 2018 13:55:18 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1fGTJ2-0005HO-1B
	for qemu-arm@nongnu.org; Wed, 09 May 2018 13:55:13 -0400
Received: from mail-pg0-x241.google.com ([2607:f8b0:400e:c05::241]:42291)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1fGTJ1-0005GE-Nz
	for qemu-arm@nongnu.org; Wed, 09 May 2018 13:55:11 -0400
Received: by mail-pg0-x241.google.com with SMTP id p9-v6so20096672pgc.9
	for <qemu-arm@nongnu.org>; Wed, 09 May 2018 10:55:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=UdW6ZcuE9nsn1byu2ubWFKPxBVxEQbHx4DVNMO8t0cA=;
	b=LXbzOvV/S1or2tZ8TmYpdrvWHRGS4NEqbkH8bSzGg1IVt0GA82wflB1h+ACn5Rh/bw
	LGqF6MluIciO74vcZcFm4aD4TwAhjakuyAHvJNJHpmZ04o73ZK+RaJ9mdUFHgILf+/F2
	aUDkWnhMplRWN9Amg+EsCw0Ae9F8MQBBuyanM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=UdW6ZcuE9nsn1byu2ubWFKPxBVxEQbHx4DVNMO8t0cA=;
	b=nK5BKnPx5s9d4wfsJ5hpyscRdhhaFX478psWpsQ7wNlH21Xssg2At0wk2pe9c43PC7
	HPpSSjRjDjHTgp0ssF3HAXvrV8YN4gw31fMuutBIopbJPKVyTcDqUa1jO4AX5IoSmXOx
	iIkvLS279OM2hNJKihMD3GWLKEo+MlIVLoo+rve9GC9LMsuwJACnPL3ouXPI2i9Djc08
	79axVJgH6OtFrDg5vbmWOHeSkMCELFjhVLQdMLGq2SRI38/cUHd6J67W8mfKvA+rmsqm
	zbJb8P4uo2npYnFcqMB2aERiXRBXQFwvUUjIFjyz+PeudiYvmtd9j2LSdQSGzyQFUmX9
	zC8w==
X-Gm-Message-State: ALQs6tBFQbEPo67vRkyzHOhHWAkTu3reWDIrwIn9y8PIWBOy5JETpqo2
	W/hNCLraT9OLRxgdwlsT/bYdlw==
X-Received: by 10.98.192.220 with SMTP id g89mr44768695pfk.223.1525888510676; 
	Wed, 09 May 2018 10:55:10 -0700 (PDT)
Received: from cloudburst.twiddle.net (97-113-2-170.tukw.qwest.net.
	[97.113.2.170]) by smtp.gmail.com with ESMTPSA id
	l90sm60332813pfb.149.2018.05.09.10.55.09
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 09 May 2018 10:55:09 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Date: Wed,  9 May 2018 10:54:36 -0700
Message-Id: <20180509175458.15642-7-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.17.0
In-Reply-To: <20180509175458.15642-1-richard.henderson@linaro.org>
References: <20180509175458.15642-1-richard.henderson@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c05::241
Subject: [Qemu-arm] [PULL 06/28] target/tilegx: avoid integer overflow in
 next_page PC check
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
Cc: peter.maydell@linaro.org, Sagar Karandikar <sagark@eecs.berkeley.edu>,
	David Hildenbrand <david@redhat.com>, Palmer Dabbelt <palmer@sifive.com>,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
	Max Filippov <jcmvbkbc@gmail.com>, Michael Clark <mjc@sifive.com>,
	Guan Xuetao <gxt@mprc.pku.edu.cn>, Yongbok Kim <yongbok.kim@mips.com>,
	Alexander Graf <agraf@suse.de>, "Emilio G. Cota" <cota@braap.org>,
	Richard Henderson <rth@twiddle.net>,
	Artyom Tarasenko <atar4qemu@gmail.com>,
	Eduardo Habkost <ehabkost@redhat.com>, qemu-s390x@nongnu.org,
	qemu-arm@nongnu.org, Stafford Horne <shorne@gmail.com>,
	David Gibson <david@gibson.dropbear.id.au>,
	Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
	Cornelia Huck <cohuck@redhat.com>,
	Michael Walle <michael@walle.cc>, qemu-ppc@nongnu.org,
	Paolo Bonzini <pbonzini@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ns0dD9jv6NEH

From: "Emilio G. Cota" <cota@braap.org>

If the PC is in the last page of the address space, next_page_start
overflows to 0. Fix it.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Emilio G. Cota <cota@braap.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/tilegx/translate.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/target/tilegx/translate.c b/target/tilegx/translate.c
index d63bf5bba3..6c53c5e767 100644
--- a/target/tilegx/translate.c
+++ b/target/tilegx/translate.c
@@ -2375,7 +2375,7 @@ void gen_intermediate_code(CPUState *cs, struct TranslationBlock *tb)
     DisasContext ctx;
     DisasContext *dc = &ctx;
     uint64_t pc_start = tb->pc;
-    uint64_t next_page_start = (pc_start & TARGET_PAGE_MASK) + TARGET_PAGE_SIZE;
+    uint64_t page_start = pc_start & TARGET_PAGE_MASK;
     int num_insns = 0;
     int max_insns = tb_cflags(tb) & CF_COUNT_MASK;
 
@@ -2415,7 +2415,7 @@ void gen_intermediate_code(CPUState *cs, struct TranslationBlock *tb)
         }
         dc->pc += TILEGX_BUNDLE_SIZE_IN_BYTES;
         if (num_insns >= max_insns
-            || dc->pc >= next_page_start
+            || (dc->pc - page_start >= TARGET_PAGE_SIZE)
             || tcg_op_buf_full()) {
             /* Ending the TB due to TB size or page boundary.  Set PC.  */
             tcg_gen_movi_tl(cpu_pc, dc->pc);
-- 
2.17.0

