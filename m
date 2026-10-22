Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25FF0606A31E
	for <qemu-arm@archiver.kernel.org>; Thu, 22 Oct 2026 21:52:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=R6ncszs5;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=WT0MZKeS
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xK0hO-0005Un-ER; Thu, 22 Oct 2026 17:51:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@oss.qualcomm.com>)
 id 1xK0hK-0005Tt-8m
 for qemu-arm@nongnu.org; Thu, 22 Oct 2026 17:51:42 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@oss.qualcomm.com>)
 id 1xK0hI-0007RI-Om
 for qemu-arm@nongnu.org; Thu, 22 Oct 2026 17:51:42 -0400
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 69MJs20c1189912
 for <qemu-arm@nongnu.org>; Thu, 22 Oct 2026 21:51:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 uId3daMCrFOAvnbHidfTnmDlul9HOu80TSKOeSxnRck=; b=R6ncszs5fXGrfTVZ
 IqJV2aFKvpfz+dBMqkWqNpq1zyDIX4c/gc6gvGkPWUiyFyGkElDDIAIZLCVwmv8j
 xKry7IV3Wrb4mWb8lP7Rv+3WL0fsklYT/UrWCbPbc06Rj0ojGrzi8qidEagzeXxn
 pfb/qb858PWSzHDDQAKPFPT7UFlju/WnP0y7tqOBcmVFn1DTPckbjE+CAPFvcnGZ
 NwKkDI5p41H4BG/tVfZ/k522DWKjvAA93otdRgN3d8q1bQ4db9sK+8SCoM1+RXi1
 FlGSqsC4V/qjrGgGraH3MxLPyde+qgYU/U2TPB/z0cJWf3fgvyzZr1ZR+2j+zkIH
 FOP7Xg==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com
 [74.125.82.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hfqmj8qkt-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Thu, 22 Oct 2026 21:51:38 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id
 5a478bee46e88-3662e7a9299so1099850eec.1
 for <qemu-arm@nongnu.org>; Thu, 22 Oct 2026 14:51:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1792705898; x=1793310698; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=uId3daMCrFOAvnbHidfTnmDlul9HOu80TSKOeSxnRck=;
 b=WT0MZKeSDd+NFFa6lKCt6ZpHQCwZabvPNNZt62NFhBEuOw1amenPeBbrYoEWdpsMUj
 0SoEO1A66N3poEzjWhVeuyrw7GpB7ds49YJUSgNlzgAbeP6onIXDztL9KSCN6DKNVyEq
 3sY5CaKznu/vwuwbEfZuU2s9U0QY0Ked6v7Oo/78Urfqu8tTdDfeEiA5lqpIaZ14uz8z
 8Ug+cb6SeyD0hCPUlq4fGSFoe/W+CyXROtTsnUZnbv0FP9JXxlvRWMGso4sqcAfkFQxk
 FDOuwpRJe1rJVvqWdS5jt2jVC4GzRcUpsThOntKbzqQT4pVkNYG5zK12Q7qhOnGBJRjX
 axDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792705898; x=1793310698;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=uId3daMCrFOAvnbHidfTnmDlul9HOu80TSKOeSxnRck=;
 b=LfgqvlWTRWC77TDg2XqV14C6M9X4xkL2b/SxRNwNZtm0+vvLydvmjqAws8ISkDBzch
 RireLaeXXQK/Q7HJSj6Twt9d1g3ClytoVOsMFFZgRQdmdNHlofINsxi6G+l6qyW9JzyU
 3MQ1UWFLeYd+f0Oa0GIlG2oFLQsT0cnKYpyEunWt8wQ56cyxmfAPkQC/DiCRMrR7grNx
 NOLBaP62t6YYkeyhAgG2QBPtvhfWPgAPgsRbX2BbYviVx4C7/lRi+EBpo9Pla+WE3q5f
 QWkolho30Ru1c7t4UKMSGIRYqcE9U/WR/wDGEKJ2P9obeImbWriiWoK2gf4g+Od71yAj
 lOlA==
X-Forwarded-Encrypted: i=1;
 AKwUvBzDelhoGp5H6cL7m2x6l4LlhOFHP4xS9RhNERruPQXZ1LpatNJwSfOkJmw4FH0apLl91NdL+CM0Ow==@nongnu.org
X-Gm-Message-State: AFq9FYKFlVEtXb1Gz2GQIwQR6PIcT6zG8P4u6qlwLd1Bd3sxsXCQanfy
 k01VuzYVEhzzcvsGRTDyyxRBQls3btdYy88NVnfh6Mf34WHn/AfCVa152C6mRYgyh++cXd4E5AO
 OJ0yPo6TOu7ppABY9+S8rmCE839K97+E6bZb2rlDi7/JWYP7ZwRO+gqI=
X-Gm-Gg: AYBFou3yBpc1bCDEofOHWv+GypdiScwLVYCAc0MDma1dkf3cqprHXzqfEynKB/AJABc
 byHdC5u3mWlLczBMrUIpHvNZyYHw2aPLMJLhWvZQxTjxLGUNOyOKmj4BkkLYrGvSFXSlA2QZo2P
 DfKEDHRjoC09cbu4ItadDqPRWaXRMjxJrjLwyMTXZPXAFzOaM9F51AX4iAZr82SLA5XCs4ExByw
 FhfPJFAuH+V4XifKsqWjCL7+x4wYt0Nv0C97pRJY/OX0inn5ORiYcYoDde1pCzGszLTUx//GEAN
 oOdklTMsRKb7lTyvWrMww+Ig1Yy4BQcIsqx/pHzmognUaIubkjA5WxuMZ0ojvQylh6QcgrXwmMI
 t1EoCkyKKc0nNZjq8noYFnVVfm5PaDfnudgKzD9fYKdIkDN2i0fTsh+E0/5t7vX4Nd8abog==
X-Received: by 2002:a05:7301:4549:b0:368:78c9:159b with SMTP id
 5a478bee46e88-369d980b970mr500620eec.27.1792705897757; 
 Thu, 22 Oct 2026 14:51:37 -0700 (PDT)
X-Received: by 2002:a05:7301:4549:b0:368:78c9:159b with SMTP id
 5a478bee46e88-369d980b970mr500596eec.27.1792705897286; 
 Thu, 22 Oct 2026 14:51:37 -0700 (PDT)
Received: from [192.168.1.199] (192-80-163-190.dyn.novuscom.net.
 [192.80.163.190]) by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-369d9db7970sm724640eec.19.2026.10.22.14.51.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 22 Oct 2026 14:51:36 -0700 (PDT)
Message-ID: <b043527a-bdfe-4e10-ba85-494f77508740@oss.qualcomm.com>
Date: Thu, 22 Oct 2026 14:51:34 -0700
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 12/18] MAINTAINERS: cover m68k GDB XML files
To: =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>,
 qemu-devel@nongnu.org
Cc: "Dr. David Alan Gilbert" <dave@treblig.org>,
 =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>,
 Zhao Liu <zhao1.liu@intel.com>, Peter Maydell <peter.maydell@linaro.org>,
 Chinmay Rath <rathc@linux.ibm.com>, Nicholas Piggin <npiggin@gmail.com>,
 Glenn Miles <milesg@linux.ibm.com>,
 Harsh Prateek Bora <harshpb@linux.ibm.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, Weiwei Li
 <liwei1518@gmail.com>,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Chao Liu <chao.liu@processmission.com>,
 Max Filippov <jcmvbkbc@gmail.com>, qemu-arm@nongnu.org,
 qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, Laurent Vivier <laurent@vivier.eu>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Artyom Tarasenko <atar4qemu@gmail.com>, Helge Deller <deller@gmx.de>,
 Warner Losh <imp@bsdimp.com>, Kyle Evans <kevans@freebsd.org>
References: <20261022-query-reg-v3-0-7ad902b9a7cf@redhat.com>
 <20261022-query-reg-v3-12-7ad902b9a7cf@redhat.com>
From: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20261022-query-reg-v3-12-7ad902b9a7cf@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: SYhaUK2--SUPf2ID26HR9uOVT-KnyzJd
X-Authority-Analysis: v=2.4 cv=cPR1IVeN c=1 sm=1 tr=0 ts=6ada856a cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=9852oil1ID9t5xBSyQ/BEA==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=20KFwNOVAAAA:8 a=EUspDBNiAAAA:8 a=WhzuZZbzbfkQEceezbMA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIyMDA4NyBTYWx0ZWRfXwPhT7cKZbs3E
 dgIS32ntKmqsWw6FEbz0HCoe+6a1OUvBsNPpY+t/FBZCXfw5i9jE7I0H3EiUjNGYmbSUT5rvd0c
 wA9jGI2GeDr05TkGnk141li5iVetCEM=
X-Proofpoint-ORIG-GUID: SYhaUK2--SUPf2ID26HR9uOVT-KnyzJd
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIyMDA4NyBTYWx0ZWRfX9VrwI+TVv72H
 O3ozfTK+2cSYFcxFG0MHj2LPt1NPj89B9dFb/78NWX5Cqx/jMvsVb3FR+X5vl1zisHZofH1ANqZ
 kbqnvCYRWDY4li12Du819RLdc7M7g/JBZj5XA8Yf3V3bVw6ZMfkmEr5ig8IhnfKnbgYtP1LpYfn
 ZTdlqU7pcUNI4979pDTLJkM9j82uKz42AHJTUbQEJQSpotq7g58Q60ntuDNpdnnoNeKz+WasKcT
 pzJHxOp2Rz9RJCFxnyDkMiR5pSKU5TTbAytnDPZgV7a4x98lLr8NLLOV0G0nF1x3GlBIjJz6e/D
 hnLhZMTCCMdJuziM/DKKcTmbuxyUL77vgilB2UqCVFTCsHBT3yIwJlzLIul7OofpgKMYL2rwRkb
 L23UaeGg7kVHHl6x/7NA177dyYnTSLnY4lyFMLLIhzlzBRWn6bwlVk1EzUbgrKpTeKJcq9hf3O9
 r32wj3Gnx1j19SauJeQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-22_06,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 lowpriorityscore=0 bulkscore=0 spamscore=0 suspectscore=0
 impostorscore=0 priorityscore=1501 malwarescore=0 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610220087
Received-SPF: pass client-ip=205.220.180.131;
 envelope-from=pierrick.bouvier@oss.qualcomm.com;
 helo=mx0b-0031df01.pphosted.com
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
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 10/22/2026 3:56 AM, Marc-André Lureau wrote:
> Add entries so changes to these files are routed to the m68k
> maintainers.
> 
> Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
> ---
>  MAINTAINERS | 2 ++
>  1 file changed, 2 insertions(+)
> 

Reviewed-by: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>

