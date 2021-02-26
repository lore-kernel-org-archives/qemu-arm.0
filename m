Received: by 2002:a19:6d5:0:0:0:0:0 with SMTP id 204csp1435533lfg;
        Fri, 26 Feb 2021 08:44:11 -0800 (PST)
X-Google-Smtp-Source: ABdhPJz5g3/gGrKbqPJZ6xsfVKfev2r4ajy34Nx1FlB0QC4HcWuaffKDlBCNI2zmiHi/LgZHbGNZ
X-Received: by 2002:a05:6602:2348:: with SMTP id r8mr3496959iot.77.1614357851025;
        Fri, 26 Feb 2021 08:44:11 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1614357851; cv=none;
        d=google.com; s=arc-20160816;
        b=Xh1m3gLv0Dwtzj8UUNUuBorFc7212ekoCvX1KvtzhHRZOKbwJ1jCaD53d5t+COIYyO
         aL2P6eej8Od1ocuFcacEReplWOoCgardKOHClw3OCuhkOoNJ46xZnWnDF4mI0t2pJMGY
         2v3x3/ytQE6KEigGgnLe+eg2GSSfTRugmAHiPC38Oasr7xoK262YIyX8qEmXEj8shxF7
         oLSB/m+/JLeXnQ4fh24EOGXSV8mnI05VboLn5IPr4ssJhZQt/LHEbKlKzSh88Tu9Eohe
         F5MuYFC7LooF1RFXjxx1s/S3FndIMmF7XJvs+zkcCWobHCKiG4cs5e9Hrvp5rr7pGhEO
         I08Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=cqYmlwAyP4EwEP7vrTu/PZK1/0mxFb/0cmm6txRTavI=;
        b=eh8YxaJ3YyeX2XT9yyYxVMokczv7jYBDdvVT7v2KZxgUaP631sr/5FBgkAg9q50NfC
         us04kVZxahG6SJblV4+zHF40S875wrmK9X5M9ElBpfrR0yu9BXBai7BAP+Jnz3AdyA1h
         YbalAYTJCgYHI84j18+ctBB7+i6CANmjijGNa/BCRjavJBx5n7guUzLHYGsy9aklWJPS
         cNgglEQvMmn4lpRvBohSrLvATpDHojzEIH/oTdXT2g51jT5tVKSP9reUxozsrulHjCh2
         3117Td5xNHZdwF3JDJz3XWrzN7MYYHcX3ms5ahPph3GkwQnQtbwqmkN4ShAo0Fwg/wj1
         /S+Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b="Q/GVwYuN";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a19si4307743jat.69.2021.02.26.08.44.10
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 26 Feb 2021 08:44:11 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b="Q/GVwYuN";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Received: from localhost ([::1]:58832 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lFgDq-00051d-9h
	for alex.bennee@linaro.org; Fri, 26 Feb 2021 11:44:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53722)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lFg3X-0004pp-9H; Fri, 26 Feb 2021 11:33:31 -0500
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435]:42056)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lFg3P-0007i0-Pi; Fri, 26 Feb 2021 11:33:30 -0500
Received: by mail-wr1-x435.google.com with SMTP id r3so9145468wro.9;
 Fri, 26 Feb 2021 08:33:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=cqYmlwAyP4EwEP7vrTu/PZK1/0mxFb/0cmm6txRTavI=;
 b=Q/GVwYuNkGxJ/Q9ke2SuYtBSrUx9A0eBdyi9iyh/L1/r8tBvCHUEzBfvy/KNeNNiSn
 Cr9TNGEdwYFcSYMMdCyOeY1i/Ba4c8agsZ1NOCvMqIbZU4KXJ2kcFOqOJpuAsO31fGSc
 h0OJ0ZsXfoXThyE0Sa14wpmw+MsUuHlaWW5dGVBOSDCOaZHZigJnejCy28de26GfIfDu
 Zhcl+lJwEuDk4cM2C5NLpB+DAjfuBIMhXccHgVE/27sLDUUqxlUkIs8RvpNvdacpnubd
 rB9gusji7bHn0Ai3bFKvCZlU4J/GUpdCOtvKWGy9nA32xrkBfuQJAnM0Y4+CEOMDDs37
 4jIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=cqYmlwAyP4EwEP7vrTu/PZK1/0mxFb/0cmm6txRTavI=;
 b=WnExRvIl2DSsdTCYEiwNapSqbE7Df0TN+ZBbh0Uk1YU08//bKGNY4Br+gmiAVv9v1n
 yAX/VG5b9XEnOLcnRXuIKVowRYGwVYkEUW9tk2KVqLdiyT+qS1gciI5Q3UtLu9WD1eyJ
 rWu20Y72XN4G9jkwjCsICradMUjtPOdulow6sqyL2H6O0kkb9MB+5YWe7NYQFIiUwhXp
 Uq9s9fN2NqZwk/6yTyC0YQAZpJz5VG0mQPJyEksmzpGw35Jr/aCcafzK7i/QIf/JElSA
 Xj0PqKbW6ShdEILdtq+gUMFpVq9xxM5ozM+lkOSEt+KzKlViW0SQlGffd3UbrdpJOg7B
 pbeg==
X-Gm-Message-State: AOAM532oRI5dDTO4z54VwkcEMNWSvHLM/PX/+SVdyO2D380ANLKrqww4
 m1ET3ZBzpZuORH0iwVxVeUxDZPMraPM=
X-Received: by 2002:adf:f1c4:: with SMTP id z4mr4226490wro.404.1614357192932; 
 Fri, 26 Feb 2021 08:33:12 -0800 (PST)
Received: from x1w.redhat.com (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id 6sm14814560wra.63.2021.02.26.08.33.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Feb 2021 08:33:12 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 07/16] cpu: Introduce CPUSystemOperations structure
Date: Fri, 26 Feb 2021 17:32:18 +0100
Message-Id: <20210226163227.4097950-8-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210226163227.4097950-1-f4bug@amsat.org>
References: <20210226163227.4097950-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x435.google.com
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
X-TUID: Dn1YbC1e5eAd

Introduce a structure to hold handler specific to sysemu.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 include/hw/core/cpu.h | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/include/hw/core/cpu.h b/include/hw/core/cpu.h
index b12028c3c03..ab89235cb45 100644
--- a/include/hw/core/cpu.h
+++ b/include/hw/core/cpu.h
@@ -80,6 +80,12 @@ struct TCGCPUOps;
 /* see accel-cpu.h */
 struct AccelCPUClass;
 
+/*
+ * struct CPUSystemOperations: System operations specific to a CPU class
+ */
+typedef struct CPUSystemOperations {
+} CPUSystemOperations;
+
 /**
  * CPUClass:
  * @class_by_name: Callback to map -cpu command line model name to an
@@ -190,6 +196,9 @@ struct CPUClass {
     bool gdb_stop_before_watchpoint;
     struct AccelCPUClass *accel_cpu;
 
+    /* when system emulation is not available, this pointer is NULL */
+    struct CPUSystemOperations system_ops;
+
     /* when TCG is not available, this pointer is NULL */
     struct TCGCPUOps *tcg_ops;
 };
-- 
2.26.2

