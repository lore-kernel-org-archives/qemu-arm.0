Received: by 2002:a17:906:6951:b0:a28:f940:7a27 with SMTP id c17csp672264ejs;
        Tue, 9 Jan 2024 14:24:01 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEN3tMWWGdTLpodG1cvbo4sC+Zg3/i/HON7DVGz10NHo8apJMbUX1c6lPIBVNDafflrYQP4
X-Received: by 2002:a05:620a:14a7:b0:781:6086:db95 with SMTP id x7-20020a05620a14a700b007816086db95mr136167qkj.28.1704839041218;
        Tue, 09 Jan 2024 14:24:01 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1704839041; cv=none;
        d=google.com; s=arc-20160816;
        b=mfVnkc4OkD6e2RS0VDDq7ZDtf8SB/qWQd7rkTnxHrJMCGrPfnG1hx6jDgKGPAxVDq8
         XNXoBJRCzE6UKZzYyCtBXo1dTytZNxdQoyk/hUQh2jk4kRkxgc9SJbJwmjWrMeHMHa5m
         A9bI+bOf+PuRXlHg9a44WF2G6B1dhYxsnRhK2Ugqxn3AU2xEbqdv4mfo7oZ2JySQ6a+R
         5M0BZuqzsVupW7rRtaF/L4y59m2ufAi+dyk1eMwN/20iqb3LF7U10J7o1OinkNuWrq61
         9gEu3VUhPwJ+VTFA8RNJb3YsvqTGTYjt5wwmJUgy04zKEZjHljG8Duv4CyG5SRfKX0rP
         mf8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=ehDLOWY8e3Uoj6KiAHXnx43mYM2iMoM6gnLe4cC5Q0I=;
        fh=xrfrdnXt6yALLaQWR1WAebrnD81q5WGqWzq5w17UyxQ=;
        b=n3xLl8n0bX/ywtyZcTjfXoj8e3chQFk3poDR/81fhtRECOkejWlUBN9XeZ7LVLAB8+
         +2dYjHgEgm+IkVE40epWkybilmEFA+/ASXDUahUyY32SN2zPsVsyLu+4H2vGr9htaXSJ
         BiJUEhTd8siMDnWs85Jtr9oUGyuZwqTxGy8nh857uAAXt5e8ep6MKLJBbBEbAVFmJrS1
         6mjsDqRncvXY4XzvyceJgVk9UEBEHWKF/2z5eAxZ7LGxGIUybMttYRtkGaEiGi4CqeCI
         GgrGBjOyo0nFdBfv/cICf96UvezptD20rTba33KqNcqwetzb3RYGWp/acLuXsiiSYHUH
         dUSA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@ibm.com header.s=pp1 header.b=d6cHpFlD;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=NONE dis=NONE) header.from=ibm.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 4-20020a05620a048400b007832de5e5efsi2266777qkr.216.2024.01.09.14.24.01
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 09 Jan 2024 14:24:01 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@ibm.com header.s=pp1 header.b=d6cHpFlD;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=NONE dis=NONE) header.from=ibm.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rNKVl-0006Pu-H1; Tue, 09 Jan 2024 17:23:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ninad@linux.ibm.com>)
 id 1rNKVk-0006Pi-94; Tue, 09 Jan 2024 17:23:52 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ninad@linux.ibm.com>)
 id 1rNKVi-00025y-DM; Tue, 09 Jan 2024 17:23:51 -0500
Received: from pps.filterd (m0353722.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 409M4A7q022981; Tue, 9 Jan 2024 22:23:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-type :
 content-transfer-encoding; s=pp1;
 bh=ehDLOWY8e3Uoj6KiAHXnx43mYM2iMoM6gnLe4cC5Q0I=;
 b=d6cHpFlD/gu5uxZcre9/gNoM0iTm+rlC+UlJPYSpTZs7peSdZ2wOnK/UrtZhMErfIhoI
 wT81YtouLMzQRcH13vZva4EONOX+xvlaOXTxlhoeEf2vG+Z8KT/B5Gdw4n7kDmXbQXBF
 0rCteM3luKwzF9zdrWwpYR4c1WX/MXAw4q/8z/FX8M8ms1zWT599ZQQukeMp6y+fjNAS
 91ue3zMZoRCVHsP2zPRxPGy/sm9SFq5qrVuHoj0kH6ifHbYT6Yy/OoHS+b2zycs0t15c
 1CyZOGjGPhbfj9xu+LMFahBi+LlbZZkUTfPo9LLndVMykgDZU0BtP3ypgXZ5dQT7UQPO vg== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3vhd1stfrp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 09 Jan 2024 22:23:38 +0000
Received: from m0353722.ppops.net (m0353722.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 409M5wdT027361;
 Tue, 9 Jan 2024 22:23:37 GMT
Received: from ppma23.wdc07v.mail.ibm.com
 (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3vhd1stfra-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 09 Jan 2024 22:23:37 +0000
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
 by ppma23.wdc07v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id
 409JswU7004384; Tue, 9 Jan 2024 22:23:37 GMT
Received: from smtprelay07.dal12v.mail.ibm.com ([172.16.1.9])
 by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 3vfjpksd72-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 09 Jan 2024 22:23:36 +0000
Received: from smtpav02.dal12v.mail.ibm.com (smtpav02.dal12v.mail.ibm.com
 [10.241.53.101])
 by smtprelay07.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 409MNae537028242
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 9 Jan 2024 22:23:36 GMT
Received: from smtpav02.dal12v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 2A28358051;
 Tue,  9 Jan 2024 22:23:36 +0000 (GMT)
Received: from smtpav02.dal12v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C9E475805A;
 Tue,  9 Jan 2024 22:23:35 +0000 (GMT)
Received: from gfwa153.aus.stglabs.ibm.com (unknown [9.3.84.127])
 by smtpav02.dal12v.mail.ibm.com (Postfix) with ESMTP;
 Tue,  9 Jan 2024 22:23:35 +0000 (GMT)
From: Ninad Palsule <ninad@linux.ibm.com>
To: qemu-devel@nongnu.org, clg@kaod.org, peter.maydell@linaro.org,
 andrew@codeconstruct.com.au, joel@jms.id.au, pbonzini@redhat.com,
 marcandre.lureau@redhat.com, berrange@redhat.com, thuth@redhat.com,
 philmd@linaro.org, lvivier@redhat.com
Cc: Ninad Palsule <ninad@linux.ibm.com>, qemu-arm@nongnu.org
Subject: [PATCH v9 00/10] Introduce model for IBM's FSI
Date: Tue,  9 Jan 2024 16:23:23 -0600
Message-Id: <20240109222333.1225031-1-ninad@linux.ibm.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: 8INPp8TU_UId747VWuJs3NvWbzV9y6XT
X-Proofpoint-GUID: bonWcAqEykVVpVKTxX5kkYZll5y6sF7n
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-01-09_11,2024-01-09_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0
 lowpriorityscore=0 malwarescore=0 impostorscore=0 mlxlogscore=245
 spamscore=0 suspectscore=0 adultscore=0 priorityscore=1501 bulkscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2311290000 definitions=main-2401090179
Received-SPF: pass client-ip=148.163.158.5; envelope-from=ninad@linux.ibm.com;
 helo=mx0b-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: qQF/F5dUaJ+s

Hello,

Please review the patch-set version 9.
I have incorporated review comments from Cedric.

Ninad Palsule (10):
  hw/fsi: Introduce IBM's Local bus
  hw/fsi: Introduce IBM's FSI Bus
  hw/fsi: Introduce IBM's cfam,fsi-slave,scratchpad
  hw/fsi: IBM's On-chip Peripheral Bus
  hw/fsi: Introduce IBM's FSI master
  hw/fsi: Aspeed APB2OPB interface
  hw/arm: Hook up FSI module in AST2600
  hw/fsi: Added qtest
  hw/fsi: Added FSI documentation
  hw/fsi: Update MAINTAINER list

 MAINTAINERS                     |   8 +
 docs/specs/fsi.rst              | 138 ++++++++++++++
 docs/specs/index.rst            |   1 +
 meson.build                     |   1 +
 hw/fsi/trace.h                  |   1 +
 include/hw/arm/aspeed_soc.h     |   4 +
 include/hw/fsi/aspeed-apb2opb.h |  34 ++++
 include/hw/fsi/cfam.h           |  46 +++++
 include/hw/fsi/fsi-master.h     |  32 ++++
 include/hw/fsi/fsi-slave.h      |  27 +++
 include/hw/fsi/fsi.h            |  24 +++
 include/hw/fsi/lbus.h           |  41 +++++
 include/hw/fsi/opb.h            |  27 +++
 hw/arm/aspeed_ast2600.c         |  19 ++
 hw/fsi/aspeed-apb2opb.c         | 314 ++++++++++++++++++++++++++++++++
 hw/fsi/cfam.c                   | 253 +++++++++++++++++++++++++
 hw/fsi/fsi-master.c             | 173 ++++++++++++++++++
 hw/fsi/fsi-slave.c              | 101 ++++++++++
 hw/fsi/fsi.c                    |  22 +++
 hw/fsi/lbus.c                   |  51 ++++++
 hw/fsi/opb.c                    |  36 ++++
 tests/qtest/aspeed-fsi-test.c   | 205 +++++++++++++++++++++
 hw/Kconfig                      |   1 +
 hw/arm/Kconfig                  |   1 +
 hw/fsi/Kconfig                  |  21 +++
 hw/fsi/meson.build              |   5 +
 hw/fsi/trace-events             |  13 ++
 hw/meson.build                  |   1 +
 tests/qtest/meson.build         |   1 +
 29 files changed, 1601 insertions(+)
 create mode 100644 docs/specs/fsi.rst
 create mode 100644 hw/fsi/trace.h
 create mode 100644 include/hw/fsi/aspeed-apb2opb.h
 create mode 100644 include/hw/fsi/cfam.h
 create mode 100644 include/hw/fsi/fsi-master.h
 create mode 100644 include/hw/fsi/fsi-slave.h
 create mode 100644 include/hw/fsi/fsi.h
 create mode 100644 include/hw/fsi/lbus.h
 create mode 100644 include/hw/fsi/opb.h
 create mode 100644 hw/fsi/aspeed-apb2opb.c
 create mode 100644 hw/fsi/cfam.c
 create mode 100644 hw/fsi/fsi-master.c
 create mode 100644 hw/fsi/fsi-slave.c
 create mode 100644 hw/fsi/fsi.c
 create mode 100644 hw/fsi/lbus.c
 create mode 100644 hw/fsi/opb.c
 create mode 100644 tests/qtest/aspeed-fsi-test.c
 create mode 100644 hw/fsi/Kconfig
 create mode 100644 hw/fsi/meson.build
 create mode 100644 hw/fsi/trace-events

-- 
2.39.2

