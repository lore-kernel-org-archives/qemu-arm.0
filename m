Received: by 2002:a19:5205:0:0:0:0:0 with SMTP id m5csp419755lfb;
        Thu, 2 Sep 2021 09:17:16 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyEVObJpRF7Cql1kYuS/QfrSG18lESq+EX4mljAWLinKDqE9cB0DwZn3OAQE0gyGfpHnWT9
X-Received: by 2002:a17:906:64a:: with SMTP id t10mr4651296ejb.5.1630599436361;
        Thu, 02 Sep 2021 09:17:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1630599436; cv=none;
        d=google.com; s=arc-20160816;
        b=eoP5MtUkgkVdEVjk8+U/Q02tTZGkGnOllLzjZ8YXc//8bnHT6V7X8af9CxYztHQx3G
         vIMB5b+rcjbMZbVJ+/4QiGnR7EqpjMF8vzn2bjxEhtFgK5MxRvIIKftZgpcARVjChc7C
         dBiKb8d+qSVmdPOorIUxXgh7cwFVQRb8t6CTqjn7PzjF6ORSyiquIPqudNvCZZMPOFE2
         TzvDbg4KuADfKtLGpKCJ/UOb3g4vrDHmd7VxElngTdauDDj+ggeFLU9mqt6E5pjOh78n
         be5W411gtuOTzr77bnNRGkkm9CybIlc+hQcpcecUkJuX2snkVk8ELxHbJEhPtjaSnBSG
         3LDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-id:precedence:content-transfer-encoding:mime-version
         :references:in-reply-to:message-id:date:subject:cc:to:from:sender
         :dkim-signature;
        bh=Pk3U565FofhMNBdH085OA9aU3aTnCsU54QbFBxwfMI8=;
        b=lYnXgFZ5xt61yRkGhaJ7ub/k/v/NjiS8T1NWm2ezbbYVE0T6M5E7DIkoIgL6Lh34uz
         JKTf59H5ERJbAEycPd+4/lgexx4WzRYXJ24bz8zLSJhZV6EKApMTvnzLz3MKc8g+RWDH
         cwTBLF9/cJUT5bmCneQK5D9ZvY1/5yqfoiEGtkHNE9lGa6nFmDiS4glkepVPYGZyHCWg
         VxFDhY3cxjD/N8y5Zle8qAG8gMAE5AXxpYiFbHkdEBJKIQ0HlPTG1Lb1E4QV5TtPB4fR
         iWDfp2vrEioLJ9fzqQS5VmBZwrlOVAvB5piweFXmrT+mcIgntvFQFnrDq3zJw3SBKPDz
         p5Dg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20210112 header.b=NaB65rpK;
       spf=pass (google.com: domain of kvm-owner@vger.kernel.org designates 23.128.96.18 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org
Return-Path: <kvm-owner@vger.kernel.org>
Received: from vger.kernel.org (vger.kernel.org. [23.128.96.18])
        by mx.google.com with ESMTP id 8si2243468ejl.416.2021.09.02.09.17.16;
        Thu, 02 Sep 2021 09:17:16 -0700 (PDT)
Received-SPF: pass (google.com: domain of kvm-owner@vger.kernel.org designates 23.128.96.18 as permitted sender) client-ip=23.128.96.18;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20210112 header.b=NaB65rpK;
       spf=pass (google.com: domain of kvm-owner@vger.kernel.org designates 23.128.96.18 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346279AbhIBQSN (ORCPT <rfc822;naresh.kamboju@linaro.org>
        + 5 others); Thu, 2 Sep 2021 12:18:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45070 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1346281AbhIBQSI (ORCPT <rfc822;kvm@vger.kernel.org>);
        Thu, 2 Sep 2021 12:18:08 -0400
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com [IPv6:2a00:1450:4864:20::42e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 28883C061575
        for <kvm@vger.kernel.org>; Thu,  2 Sep 2021 09:17:07 -0700 (PDT)
Received: by mail-wr1-x42e.google.com with SMTP id t15so3838468wrg.7
        for <kvm@vger.kernel.org>; Thu, 02 Sep 2021 09:17:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Pk3U565FofhMNBdH085OA9aU3aTnCsU54QbFBxwfMI8=;
        b=NaB65rpK4UK7+XbBO28oZxFusXeQWuGTndzQkKqs4x497OOBypBPU5uctaWGbkSibX
         gbzbf0uKBllL7IMK9jeerTaWXdNmmwfHar32fZ/NCC0Cj626RXCkU3d8hlfsPo25otel
         OL/nvXSML0UuV9hTKCtQARxXaxraFStiKn4xGZp+OALpmFXy+6sqXkWFwBJFR6EcXMpL
         +gEhWt3eW2TEXJjoPvyiNmFQPJOj0yOdhR7ZZu+zEVqND+25gS72HJlWm9AWHklxn9DD
         TkIjI2aJpOFpKyf44h+zUsWbE/UTizlwAkVSUgam/bJtjGLksKc8rvZbllkWj5mw988x
         UXUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:content-transfer-encoding;
        bh=Pk3U565FofhMNBdH085OA9aU3aTnCsU54QbFBxwfMI8=;
        b=W/DT1wprGLo79uBhTx7V0+hqg0FYdoSEAo9x9BHukcfOE76+6/LwRFSKJ3GEDv/hKG
         jcuiumMWp5LIJ9fo1jXPvY4Xp1wc6hmK+tYqK+mJ4kDSy1CZWH4SxvwuvuYvpg4CdK2R
         vGtZwh5YsZO8YMIrsYL0taNhDUW08FZOXJEvDFhFdP+Q+LThdQehyQ9lSFCQ2/lxGQnI
         YiYCnqIze35Q8IZynp1NZrMv/JrmuxIgprLnIY13Kzl3dfwWIHs/jCGusuk9nSsBkZM4
         Tued94H3ET5wMGlm/2rkX5WmAAckM161HkTMvKB/BBjMk8Lsw8/wS411h6Z77iX/he7x
         6MuA==
X-Gm-Message-State: AOAM5339mKPNYMgXhm3UpnJmX582FvJrKsREGZWhOMsB8Y3QswkGLzP3
        tdY99BBfdQL2lLE1BF6eh6o=
X-Received: by 2002:adf:f991:: with SMTP id f17mr4751225wrr.56.1630599425756;
        Thu, 02 Sep 2021 09:17:05 -0700 (PDT)
Received: from x1w.. (163.red-83-52-55.dynamicip.rima-tde.net. [83.52.55.163])
        by smtp.gmail.com with ESMTPSA id y4sm2068566wmi.22.2021.09.02.09.17.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Sep 2021 09:17:05 -0700 (PDT)
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
Subject: [PATCH v3 13/30] target/hppa: Restrict has_work() handler to sysemu and TCG
Date:   Thu,  2 Sep 2021 18:15:26 +0200
Message-Id: <20210902161543.417092-14-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210902161543.417092-1-f4bug@amsat.org>
References: <20210902161543.417092-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <kvm.vger.kernel.org>
X-Mailing-List: kvm@vger.kernel.org
X-TUID: 6pKYl1K19NGJ

Restrict has_work() to TCG sysemu.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/hppa/cpu.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/target/hppa/cpu.c b/target/hppa/cpu.c
index e8edd189bfc..cf1f656218f 100644
--- a/target/hppa/cpu.c
+++ b/target/hppa/cpu.c
@@ -60,10 +60,12 @@ static void hppa_cpu_synchronize_from_tb(CPUState *cs,
     cpu->env.psw_n = (tb->flags & PSW_N) != 0;
 }
 
+#if defined(CONFIG_TCG) && !defined(CONFIG_USER_ONLY)
 static bool hppa_cpu_has_work(CPUState *cs)
 {
     return cs->interrupt_request & CPU_INTERRUPT_HARD;
 }
+#endif /* CONFIG_TCG && !CONFIG_USER_ONLY */
 
 static void hppa_cpu_disas_set_info(CPUState *cs, disassemble_info *info)
 {
@@ -147,6 +149,7 @@ static const struct TCGCPUOps hppa_tcg_ops = {
     .tlb_fill = hppa_cpu_tlb_fill,
 
 #ifndef CONFIG_USER_ONLY
+    .has_work = hppa_cpu_has_work,
     .cpu_exec_interrupt = hppa_cpu_exec_interrupt,
     .do_interrupt = hppa_cpu_do_interrupt,
     .do_unaligned_access = hppa_cpu_do_unaligned_access,
@@ -163,7 +166,6 @@ static void hppa_cpu_class_init(ObjectClass *oc, void *data)
                                     &acc->parent_realize);
 
     cc->class_by_name = hppa_cpu_class_by_name;
-    cc->has_work = hppa_cpu_has_work;
     cc->dump_state = hppa_cpu_dump_state;
     cc->set_pc = hppa_cpu_set_pc;
     cc->gdb_read_register = hppa_cpu_gdb_read_register;
-- 
2.31.1
