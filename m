Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D94B1C982E6
	for <qemu-arm@archiver.kernel.org>; Mon, 21 Sep 2026 14:25:13 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1x8ex6-0000EH-BU; Mon, 21 Sep 2026 10:25:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1x8ex0-0000Ca-1W
 for qemu-arm@nongnu.org; Mon, 21 Sep 2026 10:24:59 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1x8ewy-0007tS-4L
 for qemu-arm@nongnu.org; Mon, 21 Sep 2026 10:24:57 -0400
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 68LEGbVh763700
 for <qemu-arm@nongnu.org>; Mon, 21 Sep 2026 14:24:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 XoPvg2yEeFXmNBFeOzRQWOTDNF1FsxrfXRp8z7hWwBI=; b=dx3wpFTgZy6/Z0Ug
 Pmh7BF6p3n7H7luF3/okn8D4mQY/XbyuDKwHZETdV9ckGpGVm74Prz++3kdj+eAl
 IchQN+X18O5VQ2TeMM6x6lj9DuVi6Ht3OAzloKPEFPvguEBpplQdJNCrVTBhhiEP
 njna/nrNc54ozs96OauzihIW9Nvv+epT/vG02WBCcPZfpb0T6WzmoLihb9uw7kG3
 7YMjFzXbeNdCopWQm8cZEo6wLdc82wMyzFVSHf/l2Md7E/WMC7y37zcynT1f+zch
 onR7472rc+hBBdYiatpPl5+tT4YA8NM+I8TN+Y6dN+dV4TXS9JXWMsj2azPKIhHz
 p+5Z4w==
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com
 [209.85.221.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gu0rj1hda-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Mon, 21 Sep 2026 14:24:54 +0000 (GMT)
Received: by mail-vk1-f198.google.com with SMTP id
 71dfb90a1353d-5c82c79466cso3950767e0c.2
 for <qemu-arm@nongnu.org>; Mon, 21 Sep 2026 07:24:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1790000693; x=1790605493; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=XoPvg2yEeFXmNBFeOzRQWOTDNF1FsxrfXRp8z7hWwBI=;
 b=EJ3+tTfRXxyZsFrF3ZHWyGOZHYXCj/MyG5Cg9uZm1o80QyzgdIqwIDSV/b///1u0RL
 gwTl2+C2p3SoJsZpLyfI4W8epGDAQ8p2uuZhlNQg+xcCaCHpp2++tdEvKcMTkpg5PgZ1
 NGorfvc+Cum4U35ASuHRZyKqFXa9pj9rT9SG7ylJNoN8hq3czpQ9bDNhzgGoA09vI191
 WpYAkfKOm/vzzIMY92pjGMVT3e3xo6QalYbdPXCj5euCMn7EznKdMWa0yFwx5QeF929P
 CWl+tPJhMzby5JfXMO6wp3bqY+UDC+LJuqXVtS7zCTVUDzNB/ckDfW1Y1NXjo0wPzhlg
 vVPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790000693; x=1790605493;
 h=content-transfer-encoding:content-type:in-reply-to:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=XoPvg2yEeFXmNBFeOzRQWOTDNF1FsxrfXRp8z7hWwBI=;
 b=R/kDTtgp5OdRRUCJBfB3IzC/zo01qZY+QDao7s4QDKObQv0rHPEki3/YMNO75a9kgA
 3wjvCPAbwmKWqd7H5r5qJ/0w3qjW8c6+ayqwO02SFtlDFhQFVI/iD63hpPbMRIOdLp+e
 UlDFGsMP5JZEs9KDzBHxWmOn35dLbyBCg4GX36lobeP/Ujq/Rvw9ngafHxgB0EzcUZ8r
 X5gskUL/Fm2WQPs+1Y3PHA7SMDleuXicFgc1bdY7YtxlQdunTQVXGNTYvxRPP5dqPbRP
 s9IMVOS/5TUR2zBVoKnzzo4BFBV+z+Naf9GmRKDFBdy7fq6uq/0tj5PxOqAX5AvieLcu
 xrJQ==
X-Forwarded-Encrypted: i=1;
 AKwUvBy++GUXjO4V6jck3D+UG2B3fkNhN3y+s3ZUtL0MNkw/85jJT4VUP+Hr9c0bHipGhen34pOzy50ShA==@nongnu.org
X-Gm-Message-State: AFuF++ngTQ/4QhGQ/vU6DRF401xdRn0a17L92iFgV7uV1XSre59Kmpya
 L/xuRRmD4j6fPdS23rO3OVv4L/nkLVQvu2GpKSnfDlI4Qi6Pstn1WCMmWwbSXKHTlKtGsOlgySf
 X/0P3ZV6smkKueWcZcesJT2IAemmb4M8pADbOHy5Z14J5pDtOBLi8QeI=
X-Gm-Gg: AYBFou1Xy5IbGNQpeC263RJ6C2fUNnhO9qAKCKLs0QaZIrOi2bCwXxD55MLWUkOy+e1
 wxfLQLbt6XRPggLZrrurtnzUw3WivylUDt2TmEQe769p7lYg8f6KQqcjdaHvWO55SiXgtDsDZNf
 eqRL8tiv+QREe82HM+pKoIBGgpxnIf+yASK1hVblCpixZb4/QwbV4/hbLW/8wA1PKbeLiI9BouI
 23LygcTDm7Dgw8PNbzJ3N/+Rfecz464/TlK+sgSX8mvwyp22Wespd4sFIV5wMKfhVyPV9j/G4Ft
 fXEnUDr8bTkcqS82I3Ijh+X6RJZ2KM1rw7kmKh5Um1ctLW/6k5wfU+V2srzBcQIdSEM1jSwOQOk
 PILALYpeX7TQ6raGauUw=
X-Received: by 2002:a05:6122:4896:b0:5c9:a60c:273d with SMTP id
 71dfb90a1353d-5c9b59eaf2bmr5873497e0c.21.1790000693548; 
 Mon, 21 Sep 2026 07:24:53 -0700 (PDT)
X-Received: by 2002:a05:6122:4896:b0:5c9:a60c:273d with SMTP id
 71dfb90a1353d-5c9b59eaf2bmr5873430e0c.21.1790000692931; 
 Mon, 21 Sep 2026 07:24:52 -0700 (PDT)
Received: from [192.168.0.4] ([79.127.134.47])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48724422790sm22171483f8f.5.2026.09.21.07.24.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 21 Sep 2026 07:24:52 -0700 (PDT)
Message-ID: <c318456e-dd21-4222-9755-f5077d3f093f@oss.qualcomm.com>
Date: Mon, 21 Sep 2026 16:24:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 15/21] target/xtensa: convert exception to raise_excp
To: Yonggang Luo <luoyonggang@gmail.com>, qemu-devel@nongnu.org
Cc: Xianglai Li <lixianglai@loongson.cn>, qemu-s390x@nongnu.org,
 David Hildenbrand <david@kernel.org>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-ppc@nongnu.org,
 Laurent Vivier <laurent@vivier.eu>, Yoshinori Sato
 <yoshinori.sato@nifty.com>, Nicholas Piggin <npiggin@gmail.com>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Stafford Horne <shorne@gmail.com>, Weiwei Li <liwei1518@gmail.com>,
 Cornelia Huck <cohuck@redhat.com>,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Chinmay Rath <rathc@linux.ibm.com>,
 Harsh Prateek Bora <harshpb@linux.ibm.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Aleksandar Rikalo <arikalo@gmail.com>,
 Brian Cain <brian.cain@oss.qualcomm.com>,
 Artyom Tarasenko <atar4qemu@gmail.com>,
 Max Filippov <jcmvbkbc@gmail.com>, Eric Farman <farman@linux.ibm.com>,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 Michael Rolnik <mrolnik@gmail.com>,
 Aurelien Jarno <aurelien@aurel32.net>, qemu-arm@nongnu.org,
 Bibo Mao <maobibo@loongson.cn>, Chao Liu <chao.liu@processmission.com>,
 Ilya Leoshkevich <iii@linux.ibm.com>, Helge Deller <deller@gmx.de>,
 Glenn Miles <milesg@linux.ibm.com>, Zhao Liu <zhao1.liu@intel.com>,
 Philippe Mathieu-Daude <philmd@mailo.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Paolo Bonzini <pbonzini@redhat.com>, Peter Maydell
 <peter.maydell@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, qemu-riscv@nongnu.org,
 Song Gao <17746591750@163.com>, Matthew Rosato <mjrosato@linux.ibm.com>
References: <20260918004225.827-1-luoyonggang@gmail.com>
 <20260918004225.827-16-luoyonggang@gmail.com>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
In-Reply-To: <20260918004225.827-16-luoyonggang@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIxMDIxMCBTYWx0ZWRfXyJu2MDVNsZC1
 f6cl1Kc0WjxfsRrKU1QBufmsNeySVwD2BMkRhNfVQaDoTWTE3oW7Qdlm0SKr85nYiZqgZZ+nWvi
 8ow45QRwsR0Zbjh7/NarlRyAXhp8KuE=
X-Authority-Analysis: v=2.4 cv=AsR7T+9P c=1 sm=1 tr=0 ts=6ab13e36 cx=c_pps
 a=1Os3MKEOqt8YzSjcPV0cFA==:117 a=btlkdZlGvBFwkIDmIYSHuA==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=pGLkceISAAAA:8 a=VZLprSz9q8ouOpHkf1EA:9 a=QEXdDO2ut3YA:10
 a=hhpmQAJR8DioWGSBphRh:22
X-Proofpoint-GUID: 8E5oP_kG12edeUmJ4ntl5uaabbA_iYUF
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIxMDIxMCBTYWx0ZWRfX1JLhHVXqvtO2
 u4KhhXlaWA4Q/dp9IZt/1OVsyUyjguvLsy1QhSkMfFPr8TmPekGkBx8ozrH7QGVDmce7HrEob+U
 7y0xIHdTlqRGdx8lig5I4dLFndi715RPszcCAAcFMjelIMlz3JzvkYUEo6OnpNHKh/cFTCtxJri
 p0f0vWJSRbp37c0jfB7W3UrED4H/8Zx7xICfQ/QxzxblNQ2ZtfmE/oIFi1URncOY8mbycmsp3Uo
 rp9msfmydD5gy2Fd0QSEdREqEqV2wiawZvsvXVfKw4hiaMVIjCCNE9nkvriuWIOSxKoomgtzywJ
 dfN6/TjUavnCNB9NvgV6RgHsmwmWr48WVbtewmHWAWmeAtqHIWbQn2x9+cJI32xCpO6G+07BHdY
 jy2uo41HDdLd96BrRoUWRVKxcyJtE/+cESaZkf2x1UkNTchefT9D/NHiioyDZw4+9bXe9YacyW5
 y/d4gjTP1U7KOC1E8Zg==
X-Proofpoint-ORIG-GUID: 8E5oP_kG12edeUmJ4ntl5uaabbA_iYUF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-21_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 malwarescore=0 suspectscore=0 clxscore=1015
 impostorscore=0 adultscore=0 lowpriorityscore=0 phishscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609210210
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

On 2026-09-18 2:42, Yonggang Luo wrote:
> Store yield_needed = 0 when raising YIELD, then call
> gen_helper_raise_excp with restore 0. Drop TCG exception. Keep
> exception_cause helpers. C callers use xtensa_exception for the
> old helper_exception body.
> 
> Signed-off-by: Yonggang Luo <luoyonggang@gmail.com>
> ---
>   target/xtensa/cpu.h        |  1 +
>   target/xtensa/exc_helper.c | 13 +++++--------
>   target/xtensa/helper.h     |  1 -
>   target/xtensa/translate.c  |  7 ++++++-
>   target/xtensa/win_helper.c | 12 ++++++------
>   5 files changed, 18 insertions(+), 16 deletions(-)


> diff --git a/target/xtensa/translate.c b/target/xtensa/translate.c
> index 175fd4b5cfc..58fbe8496aa 100644
> --- a/target/xtensa/translate.c
> +++ b/target/xtensa/translate.c
> @@ -305,7 +305,12 @@ static void gen_left_shift_sar(DisasContext *dc, TCGv_i32 sa)
>   
>   static void gen_exception(DisasContext *dc, int excp)
>   {
> -    gen_helper_exception(tcg_env, tcg_constant_i32(excp));
> +    if (excp == EXCP_YIELD) {
> +        tcg_gen_st_i32(tcg_constant_i32(0), tcg_env,
> +                       offsetof(CPUXtensaState, yield_needed));

This is the single call, rename as gen_yield() dropping the if
in a preliminary patch? Otherwise patch LGTM.

> +    }
> +    gen_helper_raise_excp(tcg_env, tcg_constant_i32(excp),
> +                         tcg_constant_i32(0));
>   }

