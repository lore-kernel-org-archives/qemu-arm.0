Received: by 2002:a19:e8d:0:0:0:0:0 with SMTP id 135csp2073526lfo;
        Fri, 5 Feb 2021 06:47:50 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzLbagS/fOyR9cE8JZxfMdqMxTDm/4IZJkSr3p51vuysnYjqurvrTlbel3UPuR39XgSZyhF
X-Received: by 2002:a25:c407:: with SMTP id u7mr6468284ybf.449.1612536469900;
        Fri, 05 Feb 2021 06:47:49 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1612536469; cv=none;
        d=google.com; s=arc-20160816;
        b=qnywkZ957xgc2Kde6/UoSNcHS9K9+RUpOqivYy3Jh7RfcbZfqnl3ZP2R23aQyEuOgA
         U0ioZvvIMtkT64HtzybbuRhcteJ6P70tT39mJQmR532cwkgsu3uGMnaBtsF8Ve+DXoj7
         u3HEd7X695FKE2wbff4AEVUouU1t0N+2xnYL2tS4fnqcOID/qap1mQNKc5qysFcI2J+6
         Hk1ZS8LcCVLwf0l9KmrswCDP6FuaL/Pa/J+q4PSX5Aa4+vPH4pblzuiM6pE2T2hcOmHs
         c3vveWpIZOpm3F1yG1LX5+9JrVY2Dqxr3wJPtEYrcriZ+sj2qEhJ6gsn3Oa6zoyDabVJ
         gOiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=n4AsHtVAI1SCDx8GcpPjZC1lYBQeAHaYRSZgH2aSe7Y=;
        b=rLwaKSD8dnS+MONVttzrVFcH03bW+QV+ps/NCeNUxPJwUBfJnXk5UIcmUD1j+D/pzP
         fYLIyfI+E9r9VHBvVATxCF0V3EJJ8WeKCkhQ6vu10vSDvot1vilwolyyli4KxYGFiYrF
         Jmb4etpG8m8epfpiBfzu5A6lLgKZjXCpC0yySh31LywxlOZzCc4UH0uUM/Z0Zx26oNmM
         wKeXW/EU6TFhaUwvFxox+jq0ygpMoT/JTccOP5h9yUWVMdeR7tp2oDC5XEVg5EYanIZQ
         edwpj1xfMZWFTT46S3H9UHBy8H04ihL0JLHWZIJ1W1IASTs5c6g9KJ7sEbORU2JF9rq2
         p03w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=uosYDztW;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v9si8750367ybs.141.2021.02.05.06.47.49
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 05 Feb 2021 06:47:49 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=uosYDztW;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Received: from localhost ([::1]:33100 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1l82Oj-0006ZZ-98
	for alex.bennee@linaro.org; Fri, 05 Feb 2021 09:47:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42676)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l82LW-0002jc-Tl; Fri, 05 Feb 2021 09:44:30 -0500
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c]:40455)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l82LV-0002VU-Hx; Fri, 05 Feb 2021 09:44:30 -0500
Received: by mail-ed1-x52c.google.com with SMTP id s3so9057508edi.7;
 Fri, 05 Feb 2021 06:44:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=n4AsHtVAI1SCDx8GcpPjZC1lYBQeAHaYRSZgH2aSe7Y=;
 b=uosYDztWZMrtk/y00Iyq/Hxlks93zFumpoGxWBYAzBEM6/WkyftCLoxUXRCue3eHJa
 a1pOFbjZMZ0M5bd2kLjDmy1i6nBkMNY8EimwUxS39SgwWeI06MCC0hNILDu32Y8D/Lcl
 md+ZrfxIvEJDHY98mm8vfpL2brtQihDM5ZKzAP6Cnl6NUtUPQF2tmDWClCtJjoAoHZIr
 jRF4UM8kLXY9WhfB04eLFUdOtlOzJuAd6s4YmgNm7f52R0GGjcYWun48+ooY+f13RU5X
 S8ZgMfdh/rvLe8uj8NFgB/OGE9n9gPRQY/7JlapUd9VUxbzWvoGk5QEgUC4TDXzUTpwl
 CZOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=n4AsHtVAI1SCDx8GcpPjZC1lYBQeAHaYRSZgH2aSe7Y=;
 b=mWz3iKgtoHc1Qg6TW45enaG/FyXcFA/p2afhzF9kiI+CriLQEPlbTYzo5lFiqJqY5d
 GEun3azsecmUlvSvB7lxHsgVaSGku1xId6wa3eJn3tpt8IvmR5CRUoZwkaXRwIKU+QDm
 SPbAw1f51khI8RbrCa9p8Dz831lOkc32lSDVQPp+FMtBM/75rsQU1OXv5hxHvn5QK0P9
 zSJ5IPQj7vjbHbcjtg3ZJIQ69CAMQerVJ8yfEwuPGGdPJgFAKQuetZuwb/ApqPNIm5XQ
 hCVKB6HSH4GrKSN4HysyYfsHx857w6Pp1KU86Ps190TSzEU011eXtDvZwfGRmgm39ZvE
 78mQ==
X-Gm-Message-State: AOAM5320yj+AQ2x14AX6+6Sm2tqAmWKfVhSnbCbhvZtdh3yK5/bJwHVI
 GirerJP+FcUpldbuXeyYUmVzWoJ4Bmw=
X-Received: by 2002:aa7:dbd4:: with SMTP id v20mr3969931edt.330.1612536267480; 
 Fri, 05 Feb 2021 06:44:27 -0800 (PST)
Received: from x1w.redhat.com (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id a15sm4069257edy.86.2021.02.05.06.44.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Feb 2021 06:44:26 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 7/9] hw/arm/virt: Do not include 64-bit CPUs in 32-bit build
Date: Fri,  5 Feb 2021 15:43:43 +0100
Message-Id: <20210205144345.2068758-8-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210205144345.2068758-1-f4bug@amsat.org>
References: <20210205144345.2068758-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52c;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ed1-x52c.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
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
Cc: Laurent Vivier <lvivier@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 qemu-block@nongnu.org, Andrew Jones <drjones@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 qemu-arm@nongnu.org, Alistair Francis <alistair.francis@wdc.com>,
 Paolo Bonzini <pbonzini@redhat.com>, John Snow <jsnow@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 7BlwInuE8QbI

Similarly to commit 210f47840dd, remove 64-bit CPUs (which have
never been available on 32-bit build, see commit d14d42f19bf),
to fix:

  $ make check-qtest-arm
  ...
  Running test qtest-arm/device-introspect-test
  missing object type 'cortex-a53-arm-cpu'
  Broken pipe
  ../tests/qtest/libqtest.c:181: kill_qemu() detected QEMU death from signal 6 (Aborted) (core dumped)
  ERROR qtest-arm/device-introspect-test - too few tests run (expected 6, got 5)

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/arm/virt.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 6ffe091804f..f5e4a6ec914 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -199,9 +199,11 @@ static const int a15irqmap[] = {
 static const char *valid_cpus[] = {
     ARM_CPU_TYPE_NAME("cortex-a7"),
     ARM_CPU_TYPE_NAME("cortex-a15"),
+#ifdef TARGET_AARCH64
     ARM_CPU_TYPE_NAME("cortex-a53"),
     ARM_CPU_TYPE_NAME("cortex-a57"),
     ARM_CPU_TYPE_NAME("cortex-a72"),
+#endif /* TARGET_AARCH64 */
     ARM_CPU_TYPE_NAME("host"),
     ARM_CPU_TYPE_NAME("max"),
 };
-- 
2.26.2

