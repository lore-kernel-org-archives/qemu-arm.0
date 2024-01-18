Received: by 2002:a17:906:2b99:b0:a2e:1324:ea5c with SMTP id m25csp518832ejg;
        Thu, 18 Jan 2024 12:07:11 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEqxpPAudiF8JyC8u0KSoIlsid1lz/qqwBNXB4ioKFCpi7XfuOm7rVH/9uSBdL42GaXdf7t
X-Received: by 2002:a17:906:35c7:b0:a2b:1a20:e634 with SMTP id p7-20020a17090635c700b00a2b1a20e634mr901502ejb.11.1705608430966;
        Thu, 18 Jan 2024 12:07:10 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1705608430; cv=pass;
        d=google.com; s=arc-20160816;
        b=req4TYH2uL0IKGOEXCnBPFeFOlnZcQcq2gFJq++boXlDsGUpz57lBvvCSh6GOSEXBG
         Y8ieG9eFyaxkKCQqSODtePs3GJLnRtYyJstyVWcHuxO+YiZ0yVAv+HNDzoGpiNRY3AQd
         l4YQdK95Y2ur/x0OwUs72CILBdlig5uH0TXh5nVSE2SV6HMbHASpVOg9GvkjZw5sbAgn
         udSuZSYMuCNHdUgLVbPLEygQlqmxY7rtI70d9JXsHyqo+mdUbsY2f9bXhIMomwyYSRke
         hXgicbJIJkNyJ/FOHg6QvK+hhPJyjUVdBQnjM0ocmDCRJSwMSpQPJUo/dBGLurHMEB9O
         WlYg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:list-unsubscribe
         :list-subscribe:list-id:precedence:references:in-reply-to:message-id
         :date:subject:cc:to:from:dkim-signature;
        bh=htALVQYUd7tctCm3cf8P5ZcYUk/HKeiXOxSFOuNuC8A=;
        fh=cUgEM3TMHOIH70RmHTmTZxZmItZJnKfBWHSaci49aLY=;
        b=EcSze9XgxXdf/j6emAhXPYm1gl1QPDa7Iu6FfxioyFUY/0g4UpeUdnvgrpfboOxkdR
         DIq+KHfp2rVkQl2XHxc600T7PekVFLATI8A/F7+sJUtokmXx1VscDU8tGEdcxodFEv2k
         5OfNXqBqX3XUsU5PcnR7pbv4WzjWkhZC7Orsd6zfWA/uTUeD2Lnpdz61CrV/kPDsC/iX
         nAP7z88lyLlTUMWFuS8Q6UjPIeFypelI1VN7QYBvIQzCLr/3IXNGJ36VCMMFNimuNZwF
         XyV/s96r1r12sLmKZ3V7F/85CERxpi/TiM8KBW0xZzpdk8dV5pSsqBvHB6w5q/ZEy1q4
         yq/Q==
ARC-Authentication-Results: i=2; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=w7zDKMc1;
       arc=pass (i=1 spf=pass spfdomain=linaro.org dkim=pass dkdomain=linaro.org dmarc=pass fromdomain=linaro.org);
       spf=pass (google.com: domain of kvm+bounces-6433-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:4601:e00::3 as permitted sender) smtp.mailfrom="kvm+bounces-6433-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <kvm+bounces-6433-alex.bennee=linaro.org@vger.kernel.org>
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org. [2604:1380:4601:e00::3])
        by mx.google.com with ESMTPS id o16-20020a1709064f9000b00a2e66e7a63fsi3054744eju.119.2024.01.18.12.07.10
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Jan 2024 12:07:10 -0800 (PST)
Received-SPF: pass (google.com: domain of kvm+bounces-6433-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:4601:e00::3 as permitted sender) client-ip=2604:1380:4601:e00::3;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=w7zDKMc1;
       arc=pass (i=1 spf=pass spfdomain=linaro.org dkim=pass dkdomain=linaro.org dmarc=pass fromdomain=linaro.org);
       spf=pass (google.com: domain of kvm+bounces-6433-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:4601:e00::3 as permitted sender) smtp.mailfrom="kvm+bounces-6433-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A96741F27868
	for <alex.bennee@linaro.org>; Thu, 18 Jan 2024 20:07:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2C98E2E634;
	Thu, 18 Jan 2024 20:07:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="w7zDKMc1"
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57D6C2E62A
	for <kvm@vger.kernel.org>; Thu, 18 Jan 2024 20:07:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705608422; cv=none; b=UReM1Jvpt+4pes0B/4IZMGmCv2ty86+FqdHJSlrM1FGpqEfOLAR9z5grdqtZuw4WCyQt4JSsAFEO7id537uVv1ioE1wCzbGt5f1bm+a3dcXvIx5bHHdAR08+0aXZu5+TISJ/k0RfN1ToZFq5kXqr6IGdCl5WUso7DWRIUIiG8WI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705608422; c=relaxed/simple;
	bh=gLomlSi8LgyeMv1miaxbAAFi+OJvA8xaDbLDEuVzDGg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=EowBpqKoTc8kAV6Lvj/rh/o8NMLSZ3nxj3rJiCNxfQOGPAT+V+i+rOfDCmuN1yGqn/JUregNnt0QOs5vlny6HG9OfNvmwcSKm7G1pvchU2Z9DXl5z5zPh38sFArtv4lUS8AFXNZYNFDOceUB92XaaNxbDxvz6Pzpf8QcYYLpQRM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=w7zDKMc1; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-40e7065b692so105125e9.3
        for <kvm@vger.kernel.org>; Thu, 18 Jan 2024 12:07:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1705608418; x=1706213218; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=htALVQYUd7tctCm3cf8P5ZcYUk/HKeiXOxSFOuNuC8A=;
        b=w7zDKMc1t3w60DfWg0Yk73ETsRpskLOEhe7YyDJrP4iIgddPZxc+dTXKVvmKuGre8R
         c76QujSwFnY4jfzVWRG+tqQIbEK4MJSnUAAgh/rRRgX28WzrvZXz2+amNB6sXKQIElxG
         ukJoeVZq2FkPqwArfTofdIwdDkq1pL9uq5ZA2KlKFm44lBPa7e9eXswAdU20htX2W7Uf
         osexnXkcYPYk5YkKOuBW2bmwJxjVx6gGrco+wNryMEqiaVXcZiGoalFN8L28kB/0Tw7/
         gFIv3ORo4Yl4Ky5qeGkj3yMIYj6pG0cEtA8dB1RIUarW20OsNE9FG1HcZse4ciQT00mD
         jlnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705608418; x=1706213218;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=htALVQYUd7tctCm3cf8P5ZcYUk/HKeiXOxSFOuNuC8A=;
        b=TFqUnLFD9px+K1R64/7Ae+K9ylAf8Gex6C6fyO1r3ZflG0SfhuexPZkpfzuOLkxas8
         ytlEr1QWEIfft31ezjPeh90J4j1cpy/D3tJ+vITpfxOn3EW35P0w5NsIspy5sO6XSq4L
         e8Sw1fUj/NYQXMjfmTGUm+WDEdLxfGqk9704aZ7eZO6Aqfsz2N/cvaIzbChdI8/KgtSi
         3s1BJfqKuwrNsQph41mxqRV+ogAOhC7xTpC+F5O2ueInbvbu0koP0KAXYEKSHmoKWJt9
         SLxgC/3MfAYPcDPXix5fFqdADk3TmgWEdLIBPOg/alEvNpxnxJly4ue10DewaJI2FdEV
         0tSQ==
X-Gm-Message-State: AOJu0YzYaXGw5hDANRecHDHOhxvFRqMn+mdZ5wTfj2uBOWAOsvi4pFnl
	x7U589cqXPMlyeLXeuowa2twfLFQBZT/NiKAdxSdq/H+fhLbTGBvk3JQmPIC8xw=
X-Received: by 2002:a7b:cbcc:0:b0:40c:416c:d99b with SMTP id n12-20020a7bcbcc000000b0040c416cd99bmr862981wmi.47.1705608418664;
        Thu, 18 Jan 2024 12:06:58 -0800 (PST)
Received: from localhost.localdomain ([78.196.4.158])
        by smtp.gmail.com with ESMTPSA id k20-20020a05600c1c9400b0040e54f15d3dsm30578929wms.31.2024.01.18.12.06.57
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 18 Jan 2024 12:06:58 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Igor Mitsyanko <i.mitsyanko@gmail.com>,
	qemu-arm@nongnu.org,
	Strahinja Jankovic <strahinja.p.jankovic@gmail.com>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	Igor Mammedov <imammedo@redhat.com>,
	=?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
	Eric Auger <eric.auger@redhat.com>,
	Niek Linnenbank <nieklinnenbank@gmail.com>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Jan Kiszka <jan.kiszka@web.de>,
	Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>,
	Alistair Francis <alistair@alistair23.me>,
	Radoslaw Biernacki <rad@semihalf.com>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	Andrey Smirnov <andrew.smirnov@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Shannon Zhao <shannon.zhaosl@gmail.com>,
	Tyrone Ting <kfting@nuvoton.com>,
	Beniamino Galvani <b.galvani@gmail.com>,
	Alexander Graf <agraf@csgraf.de>,
	Leif Lindholm <quic_llindhol@quicinc.com>,
	Ani Sinha <anisinha@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Peter Maydell <peter.maydell@linaro.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Jean-Christophe Dubois <jcd@tribudubois.net>,
	Joel Stanley <joel@jms.id.au>,
	Hao Wu <wuhaotsh@google.com>,
	kvm@vger.kernel.org
Subject: [PATCH 02/20] hw/arm/xilinx_zynq: Include missing 'exec/tswap.h' header
Date: Thu, 18 Jan 2024 21:06:23 +0100
Message-ID: <20240118200643.29037-3-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240118200643.29037-1-philmd@linaro.org>
References: <20240118200643.29037-1-philmd@linaro.org>
Precedence: bulk
X-Mailing-List: kvm@vger.kernel.org
List-Id: <kvm.vger.kernel.org>
List-Subscribe: <mailto:kvm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kvm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: 0cXq7Wx7blwO

hw/arm/xilinx_zynq.c calls tswap32() which is declared
in "exec/tswap.h". Include it in order to avoid when
refactoring unrelated headers:

  hw/arm/xilinx_zynq.c:103:31: error: call to undeclared function 'tswap32';
  ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
          board_setup_blob[n] = tswap32(board_setup_blob[n]);
                                ^

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/arm/xilinx_zynq.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/arm/xilinx_zynq.c b/hw/arm/xilinx_zynq.c
index dbb9793aa1..d4c817ecdc 100644
--- a/hw/arm/xilinx_zynq.c
+++ b/hw/arm/xilinx_zynq.c
@@ -37,6 +37,7 @@
 #include "hw/qdev-clock.h"
 #include "sysemu/reset.h"
 #include "qom/object.h"
+#include "exec/tswap.h"
 
 #define TYPE_ZYNQ_MACHINE MACHINE_TYPE_NAME("xilinx-zynq-a9")
 OBJECT_DECLARE_SIMPLE_TYPE(ZynqMachineState, ZYNQ_MACHINE)
-- 
2.41.0

