Received: by 2002:a19:ee0a:0:0:0:0:0 with SMTP id g10csp814895lfb;
        Tue, 1 Dec 2020 20:44:24 -0800 (PST)
X-Google-Smtp-Source: ABdhPJydbyET8jEQNWRf1DFhBm/w2+nG3INaH+Ug6z+V8QrHg3bZffUE+r0mh8ha3HQgZKcFLx84
X-Received: by 2002:a25:2f4e:: with SMTP id v75mr1199462ybv.18.1606884263864;
        Tue, 01 Dec 2020 20:44:23 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1606884263; cv=none;
        d=google.com; s=arc-20160816;
        b=cW+bYIactdsVdRQebs1kEJ/mi0E7yBxn/yO9tmsQE2k5EvLRxJrEtuvyIyGkjMo5Kr
         i0zxiAaCnKEhY+k4Iku+GPABwqHRXDk64CItF7t4QaVgDchgIG9QdMpl2atpM9ryw/mW
         tjy7Ih8CJFL5xvhv0RTdwwVNsOjHjXMrNPomAMLcNZRD+DAh2f4wRxB2SwK0shNamMf8
         rs+jcmj46+pxNDcWpCj7qw1ROmFv60O+Xk7uvYLpsM9Ae9dj0ZmJciiQVGkFC+EV1TXp
         NZNC5cFQg1cejfWs5DQgMKU8WW0/bvJ6PEsQGjZJjmSuB2cvHgIvzGRHRsaH1Lh75u4f
         9olQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=from:reply-to:sender:errors-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence:cc:to:subject
         :mime-version:message-id:date:dkim-signature;
        bh=8ZWZxwgZnh+CVD/RIyNXpGFOI5LtCpzp62lZLAhve0I=;
        b=qRK6zxQZczonm5Mx1tQRHezYngrafPzdt/f2nFyk17xPt1dapDqrKOoWm8HzgJFzBp
         NM9HYyQLxziBgkuovAaNb1OInDhOEhzlcIMJiKrWykSv9yodxhjOs1g01Sh5/WqITEBR
         cnBQZYr3WMuLK7naWhkr4ult+c+NOslaAXELiqCEeClGB2DZ6sPUVqgJwmnAUYDheyDZ
         4KQBpJ5jVSpJNSwlE7V+ayw3WAfKgRxSnSHBhx/HAMIkInPo8PkBQ+5lYwbHR9UilZLn
         Xeb+4pMjqPlEgps7rUbWfZW7soB3iJx+o0v72KVS7JpH/kAMTRAI4Nw/smK7e8o8rDHG
         gjTQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@google.com header.s=20161025 header.b=ePzs4tAz;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c3si644988ybn.190.2020.12.01.20.44.23
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 01 Dec 2020 20:44:23 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@google.com header.s=20161025 header.b=ePzs4tAz;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1]:59602 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kkK07-00011G-7z
	for alex.bennee@linaro.org; Tue, 01 Dec 2020 23:44:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53976)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3mxvHXwMKCPIjWWaiiafY.WigkYgo-Ulghihaho.ila@flex--pcc.bounces.google.com>)
 id 1kkJzz-00010a-0Q
 for qemu-arm@nongnu.org; Tue, 01 Dec 2020 23:44:15 -0500
Received: from mail-qv1-xf49.google.com ([2607:f8b0:4864:20::f49]:35991)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3mxvHXwMKCPIjWWaiiafY.WigkYgo-Ulghihaho.ila@flex--pcc.bounces.google.com>)
 id 1kkJzx-0003NX-Gg
 for qemu-arm@nongnu.org; Tue, 01 Dec 2020 23:44:14 -0500
Received: by mail-qv1-xf49.google.com with SMTP id d30so339376qvf.3
 for <qemu-arm@nongnu.org>; Tue, 01 Dec 2020 20:44:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=sender:date:message-id:mime-version:subject:from:to:cc;
 bh=8ZWZxwgZnh+CVD/RIyNXpGFOI5LtCpzp62lZLAhve0I=;
 b=ePzs4tAzlpaiS+sx8manrQzjYPSrf83bU6Lv75pR4iH+LI+wQm48ywKIpu+ohd9RgM
 pBETyZ+LBP08sf0bDPwHByaGvnkY3zbu3KoSluTYk5hPPzkRxnNAFA8FMMG1iKUmsiXp
 6tMkFXUzpQ23bvFcBRPN/W4txe3bYCnlauaXc/tqCRbPHSLPfT2ZQ7FKi7h0spfrpexk
 upusB6LaVblPzfiNtEkdFaHwMyNuRAxAvcuZpQBWyXEJQ6tPKo5a9TEo92Q3uPNXcVnJ
 ZvxBuuJOoObqqr/7RLOFudFtvmVHnUlaGJuy/6RnYi70ac6SnNzieKe9Xv2gEp602OOf
 H2Dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:message-id:mime-version:subject:from
 :to:cc;
 bh=8ZWZxwgZnh+CVD/RIyNXpGFOI5LtCpzp62lZLAhve0I=;
 b=I22tFpvSI+r5NBGei4SLxOTPFxGNU9OSAala08L75tx+WmommleIsOjZMYqLsfk+A5
 +OxxIlVMqtmIJZEgGoqwhwWRwyFOHMiJwvez/7vw++ybysbXNQ+RjSMFs7G9REdSMbBy
 JhOz8npQGBMgoJQdEz9tmN9tI0mibb0dXsTddPDPrUCL7YyhbGhmfYSfky7GcHInL2iX
 yeleYWBT9HRpH7aNDkrCKpurqy1DHUWTwjHYxXJZ2BH6B0IkQMFU329Mqy1sP6VkizDu
 SIjFzI+tLQtxytry0iB/iPjUtCPnDRM/cV3r9zUlYkjCfJw4YvVJXLaBSIIjFtYqN4zJ
 0/HA==
X-Gm-Message-State: AOAM530V0YOCM0c0WSUK5lx3WzB7D4IMQjtctqlUyxjMyGsW01grFGOB
 MiyCjg5D8/nzmaczBVE73KrcYWc=
X-Received: from pcc-desktop.svl.corp.google.com
 ([2620:15c:2ce:0:7220:84ff:fe09:385a])
 (user=pcc job=sendgmr) by 2002:ad4:4051:: with SMTP id
 r17mr862800qvp.39.1606884251305; 
 Tue, 01 Dec 2020 20:44:11 -0800 (PST)
Date: Tue,  1 Dec 2020 20:44:05 -0800
Message-Id: <27f51056925889c41b763b71c992f04d935157c4.1606884132.git.pcc@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.29.2.454.gaff20da3a2-goog
Subject: [PATCH v3 1/3] Revert "hvf: Actually set SIG_IPI mask"
To: Alexander Graf <agraf@csgraf.de>
Cc: Frank Yang <lfy@google.com>, Roman Bolshakov <r.bolshakov@yadro.com>, 
 Peter Maydell <peter.maydell@linaro.org>, Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 qemu-devel <qemu-devel@nongnu.org>, 
 Cameron Esfahani <dirty@apple.com>, qemu-arm@nongnu.org,
 Claudio Fontana <cfontana@suse.de>, Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::f49;
 envelope-from=3mxvHXwMKCPIjWWaiiafY.WigkYgo-Ulghihaho.ila@flex--pcc.bounces.google.com;
 helo=mail-qv1-xf49.google.com
X-Spam_score_int: -95
X-Spam_score: -9.6
X-Spam_bar: ---------
X-Spam_report: (-9.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 USER_IN_DEF_DKIM_WL=-7.5 autolearn=ham autolearn_force=no
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Reply-to: Peter Collingbourne <pcc@google.com>
From: Peter Collingbourne via <qemu-arm@nongnu.org>
X-TUID: t2/WmMIK4Nvz

From: Alexander Graf <agraf@csgraf.de>

This reverts commit 926a35700f0c14d6b95cbf8c3c3cce55ec7ffc3e.

You can just drop patch 3 of your v2 instead of taking this commit.
---
 accel/hvf/hvf-cpus.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/accel/hvf/hvf-cpus.c b/accel/hvf/hvf-cpus.c
index 4360f64671..e613c22ad0 100644
--- a/accel/hvf/hvf-cpus.c
+++ b/accel/hvf/hvf-cpus.c
@@ -346,7 +346,6 @@ static int hvf_init_vcpu(CPUState *cpu)
 
     pthread_sigmask(SIG_BLOCK, NULL, &set);
     sigdelset(&set, SIG_IPI);
-    pthread_sigmask(SIG_SETMASK, &set, NULL);
 
 #ifdef __aarch64__
     r = hv_vcpu_create(&cpu->hvf->fd, (hv_vcpu_exit_t **)&cpu->hvf->exit, NULL);
-- 
2.29.2.454.gaff20da3a2-goog

