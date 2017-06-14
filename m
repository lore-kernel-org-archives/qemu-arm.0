Received: by 10.25.0.23 with SMTP id 23csp466954lfa;
        Wed, 14 Jun 2017 12:48:32 -0700 (PDT)
X-Received: by 10.237.63.78 with SMTP id q14mr2143617qtf.49.1497469711935;
        Wed, 14 Jun 2017 12:48:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1497469711; cv=none;
        d=google.com; s=arc-20160816;
        b=07k9jDopn7PVRNSFx+jcaBBLtSnvenwdCB+52oaUU35wnLbbr8l//Sk2GZKgkzyUta
         uLeQ1HZtD+NuSIspTEdeoVPZ/y00nrTVL89p8zF8LJQljUWA/FCPg6AWjyzE/cJWbwsa
         haAfmaiSujv6hpq+LcYcS8guXlDAqGYKTO2EZBEUR1GKbZrG7OjTRS4EoUawACwjUtVB
         //AOSYRjgFL9JNPhgHzaJA4pdoBpgOg5lU7gAn23o9zoBGWCwJd9C3+jeqG4SZVP44FQ
         DwsLHGRSpp67VEwVTpd1VRBurAI775hB69lBR/9SmzaR/Dpkks3m5WZFAru+tw0coAOy
         UtuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:sender
         :dkim-signature:arc-authentication-results;
        bh=EHln7mvAkRHwv9Qze1WRY4taLrjRwniYNbupA8mu76U=;
        b=Y2NaStRRyTlGafNG9iMTwk2dxfXOtrguiO8DNRcPpmxmZ4KUc0OGV8rGFFGqAuOFtp
         Q8WNLpYnkvcNwHoa+TWqvKnSkIUQK//JMHK3S8HqCPxDGaBcHLxYDoXffPZHWvRlcRcl
         pmOg3BJAqN7uh5F5lv2KNU13ODgAPAIlgsRicNsiW1HUiasc/g48tLJLoz9sq79uIp9K
         HzmC6NLlYYNNW5RsdL+CBzdLnLQEnTCi7g8en5nNJRR15+j3QQg9qo02zRsRrAcFdYMm
         WHKa2Lli9J6N9+mwi82FtO/B/DwLiyM/vmR8Cj14TITdQbo+OfdbOumCcArvfKVreqUb
         YXWw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.b=uodO6Ntm;
       spf=pass (google.com: domain of rth7680@gmail.com designates 2607:f8b0:400d:c0d::243 as permitted sender) smtp.mailfrom=rth7680@gmail.com
Return-Path: <rth7680@gmail.com>
Received: from mail-qt0-x243.google.com (mail-qt0-x243.google.com. [2607:f8b0:400d:c0d::243])
        by mx.google.com with ESMTPS id e55si839156qte.49.2017.06.14.12.48.31
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 14 Jun 2017 12:48:31 -0700 (PDT)
Received-SPF: pass (google.com: domain of rth7680@gmail.com designates 2607:f8b0:400d:c0d::243 as permitted sender) client-ip=2607:f8b0:400d:c0d::243;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.b=uodO6Ntm;
       spf=pass (google.com: domain of rth7680@gmail.com designates 2607:f8b0:400d:c0d::243 as permitted sender) smtp.mailfrom=rth7680@gmail.com
Received: by mail-qt0-x243.google.com with SMTP id w1so2208300qtg.0;
        Wed, 14 Jun 2017 12:48:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=EHln7mvAkRHwv9Qze1WRY4taLrjRwniYNbupA8mu76U=;
        b=uodO6Ntm1J/5gxoF4u2gZZWDAlZY1jRoojuS0gSeZMyfK50PPQVK8/RPxrC837fUkb
         RBreFOWrDRCdL2q1PoBJ2YwCT054NO+ltA6Au488rk39AtQkgJxsHkJ/dS7n4u8vW11m
         UXRKt0XLMQg5+u+iJ4XI2fe3Tu5YAwlGnttX3RVvzzeDUoJa1xgIcW7v1qQrG9Xee0Mj
         pepdil6ExuG6pb14h1sgkc12h0p61nxDvJfFXjYd/Zw7CGqCC3+xvA6KW/1lDErukclB
         V7nt87kPnX9PjgmhMi3Zz+6gWW7lPwEsfF2aiMGKFS3ZPZd8Yl1v/1urUnMNOaMWxYS/
         Mmsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references;
        bh=EHln7mvAkRHwv9Qze1WRY4taLrjRwniYNbupA8mu76U=;
        b=NfiCFqsZ+Bz5TBssjQAAo57ZnlS3I+G5z4xRMTe0kdgkIu/5c3XpeFCpCWjyGm/zoy
         43aqG84RGqr5Runt4YPlv+3tf6Oi/5IfPmIhUGa4gv55WMieOcYQXc7APQgQuevhasHR
         Wr+sYwPIq50cxJmCl7Uf6nYFD2pDHZkHlrYu9PyPSk1aRw1L3Mu+A112Bc51JfCIbTZK
         dwSErNTSejXslSS/H5fP0HWX7RsyNrQZcNok+MP+xHJ17MJ/SO5qLOESXXjyV2u1/DLE
         /ie/rHaRbUcSm/z0CIWDnc7z3CwijzrKv6wQ4j9HNyvbOgbhTlqxosTG5yfRzwJTDZyU
         Qhcg==
X-Gm-Message-State: AKS2vOwoqE1nsAb0q9Xr0Ug7q6NODxMI+Uin4XNwEK5TLiPd22fueeRD
	WCg/e+Ac6XCoHA==
X-Received: by 10.237.54.71 with SMTP id e65mr2312788qtb.146.1497469711524;
        Wed, 14 Jun 2017 12:48:31 -0700 (PDT)
Return-Path: <rth7680@gmail.com>
Received: from bigtime.twiddle.net.com (97-113-165-157.tukw.qwest.net. [97.113.165.157])
        by smtp.gmail.com with ESMTPSA id o93sm628571qte.41.2017.06.14.12.48.30
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 14 Jun 2017 12:48:30 -0700 (PDT)
Sender: Richard Henderson <rth7680@gmail.com>
From: Richard Henderson <rth@twiddle.net>
To: qemu-devel@nongnu.org
Cc: alex.bennee@linaro.org,
	cota@braap.org,
	pbonzini@redhat.com,
	qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v2 5/5] target/arm: Exit after clearing interrupt mask
Date: Wed, 14 Jun 2017 12:48:21 -0700
Message-Id: <20170614194821.8754-6-rth@twiddle.net>
X-Mailer: git-send-email 2.9.4
In-Reply-To: <20170614194821.8754-1-rth@twiddle.net>
References: <20170614194821.8754-1-rth@twiddle.net>
X-TUID: 1BbSt8ChAoiw

Exit to cpu loop so we reevaluate cpu_arm_hw_interrupts.

Cc: qemu-arm@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <rth@twiddle.net>
---
 target/arm/translate-a64.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index 860e279..e55547d 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -1422,7 +1422,9 @@ static void handle_msr_i(DisasContext *s, uint32_t insn,
         gen_helper_msr_i_pstate(cpu_env, tcg_op, tcg_imm);
         tcg_temp_free_i32(tcg_imm);
         tcg_temp_free_i32(tcg_op);
-        s->is_jmp = DISAS_UPDATE;
+        /* For DAIFClear, exit the cpu loop to re-evaluate pending IRQs.  */
+        gen_a64_set_pc_im(s->pc);
+        s->is_jmp = (op == 0x1f ? DISAS_EXIT : DISAS_JUMP);
         break;
     }
     default:
@@ -11369,6 +11371,9 @@ void gen_intermediate_code_a64(ARMCPU *cpu, TranslationBlock *tb)
         case DISAS_JUMP:
             tcg_gen_lookup_and_goto_ptr(cpu_pc);
             break;
+        case DISAS_EXIT:
+            tcg_gen_exit_tb(0);
+            break;
         case DISAS_TB_JUMP:
         case DISAS_EXC:
         case DISAS_SWI:
-- 
2.9.4
