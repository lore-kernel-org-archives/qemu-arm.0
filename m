Received: by 2002:a19:6d5:0:0:0:0:0 with SMTP id 204csp1433976lfg;
        Fri, 26 Feb 2021 08:41:59 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzq26wV3sfY9RiLGzAaX2HbvHykScgIVzbNjqE5yPM8p+J+/2XOOhqAXfkaSsrjJt/6+eHi
X-Received: by 2002:a54:4697:: with SMTP id k23mr2675665oic.17.1614357719688;
        Fri, 26 Feb 2021 08:41:59 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1614357719; cv=none;
        d=google.com; s=arc-20160816;
        b=lyG5eTE4G5/xZGPnCj+5AuV8uRSr7+ouxousknBFCg4xGr089hksG8yom/e6fuECtx
         5nUSNcg47IcF3zHjmlzqaJuAV32PUK+hXd3Oq44+RD2g6Lzgo1mbu1VTQhr7Nkos7zG5
         SuaK7Ri9dj15pB9l3GkFe5Va+AZKDyV1hRWL4zZMVVqinIVc5gStIxmnADPuKilrQVeR
         oVst7J9//oN+asHWHAnx2Cg+LIXlEYt//wpw6a8jA5Hg8pfKOU5TpX5qLH2H+Lo0ye76
         VGoqu5CQ3kuV4HwqvfY8QG+4JuI4kbSjh4hHzZE87ABZn7c/obD1IAlAJMJyYAKrUe1+
         H01w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=yI5v3ChjpgUoMVznW3/vQVCaXLpm+f+cFTMRG3SQklk=;
        b=0iEES0RU4QO63Uot39KtWCYbGIAhwyEiYpUiYCc8X+mKrM7ll0WQ4C8EidvuPb7Vd5
         Lcssx8gYPHeKvmzaHUn4dFmtP/ZUk3bFhwphAuSZQMPfXfxv6Gi5vrFMk2uoHpXq9M3A
         D0MONiUyYV9IiIpArQw7A1spM4KOq4JXrCflyu8FcmGT9YoyXXiigwIJJm7zsr8Szz6w
         nSqgUoDS5CWCXc9u21fADyP7cG0yccWDbEyC3KJPlcU3Sj2PMZgo2jZ4i6B6Nq0LivDR
         yY3X41xOoVsqeyRr+vtKRlwlnYNHFVO59f5aVD5rBHO3vdIybtYBDRySw830TltzZMbk
         rohw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=BRX2O+8r;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o12si6217389oti.325.2021.02.26.08.41.59
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 26 Feb 2021 08:41:59 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=BRX2O+8r;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Received: from localhost ([::1]:55752 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lFgBi-0003Xz-TW
	for alex.bennee@linaro.org; Fri, 26 Feb 2021 11:41:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53524)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lFg37-0004XK-PM; Fri, 26 Feb 2021 11:33:05 -0500
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331]:55879)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lFg36-0007er-AL; Fri, 26 Feb 2021 11:33:05 -0500
Received: by mail-wm1-x331.google.com with SMTP id w7so7895423wmb.5;
 Fri, 26 Feb 2021 08:33:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=yI5v3ChjpgUoMVznW3/vQVCaXLpm+f+cFTMRG3SQklk=;
 b=BRX2O+8rPgMmAhoMuArR6BGQp9RPtIMCCDWft0DsYREYvSmofpcL+CWu+E2K4+ANba
 +i6L5uoXgpMwGS7GPuSGa4hku2StEpsEN8VWJL/8Og6ToJOkY7W3PFk9yJuSnDCSH4E0
 tq2cKQc3VI1yNDxWQCJriUXuc1hXwJrhqfz+L92ql4JTkOvatwZnvpNGIGNlhV2xETp7
 93eMcnE5X3/X0JmbORZETZCLIv+JRGLK9nVaeqAoFhmZqtMUdXj7t4h9NVIJuSN8+Ohd
 /Xuqu8hAHm2q914h2DjZvk/4ksJt7YvvCDCu9MMzebWMhWlxmC8Wbg5EZ5rLm2RZfJU1
 rbGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=yI5v3ChjpgUoMVznW3/vQVCaXLpm+f+cFTMRG3SQklk=;
 b=TsPjvc0OuKtVYq9J+WLmPHWqtcNTScUjZtgkg/aAZAPKVaUhktIzZorTiJkQCvmnq+
 DzzalSNlCO1/itox7DrZkzWCjgIUiNzFQ1lUyL5MfMeCN8lNG4SUNYT3/R2+LglvuTMM
 kjIg/gEhbBiUvkqGmbB7HQZlMbQKRYV67Hiq/JEq973yqqq7CTvqX2nUQGyqR3PRVpoo
 1ucqjv8DR3h9oFmwTCe2nVCQSwFMQjP9BjMqM8NvG0c3gXzWbaKoF5KdeZPukhi9YYqV
 BPl7+vlHihnQ9sPn/R1CfF9CyRdlcchcwlJ98c4aSRMLaz5IU0uvDTyTAfFbXxNDpGQm
 0CQw==
X-Gm-Message-State: AOAM533yR+esQSfu5gMdHVaijVSIuL2jCnI6uNrWKlaTggDVW398rLo0
 XCAsEojFWjyK3fQLSazIKQT2hA8wJAU=
X-Received: by 2002:a7b:c4d5:: with SMTP id g21mr3644774wmk.161.1614357181284; 
 Fri, 26 Feb 2021 08:33:01 -0800 (PST)
Received: from x1w.redhat.com (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id c128sm12749844wma.37.2021.02.26.08.32.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Feb 2021 08:33:00 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 05/16] cpu: Directly use get_paging_enabled() fallback
 handlers in place
Date: Fri, 26 Feb 2021 17:32:16 +0100
Message-Id: <20210226163227.4097950-6-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210226163227.4097950-1-f4bug@amsat.org>
References: <20210226163227.4097950-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x331.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
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
 Thomas Huth <thuth@redhat.com>, Laurent Vivier <laurent@vivier.eu>,
 Max Filippov <jcmvbkbc@gmail.com>, Alistair Francis <Alistair.Francis@wdc.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Guan Xuetao <gxt@mprc.pku.edu.cn>, Marek Vasut <marex@denx.de>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 "Michael S. Tsirkin" <mst@redhat.com>, Claudio Fontana <cfontana@suse.de>,
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
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 6BkjoHAhLaXk

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

