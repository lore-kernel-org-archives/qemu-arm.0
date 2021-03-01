Received: by 2002:a19:6d5:0:0:0:0:0 with SMTP id 204csp3942492lfg;
        Mon, 1 Mar 2021 13:52:10 -0800 (PST)
X-Google-Smtp-Source: ABdhPJySO6qRYEg2wgQO1oPYY1uBJteQdp+zwatZY+N/05HRcSFSo5bb63SdSB0uEez5jNTV/NRN
X-Received: by 2002:a05:6602:cc:: with SMTP id z12mr14917982ioe.190.1614635530122;
        Mon, 01 Mar 2021 13:52:10 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1614635530; cv=none;
        d=google.com; s=arc-20160816;
        b=m3geSTecUXjY82lypNWWG08BQzoOOYU7uFslWQxgnGJppzPpC7xBNbt3qZSoNvsKLV
         mjOBBt7kbxIzjjRTt88O01jvGzWBca0Vti7gr5DCpBjrMnQDJjeMJuk8Qf3PP+aqXjbP
         lpCbueY9CAp1z3OpB1WrbGj2/EPvr3B9gk5DqTTrHj1SdzQAQ/vPO7PumRbH7O4Y3Okg
         y/GthhLnbxZ0/UQ88UtoHjAx+AvFo3yq/a1/RaJ6GuKgtsmr5ysIMxekzOCJYI9fbZQ4
         sj/XoS9DTC/ed8ge0a/mJ6hC5z+fW4DDHPqCaaLCmvtmMXeXm4mJ99cr7WyEfxpiCpTs
         R1tQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=yI5v3ChjpgUoMVznW3/vQVCaXLpm+f+cFTMRG3SQklk=;
        b=fmIs5k1c4xAf4BuJ7jxU0o8+DOx3ftxJnv9FCWu1F3SSnYRqvp5vb7k4KfR4yMR6Eo
         /OL1GWA2x1ajmxqresLQueSFEjVzRDjpna7VcH4Op6QWRZk2c6A4JT4lwOY5Is5eXfxT
         BtU9TFeAodrLK7e3gzWdCuXUS93sNoFJ5a14WHEu/qnBc812uFSEd8Urhdw4PI4rw3Um
         3LSa7ImxABiT7yutIucsZ2MZHd5/DsS00K69SevKZpCYNmDLKULTmumcotaJybUrg3vf
         n5H+pQ7udwnH06ocPiHEA/wAi1xPcbsnBBKRqCQnwXq4CS6V1Wi6NHon6EyVtJ6RqNGJ
         Vx7Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b="mJ/K/lwX";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w11si5530646jar.79.2021.03.01.13.52.09
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 01 Mar 2021 13:52:10 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b="mJ/K/lwX";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Received: from localhost ([::1]:36128 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lGqSX-0001ao-DM
	for alex.bennee@linaro.org; Mon, 01 Mar 2021 16:52:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48218)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lGqSI-0001LE-6D; Mon, 01 Mar 2021 16:51:54 -0500
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630]:42034)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lGqSG-00050a-Ke; Mon, 01 Mar 2021 16:51:53 -0500
Received: by mail-ej1-x630.google.com with SMTP id c10so4656609ejx.9;
 Mon, 01 Mar 2021 13:51:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=yI5v3ChjpgUoMVznW3/vQVCaXLpm+f+cFTMRG3SQklk=;
 b=mJ/K/lwXOVWoit73y1TYSSHLaOMllfDz24/alFPlQU1Fv3CZQn+qrprvLdxaNmhbCm
 dSB0Tz3d5h78JZ2znwY7NsHURe3BQ9mYMwnrlI4RSBOX7lYa9WchKNRQoBnrWCmzRtYX
 P3fe6I732CdelMEsxp+coxJBugkqOkGmknj0h7iJGrfjdKJtqpLBCa6zEb86yLqDcBN6
 aB88VKvPKgVxswFWPqTRwB0ho1O/b7rDZAb4FUwdttxG8DXe7RS5PcM4UxYixyINmWgN
 cgshLC40AvaqFM9PtuQgSY0PKAaW+glWBlzoNdLDJ8b+8EBzxijGfQWajaUtJqHm1TKn
 uk6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=yI5v3ChjpgUoMVznW3/vQVCaXLpm+f+cFTMRG3SQklk=;
 b=n1t4EseyGaJGOO4L/8hyLY5PkKqHebAbPSeK5XMabFOHMqRbk3kaY3aiC1Rx9bCws2
 R89bTbO5zddjLYXQO+IlCV9TbDbHiUxkX/aw/aMbTgoLmbT30Zl/GQkkJYk0BJre+oZV
 hAwTEzf3lhAdxS/yuEMfjtPlIhLHZtLXGd2NO5QfDtb386OVH20XVB7LiuIWf4OZrFJF
 KOcB90EsRvzmDIcHP+GSG3KIbvtyGjFioijyb3+wTuKDAV7jTEo6ihrYMMhnPx7Ui5YT
 yileQnZGNq2lWuweP5R44bsemIdNmyNhImSTioxlzcha+QJUh3lZYJxtL0zAKraHQjbi
 TvSw==
X-Gm-Message-State: AOAM5322OAmZIu34pMcokJ6kYE14gAHF1NdV9KiWj+Ao1fIeOcSjdv11
 SDPbww07qSvgQThb0BMs/zyqKmMZMKY=
X-Received: by 2002:a17:906:b001:: with SMTP id
 v1mr17826274ejy.217.1614635509703; 
 Mon, 01 Mar 2021 13:51:49 -0800 (PST)
Received: from x1w.redhat.com (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id g3sm15119250ejz.91.2021.03.01.13.51.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Mar 2021 13:51:49 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 05/17] cpu: Directly use get_paging_enabled() fallback
 handlers in place
Date: Mon,  1 Mar 2021 22:50:58 +0100
Message-Id: <20210301215110.772346-6-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210301215110.772346-1-f4bug@amsat.org>
References: <20210301215110.772346-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::630;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ej1-x630.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Sarah Harris <S.E.Harris@kent.ac.uk>, Chris Wulff <crwulff@gmail.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 David Hildenbrand <david@redhat.com>, Anthony Green <green@moxielogic.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Thomas Huth <thuth@redhat.com>, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Max Filippov <jcmvbkbc@gmail.com>, Alistair Francis <Alistair.Francis@wdc.com>,
 Guan Xuetao <gxt@mprc.pku.edu.cn>, Marek Vasut <marex@denx.de>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 "Michael S. Tsirkin" <mst@redhat.com>, Claudio Fontana <cfontana@suse.de>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, qemu-ppc@nongnu.org,
 Artyom Tarasenko <atar4qemu@gmail.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, Greg Kurz <groug@kaod.org>,
 qemu-s390x@nongnu.org, qemu-arm@nongnu.org, Michael Rolnik <mrolnik@gmail.com>,
 Stafford Horne <shorne@gmail.com>, David Gibson <david@gibson.dropbear.id.au>,
 qemu-riscv@nongnu.org, Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Cornelia Huck <cohuck@redhat.com>, Laurent Vivier <laurent@vivier.eu>,
 Michael Walle <michael@walle.cc>, Palmer Dabbelt <palmer@dabbelt.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 9oaMf/wmobi0

No code uses CPUClass::get_paging_enabled() outside of hw/core/cpu.c:

  $ git grep -F -- '->get_paging_enabled'
  hw/core/cpu.c:74:    return cc->get_paging_enabled(cpu);
  hw/core/cpu.c:438:    k->get_paging_enabled = cpu_common_get_paging_enabled;
  target/i386/cpu.c:7418:    cc->get_paging_enabled = x86_cpu_get_paging_enabled;

Check the handler presence in place and remove the common fallback code.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/core/cpu.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/hw/core/cpu.c b/hw/core/cpu.c
index a9ee2c74ec5..1de00bbb474 100644
--- a/hw/core/cpu.c
+++ b/hw/core/cpu.c
@@ -71,11 +71,10 @@ bool cpu_paging_enabled(const CPUState *cpu)
 {
     CPUClass *cc = CPU_GET_CLASS(cpu);
 
-    return cc->get_paging_enabled(cpu);
-}
+    if (cc->get_paging_enabled) {
+        return cc->get_paging_enabled(cpu);
+    }
 
-static bool cpu_common_get_paging_enabled(const CPUState *cpu)
-{
     return false;
 }
 
@@ -420,7 +419,6 @@ static void cpu_class_init(ObjectClass *klass, void *data)
     k->parse_features = cpu_common_parse_features;
     k->get_arch_id = cpu_common_get_arch_id;
     k->has_work = cpu_common_has_work;
-    k->get_paging_enabled = cpu_common_get_paging_enabled;
     k->get_memory_mapping = cpu_common_get_memory_mapping;
     k->gdb_read_register = cpu_common_gdb_read_register;
     k->gdb_write_register = cpu_common_gdb_write_register;
-- 
2.26.2

