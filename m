Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2672CA6004
	for <qemu-arm@archiver.kernel.org>; Wed,  7 Oct 2026 20:46:28 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xEYWl-0005FP-Ke; Wed, 07 Oct 2026 16:46:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@oss.qualcomm.com>)
 id 1xEYWg-0005EX-Hu
 for qemu-arm@nongnu.org; Wed, 07 Oct 2026 16:46:14 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@oss.qualcomm.com>)
 id 1xEYWe-00059y-I9
 for qemu-arm@nongnu.org; Wed, 07 Oct 2026 16:46:10 -0400
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 697JNqC51650856
 for <qemu-arm@nongnu.org>; Wed, 7 Oct 2026 20:46:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 hALJsIxteHq5LguPN80STqaor0j/ofVWd51Vdf0QdoI=; b=X5BFFmYkaH7Gbfk5
 hWyyZWGTKOq82AyAZaBVHDO4IAp4YwouK7iBq5+z6QaR/UNhEdnRpuEZ/DygrmGw
 MQSewA8l3YoaBzbwNrqTE0l1+5Nh5sfS3Hgh5VjMYXmXZlWvRK9el39W21qXDRn6
 oeYk1rqH8mw12M3Cxb/6aHMvzJkFYG2EbbwQAnhrib8UXmz1NF8uCSh/znIX+9zp
 ff8h0SOjkZVky+z39XecTXw6ctgkdTtSHavfZ4NjCDU06Wm5WV0BvNs8JnTiS6IJ
 UrOY2Wn4nfdjb1eQ8wLUDcFQ+7dzLjEyg48m1F5DdBtdg+qTDtw+MXXBUk7Schq4
 9U8rYw==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com
 [74.125.82.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h5fc5bdej-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Wed, 07 Oct 2026 20:46:06 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id
 5a478bee46e88-34ef0362d95so8315848eec.1
 for <qemu-arm@nongnu.org>; Wed, 07 Oct 2026 13:46:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1791405966; x=1792010766; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=hALJsIxteHq5LguPN80STqaor0j/ofVWd51Vdf0QdoI=;
 b=EVmcg4wMIcgO2ILRGU0F+rugGkvS0F8tn7aRGAnYKGKLYSycLM+2odY3SrjITiNFlw
 b1cp58RqyuM38Ji4WbzFMECmjieyczgDX+/syYOGfn5CNF+YdH/Zo9EJ+FezNskxRmtE
 NbejqTsi+jvFmxnQ+Wk+sXXsM642RDp9wXewrUUuEqSUHGpoASNreBb48YZ3Z1akddDc
 xlnIobFfSc/pXAInrg4STpTN8u5AXYOgiFC0ML3/OeP7a3nENuhgw3CTvb5sBeYNTlk2
 uudINf8M1y96QFF2B7Xn1cCfoSmpWRyCyyLoTLR9exGIdCDAIEE0i5Z1tpGLQ5zfkQkb
 +ntw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791405966; x=1792010766;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=hALJsIxteHq5LguPN80STqaor0j/ofVWd51Vdf0QdoI=;
 b=tlvrmE0AAJGWXs+6YoZubxAHnStTqCUvhS7PulbrxlS6ihVJd6HJlPWgtaWRdNo2Cv
 E+mh8rRkb/V7Mlfxm8Qt7xcVhghFYrmElwarbqeikjSV+wFZJyXyAt66v3R9TdzPYPnM
 xAE9jjEwEXIWWNCMCwG7SzyrBdYfMbjUsOAZhXCMpBzm/z1Wr2XtYXiZ1U0h/Xg7/Ma1
 oXlBm0TDFw+AhZmY+e97KsWRA+f09c3Sp6wdssvvysuzFLZpLeKzAsK8YkBxizfYi2SR
 U7zbabO5X7tzWKDcPzW74PSwx4X46T1veoP77cSqnazqlvrAkGfXiP7WaQLudaBVr1TG
 Dfug==
X-Forwarded-Encrypted: i=1;
 AKwUvByym/nFxVIOb339GoEmTSbn8nD4xCQv04Skew1bKyzUbTxfYP6pqFjUhB5IqKkirc+rWAJdAQhqhQ==@nongnu.org
X-Gm-Message-State: AFq9FYIgNKB0gLlc2IZhEyzyeW28PTeMU8jXH9wtggIQwAfhLZt9RDAN
 GmDTHVhbCpTi9/A0K5iNJ+eboxZ9v/6R1TFr10RQBI427eJzMCfNYE4mBdmz5bkwMyZMFvl7CaU
 avvD+G48jE2NEVq3/QlfPoxvqqsJaPeDv2hQ5z9WIqLHgDFiNwKiRNYY=
X-Gm-Gg: AYBFou2uSV1eJCXn4HFhGEiXWXjxs53gHA08bToIOXyjKUeM9qJPw6sskzJTERhIRrX
 n3HZOhucQh9Q3AQJi2pY4sPgHoJOM/WI5FSU2p5RlTC46Zh+f/GtVq21pnn6N1Q065HTNvq+0qc
 3uscPhzh6QtMHsLJNWwQ/fRIy5QZmW+qb6b0iM5/idDNEkiuVvENHJQcOUa8aKMFbubMlctSqW2
 WfpTf6TZhJzV9vbuu+A88xr3T5DmuFrtr7RwxNPhtzLLBvXtRrzcyrpzRe+gewLGIxujSH0CoJv
 umELAMZxU2kF1cVV5ZMMPoJQDwTgfxxRhzCduIOBkkDM1w6N3dl+eKXRESteptVC5SYNNTeb2RP
 NzWCBzO8kwTEb2W9WU9TH3q/aWILF9ieaw1SXqh2TfoRGccUQ7ot1kzihtiNdVD7Wj8wymw==
X-Received: by 2002:a05:7300:d20b:b0:34b:88f3:3ccb with SMTP id
 5a478bee46e88-3515de0028bmr3675946eec.29.1791405965982; 
 Wed, 07 Oct 2026 13:46:05 -0700 (PDT)
X-Received: by 2002:a05:7300:d20b:b0:34b:88f3:3ccb with SMTP id
 5a478bee46e88-3515de0028bmr3675890eec.29.1791405965119; 
 Wed, 07 Oct 2026 13:46:05 -0700 (PDT)
Received: from [192.168.1.199] (192-80-163-190.dyn.novuscom.net.
 [192.80.163.190]) by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-3515b03da93sm8213423eec.29.2026.10.07.13.46.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 07 Oct 2026 13:46:04 -0700 (PDT)
Message-ID: <3631c54a-5ad7-4037-a21b-37c3c61d712d@oss.qualcomm.com>
Date: Wed, 7 Oct 2026 13:46:02 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/8] qom: pass TargetInfo to the is_available callback
To: Yonggang Luo <luoyonggang@gmail.com>, qemu-devel@nongnu.org
Cc: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 Cleber Rosa <crosa@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>,
 Laurent Vivier <lvivier@redhat.com>, Zhao Liu <zhao1.liu@intel.com>,
 John Snow <jsnow@redhat.com>, Laurent Vivier <laurent@vivier.eu>,
 Richard Henderson <richard.henderson@linaro.org>,
 Joel Stanley <joel@jms.id.au>, Fabiano Rosas <farosas@suse.de>,
 Kane Chen <kane_chen@aspeedtech.com>,
 Andrew Jeffery <andrew@codeconstruct.com.au>,
 Troy Lee <leetroy@gmail.com>, Jamin Lin <jamin_lin@aspeedtech.com>,
 Stafford Horne <shorne@gmail.com>, qemu-arm@nongnu.org,
 Philippe Mathieu-Daude <philmd@mailo.com>,
 Peter Maydell <peter.maydell@linaro.org>, Paolo Bonzini
 <pbonzini@redhat.com>, =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?=
 <philmd@oss.qualcomm.com>, =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?=
 <marcandre.lureau@redhat.com>, Steven Lee <steven_lee@aspeedtech.com>,
 Alexander Bulekov <alxndr@bu.edu>, Darren Kenny <darren.kenny@oracle.com>
References: <20261007115253.328-1-luoyonggang@gmail.com>
From: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20261007115253.328-1-luoyonggang@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA3MDA4MiBTYWx0ZWRfX36pRogLLga4t
 COQTjXlwr8OZKgn0MBl80UQP+BJb1SxTuOx+xVjy4XgOXA/9Kd85sEm7NCpCYVjeeQxqXjvYjb1
 AfnGxS203oXJHLXhLVAr/1bVLnN/IsA=
X-Proofpoint-GUID: NgEcRChIYaY7Eh2cDgI-ntiyZ--0WUJe
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA3MDA4MiBTYWx0ZWRfX3wG5zC+IbDqU
 tbtrVK18lyZzpvlDNKZftvc+N2v2XkbVjAmnxwhY/yFbEVKveasn4om1p9YFHGqK05EM9N3gWCi
 Ul7iKbh+A7hCDQmnDutxKQ5AVtAKZNWwkF7566+3hEFcPtu06Sc0HqXlAyewmebUAyOWtEIIXgo
 gczIZodaGQ1wDje+UM3N89H9AgkTb04XXZaXXW0isV6DB8qRKbSoKRYUQrcgzGDa6SKiF8tTJET
 SAfmB2NRtQ/lQSaWsXySWAeBvir6lbfpn+LDA6mKzclSQAcsOY2nS8566UmxQuC+qAhGow5TxPD
 Ib4hCKTTy729tkkXEU3ULTWeBbiYZuPUC9SaCpBxzPO3ywdG2iBzth6MRepRITN3Sr0dJbXSaM3
 rOQFeE2cjlaJghSXX76o3Oxwyv19P34McXblfdbxl4Co3ucw5lCynPRMao8O+k7PVhSJ/hkGxAO
 OZ8BTJ2mh5a4Kg4Q/VQ==
X-Proofpoint-ORIG-GUID: NgEcRChIYaY7Eh2cDgI-ntiyZ--0WUJe
X-Authority-Analysis: v=2.4 cv=a6+lZkSF c=1 sm=1 tr=0 ts=6ac6af8e cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=9852oil1ID9t5xBSyQ/BEA==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=W3QROBFJkTBO-5vcJEQA:9 a=QEXdDO2ut3YA:10 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-07_06,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 suspectscore=0 malwarescore=0
 lowpriorityscore=0 bulkscore=0 spamscore=0 clxscore=1015 impostorscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2610070082
Received-SPF: pass client-ip=205.220.168.131;
 envelope-from=pierrick.bouvier@oss.qualcomm.com;
 helo=mx0a-0031df01.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On 10/7/2026 4:47 AM, Yonggang Luo wrote:
> This allows a combined binary to register machine types from all its targets.
> Consequently, QMP `query-machines` can return machine entries from every
> target, even when `none` is selected. For example, a client can query the
> combined machine list with:
> 
> ```json
> { "execute": "query-machines" }
> ```
> 
> The returned list includes the registered machine classes from all linked
> targets. This is separate from selecting a machine: with `-target none`,
> `-M virt` reports the targets that provide `virt` instead of choosing one
> arbitrarily:
> 
> ```text
> qemu-system -target none -M virt
> unsupported machine type: "virt" for target "none"
> Available for targets:
>   aarch64
>   arm
> ```
> 
> It moves target_info() to a shared location so object.c can call it when
> checking machine availability. The series also replaces QOM-based target-info
> registration with a constructor list and passes TargetInfo to the
> is_available callback.
> 
> Target metadata and architecture checks are generated from the configured
> targets, there is too much arch to write biiolperate code. doing this for easier
> Add TargetInfo* to is_available
> 
> The target-info API and implementation are shared, rather than compiled
> separately for every target.
> 
> This series removes the per-target source files "configs/targets/*.c".
> Their target-specific parameters are collected in a generated
> target-info-def.c for each softmmu target. This lays the groundwork for
> QEMU system builds in which target-info-def.c is the only target-specific
> source file compiled for each target. Using the same filename lets
> meson.build handle these definitions uniformly.
> 
> The series adds unit-test coverage for target info and multi-target builds.
> 
> Pierrick Bouvier (2):
>   configs/targets: remove target info definitions
>   target-info: rename target-info-stub.c in target-info-def.c
> 
> Yonggang Luo (6):
>   target-info: rename target-info-impl.h to target-info-def.h
>   target-info: replace QOM registration with a constructor list
>   tests/unit: add target-info coverage for multi-target builds
>   meson: load all target .mak files into target_mak_all
>   target-info: Replace handwritten architecture checks with generated
>     code
>   qom: pass TargetInfo to is_available for later use
> 
>  MAINTAINERS                             |   2 +-
>  configs/targets/aarch64-softmmu.c       |  25 ------
>  configs/targets/arm-softmmu.c           |  25 ------
>  configs/targets/meson.build             |   6 --
>  configs/targets/riscv32-softmmu.c       |  24 -----
>  configs/targets/riscv64-softmmu.c       |  24 -----
>  hw/arm/aspeed_ast27x0-fc.c              |   2 +-
>  hw/arm/aspeed_ast27x0_evb.c             |   4 +-
>  hw/arm/raspi.c                          |   4 +-
>  hw/arm/raspi4b.c                        |   2 +-
>  hw/arm/virt.c                           |   4 +-
>  hw/m68k/virt.c                          |   4 +-
>  hw/or1k/virt.c                          |   2 +-
>  include/hw/core/cpu.h                   |   2 +-
>  include/qemu/module.h                   |   1 -
>  include/qemu/target-info-def.h          |  88 ++++++++++++++++++
>  include/qemu/target-info-impl.h         |  42 ---------
>  include/qemu/target-info-init.h         |  53 -----------
>  include/qemu/target-info-qom.h          |  31 -------
>  include/qemu/target-info.h              |  87 ++++--------------
>  include/qom/object.h                    |  12 ++-
>  meson.build                             |  52 ++++++++---
>  page-vary-common.c                      |   2 +-
>  page-vary-system.c                      |   2 +-
>  qom/object.c                            |   3 +-
>  scripts/gen-target-info.py              |  99 ++++++++++++++++++++
>  system/vl.c                             |   4 -
>  target-info-stub.c => target-info-def.c |   3 +-
>  target-info-qom.c                       |  60 -------------
>  target-info.c                           | 115 ++++++++++++------------
>  tests/qtest/fuzz/fuzz.c                 |   3 -
>  tests/unit/meson.build                  |   4 +
>  tests/unit/test-multi-target.c          |  12 +--
>  tests/unit/test-target-info.c           |  38 ++++++++
>  34 files changed, 379 insertions(+), 462 deletions(-)
>  delete mode 100644 configs/targets/aarch64-softmmu.c
>  delete mode 100644 configs/targets/arm-softmmu.c
>  delete mode 100644 configs/targets/meson.build
>  delete mode 100644 configs/targets/riscv32-softmmu.c
>  delete mode 100644 configs/targets/riscv64-softmmu.c
>  create mode 100644 include/qemu/target-info-def.h
>  delete mode 100644 include/qemu/target-info-impl.h
>  delete mode 100644 include/qemu/target-info-init.h
>  delete mode 100644 include/qemu/target-info-qom.h
>  create mode 100644 scripts/gen-target-info.py
>  rename target-info-stub.c => target-info-def.c (94%)
>  delete mode 100644 target-info-qom.c
>  create mode 100644 tests/unit/test-target-info.c
> 

I'll pull the first three patches.

Regards,
Pierrick

