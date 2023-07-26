Received: by 2002:a17:906:2484:b0:98d:b2f5:1316 with SMTP id e4csp266048ejb;
        Tue, 25 Jul 2023 20:33:16 -0700 (PDT)
X-Google-Smtp-Source: APBJJlEH1k2RnRaW3qNeNwtaiIHZQig9A+x+c3EQh8S9+sA0Ig5VZhWlHG6R7+ydvPtdd41uwJtF
X-Received: by 2002:a05:620a:1a22:b0:768:1f57:5bc with SMTP id bk34-20020a05620a1a2200b007681f5705bcmr912178qkb.51.1690342396431;
        Tue, 25 Jul 2023 20:33:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1690342396; cv=none;
        d=google.com; s=arc-20160816;
        b=miE5meAqNHm4udcAz+Ed6udbZZ8oj28du6+GOy1b/tW93pEqn4xGKs8eeWz3IGgjPx
         9w/3D0X2mhOZart3Mppa8zy1viVENBTmfn0gt9NtS40tSeTt2MnsrQ0I1q8bk9ENaanT
         0hTruW3x59R9BPXMbJx1PLVIW0cx8N54+Mi1xDOBE1t1lsohoLvo7IHf4gOIxpl/gVIA
         Vm7gPVSTyn+/GVTWlq7zuVOFxbCO2gH9F0iGsD5tXsEpS3ohiDBgKgAVzWCpgNm1Dki8
         I0I7ylE6aTyso5pmD0fHpcAzpOgdrHJs8l2iiJHkhEIn8xtKYw5ORurHA9x+fGkw7mU3
         gfwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:feedback-id:references:in-reply-to:message-id:subject
         :cc:from:to:dkim-signature:date;
        bh=+u4hReE1HgN+L3e9IZjGDlx7yBSheJRATufqrFnZkUo=;
        fh=51RBXPp2dGsIxW/A/2XX6J9OY4lNIg77Uvb7eAIehHk=;
        b=Qk5sFfqPkF3ZPLAGWBTlPlYhuzGoci9H+tKbjlPSuDbeKL8FDj5DeGAq4arLPpDpV8
         3cHp9OdWmDnjOXkCQW59tZT+Be6rSVsT9gHM/71sAOCjqfOqmq5Ba9eyIaUtnuJBYjqv
         0uL9wqoAty2POAo6L2wyYPm6D0HtYH9cbxElQtk9SYEY4WAinxycKcptQ9IqMfe/TqcF
         QaM2VVLznof4ZC/ZuS/Ko9QVBw30jW36PcqrmTuUyROl2FZ0izpM0Xyb/19rylAYNyxx
         vluVFVGhNWserjmFDvuaIyPvnVEMrGJML2GJXwHuALXvAZKU+2oRA74Cda1pZx4bu1iL
         ZivQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@laplante.io header.s=protonmail3 header.b=Lb9zVSPl;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=laplante.io
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id dl1-20020a05620a1d0100b00767e68138fasi7556714qkb.692.2023.07.25.20.33.16
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 25 Jul 2023 20:33:16 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@laplante.io header.s=protonmail3 header.b=Lb9zVSPl;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=laplante.io
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qOVGT-0005Uv-H3; Tue, 25 Jul 2023 23:32:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chris@laplante.io>)
 id 1qOVGS-0005UZ-I5; Tue, 25 Jul 2023 23:32:40 -0400
Received: from mail-4323.proton.ch ([185.70.43.23])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chris@laplante.io>)
 id 1qOVGQ-0007el-Mg; Tue, 25 Jul 2023 23:32:40 -0400
Date: Wed, 26 Jul 2023 03:32:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=laplante.io;
 s=protonmail3; t=1690342356; x=1690601556;
 bh=+u4hReE1HgN+L3e9IZjGDlx7yBSheJRATufqrFnZkUo=;
 h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
 Message-ID:BIMI-Selector;
 b=Lb9zVSPlbAfonms12OjHRKO9w1+s48tJzsOFNGYs5zx+kLSpkNSLDd/XFRL4S6H/8
 IU/7P5uAGOeIxwSgcUz/AXiiASlxRkPSWUsfPHxXZLKjN1OpCpiwzIXQys9emLWUR3
 hb29xnFBveA03ghqPXVmqvScTauRLuMMo3xqTO4ueq/gEy67pC9YdxtXHPBOlZa+tS
 /FrnfU2aoRHZGBc07z5men9ypjkBIqF9L86VOUCh78Q1tVozRe3Tb7XQjo1+rCrEo3
 2/aJJOCby2NAPiqvFX0PMGcRd/Xpy+DOkx6UHwUzz0lf6cKAku5eYOw52EgFsuVzmS
 wtCUc/p6BIZeg==
To: qemu-devel@nongnu.org
From: Chris Laplante <chris@laplante.io>
Cc: Joel Stanley <joel@jms.id.au>, Peter Maydell <peter.maydell@linaro.org>,
 qemu-arm@nongnu.org, Chris Laplante <chris@laplante.io>
Subject: [PATCH v2 4/6] qtest: bail from irq_intercept_in if name is specified
Message-ID: <20230726030450.757462-5-chris@laplante.io>
In-Reply-To: <20230726030450.757462-1-chris@laplante.io>
References: <20230726030450.757462-1-chris@laplante.io>
Feedback-ID: 43500449:user:proton
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=185.70.43.23; envelope-from=chris@laplante.io;
 helo=mail-4323.proton.ch
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
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
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: iKas7M+u5wcM

Named interception of in-GPIOs is not supported yet.

Signed-off-by: Chris Laplante <chris@laplante.io>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
---
 softmmu/qtest.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/softmmu/qtest.c b/softmmu/qtest.c
index 7fd8546ed2..1719bbddc3 100644
--- a/softmmu/qtest.c
+++ b/softmmu/qtest.c
@@ -410,6 +410,12 @@ static void qtest_process_command(CharBackend *chr, gc=
har **words)
             return;
         }
=20
+        if (is_named && !is_outbound) {
+            qtest_send_prefix(chr);
+            qtest_send(chr, "FAIL Interception of named in-GPIOs not yet s=
upported\n");
+            return;
+        }
+
         if (irq_intercept_dev) {
             qtest_send_prefix(chr);
             if (irq_intercept_dev !=3D dev) {
@@ -421,7 +427,6 @@ static void qtest_process_command(CharBackend *chr, gch=
ar **words)
         }
=20
         QLIST_FOREACH(ngl, &dev->gpios, node) {
-            /* We don't support inbound interception of named GPIOs yet */
             if (is_outbound) {
                 if (is_named) {
                     if (ngl->name && strcmp(ngl->name, words[2]) =3D=3D 0)=
 {
--=20
2.41.0


