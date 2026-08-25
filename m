Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2E84C61DBD
	for <qemu-arm@archiver.kernel.org>; Tue, 25 Aug 2026 21:41:07 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wyyrP-00066l-U9; Tue, 25 Aug 2026 17:39:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wyyrO-00060X-KH
 for qemu-arm@nongnu.org; Tue, 25 Aug 2026 17:39:10 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wyyrN-0005Ar-0Q
 for qemu-arm@nongnu.org; Tue, 25 Aug 2026 17:39:10 -0400
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 67PLA2xr3100303
 for <qemu-arm@nongnu.org>; Tue, 25 Aug 2026 21:39:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 wvGvmK63YO3s3h6jtGvoLr52Ed8ksoOuomw/54SuxKc=; b=Miv5powvrt7qNaDj
 X2sBeSbYPJn+iMh+58QyzQ1vY233c7k6+V3Ms4sv0tm/c0X41EySkqespaxRxse5
 HmY4SanjWwaERwZAP6sWdFtZ72AcWYHJUxIlBGOuBFCSajZ28hFceKUBRDo1Ut+1
 C9TFeToxNmR0tBlDnZVmKr+fMhSG8ZeOHx4NxhP7WSQWumGh036+JLSyuQ3YYf7W
 1qgpPYtfnJW2lY6ht7tdxrFGajeMmPWi5gGpb3LKDW4j+Vp0tWKPi/uoFt5nTqYV
 Ao+CZ+Zz/RrTbQsZYfDfIbRTWqt6spYBcwUHCsky5hJFHjvg+csWV0qPX9rorNBD
 zLGSJA==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g9bkua398-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Tue, 25 Aug 2026 21:39:05 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id
 d75a77b69052e-51a8db414c7so4337391cf.0
 for <qemu-arm@nongnu.org>; Tue, 25 Aug 2026 14:39:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1787693944; x=1788298744; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=wvGvmK63YO3s3h6jtGvoLr52Ed8ksoOuomw/54SuxKc=;
 b=V4ezKUZ4dJH4Nn/ZhbrulNMT8ieSF1rYOd1vNUGRM5auCG0xfainjHJKxyoL6MiV/D
 J91Qh8q/TvDfJNlQ1PBh/GvIQ4yfcSI9cDBTanNd+A5we/YY5cekaGfpsBLS1kNWeB7X
 rmZDZ1SIdfe7rIA3MTzm8e2CKI+K8dshQ3XE00D7FqlwQdhnvpsgcHLgigH8ifqYLI7M
 PAnEGUFc08h2YuMbMKCf29P74PNFaOeTlxKBvH0cMBksJhB68D2mh1s6O7DWB5tlccpb
 XfunB56i+aTRRtn2Y3zqFLUn+jH2nNepBOCrK8rskhwROpCinGJtH2bqzxgiFc4v8JKM
 aFsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1787693944; x=1788298744;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=wvGvmK63YO3s3h6jtGvoLr52Ed8ksoOuomw/54SuxKc=;
 b=GA4trN1booVvE87M6lBxaVo9LaD171+R/ZlNIsLojaA65cUcHES7RPiaD5MzzmbH+U
 0Iv/S/nhNcwAotq424tLoXHCsfNLGxdIR5DmqxpP124vbERLQu7ivsYRDrNd0UELujpS
 fgh86WCJcytYriMueFOzXtnU0s4ckVuYbvJCf0gQzHlTir22ds1b6sr9+8QNj8u/F0Pt
 MDyWu3SMXOszUNLgQfuwn2mgUEbGLfRpu6SJPRwliP6NiOzO6VU7Ud0osAmO9aY90PY+
 tUXQXTBc7tMimLx6ClUWypx3PpDhzErBxnh64ReFkZyYiQ0q3QQv1vzYtLMTw6aBf8rA
 qcRQ==
X-Gm-Message-State: AFuF++nRv6KYj++y+8RB4w3szKtxmeiic+/wUjUaD7HKkNnc1pO4XFVU
 A59b+kcdbTEvvoFXG6AUkfQ2b6guz69F8NLAs63QfdiQtT5eMj4trPXPJFSn/itvAO8fVv4oevi
 CmJoi62UzAHTGEn6gKPH5G1byHyk0OGiNg3KwfW26ds3wflzfRhT93+Q=
X-Gm-Gg: AR+sD11Ua/XaDjNP2kG4nxocMdRYWdDw1901gZSRpns/wqMvwpdzz/qM5LqGMNo35vp
 ca0hiN0bDFEAF4yNtoGSaup1fLrr+sAj+kQDNpV7iTK2MXYEIoM9Cs1JylzWjGb0OE0r2gyoEYm
 8YYviDwAakAMbQV6UlJccFeJ4E0EYWDD6+i3zXjeJofGWsPyaKIOc3pa54hdVD+R57g5nclfYWX
 wmHHs8D1nzDh6arlaPECHK759zGu3fFX89gtJDCk7Hd77IuTzRi6V3PFmuropNEeafLoCtXGX5y
 dBjFPJ4vI/dzSidu59KkJj8mly3+Xa8rwlSjy+CVnh2OC/uqLlLHhVSmdOxXzM0zeAMhEyi4/ng
 jPyHO/bg/Y3J16UUuPGXFhAISiPnS3aoM+1X2Nr4HspAc1xG4ZcM=
X-Received: by 2002:ac8:6f08:0:b0:51c:16b3:351a with SMTP id
 d75a77b69052e-52e422d9df5mr23267991cf.1.1787693944477; 
 Tue, 25 Aug 2026 14:39:04 -0700 (PDT)
X-Received: by 2002:ac8:6f08:0:b0:51c:16b3:351a with SMTP id
 d75a77b69052e-52e422d9df5mr23267501cf.1.1787693944076; 
 Tue, 25 Aug 2026 14:39:04 -0700 (PDT)
Received: from [192.168.20.232] (82-66-243-121.subs.proxad.net.
 [82.66.243.121]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-499dca8b84esm5544555e9.1.2026.08.25.14.39.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 25 Aug 2026 14:39:02 -0700 (PDT)
Message-ID: <f035b8bf-72ec-405b-93ba-e8d94200e53e@oss.qualcomm.com>
Date: Tue, 25 Aug 2026 23:39:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/4] target/arm: Rename and adjust
 aarch32_max_v8_tcg_initfn
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
References: <20260825213000.221822-1-richard.henderson@linaro.org>
 <20260825213000.221822-2-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260825213000.221822-2-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: lsvXqboBt8kmCMEXUDcVc3PcYUseRLV1
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI1MDE4NCBTYWx0ZWRfX5CQnfHnYZRaI
 k6lZxy5n6Dt9Hmm9oyR5jEroeTOu1Kp0oSEDfuoAjd9n9uER8nIEoBvpAGlU5RDKDzjZwvKyhXs
 IRmxr+3P/J6S/Q+wh1+2rBCpJoY6YLM=
X-Authority-Analysis: v=2.4 cv=TZGmcxQh c=1 sm=1 tr=0 ts=6a8e0b79 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=lbskcjEx90pOFJH4cTSgiA==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=jDE5IcpPZucr9eBqKOQA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: lsvXqboBt8kmCMEXUDcVc3PcYUseRLV1
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI1MDE4NCBTYWx0ZWRfXzosja++gw8el
 15qHlq0RYfITsPVMB7NNOeIemPILk8jYE+wPIwBkTksKhIJ+qAK+UM6jj1hkMBrqtMqjfiXVhUm
 ymAm7JAFDsKtPIFZm9Ca3sLJHzc3PMmr+bgWlNDCr/GRzjxw6prrcHYLQ+uY2PM5+gjEXsLUjai
 0nPXeA6fctUux5RUcnqApD3HffC0Vxe2d7Puge250BG95SGpLKi/0EIDhE7ZkMVCFpWlxLaoqpN
 gESjKR73RvPqDiY//MJtmzPQeXXe38yXlclaRbWQZckvHJ2QZKxgoy136XKrCCR7FU3IvVdg0dX
 kiij6vWqrG+wVAJ+UUNKUW0UuZRkKSdVZUHJ2V0IURhGv940yLXrxevPtLu8FSLmJwZe5Kp5wjJ
 Gn5y01gq3IY4KPKvdjMnW8Hh4U3Ar1gKpof91ljnrGbBgi/FsIb2bPQB0LOjJCab+zfF5bMasXc
 1Efh7suoo3WDasNp8qA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-25_06,2026-08-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 spamscore=0 bulkscore=0 adultscore=0
 suspectscore=0 lowpriorityscore=0 malwarescore=0 phishscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608250184
Received-SPF: pass client-ip=205.220.168.131;
 envelope-from=philmd@oss.qualcomm.com; helo=mx0a-0031df01.pphosted.com
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

On 25/8/26 23:29, Richard Henderson wrote:
> Rename from aarch32_max_tcg_init and take an Object pointer,
> in preparation from being used with TypeInit.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   target/arm/internals.h | 2 +-
>   target/arm/cpu-max.c   | 2 +-
>   target/arm/tcg/cpu32.c | 4 +++-
>   3 files changed, 5 insertions(+), 3 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>

