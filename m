Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE554CA1009
	for <qemu-arm@archiver.kernel.org>; Wed,  3 Sep 2025 10:09:32 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1utkQ2-00014h-Pu; Wed, 03 Sep 2025 06:08:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1utkQ0-0000wb-MV
 for qemu-arm@nongnu.org; Wed, 03 Sep 2025 06:08:44 -0400
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1utkPz-0008Ga-4z
 for qemu-arm@nongnu.org; Wed, 03 Sep 2025 06:08:44 -0400
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-3ce4ed7a73fso3264575f8f.1
 for <qemu-arm@nongnu.org>; Wed, 03 Sep 2025 03:08:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1756894121; x=1757498921; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=hBqK3PCTcJsYs4YDyMLp+uvoaCcL2zuVRl4bWVmO6DI=;
 b=a74wXIU/S+kOShYCcxSC+talwYDn9Sywu+QeFMzTqbyU2USO/TsH4aHCysnf40oe5x
 kcJn3wWaNLITH9sBNe7yFcgHoaSU+gS7QK7lJw97VC3buOm1+y2bOsSAUEqooqFaINSX
 kZi+ztR86VPbnWXk/95w1NOAlqHtLl0C5oIasSj9YdDI0sRIbPDyxu4i3ocsbAwz2Tur
 +aJMbi8h8JDVSW+Lb6e/sx9D740BIpDWMrO508/88U2HZoZpwf1AyxwHOqvBozwg63dA
 yFriF35ksqZRonAijO9z+sqpphocoYfkMNMmfFPa714IGDqKZ8KMyhcCnrRUp2EUAeTv
 QdDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756894121; x=1757498921;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=hBqK3PCTcJsYs4YDyMLp+uvoaCcL2zuVRl4bWVmO6DI=;
 b=shPeuKQT4/460CEnGDTAe6VFTkIQfTA1UPVAvFzdIdA8fHrkG2BPcKrUI1S8mSpt6F
 pyDcfNqsntXLqwj7l8kJX2svoc+NvCsG/UGbfLhd9rzAzEp/0H6Mi0TUvmitP46rM3m8
 4zUEn1qV/dWSFS8jcbfROAn86ZJ/a+j2DXdwkQTHWmRNmfobkvr0i8vKUz07Y3duTv6W
 ufUFIb8h0+d1n+X+Ib+T+cpuv9AygeEVvSIrRDCCoSSHYhyngcS2c/Atjek2QaHIsCWG
 5m9A+zovWyVLhd7FFdz6vacnGlsLVcnRBIima6XDE4l6JHrmoAhkTfqGA72UTCKKV3lc
 HyLg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVC26wAyN0IU/hYRY0zWkQiYUhL6ftcs17SDlhgcBzhsBsrJlt+0j5qpBClDim2zCXu0fBfLUbJGA==@nongnu.org
X-Gm-Message-State: AOJu0Yy9hzf3qs9u2faX0or+1UYxmnCOsNkfnF60bRbkFnHMqKuw34P7
 Oplq/AJTEP8ts25jz0YltSrKC86H67J6NpQoNMrN5FrPrBArXaNYX6rjwxH+9WQkG1o=
X-Gm-Gg: ASbGncujfkat/rXwVx7DK279KX95fzCaJnHWytS2Bz6vkGbjlvJAwb75Aqzo+3denLp
 46Pssbfj5cAVbthk2v4J8Clvg8daTEs0OB1nYwUDcCLoqiXFRaxMaVt6Ybpthzctc6HeMMZn1gR
 VvoRncDUWELoL/6SxzyyDugoHeBRtuNsS4My1ZpZU/eBP3XzLbW0faB+dUm3VjrM52la8X7N+cm
 3ii/uttr3ThtiM8tff5fWIiF9Y83B3Os++wGUM6emX2oWpRxN4ZfMKoXrH37EDLoWtH4QhgP14G
 M/cvtEu3+Ybn3dAK1plVTlAiLrGkQb6t9x85C1vKpCLXr/eAT/MTzgBxOtr4sPNU87HOl6PNSB1
 PEcSmKlvzdL5kohgyl3TVy1rfK2dtUp+orpinnv+uVtFSCweAX6z7uj9TPuA3kYnraId7vIAbhJ
 oLvsqVNQ==
X-Google-Smtp-Source: AGHT+IEXvE2yxE0eDhnAD6kxIdMImk21KxggNU91CQLDrZPd5R3xnOfh9naqqPreTPYWWMr0eKNeaw==
X-Received: by 2002:a05:6000:1a8e:b0:3dd:26b7:2838 with SMTP id
 ffacd0b85a97d-3dd26b72bd7mr1317336f8f.4.1756894121345; 
 Wed, 03 Sep 2025 03:08:41 -0700 (PDT)
Received: from localhost.localdomain (98.red-88-29-180.dynamicip.rima-tde.net.
 [88.29.180.98]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3cf33fb9cebsm22884059f8f.46.2025.09.03.03.08.39
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 03 Sep 2025 03:08:40 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Alexander Graf <agraf@csgraf.de>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-arm@nongnu.org,
 Mohamed Mediouni <mohamed@unpredictable.fr>,
 Peter Maydell <peter.maydell@linaro.org>, Mads Ynddal <mads@ynddal.dk>,
 Phil Dennis-Jordan <phil@philjordan.eu>,
 Stefan Hajnoczi <stefanha@redhat.com>, Cameron Esfahani <dirty@apple.com>,
 Roman Bolshakov <rbolshakov@ddn.com>, Paolo Bonzini <pbonzini@redhat.com>
Subject: [PATCH 09/24] target/arm/hvf: Mention hvf_sync_vtimer() must run on
 vCPU thread
Date: Wed,  3 Sep 2025 12:06:45 +0200
Message-ID: <20250903100702.16726-10-philmd@linaro.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250903100702.16726-1-philmd@linaro.org>
References: <20250903100702.16726-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x429.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

Since hvf_sync_vtimer() calls hv_vcpu_get_sys_reg(),
which must run on a vCPU, it also must. Mention it.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 target/arm/hvf/hvf.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/target/arm/hvf/hvf.c b/target/arm/hvf/hvf.c
index 05fc591b523..a7e4b869b04 100644
--- a/target/arm/hvf/hvf.c
+++ b/target/arm/hvf/hvf.c
@@ -1889,6 +1889,7 @@ static void hvf_wfi(CPUState *cpu)
     hvf_wait_for_ipi(cpu, &ts);
 }
 
+/* Must be called by the owning thread */
 static void hvf_sync_vtimer(CPUState *cpu)
 {
     ARMCPU *arm_cpu = ARM_CPU(cpu);
-- 
2.51.0


