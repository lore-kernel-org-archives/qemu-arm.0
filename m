Received: by 2002:a19:3859:0:0:0:0:0 with SMTP id d25csp1750150lfj;
        Tue, 3 May 2022 16:11:20 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzGkD3XVFNS9g694JJ/TuCrFyWJFvOCrf9J8OhN8xl+A53ni1upJu4OtuUYM+tbNK9RAfm1
X-Received: by 2002:a05:620a:49d:b0:69f:b7bd:f831 with SMTP id 29-20020a05620a049d00b0069fb7bdf831mr13761595qkr.749.1651619480400;
        Tue, 03 May 2022 16:11:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1651619480; cv=none;
        d=google.com; s=arc-20160816;
        b=ByM+DHMwUJSXWR0f45uz28Y5aRag3hmi59MozJkFunQWK/4d++8KutHMx7OYigxpid
         4qC3Zt2ZgkR0B1L5CAnXtA9o8/P09CZcClze+CnMlOLNRot+WjjV47pGCumn1rvHrbSG
         VtzGW5Ql+BBhY0jIa0tk5jM6k9tLxuhi/4eOZHk04Rz+ZG8wpOvA+PW958ypnc64S9Sc
         7W988NuixDqt70sN0I1fv9+1cw9ibKAmtN0DoeYDP+s5C3rSiDRsp7nGbj1MaeGhORtO
         le28ipvlCDL7PE7cVy0xmy8lhBAO+jRP4auG/RfTncqeYCFAuy7+oa0dQzO+Rx724vh+
         ZnUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=H0kcl9bBxfoMcRYwUuFvEYrF29d3BGOhHPSec29Rsmc=;
        b=n+YM1MZkyJpYcfAYwofOaCCCflycFiM+p9w4vMaF6Q5nu03rfnjv/232fPRMaQN8nH
         VOkwA+o5caLmp+tJXaSQP2cLIX0YYSOShGMAoLRe4pXD6ECPhA9QBlZdykdm0hNJupCS
         yWl0cccvwQ67OAGXh+JhfznHvuS1ts/POhhyfWjwtvlKmBtJ1rMHUZsbb3v1sPR4XEEZ
         S7z/ksEtnTwfN8rq0KA5+BVGtWPDokLsL7VFkbvH2MkLPJwc/SkQr+QDZGw28W3QMJrZ
         ZFIvaP7kLlcD0Erc9vjWr0Vi2qbwnV76UYbWC7VnbHSYkGhuzq93Oqf4eEkZtRJFi2Ts
         YDpA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@fb.com header.s=facebook header.b=raDngWrd;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=fb.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id iu15-20020ad45ccf000000b0045a819509d3si5300733qvb.431.2022.05.03.16.11.20
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 03 May 2022 16:11:20 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@fb.com header.s=facebook header.b=raDngWrd;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=fb.com
Received: from localhost ([::1]:56932 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nm1fr-0004tE-Tx
	for alex.bennee@linaro.org; Tue, 03 May 2022 19:11:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51252)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=61228a338c=pdel@fb.com>)
 id 1nlzP4-0006U0-TX
 for qemu-arm@nongnu.org; Tue, 03 May 2022 16:45:53 -0400
Received: from mx0a-00082601.pphosted.com ([67.231.145.42]:20770)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=61228a338c=pdel@fb.com>)
 id 1nlzP0-0002ph-Lh
 for qemu-arm@nongnu.org; Tue, 03 May 2022 16:45:49 -0400
Received: from pps.filterd (m0109334.ppops.net [127.0.0.1])
 by mx0a-00082601.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 243HFj8V007274
 for <qemu-arm@nongnu.org>; Tue, 3 May 2022 13:45:42 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=facebook; bh=H0kcl9bBxfoMcRYwUuFvEYrF29d3BGOhHPSec29Rsmc=;
 b=raDngWrdhoCOQuF8dZP3JYfohUeHCOMSy/MSfvS4e7kcRHR4WFAngI9Yzb2qKxoNhbGj
 GVGIPu+lSCqYChloqCpnFl/GEiLhHh03AYb6j2/4M3V2pTS+QOCtTrcK4rELQzp0HkNf
 cqJ2TJn75C6FYHMBtyW/wSZNf8F9G4TUFyk= 
Received: from maileast.thefacebook.com ([163.114.130.16])
 by mx0a-00082601.pphosted.com (PPS) with ESMTPS id 3fu6mkat5s-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Tue, 03 May 2022 13:45:42 -0700
Received: from twshared13579.04.prn5.facebook.com (2620:10d:c0a8:1b::d) by
 mail.thefacebook.com (2620:10d:c0a8:83::5) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Tue, 3 May 2022 13:45:35 -0700
Received: by devvm9194.prn0.facebook.com (Postfix, from userid 385188)
 id 528BF5ACF47A; Tue,  3 May 2022 13:45:30 -0700 (PDT)
From: Peter Delevoryas <pdel@fb.com>
To: 
CC: <pdel@fb.com>, <patrick@stwcx.xyz>, <qemu-arm@nongnu.org>,
 <qemu-devel@nongnu.org>, <clg@kaod.org>
Subject: [PATCH 0/1] hw/arm/aspeed: Add fby35 machine type
Date: Tue, 3 May 2022 13:44:51 -0700
Message-ID: <20220503204451.1257898-1-pdel@fb.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-FB-Internal: Safe
Content-Type: text/plain
X-Proofpoint-GUID: EEgEZ8aO4ze9B5vyl-X-Bin6d3R3XWOV
X-Proofpoint-ORIG-GUID: EEgEZ8aO4ze9B5vyl-X-Bin6d3R3XWOV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.858,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-05-03_08,2022-05-02_03,2022-02-23_01
Received-SPF: pass client-ip=67.231.145.42;
 envelope-from=prvs=61228a338c=pdel@fb.com; helo=mx0a-00082601.pphosted.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: LIryUvgTO2WG

Hey everyone,

I'm submitting another Facebook (Meta Platforms) machine type: this time =
I'm
including an acceptance test too.

Unfortunately, this machine boots _very_ slowly. 300+ seconds. I'm not su=
re why
this is (so I don't know how to fix it easily) and I don't know how to ov=
erride
the avocado test timeout just for a single test, so I increased the globa=
l
timeout for all "boot_linux_console.py" tests from 90s to 400s. I doubt t=
his is
acceptable, but what other option is there? Should I add
AVOCADO_TIMEOUT_EXPECTED?

@skipUnless(os.getenv('AVOCADO_TIMEOUT_EXPECTED'), 'Test might timeout')

What is the point of this environment variable though, except to skip it =
in CIT?
If I run the test with this environment variable defined, it doesn't disa=
ble the
timeout, it just skips it right? I want an option to run this test with a=
 larger
timeout.

Thanks,
Peter

Peter Delevoryas (1):
  hw/arm/aspeed: Add fby35 machine type

 hw/arm/aspeed.c                     | 63 +++++++++++++++++++++++++++++
 tests/avocado/boot_linux_console.py | 20 ++++++++-
 2 files changed, 82 insertions(+), 1 deletion(-)

--=20
2.30.2

