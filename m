Received: by 2002:a17:505:790d:b0:1cc9:4ad0:aa2 with SMTP id xu13csp2931185njc;
        Wed, 11 Jun 2025 08:59:02 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUogQZdTEc4lUSOlfMd5rP+HxXL/Uyqc+iX8lgAvZwfdgVwsTnkY5HJwREmIci7ec+28QQqWkGVxGcVsw==@linaro.org
X-Google-Smtp-Source: AGHT+IGpwKXLnfaD3rh7muKGC+mHAvgd6ZV+GLi73ZTy0+oBocK/OsT6L4C6EOeIHRVCi3CC8QI4
X-Received: by 2002:a05:622a:1b1b:b0:4a4:327f:1d0d with SMTP id d75a77b69052e-4a713c2f60cmr65657641cf.30.1749657542038;
        Wed, 11 Jun 2025 08:59:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1749657542; cv=none;
        d=google.com; s=arc-20240605;
        b=OAJIDeGbcGUDQl8DLE3ZMqVmnytpugul4J70lThuKcszLyZnDq+4VSeURmVPnsw6DU
         tFPYySYKG+w9FKzm3LqkQghvc7mlipYoKx/IFojERWfACEBGo4mbJpbcMgDfcWCh+vlf
         zztYAlGXTZCCsWUt9IdGCjuvfpfuJvGrihfTtPJSijLUXANFLibEWw8BfF8TiU9yGXeg
         SSAUCCTQFjLVkEoF5ohHlWu9nT7seg6MKyUCpJEDwpo4WRyyG3mmP6vKo5m7JrsgM2In
         nzNfUZAZWMgkR7alP6QgAee/SuHFsvKfm6PPNqbFcv6GEymVNbWGme7q3ai9EhII7bfM
         HTpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to;
        bh=kKJIdsToLdqTWx60d1CzdnDVKWuN3Eb7R7XojAstinU=;
        fh=BSTR0mN5riEHgpfDGU+Y04a8hUWGOTfFmwR91Qdx2Nw=;
        b=Dtc5G/TXMs00lj5VgvDRP3ciDGQRWhRmW1O+TxleIKC/v6uafEff3OtQFpNlu9OoFe
         LB0f8p84Jpn27CFGrkErcJcc72dDfznObjq6nOTlVju0Hwivzcsm6ohlibHSccIdNTNC
         EfwVhmdUt1m4x0fAxSb4TRD3aUUJO1vYzLwszWwu1J+KNkfgPDrcmZOrZQ3VTLemEA3z
         /WNCCagMJG+Aa4PJ9A9Gi57cS+CFhVrLEqMDHliEb77ACeipstAXdTa5iU3Vv0i5hzzQ
         LJVlINZcUTLwC365Gha+MKQ92XfzQvP4eY6TxxP+rUt/hDjJC5GfT4JE/oQ1MEaArnyE
         M2qA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-4a61985f016si128204971cf.265.2025.06.11.08.59.01
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 11 Jun 2025 08:59:02 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uPNqp-00036T-6e; Wed, 11 Jun 2025 11:58:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alireza.sanaee@huawei.com>)
 id 1uPNqT-0002sV-7a; Wed, 11 Jun 2025 11:58:44 -0400
Received: from [185.176.79.56] (helo=frasgout.his.huawei.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alireza.sanaee@huawei.com>)
 id 1uPNqR-0008WP-JL; Wed, 11 Jun 2025 11:58:32 -0400
Received: from mail.maildlp.com (unknown [172.18.186.231])
 by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4bHVdY6Zxqz6JB3G;
 Wed, 11 Jun 2025 23:56:33 +0800 (CST)
Received: from frapeml500003.china.huawei.com (unknown [7.182.85.28])
 by mail.maildlp.com (Postfix) with ESMTPS id D96F31404C4;
 Wed, 11 Jun 2025 23:58:26 +0800 (CST)
Received: from a2303103017.china.huawei.com (10.203.177.99) by
 frapeml500003.china.huawei.com (7.182.85.28) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 11 Jun 2025 17:58:25 +0200
To: <qemu-devel@nongnu.org>, <mst@redhat.com>
CC: <anisinha@redhat.com>, <armbru@redhat.com>, <berrange@redhat.com>,
 <dapeng1.mi@linux.intel.com>, <eric.auger@redhat.com>,
 <farman@linux.ibm.com>, <gustavo.romero@linaro.org>, <imammedo@redhat.com>,
 <jiangkunkun@huawei.com>, <jonathan.cameron@huawei.com>,
 <linuxarm@huawei.com>, <maobibo@loongson.cn>, <mtosatti@redhat.com>,
 <peter.maydell@linaro.org>, <philmd@linaro.org>, <qemu-arm@nongnu.org>,
 <richard.henderson@linaro.org>, <shameerali.kolothum.thodi@huawei.com>,
 <shannon.zhaosl@gmail.com>, <yangyicong@hisilicon.com>, <zhao1.liu@intel.com>
Subject: [PATCH v13 4/7] bios-tables-test: prepare to change ARM ACPI virt PPTT
Date: Wed, 11 Jun 2025 16:56:15 +0100
Message-ID: <20250611155618.351-5-alireza.sanaee@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250611155618.351-1-alireza.sanaee@huawei.com>
References: <20250611155618.351-1-alireza.sanaee@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.203.177.99]
X-ClientProxiedBy: lhrpeml100005.china.huawei.com (7.191.160.25) To
 frapeml500003.china.huawei.com (7.182.85.28)
X-Host-Lookup-Failed: Reverse DNS lookup failed for 185.176.79.56 (deferred)
Received-SPF: pass client-ip=185.176.79.56;
 envelope-from=alireza.sanaee@huawei.com; helo=frasgout.his.huawei.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Reply-to:  Alireza Sanaee <alireza.sanaee@huawei.com>
From:  Alireza Sanaee via <qemu-arm@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: DtSJJMg6zK9l

Prepare to update `build_pptt` function to add cache description
functionalities, thus add binaries in this patch.

Reviewed-by: Zhao Liu <zhao1.liu@intel.com>
Signed-off-by: Alireza Sanaee <alireza.sanaee@huawei.com>
---
 tests/qtest/bios-tables-test-allowed-diff.h | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/tests/qtest/bios-tables-test-allowed-diff.h b/tests/qtest/bios-tables-test-allowed-diff.h
index dfb8523c8b..e84d6c6955 100644
--- a/tests/qtest/bios-tables-test-allowed-diff.h
+++ b/tests/qtest/bios-tables-test-allowed-diff.h
@@ -1 +1,4 @@
 /* List of comma-separated changed AML files to ignore */
+"tests/data/acpi/aarch64/virt/PPTT",
+"tests/data/acpi/aarch64/virt/PPTT.acpihmatvirt",
+"tests/data/acpi/aarch64/virt/PPTT.topology",
-- 
2.43.0

