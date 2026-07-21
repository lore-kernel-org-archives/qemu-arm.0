Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75811C4452B
	for <qemu-arm@archiver.kernel.org>; Tue, 21 Jul 2026 19:51:40 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wmGUk-0000eV-Eq; Tue, 21 Jul 2026 15:51:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wmGUh-0000cb-JR
 for qemu-arm@nongnu.org; Tue, 21 Jul 2026 15:51:12 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wmGUe-0007Ml-SR
 for qemu-arm@nongnu.org; Tue, 21 Jul 2026 15:51:11 -0400
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 66LH2ggM2418318
 for <qemu-arm@nongnu.org>; Tue, 21 Jul 2026 19:51:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 4w4klnGmDnDEVFnUyavw8v8Ft2ZI6azMxIMubgMjlIw=; b=UNfQfMQmQzjOOnZP
 HxS0RC+zFgIzvnO7gv2wyUPU5+AheezO6GBBE+hwkFLgR5silIMGLfquTc6Nsfcn
 iYR1gNbXoE+0X9mku0X9sGosNUMfUzksV6CFW6AFTmUvO9msS6JnyNsU5q2AYRfd
 Q+3oHX68aKQsw/TuF8gR4nyzFoBNt44aaF6trOIb/7jpB8trgl77uwj6hArMMGd1
 rT4CZNOu/RGMpF55zvFfjpbgYtvd59hfn8+1kh5+J2nvkK6NBlJKwBlct+U+CwZA
 ggcUkiqaY96lc2vpIpBmQnwd2OuyoYsrryL2jRTHqio7GPKs7sRGHknq+YqztqfN
 eP9MGg==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fj9bs9wy7-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Tue, 21 Jul 2026 19:51:06 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id
 d75a77b69052e-522de3c645dso93182901cf.3
 for <qemu-arm@nongnu.org>; Tue, 21 Jul 2026 12:51:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1784663466; x=1785268266; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=4w4klnGmDnDEVFnUyavw8v8Ft2ZI6azMxIMubgMjlIw=;
 b=AJnPQZcHpiJri3mtiDoIXkQ8SeOVDVyn13+JnJi/6kml+pJ4FEiMxnvSGK9Ur6Lf+A
 WR8c99i5dSqrBS/yVagsN/lkkuy4lkBF90HCwRNvZXVTM6ctmsNz/BK5NXbpPF+v1+zm
 tALP3drBmxn8I4Xx3quIQNFJkxBfTJ9hhYHDYUmGX1UDU9rHpFBE9w7PVMXIazAf65+o
 SsCI64F77YOvvmmX/gHhc4eM8FauNQ31FiwaOLJZhRJUcLcta15J/mUuk+fHL9AEwSbJ
 kV7FtMr2XAraT3vbUW2D1/pbl7/CUMsvBEWMjRU+rgBYNFsCuNZBgST8LDzW0E/OhYCa
 jF0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1784663466; x=1785268266;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=4w4klnGmDnDEVFnUyavw8v8Ft2ZI6azMxIMubgMjlIw=;
 b=QNPjZaitFI/lYF4s98HUnvu5/inkp/tTKZbToP29u8u21UF5Ebb0zuIv4Aim5v7Xk4
 M1BTwhztfTiymLTDhvkOeZQyILBkHnflw1qLxMZrsOiHW9AOyyrLwCxG7W3MfG7djJLA
 3ESXTwB+kY/5F/6NT5bs7mMPQ69wBxj3+yRIgMcM+NbU3Z/NiRncBM58X8KzpVerqy0i
 1qwRLXVdnHnCHnzDS6Ly0DY/zB8GOpsWLgHc2xE+y2DSixUBE1v47P5HugZZd1+ZzIQj
 ylE/IfuTkJ0qeoEn9H/gMwhZHPadmlUnsvyBzlBAuNXfpD9SQXgqUbaY7nO5D7trO4ld
 61Lg==
X-Forwarded-Encrypted: i=1;
 AHgh+RpRPXUgzSxUMSs3K6QskFDN4WddhpryyWzhnoTSvuQQFM2dSZdQCECurIU8+uPNBw6SrxGzQorXMA==@nongnu.org
X-Gm-Message-State: AOJu0YwgRuG3wPRdmo56fyp0i4lmyOsHdB8MTJ0JoxFozA4425ycR/b5
 QYMjnyvZ0KwNICP2ZtrIQEaUb/SgET9IGTyZ2wTDtAXpI2eSwYqlQ3otYOa5noAka3MnS1wEXWg
 qmfMZtnRNQs9MLV5Sb7PT1wmBJckRT17GwciLtvmBj/zR1pdqdBiyyWc=
X-Gm-Gg: AfdE7cn+6xw5dOCA8nKGJBAdumBXv5i/H6iiJkQGhLgFUQt6GReqI+ajHM1hdG9Di2q
 eHrW+u/gYE2XAlKum+GU5mp6gAXZHyF2YEyJZZs0Je1Lgyf9uQQiKjzuz+bd6iyGNNI1j/xsvTp
 EPRvrnS7dhA9k18x2Om+SqDlQBi1OoSR7r13jJ4szdyu5B+u7qoXwut9oB1Sb9U+Pzc/kphC0in
 ghiimTK9GWU/9o/RBC6TG1NDJOpJxMoDeasYmZyFfseBd5f2fOAzOg16f2xDbn1pb8WIR2qUaGJ
 JVKGzIIb4v07kgmkFgx7K1vzQut3B5jqeFEaEfsb/GRWiYavGKa6iWVgSaN+FvlD0zruB4dTFQC
 9rTAhhlwOG7Gtcb+IulYgWwhKjUr5l2rKtMoUSG1X8bk7nDWkCjY=
X-Received: by 2002:a05:622a:1e17:b0:51c:1638:8663 with SMTP id
 d75a77b69052e-5213c7e69a5mr196641681cf.53.1784663465892; 
 Tue, 21 Jul 2026 12:51:05 -0700 (PDT)
X-Received: by 2002:a05:622a:1e17:b0:51c:1638:8663 with SMTP id
 d75a77b69052e-5213c7e69a5mr196641351cf.53.1784663465489; 
 Tue, 21 Jul 2026 12:51:05 -0700 (PDT)
Received: from [192.168.69.212] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-47f6fa848fcsm31267934f8f.0.2026.07.21.12.51.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 21 Jul 2026 12:51:04 -0700 (PDT)
Message-ID: <b7e4226b-132d-4999-bce2-ba64bf4136f7@oss.qualcomm.com>
Date: Tue, 21 Jul 2026 21:51:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for-11.2 v3 04/15] hw/intc/apic: Use qdev_is_realized()
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
 <20260721-qdev-v3-4-d2e226fa002e@rsg.ci.i.u-tokyo.ac.jp>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
In-Reply-To: <20260721-qdev-v3-4-d2e226fa002e@rsg.ci.i.u-tokyo.ac.jp>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: DPevdrTpVt0zKJDTNrJaJzeqouAQwU3D
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIxMDIwNSBTYWx0ZWRfX0z5HYELtqNJZ
 Z/pYOr5i9+GqBGQptGMD8A3CDEzCFQJhiWtaDtY5kmFH78Ph1LIUbRwNyTnlMNsWix0B+xIMY2K
 VTyIQwIdyCMWrCxRwN3gckh74R/ftLaVMG02MUpKp7esuNrmqnrATX+DibqOPF2+Jwsvoy7P59c
 qclcEgJq1dr/iqH7yCcixxWuQa3W/pr6DXUuxbABwR9aDNakx8AKteEL/sIBTOyArRX4yVPMBiU
 G1qcG9espIKYxq+8TCLQK1UUTDGNpdTSewYAdRWVP7Ik4Ibwa9eLWn1F3doSg/zXzbj5GmNIVva
 NwIrA5S1OwFODK5Eyk0+p5c7CPKDb8s+mlME0UgnT+VRM5HcUBYrgpeaO6xp1b062Qbt1dcEybJ
 HgMri6KnITMeFEjWYgnsveprbjHQ7pQGXF7gypVM5DCZ+ItB5CEmPj1FJ4VVXefcYKli7vl1mZF
 uCFrE9un1T2XjUKhOlQ==
X-Proofpoint-GUID: DPevdrTpVt0zKJDTNrJaJzeqouAQwU3D
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIxMDIwNSBTYWx0ZWRfX4BrOjsyF3jj7
 V1XMIRI4S0eY21y0O32dPpeuib0UG5IdKwF/v9j85f3ecOpVCTXUMKy689xDr1MId2XfyzBaP35
 RT5Mi98Yf7Xbp9Oj1JULb6G+zoU41I8=
X-Authority-Analysis: v=2.4 cv=QK1YgALL c=1 sm=1 tr=0 ts=6a5fcdaa cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=1tSEMpTH9XP_W59IOagA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-21_03,2026-07-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 phishscore=0 impostorscore=0 bulkscore=0
 suspectscore=0 clxscore=1015 adultscore=0 lowpriorityscore=0 malwarescore=0
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
>   hw/intc/apic_common.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>

