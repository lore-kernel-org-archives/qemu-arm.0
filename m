Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1A37606A319
	for <qemu-arm@archiver.kernel.org>; Tue, 20 Oct 2026 19:06:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=GqYByBA9;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=AlurBNtT
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xJFAY-0000xk-6e; Tue, 20 Oct 2026 15:06:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@oss.qualcomm.com>)
 id 1xJFAW-0000x8-Ua
 for qemu-arm@nongnu.org; Tue, 20 Oct 2026 15:06:40 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@oss.qualcomm.com>)
 id 1xJFAV-00064t-E5
 for qemu-arm@nongnu.org; Tue, 20 Oct 2026 15:06:40 -0400
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 69KGtWDA1375701
 for <qemu-arm@nongnu.org>; Tue, 20 Oct 2026 19:06:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 5dYI7JzqGqSpbnLtC5dZVXwoYlDYX7rcCsOAZBdFXps=; b=GqYByBA9DBdUnMy9
 P8en+2xHCDlzA7OlTQBeqjfJOsv97bWJa0cSzrv2yJC7JG3b26cVxuD2rNuka6O+
 LNG3mDfvk9Qf9fx71EP17sVrnMp5TvcQdyEweZ7Vm+gl6QWGRCO2ZU8bQ+LjBXgU
 jEy3Wf6FEdHI2rsTyMHXO+dHPp8I2GkiDPHHSaYutLhs62SezuNbXnjRBNQ5jxt1
 Mp67k2cn0lXYjlzfRrLgWO8tw5VpjPlSzZWjmhBWtoE0K6fouoUM0twN6epQEt95
 YgCQG3XEz2Dz3B9crY6FH8dBAL2OnD2zZbm8yccadKQ0pHyerItiqgkCWBMpVSc2
 5fT7Bg==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com
 [74.125.82.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hebyd0jy9-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Tue, 20 Oct 2026 19:06:36 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id
 5a478bee46e88-3425098ae4bso1598695eec.0
 for <qemu-arm@nongnu.org>; Tue, 20 Oct 2026 12:06:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1792523196; x=1793127996; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=5dYI7JzqGqSpbnLtC5dZVXwoYlDYX7rcCsOAZBdFXps=;
 b=AlurBNtTn48z5Z9259vP4HUHBrFzReEQtsV2blAVdm7tK5rtepqZvGEQOvd4kCWrRL
 PqbWCfzyXMu0QTe5whjDy4UpU5JuXjoXEzcX1Y4+d9DhhIVNSMDOoY8NBz06ojQU9qwq
 it3EfJomhQGPAj2D0AtZJZCJ6yxLlCgUCPLViaO3GWBoVDqbl+cCltbSvUPUkuovcjnJ
 bDrqRswzTLmSU20qeojcAm8EEn9z5sZ1LwEZStxiHwP9ciHmnbqMxQaArt3cO49RTgrX
 4DzD2dXpT+AYt2uAI9QkP1DAQg8FsQs255k7SVi+1qUrBYzKABNK+L+uPEdRFIduQq/v
 skKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792523196; x=1793127996;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=5dYI7JzqGqSpbnLtC5dZVXwoYlDYX7rcCsOAZBdFXps=;
 b=gh+2KCKU6f184nuXEW9NoAGPoni2xgBZfbSkvUSfk/bNjkgN0OduU7nqNAHD6hROHK
 5zQIbpQfsWfpyrbP5DebYexEIrEYlqjsBdh2n6FhgFvfPp903nysOQar3YhBnk9OIQIH
 ga4aQTWC9KTbJF88MaDkpvsEz9ZFvIsuff3kgPBIwaLzRlUGZRaQZcdCt/D3ettmMcdg
 RbL5AwbLfscgduc1KKMIcRjqzZa2jVHVBAMKVQfL32CMmnoesMTH458PyShEZtrVfdr1
 x1mwLFb11It/NsDLolUkFOkukhHKSdg7Mys+Ez1M9FmwY+RwxPCHb7Ql5/+6//jQIRVH
 nAnw==
X-Forwarded-Encrypted: i=1;
 AKwUvByJJ7oCTydXsPeph+R+GA/MZFD9ldR/ehxDA+9jH/AtAGq6i3/r0Oq/Adbmkrgx1d/izWxcR9F8Rg==@nongnu.org
X-Gm-Message-State: AFq9FYLxHzEF0y0bNAxiM8G95Js0S64FGTxiJCAdwSJgs6hfbejs0bec
 7utGRuIUVmfkx78Ojtxn7w1lwUlL2f4FONAr2jswD2IoSbR5U+cbxQkPoINBmWjF3seX+vj5T1a
 cNrn0KOgWy0xA6AtgAx/T5F691G8MdQqB8xqrj3W8njLMtgwBH58BDLA=
X-Gm-Gg: AYBFou2vg+B855B/pfZKLf/9jYJ9+eTPMnQrN5ySxQV+Kf+d+XleAhMjomX95xMKsvY
 Cwj/j4TdO5uCH4So0yHv9+PgPyAciQwitGmYRnotGfgsJp92unJC+yUyhoKp4MOvtfaNhZjC5hw
 jZq70+btAk15xYIR5N/jEKJw54ioBy5USADD8UDuFW1Vhd1a8VGnLPoXg/n3klyjfpAvG7qzoqY
 kyvgHIBcU6rMhvlHxbV7vaDXW2w+5ruoJ6gdGjvW3DWD5EUCjAzanG1kn1sA4vs2g24l5wP640m
 JtulukJSBPLkN7i6x0vrKMVjLh8ymAXhAmL8jWv7oLlJu0wRrP/vGQL7Tp2SaQcUkbGDiM+jo19
 ShLcR7ZTce2n+gyOIf2SHn2N8ojsAVjlKUgjaUxnDILypAnBbU6hf7U2zbq2Oaq4zm2gIXg==
X-Received: by 2002:a05:701b:428f:10b0:187:5a5f:3b27 with SMTP id
 a92af1059eb24-18dbfbbfa4cmr3461692c88.17.1792523195759; 
 Tue, 20 Oct 2026 12:06:35 -0700 (PDT)
X-Received: by 2002:a05:701b:428f:10b0:187:5a5f:3b27 with SMTP id
 a92af1059eb24-18dbfbbfa4cmr3461670c88.17.1792523195216; 
 Tue, 20 Oct 2026 12:06:35 -0700 (PDT)
Received: from [192.168.1.199] (192-80-163-190.dyn.novuscom.net.
 [192.80.163.190]) by smtp.gmail.com with ESMTPSA id
 a92af1059eb24-1903aff3481sm593002c88.10.2026.10.20.12.06.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 20 Oct 2026 12:06:34 -0700 (PDT)
Message-ID: <c1cfda13-9c37-485d-b148-f5c2c382d34a@oss.qualcomm.com>
Date: Tue, 20 Oct 2026 12:06:33 -0700
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 04/27] target/arm: Register CPUClass::exception_name()
 handler
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>,
 qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Peter Maydell
 <peter.maydell@linaro.org>, qemu-arm@nongnu.org
References: <20261007094516.75732-1-philmd@oss.qualcomm.com>
 <20261007094516.75732-5-philmd@oss.qualcomm.com>
From: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20261007094516.75732-5-philmd@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIwMDA3NiBTYWx0ZWRfX3Y9KD4/9VD7r
 EAWBTxefZ2JvcpRFpvSIiWkVH6+1denC5yt3QoVfdp7gH7K5is2lf7I2h6hz46m1bhJZjiKDmHI
 Rna2HMRFikQPMVbzmKqHJsGQyjUvoitUdwNxJuhQrK/gXcgwnV1t878gZuInAx4VwcXatJQs7Bj
 EF48Ab40S3UOLsRw9nO2W8tmfEuSRWzuK2m/Va/liGYtnwWPcXTKtqxNGddjflnxqBum3/WGi5Z
 WpeUWCpzkyXPnvTU2NlueIHCPPzzoiV3IdK8dMqkSDWmShoygAe5Aashf6+6pglbfMFdvSxKbRX
 DO8lUkLLjPZ8xHRFe1ThS3nrxFA/t/i/b1vJ8mN1nCCaD+JZ7mpOW/J3zf8qoCQAegsM3ZJIHNp
 //IZUiNNXnhpD4viz6AEsOolXSV8eEZhMGrtIW5nRY/7qrrJQqIkxN6GRX9aidGuyezlkIfVvVA
 O58jPWXZ3T3q+uPqUeA==
X-Authority-Analysis: v=2.4 cv=TdsDJhQh c=1 sm=1 tr=0 ts=6ad7bbbc cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=9852oil1ID9t5xBSyQ/BEA==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=aOxAfOeuNJpbYMRahvwA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-ORIG-GUID: aYipvuuwH-6wzf1nz9h4pV6c4t-6-Crp
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIwMDA3NiBTYWx0ZWRfXx/RljdFP+OkN
 YuROMZHnQOfRkHeF+IUN7L0U0Axth5z9unz5YBM22HO4g035Lo3qgjJYtJ03tuWurOs8rZRFz4L
 kqGIsqeekbSSCa9XbGp5zRmX/rHw0fc=
X-Proofpoint-GUID: aYipvuuwH-6wzf1nz9h4pV6c4t-6-Crp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-20_03,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 phishscore=0 impostorscore=0 spamscore=0
 clxscore=1015 malwarescore=0 priorityscore=1501 lowpriorityscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610200076
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

On 10/7/2026 2:44 AM, Philippe Mathieu-Daudé wrote:
> Factor arm_exception_name() out of arm_log_exception() and
> register it as the CPUClass::exception_name() handler, so
> the common exception logging can resolve ARM exception codes
> to names.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>
> ---
>  target/arm/cpu.h    |  2 ++
>  target/arm/cpu.c    |  1 +
>  target/arm/helper.c | 79 +++++++++++++++++++++++----------------------
>  3 files changed, 43 insertions(+), 39 deletions(-)
> 

Reviewed-by: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>

