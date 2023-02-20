Received: by 2002:a17:906:da85:b0:8b1:202f:4753 with SMTP id xh5csp2198502ejb;
        Mon, 20 Feb 2023 03:52:52 -0800 (PST)
X-Google-Smtp-Source: AK7set9mThXWG629hd1YsLhcgmqXkkTyBqKzYYQE9iylcKqY5RmK+Sge8vTcxP4P+gEPS2t+yCcK
X-Received: by 2002:a05:6214:1c4c:b0:56a:b749:3ca0 with SMTP id if12-20020a0562141c4c00b0056ab7493ca0mr1298554qvb.35.1676893972113;
        Mon, 20 Feb 2023 03:52:52 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1676893972; cv=none;
        d=google.com; s=arc-20160816;
        b=XDzO82NPGYV/5/+Ur1XT5nSjn/t2bPpj4eMIYDHlNil5Sd66J7Sh2Wj5mVHXExVsyi
         6dE0cb9v2+85h3Gl0FMfl2o1Ca8TlxRME1EI4dmtUz5JWP/CnSuqTa2UKWTVMGsNcpZF
         6xsEMe4y8izIm1qYWC4CgBdGx9QxRy4kZ8yVd3WYTQT7MuwcSWV0kVuCJcm2tquPfpIh
         bK2MV6fq3azrRaEvRrMfqpFUcFjh2/ybdjVAN39Fj0mcmq4H3tzPco47QfqV7XB3c4wU
         1DoJHyepP2wyESa9jfdslnEBSN1qUi6YL6Tmc+HqPlw5mu3vjhtl3YZdjsVWrvq8UxV2
         fYYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=2MXysM/hMTBAFKZjBf1cYIe3OiZof2SNZO7F3Jiq7Aw=;
        b=O7ylRNdCH3MN/TrYLZCCu/uB/joaF/W7O7m8A7Iyt+6ohhmi7Uh9motRBAlVVMAlsj
         F+eofVUjcJ0IaFtZGn6ALzeekUoMTEtArCpvpuEPlclGxqzWP1mYGBkTHety1kwcVZVk
         EUE0FQCQk+uCfkT1zIs/a0dyCBVhBL4PvE4eYcum4W+QyokpfBZ+NQQ2A9Wh6o/QHodV
         EhCAYElcjMIQdKMgV30yEurLE3hgKN9f7Gt+3td1teO6cXXOxTeshLT3ImAKKMwWu9+C
         RyHLxczW9+npFG4c1mPlzZbgmR5Y0jf1Qj2+WssOUq5301ObCSDmmCltcwTJVXf8evO4
         7Cmw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=jrLm4Udf;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m17-20020a05620a24d100b007389c641884si9657660qkn.396.2023.02.20.03.52.51
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 20 Feb 2023 03:52:52 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=jrLm4Udf;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pU4iF-0002M9-46; Mon, 20 Feb 2023 06:52:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pU4i2-00021v-Vo
 for qemu-devel@nongnu.org; Mon, 20 Feb 2023 06:51:56 -0500
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pU4i1-0005AN-Fg
 for qemu-devel@nongnu.org; Mon, 20 Feb 2023 06:51:54 -0500
Received: by mail-wm1-x331.google.com with SMTP id bg28so727433wmb.0
 for <qemu-devel@nongnu.org>; Mon, 20 Feb 2023 03:51:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=2MXysM/hMTBAFKZjBf1cYIe3OiZof2SNZO7F3Jiq7Aw=;
 b=jrLm4UdfOzZSGHl9uxIUnnmfm5FRCSOw1Xj/LSvbkugmpLqKSO+rVRehy7U/bvxHXM
 f6EGPE7ZnSMIAV0eDO+DCGqTdW2VBzew1bjHKt125zd+lWQM3DQ6Iu02XxfyYlSS/8lc
 R7HwC+hFygG/ECC8ikH6pIFCmx557zfLZWTcOZu177CQiv1QTatE7+mBUJWm7PujffSU
 FyN3GMNRmkcTGEUmtzjxl+EBJ2uxRYX17aeB4KOWxNWmmEQz5PeBR5W50AYL9fmbWZI9
 Y0vBXaNQN/dt8lIH54ozPm2eFdOkjWQz5KmLEfZvbNwLktV8ToZc6FoWy4hH83Hgo/6c
 QfLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=2MXysM/hMTBAFKZjBf1cYIe3OiZof2SNZO7F3Jiq7Aw=;
 b=OwB9YZITvHNBDTRbiYPfpJvYlYvizOXKnrWzuvVAKXq0xNJHNFB+oTuO5DENjDESZb
 dIVwuSgt7SQ2zk38/NPpEP/pp+Ree9GkbzRS8M585k0ADDrSDAdQAv8N+eT+EUvvKeqv
 Q3H/Xw/wNs5lFbTKI6omIEpRtUONgtt3+6mJfABsEBWWZ+iaJ9t12xnCQoglSnd2IpFH
 p51wrbQ8xbaQWR9TqEjzAH71rt/mPpqE00GeZcgEFuLk8b7saB0t9p/FK9VlaV6B9ULl
 5uoWCzsoBrw25iMaFHOjxqB8BpjdR2VG5gEiM5XD7BU5ym0VOInt7SghyWP28O0YaygB
 tJqQ==
X-Gm-Message-State: AO0yUKXZDIcLXd4iOe4ZDegz/BLiJq+QUypEK5CM5z7KPcxMX7ni8SOZ
 FUfpw2EdnLXoxfnVuda/wQJrBSmpn4znfgwT
X-Received: by 2002:a05:600c:331b:b0:3df:e4b4:de69 with SMTP id
 q27-20020a05600c331b00b003dfe4b4de69mr250510wmp.27.1676893912035; 
 Mon, 20 Feb 2023 03:51:52 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 m4-20020a05600c4f4400b003e2052bad94sm11464997wmq.33.2023.02.20.03.51.51
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 20 Feb 2023 03:51:51 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Markus Armbruster <armbru@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Alistair Francis <alistair@alistair23.me>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 7/8] hw/timer/cmsdk-apb-timer: Remove unused
 'qdev-properties.h' header
Date: Mon, 20 Feb 2023 12:51:13 +0100
Message-Id: <20230220115114.25237-8-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230220115114.25237-1-philmd@linaro.org>
References: <20230220115114.25237-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x331.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: iB0+U5JJ7wT7

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 include/hw/timer/cmsdk-apb-timer.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/include/hw/timer/cmsdk-apb-timer.h b/include/hw/timer/cmsdk-apb-timer.h
index c4c7eae849..2dd615d1be 100644
--- a/include/hw/timer/cmsdk-apb-timer.h
+++ b/include/hw/timer/cmsdk-apb-timer.h
@@ -12,7 +12,6 @@
 #ifndef CMSDK_APB_TIMER_H
 #define CMSDK_APB_TIMER_H
 
-#include "hw/qdev-properties.h"
 #include "hw/sysbus.h"
 #include "hw/ptimer.h"
 #include "hw/clock.h"
-- 
2.38.1

