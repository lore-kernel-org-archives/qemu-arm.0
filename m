Received: by 2002:a17:906:494e:b0:982:8c08:340e with SMTP id f14csp2819750ejt;
        Mon, 19 Jun 2023 06:47:22 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ7JQD7P+kJlMoAaN1LST2Ynug4bhNBQx/Sd6W2447DoryozlthRKvhx8gXm2T6GdKuKUc9N
X-Received: by 2002:a05:6214:2aad:b0:630:463:3676 with SMTP id js13-20020a0562142aad00b0063004633676mr1067310qvb.61.1687182441926;
        Mon, 19 Jun 2023 06:47:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1687182441; cv=none;
        d=google.com; s=arc-20160816;
        b=lbZQhR7ISU6fRMNy8EEPzT4fbcNwAJhZYp6Wq1WltZ7oOOFZn5gKYNDD5Ep2J9NX04
         HyZCageAIzIui6pq7EJB1XWENZNjZLdioCErDONYfiVwn21NNEg4hmNFhHD3bLZx4CNj
         jXHpmzU4Fw/rKHKKZZ/qOYf1F9d22InKc1G4sooKfpyKtwUcFCA4vYSV8LXBX1736ANt
         qhEAtux6+ST7m0jpiz5lRSah2VPDf4MIr+u4ThC9utrrIA5UdaUjHgLq72rQzEakaosv
         g0aojlVDMtLrhE5f3oFvNZSNF5vtN8qlFIo6Mdun916XFz0J4boekZTOZYCTwoG5vyTZ
         CBHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:references:message-id
         :content-transfer-encoding:cc:date:in-reply-to:from:subject
         :mime-version:dkim-signature;
        bh=EcDTfFvPiDbu6xKRzq1KBQP9u7bfAG3ORDug4/njrBc=;
        b=C9bovT48B1DuOmDZEP+KrsAiB0SoWrSDhGiKNTyDeymvgTnXMtOyiFwgXqHzhMQqif
         hdG2LSNkZiD6mCwVqsqfrgpH1mC+Bk8LlmS+xqqx4ucR9zq2v7JOzmV+TsUM8GNhcJXq
         WrCEK18YFjkZk/j9SjGzhXj2QAIBWd9KX28kygMCG/Rb/cMBt66GA+MuZ/JOqd/rj0YS
         dbdlVnJinoevrJhTItItd4KIF9hqU1Tvt7JrnVawDjWCNSKw2F7JBzJ9fv9LDWEldH/x
         Gb24AHoMB1JW4LhpbxbBdJGbi7S2A8bINLouwGPZturjqpeCW34OoXQjKzj9L7jUpoLY
         M+/Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@ynddal.dk header.s=sig1 header.b=HOYRyX3Y;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id gg9-20020a056214252900b0062de959e6b6si458907qvb.13.2023.06.19.06.47.21
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 19 Jun 2023 06:47:21 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@ynddal.dk header.s=sig1 header.b=HOYRyX3Y;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qBFDt-00030H-97; Mon, 19 Jun 2023 09:47:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mads@ynddal.dk>) id 1qBFDn-0002wQ-3N
 for qemu-arm@nongnu.org; Mon, 19 Jun 2023 09:47:07 -0400
Received: from qs51p00im-qukt01080501.me.com ([17.57.155.22])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mads@ynddal.dk>) id 1qBFDk-0006PL-UZ
 for qemu-arm@nongnu.org; Mon, 19 Jun 2023 09:47:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ynddal.dk; s=sig1;
 t=1687182423; bh=EcDTfFvPiDbu6xKRzq1KBQP9u7bfAG3ORDug4/njrBc=;
 h=Content-Type:Mime-Version:Subject:From:Date:Message-Id:To;
 b=HOYRyX3YnwaAGY0t8g2X1MuWPmdySTYmN+ez62Q2qhKcaA9JTD8Io6w9idAk6x5mB
 SoDp2WObu409/2plc2SaQpvvvUZHLtKAyjkKlyAxU3w4ZMMrhS10luwWm/K58WTKqq
 3YfOpRSg5a/Rv9iphtBxhb2iR6WNbchYHOqRkobZGhJsvGEvgVaMDod03C2jlwtV46
 oDttjmRplBT/TqJx8v5BDggoAdBCO6iG5stysWYhaNeGuKZHnpwd3zKRZrzFyeHlS5
 5RiTmy4qSMbGfhqUYRaW2B6uWPgpPiPqFkq5dR+awASc56w7k1WKZoUDQ9Kd+ypMuH
 L9QXcrZWIny1A==
Received: from smtpclient.apple (qs51p00im-dlb-asmtp-mailmevip.me.com
 [17.57.155.28])
 by qs51p00im-qukt01080501.me.com (Postfix) with ESMTPSA id F3FDF19802C7;
 Mon, 19 Jun 2023 13:47:00 +0000 (UTC)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3731.600.7\))
Subject: Re: [PATCH v2 12/12] target/arm: Allow users to set the number of VFP
 registers
From: Mads Ynddal <mads@ynddal.dk>
In-Reply-To: <c027687b-da81-3e3f-9305-43a6eadc17fe@kaod.org>
Date: Mon, 19 Jun 2023 15:46:49 +0200
Cc: "open list:ARM cores" <qemu-arm@nongnu.org>, qemu-devel@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>, Joel Stanley <joel@jms.id.au>,
 Andrew Jeffery <andrew@aj.id.au>,
 =?utf-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Content-Transfer-Encoding: quoted-printable
Message-Id: <21DCF8D7-06DA-4F3E-B3E8-890B9D401978@ynddal.dk>
References: <20230607043943.1837186-1-clg@kaod.org>
 <20230607043943.1837186-13-clg@kaod.org>
 <955C217E-FE0F-41E2-8E97-9AFD8C4A0DBE@ynddal.dk>
 <c027687b-da81-3e3f-9305-43a6eadc17fe@kaod.org>
To: =?utf-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
X-Mailer: Apple Mail (2.3731.600.7)
X-Proofpoint-ORIG-GUID: QrN7nG6HdqmsH9aEXif00vEOAxBWskLb
X-Proofpoint-GUID: QrN7nG6HdqmsH9aEXif00vEOAxBWskLb
X-Proofpoint-Virus-Version: =?UTF-8?Q?vendor=3Dfsecure_engine=3D1.1.170-22c6f66c430a71ce266a39bfe25bc?=
 =?UTF-8?Q?2903e8d5c8f:6.0.425,18.0.790,17.0.605.474.0000000_definitions?=
 =?UTF-8?Q?=3D2022-01-12=5F03:2022-01-11=5F01,2022-01-12=5F03,2020-01-23?=
 =?UTF-8?Q?=5F02_signatures=3D0?=
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0
 mlxscore=0 clxscore=1030
 bulkscore=0 phishscore=0 suspectscore=0 spamscore=0 mlxlogscore=595
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2306190126
Received-SPF: pass client-ip=17.57.155.22; envelope-from=mads@ynddal.dk;
 helo=qs51p00im-qukt01080501.me.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
X-TUID: iJ5RrpjUrHlK


> ARM's "Vector Floating Point" unit has many implementation with =
different
> features: VFPv3-D16/D32, *FP16, VFPv4-D16/D32, Neon, etc. The test =
might
> be too strict and could possibly be removed.
>=20
> Could you send us the result of 'cat /proc/cpuinfo' on the host ?
>=20
> Thanks,
>=20
> C.

The host is macOS, so there's no '/proc/cpuinfo'. I can get this from =
sysctl:

$ sysctl -a | grep hw.optional
hw.optional.arm.FEAT_FlagM: 1
hw.optional.arm.FEAT_FlagM2: 1
hw.optional.arm.FEAT_FHM: 1
hw.optional.arm.FEAT_DotProd: 1
hw.optional.arm.FEAT_SHA3: 1
hw.optional.arm.FEAT_RDM: 1
hw.optional.arm.FEAT_LSE: 1
hw.optional.arm.FEAT_SHA256: 1
hw.optional.arm.FEAT_SHA512: 1
hw.optional.arm.FEAT_SHA1: 1
hw.optional.arm.FEAT_AES: 1
hw.optional.arm.FEAT_PMULL: 1
hw.optional.arm.FEAT_SPECRES: 0
hw.optional.arm.FEAT_SB: 1
hw.optional.arm.FEAT_FRINTTS: 1
hw.optional.arm.FEAT_LRCPC: 1
hw.optional.arm.FEAT_LRCPC2: 1
hw.optional.arm.FEAT_FCMA: 1
hw.optional.arm.FEAT_JSCVT: 1
hw.optional.arm.FEAT_PAuth: 1
hw.optional.arm.FEAT_PAuth2: 0
hw.optional.arm.FEAT_FPAC: 0
hw.optional.arm.FEAT_DPB: 1
hw.optional.arm.FEAT_DPB2: 1
hw.optional.arm.FEAT_BF16: 0
hw.optional.arm.FEAT_I8MM: 0
hw.optional.arm.FEAT_ECV: 1
hw.optional.arm.FEAT_LSE2: 1
hw.optional.arm.FEAT_CSV2: 1
hw.optional.arm.FEAT_CSV3: 1
hw.optional.arm.FEAT_DIT: 1
hw.optional.arm.FEAT_FP16: 1
hw.optional.arm.FEAT_SSBS: 1
hw.optional.arm.FEAT_BTI: 0
hw.optional.arm.FP_SyncExceptions: 1
hw.optional.floatingpoint: 1
hw.optional.neon: 1
hw.optional.neon_hpfp: 1
hw.optional.neon_fp16: 1
hw.optional.armv8_1_atomics: 1
hw.optional.armv8_2_fhm: 1
hw.optional.armv8_2_sha512: 1
hw.optional.armv8_2_sha3: 1
hw.optional.armv8_3_compnum: 1
hw.optional.watchpoint: 4
hw.optional.breakpoint: 6
hw.optional.armv8_crc32: 1
hw.optional.armv8_gpi: 1
hw.optional.AdvSIMD: 1
hw.optional.AdvSIMD_HPFPCvt: 1
hw.optional.ucnormal_mem: 1
hw.optional.arm64: 1


If it's any help, the Linux guest looks like this:

$ cat /proc/cpuinfo
processor : 0
BogoMIPS : 48.00
Features : fp asimd evtstrm aes pmull sha1 sha2 crc32 atomics fphp =
asimdhp cpuid asimdrdm jscvt fcma lrcpc dcpop sha3 asimddp sha512 =
asimdfhm dit uscat ilrcpc flagm sb paca pacg dcpodp flagm2 frint
CPU implementer : 0x00
CPU architecture: 8
CPU variant : 0x0
CPU part : 0x000
CPU revision : 0

=E2=80=94
Mads Ynddal

