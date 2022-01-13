Received: by 2002:a19:ca48:0:0:0:0:0 with SMTP id h8csp2878177lfj;
        Wed, 12 Jan 2022 19:04:07 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzhDY7mgsnPpBEIxelqGsFFKqwoB0/tRf37mdsSm53tGOB/xZ4V4Sy/sGT6JWxv6QVVByRh
X-Received: by 2002:a25:df8a:: with SMTP id w132mr3718589ybg.173.1642043047114;
        Wed, 12 Jan 2022 19:04:07 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1642043047; cv=none;
        d=google.com; s=arc-20160816;
        b=XVI64qWir6HW42xcN2TilYmFh+vwldkzmW/sqyXk5UsrBZSbHM0NJniRUA8nhjPoT3
         OV8G7TgmmVp/1Od5AIZoJUOlcY/neoG8vLFmFawWZtjb5SL2wuvsHx/M+ooN+8yUbqcD
         fAszvdmHnqYnnHrwn5Dlbqol0we5s7czE6eLNgVqYtIu63FnPFQafAw4mAaA1g0iJ5Zd
         2VdukxEZrvZeVOqF4+ekcIJf0CIEq5Ljp4+XceFIoKez3HYNlSmxRsZVpZel9ooeCMvH
         FKuaOZz5dXxrCGCfKZzLddknTU8lTQabPzvzbStz7JUXP7qT1oWap1soIXLEMZumCyf8
         9boQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=from:reply-to:sender:errors-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:content-language:mime-version:user-agent
         :date:message-id:cc:to:subject;
        bh=RQSDp2+VpkmFfDmXX2OZXeTI3QR0aTp7k+UnFf1Z4ZM=;
        b=dnjxUyk0eh09mP3eRzJ9FmOH+eimbKgw1adT/zZ1mc1i2WzJ5mJkDcYGEtu07hTG9y
         OANeb87e8gsYxzhY3q0AjTyjNa24XWLiNVhc1cGgmcLyuwzvvAD7qezzSTz20HGqaOn+
         wlzUYeoIymCE1OnKk8zdV33t//6EyYazXSvszTFclD90K0hHJWEMjJCjKaLUpTnuMhTG
         aOQcX5os88dEa+UroV6MwtnjYKooap6aUgYkg8MDDyfkXBvqh+J/1Abez2KBhTPZZxcJ
         cRbHDpw6EOSQLKoa61A2+e/67P4TqcQDT+m+m1aoXuCgd3G2TqfyvauAvBImUuV/1HXl
         SZug==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v3si1710761ybu.349.2022.01.12.19.04.06
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 12 Jan 2022 19:04:07 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1]:39406 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1n7qPG-0008N9-H6
	for alex.bennee@linaro.org; Wed, 12 Jan 2022 22:04:06 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59408)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yuzenghui@huawei.com>)
 id 1n7qP4-0008Mx-Me; Wed, 12 Jan 2022 22:03:54 -0500
Received: from szxga01-in.huawei.com ([45.249.212.187]:3456)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yuzenghui@huawei.com>)
 id 1n7qP1-000271-CU; Wed, 12 Jan 2022 22:03:54 -0500
Received: from kwepemi100004.china.huawei.com (unknown [172.30.72.53])
 by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4JZ8Pd1Rbyzcc7g;
 Thu, 13 Jan 2022 11:03:01 +0800 (CST)
Received: from kwepemm600007.china.huawei.com (7.193.23.208) by
 kwepemi100004.china.huawei.com (7.221.188.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Thu, 13 Jan 2022 11:03:40 +0800
Received: from [10.174.185.179] (10.174.185.179) by
 kwepemm600007.china.huawei.com (7.193.23.208) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Thu, 13 Jan 2022 11:03:40 +0800
Subject: [Q] arm: SVE accesses at EL0 is broken with E2H+TGE?
To: <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>
CC: Richard Henderson <richard.henderson@linaro.org>, Peter Maydell
 <peter.maydell@linaro.org>, <kernel.yuz@gmail.com>,
 <wanghaibin.wang@huawei.com>
Message-ID: <6cdfd5de-2465-adca-73b3-9c66945cf18a@huawei.com>
Date: Thu, 13 Jan 2022 11:03:38 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.174.185.179]
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 kwepemm600007.china.huawei.com (7.193.23.208)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.187; envelope-from=yuzenghui@huawei.com;
 helo=szxga01-in.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Reply-to:  Zenghui Yu <yuzenghui@huawei.com>
From:  Zenghui Yu via <qemu-arm@nongnu.org>
X-TUID: zOgf2LdOV8Tx

Hi,

I've just exercised the SVE emulation in QEMU with

| `qemu-system-aarch64 -M virt,virtualization=on,gic-version=3 \
|  -cpu max -accel tcg [...]`

Since QEMU sets ID_AA64MMFR1_EL1.VH for -cpu max, the Linux guest I use
was booting with VHE enabled and running with E2H+TGE. But I've then
seen the Linux sve-probe-vls selftest [1] failure in guest which runs at
EL0 and can be described as:

1) Call prctl(PR_SVE_SET_VL, vl == 64) to set the vector length.
2) Emit RDVL instruction **but** get vl == 16. Emmm..

Looking a bit further at the way we emulate SVE in QEMU, there might be
some issues need to be addressed.

* sve_zcr_len_for_el() implementation

Per DDI 0584 B.a, when HCR_EL2.{E2H,TGE} == {1,1} and EL2 is enabled in
the current Security state, ZCR_EL1 has no effect on execution at EL0.
We should use ZCR_EL2 instead for E2H+TGE.

* CPTR_EL2 register accessors

CPTR_EL2 has diffrent layout with or without VHE, but looks like we only
take the nVHE one into account. Take sve_exception_el(env, el == 0) as
an example, we don't check CPTR_EL2.ZEN for EL0 SVE accesses and we will
never generate an exception even if needed...

... whilst Linux kernel indeed relies on a trap to EL2 to restore SVE
context appropriately for userland. SVE accesses at EL0 is broken in
that case, I guess?

Thanks,
Zenghui

[1] 
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/tools/testing/selftests/arm64/fp/sve-probe-vls.c
