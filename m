Received: by 2002:a17:906:9f27:b0:7ad:ca5a:aee3 with SMTP id fy39csp615321ejc;
        Sun, 30 Oct 2022 19:19:39 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM5Y40ENxVkEfCUpxP6Vqg6foBzvbWpFSn9h+IcfG/QVnFVaEZU88k/e6PtB8l12ENVxGkEu
X-Received: by 2002:a05:6214:da7:b0:4bb:d8a2:cc2f with SMTP id h7-20020a0562140da700b004bbd8a2cc2fmr6259813qvh.119.1667182779383;
        Sun, 30 Oct 2022 19:19:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1667182779; cv=none;
        d=google.com; s=arc-20160816;
        b=DmwNXhedT0xN82EIVdRe06GV8r4Hq8HdtKnRONPCAmhoOMyiLXXksf5TV92zhIToPT
         uw/yCcHugZtoVBJAv4pTfvrJZ1vzuz/2skOLp2OV8D7x/L+2AJtVZQwvD3GB33roiyjV
         qIz4JCJvJVaZcjdwcq/xoDtIT+h8xayqV37o0LwDNg2cu3VLzs51VG1YkRImVtwz73bu
         BrWqbCZwvUVP0zmajtJE69MVnbVFlEr6C7r4oR0dQpc2SviKVGPUV4nu1OTOfCZP2DTI
         +qaU/8B5726fjXdfZmyFG2nYBIfRtlNx+F6zfz9sZnQ6/kIRg+ff7srRyklzAkocmSUA
         9x+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=errors-to:sender:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence:mime-version
         :content-transfer-encoding:cc:to:in-reply-to:message-id:subject:date
         :from;
        bh=Gw1hDtpS1FqE8iWIOy3I+mpJrI1Tph9db6FED+WfdVQ=;
        b=rmKifR36b7e+MghbCfFOCfncli9dOHdbF4EPN4lnriO9YVckK128icIk/StXdgbwNF
         wonr2IXYRziVkPgjlKUlz2Z4tr9nZJKvA+SagbKYScelCRfGtLOuid+YieUnRvYGmB3L
         tum90cSecSplIjst4qH/z2mwiKT8CrAh2F3tlLlKtKmkur1MDjqPwFdR1fEDhj1CgXMI
         WyPhmkTb5IkxGF8hS9GOgpX6U/BQiCOqU9H1NkAFxc/yXAMxTgYu52ZxrN22ZuSUSMnC
         ZNr7goiHcP9dEShB2sw5K5CM2YaxoHoh2DJvhZRdNOBR0z2y/DSwvYs5GPRCjU51vPjU
         bZsg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=sr.ht
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w21-20020ac843d5000000b003a51ba342d4si2605428qtn.662.2022.10.30.19.19.38
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 30 Oct 2022 19:19:39 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=sr.ht
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1opKLA-00017T-J6; Sun, 30 Oct 2022 22:15:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <outgoing@sr.ht>)
 id 1opKL8-00014s-30; Sun, 30 Oct 2022 22:15:50 -0400
Received: from mail-b.sr.ht ([173.195.146.151])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <outgoing@sr.ht>)
 id 1opKL5-00033u-G1; Sun, 30 Oct 2022 22:15:49 -0400
Authentication-Results: mail-b.sr.ht; dkim=none 
Received: from git.sr.ht (unknown [173.195.146.142])
 by mail-b.sr.ht (Postfix) with ESMTPSA id B03D611F259;
 Mon, 31 Oct 2022 02:15:45 +0000 (UTC)
From: ~axelheider <axelheider@git.sr.ht>
Date: Tue, 25 Oct 2022 13:51:05 +0200
Subject: [PATCH qemu.git 01/11] hw/timer/imx_epit: fix typo in comment
Message-ID: <166718254546.5893.5075929684621857903-1@git.sr.ht>
X-Mailer: git.sr.ht
In-Reply-To: <166718254546.5893.5075929684621857903-0@git.sr.ht>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, peter.maydell@linaro.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Received-SPF: pass client-ip=173.195.146.151; envelope-from=outgoing@sr.ht;
 helo=mail-b.sr.ht
X-Spam_score_int: 36
X-Spam_score: 3.6
X-Spam_bar: +++
X-Spam_report: (3.6 / 5.0 requ) BAYES_00=-1.9, DATE_IN_PAST_96_XX=3.405,
 FREEMAIL_FORGED_REPLYTO=2.095, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Sender: "Qemu-arm" <qemu-arm-bounces@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: m3lCnZYDuxR0

From: Axel Heider <axel.heider@hensoldt.net>

Signed-off-by: Axel Heider <axel.heider@hensoldt.net>
---
 hw/timer/imx_epit.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/timer/imx_epit.c b/hw/timer/imx_epit.c
index ec0fa440d7..06785fe6f6 100644
--- a/hw/timer/imx_epit.c
+++ b/hw/timer/imx_epit.c
@@ -254,7 +254,7 @@ static void imx_epit_write(void *opaque, hwaddr offset, u=
int64_t value,
         break;
=20
     case 1: /* SR - ACK*/
-        /* writing 1 to OCIF clear the OCIF bit */
+        /* writing 1 to OCIF clears the OCIF bit */
         if (value & 0x01) {
             s->sr =3D 0;
             imx_epit_update_int(s);
--=20
2.34.5

