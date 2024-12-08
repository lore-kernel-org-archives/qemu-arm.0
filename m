Received: by 2002:a17:505:a0c:b0:1be9:327d:8ee3 with SMTP id cg12csp2181779njb;
        Sun, 8 Dec 2024 12:25:49 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCVqmbkLCIUL35KfO/7txK2v5rNzoopFNiGdle1UhjOUjJkGdadhyGKQQwFagnpA8Z3UVvRYtnWNc5/cyQ==@linaro.org
X-Google-Smtp-Source: AGHT+IGNFYN2RxGSAdQmfvklb5Jea02G9RiaS51hwdvXSyJ/srEg2P5wB24VaIXTHW0dTu6mgBlf
X-Received: by 2002:a05:622a:88:b0:467:5a88:96f4 with SMTP id d75a77b69052e-4675a88b777mr63676911cf.17.1733689549429;
        Sun, 08 Dec 2024 12:25:49 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1733689549; cv=none;
        d=google.com; s=arc-20240605;
        b=RRAhmLvCFf+CsZJxq08strnnm+97wSkNwDUMDle0DuK+ugTziz0711czfwkPYgXHji
         0Aj0LxpVlnXuiEslUHZswm8OAbH0jcWgH8wdixaP1C/cI1Mun9VLiFZoR5a6w8UjH2ab
         x/w+n+D3gLs6MeW48eANFXU+X9m63qH+FPf7EOysuJqV2Do9P7vdrxmAFm2dwI8xqeTM
         R30BsRmrmi74a0FQgdUuhhGujeO2FGl7Yk0SEn4xUs5doU6cKf9/DqD4YiRK+G5ZBoIm
         ebCRx5jBv3EY1ufnoN8OtlYw7N35feyxOb2+Y1IS2RJm1t8LpZDdLnF9lxEym7ZpOavq
         9W+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=YTij3bXu5nZDt0Vwg+IprqKvFSAcOqEgivoe2gV/mPY=;
        fh=VwXP9V7jQe6k3D0faq6AKvXqmzXsCoDVWjt65RJa+OE=;
        b=HBkAGlFL8D9Q+Rt/sfMOKnr4hJvagWapVEy0oOpB+Ts1031LzmfsqWZ38SzswEBcRu
         VEhyE9KgfAvXsI6FTv6B26EFgOwBpY+QM3+cmX/tsfYDEFpk6tRXmQkJoYQQ/QFeimMh
         c6y+qhJQCTD1u9hsY87SauP0dbp/J6deHX4HpIdXTp/SURMJhhcr9KfCZRkoATX8L8R+
         Qbl6zV+ZXC0n6Gs6A4sg5lnZsqteNA2JY88aFmPTrQRi70c0p6HgaWWn7X77wrubQ3DF
         DG+bX96cNFcdd4+Z9xpnASMX8ghhZpPZfX9BthgtEqAPCLbPNYYX3qPm39QeSB4mKYOh
         wLvA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@philjordan-eu.20230601.gappssmtp.com header.s=20230601 header.b=lY+n3Xcs;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-46745c75934si50518131cf.6.2024.12.08.12.25.49
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 08 Dec 2024 12:25:49 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@philjordan-eu.20230601.gappssmtp.com header.s=20230601 header.b=lY+n3Xcs;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1tKNny-0002GC-2u; Sun, 08 Dec 2024 15:23:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <phil@philjordan.eu>)
 id 1tKNnt-0002CH-Kl
 for qemu-devel@nongnu.org; Sun, 08 Dec 2024 15:22:57 -0500
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <phil@philjordan.eu>)
 id 1tKNnq-00083W-UQ
 for qemu-devel@nongnu.org; Sun, 08 Dec 2024 15:22:57 -0500
Received: by mail-ej1-x636.google.com with SMTP id
 a640c23a62f3a-aa68d0b9e7bso17777866b.3
 for <qemu-devel@nongnu.org>; Sun, 08 Dec 2024 12:22:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=philjordan-eu.20230601.gappssmtp.com; s=20230601; t=1733689373; x=1734294173;
 darn=nongnu.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=YTij3bXu5nZDt0Vwg+IprqKvFSAcOqEgivoe2gV/mPY=;
 b=lY+n3Xcs+nMAJ3OAlZjGRZypP0LMzfAL3XxC816KXfdjxfx73NGXNIvFzOn0elU9vy
 c7dFj+7enrFjBnqqreiSvVykCdJE3bWTTlmJwhefAAnGZTaITAjgcckgfRaOE/B5n2+v
 WWjQ4JGR6MaN6Zku/DRyL8sVaaB6ziQwqGK7mhA29Lamx3/fg6AhVRZTvVGt7IPtq4Di
 3fApHW03Wk7KUvf9ZFIsoEqGjkSRhvr3PNrZUM2B7q5WkdlkOr82R4hue6iMP0gR6xIC
 rszEiLx3EdahhXSH34qpNOe4FiPOWDdAecoSz8AMXoHMyXcRxt1DQAuT/cdir9IdXbcb
 uI/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733689373; x=1734294173;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=YTij3bXu5nZDt0Vwg+IprqKvFSAcOqEgivoe2gV/mPY=;
 b=BSWeRd9/PKYvyayUkyNuEz1n08T7OYfUOrspTOf+OXjxbcp6OJ68rDysvZv0uQLc/F
 T5O8CmrPnAn8nO3282RTBse2mzUelGEbdfWtggTJT/JrlrM0twmIfLHdOvJWMqABp2iy
 r5QXSU7KOMiN05gPVcZ+CWUNEECnOTxChBQH6PqtnaoOrpOVls7NRK32sdlJ2mZanKyH
 3WI4SC15a2VCxlcc9kK+o6LGzu3WunflkYcKe26j+Z9s7kA+v3+g6dD+FoBw7ZkvYDZ4
 1TCvZAVXvAQ5hl/BpnSIeSfiyvl927ZXntpSGw3PZP7nT2goNsiZ2GXLiQgcKU0UYKUh
 /Ddg==
X-Gm-Message-State: AOJu0Yykr3FBS3PI/Kg+PECWM90rPApGGPuJ1C1K0TmbxfazVK8VDIxo
 gsCO4ZUFrbhJbcTLIxFAETnTOscD3eE2hR7BVkLwbE2OIB7LEU6B04DxCjsq7IzpVZiRUlqMquj
 jE8s8
X-Gm-Gg: ASbGncvDI+y6fwMeknYD2i8m6WTjbn/SMUQug00bRM5ME+t2kCTOPxF3vr838ukqpOf
 JWiCSGdADccjxzlCbE2Di5cph0VN2THStkJuzAxvUdKhZQGMdoVXysXRhTpACU5JMJvS1fntob1
 2z4Lkfw8ga4xNBC6FCCAEICHIPcgPePOKlhaoVl6ODKNwZjZKmdsEawlSzpx8vBpCaTUR8yh8u+
 4X5mFzyFTvmH0X6WBv5Zy+UAcOe9EGDNwRs5g8McTGZ26L/Jnu6MqlGjPGhxptNPW0aGBTmAqVq
 3fSv50HoHezI2Q6By2gnNEnEdg==
X-Received: by 2002:a17:906:328e:b0:aa6:5eae:7ed6 with SMTP id
 a640c23a62f3a-aa65eae884amr542745266b.13.1733689373609; 
 Sun, 08 Dec 2024 12:22:53 -0800 (PST)
Received: from localhost.localdomain (h082218084190.host.wavenet.at.
 [82.218.84.190]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aa625e4eee4sm585759266b.26.2024.12.08.12.22.52
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Sun, 08 Dec 2024 12:22:53 -0800 (PST)
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
Subject: [PATCH v13 05/15] MAINTAINERS: Add myself as maintainer for apple-gfx,
 reviewer for HVF
Date: Sun,  8 Dec 2024 21:22:28 +0100
Message-Id: <20241208202238.68873-6-phil@philjordan.eu>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20241208202238.68873-1-phil@philjordan.eu>
References: <20241208202238.68873-1-phil@philjordan.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: neutral client-ip=2a00:1450:4864:20::636;
 envelope-from=phil@philjordan.eu; helo=mail-ej1-x636.google.com
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
X-TUID: NnjqR5oV1PUY

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
index aaf0505a214..09899f7407e 100644
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
@@ -2612,6 +2614,11 @@ F: hw/display/edid*
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
2.39.5 (Apple Git-154)

