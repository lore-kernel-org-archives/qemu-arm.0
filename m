Received: by 2002:a19:6b17:0:0:0:0:0 with SMTP id d23csp3707862lfa;
        Mon, 19 Oct 2020 02:36:29 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJya6Yk4ddJsAlpzj2S/AOwIhtMl95ZVMRCrQWh4Vd+F8VPIZnkC16qwk/3l96+kROh+gDSt
X-Received: by 2002:a25:487:: with SMTP id 129mr21314865ybe.452.1603100188994;
        Mon, 19 Oct 2020 02:36:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1603100188; cv=none;
        d=google.com; s=arc-20160816;
        b=ovMyCR8HDTM4vdWKJLvbtNRH4XTInV0ELnYRlVSnK/rNvMuPvgRXyvnOM8Fv91ipJ2
         jn3E6QOksnPHE9NQsLFxgsDN0onQwDt2zK3IAHCODD/LKoy2NOzn8LqzMwvXPOYSJ2Xs
         QaMsMJrIgsJ4z2L/1YQ0zUf3mPUnzETPK2tjX/1qaGhXqGWHrmUzqESWo6t8bn7EaZkP
         9QSooO82/T+ZfegJ/7WHErGytbuGZaoeGupHg04G4uOpny/vizI6WTuGMQQYEAw1kq1k
         1OLbxEVjk2gineJ5wUxsnl3wZqhQlHx9JRVg1t8cmq+/nvVSm9BCo3Be0cf0qGdVFPwc
         Sxug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from;
        bh=CIj93W4pV1dWctQ5mtDW8fnniDqeMwESM2dRSB9KQmQ=;
        b=EMUOfODO9vAp829fWgD0OBLRT4acejVAvyufy1jF+vqGM9u9Z/X8cqv70sCYWLFems
         9adxudYBqsIG3pur8h06GQlbP+5gb2z4Fy1oC2hmPxC44Ss1Za8godr8dDywkgpthNRG
         A5P7lOMdnmKRfHHG7kNLir/vt3t66MMf/q1HAJ4mCYgG7j7NM8HgEScv6YuOSvAW+eo1
         jm1H9NRIp0o9t4zDYYIgvheDKCCGm/qPMWbEKBcqofRoszt9ZdNRb95FXFkaMqKK9bbQ
         NnzxiDLRi8zPHcbktie6eTzz1WIEvitVB9tIix5IZe1LfYuBzXZY9XrPM6xXvA32f4bx
         FRGw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m195si10012652ybm.175.2020.10.19.02.36.28
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 19 Oct 2020 02:36:28 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:55764 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kURae-0000BH-D2
	for alex.bennee@linaro.org; Mon, 19 Oct 2020 05:36:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48726)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liangpeng10@huawei.com>)
 id 1kURaH-0000B0-CQ; Mon, 19 Oct 2020 05:36:05 -0400
Received: from szxga04-in.huawei.com ([45.249.212.190]:5182 helo=huawei.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liangpeng10@huawei.com>)
 id 1kURaF-0000t7-OI; Mon, 19 Oct 2020 05:36:05 -0400
Received: from DGGEMS405-HUB.china.huawei.com (unknown [172.30.72.59])
 by Forcepoint Email with ESMTP id 146F8C4630B1EF47DB76;
 Mon, 19 Oct 2020 17:36:00 +0800 (CST)
Received: from localhost.localdomain (10.175.124.27) by
 DGGEMS405-HUB.china.huawei.com (10.3.19.205) with Microsoft SMTP Server id
 14.3.487.0; Mon, 19 Oct 2020 17:35:50 +0800
From: Peng Liang <liangpeng10@huawei.com>
To: <qemu-arm@nongnu.org>, <qemu-devel@nongnu.org>
Subject: [PATCH] microbit_i2c: Fix coredump when dump-vmstate
Date: Mon, 19 Oct 2020 17:34:01 +0800
Message-ID: <20201019093401.2993833-1-liangpeng10@huawei.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.175.124.27]
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.190;
 envelope-from=liangpeng10@huawei.com; helo=huawei.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/19 05:36:00
X-ACL-Warn: Detected OS   = Linux 3.11 and newer [fuzzy]
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_PASS=-0.001,
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
Cc: liangpeng10@huawei.com, peter.maydell@linaro.org, joel@jms.id.au,
 xiexiangyou@huawei.com, zhang.zhanghailiang@huawei.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 7JaWgL/MyYGE

VMStateDescription.fields should be end with VMSTATE_END_OF_LIST().
However, microbit_i2c_vmstate doesn't follow it.  Let's change it.

Fixes: 9d68bf564e ("arm: Stub out NRF51 TWI magnetometer/accelerometer detection")
Reported-by: Euler Robot <euler.robot@huawei.com>
Signed-off-by: Peng Liang <liangpeng10@huawei.com>
---
 hw/i2c/microbit_i2c.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/i2c/microbit_i2c.c b/hw/i2c/microbit_i2c.c
index 802473982082..e92f9f84ea81 100644
--- a/hw/i2c/microbit_i2c.c
+++ b/hw/i2c/microbit_i2c.c
@@ -83,6 +83,7 @@ static const VMStateDescription microbit_i2c_vmstate = {
     .fields = (VMStateField[]) {
         VMSTATE_UINT32_ARRAY(regs, MicrobitI2CState, MICROBIT_I2C_NREGS),
         VMSTATE_UINT32(read_idx, MicrobitI2CState),
+        VMSTATE_END_OF_LIST()
     },
 };
 
-- 
2.26.2

