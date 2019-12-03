Received: by 2002:a19:6911:0:0:0:0:0 with SMTP id e17csp1439845lfc;
        Tue, 3 Dec 2019 04:32:39 -0800 (PST)
X-Google-Smtp-Source: APXvYqwhfFL3f9BjSKjb8SRSKvuU07AHbWO/ytu2WUV865pfuI6SaicFxA1JIFnZLFUHsvB2gOZJ
X-Received: by 2002:ad4:57d4:: with SMTP id y20mr4758938qvx.63.1575376358700;
        Tue, 03 Dec 2019 04:32:38 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1575376358; cv=none;
        d=google.com; s=arc-20160816;
        b=pVAeWfGfJAXAOWzPSGAdt2s00oZxiuLT9tC7u1qaRtfmAOWwk/9jl535pW6U/FHnxk
         SbjQqvJ7QzTaB7fOHVIkMtbfa3p/ocDUt3Qen5Fi/gKGvPqntKHX36ONZ38I50wNccBh
         ttYZOMZFh1vSbDziiP97lwPXEQMsSWPAxHHPHZlSGHOaxxbqA4gitLWXEpMNcaLTYiTR
         rWxmUDKcSiVcZwapaawhEYb1c8np8AVc74yitXX35z2XiQ2eycoqGBVHAKeC3IxJS6Ml
         OoABStLKUE2ZMIEHPo+1FFc7KPy0p6gPpMBFoL34FDgAR2AAgmSptrWy9nBGYpJiNsMy
         nLEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:mime-version:references
         :in-reply-to:message-id:date:subject:to:from;
        bh=Jra+wEyCsgAQVq+y01pxi1U232QXxCml2BQwcMxwUUY=;
        b=IAaYsi9BjP+rFP7eY0pKc2MCJ7xDCjjope/ooTTQb+ANGlFKPOoUOyHKnQdFFyOwP6
         IQdC111z8dDjuANQ1WtYY66cz/yFzya/E1juuIOnt0Al3qWxc9Ku2MHYdXOeQiYntyzx
         F6c+vssTmSiewfqUtCHJZXKT84CItbM5pQeskLqYwetdD1E5+f+w0jtmAEpNwlM2eFsi
         koV9UQ5ka+pk++V2BCcGyCppZxyEvJgetM1G810qlq5Q0DU1alSajJAP50q8ShkmRj1/
         MPBGY0HN7p3manBEqmCbrxfCzIDUDg/gGHdL+3IajLU4udWizcMHr/mTcCfvXvab/KZW
         /5HQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id p21si1773727qtj.96.2019.12.03.04.32.38
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 03 Dec 2019 04:32:38 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:52700 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ic7M4-0001Ac-TG
	for alex.bennee@linaro.org; Tue, 03 Dec 2019 07:32:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48793)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <zhengxiang9@huawei.com>) id 1ic7JK-000833-QX
 for qemu-arm@nongnu.org; Tue, 03 Dec 2019 07:29:49 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <zhengxiang9@huawei.com>) id 1ic7JI-0003eS-RG
 for qemu-arm@nongnu.org; Tue, 03 Dec 2019 07:29:45 -0500
Received: from szxga07-in.huawei.com ([45.249.212.35]:41160 helo=huawei.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <zhengxiang9@huawei.com>)
 id 1ic7JI-0003Zf-5o; Tue, 03 Dec 2019 07:29:44 -0500
Received: from DGGEMS412-HUB.china.huawei.com (unknown [172.30.72.59])
 by Forcepoint Email with ESMTP id 4CC09DFCF0713DAA2A47;
 Tue,  3 Dec 2019 20:29:36 +0800 (CST)
Received: from HGHY4Z004218071.china.huawei.com (10.133.224.57) by
 DGGEMS412-HUB.china.huawei.com (10.3.19.212) with Microsoft SMTP Server id
 14.3.439.0; Tue, 3 Dec 2019 20:29:25 +0800
From: Xiang Zheng <zhengxiang9@huawei.com>
To: <peter.maydell@linaro.org>, <thuth@redhat.com>, <lvivier@redhat.com>
Subject: [PATCH 5/5] tests: Enable fw_cfg test on aarch64
Date: Tue, 3 Dec 2019 20:27:53 +0800
Message-ID: <20191203122753.19792-6-zhengxiang9@huawei.com>
X-Mailer: git-send-email 2.15.1.windows.2
In-Reply-To: <20191203122753.19792-1-zhengxiang9@huawei.com>
References: <20191203122753.19792-1-zhengxiang9@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.133.224.57]
X-CFilter-Loop: Reflected
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 45.249.212.35
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
Cc: lersek@redhat.com, qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 kraxel@redhat.com, wanghaibin.wang@huawei.com, pbonzini@redhat.com,
 philmd@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: YLtSWTQLp06s

Now turn on the fw_cfg test for aarch64.

Signed-off-by: Xiang Zheng <zhengxiang9@huawei.com>
---
 tests/Makefile.include | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tests/Makefile.include b/tests/Makefile.include
index 8566f5f119..180e0ed2b7 100644
--- a/tests/Makefile.include
+++ b/tests/Makefile.include
@@ -276,6 +276,7 @@ check-qtest-aarch64-y += tests/arm-cpu-features$(EXESUF)
 check-qtest-aarch64-y += tests/numa-test$(EXESUF)
 check-qtest-aarch64-y += tests/boot-serial-test$(EXESUF)
 check-qtest-aarch64-y += tests/migration-test$(EXESUF)
+check-qtest-aarch64-y += tests/fw_cfg-test$(EXESUF)
 # TODO: once aarch64 TCG is fixed on ARM 32 bit host, make test unconditional
 ifneq ($(ARCH),arm)
 check-qtest-aarch64-y += tests/bios-tables-test$(EXESUF)
-- 
2.19.1


