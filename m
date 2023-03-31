Received: by 2002:a17:906:b2c6:b0:930:eaf4:5c09 with SMTP id cf6csp281374ejb;
        Thu, 30 Mar 2023 17:09:10 -0700 (PDT)
X-Google-Smtp-Source: AKy350Zq21CDVeF0fuZEIRd0ehE/0gUdI8DD0v01owI2ycvobEPqcWwIOINIC7fgd96QrcyYxDFp
X-Received: by 2002:a05:622a:514:b0:3e6:3f53:3076 with SMTP id l20-20020a05622a051400b003e63f533076mr449029qtx.42.1680221350530;
        Thu, 30 Mar 2023 17:09:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1680221350; cv=none;
        d=google.com; s=arc-20160816;
        b=qRtOTP7HNVqDLHJMI4EGvZo/PQAJ5lHGFdbSjt2/hGRCesFL8wjTwc6N3s7J71xrcn
         G7n1HhzSfn2jhV4CirM4NnjtMx9qzy4lDgJi5453pH0VtqM+4dX6MdRvN7NPBWXXfT7t
         uJX3JraqIpfTmZkBPHaGqIK4yMOhcHeVfZTdGSUxzQsBeKs/1RgPnmUaoyl4G+TzJj+F
         Hczmx5fCQ8sZFI8rKEqJHLwSMZlbsfhVUkFSVjpgxQzP2+Ki5CAqnDKSLs6RCVwLBBMY
         rn73ysduWXazXVuVRtTzhCsLiWhY9GTRFMqK2+I1pL2K4x8cu4JugEAmrzBE16VB303x
         pszA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:from:subject:message-id
         :references:mime-version:in-reply-to:date:dkim-signature;
        bh=BIiLwLowPEm8vJEjag0ZG940kCvo8Ev0kutlHlOPnEw=;
        b=OJeWWTkkwYHC8qtF72gLew0Zo/1XzprryAu0HZ9sXMVnIabSq6+IXYxXE0GNVCHdCh
         alOF0FglwEY+bHN9H3HIc+LnPcNk5azir3hKtwoxTHCJylMit/X8JV0OTvMovcwRgn5S
         v8D2bJgFVZRy8YN7nE6VIJnADY7el7l+YG28vMqPtAmHHioZ1vDbNTK+v82HDkaW+VN7
         nPXtoAP+F3ejiaW3vkUwQa2zkmVKUa/hfkbPZTQVenaxdcUnKEekJCfSBaj2CHPPdDbQ
         MZ2TcAGf/UAAUuv2PYvb1M+Q+CPvFbn0UI1TkgszUdDXmWsg2TF8JiIQFY1q22YFWTAP
         nOOQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20210112 header.b=ct5Z6vqQ;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m2-20020a05620a24c200b00746bd54d482si608264qkn.4.2023.03.30.17.09.10
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 30 Mar 2023 17:09:10 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20210112 header.b=ct5Z6vqQ;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pi2K9-00078u-Ii; Thu, 30 Mar 2023 20:08:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3gyQmZAYKCow9y9A87w44w1u.s426u2A-tuBu1343w3A.47w@flex--titusr.bounces.google.com>)
 id 1pi2K6-00078F-F1
 for qemu-devel@nongnu.org; Thu, 30 Mar 2023 20:08:54 -0400
Received: from mail-yb1-xb49.google.com ([2607:f8b0:4864:20::b49])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3gyQmZAYKCow9y9A87w44w1u.s426u2A-tuBu1343w3A.47w@flex--titusr.bounces.google.com>)
 id 1pi2Jq-0005nc-DI
 for qemu-devel@nongnu.org; Thu, 30 Mar 2023 20:08:41 -0400
Received: by mail-yb1-xb49.google.com with SMTP id
 e23-20020a25e717000000b00b66ab374ba1so20585024ybh.22
 for <qemu-devel@nongnu.org>; Thu, 30 Mar 2023 17:08:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20210112; t=1680221315;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=BIiLwLowPEm8vJEjag0ZG940kCvo8Ev0kutlHlOPnEw=;
 b=ct5Z6vqQczaHdizahQpf7O6tzLEtBdQphN1bLSJ4/KpzYZEWG+Q67iks6i7FEg8wiZ
 5o6iIhEUeAsAdc3aFjQeahYQ2CNtucA7865ghzj/K405Q/NzDc1sdxwiiN9mhcOgmetZ
 UAzvMIN6NSkUsx/Ip6XHfGUuJX35/3KHMEV7JTFssPeYaFMFCL7598v7SUTWuraEEbph
 UxQkgXYnjXCgeLujKkJzCZXkL5z7xKPMt2vJPpm7kYfHcovr9QO6orE+0bym+AfTKo6u
 265xgvLSOaLd1kDpRs4ervwV1AwWmPfbK7ahlaw4TIEOFXR3cHSwMLcMSdCkZPwEext7
 VU3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680221315;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=BIiLwLowPEm8vJEjag0ZG940kCvo8Ev0kutlHlOPnEw=;
 b=3EhHcYmJvwGe8L3631GIXxWfR6cYzTWo9nd7gNC+fTRcQ24W0EP6rBs/dyi1HtvgMh
 XVmzObxU2H+VRG4Ip22qx0rjEfZhm37U9eaQCwF3Q1OWA5OCXstIBfY+U5dyBTMaSAbP
 tLkPctL48EGFPHZzZHXkCQTYTFxPcWluL7KnV6VivjWa0BFQf3SKS1D3waXUIPzJO15I
 EVf4n87oVcxn3HPQ1qLg0qeQ6vhmsgXiLZ12EHA5e9h/+zZPUirajeBIzv5gKR/MTGMg
 S3de4Gp2Vn445SQFVK6AhvAOCA1eFJbgENU63oAlQpVyflhbX0bYHMUVZRBdjy8Gj8Ey
 nF/Q==
X-Gm-Message-State: AAQBX9dhbdfx3jSMCaGBp71yv3w4G7MTmaf627wA+k78CPu0d9RxQoiY
 RiN72VUBMbmUrfxJHSUcrS9z2uk3zOg=
X-Received: from titusr.c.googlers.com ([fda3:e722:ac3:cc00:14:4d90:c0a8:22b8])
 (user=titusr job=sendgmr) by 2002:a25:3485:0:b0:b6b:d3f3:45af with SMTP id
 b127-20020a253485000000b00b6bd3f345afmr1301898yba.1.1680221315239; Thu, 30
 Mar 2023 17:08:35 -0700 (PDT)
Date: Fri, 31 Mar 2023 00:07:51 +0000
In-Reply-To: <20230331000756.1712787-1-titusr@google.com>
Mime-Version: 1.0
References: <20230331000756.1712787-1-titusr@google.com>
X-Mailer: git-send-email 2.40.0.423.gd6c402a77b-goog
Message-ID: <20230331000756.1712787-3-titusr@google.com>
Subject: [PATCH 2/7] hw/i2c: pmbus: add vout mode bitfields
From: Titus Rwantare <titusr@google.com>
To: philmd@linaro.org, minyard@acm.org
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, 
 Titus Rwantare <titusr@google.com>, Hao Wu <wuhaotsh@google.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b49;
 envelope-from=3gyQmZAYKCow9y9A87w44w1u.s426u2A-tuBu1343w3A.47w@flex--titusr.bounces.google.com;
 helo=mail-yb1-xb49.google.com
X-Spam_score_int: -95
X-Spam_score: -9.6
X-Spam_bar: ---------
X-Spam_report: (-9.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 USER_IN_DEF_DKIM_WL=-7.5 autolearn=unavailable autolearn_force=no
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
X-TUID: aPKjV3rcqsyf

The VOUT_MODE command is described in the PMBus Specification,
Part II, Ver 1.3 Section 8.3

VOUT_MODE has a three bit mode and 4 bit parameter, the three bit
mode determines whether voltages are formatted as uint16, uint16,
VID, and Direct modes. VID and Direct modes use the remaining 5 bits
to scale the voltage readings.

Reviewed-by: Hao Wu <wuhaotsh@google.com>
Signed-off-by: Titus Rwantare <titusr@google.com>
---
 include/hw/i2c/pmbus_device.h | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/include/hw/i2c/pmbus_device.h b/include/hw/i2c/pmbus_device.h
index 7dc00cc4d9..2e95164aa1 100644
--- a/include/hw/i2c/pmbus_device.h
+++ b/include/hw/i2c/pmbus_device.h
@@ -444,6 +444,14 @@ typedef struct PMBusCoefficients {
     int32_t R;     /* exponent */
 } PMBusCoefficients;
 
+/**
+ * VOUT_Mode bit fields
+ */
+typedef struct PMBusVoutMode {
+    uint8_t  mode:3;
+    int8_t   exp:5;
+} PMBusVoutMode;
+
 /**
  * Convert sensor values to direct mode format
  *
-- 
2.40.0.423.gd6c402a77b-goog

