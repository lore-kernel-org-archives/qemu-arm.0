Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 218BAC9833E
	for <qemu-arm@archiver.kernel.org>; Mon, 28 Sep 2026 10:02:02 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xB8BA-0004aT-K2; Mon, 28 Sep 2026 06:01:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1xB8B9-0004Zx-2L
 for qemu-arm@nongnu.org; Mon, 28 Sep 2026 06:01:47 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1xB8B7-0000dX-MY
 for qemu-arm@nongnu.org; Mon, 28 Sep 2026 06:01:46 -0400
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 68S9M3N61212385
 for <qemu-arm@nongnu.org>; Mon, 28 Sep 2026 10:01:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 TTwVBtxb7McqT+5+Byo4PYnFhMV578s9mn98FJl3OYg=; b=JbfMW/VNQt8Ii1RV
 loIGbQ+mTmlqWTXFxi64EF4Odgvif3pou/Zr5/sMV6RLr3jPPqyIzvtDeT73lPQv
 g3bL6HLw4YearXnkLYTIpwRFZEul9v3GmJM20zZrSmsEaGTAxNqFyhxYMyIXZ83a
 hVMOhM3MI/DXERbZUtdHf7uqUnfwwHXxsvodIYk8Seofhq4WxP/EoeWg0foPNpJU
 +sz2cKY7BCLF75tUMSoXvkMjFxt3bluO2bQHBCeBdsmL05VdFnZyaRI2yqugZ8Ad
 Oj0p282EIy/+zHKAbhS/GC0wgLRPah44OvpDRKOg3lhk/acfvcq7T8m9JKDNiUJQ
 ncffSQ==
Received: from mail-ua1-f69.google.com (mail-ua1-f69.google.com
 [209.85.222.69])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gyjkxgvyy-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Mon, 28 Sep 2026 10:01:44 +0000 (GMT)
Received: by mail-ua1-f69.google.com with SMTP id
 a1e0cc1a2514c-97e9909eeeaso218160241.3
 for <qemu-arm@nongnu.org>; Mon, 28 Sep 2026 03:01:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1790589704; x=1791194504; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=TTwVBtxb7McqT+5+Byo4PYnFhMV578s9mn98FJl3OYg=;
 b=dZd8Ii6lHrMS+gxRfJ3OrY2ZX2tLrITCSZNDhaeSmoNA2WhwOLqGLHnAusJHvFslDP
 Sa74Rft6fseULuQu31RalRxq2o+oiorliY3mAWrpMov8/OjGtapOPZF4TvV+MLDkG0zd
 yxH+Y9bYFBx5RHhZyB57GXCDVJcdjCAmzl1E9Bt462B9nMheW+MmqENaGX2XZj1PHvF2
 ekrOdoQadnC8J1FPp17G71q89p5BdjnvB3Sflc6enjrV1vCLxvf7e89q6sr8N16/k0iN
 Ok+wszfcMEQRwshSrlS3YmxtczL7WS/sOiMvdsN+xiXghnp/9ddvUzCsFK7pivFocR2c
 Bkpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790589704; x=1791194504;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=TTwVBtxb7McqT+5+Byo4PYnFhMV578s9mn98FJl3OYg=;
 b=wao4QhL9s8nwtE6ktdesw8IDIQFgBJTo8b9L10GF5FaZf2/KrXTcyWgJtKbhKZwbX2
 gQRuXEkyJzQDX0DvJWWMboK0R5viudpQEKT4oaS4uJ+NKkq82DqVFxg19zisSk3NlXXv
 OlTbGHFqopRPDAuc70yov7kVTo4sasJVvyU4kqBr29A/iaEp6pUDGlRgV3VigZ8L6dgD
 g/t43PHqx3Uw7HwUgcfjGdzgExAlpVl9GAb6aEM4HoHfmvXwzO8mvwPQFPgfmOyJinea
 JG1EN/gM4PpLJhTmo+UvTNizhRnubjiwwIsC92+nG5rcX3KTyAKhyq723zfNVvbYoM5S
 ovHA==
X-Forwarded-Encrypted: i=1;
 AKwUvBxIKp2pf57dfMcG1CaKDeK8UodVMMIs716ZvIbviZ5pe76Yf2KhAIeX/7tpBhthtJ9Oj3taP55QnQ==@nongnu.org
X-Gm-Message-State: AFq9FYIjXNnp254ZO4TMOdJO9BOkir6lpCp+RelWwhhN5PWSCqerhSt7
 9S4iVe0YQIR0FZw6kFHUSeTB3KrembkczO3G4vgtYSZ7rlmSM7dE0N3pOeoMvQXB+epPHqiwQB0
 PgmxwnpeSMP3ss2L71Tq5wH1fhBWh+HIQwsULxfAZpqwcqn/KpoxEBig=
X-Gm-Gg: AYBFou078d9Pk2Z0V7fe7dXbnB4OrPFYu0CNLwcRI7Di8NT0ckeLfemnts6czetQXBa
 Vetx2qStlhdAfSamAkVV+hKS+2igBAbkjNkdDiwoiDas0aRlGwNUginUTOwzm082WzMJeF7okKO
 XdkfMLRueIvGw/QnTKJYtNAmKrfEJYSs9IQj53vGzYQuLBTZ6D/3NuFdm2v6EjAw3STbbSTyDnC
 iYEUO96pjqu76A5hSM+YLnl4vPAFyMFQ4Rdmg0Lo/0mmjjYwJqEo+CeiF/sCPYKoSQc49163tjh
 FoOiY/GuA0GOK870+7aWHrlwHlGGaC7YN/ZiFGtO53auXzj/LV0sktou6q5ChbJmyOGKOz9fIgH
 THIONjlxkI6ZkxOAaJPPGFbvyhGoPtJj5XA==
X-Received: by 2002:a05:6102:c03:b0:7a7:196a:84e6 with SMTP id
 ada2fe7eead31-7b390445334mr1291646137.30.1790589703621; 
 Mon, 28 Sep 2026 03:01:43 -0700 (PDT)
X-Received: by 2002:a05:6102:c03:b0:7a7:196a:84e6 with SMTP id
 ada2fe7eead31-7b390445334mr1291634137.30.1790589703066; 
 Mon, 28 Sep 2026 03:01:43 -0700 (PDT)
Received: from [192.168.69.225] (pmd666.hd.free.fr. [88.187.86.199])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49ff21c38a4sm137451295e9.2.2026.09.28.03.01.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 28 Sep 2026 03:01:42 -0700 (PDT)
Message-ID: <07f12ce6-0d93-47ae-8b2d-e18b60ccc914@oss.qualcomm.com>
Date: Mon, 28 Sep 2026 12:01:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] hw/arm: remove pci-bridge/pci_expander_bridge.h
 from virt.c
Content-Language: en-US
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 qemu-devel@nongnu.org
Cc: linux-cxl@vger.kernel.org, "Michael S. Tsirkin" <mst@redhat.com>,
 qemu-arm@nongnu.org, Junjie Cao <junjie.cao@intel.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Anisa Su <anisa.su@samsung.com>, Jonathan Cameron <jic23@kernel.org>
References: <20260928095646.3555447-1-berrange@redhat.com>
 <20260928095646.3555447-2-berrange@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
In-Reply-To: <20260928095646.3555447-2-berrange@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: plcttz9x9VDEvsDVmumIIZ3SbxcUFUrN
X-Proofpoint-ORIG-GUID: plcttz9x9VDEvsDVmumIIZ3SbxcUFUrN
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI4MDAzOSBTYWx0ZWRfX3ZwqdLFPeLUg
 Nl3K8QrwE87jpzHlXizXzWcj4D3mDnc5H3CI5K4/w02p7zMHo+x5kTuPmRQZ+/U0WTyWUZpru3J
 dQbEdNKH5indk8HfwnHqHb4W2gOGdC4=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI4MDAzOSBTYWx0ZWRfX0aceMeeSGHww
 zyWZlahsf2KqoVn2D+L79l9GJN01k9baVyTZzU1x7SML1gc3JhbkSSYu6tgdkI6secmRZUd2Y/b
 KPIsFqvnEusu+ZsDLf4JGz/froJ7LRpuTW1/bfOll4ePOhaCJUYycRpnBu2kIyeDs/Ci7uCcyby
 Dtl9s+hxO03NlECIp/ggTNrWHv6KEaO3Pe9T8dBmON8PnfqV5XhFL8sSnlTo2X8PlkSh87eehqG
 xcLBpQP6ORIGb0CEtCAQLmYNFiHSYWQYpNRsixi5fYFfuk10xWcRtHAVDBeu9iQZG5F9NYf03Nn
 79XNyGQc+ylWgbr5L4ZaRehfzpDUHlJYDusdFn4v0mbz7UFjRybtj/P5cQg7sKxWfXrWNogPDSP
 NR3HJkVylD3YjhSPdg1myUx+wyIVWX78CkjB9SERNv8JzG1QBkVPvx1qPkGsyif69ix8RenuG+/
 gMKF6X//MriwnH74/fg==
X-Authority-Analysis: v=2.4 cv=QZfzLcbv c=1 sm=1 tr=0 ts=6aba3b08 cx=c_pps
 a=UbhLPJ621ZpgOD2l3yZY1w==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=20KFwNOVAAAA:8 a=EUspDBNiAAAA:8 a=1tSEMpTH9XP_W59IOagA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=TOPH6uDL9cOC6tEoww4z:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-28_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 priorityscore=1501 phishscore=0 impostorscore=0
 suspectscore=0 clxscore=1015 adultscore=0 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609280039
Received-SPF: pass client-ip=205.220.180.131;
 envelope-from=philmd@oss.qualcomm.com; helo=mx0b-0031df01.pphosted.com
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

On 28/9/26 11:56, Daniel P. BerrangÃ© wrote:
> This include is redundant as the function is declares is not
> referenced.
> 
> Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
> ---
>   hw/arm/virt.c | 1 -
>   1 file changed, 1 deletion(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>

