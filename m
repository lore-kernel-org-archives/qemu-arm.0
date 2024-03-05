Received: by 2002:a17:906:3750:b0:a44:3ba0:e9d1 with SMTP id e16csp374708ejc;
        Tue, 5 Mar 2024 07:59:52 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCUmNpWGkV7y1EHRro18Wlk8FI9albhbmdJjLj+zoK1FaWCHEctcqO+5MYk2q01y+1sMgKmBxTa3eOzTaBeI3gaLmUU5Y5LA
X-Google-Smtp-Source: AGHT+IGBtIrVgZXcTT+EL87Wvi7ZhDNwHkPtj9HeBgFSjR+gpvUYnw9fc0fD4RpxpvMxfvgO2AyH
X-Received: by 2002:a05:6358:3423:b0:17b:335c:fa68 with SMTP id h35-20020a056358342300b0017b335cfa68mr2060226rwd.17.1709654392639;
        Tue, 05 Mar 2024 07:59:52 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1709654392; cv=none;
        d=google.com; s=arc-20160816;
        b=WCjmLtNjrBJ0dEYDI3i5tV+UP7S3YJCvHFRPJ28F59Lek7gkdau7/yMAIKfIhioTa7
         VColVX81hwcCW+f9Y61dfPJBYTvdxdkcOmODEl/lgyR2Q7sJGbk8dVsPxxeFAUiWzX5y
         rqzon16eUBB9XEezkpSulrwKLZmHWu/SDg4IY5+BEVgVerk5M+F3V6xuY6LFA3uZzKuv
         d3cffpHpVZynANtm9bs3rW+BJaMOP5QTF0pcg2uXOfO6/O0jnLTfzaSWNIYefB376X+n
         UTSzoN6dLL8F6H4uQVV1FIYvKVdomEJkWvdzgdQHbd+Dgxe+TBqG5Kso4T6Hxw1KBHYS
         gAsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=f4c9OhW/hQJQKbDD3J0uL/RxP31+gk21VGQFZ1SY7OM=;
        fh=cWYLLp2xiaCPawONafvmArBA+kFDFtOI7kkn8ypnRsk=;
        b=doVSFJcqwT85jDMWowzRTijecZs3GQPOafeuxemqyV+Igg/IspjaMgIu/GC5UD//Z4
         iZuMYi7Z3mLNGFRz3z342DKVqIIjIhqbcltDhWAMbtM9qlqQeVY04OMh4bVaLcYUqFE4
         NOeKMVPa7sNLVqPZSqiLCTubKjqHmGfDOQHTwreoMLWJP+zLB1zLATF+435B9c+TBrMw
         po3kMYTX0cjuDNgk3wuHYZyogKgQoH1fo2yNteYf7KSEAUmHl3PLW2+7NoihrTzIlXmO
         J9/BMVTvZQ42XaDV9u5zbu+wd8uXwgZoHFPrAOsGXKkFjeG2IHVcNKGrU2Ux5ANbuxR3
         Xp1w==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="IgW/u9Wg";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w5-20020a05622a134500b0042ef6c73c88si3851220qtk.718.2024.03.05.07.59.52
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 05 Mar 2024 07:59:52 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="IgW/u9Wg";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rhXAt-0005Uw-VS; Tue, 05 Mar 2024 10:57:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1rhXAr-0005Sm-RP
 for qemu-arm@nongnu.org; Tue, 05 Mar 2024 10:57:49 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1rhXAq-0000US-61
 for qemu-arm@nongnu.org; Tue, 05 Mar 2024 10:57:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1709654267;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=f4c9OhW/hQJQKbDD3J0uL/RxP31+gk21VGQFZ1SY7OM=;
 b=IgW/u9Wg8dUnS1aOc3uzpMv/Z1qx6BGmzlbmRqVsgTg7+kEr3SUSI1N14ZkCL+9Zm80TEG
 YM3eyZofQGFvKZ6mmhgaimU4Dt21CTLsg0w0MIXXjVAxq3jVnt713IGvwmsiLru6aBqGNF
 DZ04TEznEpdLsAnuVz5PFIA9eLf+1PM=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-25-Z7PIJC8DNBuBc12ArYkfBQ-1; Tue, 05 Mar 2024 10:57:43 -0500
X-MC-Unique: Z7PIJC8DNBuBc12ArYkfBQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 90B1B180A38A;
 Tue,  5 Mar 2024 15:57:42 +0000 (UTC)
Received: from dell-r430-03.lab.eng.brq2.redhat.com
 (dell-r430-03.lab.eng.brq2.redhat.com [10.37.153.18])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0BCB516A9C;
 Tue,  5 Mar 2024 15:57:39 +0000 (UTC)
From: Igor Mammedov <imammedo@redhat.com>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org, pbonzini@redhat.com, mst@redhat.com,
 gaosong@loongson.cn, alistair.francis@wdc.com, palmer@dabbelt.com,
 bin.meng@windriver.com, liwei1518@gmail.com, dbarboza@ventanamicro.com,
 zhiwei_liu@linux.alibaba.com, imammedo@redhat.com, anisinha@redhat.com,
 philmd@linaro.org, wangyanan55@huawei.com, eblake@redhat.com,
 armbru@redhat.com, qemu-arm@nongnu.org, qemu-riscv@nongnu.org,
 f.ebner@proxmox.com
Subject: [PATCH v2 04/20] smbios: cleanup smbios_get_tables() from legacy
 handling
Date: Tue,  5 Mar 2024 16:57:08 +0100
Message-Id: <20240305155724.2047069-5-imammedo@redhat.com>
In-Reply-To: <20240305155724.2047069-1-imammedo@redhat.com>
References: <20240305155724.2047069-1-imammedo@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.5
Received-SPF: pass client-ip=170.10.129.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -26
X-Spam_score: -2.7
X-Spam_bar: --
X-Spam_report: (-2.7 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.568,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: d5BBImz72Ugv

smbios_get_tables() bails out right away if leagacy mode is enabled
and won't generate any SMBIOS tables. At the same time x86 specific
fw_cfg_build_smbios() will genarate legacy tables and then proceed
to preparing temporary mem_array for useless call to
smbios_get_tables() and then discard it.

Drop legacy related check in smbios_get_tables() and return from
fw_cfg_build_smbios() early if legacy tables where built without
proceeding to non legacy part of the function.

Signed-off-by: Igor Mammedov <imammedo@redhat.com>
Reviewed-by: Ani Sinha <anisinha@redhat.com>
Tested-by: Fiona Ebner <f.ebner@proxmox.com>
---
 hw/i386/fw_cfg.c   | 1 +
 hw/smbios/smbios.c | 6 ------
 2 files changed, 1 insertion(+), 6 deletions(-)

diff --git a/hw/i386/fw_cfg.c b/hw/i386/fw_cfg.c
index 98a478c276..a635234e68 100644
--- a/hw/i386/fw_cfg.c
+++ b/hw/i386/fw_cfg.c
@@ -74,6 +74,7 @@ void fw_cfg_build_smbios(PCMachineState *pcms, FWCfgState *fw_cfg)
     if (smbios_tables) {
         fw_cfg_add_bytes(fw_cfg, FW_CFG_SMBIOS_ENTRIES,
                          smbios_tables, smbios_tables_len);
+        return;
     }
 
     /* build the array of physical mem area from e820 table */
diff --git a/hw/smbios/smbios.c b/hw/smbios/smbios.c
index a3c4e52ce9..8e86c62184 100644
--- a/hw/smbios/smbios.c
+++ b/hw/smbios/smbios.c
@@ -1106,12 +1106,6 @@ void smbios_get_tables(MachineState *ms,
 {
     unsigned i, dimm_cnt, offset;
 
-    if (smbios_legacy) {
-        *tables = *anchor = NULL;
-        *tables_len = *anchor_len = 0;
-        return;
-    }
-
     if (!smbios_immutable) {
         smbios_build_type_0_table();
         smbios_build_type_1_table();
-- 
2.39.3

