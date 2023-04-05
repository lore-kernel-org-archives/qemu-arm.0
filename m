Received: by 2002:a17:906:b2c6:b0:930:eaf4:5c09 with SMTP id cf6csp426621ejb;
        Wed, 5 Apr 2023 07:49:24 -0700 (PDT)
X-Google-Smtp-Source: AKy350bSf8jwVuMxZPYeF7xNrbJxJS3ElSR0CUxydxffXS5BYWLAUFodWQChwLiGixIXCKC2oKOt
X-Received: by 2002:a05:6214:3012:b0:5df:5533:6fb3 with SMTP id ke18-20020a056214301200b005df55336fb3mr8227195qvb.5.1680706163940;
        Wed, 05 Apr 2023 07:49:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1680706163; cv=none;
        d=google.com; s=arc-20160816;
        b=M3zKjPADU+7rTVrFeLVc5QUk7Dw+qS4MgGEvQd0wMNtTBaVnhzwJyFv+2IeEikIM7K
         H5icq/xWNZGuo6cgrx1GrooHadVBoFcPt43f7zE1eZ5/fa2ytjIp7+YH227/uxymrc+e
         xhtr4p7jEQMXHyU5bcGYfOr+ppNiVzM1qu/JjFOG+bnm1y6NauQfazduJpx6lCdninwj
         RNCpZRfDpDq92FlDC3IXv5zKUP7gcvbzdqw6rA/de3ewk8nJPBA/mqT8UGrLMbzExzJK
         F6NsG5VphFP0fD3bRssVR5Dhh5n/pBMKQKPi16pM2+ilnr9tqgUpiXg5AsHQntFEcvRN
         r20A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:cc:to:message-id:mime-version:subject
         :date:from;
        bh=WL8SHp34ItUidWoNpCUApY3dXqb+1Pq6MVGueQtv6XE=;
        b=xaX8mcqlDg66Yg/O72INGZuOqIlSQKSifGV4zqPWvfF5z279qgZ5cSZ0NiVR6ZAKpt
         vmz8fiFqRBPQoxkhASF73ZRtCvK6iV6tDnwjLPlmgpPLGLAJg8daFWVNNKS/a3TCry5n
         guxu2glirm+u4hIbMtuQyeBUZzn36/HovuNcdK9WuyR2+GFqLH2bsYNlBqKwgnBPZUX2
         qVeqGZo9K7iK+yRUpjgNAoKmSkj0katDEdsbICmhZV6Q2YuSKDuGKD7M5g8huTJu5XX8
         VBV/kh3CSkDBrjbOV4CvuEgdQ7Uz2uT5ZAG58viwr+ZO1oWq1h8cutPlGxTx+CTgEC7t
         1oEQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=sr.ht
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f19-20020a05622a105300b003b9bd5198b5si10004446qte.45.2023.04.05.07.49.23
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 05 Apr 2023 07:49:23 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=sr.ht
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pk4RJ-0005b8-0B; Wed, 05 Apr 2023 10:48:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <outgoing@sr.ht>)
 id 1pk4RH-0005a2-4C; Wed, 05 Apr 2023 10:48:43 -0400
Received: from mail-b.sr.ht ([173.195.146.151])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <outgoing@sr.ht>)
 id 1pk4RF-0005S2-Lx; Wed, 05 Apr 2023 10:48:42 -0400
Authentication-Results: mail-b.sr.ht; dkim=none 
Received: from git.sr.ht (unknown [173.195.146.142])
 by mail-b.sr.ht (Postfix) with ESMTPSA id EEABA11EFCE;
 Wed,  5 Apr 2023 14:48:37 +0000 (UTC)
From: ~axelheider <axelheider@git.sr.ht>
Date: Wed, 05 Apr 2023 14:48:37 +0000
Subject: [PATCH qemu.git 0/2] hw/timer/imx_epit: fix reported issues
MIME-Version: 1.0
Message-ID: <168070611775.20412.2883242077302841473-0@git.sr.ht>
X-Mailer: git.sr.ht
To: qemu-devel@nongnu.org
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
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: u1IeHwjRbXBI

This patchset fixes the following issues:
- variable shadowing reported by Coverity
- fix check, see https://gitlab.com/qemu-project/qemu/-/issues/1491

Axel Heider (2):
  hw/timer/imx_epit: don't shadow variable
  hw/timer/imx_epit: fix limit check

 hw/timer/imx_epit.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

-- 
2.38.4
