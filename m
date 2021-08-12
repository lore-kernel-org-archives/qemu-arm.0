Received: by 2002:a19:c144:0:0:0:0:0 with SMTP id r65csp73927lff;
        Wed, 11 Aug 2021 23:22:23 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzCIPQzfMUlFNpP6A+RD5fYL0uVRROjvV1DWq4vwoQY9TdHuHTk47f2GH8oR7xcx5b+NED6
X-Received: by 2002:a5d:80d1:: with SMTP id h17mr1848351ior.71.1628749342950;
        Wed, 11 Aug 2021 23:22:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1628749342; cv=none;
        d=google.com; s=arc-20160816;
        b=wMgkZ2PPgfacE6xMcmRO+sUCEWx93VNY+wmpeHoFA6mX3OlfKDBQY9BM8lrfrXBM4f
         cjp9+ZQp6fEncOxTJU2N4pbNtgt3LBlYW28pGv8Ft/oQHp5xbKmLNNoeal2LTL3+2eBq
         Wa+N233bvY9vUUqZ5ZskedAUxBh9pflN6/tT+Dtc5nVOhVVnxk1/6r+cQ9o0vZx5xqjU
         N93dhwD6/tXjGYj0wNbPrs46DgYTzTTT3ry9uVNG+LNX3+hZ/m6kUg02ScykmCBAPjMx
         fF9GgCNQX5+IZkfuWHD84wTIHC5lQn8sFuiNayXUsTwxx29+qW6QkxJCzMUrzHKlNBDd
         lzCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :ironport-sdr;
        bh=CdSAhGn6HKVmxL7c3+LP2uE0x1jmS2CEEs40SKy86Cg=;
        b=Zv2zzK+9kG2z5yeq5NtOD6pjmgFvc895X2dnKqfz3ckNgSuVucG7EqYje1/IvE6tTW
         ujd3PEIaZ8T5Gl7vl64IrLBDr4cfCp67wCj5zhexUt78XEz/OTe4K6+jmdNoKgHHnaTy
         WpntOUosJ/OfHljeqPbOe7k0utwKJbiyrUwBn2IoTgSPKfeF6ATFl8bj1AG1YkxIFaFM
         jtp1vDXnizhOIPALlAJvxr4uBvH15HqJerRPLhJB9dcc2uW7S/bHFcXSjPmUxlmzP1ev
         DTVJwLUhz2kw3Kmp6ym0Awgd/E2U/RL4pH3P8q3J9OHErY5m6p4rDZWQlGJUSObh4Cpi
         Ai+g==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=fujitsu.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y26si1929767jar.1.2021.08.11.23.22.22
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 11 Aug 2021 23:22:22 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=fujitsu.com
Received: from localhost ([::1]:52332 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mE46g-0004yL-6p
	for alex.bennee@linaro.org; Thu, 12 Aug 2021 02:22:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36430)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ishii.shuuichir@fujitsu.com>)
 id 1mE46J-0004xG-IV; Thu, 12 Aug 2021 02:21:59 -0400
Received: from esa2.hc1455-7.c3s2.iphmx.com ([207.54.90.48]:20526)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ishii.shuuichir@fujitsu.com>)
 id 1mE46H-00014q-70; Thu, 12 Aug 2021 02:21:59 -0400
IronPort-SDR: Apm9YlV2MIADmTJ0ki4mgBSRU6xjy9QFO3JxFwAslwE4aTeWcomwy6xURnMYJcAjvCm/EgmeL2
 UsFANcqhHznXPiNaADdO8nehWBHwQTq8DGwYadC/mJkWBF3QKQ8HqDidfNKdAECXNuOfwVsqMh
 cmPkpBzSe5JM3/ygNfzSvgN3Eo0yvg6HTQ5KlmG24BTPdNfAil6ynrWDjmF+qTSUV/GxjRvtJK
 Fa8wQZqbF8zgvLhbCyeb71T6tfL1+68aW4bSMs74fp2B4jK7xxBjGxJFxb7L7gSwxb2CtACZqc
 jaaM6xAlyr6KipaSASrqYVDA
X-IronPort-AV: E=McAfee;i="6200,9189,10073"; a="39794798"
X-IronPort-AV: E=Sophos;i="5.84,315,1620658800"; d="scan'208";a="39794798"
Received: from unknown (HELO yto-r3.gw.nic.fujitsu.com) ([218.44.52.219])
 by esa2.hc1455-7.c3s2.iphmx.com with ESMTP; 12 Aug 2021 15:21:54 +0900
Received: from yto-m1.gw.nic.fujitsu.com (yto-nat-yto-m1.gw.nic.fujitsu.com
 [192.168.83.64])
 by yto-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id 3206D6DB23;
 Thu, 12 Aug 2021 15:21:53 +0900 (JST)
Received: from yto-om2.fujitsu.com (yto-om2.o.css.fujitsu.com [10.128.89.163])
 by yto-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id 7AA19C9CCE;
 Thu, 12 Aug 2021 15:21:52 +0900 (JST)
Received: from localhost.localdomain (n3235113.np.ts.nmh.cs.fujitsu.co.jp
 [10.123.235.113])
 by yto-om2.fujitsu.com (Postfix) with ESMTP id 4FFB34007B7FD;
 Thu, 12 Aug 2021 15:21:52 +0900 (JST)
From: Shuuichirou Ishii <ishii.shuuichir@fujitsu.com>
To: peter.maydell@linaro.org,
	qemu-arm@nongnu.org
Subject: [PATCH v4 2/3] hw/arm/virt: target-arm: Add A64FX processor support
 to virt machine
Date: Thu, 12 Aug 2021 15:04:39 +0900
Message-Id: <20210812060440.1330348-3-ishii.shuuichir@fujitsu.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210812060440.1330348-1-ishii.shuuichir@fujitsu.com>
References: <20210812060440.1330348-1-ishii.shuuichir@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
Received-SPF: pass client-ip=207.54.90.48;
 envelope-from=ishii.shuuichir@fujitsu.com; helo=esa2.hc1455-7.c3s2.iphmx.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: drjones@redhat.com, qemu-devel@nongnu.org, ishii.shuuichir@fujitsu.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 8z+SW/hyoMji

Add -cpu a64fx to use A64FX processor when -machine virt option is specified.
In addition, add a64fx to the Supported guest CPU types in the virt.rst document.

Signed-off-by: Shuuichirou Ishii <ishii.shuuichir@fujitsu.com>
---
 docs/system/arm/virt.rst | 1 +
 hw/arm/virt.c            | 1 +
 2 files changed, 2 insertions(+)

diff --git a/docs/system/arm/virt.rst b/docs/system/arm/virt.rst
index 59acf0eeaf..850787495b 100644
--- a/docs/system/arm/virt.rst
+++ b/docs/system/arm/virt.rst
@@ -55,6 +55,7 @@ Supported guest CPU types:
 - ``cortex-a53`` (64-bit)
 - ``cortex-a57`` (64-bit)
 - ``cortex-a72`` (64-bit)
+- ``a64fx`` (64-bit)
 - ``host`` (with KVM only)
 - ``max`` (same as ``host`` for KVM; best possible emulation with TCG)
 
diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 81eda46b0b..10286d3fd6 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -200,6 +200,7 @@ static const char *valid_cpus[] = {
     ARM_CPU_TYPE_NAME("cortex-a53"),
     ARM_CPU_TYPE_NAME("cortex-a57"),
     ARM_CPU_TYPE_NAME("cortex-a72"),
+    ARM_CPU_TYPE_NAME("a64fx"),
     ARM_CPU_TYPE_NAME("host"),
     ARM_CPU_TYPE_NAME("max"),
 };
-- 
2.27.0

