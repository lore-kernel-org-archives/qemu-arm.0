Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A4FDC4451C
	for <qemu-arm@archiver.kernel.org>; Tue, 21 Jul 2026 19:53:21 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wmGWi-0001rP-GL; Tue, 21 Jul 2026 15:53:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wmGWW-0001hj-6H
 for qemu-arm@nongnu.org; Tue, 21 Jul 2026 15:53:07 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wmGWT-0007fE-FO
 for qemu-arm@nongnu.org; Tue, 21 Jul 2026 15:53:03 -0400
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 66LH2eLX2280244
 for <qemu-arm@nongnu.org>; Tue, 21 Jul 2026 19:52:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 DkLncRROIxYuPFxLbZ394vVmGJ5/KNcqOD7OwB7qsN8=; b=HEEM0X+q51qmNm3e
 TjQ+DC8s8cIiDf86+w+gsI+6FS57mbFKWslT0iiGG7+ZVZ1F0rdvuEiZBeRWyFqb
 fPu29IPqXFQ1wcviuGDLarbHVl2p0AweZnSyAOPsVU3v3OzomlqY2QMF0mqN5dQ4
 Wd2xuwG8wKssodrS5EcjYrGsyma4ewaVgMO4dsUCPgPGyFKsPvq46vq6GMoKxFyP
 nTonSQc5UqNAb/LEtszNc0TDFh80835GB7XGZ7spupna0/x68gjQWcLHE3vt3o7c
 Sv2v3wb9By4pG2sys0507nzWPH+sjJ+9S+6B43RdWellYqMUvMGpKJZuWbEHQaQG
 frBg+A==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fj6paar6t-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Tue, 21 Jul 2026 19:52:59 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id
 d75a77b69052e-51c1d137a68so317952001cf.3
 for <qemu-arm@nongnu.org>; Tue, 21 Jul 2026 12:52:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1784663579; x=1785268379; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=DkLncRROIxYuPFxLbZ394vVmGJ5/KNcqOD7OwB7qsN8=;
 b=W8QHyoahE1tpPFNWuUWtqJkqAzZH8pCl1SoDxAWvkFXNc1car3z5lUW4+I7zmE3Yt7
 i8TqbnkdTg03pyxHawAXYbxKhuvOvBM5qMKn881a7CFqtkMG5SQ1hAMfHy8OX4NBL0A2
 eSl/+7QpS6+/E+coJ5BnKkV/DX7rfKIjXR5SIx9rBt5ue28RY7RaB2onWtjgKDXjiGip
 Os8tBqN9cud8yAPTsFOMXjPIcpoy4AQ+vNqithVsnhlXp8pRZWF+orM12dho/UVpjQ47
 VmUFvfEqqB6xSVB/FFrG0V/QKZyM0IiYuGjPKPnsjEZBrHRj9n43cW97igiu2xHVWO+A
 Ettw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1784663579; x=1785268379;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=DkLncRROIxYuPFxLbZ394vVmGJ5/KNcqOD7OwB7qsN8=;
 b=qBnvmIHicLUrYLOCAWU04OkehtHxAINQMp0WI5hnR78+DH5uG0y9cKcQab83WT9Y1d
 PlEq/KcysonJsKqXZCz6VWq3HzSoDw0+aNhmHsAlfQQHFsUhreMJdf7OOqKInKk4/RZU
 UHs/P4DDUlgwI8Br9OkFt0IoClcWomUK+QL2irrvOTZMu4unbYGlex1vF6Js8lc6WhDu
 QuRz1M0OoPcwUByDOX26ZuFW6fDzeGVEBh/EAT7e+/uzlYZ3He1BJBfh55jB7FZuJMTZ
 z2TCjCJHkFe9ihxqvSbWwD8L8DZe+bwO2E5NbcjJslzo1b4tiz8wGXvjrCbdLKwLTzkz
 Kw1w==
X-Forwarded-Encrypted: i=1;
 AHgh+Rqcq3KuTVtFqg73GQSq3Ht9NCx6GIkgKe+JtMiyQ/2cSGDRIlo6/RagsJIDs1hwRyGiVubmM+9G+A==@nongnu.org
X-Gm-Message-State: AOJu0YwlcWbOXmB+zZgG2RHJHTMxAhyQev9oHCYT4n8/VIBKcf+KNQGn
 MBCw3Qr5x7+xwtMwHvXOwW33ivn46LYAWiJ8GNJxePBeeSVLe6f4jMAiCsaYbYyWh5RiwEWCX8A
 B3xsGfC2lB9w5lcUIsxLxSXsa39r9bSN6VaLQxfQudselk6E0Qn7y8Is=
X-Gm-Gg: AfdE7clPFUTDTz4609puIS7NkPW7Km82z++bg0xWfoz16c1Y3wiKR4WmeLWgYUMuu6w
 3QG7/lYpAh5xhg4B48uwX6R8b0rE6mfCO1lNR8dfznK8LBA+N0e95IJt2VDhpMKR0JiimnCZeL5
 ZLB0oOG04Mho9ikrqyX3iexMAI243lNVb0/5dDW5ElZspEaONtBRjmwjHp4IHws6gX/42hKrOCf
 C8etIPuFNE6oT5GOP4FXjnTJB0bQQeVN8KCmNsRt7hv9HuAiEywE4h8he9KkTney+t5LI9X4hcf
 D7i0HdyCqRDXgxcIvdtKY+utOHC4zN/xzTy6W65TJeHaHX2Kp7ZZvniRttWKVVIHErG3rjxq3/Y
 MNZhhLk2lE2qcXGMJfwCNfnr+dnDf2VMABrk7gvbqGx6DZ3egiJo=
X-Received: by 2002:a05:622a:28f:b0:50e:635b:5579 with SMTP id
 d75a77b69052e-5213cec68d5mr189054971cf.19.1784663578958; 
 Tue, 21 Jul 2026 12:52:58 -0700 (PDT)
X-Received: by 2002:a05:622a:28f:b0:50e:635b:5579 with SMTP id
 d75a77b69052e-5213cec68d5mr189054301cf.19.1784663578339; 
 Tue, 21 Jul 2026 12:52:58 -0700 (PDT)
Received: from [192.168.69.212] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-495653bfed7sm101473155e9.11.2026.07.21.12.52.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 21 Jul 2026 12:52:57 -0700 (PDT)
Message-ID: <3fc2e1f0-b8b8-418b-93e4-b430c1fe7a56@oss.qualcomm.com>
Date: Tue, 21 Jul 2026 21:52:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for-11.2 v3 06/15] hw/mem/pc-dimm: Use qdev_is_realized()
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
 <20260721-qdev-v3-6-d2e226fa002e@rsg.ci.i.u-tokyo.ac.jp>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
In-Reply-To: <20260721-qdev-v3-6-d2e226fa002e@rsg.ci.i.u-tokyo.ac.jp>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: o5AO3MWL4xzaB3nx61BUdDj7sTMtPjAF
X-Proofpoint-ORIG-GUID: o5AO3MWL4xzaB3nx61BUdDj7sTMtPjAF
X-Authority-Analysis: v=2.4 cv=eYYNubEH c=1 sm=1 tr=0 ts=6a5fce1b cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=1tSEMpTH9XP_W59IOagA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIxMDIwNiBTYWx0ZWRfX/OpsFM1K2aBO
 zZ9cy6UBuByC8FbFLpExJkbJR+XPZ1b9grLFpeVkGNuVMgjY1Jl776hKQbzsg8s6bpdTN1OXFUJ
 gzUMZYRTW1+2YGUwxs55w+KF2uJdeN6u0hasr7PkVvFzQgng4zyLKs8J2a5vBIJxqL/mtPGzitw
 G9Y0kcitzlLtaX4u7ul5M1qKDSFPeT17c+1hhtbHj4NBvIfTpqLAkQXWajotpgY82nwbek4d8k3
 lyOgYwLwDAZiAv3jy2HkGkkNfYi4XK8zPpBrxrwHmtgyOCDWThiH9v5JUa/84SUnepy8vPuDohw
 qoWKD8iXoh5SeeHrrNnzoIj7zq+LauA4Wpc/ZVwnNbf1fc9LPxZw/lhl+apox1aMZXPdXZkJx0o
 eEIlgs+MDunOfnrLrS2dhDi2oGZSRkqhS4ZDiZYhjmD9QkvabXpXDtT+bbOSz75iDwKu3UhC7VD
 3S6b/YiNrTBzhTiH2AQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIxMDIwNiBTYWx0ZWRfX6wZG8BwtZONj
 qKWiU1oFYJQM0Hw+v+RkbdQ4SLxVzX3rPWeTcuIHL8GiSqN1j5lD1jGaDAtJ2Ei10rnGkk4qFYs
 iCk4Bf0r65ARxZoreKvKGxcSXBeb64Q=
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
>   hw/mem/pc-dimm.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>

