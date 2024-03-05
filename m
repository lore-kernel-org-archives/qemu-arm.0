Received: by 2002:a17:906:3750:b0:a44:3ba0:e9d1 with SMTP id e16csp376358ejc;
        Tue, 5 Mar 2024 08:01:34 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCVWOZINnhTv6oghE+OcgBuB2vQzDIuvk/CzV6cthNe4yqVZMvqo8X62gKVFKLYq1bM5VyMiHWCfopA1EdCQXopWixkN4ZIy
X-Google-Smtp-Source: AGHT+IEHMfbUQAZLNTnJDjgfgl5Q2vfa8PQsM45Wa6lPE0AMKQF3pz2L/qeWFYVHp70upUBJVO35
X-Received: by 2002:a05:6870:70a0:b0:21e:80ee:523b with SMTP id v32-20020a05687070a000b0021e80ee523bmr2353179oae.34.1709654493905;
        Tue, 05 Mar 2024 08:01:33 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1709654493; cv=none;
        d=google.com; s=arc-20160816;
        b=FNB02fdnXXY6yIumf3Hxf6esr7LkyyIuxcyeJQUDhg18mx6uWwKx5e3+lGggIThpim
         mU5c020UYSl9CJ0hWlzQK67fzSsgablAMOHs/w7ZKY9LS/5Fy2Crp82H1ywXbv4fmr+j
         joA6oevDm9WRDg6D1wogZ/70i8WQ1ZwUJsTBk27T+xaTeNxfUp8NRRmxpDlz2LFTyeTw
         7zStjzUI2VS/Mi4pV57RmEztsLZYe2UNC69UjxMoTNI/5tD4HuHQXDE8rDjexCHxL+fo
         Y/cJ0lWR3baAmJO1dZ2A82bu2wcNyfSPfa85rszh6VitNuBSdhCidMxY4G29AK8ZzYGk
         M5kQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=5JjwNBMG2GsvzQ6nB+0Hsc0Mpt86WlSXCQzuq9IjmKs=;
        fh=cWYLLp2xiaCPawONafvmArBA+kFDFtOI7kkn8ypnRsk=;
        b=lz5hSfbSLv4/N+6EysLnxlvobqunRayQhF0LHqCOIb7ZDZv0Ks+554GbQSYoMmpS5T
         LXrrR3m1TRqeyRCm2F9atkc8/KjaYewxbmuUdH4uN1ofaNnstNJ7WwUSF19pyWa94SzH
         7LJYH3+mjybhtui7445hUlXMIOWhO2I71g6OVqMgexZFMiUeCQpThWTTrn9cWHRT1vxM
         zVDc/4Wxgr/OldYffoAZWj5T1rFNpUtPtJYDBplnRmDIHXxwe4qX0FcXdkco7kppXUfW
         rlDiYNgfPdt0JHMZqNZUOzCK4wMq7JqCVsN/ovlyOLq+5JbVq8IWAp4MUAghHUE74VPd
         uOcA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=EltinEVN;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id fe2-20020a056130188200b007da03ad070dsi1814622uab.12.2024.03.05.08.01.33
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 05 Mar 2024 08:01:33 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=EltinEVN;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1rhXBe-0006Ot-Hn; Tue, 05 Mar 2024 10:58:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1rhXBI-0005xn-Js
 for qemu-devel@nongnu.org; Tue, 05 Mar 2024 10:58:23 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1rhXBG-0000bV-Hl
 for qemu-devel@nongnu.org; Tue, 05 Mar 2024 10:58:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1709654293;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5JjwNBMG2GsvzQ6nB+0Hsc0Mpt86WlSXCQzuq9IjmKs=;
 b=EltinEVN8hGfuEQup0JT+1IBITx1iY/ayar9eSSozjSfgAIKDPBBMxg1LQAsKcmPrGLBSP
 E/kMOEb0cfATf6cra6tZeTwoYWN52LNmkTTdmACGpTsHbHRlnBjYhFN0LMX878WTDW1s9f
 R1SwKTRCQOtP8attihoj8LRlpsqtaOw=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-316-cM7HLpHzPIOS0bZFRdpcBQ-1; Tue,
 05 Mar 2024 10:58:11 -0500
X-MC-Unique: cM7HLpHzPIOS0bZFRdpcBQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 298013C02449;
 Tue,  5 Mar 2024 15:58:10 +0000 (UTC)
Received: from dell-r430-03.lab.eng.brq2.redhat.com
 (dell-r430-03.lab.eng.brq2.redhat.com [10.37.153.18])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9A70417A99;
 Tue,  5 Mar 2024 15:58:07 +0000 (UTC)
From: Igor Mammedov <imammedo@redhat.com>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org, pbonzini@redhat.com, mst@redhat.com,
 gaosong@loongson.cn, alistair.francis@wdc.com, palmer@dabbelt.com,
 bin.meng@windriver.com, liwei1518@gmail.com, dbarboza@ventanamicro.com,
 zhiwei_liu@linux.alibaba.com, imammedo@redhat.com, anisinha@redhat.com,
 philmd@linaro.org, wangyanan55@huawei.com, eblake@redhat.com,
 armbru@redhat.com, qemu-arm@nongnu.org, qemu-riscv@nongnu.org,
 f.ebner@proxmox.com
Subject: [PATCH v2 14/20] smbios: extend smbios-entry-point-type with 'auto'
 value
Date: Tue,  5 Mar 2024 16:57:18 +0100
Message-Id: <20240305155724.2047069-15-imammedo@redhat.com>
In-Reply-To: <20240305155724.2047069-1-imammedo@redhat.com>
References: <20240305155724.2047069-1-imammedo@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.5
Received-SPF: pass client-ip=170.10.133.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -26
X-Spam_score: -2.7
X-Spam_bar: --
X-Spam_report: (-2.7 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.568,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: sgb3QaN7d678

later patches will use it to pick SMBIOS version at runtime
depending on configuration.

Signed-off-by: Igor Mammedov <imammedo@redhat.com>
Acked-by: Markus Armbruster <armbru@redhat.com>
Reviewed-by: Ani Sinha <anisinha@redhat.com>
Tested-by: Fiona Ebner <f.ebner@proxmox.com>
---
 qapi/machine.json | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/qapi/machine.json b/qapi/machine.json
index bb5a178909..6bdc71dc8c 100644
--- a/qapi/machine.json
+++ b/qapi/machine.json
@@ -1797,10 +1797,13 @@
 #
 # @64: SMBIOS version 3.0 (64-bit) Entry Point
 #
+# @auto: Either 2.x or 3.x SMBIOS version, 2.x if configuration can be
+#        described by it and 3.x otherwise (since: 9.0)
+#
 # Since: 7.0
 ##
 { 'enum': 'SmbiosEntryPointType',
-  'data': [ '32', '64' ] }
+  'data': [ '32', '64', 'auto' ] }
 
 ##
 # @MemorySizeConfiguration:
-- 
2.39.3

