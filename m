Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F099606A32C
	for <qemu-arm@archiver.kernel.org>; Fri,  6 Nov 2026 22:48:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ocZWK5yX;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=a3bo88O8
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xPSjL-0006K5-2F; Fri, 06 Nov 2026 17:48:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@oss.qualcomm.com>)
 id 1xPSb6-0005d7-R8
 for qemu-arm@nongnu.org; Fri, 06 Nov 2026 17:39:48 -0500
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@oss.qualcomm.com>)
 id 1xPSb5-0003K1-3I
 for qemu-arm@nongnu.org; Fri, 06 Nov 2026 17:39:48 -0500
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6A6JLQ4X620330
 for <qemu-arm@nongnu.org>; Fri, 6 Nov 2026 22:39:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 OrvMJ1xyvN2i/CjVxAUaiDjE8iaiPNk1P8XsM9KAwTA=; b=ocZWK5yX9XsAYPDh
 gYKsM33qlPhs5UrdBtkd+/EvB5pR4TKT3dccKBx2JslVQYBj4LQJHreKau9wh2+s
 Xk91yKrikIkfz7RloizO0gaodXK/S75HAiP7XvCKIkoRU2Y4IXMXwWtgKAGlQhN3
 1wPgtzN8UJcxBsGMUU3yzH4kB098UY5JfLGP/QGLud2GdsmFeYXGtYJTa7K1g0Yh
 8ljWTyF/krXdxlEiWsquWIol/Xaz46PjfFsd3Dqf3yOChdx+YaX3R5LObxkLc805
 9aOXM1x2wtB7Tx32FEn9fOyhS431me+iXk+Olp7RxA1lH9Jx2mYRKf5VZ2RAgPqs
 /UE3hQ==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com
 [74.125.82.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hsmyv0myh-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Fri, 06 Nov 2026 22:39:43 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id
 5a478bee46e88-30c0d568830so2322695eec.1
 for <qemu-arm@nongnu.org>; Fri, 06 Nov 2026 14:39:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1794004783; x=1794609583; darn=nongnu.org;
 h=content-transfer-encoding:content-type:mime-version:organization
 :references:in-reply-to:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to:content-type;
 bh=OrvMJ1xyvN2i/CjVxAUaiDjE8iaiPNk1P8XsM9KAwTA=;
 b=a3bo88O8uMeLibs5oYNdlDQNF+6grxvqHadndl56/Hr3lbUVMSHeORHte6C+Luh04E
 tF1iT3pMaGpYu765qNeMMgmvUUKdvyajn1waNG7YpLz9c+oOR4yng8AlumfgiA6gsOlu
 mGNZB1pwWnzRdeuf1e2ZqgoaorSzLN3Gj+pZY8PecLe5Hhe++T4NAG/tG+DnGa/sWaWG
 h2/WciAPejkrVpRrm32jI4H4+7HwkwPf5yZ+ewy7/u6IxKpcnbE1w81vqlu3xwGx6jxE
 u8u+rIf5ijip+Hty67oYHPam3peZnAXr+slHvdEqDqYbSL+HDDNHjZGN6GuvH5Km72b5
 RmvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1794004783; x=1794609583;
 h=content-transfer-encoding:content-type:mime-version:organization
 :references:in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=OrvMJ1xyvN2i/CjVxAUaiDjE8iaiPNk1P8XsM9KAwTA=;
 b=vvsNr4U4VY3QYCcLAZsNLYSXL6x1e1zaO5sRHDpMrs6zeYz0mac2Yhcq0Qrel1gUuB
 X8SSlA7y+BpQdLr8WNeQBbO6oNzhFnvVTv5f6sK1K52aX4yKluFuevX/Ih+kZdcoVOGn
 fNDCJGeErErGbt8zFueBV2cjR9PJeioBbJOyHwKa0JeZNiZX1AWlfgEcjrHCnVQESU8N
 G2K8tGQP0NSUWHD1w58oUY1SbI5vUKR+rG68H9vsZSypTwA1O8scJaVapbSpz1GgBtcz
 of3Db1GoXdInC1jyg6H64Kh3E9w9Hdi5BqomKJEM6Cu4L8ACbXuiaJLF7DbKdrJdM5UA
 sp0w==
X-Forwarded-Encrypted: i=1;
 AL+hErG3ed5JNT3UerpLUMVVtYgRKzm3ISzz0qvRg5O2bWuyK4egxVy88KL2WHbjMDmBp5qPMqbiwjEfcg==@nongnu.org
X-Gm-Message-State: APuU4Z9jHaoTiHW02zjmTcW+sfseiB2uwnOSPZpP6CJ+EckbHXLsEeNp
 Whg9n+lhZsO7MKDUmstBN28R9EdoS4pWyH/vXfIHVdUeGmb1NLssJbyTBjpIBn684XqqL0VXvQX
 9dr43E4M0xzBI23D1ODanM3r5WWjPdLjoC+ZgLn2ow5LXh3JpWgarJmc=
X-Gm-Gg: AYBFou0PeD4K3mH4eZAXTDPvIIPYX1/uFT6AUFDPGKOQf6rJqAW+apws/m4pFk/2hvo
 e/eC9qqKaaST61doWMXvcd71/TE+9SBAPxTnN+39SIcPnA5HM1NPdDXIDpGWUWvG5h7WV0nYYWy
 DkEr0w/0hniP0SgKpcwc+zeCQpLwk76QA+F84XFfCoovlITWnk7Q3DtOoznDPIKFtDBAIyKLqKV
 cWrvR0sxLgbLFq65bngEpDKxMRrSK4PeHkQQXG+XyK+CETRXRjaZavN5NU7S4TQ3OaTFH5ruUPH
 MvpKSRsR2PdPtk4CIwn7c5jkMiN2OTdobo2vfzGYnUGjRw1tJ5HqPxajoeMebV5278j87gJoqBd
 aCR3YJzEKjaFOC+qYUpXWcIXgTK0xZPcTaD1QpfEMNXmOrKgiL1rr7xV3G/KWCK7syNY6YxR6mv
 tl5kluw+gkUMbnEyUpJPIXJQFXI7Q=
X-Received: by 2002:a05:7300:f3c8:b0:36a:1fa2:fbbe with SMTP id
 5a478bee46e88-36f76918e5emr5028707eec.41.1794004782481; 
 Fri, 06 Nov 2026 14:39:42 -0800 (PST)
X-Received: by 2002:a05:7300:f3c8:b0:36a:1fa2:fbbe with SMTP id
 5a478bee46e88-36f76918e5emr5028649eec.41.1794004781446; 
 Fri, 06 Nov 2026 14:39:41 -0800 (PST)
Received: from localhost (i-global254.qualcomm.com. [199.106.103.254])
 by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-36fa651e6b1sm21274432eec.3.2026.11.06.14.39.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Nov 2026 14:39:41 -0800 (PST)
Date: Fri, 6 Nov 2026 14:39:37 -0800
From: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
To: Jinjie Ruan <2118537295@qq.com>
Cc: anisinha@redhat.com, armbru@redhat.com, eblake@redhat.com,
 imammedo@redhat.com, michael.roth@amd.com, mst@redhat.com,
 pbonzini@redhat.com, peter.maydell@linaro.org, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, ruanjinjie@huawei.com
Subject: Re: [PATCH 37/37] hw/arm/mpam: Implement query-mpam-cache
Message-ID: <20261106143937.00000cca@oss.qualcomm.com>
In-Reply-To: <tencent_B7E4F1EE8A5BDAD20424E2F8AD9AD4E54C06@qq.com>
References: <20261016101058.1900808-1-2118537295@qq.com>
 <tencent_B7E4F1EE8A5BDAD20424E2F8AD9AD4E54C06@qq.com>
Organization: Qualcomm
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.51; x86_64-w64-mingw32)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: IRrtOpw_LbKLvirT8EZVnHLC9iYjOW6R
X-Authority-Analysis: v=2.4 cv=IdYSymqa c=1 sm=1 tr=0 ts=6aee572f cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=dZbOZ2KzAAAA:8 a=i0EeH86SAAAA:8 a=D7E5GI0eq5GKvOykQcwA:9 a=CjuIK1q_8ugA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA2MDA5MCBTYWx0ZWRfX0mb0ETiNcDQ5
 uPPqwNiO1WoiNkaHDz4umDGm8LsV1YsaFqKDL64jw3XGdJw1Zhej2g9/ijyU1DPKtkPCeT3xKlI
 JNUJOUkgo7zFc99w3UGaBJspnGi5FSk=
X-Proofpoint-GUID: IRrtOpw_LbKLvirT8EZVnHLC9iYjOW6R
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA2MDA5MCBTYWx0ZWRfXwlL/9rr0Smx1
 Zv6HsVzsFnNoujEHYggnlzQsAltfJvcyoVzhRKaWRGrXCEqYc1lpLzIJ+ZGdMbYzCX6wd6w/4ng
 DsDTHT93WKFpUQyr5+Xdbxn9u5VsXFqVIvXeZ4aTkx13zKOEHZOgDYFFLwa7eL33/MYDUoajKQU
 wJ5yg3BNhOA0U4fk9ubBCpH6ojNYi18H0lvQb25tHN9jqD5r74EfOFcdSfmwFn895GxvqkipSx1
 fS6D+hzNmfoL2QMprakM3JrZKxtsy4aymYBcnu2BlWynFJF6sSmOBiJ2AD8vujmpNfQuptWH2fj
 j59O74kvGP27GUHngAYh9ZDyStCuMEhnb+dP7UXPc6vw6oZgYB0I814GPv7cgO51L7AEklbyTKS
 GakR9G+n8KA/3lw+r0X24FYoIoyyUayxgPwUdIWMIyUP7rthZXQq1phw4Q2kpkvxOIuuZXSaD2+
 f6Z7R8/pc1FJCtpoD8A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-06_06,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 phishscore=0 clxscore=1011 adultscore=0
 lowpriorityscore=0 priorityscore=1501 malwarescore=0 suspectscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611060090
Received-SPF: pass client-ip=205.220.168.131;
 envelope-from=jonathan.cameron@oss.qualcomm.com;
 helo=mx0a-0031df01.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Fri, 06 Nov 2026 17:48:16 -0500
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,USER_AGENT_SANE_2 autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Fri, 16 Oct 2026 18:10:57 +0800
Jinjie Ruan <2118537295@qq.com> wrote:

> From: Jonathan Cameron <Jonathan.Cameron@huawei.com>
> 
> Implement the query-mpam-cache QMP command: walk the QOM tree for
> mpam-msc-cache devices and report each via mpam_cache_fill_info()
> (with the per-RIS register state and the configured CPBM bitmaps),
> building on the generated header now included from the device
> contract header.
> 
> Based on an RFC series by Jonathan Cameron, adapted to the current
> qapi documentation rules.
> 
> Signed-off-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
> Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
> ---
>  hw/arm/meson.build    |  5 ++--
>  hw/arm/mpam-qapi.c    | 62 ++++++++++++++++++++++++++++++++++++++++
>  hw/arm/mpam.c         | 66 +++++++++++++++++++++++++++++++++++++++++++
>  include/hw/arm/mpam.h |  3 ++
>  4 files changed, 134 insertions(+), 2 deletions(-)
>  create mode 100644 hw/arm/mpam-qapi.c
> 
> diff --git a/hw/arm/meson.build b/hw/arm/meson.build
> index adf9146..da73546 100644
> --- a/hw/arm/meson.build
> +++ b/hw/arm/meson.build
> @@ -106,8 +106,9 @@ arm_common_ss.add(when: 'CONFIG_NETDUINO2', if_true: files('netduino2.c'))
>  arm_common_ss.add(when: 'CONFIG_RASPI', if_true: files('bcm2835_peripherals.c'))
>  arm_common_ss.add(when: 'CONFIG_RASPI', if_true: files('bcm2838_peripherals.c'))
>  arm_common_ss.add(when: 'CONFIG_STRONGARM', if_true: files('strongarm.c'))
> -arm_common_ss.add(when: 'CONFIG_MPAM', if_true: files('mpam.c'))
> -arm_common_ss.add(files('mpam-qapi-stubs.c'))
> +arm_common_ss.add(when: 'CONFIG_MPAM', if_true: files('mpam.c', 'mpam-qapi.c'))
> +arm_common_ss.add(when: 'CONFIG_MPAM', if_false: files('mpam-qapi-stubs.c'))
> +arm_common_ss.add(when: 'CONFIG_ALL', if_true: files('mpam-qapi-stubs.c'))
This doesn't build with non arm targets. Needs an update to something like
drop the last two lines and replace with

stub_ss.add(files('mpam-qapi-stubs.c'))

Also I'd squash the previous path and this one to keep the build files simple.




>  arm_common_ss.add(when: 'CONFIG_SX1', if_true: files('omap_sx1.c'))
>  arm_common_ss.add(when: 'CONFIG_VERSATILE', if_true: files('versatilepb.c'))
>  arm_common_ss.add(when: 'CONFIG_VEXPRESS', if_true: files('vexpress.c'))

