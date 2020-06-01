Received: by 2002:a19:711a:0:0:0:0:0 with SMTP id m26csp2965118lfc;
        Mon, 1 Jun 2020 03:21:48 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxq5VZeKfoNg2x8xVc1/NCyfJ7X5WHJ45j2MXfFENRnGxj3NWMYhj5xQ+q1D34TJHVIFln2
X-Received: by 2002:a5b:d4a:: with SMTP id f10mr30605233ybr.421.1591006908274;
        Mon, 01 Jun 2020 03:21:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1591006908; cv=none;
        d=google.com; s=arc-20160816;
        b=Yr/Mm57B22i6Lqq0LhBrMt5oPrx19DWTTw2cWlHhKa10x83noNoO2/1JHP7c/bbY8/
         i7ytqGENQA45UmwQJrHbylFPF/2XuXT4YcjQrUYw3tHc4hzc6YOprGguHeNbdT7FYhVR
         v9+m984wJKVK4qhKfPYG/lV8hvIReWZ29tT7pVB9s8ILWaqjLkbvGXLAGXeyzp6Thyai
         B0WtMcD81zmkpYefYSCaz2Nhj3F4QDL8HCcBZ+m/ZA8tZmx22OKa8jM075CzBjYtxaFk
         WJYGxevfM38YhXTJjIA5rl4TlKKq66l7smrUXeejU1zl9Ka6ieIkHs7bNxxGogpBEE2s
         +RLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=kVzOlvoCeo/ehpQPUov0zPQskx1LEwWkUqulsiySQwI=;
        b=pGBFHpMQKA9s7CekvnZor/l71Aet00iyCGbUBsAdDkqmAxq8420ngdnnNTGE3XY/Wv
         We3ltwacd2amteEclpRyHXmpSSuWSwtphAxmpkFcDYbnXkmG5XlVgGlFqvKpCI++yzHt
         lqjG69oJ5WiVnAL9t6nMCC+VgEuztOUpUArDQtwvxd7uYLQ8HWRSoVoPI8jeyAnUcebK
         wpzqSBeueRc6pthFTOavtnhVSty8OpoIfg3tmasdaZCMw664xZGKOqjgbbJI7LkxKKgu
         +cGo5cKwVqUH0eXzFLg1M91X8lTshtwX4LS7MR8k3adi/v5iBrpAjRcFj6hY3HHntFnE
         FkcQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=eu8rNgi4;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 72si7432911ybf.439.2020.06.01.03.21.48
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 01 Jun 2020 03:21:48 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=eu8rNgi4;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:52186 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jfhZj-00006x-Ln
	for alex.bennee@linaro.org; Mon, 01 Jun 2020 06:21:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36588)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1jfhZb-0008Vr-UI
 for qemu-arm@nongnu.org; Mon, 01 Jun 2020 06:21:39 -0400
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:39267
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1jfhZb-00007P-Al
 for qemu-arm@nongnu.org; Mon, 01 Jun 2020 06:21:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1591006898;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kVzOlvoCeo/ehpQPUov0zPQskx1LEwWkUqulsiySQwI=;
 b=eu8rNgi4CEFkvqc8hHfjP1oCdkXMrybSmn17GCdY9zrniPab3oz+GjAyasFmaYzbAoNQFe
 ZmRhbTiJSMkxxanqPEj67my9pLZHs7cbQIMuH+otirILOuj6++kpu11H9H3BuNRWDnrgXz
 Ihb4LId+D7hL0bguqzk7O/3IXHRnSjI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-121-2PLduN31P2-Vmw8MuIrp2A-1; Mon, 01 Jun 2020 06:21:35 -0400
X-MC-Unique: 2PLduN31P2-Vmw8MuIrp2A-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8427D100CCC1;
 Mon,  1 Jun 2020 10:21:33 +0000 (UTC)
Received: from laptop.redhat.com (ovpn-113-56.ams2.redhat.com [10.36.113.56])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 805AAD01EB;
 Mon,  1 Jun 2020 10:21:30 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, stefanb@linux.ibm.com,
 qemu-devel@nongnu.org, qemu-arm@nongnu.org, peter.maydell@linaro.org,
 mst@redhat.com, shannon.zhaosl@gmail.com, imammedo@redhat.com
Subject: [RFC 2/6] tests/acpi: Add void tables for Q35/TPM-TIS bios-tables-test
Date: Mon,  1 Jun 2020 12:21:09 +0200
Message-Id: <20200601102113.1207-3-eric.auger@redhat.com>
In-Reply-To: <20200601102113.1207-1-eric.auger@redhat.com>
References: <20200601102113.1207-1-eric.auger@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=207.211.31.81; envelope-from=eric.auger@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/01 02:05:53
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: marcandre.lureau@redhat.com, drjones@redhat.com, lersek@redhat.com,
 ardb@kernel.org, philmd@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: UGBZyr2QHzcf

Add placeholders for TPM and DSDT reference tables for
Q35 TPM-TIS tests.

Signed-off-by: Eric Auger <eric.auger@redhat.com>
---
 tests/data/acpi/q35/DSDT.tis | Bin
 tests/data/acpi/q35/TPM2.tis | Bin
 2 files changed, 0 insertions(+), 0 deletions(-)
 create mode 100644 tests/data/acpi/q35/DSDT.tis
 create mode 100644 tests/data/acpi/q35/TPM2.tis

diff --git a/tests/data/acpi/q35/DSDT.tis b/tests/data/acpi/q35/DSDT.tis
new file mode 100644
index 0000000000000000000000000000000000000000..e69de29bb2d1d6434b8b29ae775ad8c2e48c5391
diff --git a/tests/data/acpi/q35/TPM2.tis b/tests/data/acpi/q35/TPM2.tis
new file mode 100644
index 0000000000000000000000000000000000000000..e69de29bb2d1d6434b8b29ae775ad8c2e48c5391
-- 
2.20.1

