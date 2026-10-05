Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78C3FCA5FF0
	for <qemu-arm@archiver.kernel.org>; Mon,  5 Oct 2026 13:26:58 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xDiiK-0007gN-MF; Mon, 05 Oct 2026 09:26:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1xDiiD-0007eW-LK
 for qemu-arm@nongnu.org; Mon, 05 Oct 2026 09:26:37 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1xDiiA-0004sT-Cn
 for qemu-arm@nongnu.org; Mon, 05 Oct 2026 09:26:36 -0400
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 695CFbNf472550
 for <qemu-arm@nongnu.org>; Mon, 5 Oct 2026 13:26:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 UVgGfElQqq72YJB4eDFJMKlG7GcShx6WHC77Em6o9hY=; b=ZC1fHKHV/qsoDmPj
 FDfEtTM1kmRRdSaeBGnLzA4meN1RJ8E2t9PCpmuXWrsF0YZ8A8XK0Pb3cIegUwc8
 OIUPAs6axekii+F2WtJvHLCihGAbNUuLvzsXQ4vTJhgKA1NfGuIfkF25mZRF/PcW
 wmyTMqR4bxOe1lNa1FA1DaDeHLw2ad2EMSxZjfrF9QI8mBWttvQPxICfcJ/MDI8c
 fJj0o5IemJXEcP+R84/ouKMskWPiIdJmOLuR8bCYs/5SAjR9F+CvElb5JNZ4Koqw
 4ho2FY/s8yFn2TE6go/hlxpZsyOK6GuzlQnexSTC+GO+8marjcIkhl28Tnuu9Aqx
 oNrVOg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h2tvewya6-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Mon, 05 Oct 2026 13:26:32 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id
 af79cd13be357-93bfb2da664so382559985a.1
 for <qemu-arm@nongnu.org>; Mon, 05 Oct 2026 06:26:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1791206791; x=1791811591; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=UVgGfElQqq72YJB4eDFJMKlG7GcShx6WHC77Em6o9hY=;
 b=evdjC5n+epri7Qz3QttFuJpqeNTMwWaU+vjuxGGd00kUD8R3gn9nQszQKPju4Nm3il
 XAPMYvSdVd209+AboxGQWtMkkwNXa+jdamwCXi4DwV17ZFeP/DBiK+r2oNXjwr+PyO9p
 YOKmV1QdA4/Pdb6yuMYImy65SkmNggQyjzLAzJ/RuLsIrNjzzui8FHzkjw9dwl2gyaYH
 XF+ymrZHGACmwtY1iZ8JrnRdJJTimZ4rtcOiQFcES4rsXg/CVBfWmAPrzzGNTq4fuNHX
 n5BgxQk4a+IfjVBOVbDmgH3O9Rf2VoeosYa1CV+bhIPu4PVATvCG3hKmgZs3UeZZwOGt
 GPyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791206791; x=1791811591;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=UVgGfElQqq72YJB4eDFJMKlG7GcShx6WHC77Em6o9hY=;
 b=PUkGzFBO5ZLDh1aWYn9e2Ad0pVtYjQu25PCMJTk9ghjjsG7d4+ixjIY82bkN6yb2W5
 XwvlmyrFpidwJHHq6HmaNutSMS1uIU4WJ5khqMpbNmUk1audGD4n1S8kIa9OcCOj1n03
 8dqKR7am6PIvYu5EeWPledunNIxntLilU6PmmBtq8wSNyIGWoFue2W3g9dcaTEZhHAKC
 E7pxDdyJGjx5FO4PddGHfiSzCtzWwzTWMyMUaKJUNGL0IU38DhylVpF3qrfnZ0o0ncsk
 LqfbW6+QavYHcG3xP2Y3m8uuzAmpGApSBmB9iBlqXd5Zj/QI/sLMOnOFu9mbRXksHCm3
 2XJA==
X-Forwarded-Encrypted: i=1;
 AKwUvBwWq7q/DG27mvTl5rLOppgzWqb8xglPc173FznDlmVCnzIQbo88qDohKlTFmf/KBaYlfqnPWggEug==@nongnu.org
X-Gm-Message-State: AFuF++lqJhd1gVO1tZ2jssT1+t5UGMFFf7uUoRjX3R1hvcAXKJedZ1Kx
 NYPRt4LgGcYhVhPoaZw8DOTOB25luAmO0iq637BIsDdGz2/1o+qpTrTtP0WLP9fhxJshCPwHQMn
 rRWpfbKQMAsZUDpDQAnwdS1qVmGDiNK+mIgJjWczVNs+TxuGqor5MFVo=
X-Gm-Gg: AYBFou1tjoyjHB2/Iv7YUNaYqzNS/2YblZe3tUA6Bba01WE3SPnPW3PhQ1rd6jmtTPO
 c32sdK43Wq3qPZA3o5S/MzNRGIp0EVJzuiv9F51b1Q851QHRBW0rj4CmJ8GEtTf5VA6Qmuu5TgF
 0dByS/jZYv+3TlPLh8pepc8Ky0vrXofAG6jst+cCFVBwbE+HoNzOP1qpdthmFubawKWtj1h/Kv/
 w+eLdFDrlrN/AGig/plgfaTIOJ9A8DoaaRa+Q2ACSqNHc5dFVH51JSTAl356QdiXzWYSDjXlcZz
 2amGKaFYUfx8B8XyetNikmqHoqy0wNVvRXEOr7ulaQg7P4bcewks6WXUsv3d+AynaYnTwhAS4h/
 RFR5F1kWCy49ac6HkdvdP6Kn+1TTxxEAPbQ==
X-Received: by 2002:a05:620a:90ca:10b0:937:d6e8:59b0 with SMTP id
 af79cd13be357-93ce7c145d0mr1342532785a.10.1791206791279; 
 Mon, 05 Oct 2026 06:26:31 -0700 (PDT)
X-Received: by 2002:a05:620a:90ca:10b0:937:d6e8:59b0 with SMTP id
 af79cd13be357-93ce7c145d0mr1342528885a.10.1791206790784; 
 Mon, 05 Oct 2026 06:26:30 -0700 (PDT)
Received: from [192.168.69.225] (pmd666.hd.free.fr. [88.187.86.199])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48c62270751sm3609856f8f.13.2026.10.05.06.26.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 05 Oct 2026 06:26:30 -0700 (PDT)
Message-ID: <67742103-9b40-4c02-b297-e5d46d80482b@oss.qualcomm.com>
Date: Mon, 5 Oct 2026 15:26:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 02/28] accel: mark kvm and xen accelerators as secure
Content-Language: en-US
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 qemu-devel@nongnu.org
Cc: xen-devel@lists.xenproject.org, qemu-riscv@nongnu.org, qemu-ppc@nongnu.org,
 qemu-block@nongnu.org, qemu-s390x@nongnu.org, qemu-arm@nongnu.org
References: <20260911143627.2743803-1-berrange@redhat.com>
 <20260911143627.2743803-3-berrange@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
In-Reply-To: <20260911143627.2743803-3-berrange@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: tgML8YpKF3zVm-z2UUukYRh1iEz-IDQc
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA1MDA1MiBTYWx0ZWRfX5yLs8UaBGPlQ
 G+kMgO/EfCfws0HE3G92U5TayswqhLOQze26+Bdr74P3Wf/KaSn6fPAaS2m7q+fdRJ8tPndHctO
 74e3jVuU4shxP+wNETHGrqNUEOR0Y/8=
X-Authority-Analysis: v=2.4 cv=YoGa1IYX c=1 sm=1 tr=0 ts=6ac3a588 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=20KFwNOVAAAA:8 a=ft2qPWJe3-GeceLKO5gA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=ZXulRonScM0A:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA1MDA1MiBTYWx0ZWRfXyJ0A1jLQ2Jy5
 dR3pvPw+0PruRR/UrHczyfnhvhA9nH25N/gtLJD9J0NiacmH7I5u/k9pftvAAa4u+LUaEe/MPwJ
 a4BAoWOW4vlniGYJCOMvzRnMUaJKxC+kAKVB2+/YP3C+c6oOhU2ZYb00EAHn2jqMrKqBg/2PYec
 j7yBBDBj0cgp6zLd6c9G8Bhnx77DH5si18fdLwcquK4OGPMlMfjYgy7XpUHNkBwlOMqtgNNDatp
 eKVJcWqAFT8lUALo/Rf/JQqiski++4xwMqzzJ2uovRT/2VcsgBOJrgHGQkwzdkehA3zLZM7qwdf
 wdBMk0KpSGVR3B7th7Fc+pC5XvvKCj8r/v5gQmzwomBNBWkbWMDSyPp8wKZkEIpc4B0HEGEfG+4
 LDTqwtSiULOjH4vu6c51cUbmzj/5sJvyvpwnpVU9W1/mUaDPPIQnEwloV/6DgrHxIWVyKsN33Pd
 GOUVQe+qZOdCZhagQOg==
X-Proofpoint-GUID: tgML8YpKF3zVm-z2UUukYRh1iEz-IDQc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-05_03,2026-10-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0
 phishscore=0 suspectscore=0 clxscore=1015 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610050052
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

On 11/9/26 16:36, Daniel P. BerrangÃ© wrote:
> TCG is too complex to be considered to provide a security boundary
> for malicious guest workloads. QTest is only used for functional
> testing and thus is not relevant to mark secure.
> 
> KVM and Xen are servicing virtualization use cases which must
> provide security and actively maintained.
> 
> While HVF would be in scope conceptually, it is not sufficiently
> mature or maintained to claim a security boundary at this time.
> 
> Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
> ---
>   accel/accel-common.c      | 2 ++
>   accel/accel-system.c      | 1 +
>   accel/kvm/kvm-accel-ops.c | 1 +
>   accel/kvm/kvm-all.c       | 1 +

Maybe split so maintainers can Ack separately?

>   accel/xen/xen-all.c       | 2 ++
>   5 files changed, 7 insertions(+)

I think accel/nitro/ is also meant to be secure (in patch 6
you mark hw/virtio/virtio-nsm.c as secure).

