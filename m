Received: by 2002:adf:b64b:0:0:0:0:0 with SMTP id i11-v6csp2924943wre;
        Fri, 25 May 2018 04:23:52 -0700 (PDT)
X-Google-Smtp-Source: ADUXVKKcy6ocGZP7uurof2bqL9mr9g0SAIS9TdwoBKwK5wlVuvfr9xyV0Mxfsz/U0Xf1+8RbZF0N
X-Received: by 2002:a37:3c42:: with SMTP id j63-v6mr1505869qka.109.1527247431947;
        Fri, 25 May 2018 04:23:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1527247431; cv=none;
        d=google.com; s=arc-20160816;
        b=0AHQQzyUZwy3LUOVc2hNjrJQjiUpaIfJfxtMaah/65U4P4+KlpzBVibY30wKQTVMYC
         48y/DueFAqSjbK9Hyj7OBBq7a+IguWQ+wLpsVDtqxKsUqExG+7Eu3bM4hBSijvU4xU6L
         lKMcoK3WbgGMjWo4bRhgjHFVGSI1KEIKGbFtM6l1PskW5owr2aI/cSvbTNGB3I5GEmr2
         47g+jiXlM5RFaT6EmFnuXaRkR7GSVTOK8KydM/DxBv+RaMWTCsf+WBr2g31vJKa715fH
         kErPA1aEpshDLD9MGZ0HnIdUJ05wfULsR+Y7NOIaIwAQ415Xc1FwhxaqkyS736rylviT
         5TSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:mime-version:message-id
         :date:to:from:arc-authentication-results;
        bh=RQ/sONzIXXUz7WkUspdgBYwT67yppy/G6Z/Drl24XOU=;
        b=e+Q/9ouCTMH58lopQNnYP90Y6ZIfjZ/xvOfjPr+9znHYQqIr/GV0WHTUq9in1sgmj6
         8cX8neBg10vHjIgnbvIi4Oz08hW6CE4+P/0JD7vsTPKRpN2mH8UY4uhIQPI1t8yt/jlR
         OaVCM7R9LdzgwutnFLEeTt55hxZyX9a2bS3pA8fcp8kdVb1LEfjvnulyXK6PM4HE+H0M
         9vfT+7jWnggHDvHVOEi/eDTL4en4K+y93DL2DR/IGmN5b2vi9Hhc91xI0/xdnBJy5Nyg
         /iRIuSjXH55jtFQuSsHPhV8TvDF3Pnn9XIU9e5m1KoAklZIQfxS4V4cJW7n5WUmLAFu7
         XM+Q==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id s19-v6si9357177qki.122.2018.05.25.04.23.51
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 25 May 2018 04:23:51 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:43059 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fMAp5-0003Y4-DE
	for alex.bennee@linaro.org; Fri, 25 May 2018 07:23:51 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53809)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>) id 1fMAod-0003IT-Ta
	for qemu-arm@nongnu.org; Fri, 25 May 2018 07:23:24 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>) id 1fMAoZ-0002vA-0d
	for qemu-arm@nongnu.org; Fri, 25 May 2018 07:23:23 -0400
Received: from [45.249.212.35] (port=42618 helo=huawei.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <zhaoshenglong@huawei.com>)
	id 1fMAoY-0002tf-MX; Fri, 25 May 2018 07:23:18 -0400
Received: from DGGEMS410-HUB.china.huawei.com (unknown [172.30.72.58])
	by Forcepoint Email with ESMTP id E45F089CC6C68;
	Fri, 25 May 2018 19:23:12 +0800 (CST)
Received: from HGHY1Z002260041.china.huawei.com (10.177.16.142) by
	DGGEMS410-HUB.china.huawei.com (10.3.19.210) with Microsoft SMTP Server
	id 14.3.382.0; Fri, 25 May 2018 19:23:06 +0800
From: Shannon Zhao <zhaoshenglong@huawei.com>
To: <qemu-arm@nongnu.org>
Date: Fri, 25 May 2018 19:22:49 +0800
Message-ID: <1527247371-10592-1-git-send-email-zhaoshenglong@huawei.com>
X-Mailer: git-send-email 1.9.0.msysgit.0
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.177.16.142]
X-CFilter-Loop: Reflected
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [fuzzy]
X-Received-From: 45.249.212.35
Subject: [Qemu-arm] [PATCH v4 0/2] Fix ARM KVM GICv3 get/put data shift bug
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
X-TUID: zcuFgJIsBMfc

These two patches fix ARM KVM GICv3 get/put data shift bug and add
compatibility fro migration from old qemu to new one.

Major Changes in V4: 
* Fix the kvm_dist_get/put_priority in a separate patch since it doesn't
need migration compatibility.
* Fix the data within post-load function

Shannon Zhao (2):
  arm_gicv3_kvm: kvm_dist_get/put_priority: skip the registers banked by
    GICR_IPRIORITYR
  arm_gicv3_kvm: kvm_dist_get/put: skip the registers banked by GICR

 hw/intc/arm_gicv3_common.c         | 66 ++++++++++++++++++++++++++++++++++++++
 hw/intc/arm_gicv3_kvm.c            | 48 +++++++++++++++++++++++++--
 include/hw/intc/arm_gicv3_common.h |  1 +
 3 files changed, 113 insertions(+), 2 deletions(-)

-- 
2.0.4


