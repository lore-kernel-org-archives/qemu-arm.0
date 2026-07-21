Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D03FC4452B
	for <qemu-arm@archiver.kernel.org>; Tue, 21 Jul 2026 19:49:50 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wmGTG-0007vd-1k; Tue, 21 Jul 2026 15:49:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wmGTB-0007uV-Oy
 for qemu-arm@nongnu.org; Tue, 21 Jul 2026 15:49:37 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wmGTA-0006fE-5Z
 for qemu-arm@nongnu.org; Tue, 21 Jul 2026 15:49:37 -0400
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 66LH2S7t3439733
 for <qemu-arm@nongnu.org>; Tue, 21 Jul 2026 19:49:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 G9uV8s/GUciNWoOp5vpmFdNGOKk5s6DzGgEVglGOR/c=; b=If+ICMgTPDhLSyxq
 1qYlCHcooOFz2fv6CbvScg/7MT4y4I6Bi11p1MDGCBBOTDJ+C+n5pNZwBVymIzgi
 T0l+KUSMDk9/1YX8EG+96J+vunFCpGuCvQ+D7CGanXtOZ8oj77w2QypAN3zxu1Jl
 66nMrEantTpwifybJ2ddpBO5+bcCQ4zOoUnMypFQp1wLTPtTpRwh6mY4yo8JRH0n
 cB0f3a+8LcC0jn5ueN4TdEo4aoSXiiNedvSdkiAixKGI0sc2bvjW8RCRbFILYAPE
 6PARFe0dMKf8AVEPV5Rv3mLZChh+ZLfarVKwvse6f0aHJ6Xpg5E/8ZtQLRHWx+Aq
 Ux07jQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fj6nststm-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Tue, 21 Jul 2026 19:49:34 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id
 d75a77b69052e-51c21c01cf3so183941951cf.2
 for <qemu-arm@nongnu.org>; Tue, 21 Jul 2026 12:49:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1784663373; x=1785268173; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=G9uV8s/GUciNWoOp5vpmFdNGOKk5s6DzGgEVglGOR/c=;
 b=UOo1SaUmx9iTkTbKlzV3S+cJkadCeufJf7oxp4nweEU2n1khbyTi3GogBtAOlupeGE
 bDTItrMtGZLtKXKJxTVSzmPrRswHyCdwTFtbBzkzK4D5u8P8mf1Rd93bNmKF8y/iYcx3
 3nrVjDmE+jj4dDVbrqlNUEYYjxEF+4+Tu3zho050MBltkYy5oXcfKbdx0gXmfl33tfFQ
 xFssp5TRyyO3B6DNlG9NyUUZeQTecXcTQPD3nn1xdekfr69ozZcTqZAqwrzVOoaWYE9K
 Fh9gUnv77doUAg8eVTZ7RaOciMLkqtu9Sf/6Gfto9M9SRPozyCJ9I31/5xasnGZVKxoV
 atpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1784663373; x=1785268173;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=G9uV8s/GUciNWoOp5vpmFdNGOKk5s6DzGgEVglGOR/c=;
 b=apkqOOkXq2r80QDj2IYvQE+obi73wqcebMMzx2YxSrTxWDjERIanITuqxIdlG06Of1
 h5r0cLrFy+xrCAZ5gj+ABvVxKSG1E+WaqFJxHt2vD6v96n34ljHiB3/wmMKnawWg+MV+
 /t0Uf14/Ybnbqa+pQxM4b6u2vgisjYb54pQfcWIj+XursFTC+EzdYmIT9iHP5krRONtZ
 7bwQ8nolMl+fqObE8TNTsUu+EnNS5nQ2tXHqytV1k2/evv5jTYfK/cKAmPo96qdRZ1Pf
 vL4wgvK09dF7d+EyaGdfuMPeIpJum2jtSAOs5TRAuDaNlBCWIjHUnsV+bXBmrf9uJKgZ
 CvOA==
X-Forwarded-Encrypted: i=1;
 AHgh+Rqdmg2IIxJQg9opg34nZ3NfdVCTRI+Fo/fyDPvHOjSVnBPzA0LqseXtRLtJQYSmQ7M4OZ7KrAeTwg==@nongnu.org
X-Gm-Message-State: AOJu0Yy28d1LN+gC1h4Y0DtwzmdimD00rNFJBzJKdiIwyZaaRU1YiVzA
 CBTc4iIewSjgHup9noCHhQeFtGp9K8lpGDpLWB49hpz+l2yZbaJw7v4+CML/aUQNfUbYi+cjf5Y
 V8kgpbp2t/gWO15LhnJVnQS87R6VGqk+e6N7ZK5Dj9dfgdzsNSUPEfI0=
X-Gm-Gg: AfdE7ckGNFUzFHsUjummHfdbF96UkBxPDDQaaxcrsKs8yUiC8lBOnsDUxnfLogL9f9G
 P4VyW6GLPMvWi4MhY5Az7rFg419MMdgZ+wWFKYE8qgzrh7cckANs2m9gU5HiXIsdZ1uLC5xF/cQ
 qRZLfgXZnM03L7d8XmG+A5I0v1EFu4f6wDa6jbRLaROPo8SHz8UQ1GnU/ihkiu0Vd1YlQcq7n7Q
 m6E+rQ/Vj+bGDzPcoCt7LvCGaWg55uKZ6aX2UYORzXt6FkEtJXxv4Dm9eF9H6kLy4KEbTSof1VG
 Owh9c+sgWilyhAlM0apEQbYmGjLLH0bpbgb2fB2f2D9oxmwcscz+SdGGSVZOHWBk6IV2EVbQzZ/
 r63trpUaQ8iraBxaGGI1J02mmNCRsZHtiuVeh12/KANm/qhUuKpA=
X-Received: by 2002:ac8:5f93:0:b0:51a:8c97:fb98 with SMTP id
 d75a77b69052e-5213fc578ccmr191540891cf.65.1784663373460; 
 Tue, 21 Jul 2026 12:49:33 -0700 (PDT)
X-Received: by 2002:ac8:5f93:0:b0:51a:8c97:fb98 with SMTP id
 d75a77b69052e-5213fc578ccmr191540561cf.65.1784663373010; 
 Tue, 21 Jul 2026 12:49:33 -0700 (PDT)
Received: from [192.168.69.212] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-47f63ec7f55sm36822550f8f.18.2026.07.21.12.49.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 21 Jul 2026 12:49:32 -0700 (PDT)
Message-ID: <b902fab2-7d33-48c1-9fab-16867a8faac9@oss.qualcomm.com>
Date: Tue, 21 Jul 2026 21:49:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for-11.2 v3 02/15] qdev: Make qdev_is_realized() take a
 const DeviceState *
Content-Language: en-US
To: Akihiko Odaki <odaki@rsg.ci.i.u-tokyo.ac.jp>, qemu-devel@nongnu.org
Cc: BALATON Zoltan <balaton@eik.bme.hu>, Paolo Bonzini <pbonzini@redhat.com>, 
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>,
 "Maciej S. Szmigiero" <maciej.szmigiero@oracle.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 David Hildenbrand <david@kernel.org>, Igor Mammedov <imammedo@redhat.com>,
 FangSheng Huang <FangSheng.Huang@amd.com>,
 Alistair Francis <alistair@alistair23.me>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 Nicholas Piggin <npiggin@gmail.com>, Aditya Gupta <adityag@linux.ibm.com>,
 Glenn Miles <milesg@linux.ibm.com>,
 Harsh Prateek Bora <harshpb@linux.ibm.com>, qemu-ppc@nongnu.org,
 Alex Williamson <alex@shazbot.org>, =?UTF-8?Q?C=C3=A9dric_Le_Goater?=
 <clg@redhat.com>, Zhao Liu <zhao1.liu@intel.com>,
 Hendrik Brueckner <brueckner@linux.ibm.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Ilya Leoshkevich <iii@linux.ibm.com>,
 Cornelia Huck <cohuck@redhat.com>, Eric Farman <farman@linux.ibm.com>,
 Matthew Rosato <mjrosato@linux.ibm.com>, qemu-s390x@nongnu.org,
 Luc Michel <luc@lmichel.fr>, Fam Zheng <fam@euphon.net>,
 Eric Blake <eblake@redhat.com>, Markus Armbruster <armbru@redhat.com>
References: <20260721-qdev-v3-0-d2e226fa002e@rsg.ci.i.u-tokyo.ac.jp>
 <20260721-qdev-v3-2-d2e226fa002e@rsg.ci.i.u-tokyo.ac.jp>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
In-Reply-To: <20260721-qdev-v3-2-d2e226fa002e@rsg.ci.i.u-tokyo.ac.jp>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: O1_CCSFPflH8oxTUlpgMWdaPIpAqc-Zi
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIxMDIwNSBTYWx0ZWRfX5Von6k/UvN68
 vQxrokuMF4BBXPuzL9p1HD9Dqi8TiFU5lEAQT0rB+9UQWZ3T7husksS9YJOvSB2WPtrUhdlvZNr
 qDhPVdxGdR/gPg9s0Z9ofKjes1lXNQE=
X-Authority-Analysis: v=2.4 cv=ZJjnX37b c=1 sm=1 tr=0 ts=6a5fcd4e cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=dLHGZYY0-qxWrHypId8A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-ORIG-GUID: O1_CCSFPflH8oxTUlpgMWdaPIpAqc-Zi
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIxMDIwNSBTYWx0ZWRfX1Ea9JJmW0tcP
 NdCUyozAboL/tqH7R9758S14XGfXI7vNS9SEBXZI169f0PxdS5wOpwEZTuvd8IYfIt9ecP3etUE
 /TVF0jpIc6mmK+Ysx9esRIbAkIzBrhX9+WgqysbSwx9WDgnvZhVttq3PLdoEBm1zBIwSx6vdEYu
 EAObRDCpABBl06l2d1ga+VphYDZ2jG1xuLfOXFZqT8qpavXEZoAwf6/5p2BEuy/Zvm/B0XUANXt
 rTY8mY7LWtNRvbUoM6v6lRlXKHGPAKvBUAs/65RvOYvmgiRFaWEhroc8fUTcXasYs2+/HmTbg4n
 bFHXWqR2bAYmGLjGHj+CpyB6QD3u0u/BHdFpC36APdo2Sj/2JjnSNqdJxpvQQLPkmmKk2haWf3Q
 rc9ZSJyao+N1l4YYdayaKa4V5ocrbzKR0um/BzhcwvhDwn0kITOVj9tXPTwixiRFfvMJ01InG2V
 XObGQbSjd4+N+2naMCw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-21_03,2026-07-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 priorityscore=1501 suspectscore=0 impostorscore=0
 malwarescore=0 spamscore=0 lowpriorityscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607210205
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

On 21/7/26 10:16, Akihiko Odaki wrote:
> qdev_is_realized() only reads DeviceState. Make its parameter const so a
> later caller with a const DeviceState * can use it.
> 
> Signed-off-by: Akihiko Odaki <odaki@rsg.ci.i.u-tokyo.ac.jp>
> ---
>   include/hw/core/qdev.h | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>

