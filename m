Received: by 2002:a17:505:7d82:b0:1be9:327d:8ee3 with SMTP id wv2csp399433njc;
        Wed, 13 Nov 2024 06:25:59 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCUNlyO0Pz3tPbsCAvdlTZ9BC2ounfIlJuBZlvNnhWPQ20EGv00xukDragJD9orPr2KPFNJ7/8f41G306w==@linaro.org
X-Google-Smtp-Source: AGHT+IGf/tRjgOUfLxTQI2DJnyE2epOpjDsVpX98Dv59we9X3qtd3G66i1D1AeTU9EyE+Ixachav
X-Received: by 2002:a05:6102:3a13:b0:4a4:9766:1389 with SMTP id ada2fe7eead31-4aae13c1175mr20446091137.15.1731507959554;
        Wed, 13 Nov 2024 06:25:59 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1731507959; cv=none;
        d=google.com; s=arc-20240605;
        b=ZL2pLZgbZm7jY6WGNwBY0/HyTVwoyYoKccs9JiRecWQkLOeqowGaKXznxLN/505vyR
         XrLRYvMJlRDErH4LWevoogggZ7XRsOyCGHxY4eOpUknQr8EXU3FtKmp0C5UZDzOGTVaY
         We9yLq0/SFAEo0slG4nMNAsaFr3WnE2sLVIPnilrwaYXpz9JsI7WlGsxFtFavMR8eCHK
         rNYXgIqwlERTB7iQRfRx3TJ3GM7bDPDQF1q+BPgKbHhyn47EvhqyRPB1hWslhg4Cko3H
         QTY9RxZct1X0lUOhs7lcxiyrXpNH+bFLr/dZuuZ5aqoPR3C3pQiEoCOD3fGMe1W5TFIj
         kANw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=OIhXQnoj/9ouYAI2nP3PoRv/lz28A9hOVY2Snhhf/9M=;
        fh=VwXP9V7jQe6k3D0faq6AKvXqmzXsCoDVWjt65RJa+OE=;
        b=GdRVERaV8DG26N8WBeYEGvcgExJQq6rAzuwoS4TDZWbPLyL0y/JbWkSVx6Y5zh/95j
         Bc9vHRCWiV9mYAIYfza4Eg2NXXqQI6fNc3VklgKs077b8Bv3lobq0j+0+CWS3q3ZBJ4E
         zT6/GDdnFiyLuNtB8t4WVyFIORqI5E53nTa/79fp2zPoMWtUucycFc39C6vcApJDH+we
         /LlRKNVSRWwChlNjfVTnY3IWG7i7xRLZi+IV8iqRfN93C7Dv4Fk6SPOhN3fPCsXnF8/m
         L2/Lr1RxfSMX7QJ2TSQpnefp271mJ9xWBUEzTtR/N3DClU38qWznNvScmeVAdTMOFeE/
         cxdQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@philjordan-eu.20230601.gappssmtp.com header.s=20230601 header.b=pj1du4eZ;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ada2fe7eead31-4aaa7c0717esi3722476137.563.2024.11.13.06.25.59
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 13 Nov 2024 06:25:59 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@philjordan-eu.20230601.gappssmtp.com header.s=20230601 header.b=pj1du4eZ;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1tBEI1-0003xl-D2; Wed, 13 Nov 2024 09:24:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <phil@philjordan.eu>)
 id 1tBEHv-0003tZ-2z
 for qemu-devel@nongnu.org; Wed, 13 Nov 2024 09:24:07 -0500
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <phil@philjordan.eu>)
 id 1tBEHs-0008Tp-FY
 for qemu-devel@nongnu.org; Wed, 13 Nov 2024 09:24:06 -0500
Received: by mail-ed1-x52d.google.com with SMTP id
 4fb4d7f45d1cf-5ceb03aaddeso8246856a12.2
 for <qemu-devel@nongnu.org>; Wed, 13 Nov 2024 06:24:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=philjordan-eu.20230601.gappssmtp.com; s=20230601; t=1731507843; x=1732112643;
 darn=nongnu.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=OIhXQnoj/9ouYAI2nP3PoRv/lz28A9hOVY2Snhhf/9M=;
 b=pj1du4eZHdNpT0yxasHZi9gIeq1K2YF2ZAwqUwusor4I7Ds/RYgvEcqViKobeWJ2hB
 JFzMCDIJJUbeZV2PvlkGJas3dq9a0m13ieAVKILB+1hwT4Fs5qZrWA2k+TpC+crJUGrR
 GbYIBD42snNCCz4OmkojFuVyZla1gzxy/AjUCf43H14mnms9nexdmrkxOblQT/V9TXEo
 o5fDI05M+9qT9omOOewfjYc6QBM2mlevE6PKv6BFtNxoQXfQnC0OikJ8KC6bVOPXcH7/
 1v8JESeFeti6b4vKKctQpD+hy72toxARYFZBaAXM1w04OxRaYgJBws4yxEONon1Z6Atz
 yRTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1731507843; x=1732112643;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=OIhXQnoj/9ouYAI2nP3PoRv/lz28A9hOVY2Snhhf/9M=;
 b=V8scAIf/iFQXoX1duA2BsJvyqacQ38tM6RSTi9rbdb0LTutocKUrWA76YXgCeMPHOX
 5lK+0heLGmzAMzRtcbBzaxFF28TTkJIKwW5A8kYFuOMY+SfxznbT1t4k0KEKPDPjLuRQ
 5j+mDES/jc4K/V434alnk14mzCAHWGr9ms+Hr1dGhYRKNH3JTimDK4HUPx4ZhXgbHeY9
 socD6JxDLO2fv8/dlW2qvJTRuKnms1fScHG5eV70fTcPpruE1Ru3SBqJ88sPU+zpo8rz
 OC7X7x/5DdKe02CUbKelRpksgdfJvi8/6Ms9+lCO9DQ0xoPOsKcbDpC7/MNg8U0aImng
 A7Lw==
X-Gm-Message-State: AOJu0YzgSCNGSzIA25c1L0sLC4haeya/y9ZCW+MLwz+hfObX1cbLyOMx
 MNUY0JjQDqqm6VJJiJWF1JvlN2HCXXJ5ksalldw4CldPe+LPjV/a6G2/UcMJSVTld7XEnYdZWoJ
 Qaw==
X-Received: by 2002:a05:6402:552:b0:5cd:5494:848a with SMTP id
 4fb4d7f45d1cf-5cf0a44727amr14225093a12.33.1731507842993; 
 Wed, 13 Nov 2024 06:24:02 -0800 (PST)
Received: from localhost.localdomain (h082218084190.host.wavenet.at.
 [82.218.84.190]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5cf03b5d76esm7134612a12.9.2024.11.13.06.24.00
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 13 Nov 2024 06:24:02 -0800 (PST)
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
 qemu-riscv@nongnu.org, balaton@eik.bme.hu,
 Roman Bolshakov <rbolshakov@ddn.com>
Subject: [PATCH v10 05/15] MAINTAINERS: Add myself as maintainer for apple-gfx,
 reviewer for HVF
Date: Wed, 13 Nov 2024 15:23:33 +0100
Message-Id: <20241113142343.40832-6-phil@philjordan.eu>
X-Mailer: git-send-email 2.39.3 (Apple Git-145)
In-Reply-To: <20241113142343.40832-1-phil@philjordan.eu>
References: <20241113142343.40832-1-phil@philjordan.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: neutral client-ip=2a00:1450:4864:20::52d;
 envelope-from=phil@philjordan.eu; helo=mail-ed1-x52d.google.com
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
X-TUID: JB/NNKRoG7qL

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
index 095420f8b0e..b28267b6286 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -507,6 +507,7 @@ F: target/arm/hvf/
 X86 HVF CPUs
 M: Cameron Esfahani <dirty@apple.com>
 M: Roman Bolshakov <rbolshakov@ddn.com>
+R: Phil Dennis-Jordan <phil@philjordan.eu>
 W: https://wiki.qemu.org/Features/HVF
 S: Maintained
 F: target/i386/hvf/
@@ -514,6 +515,7 @@ F: target/i386/hvf/
 HVF
 M: Cameron Esfahani <dirty@apple.com>
 M: Roman Bolshakov <rbolshakov@ddn.com>
+R: Phil Dennis-Jordan <phil@philjordan.eu>
 W: https://wiki.qemu.org/Features/HVF
 S: Maintained
 F: accel/hvf/
@@ -2609,6 +2611,11 @@ F: hw/display/edid*
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

