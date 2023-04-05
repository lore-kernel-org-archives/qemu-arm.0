Received: by 2002:a17:906:b2c6:b0:930:eaf4:5c09 with SMTP id cf6csp480060ejb;
        Wed, 5 Apr 2023 09:05:21 -0700 (PDT)
X-Received: by 2002:a05:600c:ad6:b0:3ed:abb9:7515 with SMTP id c22-20020a05600c0ad600b003edabb97515mr5190142wmr.11.1680710721514;
        Wed, 05 Apr 2023 09:05:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1680710721; cv=none;
        d=google.com; s=arc-20160816;
        b=ke1/ICtlX/33rMzcqRCAVpN8e+XPlmzz77kO1m8TBnCLWeSZbgpU18QXuMRkDaQyUc
         E3uTK7b1W5+UyNw5TVNPpJv06J24yFw42PmFs44q58FgnI2Qt1hpIQIvmYd32DLIqrW+
         jtGTD/8jndb9khzh/HuXg+YFwlSINZX53yHTQPt6CKJwHGsEJRYA9Xy0JqKIUBeIhFI0
         UBEM8YganfpbKj8vHuZWX/nxyWoLJ6ElJd3YYZjmYMkYP9lRusDE2C/8C1H3m7X6a8qD
         P1fJ83kVAkLfC9RTaBmIG8bzmjojCUuxSCLDPZF77Zq/7kiN/BwgQmzgjPZc7E/A5Gb+
         UFhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=5CSHrPIDjf1IWIN1nnp6I0uB6O25vizWYPyXq8gYKvo=;
        b=iZPhxvNDd1MvWBcptIShjaFU25NAWwosNr/fhCQ0isPp/8HYvnCbQzvrgL1hCjOE3+
         2IPaLoaVv+zkBCMET2k3CneAwqC/I3lgaFSV+L97ji2729BMWZs/fFQhalE3C4QiEEeR
         DFd0ElPU9CjS7YARiGfdnoQyBNnPtStuBXatVmJEDkQuQSiNowlmE/cfXTHOBz1Fmvqc
         AHYB+JKwC9YrJ2ffPWy03RnzNyG485d3NDTFSNGPVbCE045oWx0AKskzYOs7PVnDgUP6
         c5X66oDiVFtv/QiOM8S8AjwLwK6eYy7urkanJk6yPVLjzFvmfBoWHOXMYbN+vCaV1Ukt
         NAzQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=G6pPxv8m;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id q11-20020a7bce8b000000b003ed21059ac5sor695618wmj.42.2023.04.05.09.05.21
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 05 Apr 2023 09:05:21 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=G6pPxv8m;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680710721;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5CSHrPIDjf1IWIN1nnp6I0uB6O25vizWYPyXq8gYKvo=;
        b=G6pPxv8mxmBXT/A7Fms6p48gVBPAVhCbwwptPPupZJfFBxICRxzF5EfjLYHeeUdIOM
         KuTVNoN2hg8Z3US/l5DXZyRgclnPh2Svov5K5NTEkQxYcjBSczhbLwslailyhLzmv6Hx
         91gp8FcyA1tMzQYLGb0/U7BSEeLNYMUXaL3U64SUPUMVKewIvfK4P2ZczU3Eu+z/zV/O
         nTNCHqofXowPBxAA4rcW8XP7R0rJ7wuGTOYWFborUVJW0xF27yen/vXwymcuMP8cWAbJ
         k89Nl96lVK8m1OUz0Xtgy2IppNpCw1q/fBG9RE/e5WdoX3T9mSBBSUEfBaVAMGEYLdkN
         N91w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680710721;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5CSHrPIDjf1IWIN1nnp6I0uB6O25vizWYPyXq8gYKvo=;
        b=n85j3YTiusPFPIH/9LzzO/IgWBKAhVyRuYkoqpuc+V5G+rz9UV/mhn28QbrgzmLxih
         nkMpGWKqdsTz1ACnlvmv9qGeLZMuhMMlMoKEDHMF3ipm1LPqjo88OLETFtWjo0+42MDV
         2K37sB+meaMgEaX9VWdp49Akc2iwdh9T+EHZTz3+zHRi4/HR5IRTS61AsAe5hp1X9n/x
         hknlfnjrBgR7A1FMoNE7N6kjbOVNXcu0VTymX+cj8URPpd862J6yGhstv3dOiNHBsVz0
         0dta/jo0dpnu6BQzUKAJV85zh/ReqEZAtl4QdZeFIoQOcEXNy0vrbxnUf1NJuLMdHTzo
         8TDA==
X-Gm-Message-State: AAQBX9cOW1gKKNtO9AokzJ/h0zZXjQF8ARdh6p8T76ggCVh+kTt+G+cI
	IPXKviwZKRCRb+e3Zb6cR81HLptd
X-Google-Smtp-Source: AKy350b2wk0eAixgIQgLvmWawSUCyvt3DQf5sn09y8olDFh7GE1/OjoIxJal0B3a+G4fHcJYO+q/Sg==
X-Received: by 2002:a7b:c4ca:0:b0:3ed:e5db:52e1 with SMTP id g10-20020a7bc4ca000000b003ede5db52e1mr5471510wmk.15.1680710721116;
        Wed, 05 Apr 2023 09:05:21 -0700 (PDT)
Return-Path: <philmd@linaro.org>
Received: from localhost.localdomain (4ab54-h01-176-184-52-81.dsl.sta.abo.bbox.fr. [176.184.52.81])
        by smtp.gmail.com with ESMTPSA id r15-20020a05600c458f00b003f03d483966sm2662576wmo.44.2023.04.05.09.05.19
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 05 Apr 2023 09:05:20 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-s390x@nongnu.org,
	qemu-riscv@nongnu.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	qemu-arm@nongnu.org,
	kvm@vger.kernel.org,
	qemu-ppc@nongnu.org,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH 04/10] hw/intc/arm_gic: Rename 'first_cpu' argument
Date: Wed,  5 Apr 2023 18:04:48 +0200
Message-Id: <20230405160454.97436-5-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230405160454.97436-1-philmd@linaro.org>
References: <20230405160454.97436-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: TpVzaAQEwhRo

"hw/core/cpu.h" defines 'first_cpu' as QTAILQ_FIRST_RCU(&cpus).

arm_gic_common_reset_irq_state() calls its second argument
'first_cpu', producing a build failure when "hw/core/cpu.h"
is included:

  hw/intc/arm_gic_common.c:238:68: warning: omitting the parameter name in a function definition is a C2x extension [-Wc2x-extensions]
    static inline void arm_gic_common_reset_irq_state(GICState *s, int first_cpu,
                                                                       ^
  include/hw/core/cpu.h:451:26: note: expanded from macro 'first_cpu'
    #define first_cpu        QTAILQ_FIRST_RCU(&cpus)
                             ^

KISS, rename the function argument.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/intc/arm_gic_common.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/hw/intc/arm_gic_common.c b/hw/intc/arm_gic_common.c
index 9702197856..889327a8cf 100644
--- a/hw/intc/arm_gic_common.c
+++ b/hw/intc/arm_gic_common.c
@@ -235,12 +235,13 @@ static void arm_gic_common_realize(DeviceState *dev, Error **errp)
     }
 }
 
-static inline void arm_gic_common_reset_irq_state(GICState *s, int first_cpu,
+static inline void arm_gic_common_reset_irq_state(GICState *s,
+                                                  int first_cpu_index,
                                                   int resetprio)
 {
     int i, j;
 
-    for (i = first_cpu; i < first_cpu + s->num_cpu; i++) {
+    for (i = first_cpu_index; i < first_cpu_index + s->num_cpu; i++) {
         if (s->revision == REV_11MPCORE) {
             s->priority_mask[i] = 0xf0;
         } else {
-- 
2.38.1
