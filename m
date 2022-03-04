Received: by 2002:a05:6214:21e7:0:0:0:0 with SMTP id p7csp1626161qvj;
        Fri, 4 Mar 2022 12:06:36 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxUNgylaZQK+FscTIMd9d5npzHB9kZLZot8POOT48wD9waAZv1bcsqhqh2S+gmnaz/947A6
X-Received: by 2002:a81:c703:0:b0:2d0:cc6b:3092 with SMTP id m3-20020a81c703000000b002d0cc6b3092mr187123ywi.449.1646424396374;
        Fri, 04 Mar 2022 12:06:36 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1646424396; cv=none;
        d=google.com; s=arc-20160816;
        b=YDR4iLzY2k0y1UkMSHAKTp2oFDcRsAlkdKlkYx6O9j52hOWJ8T46eV10biE0POUByy
         Sv6CuE+MOJeQg1InWeE3YWTPy6cxWWCUNOGhOEc2hR2M+cfolTmWW7FDeZYphGOpmi/0
         nLuAYEiiJU8UTW/zmCQk1alwanKhB3o3DYIFxzJOK3TsENiSuPnnDiVUh7K1aN8MiAmv
         XAqpuzXna9NCECnomPNVtBPqmcUZkbC0nVDSlN/FJCcDYV6KxHRQXddod+TROqo/zf/v
         CbPhWrXV8+asPXEdN1q2TL1XZpoIYNL6EWBs0QjNXm23Z7apz/jXGupnhGOj1Uk0LCU2
         vEyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=Yi+EL9Y616xgLruwinXIVDzc3CuIbCMiF0BTJMc+UOg=;
        b=RUt9cRVkNGMvGX7uaHNHfcE26sVXbS4qtwZtlL2oW8BG7Wj9siJlHN90i2unB9VNvn
         WtXsWjrCxnu8OXdMzp1SJf/hvv8K1nh07HvJ0V3qMruGmzXrWi4sbZbytQSsTGTDoV9V
         FtjmGiMNVc8DOJgNfHK4Q2M9n1KNerygTuA7yh5BgDzHgbxCymJPeBNvktUf/vFE8QYu
         zB1A2NDU7TSSwjlvsyo036geM7++TQ6t/r4WpQ5SFHqLFH5GqYBzXTCBes6C/joAReLf
         Bmgr+3+un0RyfgevnrQo1dzMBGit7lIY/aVpaYR2DsK6pdcp0C2WU2I7vxEY62v7QBQa
         YOJg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="KGZm/T7R";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id q203-20020a8175d4000000b002dc2acf2d78si4834036ywc.148.2022.03.04.12.06.36
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 04 Mar 2022 12:06:36 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="KGZm/T7R";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:51488 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nQECB-0000rU-Ty
	for alex.bennee@linaro.org; Fri, 04 Mar 2022 15:06:35 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36702)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nQE8r-00051V-JZ
 for qemu-arm@nongnu.org; Fri, 04 Mar 2022 15:03:14 -0500
Received: from [2607:f8b0:4864:20::1032] (port=52854
 helo=mail-pj1-x1032.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nQE8q-0005yH-0S
 for qemu-arm@nongnu.org; Fri, 04 Mar 2022 15:03:09 -0500
Received: by mail-pj1-x1032.google.com with SMTP id v4so8222165pjh.2
 for <qemu-arm@nongnu.org>; Fri, 04 Mar 2022 12:03:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Yi+EL9Y616xgLruwinXIVDzc3CuIbCMiF0BTJMc+UOg=;
 b=KGZm/T7R3DSVgO5Ml373UVOvKgzN2cad6Aj7WkfSGgFYtMFX8/IaO5uDD3HHFMzDUC
 NzV34No+jwCRbWqioZLE1KOpO+pqEvcCnMiNa3EdpyPosh0bYSWJYnQVRuth4J2do2v5
 Ndvd1Oo1gYEGRKlVEESmLjRHuoORLbSoOJRlX19ln57bD21QccBMgQB5W0sQHu5EZIr2
 noAzwey9B+Q0wdcW8bPob7oCmdfkObXDH60T3/kN5IUIsSb64N3erC2ZAT9WflEgabFO
 mUyTqfketqSIu3L5cWA9o5kyd3KbeE0GdM4YiA300i5Axn65c9O86yZGKVc3/doxCYk1
 +dqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Yi+EL9Y616xgLruwinXIVDzc3CuIbCMiF0BTJMc+UOg=;
 b=ZIEDjrHqWXT7N5llreZ85jhB8+vILcjRHOz3jBakn7VvvgciXwNE+Yfqhzp3SyOmMS
 xJokkwRqi7+cgENNpX3poY36Zr/M6xMO6beqkNKoPzM2uJDWsuZY8dqLFstMboQVnWAv
 LToHiJKlanxPP8VBz+ptuKxS6r7fUX9P0Pn4203py3HPllQZC3EBSBf19CJSdXoWHXiv
 ooJsFTsCqaAE4S6nngsnn4RZzZaC+Af6YqpP5ExlhiOpm/tRDvsLrIHSvewV30HjBN2o
 fYEzb5BL6D1dMwT8xTNjt9z5cGh7jLR0NlNmHlaYVf9VBsPhzjVa5QkDPgHJbSQJZomn
 1Wvw==
X-Gm-Message-State: AOAM532INBUvMjVWk3Ob2imCDDuh4d1AV5/2BLb4QDSVQ+EZiAcYJ3oC
 jzGzjymrwcBypgO9glhDFZXIuQ==
X-Received: by 2002:a17:90b:1b0e:b0:1bf:1c4f:2bc4 with SMTP id
 nu14-20020a17090b1b0e00b001bf1c4f2bc4mr317616pjb.200.1646424186636; 
 Fri, 04 Mar 2022 12:03:06 -0800 (PST)
Received: from localhost.localdomain
 (2603-800c-1201-c600-f24b-57b2-da7c-e304.res6.spectrum.com.
 [2603:800c:1201:c600:f24b:57b2:da7c:e304])
 by smtp.gmail.com with ESMTPSA id
 hk2-20020a17090b224200b001bf0a7d9da3sm5716744pjb.9.2022.03.04.12.03.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Mar 2022 12:03:06 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 2/2] hw/core: Disable LPA2 for -machine virt-6.2
Date: Fri,  4 Mar 2022 10:03:01 -1000
Message-Id: <20220304200301.524525-3-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220304200301.524525-1-richard.henderson@linaro.org>
References: <20220304200301.524525-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1032
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1032;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1032.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: QceHlvBeJsiZ

There is a Linux kernel bug present until v5.12 that prevents
booting with FEAT_LPA2 enabled.  As a workaround for TCG,
disable this feature for machine versions prior to 7.0.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 hw/core/machine.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/hw/core/machine.c b/hw/core/machine.c
index d856485cb4..f3c410fe58 100644
--- a/hw/core/machine.c
+++ b/hw/core/machine.c
@@ -37,7 +37,9 @@
 #include "hw/virtio/virtio.h"
 #include "hw/virtio/virtio-pci.h"
 
-GlobalProperty hw_compat_6_2[] = {};
+GlobalProperty hw_compat_6_2[] = {
+    { "max-arm-cpu", "lpa2", "off" },
+};
 const size_t hw_compat_6_2_len = G_N_ELEMENTS(hw_compat_6_2);
 
 GlobalProperty hw_compat_6_1[] = {
-- 
2.25.1

