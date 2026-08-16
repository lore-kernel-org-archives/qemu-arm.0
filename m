Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C139C5B572
	for <qemu-arm@archiver.kernel.org>; Sun, 16 Aug 2026 14:34:01 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wvbvl-0004PA-L0; Sun, 16 Aug 2026 10:33:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wvbvP-0004Mz-5u
 for qemu-arm@nongnu.org; Sun, 16 Aug 2026 10:33:24 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wvbvN-0007VN-CP
 for qemu-arm@nongnu.org; Sun, 16 Aug 2026 10:33:22 -0400
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 67GDlSKW3162140
 for <qemu-arm@nongnu.org>; Sun, 16 Aug 2026 14:33:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 3HDSbiw8tbY5KIqeNkfRvaH7a9AIKkJr4VtI09fSd3g=; b=Lr64bsMzGCHVMec9
 BAMa9/HM5wnBjwkaslhVoOaKlfzp9Kyje3ohY00zwFA3FHKvESPLGGjpk7VYhM8r
 g7eWb+IT2BLCNbtUKK220R8GZf6erRq+cLeJ+MaTHFkAILLvvzNBpYseOQWJMS3c
 XdP5qZPriPxc3BvJEDtDNvFJwE31zue1KiQJYU4V2KQlArBg8CYHIxgxolJ/RwCL
 iolz6Ub1K7IQOpQzgiRu+MfVBcSSs/ZIHqEwyO4aq8Of9A4lSlZr9WpeOoalfsGL
 jeRuk08cqiQDeIRibsyb/07+qn2kfqvsgVfXmYqjPCbPBduwqv6zdhamr5gZ2f2Y
 YPMeKA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g2hd7ufa7-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Sun, 16 Aug 2026 14:33:18 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id
 af79cd13be357-9368f2b7b2bso260617085a.0
 for <qemu-arm@nongnu.org>; Sun, 16 Aug 2026 07:33:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1786890797; x=1787495597; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:references:cc:to
 :from:content-language:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=3HDSbiw8tbY5KIqeNkfRvaH7a9AIKkJr4VtI09fSd3g=;
 b=dfJi6y2u+9mEeMYoWpVUueD3QgSDVJ6ryjuQUunTWPe7EPoltlyF39wFDthn3DrOwo
 0uXNGYykKLiRvapN4OVD7kbmRhIEBQkz8pPLicW0mooVX0SF0NOpgE5lBSHcSNz6eGag
 Tn3XYnmzcvKjX3jSpI3jf+pVv2C9cPciQJfopRa/emyz9CU6KKESVgrFOduqiHFxy5XX
 4AH53N2U8YxEphpRn1I74B0euXbmCEbhfNJBtvMoKdm/Ll6DA/eky3dIhTHVMS6LAbm4
 A+JdAlr51ZBrqRJ4H+BFmwO4XjpgmZQP/UkorIJ5E04veWV50J6E8LOcUxWlYfjttkB3
 IOqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1786890797; x=1787495597;
 h=content-transfer-encoding:content-type:in-reply-to:references:cc:to
 :from:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=3HDSbiw8tbY5KIqeNkfRvaH7a9AIKkJr4VtI09fSd3g=;
 b=WswsmPmGyLZOl6uLvbvt5+zyROemmyBFknfULwisUFzfViqUIESia1TYdI+szFMt8E
 esOv1WkkQMUQ7y+BO/GHa6izfsCSVxfV3PDEJE0JCEggzYPma3xwIxWKgWIw2vLVrrfl
 3dl9DPnvew/5Aryzfezy4pp9HnSZjidk/rST0QQZLsEnZSsIK8vs/fz5vhR74e0GOoit
 Rupeo5xbeGIXXUnvFx9pM7WlldRAarAMtWJVuOBs8ZVBrJfvhvBsMJxpHieXluE2Gu85
 B+UD5Cf/vV62QNUxwNRabQzpINiqN1HffaNzg0e649eL17Fk4WOKxn9fRRHEILdAkRnZ
 /N6g==
X-Forwarded-Encrypted: i=1;
 AHgh+RphmYflqsMzwcaVYH3yfRD9/O2Dcs11D71e1a3NMGHePJRWS+H20cQKJHPZ6Cm28fGuQx4N0vTZWA==@nongnu.org
X-Gm-Message-State: AOJu0Yzdoll8pUnBi47r42bCGgUYb2cn8URmwUSGwHlLx2wzIxh48iIl
 HS+GMt0F/hFOxq/0orXqAiNnkDDU3WUxKAfdj+GPPoHkCAXtrQMZk7qLVbCJ9NgeB64hl4St3K8
 u8siMDStMDY5ZgBDtpMwX1IDiBtB6LrMLOtK0bieBu6T7kz7dq+3veno=
X-Gm-Gg: AR+sD12uWhVaZn1vk2pDp+W+44AYsGY1wYWokT478m1zi+DhK17FyU1HNHZwO8h+R4U
 MB2K7eHmd1HQGCO/PV4e+t85qZlW/PRNp1fdzdui5NeS4V3cTY9pNMA5yNtFrDJpLj83W1ursUi
 b899bKIl1RF6Xc6hFKlGjuM75SNr1Z4v1oASthSMNTBTe6zZA8Bk6SCWRNaQhXY4TvnSd5+3WSA
 y29oEMnkmqn+cdCyIUUqLL77NoZDuQqoAQcZBvIEGSY9Rmw/M1KzJ02dFs9sObCV31kQCo8Lw89
 slH0Xhx889outwGvHshbbdBLMq/BG9yrVNUMI3CIAADxHu9laf12vVlzbERzV2COyDnjkWKRvfv
 4iNrcR23D9CLKQUIPmaYWNwHny/AB2Mi8dYE=
X-Received: by 2002:a05:620a:318c:b0:92a:bbf6:717e with SMTP id
 af79cd13be357-936d2399727mr1820412585a.34.1786890797191; 
 Sun, 16 Aug 2026 07:33:17 -0700 (PDT)
X-Received: by 2002:a05:620a:318c:b0:92a:bbf6:717e with SMTP id
 af79cd13be357-936d2399727mr1820408285a.34.1786890796776; 
 Sun, 16 Aug 2026 07:33:16 -0700 (PDT)
Received: from [192.168.69.229] (pmd666.hd.free.fr. [88.187.86.199])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4815f1fff25sm40286001f8f.3.2026.08.16.07.33.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 16 Aug 2026 07:33:15 -0700 (PDT)
Message-ID: <f36cd135-4e58-4929-8491-40d4c2c5a82a@oss.qualcomm.com>
Date: Sun, 16 Aug 2026 16:33:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for-11.2 v3 00/15] qdev: Clarify and enforce the device
 realization lifecycle
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
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
 <b8ea980a-dff4-44ef-83ee-6cc1402a313a@oss.qualcomm.com>
In-Reply-To: <b8ea980a-dff4-44ef-83ee-6cc1402a313a@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE2MDExNiBTYWx0ZWRfX7yxxfqr6+Z6t
 5iIDrX39M7WWMv5cVcfaHjGFG2u9APmsKR26NLy+5I61tRTqex4Ox7MwB3m144Qlz/qFxsThFWD
 qSPsSvWRoJAllRoupFbM0qrKrW6AoNTF8OY9ao6jD30tj5GJvt85b7TKyN/oTlk9Q/v515qC05Z
 4/+KMJVWAT/iBpuo6nWQj7/dCsklwcEbAOsITB5hhgy71YqE/Au2nuQwGXm7wBevFg7HEYnxb/J
 EVdG0V1zZq+J0IN9P/1/del474JUqXFtIb+ATIRlaKzVSZoOgHmNmA04PsiGIMVV4r8f3+OQE/g
 PBicxfQ7UwijroANgAMZTbGLLsxXB3SDaF6wa809t6k+Jlrwf412OCO0e7ZjpXGc/J5Yp7NDNBG
 wtT2RnpkI14a29xGGh1wEjILMJnOKk4ua/OeJ63fSNFCMOmVkXEFiUyHoolBFuLLnjTfTWxCqX3
 gs1YZBLOwnIFZsbC86Q==
X-Proofpoint-GUID: jiVNYRu3Ni3m5pNBnIv9QrUEMxwpBYxP
X-Authority-Analysis: v=2.4 cv=Ja2Ma0KV c=1 sm=1 tr=0 ts=6a81ca2e cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=3Hgab9GNqnbXk1otUC4A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: jiVNYRu3Ni3m5pNBnIv9QrUEMxwpBYxP
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE2MDExNiBTYWx0ZWRfXy5i9bPXWqJmt
 H8ubrZUHUsJllzj3gm+aNlnVH+mZWLOwX7zap4r6CVpw57iI1spITwdEP0C5AA/bPxZkjHS91cT
 8MTYvu8ZcIbfBN9GlouERVKHZbm+V14=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-16_04,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 spamscore=0 suspectscore=0 adultscore=0
 bulkscore=0 impostorscore=0 clxscore=1015 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608160116
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

On 15/8/26 15:59, Philippe Mathieu-DaudÃ© wrote:
> On 21/7/26 10:16, Akihiko Odaki wrote:
> 
>> ---
>> Akihiko Odaki (15):
>>        qdev: Clarify instantiation and realization
>>        qdev: Make qdev_is_realized() take a const DeviceState *
>>        hw/hyperv/balloon: Use qdev_is_realized()
>>        hw/intc/apic: Use qdev_is_realized()
>>        hw/mem/memory-device: Use qdev_is_realized()
>>        hw/mem/pc-dimm: Use qdev_is_realized()
>>        hw/nvram: Use qdev_is_realized()
>>        hw/ppc/pnv_xscom: Use qdev_is_realized()
>>        hw/vfio: Use qdev_is_realized()
>>        hw/virtio/virtio-mem: Use qdev_is_realized()
>>        hw/virtio/virtio-qmp: Use qdev_is_realized()
>>        target/i386/cpu: Use qdev_is_realized()
>>        target/s390x: Use qdev_is_realized()
>>        hw/qdev: Parent device before setting parent bus
> 
> First 14 non-controvesial patches queued.

I'm dropping the 1st patch which isn't reviewed.

> Waiting for Igor or
> Michael to comment on the last one.
> 
>>        hw/qdev: Prevent devices from being realized more than once
> 


