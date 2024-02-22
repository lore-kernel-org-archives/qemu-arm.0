Received: by 2002:a17:906:2317:b0:a3e:79c1:d636 with SMTP id l23csp219348eja;
        Thu, 22 Feb 2024 04:57:21 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCW8JRV5MXumUvXNSg1JCYd6O7LHm1DCRDTubt5Ls7ZpSNBb7MUs3GtgHMBtTGSHExuOk507O1s85dJvxuePZgdsk/TDpgDP
X-Google-Smtp-Source: AGHT+IEIbZJwFLD1Brqt5989NNZeD6Yr9ZLOUcKPw/ix/K0/uEOPrcYT4uk/d66eJN7TlX2YoEoA
X-Received: by 2002:a25:9b05:0:b0:dcc:84ae:9469 with SMTP id y5-20020a259b05000000b00dcc84ae9469mr1930597ybn.64.1708606641595;
        Thu, 22 Feb 2024 04:57:21 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1708606641; cv=none;
        d=google.com; s=arc-20160816;
        b=zAfKWCur/WY72R+bh17vRcpL5wz/0o2DsapG09jXUw+Hxr2o2TR8zTQW2N3Gcya1nS
         PWhzIyjqEZFvzoHya9N4D2YttXSP7uoMpbgRve1FN7skzvBxMDQV929/P0/s0MGa8lPb
         vy0TI2Z+grBtyOHVEzN8gk98AkSa98cxPDInx91UMlnPMajlU949pvtBioYqEfG+zDjm
         mYrO/LLz/eS7A2aYnZLGlL2D5EbizGC4UyRe3e8hOgSNJAEZ8jcqBEd4KRmF1VWcQnhb
         /sD7xZsi0jOPT7rwwbIrmr5qHrjJRKwXJFKSXN3OgYPL/wBgV7ti+odd1jzWT7Lfe5OR
         Z9gA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=7fiMAHxMKyZo0atwcCXeNwXI7oIw0a2AWdKKNEO+8KQ=;
        fh=bKY2eAhf3KGMBh/38JNHzScGgYYDsemHAt+9upkCl9s=;
        b=AmSl9l9Owpb477cB6B23gBCGWwFeuFsApEy4r5FCBGuZudMihmIdAUJ2uRPQdBp3BS
         WX2OXIG2ZJnZtNyfgImQrE9FEk7PqDrmVdWGx0k1CtVgXA4fgrg8mcc/qApkYYcihNd7
         ftuYh2hNnk+A7+NP8rTc/tpg3QWNPEtDsQ/nXhWh/V8SBdwSTPvatThUY5ReFG0Lqe+P
         X4u+doIiQH5MOH2ILX9zeGp0BJpdIzgCOll6kKhNbHWEU0H3/dMfWUz+wIDa7i/UBlqb
         ekwj+yJsU/a9zQs3vH+xjFFXdYUH0YURYj/8uUQWggpgvOGD618Lqglt0m5BzuYiXkX5
         5YwA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=VMR+cqXz;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id vq27-20020a05620a559b00b00783e08c89f7si12962457qkn.749.2024.02.22.04.57.21
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 22 Feb 2024 04:57:21 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=VMR+cqXz;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1rd8cW-0006Sv-4J; Thu, 22 Feb 2024 07:56:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rd8cP-0006Gz-Rj
 for qemu-devel@nongnu.org; Thu, 22 Feb 2024 07:56:07 -0500
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rd8cN-00057C-9S
 for qemu-devel@nongnu.org; Thu, 22 Feb 2024 07:56:05 -0500
Received: by mail-wr1-x42f.google.com with SMTP id
 ffacd0b85a97d-33d146737e6so5194002f8f.0
 for <qemu-devel@nongnu.org>; Thu, 22 Feb 2024 04:56:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1708606561; x=1709211361; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=7fiMAHxMKyZo0atwcCXeNwXI7oIw0a2AWdKKNEO+8KQ=;
 b=VMR+cqXzncKn+tBrEvJ9rICGNY0FU62FsKmsYACOnXUb/tT4Rchox6nFj1GPTlFLNf
 I0Gb84VjbClL6VutIjZYRHdBeskPwiUtHfKOGSVul959+UnmspOUkFU8ijs2+vUH/xoW
 c4J/xklRMNl3AuOLAbUhdcDUZJADl9u4VexyIVghcGec1B8yQ4Tc2HCp24LZUEZ2ipzJ
 3u7PaI68n34jFAltBwbN2USo5ODineNZ44L83xr/u4l/m+04lPvWC/KaF6VHTkX0e83W
 TyDGL+MAzaou+v0StRl43nCs97WfAu+qMS0ai/7Q7tnLGrwX0a5+y8XhGfsDFRsriE50
 UMjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708606561; x=1709211361;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=7fiMAHxMKyZo0atwcCXeNwXI7oIw0a2AWdKKNEO+8KQ=;
 b=Q63hv2lHIz9dsIUFHB+Npk/05hZRDk1fp9mjUV/ca+x7FexOMY2zA6EzZYQ0mAhwMe
 GjenglcKP2Ppc2XQc49ZvaTLwjXNHRlh0w4swDt3Vi3GAMMzj+iROpFXYizXvXrvIUEy
 9yt08UWb/W+xX9K9blMT7ainQFWLPTVCX6xchqpeju+1y8/jY3PTLrbeLHOymJxkAdRl
 D5ZRUgOeTfGM+fq9yy7tYXCkuacc+nOIbapprnzgSRQZOEUu+h7ZqLwmN79e/x0QP1g6
 /lFWjD1yZZP8V89hT9ondw2D3Vb8jNawXxLvzKAXLYic781JEh1W9r8GB2A4IWDY5pvB
 4Shg==
X-Gm-Message-State: AOJu0YyvyfCi6cdql4ucGO6PV6p2EjFHjqp/8vVYxd4jU5YimyVCSlV9
 ACb+lcTTGGo7ai3fcERY2RCK29HEwwrpv8Cc/PMUsaZ6Ywswb/vjQJCbZM2bQw4XDPA2SyaFgrs
 X6Rw=
X-Received: by 2002:a5d:5645:0:b0:33d:3b82:ab2a with SMTP id
 j5-20020a5d5645000000b0033d3b82ab2amr9485069wrw.19.1708606561338; 
 Thu, 22 Feb 2024 04:56:01 -0800 (PST)
Received: from m1x-phil.lan ([176.187.211.34])
 by smtp.gmail.com with ESMTPSA id
 b7-20020adfe647000000b0033b406bc689sm20495892wrn.75.2024.02.22.04.55.59
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 22 Feb 2024 04:56:00 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Zhao Liu <zhao1.liu@intel.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>, Ani Sinha <anisinha@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
Subject: [PULL 24/32] hw/acpi/ich9_tco: Include missing 'migration/vmstate.h'
 header
Date: Thu, 22 Feb 2024 13:55:15 +0100
Message-ID: <20240222125517.67131-8-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240222125517.67131-1-philmd@linaro.org>
References: <20240222125517.67131-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: 9zZZO7Uk0H45

We need the VMStateDescription structure definition from
"migration/vmstate.h" in order to declare vmstate_tco_io_sts.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Zhao Liu <zhao1.liu@intel.com>
Message-Id: <20240219141412.71418-4-philmd@linaro.org>
---
 include/hw/acpi/ich9_tco.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/hw/acpi/ich9_tco.h b/include/hw/acpi/ich9_tco.h
index c4393caee0..2562a7cf39 100644
--- a/include/hw/acpi/ich9_tco.h
+++ b/include/hw/acpi/ich9_tco.h
@@ -11,6 +11,7 @@
 #define HW_ACPI_TCO_H
 
 #include "exec/memory.h"
+#include "migration/vmstate.h"
 
 /* As per ICH9 spec, the internal timer has an error of ~0.6s on every tick */
 #define TCO_TICK_NSEC 600000000LL
-- 
2.41.0

