Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD00EC5AD5A
	for <qemu-arm@archiver.kernel.org>; Sat, 15 Aug 2026 13:59:58 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wvEvD-0006Kn-Iv; Sat, 15 Aug 2026 09:59:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wvEvB-0006JE-6c
 for qemu-arm@nongnu.org; Sat, 15 Aug 2026 09:59:37 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wvEv9-0003tn-5Z
 for qemu-arm@nongnu.org; Sat, 15 Aug 2026 09:59:36 -0400
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 67FDMaL6279571
 for <qemu-arm@nongnu.org>; Sat, 15 Aug 2026 13:59:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 oxEhByDE68f3uMvm/IT1zYO75Qyc8mfPBNs6GENLEH0=; b=JHipOcWEXbj6Y/Y0
 LjiMeQ32lcishYs6Fo88GhZCu5ycaMwhEmNvxXkanc0J2+yBJalZC+a4r0VQ6Nki
 bI9JrmIuu4ga/OHm4L5bl8MulmfHOvfiODaisIgaIfPlIsSqWqv6VxjJpAS83Son
 Eo3Ta6eWE8w31BNkbVe2m4Kr47K5BwHx89pJ2quhBj2GFT91IMd52thUqQ05/P02
 XWv6+YiA3E9dodvHnvfJeISq1r0LHhJv2yv9ewbyZzoB1GRZKIL7vt0WaAgcHgoR
 7/hmLb5AQBDvecYNasCm+T/0NdhcOHBcr3xS97jiFdAgaQ5E78zGbYHXAvZjy7bL
 DRuuAg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g2gvch0u0-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Sat, 15 Aug 2026 13:59:32 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id
 af79cd13be357-92e63df032bso285750285a.0
 for <qemu-arm@nongnu.org>; Sat, 15 Aug 2026 06:59:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1786802370; x=1787407170; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=oxEhByDE68f3uMvm/IT1zYO75Qyc8mfPBNs6GENLEH0=;
 b=BgyxKBKKCpAXVHRNnE47ErvRz0HN4X77/Bw+HdB8CElqaPZuR7bTt0hoTIMgT2J1qn
 4IQQl8ge3kVnhnrx2uOyM3sz5Y1+Q6JND3BVslWm7nJBNtLUEZpJ+oo1a/PXTudyiT0y
 kuGe8ASbkNVG2DLYaGwhAeQkIyZ/yPVyn9OpQe2E1CyKy/dE0aQLGrVWPopnvwipkQwN
 +vkDC9G4CVO/WNItjchZMn5ltvaPz0/TRxw8VFR7S2fOrey59DSRYxb0VdVJrjAOP5LR
 C++Kj0GHJodgTlWVX+sDkxQcvNIW2D1kAR+iEPojXx1Rz9b60pQoxtFaLeLk2jk4ujZc
 74pQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1786802370; x=1787407170;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=oxEhByDE68f3uMvm/IT1zYO75Qyc8mfPBNs6GENLEH0=;
 b=syx7QsZQ4ADKHMKlQhUh0FL3c8nKrr6WLQ+nmgsrFNxR5N8sAbSxGKxTpsX6xMQMVQ
 CTdv+YpYNSipLFyXKEesqMHeF+hHtUZdDVKGf1OkLMOFaeMB4o8zL9dhjMxkejYz+6+B
 SDFEyn0wE7bkK8SGUVU8tArJx5IKNm7Pv3hpH9VaUEHBIx5GAvyg8U4iBwAeQZlnrL5t
 7PhjlxxpBnNTnFVCiz8wyAOuHJWNtzqCzUIaUN+0nLpAa+ewvQ7KAD4Wqai9PAmNRHs9
 aajXNVBsJEuGA+gbJGXdU9cA2RjA9UILfF4Fefhj6rl3sLRxr4ghAv8dxG9eHk6wVn9s
 4+3A==
X-Forwarded-Encrypted: i=1;
 AHgh+RqiieRjGHcQgLrdHJx/ZLeD7XeMa0gXFho6MV56SlBW2EV52RqlHZ/6ljz2XkQDlwgHWA/0kOQOuw==@nongnu.org
X-Gm-Message-State: AOJu0Yz78V9+ZirzYs0w2+wDQmy9QFd6TloEXD+H0bHgEPJ3bPH8ak5B
 QJRZxl/87tMKESFNG40oWJiXDZ991nMcMQ6Gfc1nsBHUgK+epil9OpSf2d3QkEcPNe3r8BmX5S8
 4JqCsfrLDOgVe12l5EWI7C/odzq6vL4/Ik5FCwRFRv8dxBiUihK+qxSM=
X-Gm-Gg: AR+sD12gl7LkSkdoY8zD/ru77qwW63qCo/oYpaY8sjnCVX6d0JKHXuuD57U3N3OvdVy
 8Yq8jbWIDGWVAYJGnwpeO7ajxAXbFS+RvPwbi8qY6HA6tJ7KsKJtwtyhOE7FFHlmxe9XCBSP/w2
 DCQgDjpv87YvfyhIDi2fzqXXHY3sYgNaLt86k+wu9ScBU6XosGQ8CK1Ec4xXxDnn5yhmDezN9fP
 sHdm6RgrS5LpdEv9IVrik3/14IuHYykOAFHr1EqJge6r7KCjCWTzRbaCbiwEf9KT1oRD7DjCxVH
 Os2aYUPy+o9FGenpuJKm0H4DPZ/3QrtDTw58Jfr3C6TI5wbYO3f7lSJ/tK8eLCgVrUpqJN1pTAU
 W6xqcG44Wmwesx7hJgOPz/rDBfZHitsTnskk=
X-Received: by 2002:a05:620a:4442:b0:936:a8a0:cdf0 with SMTP id
 af79cd13be357-936c07231e8mr2029782585a.15.1786802370535; 
 Sat, 15 Aug 2026 06:59:30 -0700 (PDT)
X-Received: by 2002:a05:620a:4442:b0:936:a8a0:cdf0 with SMTP id
 af79cd13be357-936c07231e8mr2029777285a.15.1786802370055; 
 Sat, 15 Aug 2026 06:59:30 -0700 (PDT)
Received: from [192.168.69.229] (pmd666.hd.free.fr. [88.187.86.199])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4815f2b1fc2sm17208328f8f.20.2026.08.15.06.59.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 15 Aug 2026 06:59:29 -0700 (PDT)
Message-ID: <b8ea980a-dff4-44ef-83ee-6cc1402a313a@oss.qualcomm.com>
Date: Sat, 15 Aug 2026 15:59:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for-11.2 v3 00/15] qdev: Clarify and enforce the device
 realization lifecycle
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
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
In-Reply-To: <20260721-qdev-v3-0-d2e226fa002e@rsg.ci.i.u-tokyo.ac.jp>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE1MDEwMSBTYWx0ZWRfXxoyNpNTuqDdg
 3DF2dxhvg11DGNr9fhdpGe0XAWpH4KSLkEYcKHhQJ85lT5HVGJr1XVMk27USuoK/5v8YXZ0Sd5f
 Y0sqbjS9xW4NAtTa2seVqQQbAmsYjfk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE1MDEwMSBTYWx0ZWRfXz2c81JxosgxL
 tcOInXzFiuxP6OcNu8uajjM/YzYvWquGES7WM9jDJFj3/R16iWeTBdOf/gyFmYlVApR0yaDO9Q8
 96PnEBc+oYbSdpk1VPlmuXg45NQ0GdU4p+oAswCbmdCETUsYkCFRQ6dXslCEGSeWDXjGALPPvub
 /9vb7nJYAuFlruWlt9RabvjVBM+vdYtqv7iYRAT3L/apjcZ0SWS39Oh0WEgosFJxciEqSA7nTGD
 gaQjfziDztFT+DK51GdIAWscUMbIqFfXKlttvjGYyR5AAOoMHahqBmkw03S/p2CNxgMw4QhPRTW
 nU/MGEK2StvgfdGKXBFqe5XifmDPkAbAugUfQFt2Lu939jr9yDlIx9XQ2epsysHzD5QIF4MxiSy
 lq076adYOvGWfRa+4aZ1wEema7MJeWLJqnW2kcp3MlGO9r+y8V9wqNFHTiBpEKZ0HBvP45JxJBD
 XBuRkuooVPEoJu2yAhQ==
X-Authority-Analysis: v=2.4 cv=UfhhjqSN c=1 sm=1 tr=0 ts=6a8070c4 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=N8Ew14HRFJzZzxbwEQcA:9 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: jWlNX_WB_E7FvHtD9n7PmaSlGemSXhOi
X-Proofpoint-GUID: jWlNX_WB_E7FvHtD9n7PmaSlGemSXhOi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-15_04,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 malwarescore=0 lowpriorityscore=0 clxscore=1015
 priorityscore=1501 adultscore=0 phishscore=0 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608150101
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

> ---
> Akihiko Odaki (15):
>        qdev: Clarify instantiation and realization
>        qdev: Make qdev_is_realized() take a const DeviceState *
>        hw/hyperv/balloon: Use qdev_is_realized()
>        hw/intc/apic: Use qdev_is_realized()
>        hw/mem/memory-device: Use qdev_is_realized()
>        hw/mem/pc-dimm: Use qdev_is_realized()
>        hw/nvram: Use qdev_is_realized()
>        hw/ppc/pnv_xscom: Use qdev_is_realized()
>        hw/vfio: Use qdev_is_realized()
>        hw/virtio/virtio-mem: Use qdev_is_realized()
>        hw/virtio/virtio-qmp: Use qdev_is_realized()
>        target/i386/cpu: Use qdev_is_realized()
>        target/s390x: Use qdev_is_realized()
>        hw/qdev: Parent device before setting parent bus

First 14 non-controvesial patches queued. Waiting for Igor or
Michael to comment on the last one.

>        hw/qdev: Prevent devices from being realized more than once

