Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D5CFC4452D
	for <qemu-arm@archiver.kernel.org>; Tue, 21 Jul 2026 19:56:46 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wmGZp-0006I7-S4; Tue, 21 Jul 2026 15:56:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wmGZh-00069G-0T
 for qemu-arm@nongnu.org; Tue, 21 Jul 2026 15:56:22 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wmGZe-0000Tq-9I
 for qemu-arm@nongnu.org; Tue, 21 Jul 2026 15:56:20 -0400
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 66LH2ifC2449271
 for <qemu-arm@nongnu.org>; Tue, 21 Jul 2026 19:56:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 twFte/jQ197fxoVJSSNTAmxvPMhghW30uqtlcJWFFZ8=; b=j6zlmZHERWKy5zgy
 Qm/7Fkm0qzB1PuIv3YJNL5oy8vdMSnn4CNe80vIKFvj6TNstxbt1z4oABdxBwFei
 2oovOmroTgMQQdIwfJAOYMEbWxM9mBwS1q0kUcUyiTL+YhCnwYCFczROKmhaQbAq
 GII3fb4XkgfRHFmVl5wRu0gVHH2hTtgniDJeiuDY/X+vukS9+gxPcwKDLIUOeWGF
 pqYgZSIx+L/gqZ1rHB7JovenhUTygLj90iGR4FzgnFd09zn0uAUrXy156HX5eUA8
 PDgEWtxpyWA1J6tKmZW0jztVLmNDgyrOr+uVq0lm0L7QGPOmACTi4li22moh17Ty
 EMIPOw==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fj6862vm6-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Tue, 21 Jul 2026 19:56:17 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id
 d75a77b69052e-51c075c1e25so167567811cf.3
 for <qemu-arm@nongnu.org>; Tue, 21 Jul 2026 12:56:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1784663776; x=1785268576; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=twFte/jQ197fxoVJSSNTAmxvPMhghW30uqtlcJWFFZ8=;
 b=Z6S2gz9U8DO68MO1nmtwpJfLdCdFny5KWXN/pYZjkTIuC64NIzskZdAu9WbElT3QyS
 C4P9Z24EpRESm6rkZk1ExJY14Yz4jD8Mqn+7FeYHKXOG7T/Hmo9+5SUdVueAg8OmCOAQ
 QBmh0fVjlDvpyHqBhn1JNg/xCZnfRTE5USoZd3uWfpwagfsI8BCUaeOf7phWQ6wTaw6W
 KrMnCTz3AQT0JOfi9BBRWGIx2fq1V/JbdcRez+ZJPh6XN07iu+Zg9va2MkXK/t6BIAXg
 0C4RwomCVVJC72DcjzyT9NK0wN60ofmo0YEdmPhWCcuAxDllOlt/dvjIsvXEDQXpD+cs
 uRGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1784663776; x=1785268576;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=twFte/jQ197fxoVJSSNTAmxvPMhghW30uqtlcJWFFZ8=;
 b=bPxJiFdXwtWgYJpqfQWJrClI8UmxQV0LcbBOAx0wd90G3IBTG2LEgt5SuBM+pZu1RJ
 MYrW4tBCbCMoBkiTNCHpjhmmV4LFeN5sa6rQZ56PYd19TiNJO4M2WuJoDFwE64cmZzQY
 LRBLpMHkzODmRmD7Ipb8uKeFh2SrRaVRZK6OfBtbnan0YZK4l3+RHDl7lC2/PfInrbi1
 fU/pSysRQk5jKDrfx4rLAUPiexvhFtweZ/1nDB88zsXfhIRFIA7pDJP6EhEmYPHELIVb
 6yJNgNHI009PRD81wriN1LVY6TjRiOWKSytVEjzFxMJIcEa/a4/uLSm48cZlvNLT7PMx
 BpiQ==
X-Forwarded-Encrypted: i=1;
 AHgh+RrJHS4/iFz5EGqznXNvp0sK675JmvfMU8Cce+bvTsK5bwkHG+Ty8h62BCA3KSAFXNd1WkHFJVG+zQ==@nongnu.org
X-Gm-Message-State: AOJu0YxlGpojTiP+o1vmdjOIzTVEwkAidqOwCLNfnqzPhmzxW9CQZz8W
 V9GpiWV350td0dLM3LlTJumEMHP4Gvc3linSHzBC1zt7DPDSRJBTZc93UlVrGawFNubGvQrcM8q
 9vpPBFpRr5O+SG7Z7Vmsda98AUCjiR5fao7odTRUSS1CxouNQT6tj/u4=
X-Gm-Gg: AfdE7ckn/54vwN/DwrDTMEyyc/CkKpRJMW/wFTF3bhWXvPWD//yvQvZYi5k3yw/4iR9
 UNhthLqZk3n6PqTh/oH73n78JgznaBjtt8UsgXC0IJfQ0iaSJOXcTPLmW1HoRiRBJMlg23VA27h
 O0FwvVqcKOyNJnKyVGCRWeqkwn3QEL27GoKCDbYQ6BiIKUmmoPDpWi6y7vfCjBR8wrX/WusZKf5
 lNC2eGgE0Nx2xwKyaWRQwRz2VKDbsF1pJK93sCs8BfmdsEdGXrNhiK/jF/raPNXPeOwoX4WzRWA
 9ADUqlNJJv+Ft7EnwNCWEhzb3VvdRdzi78qQZUzEcTmgW7u+TiVg400IM3DgtVIH0nNdzlHqhFQ
 h78aIA0VbR2VWhugYOmJirWAvNFTVeHK+CZZBkCESxCp8KYiViZI=
X-Received: by 2002:a05:622a:4d44:b0:51c:7b11:41b5 with SMTP id
 d75a77b69052e-5213f374d31mr191430201cf.81.1784663776437; 
 Tue, 21 Jul 2026 12:56:16 -0700 (PDT)
X-Received: by 2002:a05:622a:4d44:b0:51c:7b11:41b5 with SMTP id
 d75a77b69052e-5213f374d31mr191429471cf.81.1784663775373; 
 Tue, 21 Jul 2026 12:56:15 -0700 (PDT)
Received: from [192.168.69.212] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4956b00e512sm4397035e9.3.2026.07.21.12.56.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 21 Jul 2026 12:56:14 -0700 (PDT)
Message-ID: <9745c136-8029-418b-9b24-bc2fce0c536f@oss.qualcomm.com>
Date: Tue, 21 Jul 2026 21:56:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for-11.2 v3 05/15] hw/mem/memory-device: Use
 qdev_is_realized()
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
 <20260721-qdev-v3-5-d2e226fa002e@rsg.ci.i.u-tokyo.ac.jp>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
In-Reply-To: <20260721-qdev-v3-5-d2e226fa002e@rsg.ci.i.u-tokyo.ac.jp>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIxMDIwNiBTYWx0ZWRfX8UPDB/X/ynxO
 GscR/lEHkSYDrwkpOWaq1NgMZ3E1N4NABdhwNdCB/p1iDtUWGRNSabM0wlQukdtIwiFjfSrdJp9
 wfR9TbVOfsKdcIcaQxIC1+HuLc1BfWs=
X-Proofpoint-ORIG-GUID: ndNNbda8Ua8XOpQXpIiB_NZI3bnghEyf
X-Proofpoint-GUID: ndNNbda8Ua8XOpQXpIiB_NZI3bnghEyf
X-Authority-Analysis: v=2.4 cv=X75i7mTe c=1 sm=1 tr=0 ts=6a5fcee1 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=1tSEMpTH9XP_W59IOagA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIxMDIwNiBTYWx0ZWRfXw0EGfX7NxDnP
 EzPUmzkM25eCk1NM2NqUVDD6wGM23+DiSymuxcxa9iF86YUWsoW9NGW2hshrlVJcob19+Wx88fE
 xVPt1p+d/IZDaQ+dOttcZ6gBrmDZP/8FB/rRLLOLkgwwkLTTeOP9PDTXAsZnbB0bK3OUKLHXulp
 kFYUhm83U0cNyJ1tfr/n5gYVmu6+SEIy7E9MywMt7Jxa1+dl37Xl7J88lPOot+oL3eTvCPKGfaI
 H34HeFIue14iX0vOKyLaoCykYPy8BMJarBitGRmTu4u7VVyXI9zl1Dsoxrt8EzUMiROa/J99oO8
 +i95oN+5+4UqceyrX2EYvIwaEsJwmcGSc0mzeiFDwuS8NcTxXGK4eQdV/A8lNnCD17G6sWl0SpP
 pz2tCh0CVrcV9ycS32lDRd4pcHYPRLOYHNd8UEgUA/wrTBmLgeX7i8AU8JO5ViXTyF8LLXFZ603
 fclmUkJYm+nkWjETlqw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-21_03,2026-07-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 lowpriorityscore=0 clxscore=1015 spamscore=0
 malwarescore=0 phishscore=0 adultscore=0 suspectscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607210206
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
>   hw/mem/memory-device.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>

