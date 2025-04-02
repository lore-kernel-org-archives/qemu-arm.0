Received: by 2002:a17:504:17d6:b0:1be9:327d:8ee3 with SMTP id o22csp3462399njd;
        Wed, 2 Apr 2025 06:53:37 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUn4MMqp52LIj/FpdhCI+wLJeB/FbGas0MSVzYOUeYR/E9UnHE98WwK/wIms8HrH5zx9kJXYyw3CAcfBQ==@linaro.org
X-Google-Smtp-Source: AGHT+IHKLt4Chkd39J/hUsM+cVsf9/NhbPCgmdc+xKHOFeIGZ3t4qnXegvtVNEudR11BiuLHwu5z
X-Received: by 2002:a05:620a:25cb:b0:7c5:4adb:782a with SMTP id af79cd13be357-7c766418673mr328793485a.9.1743602017420;
        Wed, 02 Apr 2025 06:53:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1743602017; cv=none;
        d=google.com; s=arc-20240605;
        b=RI7mFZN6NsQxGzfgfL0LZOGH0pYq7jLnjvyb1XXdJ8U/Y13LP8ejVK+KrL+L8iK/YF
         Kwf0jOnQUTnflFn5ed2ee+j4iPkqypWp9bpHq2sxRX+F95WzjT4z8PuDvP/ul5rmUdqR
         coHRkhyJDs3jHA5mh+7iWuzO32Ym7kSoHgizswn39i46F6Pbn6IabE18cgmU+al9jw5F
         /Gj87cr9rarcMYGkrhpMngQ3AlbugCmD4ydG8GwgFtLvyAvtxhNUJnK0IB94PGcQH91k
         0FoI7gHM2jYz1vYyR0qSO/SrXjE8NKsv88CgEca07vOx8ERDjkHyD7KXQAAE6Pcx2tUI
         EIQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=emBN9NkJBiCgg1V4uhxS2YHrjCK2dWMOn9FFfhjLBDk=;
        fh=5is1a+8M0woj4NhXICr05pJ+ywiZz8hcILaegcMyoMI=;
        b=GqAyxob2vHrTHx7yMGLQU6H1bVfyMVxKlhzCjxbpK6LjXltsXC08Qh+jVng9lIJ3qL
         L42wv3pFqJjDRlKzlSYfHLXC7zbvMcxrB9CFXWkZAR83ckw/8NplbNX3cQCpSZArINTo
         6n2yx5uolQONB6+cJOheiUJA4J658ftEAELcPv08NIvcvAvsVOOlC9Z3Ab4TYB5DFqUs
         p4+yxhQ1HnRfc2HsvyG6FLnjF1i69iu4tFbIy7xVTstvcE8kjrJGddX7M/ChvxWgItBm
         yrTXPurPp00IqGmCEPovS7ti2/zn/zXqiXJkEoMvkF2jxm0IKhZVgm9+jLFXWxDMWVh6
         Yjsw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@ynddal.dk header.s=sig1 header.b=XCbYotU9;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7c75714b5b0si492209185a.12.2025.04.02.06.53.37
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 02 Apr 2025 06:53:37 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@ynddal.dk header.s=sig1 header.b=XCbYotU9;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tzyWc-0000RY-2X; Wed, 02 Apr 2025 09:53:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mads@ynddal.dk>) id 1tzyWG-00008A-PH
 for qemu-arm@nongnu.org; Wed, 02 Apr 2025 09:52:47 -0400
Received: from qs51p00im-qukt01072502.me.com ([17.57.155.15])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mads@ynddal.dk>) id 1tzyWF-0004bP-4n
 for qemu-arm@nongnu.org; Wed, 02 Apr 2025 09:52:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ynddal.dk; s=sig1;
 bh=emBN9NkJBiCgg1V4uhxS2YHrjCK2dWMOn9FFfhjLBDk=;
 h=From:To:Subject:Date:Message-ID:Content-Type:MIME-Version:x-icloud-hme;
 b=XCbYotU9FGGaBF1PmlgF7YmYSuY8s1Wqhw1EWMmgVFXQB/hnG4t6FPOmB1iXGs4W5
 G0Pok16a3/UUASxF+dI/OBLZAbTf10/528aj0HRSV7lpgz1xelRhMBz1TR1PEuMdi0
 M1a/7p0e/fckcHTBflDYX3ptfIV/Fv05EKU3IPv1TjwyOobc1/n9xhPxSkO3yNgw0D
 qbSvRyTd8nxZS2r4RW3U+EQiZLGY9B6MX12Hre8KHKHJKDpKZiGKsGw8JAqF8LgGKV
 uBYIAfL7jxHT3hOh3jWIK19/12EtFqvKlFmVePPkXkoL+7QJw0MOVojsgY3ph7S1JL
 vs4kWp3eQVi5g==
Received: from localhost.localdomain (qs51p00im-dlb-asmtp-mailmevip.me.com
 [17.57.155.28])
 by qs51p00im-qukt01072502.me.com (Postfix) with ESMTPSA id 994B86EC02F8;
 Wed,  2 Apr 2025 13:52:32 +0000 (UTC)
From: Mads Ynddal <mads@ynddal.dk>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Phil Dennis-Jordan <phil@philjordan.eu>,
 Cameron Esfahani <dirty@apple.com>, Roman Bolshakov <rbolshakov@ddn.com>,
 Peter Maydell <peter.maydell@linaro.org>, Alexander Graf <agraf@csgraf.de>,
 Mads Ynddal <m.ynddal@samsung.com>
Subject: [PATCH 0/2] Fix GDB support for macOS hvf
Date: Wed,  2 Apr 2025 15:52:27 +0200
Message-ID: <20250402135229.28143-1-mads@ynddal.dk>
X-Mailer: git-send-email 2.48.1
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: Ga602eBLzBdCYQCMB_8sOH9rdSGrDU_Q
X-Proofpoint-ORIG-GUID: Ga602eBLzBdCYQCMB_8sOH9rdSGrDU_Q
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-02_05,2025-04-02_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=739
 phishscore=0 mlxscore=0
 bulkscore=0 spamscore=0 suspectscore=0 adultscore=0 malwarescore=0
 clxscore=1030 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2308100000 definitions=main-2504020088
Received-SPF: pass client-ip=17.57.155.15; envelope-from=mads@ynddal.dk;
 helo=qs51p00im-qukt01072502.me.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=0.001,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: hvKYYAac6aFJ

From: Mads Ynddal <m.ynddal@samsung.com>

In (recent versions of?) macOS, calls to hv_vcpu_set_sys_reg were failing if
they were issued outside of the specific thread that owns the vCPU.

This caused a crash when attaching a debugger through the GDB stub.

This GDB stub has worked before, so it is unclear if Apple changed the
behavior of the function in a release of macOS.

Mads Ynddal (2):
  hvf: avoid repeatedly setting trap debug for each cpu
  hvf: only update sysreg from owning thread

 accel/hvf/hvf-all.c  |  7 ++++++-
 target/arm/hvf/hvf.c | 27 +++++++++++----------------
 2 files changed, 17 insertions(+), 17 deletions(-)

-- 
2.48.1

