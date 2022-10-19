Received: by 2002:a17:906:43c7:b0:78d:9f02:16a1 with SMTP id j7csp395387ejn;
        Wed, 19 Oct 2022 07:44:30 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM7xfbardKyYYmiV5QJhfNMa9r08kzPeuF2ECigJqjC+mPljx8n9fJRUhC/kHSMn8BUQorgR
X-Received: by 2002:ac8:5b81:0:b0:39c:b735:6b8b with SMTP id a1-20020ac85b81000000b0039cb7356b8bmr6664383qta.416.1666190670008;
        Wed, 19 Oct 2022 07:44:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1666190670; cv=none;
        d=google.com; s=arc-20160816;
        b=NgJoEFVS92GxDwWXmoNIGz63nPlqrgCw7ctddwsUaIDaOICUjqOarJhXK9tAoyK5oY
         UlxhIoXtWQoXcUr1gbEQ9ZlP8rdVyLPA955keHX8KOhxbM9zQRbFDsMhzH1GJtmC/5Lm
         OikVYp3y8H+JgI63vL64lfVi8nOXv48AEZoMxRovlkBUJMfO+ZDudVSP0iMphUxHiqeX
         fhxk26b6w5dpECP+4dmlEPI3uwjg2AszIGJk66jleBCVzLCCCY/NcYFWMtSsUACRpAZe
         A1s1btdBngHhwjBoqSM96lsB8Zj+aXLw9HperV0yrovJQIrNMo0Wc+fLick1QqSHtM+v
         D3oQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:cc:to:message-id:mime-version:subject
         :date:from;
        bh=djct0iRauP3WG8z3hdH+B5B6BQd2O61j+6/s6PLu5Ck=;
        b=RM7eRWBx/SetcP0ko7RdBIuDOZNkmV10GpajnNHSbb3diIpz9NkTwADaMlfuV5YxqS
         9yMFWqHtF2Y89qGBaKv7vZHbsnsBodm6gQ8m6XQUjabgQVGv54bOJUokyULyEmzU1mrI
         LrDXXxtEIOY0QOLH3psBHXA6NtKfOh+5E7JK4kDxeFNIqMGCujHAb3LY35JuXjgzu3cy
         6KRW4zJ0c3CH8/GOHe7LwpYYbJpo+EWf5Fzc0GVJ+exbxPPROHoeK6q2axERlmlDYCKD
         iQwJUh20XLFX5IxBGAW5e25u071ZqnAPE+ELnyFXqJT8HmzJJ93stzXQIfQWg/xIgXUT
         Vb3w==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=sr.ht
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ga26-20020a05622a591a00b0035bac9561cfsi8996899qtb.663.2022.10.19.07.44.29
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 19 Oct 2022 07:44:30 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=sr.ht
Received: from localhost ([::1]:54802 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1olAJ3-0004Ja-Gi
	for alex.bennee@linaro.org; Wed, 19 Oct 2022 10:44:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35720)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <outgoing@sr.ht>) id 1ol92y-0008FU-4j
 for qemu-arm@nongnu.org; Wed, 19 Oct 2022 09:23:48 -0400
Received: from mail-b.sr.ht ([173.195.146.151]:58036)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <outgoing@sr.ht>) id 1ol92w-0007e3-Lw
 for qemu-arm@nongnu.org; Wed, 19 Oct 2022 09:23:47 -0400
Authentication-Results: mail-b.sr.ht; dkim=none 
Received: from git.sr.ht (unknown [173.195.146.142])
 by mail-b.sr.ht (Postfix) with ESMTPSA id 07FF311EF52;
 Wed, 19 Oct 2022 13:23:45 +0000 (UTC)
From: ~axelheider <axelheider@git.sr.ht>
Date: Wed, 19 Oct 2022 13:23:44 +0000
Subject: [PATCH qemu.git 0/1] target/imx: reload cmp timer outside of the
 reload ptimer transaction
MIME-Version: 1.0
Message-ID: <166618582472.15206.6093574533258782051-0@git.sr.ht>
X-Mailer: git.sr.ht
To: qemu-arm@nongnu.org
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=173.195.146.151; envelope-from=outgoing@sr.ht;
 helo=mail-b.sr.ht
X-Spam_score_int: 2
X-Spam_score: 0.2
X-Spam_bar: /
X-Spam_report: (0.2 / 5.0 requ) BAYES_00=-1.9, FREEMAIL_FORGED_REPLYTO=2.095,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Wed, 19 Oct 2022 10:43:52 -0400
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
X-TUID: DtqFVHtp84c0

When testing with seL4 and a timer driver, without this patch the the
interrupt takes up to a minute to arrived when the timer is set to fire
after 1 second. This patch fixes the timer interrupt triggering.

regards, Axel

Axel Heider (1):
  target/imx: reload cmp timer outside of the reload ptimer transaction

 hw/timer/imx_epit.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

-- 
2.34.4
