Received: by 2002:a19:e20e:0:0:0:0:0 with SMTP id z14csp1430839lfg;
        Sat, 15 May 2021 10:42:22 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJww9qmmPKBEvcaAPxKAZ5rWd133f9s6povv7yfILE03NxuIBtHm9vFgtE3XEQ4VYIMeEvBX
X-Received: by 2002:a5d:8b09:: with SMTP id k9mr37987479ion.185.1621100542794;
        Sat, 15 May 2021 10:42:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1621100542; cv=none;
        d=google.com; s=arc-20160816;
        b=npeKpLjiKqaICnlzV/PR2EK+hxMJMGINpNGIR+St4R7UZAdFw0hAEeFpA0CNx2Kh5h
         +AMveUiItA+r4uQSsBJVK4XANemqBJkS1dmakueKV1FwQYy/+xmDxA2LiNPouwBvtzPj
         21pmFmnyiiH1/ME/HXi2o3YZqsg1cCNRw2qwZT0VX61Odl5OM5giDczFTFRkk2Z1qvT3
         FMO33hZ1j62UKEvQyEZBM8NbcCsZ0grRmsWmidzODz8yHEXG+3Ui3C7xZFfuy/21t20r
         Ty8KnSoRvb7RwuH6HW5rw2unsZQxqRIj9pmMDw0QlXloVF0FgK5J2SJkHhZRxgFp7w5X
         E+tg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=lraw6SQ0lVBa6CL2zdvdg82NgOtgQKcG7wf/n9cOxMc=;
        b=UYOLb8BMWdd97QAi383uqPefQjgqTTo9ZRMWhLR0fdIhTlJQ3aTrg2MT68pnrFHow2
         ojgp8rmCNUv+Rt+okjQLYUg6ekVffbpUgkkEmuX9/HXKSt//WoKXpuy7ECpj69cHq7AO
         visQlutl4qE0nj7FuymAxONvxoNxGAjwjfgCODPHqazW59Eru3PCrVCQCLfdE45WmP6k
         Xqi5eW9Hmx/bKsTmKRpQivCVJN/8zzN3B9KkK+PFQOtxIXGK6TGXY2DgrYvfsdXM7rwE
         MKneS8qI27GmTb0d2fxJAeHxThBqTGxc5b1a1zb+bvXtHN+MHDQ7eBa3+oJqNeFRC1DN
         o1Uw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=YnyndHzT;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id k3si10315285ilc.30.2021.05.15.10.42.22
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 15 May 2021 10:42:22 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=YnyndHzT;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:41432 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lhyIw-0000H0-08
	for alex.bennee@linaro.org; Sat, 15 May 2021 13:42:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48084)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lhyER-0000VE-0o
 for qemu-arm@nongnu.org; Sat, 15 May 2021 13:37:43 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:59581)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lhyEP-0006Dy-FR
 for qemu-arm@nongnu.org; Sat, 15 May 2021 13:37:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621100260;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lraw6SQ0lVBa6CL2zdvdg82NgOtgQKcG7wf/n9cOxMc=;
 b=YnyndHzT1F+5eL+YVZjVpRNRP/RBsz4Ad2K1OwanOX4SDX9fR5wfzqagTG/XtXr8pHEjf+
 PTG1LOqfWZs/CTw3luCSjDhQGB9iDgGlZEn8bp9+LMAsihnEMLhD1DdWT1Jzjj0wy+xkwl
 P/huCsEFrY2vSaB/7KDTMWyU72FFjc4=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-163-eEUuH_RWMfGhJgtngwDrAA-1; Sat, 15 May 2021 13:37:39 -0400
X-MC-Unique: eEUuH_RWMfGhJgtngwDrAA-1
Received: by mail-wm1-f72.google.com with SMTP id
 n24-20020a7bcbd80000b029014287841063so450864wmi.3
 for <qemu-arm@nongnu.org>; Sat, 15 May 2021 10:37:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=lraw6SQ0lVBa6CL2zdvdg82NgOtgQKcG7wf/n9cOxMc=;
 b=EZtAiHktQ0EqO0A603iyGoIbHgsfqyw/uR9PrR7pTBRpcKpXmpyEzW+z2vDFk0dls4
 NAQ3aPrQfnCNcd6YyNngP1Jwis6whtCb9LzZ0ZIYSv4sBHqVhl6ShgXl7VlDaxpnjsyl
 KQbnb0R1SXrzYB8/8QSVy/7v5SxN8oDD4YKl10GffKo8NTwCyi36gxRWhQFu+3yCTbnz
 CL64qln16HN8q5OSuKQIazHkyEeQ+kJJ39gM4DEnzRiyToZZsjwEjEUT1m7sTWowlTTr
 sQ1PUlFpyRTBIaIluDiSwTZyUK4NZk6lnQosd3JjyL8jp6DQQ+V9/tcsFI0A9na394gP
 NT0A==
X-Gm-Message-State: AOAM5320X6OgPngh0I0Fgfa9OaiGEEcfOpVJjtEpb5IyQR1i0vg4y+lr
 eM272SuHAxAjmZIMX9SoGjqQVHG6tietn4usZZBaIPHW+qIKcgkBTsxzvrgLkAD1kfn1wJv2Xcu
 UHoGFwhYE7r5x
X-Received: by 2002:a1c:a3c3:: with SMTP id m186mr3770244wme.39.1621100258033; 
 Sat, 15 May 2021 10:37:38 -0700 (PDT)
X-Received: by 2002:a1c:a3c3:: with SMTP id m186mr3770224wme.39.1621100257888; 
 Sat, 15 May 2021 10:37:37 -0700 (PDT)
Received: from localhost.localdomain (31.red-83-51-215.dynamicip.rima-tde.net.
 [83.51.215.31])
 by smtp.gmail.com with ESMTPSA id x11sm10019081wrl.13.2021.05.15.10.37.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 15 May 2021 10:37:37 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 04/12] hw/arm/Kconfig: Remove unused DS1338 symbol from
 i.MX25 PDK Board
Date: Sat, 15 May 2021 19:37:08 +0200
Message-Id: <20210515173716.358295-5-philmd@redhat.com>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210515173716.358295-1-philmd@redhat.com>
References: <20210515173716.358295-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.701,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Alistair Francis <alistair.francis@wdc.com>, qemu-riscv@nongnu.org,
 Bin Meng <bin.meng@windriver.com>, BALATON Zoltan <balaton@eik.bme.hu>,
 qemu-arm@nongnu.org, qemu-ppc@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Bin Meng <bmeng.cn@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: TZXK7cVgJyY2

In commit c4f00daa5b3 ("imx25-pdk: create ds1338 for qtest inside
the test") we removed the DS1338 device from the i.MX25 machine
but forgot to remove it in the machine Kconfig definitions, do
it now.

Acked-by: Paolo Bonzini <pbonzini@redhat.com>
Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 hw/arm/Kconfig | 1 -
 1 file changed, 1 deletion(-)

diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
index 85c6a1a088c..5827c092b28 100644
--- a/hw/arm/Kconfig
+++ b/hw/arm/Kconfig
@@ -386,7 +386,6 @@ config FSL_IMX25
     select IMX_FEC
     select IMX_I2C
     select WDT_IMX2
-    select DS1338
 
 config FSL_IMX31
     bool
-- 
2.26.3

