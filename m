Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9DD1F4BB7F
	for <qemu-arm@archiver.kernel.org>; Tue, 24 Feb 2026 19:36:46 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vuyCl-0007LQ-GL; Tue, 24 Feb 2026 14:36:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <brian.cain@oss.qualcomm.com>)
 id 1vuyCg-0007K6-8y
 for qemu-arm@nongnu.org; Tue, 24 Feb 2026 14:36:19 -0500
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <brian.cain@oss.qualcomm.com>)
 id 1vuyCa-0001Jl-Ox
 for qemu-arm@nongnu.org; Tue, 24 Feb 2026 14:36:16 -0500
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 61OHf5dK057310
 for <qemu-arm@nongnu.org>; Tue, 24 Feb 2026 19:36:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=LWUr+lETuRdq6LRMsmhLDJug
 o+ZD/rr/W79ke1FaGdQ=; b=J8C14ndgYvmh92NsaPb0pz5GlgqwrWUyZNGol89V
 qIaPQytK6S+2JgDnKxHEzDB/xgVqgBx6k79cuLcHHMRiVS8P9nCbdAXVOfriTPDJ
 OQoIKXNG5OLLxHfb6uG+RQy+ODl0JBqLtAmaxB3at0XnMrjPxj87Wf1B25Ozrxe+
 6oKcWTU5/S3juoL4DnV5c1YYDl9TKybfPjbwZFDjSlT1xmYiOQVOOs9Y9JHCylNf
 Nf/cEKQ3ondR4W/EpESIpbfH6B10xTx7gkAOGdxKajy/yJgLVpttbFqKrJL+F0hu
 rZhUTX04z5sLr56jZ+6w+ykY8rGLwdqX0wuIdunF+qOMUA==
Received: from mail-yx1-f71.google.com (mail-yx1-f71.google.com
 [74.125.224.71])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ch9sa9vs6-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Tue, 24 Feb 2026 19:36:10 +0000 (GMT)
Received: by mail-yx1-f71.google.com with SMTP id
 956f58d0204a3-64c46202950so9592125d50.3
 for <qemu-arm@nongnu.org>; Tue, 24 Feb 2026 11:36:10 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1771961769; cv=none;
 d=google.com; s=arc-20240605;
 b=R4oPbblB5mYAeVd6y9AuYbuQKqe30O1/u1J1UIg4H8kI5wt0j0ZvWuZ2CDXgsAApzD
 OYCJ2HAODo1S4sRHJi7KmNsnVlPGDNSsl3qrf074j789jcq0tKt1W6vRSLq5hbUCFYHu
 s9ql4zn+Ps+a/Egp3Vl3u4/+xWucZzraFGcYPPJDwKcAb7o9RuE6/SH9CzFpIueKrHcs
 KAKuKq7223s6cfNEgOi2r9K8O3ItuEUr6EGG6QJuLes4a4rdzfOJI1suNYuusUJq0BPX
 cAMb/Z5qKGoTMQrEoLMPCxdiElDixcEtPzVqFA48mjNLVSbs6a98GvU232BpjN2wq4Bt
 lMeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=LWUr+lETuRdq6LRMsmhLDJugo+ZD/rr/W79ke1FaGdQ=;
 fh=FhFmKBEDGS7RFTSq8pKhuQ+KtfOc6WydlRdgFgt5zVU=;
 b=aQWWukfijggPqS3yJzLgqhkRR+FRv3iCK5tD73N9ojRqBkQHhazApETwkE8HCu4SjW
 Vnj+mQMoDNz62ZbqycVX9b9G8xW4WCG72rmXyK1b+sJDluurt5Z2/J6vlLHmoZzLPZGy
 96HoWjfXjcvz4bfVOkSKeyey2hBWDIgnOFFfnzdatI67+6zgA6snPBiv17sJRvgnwxKN
 RvcAAvI7DEM1URjOrwsMh/f5fj6e5kxyBlCiIEKTHeP46ssxgvw1I1r34hVEuGLKFWWl
 QgTcN4uAoTITn7LY4K/yQ1Y8xw1fKZIGX9f0805poR37RBmaPNkmfgN6Q3hl4K7yllaH
 J54A==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1771961769; x=1772566569; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=LWUr+lETuRdq6LRMsmhLDJugo+ZD/rr/W79ke1FaGdQ=;
 b=C3pFJuGg6ucgwZw3u787bMi1aRWBpW95bcYQD/wNQ5BZUcCK/EvQsbHBcRlM/DT0+l
 O2Dw+wQHPxPmNohOJLhVe03GKbOet7MacrpndXZLTIBnLuRAnR+JSnOdFgmmfr8QIz+t
 TCwqC7KNBbqg0pumHE/SMuS7v4E3Z5ZBWDliabYP8jZOx49/oIWEOUysypqD0PmShdi1
 ijw14d6vV0s+s04oXYP86fxIx4JZrVF8vgP1oB/FrHPrTbqMgDJ0oQ6nATcbyR96LH8Q
 zGJ8FvJFJNf37sXkkrh+zPfT/6QRStMrshW5mWRXQb1AQl2bZWE+43ZJ3uXeQecECATU
 rEiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771961769; x=1772566569;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=LWUr+lETuRdq6LRMsmhLDJugo+ZD/rr/W79ke1FaGdQ=;
 b=YhNdVi3Tc/qcFiWjPK0BvbvkMiMtNDp8us8Q/g7w4iRlL026Uforn0hY5eRssFmi2g
 kTdmbdwaEtSnPn/EbtC5lTrcHaiDUTn+uH5q2m5AHEHoFVDN2PZeN1jPmrfShpnRia9s
 ysj3MstMmsxNprV3SQLX1qePR2pYnlDenlMp4FxiZXsr+e/Q9ofPPpyWyBUukwjONHDW
 tgdSBMusOWLn+fmTE1y644spJED4Q0+7UGSMO5o58IUW3DsGYX1Rvpby6sTnBd7GiyfA
 uZetaOYtgd2maOoGuqtYdA+FIyU9/e72KqsClBtjT2dX4Tz+srDUTasz4rmGtW1+nXqC
 bz+g==
X-Forwarded-Encrypted: i=1;
 AJvYcCWJR3KryfH3SQhKkWeL5RcsiSeOe3O3UrNqlA8yRyjD7aNvI3YAsti3lFEVU+UJdl2IMCBvK4VqBw==@nongnu.org
X-Gm-Message-State: AOJu0YyYW5JWWiRoClm6z50Kz+PkmIbItIXXo9fpdGWSM0+cJXCpNyJE
 q4Vp4jeeUF2kHM6BIv5pnWRK0CheV34qubPmAP94vTgnkpdxNCP8zn1ekLYbySwpr+pfbYFZ+rU
 FECVX1twKwqFnp8dofuN585owcNFpR22wlksgl4ITkEFD6V5K+iG9EURmcpFVH3AidvXRwaFhly
 Yt3kaMlvo9XI+Wr7LuaZeb1LKE/Of7Vw==
X-Gm-Gg: ATEYQzwJjt/WstlX6zU87QTS4Wac4yuVLPs1x1Sk9ywp2eH85rXOjXMaTdzPkhuKRYQ
 rlAurNg+LZkvjhQ6ocCIQFj6o7Lt9guPWaL5kM/I1rUm7CcnkEIQhhK8NzbeI0vQpjj/toAnRNY
 MN0hw3BYL6Zo9ymzIBLCMkGfOONptAdNQSDDsNLF/831q9IJjvJRJ/6zMnDOFDenwFeCzMDQp5p
 8ulynmu
X-Received: by 2002:a05:690e:d59:b0:64a:dcf7:c13d with SMTP id
 956f58d0204a3-64c789c78a0mr11923643d50.13.1771961769242; 
 Tue, 24 Feb 2026 11:36:09 -0800 (PST)
X-Received: by 2002:a05:690e:d59:b0:64a:dcf7:c13d with SMTP id
 956f58d0204a3-64c789c78a0mr11923598d50.13.1771961768719; Tue, 24 Feb 2026
 11:36:08 -0800 (PST)
MIME-Version: 1.0
References: <20260224193028.2370-1-philmd@linaro.org>
In-Reply-To: <20260224193028.2370-1-philmd@linaro.org>
From: Brian Cain <brian.cain@oss.qualcomm.com>
Date: Tue, 24 Feb 2026 13:35:52 -0600
X-Gm-Features: AaiRm50Zc2CI7U9NOsqHRRfWUctYHMfELhlQLoQRSSbIFlsp9r6WKjq8Sz3WRPU
Message-ID: <CAEqNhNbv6Z4P5dJWR4JZFZp=50u_GL9e_ePmSy8MOFortgSiDw@mail.gmail.com>
Subject: Re: [RFC PATCH 0/5] target/tcg: Rename some helpers common to various
 targets
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-arm@nongnu.org,
 qemu-riscv@nongnu.org, qemu-ppc@nongnu.org
Content-Type: multipart/alternative; boundary="000000000000c7c849064b96ffdf"
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI0MDE2OCBTYWx0ZWRfX3IyDs3BmB9GV
 j0/LJ8TfnRDFScP7tLYDHIXYhVkA7Ez27xlXcg4u3XJPih1D7nT0fcQi6SdMA2A3VUrwbG3uL4w
 88ENdg4uNxdomWxrKCr6U8zoi20+0YRuBRQoc9lvtypFPgff4GPdENbG4hLYJWCOCh5uMe2dVXv
 kCxxdwl3v1CPbpOmGIOc/mxwrGhiQ0g6l1/sX//bSfLuBBGBe3igyI+PbDsMlr17R/mcFdKODPk
 hGS1l5tPu6ZB24hYxRUKdI/nNn9uMo08wug5Qp0Wqv7kIyq6HJauXQEPDK4gWwztqqQ4nTJZUED
 LcYRVur/Sym39pxKU/AGz1tVYURxkEs+T6pfT6H1Wi0q+MbKhMYQvO4oNPTVbHr5fAUElEFdZEc
 RP3FK+FeRLeorCK0y6eJPibeC1NmPrDCPwuga1GByVDR+PZrPq6O68QlD41h2QPZeC2G/pZUbrJ
 b4WetNbUjDD1ALPDo6w==
X-Proofpoint-ORIG-GUID: oWVZhU3s83AvgyZVyMeLu15nbKira52x
X-Authority-Analysis: v=2.4 cv=e7ELiKp/ c=1 sm=1 tr=0 ts=699dfdaa cx=c_pps
 a=ngMg22mHWrP7m7pwYf9JkA==:117 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=5Q_0qquWTk8rz5r3hCoA:9 a=QEXdDO2ut3YA:10
 a=4yXfKAorjrpk44tO5KIA:9 a=BADSkS6PCYMG-pZz:21 a=lqcHg5cX4UMA:10
 a=yHXA93iunegOHmWoMUFd:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: oWVZhU3s83AvgyZVyMeLu15nbKira52x
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-24_02,2026-02-23_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 adultscore=0 priorityscore=1501 impostorscore=0
 lowpriorityscore=0 clxscore=1011 phishscore=0 spamscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602240168
Received-SPF: pass client-ip=205.220.168.131;
 envelope-from=brian.cain@oss.qualcomm.com; helo=mx0a-0031df01.pphosted.com
X-Spam_score_int: -3
X-Spam_score: -0.4
X-Spam_bar: /
X-Spam_report: (-0.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, HTML_MESSAGE=0.001,
 RCVD_IN_BL_SPAMCOP_NET=1.347, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.358, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.659,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

--000000000000c7c849064b96ffdf
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 24, 2026 at 1:32=E2=80=AFPM Philippe Mathieu-Daud=C3=A9 <philmd=
@linaro.org>
wrote:

> TCG helpers are declared using the DEF_HELPER*() macros
> which imply global symbol scope. Unfortunately when building
> a single binary (containing multiple TCG 'target' frontends)
> these symbols clash.
>
> This series takes the dumbest approach, renaming the symbols.
>
> There are still around 20 symbol clashes (usually FPU helpers),
> but this series is good for my proof-of-concept.
>
> Philippe Mathieu-Daud=C3=A9 (5):
>   target/tcg: Rename bitswap() helpers
>   target/tcg: Rename crc32*() helpers
>   target/tcg: Rename unaligned_access() helpers
>   target/tcg: Rename raise_exception() helpers
>   target/tcg: Rename set_rounding_mode() helpers
>
>  target/arm/tcg/helper-a64-defs.h                 |  2 +-
>  target/arm/tcg/helper-defs.h                     |  4 ++--
>  target/hexagon/gen_tcg.h                         |  2 +-
>  target/hexagon/helper.h                          |  2 +-
>  target/i386/helper.h                             |  2 +-
>  target/i386/ops_sse.h                            |  2 +-
>  target/loongarch/tcg/helper.h                    |  8 ++++----
>  target/m68k/helper.h                             |  2 +-
>  target/microblaze/helper.h                       |  4 ++--
>  target/mips/helper.h                             |  6 +++---
>  target/ppc/helper.h                              |  2 +-
>  target/riscv/helper.h                            |  2 +-
>  target/sparc/helper.h                            |  2 +-
>  target/i386/tcg/ops_sse_header.h.inc             |  2 +-
>  target/arm/tcg/arith_helper.c                    |  4 ++--
>  target/arm/tcg/helper-a64.c                      |  4 ++--
>  target/arm/tcg/translate-a64.c                   |  4 ++--
>  target/arm/tcg/translate.c                       |  4 ++--
>  target/hexagon/op_helper.c                       |  2 +-
>  target/hexagon/translate.c                       |  2 +-
>  target/i386/tcg/excp_helper.c                    |  2 +-
>  target/i386/tcg/translate.c                      |  2 +-
>  target/loongarch/tcg/fpu_helper.c                |  2 +-
>  target/loongarch/tcg/op_helper.c                 |  6 +++---
>  target/m68k/op_helper.c                          |  2 +-
>  target/m68k/translate.c                          |  2 +-
>  target/microblaze/helper.c                       |  2 +-
>  target/microblaze/op_helper.c                    |  2 +-
>  target/microblaze/translate.c                    |  4 ++--
>  target/mips/tcg/op_helper.c                      |  6 +++---
>  target/mips/tcg/translate.c                      |  6 +++---
>  target/ppc/tcg-excp_helper.c                     |  2 +-
>  target/ppc/translate.c                           |  6 +++---
>  target/riscv/fpu_helper.c                        |  2 +-
>  target/riscv/translate.c                         |  2 +-
>  target/sparc/helper.c                            |  2 +-
>  target/sparc/translate.c                         |  6 +++---
>  target/i386/tcg/emit.c.inc                       |  2 +-
>  target/loongarch/tcg/insn_trans/trans_bit.c.inc  |  4 ++--
>  .../loongarch/tcg/insn_trans/trans_extra.c.inc   | 16 ++++++++--------
>  target/loongarch/tcg/insn_trans/trans_fmov.c.inc |  2 +-
>  41 files changed, 71 insertions(+), 71 deletions(-)
>
>
For hexagon - those renames seem fine/appropriate.

Reviewed-by: Brian Cain <brian.cain@oss.qualcomm.com>



> --
> 2.52.0
>
>
>

--000000000000c7c849064b96ffdf
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: base64

PGRpdiBkaXI9Imx0ciI+PGRpdiBkaXI9Imx0ciI+PGRpdiBjbGFzcz0iZ21haWxfZGVmYXVsdCIg
c3R5bGU9ImZvbnQtZmFtaWx5Om1vbm9zcGFjZSI+PC9kaXY+PGRpdiBjbGFzcz0iZ21haWxfZGVm
YXVsdCIgc3R5bGU9ImZvbnQtZmFtaWx5Om1vbm9zcGFjZSI+PGJyPjwvZGl2PjwvZGl2Pjxicj48
ZGl2IGNsYXNzPSJnbWFpbF9xdW90ZSBnbWFpbF9xdW90ZV9jb250YWluZXIiPjxkaXYgZGlyPSJs
dHIiIGNsYXNzPSJnbWFpbF9hdHRyIj5PbiBUdWUsIEZlYiAyNCwgMjAyNiBhdCAxOjMy4oCvUE0g
UGhpbGlwcGUgTWF0aGlldS1EYXVkw6kgJmx0OzxhIGhyZWY9Im1haWx0bzpwaGlsbWRAbGluYXJv
Lm9yZyI+cGhpbG1kQGxpbmFyby5vcmc8L2E+Jmd0OyB3cm90ZTo8YnI+PC9kaXY+PGJsb2NrcXVv
dGUgY2xhc3M9ImdtYWlsX3F1b3RlIiBzdHlsZT0ibWFyZ2luOjBweCAwcHggMHB4IDAuOGV4O2Jv
cmRlci1sZWZ0OjFweCBzb2xpZCByZ2IoMjA0LDIwNCwyMDQpO3BhZGRpbmctbGVmdDoxZXgiPlRD
RyBoZWxwZXJzIGFyZSBkZWNsYXJlZCB1c2luZyB0aGUgREVGX0hFTFBFUiooKSBtYWNyb3M8YnI+
DQp3aGljaCBpbXBseSBnbG9iYWwgc3ltYm9sIHNjb3BlLiBVbmZvcnR1bmF0ZWx5IHdoZW4gYnVp
bGRpbmc8YnI+DQphIHNpbmdsZSBiaW5hcnkgKGNvbnRhaW5pbmcgbXVsdGlwbGUgVENHICYjMzk7
dGFyZ2V0JiMzOTsgZnJvbnRlbmRzKTxicj4NCnRoZXNlIHN5bWJvbHMgY2xhc2guPGJyPg0KPGJy
Pg0KVGhpcyBzZXJpZXMgdGFrZXMgdGhlIGR1bWJlc3QgYXBwcm9hY2gsIHJlbmFtaW5nIHRoZSBz
eW1ib2xzLjxicj4NCjxicj4NClRoZXJlIGFyZSBzdGlsbCBhcm91bmQgMjAgc3ltYm9sIGNsYXNo
ZXMgKHVzdWFsbHkgRlBVIGhlbHBlcnMpLDxicj4NCmJ1dCB0aGlzIHNlcmllcyBpcyBnb29kIGZv
ciBteSBwcm9vZi1vZi1jb25jZXB0Ljxicj4NCjxicj4NClBoaWxpcHBlIE1hdGhpZXUtRGF1ZMOp
ICg1KTo8YnI+DQrCoCB0YXJnZXQvdGNnOiBSZW5hbWUgYml0c3dhcCgpIGhlbHBlcnM8YnI+DQrC
oCB0YXJnZXQvdGNnOiBSZW5hbWUgY3JjMzIqKCkgaGVscGVyczxicj4NCsKgIHRhcmdldC90Y2c6
IFJlbmFtZSB1bmFsaWduZWRfYWNjZXNzKCkgaGVscGVyczxicj4NCsKgIHRhcmdldC90Y2c6IFJl
bmFtZSByYWlzZV9leGNlcHRpb24oKSBoZWxwZXJzPGJyPg0KwqAgdGFyZ2V0L3RjZzogUmVuYW1l
IHNldF9yb3VuZGluZ19tb2RlKCkgaGVscGVyczxicj4NCjxicj4NCsKgdGFyZ2V0L2FybS90Y2cv
aGVscGVyLWE2NC1kZWZzLmjCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoHzCoCAyICstPGJyPg0K
wqB0YXJnZXQvYXJtL3RjZy9oZWxwZXItZGVmcy5owqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqB8wqAgNCArKy0tPGJyPg0KwqB0YXJnZXQvaGV4YWdvbi9nZW5fdGNnLmjCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoHzCoCAyICstPGJyPg0KwqB0YXJnZXQvaGV4YWdv
bi9oZWxwZXIuaMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIHzCoCAyICst
PGJyPg0KwqB0YXJnZXQvaTM4Ni9oZWxwZXIuaMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgfMKgIDIgKy08YnI+DQrCoHRhcmdldC9pMzg2L29wc19zc2UuaMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIHzCoCAyICstPGJyPg0KwqB0YXJn
ZXQvbG9vbmdhcmNoL3RjZy9oZWxwZXIuaMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIHzC
oCA4ICsrKystLS0tPGJyPg0KwqB0YXJnZXQvbTY4ay9oZWxwZXIuaMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgfMKgIDIgKy08YnI+DQrCoHRhcmdldC9taWNyb2Js
YXplL2hlbHBlci5owqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqB8wqAgNCArKy0t
PGJyPg0KwqB0YXJnZXQvbWlwcy9oZWxwZXIuaMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgfMKgIDYgKysrLS0tPGJyPg0KwqB0YXJnZXQvcHBjL2hlbHBlci5owqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgfMKgIDIgKy08YnI+DQrC
oHRhcmdldC9yaXNjdi9oZWxwZXIuaMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIHzCoCAyICstPGJyPg0KwqB0YXJnZXQvc3BhcmMvaGVscGVyLmjCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCB8wqAgMiArLTxicj4NCsKgdGFyZ2V0L2kzODYv
dGNnL29wc19zc2VfaGVhZGVyLmguaW5jwqAgwqAgwqAgwqAgwqAgwqAgwqB8wqAgMiArLTxicj4N
CsKgdGFyZ2V0L2FybS90Y2cvYXJpdGhfaGVscGVyLmPCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCB8wqAgNCArKy0tPGJyPg0KwqB0YXJnZXQvYXJtL3RjZy9oZWxwZXItYTY0LmPCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCB8wqAgNCArKy0tPGJyPg0KwqB0YXJnZXQvYXJtL3Rj
Zy90cmFuc2xhdGUtYTY0LmPCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoHzCoCA0ICsrLS08
YnI+DQrCoHRhcmdldC9hcm0vdGNnL3RyYW5zbGF0ZS5jwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqB8wqAgNCArKy0tPGJyPg0KwqB0YXJnZXQvaGV4YWdvbi9vcF9oZWxwZXIuY8Kg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgfMKgIDIgKy08YnI+DQrCoHRhcmdldC9o
ZXhhZ29uL3RyYW5zbGF0ZS5jwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqB8wqAg
MiArLTxicj4NCsKgdGFyZ2V0L2kzODYvdGNnL2V4Y3BfaGVscGVyLmPCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCB8wqAgMiArLTxicj4NCsKgdGFyZ2V0L2kzODYvdGNnL3RyYW5zbGF0ZS5j
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgfMKgIDIgKy08YnI+DQrCoHRhcmdldC9s
b29uZ2FyY2gvdGNnL2ZwdV9oZWxwZXIuY8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIHzCoCAyICst
PGJyPg0KwqB0YXJnZXQvbG9vbmdhcmNoL3RjZy9vcF9oZWxwZXIuY8KgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgfMKgIDYgKysrLS0tPGJyPg0KwqB0YXJnZXQvbTY4ay9vcF9oZWxwZXIuY8KgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIHzCoCAyICstPGJyPg0KwqB0YXJnZXQv
bTY4ay90cmFuc2xhdGUuY8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIHzC
oCAyICstPGJyPg0KwqB0YXJnZXQvbWljcm9ibGF6ZS9oZWxwZXIuY8KgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgfMKgIDIgKy08YnI+DQrCoHRhcmdldC9taWNyb2JsYXplL29wX2hl
bHBlci5jwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgfMKgIDIgKy08YnI+DQrCoHRhcmdl
dC9taWNyb2JsYXplL3RyYW5zbGF0ZS5jwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgfMKg
IDQgKystLTxicj4NCsKgdGFyZ2V0L21pcHMvdGNnL29wX2hlbHBlci5jwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgfMKgIDYgKysrLS0tPGJyPg0KwqB0YXJnZXQvbWlwcy90Y2cvdHJh
bnNsYXRlLmPCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCB8wqAgNiArKystLS08YnI+
DQrCoHRhcmdldC9wcGMvdGNnLWV4Y3BfaGVscGVyLmPCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoHzCoCAyICstPGJyPg0KwqB0YXJnZXQvcHBjL3RyYW5zbGF0ZS5jwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqB8wqAgNiArKystLS08YnI+DQrCoHRhcmdldC9y
aXNjdi9mcHVfaGVscGVyLmPCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCB8wqAg
MiArLTxicj4NCsKgdGFyZ2V0L3Jpc2N2L3RyYW5zbGF0ZS5jwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqB8wqAgMiArLTxicj4NCsKgdGFyZ2V0L3NwYXJjL2hlbHBlci5jwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgfMKgIDIgKy08YnI+DQrCoHRh
cmdldC9zcGFyYy90cmFuc2xhdGUuY8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgfMKgIDYgKysrLS0tPGJyPg0KwqB0YXJnZXQvaTM4Ni90Y2cvZW1pdC5jLmluY8KgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgfMKgIDIgKy08YnI+DQrCoHRhcmdldC9sb29uZ2Fy
Y2gvdGNnL2luc25fdHJhbnMvdHJhbnNfYml0LmMuaW5jwqAgfMKgIDQgKystLTxicj4NCsKgLi4u
L2xvb25nYXJjaC90Y2cvaW5zbl90cmFucy90cmFuc19leHRyYS5jLmluY8KgIMKgfCAxNiArKysr
KysrKy0tLS0tLS0tPGJyPg0KwqB0YXJnZXQvbG9vbmdhcmNoL3RjZy9pbnNuX3RyYW5zL3RyYW5z
X2Ztb3YuYy5pbmMgfMKgIDIgKy08YnI+DQrCoDQxIGZpbGVzIGNoYW5nZWQsIDcxIGluc2VydGlv
bnMoKyksIDcxIGRlbGV0aW9ucygtKTxicj4NCjxicj48L2Jsb2NrcXVvdGU+PGRpdj48YnI+PC9k
aXY+PGRpdj48ZGl2IGNsYXNzPSJnbWFpbF9kZWZhdWx0IiBzdHlsZT0iZm9udC1mYW1pbHk6bW9u
b3NwYWNlIj5Gb3IgaGV4YWdvbiAtIHRob3NlIHJlbmFtZXMgc2VlbSBmaW5lL2FwcHJvcHJpYXRl
LjwvZGl2PjxkaXYgY2xhc3M9ImdtYWlsX2RlZmF1bHQiIHN0eWxlPSJmb250LWZhbWlseTptb25v
c3BhY2UiPjxicj48L2Rpdj48ZGl2IGNsYXNzPSJnbWFpbF9kZWZhdWx0IiBzdHlsZT0iZm9udC1m
YW1pbHk6bW9ub3NwYWNlIj5SZXZpZXdlZC1ieTogQnJpYW4gQ2FpbiAmbHQ7PGEgaHJlZj0ibWFp
bHRvOmJyaWFuLmNhaW5Ab3NzLnF1YWxjb21tLmNvbSI+YnJpYW4uY2FpbkBvc3MucXVhbGNvbW0u
Y29tPC9hPiZndDs8L2Rpdj48YnI+PC9kaXY+PGRpdj7CoDwvZGl2PjxibG9ja3F1b3RlIGNsYXNz
PSJnbWFpbF9xdW90ZSIgc3R5bGU9Im1hcmdpbjowcHggMHB4IDBweCAwLjhleDtib3JkZXItbGVm
dDoxcHggc29saWQgcmdiKDIwNCwyMDQsMjA0KTtwYWRkaW5nLWxlZnQ6MWV4Ij4NCi0tIDxicj4N
CjIuNTIuMDxicj4NCjxicj4NCjxicj4NCjwvYmxvY2txdW90ZT48L2Rpdj48L2Rpdj4NCg==
--000000000000c7c849064b96ffdf--

