Received: by 2002:a17:906:e92:b0:a3e:79c1:d636 with SMTP id p18csp2756039ejf;
        Tue, 27 Feb 2024 07:49:51 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCUy2HeBl/wDW2F856JN9evr2NslKdvwr2n7jRj0XuIv24mJ7Qe8YLofNjxcXtogXuJUle++TA/K2TAY2pKNIdrKkOjKqDV4
X-Google-Smtp-Source: AGHT+IGuuOv3wr6ZyKvWPfI9EXXwXd37pQl9kl0ydoWMUrznS8ogzxl4iXKYp9X2jVURdktTzKBf
X-Received: by 2002:a05:6358:7e97:b0:17b:6391:1133 with SMTP id o23-20020a0563587e9700b0017b63911133mr11903722rwn.18.1709048991451;
        Tue, 27 Feb 2024 07:49:51 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1709048991; cv=none;
        d=google.com; s=arc-20160816;
        b=tuci61jq+uAol8LxJ5+kPemza+yiP5O5jdLnyXXVjsgAUwJLiF97QU9D7VhKOs6ubL
         +Q72zC+znOpt6cHWfaMUPnORXq1QSYxeBmIBNUdwITzthmNF2i7cDOFCwZnzm+H2IoKD
         k47ptvmrdOjtYKWQdR1OP8O4QVdOaoxfYP78Gm5mc+UgT9ZVB7MoEbWiySS67uB7vPV8
         t5ZM/IExmIRIsLqpn5XchXhM33vZ/q2JfXhtNbFaacnFtrSE0FAQKeq84BpGpuuz09Q8
         esgeuuMO7Q6Gj67gbtBzV2Vbk1Mh3YkCqlul5nGRVtXYaOxA9+/7SvCBF7UlKdzK0IEb
         1Hfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=++AUaU8SgWquDReeixAm8dR4jMcNYJcmgNwHijVXY7E=;
        fh=cWYLLp2xiaCPawONafvmArBA+kFDFtOI7kkn8ypnRsk=;
        b=QahwleRQ/M+2Grt42SmlmaP6OrJkPhx7B4HxgkELTvwd6hbTnYl9uUUrveDxZ9FoV3
         14KKku+0Is6V5ajHe5tkGNE09VjB0tkhml/7sckd+JVoIFEs8J+O/szmP1bavSOm6bQu
         b05xyX4OnRUpnRedB18uOF1LPX45644CK9DHIlWY+odsSQoRBmW6qAA8DIV7hlM6OMoh
         fU+Y9lDqCYnA3gM1tLd0BmzoeVAILXshBTHmY46/DyjT0OqaFMXMQoAzIY/Mhql9MrPX
         6t8zqnasyh/fS0npScdN0uzFyz4QaBfNxZkckMgUW1cE45N2uEFFdTMP98lzahIxWsee
         hLmw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=YICZYQMG;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id iv5-20020ad45ce5000000b0068ce8b50553si7769026qvb.426.2024.02.27.07.49.51
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 27 Feb 2024 07:49:51 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=YICZYQMG;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rezgn-0005XM-OQ; Tue, 27 Feb 2024 10:48:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1rezgm-0005Wi-6g
 for qemu-arm@nongnu.org; Tue, 27 Feb 2024 10:48:16 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1rezgj-0008O2-7G
 for qemu-arm@nongnu.org; Tue, 27 Feb 2024 10:48:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1709048890;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=++AUaU8SgWquDReeixAm8dR4jMcNYJcmgNwHijVXY7E=;
 b=YICZYQMGewPkd56bkFDry5cfO7iU/SMpp5l1L47RTDsPKK8Mo0aPlDWDPlYzaU+L1GEery
 4jGpmQrD0e0mqVeaJbxEup1cCti+5HDRvX27kjp7SVGhT7C4IuodvhI68L0pQ+b0R8kU/3
 E2nU99tFA2RArPZ1egZ1GotrwTfpMTo=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-100-bL16xRokOcqBOb3EEChAEQ-1; Tue, 27 Feb 2024 10:48:07 -0500
X-MC-Unique: bL16xRokOcqBOb3EEChAEQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7E3B010B0706;
 Tue, 27 Feb 2024 15:48:06 +0000 (UTC)
Received: from dell-r430-03.lab.eng.brq2.redhat.com
 (dell-r430-03.lab.eng.brq2.redhat.com [10.37.153.18])
 by smtp.corp.redhat.com (Postfix) with ESMTP id EC41F2166AE6;
 Tue, 27 Feb 2024 15:48:03 +0000 (UTC)
From: Igor Mammedov <imammedo@redhat.com>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org, pbonzini@redhat.com, mst@redhat.com,
 gaosong@loongson.cn, alistair.francis@wdc.com, palmer@dabbelt.com,
 bin.meng@windriver.com, liwei1518@gmail.com, dbarboza@ventanamicro.com,
 zhiwei_liu@linux.alibaba.com, imammedo@redhat.com, anisinha@redhat.com,
 philmd@linaro.org, wangyanan55@huawei.com, eblake@redhat.com,
 armbru@redhat.com, qemu-arm@nongnu.org, qemu-riscv@nongnu.org,
 f.ebner@proxmox.com
Subject: [PATCH 04/19] smbios: cleanup smbios_get_tables() from legacy handling
Date: Tue, 27 Feb 2024 16:47:34 +0100
Message-Id: <20240227154749.1818189-5-imammedo@redhat.com>
In-Reply-To: <20240227154749.1818189-1-imammedo@redhat.com>
References: <20240227154749.1818189-1-imammedo@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.6
Received-SPF: pass client-ip=170.10.133.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.088,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: st4ubOfJoWcV

smbios_get_tables() bails out right away if leagacy mode is enabled
and won't generate any SMBIOS tables. At the same time x86 specific
fw_cfg_build_smbios() will genarate legacy tables and then proceed
to preparing temporary mem_array for useless call to
smbios_get_tables() and then discard it.

Drop legacy related check in smbios_get_tables() and return from
fw_cfg_build_smbios() early if legacy tables where built without
proceeding to non legacy part of the function.

Signed-off-by: Igor Mammedov <imammedo@redhat.com>
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

