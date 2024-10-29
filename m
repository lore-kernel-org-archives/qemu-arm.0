Received: by 2002:a17:504:82cc:b0:1be9:327d:8ee3 with SMTP id m12csp540066njj;
        Tue, 29 Oct 2024 14:00:28 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXlHmoQE+TRu2bPuCM6QPpwzWZA53YTGeZeq2QAbrPNlpg7piqmWnryGpZqmtV/vF9WtDbrNi82q1VRxw==@linaro.org
X-Google-Smtp-Source: AGHT+IGCQFgEnZJ0Uy7dU05dwz1Fz4LimT8xgjGJejM2lo/xnV4RZPd8dkUTz3nxyS2YcoZCJBIh
X-Received: by 2002:a05:6808:1145:b0:3e6:3177:ef6e with SMTP id 5614622812f47-3e6382536a7mr12719851b6e.20.1730235628451;
        Tue, 29 Oct 2024 14:00:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1730235628; cv=none;
        d=google.com; s=arc-20240605;
        b=C6kqb7MqatpM0cGJcuwqbWW9DiDVFvzr2Y7Pz5wJ1My1WuVY9dSe/5ev3W2wBOvVP5
         HmgS1JsULly2GOGVJnXDjv/uMRSyMz07zXXWCkhntpverV+2X9rT9uETTNXvXkLC1JST
         2Xbdf+k0UjZX6RHMpvVbAmRQBs57UKI/fKLVp8UkxkMa8bLibFY6JC4lXQcz1tx8jAyn
         CUAJQEfnlqji/fLKFXjTIIOogaKgdmbQwBjx7/wCQMjxim31kyCvbUvKL9Sk233KU91h
         3lnC6xxgTz2rYrqy9QHr6aUo1Y3zUxWczKxgH6yWW7WHvKJ6H3blM9KkarMueW33LpOa
         ATOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=23OYmcrkpvVc4skxTX7T4buHyTsiI8wjKuoiUnpnRTs=;
        fh=X/cEeG0IecOcbktZzhggOUgW8rnsW2Y9KQE40BZHOoA=;
        b=IpsxQ2WSJ65cOHX+BZKKdPUv0GYJ8Lrr0IHeYoysoiSVMvvqZL5XcDdxR1gSVQ92V3
         GCadf2BHxa1ZFxvbHjSXvS9dwLdCkJb4tifFyR6JUcd5iGmG1JfGy0n7dJ5rV9RU1Tms
         /VvJTEbWVreXnfDO1GiwYxvODYvdIIkj8zYYaSuuuwbnhO5UzcH6WYTfsE+Qt5A5NOyY
         4678yHUqc5NBAPNA0z08DY6mBx7LnFNgQoLFuf5mb4AHAB8kVyfuxi72CqotKGRPg6Ha
         SLlXxYEn1qw98QKHaf1zAdFtxa2/WDdwM3ItvWalZ0PEHEi1UMzy6vT+JdpGc8wuxIhb
         ERlQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@philjordan-eu.20230601.gappssmtp.com header.s=20230601 header.b=uC1Xbhyv;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6d179a129cesi117792876d6.218.2024.10.29.14.00.28
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 29 Oct 2024 14:00:28 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@philjordan-eu.20230601.gappssmtp.com header.s=20230601 header.b=uC1Xbhyv;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1t5tIp-0003gD-Lr; Tue, 29 Oct 2024 16:58:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <phil@philjordan.eu>)
 id 1t5tIm-0003cu-7x
 for qemu-devel@nongnu.org; Tue, 29 Oct 2024 16:58:56 -0400
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <phil@philjordan.eu>)
 id 1t5tIh-0005Xw-Cf
 for qemu-devel@nongnu.org; Tue, 29 Oct 2024 16:58:55 -0400
Received: by mail-ej1-x631.google.com with SMTP id
 a640c23a62f3a-a99fa009adcso400846566b.0
 for <qemu-devel@nongnu.org>; Tue, 29 Oct 2024 13:58:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=philjordan-eu.20230601.gappssmtp.com; s=20230601; t=1730235530; x=1730840330;
 darn=nongnu.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=23OYmcrkpvVc4skxTX7T4buHyTsiI8wjKuoiUnpnRTs=;
 b=uC1XbhyvfIzO5HYJCO5ejTItFI7+UqChVhdipBsjvcssRAKCI8QWa0HcqQ6nv8v4yT
 aow6A59lZJAgkfta08Sv7Q1C7ZEReaEUQ8+hmN6hn1knukRMZH5TCeEcGuuAwpHlwd7R
 r2FrqhdN6cB/CJH9NQr8GH6phWqokpZXOxCWQGKyvJ7Xlxh2pFM5afbj+4DYMGWByuAF
 IQ7bRAPsHspsO3ILxgdhdzw2dZvcdtYggtCQSKaAnIrtS0ighAA3WJcmQ84aeLnVQ3Ex
 IiHnmbM+U7zugyfhbHiBgZ0lZxudk+H9CRMt9aNC7KOsGetYpkZYxqp6zQSguJ9UgO1Q
 hwtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730235530; x=1730840330;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=23OYmcrkpvVc4skxTX7T4buHyTsiI8wjKuoiUnpnRTs=;
 b=dDtJvd0/s+Y+t6CVwUo5lG73vCRNYMAO5dOy70dgqA/+UDkXI6aBLBC/p4vfU9Cf0V
 NLifWX5c8TxgT12vczTwGHBB1N2T7MNC5NUN1unhAa83G/bsVVn/kUkktWQlYAm3FC9m
 +1NDnmvtBfxxE28j699BN1DnwrNk5OR8gfTaa+KDgte/iWBRDcQD4A3Pw09CtOmuwTHl
 QKTXJi1iCRFW0rbVE0eGZFd9hCDOm11ZrRxTRM80EVvFKmZabT1U/Qs52tI/7W2g60OI
 trBWm2IBYhnfglpDdCaiLnJOWS9OuIZrPvNxmp7m0uQAL92Bl7Vu/0znRvI3waGV9jj3
 Oj+w==
X-Gm-Message-State: AOJu0YxtUF6hoB8SyZDLrAwAKXEBBhob/cYSbo94thqaqDo7D9X9OS7g
 eWkuuiBcqP4kpLObe/tagwENv0uc+zOb2NUotCTnOKiUauWSGZ9fPjTHSEyyHOYt6H5C7KX46R5
 AVw==
X-Received: by 2002:a05:6402:27d2:b0:5cb:aad6:145c with SMTP id
 4fb4d7f45d1cf-5cbbf8a3c8dmr16121357a12.8.1730235529601; 
 Tue, 29 Oct 2024 13:58:49 -0700 (PDT)
Received: from localhost.localdomain (h082218084190.host.wavenet.at.
 [82.218.84.190]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5cbb629d5besm4217341a12.33.2024.10.29.13.58.47
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 29 Oct 2024 13:58:48 -0700 (PDT)
From: Phil Dennis-Jordan <phil@philjordan.eu>
To: qemu-devel@nongnu.org
Cc: agraf@csgraf.de, phil@philjordan.eu, peter.maydell@linaro.org,
 pbonzini@redhat.com, rad@semihalf.com, quic_llindhol@quicinc.com,
 marcin.juszkiewicz@linaro.org, stefanha@redhat.com, mst@redhat.com,
 slp@redhat.com, richard.henderson@linaro.org, eduardo@habkost.net,
 marcel.apfelbaum@gmail.com, gaosong@loongson.cn, jiaxun.yang@flygoat.com,
 chenhuacai@kernel.org, kwolf@redhat.com, hreitz@redhat.com,
 philmd@linaro.org, shorne@gmail.com, palmer@dabbelt.com,
 alistair.francis@wdc.com, bmeng.cn@gmail.com, liwei1518@gmail.com,
 dbarboza@ventanamicro.com, zhiwei_liu@linux.alibaba.com,
 jcmvbkbc@gmail.com, marcandre.lureau@redhat.com, berrange@redhat.com,
 akihiko.odaki@daynix.com, qemu-arm@nongnu.org, qemu-block@nongnu.org,
 qemu-riscv@nongnu.org
Subject: [PATCH v5 05/15] MAINTAINERS: Add myself as maintainer for apple-gfx,
 reviewer for HVF
Date: Tue, 29 Oct 2024 21:58:09 +0100
Message-Id: <20241029205819.69888-6-phil@philjordan.eu>
X-Mailer: git-send-email 2.39.3 (Apple Git-145)
In-Reply-To: <20241029205819.69888-1-phil@philjordan.eu>
References: <20241029205819.69888-1-phil@philjordan.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: neutral client-ip=2a00:1450:4864:20::631;
 envelope-from=phil@philjordan.eu; helo=mail-ej1-x631.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NEUTRAL=0.779 autolearn=no autolearn_force=no
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
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: +qUVxgMgdD9R

I'm happy to take responsibility for the macOS PV graphics code. As
HVF patches don't seem to get much attention at the moment, I'm also
adding myself as designated reviewer for HVF and x86 HVF to try and
improve that.

I anticipate that the resulting workload should be covered by the
funding I'm receiving for improving Qemu in combination with macOS. As
of right now this runs out at the end of 2024; I expect the workload on
apple-gfx should be relatively minor and manageable in my spare time
beyond that. I may have to remove myself from more general HVF duties
once the contract runs out if it's more than I can manage.

Signed-off-by: Phil Dennis-Jordan <phil@philjordan.eu>
---
 MAINTAINERS | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index f48d9142b8a..d95b9c9e53d 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -505,6 +505,7 @@ F: target/arm/hvf/
 X86 HVF CPUs
 M: Cameron Esfahani <dirty@apple.com>
 M: Roman Bolshakov <rbolshakov@ddn.com>
+R: Phil Dennis-Jordan <phil@philjordan.eu>
 W: https://wiki.qemu.org/Features/HVF
 S: Maintained
 F: target/i386/hvf/
@@ -512,6 +513,7 @@ F: target/i386/hvf/
 HVF
 M: Cameron Esfahani <dirty@apple.com>
 M: Roman Bolshakov <rbolshakov@ddn.com>
+R: Phil Dennis-Jordan <phil@philjordan.eu>
 W: https://wiki.qemu.org/Features/HVF
 S: Maintained
 F: accel/hvf/
@@ -2581,6 +2583,11 @@ F: hw/display/edid*
 F: include/hw/display/edid.h
 F: qemu-edid.c
 
+macOS PV Graphics (apple-gfx)
+M: Phil Dennis-Jordan <phil@philjordan.eu>
+S: Maintained
+F: hw/display/apple-gfx*
+
 PIIX4 South Bridge (i82371AB)
 M: Hervé Poussineau <hpoussin@reactos.org>
 M: Philippe Mathieu-Daudé <philmd@linaro.org>
-- 
2.39.3 (Apple Git-145)

