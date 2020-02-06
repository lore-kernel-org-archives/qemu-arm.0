Received: by 2002:a05:6512:3aa:0:0:0:0 with SMTP id v10csp1782368lfp;
        Thu, 6 Feb 2020 10:33:15 -0800 (PST)
X-Google-Smtp-Source: APXvYqxI60TovOYR4/6NFVBO8Yh9NPwNJ5YicUo+upmUBocGnMpqCNo8UpZdOq3aDuFCIL31RK07
X-Received: by 2002:a05:620a:2119:: with SMTP id l25mr3854417qkl.248.1581013995065;
        Thu, 06 Feb 2020 10:33:15 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1581013995; cv=none;
        d=google.com; s=arc-20160816;
        b=GKfExm1PBawTgpTDZ7dl5/lpyJZGcYTqJDNuZ1f87jSxKN9V4HuEavW+sUchm2m0+k
         s4lxdOY7djI9qpcw60fALLVkko1z3mq+Oy7kroYba99Gcr16wLVLYasqg9MgrQ5yO9wD
         eDm376jf3Ah45Cvjt4EGtrOx28fmkyfdez8TjAw9o4FHkA6wUalYjREB3rOKvRZwf7JN
         0rkdi5RpF1cy7j7EjfLaXzpEArVnEIa66fHMB6zOrX2QobvzMj19MUmUi8P1iBo3BR1P
         iyOkpxTcHszkajH1pJMoKhEvavPEZ5tgTcqcpJlWRYp+ovxCrCSWLQwvJQYlFT315jmF
         egkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=TFJ5p1ThS0hsrxJYRVO5wCKqO07TvtEvWzLC69usUMo=;
        b=le/1Jfg0MkMrbeEm7/XXmv5zdzrE7SMyLRutVk97VMIc3Pk7RYINlslDlZUcgcy/+u
         bfrrqjqMfPJ2JdbLhK74zSlQAVDjzBdiABJFJdrFsZTY+v4Bl65OtnuIAK83bKBvWDit
         gvYHGhWsBMvsexDMFr1RQ5yeHZoyuQlTXaDoimZvvnhMoIGIy/jHISH73v+K1Gy5bDFO
         hZUUZXJ/R+iJ009B3Ymv/Uqj27mRIjbcvsZJewG5+tzTLnx3dF+qwxa6a4HxFnNV5owV
         tMn/md8qGrcEt6RgTswwc4pc8D1DgSBzFXEDNGGlgoCsC2b9qTQjL11eJ9B3UacQPr8e
         RnxQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=BKXJ+pHA;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i16si41775qvo.163.2020.02.06.10.33.14
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 06 Feb 2020 10:33:15 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=BKXJ+pHA;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:44394 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1izlxi-0000qS-FY
	for alex.bennee@linaro.org; Thu, 06 Feb 2020 13:33:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33913)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <groeck7@gmail.com>) id 1izlx7-0000NG-V1
 for qemu-arm@nongnu.org; Thu, 06 Feb 2020 13:32:38 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <groeck7@gmail.com>) id 1izlx6-0003Ea-V4
 for qemu-arm@nongnu.org; Thu, 06 Feb 2020 13:32:37 -0500
Received: from mail-pj1-x1044.google.com ([2607:f8b0:4864:20::1044]:36309)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <groeck7@gmail.com>)
 id 1izlwy-0002eB-N9; Thu, 06 Feb 2020 13:32:28 -0500
Received: by mail-pj1-x1044.google.com with SMTP id gv17so347657pjb.1;
 Thu, 06 Feb 2020 10:32:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=TFJ5p1ThS0hsrxJYRVO5wCKqO07TvtEvWzLC69usUMo=;
 b=BKXJ+pHAIy34MxF73NSkOCFiML1oW02DGqYmirQl8r8f4l6ltSd1vvRctwdh0mOmwh
 z/F2l1ONMl2EJfbZcozrOor8F4x1MwzIdyIa/iJp1dNAKfZteZnsgDlU4oRzL7+W4jKS
 L8lj0N+O8xHlLyf8g+E71KuTr1V6DxuX/+KdGEK/jXbwCnmbQ7Xvg6cCvEXJPmiz+IQM
 XOZ+42oMOxoNpygjAS2qp9MpwdBu/gmjb8a+pMq/ZJbJ8amEkruSB5SiajGMke7xB1xI
 Ebcv8p+G6E7JYivxIbowUcaoeJfaDa8kEbMr1fgTDCqUp9FxsES983Ug0SofvHCIsHbc
 MMbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=TFJ5p1ThS0hsrxJYRVO5wCKqO07TvtEvWzLC69usUMo=;
 b=GjpFGRTwX31Z/gwsCjoePzhPM2VF3hMnonQXCwMOXe9eoiQnZLtsB1R2oG+v5S/NnZ
 wOmQ6fP3KYgEeShO11Kfsr7BRDs8c4J+6UN0GuY7EvLR0pS+oTQ+5gTjA3O9/krUQELl
 7htVIjn0lPE/VmVkchkCxi2C2GcuBpdJHdpmLedF/hjUJhHlBuY0EcQap0/6dxQ6zqQX
 V8P0FcMqSTfoXpvWkkOpTQM15c44riDjenP/39Fk40+8WT0w4pU4lbaKR9WMDKyLXqeY
 Jfm2Q5272tAJgU63bAGM/PENCHL6lyVMkD5cu+OPYX2T11flyCh5UaX0UqTWq48nzzJk
 hPDQ==
X-Gm-Message-State: APjAAAUm8wKwTb1SNjvt3EU0rUTVDfFrhs4895vioz3um9OJKoaxQMrL
 GVeTW8i4e3JB4uZK4YQS/vk=
X-Received: by 2002:a17:90a:5285:: with SMTP id
 w5mr6200743pjh.77.1581013947718; 
 Thu, 06 Feb 2020 10:32:27 -0800 (PST)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id 144sm115035pfc.45.2020.02.06.10.32.26
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Thu, 06 Feb 2020 10:32:27 -0800 (PST)
From: Guenter Roeck <linux@roeck-us.net>
To: Alistair Francis <alistair@alistair23.me>,
	Kevin Wolf <kwolf@redhat.com>
Subject: [PATCH v2 3/4] m25p80: Improve command handling for unsupported
 commands
Date: Thu,  6 Feb 2020 10:32:18 -0800
Message-Id: <20200206183219.3756-3-linux@roeck-us.net>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200206183219.3756-1-linux@roeck-us.net>
References: <20200206183219.3756-1-linux@roeck-us.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::1044
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-block@nongnu.org,
 Andrew Jeffery <andrew@aj.id.au>, qemu-devel@nongnu.org,
 Max Reitz <mreitz@redhat.com>, qemu-arm@nongnu.org,
 Joel Stanley <joel@jms.id.au>, Guenter Roeck <linux@roeck-us.net>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: c9m1TnJ8ZJAh

Whenever an unsupported command is encountered, the current code
interprets each transferred byte as new command. Most of the time, those
'commands' are interpreted as new unknown commands. However, in rare
cases, it may be that for example address or length information
passed with the original command is by itself a valid command.
If that happens, the state machine may get completely confused and,
worst case, start writing data into the flash or even erase it.

To avoid the problem, transition into STATE_READING_DATA and keep
sending a value of 0 until the chip is deselected after encountering
an unsupported command.

Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
v2: Split patch into two parts; improved description.

 hw/block/m25p80.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/hw/block/m25p80.c b/hw/block/m25p80.c
index 53bf63856f..8227088441 100644
--- a/hw/block/m25p80.c
+++ b/hw/block/m25p80.c
@@ -1161,6 +1161,11 @@ static void decode_new_cmd(Flash *s, uint32_t value)
         s->quad_enable = false;
         break;
     default:
+        s->pos = 0;
+        s->len = 1;
+        s->state = STATE_READING_DATA;
+        s->data_read_loop = true;
+        s->data[0] = 0;
         qemu_log_mask(LOG_GUEST_ERROR, "M25P80: Unknown cmd %x\n", value);
         break;
     }
-- 
2.17.1

