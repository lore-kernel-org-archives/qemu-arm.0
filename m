Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D31CC5DF8C
	for <qemu-arm@archiver.kernel.org>; Thu, 20 Aug 2026 22:23:21 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wxBAH-0002YG-EF; Thu, 20 Aug 2026 18:23:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@oss.qualcomm.com>)
 id 1wxBAE-0002TS-Im
 for qemu-arm@nongnu.org; Thu, 20 Aug 2026 18:23:10 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@oss.qualcomm.com>)
 id 1wxBAD-0002Jl-3K
 for qemu-arm@nongnu.org; Thu, 20 Aug 2026 18:23:10 -0400
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 67KK7cqg587756
 for <qemu-arm@nongnu.org>; Thu, 20 Aug 2026 22:23:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 3sOq6nhlEp07F6tm6CE9THKXNnjNoNFp1j8/Y3T+s/U=; b=lUQQB2+dUL68VZEm
 K4d/ql8RYT++cX8kH63IAqRSc1NCj4X+OoxAswclcOkBVrx3DL3HeBnHc2GS0+nO
 1g7LM5aM+8cYvdk2+CzDFY5EiFpIdx1e0Czk4XoxDURnHGUL+7NJcB1pYudDvgFX
 tpdQBrsWuURFWpE9vKrcQ2GWLczSdbxZ7khBNITd71dwShRUVeFV5zgvB49qjBgW
 2TOsSli9Ax1ozHg/D5PGF6y0iZeKSELDgnwPzqPomGmWlJUf88Ck0r4wvU+cu6Jy
 6YuuDu8C+Inw3GeUhT3FwB6KGOLQjUGErj9oZGS9VIYUCroETB3EfnuiL09sHtAp
 Z73c6Q==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com
 [209.85.215.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g5yg8b5xn-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Thu, 20 Aug 2026 22:23:06 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id
 41be03b00d2f7-cb5cc1e13f8so243308a12.3
 for <qemu-arm@nongnu.org>; Thu, 20 Aug 2026 15:23:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1787264586; x=1787869386; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=3sOq6nhlEp07F6tm6CE9THKXNnjNoNFp1j8/Y3T+s/U=;
 b=il0+VGPssTodWYl1UXJNGqQsRcjr78KmAGHToXyke4oftN0AzGrFu+ezi4mkZWZoXT
 bYSDG8ZgWp/Ej4s+grFHqUXUDlTI6mEmL/7KPsTTdK/wSuA2eT9ZcmDMx7LqrKAUo0fF
 pZRJHwrJpYkaa1/FoTg/lOFHhqHA6qrC+AmoBiKFYz4844zWiDen7KS7Zzv07HKhsx3L
 fmrhBdbWHslBdwwWzpm/VydlCLdoWZB6qNH4hWWPOhtIUldiybkBOYkRg62scqWwnkmI
 YhgcWfsjrrxkqSwmCXYkAW69HB9PW+tcojyhMu+2JclHNUGVE1dhtmL5Ejf+LpofUyuG
 ymLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1787264586; x=1787869386;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=3sOq6nhlEp07F6tm6CE9THKXNnjNoNFp1j8/Y3T+s/U=;
 b=okMELrPIMJZurGRVvQfcR8FQ6G4qlp9XLWnJxOT3XEfwdTt3wYtOu3/lgM+vcAR4HP
 biQK0dB5PaBBbH+uBorr6/9WhNP7XUwHvSb5Y2UMIsQ3R8IK0YG/UTLPX4VliAj1u29F
 HuEzx67ochHUzoAw+bPo+IOBtVqfAtdEqJ++SNdFopeQsorAygWBeCk7gRTJDnWjjXqN
 6UI3PLaV9E2dNib1I9mC8UlNvdEKoCE93DbCR/3Up4jsDKOacyxNvFLBPQSSfHSBcGwo
 ng2UEzgfiiygf5d+je1DUO5GedOMHyJ/xr5q2aQ7VmyZlclZTTI/lFUd0fyLkmssdREy
 1z4A==
X-Forwarded-Encrypted: i=1;
 AHgh+Ro2p2tf4blrTRgk0S4RR1YN0NC+EE532YlDcRvp5Q/bbQyRWbJT1av4trP5WQi4RmNothIGyhuAmQ==@nongnu.org
X-Gm-Message-State: AFuF++l54XZuig8100QmKNOEuabr6+fyMdHtUOdeid+KCXbKgdeM3gmi
 6O3t/QignAvZ9Ah/fNEyBDBaPDK4uP7C/rd9tZW7AsAN5+epZgQMJOZI0xLt4q4G3r6jKjKmzHN
 uheDpbDyo8zBGBHavYpNSZoGEjJg63VUXp0k/gUot6wZN3kRzYdSvf00=
X-Gm-Gg: AR+sD12NHrcC3FiGiSWBqq0KZUFlP9ZEaIpvwSCY+BP7xieRN+z4HyvjHksesOhbxh9
 iP3wCm4foDgLVVhc18m+ae3ker32O0DDyRZOZEF6oRPzE2TCoyH3Axw8IqmzIY9gO6aidMioKvR
 knWwqzRtdGp3gXuISBBO/Fu79sItr0MUD1Am93/PjUE7rIehwMWGJ0ch3FwLh1Rv92IdLy8gRPO
 QrevtOdIZiHUKh8umzX9Dqfb93vUfZhXIOnH6A2Ru8otenlQZf0bPzoeim8yeiPhTaFqNVPwYNp
 OejDyHtmzn9F+++FfzcktEpnJlz5Nkh/4hJKnLN3ETGt1miYPKcVqB9ihI7zz1YY2/eH0QEg4DT
 59wQ2iFPlYt3UXFP5jilU2ngRqxeZZmAzGdv63Ypi0fqVPy6pACUtdiNaRaHHk6Ohit9M
X-Received: by 2002:a17:90b:57e5:b0:381:11eb:d78e with SMTP id
 98e67ed59e1d1-395c35f0a79mr2846969a91.14.1787264586050; 
 Thu, 20 Aug 2026 15:23:06 -0700 (PDT)
X-Received: by 2002:a17:90b:57e5:b0:381:11eb:d78e with SMTP id
 98e67ed59e1d1-395c35f0a79mr2846892a91.14.1787264585643; 
 Thu, 20 Aug 2026 15:23:05 -0700 (PDT)
Received: from [192.168.1.199] (216-71-219-44.dyn.novuscom.net.
 [216.71.219.44]) by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-327c3fc6675sm28939205eec.13.2026.08.20.15.23.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 20 Aug 2026 15:23:05 -0700 (PDT)
Message-ID: <fc14e338-946f-49bc-bd20-d238ca1341e2@oss.qualcomm.com>
Date: Thu, 20 Aug 2026 15:23:04 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC v5 20/28] hw/arm/smmuv3: Route IRQ and GERROR handling by
 SEC_SID
To: Tao Tang <tangtao1634@phytium.com.cn>, Eric Auger <eric.auger@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 Chen Baozi <chenbaozi@phytium.com.cn>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@mailo.com>,
 Mostafa Saleh <smostafa@google.com>,
 Chao Liu <chao.liu@processmission.com>,
 Jim MacArthur <jim.macarthur@linaro.org>
References: <20260813161515.2788900-1-tangtao1634@phytium.com.cn>
 <20260813162558.2808607-5-tangtao1634@phytium.com.cn>
From: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260813162558.2808607-5-tangtao1634@phytium.com.cn>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwODIwMDE2NiBTYWx0ZWRfX++w7qMQ11Kub
 Nl7BqCSVCWjkwfQoNHMNtdmftw0kCnoVW+sIoC5+wfWP3vNEthGaQXaqCgptZ4BpriLmjh2u6pa
 UANDyask3u40da+Am7INpQHYZBEX5Mc=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODIwMDE2NiBTYWx0ZWRfX30e4pMw9OHke
 /rLpuZNAw3K0iycih14shjGaG/z+ROEryhSlp+dQN+HBtpFdHam21JVj4tvC2nOCrIpKYm4xFhj
 W9V8kM71lqkDQxaEmG1QvWLIbDeS+RI0K26EjJX5JeH2TmEE052wufwuAYmtaAAcv4bxZSp+Gy5
 CVyVURjaUatrxFm+fXRR6T60Qi5eBTdVo6kNHjPGd5pv6IBaU6hh+NSqAzCUTO3W7Eszj5QjlQ1
 1XrCb7LZY5UBO4pChH2eibbNASbL3V5+ocPTW3um0Fsq2+O9g7pZenAJW5eKNS9w4XJT7+xrSX3
 8myA44TyCMxg5EFgu33ynPAHwLbiOvYeuW2h8FLfmEhpqb8gWWSyZ6aq9Zvz30OxQamqI5dvRgV
 qB27rkt5B8vnO4BTD3ZEqCVRhJMrdnMRdGqB1FMlqLpSpPKYROVWXVo4Ti0UJ+BvY5zrK5xHUdu
 f8IrHG35HHluAw/y0DA==
X-Authority-Analysis: v=2.4 cv=Y7/IdBeN c=1 sm=1 tr=0 ts=6a877e4b cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=iLqgmErQAxjCjdq5jj1Aqg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=fgrLqfBXAAAA:8 a=EUspDBNiAAAA:8 a=N__Qz3djUkrl-kfJS-cA:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22 a=_Ge82aPy-h_wFa7gWU4u:22
X-Proofpoint-GUID: Pph0mOHeYKKch3P1SOw76a3YF6JKWdK7
X-Proofpoint-ORIG-GUID: Pph0mOHeYKKch3P1SOw76a3YF6JKWdK7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-20_02,2026-08-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 priorityscore=1501 malwarescore=0 adultscore=0
 clxscore=1015 phishscore=0 impostorscore=0 lowpriorityscore=0 spamscore=0
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
> Interrupt and global error handling currently always selects the
> Non-secure register bank, even when the event or command originates
> from the Secure programming interface. This splits CMDQ_CONS.ERR from
> GERROR.CMDQ_ERR and prevents Secure software from acknowledging the
> error through S_GERRORN.
> 
> Pass SEC_SID through the IRQ and GERROR helpers and all queue call
> sites so interrupt enable checks, global error reporting, and
> acknowledgement use the originating programming-interface bank.
> 
> Signed-off-by: Tao Tang <tangtao1634@phytium.com.cn>
> ---
>  hw/arm/smmuv3.c | 20 +++++++++++---------
>  1 file changed, 11 insertions(+), 9 deletions(-)
> 

Reviewed-by: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>

