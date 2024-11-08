Received: by 2002:a17:505:610b:b0:1be9:327d:8ee3 with SMTP id tt11csp4968290njc;
        Fri, 8 Nov 2024 06:52:44 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCVmrKUCN138A2d9rPzIUq4W4LwG+qj+Ra7fNZO5DPbAYj2UMevBI34fCmTizSAkSqDurrLpWKgNAqLd5w==@linaro.org
X-Google-Smtp-Source: AGHT+IGIuCqZHZeym2CGntESV7/+auig6jP9xxaXrxEkfFCOzNpBW3nCWEDesyBB1a6EMH6LvcAh
X-Received: by 2002:a05:6214:a69:b0:6d3:452d:e1ae with SMTP id 6a1803df08f44-6d39e1aa9ffmr28486436d6.45.1731077564718;
        Fri, 08 Nov 2024 06:52:44 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1731077564; cv=none;
        d=google.com; s=arc-20240605;
        b=LkZ1SFmUn7ufEP7us74lKxtg66gDku2I4t62XbBwpXrY/xi3bDsw/2KpvruKqna038
         E89S9SSOxwz6LWkMvM4T3osi5edxZRuXJ3QLE3f9y79X8VVLCLtcjLk3fhhuuaKGd25V
         AkhaqBmYK12FIcz0A2+1sv1ZOCjxwX7kvDIHFaNI3vFg1a8EejXapxue8enNrEs47E/L
         fzt2A/OVaOGkSFqrOLzEFZUcykYJhRu/nR5vWSBqx2SXesU/YpSuYKkpkKfKI/3J4mfu
         i7ACRSUeWLTJ5YvZHg8s0yOCi1x9yarYyAMbqtXGxdJCboja+l9nqT6U/l8z6Z6jCZp3
         yWww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=dpaGWOL1qCixuwh7dSG/JDouTW8eM8K/0qL8NGiv7/w=;
        fh=xTUriiUhIKL9tFmT+qB/hzt0HM9T7rYLpulLH6GJIAM=;
        b=CsJhYLk46O3iZZl8NY2NodEqNDf8lnQTE3u97FjbYqlTJXVkREt2q61YPRptLjbHYw
         4EP7ojtFdaq2g3pN6gxaeyJXaL31cbPrQmI85HqoKtWF+Q00l7ZRksrBiCimKUbwTkUt
         Nt+K8zqpZZg8C3xtBJBUNhqYvoZjtJH1VkHQoGj1SCtfl3MMrw7UhnuoyF1Fj3RvbexS
         dRChKNp2t71vuuoYizBiDZ9gf6SlOFMXd2BWG8zXzV7nsyOO8tADNYsSpmT+QINvFUsU
         mVMx+ppFan/rWOTnKmGffcTGKml61MFQ6+vSybZedrkvZpXhhxVQpr0xdmBMBwciDfNI
         7aYg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@philjordan-eu.20230601.gappssmtp.com header.s=20230601 header.b=TIaAZcc4;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6d396210886si42378436d6.97.2024.11.08.06.52.44
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 08 Nov 2024 06:52:44 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@philjordan-eu.20230601.gappssmtp.com header.s=20230601 header.b=TIaAZcc4;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1t9QHX-00051W-GL; Fri, 08 Nov 2024 09:48:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <phil@philjordan.eu>)
 id 1t9QGm-0004D8-6w
 for qemu-arm@nongnu.org; Fri, 08 Nov 2024 09:47:29 -0500
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <phil@philjordan.eu>)
 id 1t9QGk-0005HR-2H
 for qemu-arm@nongnu.org; Fri, 08 Nov 2024 09:47:27 -0500
Received: by mail-ej1-x630.google.com with SMTP id
 a640c23a62f3a-a9e8522c10bso336681266b.1
 for <qemu-arm@nongnu.org>; Fri, 08 Nov 2024 06:47:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=philjordan-eu.20230601.gappssmtp.com; s=20230601; t=1731077244; x=1731682044;
 darn=nongnu.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=dpaGWOL1qCixuwh7dSG/JDouTW8eM8K/0qL8NGiv7/w=;
 b=TIaAZcc4xjFOQpyqChUk0cAdzZNMm3MfUi63JftZQSrXWHMYa0CD42LyOJgUeaWVkx
 odfbW1VvCkp7wxHawNGNXSbyQJeVnQlTZTdPD9AZ6YbKZYzcUXyggGjltqhNZMyimKC6
 t7WIQn5Ckhhw4VNqKUgcuTB2ZRuNY+QwnhSglpJ4YWm5x5U86BCfdG6ITmTuPZOiBkAm
 38h850/DR7ofJNUDru02wjo4mKztsdnQ2bKF9KCpZ9KGU/ySQ/yUxmGbIidux+Uw8hUg
 yJa8EP9WSwgAAVIbS9gFA50rZMz7iGyLz9r1w8KE0xYF57/lm4VbyvbjkCQBggnbFehr
 jAgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1731077244; x=1731682044;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=dpaGWOL1qCixuwh7dSG/JDouTW8eM8K/0qL8NGiv7/w=;
 b=txYGc047PcI9o30lDs4TWAhlEYYCykzD8BJu0WIu9E0Mn5X4Igjg++IEzevLea401o
 IBHcuRymw+AIttYfP9R5Fi+8tagZ17giz6hinVbutLnYE/nzwxxLfpqIdPYj3fq60TT6
 rYG9K/7sh5adfGUU2MdXWmGgskheppSwzWKrSkuIPb5dD4zwWd0vBfIYqsNf3JzUX/rN
 F0ZGmjR9WNWWf9+LqXZuzobbzdVnMi8kX+6+MwIfvsnmxUdnXmr4SGRCo4xcfw7NjuNu
 yLVhSE+3GRovmDTlEHRcurYQwrngTyj37Fnat+7NQXaIdLk7vvjabnETdng5qUhVYyG9
 OFcg==
X-Forwarded-Encrypted: i=1;
 AJvYcCX6dzSO0C8yQ7zsNFw8WbNA4kUMY4mIv1JkmYVn5EC7AyLOe1dMhgm+EGwoJFb8uWuVMi7lGMuROA==@nongnu.org
X-Gm-Message-State: AOJu0YwRH51uIx9Pih+S7rmwUBiJP21SHOStAxW226srRI5G5ylhfFHa
 fuW0WeKsa60ssJianpHa7TS7Xfm1dr1U5oe3/CR1TXJURiQ/9h27YAz2tLUK9g==
X-Received: by 2002:a17:906:f598:b0:a9e:b174:9cf7 with SMTP id
 a640c23a62f3a-a9eefeb4df1mr273562866b.13.1731077244225; 
 Fri, 08 Nov 2024 06:47:24 -0800 (PST)
Received: from localhost.localdomain (h082218084190.host.wavenet.at.
 [82.218.84.190]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a9ee0a4a9b1sm240534066b.52.2024.11.08.06.47.22
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 08 Nov 2024 06:47:23 -0800 (PST)
From: Phil Dennis-Jordan <phil@philjordan.eu>
To: qemu-devel@nongnu.org
Cc: agraf@csgraf.de, phil@philjordan.eu, peter.maydell@linaro.org,
 pbonzini@redhat.com, rad@semihalf.com, quic_llindhol@quicinc.com,
 stefanha@redhat.com, mst@redhat.com, slp@redhat.com,
 richard.henderson@linaro.org, eduardo@habkost.net,
 marcel.apfelbaum@gmail.com, gaosong@loongson.cn, jiaxun.yang@flygoat.com,
 chenhuacai@kernel.org, kwolf@redhat.com, hreitz@redhat.com,
 philmd@linaro.org, shorne@gmail.com, palmer@dabbelt.com,
 alistair.francis@wdc.com, bmeng.cn@gmail.com, liwei1518@gmail.com,
 dbarboza@ventanamicro.com, zhiwei_liu@linux.alibaba.com,
 jcmvbkbc@gmail.com, marcandre.lureau@redhat.com, berrange@redhat.com,
 akihiko.odaki@daynix.com, qemu-arm@nongnu.org, qemu-block@nongnu.org,
 qemu-riscv@nongnu.org, Roman Bolshakov <rbolshakov@ddn.com>
Subject: [PATCH v8 05/15] MAINTAINERS: Add myself as maintainer for apple-gfx,
 reviewer for HVF
Date: Fri,  8 Nov 2024 15:46:59 +0100
Message-Id: <20241108144709.95498-6-phil@philjordan.eu>
X-Mailer: git-send-email 2.39.3 (Apple Git-145)
In-Reply-To: <20241108144709.95498-1-phil@philjordan.eu>
References: <20241108144709.95498-1-phil@philjordan.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: neutral client-ip=2a00:1450:4864:20::630;
 envelope-from=phil@philjordan.eu; helo=mail-ej1-x630.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NEUTRAL=0.779 autolearn=no autolearn_force=no
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
X-TUID: TXJy2Lr/ieej

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
Reviewed-by: Roman Bolshakov <rbolshakov@ddn.com>
---
 MAINTAINERS | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 0844f5da196..c7964ab784b 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -506,6 +506,7 @@ F: target/arm/hvf/
 X86 HVF CPUs
 M: Cameron Esfahani <dirty@apple.com>
 M: Roman Bolshakov <rbolshakov@ddn.com>
+R: Phil Dennis-Jordan <phil@philjordan.eu>
 W: https://wiki.qemu.org/Features/HVF
 S: Maintained
 F: target/i386/hvf/
@@ -513,6 +514,7 @@ F: target/i386/hvf/
 HVF
 M: Cameron Esfahani <dirty@apple.com>
 M: Roman Bolshakov <rbolshakov@ddn.com>
+R: Phil Dennis-Jordan <phil@philjordan.eu>
 W: https://wiki.qemu.org/Features/HVF
 S: Maintained
 F: accel/hvf/
@@ -2608,6 +2610,11 @@ F: hw/display/edid*
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

