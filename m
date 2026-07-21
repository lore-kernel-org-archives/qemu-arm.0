Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BFF38C4452B
	for <qemu-arm@archiver.kernel.org>; Tue, 21 Jul 2026 19:57:16 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wmGaM-0006fT-HN; Tue, 21 Jul 2026 15:57:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wmGa2-0006RA-3k
 for qemu-arm@nongnu.org; Tue, 21 Jul 2026 15:56:43 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wmGZy-0000Vr-3U
 for qemu-arm@nongnu.org; Tue, 21 Jul 2026 15:56:40 -0400
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 66LH2d9d2186872
 for <qemu-arm@nongnu.org>; Tue, 21 Jul 2026 19:56:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 pCW827M1pBepVwCokHHS0doFxAT6Sk8stCKkY7NAS6o=; b=HICMm60fwsZX1dtK
 vMnQOEx3+KpW90Y0zD4MepnZmJIljvZo+r+btVOsN4M2nPsmNNPVOkoY3PAWGDGs
 3fto+609Ubn4EFLVt+bD0o591yE39sKzjFOJdm05KXkgHh5+nmuowNLc/p2kFpEW
 cwrsLiyy9uRlqyZxWRIj0Ptv7N/IG8ZyoyPcN0oaQ41H3U4xJiP2vhtLr7MhmuH3
 UNhpfHVvCiBKtOg5YtCsSB9DJjQgVJl5SENmQI/omvr0YcGdb7KQzcjLh77svqTw
 ogxUT1YfjC3eU7ArdV73Oa/uOgxnKTWduOtGM6i/ROs1txyA7eZAOWggoW/jTGnT
 CiTllg==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fj9aea1hq-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Tue, 21 Jul 2026 19:56:36 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id
 d75a77b69052e-51bec738909so137447811cf.1
 for <qemu-arm@nongnu.org>; Tue, 21 Jul 2026 12:56:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1784663796; x=1785268596; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=pCW827M1pBepVwCokHHS0doFxAT6Sk8stCKkY7NAS6o=;
 b=AJ5EKXsq0q7tk9sldJdDA+LW8qBtbak8RTor2eI30Nk8wRHInru5/UpPV818lSVk6/
 zJ0WIyGPYaqCIq+5fuDKjhxYw5gBnoxva0QUGelvBe0o8f4bT1s/y8E48yBocvpjHwQ7
 MDJmqZHCZB1ACPy7n8rnRMHKcR78XBX1/n8Og/9Qx2oPmcnkkGfQfn1bPKztVkHTBN7s
 3rHISPqNGfyzMsjDr2SOTAOuLHCcnR/B1DWR9W1SSdiALgDLTJMpxlkshK0+xmsLtytv
 QoG72AlAp5ydAkXq11dchSqoO/gtMvKuOkqDyuxC2+pTnIXP7kvXhxN6JceWCgkM9Mho
 /ieg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1784663796; x=1785268596;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=pCW827M1pBepVwCokHHS0doFxAT6Sk8stCKkY7NAS6o=;
 b=SfzZlgjLDb+Pz+JUkQ1VS1n77Qw4YSawL65Y+7W2h5Szf7Uh09fZ9aYWiUZTBRDftB
 V8jxaqV1lkPOQDkRCH3erAmPYj6+JOY8v3HBgJwcf5N+XoBMCEk7dBx1Ufr/G/XjXGi+
 AJwhrJ9o9G6Xy6IArmM8KpcZZEAvwyPUJcgHpjFUH2662358qwl0FTnf0G0BWNXeUqK/
 q5zz4JoyKc68dWz6mtWe8nExE3p7hUsLkR8p9kBAp8xG5TqKR5Y+bf5vl+vLOJ9kQnRQ
 HxclIKVgPTEho4Yb8X+CFDz/cmVFVaPgpaaiclShPAbXvU/9dqgOA7a6PwZuV+U1I9zw
 PHRQ==
X-Forwarded-Encrypted: i=1;
 AHgh+RoPb51bB+cMcS3u6GEYB2LCorGNj7V6AH1nzxc9UfipvhmANfKHSXa+CndI8vFxtVpzV4WxAmRNCg==@nongnu.org
X-Gm-Message-State: AOJu0YwBnMYEANqyZdmvyX7m7jzQkSVVUXZJZuIG6R5rpw7D6Y8XrxXw
 aH+fSg0UQ0ykO4PW9OfSqOEtC/4/LXSjrV8qFjAqB2C94tM38w6YuWeWLnP5j1xaTNwhexi8F5u
 r8INr4e6z/pkgynkkON8j7wdFzvHmC7opuwheL7ODx+8gI9SbMH0/RJs=
X-Gm-Gg: AfdE7ckB62/J1eOka5Dx915G5WLigOrVZy25Yde7wFSW3TKdoa0mo/bEXYoinuIvKxH
 bLaA8vOFrusW/6Zrcww9pjXaCdZ/36KsYOLMPnTqLQ3x2lc1icvcCWM7wslVvBC0dN0Iddeud1b
 Gq5O+pEomSMOF2rvbz+p6kZarh+OpYVvPKwJQ/SGWQuVs/D23iews4KPcFU/hw88xO+na4wLUCH
 ax9Abf9+mTLy8naOZuLvERSTu6hR72xn/F0axVurAWRSwr1sds2k58aiXsUwoGalN3UqBlKKwGw
 G1nyEPNffq8ZvemFYI80J1u46JCZmR4m113anGxI0XrgCpJK4dK6pknxmcaQOA9FO++w+PfcbcS
 +1KlACApM4jIOelJJ0ePPfVO9HCBuEvg1W76BPADb7u4TmlfPxL0=
X-Received: by 2002:a05:622a:614:b0:517:8e65:68ea with SMTP id
 d75a77b69052e-5213e28f73emr195286731cf.54.1784663796226; 
 Tue, 21 Jul 2026 12:56:36 -0700 (PDT)
X-Received: by 2002:a05:622a:614:b0:517:8e65:68ea with SMTP id
 d75a77b69052e-5213e28f73emr195286521cf.54.1784663795854; 
 Tue, 21 Jul 2026 12:56:35 -0700 (PDT)
Received: from [192.168.69.212] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4956537c6besm86632845e9.8.2026.07.21.12.56.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 21 Jul 2026 12:56:35 -0700 (PDT)
Message-ID: <66e9c826-0b0b-40a2-a0e6-088e7d86e73e@oss.qualcomm.com>
Date: Tue, 21 Jul 2026 21:56:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for-11.2 v3 03/15] hw/hyperv/balloon: Use
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
 <20260721-qdev-v3-3-d2e226fa002e@rsg.ci.i.u-tokyo.ac.jp>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
In-Reply-To: <20260721-qdev-v3-3-d2e226fa002e@rsg.ci.i.u-tokyo.ac.jp>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: feJVFgu3Of8OSgboPADLq1pCNrDc60FK
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIxMDIwNyBTYWx0ZWRfX/EOJnvz7gqu5
 kufy3ZJ+sAsTNEUMaz+2DTDamhLgjYZaDtujsobYlYFoPVwUBonCijGJeHem0lJl+y5LlSe2V34
 VAs1ZZ0nVO3bESdLJHsiEbCBOBPHi/g=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIxMDIwNyBTYWx0ZWRfX7UoagQHs3MTF
 Si12k7fMXeDBCVRlHf1xKKVfWtmjDL1fkknLfxGMEKu/7WVxCacx9AN6qr4dxXrqK+JqN6gxCeA
 /7lFHF2Znh+jY7C+wWwAKwCyrCu6Js7bysfusMtbo0UBj8EevPEq/lwGQgKyeOmRV9XfrCJtfW0
 /pCLpsBw4YSfklTVbuFsAxm8W4GQaXhZuwg25KL8bfqBAaXFPAt028cq7yIPCeIGOCTzyUTr9BW
 rjrqmJeykeHcen07+KMLNqnJ8TVUJewHtXVVTMiMF7olzyVMHImQJxUwDi+/Bwmi/pvSP4/d8wP
 lU2fodJXMpEQcprihE4OWQSkPc4qxKafUXIZxRBo6iDWCy8kq3CXIWOrQf97Yx524jzbi37eOPZ
 W/97xkoZBy7bzOStd/FMAN6NC3hNAIfYXJxBp5Vqm+qE5kjvpfwwFd9GowSyLoaGj5tZHMc/uc8
 ndFw1SY6YUpoxvjWoGg==
X-Proofpoint-GUID: feJVFgu3Of8OSgboPADLq1pCNrDc60FK
X-Authority-Analysis: v=2.4 cv=Cr6PtH4D c=1 sm=1 tr=0 ts=6a5fcef4 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=1tSEMpTH9XP_W59IOagA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-21_03,2026-07-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 adultscore=0 impostorscore=0
 lowpriorityscore=0 spamscore=0 phishscore=0 clxscore=1015 suspectscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607210207
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
>   hw/hyperv/hv-balloon.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>

