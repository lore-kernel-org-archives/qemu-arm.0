Received: by 2002:a19:f807:0:0:0:0:0 with SMTP id a7csp487941lff;
        Wed, 16 Jun 2021 09:15:12 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxCNZGnVcAnpZ0vcUTQGN08DIB/erzgUd4Ulwn9Tfd+oJEQX97SyLhUOMATHZeUONZP2vIq
X-Received: by 2002:a17:906:2306:: with SMTP id l6mr310828eja.362.1623860112058;
        Wed, 16 Jun 2021 09:15:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1623860112; cv=none;
        d=google.com; s=arc-20160816;
        b=T5VaPVPUS8KGQo2epjfKyTC4VGXr1IPlXhZm3mFO38kkdyKBGfL1aNjwBgR8djQVjC
         4NEhmv6CkRL8Zr6RZl+B9mIDZw3JYhDfmMpT4PSgXvQJ3jBkS3so3vgCstUUiMNDw6mW
         BAnX2Puu313LmH8r/7SJNbJ5liOq3kQ+5dWBNVA/4ahmBaKDqHTQdNe60lbmfn3GUfN5
         pVwb2aFiSLuav6EJ0RGUGJP8LvKO0L4f6QePMtaM44+gUa+MPYnuYQDrtLhW7LKJOMb4
         rqrnhONpTjW3Ct1grYPZ7PqoLS3p3j7FukiJZjrkx98zAEcAHc9p+hpIpxJj6kVPdOFI
         FibA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=13TAtltxyz3HRLnsPYZNhrV/l1rMyq15Cuna6JS4ElM=;
        b=nF0vupgLZkOp7atDthHO5K/tRXb+F8Xb5RTcC/MCSMBJYr3w2iZAJAafsqBwuzMRra
         myKHJQrJi0zYjpY+5ar1tvkuFKA377x0ASt19JSgQNhJ7S+w6Xga/4G+rNP9tzKS/IYq
         uzFKItkVgR/Q1E43RlVLmNgj+bSDv9lLjUHX+3AXxpYBkFZbwYAyo1Q9MPB0pwxOS5BY
         W6v02F+Tj6syfTkS/iXDCWANJBEHlmG1Yxgd7yokIE4GS04HZlAJO4le7t99Y0l5G9rj
         6ybiiPO5/U7stIgfzPqGEH+8YkB64KSoOAt3pv8Q7nTqxs19C4uR92YonJEDzXpbHIiV
         z62A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=C+N4rBgU;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id bq17si3017956ejb.145.2021.06.16.09.15.11
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 16 Jun 2021 09:15:12 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=C+N4rBgU;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Received: from localhost ([::1]:51226 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ltYC6-0002ot-4g
	for alex.bennee@linaro.org; Wed, 16 Jun 2021 12:15:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36562)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1ltYBf-000257-Sj; Wed, 16 Jun 2021 12:14:43 -0400
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b]:45860)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1ltYBe-0005rL-BR; Wed, 16 Jun 2021 12:14:43 -0400
Received: by mail-wr1-x42b.google.com with SMTP id z8so3298183wrp.12;
 Wed, 16 Jun 2021 09:14:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=13TAtltxyz3HRLnsPYZNhrV/l1rMyq15Cuna6JS4ElM=;
 b=C+N4rBgUIQjK42/iEPG4IUufNCAfzXzl30XI1Dq3ehDFkcSLW5OWbkfL6nfgXltve/
 8sl5hmL3Sod+KOj6fFgHqnJ6Z12XDdqqA6tqivZenWO9oFMrI75pHcIBVSs+m/pqFnO0
 /bCvsqU5073FJmregNgrbg3OPaDdGMISWXN6bjIqb9gwuftk+mQwOqWC6/6FPs07MtUc
 yqBj/GmGtKTU8dS6iEHUcWKaLl1agi3baf48xd6bWPtO9QJLTNf19dQw+KWn2t73yaT7
 UzTylIpICCB0+SGcwzQVk5dYIM++MbuyqXqpVDIgtT1nsijR5Zc/NeABezWaTUUO0ZGD
 ugCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=13TAtltxyz3HRLnsPYZNhrV/l1rMyq15Cuna6JS4ElM=;
 b=U5knwD/Wp1Wp+deSFF1lUXezfVt+J2fs6TUIWpXMPkX0tI64gpR5XBQAZOIgYLvqkS
 UYlGx9KoohgzGpm0uXy/UrJopNuDkHlDUgVjqmPPFREWo/N7XHS5Z8p0h3RP54XXjYVw
 jxhKEZqd4z4fE0eHjWi0uv38f7N77BZbPtfbMg0qTULC3YY5aLVTbQeB433Jqhne0k2u
 9LpQdbxJmEEykaKQ5AHJGZrFL6lxze7fA3AgUbNXjthfX4a7imSWxvPD2xQQhaK72P9h
 C2xApHx1cwCI4JZNSuSRdirODXNIMIo7gMyqX8JwRjILN/PL1YApFUtwk+mchQHW45xK
 xZ3Q==
X-Gm-Message-State: AOAM533ZdcA56pUBpSF+x0GmTgenKm05ccVzjemVGDJmnQ7vy46CR95u
 Loa7eMWKvXPWAGlvrgTP+6EUy7pt9A0agw==
X-Received: by 2002:a05:6000:1a87:: with SMTP id
 f7mr245553wry.172.1623860079959; 
 Wed, 16 Jun 2021 09:14:39 -0700 (PDT)
Received: from x1w.. (93.red-83-35-24.dynamicip.rima-tde.net. [83.35.24.93])
 by smtp.gmail.com with ESMTPSA id 89sm2627574wrq.14.2021.06.16.09.14.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Jun 2021 09:14:39 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 04/13] hw/display/sm501: Replace i2c_send_recv() by
 i2c_recv() & i2c_send()
Date: Wed, 16 Jun 2021 18:14:09 +0200
Message-Id: <20210616161418.2514095-5-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210616161418.2514095-1-f4bug@amsat.org>
References: <20210616161418.2514095-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42b.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Corey Minyard <cminyard@mvista.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 BALATON Zoltan <balaton@eik.bme.hu>,
 "Signed-off-by : Frederic Konrad" <frederic.konrad@adacore.com>,
 qemu-arm@nongnu.org, qemu-ppc@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: jh4vdl7IVEKV

Instead of using the confuse i2c_send_recv(), rewrite to directly
call i2c_recv() & i2c_send(), resulting in code easire to review.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/display/sm501.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/hw/display/sm501.c b/hw/display/sm501.c
index f276276f7f1..569661a0746 100644
--- a/hw/display/sm501.c
+++ b/hw/display/sm501.c
@@ -1033,17 +1033,18 @@ static void sm501_i2c_write(void *opaque, hwaddr addr, uint64_t value,
     case SM501_I2C_CONTROL:
         if (value & SM501_I2C_CONTROL_ENABLE) {
             if (value & SM501_I2C_CONTROL_START) {
+                bool is_recv = s->i2c_addr & 1;
                 int res = i2c_start_transfer(s->i2c_bus,
                                              s->i2c_addr >> 1,
-                                             s->i2c_addr & 1);
+                                             is_recv);
                 if (res) {
                     s->i2c_status |= SM501_I2C_STATUS_ERROR;
                 } else {
                     int i;
                     for (i = 0; i <= s->i2c_byte_count; i++) {
-                        res = i2c_send_recv(s->i2c_bus, &s->i2c_data[i],
-                                            !(s->i2c_addr & 1));
-                        if (res) {
+                        if (is_recv) {
+                            s->i2c_data[i] = i2c_recv(s->i2c_bus);
+                        } else if (i2c_send(s->i2c_bus, s->i2c_data[i]) < 0) {
                             s->i2c_status |= SM501_I2C_STATUS_ERROR;
                             return;
                         }
-- 
2.31.1

