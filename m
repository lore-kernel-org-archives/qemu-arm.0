Received: by 2002:a19:6d5:0:0:0:0:0 with SMTP id 204csp3945068lfg;
        Mon, 1 Mar 2021 13:56:47 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxoyTmvlGo6U1bB/djzzatwI53FlNARRcmKgghAGLLMOZtrKZjZB/yQ3UcZWdCRgySvrY3h
X-Received: by 2002:a02:4ec3:: with SMTP id r186mr18152269jaa.9.1614635806860;
        Mon, 01 Mar 2021 13:56:46 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1614635806; cv=none;
        d=google.com; s=arc-20160816;
        b=shy7MA4lxofvADr8MZ+BdwWSEn58TMwZ8noSn+fdSvCACzagTKYYOOi/QJH8MTl7mT
         3QcKgog7l0OaewJFsCt1Md0L8T1GLAICfFPgsXzQ32GXOlAwDeC11dB9JWN/dRCHRYAN
         q4nhdno+OeT+q++pie4YIrxeVs/qP7eEnsHFkyU9n7oT2ZfD5VZFdTnBpukdbiIZeXkF
         PcurCwZKVERqBO78RTeBOGD0cM6/xgN6ns4Hx1u6ca3oHX018z3wrj6OTEPo4oSM0FkJ
         BUhLVCcGfc5otoEOONczxdP6r5zKuoJzh/sMacJnQiOm5UdjvhAVFzz3a0U2mkk4wzba
         3V7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=2UJf+T8AbVyetglv75P3vpefSV1VtMBl6vQz8AR9Gio=;
        b=Tj9o8YsjAnfcskIf9Pk/Qh9Pxio707CV9+AIPG8Xtp2oXyT8fHr4bczwsM89uWEMPw
         0wBDkpZN8/+f/5v4SPxIjk3l7Q7wo+fYSmTZZqPZflycfYU7bzaTr7V4fsPK5fUfy4C8
         VDvwQUpNJ7NAwlJmcBrv7Bs79gXjmhiPvHtfREQkrNqRi/24TqOX3p+X63GJy0vf2HLj
         hkB0lYXUfqz0J9MICsBlh8X5kOcEqVRqzQqFBwd6RvL79NewxU04QY9n9BkxiCXdeCZR
         RjbTl6MDz33NSiKrN160Gc/Y9KNwk3E/kjBwgkQI/Pa1K3z5NhAS0d0Y/J1UjFZZYuFZ
         lGzQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b="VIKBgU/g";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id n26si5205597jam.115.2021.03.01.13.56.46
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 01 Mar 2021 13:56:46 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b="VIKBgU/g";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Received: from localhost ([::1]:51584 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lGqX0-0008Jm-4O
	for alex.bennee@linaro.org; Mon, 01 Mar 2021 16:56:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48818)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lGqTa-0003a4-QK; Mon, 01 Mar 2021 16:53:16 -0500
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f]:42047)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lGqTX-0005Y7-QI; Mon, 01 Mar 2021 16:53:13 -0500
Received: by mail-ej1-x62f.google.com with SMTP id c10so4662211ejx.9;
 Mon, 01 Mar 2021 13:53:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=2UJf+T8AbVyetglv75P3vpefSV1VtMBl6vQz8AR9Gio=;
 b=VIKBgU/gyiwZQIXF+4oN1XV+qoCXokFs0BTNfZCgPyeaCqiOb98y42gdMYpO69R7dg
 vVD5OuM3bBsA6H/RuX/so3FAMOcEngSxR0oEttdPB51Z7CNyrSe5ZtxuFMOp+i8Lr7mN
 UyAKIv/RQGnjVFqUBdORrZcyNN9TZcvAPDIscxLIQG/nsP/InlFlxrlecDLdhSg4hxes
 BbcKJCDdiQWwJRXUjQZzRMtXT/kUqI+jdhU1jsGxVT9IQT+UfMwNxp5i5t0WVnrPoI7P
 h1EKwLtOa0Uu5qA1FdEh0nTg0gi6F5WSoE+pc0wJKU4sHYSRfVLNYzhEBEepiiAVrP2w
 yJiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=2UJf+T8AbVyetglv75P3vpefSV1VtMBl6vQz8AR9Gio=;
 b=b/1mqHVTqBDe6R019Aj3P4QPbq7zb1UKt3z62fxWG+RDAua/4xZ5nkHBLOg8qe0you
 sJeGeCSekwAJ9pl9timvQYhVuSQ/29an29svlFOCIkHdCT3nVXspjmoq9pAWzL2ixvzq
 EdLDUaX6xc1UwYDPJIC4isOSiRjafS/dub50dL198tQgab1rV05fcLfl+R9na3qMolOA
 FUxqmjIitgIrSJnZMivrl7XC5mToOPfOhBqnlGdK0Ap8nGekIMNZP55onIiuMt22xsWt
 3XKxkKF0/SXMeLnhu/nDDzFJGhOKZ7eUpjy+hrXWAOAMt/PfI1uC14XnNEvl6fRApcO2
 kbDQ==
X-Gm-Message-State: AOAM532iBhyJasKcrlwlcshudqnc4HX0XgAd/IwKfDqaSidMPFVGCOZp
 cxaeTyabQylYUBlrpV2QAADSzDbbcvQ=
X-Received: by 2002:a17:906:3685:: with SMTP id
 a5mr18429521ejc.352.1614635588750; 
 Mon, 01 Mar 2021 13:53:08 -0800 (PST)
Received: from x1w.redhat.com (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id n2sm15596599ejl.1.2021.03.01.13.53.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Mar 2021 13:53:08 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 16/17] cpu: Restrict cpu_paging_enabled /
 cpu_get_memory_mapping to sysemu
Date: Mon,  1 Mar 2021 22:51:09 +0100
Message-Id: <20210301215110.772346-17-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210301215110.772346-1-f4bug@amsat.org>
References: <20210301215110.772346-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62f;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ej1-x62f.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Sarah Harris <S.E.Harris@kent.ac.uk>, Chris Wulff <crwulff@gmail.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 David Hildenbrand <david@redhat.com>, Anthony Green <green@moxielogic.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Max Filippov <jcmvbkbc@gmail.com>, Alistair Francis <Alistair.Francis@wdc.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Guan Xuetao <gxt@mprc.pku.edu.cn>, Marek Vasut <marex@denx.de>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 "Michael S. Tsirkin" <mst@redhat.com>, Claudio Fontana <cfontana@suse.de>,
 qemu-ppc@nongnu.org, Artyom Tarasenko <atar4qemu@gmail.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, Greg Kurz <groug@kaod.org>,
 qemu-s390x@nongnu.org, qemu-arm@nongnu.org, Michael Rolnik <mrolnik@gmail.com>,
 Stafford Horne <shorne@gmail.com>, David Gibson <david@gibson.dropbear.id.au>,
 qemu-riscv@nongnu.org, Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Cornelia Huck <cohuck@redhat.com>, Laurent Vivier <laurent@vivier.eu>,
 Michael Walle <michael@walle.cc>, Palmer Dabbelt <palmer@dabbelt.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Ro2wk7fse9ZG

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 include/hw/core/cpu.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/include/hw/core/cpu.h b/include/hw/core/cpu.h
index 960846d2b64..d99d3c830dc 100644
--- a/include/hw/core/cpu.h
+++ b/include/hw/core/cpu.h
@@ -427,6 +427,8 @@ static inline void cpu_tb_jmp_cache_clear(CPUState *cpu)
 extern bool mttcg_enabled;
 #define qemu_tcg_mttcg_enabled() (mttcg_enabled)
 
+#if !defined(CONFIG_USER_ONLY)
+
 /**
  * cpu_paging_enabled:
  * @cpu: The CPU whose state is to be inspected.
@@ -444,8 +446,6 @@ bool cpu_paging_enabled(const CPUState *cpu);
 void cpu_get_memory_mapping(CPUState *cpu, MemoryMappingList *list,
                             Error **errp);
 
-#if !defined(CONFIG_USER_ONLY)
-
 /**
  * cpu_write_elf64_note:
  * @f: pointer to a function that writes memory to a file
-- 
2.26.2

