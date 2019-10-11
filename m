Received: by 2002:adf:e804:0:0:0:0:0 with SMTP id o4csp1016505wrm;
        Fri, 11 Oct 2019 08:59:46 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxFZb0Rxa79T8oaNRmOEnvCjuzgKPHNkvAyoMaKYS1nWz/7oT9B/KQoeOuLEyhvsEMmz9fG
X-Received: by 2002:ac8:32ab:: with SMTP id z40mr13518782qta.391.1570809585784;
        Fri, 11 Oct 2019 08:59:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1570809585; cv=none;
        d=google.com; s=arc-20160816;
        b=tKcHmz0EsSsSuaMFUK65Mkz8WZlvZ9ZT8ESZ9p3/SHcJ56SYqogndCrtDJ8LRJn2w4
         PSZoi5cExjXQ4tKlBlQ2lcjdq1oEjYTTktTkSXJPiQ/9RAATLrMkvrpy3qbiLFZUjFnD
         kvxjSLNin1DEZe4lxdM4/+52WS0y3yL8MGZ1Z4FFB+U56XAD0rwU6cEBprGg2NzsTZmA
         E6az4mqM28P8ymYcTTALZCt9QnTIYLR24eepEJd7VPhaz5t6hCGZ1/1mOYiag8M5ukpK
         seZcaCbYh1mh5G04cIjQ4yEoO3dpU1fDBX4zDxotXxtGOUQzq3zIan/wBwpYVOYhWJA5
         cYeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:references:in-reply-to
         :message-id:date:subject:to:from:dkim-signature;
        bh=DCSw/5tSs06WnyBBz0elixvkoTyCltSaS21y5mPKf08=;
        b=fcf+xcPWF9KkKrvpDrt9+QBTqVZPiLWrVRi3VK81DZ6NU31N1h/B9jP88nSb5iPhKR
         jD1+SOwHp36Wc33trjt4b2smOJeZyLqP45agt7L5s/ng8Aptm5UEBwgyc7+jDYgXd7JC
         vNVaIVxBQMv+5F8Z5qvME/gDi98Btz4EUNryEsac8uHNeyiURiIqWqWg7cadbgE909UR
         q2Y1drEIKBn48hOuf7NAYx4h+VYJHe1PNnqm2LorUZkNhcd3wBre6wIjH/BsROj23inf
         /Ez5bAGl8ZrFx01RHBCplLvarkI5TTWeRVsC3hYWMU4SBT6MCq1tWweB+EkmH3wOh10I
         XZ8g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=RZk1XQ0A;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 47si9182806qvj.139.2019.10.11.08.59.45
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 11 Oct 2019 08:59:45 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=RZk1XQ0A;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:52860 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iIxKS-00074i-RG
	for alex.bennee@linaro.org; Fri, 11 Oct 2019 11:59:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34007)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1iIxH2-0002mm-Nt
 for qemu-devel@nongnu.org; Fri, 11 Oct 2019 11:56:13 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1iIxH1-0007t6-Jz
 for qemu-devel@nongnu.org; Fri, 11 Oct 2019 11:56:12 -0400
Received: from mail-yw1-xc2f.google.com ([2607:f8b0:4864:20::c2f]:34677)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1iIxH1-0007sV-GW
 for qemu-devel@nongnu.org; Fri, 11 Oct 2019 11:56:11 -0400
Received: by mail-yw1-xc2f.google.com with SMTP id d192so3653868ywa.1
 for <qemu-devel@nongnu.org>; Fri, 11 Oct 2019 08:56:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=DCSw/5tSs06WnyBBz0elixvkoTyCltSaS21y5mPKf08=;
 b=RZk1XQ0AyDu7WLopi7UjKmZExBFfbiQQDTYGRKlQe/93Nnw8f8a5ic8TfED2nJkbcJ
 +a9f7L4hLPg2JIQZl4it4HPtlJXiv6DhbaPUi0yOzpH8F1uGFHGGLHZ8LIrt300R4FYU
 oKGLZuup6I6FzivBeKC9of/WjrxKHOKsSEhekVNT9hgnK9OpYjx6gQAf+25RFs26131F
 qdvr5TTNwAJUNn7yE4d64AOXe4Ex/M72r6RTtAz815QKEhiOf41ogqLNWqBGP7W5GfOr
 FpyUytdpYAyi51iamDUAUIKs3+TLjpge3t2X5k+/Ksd2hBrZV2TlnQVpBocVEN3VobAn
 tThQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=DCSw/5tSs06WnyBBz0elixvkoTyCltSaS21y5mPKf08=;
 b=W1Be8ejcUmVRYs8l/opSy/Mw9biQQSRMMDCgWc9UB4j3xaeQ/b58KDAJWV+uxI6JaK
 AZeqPFtTulU96mNC3ocg4jiVQ376ZIKwVsJFC8taMzM5ABTtJZ5jfhDhycOzC3ZEZo0E
 fWbC09r+zCAMcWDXhZvTDjrQiF3x0rL9QJD9BXY5sO1nD2WylrFubu16RSy8ioirn5vd
 +eGbko8ez0eKscWWj5Dl+NHi+7VRKopdAxLm/0G8xlCQkDziOfSCJxUAHoD/sZ/Z4+nZ
 57lHbWZ/gBhEgjJoFB8QHCYvLjNYaLwlG7vhSrhAU216f8jab+dZD0tA9+m/hGrAuA6M
 1cxQ==
X-Gm-Message-State: APjAAAVcO6Eqtp7woyzZQFvQgscFjJGPNQ0d8Bz/VLFHXt8l41o31iCE
 I6Gmb2ZoTzC4lP+YyEIrLP64pH/VWZ4=
X-Received: by 2002:a81:8282:: with SMTP id s124mr2994173ywf.498.1570809370122; 
 Fri, 11 Oct 2019 08:56:10 -0700 (PDT)
Received: from cloudburst.gateway.pace.com (67.216.151.25.pool.hargray.net.
 [67.216.151.25])
 by smtp.gmail.com with ESMTPSA id d17sm2473139ywb.95.2019.10.11.08.56.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Oct 2019 08:56:09 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v6 19/20] target/arm: Rebuild hflags for M-profile.
Date: Fri, 11 Oct 2019 11:55:45 -0400
Message-Id: <20191011155546.14342-20-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191011155546.14342-1-richard.henderson@linaro.org>
References: <20191011155546.14342-1-richard.henderson@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::c2f
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: laurent.desnogues@gmail.com, peter.maydell@linaro.org, qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: QN2W3Jo35mNZ

Continue setting, but not relying upon, env->hflags.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/m_helper.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/target/arm/m_helper.c b/target/arm/m_helper.c
index 27cd2f3f96..f2512e448e 100644
--- a/target/arm/m_helper.c
+++ b/target/arm/m_helper.c
@@ -494,6 +494,7 @@ void HELPER(v7m_bxns)(CPUARMState *env, uint32_t dest)
     switch_v7m_security_state(env, dest & 1);
     env->thumb = 1;
     env->regs[15] = dest & ~1;
+    arm_rebuild_hflags(env);
 }
 
 void HELPER(v7m_blxns)(CPUARMState *env, uint32_t dest)
@@ -555,6 +556,7 @@ void HELPER(v7m_blxns)(CPUARMState *env, uint32_t dest)
     switch_v7m_security_state(env, 0);
     env->thumb = 1;
     env->regs[15] = dest;
+    arm_rebuild_hflags(env);
 }
 
 static uint32_t *get_v7m_sp_ptr(CPUARMState *env, bool secure, bool threadmode,
@@ -895,6 +897,7 @@ static void v7m_exception_taken(ARMCPU *cpu, uint32_t lr, bool dotailchain,
     env->regs[14] = lr;
     env->regs[15] = addr & 0xfffffffe;
     env->thumb = addr & 1;
+    arm_rebuild_hflags(env);
 }
 
 static void v7m_update_fpccr(CPUARMState *env, uint32_t frameptr,
@@ -1765,6 +1768,7 @@ static void do_v7m_exception_exit(ARMCPU *cpu)
 
     /* Otherwise, we have a successful exception exit. */
     arm_clear_exclusive(env);
+    arm_rebuild_hflags(env);
     qemu_log_mask(CPU_LOG_INT, "...successful exception return\n");
 }
 
@@ -1837,6 +1841,7 @@ static bool do_v7m_function_return(ARMCPU *cpu)
     xpsr_write(env, 0, XPSR_IT);
     env->thumb = newpc & 1;
     env->regs[15] = newpc & ~1;
+    arm_rebuild_hflags(env);
 
     qemu_log_mask(CPU_LOG_INT, "...function return successful\n");
     return true;
@@ -1959,6 +1964,7 @@ static bool v7m_handle_execute_nsc(ARMCPU *cpu)
     switch_v7m_security_state(env, true);
     xpsr_write(env, 0, XPSR_IT);
     env->regs[15] += 4;
+    arm_rebuild_hflags(env);
     return true;
 
 gen_invep:
-- 
2.17.1

