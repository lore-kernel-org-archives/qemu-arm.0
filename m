Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB225C5CFCF
	for <qemu-arm@archiver.kernel.org>; Fri, 14 Aug 2026 15:35:31 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wutwF-0001sd-AP; Fri, 14 Aug 2026 11:35:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@oss.qualcomm.com>)
 id 1wutwD-0001sJ-SZ
 for qemu-arm@nongnu.org; Fri, 14 Aug 2026 11:35:18 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@oss.qualcomm.com>)
 id 1wutwB-0007GM-WA
 for qemu-arm@nongnu.org; Fri, 14 Aug 2026 11:35:17 -0400
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 67EDwx2Q2993216
 for <qemu-arm@nongnu.org>; Fri, 14 Aug 2026 15:35:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 utVvaMh4z80sbHWCUqbOZNquGsboFlauJg3XBGiQKp0=; b=LqJaufYQ8tySngxW
 O60YLSQ51pp2K72qU0aLzU3D1lLh+QFqR7Rc+NG3HrHyOL2BNJN8cn2cUPaBaF4j
 qj/RT5hEN9JlTLJENipFEZXxl1/aNP4MxHaYZdYYwfWLoFsB4BarDkBbvmctl5Wo
 MQbAn672bNqEPAR3On04W6rwydX8TXTcVsE1ld/FQT5050mvUEuucNGQieV1KYuk
 7+TWyAeds/lCgwcCFUGShfoyUWXVKSKf6LwAwruYsMs4cVRL+VDxrvNh/DB/h9Dc
 OrCjvUmL54UhA0FrwqGboK+03j1GpU9VIr9yXH4QXFDYa6DGBdrUXoRRcfjKL/hW
 M8+SGg==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com
 [209.85.215.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g20sj1hw5-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Fri, 14 Aug 2026 15:35:12 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id
 41be03b00d2f7-c85798977dcso1618306a12.0
 for <qemu-arm@nongnu.org>; Fri, 14 Aug 2026 08:35:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1786721711; x=1787326511; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=utVvaMh4z80sbHWCUqbOZNquGsboFlauJg3XBGiQKp0=;
 b=fY0wDa/gzoS4HPAdcUhSjCttwL6GJTrJ4Z64EEUtvY7i0g/mFs7w0GrTl06Zzr6YUb
 2aH93kkH6k+dOKAoW8nJ+Sgbq0Gx5/EFoO9GasMTPG4kYBlnIDTrmm9muCSQm2IgA4JG
 /plERJH8w5QgOSEaEY5ovtgsCKQvAVSI9R2AAsJdZSuOBAzrZ6mA590DiQ2NmGIXgaX6
 EWpVmUTmIZ5JwdxyZk5g7B/MUKQfouJWZugh7wE1AlizurLC2FR3BkgB0qK2JF+JYefK
 /rC6S7xdEJ2EKP8NyRovhqHPQ2DGXPB8a6+k2wn36aJhBYhKcA+f5AidaOI26142Viao
 Z9zA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1786721711; x=1787326511;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=utVvaMh4z80sbHWCUqbOZNquGsboFlauJg3XBGiQKp0=;
 b=ggoQB1DygW/omHuuHikDc/tEg/gYtbQEnher904Hca7//cae4BzkcBMkD7gTvTHSga
 yW9qQSOxhIRiRjPfHfFG+q+LImTDTrz5Ntx9li+qUlk2AUfR1cQOoq35kLUYZ3LmBonS
 kYGxQ27JkeI2kSyNO4gzbB0ny8zmnKsknPI5mh4ThKcKbxjg2disrhs/i6sMSxIVDe44
 vMmgzZI1qxIJqcDHWPd1GX1xdhL85Zvhe519IjR81Oxyig3wz+pa7c4vnyemAvgi2XpH
 GsoXT6B0+senGdks9MlDskC0zjrjTTkhusAZV2bHgWuHQp+ZAmv2fpTOPJOC6hfmfpPW
 y4kQ==
X-Forwarded-Encrypted: i=1;
 AHgh+RpmTX0bsVq0x/WwicGSLPsjfNv6ya0ROLHnCkMYaHyidiEb0fPBMdwKTkTXaBdkVoOOoAt6oL0f1Q==@nongnu.org
X-Gm-Message-State: AOJu0YwBV7uvVBZIGMa6FGuxdo8wPUIhmqxkPLreucytNi6bhDU0DHJv
 vdTcU/gP4DfE8yF/JXgv9GlqM+UV4h7Smq0JIHnFgqscSDhZjHIPjxhff5DUO/aWWVkXiW9469y
 ZUBBjWUBExvJpQuZ4YCLP3CVqpHR6NdRRxUQ8Gpj1vgwae83N2aqKjYw=
X-Gm-Gg: AR+sD12DZBeHts90PGV1JIuUyj6wulb5UPnVliNX6ONl5sVUw9Wl02n2jx0rvVAgQOo
 DBjrAwxh0Dq017oli0pZhwofLaTxb9yy0T3Ux4rP6AjeZV5LISdN9eAnpVxKdwnS5+Xqw+NdNnO
 q1Txwx2eNbMaDwYWakcHCmMDz17t9BFPFPLOCxHtaid72AnleeEfnKgcrbbDg025YtiZyj4b3Rh
 imZwalWxQfAciwPo6Ny/qwQVStUjQViOrNMQ6BxlxH5ez2hjKfThfheg0XYo5R+jqo+ZRqWOfRr
 Uj1NliFFppgqz5DX/jz6UPyqXNo/w+VXzi4vn0pU5kPTeg1dvB5F+qwYl3Zo7NVgOOgvWKg7iTN
 8n7vPKJw+cS3RI0a+eLYrGPri2eJnEwthRudlkJMcdr/SvK+G8rste4OBRcolgrfR4nc4
X-Received: by 2002:a05:6a20:6a1f:b0:3c6:61b9:917c with SMTP id
 adf61e73a8af0-3cc71ced6e0mr7086665637.11.1786721711283; 
 Fri, 14 Aug 2026 08:35:11 -0700 (PDT)
X-Received: by 2002:a05:6a20:6a1f:b0:3c6:61b9:917c with SMTP id
 adf61e73a8af0-3cc71ced6e0mr7086596637.11.1786721710733; 
 Fri, 14 Aug 2026 08:35:10 -0700 (PDT)
Received: from [192.168.1.199] (216-71-219-44.dyn.novuscom.net.
 [216.71.219.44]) by smtp.gmail.com with ESMTPSA id
 a92af1059eb24-1413889bca5sm15132827c88.12.2026.08.14.08.35.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 14 Aug 2026 08:35:10 -0700 (PDT)
Message-ID: <dec2a5af-dad2-44c6-8eb5-b87ff9595d7e@oss.qualcomm.com>
Date: Fri, 14 Aug 2026 08:35:09 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] target/arm: Restrict arm_do_plugin_vcpu_discon_cb() to TCG
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>,
 qemu-devel@nongnu.org
Cc: =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>, qemu-arm@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>
References: <20260814080507.23196-1-philmd@oss.qualcomm.com>
From: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260814080507.23196-1-philmd@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE0MDExOCBTYWx0ZWRfX9pnZeE+rpKet
 b5vzLK/dSDzMGPYR70brYAirF6rxbthjXY/zryeJOsH16tFBX+0Z3BRcYRIngkZdFUIK4vV+Nh5
 saZ4pzAsqrSOh7euVoqCIKVtIDyPKuvUzfudSF8Edx1jw7DJD/WUQ/RxDX4wrFLaiyg5pp6Ijmz
 dlYArnX8oa9StjoE43LdE1fsS0YMVvjiPDfaZH48l+3DmKnSOFfj3IFw5xjVd+oRnH3pqO2zPg8
 u6EJHa9Xujlnx+F+MVcbg/7A2f4JsejuX3nleeOzC6Os3hf9GD7Kx2zK0e/VQLxlcSIK84D7YsV
 +2po4PqxZz4qEvo+d4vj52ouW+IFDIPpRNvcTfb4EKa32QNVYZKJflrg9UYB2ri91wsmYvcFwAc
 MH+1UL9tYiU+Y7vRBry1YO+jfLrjsJ0l1NC2kDLGaiIgH2J5GuTJpk3RoKr8MdW7qfFglFiEv8V
 /xkaa6Ee+Pj1PJWsSFA==
X-Proofpoint-GUID: 5d2R6mSfjMPXtm9uNvaKowQnNxVchmiK
X-Proofpoint-ORIG-GUID: 5d2R6mSfjMPXtm9uNvaKowQnNxVchmiK
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE0MDExOCBTYWx0ZWRfXw3GV1eXlSTre
 7Wa8ASXgH/smnG1nHYziou0PwQtPCVYmRl8fK2AImYOuP2W8r6UXqdRWL8JAg/yWihPPX5NrFM8
 RJqpRN8cqIOLHQqCRVI6T1EGagoOAP4=
X-Authority-Analysis: v=2.4 cv=cMTQdFeN c=1 sm=1 tr=0 ts=6a7f35b0 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=iLqgmErQAxjCjdq5jj1Aqg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=Et0EIf6WsffwpvoSOt8A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-14_05,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 spamscore=0 bulkscore=0 impostorscore=0
 priorityscore=1501 suspectscore=0 phishscore=0 adultscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608140118
Received-SPF: pass client-ip=205.220.168.131;
 envelope-from=pierrick.bouvier@oss.qualcomm.com;
 helo=mx0a-0031df01.pphosted.com
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

On 8/14/2026 1:05 AM, Philippe Mathieu-Daudé wrote:
> So far TCG plugins can only be used when TCG is available.
> Move the arm_do_plugin_vcpu_discon_cb() call within the
> 'if tcg_enabled' block and wrap the definition with #ifdef'ry.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>
> ---
>  target/arm/helper.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 

Reviewed-by: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>

