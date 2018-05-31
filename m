Received: by 2002:adf:b64b:0:0:0:0:0 with SMTP id i11-v6csp5444062wre;
        Wed, 30 May 2018 20:17:02 -0700 (PDT)
X-Google-Smtp-Source: ADUXVKItbFQIGOKQ8DvfhV1qf5jXNYLR3YktUgoGdu3rYxAbseenO/PzmsVm5BZm93SQNEwcgMEB
X-Received: by 2002:a37:654c:: with SMTP id z73-v6mr4929824qkb.289.1527736622632;
        Wed, 30 May 2018 20:17:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1527736622; cv=none;
        d=google.com; s=arc-20160816;
        b=nnk/qBgsEuc5mYzBgospxlk4s5U9O0xcbimMxtdS2Le9vV74gQMLhTEzm0N2F9cIQg
         qAb5XM+cVlyHmz/UN6C+2Jv58thZOPKj0ROVl3TicjipuASj++1ULHzcdWgA3rLOCkF9
         dNg+Lf3MuVgX+2RcYTkBsCPtaTjRFL5rI3Hnezw1CqgvPkS+QDBInpc/A/2or/P2uJTc
         TN3UEH++ct4XaHkHut23agKYX5ipYYTtHtDiozqBUDAE9MTiPwL1kqatDZxB5Nkoydl2
         oArLRFE9GM1V9bzukbHgil2WKTUZanzeHo/pybkfYSAljZTt4QWNYUqTiWEWyoi0ZS+Z
         OAUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:mime-version:message-id
         :date:to:from:arc-authentication-results;
        bh=QBbEfhnzoEHbgECab84C4RSZdlRVBliM59RxCWgKwyc=;
        b=ljwK5vEn/19E8lboJQde62m8EVFalzMbDEC+dBJ17LMBopune3HwZsriEXQceijoxh
         3C6Xe6UQANRKylUJG8quapKtanxiCirKHUJvwMUkjqNQI0EE5YeUY1LNYsQ4Pbu2TqW7
         UxYFC4NUF7SxXk+ygRN0s5QO61B1qtd5o3bQ/eoJaJAFK1CKjktgX1hJxR4Zda3Lkhef
         jl9ogmw+rglhcvVS7tmry15kmmfc4ITIfbdu49lA1/MXc/mZpBbXGP1FsYd2SLMd98jW
         QGIiUsthZJXLI6QLh4j2OchX83dUfq/kpEBWtob/Ya0yE2RLlYvOGVARBZz0wnCCAxOc
         tDWw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id l12-v6si4235552qve.23.2018.05.30.20.17.02
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 30 May 2018 20:17:02 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:41756 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fOE5G-0004PO-3M
	for alex.bennee@linaro.org; Wed, 30 May 2018 23:17:02 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50562)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>) id 1fOE55-0004OE-6j
	for qemu-arm@nongnu.org; Wed, 30 May 2018 23:16:52 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>) id 1fOE50-0004Wf-0N
	for qemu-arm@nongnu.org; Wed, 30 May 2018 23:16:50 -0400
Received: from [45.249.212.35] (port=40703 helo=huawei.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <zhaoshenglong@huawei.com>)
	id 1fOE4z-0004Uv-La; Wed, 30 May 2018 23:16:45 -0400
Received: from DGGEMS406-HUB.china.huawei.com (unknown [172.30.72.58])
	by Forcepoint Email with ESMTP id C50C18A32C9E8;
	Thu, 31 May 2018 11:16:39 +0800 (CST)
Received: from HGHY1Z002260041.china.huawei.com (10.177.16.142) by
	DGGEMS406-HUB.china.huawei.com (10.3.19.206) with Microsoft SMTP Server
	id 14.3.382.0; Thu, 31 May 2018 11:16:31 +0800
From: Shannon Zhao <zhaoshenglong@huawei.com>
To: <qemu-arm@nongnu.org>
Date: Thu, 31 May 2018 11:15:55 +0800
Message-ID: <1527736557-11084-1-git-send-email-zhaoshenglong@huawei.com>
X-Mailer: git-send-email 1.9.0.msysgit.0
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.177.16.142]
X-CFilter-Loop: Reflected
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [fuzzy]
X-Received-From: 45.249.212.35
Subject: [Qemu-arm] [PATCH v5 0/2] Fix ARM KVM GICv3 get/put data shift bug
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Shannon Zhao <zhaoshenglong@huawei.com>, peter.maydell@linaro.org,
	shannon.zhaosl@gmail.com, qemu-devel@nongnu.org, eric.auger@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: fPLFFi5xl07B

These two patches fix ARM KVM GICv3 get/put data shift bug and add
compatibility fro migration from old qemu to new one.

Major Changes in V5: 
* Add detailed comment as suggested by Peter
* Use memmove instead of memcpy
* Delete .need callback
* set gicd_no_migration_shift_bug to true after move the data

Shannon Zhao (2):
  arm_gicv3_kvm: kvm_dist_get/put_priority: skip the registers banked by
    GICR_IPRIORITYR
  arm_gicv3_kvm: kvm_dist_get/put: skip the registers banked by GICR

 hw/intc/arm_gicv3_common.c         | 79 ++++++++++++++++++++++++++++++++++++++
 hw/intc/arm_gicv3_kvm.c            | 56 ++++++++++++++++++++++++++-
 include/hw/intc/arm_gicv3_common.h |  1 +
 3 files changed, 134 insertions(+), 2 deletions(-)

-- 
2.0.4


