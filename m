Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88021CD343F
	for <qemu-arm@archiver.kernel.org>; Fri, 15 May 2026 17:22:45 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wNwF8-0008Ko-Je; Fri, 15 May 2026 13:22:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@oss.qualcomm.com>)
 id 1wNwF3-0008KE-Dt
 for qemu-arm@nongnu.org; Fri, 15 May 2026 13:22:30 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@oss.qualcomm.com>)
 id 1wNwF1-00006Y-Co
 for qemu-arm@nongnu.org; Fri, 15 May 2026 13:22:29 -0400
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 64FGn3hH2691701
 for <qemu-arm@nongnu.org>; Fri, 15 May 2026 17:22:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 VDUGGRLnPallEskdhXeIRrVk1EcxEXU7Eu0dNlaiBVY=; b=gtVgCh3i47OI6vuQ
 4a7O8KpMEWHbDakpvFuE5Rji+VlqiRqY9iC5LA9M122nbzUzrl3M1QoevTvw/Fi3
 tS99Qqdhwm7Ve6SEEmC70+cl2SMzwKiD9w+I2ZVSjrmRIKG3GiCrIFzJDv3bFDlQ
 MkOiegcK+uy3S8PrAr6hdhqrh5qxHGWvm+QNidKiAnFrpN9INRxCBIkIsJcK7eZY
 Zvlp+wcc1tE26rT/pJSxnF0pjqYgdDtBDpjYv6Fir8gctcfiFYsOmf9DTB7YJcJo
 km1DBEXeoJi2TcIEW03Aogq3CghaX4e3Am5+EVcx6sSubmrI0iehKmdV4CYmUkaP
 mKK80A==
Received: from mail-dl1-f72.google.com (mail-dl1-f72.google.com [74.125.82.72])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e67ber3r5-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Fri, 15 May 2026 17:22:25 +0000 (GMT)
Received: by mail-dl1-f72.google.com with SMTP id
 a92af1059eb24-1306c2f7037so1752c88.0
 for <qemu-arm@nongnu.org>; Fri, 15 May 2026 10:22:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1778865744; x=1779470544; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=VDUGGRLnPallEskdhXeIRrVk1EcxEXU7Eu0dNlaiBVY=;
 b=E13fZMOWxXrYOLlabTj/d8CYDeCMzAIBVtK215cuUMjJ7+3K5NNImYPbL53VjW2HYR
 UwgBz2L+mYOvmXXtghr0+VRjYqAkO1OASIpE7dWm8R9tIBxGezNbFFqISiJuTO2Rw94F
 utQD0lfDBiFF3ku3dLfJZPFAY6xpHdtqb6ylwMCtj9sloKvP4UvFIboVPo1xszuW5TU6
 2V6DYxf5PIeYjUYqi8yLUsD49NIjV8qqEcSF57ZB+Skvxzj/pDpnwfkC7Sx7yzre5INX
 YNrj0mo3TsICxU4M5njj0q4AWUM/FW+4b5muOaFkYxM2gj9uJpqzEijEjoBOp2eFuWpR
 y1kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1778865744; x=1779470544;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=VDUGGRLnPallEskdhXeIRrVk1EcxEXU7Eu0dNlaiBVY=;
 b=S5PyHo+IH9nyc1k/dzrj/+XlJmqSYNJ4u7uHevGnc5CR7ZrTEL84hQE3E13vTw7OE0
 EpqcSPKT9v6Mo7CpaoMsl2KQR2yrnkfL7YwRVkQXe6RDa+fBcadlm6CmHzkKNOGFRq8t
 hzdq+4SGhF6sVXtq+NVrHdTD5xpidW9uHoAjOacnMjZEKl+y3XPAijexmJnbKOf82INB
 lY6gPO3qU6cpmw3EPatdn3vrC5ngOV/qjxVLHeTPDUekDq+d8LD9HsjtaidKzVIgL9dx
 Se7rMgJUkod6uMpL/YQ2jk8QHbFAHc3Qgy108xUqH45bHqCFvW5eKveP4Iy5BQLPmo5f
 lifA==
X-Forwarded-Encrypted: i=1;
 AFNElJ/MtHzlna/hvP5EKj2cBFSvNqMKUhKKMcV6XZ5ZMz02meKjnxCd4SFpaV9amu9aZ4jvcB2MxJ78kg==@nongnu.org
X-Gm-Message-State: AOJu0YydkSk+1C7/GvO6ZtypeRTvMlDte3G0wonhKOUQ5lwlW9TUsp8D
 j0BwrxopaY47g8F+gAzDatO14H/JN7zr9BHN4sUW9K8Yhraw/c67vVNs5ZQOGhbPCY/1ToCgBNV
 2npFJL2NE6zGw29Ea8qjIfj9KbRFlm6afpOjfXIX8/ZsNfJXvq8XMHZI=
X-Gm-Gg: Acq92OHaKAB6mt9+WhyHl5g8thm+/wojUI5/OJKl6bgmQCA3gr098YJTUM7wnJeSzZF
 SI11r7STSof8k+gZoC83KMzKrPwO9oaJ3Way9rcHTqtwT4uFCle8frNIIk4i7SypB8uJ541z1a4
 N550sBqk6J0aPmVi1PAubWopP4+XNY9POhuEGqeKxHlsiBuKFPyIalS5YEdYMi5HFBszBQtxYnK
 ynZ+AwC3fDl1wD1D3iOHWVdk90ZAlw0sWyh45F0AMXzYOuLrGEnHiXelZuUgyHpj0xSFdJoh04R
 jjNCm72fGFnuSSDN9b67aZQr9APMJnaQ8ilcNZzNuScKNktridmMUrhib7G2vXGA5U/TAWDlDji
 XT43GT082hIi37x8a/4inwOleHMGUpRBk8RyrCiN1Lh4T7H+ewQlIjI7LNBZAsCv8flkyVik8XH
 6R1uATRKp70csvIg==
X-Received: by 2002:a05:7022:f9a:b0:132:5d31:dcb4 with SMTP id
 a92af1059eb24-1350483cd3bmr2218149c88.23.1778865744282; 
 Fri, 15 May 2026 10:22:24 -0700 (PDT)
X-Received: by 2002:a05:7022:f9a:b0:132:5d31:dcb4 with SMTP id
 a92af1059eb24-1350483cd3bmr2218131c88.23.1778865743665; 
 Fri, 15 May 2026 10:22:23 -0700 (PDT)
Received: from [192.168.1.170] (216-71-219-44.dyn.novuscom.net.
 [216.71.219.44]) by smtp.gmail.com with ESMTPSA id
 a92af1059eb24-134cc33a67csm10408832c88.13.2026.05.15.10.22.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 15 May 2026 10:22:23 -0700 (PDT)
Message-ID: <64a611a9-a509-412b-8ff4-5bcd85348b97@oss.qualcomm.com>
Date: Fri, 15 May 2026 10:22:21 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 04/20] hw/arm/aspeed: Initialize 64-bit CPU types
 during DeviceRealize()
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-arm@nongnu.org,
 Joel Stanley <joel@jms.id.au>, Kane Chen <kane_chen@aspeedtech.com>,
 Troy Lee <leetroy@gmail.com>, Jamin Lin <jamin_lin@aspeedtech.com>,
 Steven Lee <steven_lee@aspeedtech.com>,
 Andrew Jeffery <andrew@codeconstruct.com.au>,
 Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
References: <20260515141032.3271-1-philmd@linaro.org>
 <20260515141032.3271-5-philmd@linaro.org>
 <e8e1d0f8-b5b9-49a3-9478-f58f72e962e7@kaod.org>
 <99983366-9174-40cf-a158-a663daa7965f@oss.qualcomm.com>
 <3db1823e-bdb3-4801-81a0-dc901bf75655@kaod.org>
From: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <3db1823e-bdb3-4801-81a0-dc901bf75655@kaod.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: Z1CIOmwyScGnfm-nHSzR_C29NrjVNg3x
X-Proofpoint-ORIG-GUID: Z1CIOmwyScGnfm-nHSzR_C29NrjVNg3x
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE1MDE3NiBTYWx0ZWRfX63AE8t+J82xh
 4qCY9Vi7/pVApj/qRsu47yliP8rHqTHJ/A6TjYYY5P8hCjreh2/l9Yd3OJKFDcRCZX71f9aqn6F
 uzNHBDlefCb00dkAEDhk41MwG2pao+Jx1jQwHgwweQ5Vc2LZDYbD9M0b5E+uXHTRRsmJ41DR+uo
 o8ILqPGzroLvq2c0mXVGbNhAIP+gXoATzvJcYXjgVSdlw2jVIL3GDmEk8meD4kpYnk4EcDuNhAV
 rzersGD8KJx2HnJR5NMazNZHTDxlBGHeaAssUdE+N1aoTEuKfx0pPkanAOXomXC8f2K2tv95/zv
 9qVUAIp2Qhc8KORgJ9d+SxLwguAfAuBlVNMk0vdghb8YBAVdGWh5YOI17ZlXuzRYMG65Kie+zfE
 fjSVbMGYj3/z/hdl3dsZu6O5K4opXmU9IFBr7sDSOA7X4zKIpmzovgrnFt4+psrvUq/oxXnkXZj
 zLzJ4PHE4XR+PiMpKkA==
X-Authority-Analysis: v=2.4 cv=IrUutr/g c=1 sm=1 tr=0 ts=6a075651 cx=c_pps
 a=bS7HVuBVfinNPG3f6cIo3Q==:117 a=iLqgmErQAxjCjdq5jj1Aqg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=d5BFOicfw9AJO1EOJmYA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=vBUdepa8ALXHeOFLBtFW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-15_04,2026-05-15_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 malwarescore=0 suspectscore=0 lowpriorityscore=0
 priorityscore=1501 spamscore=0 clxscore=1015 phishscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605150176
Received-SPF: pass client-ip=205.220.180.131;
 envelope-from=pierrick.bouvier@oss.qualcomm.com;
 helo=mx0b-0031df01.pphosted.com
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

On 5/15/2026 10:18 AM, Cédric Le Goater wrote:
> On 5/15/26 19:00, Pierrick Bouvier wrote:
>> On 5/15/2026 9:29 AM, Cédric Le Goater wrote:
>>> On 5/15/26 16:10, Philippe Mathieu-Daudé wrote:
>>>> aspeed_ast27x0.c models 2 similar SoC based on a 64-bit only
>>>> CPU (Cortex-A35), only available in the 64-bit binary.
>>>>
>>>> If we build this file as common object, these SoCs become
>>>> available in both 32 and 64-bit binaries; however when running
>>>> the introspection test on the 32-bit binary, the init() method
>>>> tries to init the Cortex-A35 type -- although not realizing it
>>>> -- which is not available. This can be avoided by deferring the
>>>> CPU type initialization to the SoC DeviceRealize step (this is
>>>> safe because nothing uses the CPU type before, only the GIC
>>>> access them, just after their realization).
>>>
>>> I understand this is a qtest workaround. Could we introduce
>>> instead a (qtest_enabled() && 32-bit binary) helper ?
>>>
>>
>> In general, it exposes a dependency issue in QOM type system.
>> In this case, we get a class depending on another one through
>> class_init. Moving this to realize seems like the best fix.
> 
> My feeling is that this goes against the best modeling practices
> we have tried to put in place over the last decade.
>

In this case, adding the workaround you suggested might be the best
approach indeed.

> C.
> 


