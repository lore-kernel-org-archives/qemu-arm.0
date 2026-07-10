Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E04B6C44501
	for <qemu-arm@archiver.kernel.org>; Fri, 10 Jul 2026 21:54:55 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wiJBF-0001PQ-6E; Fri, 10 Jul 2026 17:54:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wiJBD-0001C2-9r
 for qemu-arm@nongnu.org; Fri, 10 Jul 2026 17:54:43 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wiJBB-0006o8-QQ
 for qemu-arm@nongnu.org; Fri, 10 Jul 2026 17:54:42 -0400
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 66AKsL4p1947651
 for <qemu-arm@nongnu.org>; Fri, 10 Jul 2026 21:54:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 wZ4ev25mf2yIvDDhyZup3uqowdmI4yCxUrNbot8ExUQ=; b=E8nf5FI9zyI9tVZi
 iWTMns4Yt9A93TRDPvPkOHyikCuD71hcdRNJnMQ4sD5daOt5uB3DxH1BTdBPhc92
 z57cfYK7/Qf3JdNS0qqvIVh/8V14bq++jGJ0kwRTk4+pIO7Y9eKonDXSI+ogV2r6
 h11ebi1D6ykbIo809GY/k18YCMHEeQqYjhg1UX2Ze9pQq+NAuWsTqEjVgjCSGdoM
 sOUkLKA7E1NaB9K7LV5/RPxlwHbzhlAISnDOhkBiU2bHJSdCMtHJo9l04MzN91zI
 xjZisT1JQhsUE0IY2KizasZX8t30YtixrBCjkIhaTObGulLhYeyTQTwTALgUp9XE
 O946mQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fb86eg51k-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Fri, 10 Jul 2026 21:54:30 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id
 d75a77b69052e-51bff5c7035so27826941cf.2
 for <qemu-arm@nongnu.org>; Fri, 10 Jul 2026 14:54:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1783720470; x=1784325270; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=wZ4ev25mf2yIvDDhyZup3uqowdmI4yCxUrNbot8ExUQ=;
 b=RCrb2g8GjKTc5/F/XMtmoHvLYsXkQ4sWifMb1gIo3gw0m0MghlZ9nx8attn7WzSQSg
 H7K6SLr2v5yuzkIwdnW8EDOcqHrLRNYllxQ52mi/4oDdwA186QOfUX9L868vdw3FxiLi
 xTbfY6OokqDf3yAkzX0CMPoEbgmzsfpFpD8/Gh3NhTa4iPkHrgIb/Z2o5Bn6Z/597YRe
 I9R1QU/GQq+pE64tXc16ucSBRn5tLNERiK6XK5p/0a7QC2+jEZ1fjW+HnByVvewP0ybf
 +1ddfmo5RO4HXYyQ530bx6doUVfRkfEYnGnOuY7bYImWNpJGyqqwUYv//IoTGtb+k6B/
 RxvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783720470; x=1784325270;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=wZ4ev25mf2yIvDDhyZup3uqowdmI4yCxUrNbot8ExUQ=;
 b=WJ22TQe8o630PtaUgh4FFoUwsKNDjZauqbSxOYwF3bWwNngoPffTaSu5WevObtulwY
 MZXGF3+ppjA7/u6Aniok+ImLSkQ6KvldDPRA5f/VTZbI7baZ4smHm5JbU5UIW+WGKIy8
 NPECyd0rxBpcwKpkNZWkIT1J5kqLPmld6kLvreMiWZGQZEhnV6Xs9/YeB+GCRXNQ5mwx
 5ndOstRa4H2RUrsi5BkRPXvCUZ/3Pjuh6WrgZv2TPevodS0Rs2ydLjMuiA6BC+8xgzG1
 2xAcQC1vn2tnkPbvnV8sYfpgUZZ3VBhifV9tl6aBM/BIm4kIfE0dfRV/x0KOsw/9p8/3
 84DA==
X-Gm-Message-State: AOJu0YzaJUHl9TPNaPvwFuLwdwWAZ8qBQ8446U0lmpQE7SZ3DppIKZWu
 8plSD8T5aruQ/JuU6kKv4oGUZHWTuqOZaiSpwsbq+r7Refh2NnxkZ1aZL6sBB8OFt1jUzsYwZ/7
 /joiBYm9FiHWfqI+nuHoU3e2Zmu4+B/6va12cxKd+wHTUuvA/8a8rXQSLvrm8bfg=
X-Gm-Gg: AfdE7cmc53dnSLVmu1SZNSy9rXG/Nak0b2LC788ZLTqcs2GK4qzPn1EoLY4Xd+AtOBh
 RW7FRy2hTCZEPaCI3S2/vn29RpFUM34CVs3hSgdrCNEBklU8tnijv79X5Sb0GMudzJmbTZXFyUP
 Y/mjHoect1LjsnhouthHTVmCaHHLsyQ8fAq0M+8KfZX2FJGnUIyVLbSTCE7Zbu07/d3TXfWAP9W
 x1xhzxLAe1+YfYW4uGbuKLAGDfpmmEVckmZ1jfEQlumhcYGCyXoPT+FlKGZ9dwG3uTVoUo+WqJe
 YUo4v/3o1b3GeaFQjVJt2lGCGnC8xZ+90bNYSV2E1qK7AP08o6wevjRzfEqi4oQ/qa3aBMIYliQ
 ol6MND4G7vMQHg3lv50GfQI5HbwQkzF0uciCoV2164F+6prxU8ve4w2C2w71WDA==
X-Received: by 2002:ac8:58d2:0:b0:517:5f04:f24c with SMTP id
 d75a77b69052e-51cbf1ac31dmr7594751cf.39.1783720469936; 
 Fri, 10 Jul 2026 14:54:29 -0700 (PDT)
X-Received: by 2002:ac8:58d2:0:b0:517:5f04:f24c with SMTP id
 d75a77b69052e-51cbf1ac31dmr7594561cf.39.1783720469564; 
 Fri, 10 Jul 2026 14:54:29 -0700 (PDT)
Received: from [192.168.69.219] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-493eb742a49sm159722975e9.12.2026.07.10.14.54.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 10 Jul 2026 14:54:28 -0700 (PDT)
Message-ID: <8630ccc0-5190-444e-bf02-e4da38e3537c@oss.qualcomm.com>
Date: Fri, 10 Jul 2026 23:54:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 20/51] system: Remove cpu_watchpoint_insert error
 return path
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org, jcmvbkbc@gmail.com
References: <20260710205401.836304-1-richard.henderson@linaro.org>
 <20260710205401.836304-21-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
In-Reply-To: <20260710205401.836304-21-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEwMDIyMCBTYWx0ZWRfX3OxJDeXx8mll
 mZr+/oT1UHTOHrHMQ+FSUXuEuKikr5SIKXK4l04guj4Vl/Nd64Deu5AgvT2xA7QEHOVEEb5/5SN
 E4fqBhZBX9kLEuEr3PTn/q4spEOYn+hFL9QOr7pH+xAX4Cnqpkr7kMb6lafaXg3lIZtOYbAi5EV
 BHEfhxdjn2MSMtQKxuRue9CAXpTJzZD7wcCY8KXTDvHY6Ow0AGncpPczy8XkFoUaXd85n9DxKo1
 rob13FhPfyCYouUZ9rqyqnEbWjoYuMgMOft8jUKjt58CtsCIVyRiVs6YwUANtKJkOEOxg5UPJDF
 nQbvd/xK5LjkC3ODTSrxM1RxVj6C/bnseQBUfOv5Zxl9gpq2E9mJqqJb7lmaMxanNYZEeBgtRCZ
 0SOXxveFx5OgW+yARa0JI+YkrJiMfsd5hwE/Key5dP0tn/6GbK7Rkp6fUEGdzAQkoCx6HkEi4m5
 8dMZS4jDN23UO4dtHwA==
X-Proofpoint-ORIG-GUID: maZDLy7t0e57nG4Pg6WsUXr0sITcTjrq
X-Authority-Analysis: v=2.4 cv=IOQyzAvG c=1 sm=1 tr=0 ts=6a516a16 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=pZVW5Mm1fYg_kLs75vEA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEwMDIyMCBTYWx0ZWRfX2mdiV380gNaS
 9ZO7Gaf//YGHbDeLr78hofUa3+NGLvE1MyLck94f+8UwmX3PZqx3HVuCVtN0Ye9amXGVrI8fli4
 BkeQW8LS93mOii9IpHnsZyDG1Fgkau8=
X-Proofpoint-GUID: maZDLy7t0e57nG4Pg6WsUXr0sITcTjrq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-10_06,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 phishscore=0 suspectscore=0 spamscore=0 clxscore=1015
 bulkscore=0 priorityscore=1501 malwarescore=0 adultscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607100220
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

On 10/7/26 22:53, Richard Henderson wrote:
> Move the validation of the address range to tcg_insert_breakpoint,
> which has to deal with gdbstub inputs.  Leave assertions behind
> in cpu_watchpoint_insert, but no error return path.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   accel/tcg/tcg-accel-ops.c | 3 +++
>   system/watchpoint.c       | 9 ++-------
>   2 files changed, 5 insertions(+), 7 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>

