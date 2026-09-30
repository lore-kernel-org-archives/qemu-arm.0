Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACD18CA5FB1
	for <qemu-arm@archiver.kernel.org>; Wed, 30 Sep 2026 07:38:55 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xBotn-0000BB-1N; Wed, 30 Sep 2026 03:38:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1xBotj-00008R-VV
 for qemu-arm@nongnu.org; Wed, 30 Sep 2026 03:38:40 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1xBoti-0003mM-FC
 for qemu-arm@nongnu.org; Wed, 30 Sep 2026 03:38:39 -0400
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 68U6oVuY2009196
 for <qemu-arm@nongnu.org>; Wed, 30 Sep 2026 07:38:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 2dphzk1O501AOx1PS4qF9z2AETyyEfwlqD5IqyPxuJ0=; b=mKX1icrEtptYyyDN
 MqNlqV/Z2CyV4uHCMliq65fux+D9dOwKTvBAqAsKqFr30t0lzN1FFFYXm6+xpZ5z
 yVWjH++Qb8+cg3BoNaUNoBoxiVCtIUKKatbJrmuuTtFH4VC7NhdKRfrYl64nTJcS
 HZbRvFFP2Lr3g6SoCJATUbUB8TqdSTUC1chyK9tp+DD/WlpwB2av+YuYegPhlOuM
 SSC6yueL0vVxRWqmXCCey7o8MRi2w1MmjOxTMiuPkiEcftV6e1qHA34QGV9R7Zrw
 UwZeEjyvD+JjIDu32uJgO0jxYvERDf0GG56HW2XrOswZf5TYQIrQGK7a2MHvwNEC
 kb5UVw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h0rhehhan-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Wed, 30 Sep 2026 07:38:36 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id
 af79cd13be357-934956beec8so1051079885a.0
 for <qemu-arm@nongnu.org>; Wed, 30 Sep 2026 00:38:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1790753916; x=1791358716; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=2dphzk1O501AOx1PS4qF9z2AETyyEfwlqD5IqyPxuJ0=;
 b=Sk9OHq3Rb6eN5wv2fEQddvYUMdzyElz5J8c0vJ/GDzo0KlzHFV65W4TjYMi9PLcv5v
 OHkjutZvrMsbixjR0Iy28hBsp/YKVv3RVING/8deGvb8bG5YRDpSWDbJDDFQJMC5ti6x
 dC0OQp3s7UetY9Ylo6+d0Zj++Ddt4g8UIso8EYTCQAKYgbKi248AkYpedDG6P8As+mjq
 jKRoLVp5rvfZtQ1rndmt6Q2gQ/5toGQQATVCmtY5h7UUymrYBdbqGioZ4lyuplMlbTTZ
 P20JzwiehSff9hmNUpGh/Ckwt0Dcq71/RxalD7XRMRRrokHAuKpfdEX9OOw9X01nQjae
 HHiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790753916; x=1791358716;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=2dphzk1O501AOx1PS4qF9z2AETyyEfwlqD5IqyPxuJ0=;
 b=cEmNpygEqA5NgmEM1O2l6ldn3EAfSdjEaZgaFDVS5I1cTJDl6Z3kwoguiji2UDNyhU
 FPYWI2Uin4iaprt9M7i5khISeaU+WmgiUFJ3tePDW0FacuWpNFZ0pIgbzh8jhtJCorZy
 jbgWMBx+qX5gYUHbS2TX3ocUe6Ei93GV9o83DFu1DnDVywAdZiMrqZF3vcELUIhOx9rK
 DX1TxoCu6SZrgU4bl1uSbjliLmC1CtmtTQrBv23y4dktSigt6sSOg4rKiT+7kluC/kV4
 ijdbAu97GEvM215kX90GjeBZn0pYIWyZLEBGI86XFk76INeigL4QjD5GvZaN86rXx5Yf
 8e/w==
X-Forwarded-Encrypted: i=1;
 AKwUvBzdtia8o6ypdAkD6iqdBoCiJiqcBMKapJ9CwF047Al339bXbhqwBM/f8IaR1NnbvA+y9jLxKWxlBQ==@nongnu.org
X-Gm-Message-State: AFuF++l7WxKWAPTNU+JVBB5ZAn0pYTgONQstTNeRMMZoiZfZjKwhvZz9
 l4ZSDa/vFxPkzh9uTEM8ODkMcJs4H7jRzyWLrP0CDcwAGJb0oKX++7MUXCncR+DXk0Z5goQVffG
 Qy8kNGOIciW32qHdeosjV4HkQby2LHKnH6pYJ/XHeC88jzX+uvK5NGTE=
X-Gm-Gg: AYBFou0huQ6pDa/haE4jpJDJgSJuJdkcUfrWoa/9acd+YHdHDFtPZwZWk1sikDPXQxQ
 gA48AfOKQ1Q3iGnPTMH9wkMNIG8wL3y1CR41mZK4we88q5S2FTgevmG7mCF25rwDwLWpGmbFSq6
 0CqlOiP4mHs1XaaiiHEdwDm1xky94LFS6Xa4XMOYaIDClE0H8jCbTIdHXqiXkYujpg46tvMzPuc
 Onf3XCcsExiKsRWv+8eAR57UI0DTw2WWjwoSporm0A9Ev6gpp1lo5s8E8f26xdmgyw15+ZKStZI
 v0d8bJYi2tVImEsbMSoY+i9D5cUOzt1uOPKsSoiEUq2lqodqxgY8Qgo8Pm5dimZGjBJNi2Ij28A
 rCnkDt0+/7loXIfc7yrE=
X-Received: by 2002:a05:620a:450c:b0:932:ddff:123d with SMTP id
 af79cd13be357-93ca97a83fcmr66052385a.29.1790753916272; 
 Wed, 30 Sep 2026 00:38:36 -0700 (PDT)
X-Received: by 2002:a05:620a:450c:b0:932:ddff:123d with SMTP id
 af79cd13be357-93ca97a83fcmr66050185a.29.1790753915811; 
 Wed, 30 Sep 2026 00:38:35 -0700 (PDT)
Received: from [192.168.0.4] ([79.127.134.49])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48b02949f45sm1423603f8f.2.2026.09.30.00.38.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 30 Sep 2026 00:38:35 -0700 (PDT)
Message-ID: <892309f6-bf7b-44a6-897e-ae4c3a49da5a@oss.qualcomm.com>
Date: Wed, 30 Sep 2026 09:38:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 02/11] hw/arm/aspeed_ast2600: Use unimp array and table
 for unimplemented devices
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
 <20260930072501.2612119-3-jamin_lin@aspeedtech.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260930072501.2612119-3-jamin_lin@aspeedtech.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: URhSBoGRd5ovOAos5SlDmQjjBok0-1J2
X-Proofpoint-ORIG-GUID: URhSBoGRd5ovOAos5SlDmQjjBok0-1J2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTMwMDAzMCBTYWx0ZWRfX+P8ovju3pwfK
 gCJCIShT8tvrauzU4pZNghCsI4lC1WCFRmJdZxppKop8TpPMca9WreZNHOSS/amSoh8O0LovbAi
 qQJ4Ro9x+JIivWxbB6eq626usuV83/xW2y+cuYXQ2emIfnevJvtGOKqwwt3AIUuR5HxudwdWYge
 Rh4tIolAuvpNz0fdXzgcxn6VD9418G0i/443Wvk5N+Db9lZZIigJAu+EW1BvRBgPQbOJCfEHz09
 9rmPuwPWZYoFxOGzHKzjCrdz9i30k3Z0DMG+IbAA7wAvKwyE5DwXgP+jf+AS6Q6a0G88tpUZcQZ
 8e70E8rIWxkfmApX1opE9KDjfz/bK3ids0J0ZXbGiIZtL+ahVmT8WkfZtiVuBNYjqKH2Yul8x1Z
 TMMDUQsh2jUTuiTX1svwFlOOt+SaT0fuKNMLuu4KNKaCGlUTz4N8xr2BcEJD86mBLQimc+IAlpV
 1OCOgCcPQYlHwno1Fdw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTMwMDAzMCBTYWx0ZWRfX88J5xyEKxChN
 NTUnM5NMA0AMw/Q4cnlejtgfKluOKsfFpWapMyaFP9HlroWfHeHCGmFU6EsAeNZkFjMDOBPO1Sk
 WD+BnchzwOuAn0IWfnWcRDr/409CiAk=
X-Authority-Analysis: v=2.4 cv=Tu1zFzXh c=1 sm=1 tr=0 ts=6abcbc7c cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=7g8aA7A78AY7OC82r+w+4g==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=V2NxCb60AAAA:8 a=EUspDBNiAAAA:8 a=1tSEMpTH9XP_W59IOagA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22 a=3L6qF29SlnrayQqPM2jZ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-29_05,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 malwarescore=0 suspectscore=0 phishscore=0
 lowpriorityscore=0 adultscore=0 clxscore=1015 bulkscore=0 priorityscore=1501
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
> AspeedSoCState. This made the variable names confusing. For example,
> AspeedSoCState has "udc" as an unimplemented device, but
> Aspeed2600SoCState also has "udc" as the real UDC model.
> 
> Use the "unimp" array in AspeedSoCState for all unimplemented devices,
> and use the AspeedUnimpDevice table to describe them. This makes the
> code easier to maintain and read. Convert AST2600 to use them.
> 
> No functional change.
> 
> Signed-off-by: Jamin Lin <jamin_lin@aspeedtech.com>
> ---
>   hw/arm/aspeed_ast2600.c | 53 +++++++++++++++++------------------------
>   1 file changed, 22 insertions(+), 31 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>

