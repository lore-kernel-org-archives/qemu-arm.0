Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E4F2C624D4
	for <qemu-arm@archiver.kernel.org>; Wed,  2 Sep 2026 16:17:02 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1x1ndq-0007Bs-Fc; Wed, 02 Sep 2026 12:16:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1x1ndo-0007BN-SX
 for qemu-arm@nongnu.org; Wed, 02 Sep 2026 12:16:48 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1x1ndn-0003fI-5A
 for qemu-arm@nongnu.org; Wed, 02 Sep 2026 12:16:48 -0400
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 682FZN8G2067373
 for <qemu-arm@nongnu.org>; Wed, 2 Sep 2026 16:16:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 5LDI2JScvormYirFbxmb7Mw8lZGcKuNc/CE0uQI5/o4=; b=K0RKmLZzMYoLtYAH
 geXZagYegzXTMHt2xiWn8Cl58oMfzHtfPA6j5rY03bYjHS7TRd1VyZjWYSIsYR1z
 MT3tZNCgSPgX7Bdt/bJxINqOsXeFrvTnzpVg5rkOb62vFbcG6jQuMZifUQ+2ZMIX
 L0l0KJ08RyL8+10yGv1wQ6j9FRPHsjbDoer2b0ydJyvsU8IeUe8B2JuN1j8goMyw
 gz/ipwOdVc8YzeK7+d1RZ7WpKp/9NLivO+z9hYSeOSiDV3AD9LHjCowOBCGgnC8Y
 MzARZsu6W8u0OAxt8Aqn3MMfPnmWRSQnio3AGWWR5Bl+u5mv82VwBjz1JmfnC+JW
 3iflow==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gejv8961j-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Wed, 02 Sep 2026 16:16:45 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id
 af79cd13be357-92e62e3459fso239168085a.0
 for <qemu-arm@nongnu.org>; Wed, 02 Sep 2026 09:16:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1788365805; x=1788970605; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=5LDI2JScvormYirFbxmb7Mw8lZGcKuNc/CE0uQI5/o4=;
 b=cl83iouWihPvdSrz+OwfggrFGgxh3oeICm+AerxUGa3ULgDOVPdjGrPvCQ02Pja61z
 kSQ9xK9LG/EtLEkEmsEZA23biX+HYE44wWp3c8WS3i4/U4ZQeEgMZdXMhLS19NGJWXx6
 gj7TCNLRaBo3dRs5wYWcq6fyz51jr7orTXH90BoaCqxEKcII6oU3Ijio05FZ8dM5J70J
 snp82kgK5cJKSkoTFVOxnKCXkgAGo1Z3YKEC0hxVBeXC2APYmHTQHmlxhoEweTWda/Ur
 nwrLg4Z/BKJB+ZRnGxNReUlPxoM9rXgvEUzxFRPmMn//g7TvNxf+IRU5FQZxbansVxsb
 Y5lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1788365805; x=1788970605;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=5LDI2JScvormYirFbxmb7Mw8lZGcKuNc/CE0uQI5/o4=;
 b=gfrV3wusdCCmEEEpAD9T/OI5FFxXMd3Ocrgvq/SwzdtG4DPGIUQKbvMwEopE+4us1j
 bbriwGXbGM0yBqHNNXHI/Dm5N69jcrKcPViBpiKfnePejpwuKaX3qAyNkQr2hiOYsdgT
 BGgDWZTaY4XfDk7Kop8Ov+Fo55B8QP3/FjRF4oIPJgLQ28hDkl4B3gfAbRVmv3fIAyF+
 2HZbbLCweNEnTQqAf6V5V04gSOrdUlhYyanPVMOoIZYlxfwNOwqveRCQTaT99CPzyV0s
 k1P63S5BQ/YruF4NdUxwPppZpJBU5K5SE7mC7aa4E1htimTT5SjOzqC8YymwHd41+yvO
 aQmQ==
X-Forwarded-Encrypted: i=1;
 AHgh+Rp2ta5KG7VXugLlptJAbpe2N+ZQYeo+gQDiff2sj7+CYp56eyI+4m1CSlRLRtxOUOMUMEphJPfF2Q==@nongnu.org
X-Gm-Message-State: AFuF++l3UL9tJAYuuzqfh80zhAniqVTl3gnNGBFKMiZA22rYC51D/5rB
 3vJZRWOoZDYVlNR4UQ6V3FsQ+Z3ebV5nXV2c6nfQ3F/UvUAFBGJ+KcG7LgHlTLB1v6icqu4F/6X
 XOxGTFT1PaQZw5toGmgkuQYwks4HdlxxkSwlAxl1sDeMAGLs11PN1hZE=
X-Gm-Gg: AR+sD12bawRTJ+f3Lrfcc0lqyuJ8hbw6JSkLymjMwMg9c7t3g5laeo1uDRMYwVuqeDb
 L/SzOUn+E/+CUaOqaXFg2c9/PDAMXKR1cFlhEGxYOD/dXzSpYpZ96Lgk8PGU5MuDNP7cioYi9bw
 GaE4yHd+zdvCk661WtsWAvUBwEj0W84zKLTjGj/VdrFjF3E1fW8hDgmtYogAU9yla3gndKxR09J
 yzwDoo86SB/N6YMrJTAGzTCJmqw/FWspdVEjWfzXLIUD8v41gPaRcsW7U2S5oag1Kloyp3rw4M5
 BIyGd+1GFSb2V7OACEi8Ic+4vTxTaPiu59PAmtWbHoNJpSR3AV/zh7Pl4svw7f3sAlUJjyWx8Z9
 kzYU3NG61Y8bNX/dME0X8aCh+/6EL3uBqhw==
X-Received: by 2002:a05:620a:122a:b0:939:1d86:94aa with SMTP id
 af79cd13be357-9396e56ac4dmr5791985a.39.1788365804828; 
 Wed, 02 Sep 2026 09:16:44 -0700 (PDT)
X-Received: by 2002:a05:620a:122a:b0:939:1d86:94aa with SMTP id
 af79cd13be357-9396e56ac4dmr5783285a.39.1788365804307; 
 Wed, 02 Sep 2026 09:16:44 -0700 (PDT)
Received: from [192.168.69.200] (pmd666.hd.free.fr. [88.187.86.199])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-484492cdbfbsm7369174f8f.33.2026.09.02.09.16.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 02 Sep 2026 09:16:43 -0700 (PDT)
Message-ID: <717fcf10-2d29-4894-893e-259aff8fe02e@oss.qualcomm.com>
Date: Wed, 2 Sep 2026 18:16:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] util/cpuinfo-aarch64: Fix build with older glibc headers
Content-Language: en-US
To: Tao Tang <tangtao1634@phytium.com.cn>,
 Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 Chen Baozi <chenbaozi@phytium.com.cn>
References: <20260826163753.459661-1-tangtao1634@phytium.com.cn>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
In-Reply-To: <20260826163753.459661-1-tangtao1634@phytium.com.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: w6kS_OOIX22Hz6NrhxhMkXVhAAVNnRwa
X-Authority-Analysis: v=2.4 cv=L+wtheT8 c=1 sm=1 tr=0 ts=6a984bed cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=fgrLqfBXAAAA:8 a=A-5aKlvlEl7envUJ730A:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22 a=_Ge82aPy-h_wFa7gWU4u:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAyMDE0MyBTYWx0ZWRfX0js27HAw3XGS
 u6/0jtWjPB0gpdY4+ORuTUd+0zdYcZWUmWxJCoKbgAagVH4OWJ6CGWzX2GcK8pk/r3AVoWmrNYn
 1tOwkya2mWmMenPqQM6sFYO6+wVz2atstFr0LtFYzTZPXKtlXuQv6O8v5mf1vMFhQZSpz+zbOBG
 x4kJ/vrlv9TNJJoL0kHK96eAsOvsaw+KNKFbNN706kaug3Y7YBqw1z3n253TAYcCDrhjmaOr9pB
 Jf2oVI4Q+WbqqwYg7QDUiy5psWMEHUUU15fEy/lUjFwZulxpNl92EjqTGiXJVaPe7NNkffXVAAD
 KkIATOtBdwVptg/UmhvXIfCQHMEMI25pAF25nnpgWYFXMrvJxPhJeHq4I/0hzNIWrz5IELqH+Wo
 QHGltPJ2avhjRtkXbKsA44VEZ34PsyPLyPb3ewqDkC0X6fZcDvK0tLP5zyrcuZdITNdeCqHUdj3
 eApe1i4wbQiJShic7Sg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAyMDE0MyBTYWx0ZWRfX9F8sjQKXHIX3
 5CaIds2naj8vYvrOdJ3rHQRax8KBU1pggqquLzo1cRxXH95JeJPbFCsHgOaFK46hzDDaUE/tmLM
 XS5WKKjLJaSMw+ta0Wlb6lDpa+jNx9g=
X-Proofpoint-ORIG-GUID: w6kS_OOIX22Hz6NrhxhMkXVhAAVNnRwa
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-02_04,2026-09-01_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 bulkscore=0 impostorscore=0 phishscore=0
 spamscore=0 suspectscore=0 adultscore=0 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609020143
Received-SPF: pass client-ip=205.220.180.131;
 envelope-from=philmd@oss.qualcomm.com; helo=mx0b-0031df01.pphosted.com
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

On 26/8/26 18:37, Tao Tang wrote:
> Commit 761bfe07b2c9 ("util/cpuinfo-aarch64: Detect FEAT_CSSC")
> started using HWCAP2_CSSC unconditionally. This macro was added to
> glibc's AArch64 bits/hwcap.h during the glibc 2.38 development cycle,
> so AArch64 hosts with older headers fail to build.
> 
> Follow the existing HWCAP2_BTI handling and define HWCAP2_CSSC to
> zero when it is not provided by system headers. Such environments
> simply do not use FEAT_CSSC host optimizations.
> 
> This has been tested on an Ubuntu 22.04 aarch64 host with glibc 2.35.
> 
> Fixes: 761bfe07b2c9 ("util/cpuinfo-aarch64: Detect FEAT_CSSC")
> Signed-off-by: Tao Tang <tangtao1634@phytium.com.cn>
> ---
>   util/cpuinfo-aarch64.c | 3 +++
>   1 file changed, 3 insertions(+)
Merged as 01e1455139196cc8d6bcde7d2f918348a90f7f26.

