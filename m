Received: by 2002:a05:6512:15a3:0:0:0:0 with SMTP id bp35csp6327556lfb;
        Tue, 28 Dec 2021 01:27:14 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzjL9rX8c/gMlZyfc8pg8jYTvhoRsBFv81JUlbiej7NymByBJcg3ZNB6WlubDlQSC6iccUF
X-Received: by 2002:a5b:70d:: with SMTP id g13mr10948436ybq.662.1640683634341;
        Tue, 28 Dec 2021 01:27:14 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1640683634; cv=none;
        d=google.com; s=arc-20160816;
        b=AET0xmOdABaTTn8aP5dmWXAvQlPKiO41/vczUjA9FMzGrj4R2+t/MXTUvPDZDh6KB6
         vw+cDlkuaAHRK5OcNakbOkDzdtoBTZoxe1vWqgiM0cj5wfAzxKWzmRsxlG2O3MOO1gIA
         RuLZuVxzCmEJHYPEpz7mFgGRJpj+7QTvohPIVn7YQLUFg1N4xr85SIr7uasa5kM2tSh/
         HzQfq6J+gax6hU67Jm9xzD58YtMoVtO84l2x8EYf2atWl30YkamXwBQm6Jre0J1yNOx9
         HVLy51ICWzQXHyehjQnyGiWISgRlLMxXX40Ke3Gk8F64HdK8JUN5re2LuZ/TsQ3iHr59
         An8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=from:reply-to:sender:errors-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to;
        bh=sCL6uJkDk8Aa0T84WYmvTC4XE24IWIchSPR+lb6uQv0=;
        b=SiQLmZh7aOyCgnGrsfc1F5FL8DNEdf6ZcoVf2vIHBdRMMmdH7T3Emdywty1eq9zEVb
         ycsVIsBGpg2sCkXADd0cWASk5l/WnMIzGv5VUE0I0jp/Zr5jVFL03/i84bwd27zTeHic
         /9KyBncrwChkBgq7cpp4B8zqhgue6DDbQtAZOFInm0VdTqwjCEuIdzO5YjyzCQRH8xU0
         Dphiwvgff56zRqANu9D1LVUJhY7PQHZqKW/OdC7nkMPqUrhkHVlLFwMIHYAqxnFiyDmt
         E9DSpPUkzmGKVRHEEGJ6TSM9QGnAL9Dv3AOD8IpZMzjU+3jQ3Gqh40VqXeVQx+tmNToK
         ktfQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f136si4030207yba.664.2021.12.28.01.27.14
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 28 Dec 2021 01:27:14 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1]:49602 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1n28lF-00089g-Pp
	for alex.bennee@linaro.org; Tue, 28 Dec 2021 04:27:13 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52136)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangyanan55@huawei.com>)
 id 1n28h4-0007kO-OC; Tue, 28 Dec 2021 04:22:54 -0500
Received: from szxga01-in.huawei.com ([45.249.212.187]:3514)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangyanan55@huawei.com>)
 id 1n28h2-00079t-Vt; Tue, 28 Dec 2021 04:22:54 -0500
Received: from dggpemm500023.china.huawei.com (unknown [172.30.72.55])
 by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4JNTWS6WRqzZdwR;
 Tue, 28 Dec 2021 17:19:32 +0800 (CST)
Received: from DESKTOP-TMVL5KK.china.huawei.com (10.174.187.128) by
 dggpemm500023.china.huawei.com (7.185.36.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Tue, 28 Dec 2021 17:22:49 +0800
To: <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>
CC: Peter Maydell <peter.maydell@linaro.org>, Andrew Jones
 <drjones@redhat.com>, Eduardo Habkost <eduardo@habkost.net>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>, Marcel
 Apfelbaum <marcel.apfelbaum@gmail.com>, Paolo Bonzini <pbonzini@redhat.com>,
 "Michael S . Tsirkin" <mst@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 Shannon Zhao <shannon.zhaosl@gmail.com>, Ani Sinha <ani@anisinha.ca>, Markus
 Armbruster <armbru@redhat.com>, Eric Blake <eblake@redhat.com>,
 <wanghaibin.wang@huawei.com>, Yanan Wang <wangyanan55@huawei.com>
Subject: [PATCH v5 07/14] MAINTAINERS: Self-recommended as reviewer of
 "Machine core"
Date: Tue, 28 Dec 2021 17:22:14 +0800
Message-ID: <20211228092221.21068-8-wangyanan55@huawei.com>
X-Mailer: git-send-email 2.8.4.windows.1
In-Reply-To: <20211228092221.21068-1-wangyanan55@huawei.com>
References: <20211228092221.21068-1-wangyanan55@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.174.187.128]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 dggpemm500023.china.huawei.com (7.185.36.83)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.187;
 envelope-from=wangyanan55@huawei.com; helo=szxga01-in.huawei.com
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
Reply-to:  Yanan Wang <wangyanan55@huawei.com>
From:  Yanan Wang via <qemu-arm@nongnu.org>
X-TUID: f988JpjxddeK

I've built interests in the generic machine subsystem and
have also been working on projects related to this part,
self-recommand myself as a reviewer so that I can help to
review some patches familiar to me, and have a chance to
learn more continuously.

Signed-off-by: Yanan Wang <wangyanan55@huawei.com>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 5456536805..fe5eea76f6 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1631,6 +1631,7 @@ Machine core
 M: Eduardo Habkost <eduardo@habkost.net>
 M: Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
 R: Philippe Mathieu-Daudé <philmd@redhat.com>
+R: Yanan Wang <wangyanan55@huawei.com>
 S: Supported
 F: cpu.c
 F: hw/core/cpu.c
-- 
2.27.0

