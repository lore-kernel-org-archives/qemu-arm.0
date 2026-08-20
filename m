Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 354F2C5DF81
	for <qemu-arm@archiver.kernel.org>; Thu, 20 Aug 2026 22:26:12 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wxBD6-0007Rm-Es; Thu, 20 Aug 2026 18:26:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@oss.qualcomm.com>)
 id 1wxBD5-0007RV-AT
 for qemu-arm@nongnu.org; Thu, 20 Aug 2026 18:26:07 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@oss.qualcomm.com>)
 id 1wxBD3-0003OM-Qt
 for qemu-arm@nongnu.org; Thu, 20 Aug 2026 18:26:07 -0400
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 67KK7h2l268083
 for <qemu-arm@nongnu.org>; Thu, 20 Aug 2026 22:26:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 SHNxzLlb0bFi4mN7H5Km8ntRe6oiuSklItj9hrI5UyE=; b=ABuRNdCPhNRJT4Ii
 0ip7gjRzJt19zy5JZWKtpXafzfWT1KJPh8N6lSWVAaR3aSU+uAGUvkcRXKNSbgTL
 y0QckDgFRQP39i3kdYOmK/8q22OqNBMj8XXm8AdWe4ZVdWQ3H8GcksWiwbVKYTdL
 5SyRlffXz851nZkD6RHILEkifiP9ajlrf+hjS4GyMuBQVbgiwGDp8iMnUZVu03DG
 wPSg6nLyPm1JINaywxWwjfupwTa94Z+o7h9fk1HV1+4T5SFllj+i4WM/KlrtCX79
 GbU77UzmnOMdeAOMaAOFO5WHAqshIJHv7yjuDZbSZwvtb1oPpL+JaGXIWv0pFxpP
 jAtGjA==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com
 [209.85.215.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g5yg1b7cr-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Thu, 20 Aug 2026 22:26:04 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id
 41be03b00d2f7-cb7d6ba548eso493920a12.1
 for <qemu-arm@nongnu.org>; Thu, 20 Aug 2026 15:26:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1787264763; x=1787869563; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=SHNxzLlb0bFi4mN7H5Km8ntRe6oiuSklItj9hrI5UyE=;
 b=irAzjgLtD+Y67P1OS3yfOG0WMYQ/mP47l9VQWeVt8JGemT5xCZRwy3kFT+dmB5FCsO
 ZqMIFOlXI2Cj6ayAyfuf0EhHtgZL0XfLNMux/R3i3oqlQxBKFYoi89yJxn+4zONtig6K
 65fH6vbh92HgnOO45dSGCN4FgKKFA4VVo5XkAKM7aPVQRv8zlMZ5x0GEeTliDA1qypMf
 tAJInC2uta9tjk3JMqanfE/GlaQ+l4nFXZP9tdzpUyAlYgZzUEybY//ZTXChZqBBb4CZ
 IxPC84kV2XcMvrZeeO+sp0EVVGGYnz/4zlR36GhA0ElY6N4Rr2lSpagu3vR+uIdLxJQw
 Tg0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1787264763; x=1787869563;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=SHNxzLlb0bFi4mN7H5Km8ntRe6oiuSklItj9hrI5UyE=;
 b=qre6yLpKCRcH4rhi/OXuqqnIXinshN7MBmsTf3SWg1kXHTC1pkSC+ZHzEpBnane/IX
 s3/Jpvw7UN+92d31tLAFhmUuYYn+CkLkQJdPQv55vQ/Hocn581uUrmipQ1Esei9ZLblw
 zUMsUpr3yBglsIn7OKWJR/lIxgFlPjkwG1k9t/X8i+8QtupNx0us8qK3FEXwMLIXae7g
 cw1rxedkNrKmQOOApDgKFTErHgy1Pvx33E491WTXEcUHjBjkXz0iN3yRzJIAp12BTz/9
 Qm1aKnt6i3ysi24A78H9XKH7D12dgjRLkqZFHvhMtNgPmY+Ni58I/zgpfg9WOYQRtVhu
 D3ZQ==
X-Forwarded-Encrypted: i=1;
 AHgh+RqrJTIj1rb8NZ3+jb18jb04o92kCj3uJe54ZJXWm/6hZHesDlEvd8FHHjoZ79awV+VrVKYwQKWJNA==@nongnu.org
X-Gm-Message-State: AOJu0Yyo7lLUZRhPCX7fi9jKqn2+iuBgPdiqA1NopYqh3sCleEPFfVcK
 zhhxtpliGfzVkGPZF0IvWo2vLn5/19aziueHneqwnY1T7LS0aCIEtrelWj0pw+pduj/eiuGuNHr
 SM1DmTlduomOB3YDry31SqGO3m2dXvxzEmRDq2QQfxMeqVgVsK54hVy4=
X-Gm-Gg: AR+sD11CjifpQNCFgQzr2sBDrpHZX1jOOxiLBEu0zdOq7TJ9+3cqawHzo6+piOmUxn+
 hnEAFvveQumQ1NXb2ElLeVk5AE24n0/IXJ+yCUWIqspNqqI64P1ec4es3YkWranjUZFKo3HwPE6
 xOS6SFnnKXxUx1kV1qoFEGIOsZLkV+kU2x1MfxrezHTilMXEUqJWUuKQTDqWGQILIAvMFlD441M
 tkjRPkefXLoKV2ieDWVLmBu8LJRMvxyj8FliQT5F7L5rZ/9ANNAMYO3N2Yvv47F57huRq8QYAUE
 Tqrqg7zkQ1B4bPY3c/xUxevJDX6TlGgVyDody+3+76J5fVbieilKsTdpPvzOtxLbOBeeliHeDEq
 4bw5bmxd4mJ7ao21+P3iSVzj1bLCnZ+mgcSQlOd7Af76stokclZuNs36qLzRkuoGp81bQ
X-Received: by 2002:a05:6a21:1788:b0:3c3:9993:d5c3 with SMTP id
 adf61e73a8af0-3cd3008be95mr3361297637.9.1787264763478; 
 Thu, 20 Aug 2026 15:26:03 -0700 (PDT)
X-Received: by 2002:a05:6a21:1788:b0:3c3:9993:d5c3 with SMTP id
 adf61e73a8af0-3cd3008be95mr3361227637.9.1787264763036; 
 Thu, 20 Aug 2026 15:26:03 -0700 (PDT)
Received: from [192.168.1.199] (216-71-219-44.dyn.novuscom.net.
 [216.71.219.44]) by smtp.gmail.com with ESMTPSA id
 a92af1059eb24-1416ae1416dsm26679783c88.11.2026.08.20.15.26.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 20 Aug 2026 15:26:02 -0700 (PDT)
Message-ID: <11084bd6-361a-4696-bcba-572aa3020107@oss.qualcomm.com>
Date: Thu, 20 Aug 2026 15:26:02 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC v5 11/28] hw/arm/smmu-common: Implement secure state
 handling in ptw
To: Tao Tang <tangtao1634@phytium.com.cn>, Eric Auger <eric.auger@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 Chen Baozi <chenbaozi@phytium.com.cn>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@mailo.com>,
 Mostafa Saleh <smostafa@google.com>,
 Chao Liu <chao.liu@processmission.com>,
 Jim MacArthur <jim.macarthur@linaro.org>
References: <20260813161515.2788900-1-tangtao1634@phytium.com.cn>
 <20260813162512.2807281-1-tangtao1634@phytium.com.cn>
From: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260813162512.2807281-1-tangtao1634@phytium.com.cn>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: kaDHVIIQjn2B-QRXyncS7TXO_DKWcPcr
X-Authority-Analysis: v=2.4 cv=G7Is1dk5 c=1 sm=1 tr=0 ts=6a877efc cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=iLqgmErQAxjCjdq5jj1Aqg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=fgrLqfBXAAAA:8 a=EUspDBNiAAAA:8 a=_zrsuuM1xf9QxEgsPNkA:9 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22 a=_Ge82aPy-h_wFa7gWU4u:22
X-Proofpoint-GUID: kaDHVIIQjn2B-QRXyncS7TXO_DKWcPcr
X-Proofpoint-Spam-Info: AW1haW4tMjYwODIwMDE2NiBTYWx0ZWRfX+8OKAVYl/MVa
 9bHMK726dZNf0xe3xugZ1n/QndjcsB4rDEuvPOZthQXcUWKcVX7WSq1BM4gR4sDmK4sXlbV5Ujb
 iF7Mw8Z04cUCg+GWu6N0U2N2P4E7h24=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODIwMDE2NiBTYWx0ZWRfXywY3qu7IwjSx
 BJvxLRUaGLFCmdi1C3I9dZuhAO12Daby/cqZ92tt1/xjsqbnWqJnJAfYLXDG70UrbqQRGq6ypzV
 7WvvbV+WY4+vXGTx3pFtmieCe/H55A032DD1d/+32RbnZClIZwvzzc0WPkPQXfjh0skCew1UsS4
 1zHjKQhdFADZPL7joXO2txUvkIny9fI+d20Dg5mARL3dVhdAjytesdqGfrZyT9oEQmmiLlBKgZ3
 Ufan/mX/pe19IaJWtOoJkco/VebWKC34ONAmMGdOehX0oVYjE4oupyd3S0KSuApgTqQbsORYdjI
 RxTHLeUhDLxhPa9vjGH0O6oy18VyRwn0RPYhjIBn9UIZe3wQz6HtizJSORxOZSZFJGkSNMhNDUU
 7Y6FsJ26rKo4C/APsGQxUyD/pDJ+9kfxqtvRJ+POrdsmXpCT+a3jOb3XtYIiO4RlqUO2s6pAUCq
 0VqO80+LFfB+eZg8Mkg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-20_02,2026-08-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 clxscore=1015 phishscore=0 bulkscore=0
 lowpriorityscore=0 priorityscore=1501 adultscore=0 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608200166
Received-SPF: pass client-ip=205.220.180.131;
 envelope-from=pierrick.bouvier@oss.qualcomm.com;
 helo=mx0b-0031df01.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=0.001, SPF_HELO_NONE=0.001,
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

On 8/13/2026 9:25 AM, Tao Tang wrote:
> Enhance the page table walker to correctly handle secure and non-secure
> memory accesses. This change introduces logic to select the appropriate
> address space and enforce architectural security policies during walks.
> 
> The page table walker now correctly processes Secure Stage 1
> translations. Key changes include:
> 
> - The get_pte() function now uses the effective security state to fetch
> page-table entries from either the Secure or Non-secure address space,
> with explicit transaction attributes matching that address space.
> 
> - The stage 1 walker tracks the security state, respecting the NSCFG
> and NSTable attributes. It correctly handles the hierarchical security
> model: if a table descriptor in a secure walk has NSTable=1, all
> subsequent lookups for that walk are forced into the Non-secure space.
> This is a one-way transition, as specified by the architecture.
> 
> - The final TLB entry is tagged with the correct output address space,
> ensuring proper memory isolation.
> 
> Note: We do not yet support secure stage 2 translations. This patch
> only implements Secure stage 1 page-table walks. Baseline propagation
> of the incoming NS attribute for stage 1 bypass is handled separately
> in this series with ATTR_PERMS_OVR == 0. Full ATTR_PERMS_OVR support
> is left for a separate series.
> 
> Signed-off-by: Tao Tang <tangtao1634@phytium.com.cn>
> ---
>  hw/arm/smmu-common.c         | 73 +++++++++++++++++++++++++++++-------
>  hw/arm/smmuv3.c              | 19 ++++++----
>  include/hw/arm/smmu-common.h |  7 ++--
>  3 files changed, 74 insertions(+), 25 deletions(-)
> 

Reviewed-by: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>

