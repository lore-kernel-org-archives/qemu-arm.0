Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E697606A31F
	for <qemu-arm@archiver.kernel.org>; Wed, 28 Oct 2026 20:57:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=pmUwatwU;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=aJ2R86Js
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xMAhm-0006eZ-K3; Wed, 28 Oct 2026 16:57:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@oss.qualcomm.com>)
 id 1xMAh1-0006O5-0x
 for qemu-arm@nongnu.org; Wed, 28 Oct 2026 16:56:23 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@oss.qualcomm.com>)
 id 1xMAgw-0006GP-87
 for qemu-arm@nongnu.org; Wed, 28 Oct 2026 16:56:17 -0400
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 69SIkAsV2546651
 for <qemu-arm@nongnu.org>; Wed, 28 Oct 2026 20:56:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 NpjWAdeTjnmWrM0/Fb83WiIwqEcXemYsLruCcrzFPEo=; b=pmUwatwU7caB1U1h
 VaizwnspoO/9eoSw9vNsz9QR8eK5BAtcTingIbbApIF2QdbqMQaKkOtc8yR97Ec3
 G3TT9QFL5jBkdzaCmExTnLqPBMDgupptvd7npU2kdoKUJWPr/yrUZuKUzzqiJxsN
 CYscxMvyzqqY43m8i/CZS7CmEVy2KZ1CFCMd3zWbdMVXFydJGJxK6BzTdl6MQsRZ
 5JmW0NZl1X51OZl8nY8/bhQ0u/g/XCJ2GyoUYEf5Gv2ixAdy3o8eD2XIX0lmop3d
 ajvOeZf4suaeh6ZHb0Bo6JFmFWLGwBy0PQ7aY5JP2LTouRiFZxC/R27WJg0Hy941
 jTaiqA==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com
 [74.125.82.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hkpmc0f85-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Wed, 28 Oct 2026 20:56:12 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id
 5a478bee46e88-341eff9e381so2923194eec.1
 for <qemu-arm@nongnu.org>; Wed, 28 Oct 2026 13:56:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1793220971; x=1793825771; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=NpjWAdeTjnmWrM0/Fb83WiIwqEcXemYsLruCcrzFPEo=;
 b=aJ2R86Jsrol8QXiAyWDfysodcyGfC42lK3IuvWGlh6mr8Tda4OIwicGB+1AV1wmVww
 K3ezhi9nqiEGMat+N6naAWucLPu3L3EkhR2hasi7vClppcRS0TCLellyOJNgZqvXw6tC
 RVzHc9fnmPLBYDjrZdj4kUPhWWcb5V9olNoVlGG/n1vSCjuKyX+qqZojx6WBsVTbe16z
 bVJjybnsA6d6HvB8F8hnPcSU7ZhQKFZQMt90qE9PCzhvUbbn2oY58BVoX882l5tYnOyJ
 Xxhuz6VfJ0ROeFMQ7Utv0KtPHPVOnCxAPot7p858S1p51dpV4peQeNJDnPLataFj9ucR
 NAkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793220971; x=1793825771;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=NpjWAdeTjnmWrM0/Fb83WiIwqEcXemYsLruCcrzFPEo=;
 b=BlcQSrxpu0g4taiVV1UNuOKpJLDUPSJMUWpv7AdZsbhHQfW/CrbiaBkSpLrgJVCGtk
 gb7EO1JHkH89ik3V26IrtPTIs/oASG0WqypUqht+yQHmCA0PVNFX3g2YUEoGmQrTYJFi
 GBV5TrNLAMHJB51xT+YeH53d8vEkto9EOeIZCkOE1AyFN9cPOi1QKs+uejtH5yV3HZda
 NDubgA6q43/b0kXqh6cq99uS+h6DOhz/JJ8UXf0M0mZUZrg9gRAF7vWzAWh1ed/yGnde
 ZITeMRafwl8Qm26lIyznuORSbtGiwP5mo90bNxP3LFhRYugeVJ0kP94hktnk6I3dEcOU
 k0Sw==
X-Forwarded-Encrypted: i=1;
 AKwUvBzag4YI6CqdZZHVgOMtMMxiuOQYX6Oj0HJ4pUwh8jbuo+u6WE8xNaJwxWJ7MtgP9PmoELBrsKMXPA==@nongnu.org
X-Gm-Message-State: AFq9FYJW/tOHmX4NM1zzN5F60YXskW3xiXlVjroGAF4SG+xA41oAcVLA
 5XewnD4+yruNIQEvNUUp6dUxSvzLfXUg4hz2Zc6OyoKty7ZKk1XtYdnbQJUULOHONJ1A1KS7A0D
 sUfk314ahyO7XROSmc0oA8SgMVSWUMfOW7BFolTCXKWC6Atc08YcxwOQ=
X-Gm-Gg: AYBFou1/LCir09yqUwlZ4BXtqcLrczXEwEb8AfGDgJxCYVZPauInvJOmQKmM3F6fGur
 li+7RihtHNE1YaeM+m1h5w4kR0Gd+2xrcJmJ0L1qfGvDKdZ7DYeOzEfRnH0C4wuVTQC+Qn2+N1L
 783ZOAoF8GZhV03NYdGbvT9PauSZt3idWebkBlnTt+JL6GB5G621VSobnEqCTgB010pLT18GdiN
 3ieFA6SnPEExfgZ5t5odWEnb7IOUSMDsKao9Vyr73+faDLl9hq8yk32RikKX1d1rSZ1bIWC1Dpq
 QOv8esJrT0hIc3jSmBHMd9hNP8MeLqqOKGP1yxzVeu11d5O62vb5ES46uLbW4hBDOP5KQ+t2AO4
 FeDONddyjRNMkvM/Pl+aB6hygHNbvoS4GRHBctFKofpVTioIZ961OV3iL7GakNdeLmSaLXXA0Mi
 FaaQsazfq+2bsEw0n0EV64K+DkUJXPkupQc1FMag+CO9U=
X-Received: by 2002:a05:7301:d185:b0:35d:eafd:5737 with SMTP id
 5a478bee46e88-36a20418d01mr4993700eec.22.1793220971435; 
 Wed, 28 Oct 2026 13:56:11 -0700 (PDT)
X-Received: by 2002:a05:7301:d185:b0:35d:eafd:5737 with SMTP id
 5a478bee46e88-36a20418d01mr4993676eec.22.1793220970900; 
 Wed, 28 Oct 2026 13:56:10 -0700 (PDT)
Received: from [192.168.1.199] (192-80-163-190.dyn.novuscom.net.
 [192.80.163.190]) by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-36a2392ebcesm9735334eec.16.2026.10.28.13.56.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 28 Oct 2026 13:56:10 -0700 (PDT)
Message-ID: <5de0d94c-4bca-4d52-bf87-aeae400dcd58@oss.qualcomm.com>
Date: Wed, 28 Oct 2026 12:56:09 -0800
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 08/12] hw/virtio/virtio-pci: pass is_available through
 VirtioPCIDeviceTypeInfo
To: Yonggang Luo <luoyonggang@gmail.com>, qemu-devel@nongnu.org
Cc: "Michael S. Tsirkin" <mst@redhat.com>,
 David Hildenbrand <david@kernel.org>, qemu-s390x@nongnu.org,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Eric Farman
 <farman@linux.ibm.com>, Song Gao <17746591750@163.com>,
 Max Filippov <jcmvbkbc@gmail.com>, Cornelia Huck <cohuck@redhat.com>,
 Fam Zheng <fam@euphon.net>, =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?=
 <philmd@oss.qualcomm.com>, Matthew Rosato <mjrosato@linux.ibm.com>,
 Philippe Mathieu-Daude <philmd@mailo.com>, qemu-arm@nongnu.org,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>
References: <20261028201557.2688-1-luoyonggang@gmail.com>
 <20261028201557.2688-9-luoyonggang@gmail.com>
From: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20261028201557.2688-9-luoyonggang@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=X4nHu2Te c=1 sm=1 tr=0 ts=6ae2616c cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=9852oil1ID9t5xBSyQ/BEA==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=pGLkceISAAAA:8 a=ShjEO6zuZ4VLedG1Af0A:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-GUID: _bNW1N8OUYzKVyOOFxQnWGVr4QTK7fwL
X-Proofpoint-ORIG-GUID: _bNW1N8OUYzKVyOOFxQnWGVr4QTK7fwL
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI4MDA4MyBTYWx0ZWRfX7tVZewjL6GTe
 kA4ug+kGmSLv/cT2G3nvijI+QQxLyNu6hfPivtQyiBXaxMf6QglhIjzX1kuGsY0HmuX1ygCVrco
 USduxYVrRQioLdNZcufOdXSZpHND6ndlbixVSnCNBNA3jTYeEZ3OuU74gsTCofNnv3jiWERTo6v
 iYayd1TxOwReWkvJI+jdIOl6E0zTTlQppFf96pQ54JeI7VZCaI/vktG3V3sajOaKSYkxw/HRQOe
 rCSmXjVN6z0TFdVKB24Fjxuoi5USYjPliapw7P4UCIDe0Hl3alzNp/I5Lk8rzIfUu/UlJPlzP3Y
 gFrvVaYWpSo0a4IDDRkNvoHkerk9sM/U6g3zWxmK1ZwFjBtP5tiVGBf8/+vl0ynH4n9/joortfn
 +xBsH2fX28XMZkcm+LrqrrI+0NKk8YEB/SRas03HmYZqFiaLCmIEvsWnIw6P0pGN1rspLIXT8FJ
 wZxL07y3OAYFKDCTSHg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI4MDA4MyBTYWx0ZWRfX/jhUUFmhhJJ0
 uohychHemf6ebTmUeWJk3DfezpW3Nxk0Jywf6tm5cA5nF2Sf1WQSgm9tpokxGWXMw6ODYb2pYll
 xrXkJIYv6lcNhR+Jq8GuK4Wem2dc/9o=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-28_06,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 spamscore=0 lowpriorityscore=0 clxscore=1015
 adultscore=0 suspectscore=0 phishscore=0 malwarescore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610280083
Received-SPF: pass client-ip=205.220.180.131;
 envelope-from=pierrick.bouvier@oss.qualcomm.com;
 helo=mx0b-0031df01.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, KHOP_DYNAMIC=0.001,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On 10/28/2026 12:15 PM, Yonggang Luo wrote:
> virtio_pci_types_register() builds the base, generic, transitional
> and non-transitional TypeInfos for one virtio-pci device. Copy an
> is_available callback onto each of them so a device can register
> target-specific variants of the same names.
> 
> Signed-off-by: Yonggang Luo <luoyonggang@gmail.com>
> ---
>  hw/virtio/virtio-pci.c         | 4 ++++
>  include/hw/virtio/virtio-pci.h | 1 +
>  2 files changed, 5 insertions(+)
> 

Fine for me, let's see what virtio maintainers think about it.

Regards,
Pierrick

