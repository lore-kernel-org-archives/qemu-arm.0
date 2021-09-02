Received: by 2002:a19:5205:0:0:0:0:0 with SMTP id m5csp369439lfb;
        Thu, 2 Sep 2021 08:22:19 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwn0TBiS62nh41REHv4aBvw5x4kqbDJ3k3RmyNtUKzeLsTFChr9NAum68yS+1zncMJ36ZtC
X-Received: by 2002:adf:ebcd:: with SMTP id v13mr4447633wrn.400.1630596139435;
        Thu, 02 Sep 2021 08:22:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1630596139; cv=none;
        d=google.com; s=arc-20160816;
        b=lkHL2AfJS9ChXz8iydcKCQxSfY9jklD5aneWUnEUG7PA8lPUgqI92MswZXvtxYoHl+
         uECz3mUOZhFIZi6px6sR/3iEzRxgzDIZivvMlY2K0tr61t/I5ETOVhBP4x9gnb6oSTrT
         gCsGvvXkTexSEWAtaEBxIAss0jsEdXGKhWDvJ8oGtMybB3jCVpspcPHbuLx7lqBwGPEa
         etBndUJMSmKvEOokdSN0iYiOg+4uPV+zHMH5Udt7t/a7UDO8cimzSAi4br8rDw0vtwvm
         Yt3Lv5J6vgDVOiNYLMDy1zBXnjaqXuAlB1aMoHeh3aF8AvEJQV2Uf64xZGjiC72X0lJN
         oQLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=bzANSLmsGdJwadQ2kXgbZKI1Q8VNrscDKhhidFGsH+0=;
        b=LTfSnRl2drTOHSu2FgEvxWcTkhHAavq3y5aBp6iPQDn5IKgFCNqa/bDBAcy426f7Ae
         Vh0Hd5a96NYWRCT80ZFLLeSbjDE6DXc2/Y3xbUt4L0ut4+JvpHrYJ1efIpJuuoD+1w/h
         JVHTuSOls3oNK1TOCXRKbgItoKuqC+tmofuwK7imgEpYq8X57QFTkDICGr1PMUzAqiKk
         YRp8MrHAhjxq1UlHMYus48AvIUesA6dNskNFTonAXcsY6i30fZYNIa+i+UoaX5PQEbWU
         2uYRDE6etizCtJo5MDU34NxLV/FubbKRIeabFoE22JGfcdHF6zPZtMprkE+ogQv+4lkx
         Brqg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20210112 header.b=Z9k4vsPo;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id r5si2563632wrl.389.2021.09.02.08.22.19
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 02 Sep 2021 08:22:19 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20210112 header.b=Z9k4vsPo;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:35998 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mLoXi-0001x1-HX
	for alex.bennee@linaro.org; Thu, 02 Sep 2021 11:22:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46946)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mLoT3-0003hG-CZ; Thu, 02 Sep 2021 11:17:30 -0400
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333]:52965)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mLoT0-0001kX-0W; Thu, 02 Sep 2021 11:17:27 -0400
Received: by mail-wm1-x333.google.com with SMTP id e26so1539804wmk.2;
 Thu, 02 Sep 2021 08:17:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=bzANSLmsGdJwadQ2kXgbZKI1Q8VNrscDKhhidFGsH+0=;
 b=Z9k4vsPonRy5FhjiFYfve2//ax9zYfyyVD5a9Cugem8J8WsROLTUdxZhjQFB3fG7QL
 sF8pK/9U253NoTliZREGwIL5xU/HTdrvfwZATynAdrFDf1Oe+v6ovXnPzIwYG9U1myxB
 T+xcHCUrk19Oie+upTR4GwXVKPit/JG8EJu2v4/Vjp2yguR6XjnRYwoEyparRbJndYQ/
 p43ara3grrooC7fr3CTKdaFEjlBBtgKk2Opczzode5eea7w5PrHD85pJa6PPKyOGYEF0
 1e/3eV34c+knvvn3gFyAglCLRJ4MKFqF3/QWNxmPX0LfhiJa0kv8uleIl7riSopsOR7F
 f6ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=bzANSLmsGdJwadQ2kXgbZKI1Q8VNrscDKhhidFGsH+0=;
 b=n4rIgcHV69D5bY8Zo8Kue2aNN8n22EfC6b5YxQ5TkVRNE8T6qMB/ZxKnMZ5Dt3nylG
 7/jUVjy4Pjd4NsqDOAVNiFOKg5pVsc/My9MoLLnIUsaFPvMZWfZMFxJUaselgYiGdEYn
 wuuPyGcb8qZm1g572759AMgpEr4cNxbOnU6iQ6AyJIV84fdKr47+8mDjR2GhxcWgzU1Q
 BDAxssr/AEArCElUr8bZnoRq0ch1gTzGhbYCP4qkAs6+krxW2QsY+e3U2rBJoikHN2TT
 0i8a57vqh2WbRoKECwcZG6RrKH1HgYZbSJHicURZmRmuXH0+z/cv/pTZ0rVmnhV8VhUn
 55Mw==
X-Gm-Message-State: AOAM533l3FAa7JN8lvuN5n+DtA9PJQPRRiic7TLrMkL8oeWhMS2nBJog
 F4HBsDLO+PUyRz3Yvo1xbL9yFyH8e+A=
X-Received: by 2002:a7b:c097:: with SMTP id r23mr3761544wmh.114.1630595843307; 
 Thu, 02 Sep 2021 08:17:23 -0700 (PDT)
Received: from x1w.. (163.red-83-52-55.dynamicip.rima-tde.net. [83.52.55.163])
 by smtp.gmail.com with ESMTPSA id
 u9sm2193592wrm.70.2021.09.02.08.17.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Sep 2021 08:17:22 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 01/24] target/xtensa: Restrict do_transaction_failed() to
 sysemu
Date: Thu,  2 Sep 2021 17:16:52 +0200
Message-Id: <20210902151715.383678-2-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210902151715.383678-1-f4bug@amsat.org>
References: <20210902151715.383678-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x333.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>, Bin Meng <bin.meng@windriver.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Max Filippov <jcmvbkbc@gmail.com>, Alistair Francis <alistair.francis@wdc.com>,
 Warner Losh <imp@bsdimp.com>, Marek Vasut <marex@denx.de>,
 Yoshinori Sato <ysato@users.sourceforge.jp>, qemu-ppc@nongnu.org,
 Artyom Tarasenko <atar4qemu@gmail.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Kyle Evans <kevans@freebsd.org>,
 Richard Henderson <richard.henderson@linaro.org>, Greg Kurz <groug@kaod.org>,
 qemu-arm@nongnu.org, Michael Rolnik <mrolnik@gmail.com>,
 Stafford Horne <shorne@gmail.com>, David Gibson <david@gibson.dropbear.id.au>,
 qemu-riscv@nongnu.org, Chris Wulff <crwulff@gmail.com>,
 Laurent Vivier <laurent@vivier.eu>, Palmer Dabbelt <palmer@dabbelt.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ajkKpkCrdAHL

The do_transaction_failed() is restricted to system emulation since
commit cbc183d2d9f ("cpu: move cc->transaction_failed to tcg_ops").

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/xtensa/cpu.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/target/xtensa/cpu.h b/target/xtensa/cpu.h
index 2345cb59c79..1e0cb1535ca 100644
--- a/target/xtensa/cpu.h
+++ b/target/xtensa/cpu.h
@@ -568,10 +568,12 @@ bool xtensa_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
                          bool probe, uintptr_t retaddr);
 void xtensa_cpu_do_interrupt(CPUState *cpu);
 bool xtensa_cpu_exec_interrupt(CPUState *cpu, int interrupt_request);
+#ifndef CONFIG_USER_ONLY
 void xtensa_cpu_do_transaction_failed(CPUState *cs, hwaddr physaddr, vaddr addr,
                                       unsigned size, MMUAccessType access_type,
                                       int mmu_idx, MemTxAttrs attrs,
                                       MemTxResult response, uintptr_t retaddr);
+#endif /* !CONFIG_USER_ONLY */
 void xtensa_cpu_dump_state(CPUState *cpu, FILE *f, int flags);
 hwaddr xtensa_cpu_get_phys_page_debug(CPUState *cpu, vaddr addr);
 void xtensa_count_regs(const XtensaConfig *config,
-- 
2.31.1

