Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47F44606A324
	for <qemu-arm@archiver.kernel.org>; Wed, 28 Oct 2026 20:58:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=fbxYGzEO;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=E51txvR/
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xMAiv-0008RY-2a; Wed, 28 Oct 2026 16:58:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@oss.qualcomm.com>)
 id 1xMAis-0008KR-AR
 for qemu-arm@nongnu.org; Wed, 28 Oct 2026 16:58:14 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@oss.qualcomm.com>)
 id 1xMAip-0006Oa-O6
 for qemu-arm@nongnu.org; Wed, 28 Oct 2026 16:58:14 -0400
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 69SIllxq1635188
 for <qemu-arm@nongnu.org>; Wed, 28 Oct 2026 20:58:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 XlL48vNyI+DE5hU70EJ6TsnawjalskKZlPGkI4s3ZFM=; b=fbxYGzEOxWTv9bj6
 5iWMORk/OIuG7+CJislTEAqvaN3+3o6moCU+20GHxnDcU9ILGjv65y1pKlZMfNGr
 weNy7i1OY6cpEJdUJ6sDK/iXpYURyUlScNAmjfFS71SbwAgVYhbhhxLEEk16fAVG
 s9l4PHJA1UAEC16V2r+3dYK+F3M0pTHcDzgtTMMyNcvEKaBqdbSBO0VZoReMPaAy
 8ccD5yroqFs6fNIFqhtyijDKkuYNy6Yyv7UkJsu+eIVTEyrfM0wdMNjS8E8PDY/Y
 7Vo3VLUqFJ91bqn5xHTUEHlRcOfOIRaGoNK3ofedMTHJ6xY72qI1O373xtPyGuyu
 bRMZLA==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com
 [74.125.82.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hknkp8qnq-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Wed, 28 Oct 2026 20:58:10 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id
 5a478bee46e88-35cbea41088so1914557eec.1
 for <qemu-arm@nongnu.org>; Wed, 28 Oct 2026 13:58:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1793221090; x=1793825890; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=XlL48vNyI+DE5hU70EJ6TsnawjalskKZlPGkI4s3ZFM=;
 b=E51txvR/M4iq1y4L7GZstRXYy+VvwvgKf6NnOR3R24IuCZ0BPluk1jd5mZ3xZy/7/G
 FMHWfXk73csUCvb2uLA/QKBGHTbKqx5FEIkxpr9ljtbdkQzS8rcoRQOWa3Rbvxrc8y/E
 uzo8f1ymFtzDj27LCmPByME9+Meq79DfGnxkF2rBMBOJ6dEjpYdyrbmnDHMR9attJcn4
 NxERMjZLtclAyAVcelI95h5+GGvWw8epRzr/g8ayyNd2ExcYyd5CBzEQ2AmYwEx4HgeH
 pnukOA5w7s20kP/YV/Ds/Qh4jCgJgQLYnW5Y3KqzpXD7VmSKlRAkiDpQz55RLzJ3fJI0
 t0lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793221090; x=1793825890;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=XlL48vNyI+DE5hU70EJ6TsnawjalskKZlPGkI4s3ZFM=;
 b=NnFVq/l4ZMiEYLR0q7QAsYj1rHRxPQV7EvsXVbowc3ICQ9sA3Fid5C6CMESHEZ433a
 4SXqeHBc27pYs8C7KY3fk/qP8qM7aAfWnj8S7bFCUEgJMag3A4jWIiZhMxgMvgelu5Nn
 5fd3FhQ/ARoGXJOzotT8LNPA3Mexco+tae/uVGNfEzo4mhWNlHsjR3nIjBN8azpFWqQJ
 jesjhSgnTjxt2e9JPG3WKAGbfVLfsyaDipeHB0C2vGVUWGp3sfuUBLXQGbYMpRW1rEjD
 6lecdQhyV/IkQ+dtH6upmhYFyIbGb2QaGVdVpDvLZ2oqe3YpFGaiTwsxMi4W1hQYaHDY
 N1/A==
X-Forwarded-Encrypted: i=1;
 AKwUvByNe7SHbtGKmEReUfmPBkGrTTBLOlQpbe7bMOyJEMKjI0Vnb6YfN1eIsKVP9UrUhGOuyJ2hirDeKQ==@nongnu.org
X-Gm-Message-State: AFq9FYLV20ZD3ZVznaE9ari7n1l4qVXOTsXUxcO5TiKqFJANthBQ6wxE
 5XA/F0vuZkYJKxLSrbtAnQ/zDfubkcgO7imVO0IXtjCEJMsaT+VjF73JOlHEerA771mXndlHfUX
 tZTKSarqxyZu+0SNbw1i659mTDgmhynBt2U0O/D7+B3ylLv70M6gV2LQ=
X-Gm-Gg: AYBFou382WP3FbCG1EPeFYmInVvEYuRZ3vGFNAk+cUnLS0TpSOwdT+vZ6eFOH5iIFBM
 SXtcbEkPWzZ3BTbXbH43uuSRJq0r/byQ/bnLt37kUaonp0HmIRCCQDkB0asohX0OTCbkbaNBkB2
 J1NuTDk7pHf5snEnpLv5/cGFlN5nOUzK2XioefDCkfbjIDkr/8n+wJAYvW6kYiD/H9FEqk9bTf0
 BMH/fOIvFoZ4whnNCl8sGO01hGo4BPlOQlleaSYFbo3pn8JdiEKvjHZP/mxXwQ7hXDbgD6Hj1Pj
 bL1muFRZJMP6EOrPvhkuFKGnOkA/F6QdbOOPveQNDRWjRVr2WHXIqBKVrxx2/FCrcThHqFNIM87
 51euisiolEH062p6fEi4QElZd1jUyTfmuwaJKvBxOO+OPGU7JSqK+jZS1jpmgCZ/mVO0FiF0Jfh
 H3igsFNsAfUp275B4e8FQtprmBo+qV6GSOWFN170W2Sa4=
X-Received: by 2002:a05:693c:88c7:10b0:369:d486:457f with SMTP id
 5a478bee46e88-36a1ff47261mr5149338eec.2.1793221089466; 
 Wed, 28 Oct 2026 13:58:09 -0700 (PDT)
X-Received: by 2002:a05:693c:88c7:10b0:369:d486:457f with SMTP id
 5a478bee46e88-36a1ff47261mr5149292eec.2.1793221088698; 
 Wed, 28 Oct 2026 13:58:08 -0700 (PDT)
Received: from [192.168.1.199] (192-80-163-190.dyn.novuscom.net.
 [192.80.163.190]) by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-36a238dc80dsm10537923eec.9.2026.10.28.13.58.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 28 Oct 2026 13:58:08 -0700 (PDT)
Message-ID: <eff95e42-b1e6-47af-9a53-a8b0cc073ba7@oss.qualcomm.com>
Date: Wed, 28 Oct 2026 12:58:07 -0800
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 12/12] hw/microblaze: defer PetaLogix endianness default
 until init
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
 <20261028201557.2688-13-luoyonggang@gmail.com>
From: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20261028201557.2688-13-luoyonggang@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Ju9kP84C c=1 sm=1 tr=0 ts=6ae261e2 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=9852oil1ID9t5xBSyQ/BEA==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=XtNXrodKxUSRXBvcK-oA:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-ORIG-GUID: V6Q1OXuCPaT7NLZBmwmPwU9R4TR50p8d
X-Proofpoint-GUID: V6Q1OXuCPaT7NLZBmwmPwU9R4TR50p8d
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI4MDA4MyBTYWx0ZWRfXyWz4nLuEoZP6
 vxYdX9hcPxsR/vW2D/mCb8BtLnZFMEgQP18Xrp4hvJRwqivo4IT8LsYyRuOR/90WCPR7Ve7raJV
 AiB9bCVHDoQzQcm8xngorBgdknffDEY=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI4MDA4MyBTYWx0ZWRfX/MTmT4MukUjC
 q7UzBzsugbPAJuOIPyBGLB3DRDjOSAE43xvOvh8y3uvT5VYXohLpT6vBH8au3hX5sBDFIBkyDZP
 nBHv2wT74z3wy/iJD1fyhuXcYS0Kx88IJ4SN9xLpW/l1sRp/PyFHhuxwbleMkp9qL/ZWylFbvtB
 cwdsVxa8kkrnwYvnGDEjnumdg6e2tjy8kVMETDkPUU9q4Bgxmky/DM2pmF/20hbZqNSEbNylxk4
 5MvtlaXqI9MpJVU17Bjsz7gT4QbdCluTPM1hRbDQ/okceph1VKjlF3TdTF2nor2HY+McKnD20ZG
 w6apeZQPU1Ltkqs8IdWQgTX+hYnnNCzEGo3BcXEeviwFN505oY1mYvMHlLF69bKIpwQucRENX3B
 CNxNCzRP2OJ3CgQaZ+B3rNpdtTq1S/Rrx1IsxlgqR7vY44ojuijyrbc58Fi8vtbBH2Rj2oPhRF/
 6QSBsxRsekUq3uuiMpA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-28_06,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 adultscore=0 bulkscore=0 clxscore=1015
 suspectscore=0 spamscore=0 lowpriorityscore=0 priorityscore=1501
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610280083
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
> The PetaLogix machine read its endianness default from
> target_big_endian() in class_init. In a multi-target binary the target
> is not selected yet at class_init, so the default cannot be computed
> there. Set the property default to "unspecified" instead, and resolve
> it to big or little in petalogix_s3adsp1800_init(), where the target is
> known.
> 
> Until the machine is initialized, endianness reads back as
> "unspecified" rather than big or little.
> 
> Signed-off-by: Yonggang Luo <luoyonggang@gmail.com>
> ---
>  hw/microblaze/petalogix_s3adsp1800_mmu.c | 11 ++++++++---
>  1 file changed, 8 insertions(+), 3 deletions(-)
> 

Reviewed-by: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>


