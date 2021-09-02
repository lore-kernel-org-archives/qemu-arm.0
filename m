Received: by 2002:a19:5205:0:0:0:0:0 with SMTP id m5csp419291lfb;
        Thu, 2 Sep 2021 09:16:47 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwQ6SR4PijF4htaCE3Z9qoNua4xfDOZpD/rzHEoR+U9felHsYDrJ4qL7zYKpSQ3FQ13+D8T
X-Received: by 2002:a17:907:4ce:: with SMTP id vz14mr4670619ejb.552.1630599407558;
        Thu, 02 Sep 2021 09:16:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1630599407; cv=none;
        d=google.com; s=arc-20160816;
        b=wkqm13l6vTbunHIs6s2EhoyJpQtJrYLZ1bw+b0z3u8ODD8nU90lQMlCXsMj4nX46n5
         ni6DoaCpv5R4GO7W4EgyX3kS10Wrs8MLlGZiVNk7RlrcawnIAh/sIlIeKQvZKK5dQF+I
         gMSffCfR+uUqiYGxZaF3DubL0E2kxAAlmPIb4J8POGKEb3nxuGcGbkGa/boIp2oS33TO
         EenZgiARA4wsxK71lfkYMuKixr8puNFGEeivh3aKtAiQ2LOelHHYU080lN5+0hsVVEHH
         YpXPg3S3Jhs9nUiMgg/3GZYQ/wo77/d4r5jqxBz1QFqB67Cb3CTJHByEw/7LSyUVu1P1
         WCWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-id:precedence:content-transfer-encoding:mime-version
         :references:in-reply-to:message-id:date:subject:cc:to:from:sender
         :dkim-signature;
        bh=eXa1glKBQAZuhiqfHx9McrLJH+6vsqw3g1Zly0CLLW4=;
        b=WE6rOY/9iE/4J/exoCz9ly7L/wQBN5H855+gHbcDzjGEsGKrLX0rlkjRytP3NjGU9G
         8knr+QNtyh1Q2/mJebXoEse75+LJmW9EXcs0y+45TkiKqGhYxFLWEcQo5TVDnxpkwtNe
         NhdwZlAYIA60YhMXXYv/m3XU91aosa3HeVx+tegCDY2tJbexFbq9aes9J1JZEMBq9ime
         mej/07hZ06JBZEpy86vLkNIdB9BTOLFZY0eFG9Bee0/DFzbH/DKD2E7Dm2a3bxvcEcip
         74ElvfCbP19AjTJ0vvI2FRaHOUMeEkH4hNjRwHgaHvm7gs49qVXVsFdHnnszsuRWPL+T
         jR7Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20210112 header.b=ae0rJedt;
       spf=pass (google.com: domain of kvm-owner@vger.kernel.org designates 23.128.96.18 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org
Return-Path: <kvm-owner@vger.kernel.org>
Received: from vger.kernel.org (vger.kernel.org. [23.128.96.18])
        by mx.google.com with ESMTP id 8si2243468ejl.416.2021.09.02.09.16.47;
        Thu, 02 Sep 2021 09:16:47 -0700 (PDT)
Received-SPF: pass (google.com: domain of kvm-owner@vger.kernel.org designates 23.128.96.18 as permitted sender) client-ip=23.128.96.18;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20210112 header.b=ae0rJedt;
       spf=pass (google.com: domain of kvm-owner@vger.kernel.org designates 23.128.96.18 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346204AbhIBQRn (ORCPT <rfc822;naresh.kamboju@linaro.org>
        + 5 others); Thu, 2 Sep 2021 12:17:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44920 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1346286AbhIBQRf (ORCPT <rfc822;kvm@vger.kernel.org>);
        Thu, 2 Sep 2021 12:17:35 -0400
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com [IPv6:2a00:1450:4864:20::42e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4F1EBC061764
        for <kvm@vger.kernel.org>; Thu,  2 Sep 2021 09:16:36 -0700 (PDT)
Received: by mail-wr1-x42e.google.com with SMTP id q11so3824574wrr.9
        for <kvm@vger.kernel.org>; Thu, 02 Sep 2021 09:16:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=eXa1glKBQAZuhiqfHx9McrLJH+6vsqw3g1Zly0CLLW4=;
        b=ae0rJedtnyFXXpMPGaAYczb7D2gf5sAIBD78JSrM21inhCc6oobXicz8ZrAZbwKo+u
         LWgigyv/HdAEIiac6GDnYpFFEaYaskd9kEYeEtmG6nZ6xqWdpNpJ01xQm8qn97nDsycD
         JxK3rpivyOqG1ZF86VDCnWe7LDsUSWz4wzcJ/hvTp90Ehm2lEwn32lLuy6xZI/8yyuGo
         D3grkzcyRTx5k7pQjKg/3FGCaby6/Z3ejv2o7bs/xAAYUcfve3y2UqEM+TGGHH5UOrhG
         CAAu0Bd2wdhdwYLKumOwKFsEqKQ4OFbQ7TMnB4Cn4EM6ysG1/AHT1p0+QcU+g0Nj2W20
         hOjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:content-transfer-encoding;
        bh=eXa1glKBQAZuhiqfHx9McrLJH+6vsqw3g1Zly0CLLW4=;
        b=ECf5Dsa6YhLoHu3x+Gp0iORO5Br7BafpI444RblY4mCO6EeHAVsFrjHae60/gC3EgE
         dEaU4Zd+zizGrZf47lYZZeNV1PzYm+AnAB6gBJ9lazZfWTYNZ8rM7h06kWRtD39qiyHd
         Z/pTqifWmtUj/n2ZQxBYKQRXB+qgI9lS4K/yc4wawa+5MV3ZWid+gsDbT+NgB1fp9v7U
         s58TIXd425Da38orbYjaXtRGv84U7PD1EfN8vD/XSntYE+XF+FTog7dW7Mg+YJXl9Fy8
         x8ATSHcGHin7Cl7PoG3Kpt+RSBh/YHgOwyhfeb7W/PHYgHLoWow8AAOeJjehEswYFpGT
         /nYw==
X-Gm-Message-State: AOAM532TxSS9+hdn+ShjDg3gyh/EELcXoMAs/uOltB7AkUTQzWwbwCqP
        jdHvuNqfoDmn4ceREf08oMI=
X-Received: by 2002:a05:6000:10:: with SMTP id h16mr4754013wrx.24.1630599394935;
        Thu, 02 Sep 2021 09:16:34 -0700 (PDT)
Received: from x1w.. (163.red-83-52-55.dynamicip.rima-tde.net. [83.52.55.163])
        by smtp.gmail.com with ESMTPSA id d9sm2161496wrm.21.2021.09.02.09.16.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Sep 2021 09:16:34 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= 
        <philippe.mathieu.daude@gmail.com>
From:   =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To:     qemu-devel@nongnu.org
Cc:     Bin Meng <bin.meng@windriver.com>,
        Eduardo Habkost <ehabkost@redhat.com>,
        Greg Kurz <groug@kaod.org>, haxm-team@intel.com,
        Kamil Rytarowski <kamil@netbsd.org>, qemu-ppc@nongnu.org,
        Anthony Perard <anthony.perard@citrix.com>,
        Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
        Michael Rolnik <mrolnik@gmail.com>, qemu-riscv@nongnu.org,
        Paolo Bonzini <pbonzini@redhat.com>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Thomas Huth <thuth@redhat.com>,
        David Hildenbrand <david@redhat.com>,
        Chris Wulff <crwulff@gmail.com>,
        Laurent Vivier <lvivier@redhat.com>,
        Cameron Esfahani <dirty@apple.com>,
        Sunil Muthuswamy <sunilmut@microsoft.com>,
        Max Filippov <jcmvbkbc@gmail.com>,
        Taylor Simpson <tsimpson@quicinc.com>, qemu-s390x@nongnu.org,
        Richard Henderson <richard.henderson@linaro.org>,
        Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
        Yoshinori Sato <ysato@users.sourceforge.jp>,
        Artyom Tarasenko <atar4qemu@gmail.com>,
        Aurelien Jarno <aurelien@aurel32.net>,
        Paul Durrant <paul@xen.org>,
        Peter Maydell <peter.maydell@linaro.org>,
        David Gibson <david@gibson.dropbear.id.au>,
        Alistair Francis <alistair.francis@wdc.com>,
        "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
        Roman Bolshakov <r.bolshakov@yadro.com>,
        Laurent Vivier <laurent@vivier.eu>,
        Cornelia Huck <cohuck@redhat.com>, qemu-arm@nongnu.org,
        Wenchao Wang <wenchao.wang@intel.com>,
        =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
        xen-devel@lists.xenproject.org, Marek Vasut <marex@denx.de>,
        Stefano Stabellini <sstabellini@kernel.org>,
        Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
        Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
        Colin Xu <colin.xu@intel.com>,
        Claudio Fontana <cfontana@suse.de>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Stafford Horne <shorne@gmail.com>,
        Reinoud Zandijk <reinoud@netbsd.org>, kvm@vger.kernel.org
Subject: [PATCH v3 08/30] target/alpha: Restrict has_work() handler to sysemu and TCG
Date:   Thu,  2 Sep 2021 18:15:21 +0200
Message-Id: <20210902161543.417092-9-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210902161543.417092-1-f4bug@amsat.org>
References: <20210902161543.417092-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <kvm.vger.kernel.org>
X-Mailing-List: kvm@vger.kernel.org
X-TUID: P4XLXGkMIO/c

Restrict has_work() to TCG sysemu.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/alpha/cpu.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/target/alpha/cpu.c b/target/alpha/cpu.c
index 93e16a2ffb4..32cf5a2ea9f 100644
--- a/target/alpha/cpu.c
+++ b/target/alpha/cpu.c
@@ -33,6 +33,7 @@ static void alpha_cpu_set_pc(CPUState *cs, vaddr value)
     cpu->env.pc = value;
 }
 
+#if defined(CONFIG_TCG) && !defined(CONFIG_USER_ONLY)
 static bool alpha_cpu_has_work(CPUState *cs)
 {
     /* Here we are checking to see if the CPU should wake up from HALT.
@@ -47,6 +48,7 @@ static bool alpha_cpu_has_work(CPUState *cs)
                                     | CPU_INTERRUPT_SMP
                                     | CPU_INTERRUPT_MCHK);
 }
+#endif /* CONFIG_TCG && !CONFIG_USER_ONLY */
 
 static void alpha_cpu_disas_set_info(CPUState *cpu, disassemble_info *info)
 {
@@ -221,6 +223,7 @@ static const struct TCGCPUOps alpha_tcg_ops = {
     .tlb_fill = alpha_cpu_tlb_fill,
 
 #ifndef CONFIG_USER_ONLY
+    .has_work = alpha_cpu_has_work,
     .cpu_exec_interrupt = alpha_cpu_exec_interrupt,
     .do_interrupt = alpha_cpu_do_interrupt,
     .do_transaction_failed = alpha_cpu_do_transaction_failed,
@@ -238,7 +241,6 @@ static void alpha_cpu_class_init(ObjectClass *oc, void *data)
                                     &acc->parent_realize);
 
     cc->class_by_name = alpha_cpu_class_by_name;
-    cc->has_work = alpha_cpu_has_work;
     cc->dump_state = alpha_cpu_dump_state;
     cc->set_pc = alpha_cpu_set_pc;
     cc->gdb_read_register = alpha_cpu_gdb_read_register;
-- 
2.31.1
