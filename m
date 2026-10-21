Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D67C606A319
	for <qemu-arm@archiver.kernel.org>; Wed, 21 Oct 2026 16:23:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=oB6whl5i;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=RY55fOv1
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xJZ5N-0000nt-EB; Wed, 21 Oct 2026 12:22:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@oss.qualcomm.com>)
 id 1xJZ5L-0000n8-IX
 for qemu-arm@nongnu.org; Wed, 21 Oct 2026 12:22:39 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@oss.qualcomm.com>)
 id 1xJZ5K-0005E7-0w
 for qemu-arm@nongnu.org; Wed, 21 Oct 2026 12:22:39 -0400
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 69LFU1m41481127
 for <qemu-arm@nongnu.org>; Wed, 21 Oct 2026 16:22:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 LdH28CrUZ5te1hiUt16Qn3Jnjz80/AQwLDRmLnh3RZ8=; b=oB6whl5iOsNbTi8s
 2oK6+gHZnETweHp0L3IxgHzOv0LtJ6TinYtvziqqSPcjT16Z4fmaFQiZlrijdyQQ
 o8oFmspRxlM8P007TZCJX6zEeVp2HYNSfDm82lKGVXp2RVLtcYyBRz2xbbc4f5U7
 FK5FPC+VVNXFtgMbYan15gI54oeg/PmMjSdRdJh/nXfII/6CbZwGaOeJKo4zc4iW
 sID2vg3k5onmXkpCgvs457fyCEkbinLs5E/xcI5CfwwtLANJGKc6c6YBlpx8XbjB
 iPBK9dIeA50pZv07eSvkPU6sMDEKDhGA3fhrrIIwjJSHfbOv6C5uNvfxxcATtdZv
 heo2Ug==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com
 [74.125.82.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hegs045wu-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Wed, 21 Oct 2026 16:22:36 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id
 5a478bee46e88-3510d0baf63so2110677eec.1
 for <qemu-arm@nongnu.org>; Wed, 21 Oct 2026 09:22:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1792599755; x=1793204555; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=LdH28CrUZ5te1hiUt16Qn3Jnjz80/AQwLDRmLnh3RZ8=;
 b=RY55fOv1GuC9q38JtrDa2/liu92E64bVjPiyOjlQVs0/udLrhSOoq6manWLCmGOVMf
 8STT/PZ5g5Vtd3RYUq+Rum/SV/RIyOdHE/lT6r71RoLUk36mu89/eDfDprXTrEmQRiiK
 c9Evp1LJVkEPlDxFuSdAmnX7S8Y9C1TOD/RRlV8i8SL2xBimHg5GUePb/IwuJbB83Cos
 7Jp7r96E3/AwGrFnOikbsLUtDaoVzcZy4Z8a+1Xi639AbMUGM4ye9l16h9OsToJg9LkV
 7l8ezudwvdnImxtg/dq3vmn/0YTlPeN0bcleMjzLaM8usZzfFulx0BL+FO6FcMI3/hVV
 V/Rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792599755; x=1793204555;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=LdH28CrUZ5te1hiUt16Qn3Jnjz80/AQwLDRmLnh3RZ8=;
 b=djX584onfdgSdyilquqAXoD7zpqq714DSS3zA68tFHkBwOGLsPqokGA8BOfh8PkbUc
 Qp0AIWh6IZHkkCkfeHbdqEnwXd2RpXh+A58Ch1ubC5UXnFJvXigxAKkHKeONz0Lpyj35
 PJnyCkvR46U94sabzUdyjrYcwIjv0HebyiGqtmFNrd5z/lGIRDxANat1JkpRd/2CcJnV
 3AFhhEEVhQjqS8YgUpM/fMRu6oxhdWPb7XZxXfRVr5cwxCpOdHFWbw93RdBuijST/FWl
 17JQmTem+bS9KZg/xWImK3B9+Q1XKgpOmvdyjxtIAGGNRkFTfoHA5S03geFOa3Eko5Wp
 PHyw==
X-Forwarded-Encrypted: i=1;
 AKwUvBxtQ1PEElY2PZ1xcgqy/mag9fFKH5SKm7V0PqRpVjp+sp6VpI/5Qv2nWKI30sF0grWea7sthXoliw==@nongnu.org
X-Gm-Message-State: AFq9FYJnk0CwTVwarmw4+cH+BFfg4QGTZ1kxwI7TdH99YTCQDdZzKzV1
 kZ0LGxv0cHckzR4UD82WsyhvlDenHp6dr9tW5SToUu/YkZSDpBg3abiONY3/GrsVuGrezf06/qa
 UAMrIoX+0FADxUfxp6fv0STvU/2lwiRqceUgAVhr8ea2qWwHi/QUIlZWqBC69wgk=
X-Gm-Gg: AYBFou3cT1GZcgjxerwJ1XBY3oG/rlX8i1ysGNfGY815NQLFEQv7mzMTt7V9LOf3Bfw
 gCmMRVIAGlBzDN4JvAPrOc5wpnkS0I2ecH8gEoS6A+MSaF4qhjZ091LH5QtTc1VcNIyyPzDTpZS
 BPdj5v3u2I9YHOSK21TdWcEWydHr14Os70lsK7F3rgMUs2nKb+TBU3SgRSrc5EJbWdcZAgB7VZN
 ApecvaGa2C1emfg1sPSlNICJYwWVmMHJYpTydK/86zuUqa2ISEJadj74IxZ1ysZNfvkp9L+zs7z
 6c2HrsVPM4G88iUZeAVnXXFrn9iK493sSEV5xQXbAnT49tulFp9b09qFl72dl91jy8kfoiuSyCB
 EOrKwQJPun4V5CRbYKXXN2TG0xPESC16zEaC6hmb1euQQhXSu3tMRHTTQotmlBl4oJzqYbg==
X-Received: by 2002:a05:701b:424d:20b0:143:2982:1043 with SMTP id
 a92af1059eb24-190a7756a87mr3074947c88.36.1792599755030; 
 Wed, 21 Oct 2026 09:22:35 -0700 (PDT)
X-Received: by 2002:a05:701b:424d:20b0:143:2982:1043 with SMTP id
 a92af1059eb24-190a7756a87mr3074922c88.36.1792599754486; 
 Wed, 21 Oct 2026 09:22:34 -0700 (PDT)
Received: from [192.168.1.199] (192-80-163-190.dyn.novuscom.net.
 [192.80.163.190]) by smtp.gmail.com with ESMTPSA id
 a92af1059eb24-190e29381d9sm5857122c88.18.2026.10.21.09.22.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 21 Oct 2026 09:22:33 -0700 (PDT)
Message-ID: <5a7085b0-b146-403a-bebf-3cdad2bb470b@oss.qualcomm.com>
Date: Wed, 21 Oct 2026 09:22:32 -0700
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 02/33] cpus: Add helper to log raised exceptions with
 '-d int'
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>,
 qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, qemu-riscv@nongnu.org, qemu-arm@nongnu.org,
 qemu-s390x@nongnu.org
References: <20261021031407.24862-1-philmd@oss.qualcomm.com>
 <20261021031407.24862-3-philmd@oss.qualcomm.com>
From: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20261021031407.24862-3-philmd@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=S/NMU4sP c=1 sm=1 tr=0 ts=6ad8e6cc cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=9852oil1ID9t5xBSyQ/BEA==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=893RUmfh5dJaGAfHNmcA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDA2NSBTYWx0ZWRfX0im6TjBDpsE0
 EIcBbNKOnu4FB8Db9a2Nvfag1TuzWY0QPWrRMVmzhrbGGAHBG0ZdNPuNlp7D8yJ7Is1ZbLj4AwK
 s6MCOxHO8LzRTRS8B4pSuVbfLUkjutcIQqMZsr8kDWSb/a+wXTqhG5cR7m86vD0L7IqzB8NlEnZ
 fEVsH1dQMlY13kEKiYPbbu3Xj9JiCqGP9IxAnNJOWk93xUwDyM4OVSy0b4k4cl0FwWMbu1wZlxV
 wUB1e+9jh4w5jpPlB4C3v6+k2Ad8GJPA5nQ8Z8rqfA0kWhG6V6uiJ+WK842MJUXwl9jEVAQByHB
 hU8cvO5gCSCPuj+c0XwG0mSQOUY3bZk9Li4rw0URLUquBCL3vjhSH7hbDJjeQBom7FLPm91P3oo
 A7CYsJ99NKHjXVprTsIjtg+FKzEqjUR3ImBPZI201juAW1xeC2x2QCk2cpr+Xg3F4JnwyMsyzoH
 +pgdOxbIri2NdmDS09w==
X-Proofpoint-ORIG-GUID: hyCXreLYjPE6zUlPFfxmZR1trhDpt9Wp
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDA2NSBTYWx0ZWRfX1fSDITspmRO4
 UxAbj1fvqGSXOozvV0G7e1tfrNvbe+goAcpBnEol2ya0QD/hudOGFnHEzzMbOtx6X6Lets0eqn+
 oYdPv4xLT4Bza2IzB6seMA9hZLt+YYo=
X-Proofpoint-GUID: hyCXreLYjPE6zUlPFfxmZR1trhDpt9Wp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-21_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 priorityscore=1501 spamscore=0 bulkscore=0
 lowpriorityscore=0 malwarescore=0 phishscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610210065
Received-SPF: pass client-ip=205.220.180.131;
 envelope-from=pierrick.bouvier@oss.qualcomm.com;
 helo=mx0b-0031df01.pphosted.com
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

On 10/20/2026 8:13 PM, Philippe Mathieu-Daudé wrote:
> Add log_raise_exception(), a common helper cpu_loop_*() can
> call to log a raised exception when '-d int' is used, and
> qemu_excp_name() to resolve QEMU-internal exceptions to names.
> 
> Use it in cpu_loop_exit_atomic() to log the EXCP_ATOMIC reason.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>
> ---
>  accel/tcg/cpu-exec-common.c | 32 ++++++++++++++++++++++++++++++++
>  1 file changed, 32 insertions(+)
> 

Reviewed-by: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>

