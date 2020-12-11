Received: by 2002:ac2:4c03:0:0:0:0:0 with SMTP id t3csp200832lfq;
        Fri, 11 Dec 2020 07:48:26 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxWpTbJyteRZqvDgWXh+dniKw+7xCWMJPhAiqKkiQiNvBRThjGvBaqSZmlhzCys1/Gwjekt
X-Received: by 2002:a25:25d5:: with SMTP id l204mr16226437ybl.26.1607701706647;
        Fri, 11 Dec 2020 07:48:26 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1607701706; cv=none;
        d=google.com; s=arc-20160816;
        b=GR7YtLfSIEamSj1EB0KIP9zrDxPacXOgWLdtuj9509T0H9SXcMDsuAZz1x+pvfvDkZ
         Gt0uHNTAvRlynLpUiYyMkDyVYWeTEFkbFV7HORp8QnRJrnwz8e5Eo0vd6hguF4Gv7LlP
         E0RhNf5N8kldUFkUEdx+NPy041LxE8x+L8/fc3z+c9iE2liOklS+1Jh9nUcHrZ0K/MhL
         G8IcTVDd3Ej94wDETRUk2etVXfH/KhLJV5QUQydr4RogyELp4baQdIM7Ym59Eutf5C1N
         kB9bd21EaRw7HNe7zKhRica2DaWp7PrIqy9LHN/gbLNQOohKxJRYMCEUgg57HMxq/Zwx
         V2Yg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from:dkim-signature;
        bh=ans4/Rqn96DP2m3wNK4hs/XKtgakap+FCe9+oTP0ODY=;
        b=FJi4JHfFsiR8RVpIeb+vzNEkpapYEXtCm2cGqQpGB78INUsYXeNOXQpf1eqwlnbJa7
         t5WcmgdI9yPylLqlGVrRKBDzt4fVFA5LFmZpdMUqWpxep2Cs038H7Ti0S8FWLq5vg0UK
         VUA7zIwCq+p24kY3szb8y78e3bAKw85dO1+sEUX6brLseMe3py/8IjUplAac+ffvQ6ZL
         1FqRGs86ilrcyEPpf9EDqkyDA81usSR4O6lxsYFPIzDXWP9cbbQESidjwPP+Q0TeoEiS
         yYkRK89+AVVi1J+2KJWN/G7e0PVs5IpB0NF1khFLfLKEe3DixNoovw/TZKAGU/0hwfgt
         4+tw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=L9Kc6yvw;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id z66si7978233ybz.11.2020.12.11.07.48.26
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 11 Dec 2020 07:48:26 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=L9Kc6yvw;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Received: from localhost ([::1]:41384 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1knkef-00035e-Us
	for alex.bennee@linaro.org; Fri, 11 Dec 2020 10:48:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59024)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1knkcZ-0001bQ-MW; Fri, 11 Dec 2020 10:46:16 -0500
Received: from mail-ej1-x643.google.com ([2a00:1450:4864:20::643]:35631)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1knkcU-0004qk-Tx; Fri, 11 Dec 2020 10:46:15 -0500
Received: by mail-ej1-x643.google.com with SMTP id f23so12975497ejk.2;
 Fri, 11 Dec 2020 07:46:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ans4/Rqn96DP2m3wNK4hs/XKtgakap+FCe9+oTP0ODY=;
 b=L9Kc6yvwcwg3akoS+XqcJL9se/+k9VCYP8xvWsxrHmFv2jmHbhGomQap2/LZ7x5HuH
 trjCDi1L6vgcJ4i3DUJGS97Fn30DbKJXCbPRBSLWjR8ZkObyjg1YwZuUbNhZt/n7+KJO
 G6HYdS6zyP2wsNB0QzMMi+fNKDRDzVflAYmmeOwXTTXlJUHXaM0VfkfuXjCSsWBGt8ul
 mkDlbh4ho4tYnlDV9mxvZ7rZAtXxMVZgkGl1UrMWa89Qrm6fcnANsbnWnO8GAVrDXHZq
 Pp6ZNPCI9wQOcrl/L+3yJ8BiprIraHqH8+loYmy49S/zOT+UpgIkvbyQDwZlhzObQI6O
 P2Ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=ans4/Rqn96DP2m3wNK4hs/XKtgakap+FCe9+oTP0ODY=;
 b=ZBRWPDnlHIT/IBTR1eyrCvrkf/lShQClLDzf8Ey1aNKscrlsmtKFkiH3ACcmk2pzgz
 76SeAy+jMSMjUQIWcO21eV6NB75pzL85s+3OyBA/XS3q3yjbLxtJEX9PFAkYcmzBWsnr
 M50O2fk8qwCuJ0fZ3bNFQJ/Trh3SazX6jER63eN9mAt4cJgO0jU54HuKfh8dMITRQUbI
 JYLh47hou8phd5RPeUrNgKzzBxCIMc7Gu0Eu3W6P5HjF+Yk5AYGoqPVIm7mNbtzSK7m0
 elgUj2j8phChg6nhboxe9aWjBwTMymenLUzmYgis+JmEJKQiN1/tdqEJvbGccVckmbR9
 X/Mw==
X-Gm-Message-State: AOAM530buM78R3JVbfEakmJt5e1w91NaB9Pf+zriEaulGbF+OzM1CEPw
 SagPTnS5okZqMmIyQXH0cP65RzazHEc=
X-Received: by 2002:a17:906:5e0d:: with SMTP id
 n13mr3621364eju.500.1607701567815; 
 Fri, 11 Dec 2020 07:46:07 -0800 (PST)
Received: from x1w.redhat.com (101.red-88-21-206.staticip.rima-tde.net.
 [88.21.206.101])
 by smtp.gmail.com with ESMTPSA id m7sm7964872eds.73.2020.12.11.07.46.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Dec 2020 07:46:07 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH] hw/rtc/twl92230: Add missing 'break'
Date: Fri, 11 Dec 2020 16:46:05 +0100
Message-Id: <20201211154605.511714-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::643;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ej1-x643.google.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 qemu-trivial@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: +XC6k+hGFNPR

Add missing 'break' to fix:

  hw/rtc/twl92230.c: In function ‘menelaus_write’:
  hw/rtc/twl92230.c:713:5: error: label at end of compound statement
    713 |     default:
        |     ^~~~~~~

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
I noticed Thomas "Compile QEMU with -Wimplicit-fallthrough" series
and remembered this old patch.
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/rtc/twl92230.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/rtc/twl92230.c b/hw/rtc/twl92230.c
index f838913b378..28656cb0e59 100644
--- a/hw/rtc/twl92230.c
+++ b/hw/rtc/twl92230.c
@@ -714,6 +714,7 @@ static void menelaus_write(void *opaque, uint8_t addr, uint8_t value)
 #ifdef VERBOSE
         printf("%s: unknown register %02x\n", __func__, addr);
 #endif
+        break;
     }
 }
 
-- 
2.26.2

