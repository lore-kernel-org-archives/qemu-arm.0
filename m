Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21E96C61DD3
	for <qemu-arm@archiver.kernel.org>; Thu,  3 Sep 2026 09:51:03 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1x245p-0006ud-5n; Thu, 03 Sep 2026 05:50:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1x245n-0006tp-6h
 for qemu-arm@nongnu.org; Thu, 03 Sep 2026 05:50:47 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1x245l-0005nQ-Mv
 for qemu-arm@nongnu.org; Thu, 03 Sep 2026 05:50:46 -0400
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 68392TFf4187648
 for <qemu-arm@nongnu.org>; Thu, 3 Sep 2026 09:50:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 HwVjxPgFU+G8RlVgpKGB/iDqz2ywiSx2v/CV7c/jNZo=; b=YElIe/WeThi9PQH9
 m3wuT0ky1OKb1KvOWq2Y4mSgF9F8luKEScybeBom1DhSxmhy1l5bMVFw9eWuQ9kc
 6k8Ar+FdsHcFsP3GHcG27KSBJSWdcyriyoy2c6g5U/sIq4VxfOMfCmhy5Gm+Ph6K
 eejW8cQ3Z8/fqNlt8PLNN+9VFXO3Cd0/YgcYtHMap7bq8SR9zgIdSZphAsb+0mFN
 Wr7H5SPqAsSiQyX9JvxZfeWgZA3zGbvbRsnW/R1joc5BV5e1iBW5y4KfJGnnoWGi
 2MlUMixvvxbtiH/52o3FFrx/OGN7+ekHmspw7Oum3z9NT6XFaAldMgzGYNuXDM8T
 F98Yng==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gepv5v12w-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Thu, 03 Sep 2026 09:50:43 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id
 af79cd13be357-936708f129aso341228585a.0
 for <qemu-arm@nongnu.org>; Thu, 03 Sep 2026 02:50:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1788429038; x=1789033838; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=HwVjxPgFU+G8RlVgpKGB/iDqz2ywiSx2v/CV7c/jNZo=;
 b=T9MxKjDgB7KDz0Hk1oqTZVS+jmqxClN8/T9GV5IEPNtNo4hL8SdyE3VqrcdGiwaTpn
 /rR/zHAfbKHZKD1vlgrZFfLoxLRW+pdemHaQIdU8fKKmtEaeve6AIK0HWHwGqjM8u4Y6
 tWqrhZVk3oqK6VIV+GA+Hnu6OBo5L/Q/mYIU3A4dycs6iQ08DQYMD6XBDa55k4PgFOFx
 Z9Eh6wf39IaGgDzyzoRZlJtSadtejioZWgbgu5YWiH1qE3C5XNtuRxjw+S1nFYS8Jgs7
 H8O9eMc6XJAb8Cj9KUZ4K5Ubk6QuzxASCAZCTRiOxFjoWi8wz+RCSzWhHhPAfzvDN0P/
 Hb2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1788429038; x=1789033838;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=HwVjxPgFU+G8RlVgpKGB/iDqz2ywiSx2v/CV7c/jNZo=;
 b=BEsuFVoJfe79d8S8L3qtM5WCu1VDdQpwYiPMO7UyYXKO5VHUUO8ALOoh6Czu2eBlqZ
 W1hdBPoa51A7/jB5jQSJKbeWrlnkePDQrjiIZP0qM0u7ULQYQwjhldbv7dVFIG745Z4V
 /VssyR1KrDTJwLmDRcwwLXPb20jNxSrHpqceToLJ67r5HCSPXaz8m30OdMKAzEPjUTQo
 uF3SeayFkMgbDXek5UePdfEvPDQ6mqAyo8D4yJwbIHXtubVHDOVOCVL102htw5dRBoX2
 fb5IOB9qtlUY1fPfR5Qjz8ZAq43yBWlkPOPpbX0FyUCdyLZjT5GIfIRKI8l8FFI13s6q
 cAMA==
X-Forwarded-Encrypted: i=1;
 AKwUvBwl08wYLDs1Twi7KASWjz9cPigZsYzPHJa8KE6ewwOtRazGsfA0A1zlBTIsJYFSV5ixB+5HxfoiQg==@nongnu.org
X-Gm-Message-State: AFuF++n7J1E5KK00xZx0pGVU/3cb2g0hhDdvnXENQN1+47j1BTRMvGTV
 VAafYZ50npTJJlnAja6YYeQKYVnQY+8XWxG1HBgol7Nb7wtpLrDh1r0FZtelSdvgO3DmkJQ3KmJ
 fUVBwamFlTHSAeV0Ppbt6515diS8tQvw5CBayBKIH+XqmTCvwyRDsTSc=
X-Gm-Gg: AYBFou3bnj3POzZJ7ZM0a1gbGO1d3FIso3EsYsFtmadDCNdhXGP1TAyiRGNFixEi0pq
 BBxKa1Bxp+Qg01axpDhSH9jAfeQPaJyypzkZ4hz7PYiX67Omr3M1AbJ2nfemGbgSSisThrAfljt
 um9ZVjCIUC0HGiTYT68fYezyh0yESeSA0XukpOOnWPIcIYw6hjy8YB+Au5rMghPGF2ahNFY0Vg3
 9OEI3BuE9hJru5Se5WUbZcqcXPsLTTzMONmEgqN/s6cY2SWbctKdVWKZVoI9I4jBY0c9UyB2NVU
 7E2m6mU6Ys4lbzkOBRa0RdKg2GHAgCe5DI9PXGvMExlP+Y/vjJvkQ3vdaX+P8XDx5u6PutKI1T9
 D1sICM0b1P1jFt96+g5wMo47iig2KEt55nQ==
X-Received: by 2002:a05:620a:f13:b0:937:2ac8:bbda with SMTP id
 af79cd13be357-93960f52da3mr1151199985a.35.1788429038139; 
 Thu, 03 Sep 2026 02:50:38 -0700 (PDT)
X-Received: by 2002:a05:620a:f13:b0:937:2ac8:bbda with SMTP id
 af79cd13be357-93960f52da3mr1151197785a.35.1788429037604; 
 Thu, 03 Sep 2026 02:50:37 -0700 (PDT)
Received: from [192.168.69.200] (pmd666.hd.free.fr. [88.187.86.199])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49ce47b9817sm102512275e9.1.2026.09.03.02.50.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 03 Sep 2026 02:50:36 -0700 (PDT)
Message-ID: <509eba9a-9956-4be1-8bca-fe261648d58b@oss.qualcomm.com>
Date: Thu, 3 Sep 2026 11:50:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 01/21] target/i386: Remove const qualifier in
 ptw_setl*()
Content-Language: en-US
To: marcandre.lureau@redhat.com
Cc: qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Zhao Liu <zhao1.liu@intel.com>, Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-arm@nongnu.org
References: <20260901095229.72018-1-philmd@oss.qualcomm.com>
 <20260901095229.72018-2-philmd@oss.qualcomm.com>
 <178826135506.50872.3543134957639273965.b4-reply@b4>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
In-Reply-To: <178826135506.50872.3543134957639273965.b4-reply@b4>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=T8y8ifKQ c=1 sm=1 tr=0 ts=6a9942f4 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=20KFwNOVAAAA:8 a=EUspDBNiAAAA:8 a=tyUD48ZzS5WoX1m2FUMA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: 2_h3z7SqVLklb19OfEKLiqEtB8XRT-eG
X-Proofpoint-ORIG-GUID: 2_h3z7SqVLklb19OfEKLiqEtB8XRT-eG
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAzMDA4NCBTYWx0ZWRfX0z/0EMO79qqF
 q5oWHArJezsM68BHUB8vzLY+ECeP/cSjN2z6YS6xYIXFIMCF8TlkpV2WSgXxzSY5Z23AcuDCmVH
 xCdORU3LMgrBryKlgljbMxpMURTNNvLDNEMjH9v4LPuGdwDwNF4erRl+I1ySn95Qy6VilU1J7Jr
 NC/O5OploUYn7H8ZnjQ2+th0QtRTbUx+ammtkJyVckv4qvE2CcAhHGQ+XUVjCLl5Mpa8d50kOh0
 HKN5Hp0+lH095wWA4BRa4wmIFAyKwqhuRuIu22R4CrUTZHBhQZlYndT58AnnFQggFOSwjc2gOWi
 CNVNfB9TR82ysR3sgHFUbzOQc0Pb8tk3TC80UvdmSdv4qwLWK+bRfGUsQpj03mgUY3+iVHq14o9
 tJ7R/djpdI1B0qET3en/dy/nRT1s1t1SW/Pc3KwcDLKN2JWbmb+OX/vgXVFZAf9gWbfad3FO0xO
 q835xNm2YtroA8lg54w==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAzMDA4NCBTYWx0ZWRfX8bwk/Jmq1y5b
 6oNUqgUzRi3nKsqGryt9bwkvQOWXbJ8r2V2HalyceG5TxY+f7uyxD9jm6wZ2bxzoVXDwrX8r7M7
 qdzzhSZViWy86i9TWjmZRm+4k8PpkjU=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-03_02,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 impostorscore=0 adultscore=0 spamscore=0
 clxscore=1015 suspectscore=0 lowpriorityscore=0 priorityscore=1501
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609030084
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

On 1/9/26 13:15, marcandre.lureau@redhat.com wrote:
> On 2026-09-01 11:52 +0200, Philippe Mathieu-Daudé wrote:
>> Both cpu_exec_start() and cpu_exec_end() take a non-const CPUState
>> argument, however here we get that argument via PTETranslate::env
>> so @in->env can not be const. Remove the const qualifier.
>>
>> Fixes: 4a1e9d4d11c ("target/i386: Use atomic ops for pte updates")
>> Signed-off-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>
> 
> I think this is not really a fix, but more like a style/contract thing

Well otherwise I'm getting a build failure (discarded-qualifiers, but I
didn't record the output). I dropped that Fixes: tag, thanks!

> anyway:
> Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
> 
>> ---
>>   target/i386/tcg/system/excp_helper.c | 4 ++--
>>   1 file changed, 2 insertions(+), 2 deletions(-)


