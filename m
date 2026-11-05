Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FCE8606EA61
	for <qemu-arm@archiver.kernel.org>; Thu,  5 Nov 2026 19:43:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=HOTTu2Wl;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=GfG+plk/
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xP3NF-0004rh-Nx; Thu, 05 Nov 2026 14:43:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@oss.qualcomm.com>)
 id 1xP3N7-0004o0-6Z
 for qemu-arm@nongnu.org; Thu, 05 Nov 2026 14:43:42 -0500
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@oss.qualcomm.com>)
 id 1xP3N5-0000YA-0j
 for qemu-arm@nongnu.org; Thu, 05 Nov 2026 14:43:40 -0500
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6A5HeNqF924173
 for <qemu-arm@nongnu.org>; Thu, 5 Nov 2026 19:43:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 Hila3885CZM6NsBVhbfHwWG5rcPPwzZn/wBsnZSxIS4=; b=HOTTu2WlBVm5V1a2
 ZTV13lTosDZpfk+VcKcCzr6il3EpLMQMb0BKgb4a+5uo/gyPWGSbnS1NYx/A3sl0
 vwo1PTo0bV1LG3iAmK1h6u5cpgkbywCaafxteP6Gvsvx+iecBSrL51qJ4pu0WQRr
 5V5/n/5sjRx7Sp6w5hPwUcYth2u1/Hu8aniK90lJj86VPjApJNhpU+xKElVPQzWR
 PdiII6+92Zqh4imetvbZPQGiggZDIzz2wYuwzItjrAKudIzqlij0GyRu0HUk50Oq
 v/YOQCdYPweIdFOFAvZL13+QqYbTVgZe1XwLR6O59ACrNLCsFpuJIDg19R1yp9ZB
 BS6n8g==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com
 [74.125.82.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hrqhkthwr-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Thu, 05 Nov 2026 19:43:37 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id
 5a478bee46e88-351788121cfso4246602eec.0
 for <qemu-arm@nongnu.org>; Thu, 05 Nov 2026 11:43:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1793907817; x=1794512617; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=Hila3885CZM6NsBVhbfHwWG5rcPPwzZn/wBsnZSxIS4=;
 b=GfG+plk/5gCiXPJNLI+6oPLEMQj5dkVbIF0dd7H3nIA3mwIuuAXyC9svQTqq2ePwfA
 FXVm3YYm5FuGhPWG0Ak+yE2Z8assHWGhK2H2duvWfBB7P8yRCsw5hJH+c7Ok4goBDfmk
 WWCWF1HIU2tvQpz3Hb0g9pltXPK9NcoWJCqZFBV0Rj069xIsa1BHDCDDHH2azBRpZhWE
 iC1n/igbYaqlRs3gV7tAAWf6qIlU3QuVTN7BOyidsQ61e2JpaedF3BAqd17xJUga7Y2U
 6w1JXyEuyZOLnrNgPStkO5tVWgWvZp6Bac2DVW/kzxfc6Ux31frtV3iUAUFLbIGZuV0D
 T9xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793907817; x=1794512617;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=Hila3885CZM6NsBVhbfHwWG5rcPPwzZn/wBsnZSxIS4=;
 b=Dq8QAUHc6iDOe11n7MGRQ3eSJAWwdPzRLuiqr8SUrbJXIux+ejpCiuQ7zEZUlTN+z7
 sc1CCJTlfgJA03+613jCAsdh6CxABE5hhvlUBx88NjrCrklGRGl0G+NsugoMiaiBC8+6
 q1Qng3B72W+SELIjZE/vkeSqsnJDhnLQ2y3a4IgXhqX7ebKXeeA8GrTwc5n2724fiQGu
 P6QZY9gEaU+pPt60/9gPe6F9wkq46YDhktM9nAuKBdBquFjBULUzx5U69poCIughOgxP
 THmRIrKqOamsW/DZ3MfaTEburuTD1TGtLV62+i4Zwr7pQzfvuMqr4mPyLwVGeezECD2u
 7JLw==
X-Forwarded-Encrypted: i=1;
 AKwUvBxOtOf+BvN8jvogxNPzuNrc+iu+DVR1M/uheKm5BrhAdU+GmZGUXczkfVUfn9vvgTB1TxEJcD5zPA==@nongnu.org
X-Gm-Message-State: APuU4Z8kX5LWbmLY9A6pUUH8XBqb8hpye0I7JMQuEv/1truuZZKRGn75
 3H+VKGyKa53Pl2V9chRPPHRo4aBZkgOw7aku8AwR7vJRdYVBXOn2K528r594ojbODKBvWFL2jv+
 6jsxiYmjwVVDQgc2k1pc6RmDAyj0+cHxo0FxdexW/vjzjLW3jZ8hj3mE=
X-Gm-Gg: AYBFou0hgUK5X3xgt+Yu+fXyF3vs3VQoYYb2iMcwFHT/OQK8SLmQrv+LsFIG5MbNDd3
 /Om0R/OqYDIFlLUnhNb+AHXuFsuxXImOusOfslejhHT5sL0q7Y/LLyMOsj3xB34Y6HclgYc7aI6
 wzmfUloUWX3mGD6zVOX+4lfxk2FKIoqeSeNeCT8C0zwyYSF/r0pIskU9DC5jI6OYD9TCL1SWWdd
 Dtj3GKvH1JDZBxkM/B4H4OAXk5imjin7Lvlul2rt5an2bxfCNeomUAyyq8IGa/C079zF93VtBA4
 JgONOW4enKHZ2loL+U/tcFSqOeEgcikMB73GGEWw6Ebz2VJN4S1yljMg3Yw8/nw1ZwDjnECsN1S
 3gqM6pNC1TNlktj4GgnWBQKSsxcHrwEkGVzIEwDe2oAQPPVT4phPdBkUvOuWDW2Bvbt/SzPxGbP
 nkOZgpzDYwI8g3jx1JO09xI5DhK2Xbgf7EMnH4iCGhIw==
X-Received: by 2002:a05:7301:4e44:b0:366:dbf9:32bd with SMTP id
 5a478bee46e88-36f76023af6mr151216eec.9.1793907816491; 
 Thu, 05 Nov 2026 11:43:36 -0800 (PST)
X-Received: by 2002:a05:7301:4e44:b0:366:dbf9:32bd with SMTP id
 5a478bee46e88-36f76023af6mr151163eec.9.1793907815983; 
 Thu, 05 Nov 2026 11:43:35 -0800 (PST)
Received: from [192.168.1.199] (192-80-163-190.dyn.novuscom.net.
 [192.80.163.190]) by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-36f722ed274sm329297eec.18.2026.11.05.11.43.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 05 Nov 2026 11:43:35 -0800 (PST)
Message-ID: <4cef2c5a-9b5b-4793-9af3-106a5d65cc5e@oss.qualcomm.com>
Date: Thu, 5 Nov 2026 11:43:32 -0800
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/3] Revert "target/riscv/kvm: restrict
 kvm-accel-riscv-cpu to riscv targets"
To: Yonggang Luo <luoyonggang@gmail.com>, qemu-devel@nongnu.org
Cc: Chao Liu <chao.liu@processmission.com>,
 Peter Maydell <peter.maydell@linaro.org>, Weiwei Li <liwei1518@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Alistair Francis <alistair.francis@wdc.com>,
 Harsh Prateek Bora <harshpb@linux.ibm.com>,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 qemu-arm@nongnu.org, qemu-riscv@nongnu.org,
 Glenn Miles <milesg@linux.ibm.com>, Zhao Liu <zhao1.liu@intel.com>,
 Chinmay Rath <rathc@linux.ibm.com>, Philippe Mathieu-Daude
 <philmd@mailo.com>, =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?=
 <philmd@oss.qualcomm.com>,
 qemu-ppc@nongnu.org, Palmer Dabbelt <palmer@dabbelt.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Nicholas Piggin <npiggin@gmail.com>
References: <20261105183310.1614-1-luoyonggang@gmail.com>
 <20261105183310.1614-3-luoyonggang@gmail.com>
From: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20261105183310.1614-3-luoyonggang@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA1MDA3OCBTYWx0ZWRfX9P28wQXjvbxP
 27iUh22Vuv3lPVMhfk4TLQcxWEgydWGfnYP3bfUFJOJWu2gcm6fXDlIPqf6xKKAuDnYilNRJWcn
 JXlclm0vbHvbkA75rU1dYjGfPCD6kmFPgf8ZCJ2oe+yaDYeU4z/v5VQXm250LkQCaa14GmnrWBi
 UK2POy6pq7/XyFbj3dE8PAwlegf95xn+ki0fH7LLA8GKPrg1wNh8/f3FOuG/vK8jCVIZRjTQAJX
 GMPIRjBRAOh9MUd0zKGHwrYk/Gf7l2jsytU9vgJE6Kz/IDiY53+2wx29Y3RYEIjic/x8R5qtOiX
 x9CeVvPvIFxVLWIWcxGVD7vpWBU/3qPmGKYy91v84KFxzGnmjkZGgPNw6kE81QZmLJUqd3+GW5q
 PTJIH++C/D5cjYFEdyDN1ATRchYYt1nPjCgNfSnWikgKTHBbHw8dAq88mrMwpad8Yx9ZZuyUqws
 D3l/vEWNJwujRaUDy5A==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA1MDA3OCBTYWx0ZWRfX9+jAsEhtc7dW
 i0jxIeL4jXogSJNKVSGaKPLeyX8ml1XrXtvduEm32fQ4etSxUutvfXHJJzLHl2sSlOZWkysRwhn
 SQ1TD9QqD0IHytQzL2jN6DRnBvy+mB0=
X-Proofpoint-ORIG-GUID: rwkx7jwgld2JrexI5LpRduaoO-Q7WXyy
X-Authority-Analysis: v=2.4 cv=a4+lZkSF c=1 sm=1 tr=0 ts=6aecdc69 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=9852oil1ID9t5xBSyQ/BEA==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=6iAvmC-XfobcVWHkfosA:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-GUID: rwkx7jwgld2JrexI5LpRduaoO-Q7WXyy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-05_05,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 lowpriorityscore=0 impostorscore=0
 phishscore=0 spamscore=0 suspectscore=0 adultscore=0 clxscore=1015
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611050078
Received-SPF: pass client-ip=205.220.168.131;
 envelope-from=pierrick.bouvier@oss.qualcomm.com;
 helo=mx0a-0031df01.pphosted.com
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
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 11/5/2026 10:33 AM, Yonggang Luo wrote:
> This is redundant now as all accel-$cpu_type parent is already registered.
> 
> This reverts commit 2d3e6b4003d5380c245ce8ffac4b8866f6d10a33.
> 
> Signed-off-by: Yonggang Luo <luoyonggang@gmail.com>
> ---
>  target/riscv/kvm/kvm-cpu.c | 2 --
>  1 file changed, 2 deletions(-)
> 

Reviewed-by: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>

