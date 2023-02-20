Received: by 2002:a17:906:da85:b0:8b1:202f:4753 with SMTP id xh5csp2101472ejb;
        Mon, 20 Feb 2023 01:18:15 -0800 (PST)
X-Google-Smtp-Source: AK7set/AMS0OWturGCmvyBpDhBKXngv69KsTVmltonvfdm4cJA6oegBfhVm6yi339QpV+gRI4knS
X-Received: by 2002:a05:622a:204:b0:3b9:b2c3:9d2e with SMTP id b4-20020a05622a020400b003b9b2c39d2emr13256250qtx.10.1676884695477;
        Mon, 20 Feb 2023 01:18:15 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1676884695; cv=none;
        d=google.com; s=arc-20160816;
        b=XduCC3ashQTp4PHC0KSFIvAXoxIDDAOiT0ARBt5IsG7DH65smGMwgv6xJ2fP4ATEVL
         1z4L+JndXUQggaDYdNwZUoxL/2RZykMZm8OPkkC5yM1ZlpsSjvDqdY9nM1/1xDCnbknf
         9bCZ2jBdAT9mFn5PAWGFlgt+egDXVIcYqUfPfa3J1fJByB6q1OdhPdgrx5p81d07eBZt
         sO86AlJE1SxTDA8FJmjLY57YFg0ljhXdhm/mSsQMnuO2OAM825au2pdLfRvTVKF6xyWG
         6Vzju1FJnvtBBCoX+GtFf7lNY4cviDyMza2JDc2pkmkQH9U+ahl15qTRkPQMMqbfCSY4
         Y8vg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=6KPs6QzBVbeld/TzCnm7LDXOq9GMzfPGQoiYYFroMT8=;
        b=GnMp7F6GoBfbpHs6yiZfu59KLE9RG7ho3E5id/tQDIij/zLUfpudfZ588sd+sng+hu
         M4/F6aCwkpZlusimAR5iefEDfB2jwD1UBmMpIw1zura+zPGriBBC4kE8TwXvmekmSSSG
         gt4QblTaM98NlX+HRWyXdRcbFGUw3SYdXpdbKLdywTF4eGhGsz38+tKGIo4O+lR1L0/o
         d7rz28/PxMbyAv+yTkXzXJCfiT3RJV/hRNMlOJtw/WlZpSNmmGqNwguoJSKrthIYd2WS
         7IGxWWNPn+e39sKKABL64soaAVJBqaW2L5BcCAgyn9jXpiMS8nRdT7ij9i4M1URmvT6b
         0JJw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=y40nzJTu;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a3-20020a05620a438300b007259df947f8si9445580qkp.504.2023.02.20.01.18.15
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 20 Feb 2023 01:18:15 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=y40nzJTu;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pU2Hw-0000pl-GR; Mon, 20 Feb 2023 04:16:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pU2Gq-00073V-T0
 for qemu-arm@nongnu.org; Mon, 20 Feb 2023 04:15:43 -0500
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pU2Go-0004DN-9x
 for qemu-arm@nongnu.org; Mon, 20 Feb 2023 04:15:39 -0500
Received: by mail-wr1-x42e.google.com with SMTP id o4so340988wrs.4
 for <qemu-arm@nongnu.org>; Mon, 20 Feb 2023 01:15:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6KPs6QzBVbeld/TzCnm7LDXOq9GMzfPGQoiYYFroMT8=;
 b=y40nzJTu9YqYn48V52PzwvKykjR4DTUGi4ggJGcN2sgTXDOAjXkcRKvnblnjA91Ybl
 xWqRYLABhjv34K8fIZch8l63qnDN7qnYaCKWFMkKnYfKbv2Y5+xIZEImCPBeRAAOUTQY
 TNfaRnD9uMSvtUzzKdTdPj/pKiBT1NIWPMDypUQtyhv9tioSfbeyTE5J9Qs8TbMrzrw9
 pxNByejeorB88qFLv3irmLl9QmlHrCa9RJ/xyZ6PA5zicby3nbbTPb4yNZB8/RpU1ZJ4
 yRHHlXZWCnuBpsJ6ENrqGAsFxe/ygPmSqlr0XeBCDnDi7jxB9zPQCzEcowVnFuSA5sd0
 8zuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=6KPs6QzBVbeld/TzCnm7LDXOq9GMzfPGQoiYYFroMT8=;
 b=YdW7TaTjP497900S+W5OAXWrdkICKJUL0zumSU82NpmgMgJTvbDmn4FF16i1ARP6N/
 C/+fAaup+QwjSCLFJySzYKLdzJC3IeCS0InY6CMSDkVPgjH3XN9Sd/XGJY6XSjysNWrm
 EYAXV494qi3Xa7enRtC3J2aE03YioH3osIVjexdNwdWglSDnFQ1n5oZW61ksqQLNnPyi
 135ILePfUVedZkJyjpyM9DRBsA+7CgvO6T8Nv1dbSwsT9EFBBGXj0gjPHUQ++pXo+cRj
 iVDqj5iYIPefANzX0eSdiLX8d92E1a9CsjNit/9kuVjqidf6cYzK2r4QKj2/MmLu4gMr
 6R9g==
X-Gm-Message-State: AO0yUKXSlgYB5GNEVB0LZM6y4UXIlJnaMp+vRa765NWgoVfdJMgUPOmq
 GbUXnfaOXnT6xwo1cWIrttbxGml98EGN7RDX
X-Received: by 2002:a5d:66d2:0:b0:2c5:9cb8:d314 with SMTP id
 k18-20020a5d66d2000000b002c59cb8d314mr2155152wrw.56.1676884536405; 
 Mon, 20 Feb 2023 01:15:36 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 v17-20020a5d6111000000b002c559def236sm4013038wrt.57.2023.02.20.01.15.35
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 20 Feb 2023 01:15:36 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, John Snow <jsnow@redhat.com>, qemu-block@nongnu.org,
 qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PATCH v2 19/24] hw/ide/ioport: Remove unnecessary includes
Date: Mon, 20 Feb 2023 10:13:53 +0100
Message-Id: <20230220091358.17038-20-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230220091358.17038-1-philmd@linaro.org>
References: <20230220091358.17038-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: 4KDgWH23ixYD

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Message-Id: <20230215112712.23110-17-philmd@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 hw/ide/ioport.c | 10 ----------
 1 file changed, 10 deletions(-)

diff --git a/hw/ide/ioport.c b/hw/ide/ioport.c
index 7156c465da..d869f8018a 100644
--- a/hw/ide/ioport.c
+++ b/hw/ide/ioport.c
@@ -25,16 +25,6 @@
 
 #include "qemu/osdep.h"
 #include "hw/isa/isa.h"
-#include "qemu/error-report.h"
-#include "qemu/timer.h"
-#include "sysemu/blockdev.h"
-#include "sysemu/dma.h"
-#include "hw/block/block.h"
-#include "sysemu/block-backend.h"
-#include "qapi/error.h"
-#include "qemu/cutils.h"
-#include "sysemu/replay.h"
-
 #include "hw/ide/isa.h"
 #include "hw/ide/internal.h"
 #include "trace.h"
-- 
2.38.1

