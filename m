Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B59F1039894
	for <qemu-arm@archiver.kernel.org>; Fri, 27 Feb 2026 20:28:27 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vw4Rh-0004nZ-Te; Fri, 27 Feb 2026 15:28:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jithu.joseph@oss.qualcomm.com>)
 id 1vw4Re-0004mc-8x
 for qemu-arm@nongnu.org; Fri, 27 Feb 2026 15:28:19 -0500
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jithu.joseph@oss.qualcomm.com>)
 id 1vw4Rb-0005FY-0f
 for qemu-arm@nongnu.org; Fri, 27 Feb 2026 15:28:16 -0500
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 61RH0Wh53944938
 for <qemu-arm@nongnu.org>; Fri, 27 Feb 2026 20:28:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 Aao5UYcVyyesJid49Opt7MuSBqHv8loG4Q+a4mRZ2Vo=; b=LRdHs2yCYvDYsNFV
 wxZXVF/iBYfYhYD0gLNEpU+9cX0pwLlq2vwbDd+28/I/y/276MPxip5wKfvmB5BL
 x+/2IMQlyArNkVu42FwJh61fY01XOrJFKzggwmmOxcmj3VyI25KrF2ILGk3X8FZz
 +UIDbw8HEHJTVg0Ih2Pqevcjhts78VY34c9mlZXCUj2CePGj+b06z85nTW4uXYFo
 P18tlda4eH7f57O0+QPo9DFwO3rN96lq1C90s1MO30xAe8IwOQa7n4qSJLHM3yBO
 nHkSKL/cjvHCcf3BuD/qsytll1MdUdqyQirvdtrSzuP4AHNKGvcaqG0dM0txF5G0
 Twq2sA==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com
 [74.125.82.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ck73q2cje-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Fri, 27 Feb 2026 20:28:14 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id
 5a478bee46e88-2bdee946fb8so1176409eec.0
 for <qemu-arm@nongnu.org>; Fri, 27 Feb 2026 12:28:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1772224093; x=1772828893; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Aao5UYcVyyesJid49Opt7MuSBqHv8loG4Q+a4mRZ2Vo=;
 b=Q8vgU5245opaf2iCvqz93VdUDiHUYeyqffDYj22g5JmcqqbDo52qfouTZtE9dGiOuc
 xjJbBO41yNi/si9MK0bF9/yAwheIIlu2z427LB47V1T+jOFYsE/IrHx64ANwPMDr9j24
 OWDbiR9t29iEkl9H9sTQPgneauzbpvt067dLSy4CIkn05QO2uHE6m8hXaC9NCBIVpr1C
 iPcvU9rXywzPQNSSkPI7jH2D6oKNcwzMv4ac/Yld4SzXTAWdzX846wex2Z5zOwOJdk4y
 MfuGUHfcHLTkwDG/qcclDmgEZI1GM02cZooyuXxTBwb2IqhSPwi2Qbe/7cSp19aCp9Vk
 IoLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772224093; x=1772828893;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Aao5UYcVyyesJid49Opt7MuSBqHv8loG4Q+a4mRZ2Vo=;
 b=wAUjUZP3FqvbMIS2y6Abc0T8Wx7fFgZO1IyjFjyk9h3VLnU/eOs7MXiEEGOgZVp2Wm
 ztxNjMU4sZyLDg9wkJbG4d0zHBpKN5VTA3GWUEhUcSS4lGpcYF1WbsnYBq4hGnCiOtzo
 yUvYh4ULkuKQXlmoMO2d1DYUrv29YZv/Kbs3H5zaUjnqHN7M/vFH/QapL9Eg+uvHuzjW
 5jj3P+ZgxD46zwI0MnHzvohbUCcI4b/p/Oyp5FS3C5JhKXzi1j8YnUkWY3kvpTZ9cePS
 Uyt5HHo1fbQUVothiEVw/sdF84NQITRmExp5OGYqwJlLWFB8W3vB5RZuu2XHge2RuVjz
 Gm5g==
X-Forwarded-Encrypted: i=1;
 AJvYcCW/J+Rxy/amk5vx28VvtF/3/N6jjsvDaqPgg6kpb1MN49Fdv8T2au7zndhWZl9W6bpnRF3TjfZxUQ==@nongnu.org
X-Gm-Message-State: AOJu0YwxfkW5GxTNxbmNM9+F3WIgCPCkiZqfsKZlTPp8dBizEb92ukKH
 nVJg/Anx0UI86ximlLbQ/Lz74Kvp6whvvWuyU9IIfUNA5bUb7U1mIimyjTqOz5gFH0BQBGYmRS8
 WrC4QjngTdgpa2pcE1R/T+FENEa+vyXRMg5S4gIMAMT5Cz9ixxHjw0x0=
X-Gm-Gg: ATEYQzzCA2qdOOb+6fbGwdwtLpRu4By1SbDdnZoGxPhxdVy2sCp/RX5b1vwbVlsZ/sI
 qCZUSi185LOJBnumYzBJQszEFu+oE7XclHqWSMO0IXn2eeUOTQHavY5PGaDdos44XlOGpb0eVay
 Y6AJjw7soa9GhtIig9SNw/DWRdYAJJeTTLyR1uYxcSxjJhoMDexJpmpCUVp5h7MZ2wwatZH4Quz
 mLyu3Ssf3ffCHnYKl2MreKxjZOz//BtPDtbzOsk/09QPmC0H51D+dSuivM6X9dMt4T19AalHbif
 +Hnu+CS82jLeeDOkAQRndeZi6NHeDWNZ/c++h5XjmRLNxM1pbAUD1K48Ent0fbSS47jCwohfyJJ
 4JC9ys3tyGZpO0GoXUCBlexzxigXFT9QKjGIdvtkG1OKBHmSmJHy8a8jTgxVJ3bXqwDsbyJLSV1
 jsCw==
X-Received: by 2002:a05:7300:538e:b0:2b8:711:ae5c with SMTP id
 5a478bee46e88-2bde1b25446mr1660730eec.7.1772224093112; 
 Fri, 27 Feb 2026 12:28:13 -0800 (PST)
X-Received: by 2002:a05:7300:538e:b0:2b8:711:ae5c with SMTP id
 5a478bee46e88-2bde1b25446mr1660723eec.7.1772224092533; 
 Fri, 27 Feb 2026 12:28:12 -0800 (PST)
Received: from [10.110.80.16] (i-global254.qualcomm.com. [199.106.103.254])
 by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-2bdd1f49d96sm4303188eec.27.2026.02.27.12.28.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 27 Feb 2026 12:28:11 -0800 (PST)
Message-ID: <cd0b743c-544a-4a50-b451-c660f3142187@oss.qualcomm.com>
Date: Fri, 27 Feb 2026 12:28:10 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 18/22] hw/i3c: Add Mock target
To: Jamin Lin <jamin_lin@aspeedtech.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>,
 Steven Lee <steven_lee@aspeedtech.com>, Troy Lee <leetroy@gmail.com>,
 Andrew Jeffery <andrew@codeconstruct.com.au>,
 Joel Stanley <joel@jms.id.au>,
 =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 "open list:All patches CC here" <qemu-devel@nongnu.org>,
 "open list:ARM TCG CPUs" <qemu-arm@nongnu.org>
Cc: Troy Lee <troy_lee@aspeedtech.com>, Kane Chen <kane_chen@aspeedtech.com>, 
 "nabihestefan@google.com" <nabihestefan@google.com>,
 "komlodi@google.com" <komlodi@google.com>, Titus Rwantare
 <titusr@google.com>, Patrick Venture <venture@google.com>
References: <20260225021158.1586584-1-jamin_lin@aspeedtech.com>
 <20260225021158.1586584-19-jamin_lin@aspeedtech.com>
Content-Language: en-US
From: Jithu Joseph <jithu.joseph@oss.qualcomm.com>
In-Reply-To: <20260225021158.1586584-19-jamin_lin@aspeedtech.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI3MDE3OSBTYWx0ZWRfX8DCDckhmt8Iv
 mgGORdRoTo6p6G8Xi7BvRuZXsb9gu5OSFJJXJanztNDgWhddVnf0e/5+XV2oozfQIZwG1vsacER
 TuRiN5kRH6n8rk52xwapS0n0/+w3VpYwcr0TGiOkFbCRpymMYiW14EPLlodwBZ0b4f73ylNhOd/
 z0VOcS7JE3rHrLmukie/q8knByuS69cZqy/phSYvNdTo1w2ntzmYv8BR2JsC34RvqfutFtBzxvG
 H2ZBJK8POP14XIDBbOWBlbQscllYCoewwasnw5eWDxLItWqaAvhJ4DVIgvSwdRwBv39VvtDfGVe
 l3ClvibAdRdW6hqlpgAdGYoME/KIISRnRq9ngoKVkS896YxxM92hB4LJCmAFclJ71klDrDbxFxP
 PHEkXIoRwdRoVEisBg9EBifo1dQon4dWR19XM8N79IcnWobs0yiBZhnkfLB4HR7ETPj9SQJr16+
 dzAp0xkLRLfOGY7hXQA==
X-Authority-Analysis: v=2.4 cv=KL9XzVFo c=1 sm=1 tr=0 ts=69a1fe5e cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=GazINkvHHIBmrhdueQwA:9 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-ORIG-GUID: cLgjunW-W1V9rGgfAw8ZKumduWvKygZu
X-Proofpoint-GUID: cLgjunW-W1V9rGgfAw8ZKumduWvKygZu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-27_04,2026-02-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 malwarescore=0 priorityscore=1501 adultscore=0
 bulkscore=0 phishscore=0 impostorscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602270179
Received-SPF: pass client-ip=205.220.180.131;
 envelope-from=jithu.joseph@oss.qualcomm.com; helo=mx0b-0031df01.pphosted.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.706,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.401, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

On 2/24/2026 6:12 PM, Jamin Lin wrote:
> Adds a simple i3c device to be used for testing in lieu of a real
> device.
> 

Reviewed-by: Jithu Joseph <jithu.joseph@oss.qualcomm.com>


Jithu

