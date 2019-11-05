Received: by 2002:adf:db01:0:0:0:0:0 with SMTP id s1csp453764wri;
        Tue, 5 Nov 2019 01:12:53 -0800 (PST)
X-Google-Smtp-Source: APXvYqzjmg1zQDBw57hB8MGZzSEZk4RDcRauT5ot1v6yX4wwwd6U6c+LiyKfgnGgWCr1a+CLmNeO
X-Received: by 2002:ac8:4454:: with SMTP id m20mr16635101qtn.77.1572945173021;
        Tue, 05 Nov 2019 01:12:53 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1572945173; cv=none;
        d=google.com; s=arc-20160816;
        b=I/MTSm0LIPtXLaxQZFO4TPAWEUp87H4OUHRA5IlDEDUyEvS3MixqMyvwVDTa7d2FWq
         4Fcg4OshXvaduCH7CnRl9yQag0n+GMl8xnX7RNH5W+5iZ7MByb442fL6SVj+HTueup3w
         CeT01+DkCH2rCubGxN5E3QHfwgepDWNpWmx4buClP2iwwOL04Eoj0o1ZWmbnmEw/E8vk
         8vfJT9wM7WCvYp+UIjs4rc0yrmFSDDVybqGmDSde1cbBYqKCyRaE69CYMq2jp/gEoPWh
         6EgUyJp/LY4pL3bX0JyDNAYvasHPg0xeRLIx+vi3MQkYt1taNxatUrx0/m+AqNHWS/Ti
         UPVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from;
        bh=HaDh1Lkk5wWvque+0+6n69lAUXEE1vtkeICtVpRKW7U=;
        b=yffUyMRWR15JWW82V0xx1YF9PwfdidJVZtiJ4aoSNGWZw88v6P0YEex3ZHEUVIDpQ+
         x0HKLdRAJU1YGot5keEUWiGf3M+GTozecNesoLFQ6c2hVSGSFO0y/OHjYWp9cWX4UGCW
         WzoNgi7ajySqkbp+781LQ8vqrO29cdMko7/bmCnoGrvZHcuhJygH9Y4JxrLbZuPn7aoZ
         4Czc4tf3HXflhEHKssBJPIWSdLA7dFsPocgW0ASdzNMNm7AA7Vvb//W0GMi8TR24ASL7
         bVj1WOjS2HVrbsykOAjNzcvu8CZkLheAUmoBwFUah2BbeCctrlys3UzuCSLTI7vE35NA
         cW/A==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s4si12892184qkg.283.2019.11.05.01.12.52
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 05 Nov 2019 01:12:53 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:41808 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iRutP-0005Ze-Ty
	for alex.bennee@linaro.org; Tue, 05 Nov 2019 04:12:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43040)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <guoheyi@huawei.com>) id 1iRusx-00051v-B4
 for qemu-arm@nongnu.org; Tue, 05 Nov 2019 04:12:24 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <guoheyi@huawei.com>) id 1iRusv-0007mS-Sg
 for qemu-arm@nongnu.org; Tue, 05 Nov 2019 04:12:23 -0500
Received: from szxga04-in.huawei.com ([45.249.212.190]:2194 helo=huawei.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <guoheyi@huawei.com>)
 id 1iRusv-0007kQ-F9; Tue, 05 Nov 2019 04:12:21 -0500
Received: from DGGEMS404-HUB.china.huawei.com (unknown [172.30.72.59])
 by Forcepoint Email with ESMTP id 3DE9C4B90D39FE19A161;
 Tue,  5 Nov 2019 17:12:13 +0800 (CST)
Received: from linux-OtBuvb.huawei.com (10.175.104.212) by
 DGGEMS404-HUB.china.huawei.com (10.3.19.204) with Microsoft SMTP Server id
 14.3.439.0; Tue, 5 Nov 2019 17:12:02 +0800
From: Heyi Guo <guoheyi@huawei.com>
To: <qemu-arm@nongnu.org>, <qemu-devel@nongnu.org>
Subject: [RFC v2 01/14] update-linux-headers.sh: import linux/arm_sdei.h to
 standard-headers
Date: Tue, 5 Nov 2019 17:10:43 +0800
Message-ID: <20191105091056.9541-2-guoheyi@huawei.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <20191105091056.9541-1-guoheyi@huawei.com>
References: <20191105091056.9541-1-guoheyi@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.175.104.212]
X-CFilter-Loop: Reflected
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 45.249.212.190
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
Cc: Mark Rutland <mark.rutland@arm.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Marc Zyngier <marc.zyngier@arm.com>,
 Cornelia Huck <cohuck@redhat.com>, James Morse <james.morse@arm.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Heyi Guo <guoheyi@huawei.com>,
 wanghaibin.wang@huawei.com, Dave Martin <Dave.Martin@arm.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: jxzja2BK7/oR

This is to prepare for qemu SDEI emulation.

Signed-off-by: Heyi Guo <guoheyi@huawei.com>
Cc: Peter Maydell <peter.maydell@linaro.org>
Cc: Dave Martin <Dave.Martin@arm.com>
Cc: Marc Zyngier <marc.zyngier@arm.com>
Cc: Mark Rutland <mark.rutland@arm.com>
Cc: James Morse <james.morse@arm.com>
Cc: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Cornelia Huck <cohuck@redhat.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>
---

Notes:
    v2:
    - Update update-linux-headers.sh first and then import the header fil=
e
    - Import arm_sdei.h to include/standard-headers/linux/

 scripts/update-linux-headers.sh | 1 +
 1 file changed, 1 insertion(+)

diff --git a/scripts/update-linux-headers.sh b/scripts/update-linux-heade=
rs.sh
index f76d77363b..84d15c18f2 100755
--- a/scripts/update-linux-headers.sh
+++ b/scripts/update-linux-headers.sh
@@ -191,6 +191,7 @@ for i in "$tmpdir"/include/linux/*virtio*.h \
          "$tmpdir/include/linux/pci_regs.h" \
          "$tmpdir/include/linux/ethtool.h" "$tmpdir/include/linux/kernel=
.h" \
          "$tmpdir/include/linux/vhost_types.h" \
+         "$tmpdir/include/linux/arm_sdei.h" \
          "$tmpdir/include/linux/sysinfo.h"; do
     cp_portable "$i" "$output/include/standard-headers/linux"
 done
--=20
2.19.1

