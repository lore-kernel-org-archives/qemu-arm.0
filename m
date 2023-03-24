Received: by 2002:a17:906:b2c6:b0:930:eaf4:5c09 with SMTP id cf6csp1495784ejb;
        Fri, 24 Mar 2023 16:11:34 -0700 (PDT)
X-Google-Smtp-Source: AKy350bTzntGoreViqlxxdcusXi5YOIVnPjy80GlF2bNMnKtytY2LbGG9DmeWWWx+t/Ma3I0e/Ci
X-Received: by 2002:a05:6214:411e:b0:5ac:d562:4ea8 with SMTP id kc30-20020a056214411e00b005acd5624ea8mr6156992qvb.9.1679699494712;
        Fri, 24 Mar 2023 16:11:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1679699494; cv=none;
        d=google.com; s=arc-20160816;
        b=FKZ+qLqIeoQd1OPDxlqZdYOtEGJliKMr9pxcrYoIhqWT8WNpJkOS+xF8hRvbAFv+FB
         UYsqPaeyxEiWagLoeucmOOe7DuSMTd5OYFGhAo9RKovyJUYTM+TmsaVgOIDbKx0yU+x0
         vKZI9RTBZDieZQIKT3G5Vvfis3qnypceMb1+KyfBpleFgef2ciCP3PMX69H84RoJPbd6
         ed3oNiEVicUCh6tDBWalEtyColKe3F3ykXVQKBoweHuMKEvKMnXXzV6ySgpugfAdORWK
         8Lc+bfbxzgUf07QlMhPV5CuY5DgKt0hzenyEJjoVfME5UbNHAUKqsR6PC8JXVtKLM84P
         IVuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:from:subject:message-id
         :references:mime-version:in-reply-to:date:dkim-signature;
        bh=bWCWaB7OU5al4gbSkBBDX/6O+Cte3jJAaB+5x9qhbBA=;
        b=MTU620yhV5HCPWOOz1c4T+8dp1M7MGwrQ/HXU+QocEjjysuNT7tJjSawvXoAtBlZsW
         JeWzdya7LFsfJFN2Lnf/SGID9bcqorDqFah/QXYm7ORx1wnTQbJPgrtG2cg5MHFlmclS
         h8ow/q/bGXf1KvNzbhwB4x3JfzaC9Sn9EoBuuFTQyi1qyfitpe+A+pU+UVs0Aq5rfoBi
         /LiPNlId0ksVaBWZyJPPY7R+f5B70G6u3OfrrAW3egoDKGGK5pE9f0xKsadASGwq0Z+K
         q+ludKBci5AtZRY/kKRqq2GvDR+7jUdoKNuD/BvQf/kyVGElhMSoYYByQdYdzEr8NXsF
         02YA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20210112 header.b=YpWPHB2y;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j18-20020a05620a411200b007484a622ba5si1304170qko.607.2023.03.24.16.11.34
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 24 Mar 2023 16:11:34 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20210112 header.b=YpWPHB2y;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pfqXZ-0002LO-BW; Fri, 24 Mar 2023 19:09:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3sy0eZAgKCK4kiVOchgVUccUZS.QcaeSai-OfabcbUbi.cfU@flex--wuhaotsh.bounces.google.com>)
 id 1pfqXY-0002L7-2x
 for qemu-arm@nongnu.org; Fri, 24 Mar 2023 19:09:44 -0400
Received: from mail-pf1-x449.google.com ([2607:f8b0:4864:20::449])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3sy0eZAgKCK4kiVOchgVUccUZS.QcaeSai-OfabcbUbi.cfU@flex--wuhaotsh.bounces.google.com>)
 id 1pfqXW-00082x-FU
 for qemu-arm@nongnu.org; Fri, 24 Mar 2023 19:09:43 -0400
Received: by mail-pf1-x449.google.com with SMTP id
 a6-20020aa795a6000000b006262c174d64so1635445pfk.7
 for <qemu-arm@nongnu.org>; Fri, 24 Mar 2023 16:09:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20210112; t=1679699380;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=bWCWaB7OU5al4gbSkBBDX/6O+Cte3jJAaB+5x9qhbBA=;
 b=YpWPHB2y5IP20uq066o5twARiRsgJPjyRLKttWII1BaeibtfZXM81F7Kf4ie8X4Gw7
 wTCDikMbmQSI5JnS4ES/OtSAAchthNu6XNIQMyie2R8LnBpM3Srdyn7U1xZL89DTNpT1
 UVR/jravhqbJC8VlaLfs49uMXSsmmfOXqsCyFKup2EHLyQ/+o6fFVEbFjyZ03Zw6/5sS
 RUjMnQEsoMLs9zu/8/zYG27xQX1/4nvjaJC8a0Ej1O6dWk8ImfeGIu63BwkrG9+hyc9G
 YMjNU+2l2U2ZU1bNmILe+bqbSDIkVtLR3jVKwgfcu07JLKez/xDJyyI8LNyNWEbYfb5d
 8qGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679699380;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=bWCWaB7OU5al4gbSkBBDX/6O+Cte3jJAaB+5x9qhbBA=;
 b=pGK8RUvsmT0ZfusU3byUMRQ/FfzsWhKNyAh8uMr+lLgUElH+duPdw8Yf2zpoAKo2CL
 P4AoOX9iTFf7Q1J9j+i/qTtGmdBmJSn1zyHj1Eftm5kK921rrISQj8N3YAh0DjOu3fA5
 ZJWXd3kYdLRG/XW1AGefpATt6dPccTLV/pb5QQ3OQQclcVsbL4GbeflKJ4KWgOuyp0ba
 YEKaTSrQoDXUDK/sBk12TRsPFQxCHJ9KP6HR/+WKaY1+OR4YoXdmQ7zg8d2N6goP7IEG
 W4+cDXrQve+ziSwHzGS6OVR1+Q+u5i5vljJvM2jQawZcvaruNHcxZOv6ikS49nsl98fL
 oS/g==
X-Gm-Message-State: AAQBX9fLvA3AdrvWXAjrDCyB+c1IqmJ3FEZ7GeDtIpTyW9fF3GlOPYKM
 swJB+5kBPb+Gxs+aJH5BoBEQMS4g9vPB1w==
X-Received: from mimik.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:4e])
 (user=wuhaotsh job=sendgmr) by 2002:a05:6a00:1a0b:b0:625:4ff8:3505 with SMTP
 id g11-20020a056a001a0b00b006254ff83505mr2536953pfv.1.1679699379982; Fri, 24
 Mar 2023 16:09:39 -0700 (PDT)
Date: Fri, 24 Mar 2023 16:08:58 -0700
In-Reply-To: <20230324230904.3710289-1-wuhaotsh@google.com>
Mime-Version: 1.0
References: <20230324230904.3710289-1-wuhaotsh@google.com>
X-Mailer: git-send-email 2.40.0.348.gf938b09366-goog
Message-ID: <20230324230904.3710289-2-wuhaotsh@google.com>
Subject: [PATCH v2 1/7] docs: enable sphinx blockdiag extension
From: Hao Wu <wuhaotsh@google.com>
To: minyard@acm.org
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, wuhaotsh@google.com, 
 venture@google.com, Avi.Fishman@nuvoton.com, kfting@nuvoton.com, 
 hskinnemoen@google.com, titusr@google.com, peter.maydell@linaro.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::449;
 envelope-from=3sy0eZAgKCK4kiVOchgVUccUZS.QcaeSai-OfabcbUbi.cfU@flex--wuhaotsh.bounces.google.com;
 helo=mail-pf1-x449.google.com
X-Spam_score_int: -95
X-Spam_score: -9.6
X-Spam_bar: ---------
X-Spam_report: (-9.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 USER_IN_DEF_DKIM_WL=-7.5 autolearn=ham autolearn_force=no
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
X-TUID: sTfXi2OO0EIc

From: Havard Skinnemoen <hskinnemoen@google.com>

This allows use to add block diagrams in documentations,
such as the block diagram in docs/specs/impi.rst.

Signed-off-by: Havard Skinnemoen <hskinnemoen@google.com>
Signed-off-by: Hao Wu <hskinnemoen@google.com>
---
 docs/conf.py | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/docs/conf.py b/docs/conf.py
index 00767b0e24..6974647408 100644
--- a/docs/conf.py
+++ b/docs/conf.py
@@ -71,7 +71,11 @@
 # Add any Sphinx extension module names here, as strings. They can be
 # extensions coming with Sphinx (named 'sphinx.ext.*') or your custom
 # ones.
-extensions = ['kerneldoc', 'qmp_lexer', 'hxtool', 'depfile', 'qapidoc']
+extensions = ['kerneldoc', 'qmp_lexer', 'hxtool', 'depfile', 'qapidoc',
+        'sphinxcontrib.blockdiag']
+
+# Fontpath for blockdiag (truetype font)
+blockdiag_fontpath = '/usr/share/fonts/truetype/liberation/LiberationSans-Regular.ttf'
 
 if sphinx.version_info[:3] > (4, 0, 0):
     tags.add('sphinx4')
-- 
2.40.0.348.gf938b09366-goog

