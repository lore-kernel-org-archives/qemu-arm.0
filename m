Received: by 2002:a17:906:fc07:b0:9bd:85f7:2662 with SMTP id ov7csp2262708ejb;
        Tue, 24 Oct 2023 12:12:28 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE+gHb/hv4giBlKROoSPAGuvXbEjE7nEjtrydjfVR/KiSKf9KxZBUoIlNqTpER6FlJk/IEM
X-Received: by 2002:a05:6214:d4b:b0:66d:65ae:18f6 with SMTP id 11-20020a0562140d4b00b0066d65ae18f6mr16775752qvr.50.1698174748618;
        Tue, 24 Oct 2023 12:12:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1698174748; cv=none;
        d=google.com; s=arc-20160816;
        b=x1ln/c7sW3DNXtYciN+HOohw6tewP4dDJktMz4YYkVKpv/f3+L4NTlR7WGCtL2wNSU
         mMl+/f+Y2i/ghcOLnAIK6t64Br7J2V79fLuyuugAY54N+MNDgDrKOaehEe9Ea76d0UlR
         YNkSZ3fqGF5ZY16oss8xErZB4Qxz2OIgJicZxMU9LgH/Aw/fV3ejdLudcII3HglCkpV6
         vuHB+C2Qlf3Z7uO1gw1otGCIhQbHS7bSRGrg2H1frYTqRN+t+6iOVW4EUGYDU4z6U7sB
         LZH63sLYP9fsFhKdrijdlisD36B9mV7Pl763xAjmnvH5pzd3e5a/vUQhkG6iFkxd41SW
         jF2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=nI+Cx2vV5POG5zmT7lpf7JazqjGek1jJQe3+LwKtRFs=;
        fh=NAal76Z/q7FBYhiEiWbymNk3zrFoOu+wgUVBjeRKdu0=;
        b=U9P47agB4RfmlnQtbeVUQayHljP6l6BTS43ezTnx+mUZ6jPYnf5S86GNMZV+fmqtXC
         R2tHaJGJ1grcwQj6gKyBy8O+2MKr1tTE8gb1vR7zDauaw8+nlMBWDiSHahv4ERZcneVo
         Y+XCt7rLaNfptg+NURVqIBYYBBVUusNBgQVXBLp44HkwJhpZNqxMP4oe32yw1GxY0jRF
         gxqUhiwRJwFkfJyJncETGq9FKbALkhzpZI4BGpYg4CZylWJ4MFW11SyLdG2C4bYraJZG
         6tOWywqVFid49E629vum5auloYnr/yjL4et+219rIF64OVHPlHH+BpcP2phkI8ZfC0mC
         qr2w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@ibm.com header.s=pp1 header.b="D/QfI6Lk";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=NONE dis=NONE) header.from=ibm.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id pi11-20020a0562144a8b00b0065b034d681asi7795666qvb.528.2023.10.24.12.12.28
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 24 Oct 2023 12:12:28 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@ibm.com header.s=pp1 header.b="D/QfI6Lk";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=NONE dis=NONE) header.from=ibm.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qvMoe-000137-AQ; Tue, 24 Oct 2023 15:11:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <milesg@linux.vnet.ibm.com>)
 id 1qvMoa-00012F-PU; Tue, 24 Oct 2023 15:11:44 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <milesg@linux.vnet.ibm.com>)
 id 1qvMoZ-0008EU-7U; Tue, 24 Oct 2023 15:11:44 -0400
Received: from pps.filterd (m0353722.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 39OJA3Lq003728; Tue, 24 Oct 2023 19:11:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=nI+Cx2vV5POG5zmT7lpf7JazqjGek1jJQe3+LwKtRFs=;
 b=D/QfI6LkVjy3xj+9H9f5GECGZfoXTG0j1ch2uDzZQT38K5qXq6UWHy9fcv/s9zv6MIkq
 fdGG4//22Jra4s706AxWyaBXP7gwottSgMNHKkW2M2Q/3YZUFUM2lJJNaXCZWTGgPHj3
 oI/goa7OxJ4plVB8P6Sd/6DlKizQZ/g35DUBC9i3hpb4JhUfMOGxOBmhe62FTZv0Be2h
 4m0YyK1agtJng/6wqSSVeFm/4kcs3F31mnyQIRyB/HIPcfNzS7+zIYqsEaVPT8No2lvR
 QQIYMY2InrZniXAB7uPSXXrIG66TWDj8U2Uqbk+7ifbO0zSO37ojUJ4DFqTd8OKcIYsr sw== 
Received: from ppma12.dal12v.mail.ibm.com
 (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3txkuf826s-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 24 Oct 2023 19:11:27 +0000
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
 by ppma12.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id
 39OHmZ9n023786; Tue, 24 Oct 2023 19:11:20 GMT
Received: from smtprelay06.wdc07v.mail.ibm.com ([172.16.1.73])
 by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 3tvryt1xyx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 24 Oct 2023 19:11:20 +0000
Received: from smtpav04.wdc07v.mail.ibm.com (smtpav04.wdc07v.mail.ibm.com
 [10.39.53.231])
 by smtprelay06.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 39OJBJvm20447996
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 24 Oct 2023 19:11:19 GMT
Received: from smtpav04.wdc07v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 6622158052;
 Tue, 24 Oct 2023 19:11:19 +0000 (GMT)
Received: from smtpav04.wdc07v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id DA92358050;
 Tue, 24 Oct 2023 19:11:18 +0000 (GMT)
Received: from mamboa4.aus.stglabs.ibm.com (unknown [9.3.84.87])
 by smtpav04.wdc07v.mail.ibm.com (Postfix) with ESMTP;
 Tue, 24 Oct 2023 19:11:18 +0000 (GMT)
From: Glenn Miles <milesg@linux.vnet.ibm.com>
To: qemu-devel@nongnu.org
Cc: Glenn Miles <milesg@linux.vnet.ibm.com>, qemu-arm@nongnu.org, clg@kaod.org,
 andrew@codeconstruct.com.au, joel@jms.id.au, philmd@linaro.org
Subject: [PATCH v2] misc/led: LED state is set opposite of what is expected
Date: Tue, 24 Oct 2023 14:11:15 -0500
Message-Id: <20231024191115.4134426-1-milesg@linux.vnet.ibm.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: FndO5qW3hPoV9tRK8OaGLAMbzFsS4ALv
X-Proofpoint-ORIG-GUID: FndO5qW3hPoV9tRK8OaGLAMbzFsS4ALv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-10-24_19,2023-10-24_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0
 priorityscore=1501 phishscore=0 malwarescore=0 clxscore=1015 bulkscore=0
 mlxlogscore=745 adultscore=0 mlxscore=0 impostorscore=0 lowpriorityscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2310170001
 definitions=main-2310240165
Received-SPF: none client-ip=148.163.158.5;
 envelope-from=milesg@linux.vnet.ibm.com; helo=mx0b-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: dVao/Gs2P1CD

Testing of the LED state showed that when the LED polarity was
set to GPIO_POLARITY_ACTIVE_LOW and a low logic value was set on
the input GPIO of the LED, the LED was being turn off when it was
expected to be turned on.

Signed-off-by: Glenn Miles <milesg@linux.vnet.ibm.com>
---

Changes from v1:
    - Changed logic for readability

 hw/misc/led.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/misc/led.c b/hw/misc/led.c
index f6d6d68bce..42bb43a39a 100644
--- a/hw/misc/led.c
+++ b/hw/misc/led.c
@@ -63,7 +63,7 @@ static void led_set_state_gpio_handler(void *opaque, int line, int new_state)
     LEDState *s = LED(opaque);
 
     assert(line == 0);
-    led_set_state(s, !!new_state != s->gpio_active_high);
+    led_set_state(s, !!new_state == s->gpio_active_high);
 }
 
 static void led_reset(DeviceState *dev)
-- 
2.31.1

