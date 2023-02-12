Received: by 2002:a17:906:dac7:b0:886:babc:7eeb with SMTP id xi7csp3596307ejb;
        Sun, 12 Feb 2023 04:44:38 -0800 (PST)
X-Google-Smtp-Source: AK7set/tA5W42RBDhCosVMUGLI2cJIrB6F9GCPEhnYPmLwV0ap5gL8tW3nE2KFWizrY23YwS5Zvc
X-Received: by 2002:a05:622a:38a:b0:3b8:6c8e:4f8d with SMTP id j10-20020a05622a038a00b003b86c8e4f8dmr36492318qtx.68.1676205877967;
        Sun, 12 Feb 2023 04:44:37 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1676205877; cv=none;
        d=google.com; s=arc-20160816;
        b=d3kBmLISikJr+m8QYcneFXyg759B2Xv77dbflkr3M+ccOrz9Yxy4sB+VH4F/9kTb8r
         UM1TgUqePr/dUqAI+500nGfGl6NcbnDcGsQnNpExYHEcDf74Z6lsA7Sum0T/9fo1s6Gn
         o547Slh0xwNGXZe4nF0qP1mXQ2P56mcG36v9tN1pR2fuRjMglxvotLRpHcr8EimO1yYC
         j3Osy490kP/G4efVCchv2ShNYxIsEL4DnVYZIoZJBt4uzwoGZ56K4TopT/VOUEHheNCL
         rGF7EkGdxQBho+gzKRxg+/oOOTS+HIcKrFDubIorHyNU75MAJ6Pr1HSMvDhSDnzeolPh
         LK5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=/j8p811dCX2MeaBfxUSGJVJDygiSFMR5etcG3kuUOTI=;
        b=D3eIFyCLfbgNESe4MHlpZ6JBzV5boB4WsHkLXeLIRJYcMf3TZFQJmy887H4d+ltWNn
         ggjh+GzzJoqLPjZ24r9OaTaqhnaE+U4NFkBOi5f3MeYCVb4ZvPU1OZcdjwp8Hr19EnnL
         wrH0fpivoxzLXVBv6kvlQMOH0paypTmcHVTeNxaOTQcwh4J7n1siTgZU3btSfzGu4JeD
         XSgTqDLFocsyBVGbSyZRka0lJ0SjjgPjkxMdwlh5PlQMtmFuP12XV6i/IMGC4XVysZBM
         1gcxq5nCZxz69v6mVmJIT/LaodU830OfG28NnQJFiUUkW3/eHB8ksETTt0ZlSsiQR7wB
         znJA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20210112 header.b=XWOGnC1x;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d19-20020ac86153000000b003b86bbedceasi6479816qtm.400.2023.02.12.04.44.37
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 12 Feb 2023 04:44:37 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20210112 header.b=XWOGnC1x;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pRBgj-0003UW-9t; Sun, 12 Feb 2023 07:42:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1pRBdH-0007gk-FL; Sun, 12 Feb 2023 07:39:06 -0500
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1pRBdE-0001O3-D8; Sun, 12 Feb 2023 07:39:02 -0500
Received: by mail-ej1-x62b.google.com with SMTP id p26so25803310ejx.13;
 Sun, 12 Feb 2023 04:38:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/j8p811dCX2MeaBfxUSGJVJDygiSFMR5etcG3kuUOTI=;
 b=XWOGnC1xIm0TBfe4CEdVaNkdi4dALkRpqwdJDRAgcI7zEMfazgmOKAkgvw5ehb1hUC
 ppK8aN3fDM1HWGXYxuFx0PW/XKy7k8v4ImdDRfm0RrOjacKNNjlMQ4sRH1K/1S0i3enJ
 Ix3oqZJFndUMz5fxdkFi5jcr6xonFlKtQbW209UO5DlEMvfZH9155DRZqRs5Cv7DM+kE
 yvZWo0ELILVQ+wibEZqLzULyygpQ1N0dNLE6gnBZq1DVHLKC5Q1jhpAFvbo3kOXkd9KM
 ly2A0LuLLNSGo9rnD6LNuprMAu/5PyQ+VJ2s0KhQAl1hav7mA3Zlb1hN1gR34Ai/dvKc
 3HeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=/j8p811dCX2MeaBfxUSGJVJDygiSFMR5etcG3kuUOTI=;
 b=JSBKiOU3kst4+C7ODXOAGF8QJcyn81RmwXpLcF88kC3bHVU8ADC6UnE1J2qq53XVSm
 VdOPgnkv9/OplLNo8Pg9/+9W6xcQUaC12OMSRkl+ghg+KIiWocUc9BzGGjMq4B3wFxSX
 WrzYCWn6EA/9yqOLdmuZLiQllPkGd9Dcsp1dHmAcmAdtuT2MO5SrPCWt9Mr4mA36ZO3G
 xDZbepvEYYPd4Ktezs41XLsB8nvoKCbwGsbDdGiocvPPb/XS3bkxJzvo0iI5iuXDuJau
 27PtPaBdaSs+4624Rp/pf/3KUsmv3C546oZFHe6Rq/YkCYlNFaNFIAAS3nTEo7ix3sB3
 I4Yg==
X-Gm-Message-State: AO0yUKUTBsFINa6JIsDPA/u3ep075xBbF3qZKUyfiJvEsuhy+OL+G/Ma
 ReDuryetsNjLC0ft2+odfFajYqRB7Cw=
X-Received: by 2002:a17:906:2ed4:b0:888:a32d:b50 with SMTP id
 s20-20020a1709062ed400b00888a32d0b50mr21152187eji.40.1676205537919; 
 Sun, 12 Feb 2023 04:38:57 -0800 (PST)
Received: from localhost.localdomain
 (dynamic-077-011-172-153.77.11.pool.telefonica.de. [77.11.172.153])
 by smtp.gmail.com with ESMTPSA id
 qw14-20020a170906fcae00b008af1f1bee79sm5233164ejb.9.2023.02.12.04.38.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 12 Feb 2023 04:38:57 -0800 (PST)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 qemu-arm@nongnu.org, Elena Ufimtseva <elena.ufimtseva@oracle.com>,
 qemu-block@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Gerd Hoffmann <kraxel@redhat.com>, Ani Sinha <ani@anisinha.ca>,
 John Snow <jsnow@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Aurelien Jarno <aurelien@aurel32.net>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Jagannathan Raman <jag.raman@oracle.com>, qemu-ppc@nongnu.org,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Igor Mammedov <imammedo@redhat.com>,
 John G Johnson <john.g.johnson@oracle.com>,
 Bernhard Beschow <shentey@gmail.com>
Subject: [PATCH v7 14/23] hw/isa/piix4: Remove unused inbound ISA interrupt
 lines
Date: Sun, 12 Feb 2023 13:37:56 +0100
Message-Id: <20230212123805.30799-15-shentey@gmail.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230212123805.30799-1-shentey@gmail.com>
References: <20230212123805.30799-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62b;
 envelope-from=shentey@gmail.com; helo=mail-ej1-x62b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: HcrwVWakW/gy

The Malta board, which is the only user of PIIX4, doesn't connect to the
exported interrupt lines. PIIX3 doesn't expose such interrupt lines
either, so remove them for PIIX4 for simplicity and consistency.

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Message-Id: <20221022150508.26830-32-shentey@gmail.com>
---
 hw/isa/piix4.c | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/hw/isa/piix4.c b/hw/isa/piix4.c
index de4133f573..9edaa5de3e 100644
--- a/hw/isa/piix4.c
+++ b/hw/isa/piix4.c
@@ -155,12 +155,6 @@ static void piix4_request_i8259_irq(void *opaque, int irq, int level)
     qemu_set_irq(s->cpu_intr, level);
 }
 
-static void piix4_set_i8259_irq(void *opaque, int irq, int level)
-{
-    PIIX4State *s = opaque;
-    qemu_set_irq(s->isa[irq], level);
-}
-
 static void piix4_rcr_write(void *opaque, hwaddr addr, uint64_t val,
                             unsigned int len)
 {
@@ -204,8 +198,6 @@ static void piix4_realize(PCIDevice *dev, Error **errp)
         return;
     }
 
-    qdev_init_gpio_in_named(DEVICE(dev), piix4_set_i8259_irq,
-                            "isa", ISA_NUM_IRQS);
     qdev_init_gpio_out_named(DEVICE(dev), &s->cpu_intr,
                              "intr", 1);
 
-- 
2.39.1

