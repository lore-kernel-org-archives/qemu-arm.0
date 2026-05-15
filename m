Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3AC05CD343F
	for <qemu-arm@archiver.kernel.org>; Fri, 15 May 2026 17:06:29 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wNvzS-0000L4-Te; Fri, 15 May 2026 13:06:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@oss.qualcomm.com>)
 id 1wNvzQ-0000KG-J7
 for qemu-arm@nongnu.org; Fri, 15 May 2026 13:06:20 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@oss.qualcomm.com>)
 id 1wNvzP-0000lk-6E
 for qemu-arm@nongnu.org; Fri, 15 May 2026 13:06:20 -0400
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 64FGR8st482576
 for <qemu-arm@nongnu.org>; Fri, 15 May 2026 17:06:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 8aStGqZHRZyKK0FY9xXuutMH53E7sRiaHBwhjmVh8rc=; b=BkIIcJF0eaoxQNbf
 efafodvyx/UrBzo40CNHsnY5ENCrtdaWaPAFiWzWYC88IH4Z3dQhEHJLu2I+NpYB
 HuiOtNIOP7PiajJWoQDHH0VHJqVaDZQ5JOURSOF0zVx+1f1RFXli5J+cIwnh6jB0
 DQevBOfPfCT8nBtYlDvDF3oBWERdb2e9L7bFdlsXlHMq54z+J2LLxMyUU6bxqyDm
 u73qt5klpUlTd1r2F2tYYoAuNl+1LGAWEYfSd/4Mo13yY9aYX/Ev29QBNA7Bxn5g
 g33Al+x48GFCJjucMDmeQd+0uvInF+yxwDas9uP8GgOfwfduuc4JMIwo48feihF2
 gqN2+Q==
Received: from mail-dl1-f72.google.com (mail-dl1-f72.google.com [74.125.82.72])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e670u847a-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Fri, 15 May 2026 17:06:17 +0000 (GMT)
Received: by mail-dl1-f72.google.com with SMTP id
 a92af1059eb24-13537722193so1228826c88.0
 for <qemu-arm@nongnu.org>; Fri, 15 May 2026 10:06:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1778864777; x=1779469577; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=8aStGqZHRZyKK0FY9xXuutMH53E7sRiaHBwhjmVh8rc=;
 b=FHVrlRI2O7CvUa18k4CEHDLHQR3TuV3++7/w4GJfPJ9mJuvkmeXK61M2rODifiHdXc
 d7QR6kdPOJZe86CXi6IIRlfa4IRdAALMh69U1vNbleEZBDhm+NZfobpXC4j6+LLvcvNC
 X3nChHNHL9IYpLjznnAbqf2ilkiGj8LwfTmIp4XGdWLZR12Mi/66sS8AQ2lmmbQ7yUJg
 q4A0K62c8PTLydf2+kq/cpGTfIi9F7I6nItSl2fRX4mB4a+3Rc4wJfQFwubAAU+CbO2Q
 KlN1j7NL1Z4UTmTI5Raup9mfvHBKxrhV69Y3bU9i4IA8TRHR0WQIshEVWLotp7f55zP/
 TVuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1778864777; x=1779469577;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=8aStGqZHRZyKK0FY9xXuutMH53E7sRiaHBwhjmVh8rc=;
 b=T34i9FcuzXUVtT33lumXyaJPcVRmpgPc38km+y4HNVOy0t1ObbgbXcU7MRK06sfelx
 1orsd8cRKlDmHenmiH9CMcRvZcDB6AJX50R4X15DhXA9dgKfaz2fscGGT8oidLr7Cggm
 vRvsFcM5cdQy9wS4vS/tXHdtyJ9uC2suCvdBOXcROIzbh3BnvjCP2W5vcNpqEzjmsQyC
 o8IkmfmcRBw4IjrC08FhBsAO8r9aV7EdsgN7+mN9oxnXU5v+j0GFnEt+ln0neqZI4eCl
 bZ5n0oq91ZgfT5w9mW48JeatHReAz4sc0Sa7Pa79aua1BuoC+C//vSA/XMc+W6X/jI1o
 VHzw==
X-Forwarded-Encrypted: i=1;
 AFNElJ/U1ygxciwVs6BkkgJmCTzx8E+3wih4XACWbZwG/YxG7tyW3DYx0BTKjY0jSL+lxNt0r/x9vtT2qw==@nongnu.org
X-Gm-Message-State: AOJu0YzXYYOCP+s10v2AzKW1fSA/92Fifgj13NzpCMGs9Zpm8TpIJGrg
 mWiQE1GAEsKVZR+v+IAUJXoQfYrtrDXxNUOnFmkAh8fqHhcjz+03XDJ2Z10GDMd2k6QO4SPD1Eq
 SqCYybYH910GCuKzDOkSZCaykahChOujCK2yp9fclYZ+K8P8clPe32Vk=
X-Gm-Gg: Acq92OEvwCrDVTR4vH5m+AruwagPk+w233gDyAXIAvi2CTDtmtflecbVLLiB0IzUdMb
 yuDAXaayh3Ugi63xtlxDwTgrEQnVeIqikePcYfkUY0KMH13O2JB4hspmsH8pbfwfiQ2jmvJd2dt
 /GcG4onwacnQNbj0Ct+vqOOfRCfCaybLU6nqFT809oYaIjkKsDnS94rSNqYPLfQW1i3gley0DYJ
 hGcdvQ+YU31/eNgNmP6RHp0n3i6bS1POhEgl8oM4fbHqLQQ/6ig2Apl1x1hYTxjfNdKweuoyEbX
 rEnvmvVfAEGXjJuHAdlinczLMCKo3m4MVS4yceLoIQs61BrdMbeQYD5Njeg5S3sD5lt6UvxSKLm
 uVxCEX1biYpmO0n71NxSe81gjGTYHMT89cqztY+VNfBFODc3BZyOXK7y5BxZj1ATWjwn8Z+Ijvp
 0krwlx+APvOelMnhulsP/GPqXu
X-Received: by 2002:a05:7022:ea2a:b0:130:5ec9:7ad4 with SMTP id
 a92af1059eb24-1350483ba79mr2050987c88.29.1778864776695; 
 Fri, 15 May 2026 10:06:16 -0700 (PDT)
X-Received: by 2002:a05:7022:ea2a:b0:130:5ec9:7ad4 with SMTP id
 a92af1059eb24-1350483ba79mr2050963c88.29.1778864776107; 
 Fri, 15 May 2026 10:06:16 -0700 (PDT)
Received: from [192.168.1.170] (216-71-219-44.dyn.novuscom.net.
 [216.71.219.44]) by smtp.gmail.com with ESMTPSA id
 a92af1059eb24-134cc33a618sm10537098c88.12.2026.05.15.10.06.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 15 May 2026 10:06:15 -0700 (PDT)
Message-ID: <cd804f36-2fcf-4d7b-8639-4d3e4fcd9928@oss.qualcomm.com>
Date: Fri, 15 May 2026 10:06:14 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 09/20] target/arm: Build cpu64.o as common object
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, =?UTF-8?Q?C=C3=A9dric_Le_Goate?=
 =?UTF-8?Q?r?= <clg@kaod.org>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-arm@nongnu.org,
 Joel Stanley <joel@jms.id.au>, Kane Chen <kane_chen@aspeedtech.com>,
 Troy Lee <leetroy@gmail.com>, Jamin Lin <jamin_lin@aspeedtech.com>,
 Steven Lee <steven_lee@aspeedtech.com>,
 Andrew Jeffery <andrew@codeconstruct.com.au>,
 Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
References: <20260515141032.3271-1-philmd@linaro.org>
 <20260515141032.3271-10-philmd@linaro.org>
From: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260515141032.3271-10-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: uff83T_KU8TcEk3sZscqyMZ_3TGsjwAj
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE1MDE3NSBTYWx0ZWRfX2RjPN7MRdjT/
 QygNlDzFkFzHUgxAPm/CV1/3ii34qspuflcZji5J5UIAd3nBk5+gStvxFK1mfsdTClS/1kbrWaW
 309aBPdn9EjNHyww30kFMllA/HUPKlQtcnTuQKG1mQoGAuadmu/lCxx0DWglQ7kXwYdOeeN/5UE
 /jiWXMpqx8eH38MNrJow6bKYlZ7IIp2U1/JZgcKrWV4AstC6yKfz8ov0NSbv42XomhvvUgoTc1B
 FsKizA5i0vHW0BeUCMn3c1+57bE+9JUE/hgaGl5OM1kGz06necN8lhDTiejd+kQ/x56XuIz/4uM
 jeEqTEQDnGnu4ofnTr0pfEnuHZKiOj0zO3NlgahENtKc/tQv2uCvhBeOKss2HV21aMILLcD86Ae
 CKU3PX4mVeh9798WEJZJDX50oZA5t4fHSJXgslAAK/eK2Id6X9LZkPbhXmivXco6W1wHDfn/iEc
 VScAIac8Duc2ZuCxKjw==
X-Authority-Analysis: v=2.4 cv=E9f9Y6dl c=1 sm=1 tr=0 ts=6a075289 cx=c_pps
 a=bS7HVuBVfinNPG3f6cIo3Q==:117 a=iLqgmErQAxjCjdq5jj1Aqg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=wMs-g1Syp9tSsF1fmVcA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=vBUdepa8ALXHeOFLBtFW:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: uff83T_KU8TcEk3sZscqyMZ_3TGsjwAj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-15_04,2026-05-15_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 spamscore=0 adultscore=0 malwarescore=0
 suspectscore=0 impostorscore=0 phishscore=0 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605150175
Received-SPF: pass client-ip=205.220.180.131;
 envelope-from=pierrick.bouvier@oss.qualcomm.com;
 helo=mx0b-0031df01.pphosted.com
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

On 5/15/2026 7:10 AM, Philippe Mathieu-Daudé wrote:
> While gdbstub64.o is already built once, build it as
> common object, reducing target-specific set in arm_ss[].
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>  target/arm/tcg/meson.build | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
> 

With commit change as Manos mentioned:
Reviewed-by: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>

