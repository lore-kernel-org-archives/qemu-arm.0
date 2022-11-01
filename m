Received: by 2002:a17:906:9f27:b0:7ad:ca5a:aee3 with SMTP id fy39csp1431597ejc;
        Mon, 31 Oct 2022 18:01:40 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM648MuzOD/B6FLSOXaNdm8kjXy4QeEahF43I3afglUEPoi0i5fZYq4YNqSVs6yxw3N9zMPg
X-Received: by 2002:a05:622a:4c:b0:39c:dfc2:292d with SMTP id y12-20020a05622a004c00b0039cdfc2292dmr13092018qtw.486.1667264500768;
        Mon, 31 Oct 2022 18:01:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1667264500; cv=none;
        d=google.com; s=arc-20160816;
        b=oMTYjUtUkqXv+6X5auAfVzxsudUsVI7//EXduNj5cwYbKkEXLGhEjDZZmd4mq4Va19
         yQiLq6aOSpCS5Hhrwt9SmwDsOC0WWn0FxUjN9KbqxoQ6Dq9qCX+6i4IywaBbE7qjTR0j
         hqHohgwAc3B2fPaGyuz0QeM7NEaS+vRiBB+oqV5h8Hyg+BcCzjk6oSsVgAC11Jvm+fss
         /jtdoOVNQR/eRxObWm41JRBMUvH1ufK0wQUPk6QgO2S14xz0mIBUgxv1ICEhU4KF6KBO
         bxJqqqXDqPN4UbUR7/Jbqmcw5yJf7TmYOHudbMso2cgPWx8fNu6RVjye6Lk0eAFfZeaV
         luzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=errors-to:sender:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=Vn8QAsjO7gtbZVeE7QQx9COaGQRw61V/sT24VvnuPKo=;
        b=ouZsrnZJZ/y5ZCFZEVSwdD9mKVwiLMg6tdlNIDBFtDLSqO3ZqmEm0cUum3L45GV/Uq
         9SuH71UcmDHSlavXyWFaMh5jzE2ZLue5c8P5DF9N99xC9uCVWro+h3QsgOTHRZLIyd9M
         UPMbGO9dn563UDPRq4NJIWVfVQ7eC/l94s8opUr/ffDxp5EM8JeJFZHLioakjJO+f4gK
         SLyJy6wB2EF9rL8flwJrb6gcLCf4zbc6B9iju0jUuwpS3Q7zZ8gm6Tkxn1WH0vIm/rVH
         /LCCOM3MzMPEklsj8l8ZcROyUDSr5GqvLXaQG+uyuG19WrqNOaygTIQH+WvdvcMRhHpx
         dMYg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@daynix-com.20210112.gappssmtp.com header.s=20210112 header.b=FOYVO998;
       spf=pass (google.com: domain of qemu-devel-bounces+peter.griffin=linaro.org+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+peter.griffin=linaro.org+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+peter.griffin=linaro.org+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t11-20020a05621421ab00b004b3f3b63bd2si5008242qvc.181.2022.10.31.18.01.40
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 31 Oct 2022 18:01:40 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+peter.griffin=linaro.org+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@daynix-com.20210112.gappssmtp.com header.s=20210112 header.b=FOYVO998;
       spf=pass (google.com: domain of qemu-devel-bounces+peter.griffin=linaro.org+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+peter.griffin=linaro.org+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1opfdF-0004UU-DM; Mon, 31 Oct 2022 20:59:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1opfcz-0004Mx-E1
 for qemu-devel@nongnu.org; Mon, 31 Oct 2022 20:59:41 -0400
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1opfcy-0005dS-0H
 for qemu-devel@nongnu.org; Mon, 31 Oct 2022 20:59:41 -0400
Received: by mail-pj1-x102e.google.com with SMTP id
 q1-20020a17090a750100b002139ec1e999so7296329pjk.1
 for <qemu-devel@nongnu.org>; Mon, 31 Oct 2022 17:59:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Vn8QAsjO7gtbZVeE7QQx9COaGQRw61V/sT24VvnuPKo=;
 b=FOYVO998YjsdHVk1ojpi9V5BHUeBMPrW0BVEhVBhLx5EISMrbv/Hi9j911oa3VwlUN
 9CJOYgUoZ6gi9h03YChSOtOyYSPcIS+fQ9f11Ww8G9HS9/YkeP9HjzFgqxTUnAKXsC/S
 zq+Uj7UvvtrIf0jVFT2RlGrOkNXJsMbksEjIX6vrgtzOfTs7bFfKGokpxNNPX384gl/o
 7fnpfPIZ5ieaIIDPRv6R9dsgMUNzG8Zjm5PNeuwHxrmSpY7/iA4fhLMC7bwxSXndrdOD
 Qkv54r/QdWEabP8L0CbGYuSQDgCOquIERNcTTC6hYKf8Z1ljT2dVmHioDMd+1CLbSCNZ
 0zJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Vn8QAsjO7gtbZVeE7QQx9COaGQRw61V/sT24VvnuPKo=;
 b=jx6W5AySf+l11tMOepBGOkoyeWX7a1CYts+cNp187BkE4y2CJEAAtKrH0LNSJl/QDp
 voskYxk7Jh11XkC+1KsoCAVju3DWF0WfWxCVG56CZL/xn0vWJ2sV8sGI+N8LScqnCXsf
 nXD6X0YpwmJ2+tBe6TKOU77cT5cj+1uyY+t9TWwxbEMc0XLIA2PhDuVMWvindPmvtA7u
 GtaIoV+6Y6TkgyGCARwF/wt0M4AHY0F7Iy+l+FddoHimzxlHgxnlyRtbdvCktZtJotZ0
 8AC/tg7ViMA0vDdAvoVyy2FbCOL/mITRtlhN6lmczVYFC+nItTk4bTSWmoj9V66CMR9b
 /Xjw==
X-Gm-Message-State: ACrzQf0qJ3igBx8dteRyPufbEOj7koV14PRxfamWEnPTHzAOkYNshhi7
 vOvCKQyMZRCmFTmIplYKvdwoZ5w4ESE/sRzy
X-Received: by 2002:a17:90a:b897:b0:213:d66b:4996 with SMTP id
 o23-20020a17090ab89700b00213d66b4996mr10007930pjr.3.1667264379112; 
 Mon, 31 Oct 2022 17:59:39 -0700 (PDT)
Received: from fedora.flets-east.jp ([2400:4050:c360:8200:8ae8:3c4:c0da:7419])
 by smtp.gmail.com with ESMTPSA id
 o9-20020aa79789000000b0056d98e359a5sm1875644pfp.165.2022.10.31.17.59.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 31 Oct 2022 17:59:38 -0700 (PDT)
From: Akihiko Odaki <akihiko.odaki@daynix.com>
To: 
Cc: qemu-devel@nongnu.org, qemu-block@nongnu.org, qemu-arm@nongnu.org,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>, John Snow <jsnow@redhat.com>,
 Dmitry Fleytman <dmitry.fleytman@gmail.com>,
 Jason Wang <jasowang@redhat.com>, Stefan Weil <sw@weilnetz.de>,
 Keith Busch <kbusch@kernel.org>, Klaus Jensen <its@irrelevant.dk>,
 Peter Maydell <peter.maydell@linaro.org>,
 Andrey Smirnov <andrew.smirnov@gmail.com>,
 Paul Burton <paulburton@kernel.org>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Yan Vugenfirer <yan@daynix.com>,
 Yuri Benditovich <yuri.benditovich@daynix.com>,
 Akihiko Odaki <akihiko.odaki@daynix.com>
Subject: [PATCH v7 06/17] eepro100: Omit errp for pci_add_capability
Date: Tue,  1 Nov 2022 09:58:48 +0900
Message-Id: <20221101005859.4198-7-akihiko.odaki@daynix.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221101005859.4198-1-akihiko.odaki@daynix.com>
References: <20221101005859.4198-1-akihiko.odaki@daynix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::102e;
 envelope-from=akihiko.odaki@daynix.com; helo=mail-pj1-x102e.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+peter.griffin=linaro.org+alex.bennee=linaro.org@nongnu.org
X-TUID: rs2L8iiLJhPA

Omitting errp for pci_add_capability() causes it to abort if
capabilities overlap. This behavior is appropriate here because all of
the capabilities set in this device are defined in the program and
their overlap should not happen unless there is a programming error.

Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
---
 hw/net/eepro100.c | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/hw/net/eepro100.c b/hw/net/eepro100.c
index 679f52f80f..bf2ecdded9 100644
--- a/hw/net/eepro100.c
+++ b/hw/net/eepro100.c
@@ -549,12 +549,7 @@ static void e100_pci_reset(EEPRO100State *s, Error **errp)
     if (info->power_management) {
         /* Power Management Capabilities */
         int cfg_offset = 0xdc;
-        int r = pci_add_capability(&s->dev, PCI_CAP_ID_PM,
-                                   cfg_offset, PCI_PM_SIZEOF,
-                                   errp);
-        if (r < 0) {
-            return;
-        }
+        pci_add_capability(&s->dev, PCI_CAP_ID_PM, cfg_offset, PCI_PM_SIZEOF);
 
         pci_set_word(pci_conf + cfg_offset + PCI_PM_PMC, 0x7e21);
 #if 0 /* TODO: replace dummy code for power management emulation. */
-- 
2.38.1

