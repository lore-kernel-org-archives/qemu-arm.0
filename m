Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8227EC5CFDB
	for <qemu-arm@archiver.kernel.org>; Thu, 13 Aug 2026 18:17:31 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wuZz9-0001qk-47; Thu, 13 Aug 2026 14:16:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wuZyz-0001mZ-D3
 for qemu-arm@nongnu.org; Thu, 13 Aug 2026 14:16:53 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wuZyv-0001x6-Uj
 for qemu-arm@nongnu.org; Thu, 13 Aug 2026 14:16:48 -0400
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 67DGDvv22916957
 for <qemu-arm@nongnu.org>; Thu, 13 Aug 2026 18:16:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:message-id
 :mime-version:subject:to; s=qcppdkim1; bh=PWFJKPjiUmt2MzQeVSdtz6
 +I6h5J0GJ1E7SS22Bc2ZU=; b=i9P0McYtdYz9t6lpEeQncewevRg0h4yiVxMWJA
 j4+P8d2tQh8v2ko3emcxDUNqhIAfjATjE3ACGbrPeYI0esHXNFUpawWGkgnfZGM/
 8OZwqM6xSmfrM1jQdBQY/BuF0uioEpRLvK45/zZJu1NXOU4l0b0evFMV1jvS5uAS
 wx/qVUPglsQpFvhlgsnRy7PxHFd859NbDtSD64AuUad0Fgealp83JknpV4zo5Ju0
 efRb5T6dtc/KYptsebrqpFcV9P/Myud+22XetzMFC+LRvEMVhfC6zCTviVi/EjZ3
 /FtI3drB1uXd9nzEaL3qGvTAW26ltBud2hRTvVz19JUqHVcA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g1h90rj28-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Thu, 13 Aug 2026 18:16:44 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id
 d75a77b69052e-51c26012cd0so2346371cf.0
 for <qemu-arm@nongnu.org>; Thu, 13 Aug 2026 11:16:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1786645004; x=1787249804; darn=nongnu.org;
 h=content-transfer-encoding:content-type:mime-version:message-id:date
 :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=PWFJKPjiUmt2MzQeVSdtz6+I6h5J0GJ1E7SS22Bc2ZU=;
 b=kkGUWCmNebqUVBnK05aibcs38pEWaqKYKC8Ki2ZKn42CvhWALYUby7eLjZeuux7HSQ
 JcUuDHmAMHD4gZJiraW8dN+hat3R6JnzIkkuCyOu9DqkTeAJ19iT6MeGVkuuv+cLVQF8
 ki/7QxImGecTBLwyUTBvReZeEwESn7kQ4AzR8x0IrHNSKa4+ROnW9BvEFOZkABeAN6sb
 Cp+S1QCIvCJqqyrXm8seZAr+Xe74KZ/rhq9uyW5MqIVfxpv/g4aS6VfFJfpqjQl0zrbU
 n1sdw30+bqHPIw95EzTutuKoAPDhDEFdYIqT5G/+ByOXi57nOshh5auaIxanZUOyZkur
 geiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1786645004; x=1787249804;
 h=content-transfer-encoding:content-type:mime-version:message-id:date
 :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=PWFJKPjiUmt2MzQeVSdtz6+I6h5J0GJ1E7SS22Bc2ZU=;
 b=lBIpQ3gF4ei2q2VKLbE9dUR/JbBco8L0C6vgjs13Q1dbSPri5bus8jYUpE9BCWdsbF
 BIQEVk6Tjm9fFoJRVyHQpA8wTqbfT8ihb5G1Ayy8ljKunKOvT9KRU5uHLPy4qTeECEv3
 FgRtZbb34ZawyZur4jRPS8JoKmSvcuTUGerhPofwPVMzHJKjjfTKfTxoP5BvqM9ZeuF+
 Jbl91Q3xPU2D71qdd5vVlCSDqUe543pJvdBX5FRcno+MzXrygYo/81GPQ81fwvhkvKpP
 +2hENkxiNU2riqXnBrx7CXi3+nfjNYUclpelzR4IPyz/KoCYZTpYvM+6FFons9iOkyvG
 MKFA==
X-Forwarded-Encrypted: i=1;
 AHgh+RpndmO8rEjvtf3/4lNfj4uSJ+c+PoB0GurOJTUJluE+NjvholBfrWQD4HySzuM5SnrdnE66yUOiWg==@nongnu.org
X-Gm-Message-State: AOJu0YxK6rQW36mcdp53Nrq6GqlG+euOaYam124TeQvqnDQsYNOvFdD5
 lCffjau9Z9SJnKDXUsTjZP4LI8mMZk/JjjafmaWkaXHCEY2yCx8fI+zUzqUl1voWSFukjQySfPv
 YJ5ptq3mQD9gPiYoEgGV9uz3mvLxNWXkpGTewaSlNyEksLVqhMszMums=
X-Gm-Gg: AR+sD12q+7lnGD0PdCHYVNvxphU3jNMuU4g6hvFv2r8HsZ9UELXxFf2gZkRQp78Aq63
 qi5Jv06G9+ggSL9LV6VuiTbdXZxbIr8RXR0Pb+4CZFmT3aZ29ww0GHbHroj5B/ae5qVJ5NAajC9
 5tcyht8VvYIui4ax2ScKpynN2zGe6FQL4FYcwdUMmpwQuAhVVPNaticDUd0jOB2TkDWZ/76uzur
 OHye9Y3RFU3v7yTx1hL1atWymA1j4vddBxk+0tiNjxOszn7oXky002AR8czw2pgx2eCzMl5HJ7J
 Sf3/IZMcVy6PCZdVuk0ucfuVSwHukihk1r0z8T2kURy0bIiQ8BbtS2alr5KxASD/lIWB9pn8nC4
 us05qTPvgrgOn3zZWFqpEVtLYeeAqCwsofCXZLosQFw==
X-Received: by 2002:ac8:574a:0:b0:516:d781:589a with SMTP id
 d75a77b69052e-52d73d93483mr80959761cf.22.1786645003589; 
 Thu, 13 Aug 2026 11:16:43 -0700 (PDT)
X-Received: by 2002:ac8:574a:0:b0:516:d781:589a with SMTP id
 d75a77b69052e-52d73d93483mr80959031cf.22.1786645003075; 
 Thu, 13 Aug 2026 11:16:43 -0700 (PDT)
Received: from localhost.localdomain (pmd666.hd.free.fr. [88.187.86.199])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4815f2c07d2sm1220943f8f.30.2026.08.13.11.16.41
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 13 Aug 2026 11:16:42 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
To: qemu-devel@nongnu.org
Cc: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 Mohamed Mediouni <mohamed@unpredictable.fr>,
 Alexander Graf <agraf@csgraf.de>, qemu-ppc@nongnu.org,
 qemu-riscv@nongnu.org, kvm@vger.kernel.org,
 Richard Henderson <richard.henderson@linaro.org>, qemu-arm@nongnu.org,
 Magnus Kulke <magnuskulke@linux.microsoft.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
Subject: [PATCH 00/16] cpus: Improvements around BQL locking,
 improving docstring
Date: Thu, 13 Aug 2026 20:16:23 +0200
Message-ID: <20260813181640.6537-1-philmd@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=Ovh/DS/t c=1 sm=1 tr=0 ts=6a7e0a0c cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=2yYdEO9dI-2tQnahI7EA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODEzMDEzMiBTYWx0ZWRfX+G+R5YhK91y2
 LeCTAJ66F4uACc7rxB+SUhpVqZdvzFVokI5m9txh1UBzt6/7OdBRVBSPpCn/wqsxFqwHR/mMbzy
 VJ6Omjco1/oA5W4bNHnaQOXkDPN1DDY=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODEzMDEzMiBTYWx0ZWRfX15MyLYDEk0HU
 khj0iaILJAeTqCkDXH6V7Qu6pp4nS2Kk2jg8daRohCmV5qpdcge+d3zBgDCEEaPdh8iy+3NN98y
 eYhJG2mEv409rNIDIxzKJ1yTL1Va2hCHpOXphI+oFYurNResnsz9g4F4yjwFBAFQEHgU2p6xLZe
 wrKGNjf5SrTdWEu943rkhpzM9ZkFz6F+VxdOkIYip4R7gHJkVvYpcSt3uZUGC5LkAOhN4bxGIol
 KB4GMN1rxMRDpZa4fceuDDfNt329ZQ2dB9aPaCbfYuiAXZN5GfE24bdoOYPQS9MAUykbftTYU9n
 D2kjyukm75HCRCQZomllso9QqWBmzLi6RpOiexYELb1swq+YE1GBAJoix3P1NSXyxGntZP38t15
 au4JmsBNir7MmzK6bac/R+ZN0bCztEqz00FzMOB6TQ054LMhv62VcyqjTcq7fgPOSqx10XAznb+
 +u6fpmgOoS6kIyTRTAA==
X-Proofpoint-ORIG-GUID: etiSdP2JawXVwjuO1Rp3UENRuv3EUK94
X-Proofpoint-GUID: etiSdP2JawXVwjuO1Rp3UENRuv3EUK94
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-13_05,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 clxscore=1015 phishscore=0 lowpriorityscore=0
 suspectscore=0 malwarescore=0 priorityscore=1501 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608130132
Received-SPF: pass client-ip=205.220.180.131;
 envelope-from=philmd@oss.qualcomm.com; helo=mx0b-0031df01.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

Hi,

While working on the hybrid-accelerator, I had to debug issues
with vCPU scheduling and BQL. This series contains patches I
wrote mostly as note for myself to better understand what was
going on. Please review carefully as I'm way out of my confort
zone...

Thanks,

Phil.

Philippe Mathieu-Daudé (16):
  accel: Label outer / inner vCPU execution loops
  cpus: Improve qemu_cpu_kick_self() docstring
  cpus: Rename cpu_stop_current() -> qemu_cpu_stop_self()
  cpus: Rename qemu_cpu_stop() to qemu_cpu_ack_stop_request()
  cpus: Improve cpu_pause() docstring
  cpus: Improve cpu_exit() docstring
  cpus: Document process_queued_cpu_work*() runs on current vCPU
  cpus: Slightly improve *run_on_cpu() docstrings
  accel/tcg: Use RUN_ON_CPU_NULL for tcg_commit() callbacks
  accel/kvm: Clarify use of @r variable in vcpu thread loop
  accel/kvm: Consistently return CPU halt state from
    process_async_events
  target/arm/hvf: Move flush_cpu_state() into the inner vCPU loop
  target/arm/hvf: Lock BQL outside of the vCPU inner execution loop
  target/i386/hvf: Lock BQL outside of the vCPU inner execution loop
  target/arm/powerctl: Move BQL assertions to async work context
  target/arm/whpx: Fix argument order typo in memory access error
    message

 include/hw/core/cpu.h             | 54 +++++++++++++++++++------------
 include/system/cpus.h             | 19 +++++++++--
 accel/dummy-cpus.c                |  1 +
 accel/hvf/hvf-accel-ops.c         |  1 +
 accel/kvm/kvm-accel-ops.c         | 10 +++---
 accel/kvm/kvm-all.c               |  1 +
 accel/mshv/mshv-all.c             |  2 ++
 accel/tcg/tcg-accel-ops-mttcg.c   |  1 +
 accel/whpx/whpx-accel-ops.c       |  1 +
 hw/ppc/spapr_rtas.c               |  2 +-
 system/cpus.c                     |  9 +++---
 system/physmem.c                  |  4 +--
 system/runstate.c                 |  6 ++--
 target/arm/arm-powerctl.c         |  9 +-----
 target/arm/hvf/hvf.c              | 16 +++++----
 target/arm/kvm.c                  |  2 +-
 target/arm/whpx/whpx-all.c        | 10 +++---
 target/i386/hvf/hvf.c             | 20 +++++++-----
 target/i386/nvmm/nvmm-accel-ops.c |  1 +
 target/i386/whpx/whpx-all.c       |  1 +
 target/riscv/kvm/kvm-cpu.c        |  2 +-
 21 files changed, 106 insertions(+), 66 deletions(-)

-- 
2.53.0


