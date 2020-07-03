Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp2779508lfm;
        Fri, 3 Jul 2020 13:20:26 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxp3PMY60rdEOznEIJVC3xS7sr0WWyZWpwgTNsOyrD9Ad3pk3wT8NWAQRp6G6PisDuM7q/W
X-Received: by 2002:a25:d152:: with SMTP id i79mr15596848ybg.221.1593807626805;
        Fri, 03 Jul 2020 13:20:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1593807626; cv=none;
        d=google.com; s=arc-20160816;
        b=Tjhigs5JSSyVSwxiCzYMslJisCFZ4msPv1DpBQkTs2cgyytYElTA4+WbaHYp63cqyI
         eDMz69U1DjQi83dXHRxK9CjX8E2At3MEUr375y+yDtheuTXRB90s5/G75xHHtb6Wc3vz
         MF3Ffxg8oyyWPw7YtjbyES8AJINpzE4BjSjT8qx5TA41eIisZ1cQ63fx5bvxWMmOhxI1
         WgtDw0o1JuLXbeGTiIgVQ/6g9xu9s3VxWbw/j9gB5HMaGRr+T2qfBen8D45bh4sR7Wnl
         WR31AxrH/sn3UFECdIRVPI9KjpQ613P1hEHbxL87rsW1rzvTndKLP60FE5gYGYRmV7Xz
         FRIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=Udt5N6SRjoTPSTAfmcAdn52pFZatqP/O7Mbt2kSJMIg=;
        b=Q/a2uYQ+D8Yq0RSuHS1qp0Vx59k4ZhLhyxUgsAofwJjo2t5hjIzJpvSzs9T0bB3W99
         iMSmKiRKksjpKGEMcln3uwp8nVDWW12J3HNeggGh7DDIwxWmvaDKrJLMb4LL1UYtGRnX
         +r/BBb/gFHXq3eDTMCgW5+yfjOJXNZDwEx/tzHQhP3R3VSFsKXpWT8I2fkiWLAdgxcX0
         p+ym9COGaiMB/VuEpRRvv7danoLLa86ksK+adYHt8VqUQTzY8KARnZbrA7LDWf9vecik
         stkgZIUQRs6LTATYo4eiGx22EMT2Is6unIqSSH1aBTLufej4dDG2oY/VykyDTu5bt5Qk
         2/TQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=UgN0zWUB;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id k12si12904839ybg.307.2020.07.03.13.20.26
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 03 Jul 2020 13:20:26 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=UgN0zWUB;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Received: from localhost ([::1]:44540 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jrSAc-0001lO-53
	for alex.bennee@linaro.org; Fri, 03 Jul 2020 16:20:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35206)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jrS9W-0007nk-Ji; Fri, 03 Jul 2020 16:19:18 -0400
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442]:42106)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jrS9V-0001UA-7F; Fri, 03 Jul 2020 16:19:18 -0400
Received: by mail-wr1-x442.google.com with SMTP id o11so33963444wrv.9;
 Fri, 03 Jul 2020 13:19:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Udt5N6SRjoTPSTAfmcAdn52pFZatqP/O7Mbt2kSJMIg=;
 b=UgN0zWUB2u9dOkVEc7dbpf6ztfvUgvdQXUNp5/bLgcy70ojv5ONG4UFkKLZbmnIbK+
 WSqOcIYe3+ebQGH73TvriNtDGUjvAtOk1W8IcqGUDKfms0IjFedpUn1D3cFXGD4S9KqC
 YFhm+Zk9tQl1y31Z+1kp+ii0Mx+fuM7HcBUA+juE2jltRsPgI/DeBvYc8RUBlPypzcKc
 zKRbBok3Vlppa76nxTfZt2MvJw1n1nJ/sE+U3izIl1Dx6q9mYx+lJC6iQVeRpYVeLZLf
 WdDn83KKDv/AnhZH5U+5DWrGEfjRZ+zKYUchAJEkSUOIAUpDmfSCnSvW+RH+SvHkt599
 UkrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=Udt5N6SRjoTPSTAfmcAdn52pFZatqP/O7Mbt2kSJMIg=;
 b=af3MbSojQgcW3NilX9y3DxibGOQyNBoQsEn8yCgEeZ65vrT2ExjuxkyV+7oDLsE9fl
 7pXUP8BYreUKIisUA8QxDW0mmF/p2HYllTnaIztLXYHMEDRFmyACWD1YrzA4S5XhpeGn
 Crjbbb9x+0o2T+KJoC7pFuaahpBMIee2wIMpCkcKkk0bftdgGq4yC29V09PjHVLd/NF8
 Dl5KaWizex58dSesNFxNnW1GQNznxlcjQmkdrVB8s5Ip9gUiz0IOnm3CwytbWVs7CZeH
 xyVa2OFa73ubLhJBTbYhViHO/Mk+2M0xt6MrH0AOk2oYfUMyiNfR5NBIR7pNmN2kchpM
 xlSg==
X-Gm-Message-State: AOAM530+uWOY9QaVzhmLofwRDK3T69cTC+lIKa2y4SJKZQFxs1CS3iuG
 kLtZ+NTQ4RL0JYszrZZ/ZaRq8L1j9kA=
X-Received: by 2002:a5d:6a90:: with SMTP id s16mr37262143wru.8.1593807555377; 
 Fri, 03 Jul 2020 13:19:15 -0700 (PDT)
Received: from localhost.localdomain (1.red-83-51-162.dynamicip.rima-tde.net.
 [83.51.162.1])
 by smtp.gmail.com with ESMTPSA id u65sm14229625wmg.5.2020.07.03.13.19.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Jul 2020 13:19:14 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH 01/18] migration/vmstate: Document vmstate_dummy
Date: Fri,  3 Jul 2020 22:18:54 +0200
Message-Id: <20200703201911.26573-2-f4bug@amsat.org>
X-Mailer: git-send-email 2.21.3
In-Reply-To: <20200703201911.26573-1-f4bug@amsat.org>
References: <20200703201911.26573-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::442;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x442.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: 0
X-Spam_score: 0.0
X-Spam_bar: /
X-Spam_report: (0.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=1, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: Laurent Vivier <laurent@vivier.eu>, Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Juan Quintela <quintela@redhat.com>,
 Andrew Jeffery <andrew@aj.id.au>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Andrew Baumann <Andrew.Baumann@microsoft.com>,
 Subbaraya Sundeep <sundeep.lkml@gmail.com>, qemu-arm@nongnu.org,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Artyom Tarasenko <atar4qemu@gmail.com>, Joel Stanley <joel@jms.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: vQscoi5QywK2

vmstate_dummy is special and restricted to linux-user. See commit
c71c3e99b8 ("Add a vmstate_dummy struct for CONFIG_USER_ONLY").

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 include/migration/vmstate.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/migration/vmstate.h b/include/migration/vmstate.h
index f68ed7db13..af7d80cd4e 100644
--- a/include/migration/vmstate.h
+++ b/include/migration/vmstate.h
@@ -194,7 +194,7 @@ struct VMStateDescription {
     const VMStateDescription **subsections;
 };
 
-extern const VMStateDescription vmstate_dummy;
+extern const VMStateDescription vmstate_dummy; /* Exclusively for linux-user */
 
 extern const VMStateInfo vmstate_info_bool;
 
-- 
2.21.3

