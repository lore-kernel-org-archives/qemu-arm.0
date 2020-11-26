Received: by 2002:a19:ee0a:0:0:0:0:0 with SMTP id g10csp1341139lfb;
        Thu, 26 Nov 2020 03:23:59 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwniBGQNiH8sxfhEtdPD0v4cJ3+pbhtS7Yk/mluZ7Y23d4sraXgnu3rRgQ1NWYFxZnt+EDv
X-Received: by 2002:a25:7416:: with SMTP id p22mr2814575ybc.287.1606389839242;
        Thu, 26 Nov 2020 03:23:59 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1606389839; cv=none;
        d=google.com; s=arc-20160816;
        b=k0RQfbXnsi37YZVRny63dvLhk7KSpfgct8SF2KoRNQi2Q6gL7ZkmnGarITyBfouAXF
         J2+L+wzyXt+L9UO1LA0U69YjcrxECbtJOXRbLC9Qr05anIoAO4NKR6j2UlrMXzAQcWu7
         7WWdb9tT/N7pniOzltNG7Cr0J8mWw0PcTpWNBpMs83BPxNULHQQQMqj0dsVen8IYHOAY
         YJWt03t7CeA7/sh8STh05F3c8eILzUrI763gvs8Bj/JcGGP5HXoKA/kaIC78gLeTEGEv
         RUo5OC/VVVRkKFx8/WIikkqwRRieNDBOX08gsxr1ySIW/6T8DlYjEP1bldjg9m/DTc7c
         GTRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from;
        bh=MP+4Iu+qUeKNt1r7UZNbMzl5GmVwv/J+JHGnhkw1oZw=;
        b=nzgLUcmitnZ3hIM+ILhmhtl0YK24v2uyQycQteqBkm/y+Hz848kL2qdSgHcQQ8y//t
         TvJ+2Zt4Wkhrtj2vFEuiONGDLtRmt9ZQq/5lsRUncUbeWBybj7F36k0gu71qsg7Y9uxL
         r7wB9r/faiohXPzGdwfXNbmf6TnwOB+GJc/KPnJwXHct08iEZD9qMJSCQTzzk/adgPCS
         hAqtqUIkBT8K4sq461Knx4esELoEe4BRb/l5iskqCnUweqiDSFw9U9mCYDSrlJHOf03b
         c/CepijuptxizQ643Ejv2EXXDGViISD+ISB0pe/BXs4n8JaIF5XXWbY4OR/6hiWoBfq7
         yt0g==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id p3si5602454ybl.188.2020.11.26.03.23.59
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 26 Nov 2020 03:23:59 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:38188 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kiFNW-0004V7-J8
	for alex.bennee@linaro.org; Thu, 26 Nov 2020 06:23:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35498)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.chen@huawei.com>)
 id 1kiFNH-0004Uk-43; Thu, 26 Nov 2020 06:23:43 -0500
Received: from szxga07-in.huawei.com ([45.249.212.35]:2158)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.chen@huawei.com>)
 id 1kiFND-0003rB-AF; Thu, 26 Nov 2020 06:23:42 -0500
Received: from DGGEMS406-HUB.china.huawei.com (unknown [172.30.72.58])
 by szxga07-in.huawei.com (SkyGuard) with ESMTP id 4Chb3L6DgMz749R;
 Thu, 26 Nov 2020 19:23:10 +0800 (CST)
Received: from huawei.com (10.175.124.27) by DGGEMS406-HUB.china.huawei.com
 (10.3.19.206) with Microsoft SMTP Server id 14.3.487.0; Thu, 26 Nov 2020
 19:23:23 +0800
From: Alex Chen <alex.chen@huawei.com>
To: <peter.maydell@linaro.org>, <jcd@tribudubois.net>,
 <peter.chubb@nicta.com.au>
Subject: [PATCH 0/5] hw/misc: Fix some bad printf format specifiers
Date: Thu, 26 Nov 2020 11:11:04 +0000
Message-ID: <20201126111109.112238-1-alex.chen@huawei.com>
X-Mailer: git-send-email 2.19.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.175.124.27]
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.35; envelope-from=alex.chen@huawei.com;
 helo=szxga07-in.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: alex.chen@huawei.com, qemu-trivial@nongnu.org, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org, zhang.zhanghailiang@huawei.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 4dqnDITOQ5xh

Find a lot of bad printf format specifiers in hw/misc, fix them.

Alex Chen (5):
  i.MX25: Fix bad printf format specifiers
  i.MX31: Fix bad printf format specifiers
  i.MX6: Fix bad printf format specifiers
  i.MX6ul: Fix bad printf format specifiers
  misc/omap_sdrc: Fix bad printf format specifiers

 hw/misc/imx25_ccm.c  | 12 ++++++------
 hw/misc/imx31_ccm.c  | 14 +++++++-------
 hw/misc/imx6_ccm.c   | 20 ++++++++++----------
 hw/misc/imx6_src.c   |  2 +-
 hw/misc/imx6ul_ccm.c |  4 ++--
 hw/misc/imx_ccm.c    |  4 ++--
 hw/misc/omap_sdrc.c  |  2 +-
 7 files changed, 29 insertions(+), 29 deletions(-)

-- 
2.19.1

