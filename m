Received: by 2002:a19:6d5:0:0:0:0:0 with SMTP id 204csp6644972lfg;
        Thu, 4 Mar 2021 14:47:21 -0800 (PST)
X-Google-Smtp-Source: ABdhPJw5gICLUqoHuUE0Hi+/lEY44B0wq4+En/9hSqQX0z9qCOUWmgmg4PiXKtJJ39Og2GH+LYhX
X-Received: by 2002:a05:6e02:216f:: with SMTP id s15mr6102480ilv.81.1614898041636;
        Thu, 04 Mar 2021 14:47:21 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1614898041; cv=none;
        d=google.com; s=arc-20160816;
        b=a8sazh5Ltjk/XlGrWp03RxVHPs4oTXuWqf8VarhdR2friz2ke3stfXSV4FwX4IcUKN
         QXBKZ/uyDkqz1bgEHJam/T+9u/omYFkrsy06w/oDLUee4safAlDAfklfSvO1wl4g0sLk
         biXKIFx2RjBf0g4QBv46HgweC/k5g5gBIEosYWuCWcMXfmON2i5PmM5cpgwKk3UhmgiV
         aJ8BeSwDhj/95vRRqusFLGHRXpujz1snBSzROh5NbkaS3uzKuQN9jiJ7j6a7+LnsmTGU
         6w1b4RO/6smKxFys1Bjb6dp81u88q8BIl5sArD5qq8sJPjcxXJhnNGY93B5XgM8AUYBx
         CCmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=sZzqDSzbsexD9Zh3aq/wd1p0b53KS/Yn8zf4kVHZSu8=;
        b=UgfiQdNXQT7oh1g7HgUGN53oSTkRff64qabln/z5MaV2ZG8uOc9x3LTH5CC+9beK/O
         sxoNlZuECxMTHwBCWYIRqNwssKqG03Fo/Zv4PmWqL/nPv9LNJslxGUuKkY2Cdf4IP8Jq
         lFbg7bQlEwb+6pgVIt4bJRl55dAHTnl+E6C2BvxoD0Virmk6V9mxz4z9DWhbuMFKUWPj
         nRkXuD7eqcc3kpwDtEQqFLpk2tP9BWzsf1xg6KZhh7YpPb1/XRdH4lQM+pvE1O5cTapz
         Gg+4pzoLhIILqHvDq1+fEIr8b5I6/qgIrGCIQkohzRXVffTIOFFAWvoBc6gBF3aI5gx/
         3FOw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=pZ6S1AEW;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g12si493546ilc.71.2021.03.04.14.47.21
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 04 Mar 2021 14:47:21 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=pZ6S1AEW;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Received: from localhost ([::1]:56652 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lHwka-0003oi-Uv
	for alex.bennee@linaro.org; Thu, 04 Mar 2021 17:47:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55524)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lHwNc-0006a2-8t; Thu, 04 Mar 2021 17:23:36 -0500
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435]:35121)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lHwNa-0002OB-PA; Thu, 04 Mar 2021 17:23:35 -0500
Received: by mail-wr1-x435.google.com with SMTP id l12so29379993wry.2;
 Thu, 04 Mar 2021 14:23:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=sZzqDSzbsexD9Zh3aq/wd1p0b53KS/Yn8zf4kVHZSu8=;
 b=pZ6S1AEWRk7U9b63+cejO+/j9dwOxzbhBvb/obwzh3d8QeY5JA7h7LT5i53dILRgqi
 BVTqFHfXSNGXLmcRGw5Hi6i4U6iU9W7CO7nOcC2ohPO1noOUzcj6PoSeQWb6g+gueQO7
 3g4z6jr4jKb28VZVuUILRZV7iEnGjGda05d8N89Ay+Cxp4KppuDempl3wlXk4tgZNvJ2
 zevCyH7Ny/uYfEK5PxTo4fJ3MQ9DuriYqWJ9yc3p+VQSFk+VfUBwdcTYNRwaPJxpzfd/
 LinY5lXzDUN5x7Vk/ejifGcZpYJZQK4k1sstoXZmSBmv+sfv0C7HsfjF2HsFSw8l0QQM
 GEFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=sZzqDSzbsexD9Zh3aq/wd1p0b53KS/Yn8zf4kVHZSu8=;
 b=O2CYgNKSFFOXrmD/wKNktX7WiUcAn+PONW6Z02u3x5ta8bsNmW+v03gtbCWahFCWHA
 HIL5ZhJjaXQ5yfbEUpVs0tuDTcAQGR6w09LIhh6YNydAwobnNArdgLlE72gmVB7/WLci
 KTV+9ZqB/Recy42phEDN3rHvyG7xpy722/Mk/CjJZOVnxbJGPDzug4nrMizAbZ/6thZb
 WNJfogNvxO9PkIBh/r9xoxmyXHWqSESR/b5tvaUdofR/HZ06zFFvnhim8jnpyG1g4YbJ
 R6NJiNsnFU3Mlpq8tjJSK64Rv93tFXp0fKxmAnMy18cZ5TCXRmDYn/5pQqA8FGswNYxP
 npVw==
X-Gm-Message-State: AOAM531HlUcW2SYNgU4PlDIC3fYHTX4Uq/87zccerETZkrSp8Eq60hhT
 4d40Qw1eC1dfNj9ltGslmwVcLME34+M=
X-Received: by 2002:adf:f889:: with SMTP id u9mr6073330wrp.180.1614896611296; 
 Thu, 04 Mar 2021 14:23:31 -0800 (PST)
Received: from localhost.localdomain (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id i26sm1289891wmb.18.2021.03.04.14.23.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Mar 2021 14:23:30 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH v2 1/8] sysemu/tcg: Restrict tcg_exec_init() to CONFIG_TCG
Date: Thu,  4 Mar 2021 23:23:16 +0100
Message-Id: <20210304222323.1954755-2-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210304222323.1954755-1-f4bug@amsat.org>
References: <20210304222323.1954755-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x435.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
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
 qemu-riscv@nongnu.org, Eduardo Habkost <ehabkost@redhat.com>,
 David Hildenbrand <david@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Cornelia Huck <cohuck@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>, Greg Kurz <groug@kaod.org>,
 qemu-s390x@nongnu.org, qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
 Claudio Fontana <cfontana@suse.de>, Paolo Bonzini <pbonzini@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: YYpAGia1qdxw

Invert the #ifdef'ry to easily restrict tcg_exec_init() declaration
to CONFIG_TCG.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 include/sysemu/tcg.h | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/include/sysemu/tcg.h b/include/sysemu/tcg.h
index 00349fb18a7..fddde2b6b9a 100644
--- a/include/sysemu/tcg.h
+++ b/include/sysemu/tcg.h
@@ -8,13 +8,15 @@
 #ifndef SYSEMU_TCG_H
 #define SYSEMU_TCG_H
 
+#ifndef CONFIG_TCG
+#define tcg_enabled() 0
+#else
+
 void tcg_exec_init(unsigned long tb_size, int splitwx);
 
-#ifdef CONFIG_TCG
 extern bool tcg_allowed;
 #define tcg_enabled() (tcg_allowed)
-#else
-#define tcg_enabled() 0
-#endif
+
+#endif /* CONFIG_TCG */
 
 #endif
-- 
2.26.2

