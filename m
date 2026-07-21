Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67C91C4451C
	for <qemu-arm@archiver.kernel.org>; Tue, 21 Jul 2026 19:53:23 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wmGWo-000256-6S; Tue, 21 Jul 2026 15:53:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wmGWj-0001xE-Tb
 for qemu-arm@nongnu.org; Tue, 21 Jul 2026 15:53:17 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wmGWg-0007gK-PV
 for qemu-arm@nongnu.org; Tue, 21 Jul 2026 15:53:17 -0400
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 66LH30U62281494
 for <qemu-arm@nongnu.org>; Tue, 21 Jul 2026 19:53:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 z13/qupV/DR1u31R8kOQG9JlZZAOHbQKC6IQvHUFffw=; b=F1q0gtKv9VdLKtwU
 4x4hpIp+X35vVmhdO3o0d92w4J+8zA9dppJggBKrcPWnfnjx2a4+VC3jc8RuS/rG
 UoczFIu3m7TjB8SW7KdsZlTPE+QSKPb6xff6OBE+lngjZONJZ6k4IiguKdynDl9e
 0rNuDwfq0tW36lYVQnFNdHbmwTiBM3+sYX2Ke39YsVlsmMkqu7nsP8MDXzC8oGlU
 I83BRu3FQdjHTdoEbTMOjQURPclcz00lTJr29KWQ+25SmPp6aAVMk8f1UMDdqgMu
 YVgcsVEs2kNJ/eXzofdA/X8DNCCgxM5dMdErEyojWoJlgqMzNEtf+TWwMW/SKjZE
 CPlo5g==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fj6paar7j-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Tue, 21 Jul 2026 19:53:13 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id
 d75a77b69052e-51c12e43b98so227354501cf.1
 for <qemu-arm@nongnu.org>; Tue, 21 Jul 2026 12:53:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1784663593; x=1785268393; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=z13/qupV/DR1u31R8kOQG9JlZZAOHbQKC6IQvHUFffw=;
 b=j9JYV49sfnR9P/kJq++h66dJRHMXrRMUuaSNUGUMEyVcZTM/jQ/SyxIFs7eN/EsFG0
 0yel2agZGcYX+D/fn+MDBB1rU8rQIUZwK3gxeoc6T2Wt37RW0ydiOi4Qs7gVvCTd7dGH
 i0l5Vtgiim7mIxQdyFMftAoGlQCSTt3Jh8T5pr8fqExlX1LSyqNB1DKdhuW/hvt9Pxii
 vnsuKVYhiOzWev9v6gwpw6SuYxgvMBt4xqGNf2tVCKx2ruGIP+HqtXxbvibp4Shfgdek
 XKdRV2FiU3ThPI2ivW+MSZIXUHdV6iTJRG1TrAxJd4C45+Rz3g8v27yHDNWsjgEYgQrK
 i02Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1784663593; x=1785268393;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=z13/qupV/DR1u31R8kOQG9JlZZAOHbQKC6IQvHUFffw=;
 b=QyGkRMI3s6rSnZTzbMrQHbgym6LXF11B4zI3vxyjG6r9V5xvqfRslv7V6gUzM96PlE
 inescKkTDZh1tRpW7a99NNybmgcmAO1BBSuT38gzT12isHxA1Z8UGZBIlqMBduyoZ0gh
 vTBkhFu2U89dkLxpHXojBwam4VEuActtS9XhhpAqJCnlQEO36K+swxuL57BQ37baOwsK
 tUDDc+Jdu0VLaD4+HwhucveB7lFrHl9omNAEygj/pKYvC0UxbkVrl2S+aleuS3Fr41q0
 kp4fg61lFZdc0DON5W2j4eKFYBc/zrtHH0gMar90uq892kQKOskwhYF7MGguQPZQJVmn
 fkNQ==
X-Forwarded-Encrypted: i=1;
 AHgh+Rp6LbCYn9KN5TbJ0QCOujREw8zAuMoejmLuB99E4fE4fiwA0AazDzwf/3xPPCX8yq+pR+8xtdkAQg==@nongnu.org
X-Gm-Message-State: AOJu0YzJdihik5G8G4NZ/1jMYysT55yh8FBDKGk3FcJ6tYgiSw2lT7UO
 sNCClw0Hg7rp7KdeZW4T65glv16xKg4rpwa6hSpqzgx8e52iRb6CNbLN2lVvjcguc7jKhuIC5YY
 /xDtxKQMyN9ED2QdLjUi+nDwFIPTiVOJ0jHVpKKX/jvEMNSarGiOWyUo=
X-Gm-Gg: AfdE7cmjiL02f6JxQwxo5i+JDEw/U91U6Z1tlopHoHj+d+MxuEIH7u+fhp0811/QH/t
 aUfO/lO+lvQTbBE+QL5Pvuo/YXzmJW/mzxdTuSrddigbGc0Jbo7rBnjQAmOVRtcg9/ubb8ba5te
 KxrNqKSLTYaJWkrpUJmM3187z/KGaFiZQIyyx4AuRFif27v6XrhW7mCwqGLdVqP0Ly30APxB1+/
 D/rnVByjpwEdF/JdbvYxyvfyBpZSkqREIROYZ2tbiX+AZSsHyWjdk7DvhR+abxIJX4dTikpXkK6
 7BjWk0RTesDGwLSLSmrLIPnYJIoLsUhd6cLZe0fMITbhuEKnsHI9y3bwdSxnVCgrfnAztoG+jy1
 fc72aYjwLOpRgE8LF5BYCcajGsnIBS02q6fzTVMDis+OEvDtUBRw=
X-Received: by 2002:a05:622a:118a:b0:51c:7b13:62f4 with SMTP id
 d75a77b69052e-5213e88b48bmr189095781cf.74.1784663593146; 
 Tue, 21 Jul 2026 12:53:13 -0700 (PDT)
X-Received: by 2002:a05:622a:118a:b0:51c:7b13:62f4 with SMTP id
 d75a77b69052e-5213e88b48bmr189095291cf.74.1784663592625; 
 Tue, 21 Jul 2026 12:53:12 -0700 (PDT)
Received: from [192.168.69.212] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-47f63e49ab8sm43853939f8f.5.2026.07.21.12.53.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 21 Jul 2026 12:53:11 -0700 (PDT)
Message-ID: <f7e684b5-a407-4873-8e7b-77e6dc4d5c63@oss.qualcomm.com>
Date: Tue, 21 Jul 2026 21:53:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for-11.2 v3 07/15] hw/nvram: Use qdev_is_realized()
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
 <20260721-qdev-v3-7-d2e226fa002e@rsg.ci.i.u-tokyo.ac.jp>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
In-Reply-To: <20260721-qdev-v3-7-d2e226fa002e@rsg.ci.i.u-tokyo.ac.jp>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: qU6hi2cbPENC5EEycRWzFu5eiR5UD2KC
X-Proofpoint-ORIG-GUID: qU6hi2cbPENC5EEycRWzFu5eiR5UD2KC
X-Authority-Analysis: v=2.4 cv=eYYNubEH c=1 sm=1 tr=0 ts=6a5fce29 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=1tSEMpTH9XP_W59IOagA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIxMDIwNiBTYWx0ZWRfX4XDypqVWqvKP
 cZWk/pTfclGNuSOhDD8ITs0fkr+k8UkEI3GzjwxILMsEb47cpu2Ly+nqlOehPUrD6gPAYbBOztN
 glifhoY4pfAjVZT8qskA5Fpj9zryM15l5N9ccDMnf5RD+NBEjn4zu3LVd8wyH2ZP/Wp2M8wxUj/
 AAETFU2xaCfrEl0BELaVfM3+qPBVhoGmbmOzhehItX+8XwWGiCi5CN9dpWYmINEgtjmWQ3f424/
 1IK2pTYOJPyVQqzLAXJTgApQNaKx0kFs/cVzahO97r2BgNrfGbVriuYPq77n5Lqdv4YNwN9ZS+P
 LOCG2kLGoMotsavjYZgkkp2kMJsCJoklm+qSNxNNpqSxzEZ0+SskBnI6wezWY6Kx7fjitGar2Ut
 abcFbo0jFlM7zy3mFKqIiEd1ZmIkYlta4DRzdH9GwVbry+S9z1ujYgraK5LRdVWExY+g1TCSU3D
 ilhbmDpfZrNuy/9HSLQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIxMDIwNiBTYWx0ZWRfX/nGhZH73+Oq8
 J/mFt5BkVK3gRG60x1iLH6P+zvvDnc0QYD+e5IYN/2kQs5SYWdBESuazibgo5UhRPbIpK8fDEHv
 Etw6QA7rfvRQMW0H5euMv3pdcwEQ9bc=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-21_03,2026-07-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 malwarescore=0 priorityscore=1501
 spamscore=0 bulkscore=0 impostorscore=0 phishscore=0 adultscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607210206
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

On 21/7/26 10:16, Akihiko Odaki wrote:
> DeviceState fields should be accessed through qdev helpers rather than
> directly. Use qdev_is_realized() instead of reading
> DeviceState::realized directly.
> 
> Signed-off-by: Akihiko Odaki <odaki@rsg.ci.i.u-tokyo.ac.jp>
> ---
>   hw/nvram/xlnx-bbram.c | 2 +-
>   hw/nvram/xlnx-efuse.c | 2 +-
>   2 files changed, 2 insertions(+), 2 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>

