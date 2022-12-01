Received: by 2002:a17:906:80c3:b0:7ae:d8f:8937 with SMTP id a3csp531478ejx;
        Thu, 1 Dec 2022 07:43:25 -0800 (PST)
X-Google-Smtp-Source: AA0mqf69XtJ9+1QAPzFdiPbPnOh/QDFMwUZEYD8YM4NFNC02RF/clbF27PUQoTxFRbI/cz1ZwWoG
X-Received: by 2002:a05:620a:a5c:b0:6fa:1e19:8e6a with SMTP id j28-20020a05620a0a5c00b006fa1e198e6amr59666706qka.587.1669909405642;
        Thu, 01 Dec 2022 07:43:25 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1669909405; cv=none;
        d=google.com; s=arc-20160816;
        b=oiSF66AInixOQ9c19Qy2tC5CiRGFb0BIXI0dqI5PRUlDkUjwaf5Uk7S+ErFmT22vkU
         KsNnL1tKru3mz1hMKj08nkO2SbdIbpkrA7cFtSfxZgjR8KMYoJTNz7HvDmA2f0RJsfpw
         c5fooF9YF10inLp505fagbusc6bFOGhAgJSzJfr3QlZtfRWXRmuPKn1oRQL65qVvyEKD
         M4KE98z2zmPTcam6TRKm55HiHzKpwQ59KBYEOYJJdY1XsXGTqnnUfT+HcHqvw1GmDxhE
         X1MOkSLxCa30o3qHRo/RHEwcwMAnhS3d4236s8uKI1vgvaCi8kPOHP5F2eoy6RUG68el
         QC0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:cc:to:message-id:mime-version:subject
         :date:from;
        bh=8ksG/+58jubSbBf9dl914FDT2fuSBaMZ/VLRkwRuCi4=;
        b=uGh5xpZFZQzCJYn7pQNcFpsQK287X9ALf6Ac1S5V0s6uecOlnBfqzzc1qs/aehdQ4k
         PDONwHPn/U1UgHz4IOG8tyDXCn+ufX+6opB8PEh/M4pu39fL0fRaD8/jIm7NjQpEvV73
         SoSAH+6ztYlfdN4uygslMzgRntK3gnFTvpeqjPr7Du4as4nnRUzjcYp+2s1dnHCUPRub
         lFLDi1YOjDAMTw+oGQSBEeqA0SV9W2NXbEA55hpNOb3hJUjMdYlEAqyNm0DQ5H9cQA3U
         +oiw+2qe0RBth8qNeCXjsW4CUJUdMQd+Gp6+YDQQSAcCUKMsFlecD/KXlZpi/s+ZdnoZ
         yypg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=sr.ht
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id cb10-20020a05622a1f8a00b00399ce3c7f87si2529729qtb.246.2022.12.01.07.43.25
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 01 Dec 2022 07:43:25 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=sr.ht
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p0lhX-0005KE-Go; Thu, 01 Dec 2022 10:42:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <outgoing@sr.ht>)
 id 1p0lhN-0005Eo-DL; Thu, 01 Dec 2022 10:42:05 -0500
Received: from mail-b.sr.ht ([173.195.146.151])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <outgoing@sr.ht>)
 id 1p0lhL-0004vv-4O; Thu, 01 Dec 2022 10:42:05 -0500
Authentication-Results: mail-b.sr.ht; dkim=none 
Received: from git.sr.ht (unknown [173.195.146.142])
 by mail-b.sr.ht (Postfix) with ESMTPSA id E18D711EFD8;
 Thu,  1 Dec 2022 15:42:00 +0000 (UTC)
From: ~axelheider <axelheider@git.sr.ht>
Date: Thu, 01 Dec 2022 15:42:00 +0000
Subject: [PATCH qemu.git v3 0/8] hw/timer/imx_epit: improve and fix EPIT
 compare timer
MIME-Version: 1.0
Message-ID: <166990932074.29941.8709118178538288040-0@git.sr.ht>
X-Mailer: git.sr.ht
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, peter.maydell@linaro.org
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
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Reply-To: ~axelheider <axelheider@gmx.de>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: ATIX/lmaFdrz

This patch set improves the i.MX EPIT emulation:
- fix #1263 for writes to CR
- ensure SR_OCIF is set properly even if CR_OCIEN is off
- hardware reset initialized CR to 0
- interrupt state update on CR writes (e.g. software reset)
- remove explicit fields cnt and freq (they are redundant)
- general code and documentation improvements

v3 addresses the comments from the previous iterations, but still keeps
the scope of this patchset limited to addressing the obvious bugs in the
behavior. It does not try to improve the timer accuracy, thus the
following remarks remain to be fixed in a future patch after this one is
merged:
- don't use PTIMER_POLICY_LEGACY. Fine tuning this requires more
  time and currently this is not a major concern, because the timer is
  working reasonably well.
- replace the modestly harmful sequence
        counter = ptimer_get_count(s->timer_reload);
        ...
        ptimer_set_count(s->timer_cmp, counter);
  by something better that does not lose or gain time. The current
  patchset does not introduce this sequence, it has been there
  before already. Again,  the current lack of accuracy here is not a
  major concern because the timer is working reasonably well.

Axel Heider (8):
  hw/timer/imx_epit: improve comments
  hw/timer/imx_epit: cleanup CR defines
  hw/timer/imx_epit: define SR_OCIF
  hw/timer/imx_epit: update interrupt state on CR write access
  hw/timer/imx_epit: hard reset initializes CR with 0
  hw/timer/imx_epit: factor out register write handlers
  hw/timer/imx_epit: remove explicit fields cnt and freq
  hw/timer/imx_epit: fix compare timer handling

 hw/timer/imx_epit.c         | 370 +++++++++++++++++++++---------------
 include/hw/timer/imx_epit.h |   8 +-
 2 files changed, 222 insertions(+), 156 deletions(-)

-- 
2.34.5
