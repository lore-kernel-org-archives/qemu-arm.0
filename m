Received: by 2002:a17:906:6951:b0:a28:f940:7a27 with SMTP id c17csp1348730ejs;
        Wed, 10 Jan 2024 15:17:17 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEYMsiyQilidbYa8K4M2JLTi4WRqOquJR0lVFM6a9nLaSfxkGGyePHWiMAZOQtW3l7AZdaN
X-Received: by 2002:a05:622a:353:b0:429:a1d4:11ad with SMTP id r19-20020a05622a035300b00429a1d411admr383103qtw.65.1704928637322;
        Wed, 10 Jan 2024 15:17:17 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1704928637; cv=none;
        d=google.com; s=arc-20160816;
        b=kiyDRN7/uttRHOKdruI+woQN+PCc8qIJY+na9sDoLM50WMfa7s43XAqYmD/RuUlzu4
         4jl1g3lMnI2Wzh85EsLGwIZ+KxT5oP3O7VkD50501qbktjXSY9RHrRNSiHGWZeDPmAY4
         x/nxbqaH2l1+OhTMiUpikkyCcbueP3cGUVoCwnGt2tjemj5uqXWQT5Qv8yPiuQUNM/Zz
         drIvtF/5z++t+dDguY+VF7bRJ3Xa/+yhHCb01cQmH8AXfgUxrZ3eKE72atirkQ5xLiUp
         BZa1qTqf3JJILgM+TRd+NhQsfgYBSgE59cw/hVKR7ddtFLVK+A4J1TtK7ZsEK9UDai1i
         +3Og==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=MXrNg6OfMdpGrmxggaLPMv2T7V31hNWG4E6fCbLMtVk=;
        fh=xrfrdnXt6yALLaQWR1WAebrnD81q5WGqWzq5w17UyxQ=;
        b=yAHiohxPQjhzv3n9SpiR1yt2GYlWbCQZMgT4e+iodEiqj/X9V5cs6DLV4g0wOUjDJ1
         ixWJ03Si2N4MNd1DyPwfxrIgWE+qQgtfXjH86JEr02AQcYocH2feD+H/Q2MfkWiaWMjd
         gpd/W1XKViJXsjVT9Z5utGakh8CpDyNuqBveoKZEavX4xWUWjSwLjYJoBvTp2+3TuDPA
         16FzfeFO66HmILx2NL23hs7LsSI7NosHLhBjroWczo8i8JF+lwb0rdqoX4NKeDgQNRxc
         rUnTwt4Lj0haWVpR38Dk5tDnEkF5IvzL3frJuM+uYvOWOwpQGma3VvnG21HcLf2/M4nF
         fEpg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@ibm.com header.s=pp1 header.b=IUtulc8f;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=NONE dis=NONE) header.from=ibm.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f2-20020a05622a1a0200b0042778560709si5208370qtb.295.2024.01.10.15.17.17
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 10 Jan 2024 15:17:17 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@ibm.com header.s=pp1 header.b=IUtulc8f;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=NONE dis=NONE) header.from=ibm.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rNhnn-0007Ga-JQ; Wed, 10 Jan 2024 18:16:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ninad@linux.ibm.com>)
 id 1rNhnl-0007G9-C0; Wed, 10 Jan 2024 18:16:01 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ninad@linux.ibm.com>)
 id 1rNhni-0001XZ-MR; Wed, 10 Jan 2024 18:16:01 -0500
Received: from pps.filterd (m0353728.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 40AMvHpe008677; Wed, 10 Jan 2024 23:15:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-type :
 content-transfer-encoding; s=pp1;
 bh=MXrNg6OfMdpGrmxggaLPMv2T7V31hNWG4E6fCbLMtVk=;
 b=IUtulc8fKH8B7k+KbAZylvp09bX6igVXlPyUd4a/rBbvoDc1GgL6gO40Z8HhFtZpCYFK
 H9O5r+/uk1uxUcV+YmHn92OrS12QGhDKZsqzwkNW/XG4Flod7gdGu6vvxgBAf4U9uqSt
 l8l0cfb+4pr8mFvIW4t15kpz5U7z+ITO5vRpfwb1KjNxTJq/bRKLZws/kk02F10UfhcA
 qWncrWtLtfbMHfalTTcD0frRL/zfm9epRXL7feC3gK6Nxnlb13qWURzJJ1lg/6tNJP7B
 qwrx9DH1QM2pKQazoBfoCBErODfY818zxWcBKdV9iAVn8GkF5gyJv8uuXQlGYwegA/mC rw== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3vj4furd3y-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 10 Jan 2024 23:15:41 +0000
Received: from m0353728.ppops.net (m0353728.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 40AMvKl9008768;
 Wed, 10 Jan 2024 23:15:41 GMT
Received: from ppma13.dal12v.mail.ibm.com
 (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3vj4furd3k-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 10 Jan 2024 23:15:41 +0000
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
 by ppma13.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id
 40AMkUkK000886; Wed, 10 Jan 2024 23:15:40 GMT
Received: from smtprelay06.dal12v.mail.ibm.com ([172.16.1.8])
 by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 3vfkdkftgr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 10 Jan 2024 23:15:39 +0000
Received: from smtpav05.dal12v.mail.ibm.com (smtpav05.dal12v.mail.ibm.com
 [10.241.53.104])
 by smtprelay06.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 40ANFdDI5702204
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 10 Jan 2024 23:15:39 GMT
Received: from smtpav05.dal12v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 751EF5806A;
 Wed, 10 Jan 2024 23:15:39 +0000 (GMT)
Received: from smtpav05.dal12v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 22E4A58065;
 Wed, 10 Jan 2024 23:15:39 +0000 (GMT)
Received: from gfwa153.aus.stglabs.ibm.com (unknown [9.3.84.127])
 by smtpav05.dal12v.mail.ibm.com (Postfix) with ESMTP;
 Wed, 10 Jan 2024 23:15:39 +0000 (GMT)
From: Ninad Palsule <ninad@linux.ibm.com>
To: qemu-devel@nongnu.org, clg@kaod.org, peter.maydell@linaro.org,
 andrew@codeconstruct.com.au, joel@jms.id.au, pbonzini@redhat.com,
 marcandre.lureau@redhat.com, berrange@redhat.com, thuth@redhat.com,
 philmd@linaro.org, lvivier@redhat.com
Cc: Ninad Palsule <ninad@linux.ibm.com>, qemu-arm@nongnu.org
Subject: [PATCH v10 0/9] Introduce model for IBM's FSI
Date: Wed, 10 Jan 2024 17:15:28 -0600
Message-Id: <20240110231537.1654478-1-ninad@linux.ibm.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: ci8RfXxQIziSSLqm_wInhz_ZyMxH5kin
X-Proofpoint-GUID: cYhM0PyT9-9nISJXXG9QmTQ0D4wlLVHU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-01-10_12,2024-01-10_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0
 lowpriorityscore=0 bulkscore=0 adultscore=0 priorityscore=1501 spamscore=0
 clxscore=1015 impostorscore=0 mlxlogscore=414 mlxscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2311290000
 definitions=main-2401100183
Received-SPF: pass client-ip=148.163.156.1; envelope-from=ninad@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
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
X-TUID: 0qk3FUwmhuGB

Hello,

Please review the patch-set version 10.
I have incorporated review comments from Cedric.
v10:
  - Moved aspeed-apb2opb to hw/misc directory
  - Moved scratchpad to lbus files.
  - Moved fsi-slave to fsi files.
  - Merged opb changes in the aspeed-apb2opb files
  - Reduced number of config option to 2

Ninad Palsule (9):
  hw/fsi: Introduce IBM's Local bus and scratchpad
  hw/fsi: Introduce IBM's FSI Bus and FSI slave
  hw/fsi: Introduce IBM's cfam
  hw/fsi: Introduce IBM's FSI master
  hw/fsi: Aspeed APB2OPB interface, Onchip perif bus
  hw/arm: Hook up FSI module in AST2600
  hw/fsi: Added qtest
  hw/fsi: Added FSI documentation
  hw/fsi: Update MAINTAINER list

 MAINTAINERS                      |   8 +
 docs/specs/fsi.rst               | 138 +++++++++++++
 docs/specs/index.rst             |   1 +
 meson.build                      |   1 +
 hw/fsi/trace.h                   |   1 +
 include/hw/arm/aspeed_soc.h      |   4 +
 include/hw/fsi/cfam.h            |  34 ++++
 include/hw/fsi/fsi-master.h      |  32 +++
 include/hw/fsi/fsi.h             |  38 ++++
 include/hw/fsi/lbus.h            |  52 +++++
 include/hw/misc/aspeed-apb2opb.h |  50 +++++
 hw/arm/aspeed_ast2600.c          |  19 ++
 hw/fsi/cfam.c                    | 182 +++++++++++++++++
 hw/fsi/fsi-master.c              | 173 ++++++++++++++++
 hw/fsi/fsi.c                     | 111 ++++++++++
 hw/fsi/lbus.c                    | 121 +++++++++++
 hw/misc/aspeed-apb2opb.c         | 338 +++++++++++++++++++++++++++++++
 tests/qtest/aspeed-fsi-test.c    | 205 +++++++++++++++++++
 hw/Kconfig                       |   1 +
 hw/arm/Kconfig                   |   1 +
 hw/fsi/Kconfig                   |   2 +
 hw/fsi/meson.build               |   1 +
 hw/fsi/trace-events              |  11 +
 hw/meson.build                   |   1 +
 hw/misc/Kconfig                  |   5 +
 hw/misc/meson.build              |   1 +
 hw/misc/trace-events             |   4 +
 tests/qtest/meson.build          |   1 +
 28 files changed, 1536 insertions(+)
 create mode 100644 docs/specs/fsi.rst
 create mode 100644 hw/fsi/trace.h
 create mode 100644 include/hw/fsi/cfam.h
 create mode 100644 include/hw/fsi/fsi-master.h
 create mode 100644 include/hw/fsi/fsi.h
 create mode 100644 include/hw/fsi/lbus.h
 create mode 100644 include/hw/misc/aspeed-apb2opb.h
 create mode 100644 hw/fsi/cfam.c
 create mode 100644 hw/fsi/fsi-master.c
 create mode 100644 hw/fsi/fsi.c
 create mode 100644 hw/fsi/lbus.c
 create mode 100644 hw/misc/aspeed-apb2opb.c
 create mode 100644 tests/qtest/aspeed-fsi-test.c
 create mode 100644 hw/fsi/Kconfig
 create mode 100644 hw/fsi/meson.build
 create mode 100644 hw/fsi/trace-events

-- 
2.39.2

