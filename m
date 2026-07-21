Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A24BC4452D
	for <qemu-arm@archiver.kernel.org>; Tue, 21 Jul 2026 19:53:40 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wmGX0-00030E-SC; Tue, 21 Jul 2026 15:53:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wmGX0-0002vc-7G
 for qemu-arm@nongnu.org; Tue, 21 Jul 2026 15:53:34 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wmGWy-0007ii-HD
 for qemu-arm@nongnu.org; Tue, 21 Jul 2026 15:53:33 -0400
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 66LH2cLp2160311
 for <qemu-arm@nongnu.org>; Tue, 21 Jul 2026 19:53:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 yfc2fNmwnLyuMgvh+jSCxsduIPaduLSEBZx/AI2Wwws=; b=RPqXcRagssiPSDcR
 R/LW8ylTJTNc+U2UNLEN186dBmRUCfeGEN3wMnokclnIzggF9Yw6pQnYUePrt+BB
 9dyoqKFat2ti2Pa34SjqFm8ZXjuCQ38d1nFrZk8z/LI4QATrC7MsNkE7AUCuVW7P
 mWNrfTtUknPDIDcfL3DG0yiPRINbO+Gu/igq7wLPR9QJhbi+LeJWeLyKEufQWycU
 7GPPv4Zoyvs41QFYNyayaAJK1Z34GERqH5570jci8P/xrN+pLViI4aMHNXoWhcNc
 78gtlm+bjVn14ffif1ksIovwGiZUrDcUcsWa6Cfny41QItSTdDCuX+MllTKgH5rH
 ktmP7Q==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fj9c41wb7-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Tue, 21 Jul 2026 19:53:30 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id
 d75a77b69052e-5174a23afcbso104543681cf.3
 for <qemu-arm@nongnu.org>; Tue, 21 Jul 2026 12:53:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1784663610; x=1785268410; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=yfc2fNmwnLyuMgvh+jSCxsduIPaduLSEBZx/AI2Wwws=;
 b=LSmniZ5N1iKMpdcNpj+N7YDeRCn6XdJ+rx1eKTZ8jX89S/XGfRrHUDKu8LoAZ02UY7
 RrFX9zZglmOpOSz08z/wgyHrH4va+yZsGmJBm5ISKawUhUrV/jGXXO1ZxMrgm627JLOT
 I1/Ft3Gb2xG4s1xZz7pEC5eEk1OVZuF9CjKn4TvzosdyYRXuCQGq4bKHwyQdrmH++QqF
 K/lfDcRxZ9qiuFno50A0Sku++Fs5Zu71RpB9k26+u61YWMdN9U0yh8Eqm5FL3cEutBPg
 7IE2HLnZgo1BJpwj0h2PODtPXooBYgMxt0lP/7K2s2WhKPfTYdGGQAE90bs2Fmv3FRO0
 GQ4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1784663610; x=1785268410;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=yfc2fNmwnLyuMgvh+jSCxsduIPaduLSEBZx/AI2Wwws=;
 b=TbQFatsN+X9Kn8/ysXlkPgWuzOP/KaUNq04Zrs10e4E0i80hdUTrOnDqiYvksjbjov
 XxpyOpPWtXYr6MsKOGHxPd3CfLughXXcSTM+SFfZRCDqd1QkNj/68mQgu9Xt3fH9KzFu
 DCBf0D2hDSkzrsBTk0QaviV87umUObuW3WCrP/SwNsISudqSAjmgvwFLuApYEzCwZ0CA
 BkIvjP6w198mC8jXvbJSOXpkmElMZl4Wo7xw1shFFKxhTcJHbFBOoBrmMfj0eJkFQql+
 ERe6RgbwDHmsAD7Y8WjId9QLXAzYCHPwI2QKgEyMIoQJvRJuz4ceIeAWnlhvmGwDeNYS
 IiTA==
X-Forwarded-Encrypted: i=1;
 AHgh+RriZMDUaj4HTx+fs+kh1CBU3bui9SvNBMXUNTHAAaaLiBeQhiatmRgnTVqna9fStXxEO4IQt9j63Q==@nongnu.org
X-Gm-Message-State: AOJu0YysG5fTAa9HkFQ6eoDECDr2vD2hemnG1MY2HR86K2o91hF3LgFj
 w+W++u1l78GK/8OyHXbPKBTD28s5TWVQXg5lnPiQmrTeicfVP8zSp5srMEVKp8U0vKe0c4/cAUY
 /qDgipHhKhxLDI7UIsxZklynRSsuii+y1UBnoZWx43C3ZfSgWVmSOZAc=
X-Gm-Gg: AfdE7cmFc/cRQS0DGZtzxnpN0TDWiAAwtlGpWZu1KoNVSjo2FhSCQX4PTeMVp0+2ntp
 QBtTVZ0G0v0yo05K/pT24To0/tF6cPMyOcEyV3opf1efXDMV2keeMeHBgnvqtjIdbkUUxH3Zt3J
 b6tBsMduY68jjaaFpYzQCICj5ihsIY0IQUnAZ6/L7lVxJcv/8qnOboxRScWVFnWhnmZheFM6avL
 J/Df+BbNzKS0n/RhVEG6sruDF1SmQnfC3FRczkWNQEkfUIUGuqWEFhpMWOlJW+etpzYkqpVP+FZ
 4G7dD58hj4sAzw15PFJ6EGZiBG8r5vf81yh/KqdL3I9mu+g3T1i7OaC94hi13LTMdj1GpNU5fZs
 eaGrakZlpctUOilMBDZSeMjEclHUu4LK4VKLZ1yuIpoyH7DYo74k=
X-Received: by 2002:a05:622a:4d9a:b0:516:cee1:4727 with SMTP id
 d75a77b69052e-5213c10a2a2mr186187131cf.14.1784663609974; 
 Tue, 21 Jul 2026 12:53:29 -0700 (PDT)
X-Received: by 2002:a05:622a:4d9a:b0:516:cee1:4727 with SMTP id
 d75a77b69052e-5213c10a2a2mr186186661cf.14.1784663609559; 
 Tue, 21 Jul 2026 12:53:29 -0700 (PDT)
Received: from [192.168.69.212] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-47f67466e09sm45575497f8f.21.2026.07.21.12.53.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 21 Jul 2026 12:53:28 -0700 (PDT)
Message-ID: <cdee20b5-43b3-4373-9c0a-89eda4148164@oss.qualcomm.com>
Date: Tue, 21 Jul 2026 21:53:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for-11.2 v3 08/15] hw/ppc/pnv_xscom: Use qdev_is_realized()
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
 <20260721-qdev-v3-8-d2e226fa002e@rsg.ci.i.u-tokyo.ac.jp>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
In-Reply-To: <20260721-qdev-v3-8-d2e226fa002e@rsg.ci.i.u-tokyo.ac.jp>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=I4JVgtgg c=1 sm=1 tr=0 ts=6a5fce3b cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=1tSEMpTH9XP_W59IOagA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-ORIG-GUID: -cDIXOtoIkz3-FeXbqVjhrolKiORf6pP
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIxMDIwNiBTYWx0ZWRfX3eWjG++Jki+3
 frv9IExZJb23Dho2lhFl61/P3dh5Hqf1k4ClzTvXm9G6xmQi4OssWSxd4P4aSra/cSml7clse16
 C2KPiPU9vu7Lz2HZRpMqiOBkWsAn9P+8ipWV/pnetp0wx5w1SimHCc1BhnEHx+bteONjZwrUpQQ
 CARi8tAKsA7B7g9E8VXIgHn30qOOfGnfpxcyUnRFKRaf7x74SDDklP3z7Tsk0UKs6mWlG33r9Yf
 5sckaQFmik07jrOz3achwSzVY8P8GrmSFryHnSfY4RtT/LS2O0xi39LwY5K/Nrz9oPTUgCP/mLp
 VIABlVR01Yb3kF9xrSHLwBY0iWGwc5oFh0xYdc+36/fSTrKbAJSCWkv5t5VRhA2lPJptKAbBs7I
 nersyq+6Nk4VvM39NqYEOwmlFSa0FgohEaqH9qyUm9+x/DGi6GjxVnr6la7aXkT74vQgXGsu3zQ
 nb+GQDLrh43OKM+bP/A==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIxMDIwNiBTYWx0ZWRfX0BJfHZuRXUHl
 dDHkT1GhctiV4PPUxWIUBnguaE1SkGjiHV4WZL2okK5duhxuJFLOR+7u9D9XDe3HcgkqsZGsg2B
 qBOUcQU7BTUcMVCclCfzmLs6aK+6iLY=
X-Proofpoint-GUID: -cDIXOtoIkz3-FeXbqVjhrolKiORf6pP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-21_03,2026-07-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 lowpriorityscore=0 malwarescore=0 adultscore=0
 priorityscore=1501 phishscore=0 bulkscore=0 suspectscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607210206
Received-SPF: pass client-ip=205.220.168.131;
 envelope-from=philmd@oss.qualcomm.com; helo=mx0a-0031df01.pphosted.com
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
>   hw/ppc/pnv_xscom.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>

