Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 759CBC43458
	for <qemu-arm@archiver.kernel.org>; Tue, 14 Jul 2026 09:22:03 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wjZKn-00080V-H1; Tue, 14 Jul 2026 05:21:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wjZKl-0007zn-Td
 for qemu-arm@nongnu.org; Tue, 14 Jul 2026 05:21:47 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wjZKk-0007Ei-Hg
 for qemu-arm@nongnu.org; Tue, 14 Jul 2026 05:21:47 -0400
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 66E77A3A3931648
 for <qemu-arm@nongnu.org>; Tue, 14 Jul 2026 09:21:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 OVVbXI8EDXHVHSw+n9cnY8AuMrSuvEBTXoydkLmLhok=; b=cqiIuoIyRrhJRua8
 OcSr4ybpyFHbIrnc3SX2aeIpJpGpsQLcHEC1Tx/KISSuiLwB3PS0/d0oU8oK+KBJ
 WU6+nS64PgBsvUlPNDHZi5T9ggwQFVPrMnaFekAeF2Glc6Gq5W5W3lsmHWkIGI6E
 FU/FlYciJ/Hjr3IGTgh4SZQOgMh6WZYA3C0tmF3JG+oW7nf9P80trGncToJzN9x5
 Cbi9xBu6chc04TQOWN0eDbcRPGHMZR+R2MnSYaok5iBxMIj+Q0bYKgbt9eRz20x8
 w+RLI3/1a5CKZ/hZ5QOlmtfR+0Q58vk51nmdixaJKHbXrVsJV5KpFZ+B1c6uwRfd
 aeDL5g==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fdgeq0g73-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Tue, 14 Jul 2026 09:21:45 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id
 d75a77b69052e-51c33f48ee4so63635281cf.1
 for <qemu-arm@nongnu.org>; Tue, 14 Jul 2026 02:21:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1784020904; x=1784625704; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :to:content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=OVVbXI8EDXHVHSw+n9cnY8AuMrSuvEBTXoydkLmLhok=;
 b=jig7Po9enkpRZSv2jxI4wsoVy4+JUVSZWsSN2T8w8eOu55PP4+gp/0teWHfEZ7k5JM
 6SUGxwnwmkPLeWcotmfNkmmzE5qtiMOiLNB/Lj883Qr00pr7MXgLMZ0HUa6py8KauxVa
 7pwvGU8vIsm6dDOtPE+oh6+OU7TU96VYUXDXHpVrA1/S10Tc42+i1gtohXCSokilAoQ6
 PEqZ54XCGfAV1vxHCz5ISUZg62sKwHwA/v67o+KW74yf67pDEl4xP3S84GAEjDgKlMr9
 uqaOaZmwC2FJpMD7bBO5/TB/37jlyel1MLUqn8xHgL5lAPs+l9IqW2mgeP0EtEVM1Gs6
 EzNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1784020904; x=1784625704;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :to:content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to:content-type;
 bh=OVVbXI8EDXHVHSw+n9cnY8AuMrSuvEBTXoydkLmLhok=;
 b=c4GnyRpk/hs2rsVD51UWUIY1ijy1QM4VK08dKCuu/XxWF+E3RAGPL0wMhJ/p+EjEHv
 dmpV+XmFMkx5LEQWhRIlmR9ff2DoufAFiJvXO1UHjdoSY1coX7yqPcZevkVXXrW8hmZm
 dLkJiAn8D+yEs/cYWc3+dRBe+5CC2YFiFWmOOMEPJfBP6xQFkZeGZtwkd9oCsBS8a6l6
 h8o6oAXmnr0sEw98f2WbSBEFw4RKhIZgRnBeRuR/PuemF78YLAIMnIR5deYJsy/R8MgK
 mr930CEq72sizRNiyV1UNGRHeeCbhfaoB23FREJA9B4EtwD2ewdqDe8nR/+g3J8/hir7
 V4Kw==
X-Forwarded-Encrypted: i=1;
 AHgh+Rpxj7PrYiyLVeY93HPoyJz9+oLLqxgb0LSH8bKt0huNEfZTHlWajKG6etlXs2r+dcx0H5yRkY395g==@nongnu.org
X-Gm-Message-State: AOJu0YwrCsboiksX+KWEBDGQOPlt9tTIv5DO6hBTS9312B9QUcCCCf/m
 QbcqlUS72apOCfBuyZ4EbpUOyfEbRF03KKP2tdoulEd9XvWe0LLJU8HHFHBaG4RklmHnmL+7+ct
 988wWb+VXbZT8DQHXVxeRe/RNTTwmxdZWwiPxG4IYCIxm+g6D/wahhnI=
X-Gm-Gg: AfdE7cl1j7Ce0FTkuhHvvlsXNP1TH6h21paWFlnwxfWxyQySFr3TBC+GRJfuUQ1uhXa
 qVnU4M2dh497wWGsmuUXlGGjrKJH+kC35cct09CvpHqvpeJ7RvV1WBv2GncGzYFzJEgrPl0MX2C
 T3IDyLeUjs2uO/VooMsggrJjFpvm1UQKclCjNt/VPEDcp2kva2QlzNVWhC/72OtxIPvO++fbETI
 y873QIjog3srMJzVK/w4eViXIhFHrzqJtw0TbXi9c2AqA3pYZpGMHTzZdE5hW5DZ4wWGAUs3Gsq
 7AyY++FQ83uARGJKe2IfX7cxrDz6oosuubZoAiHML7+W0t96NSE6CAOkrDvrN40s+odKNh3g86G
 cEtP/oIFy2nD7LRABc2FYfHG72zJbMZ3Hx5bkdkPFy+qFjpDtEfM4ormw0EemPg==
X-Received: by 2002:a05:622a:1387:b0:51c:8432:1753 with SMTP id
 d75a77b69052e-51cbf0f6430mr122606871cf.30.1784020904524; 
 Tue, 14 Jul 2026 02:21:44 -0700 (PDT)
X-Received: by 2002:a05:622a:1387:b0:51c:8432:1753 with SMTP id
 d75a77b69052e-51cbf0f6430mr122606711cf.30.1784020904117; 
 Tue, 14 Jul 2026 02:21:44 -0700 (PDT)
Received: from [192.168.69.219] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49508739c99sm56543985e9.9.2026.07.14.02.21.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 14 Jul 2026 02:21:43 -0700 (PDT)
Message-ID: <894a9544-8836-4b09-832b-de933a5bad04@oss.qualcomm.com>
Date: Tue, 14 Jul 2026 11:21:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] target/arm: GICv5 cpuif: Writes to ICC_APR_EL1 can
 change IRQ/FIQ
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20260714091806.3568281-1-peter.maydell@linaro.org>
 <20260714091806.3568281-3-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
In-Reply-To: <20260714091806.3568281-3-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE0MDA5NyBTYWx0ZWRfX8xJ670BWpfPg
 kB5TrP5YDP5GTLJt37PDHz92GnOtSeWVRJxgzYfMa1CRSA9mQazyPuchL6R7wHv4lWp6RA/I6LA
 MgxvOAW4OxU/B7NmAYScvZn+5/rASV8dS8z6NKlTsFkKWINsQDAV8i9QyYiv8opH2PShgW8kuC8
 iwnpOx9+qX433DYZjT9P19Xvsi2PVOM3dgJnVRY+37+eC7pVIMGHAHgEELB1lZgujmJMPDHjdGz
 7EjVl6tbU/9G1CUNsT7fdEJDKsbzOWfB6AhuQ4or8UNjwtC/OWYMk7hpTMuDn2HHgc1f2Rxb0ZX
 glh1df05H9URw1z6SUxhg47x2ZSAj9mMl6zfSyWZGb8i842m7voKpQ4wtLP6XYebsBq/qi72xpq
 yVQpCX4wCe7sjFgz1EhnymOh2mAqQ+irtWF4L9ZUZpe5YxTEcpAvC8FiO8aeRqxCYiZA6PVCjfk
 LZwm82f7+iiaMF+hjJg==
X-Proofpoint-GUID: onVVP-UJH7PjDVSAvpUMGgdThOnbUxtB
X-Proofpoint-ORIG-GUID: onVVP-UJH7PjDVSAvpUMGgdThOnbUxtB
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE0MDA5NyBTYWx0ZWRfXyImrj4wl3/Gm
 OQwehwncgbWdsweQw0y78z1FU/B6NK09Jqm/rUFiS/qN1UgjprrFKSByWpaTY/EypEKu7C6tcBJ
 2qdFC1+xDVVeEDLRqd2lMJfl+uStmwo=
X-Authority-Analysis: v=2.4 cv=V9VNF+ni c=1 sm=1 tr=0 ts=6a55ffa9 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=9dWPDvEdnF6fiLz_tfUA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-14_02,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 adultscore=0 bulkscore=0 priorityscore=1501
 suspectscore=0 impostorscore=0 malwarescore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607140097
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

On 14/7/26 11:18, Peter Maydell wrote:
> The ICC_APR_EL1 register values change the current running priority,
> which we use in our calculations in gic_hppi().  Changing them can
> affect whether we have a HPPI, and so the value of the IRQ/FIQ
> outputs.  We need to trigger an update in the register writefn.
> 
> Fixes: 9bd90bddb79 ("target/arm: GICv5 cpuif: Signal IRQ or FIQ")
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>   target/arm/tcg/gicv5-cpuif.c | 1 +
>   1 file changed, 1 insertion(+)

Reviewed-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>

