Received: by 2002:a05:6512:204:0:0:0:0 with SMTP id a4csp288503lfo;
        Tue, 1 Mar 2022 16:23:57 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxONYOAG2jTbikVglURnLKWYIPJ4+8FQ5e1yGvo4VPxL2yzhUe6z9xAsltoGM0O/sVyZvt/
X-Received: by 2002:a81:1784:0:b0:2d6:b6cc:8f75 with SMTP id 126-20020a811784000000b002d6b6cc8f75mr28268281ywx.46.1646180636922;
        Tue, 01 Mar 2022 16:23:56 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1646180636; cv=none;
        d=google.com; s=arc-20160816;
        b=ODSGDDIh1+IdVYbqnNoOHIt/NOD/n11oykm9E9BKhbGooJ3EjDQwN3VX6XuLN+HHWP
         tumlR1uJ0eJhL1xHE3aOLSqbCykgL7rTdqjaay8+uCWm0kDbU72fb1N8AgwIGaF7r9RX
         ItDXpRwKX7G5P0lsE13zXC5fg96k43iO7ffzLjnFvJBdCJMRFnS7w3Ab24RbdCKv2ZPm
         owY/iY+tlMNfNo3B/u9WmHXqeg9gdBfGX3b6m7LA4dPZqNlTiLE2ZPqvLHwNcKNY78pF
         0V5A7zMWEDMf9vHHbDUEgiNSuFCUGJVMDXIjCZxozxNB7e5GEI//ybBYORAaBDeJlFdZ
         GQEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:from:subject:references
         :mime-version:message-id:in-reply-to:date:dkim-signature;
        bh=GlIJF2b8Drq45++1hxBTKoEZIPJ8E+QjOj/1FgeYUhM=;
        b=fqRcPy3QJ6VRAfN+PC2mLnG01Tcgp7Jp9CbsVASYLtjVOzy1yc6stTEpASJlmTqSMi
         FgqADEl8o20YL9y+nMb+yZMaV/ANX1gLzxwD2ykIL8zwTPlS3VSBu8Zoiltc3duYaJtA
         oXAnVqr85FnzV1KulMQzRSJvsrp5zfeflOu2qnF2kgZahoRjQL++86/hp+FIg2csGu1a
         1NbPNyviXjra64619fkWvZkUJfd6Grx/2Ej3rWyGb89icFuMO5nQ0vovc7lyxv1EmPx1
         QJMzdWxEBCx1qT84QA5Huiruuc3wBLy2mQTQly0cMa9yxzapohpjNc3wukEhUEQlW0gE
         xFaA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20210112 header.b=sn1nKXYa;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id bh25-20020a05690c039900b002db77a26f46si10175725ywb.59.2022.03.01.16.23.56
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 01 Mar 2022 16:23:56 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20210112 header.b=sn1nKXYa;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Received: from localhost ([::1]:41730 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nPCma-0008Kk-Av
	for alex.bennee@linaro.org; Tue, 01 Mar 2022 19:23:56 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36948)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3ALkeYgYKCgUynyzxwlttlqj.htrvjrz-ij0jqstslsz.twl@flex--titusr.bounces.google.com>)
 id 1nPCmD-0008Iu-6u
 for qemu-devel@nongnu.org; Tue, 01 Mar 2022 19:23:33 -0500
Received: from [2607:f8b0:4864:20::b49] (port=46638
 helo=mail-yb1-xb49.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3ALkeYgYKCgUynyzxwlttlqj.htrvjrz-ij0jqstslsz.twl@flex--titusr.bounces.google.com>)
 id 1nPCmA-000368-Un
 for qemu-devel@nongnu.org; Tue, 01 Mar 2022 19:23:32 -0500
Received: by mail-yb1-xb49.google.com with SMTP id
 11-20020a25030b000000b00628660166e7so4773ybd.13
 for <qemu-devel@nongnu.org>; Tue, 01 Mar 2022 16:23:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=date:in-reply-to:message-id:mime-version:references:subject:from:to
 :cc; bh=GlIJF2b8Drq45++1hxBTKoEZIPJ8E+QjOj/1FgeYUhM=;
 b=sn1nKXYaHzsRMxB1TWRuNZo3V+b3m3c5sqABtfOcwgHgmYMYoruKixCjWKdJ8MhvD1
 qflGtQbnXthz7Qv2A9r2uGrD/AhDTjFvxqRau02kv+vwD5wRiG+MCdGK1sVx7ZleH9Sn
 6qPn19pPXzBO7fOpG/VYKF580j95KYtA3Q+A/j6U3lZJ6/+9YtwWJ6oJ2yUtowEKLozv
 hzLYE1d5sj8tc2VSVhGB349cHVtgCl17V+PhJddZpE5yrYt+kC4Ay5m3h+UIGH2AI3tL
 s/6Ewbl96Cl2abf7nhuKcYupa/gw30W/nBPybfGcwEuMN/4k2sRLSKGYqTsl8ldpwX/B
 SyYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=GlIJF2b8Drq45++1hxBTKoEZIPJ8E+QjOj/1FgeYUhM=;
 b=uDmRI3ctwYocGGEA9ukpC01/AaRxy4XgM5zcbmhsi1YUGiLI/micwZdu//X9FcHme/
 gEkVbeolKTuQNXY0H1BGI+Ctz/vZsjntRuYwh8jH0AyVw8bwBb1bZuf9tLBNbwHrBcde
 Uvfa2p/1FYW27wAtoqNiU66qlPK6f+I5QRzuX2yIxD21wsZcDFRwAK2J7dJmniV4YRZF
 1HTrZhWN3M3UPAf6ma8HobaijsID/3SY1wZT7/2Ugbvcjb7A9R1LI/Uf1Pwb1f9K1s4m
 BmqCX6UuHAaPm3/nAIUgFoarSI8OLBtvFgaTVOP7Ov3ygJODznzl5Yn61Q2f/R29xDVp
 j7tA==
X-Gm-Message-State: AOAM532AGuT4XFiz6TpFQank94hREm8ffRJ3JfhtvNnsFUUJkLG//rfe
 6xQea0CQmK7pKiyTFWdKLjYkDDpP/Gg=
X-Received: from titusr.svl.corp.google.com
 ([2620:15c:2a3:201:3a0a:5449:c096:dc84])
 (user=titusr job=sendgmr) by 2002:a0d:cac2:0:b0:2db:fc7f:7dfa with SMTP id
 m185-20020a0dcac2000000b002dbfc7f7dfamr3562025ywd.362.1646180608119; Tue, 01
 Mar 2022 16:23:28 -0800 (PST)
Date: Tue,  1 Mar 2022 16:23:01 -0800
In-Reply-To: <20220302002307.1895616-1-titusr@google.com>
Message-Id: <20220302002307.1895616-4-titusr@google.com>
Mime-Version: 1.0
References: <20220302002307.1895616-1-titusr@google.com>
X-Mailer: git-send-email 2.35.1.616.g0bdcbb4464-goog
Subject: [PATCH v2 3/9] hw/i2c: pmbus: add PEC unsupported warning
From: Titus Rwantare <titusr@google.com>
To: Corey Minyard <minyard@acm.org>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, f4bug@amsat.org, 
 wuhaotsh@google.com, venture@google.com, Titus Rwantare <titusr@google.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::b49
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::b49;
 envelope-from=3ALkeYgYKCgUynyzxwlttlqj.htrvjrz-ij0jqstslsz.twl@flex--titusr.bounces.google.com;
 helo=mail-yb1-xb49.google.com
X-Spam_score_int: -81
X-Spam_score: -8.2
X-Spam_bar: --------
X-Spam_report: (-8.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01,
 USER_IN_DEF_DKIM_WL=-7.5 autolearn=no autolearn_force=no
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
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: E4/bjgx79+KU

Signed-off-by: Titus Rwantare <titusr@google.com>
---
 hw/i2c/pmbus_device.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/hw/i2c/pmbus_device.c b/hw/i2c/pmbus_device.c
index 93c746bab3..6eeb0731d7 100644
--- a/hw/i2c/pmbus_device.c
+++ b/hw/i2c/pmbus_device.c
@@ -307,6 +307,11 @@ static uint8_t pmbus_receive_byte(SMBusDevice *smd)
 
     case PMBUS_CAPABILITY:
         pmbus_send8(pmdev, pmdev->capability);
+        if (pmdev->capability & BIT(7)) {
+            qemu_log_mask(LOG_GUEST_ERROR,
+                          "%s: PEC is enabled but not yet supported.\n",
+                          __func__);
+        }
         break;
 
     case PMBUS_VOUT_MODE:                 /* R/W byte */
-- 
2.35.1.616.g0bdcbb4464-goog

