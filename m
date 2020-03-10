Received: by 2002:a19:f015:0:0:0:0:0 with SMTP id p21csp499989lfc;
        Tue, 10 Mar 2020 02:19:36 -0700 (PDT)
X-Google-Smtp-Source: ADFU+vu0RGZadJGpu1BR00yDbrg40U1MjmYaC2oTwPkUyGYygaQu5NA8UxY6dwbaQmZvcy1EwCGe
X-Received: by 2002:a0c:c1cd:: with SMTP id v13mr109715qvh.77.1583831975698;
        Tue, 10 Mar 2020 02:19:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1583831975; cv=none;
        d=google.com; s=arc-20160816;
        b=0kOFjYm+ddDRP0p38TBbXZ0O6KZarNB7cSoPZynduTUIPpYlsN0xlq+98o+GsxuTJn
         xbXLB1oJ6efLUkxNEM452FTXufPE8x/L0OSujTJBID++LHlM0f1a17soBqNvqnSn6y7I
         MwfogSK/q6jorKQFvn8WZ25iv8Sulzf2MJi+5lwRX+7C8y5wOFDHrYUK6cK55akipmWW
         X2uEgZdVvYTaN2hSjJ/pJJ6oFfCTVeGleqetuZ41CKssIYwLrWLbkskEMGnS4+wYweVt
         uMH0K+8YCq1DJdPyoETdLn/D4pcPIWcsA0GqyeGv5iHVP3tMQhyTpAZCvHhu0PKmIi4Z
         KE7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from;
        bh=1Qg5m78+7PF6NnO/TI4Rhgfb/l0XJ0Dw0fi/vN1H2jE=;
        b=J7E1yO5WgnCX220L2/4gJtHVH5u9NUkTT1vQiruakynHY7PHeak2uH2r9BwdGgbvYp
         7eFt+AK6hosaeDNJy0SN+q5euBCwkGlr8xpHmjwPwDYVdn8dssEwYrmAH1bPwACBeXLL
         xoAxPDCEnNLmwSYF6CEXtPHZV1vBHi0laWLGnq4Sy60RrtwIzOzMeX+/Ydf/irAHbHBv
         E7z4AQePZNxMDxcDGxCu357Z1iMlDnHfAtnTMq6NtzVEFN+NHS0axaDgT4ZhhvMUzKa4
         c2SUvaTHk7rwKZ2wZ89iwhHl4IZOfpTxL7wVl+g++1L8g1vIEFfdS0EbyvAmw6CR8GU0
         IVVw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y9si7085601qvf.191.2020.03.10.02.19.35
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 10 Mar 2020 02:19:35 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:55874 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jBb31-0001no-35
	for alex.bennee@linaro.org; Tue, 10 Mar 2020 05:19:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37421)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <zhukeqian1@huawei.com>) id 1jBb2r-0001m3-Ni
 for qemu-arm@nongnu.org; Tue, 10 Mar 2020 05:19:26 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <zhukeqian1@huawei.com>) id 1jBb2q-0005xB-2q
 for qemu-arm@nongnu.org; Tue, 10 Mar 2020 05:19:25 -0400
Received: from szxga07-in.huawei.com ([45.249.212.35]:43500 helo=huawei.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <zhukeqian1@huawei.com>)
 id 1jBb2p-0005Zl-N2; Tue, 10 Mar 2020 05:19:24 -0400
Received: from DGGEMS407-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id 5E840F4B598C46D801E6;
 Tue, 10 Mar 2020 17:19:14 +0800 (CST)
Received: from linux-kDCJWP.huawei.com (10.175.104.212) by
 DGGEMS407-HUB.china.huawei.com (10.3.19.207) with Microsoft SMTP Server id
 14.3.487.0; Tue, 10 Mar 2020 17:19:06 +0800
From: Keqian Zhu <zhukeqian1@huawei.com>
To: <qemu-devel@nongnu.org>
Subject: [PATCH v2 0/2] Some optimization in dirty bitmap sync
Date: Tue, 10 Mar 2020 17:17:02 +0800
Message-ID: <20200310091704.42340-1-zhukeqian1@huawei.com>
X-Mailer: git-send-email 2.19.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.175.104.212]
X-CFilter-Loop: Reflected
Content-Transfer-Encoding: quoted-printable
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-arm@nongnu.org,
 Keqian Zhu <zhukeqian1@huawei.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>, wanghaibin.wang@huawei.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 8/JIHAqE4qK2

This patch series including code style change and performace fix
about dirty bitmap sync.

---
changelogs:

v2:
 - split code style change and performace fix.

Keqian Zhu (2):
  memory: Introduce start_global variable in dirty bitmap sync
  migration: not require length align when choose fast dirty sync path

 include/exec/ram_addr.h | 14 ++++++--------
 1 file changed, 6 insertions(+), 8 deletions(-)

--=20
2.19.1

