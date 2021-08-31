Received: by 2002:a19:5205:0:0:0:0:0 with SMTP id m5csp4821972lfb;
        Tue, 31 Aug 2021 01:32:55 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwu3M6wRjFFgTuHfbH+RhKOSGO82bxTtOKFjHNRJf0GX1+SS7Gn3FvSIUHPScbP0hiPPGWv
X-Received: by 2002:a02:cc30:: with SMTP id o16mr1744311jap.101.1630398775200;
        Tue, 31 Aug 2021 01:32:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1630398775; cv=none;
        d=google.com; s=arc-20160816;
        b=mc1J3VmAxJLmv27R814VUtH27UmhahQ1dVUK7NQLyiVdD7u2rPnE6EDoekxJfpI+YC
         74ZnGcdbTeImaiNYwAsqF7MJkLeAzto509JWKms11QmYxHFdpSz7UfbJCYC1XK3lKPdV
         8Ehqn5P8TG2snIxjrysO4RIK1/X8HI9Q9MMyFnPqqRuvDQSpfWHQV3xDzLoogGCWa8PM
         PIy9x0Jty1Xjv3BBFtaSyWkxu1UNXansfdxVX86EyrhQZriDitCCW7l0ig6Z2j60OH1n
         FIKbJ9783gopKmBkb5YVq8hJC8s3f0C/dSSGceD357jpCdWpInIDwj/wcKXxq7W94/Pj
         97Zg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :ironport-sdr;
        bh=DkZidACu+UWAv4V3W3lK4dQeNltNHOI0g3zJ+fuad0o=;
        b=rzB2TEPil+T/HQ+sdHCSQu0TkqrcYodbT5L4ImVQ+9Zd0urdTrBXDXbbx2CSqrvlRI
         Eg8Ai0hoYh7hOT2kQ9tC+nPCBpLaf4NTSf/ilVBbaQDW+Vt3ma15lOAV+lpMQtpGTa3+
         REqg1XD0rdhiM1xK+nxMMTMU4pYyuyGhep+rHbcjCID/S8vd2xq45vx4CYql8AwekKgr
         gR04Y2QVn5DLhA0I6flXWJGJR2Z8qbfexQQpSESMsXqmzCriY28AKVvZBTThdrnCHbly
         ZqaPEw+0VLCmY4utAw3akZ5ckadsR/Ot4ObMQzsqtm9M7880JZUVUelYxRQNor4mPWI4
         5AgQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=fujitsu.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g7si22143483iov.41.2021.08.31.01.32.55
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 31 Aug 2021 01:32:55 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=fujitsu.com
Received: from localhost ([::1]:60568 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mKzCQ-00030n-J1
	for alex.bennee@linaro.org; Tue, 31 Aug 2021 04:32:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57254)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ishii.shuuichir@fujitsu.com>)
 id 1mKz9V-0005tk-TQ; Tue, 31 Aug 2021 04:29:55 -0400
Received: from esa7.hc1455-7.c3s2.iphmx.com ([139.138.61.252]:60598)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ishii.shuuichir@fujitsu.com>)
 id 1mKz9P-0007xM-Ra; Tue, 31 Aug 2021 04:29:51 -0400
IronPort-SDR: OBLYWRqgT2DDPQ1ax6Ika7sto3GDry/BdcXyYTTS9VY7vF+gtA872Cr9PpmtED2FMNWdVAylM+
 PB4pGD+BM+0BfCM9yLfc8ko6APFEoV2m7RiVsdCG7Pje0oj3aNTUfTFyqqFS5WJ+nhRGFOWlC1
 F95Uy+52bmmWpy/pbp6cXWZKzcK3k3uXe1eJkrLPiWKcQdtD7EUP0GYJ463PmQeLh2wMfJizDF
 Ay3rwZ2th8e9ZhQU3K5xfXzOEUH6SXSa3sAslIpJt/IQcemyUPvj+Ku0uXp4Hj6ukNXDAqmhDi
 GA8gDXWOYvYY1kcUr2k87B0r
X-IronPort-AV: E=McAfee;i="6200,9189,10092"; a="21313590"
X-IronPort-AV: E=Sophos;i="5.84,365,1620658800"; d="scan'208";a="21313590"
Received: from unknown (HELO yto-r4.gw.nic.fujitsu.com) ([218.44.52.220])
 by esa7.hc1455-7.c3s2.iphmx.com with ESMTP; 31 Aug 2021 17:29:43 +0900
Received: from yto-m3.gw.nic.fujitsu.com (yto-nat-yto-m3.gw.nic.fujitsu.com
 [192.168.83.66])
 by yto-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id 4430D6CCAB;
 Tue, 31 Aug 2021 17:29:43 +0900 (JST)
Received: from oym-om3.fujitsu.com (oym-om3.o.css.fujitsu.com [10.85.58.163])
 by yto-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id 90CBF56F9A;
 Tue, 31 Aug 2021 17:29:42 +0900 (JST)
Received: from localhost.localdomain (n3235113.np.ts.nmh.cs.fujitsu.co.jp
 [10.123.235.113])
 by oym-om3.fujitsu.com (Postfix) with ESMTP id 6039040198668;
 Tue, 31 Aug 2021 17:29:42 +0900 (JST)
From: Shuuichirou Ishii <ishii.shuuichir@fujitsu.com>
To: peter.maydell@linaro.org,
	drjones@redhat.com,
	qemu-arm@nongnu.org
Subject: [PATCH v6 2/3] hw/arm/virt: target-arm: Add A64FX processor support
 to virt machine
Date: Tue, 31 Aug 2021 17:29:39 +0900
Message-Id: <20210831082940.2811719-3-ishii.shuuichir@fujitsu.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210831082940.2811719-1-ishii.shuuichir@fujitsu.com>
References: <20210831082940.2811719-1-ishii.shuuichir@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
Received-SPF: neutral client-ip=139.138.61.252;
 envelope-from=ishii.shuuichir@fujitsu.com; helo=esa7.hc1455-7.c3s2.iphmx.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_PASS=-0.001, SPF_NEUTRAL=0.779 autolearn=ham autolearn_force=no
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
Cc: qemu-devel@nongnu.org, ishii.shuuichir@fujitsu.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: eZZryoLkTGET

Add -cpu a64fx to use A64FX processor when -machine virt option is specified.
In addition, add a64fx to the Supported guest CPU types in the virt.rst document.

Signed-off-by: Shuuichirou Ishii <ishii.shuuichir@fujitsu.com>
Reviewed-by: Andrew Jones <drjones@redhat.com>
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
index 86c8a4ca3d..3fa4295a78 100644
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

