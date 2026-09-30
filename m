Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE956CA5FC1
	for <qemu-arm@archiver.kernel.org>; Wed, 30 Sep 2026 07:41:52 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xBowj-0003j6-7W; Wed, 30 Sep 2026 03:41:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1xBowg-0003VC-Uh
 for qemu-arm@nongnu.org; Wed, 30 Sep 2026 03:41:42 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1xBowf-0004NV-EH
 for qemu-arm@nongnu.org; Wed, 30 Sep 2026 03:41:42 -0400
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 68U7dW8q3489199
 for <qemu-arm@nongnu.org>; Wed, 30 Sep 2026 07:41:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 vt2nGbim/dxalLzeYStevZ+hPIUHTg2POhDwLA4wDro=; b=DiXq4+0+GW2OoOhO
 6219YjXKGl1H5/sxNzvIvmymmbvbniE4Q6LdlX0lU/bl9YXA2J4vlAyr0cpWcMKv
 RgzzTXTEYT6LpIChrBRo6driiBiGmsWpjCZlqASYtatJ2HN3+527f08zfIn4X+Fh
 wFDgoFV8wTHNt7M7GFxo/UBq2Ea1sscLeLIvzSSTh9loCwzOj8Chb0CrxAAJP9CE
 rxu/zNzPwXfyOrAD09Ai+6lhV/QKKg16wGuOghFFWtTpg8oZ145CiWo1llAsuIuV
 SIj3YqaJTqQZG1m2Rv1Mhty/pFf2f/N5jhUZ1kQsXMnyHLj7wg9qAkIE0UudutvQ
 6TCS2Q==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h0j97u18t-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Wed, 30 Sep 2026 07:41:40 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id
 af79cd13be357-93cab33cb20so27122385a.2
 for <qemu-arm@nongnu.org>; Wed, 30 Sep 2026 00:41:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1790754100; x=1791358900; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=vt2nGbim/dxalLzeYStevZ+hPIUHTg2POhDwLA4wDro=;
 b=adiHLgXkGMME+bA2yGzyaUCm09NZTYUGhp/bjgS6T0NLCDK3ewEw47QnRj/lkMEB36
 53E5p7znVydHQSv2B1rBGK4VM4JVcKsTpmDNfXyUGUzNnk3VuwQ7D82qn+r0xiG64fl0
 Zh+EFhsSOEfEpO81KOoR7b+aRE4ZWy18c7SEj5654faet1aWlNJT/gJozCZBZTnPMOSv
 0DWNS/H7+PuXrgbjkKf1h1g2iWbVD7C547K6vkKyoC+/yfqGHQPuU0d9dIJQuXpWSIPo
 l/2Dt+6T/nwzAfvPdEQcsZTETzfK5iP5fa5zIjIOfsZ4kj67BdnZYEI86Ie/8JWQiNG2
 MEKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790754100; x=1791358900;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=vt2nGbim/dxalLzeYStevZ+hPIUHTg2POhDwLA4wDro=;
 b=1ssa0Q+5zkanjkaKCYNsQYekUY/TwZgsYBIcdydv2uaS7qUvyDH5z9i/W2D8tgwNZZ
 yj6jfEEJMEQWYkexQZSQpRh8JXb9YY2PzJw/YuQA59BKczLh5QNBVlWqW3Gzy/a56qka
 caJjngU8YqqYPknqYw+CzthGdKMu4YzQycBkSvZHr7+FdMPONUixcUZ6/Fq/PPAZW0ho
 TwSENYdeaR5/9fTwjN0l4U9o6ele0NyGT2UInwDcdOiFjFmO9w+moKkHuQyhglHKX6+h
 bCc+4bkGmsAe9he/F0LmQ83M67KupxtNqszV6bW1B6/K3SiBN8h23OAL/iK+OIhpe/YF
 U7CA==
X-Forwarded-Encrypted: i=1;
 AKwUvBxC5LiB7jRnONf773ZlVdyjK8lM9LIvq/GBugpzFyXlbGOF3YcywfIBWrsVLQ/Gi/J3Hkde/PQ0vA==@nongnu.org
X-Gm-Message-State: AFuF++lFMnM40E3mHY96a98D/xh50plNvSDVfhurV4BDZwOW8kXiMJqs
 GeRm6MLxAN1ZN7Y2XirfrprqgBQl4h9x/jg2xPHidMwh55kFjinoOjkZFSMtNJmktMqyQbSu4Ur
 x4XtdaT3s3vi8xnesSxEow/HZH8BknuSlIj+DvVNg5K33gpBWwLBRAkA=
X-Gm-Gg: AYBFou1a+DMicTQSsq9VbzHiv7MFUEp2VM1yRp7Fak6Kb7pYZc1s8e+u2f0qKprv3F1
 46S2fqYfXgxPMH9rr6U+o7PYUSAVUrXpzdOvsQUzKJJ/6lXhhuOi2Aodnaim+fQSCNRsVeBkCtS
 un3+47yqh8n0XyoczI+8x03Rp3SEUd38nqCRomFuLM1RBOqCRssqJHniS3ZYFfAW4jtqQq+UPq6
 AE8XYmSAydvgpnjLk7F2Scsdt3A7120dAUzkuwu7oCDdfJmi2r2QG2+2f/7nHXjOvpNjRcDBEMx
 qM8KPeYTzpLLs9XwubuV4Gs+QOTcOID2mBbsDpFGtQTD0iELDYMpQ/Q5szmqCEyYjS8foLUe7bI
 GCx66+2vGdO0nrV0WtmM=
X-Received: by 2002:a05:620a:4110:b0:93c:6c6e:1776 with SMTP id
 af79cd13be357-93ca96be79cmr77701585a.11.1790754099704; 
 Wed, 30 Sep 2026 00:41:39 -0700 (PDT)
X-Received: by 2002:a05:620a:4110:b0:93c:6c6e:1776 with SMTP id
 af79cd13be357-93ca96be79cmr77699285a.11.1790754099278; 
 Wed, 30 Sep 2026 00:41:39 -0700 (PDT)
Received: from [192.168.0.4] ([79.127.134.49])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a017b7337bsm18923815e9.3.2026.09.30.00.41.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 30 Sep 2026 00:41:38 -0700 (PDT)
Message-ID: <65279741-ffee-40d5-a669-2e7e7f5757c1@oss.qualcomm.com>
Date: Wed, 30 Sep 2026 09:41:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 07/11] hw/arm/aspeed_ast27x0: Use unimp array and table
 for unimplemented devices for SSP/TSP
To: Jamin Lin <jamin_lin@aspeedtech.com>, =?UTF-8?Q?C=C3=A9dric_Le_Goater?=
 <clg@kaod.org>, Peter Maydell <peter.maydell@linaro.org>,
 Steven Lee <steven_lee@aspeedtech.com>, Troy Lee <leetroy@gmail.com>,
 Kane Chen <kane_chen@aspeedtech.com>,
 Andrew Jeffery <andrew@codeconstruct.com.au>,
 Joel Stanley <joel@jms.id.au>,
 "open list:ASPEED BMCs" <qemu-arm@nongnu.org>,
 "open list:All patches CC here" <qemu-devel@nongnu.org>
Cc: Troy Lee <troy_lee@aspeedtech.com>
References: <20260930072501.2612119-1-jamin_lin@aspeedtech.com>
 <20260930072501.2612119-8-jamin_lin@aspeedtech.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260930072501.2612119-8-jamin_lin@aspeedtech.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: utDuiqsoUm56_d2lafAPQ8oxrQC0YuH5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTMwMDAzMCBTYWx0ZWRfX4pgDizz4cYVN
 C2ObHqPQMBQrGXuw50OucbYzjjJz5JxR8MbSU4xFStWogtYYtbd5WgZun94LjwexV8+sTpg3yxj
 //rkli7ow4dj/lWy3jp8FXYU7tRwmVm9kOyoJVIejcLdnapmYEntw+hOMMLdfduRPDPLyftQ5p1
 80JHMmTYn7WgHRJGgTS5+OL8U7MSBMj4M0DGzFgTHuFypF9XfFEAs9Nv0TDE+XM25FeNSbOWChw
 UIOS4Iwh8wM0tTgi1d77foj+c6b7zYINf0RPi8F9hhq8QZ758X73rcOnTHUM5asdxYvju9+KwNu
 66EDa3OAIcRWiimLdSrIqWv3e/f+lX40JL9SdxhKB8j7IxiYj9NnvDNJWTskXA9IO1PRYHeL0Cn
 f4hfFtMYbzRK8kum89w8Izd2Q6w+RXVK7AqwIcEZVfbsoETkRJlGFHi+h7LP80mTjAZ7Yuo5jkB
 8hkC7CGtsUqso9A9Xew==
X-Proofpoint-ORIG-GUID: utDuiqsoUm56_d2lafAPQ8oxrQC0YuH5
X-Authority-Analysis: v=2.4 cv=BPImP1QG c=1 sm=1 tr=0 ts=6abcbd34 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=7g8aA7A78AY7OC82r+w+4g==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=V2NxCb60AAAA:8 a=EUspDBNiAAAA:8 a=1tSEMpTH9XP_W59IOagA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22 a=3L6qF29SlnrayQqPM2jZ:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTMwMDAzMCBTYWx0ZWRfX8wSqVKF1/EDk
 OPD+J+dwWGrabak6O2VmPzds6lHevhgWQvCtfC90tmfGgoZyaUWRejtu8P4iyOqQs7znUeZDgJ7
 PkwTUbRNWHokauXr0KEAIfABPhDDCjw=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-30_01,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 phishscore=0 malwarescore=0 lowpriorityscore=0
 bulkscore=0 priorityscore=1501 suspectscore=0 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609300030
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

On 2026-09-30 9:25, Jamin Lin wrote:
> Before this change, each unimplemented device needed its own field in
> the coprocessor state. This made the code hard to maintain.
> 
> Add an "unimp" array in AspeedCoprocessorState for all unimplemented
> devices, and use the AspeedUnimpDevice table to describe them. This
> makes the code easier to maintain and read. Convert AST2700 SSP and
> TSP to use them.
> 
> This also fixes a type mismatch. SSP and TSP used the "timerctrl"
> field (AspeedTimerCtrlState) to create an unimplemented device. They
> now use the "unimp" array instead.
> 
> No functional change.
> 
> Signed-off-by: Jamin Lin <jamin_lin@aspeedtech.com>
> ---
>   include/hw/arm/aspeed_coprocessor.h |  1 +
>   hw/arm/aspeed_ast27x0-ssp.c         | 56 ++++++++++++++---------------
>   hw/arm/aspeed_ast27x0-tsp.c         | 56 ++++++++++++++---------------
>   3 files changed, 53 insertions(+), 60 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>

