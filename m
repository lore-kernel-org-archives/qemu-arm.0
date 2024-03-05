Received: by 2002:a17:906:3750:b0:a44:3ba0:e9d1 with SMTP id e16csp376510ejc;
        Tue, 5 Mar 2024 08:01:43 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCVlTjBuWZatXkpOZDNDJyXP8NAklq4Sxaz3tvDTDwMp1FNjQBd8h2Gi0/3GFGwsJKzdFyp7Rg1AYHoUE57dIicXeGkVP2Gd
X-Google-Smtp-Source: AGHT+IG7OXv63lHVBiB+rBo7By76m6idP72vdwmVnlwA00xUGz67oDZARJSKaMckiRyHrzagcKnM
X-Received: by 2002:a19:ee04:0:b0:513:4ad1:d89f with SMTP id g4-20020a19ee04000000b005134ad1d89fmr1471621lfb.23.1709654503271;
        Tue, 05 Mar 2024 08:01:43 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1709654503; cv=none;
        d=google.com; s=arc-20160816;
        b=PyEKSTZv99hgapP+ApXlZIfb5v/a+/Lfo7GEVEbFJab/6/nZMgOMe2HgT3J8MORP2G
         QeWeG3YI1IyrHueypTLcK5AMvryKbjO0KClSyscD7u2kDHIXnQwXqOsk+5GkD5Z1gThG
         UyS3XecVeuGR26JsclKl+GHoZ6XFHatgkyKcfaKeR05ND9bxhu+kttQYNyavXFP26eof
         TvU3XOjdJyqBUosX//FT2+EOZVh7SHodg7hndtSg+LboSUzE1+i3wzJJdiTR3zjvFkyp
         TKluBZOzFxHTlKtQAE/x8fWSj/Rb0rpnm/NplQ7sKVm2b02Y9UTKvgyopwZtnu3cP72f
         UMUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=hkBbo0vDNgtkiU5Qwz+ACPxJexgrCeReZuQPnuDgFoI=;
        fh=cWYLLp2xiaCPawONafvmArBA+kFDFtOI7kkn8ypnRsk=;
        b=lCiCTY53cemzTC0MI+a4WvEf9LCzU8q/0d6Ge8y5lTBcXEacskms+DI25pb/+qdf00
         X3pj9aJ/YtP/8Rf+PEKolK2+5e80WxHYrON9ELDZIrDTYfwK25gLnUNclaYwT2zlCYYT
         fIC+5fKi37b3vOLL71tX1uL+MbL2rh8jzx9aHxXCtdWTp4gY0Sv/FfqPlVzgOCLt/qZX
         P8XS9BbN+mH1zjsM4LI0C7TKEehvoTeJsFs4Hw0BDdGBwHMc8GmBbOnlvgZ1tta7duSH
         SI92EdlW5t3RZi80FRKoWo1zYu4gs5NGQDmIq8hGqFnlAwkINS6NBRk4U8yQ23VmyY0k
         Yyzw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=ZOMC7znO;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id gn40-20020a1709070d2800b00a44f3d80eb0si3056008ejc.86.2024.03.05.08.01.43
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 05 Mar 2024 08:01:43 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=ZOMC7znO;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1rhXBj-00073z-2M; Tue, 05 Mar 2024 10:58:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1rhXBY-00068U-DB
 for qemu-devel@nongnu.org; Tue, 05 Mar 2024 10:58:33 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1rhXBU-0000fS-Cw
 for qemu-devel@nongnu.org; Tue, 05 Mar 2024 10:58:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1709654305;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hkBbo0vDNgtkiU5Qwz+ACPxJexgrCeReZuQPnuDgFoI=;
 b=ZOMC7znO137dsDHJNqg1VSGq+fwcYC7ZjCn+/Cw2cPTgNhUHIHW+fvZged4kK9bH1nPTEk
 DSEpaPQ4hbtznexfxlQcZne+vJ2aRegT6/edRxIv5RlHfJs3GA1F6XloSiq+MOXSuS5I1a
 1hf8vsL3eeD8ksjrtx79VqQ+5wwvRpc=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-484-gw13EmvDM7yTBhOzD4Gxng-1; Tue,
 05 Mar 2024 10:58:19 -0500
X-MC-Unique: gw13EmvDM7yTBhOzD4Gxng-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5C46238000A3;
 Tue,  5 Mar 2024 15:58:18 +0000 (UTC)
Received: from dell-r430-03.lab.eng.brq2.redhat.com
 (dell-r430-03.lab.eng.brq2.redhat.com [10.37.153.18])
 by smtp.corp.redhat.com (Postfix) with ESMTP id CBE8317A8E;
 Tue,  5 Mar 2024 15:58:15 +0000 (UTC)
From: Igor Mammedov <imammedo@redhat.com>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org, pbonzini@redhat.com, mst@redhat.com,
 gaosong@loongson.cn, alistair.francis@wdc.com, palmer@dabbelt.com,
 bin.meng@windriver.com, liwei1518@gmail.com, dbarboza@ventanamicro.com,
 zhiwei_liu@linux.alibaba.com, imammedo@redhat.com, anisinha@redhat.com,
 philmd@linaro.org, wangyanan55@huawei.com, eblake@redhat.com,
 armbru@redhat.com, qemu-arm@nongnu.org, qemu-riscv@nongnu.org,
 f.ebner@proxmox.com
Subject: [PATCH v2 17/20] smbios: clear smbios_type4_count before building
 tables
Date: Tue,  5 Mar 2024 16:57:21 +0100
Message-Id: <20240305155724.2047069-18-imammedo@redhat.com>
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
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: iXj1gTLy02JC

it will help to keep type 4 tables accounting correct in case
SMBIOS tables are built multiple times.

Signed-off-by: Igor Mammedov <imammedo@redhat.com>
Tested-by: Fiona Ebner <f.ebner@proxmox.com>
---
 hw/smbios/smbios.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/smbios/smbios.c b/hw/smbios/smbios.c
index bf5c7a8885..b64d3bc227 100644
--- a/hw/smbios/smbios.c
+++ b/hw/smbios/smbios.c
@@ -981,6 +981,7 @@ static bool smbios_get_tables_ep(MachineState *ms,
            ep_type == SMBIOS_ENTRY_POINT_TYPE_64);
 
     g_free(smbios_tables);
+    smbios_type4_count = 0;
     smbios_tables = g_memdup2(usr_blobs, usr_blobs_len);
     smbios_tables_len = usr_blobs_len;
     smbios_table_max = usr_table_max;
-- 
2.39.3

