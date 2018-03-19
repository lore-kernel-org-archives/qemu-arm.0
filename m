Received: by 10.28.91.67 with SMTP id p64csp2685281wmb;
        Mon, 19 Mar 2018 07:38:06 -0700 (PDT)
X-Google-Smtp-Source: AG47ELuqPpqsbuLFgnv0VQIiQtWsElPD1vaLNRvKcK27XCNDAokHZvgfyaXHZ9Xs72z2nk7gJplE
X-Received: by 10.55.73.13 with SMTP id w13mr2072231qka.139.1521470286863;
        Mon, 19 Mar 2018 07:38:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1521470286; cv=none;
        d=google.com; s=arc-20160816;
        b=j7EHp54Hh74ASXEigbLe6Eg9ZQjGU/20+WfwmOr8qfvOewc794ADDReZdH/mM0gpEX
         dSq+HUDiijWjJwXLW8Rp3VHUMJ1zSIoxLzFCRr04LF1kGNsDp4yMl3TeFzbUIwf46+7i
         Kof/h7qItqbMD8exgIe/p54nngoqRbT96SaBTm5ge+dh8Aw1YCZ9H+r8OVSPxhnUMMhY
         s44uLwnxMHZXf66iVuw6BSQKF5KNedFivC9N/xxDZMdMyMjEB1zYqEhUepm4ljTp3imJ
         /hZO9NQMyhXM94E7iMNGJMsocrg2Chw/vhs3K90Tg5y2Am+c/dAbEwu2X1+Bc4wAhnfB
         iR1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:mime-version:message-id
         :date:to:from:arc-authentication-results;
        bh=bgvW3LpWQ2JzNsdwxBF+vK6rRZ8zEC55wTMA/HZPAF8=;
        b=eMqwhg2giiIa3VyLgATWn324jbWE8EroeIsF7czS8c9nigjG2zMRglWfwdoQDJnXbd
         5MM9wWj3+14UkYEfUZXxdWqE7CYxiDuJqURt1CMEZM5l9k1z2iTNYp7wc1YPcqyhnAUz
         7fdZD4+ediaN+FUiXhi5K5w8HD6PU1PKjEzK1CE1dHPgLL5rBv2er/fuOYiK3u4bmCDt
         8R1pR+LavaLqNWbGDYbxdGOoTiEL1LxN5rN2XQ65ow2c8IG9vRlNPyS2saO92n22Z8Mm
         fwqDsOEq57YgKuDqxx4mLAhRLvdh51yIb1CbpkYMfmg5uzs77AT25R2uiB0KmO0rv/EX
         i7bw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 46si169780qty.135.2018.03.19.07.38.06
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 19 Mar 2018 07:38:06 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:42331 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1exvvK-0000mp-Av
	for alex.bennee@linaro.org; Mon, 19 Mar 2018 10:38:06 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46975)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>) id 1exvvA-0000lH-3x
	for qemu-arm@nongnu.org; Mon, 19 Mar 2018 10:37:56 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>) id 1exvv5-0005yi-9L
	for qemu-arm@nongnu.org; Mon, 19 Mar 2018 10:37:56 -0400
Received: from [45.249.212.32] (port=46580 helo=huawei.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <zhaoshenglong@huawei.com>)
	id 1exvv4-0005sc-Tp; Mon, 19 Mar 2018 10:37:51 -0400
Received: from DGGEMS408-HUB.china.huawei.com (unknown [172.30.72.59])
	by Forcepoint Email with ESMTP id C84611CA1D5CB;
	Mon, 19 Mar 2018 22:37:44 +0800 (CST)
Received: from HGHY1Z002260041.china.huawei.com (10.177.16.142) by
	DGGEMS408-HUB.china.huawei.com (10.3.19.208) with Microsoft SMTP Server
	id 14.3.361.1; Mon, 19 Mar 2018 22:37:35 +0800
From: Shannon Zhao <zhaoshenglong@huawei.com>
To: <qemu-arm@nongnu.org>
Date: Mon, 19 Mar 2018 22:36:15 +0800
Message-ID: <1521470177-14760-1-git-send-email-zhaoshenglong@huawei.com>
X-Mailer: git-send-email 1.9.0.msysgit.0
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.177.16.142]
X-CFilter-Loop: Reflected
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [fuzzy]
X-Received-From: 45.249.212.32
Subject: [Qemu-arm] [PATCH 0/2] two fixes for KVM GICv3 dist get/put
 functions
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
Cc: peter.maydell@linaro.org, qemu-devel@nongnu.org, eric.auger@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: hrYsEU0lOnOG

Shannon Zhao (2):
  arm_gicv3_kvm: increase clroffset accordingly
  arm_gicv3_kvm: kvm_dist_get/put: skip the registers banked by GICR

 hw/intc/arm_gicv3_kvm.c | 20 ++++++++++++++++++--
 1 file changed, 18 insertions(+), 2 deletions(-)

-- 
2.0.4


