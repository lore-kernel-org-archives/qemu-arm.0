Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80B39C43458
	for <qemu-arm@archiver.kernel.org>; Mon,  6 Jul 2026 07:06:30 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wgdPM-0000fW-Fl; Mon, 06 Jul 2026 03:06:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wgdPL-0000fI-Ht
 for qemu-arm@nongnu.org; Mon, 06 Jul 2026 03:06:23 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wgdPK-0003Ux-92
 for qemu-arm@nongnu.org; Mon, 06 Jul 2026 03:06:23 -0400
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 66641TeW3613951
 for <qemu-arm@nongnu.org>; Mon, 6 Jul 2026 07:06:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 LYLw+NEnGGTFQEjcevm+HJdpUh29k6RCkUllU5CafWQ=; b=dg4H8FVsjvhvehbB
 V4azvq4BdKatIe5o0k8m+pzHoHYsweS5oARiPV4lWRhhlmGndyfTYP2/qqyjhpg6
 5wqb2PgNUi/xHPp2lKwRgQ3TtOp4r2aYBTW+oAFLKHddmtUSpSnhI7DQSpSexSOZ
 EfE0qfLevc5ANtYdXdOo+0i+BYgPD+9sL9KCRK5fT1cLNZwzrKfk/uqKC1FRYxGZ
 02adSdtzSxPjLzCzQNbqTCA7Q7/z62+yrZUDvtozI+tw0IrXc+P0vu8s3d7OTQeq
 Vud/9pZznCDOWjOP5F4QVvgyB9iUlBWU7iUWSpEnV/APEX6OcdYVD84QgJX+blCd
 RTALrw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f6srvn16p-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Mon, 06 Jul 2026 07:06:20 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id
 af79cd13be357-92aea0d801dso246274585a.1
 for <qemu-arm@nongnu.org>; Mon, 06 Jul 2026 00:06:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1783321580; x=1783926380; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :to:content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=LYLw+NEnGGTFQEjcevm+HJdpUh29k6RCkUllU5CafWQ=;
 b=F0lVWEAODxEpyUuxPB7D6NlCIpiExb9K+H5uhDiLjiB4j6PnwSnixhM8OUW6u4io9x
 u30CDotOdI/BXHRRxJ5cg9daW2VVPsFfn9ZjzUWt21kun7t2wzKjXVh2JemLJP/fQGMD
 bb5LMDR/5mbtCoh10s7rwvosoCl5VYnKZo9tfWgFo46BYqjlHkxV+ePKOO6EWVQoFAg5
 Da2rOOXhw7wle+sfSwIjIErayz6Xf1saCJlFoCwomaS8h3LRo5h4argPRI6Gep125pAA
 nmTN4zwhdGfzebSRPd/RnSu4XpzIEUuPPYSjkpixDfzNd7RwRvwqYInLxlnIFn4Y0NTQ
 VwmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783321580; x=1783926380;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :to:content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to:content-type;
 bh=LYLw+NEnGGTFQEjcevm+HJdpUh29k6RCkUllU5CafWQ=;
 b=kf4LRO8rcZHjtdwqAZk+eTEWW95ORGAgxPSRwY59HCq6oEcB6/F8oZvgejCvl0vmVb
 Y4A7RKoB6+8WZhwpc72DHN5pBb6rqzP1JpmnQjmHc05HrlGPsp023f2apkNkznCv3Tqq
 +25KFy+l3hrSeZqfMe0yRjluiu34gnbizQM8QxU9/ASVPQXlG2HwyRmE4yWQuPfdnIYw
 bfkOX0I2zUskCudc7ia34/Zjmg24T6+UvbcooFn9VkKudtcBHo7Vy97teIhusJ5fBkRR
 /Js+JnbqtG7VyVucGg+7ignWonTXov5XafO09NEScItpOMYYjd3t6voW2FmgOgVBlIMM
 A2Hg==
X-Forwarded-Encrypted: i=1;
 AHgh+Rp93PQsH9SUayrFl9b3jVZdU+7qjHSn+sysHfAkZSmQWEQ61iu8FXFsCXn+B+CLl1C74GUMSVAGiQ==@nongnu.org
X-Gm-Message-State: AOJu0Yx+sfFMDWK86HSze20hSMAiGEunIlehrHGsk7k+g0KPs76cIA7+
 ztgUh+xIPHNRYvKnxJpIrEr0R0fJyeZfW9jpFEQ/1Q68ZhWfF45K8UvfiVJNpk4oTQbe4WMsq0R
 7UnnilOttIrJ9myeYgNWIwUgT8XqUyA6MfF4nAIWZFZagY5fJTxbm2I4=
X-Gm-Gg: AfdE7cl3sB5QldAoBna4bIAu6I/6HfqBmIycQzWk8ah6gIky9Ov/2zjBMbHXlzOmR+M
 dLyLKhJGiLxOMweFGvtbiDotzHSp2jTcuoYqGc+cBvnGAM4j3bFJxZJOGGLVhDNMk41B31Fdt5M
 P8VQs8ACoOvI722RFMx3dA6yvfEzpUqo9qZ9fBnUF+/OmHDKbe2PJum5EVAYnOPHbogmvUqCHZk
 YNK5Xef3xO0FdCjlbzqWdM2an9xMq8U1momIsION9JJ9GiBcA8ARM00ioJ1ZKn2hqgLiQQJAUNC
 yeMZpcYxL3WrHKLo59GPmR90iZHz+0K/Rvz8FjJTJwUvGYBDLQ/wcqQ9YKe3+ZLALVjA6nXULdp
 S630CfxoVinf3TAksGcmdZf4kjsKZ2UNHPPbboypsPeRmJcWnbWgTBrUNzCPllA==
X-Received: by 2002:a05:620a:1b82:b0:92d:6961:9519 with SMTP id
 af79cd13be357-92e9a353d3cmr1205757385a.8.1783321580051; 
 Mon, 06 Jul 2026 00:06:20 -0700 (PDT)
X-Received: by 2002:a05:620a:1b82:b0:92d:6961:9519 with SMTP id
 af79cd13be357-92e9a353d3cmr1205755385a.8.1783321579599; 
 Mon, 06 Jul 2026 00:06:19 -0700 (PDT)
Received: from [192.168.69.219] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-47a9e4d6e4csm20616278f8f.10.2026.07.06.00.06.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 Jul 2026 00:06:19 -0700 (PDT)
Message-ID: <1c4a3649-79da-49ac-8b76-b3c70b0facdc@oss.qualcomm.com>
Date: Mon, 6 Jul 2026 09:06:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 06/12] hw/acpi/ich9.c: move initial property values
 into ich9_reset_properties()
Content-Language: en-US
To: Mark Cave-Ayland <mark.caveayland@nutanix.com>, mst@redhat.com,
 imammedo@redhat.com, anisinha@redhat.com, philmd@mailo.com,
 aurelien@aurel32.net, peter.maydell@linaro.org, pbonzini@redhat.com,
 richard.henderson@linaro.org, berrange@redhat.com,
 qemu-devel@nongnu.org, qemu-arm@nongnu.org
References: <20260703135512.3213964-1-mark.caveayland@nutanix.com>
 <20260703135512.3213964-7-mark.caveayland@nutanix.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
In-Reply-To: <20260703135512.3213964-7-mark.caveayland@nutanix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=TcamcxQh c=1 sm=1 tr=0 ts=6a4b53ec cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=64Cc0HZtAAAA:8 a=EUspDBNiAAAA:8 a=1tSEMpTH9XP_W59IOagA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: modeG1a4AH943I4sgyLw-dybeyebQlG_
X-Proofpoint-GUID: modeG1a4AH943I4sgyLw-dybeyebQlG_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDA2OSBTYWx0ZWRfX0UYOYPOZvNBE
 BRpn+RaNTAW9Jau9v+Y7FtNBGb2FKv8BvOkbqvDIfl2HCYnUglnGyQXOj6jrEE9utRgn7KEjWmu
 zNfp5rmTpJiKeINVqjHUmB4pev4ACUYWEqXz1EXVFkXCMyZnl9QIp/mRSmSSGCODV2Az0HmhaHo
 rix6aSQd8OGfN7RNaWqLw2+SuPqwABusuAEiO3qVS5Nylya3ye1EQKgMQMdTV8uEMRNDBRO0tqs
 Wlana4hcoRaVcMoqMz8q2V/GsvZzYTyjKYj67wzxOw1C3erczoOGTnPR+3DANo/rN2Kvwb+3SOB
 36165U80mr0O6cyuvBjSB4X44uPu3H3/i0WhldA1PKyWyNC/ocY5xmpAZ5Hxvk4tQIsK+kI+OHY
 OumEJ8d+QS/KyE7QPF7PmpQNaZce7EyOyv6/xj+u1fVEVZ9ey1qA1hMD0a5rrJNZ2Ozbj/mvpbW
 e5WqmMtVH5TdSzyqZPA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDA2OSBTYWx0ZWRfX2Q7x0VxRqToJ
 ptrUtp8RTYFqDiWuV2Rqq2+fyz72EVrG6hr0AEm+0KZa0yE/KJLGrXvpGCwLKPvs6lKquQZZrN4
 yIK0Ncx7gBfZxdvhbNN9RJ6DIs13Piw=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-05_02,2026-07-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 suspectscore=0 bulkscore=0 phishscore=0
 impostorscore=0 adultscore=0 clxscore=1015 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607060069
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

On 3/7/26 15:53, Mark Cave-Ayland wrote:
> Signed-off-by: Mark Cave-Ayland <mark.caveayland@nutanix.com>
> ---
>   include/hw/acpi/ich9.h | 2 ++
>   hw/acpi/ich9.c         | 8 ++++++--
>   hw/isa/lpc_ich9.c      | 1 +
>   3 files changed, 9 insertions(+), 2 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>

