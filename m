Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65063C43458
	for <qemu-arm@archiver.kernel.org>; Fri, 10 Jul 2026 21:48:44 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wiJ5N-0001iQ-6w; Fri, 10 Jul 2026 17:48:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wiJ58-0001KK-P9
 for qemu-arm@nongnu.org; Fri, 10 Jul 2026 17:48:26 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wiJ56-0004ii-Sk
 for qemu-arm@nongnu.org; Fri, 10 Jul 2026 17:48:26 -0400
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 66AK3RKV1697292
 for <qemu-arm@nongnu.org>; Fri, 10 Jul 2026 21:48:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 AuU1AxNQdEe12mck+iDZMnewEFFAahJNOb3wRaAvWmQ=; b=f5C7Vopu/p5cbCUb
 wnlSdnXgwUL0QIbfBAmwsCsLbmySsZWzyZJNysHdDRWET/p4a9tJUp1dRWPG+3mS
 NZkuXVIJ9IYIHlAwCmkmepmUFSAg0oVetsv9uMpkACuIvaVx4djIkI2XQEpDH/Pi
 dzS3dClzTnGR1DSZ1Z9bjuU3Y1vLXzVkE2IktOrTACMWDFkrCPJYiTg90W8Y2wT9
 SBx10s55xLxBE9tobssYPOrLphm87nHIos25pnaE+jVzatuOwVq4ZxHXvsIdYVWs
 iyE2u4bogNITS4I8zn10wypUms6CVJDDbLDeacYODRZHbEDdvhEZvDYzHJei83VD
 kH9GwA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fax5djh2f-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Fri, 10 Jul 2026 21:48:23 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id
 af79cd13be357-92e66f9e2baso140982385a.0
 for <qemu-arm@nongnu.org>; Fri, 10 Jul 2026 14:48:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1783720102; x=1784324902; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=AuU1AxNQdEe12mck+iDZMnewEFFAahJNOb3wRaAvWmQ=;
 b=B2sEaln1mjdOX2qrdnOVBUhhTRN2XLgpEK5Je3faKC/vqxQ9kI7se0mzJcsZ7mB0Jw
 F3M586WG7o2SY8+Ee+uAn/i3KUm93e+ikgFOCzsHrtbCsaAgUA65tTxRLm1dT5878xcv
 +c4vcfiACICRrYTpXPfIi//LbWwtJ1kixtxSs8I+mKOSLJOR2Xx2QU7XPhd8TireyGWq
 SYJGeEQ+bWhLnxdCtAukZ78uZBQewruNlCzn06sAmjtzNQznDgfNr9YAvAazSqIE8urP
 BSiqUCqgzaZuTfL5+5935Qc87d3so7AS6xpFPGmxCbZCDQEgeDVIQgpbJeI505s8s12E
 EytQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783720102; x=1784324902;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=AuU1AxNQdEe12mck+iDZMnewEFFAahJNOb3wRaAvWmQ=;
 b=X4p2lIB2W3re0IV1MWRiTzypmplRK8YIyH5cWbZ9pLXUPx6JscMEjAGzUCrm1q1IaR
 iPo4MBVUfq/V71m/g4tYOntDhLiAnekZzElTNeb6uZXs2JbaKan7WAHwlM83sTyDhMI8
 JFfBXxGyYzbSg+Vf8bXDsIvkuEfHyK4G1ZgMUmctZ10zXep2FZN7HbM88oafFghxZ2mM
 WF7vnLIcnfn2EFYUIMQT7yLdkrPhkB4842MvBJfW+FuY4I55Fvsmka0LZH0n+/p7LP2G
 BY4l05zJE5aJ1hkROROQ4764bMiLaDjUrh4KWJ9FDM5atEm4W2zbOlxVMxtmrbbuECPY
 HhvA==
X-Gm-Message-State: AOJu0Yw8Tx712sYu539n2tiU1HrpPGrm/1X+HzAcEpMm5pYQSIVbl9uO
 HWGYaeqB+dZUljJYz+yO5Zt2c1n06vjiapVxAb88ykIuiBsP1PeQdRvRHz0E32vrLcjCfcNRyAi
 BGNUxLdyWmkmLJHHIKl7tnxRmONoezmsjhwCYAfM1kn5tDECgfng9Tv4=
X-Gm-Gg: AfdE7cm32odYUZa1QCfeNnrGGbgPgS3KAkfq/XRDR+OAD23H8VDF7Kup+u+AJd0SKrx
 jZJmIrEA523tNOKUTenodzDbpXt19JKcwradZz+1oWUgSlzVpK+bUI+zs74TyADViAomKnSA2ly
 qgwqUzrmHIQ6oJqHIW1Wh/TxWkdfhsyLYYiRwjrMh8DM4lD7f2RsALbXABVeD6xve961Ngnr43I
 5Cx25V7lZlDRU5afO9xGr2gKN0te6fgLaKCjaYct+bfCAf4n4Ny2TU9YnOsG9wKrUu1iEZm49s6
 0niDihB/b5Uz2GrlDpsqlpUT8+9BGUC8W7Iuip0JWXO2mxW/YHG87OF+pehK/AXi4JzNxIsFCOQ
 nB/ytDhA3bxRHh9m9Sj5awv9vVosvTCFEOVh6SH8hvbvR/8y4BsSEVghYAPDb/Q==
X-Received: by 2002:a05:622a:1e0c:b0:517:8711:d466 with SMTP id
 d75a77b69052e-51cbf324541mr7304891cf.56.1783720102566; 
 Fri, 10 Jul 2026 14:48:22 -0700 (PDT)
X-Received: by 2002:a05:622a:1e0c:b0:517:8711:d466 with SMTP id
 d75a77b69052e-51cbf324541mr7304691cf.56.1783720102154; 
 Fri, 10 Jul 2026 14:48:22 -0700 (PDT)
Received: from [192.168.69.219] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-47aa0f21328sm64505445f8f.32.2026.07.10.14.48.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 10 Jul 2026 14:48:21 -0700 (PDT)
Message-ID: <04ff0b28-bde6-40a4-8e9b-33227f18f5c0@oss.qualcomm.com>
Date: Fri, 10 Jul 2026 23:48:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 10/51] target/arm: Use bp argument in
 arm_debug_check_breakpoint
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org, jcmvbkbc@gmail.com
References: <20260710205401.836304-1-richard.henderson@linaro.org>
 <20260710205401.836304-11-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
In-Reply-To: <20260710205401.836304-11-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEwMDIxOSBTYWx0ZWRfX+zctB+yN6HHu
 vr3/P23i4p1pSq4vtnyM6zhvYJQ8ACmrSmgyDqCn/UTTncmsCuqUSSkcOUh8mz/Ax3482FMTYnZ
 Vm/Hh50h4K5+DCV3n4ZnslpYe8GtFG8=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEwMDIxOSBTYWx0ZWRfX6MHITvJzmKAN
 ZJYqwSmFDMbxlPHqNpJTHyOM6WC7X+GN14xYN1OA8Ru6pU5FZjImEkno6YO7Gb28B/6SPD3lMz7
 lGOGjRoZEgxXtvXehUU2rsK/Q3E5Ibyc1EnlrHQo0tMopYoEUjpvOdWY5/wnvraITa1wF6C9ZlD
 knI23GN6bQjVR1b1SV4eYges8dqs12rdhnOih8eewk+POScBz48qxVUQ4FUU8uAXJSP6hJ24URX
 /TY8spRa34cEBCUgR4jXANxf3WgHuZuuWrMpZBqs33dRBzNpUVR7LpHlwTuIhaFtx5Z2/1MxCaG
 7+wB4bk6snQfAbuWOiqk1oddBMaN5eZ13SBR/z3B/4TwS4hbPM13D8f5icVb2lrfMow6cq0HJJZ
 U+VwD+W7IY5yEZDvE5mRogdl1+m6m7/nEEkIfTqN/pgelUQW2NypXVkcxdBV5lSxAfinc5Nnt2k
 1Xcd+rvt3J381b2tPaQ==
X-Proofpoint-GUID: CmrKTVyH3_Mbp5ybAYa_7qV_R1yolFhP
X-Proofpoint-ORIG-GUID: CmrKTVyH3_Mbp5ybAYa_7qV_R1yolFhP
X-Authority-Analysis: v=2.4 cv=M/x97Sws c=1 sm=1 tr=0 ts=6a5168a7 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=1tSEMpTH9XP_W59IOagA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-10_06,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 bulkscore=0 malwarescore=0 suspectscore=0
 phishscore=0 spamscore=0 clxscore=1015 priorityscore=1501 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607100219
Received-SPF: pass client-ip=205.220.168.131;
 envelope-from=philmd@oss.qualcomm.com; helo=mx0a-0031df01.pphosted.com
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

On 10/7/26 22:53, Richard Henderson wrote:
> Use the matched breakpoint instead of looping over all.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   target/arm/tcg/debug.c | 11 +----------
>   1 file changed, 1 insertion(+), 10 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>

