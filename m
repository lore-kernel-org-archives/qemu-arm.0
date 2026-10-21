Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C409606A31B
	for <qemu-arm@archiver.kernel.org>; Wed, 21 Oct 2026 16:22:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Myuuy31Q;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=K/P1Andk
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xJZ4f-0000EN-RQ; Wed, 21 Oct 2026 12:21:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@oss.qualcomm.com>)
 id 1xJZ4Q-00009Q-4T
 for qemu-arm@nongnu.org; Wed, 21 Oct 2026 12:21:48 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@oss.qualcomm.com>)
 id 1xJZ4M-00058I-Hf
 for qemu-arm@nongnu.org; Wed, 21 Oct 2026 12:21:41 -0400
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 69LFTxfo3726122
 for <qemu-arm@nongnu.org>; Wed, 21 Oct 2026 16:21:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 kuGH4Mj1zCNoqyNlDPCsqdaJjEA6kVdxAiEvquw7MxM=; b=Myuuy31Q8gyQtoiV
 uoN9afzxVTUCErOybEOPkUhXjUq9Vnj7nM7RbeQy87MJCDjb5ty2xG2A4XVY9ZBk
 8w/aVMmbNf8dr2D85SQnGry8TU51lcW1XeK07W/8n/GQeFA+PrROQ2jsEdZg6WO7
 fmT38eePavNaW5Imvty2Dzkq46sVtg1KALpkxD6o0fFad9PRFhA0wU4HsLYaThKm
 peYlGJjkYYqRZenQEcKAk1yB5ezwYW6/UAhj+iXMaa7nLobfnC57pbv44pEX3POK
 HUHLuYembhbxjk8Q/aBu7Ahq9hrbB6nITEe0Pi1aYsmxFdPcfWkm41HwpBtCYYE2
 Mh1VdQ==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com
 [74.125.82.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hesy7a1en-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Wed, 21 Oct 2026 16:21:37 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id
 5a478bee46e88-35c5aef2a74so497292eec.0
 for <qemu-arm@nongnu.org>; Wed, 21 Oct 2026 09:21:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1792599696; x=1793204496; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=kuGH4Mj1zCNoqyNlDPCsqdaJjEA6kVdxAiEvquw7MxM=;
 b=K/P1Andkqli2dKpTvyMojDvNVMjfcLsfgxCFCrWyrftzeS6ZaQzEZRkdRAdVNfbd15
 wN2VzziYCLvzrNEqNYZeF/F+GHtx4q/Z565ZbsReRtP1prMcFJ7rbCew6vRyJSKN2D1M
 dVPmBVcdZC0rjei6UseRoNSSuk2Z7Rvj3bmkh3/OmETVfPrZQdfMakPPFXoCBNx/Rgpf
 H9+t12tP7Hko+GS3Jhhtck2xfbGKp+s3CK03iyQ6SPny1uiLTqOkNdbGg4BKbzNjPHat
 /xpofhQQzT+VMH0DvM+e4LGhIa0OGtMDAWAnNSQWY26eV6N5kSZ30X37pSnOKfXhGo80
 5JZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792599696; x=1793204496;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=kuGH4Mj1zCNoqyNlDPCsqdaJjEA6kVdxAiEvquw7MxM=;
 b=HpxW2Go74hA1/Z3HMMuAyrEY3azf3QveJGSCNjeOo9ju5pzDCahnIWriwUtoU8nfvp
 u1Spp0Di2m11guVO6jJyE9GnyilThLQjk4GyDgDU/XJjMCvS6GqEI1eEmkIY4Uq7aK+0
 o1zzVv31tQyjR2bYpBG31W6DOmysKF/kTk9MOhCLoz1SJfRIDDMucO7OgZ/ppFpR7Yhi
 4GAET6PSG/tozYC3TrRbuBr3U7NZjG+0JhS9TEDmfpzM47sAwRB7R9F4A1JkhP3fit+x
 9poVwe3h7o8ZF9HUeRxldSTmVMl7vR5uWRac/IWZmkgO7vK1FhNxAH9mVVFeymsg5Ubg
 kiTg==
X-Forwarded-Encrypted: i=1;
 AKwUvByGK4wuaXAI8d/iMUwQeCFqSz7QLcBE9CEuy+wVXsQGnd7EQNdMZk9SLkuJX+UIEN3fSlhytURJNw==@nongnu.org
X-Gm-Message-State: AFq9FYLIgL7xMLKlHmyvDU4t1WQ0KUXJUR0mf+w/Z2/DjY7Evokdf/AJ
 FXWf5GFD32o0Yyi5ddmkayszLJ7UuFXlz9GIxyyhcYBdekz6rUDK9mEHVVnTFMR1vI4JG7tMM3L
 L7T/iWuGpvRgWV8Y+TcX+yAFZyzZmVEFS3575XdoNgIUBi95H6KDZkQasjv5LfFY=
X-Gm-Gg: AYBFou17OWC51QrbEUlqtSf20YzyYbCXOqMR7b29KfSLvnKZozNSKgGUexHB+gCY+sX
 /wsd5+j0LzuFth/sg8lKRKcwpN3/MyxPNxTeRMqMKtRxWuhzHeVuY3QtUyZqfnOm3Ng3fVS7diI
 ozC6HVeYR9N8ASpfdJfGRx+buUhQawGFsW3DfTy9KzW2lwRtqJ869itmH3GY50c4De3yDCcTmZM
 UcPRcQZTTQosgUr6HvVVd79M3X1XuczHGohme3ntb+kTS8OT+hAHR2E5eGCRtP3u5EfMS1eH36a
 dOvHePE2/V8MGTCJmuXxSH225fiEdrLixbtUy1SrEcIkZ0kzLQnjJ943hH1bbuhNsTZf5H0CsdM
 mQhZEHdq+EDpRX4mav05ZVhtf7/fh72tEPfVDoy364nu9qFfgdKRcSKaXJ1SkRwhl9eCb4w==
X-Received: by 2002:a05:7022:ea8c:b0:18d:ac5a:89ef with SMTP id
 a92af1059eb24-19140a1df01mr2133172c88.31.1792599696022; 
 Wed, 21 Oct 2026 09:21:36 -0700 (PDT)
X-Received: by 2002:a05:7022:ea8c:b0:18d:ac5a:89ef with SMTP id
 a92af1059eb24-19140a1df01mr2133110c88.31.1792599694879; 
 Wed, 21 Oct 2026 09:21:34 -0700 (PDT)
Received: from [192.168.1.199] (192-80-163-190.dyn.novuscom.net.
 [192.80.163.190]) by smtp.gmail.com with ESMTPSA id
 a92af1059eb24-1903bd6b7ccsm6747992c88.13.2026.10.21.09.21.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 21 Oct 2026 09:21:33 -0700 (PDT)
Message-ID: <b19a1fe8-a7a1-4089-9b25-9e4874d2a89e@oss.qualcomm.com>
Date: Wed, 21 Oct 2026 09:21:32 -0700
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 29/33] target/sh4: Use a static table in
 sh4_exception_name()
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>,
 qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, qemu-riscv@nongnu.org, qemu-arm@nongnu.org,
 qemu-s390x@nongnu.org
References: <20261021031407.24862-1-philmd@oss.qualcomm.com>
 <20261021031407.24862-30-philmd@oss.qualcomm.com>
From: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20261021031407.24862-30-philmd@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: 6KxW2UXdpq5j5FQYyqnupceWUzFutZLA
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDA2NSBTYWx0ZWRfX1wxq/QECvNvQ
 0ImcWwOw9WK+ZOkTLGKbqpA0evT5Ae/KS+/6f9djMaDAjMLM97u+s1AReaRpaFDZvyhiz/Ykz/o
 8Zo3FPRagYkFy4g88HyH/nwpjLpjwqrGULUv3vF6EUFfLMy446rqZ8a8IzehoXLs9IboFSzeHHq
 b2A7Xgv2SPbi2yIYN99l7deSQ58zJc2Fl7WEtYMATrSXhAA1di70F3uxYV0SKL48B6m0/90CyJr
 KTjoubBvWlQZOMYzZzDELBrdE4BkPKVNAj8UckncHInPq5KhYmvES2gBbiBh2rwOnjX0HnxNaZp
 e4Lj1L0p2WcMz3CrTtvOd/fonoAIHg7RrTgdwUAPzDaVOqYrIwg5oAAexBCa3rYQa/BVyoMeLh2
 DvXLa3XLdguLejQFFith3IkWltlzLPdzTLSNdDwPUq0e1RwBzZRaBfrXZ9NzUOZMWv6wpDhlzKY
 onIMJHp0usq+CDjyugg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDA2NSBTYWx0ZWRfX6n3It3JL/cMP
 dbVqVAPDwQ9ipMnduGlJprAEYgEdyVgD78HOKczkIZlXuuSf3/QHQnuIa7KL33F4OIq1h7Qukft
 KjkF8usCqUagbdNKSzUS2/UO6xxgvoE=
X-Proofpoint-ORIG-GUID: 6KxW2UXdpq5j5FQYyqnupceWUzFutZLA
X-Authority-Analysis: v=2.4 cv=IPaXmQvG c=1 sm=1 tr=0 ts=6ad8e691 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=9852oil1ID9t5xBSyQ/BEA==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=wQEKYDyfpQnk0JwDFccA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-21_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 phishscore=0 lowpriorityscore=0 suspectscore=0
 impostorscore=0 spamscore=0 priorityscore=1501 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610210065
Received-SPF: pass client-ip=205.220.168.131;
 envelope-from=pierrick.bouvier@oss.qualcomm.com;
 helo=mx0a-0031df01.pphosted.com
X-Spam_score_int: -2
X-Spam_score: -0.3
X-Spam_bar: /
X-Spam_report: (-0.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 SUSPICIOUS_RECIPS=2.51 autolearn=no autolearn_force=no
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

On 10/20/2026 8:14 PM, Philippe Mathieu-Daudé wrote:
> Replace the switch statement with a static lookup table.
> 
> Suggested-by: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
> Signed-off-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>
> ---
>  target/sh4/helper.c | 65 +++++++++++++--------------------------------
>  1 file changed, 19 insertions(+), 46 deletions(-)
> 

Reviewed-by: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>

