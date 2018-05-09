Received: by 10.28.4.212 with SMTP id 203csp51579wme;
        Wed, 9 May 2018 10:58:49 -0700 (PDT)
X-Google-Smtp-Source: AB8JxZrWcKUsXa/rhHZKpHrql3mSGgOcYY5Iw3z5vpBFvDA1F5lF15kV1rcrSfRYMJhCFc1UCQX5
X-Received: by 2002:a0c:8b55:: with SMTP id d21-v6mr26852995qvc.164.1525888729720;
        Wed, 09 May 2018 10:58:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1525888729; cv=none;
        d=google.com; s=arc-20160816;
        b=p81ifBH2++qCvysWN586TVientWLsvY3SWlX8wBIGte0u+u3Nrk2C/1tEjB89oP3Pm
         hUnxIzK+ooySbfssZThirfdUMIBP9pzPnKOiE59P5W/ql8OBU4BHZmkvXYs9GR9JvfFH
         yJxigpqkQoTQm9S7jOLhMpRz2eeC0EhfG3Aj1DawE1HQx3d8I5wT/HE/kOXjJ34Td+qJ
         x1yk+5BcXM0gDV+PaYVPK1jtruLxrs7+Rzqv5b+avwXVkqWZDmcZu7JYfuwKlOKjclGO
         hq+kr6MRY18Al4k8ooylp4rmhoNllkuY+DjfjIdjFXUa7ZxdC+qt9YwFy6jz5HFi4PFh
         L/2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-signature:arc-authentication-results;
        bh=6VQangtIjAwJ133sYgDadXihJUXTelwtJPHnYxQD5HQ=;
        b=A6On/pCuGrrGXgMVJu82p3re3mwrma/ElSPCURZRosOYAbjeSuhkaXF9wR7IXY/GjQ
         FQNOcf3au/elPHD3iKCUWUcprfdanpJ6F5SdEbFCzyB1GVcPycuHYshOEAeElDV38oEs
         FVSb8mK26DC2LsmXgzaq6q90fVok6BiEvCz80WQKhxFiGngT/nJnOiFOsN4lE0sqd0iz
         8B4072CIV/JHCGeoOFvqHByi53zyMLKSaiAhPEyVfM/dv5yeVL5jej8C2HYSZ33IYf0E
         /ffG9YmGhM0nY96IwJkQPNh6+H42gpAmUdrF/GRsraRZhWWiMxWFVlPgontpeZWY1o7W
         ofdw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Be48oPbQ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id o15-v6si4828367qta.339.2018.05.09.10.58.49
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 09 May 2018 10:58:49 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Be48oPbQ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:58109 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fGTMX-0000Hk-42
	for alex.bennee@linaro.org; Wed, 09 May 2018 13:58:49 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47782)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1fGTJ2-0004Py-46
	for qemu-arm@nongnu.org; Wed, 09 May 2018 13:55:13 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1fGTJ0-0005Eu-Iq
	for qemu-arm@nongnu.org; Wed, 09 May 2018 13:55:12 -0400
Received: from mail-pf0-x243.google.com ([2607:f8b0:400e:c00::243]:46127)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1fGTJ0-0005DA-5z
	for qemu-arm@nongnu.org; Wed, 09 May 2018 13:55:10 -0400
Received: by mail-pf0-x243.google.com with SMTP id p12so25985358pff.13
	for <qemu-arm@nongnu.org>; Wed, 09 May 2018 10:55:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=6VQangtIjAwJ133sYgDadXihJUXTelwtJPHnYxQD5HQ=;
	b=Be48oPbQ+FH2te8U1jkoPAyuCo56CRMeKVQI0ejuwVID4prj6xbkiKIGw2lR41PrdN
	f0Bkbw4KRK5bc1o4CWFv2JiXFWeAQc5T2pe/CoAvJ9c1OPsXbt2W4DO2djSrWlnTlkUL
	FhcX94Tj9RvzOag7JbvkqWgIJ/YpVux0Ej9To=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=6VQangtIjAwJ133sYgDadXihJUXTelwtJPHnYxQD5HQ=;
	b=eWejDLG/MPL1H0KZ4Ggx0bMOL5bsLCevi4DaZmnv2gbtIRd/R4Q2Iyvedv1c/040E1
	oEvNoUpvyOEAUEKqBEnizt+Kd/nwsLWhht5DvF66XwyW+IH7FaLaIm3O64CMItUT53C9
	eqVX4K/X1D037J+KlnBuUML64DuKiuUKaowZtUCywvPBbqTNUKbG6w29JFOuctKAmH6F
	2DQbENTpG2e5gQpxaE6jNTC7F44H2o3Nn5Jy28aKRec/sK81B0ii1oOHR0xbCvN4v395
	11hC0c7YuAkRHkok2QuS87LHE7WuLG2xWPD2z8pXAvFnT9lQUS4M94tV01MUD9VfCrM6
	JWYA==
X-Gm-Message-State: ALKqPwcCwLeojceu038mY7AEHl62uZ2J55jhtEhLJRq53B0unM9ADD/a
	fAeiA5M6c5Zz0jH2kpr6yq3yXQ==
X-Received: by 2002:a63:6142:: with SMTP id
	v63-v6mr1994037pgb.432.1525888509070; 
	Wed, 09 May 2018 10:55:09 -0700 (PDT)
Received: from cloudburst.twiddle.net (97-113-2-170.tukw.qwest.net.
	[97.113.2.170]) by smtp.gmail.com with ESMTPSA id
	l90sm60332813pfb.149.2018.05.09.10.55.07
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 09 May 2018 10:55:08 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Date: Wed,  9 May 2018 10:54:35 -0700
Message-Id: <20180509175458.15642-6-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.17.0
In-Reply-To: <20180509175458.15642-1-richard.henderson@linaro.org>
References: <20180509175458.15642-1-richard.henderson@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c00::243
Subject: [Qemu-arm] [PULL 05/28] target/unicore32: avoid integer overflow in
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
X-TUID: iL/9wTmei/LU

From: "Emilio G. Cota" <cota@braap.org>

If the PC is in the last page of the address space, next_page_start
overflows to 0. Fix it.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Cc: Guan Xuetao <gxt@mprc.pku.edu.cn>
Signed-off-by: Emilio G. Cota <cota@braap.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/unicore32/translate.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/target/unicore32/translate.c b/target/unicore32/translate.c
index 5b51f2166d..abe2ea8592 100644
--- a/target/unicore32/translate.c
+++ b/target/unicore32/translate.c
@@ -1875,7 +1875,7 @@ void gen_intermediate_code(CPUState *cs, TranslationBlock *tb)
     CPUUniCore32State *env = cs->env_ptr;
     DisasContext dc1, *dc = &dc1;
     target_ulong pc_start;
-    uint32_t next_page_start;
+    uint32_t page_start;
     int num_insns;
     int max_insns;
 
@@ -1894,7 +1894,7 @@ void gen_intermediate_code(CPUState *cs, TranslationBlock *tb)
     cpu_F1s = tcg_temp_new_i32();
     cpu_F0d = tcg_temp_new_i64();
     cpu_F1d = tcg_temp_new_i64();
-    next_page_start = (pc_start & TARGET_PAGE_MASK) + TARGET_PAGE_SIZE;
+    page_start = pc_start & TARGET_PAGE_MASK;
     num_insns = 0;
     max_insns = tb_cflags(tb) & CF_COUNT_MASK;
     if (max_insns == 0) {
@@ -1951,7 +1951,7 @@ void gen_intermediate_code(CPUState *cs, TranslationBlock *tb)
     } while (!dc->is_jmp && !tcg_op_buf_full() &&
              !cs->singlestep_enabled &&
              !singlestep &&
-             dc->pc < next_page_start &&
+             dc->pc - page_start < TARGET_PAGE_SIZE &&
              num_insns < max_insns);
 
     if (tb_cflags(tb) & CF_LAST_IO) {
-- 
2.17.0

