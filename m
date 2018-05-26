Received: by 2002:adf:b64b:0:0:0:0:0 with SMTP id i11-v6csp202138wre;
        Fri, 25 May 2018 17:42:22 -0700 (PDT)
X-Google-Smtp-Source: ADUXVKIFvVI28gyz7oloCKPbP9Pj3qMpNQDE2W+d2phREkaxGFZVeEj4hrBkWTZA4LZc11iY/TEp
X-Received: by 2002:a37:3507:: with SMTP id c7-v6mr4157244qka.58.1527295342346;
        Fri, 25 May 2018 17:42:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1527295342; cv=none;
        d=google.com; s=arc-20160816;
        b=vaxGLldYB7F4BGrmhRHIZpof9C1TrlBVxGtbKywSKcDITkatdx1CXfk9hE2C3S/1e9
         4EdeEdTlU/5dOrTI5QrdKZsRdiz5FcoClD3Ban0ohfy1cnzS2QyE7Q3QJpgk8zTbfgt0
         TF3KUF2TS30yVf3tMhpFMC7jq2loW+R9H9QOXFb5dIl57K0Qwf5QlZWWcQqBvsNKgZ1M
         Ow+tTGMnyUetEdvBtKRL+agY0BtOdomtlFfPB4eT8+VwuA7WJlFow2uKax2ZmBFXUHMm
         lV/6mx7y66Tn63R1swKqNn6lLQQp3tF08tOXU7jAohGS0q/Fd0T35LV+XyQ7rhajHO0Q
         yAMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:in-reply-to:references:to:mime-version
         :user-agent:from:date:message-id:arc-authentication-results;
        bh=AN09N50TtcBQs4pKJ9n1hcXhi9t2FHNpfnObhk7wq4Q=;
        b=delh/9wO/dpp8jhD1N5qjgt3qgdME90vVav5W5BKzAgN+oJ6M2YvBdl+E+T7pH6oEd
         qf4IskTu+fCADPUEZs3sURKmQw4wDimCb24ajAVTO2DdlQ74UYD+57k08Un3laiYAAAA
         AdDZ3zljgMTh+P7dKlH8lFuNRalQyd6d2RiL0gl986bWOKHRd74lColW5RvzbKGfeVPG
         DDyeZsSNI1hdFTajr/BboCD4QtYAe5nPOjJaPLHnPasoJa6fywVqMUY3SFPAYRckN9j7
         JAEx4YqltYmbApXiSWC1ylj+o57Fvu2Z5dQBE/9/wzpPZ7qSMdA8OOVVSrDZ0Qhg9uoE
         hu/A==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id a23-v6si5513970qtn.388.2018.05.25.17.42.22
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 25 May 2018 17:42:22 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:47227 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fMNHp-0006Lq-St
	for alex.bennee@linaro.org; Fri, 25 May 2018 20:42:21 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59875)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>) id 1fMNHe-0006LT-T7
	for qemu-arm@nongnu.org; Fri, 25 May 2018 20:42:14 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>) id 1fMNHb-0001bg-Rc
	for qemu-arm@nongnu.org; Fri, 25 May 2018 20:42:10 -0400
Received: from szxga04-in.huawei.com ([45.249.212.190]:2621 helo=huawei.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <zhaoshenglong@huawei.com>)
	id 1fMNHb-0001WP-H2; Fri, 25 May 2018 20:42:07 -0400
Received: from DGGEMS403-HUB.china.huawei.com (unknown [172.30.72.58])
	by Forcepoint Email with ESMTP id 67FB36EE5F253;
	Sat, 26 May 2018 08:41:51 +0800 (CST)
Received: from [127.0.0.1] (10.177.16.142) by DGGEMS403-HUB.china.huawei.com
	(10.3.19.203) with Microsoft SMTP Server id 14.3.382.0; Sat, 26 May 2018
	08:41:44 +0800
Message-ID: <5B08AD46.9020101@huawei.com>
Date: Sat, 26 May 2018 08:41:42 +0800
From: Shannon Zhao <zhaoshenglong@huawei.com>
User-Agent: Mozilla/5.0 (Windows NT 6.1;
	rv:24.0) Gecko/20100101 Thunderbird/24.4.0
MIME-Version: 1.0
To: <qemu-devel@nongnu.org>
References: <152724816757.234.340581049808773005@d39dc562802a>
In-Reply-To: <152724816757.234.340581049808773005@d39dc562802a>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.177.16.142]
X-CFilter-Loop: Reflected
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [fuzzy]
X-Received-From: 45.249.212.190
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v4 0/2] Fix ARM KVM GICv3
 get/put data shift bug
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
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org, famz@redhat.com,
	eric.auger@redhat.com, shannon.zhaosl@gmail.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Ewy2K/ffr8JE



On 2018/5/25 19:36, no-reply@patchew.org wrote:
> /tmp/qemu-test/src/hw/intc/arm_gicv3_common.c: In function 'gicv3_gicd_no_migration_shift_bug_post_load':
> /tmp/qemu-test/src/hw/intc/arm_gicv3_common.c:165:9: error: 'gicd_no_migration_shift_bug' undeclared (first use in this function); did you mean 'gicv3_gicd_no_migration_shift_bug_pre_load'?
>      if (gicd_no_migration_shift_bug) {
>          ^~~~~~~~~~~~~~~~~~~~~~~~~~~
>          gicv3_gicd_no_migration_shift_bug_pre_load

After compiling the patches, I add this check while forgot to use
cs->gicd_no_migration_shift_bug. My bad. I'll address this with other
comments in next version.

Thanks,
-- 
Shannon

