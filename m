Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9168CC5DF8C
	for <qemu-arm@archiver.kernel.org>; Thu, 20 Aug 2026 22:20:01 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wxB6j-0006di-Cx; Thu, 20 Aug 2026 18:19:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@oss.qualcomm.com>)
 id 1wxB6g-0006cy-DO
 for qemu-arm@nongnu.org; Thu, 20 Aug 2026 18:19:30 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@oss.qualcomm.com>)
 id 1wxB6c-0000ZS-Q5
 for qemu-arm@nongnu.org; Thu, 20 Aug 2026 18:19:30 -0400
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 67KK7pUI807694
 for <qemu-arm@nongnu.org>; Thu, 20 Aug 2026 22:19:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 MCP/4Tpj4Rt6jZVYxlylT8YisheI9rTpbUpChraRA4c=; b=MXVSe8w1vcamX0lA
 VuAbmpNNbIzWGWLxDP5H8IEiIBo5zu0i8Il/9RLgX6W5SXCnccytXMPeNSQolH01
 zpwERClQtmUqds4LLnzq0Z38+WddhqEjevZ5Ssb01SeRwah0Si02QtoGymesIY1o
 ZuWirWYHptCZKT3tOjxDW/mv4NP16PabzNtSEYhuDwKihxzsei5x0Ca63ffg6E6D
 G4kwgRVEBAvzRm3nQmHklHwYu4fkwt4Sv0n2OKOr//T+PfNmOm9+FisrF9aczY6t
 JeKvjnDfm8YNjfvnpQSjGgzbQSiZMAt+OZskO3AousYUxHkHU2Q2VS5jp1lKyEuE
 7NPVsA==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com
 [209.85.214.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g5xgcbf91-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Thu, 20 Aug 2026 22:19:25 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id
 d9443c01a7336-2cec4226c70so4374905ad.1
 for <qemu-arm@nongnu.org>; Thu, 20 Aug 2026 15:19:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1787264364; x=1787869164; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=MCP/4Tpj4Rt6jZVYxlylT8YisheI9rTpbUpChraRA4c=;
 b=h3Y0ibpfAZ+hDRvSwMFrwDE3jucsusztXj9g29VmWuHFuwoH2fBqZ39DTRiQSEJW94
 qa3snyo6FpBA2YvLoT2Gqezui6bbSTrmeZUVZU2H3kBzs3HpKV/0+jhV2/aPhNCl8teG
 h71+iBPj1HzI2n5R+LmVAXB41KtfRt43hOYMir1E7jkDCa2wGW7y4NNHCAEzzAYED6fY
 /gzixc/3QcCSbMnRSX1mobFkzwlTfFqb5osPhEfyijsi8z14PLiFhYaZbKo9pVTiNIQ9
 z0Goq3cvMlrGJPpDKZH3O0KqBc5nBjyZr8RfnoO5LsJm6bwQ85pXN2l0ZMvE93USrTM7
 CqhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1787264364; x=1787869164;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=MCP/4Tpj4Rt6jZVYxlylT8YisheI9rTpbUpChraRA4c=;
 b=GrZZXgPDRq6Ytts5mUtpppngnSHyKsqYJMOuP3JzmyJmiPIuuUUJkZVK86uFoHgvkS
 5FThNuvu9bjMdoZsnI85asI3QU4hjMqVkBPRneF4tjySlVsPvmHlwc7Uoiy0OjTV2p/v
 L3oY+Cj36Zm3bl4nxV/mGDHEP15Dlp1xjKBRvUBBF4YgE3NJrbPKmr1mz35so0N3oYRI
 ucyVLcAli/ki5AP0W1ztARJjss78FQlpWgIKMD6cK9n+SSTKJL6VPcU9juaEbpq/MR08
 aZ93HkhtF6Eswtl0hR/XrdXPVvd3E1Gwj44MN3EKXShQFUDqAzLJO02ZJVUQAHwK31Kp
 xcmg==
X-Forwarded-Encrypted: i=1;
 AHgh+Rofirc7ndFxzTotR8awFiBGzoCUFvaySpLm7U58xvuO0olJtklwBmFSbn1BsO7a7NZPo6vN0aX0Mg==@nongnu.org
X-Gm-Message-State: AOJu0YxQ1N9YT6WdQFTtiv+TWH29hCcA5ARJwAYKn4X1rcTuS4UC1S6z
 y5flgXyxhNesTfcBBCw8dw173kQwkn4nT0nCoXOY0RSBJI+93AkD3aEYxL4KPh+u3b9xEsX4Q01
 Gnbv+zqYBOgp+FMAJ8ChH9shh+yyxl8cSucyLUu0hTe20mPPjaw7i86U=
X-Gm-Gg: AR+sD13tM0VAB0UubsxxdnRj+lgqqO7deaB3t367kKnjozwahi1UNz8XuHPsI8U/ipL
 V9bZMiwOGbnIDAx/PD1oAh9r4Uh6fNpu/yzv94qjsbE5COm6HoxIv+if9J098iQAkXRNixBI6JJ
 cH4pBIR8522ebjVSvV4mguLo/pQghleiesWi2lXvbsCZoJX4gstrilAFtXkYYzHUPGFzI4cJaPT
 XOHxt5p51ppmB8Wdqbn9a1m4m4TpZPbCuiLUCD+Myawbw/ZHBtgc/izK9j1XvzO9p7OkktOwmGy
 97eQj2iWQ+LrAAQu65wRQoAkMVmAElcL+JEyN4/8yOnFuL3gVtREYCk0HasjASE+MvJSOjg911h
 AfYRSNncaMrT6SGX9p+kAHJpgszZp/d88Cls06m42tuRDMGuDLxqr83ydprr+feape8Mr
X-Received: by 2002:a17:903:b07:b0:2cf:afe8:b722 with SMTP id
 d9443c01a7336-2d64afe960dmr33458785ad.11.1787264364579; 
 Thu, 20 Aug 2026 15:19:24 -0700 (PDT)
X-Received: by 2002:a17:903:b07:b0:2cf:afe8:b722 with SMTP id
 d9443c01a7336-2d64afe960dmr33458085ad.11.1787264364143; 
 Thu, 20 Aug 2026 15:19:24 -0700 (PDT)
Received: from [192.168.1.199] (216-71-219-44.dyn.novuscom.net.
 [216.71.219.44]) by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-327d01ff056sm11949406eec.19.2026.08.20.15.19.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 20 Aug 2026 15:19:23 -0700 (PDT)
Message-ID: <350471ec-9d37-49df-b50f-ea061288cb95@oss.qualcomm.com>
Date: Thu, 20 Aug 2026 15:19:23 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC v5 06/28] hw/arm/smmuv3: Plumb transaction attributes into
 config helpers
To: Tao Tang <tangtao1634@phytium.com.cn>, Eric Auger <eric.auger@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 Chen Baozi <chenbaozi@phytium.com.cn>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@mailo.com>,
 Mostafa Saleh <smostafa@google.com>,
 Chao Liu <chao.liu@processmission.com>,
 Jim MacArthur <jim.macarthur@linaro.org>
References: <20260813161515.2788900-1-tangtao1634@phytium.com.cn>
 <20260813162446.2806393-1-tangtao1634@phytium.com.cn>
From: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260813162446.2806393-1-tangtao1634@phytium.com.cn>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=GPM41ONK c=1 sm=1 tr=0 ts=6a877d6d cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=iLqgmErQAxjCjdq5jj1Aqg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=fgrLqfBXAAAA:8 a=EUspDBNiAAAA:8 a=ONKyKrwD9wkXZehxPvsA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22 a=_Ge82aPy-h_wFa7gWU4u:22
X-Proofpoint-ORIG-GUID: qHiGpP-JiZAqpOMUT74n7hjQHsVlW1LX
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODIwMDE2NiBTYWx0ZWRfXzPpiNL0ag4iD
 oD7EgTj4Zo0SFqjcYX9hycE2pwIiWtKhyrMoKjoLi3Kq6PFyl7XS/TAF+8j3djLrz0ZBDYTRXt2
 27MkualWYxdFD65KRHLT2DV/3Hr3kh841eyQXrzLmWKlZe7DbsGrEy45Y6pO7r36J9JO1FPXU2V
 Y0fVE1hS64GMyAufOQ5u5Kdz1C0jJhqla/Ovh4z7cy6mKGHoy7tG2nvZGQJWI15hg1YzMYCH2h7
 ay8oYin+gWObf4rPwhONHsum7E10J27k2lOPn+NoipqJopbHM1a1Fa1/qcZD1RdcsuDN3Q8iJrz
 mGqrx/K5irNZTUnYHQbtvGzEFZr2PpgiLtOqGiMxWA4mHtKvaD332de9LMlqWO0evvI2oXHnNE4
 URead77rhqye2a3CyhplCy//gw+omCKfY0Jjhi+dpEZJMJuBC4ULnVH8ORUIGNQQYsFvfW8bStr
 4BbQbpClyjyRZ0rluiQ==
X-Proofpoint-GUID: qHiGpP-JiZAqpOMUT74n7hjQHsVlW1LX
X-Proofpoint-Spam-Info: AW1haW4tMjYwODIwMDE2NiBTYWx0ZWRfX/7fXUH3RodAi
 YpEH9MHhZEQUs4nADPZqh02ZxcSsHseWoKUBiBV11qC94R1QZp3h5ne5gUxfbv437pC4gGd3m4o
 YKI2IU9Z7Gt41nIxnH1xPD313ISi9Zs=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-20_02,2026-08-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 spamscore=0 clxscore=1015 impostorscore=0
 lowpriorityscore=0 suspectscore=0 phishscore=0 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608200166
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
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

On 8/13/2026 9:24 AM, Tao Tang wrote:
> Introduce helpers that derive MemTxAttrs and select an AddressSpace from
> SEC_SID, then pass SEC_SID through the Stream Table and Context Descriptor
> fetch paths. This makes reads of SMMU configuration structures use the
> corresponding Non-secure or Secure memory context.
> 
> To support these helpers, include hw/arm/arm-security.h from smmu-common.h,
> making the Arm security-space definitions available to the common SMMU code.
> 
> The accelerated path remains Non-secure-only and therefore passes
> SMMU_SEC_SID_NS explicitly.
> 
> For now, the configuration cache lookup key remains based solely on the
> SMMUDevice pointer. It is extended with SEC_SID in a later commit. Other
> SEC_SID-sensitive memory accesses that still use the Non-secure address
> space are converted in follow-up commits.
> 
> Signed-off-by: Tao Tang <tangtao1634@phytium.com.cn>
> ---
>  hw/arm/smmu-common.c         | 30 +++++++++++++++++++++----
>  hw/arm/smmuv3-accel.c        |  2 +-
>  hw/arm/smmuv3-internal.h     |  3 ++-
>  hw/arm/smmuv3.c              | 43 ++++++++++++++++++++++--------------
>  include/hw/arm/smmu-common.h | 10 +++++++++
>  5 files changed, 65 insertions(+), 23 deletions(-)
> 

Reviewed-by: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>

