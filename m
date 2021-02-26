Received: by 2002:a19:6d5:0:0:0:0:0 with SMTP id 204csp1449138lfg;
        Fri, 26 Feb 2021 09:02:13 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzBp/hIOljQ4PEG9tyfFVK2d7gtSW4gVQmIsYTDulKlzHRmwtRE8+ulatqR/Vp9b93Wkaau
X-Received: by 2002:a6b:7501:: with SMTP id l1mr3488149ioh.92.1614358933597;
        Fri, 26 Feb 2021 09:02:13 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1614358933; cv=none;
        d=google.com; s=arc-20160816;
        b=QZzRxoBzaCXXpF1yjRLqwZ0MbFYtLW7Db0nWpTvXZuPj6GgjXQ6urGJLxofUSF5sNX
         piCDyj+MibCSon6YsXN+7d0cRRH6ObGxnRa/1r9a5MkZ9/p+5hSkp4Q5R1Ae3tsNmxyV
         /xwmdTXDt8dFIcBO0hViuFW6JnpO6oklLuT8gQh4WQ/Hw+XfRqHpP8RZwK+0oJxhuAOz
         W3slq+WJCX+G2uzzqFGfvM3uqE92GyLVjoaP68w6n1vbazyFu1FdYCOZN0Bz9TYsj9d+
         JgjH6Ae+M/eXh/QzCHK0UV5vQvWio7H8wEnjsB5T4Yy0Jo1g89Bw4b1Dhe2KeAiPuses
         +Lkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=PprgWzaisAMGWPHww2n0qNOft5TZjwIRKtLOc4TMAEs=;
        b=06LbKYvGYZMiGisTLrpWNjt3Pr0b2Qm1VXEs+bWWRaaBSUVT53/cQvkQEl3N4wFNMi
         tZ2dlsRCHzGWNEeqUpmSXmjBBh5DB9n/MFPl3S4sEf9sO5cxBN6e639k387oSs/ga3QP
         8X2b1p8fSRZJZTXdbEBqeblSj0V7jq1CBhutcnJqdyCt4RBEAiXCxI0LsYzEuuLdoES4
         qjBQtAdSU/pra54+ZSyAfZ99IGjgpEBSQtc2EQx6BFBE2ogvl3WRTrJSp/I8cK19y+R7
         kN0F2mSpHymS+dJ5sB5qkllDU/XrhQQA/17IRvIvyJYcmxGoQDAg54F+9LJI6VFXxGWl
         Myog==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=fuKckJ4T;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l3si8038230ion.74.2021.02.26.09.02.13
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 26 Feb 2021 09:02:13 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=fuKckJ4T;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Received: from localhost ([::1]:42024 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lFgVI-0005lB-Sp
	for alex.bennee@linaro.org; Fri, 26 Feb 2021 12:02:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54104)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lFg4J-0005Ob-So; Fri, 26 Feb 2021 11:34:21 -0500
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330]:38051)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lFg4H-0007xn-TB; Fri, 26 Feb 2021 11:34:18 -0500
Received: by mail-wm1-x330.google.com with SMTP id n4so6906372wmq.3;
 Fri, 26 Feb 2021 08:34:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=PprgWzaisAMGWPHww2n0qNOft5TZjwIRKtLOc4TMAEs=;
 b=fuKckJ4TE33Pak2neWxSvjeCDGfEBe5OI4VvvYE7upnN7YW65eSvXkzDVPy792b2oR
 7+32toOnxKag5RUh5Rdj9YZLR6jRGo8a6CdImCDp0s0ptT7S1Ju4ZyqXzpDAogd9s3bd
 AalOQlpEThHlN8VIIrP2rDslZHFsUgVuFU+YOWJj3ZC6/q7HRWyhOl5q7IwfVdmpo2iy
 lsRktn4tPQts9R+p6lW9J+3Im+atzEtWPtsX/94kom6vuIL/b9UZ8jOViXq9SK0oqFMp
 wRYqMbfffGHItIkhFwUHzxlyrURua2CsWH+mWqr3M48B3xHf0DQj22heQJnWkmo76q0L
 y4Uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=PprgWzaisAMGWPHww2n0qNOft5TZjwIRKtLOc4TMAEs=;
 b=Ax51bVsOW0h89GAIS5GfTXtjt+erC/9mjQ7rqb0YgqhcPEXyKfVlYmZjZxLtlYOakW
 9Vh2OIu8dst7YzysYOtp/1C8eY22T6GXXZrFnYlxn/RBYBX5moPwoHOf/Chq4U2yUIpB
 pyhmYUL8IrK+4pzwScJm2er1QN8iG0e/ZVJQfNcYq1qmopV/ZYF7nAhh+IEiKpbzGaKi
 zxQ69urPjU68B+GU8DFggvvMtZNMlxy69r9muZO5PEWbyvReWNlEQiUykbArRcL2ZLdU
 ++t/o950yspZIAI+N3OCldoeSxBDl80iyndfdKFIwpKKA09dVKg7OuPVhu29hipoN/74
 2FOQ==
X-Gm-Message-State: AOAM533ea6/LvjLgvLZeak4t3DMI+RukOZrv58DTNYWcccIukYzC66f8
 vzYnxMoUNcBfqxOKsZruFaa6W2nDbvA=
X-Received: by 2002:a1c:c244:: with SMTP id s65mr3706705wmf.96.1614357253121; 
 Fri, 26 Feb 2021 08:34:13 -0800 (PST)
Received: from x1w.redhat.com (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id m6sm14245609wrv.73.2021.02.26.08.34.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Feb 2021 08:34:12 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 16/16] cpu: Restrict cpu_paging_enabled /
 cpu_get_memory_mapping to sysemu
Date: Fri, 26 Feb 2021 17:32:27 +0100
Message-Id: <20210226163227.4097950-17-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210226163227.4097950-1-f4bug@amsat.org>
References: <20210226163227.4097950-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x330.google.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Sarah Harris <S.E.Harris@kent.ac.uk>, Chris Wulff <crwulff@gmail.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 David Hildenbrand <david@redhat.com>, Anthony Green <green@moxielogic.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Thomas Huth <thuth@redhat.com>, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Laurent Vivier <laurent@vivier.eu>, Max Filippov <jcmvbkbc@gmail.com>,
 Alistair Francis <Alistair.Francis@wdc.com>, Guan Xuetao <gxt@mprc.pku.edu.cn>,
 Marek Vasut <marex@denx.de>, Yoshinori Sato <ysato@users.sourceforge.jp>,
 "Michael S. Tsirkin" <mst@redhat.com>, Claudio Fontana <cfontana@suse.de>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Artyom Tarasenko <atar4qemu@gmail.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, Greg Kurz <groug@kaod.org>,
 qemu-s390x@nongnu.org, qemu-arm@nongnu.org, Michael Rolnik <mrolnik@gmail.com>,
 Stafford Horne <shorne@gmail.com>, David Gibson <david@gibson.dropbear.id.au>,
 qemu-riscv@nongnu.org, Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Cornelia Huck <cohuck@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Michael Walle <michael@walle.cc>, qemu-ppc@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: x6i1QwNA0+Ll

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 include/hw/core/cpu.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/include/hw/core/cpu.h b/include/hw/core/cpu.h
index 47e65d517f6..29e1623f775 100644
--- a/include/hw/core/cpu.h
+++ b/include/hw/core/cpu.h
@@ -499,6 +499,8 @@ static inline void cpu_tb_jmp_cache_clear(CPUState *cpu)
 extern bool mttcg_enabled;
 #define qemu_tcg_mttcg_enabled() (mttcg_enabled)
 
+#if !defined(CONFIG_USER_ONLY)
+
 /**
  * cpu_paging_enabled:
  * @cpu: The CPU whose state is to be inspected.
@@ -516,8 +518,6 @@ bool cpu_paging_enabled(const CPUState *cpu);
 void cpu_get_memory_mapping(CPUState *cpu, MemoryMappingList *list,
                             Error **errp);
 
-#if !defined(CONFIG_USER_ONLY)
-
 /**
  * cpu_write_elf64_note:
  * @f: pointer to a function that writes memory to a file
-- 
2.26.2

