Received: by 2002:a19:ee0a:0:0:0:0:0 with SMTP id g10csp4709539lfb;
        Sun, 29 Nov 2020 19:07:40 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzqSIhhOIlROyafoLIG3kupBJ/8qrwTOiufn4QweuFDl6c/SGCVo/tC58jd71Gk8qVYCYAW
X-Received: by 2002:a25:1085:: with SMTP id 127mr24493010ybq.204.1606705660652;
        Sun, 29 Nov 2020 19:07:40 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1606705660; cv=none;
        d=google.com; s=arc-20160816;
        b=IHIsGdq1OB+X9hdrL60rttIhGKNBL5rGvsc7EfsQvJzsrUjJsFH4BtmGUWW/kbLEks
         CRbBRjfxmHZNZ+g/s+cq2gTOs51rhtrMifp53kKWDLJFQwleI3JO5EbQkXq96RZpz6Pb
         fFnEMzBBxvsvJ2d2mnPWdhSjbQ1at2P5VLfmadd63sW+OktBQx33m9x8ljnB3MjVPmSk
         H+TeasjV6cD9Aw6Fl1CfpyS5b9m3zmo6JRsYPKl4ya0fJDlmhnOu9zbd5koJYQQyz8eh
         ahkxSLXkr+9XA5ooXoRzrDRw8stTjtHjqWggyRPk4zUjpgdS/UQYz44s30PW4vQLkAaH
         YuBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from;
        bh=bxeHiRzjIQ1ZwqLNQdMtFxK7OyfDTO/z7sIP8NPs3ic=;
        b=L1Irt4zQkYiqHX3N5c3qyV0TI/HALyuXrlPYDj3akcAx56MooTSSbkNqL4spOLwenl
         3Avi0OFzGl46cncqn7WfDK88hws3rAhpUpAGJvTxLUsypBe+u9mjjvlafTCWY/D0U7dW
         I/gciVcwd4ktt4KSqNT7Ydl3RntCUbAle8xFvp3xhdg2FNe71VuF4Ab1W38h35JfRAZD
         cvxsApfbRRP1ZvJy73aJsRg2tGocyX8sc0vlz3FQt1GIGvcXuJyFr2ViONdytP54wCuX
         27LRFh+gJOh+U5RF0IW63uFdY8Mo34G9tnqP6qpaKRsuMPTZTzOAaBezQyvNXvP5saBS
         Y2Tg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x201si17301747ybg.345.2020.11.29.19.07.40
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 29 Nov 2020 19:07:40 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:60568 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kjZXQ-00084v-1i
	for alex.bennee@linaro.org; Sun, 29 Nov 2020 22:07:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40862)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <agraf@csgraf.de>)
 id 1kjZXF-00084Y-L4; Sun, 29 Nov 2020 22:07:29 -0500
Received: from mail.csgraf.de ([188.138.100.120]:35322
 helo=zulu616.server4you.de) by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <agraf@csgraf.de>)
 id 1kjZXD-00076j-Jq; Sun, 29 Nov 2020 22:07:29 -0500
Received: from localhost.localdomain
 (dynamic-077-009-091-089.77.9.pool.telefonica.de [77.9.91.89])
 by csgraf.de (Postfix) with ESMTPSA id 0BB3D3900400;
 Mon, 30 Nov 2020 04:07:26 +0100 (CET)
From: Alexander Graf <agraf@csgraf.de>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 3/8] hvf: Actually set SIG_IPI mask
Date: Mon, 30 Nov 2020 04:07:18 +0100
Message-Id: <20201130030723.78326-4-agraf@csgraf.de>
X-Mailer: git-send-email 2.24.3 (Apple Git-128)
In-Reply-To: <20201130030723.78326-1-agraf@csgraf.de>
References: <20201130030723.78326-1-agraf@csgraf.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=188.138.100.120; envelope-from=agraf@csgraf.de;
 helo=zulu616.server4you.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
 Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Cameron Esfahani <dirty@apple.com>, Roman Bolshakov <r.bolshakov@yadro.com>,
 qemu-arm@nongnu.org, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Frank Yang <lfy@google.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: +MkOxjH0NcQM

In the hvf init function, we prepare a signal mask for SIG_IPI, but
then fail to set it. This seems to work by chance on some systems,
where SIGUSR2 is already unmasked by default. It fails however on
ARM Big Sur.

So let's set the signal mask as intended.

Signed-off-by: Alexander Graf <agraf@csgraf.de>
---
 accel/hvf/hvf-cpus.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/accel/hvf/hvf-cpus.c b/accel/hvf/hvf-cpus.c
index 4d1cca9d6e..38559ab649 100644
--- a/accel/hvf/hvf-cpus.c
+++ b/accel/hvf/hvf-cpus.c
@@ -338,6 +338,7 @@ static int hvf_init_vcpu(CPUState *cpu)
 
     pthread_sigmask(SIG_BLOCK, NULL, &set);
     sigdelset(&set, SIG_IPI);
+    pthread_sigmask(SIG_SETMASK, &set, NULL);
 
     r = hv_vcpu_create((hv_vcpuid_t *)&cpu->hvf_fd, HV_VCPU_DEFAULT);
     cpu->vcpu_dirty = 1;
-- 
2.24.3 (Apple Git-128)

