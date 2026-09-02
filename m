Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8F1AC61DD6
	for <qemu-arm@archiver.kernel.org>; Wed,  2 Sep 2026 19:53:07 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1x1r0u-0006Tu-Vb; Wed, 02 Sep 2026 15:52:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@oss.qualcomm.com>)
 id 1x1r0m-0006QZ-3k
 for qemu-arm@nongnu.org; Wed, 02 Sep 2026 15:52:44 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@oss.qualcomm.com>)
 id 1x1r0j-0007VR-H0
 for qemu-arm@nongnu.org; Wed, 02 Sep 2026 15:52:43 -0400
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 682Hr7Yd1650778
 for <qemu-arm@nongnu.org>; Wed, 2 Sep 2026 19:52:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 6Te+6+lQS/EW8h6BW95iDe7+CWxLjVFrpGbJ8eltH2k=; b=ff3WpydxxYK7v2m5
 jwBGQL6YIvJt5Ofl1uZsd2nBW7tmcy05rF98jv43wekJ96QE1YhsC0TSNnM6LLJl
 8ITDL1LX31K4p4gwCMlbMO7hWckkj1MzFUbi4Zfi5T8N5HXJPx+ismDjW5BIdsCZ
 8sxVWvd9RIkidCF3sRioZyFKgCau4vZv+6v5at4JyWtm5TFC6RgqLt0HjWq62uuZ
 XC6R4iZrY5bcggWyFeZquYaoUvShTeB6XX5kRoxD4kL+ZBiNN2S3nwShvv9GS1Lr
 va8QDl2GyKZPnUDrG5Zh/jANSHlBlULYGrsIVyf5FUUjzAOmPE6hiDUCRiDsiODJ
 YLHbnQ==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com
 [209.85.214.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gemj4sp17-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Wed, 02 Sep 2026 19:52:40 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id
 d9443c01a7336-2ccb687f82eso20058455ad.3
 for <qemu-arm@nongnu.org>; Wed, 02 Sep 2026 12:52:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1788378759; x=1788983559; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=6Te+6+lQS/EW8h6BW95iDe7+CWxLjVFrpGbJ8eltH2k=;
 b=PWBa96PViUliylVQGtgYdsFInidFljTJvjjX0SWhhMV6Rf2Q+3RT2uQ0Q5OKxZvqSf
 kXcigdjSlG4BB03MCEHvbfafYf59KxZfjr8VMG0oa/II4HhWs/T266mDRsY/+kD5CUJQ
 b5MEQhiX5GlAKBd84qYqx56jihwdKOBi7Mf2dGBP3rXkD+S9/dfc/Uze2LtGLAW7GenY
 elUYuFSL7uMtfWh6QgBnTt8Ntk3tz20CWh+x5pKMm/WilZbovvw7TFafMkoW2S557JSI
 MG2k/o8ekavLpH04HKKpG/WhOL7F8WfKrsA224ylWaOEg2PfzKHKQjssnEaE3ZK1NYMV
 5gCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1788378759; x=1788983559;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=6Te+6+lQS/EW8h6BW95iDe7+CWxLjVFrpGbJ8eltH2k=;
 b=TY0LOGT0kI1ZUCZOUkCs/1Sfk1X2eU/J3uh/GBtzv/t1gbYhm8Q25z2D/dzSlNdxsz
 KuN1Ftzlk4DMGL1R/F6fOH5xxjIEUy+viQ26DEov9hHTxj3ppn15dSS++QzxUhbCQ9w2
 MHWCPXImwjH4Geysm6jcyuuegWeJa5gg3Nh0zdkF+TeWuDkunP/Imwv5Uxx3yPYTh64t
 4guHoHPPjuW1qMLUkvzvd42r7gWo5zfm7SxGVIvnFfMCF2pVOT0kVMv7aONhfemaUu+H
 O79u7GiFxdP1ACz1HumZPJjV+ZcLmDlviXtjXIygBtIGOq6RWxS9glRBObHPSlbTlzxP
 Rbhw==
X-Forwarded-Encrypted: i=1;
 AKwUvBxKVDIU1L3g9+tGhk9q7ZI/ga6K/eHZesZpSjh9ks3mIa7b5OFI/mmXchE/IZXHBtBnZa3D/ELr7w==@nongnu.org
X-Gm-Message-State: AFuF++nOmFXBIUaV2x4xfUxcvMgKFUDx3pO9bDqwQxdThiEINXCcEsg2
 0iiPUR9Llwy5r4hBjLE4dZIhOyX2zpbdL40muFFmU7+WD3Q2AAcMKyEDCKrTdj8IYgiHGY7jDit
 wHOKLLGywVQ1UvFFzABHC/Md4aT4TpCuNyX4oL6Lhm9tCqUANzSsr4xU=
X-Gm-Gg: AYBFou2uJ5XBSd8ZaifIY+ed6Wf3CHeZ4kjoP5um6pZhha/hACdiAFg9dkqEytdQ0P6
 IhtH/i/6lGyV1nZJZ7Y1D/+JVjDx1JS/bAlmKExTPOOuFs3yYL3v4su3IRrQts3l4uIxABcjuuk
 CBs1Eh93ufuBkWCilz46Prn2pYHsy8oQ3Q0FdkUy6tp/zQ5fzHrwImzvo8HurPddxRogb2nnwZ2
 2oMl8BQSI1bRORiJ/5E/dvFe3FsRBXhedIIZ69HH/7iXiUdCAkDs5ZnmyPvqbo/ICYReV88jIpS
 ZKTV3Tr0KVQuKBTT1+NVWVjgOcDWZsY9yidmvhNTewn0Nwvy3N3iLthjF7QkShvD9O+vuHUS//Z
 DjHv4EjyW1/v28Ipr2+jdCCA/3ceg44iQN/nu6Yp7gdnMcEOxvBagu8pLzRYKSFfO4Fy8
X-Received: by 2002:a17:903:3884:b0:2da:fa6a:b04f with SMTP id
 d9443c01a7336-2dafa6ab21cmr26976255ad.2.1788378759541; 
 Wed, 02 Sep 2026 12:52:39 -0700 (PDT)
X-Received: by 2002:a17:903:3884:b0:2da:fa6a:b04f with SMTP id
 d9443c01a7336-2dafa6ab21cmr26975535ad.2.1788378759129; 
 Wed, 02 Sep 2026 12:52:39 -0700 (PDT)
Received: from [192.168.1.199] (216-71-219-44.dyn.novuscom.net.
 [216.71.219.44]) by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-33256416966sm307194eec.23.2026.09.02.12.52.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 02 Sep 2026 12:52:38 -0700 (PDT)
Message-ID: <2f0f4aa9-54a7-411b-bf59-7c8442b099d1@oss.qualcomm.com>
Date: Wed, 2 Sep 2026 12:52:37 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 02/11] target/s390x: Restrict interrupt handlers to
 system mode
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>,
 qemu-devel@nongnu.org
Cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Peter Maydell <peter.maydell@linaro.org>, Paolo Bonzini
 <pbonzini@redhat.com>, qemu-ppc@nongnu.org, qemu-s390x@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>,
 qemu-riscv@nongnu.org, qemu-arm@nongnu.org,
 Cornelia Huck <cohuck@redhat.com>, Eric Farman <farman@linux.ibm.com>,
 Matthew Rosato <mjrosato@linux.ibm.com>,
 Ilya Leoshkevich <iii@linux.ibm.com>, David Hildenbrand <david@kernel.org>
References: <20260902152044.31291-1-philmd@oss.qualcomm.com>
 <20260902152044.31291-3-philmd@oss.qualcomm.com>
From: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260902152044.31291-3-philmd@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAyMDE3NiBTYWx0ZWRfX5kVW8ERICODa
 537ybeNXL+1W0fDF49SbUVSGkzLfIh5by1dG4o0zu6gtuq/roUNYiD9BtCplh49ltxeb2k9/ALW
 hH1qobIuDFaM3Dv6TQdU19Pxykott/qyMU5+pd8YKil5BvtIHZwv0wbNHssGEDBK+mnhIetTigI
 fmeeJDGimQ8+IFgEEcj6DapI5/QZWTS58jWZQSrmfC4xC47WjH/luLLvr+c5adtdKsYd6ZAywQi
 lfEeGgtsBTGW63aGN6ae9aGv0hYMGbckbKaZGJNJ/zho/cTRUSttgVARe6fUAyMB7wkvN2QyIml
 pnWaX3abNN4qsmzlsOmo9aQZROYJdkvRSI2z5b4JvtnKSiERlPOH8mrifoPGXtlTNIgiVKKRu6Y
 pzw7BwXm0dScxOX4UMRS+ugR7nJPGkCAVP56nnlVDCVZicEH3kzebLjPxqU61fvcd3e8KHgKcq8
 9BgBGtDaWms+/N6yXmA==
X-Proofpoint-ORIG-GUID: KGWfaosspWZ2_TWv2uMuy_H5R4BtVRAA
X-Authority-Analysis: v=2.4 cv=MdhcfZ/f c=1 sm=1 tr=0 ts=6a987e88 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=iLqgmErQAxjCjdq5jj1Aqg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=1EuahR8dtqhgXXsTjK4A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-GUID: KGWfaosspWZ2_TWv2uMuy_H5R4BtVRAA
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAyMDE3NiBTYWx0ZWRfX4h0Etstf+whs
 zp2yCbxF7A8ixdEgqEkOWqTvYg8IGbTfKiEpyz1LhQ1VXx7XRXxSl6s8JssuZwuKCulUQVteO/D
 0vgtj3XA+S0plSjys+OVL4iybpoza3I=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-02_04,2026-09-02_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 adultscore=0 suspectscore=0 malwarescore=0
 phishscore=0 clxscore=1015 spamscore=0 lowpriorityscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609020176
Received-SPF: pass client-ip=205.220.180.131;
 envelope-from=pierrick.bouvier@oss.qualcomm.com;
 helo=mx0b-0031df01.pphosted.com
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

On 9/2/2026 8:20 AM, Philippe Mathieu-Daudé wrote:
> Move s390_cpu_do_interrupt() and s390_cpu_exec_interrupt()
> declarations from system/user shared header to system-mode-only
> section, removing the unused user-mode stub.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>
> ---
>  target/s390x/s390x-internal.h  | 5 ++---
>  target/s390x/tcg/excp_helper.c | 5 -----
>  2 files changed, 2 insertions(+), 8 deletions(-)
> 

Reviewed-by: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>

