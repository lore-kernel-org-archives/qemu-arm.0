Received: by 2002:ac2:5978:0:0:0:0:0 with SMTP id h24csp2502859lfp;
        Sat, 2 Oct 2021 14:52:10 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyVI0Ps0Dgg9X0gDLjye1ETlf+Kfd3GTbUvnh1Rlb2iYSY29AAFqvXvlsiq5tSiG39az4ry
X-Received: by 2002:a25:698f:: with SMTP id e137mr5681260ybc.323.1633211530749;
        Sat, 02 Oct 2021 14:52:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1633211530; cv=none;
        d=google.com; s=arc-20160816;
        b=rouzg+WTjvJkaZQ9+zwFd1suiLr+OLdAmxiOw7pbrvzr8unFTcDySoDUpeCiHgfCjS
         2GLqxdr/Can9ZkLwTUGDb+A9lMIHCwVZt446ucojT28bfi2X3sbYHhdW81HPv4ultXSB
         jTt4qfKuum0Rl5XfAVMbj7xs+b2ujwcNQZ7LLKBvzPWb0v/u+D51d8aVkyBJBqMF7IXl
         fA2/qjyJecFBAbvZV7NcN5Bm5BpKJmBqJ0WRR0vG6Ecwi0V40NfE1vIAWY2KgbIFn5AG
         g5O7H7res53jAd90CGErQvyJG2z1HkISmmVXALzP2B4l8/jRytxMkV8fT4JPh61T+FNC
         p78A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:mime-version
         :content-transfer-encoding:message-id:date:subject:to:from;
        bh=D9MPoetLZrFUsq4q4amkYYrk/04hGjf9n2E6RscCryY=;
        b=mTH/ANUs0L9BlAlMt6UvXhuHob8Y+18cAIelQhHacdvti+6bBTS/aKHzz3bb4k+80U
         SV6KwAeE7lOAohglamT2BxeDuZXmknMcrscZvMZlSU9/FuT2w253DNxw6M8V5FED4f7y
         J21f0FmCNOo6lOgFuO1kDOtWDAkZr2+LPj8CfyXAKU+cHXI+P4DrJYMxDLG27ykoHeqZ
         xeVT+L3yUCoy/SgWY0TkSTd1MbYgzrwxha82KqSmU0QY4LP0eEpVqJmIiaj3GtZlgtAn
         4M3zZLUwb2rwHX3uAdoyi05jb5dz/9bxWkhLU9w2+y9xExHdmVH1wSwjy98BqPtUfH4x
         t4CA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id b7si6515588ybb.157.2021.10.02.14.52.10
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 02 Oct 2021 14:52:10 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:39370 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mWmvS-0006LE-3K
	for alex.bennee@linaro.org; Sat, 02 Oct 2021 17:52:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42568)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=99090ed790=pdel@fb.com>)
 id 1mWmny-0002CH-SQ
 for qemu-devel@nongnu.org; Sat, 02 Oct 2021 17:44:27 -0400
Received: from mx0b-00082601.pphosted.com ([67.231.153.30]:12712)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=99090ed790=pdel@fb.com>)
 id 1mWmnw-0006DG-99
 for qemu-devel@nongnu.org; Sat, 02 Oct 2021 17:44:26 -0400
Received: from pps.filterd (m0109332.ppops.net [127.0.0.1])
 by mx0a-00082601.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 192Kafo3023440
 for <qemu-devel@nongnu.org>; Sat, 2 Oct 2021 14:44:21 -0700
Received: from maileast.thefacebook.com ([163.114.130.16])
 by mx0a-00082601.pphosted.com with ESMTP id 3bexkv86cp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <qemu-devel@nongnu.org>; Sat, 02 Oct 2021 14:44:20 -0700
Received: from intmgw001.27.prn2.facebook.com (2620:10d:c0a8:1b::d) by
 mail.thefacebook.com (2620:10d:c0a8:83::5) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.14; Sat, 2 Oct 2021 14:44:19 -0700
Received: by devvm660.prn0.facebook.com (Postfix, from userid 385188)
 id 630EB51973D3; Sat,  2 Oct 2021 14:44:15 -0700 (PDT)
From: <pdel@fbc.om>
To: 
Subject: [PATCH 0/2] hw/adc: Add basic Aspeed ADC model
Date: Sat, 2 Oct 2021 14:44:12 -0700
Message-ID: <20211002214414.2858382-1-pdel@fbc.om>
X-Mailer: git-send-email 2.30.2
Content-Type: text/plain; charset="UTF-8"
X-FB-Internal: Safe
X-FB-Source: Intern
X-Proofpoint-ORIG-GUID: ZlufGIM0ge50QusmXYplX93b5wQN_mkC
X-Proofpoint-GUID: ZlufGIM0ge50QusmXYplX93b5wQN_mkC
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.391,FMLib:17.0.607.475
 definitions=2021-10-02_07,2021-10-01_02,2020-04-07_01
X-Proofpoint-Spam-Details: rule=fb_default_notspam policy=fb_default score=0
 impostorscore=0
 mlxlogscore=999 bulkscore=0 clxscore=1034 phishscore=0 malwarescore=0
 lowpriorityscore=0 mlxscore=0 suspectscore=0 spamscore=0 adultscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2109230001 definitions=main-2110020158
X-FB-Internal: deliver
Received-SPF: pass client-ip=67.231.153.30;
 envelope-from=prvs=99090ed790=pdel@fb.com; helo=mx0b-00082601.pphosted.com
X-Spam_score_int: -13
X-Spam_score: -1.4
X-Spam_bar: -
X-Spam_report: (-1.4 / 5.0 requ) BAYES_00=-1.9, DKIM_ADSP_NXDOMAIN=0.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.25, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Sat, 02 Oct 2021 17:49:26 -0400
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: peter.maydell@linaro.org, andrew@aj.id.au, alistair@alistair23.me,
 qemu-devel@nongnu.org, patrick@stwcx.xyz, qemu-arm@nongnu.org, clg@kaod.org,
 Peter Delevoryas <pdel@fb.com>, zhdaniel@fb.com, joel@jms.id.au
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: gtozZWn/cmf7

From: Peter Delevoryas <pdel@fb.com>

Following up from

https://lore.kernel.org/qemu-devel/20210930004235.1656003-1-pdel@fb.com/

This is a resubmission of Andrew Jeffery's ADC model, but with the
registers converted from typed-member-fields to a regs[] array.
Otherwise, it should be pretty much equivalent.

References to the original patches from Andrew:

https://github.com/legoater/qemu/commit/1eff7b1cf10d1777635f7d2cef8ecb441cc=
607c4
https://github.com/legoater/qemu/commit/3052f9d8ccdaf78b753e53574b7e8cc2ee0=
1429f

I did A/B "--trace aspeed_adc_engine_*" testing and the output from the
boot sequence was equivalent, and I tested that the channel simulation
code produces the same sequence of values.

Here's the initialization sequence:

aspeed_adc_engine_write engine[0] 0x0 0xf  ; Engine init
aspeed_adc_engine_read engine[0] 0x0 0x10f ; bit 8 set
aspeed_adc_engine_write engine[0] 0x0 0x2f ; Auto compensating sensing mode
aspeed_adc_engine_read engine[0] 0x0 0x10f ; bit 8 set (redoing engine init=
, lol), bit 5 reset

Here's some of the channel simulation:

(qemu) xp 0x1e6e9010
000000001e6e9010: 0x00070005
(qemu) xp 0x1e6e9010
000000001e6e9010: 0x000e000a
(qemu) xp 0x1e6e9010
000000001e6e9010: 0x0015000f
(qemu) xp 0x1e6e9010
000000001e6e9010: 0x001c0014
(qemu) xp 0x1e6e9010
000000001e6e9010: 0x00230019
(qemu) xp 0x1e6e9010
000000001e6e9010: 0x002a001e
(qemu) xp 0x1e6e9010
000000001e6e9010: 0x00310023
(qemu) xp 0x1e6e9010
000000001e6e9010: 0x00380028

This was tested with a Fuji OpenBMC image:

https://github.com/peterdelevoryas/openbmc/releases/download/fuji.mtd.0/fuj=
i.mtd

My refactoring was kinda awkward, it took me a few tries to finally get
something that made sense to me. In particular, I don't know if you guys
realized this previously, but in the AST2600, there's 2 engines, but
still only 16 channels: each engine only has half the registers, as far
as I understand.

That's why I added the "nr-channels" property to the engine. I also
tried to add guest-error logs when a driver tries to read or write to
the upper-eight channel registers in the 2600 engines. For example:

(qemu) xp 0x1e6e9000
000000001e6e9000: 0xffff010f
(qemu) xp 0x1e6e9020
aspeed_adc_engine_read: engine[0]: data register 4 invalid, only 0...3 valid
000000001e6e9020: 0x00000000
(qemu) xp 0x1e6e9030
000000001e6e9030: 0x00000000
(qemu) xp 0x1e6e9040
000000001e6e9040: 0x00000000
(qemu) xp 0x1e6e9050
aspeed_adc_engine_read: engine[0]: bounds register 8 invalid, only 0...7 va=
lid
000000001e6e9050: 0x00000000
(qemu) xp 0x1e6e9060
aspeed_adc_engine_read: engine[0]: bounds register 12 invalid, only 0...7 v=
alid
000000001e6e9060: 0x00000000
(qemu) xp 0x1e6e9070
000000001e6e9070: 0x00000000
(qemu) xp 0x1e6e9080
000000001e6e9080: 0x00000000
(qemu) xp 0x1e6e9090
aspeed_adc_engine_read: engine[0]: hysteresis register 8 invalid, only 0...=
7 valid
000000001e6e9090: 0x00000000
(qemu) xp 0x1e6e90a0
aspeed_adc_engine_read: engine[0]: hysteresis register 12 invalid, only 0..=
.7 valid
000000001e6e90a0: 0x00000000

It might turn out that we should just stick with a closer version of
Andrew's original patch, and that would be totally fine with me, I just
want to get the ADC support merged one way or another.

Also, I'm interested in resubmitting Andrew's work on supporting
unaligned accesses for models that only implement aligned access, to
make supporting 8-bit and 16-bit reads transparent to this model, but
I'll submit that separately.

Reference: https://lore.kernel.org/qemu-devel/20170630030058.28943-1-andrew=
@aj.id.au/

Thanks,
Peter

Andrew Jeffery (2):
  hw/adc: Add basic Aspeed ADC model
  hw/arm: Integrate ADC model into Aspeed SoC

 hw/adc/aspeed_adc.c         | 416 ++++++++++++++++++++++++++++++++++++
 hw/adc/meson.build          |   1 +
 hw/adc/trace-events         |   3 +
 hw/arm/aspeed_ast2600.c     |  11 +
 hw/arm/aspeed_soc.c         |  11 +
 include/hw/adc/aspeed_adc.h |  55 +++++
 include/hw/arm/aspeed_soc.h |   2 +
 7 files changed, 499 insertions(+)
 create mode 100644 hw/adc/aspeed_adc.c
 create mode 100644 include/hw/adc/aspeed_adc.h

--=20
2.30.2

