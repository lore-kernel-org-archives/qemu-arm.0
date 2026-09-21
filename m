Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70246C982EE
	for <qemu-arm@archiver.kernel.org>; Mon, 21 Sep 2026 14:27:57 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1x8ezX-00018r-Qw; Mon, 21 Sep 2026 10:27:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1x8ezV-00017I-6o
 for qemu-arm@nongnu.org; Mon, 21 Sep 2026 10:27:33 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1x8ezS-0008OO-LX
 for qemu-arm@nongnu.org; Mon, 21 Sep 2026 10:27:32 -0400
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 68LEGPh72404092
 for <qemu-arm@nongnu.org>; Mon, 21 Sep 2026 14:27:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 TBR/3aAB3jDLQPtoXps7XdaJkyXyOzC3O55vwwjgHFQ=; b=FYaqf9tCnB2U+wQ1
 mzQmSXrziMCoQhYkVepj5HqLNv58eL6sRwWJ26szIvyhnx2k9BT8T88eHJD0f9Us
 etlz0Qh5yI2Z2c8S0XfrBdFhsCjL/cKMdOu3gNoGnXg9bBryfPh3yRxK+VUmI8Qp
 SsZgYQEh3m6OeOevbVRBysOLgmOo0xVfC5BDceS0lsyue/1iK0jyaUX7Ed5wvA2i
 vnG8V4MCpLOTVKzkrekRZP0oNE/FzPIyNkXClb0lUwvGiqZTNkdd2ZFTf4TBmq4v
 No3Mjg8eGzZxVPv2QIXoFKUNhj6DY2t8Te+J9fcJYALxabXlCr5hhj3utP4bORq9
 UdwzSg==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com
 [209.85.217.72])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gtt3vau2c-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Mon, 21 Sep 2026 14:27:28 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id
 ada2fe7eead31-78350646d7eso3299917137.1
 for <qemu-arm@nongnu.org>; Mon, 21 Sep 2026 07:27:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1790000847; x=1790605647; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=TBR/3aAB3jDLQPtoXps7XdaJkyXyOzC3O55vwwjgHFQ=;
 b=KsRMF4qUCq/8MId8RIqVjj2Y+ReBfCeK1nxlKEJYq1PKZEhExOZ6pBVc9DsbX6SsRb
 Q/P2RuAERHb8Gs/6tz+Cox9kREPMKx0gq3Gu901T/qMV7NHm/g69yQR2AoIKAbBRnpaD
 2vNSb6PixQLlReKOH6w+ivuF/NKQSnAJx+AgUevNdxz34tHhGumZT5FT5jFiMAo4Ld4f
 z3AhGEQLY3QiJpw3KOJg8ScQgyS8c0idYRQBLPmK3bWPM6NqJ9xpiyAi1VfFCImpxE21
 d3/jy30YEKVVvZriEnaQy7XtojoMYBJzeXt6DbDQBewN7cZLUc0Pdncpw8p06jLcRYtD
 LO4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790000847; x=1790605647;
 h=content-transfer-encoding:content-type:in-reply-to:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=TBR/3aAB3jDLQPtoXps7XdaJkyXyOzC3O55vwwjgHFQ=;
 b=cJvKjXaYB+JI+2jDCKj7wu2lnfbz5oHmBlvdKxemsP343sx4a4p3dSYRELJ/RRqwvH
 +vkPe+nlQmP0m+LOzZ46cnlP2yMSbo9NOhvRX0ysuy7tfcR1t0QW+ub1JS8CC8dJKrR5
 jT/uE3mLxRMhqH98dLwiPyIx3ZmIzem9/U3TJOF+dD4rdWlMwq9sLP8h81XQhxFNfpYl
 m32JLTXPiRr/62RUOlmFcKXGudEICD0BlN6fuiZ8iaeNIbVr7vGZCEJiaKk4J5KhVO9B
 0VsruJcGPFaZ4ad6PHY/FA9fzbM7Uj14IWCEdAIeUtgRD1kTEd1Rx2NjGvrT5eYPtGJo
 4HXA==
X-Forwarded-Encrypted: i=1;
 AKwUvBzYzSXxGgJ0L9GMt/HOTEODbTmdosPynJni6naszscfgr10YpjpaS0AJSWBurgCDRqYNneAGyE/Hw==@nongnu.org
X-Gm-Message-State: AFuF++lXoEHOG6CEQZdQjyZlqVYdG46YqknR7azWpSQD/sCTLn8THaL1
 fulhQA0b7Gb1ryWa8UZTO+jka7QysCdYOXMZOQjAQYfhQp9Dc6CcVEIjhiqdfDJZqRFvsEaIjaL
 wUExUQsmLqPdXEobr3kQOCa7+qRzhXVfJDLgsEb7JMwctz/gfsYTf5hM=
X-Gm-Gg: AYBFou1/eQmmyvbfUor4KRDMcmFje2/Ksz4mJ1uB54vlDr3aKa+jPQ7l9w5WvHp3q3i
 ZzkdKOvaRwL3sSnVUBjAj/frrN6UnptPkOUHBSIbqpzT9QL8lJtc4d11TfguSpstEgZBienSBud
 XgSp+SUcW3JQM20Dk01202m/xmI7x8P8FXaYAdONr2AM7ijiucIw+gU8O83vvsbwBrDcuaYHI5h
 K02vRVIcIY+nLvLoLjGDDKqqY0gEZ8wfxuoKeWdvpWnHb67MYO7KSO0fnuqG03TNxADCyqreyS/
 ngk4aCfd4Z9O1HVijPbJ3aKJVnO5GvhVwX+TXTO7kjQr/PMxkLpcvXH5MTDh+qW/exTdwgdz78z
 i+LU0Lk082x4/uo9YzkKR
X-Received: by 2002:a67:efc3:0:b0:7a1:2076:1d81 with SMTP id
 ada2fe7eead31-7a1eab277c5mr4583625137.21.1790000847530; 
 Mon, 21 Sep 2026 07:27:27 -0700 (PDT)
X-Received: by 2002:a67:efc3:0:b0:7a1:2076:1d81 with SMTP id
 ada2fe7eead31-7a1eab277c5mr4583574137.21.1790000847083; 
 Mon, 21 Sep 2026 07:27:27 -0700 (PDT)
Received: from [192.168.0.4] ([79.127.134.47])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49fc55cd8a8sm290505425e9.0.2026.09.21.07.27.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 21 Sep 2026 07:27:26 -0700 (PDT)
Message-ID: <f0f92012-489f-4bd5-8bf6-af2ba7bb617f@oss.qualcomm.com>
Date: Mon, 21 Sep 2026 16:27:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 19/21] target/mips: convert raise_exception to raise_excp
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
 <20260918004225.827-20-luoyonggang@gmail.com>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
In-Reply-To: <20260918004225.827-20-luoyonggang@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Ytia1IYX c=1 sm=1 tr=0 ts=6ab13ed0 cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=btlkdZlGvBFwkIDmIYSHuA==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=pGLkceISAAAA:8 a=z8PmnMqlZL3EhCF4NzwA:9 a=QEXdDO2ut3YA:10
 a=-aSRE8QhW-JAV6biHavz:22
X-Proofpoint-ORIG-GUID: y8mARRoblh0W0ZsRMfI23Pvc4wMegVz6
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIxMDIxMCBTYWx0ZWRfX9TmyM5uvJD3E
 4FJY2a9j2dKBZgv91NnJcI1WTKBRnOvXtPgfMK5OBTMY4jC1LkBSeH+jMRfQiw4mVvdPtfEvekf
 taB5GIpP6qcS3lv0DdPbt/6a/x7DV1E=
X-Proofpoint-GUID: y8mARRoblh0W0ZsRMfI23Pvc4wMegVz6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIxMDIxMCBTYWx0ZWRfX1lccp+KJUKKq
 LagfLteXuBQz8U2d12xD/QRge5VhHEmMBFHLUZs3//oLGcZ9YXZhUc683J6iEBlJrg+VnbPqh+x
 MOscLCx67IoxC+0p/3MGqqLuRoXbuk9R4LIO9OdkQmS4EshrXGti86XaztBCxB7IR+CSXYdURg7
 RlepvTsKBiHQjxzrR7akZMiBhi7BB3C10XE1tZrJZNpCWY+JnibhjMJ2CiJJIuExqXZtkHPfESO
 SZYeK+al6kblFD9DAx7U1LaM6ET56173vUYHdIn4SUUjThtlkV8mdoV7duvG+GViPr8faSBWPfP
 FnlSdcXUy9TXws8rQx+g54KAdpBfx4tZE4DJ6XNHiM9nGCQg+z0SEEW98giVPFWWwhsievrHhEt
 dtmbHJA4BvCKqmnL5tM7n5N2L7dh8Segc4B2tGYCjd8bzF05vy2E6FwZMPVDhRidCeTFaQSPiEX
 KNm+06Kdv3QyaJIQAnw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-21_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 lowpriorityscore=0 phishscore=0 bulkscore=0
 clxscore=1015 impostorscore=0 malwarescore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609210210
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

On 2026-09-18 2:42, Yonggang Luo wrote:
> Store error_code then call raise_excp, with restore 0 for _err and
> 1 for the 2-arg path. Drop TCG raise_exception, raise_exception_err,
> and unused debug DEF. Prefix leftover TCG wait to mips_wait. Keep C
> do_raise_exception_err via cpu_loop_exit_excp.

Please move "Prefix leftover TCG wait to mips_wait." in a distinct patch.

> 
> Signed-off-by: Yonggang Luo <luoyonggang@gmail.com>
> ---
>   target/mips/helper.h         |  6 +-----
>   target/mips/tcg/exception.c  | 22 ++--------------------
>   target/mips/tcg/fpu_helper.c |  6 +++---
>   target/mips/tcg/translate.c  | 13 +++++++++----
>   4 files changed, 15 insertions(+), 32 deletions(-)


