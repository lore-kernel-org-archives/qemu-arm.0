Received: by 2002:a17:906:43c7:b0:78d:9f02:16a1 with SMTP id j7csp395416ejn;
        Wed, 19 Oct 2022 07:44:32 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM5V99VXkaFgOpDqFFC/NIaZfDWA7BIUo4JWZq8L1TLTaiDAr0vl7VQmDH1ADy+ZPsDOTsK9
X-Received: by 2002:a05:622a:170f:b0:39c:e3dd:62f3 with SMTP id h15-20020a05622a170f00b0039ce3dd62f3mr6834292qtk.480.1666190672008;
        Wed, 19 Oct 2022 07:44:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1666190672; cv=none;
        d=google.com; s=arc-20160816;
        b=WCYXu+CNtJnGc8SLePtpm6tz7op/ajq6YsEjTSG0yuXuSezA2etycM1XoFDsP9oV6Y
         ceW5WsFw7gjnOfEnF4G1dYCat397NaX2StTKdrRlwJn01JCoJyQpm73gQiTCVnhIl3HW
         OdCX5kuQPqHWKyE6Ruo5dNRhjalmUjIyh/HIsD6I4BSv/dq9AqaHf1JdYlfu6jY0CXPn
         RObEIcNnpXX+Cq/HP0GaGPLbELoKk6gadEAPsU3tdAhr+dmDnoye2sYKPeAidXJ2UIze
         6UlI6xa5u4QqGRUaPEy75bWwMjOqnNwmLOyGqFLmrUOAwPPJbn9GSfcFkWdwPczfBec2
         YP6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence:mime-version
         :content-transfer-encoding:cc:to:in-reply-to:message-id:subject:date
         :from;
        bh=1MxQp/vww9maqQ+t3PfKnYQNoGyobMGSHMwbzEuBA3M=;
        b=kpBkm951ZsZRnKmN2tV42OnGEkeoEGVna8syeJsV7SsTTqiSLqO27XwFIch97VUrNe
         fg72VlWfgSCov+MzLaR9DgxDFb7tQwzaIHF+PvPi4xPCXCwD+SG3ZOXpgizL9jKU/KNe
         QyISGTw6astyfS5+sCeUZcELawSjNtOfitkTaF62+zjRLHagM1Nv9kghygmVMcfBf7P0
         e7FKGBrAlfzrBwn4EifR/XVrH/iSbUvLbB6GOsJyK/3vAQA7R1w8EgRKhH65DIM/1nm+
         XKCFmKSoT64DLE+SJzzcq5ILSunt/zsRhSgj1ssi64T4Zb0hZCK1o42jCIWbgxkAjilY
         TPiw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=sr.ht
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id eq3-20020ad45963000000b004b196e65a9fsi8632333qvb.351.2022.10.19.07.44.31
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 19 Oct 2022 07:44:32 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=sr.ht
Received: from localhost ([::1]:47668 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1olAJ5-0004Kw-Hw
	for alex.bennee@linaro.org; Wed, 19 Oct 2022 10:44:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35722)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <outgoing@sr.ht>) id 1ol92y-0008FX-8e
 for qemu-arm@nongnu.org; Wed, 19 Oct 2022 09:23:48 -0400
Received: from mail-b.sr.ht ([173.195.146.151]:58038)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <outgoing@sr.ht>) id 1ol92w-0007e4-Lm
 for qemu-arm@nongnu.org; Wed, 19 Oct 2022 09:23:47 -0400
Authentication-Results: mail-b.sr.ht; dkim=none 
Received: from git.sr.ht (unknown [173.195.146.142])
 by mail-b.sr.ht (Postfix) with ESMTPSA id 2F0FF11EF7E;
 Wed, 19 Oct 2022 13:23:45 +0000 (UTC)
From: ~axelheider <axelheider@git.sr.ht>
Date: Wed, 19 Oct 2022 15:09:50 +0200
Subject: [PATCH qemu.git 1/1] target/imx: reload cmp timer outside of the
 reload ptimer transaction
Message-ID: <166618582472.15206.6093574533258782051-1@git.sr.ht>
X-Mailer: git.sr.ht
In-Reply-To: <166618582472.15206.6093574533258782051-0@git.sr.ht>
To: qemu-arm@nongnu.org
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Received-SPF: pass client-ip=173.195.146.151; envelope-from=outgoing@sr.ht;
 helo=mail-b.sr.ht
X-Spam_score_int: 2
X-Spam_score: 0.2
X-Spam_bar: /
X-Spam_report: (0.2 / 5.0 requ) BAYES_00=-1.9, FREEMAIL_FORGED_REPLYTO=2.095,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Wed, 19 Oct 2022 10:43:49 -0400
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
Reply-To: ~axelheider <axelheider@gmx.de>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ue8SFZBHI3IO

From: Axel Heider <axel.heider@hensoldt.net>

Signed-off-by: Axel Heider <axel.heider@hensoldt.net>
---
 hw/timer/imx_epit.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/hw/timer/imx_epit.c b/hw/timer/imx_epit.c
index 2bf8c754b2..0b13c1eab0 100644
--- a/hw/timer/imx_epit.c
+++ b/hw/timer/imx_epit.c
@@ -276,9 +276,12 @@ static void imx_epit_write(void *opaque, hwaddr offset, =
uint64_t value,
             ptimer_set_count(s->timer_reload, s->lr);
         }
=20
+        // commit s->timer_reload before imx_epit_reload_compare_timer
+        // as timer_reload is read in imx_epit_reload_compare_timer
+        ptimer_transaction_commit(s->timer_reload);
+
         imx_epit_reload_compare_timer(s);
         ptimer_transaction_commit(s->timer_cmp);
-        ptimer_transaction_commit(s->timer_reload);
         break;
=20
     case 3: /* CMP */
--=20
2.34.4
