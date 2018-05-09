Received: by 10.28.4.212 with SMTP id 203csp49238wme;
        Wed, 9 May 2018 10:56:13 -0700 (PDT)
X-Google-Smtp-Source: AB8JxZqolBMI7qLT8lAdvuyS5+2vdaXLNiUGLJyVN0amx3HvuUZR0fEXEZcQYmRnhkDee78GANq6
X-Received: by 10.55.24.96 with SMTP id j93mr37717607qkh.11.1525888572933;
        Wed, 09 May 2018 10:56:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1525888572; cv=none;
        d=google.com; s=arc-20160816;
        b=q4+xppNOKWbNIXOlJz6MCWF3ntwvDeTetiX8syEmvYF3LwzAOPfHnKF8Q/PiQURvxx
         FfABs0cf2e2BwT8Dt/q5d+oWFykVlt9ffP2NYS35Bu6j4ckU74qnDjD0ykc8R/jHoDfi
         xDvunoYNaZvxYJB/qyu62zFP8DP62o/aoFQkhpTzfgpyFTR2Uucu1TTnj8ODKNtxtiJ4
         6BcW5IWzc2VfWJ1taSeT9b1NqNYkPX7Dct5CNXIth3vX9oqRcLRPpmai9Zit5Nv7HQoD
         pRPPe4GJ5jtV9Lvj5awI8mMgoZwVrkN+MmjP9RAKIVqQwGxfb+KlWJIr7kDOCwPzZOMe
         ZZPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-signature:arc-authentication-results;
        bh=rPj9lU0iZ9WGDR12RZsiZ4M3s0sB5FZV3Ne4MSulYgQ=;
        b=mFkJ3Bgcbw9YuUIlbpRE0gmjbVU0SNIVzKncXtL82rHe3sysBY07j9OMjvUugIWUKg
         bMfoUA9PQQCwbDw4ftDWowwEGdHqiJkDrZHD7jz48bJPVfZ2BRxMrsVN+9zK7P3AvTXl
         IKvZUPeQQEBiRPn3a0Wdw9Ece7VHB04SNttyj99cix1I5xYOOSYDiW1+glvCXLpf8soF
         hyjuRmbg+I3VHEI9GlAEbmugjT/pnyhcnbFln8baLbTGgUQO74akMJHy9v1Pv/pulyMa
         0JzIAuCVlaMWzR0bsLNYIEEfkUJIThNex41r5SDKGnhEj8ecm72QdYiVm2JhoTPjir34
         pesw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=ZWDVafZk;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id r13-v6si9860465qvc.59.2018.05.09.10.56.12
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 09 May 2018 10:56:12 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=ZWDVafZk;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:58080 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fGTK0-0005DT-96
	for alex.bennee@linaro.org; Wed, 09 May 2018 13:56:12 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47576)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1fGTIx-0004M7-9t
	for qemu-devel@nongnu.org; Wed, 09 May 2018 13:55:12 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1fGTIt-00052p-KX
	for qemu-devel@nongnu.org; Wed, 09 May 2018 13:55:07 -0400
Received: from mail-pf0-x241.google.com ([2607:f8b0:400e:c00::241]:40591)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1fGTIt-00051k-Fo
	for qemu-devel@nongnu.org; Wed, 09 May 2018 13:55:03 -0400
Received: by mail-pf0-x241.google.com with SMTP id f189so25991559pfa.7
	for <qemu-devel@nongnu.org>; Wed, 09 May 2018 10:55:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=rPj9lU0iZ9WGDR12RZsiZ4M3s0sB5FZV3Ne4MSulYgQ=;
	b=ZWDVafZk4j6QUJsTzG3pFTkQOxrdgbTiugj8Adb3n0Mhy1qsP6E5s0bLT9GuRB/N0q
	h+aTNHtPQ8ttTpitlokdmrdbNej/gR6gaOazefD/rxi5mveQ0X/s27DfVRYJx6ABsGL1
	81U+43dKtnCQd1ykPh+VJj1QsGaNj1gmraEYk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=rPj9lU0iZ9WGDR12RZsiZ4M3s0sB5FZV3Ne4MSulYgQ=;
	b=H6Noc7or7ZSMA1iUDo3Gpfr/h3M4o6gguzx5aAuCSfRBeJcZlsrT6ilOjb7VIs46Oi
	GMsYhdzqEBWAXGjGqcwSi/BuIHrFe9/6r6fnLQ2TxG7Y4IXB0DluNDrH++3ELkFoBG9G
	zfnrsKcaz7XV2Rnq8rxaeLvMD5ysLEP9FavjOU+GJ7pmMdaEOGfP7EtL4OwPF6eIYvQ1
	5cU4Re3vDGgL0EiTyzjYKe/MRwE4JJXsTuvpks4Vy/XGoomZuzBV+sToM0Oj8bAE6Irc
	9ogwqEJN3eHGeIYhwRimFbONR4S74oxFJwlBUME7s2BRHanBHgltFfAfrZrd3sku8MRb
	Gtcw==
X-Gm-Message-State: ALKqPwchjZxPteQ1mGovXP2KAKa3bKVGzoHT54T7cxkLKz94w4hyT0Bg
	oxJgQ2lb+cEnLDO7bloFfJb47VeUoHo=
X-Received: by 2002:a65:550d:: with SMTP id
	f13-v6mr6000914pgr.324.1525888502044; 
	Wed, 09 May 2018 10:55:02 -0700 (PDT)
Received: from cloudburst.twiddle.net (97-113-2-170.tukw.qwest.net.
	[97.113.2.170]) by smtp.gmail.com with ESMTPSA id
	l90sm60332813pfb.149.2018.05.09.10.55.00
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 09 May 2018 10:55:01 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Date: Wed,  9 May 2018 10:54:31 -0700
Message-Id: <20180509175458.15642-2-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.17.0
In-Reply-To: <20180509175458.15642-1-richard.henderson@linaro.org>
References: <20180509175458.15642-1-richard.henderson@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c00::241
Subject: [Qemu-devel] [PULL 01/28] target/riscv: avoid integer overflow in
 next_page PC check
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
Cc: peter.maydell@linaro.org, Sagar Karandikar <sagark@eecs.berkeley.edu>,
	David Hildenbrand <david@redhat.com>, Palmer Dabbelt <palmer@sifive.com>,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
	Max Filippov <jcmvbkbc@gmail.com>, Michael Clark <mjc@sifive.com>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	Guan Xuetao <gxt@mprc.pku.edu.cn>, Yongbok Kim <yongbok.kim@mips.com>,
	Alexander Graf <agraf@suse.de>, "Emilio G. Cota" <cota@braap.org>,
	Richard Henderson <rth@twiddle.net>,
	Artyom Tarasenko <atar4qemu@gmail.com>,
	Eduardo Habkost <ehabkost@redhat.com>, qemu-s390x@nongnu.org,
	qemu-arm@nongnu.org, Stafford Horne <shorne@gmail.com>,
	David Gibson <david@gibson.dropbear.id.au>,
	Peter Crosthwaite <crosthwaite.peter@gmail.com>,
	Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
	Cornelia Huck <cohuck@redhat.com>,
	Michael Walle <michael@walle.cc>, qemu-ppc@nongnu.org,
	Paolo Bonzini <pbonzini@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Q8NOsEXme5Ld

From: "Emilio G. Cota" <cota@braap.org>

If the PC is in the last page of the address space, next_page_start
overflows to 0. Fix it.

Reported-by: Richard Henderson <richard.henderson@linaro.org>
Suggested-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Michael Clark <mjc@sifive.com>
Acked-by: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
Cc: Michael Clark <mjc@sifive.com>
Cc: Palmer Dabbelt <palmer@sifive.com>
Cc: Sagar Karandikar <sagark@eecs.berkeley.edu>
Cc: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
Signed-off-by: Emilio G. Cota <cota@braap.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/riscv/translate.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/target/riscv/translate.c b/target/riscv/translate.c
index c0e6a044d3..a98033ca77 100644
--- a/target/riscv/translate.c
+++ b/target/riscv/translate.c
@@ -1850,11 +1850,11 @@ void gen_intermediate_code(CPUState *cs, TranslationBlock *tb)
     CPURISCVState *env = cs->env_ptr;
     DisasContext ctx;
     target_ulong pc_start;
-    target_ulong next_page_start;
+    target_ulong page_start;
     int num_insns;
     int max_insns;
     pc_start = tb->pc;
-    next_page_start = (pc_start & TARGET_PAGE_MASK) + TARGET_PAGE_SIZE;
+    page_start = pc_start & TARGET_PAGE_MASK;
     ctx.pc = pc_start;
 
     /* once we have GDB, the rest of the translate.c implementation should be
@@ -1904,7 +1904,7 @@ void gen_intermediate_code(CPUState *cs, TranslationBlock *tb)
         if (cs->singlestep_enabled) {
             break;
         }
-        if (ctx.pc >= next_page_start) {
+        if (ctx.pc - page_start >= TARGET_PAGE_SIZE) {
             break;
         }
         if (tcg_op_buf_full()) {
-- 
2.17.0

