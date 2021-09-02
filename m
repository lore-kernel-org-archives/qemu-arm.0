Received: by 2002:a19:5205:0:0:0:0:0 with SMTP id m5csp370507lfb;
        Thu, 2 Sep 2021 08:23:28 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz/1L74ZHKhPO8Or47VDXzvac79PppvejM11lGILG2nNB0X6mvVTJWJ3yFBoUzrnzdXoqz+
X-Received: by 2002:a05:6000:128d:: with SMTP id f13mr4730501wrx.244.1630596208173;
        Thu, 02 Sep 2021 08:23:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1630596208; cv=none;
        d=google.com; s=arc-20160816;
        b=C57EL4rcysjPvLccXR3T6PhrNnkk/qiWoptcz2jeMaY28eKyxUm+H2fXv32qmo83Hs
         jHMpPiKaUzNWblQ8Klc3KS/IklsWd5OnICMbidG8dadRBhQPSlZ3IC9+trr0oZJ8Gxev
         85ddtvfsK6PDP0hOT4q2joWDVb9Ch71wakphrquCHw4EtOvTif66Kucg9qPEpip8z2lD
         VZYkN5054Bpz6CShWKQKzzwQg2ICrYBY6pH31laVWC7gYQYf0hpBzA4y8xBhWQ/AW+8n
         ni8hdCOkX5lHou67v/JBl1O6uhqAWVt7cEW98QucUAiYDuRY6j8/gSc3Jp7a79RE3arp
         5GMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=CsKFO6zpXeyiIJnaYsonUL0fU8Qtt9qHYNbRlJRsUy0=;
        b=xsMWZnag7Tq7/CvKSFpYDUIjpWdVfbWIAl8j+TMmGwgsBlwyxjq4OVrNRKbC47G7Pm
         /nbcvllfJtm8/Srd0uPjA1M8aSP6VO2ed+Zm7+xo038E/BZoTHKfem2e0IzPXmzVbKxJ
         pMk3dUw0bT9eFSGtg246W99zQyJzvuHU2dLA1vN31DesHHpkuLPb02leif+3PY6RDcLZ
         yBZ8cmfC3+cgDaIx649xoskPQyAPyTsVMR3WqLjK4195q5933yUAWXrmgSYgJmEGJbWm
         P9dEC43VmILqUtNklI33w7t5eVH9T524y1ghs1CCsyMR1AB0wxOdZ9Z3JNjEvfHx1Y8k
         qtsQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20210112 header.b=msgoovyF;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g5si2107269wrv.238.2021.09.02.08.23.28
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 02 Sep 2021 08:23:28 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20210112 header.b=msgoovyF;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:40016 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mLoYp-0004ad-95
	for alex.bennee@linaro.org; Thu, 02 Sep 2021 11:23:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47018)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mLoTC-0003lL-5t; Thu, 02 Sep 2021 11:17:40 -0400
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b]:38794)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mLoTA-0001un-KW; Thu, 02 Sep 2021 11:17:37 -0400
Received: by mail-wm1-x32b.google.com with SMTP id
 k5-20020a05600c1c8500b002f76c42214bso1723300wms.3; 
 Thu, 02 Sep 2021 08:17:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=CsKFO6zpXeyiIJnaYsonUL0fU8Qtt9qHYNbRlJRsUy0=;
 b=msgoovyFZuYTFvHAVUWUcCjWeKOKX4/fQ6x5iV8uVuCuT5rENjJGT7Fi8gKdKImTio
 DTpGFYCfw4rll3/rw28+7h/IaCPuko7zVIUcFE0tQsdNOZfJ2wQjzKdS4Xfx4UTWbO+7
 DGFf/PpopUkXuymVg6YWsO6N3YLJF8uh4vvV+trJgaEzbQGXX/gyiLlggAPNmBngw2tl
 YLsB/DFcIgycuwYBpuMl9JRZ+k8EZ/6TW42fGwY+XJMvHn4lwe3XKDAaHmIJVqNMN/Bp
 gAtfXhq/PaIsaRo4z+o2UGnxJeRORTSUr5BKUhFZufBsIeEFGjPyToZ1JIVE+fuT37wj
 LDBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=CsKFO6zpXeyiIJnaYsonUL0fU8Qtt9qHYNbRlJRsUy0=;
 b=AbumzIhjwNmSdAulMKZQB/HEwAfJnoFQZoNGb6J7j4TYxbmExGPeo7PSLGOcE14+Hz
 nopMgsi4eMMeUDCr+VGVabR1yyLfOQTJc0EeJD4yv8JVkeaFQJ2sUd8i4tbmazbkBMjZ
 AqUkQ43abcwAYUiek3KO/3TKDzBtPKYiYWV50Ed4fPt5EaU1tuvSRCRG1qO2WlLoIP9Z
 8dEmb1HxC68ymI03H5HznmCTSEimarSXf+AcbjAJYy/hMSLdpAzOmZxv6jXDHfNocoEu
 AtieYpzKV6IPuhepqDOKWOmf00gS1XGcdkVcocZ9TkYc7H3hEcuN2MK20tWMzjgsb8TW
 PUPw==
X-Gm-Message-State: AOAM531hnJesAJ+pguc5ZKNHlMTNXe/HSGXtw7/folrLpcYxGpRaj7Vr
 jBTBTbodcrNN7cx5RbWGSlrh5MJ2644=
X-Received: by 2002:a1c:f709:: with SMTP id v9mr3768889wmh.124.1630595854067; 
 Thu, 02 Sep 2021 08:17:34 -0700 (PDT)
Received: from x1w.. (163.red-83-52-55.dynamicip.rima-tde.net. [83.52.55.163])
 by smtp.gmail.com with ESMTPSA id
 y23sm2023304wmq.30.2021.09.02.08.17.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Sep 2021 08:17:33 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 03/24] target/i386: Simplify TARGET_X86_64 #ifdef'ry
Date: Thu,  2 Sep 2021 17:16:54 +0200
Message-Id: <20210902151715.383678-4-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210902151715.383678-1-f4bug@amsat.org>
References: <20210902151715.383678-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32b.google.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Bin Meng <bin.meng@windriver.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Max Filippov <jcmvbkbc@gmail.com>, Alistair Francis <alistair.francis@wdc.com>,
 Warner Losh <imp@bsdimp.com>, Marek Vasut <marex@denx.de>,
 Yoshinori Sato <ysato@users.sourceforge.jp>, qemu-ppc@nongnu.org,
 Artyom Tarasenko <atar4qemu@gmail.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Kyle Evans <kevans@freebsd.org>,
 Richard Henderson <richard.henderson@linaro.org>, Greg Kurz <groug@kaod.org>,
 qemu-arm@nongnu.org, Michael Rolnik <mrolnik@gmail.com>,
 Stafford Horne <shorne@gmail.com>, David Gibson <david@gibson.dropbear.id.au>,
 qemu-riscv@nongnu.org, Chris Wulff <crwulff@gmail.com>,
 Laurent Vivier <laurent@vivier.eu>, Palmer Dabbelt <palmer@dabbelt.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: EjAChY6jGHvX

Merge two TARGET_X86_64 consecutive blocks.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/i386/tcg/seg_helper.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/target/i386/tcg/seg_helper.c b/target/i386/tcg/seg_helper.c
index 3ed20ca31d7..dee7bef68c6 100644
--- a/target/i386/tcg/seg_helper.c
+++ b/target/i386/tcg/seg_helper.c
@@ -929,9 +929,7 @@ static void do_interrupt64(CPUX86State *env, int intno, int is_int,
                    e2);
     env->eip = offset;
 }
-#endif
 
-#ifdef TARGET_X86_64
 void helper_sysret(CPUX86State *env, int dflag)
 {
     int cpl, selector;
@@ -984,7 +982,7 @@ void helper_sysret(CPUX86State *env, int dflag)
                                DESC_W_MASK | DESC_A_MASK);
     }
 }
-#endif
+#endif /* TARGET_X86_64 */
 
 /* real mode interrupt */
 static void do_interrupt_real(CPUX86State *env, int intno, int is_int,
-- 
2.31.1

