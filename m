Received: by 2002:a19:e8d:0:0:0:0:0 with SMTP id 135csp2071756lfo;
        Fri, 5 Feb 2021 06:45:18 -0800 (PST)
X-Google-Smtp-Source: ABdhPJz/AO46JbXKUgKVE42xiXbvTEk+teIjq6RO83EpXyPU5qEsgcmOBMmfmd/9UMKsKiBjNiPb
X-Received: by 2002:a25:af91:: with SMTP id g17mr6820794ybh.321.1612536318200;
        Fri, 05 Feb 2021 06:45:18 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1612536318; cv=none;
        d=google.com; s=arc-20160816;
        b=ZEwYf6IdPADpOZ3tFNPrpfFXOG/j73vj5Xjv2850mcsohLDHdLLCQPdTzH/KUD63rc
         VTXNHSthyHu1cIUABe5OSNGI3RqnUXwpG50KZnyjiA+PM1q7MEFflJ9w9csG23LOJqKR
         jx3lmj3aD0nr7/cYxECFny4s4zqt4PEKIC4s1+98O5zPusXhSw9BmZ78/m8LCGiOjn5E
         Yl1o9FP4Zixe75AMbLqBNeFtSfDo/f6721jVyTTKR/Dc/hauU96jkbfbg5IekbSJvIj5
         Q4yVgGYrCvOWkT9oZEwKBKTHVuzkyfKv6eDyX/TqDM4pbTcPPhdgx+Zw0B1nilid45hb
         BGhg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=dblZ2cMrQMLC69vQiQ7PjI15tp+Aw6tS1AsWq28yjKE=;
        b=G98ieSjzu9bGTPPqqJeCXvhzD4ufBdKZAlGx8DaFA82iWmfzPNyJNd+chCW7wbhlJy
         NdDfGaoJ49YgejVQZkqtnlMyPujVjkhdOoF7ESZPoPlM7aOBSSrZ56JLJapqfJMFNAry
         TPWl0YQagNgYF1xX4yX0/RqqAPq5xOsJqWEJkB+WcSi1XWBWnw3r8GlNBUbuN8U8M3oM
         agNIRJAqVVGVB9ya4+4brqmmdkIK5Lk28s1vM5uYEm4YYVsHpCM6hvNqRZ6sLVqnagD/
         BX0nUxSTzljeC6sGdQPCneNFuYtIMOoLP625fKyB7Pyb7MY8aJehbW0qpSCDJO1ER0kq
         eN0g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=bGc1ZUgV;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id k4si9512947ybp.93.2021.02.05.06.45.18
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 05 Feb 2021 06:45:18 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=bGc1ZUgV;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Received: from localhost ([::1]:52694 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1l82MH-0002tk-Eo
	for alex.bennee@linaro.org; Fri, 05 Feb 2021 09:45:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42582)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l82LC-0002gY-TR; Fri, 05 Feb 2021 09:44:12 -0500
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a]:33704)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l82L9-0002Ls-I4; Fri, 05 Feb 2021 09:44:08 -0500
Received: by mail-ej1-x62a.google.com with SMTP id sa23so12380597ejb.0;
 Fri, 05 Feb 2021 06:44:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=dblZ2cMrQMLC69vQiQ7PjI15tp+Aw6tS1AsWq28yjKE=;
 b=bGc1ZUgV/Nx9pGAJJXViDeubeLJ3KSyyySwPiOg1BcmYgeuNDgULMpXA2lFqCQOS+2
 dVofPa6szRxLCBGdumWJ2Hq0PqqT0FN1q4vuwoscidrgEsV2f/FbsPay+3W+PPTrN7mE
 QF7hjGJYJ+gas9Oh2k3oL2yzoysFyU6zXuRI5SlXwHkiVTNXo76aE+wjbEFkMyAeKuE/
 qLGRuoOtLaezzyOnrjmdja+hhb1yqoZpyA2VDbjU1m3oO1yugGKvDCwklLjPJhZSW0KC
 khv8YP2S1gLUff666R+h2xBYDBqJ0yi0u2VsrJMzHdEn3Us5Bfwm/T8zthZ0NHxXvZJp
 iwdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=dblZ2cMrQMLC69vQiQ7PjI15tp+Aw6tS1AsWq28yjKE=;
 b=YuLNj53hXxMRtWDuJ/LjihVOifVIzdeoXDA2gTI+7AVqA9HwhukOv/83a+luQxU+GW
 WemaLNbhDDTgZuoI4wZ5pRAMDBeYPecZOGJdT+24eMJz1+MLhvjlYduzTsrD1F89yCov
 MByy2NC34WwoSAnNI+WdfuSaykITd+xYCMNXxRUsrjJ7nPOW6srz2jULJ4OkMrQqQulG
 GlYHQrDPa4BsYlW5BL4zjdcOJ1Z3zTSP7CqeMry1gdtLnsIY9NaxWfSbinZ410rBgPrU
 XEZ/VwtYq+GiKk9ENvvAnvXFSOwPJulEjNhiQuaG1YTHGaiDgo0QMCfpIP6uWtS4yJeX
 OkXQ==
X-Gm-Message-State: AOAM533rbIlyBYBKR3t8AOxpC7jBtr9a3t6ickkN5qcn+/7xJ14gJaiH
 HI0APqMhtU/yYlP8hAAc9QY3wzibc3A=
X-Received: by 2002:a17:906:87c3:: with SMTP id
 zb3mr4373739ejb.244.1612536245246; 
 Fri, 05 Feb 2021 06:44:05 -0800 (PST)
Received: from x1w.redhat.com (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id g16sm3980102ejo.107.2021.02.05.06.44.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Feb 2021 06:44:04 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 3/9] tests/qtest/boot-serial-test: Test Virt machine with 'max'
Date: Fri,  5 Feb 2021 15:43:39 +0100
Message-Id: <20210205144345.2068758-4-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210205144345.2068758-1-f4bug@amsat.org>
References: <20210205144345.2068758-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62a;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ej1-x62a.google.com
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
Cc: Laurent Vivier <lvivier@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 qemu-block@nongnu.org, Andrew Jones <drjones@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 qemu-arm@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: jF6N7WDhgiuV

When using KVM, using a specific cpu type will only work if the
host CPU really is that exact CPU type.

During testing we can simply use the 'max' CPU which will select
all the features available from the host.

This allow running this test on a Cavium CN8890 (ThunderX cores).

Suggested-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 tests/qtest/boot-serial-test.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/qtest/boot-serial-test.c b/tests/qtest/boot-serial-test.c
index b6b1c23cd01..d74509b1c57 100644
--- a/tests/qtest/boot-serial-test.c
+++ b/tests/qtest/boot-serial-test.c
@@ -149,7 +149,7 @@ static testdef_t tests[] = {
     { "arm", "raspi2", "", "TT", sizeof(bios_raspi2), 0, bios_raspi2 },
     /* For hppa, force bios to output to serial by disabling graphics. */
     { "hppa", "hppa", "-vga none", "SeaBIOS wants SYSTEM HALT" },
-    { "aarch64", "virt", "-cpu cortex-a57", "TT", sizeof(kernel_aarch64),
+    { "aarch64", "virt", "-cpu max", "TT", sizeof(kernel_aarch64),
       kernel_aarch64 },
     { "arm", "microbit", "", "T", sizeof(kernel_nrf51), kernel_nrf51 },
 
-- 
2.26.2

