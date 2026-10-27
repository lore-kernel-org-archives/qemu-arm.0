Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3689B606A31A
	for <qemu-arm@archiver.kernel.org>; Tue, 27 Oct 2026 14:22:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=hiJvWIH2;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=iiGGwlBu
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xLi3m-0004Lg-Tr; Tue, 27 Oct 2026 10:21:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1xLi3l-0004LU-KQ
 for qemu-arm@nongnu.org; Tue, 27 Oct 2026 10:21:53 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1xLi3j-0004Hc-T7
 for qemu-arm@nongnu.org; Tue, 27 Oct 2026 10:21:53 -0400
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 69RDo7mZ1486555
 for <qemu-arm@nongnu.org>; Tue, 27 Oct 2026 14:21:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 GsPZyrO5OjZGcpHahOwB5xBhKLN+ZiVAg/NShsBS1TI=; b=hiJvWIH2sgKWRPZj
 fRq3aTo1ReuANZ5+UhGJMZhmSpEQpp9aiKl0BXOCSpQTo4K1yBJfpO9IuHkdfC6Q
 VX8+rsMSAHMW58emVWI8RLTWx7TwSJH8POxHdbPtHhned9rb9NCWwULn2XQifdMl
 Irm7ij3p1HwluWJ1Dff4BcPfzP1zNW2VvS2aFhwPcpv9jv5LgIz+I7Ffl09WqENX
 IbvF69L5x514Jv8DhzWQx8rwRkdABGLKpa+7sQ6tOmoHB6T6D6yVovOVfsm9lsWL
 x3hrzHtpUMGcgD9uOUQ35bP1UYxEExTcIKs6vjHD0fR03wdsu8mlIxRPmycPODHw
 xy4h6w==
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com
 [209.85.221.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hjp2t9yh4-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Tue, 27 Oct 2026 14:21:49 +0000 (GMT)
Received: by mail-vk1-f197.google.com with SMTP id
 71dfb90a1353d-5ead18311ebso1066308e0c.3
 for <qemu-arm@nongnu.org>; Tue, 27 Oct 2026 07:21:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1793110908; x=1793715708; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=GsPZyrO5OjZGcpHahOwB5xBhKLN+ZiVAg/NShsBS1TI=;
 b=iiGGwlBuIqlb79ECglEGGjhJGQMx5Ry3W5GSGPZ5zZSlyIpxxf901SxE6sZWYjKMX9
 UrY87Vgypri5Vh9bA7RdKwCxisRCbAfOy9IAof8JBFmMY9ELgH+xZHDcSFyK5T11DYXk
 ZE6qdmQYnqGLtSXaJgWHmDqcU9Q5ZJDvKFbmhvGhSOUEfljMI2OOg0LxSPJWGWi5n6Bl
 xGqCLKDfxOUtjyvhZCL54iacnr6BknWu/uVqB/f9XGXZS3hIyRadIJ+9SLg19x/ZVtHE
 +Z3yXamBdzMj5G9wAUVepWStvjhLC78+EdfcFIJzZDNya5AHPeEkO4Khgv7ie0kKF/nl
 frbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793110908; x=1793715708;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=GsPZyrO5OjZGcpHahOwB5xBhKLN+ZiVAg/NShsBS1TI=;
 b=d1K1ayTQUntmU+sRjiF7xV/ZbkXTaGrSaPyRfQ9wk12B2oyk8v+AJNJSnJs40oroIE
 gnkDUE02AjsJGqAGUDZeU9eN8p758+T8XJa582oKoOUVI+HP8gFXEuR5qH50k7JwTu/J
 hIqP9mBfZ4mt4VbGeNjNG04yQin8TEjOyRCrRVx1pgImUe8j6ZuRqVBVPqytv1TT7XFc
 hVGOI2bDDCT+xhEXnqrtUO9/Xl4vw3xenbyw1p15CSEchPpyoKj7vXR75tglGreSg2o0
 8wdoibmKTa7obZnhiMjDoprqYc2E1wgwM5mrdL41OumgACKkytek5PQhLdceTNQc78lU
 cvSQ==
X-Forwarded-Encrypted: i=1;
 AKwUvBxpuL7msFXboDm55zKx/F05MMSBpgk6tWsYKSU38eriNCOlnR5SBbKqXWSCCVhjEMjmhCkzwgIyCw==@nongnu.org
X-Gm-Message-State: AFq9FYLc5lal5lVD0ArbKTGqkzTARLVqnMicikH22szH3ZkutXxNYvEY
 +1/tCafbLsbwMfFBZ1F1gFGHcFIvycWI9zySFTTC8orcQHOET+t1aWmiFZe3x5/NSpgT0H6iC8V
 LA2VWfPaV47x0LRamY0gtST0Y2ZMoVequ54lDk2uirL8jfxi3GU1jY5A=
X-Gm-Gg: AYBFou2OdV4t+zcuoAbHZHrCfpRSmKMQFPPuXaT9iUHD4jBdLSsx3wE9r7q+4cH+Jst
 RHuWUYrGpLsn7EOXypXRvrpHQmRcfhytEYI2z8XIj9bt3M9FOXySkaD5v1uLoIYldR+e4PeXKjI
 GZcD8iEnfIXAJkNjKlHMv7eZe4ClgFxsWI8DwLXQdXM0kCAyr6ouNyBgIA3WPriiHOKzVAf8hQW
 rigtJ1ygsQldCcc2pHwCvzRzIiIEXaBejoIhWuma0AuIiBpvteX959z6xwMJqYOa+GWazuKlTE2
 aX2CALmHsOPSGcqy3Tb4N6/BleJy6qT4pcealt2IzpeMC8SSGV+pDgDA42urZgcRlBuJ33gl8qX
 pcl2nI42SS9iNTSd80jwWNpBGm4rD9b/5fOMsKTjfXt3S3wAI/Q==
X-Received: by 2002:a05:6122:3a0b:b0:5ea:c382:af67 with SMTP id
 71dfb90a1353d-5ec232e5dc6mr3847938e0c.13.1793110908230; 
 Tue, 27 Oct 2026 07:21:48 -0700 (PDT)
X-Received: by 2002:a05:6122:3a0b:b0:5ea:c382:af67 with SMTP id
 71dfb90a1353d-5ec232e5dc6mr3847911e0c.13.1793110907744; 
 Tue, 27 Oct 2026 07:21:47 -0700 (PDT)
Received: from [192.168.69.229] (82-67-153-177.subs.proxad.net.
 [82.67.153.177]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48e3ecd8ddasm25327822f8f.48.2026.10.27.07.21.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 27 Oct 2026 07:21:46 -0700 (PDT)
Message-ID: <735a348c-3eb4-4a9c-bc41-6d347d4330ec@oss.qualcomm.com>
Date: Tue, 27 Oct 2026 15:21:45 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 00/31] i.MX fixes and cleanup
To: Bernhard Beschow <shentey@gmail.com>, qemu-devel@nongnu.org
Cc: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Bin Meng <bin.meng@processmission.com>,
 Jean-Christophe Dubois <jcd@tribudubois.net>,
 Gaurav Sharma <gaurav.sharma_7@nxp.com>, qemu-arm@nongnu.org,
 Jason Wang <jasowangio@gmail.com>,
 Alistair Francis <alistair@alistair23.me>
References: <20261006083445.30362-1-shentey@gmail.com>
 <2FD6FED6-EBED-47A4-9096-D4FDF2F17406@gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <2FD6FED6-EBED-47A4-9096-D4FDF2F17406@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=AJjzCM5L c=1 sm=1 tr=0 ts=6ae0b37d cx=c_pps
 a=JIY1xp/sjQ9K5JH4t62bdg==:117 a=nz36NW0qrpeEijYxj/H2Ew==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=pGLkceISAAAA:8 a=TcPvD2NeZe2R3Q-9zosA:9 a=QEXdDO2ut3YA:10
 a=tNoRWFLymzeba-QzToBc:22
X-Proofpoint-GUID: bDde1B3O85IO6q08GdwmkpZn8Pj8Ur6W
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI3MDA1NyBTYWx0ZWRfX9KlTTTbFkNer
 H61oL0hSqL6gMrFTWP77PblwssNZM4n6iRL5g5+nVehvESfa3w6muFp90C80C1yZRwcpIhlDfEh
 5xk696VKzZOpsFRyaKfPaJvF6hiua5g=
X-Proofpoint-ORIG-GUID: bDde1B3O85IO6q08GdwmkpZn8Pj8Ur6W
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI3MDA1NyBTYWx0ZWRfXy3lnvAxiaU6q
 W/GIuthNcGCeZ2pjj71io+kqQTBbClW8Xxw4MV26IFIljtbI3MDd5VE4D32EmFhUWBlwXcquFeL
 fas0H9Gb3s8iaAK6NPbUHM4aaslPNQGAAbv2ztBK3ElrFQ8mXFcBmWGKXqLe1zIKLT0+TtoJfG+
 ixSCuWlNYDKDe+CAirzd3xFVNKg2hKBTih1/w+N6YiTd3fHT2plSl5W1/El50Eit3QM+8dl6b6b
 1wlEvJkX4iLB0TAgvEgteMXgIeSP43TvHaXnvblYvoEmM97q6zPSNplxm9I6gZEFlPwz4KG0JBP
 gOpLMNr2gip5/riCDR2W5TWwMrUQDBBgBEKBd9rRXVLjccfx0As5tKbQ+SBKxjfdx50nfpAZSYa
 BKAYNUV1ARzpMU1PgS48ZqY5m/WAzIKHzvDOjC5iLyEAOLmXwhb4GO9pQOpoYB8iuj7JKPT4gzN
 fuqj5jiBlh28TveGhjQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-27_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 bulkscore=0 malwarescore=0 spamscore=0
 clxscore=1015 priorityscore=1501 adultscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610270057
Received-SPF: pass client-ip=205.220.168.131;
 envelope-from=philmd@oss.qualcomm.com; helo=mx0a-0031df01.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, KHOP_DYNAMIC=0.001,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-Spam-Status: No, score=-7.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 27/10/26 12:22, Bernhard Beschow wrote:
> 
> 
> Am 6. Oktober 2026 08:34:12 UTC schrieb Bernhard Beschow <shentey@gmail.com>:
>> This series fixes various issues in i.MX device emulation, cleans up i.MX
>>
>> Kconfig handling, and improves some code. Functional console tests for the
>>
>> remaining i.MX boards are added where images are publicly available, except for
>>
>> imx6ul which is taken care of in a different series [1]. Fixes which appear safe
>>
>> for backporting are cc'd to qemu-stable.


> Ping
> 
> All patches reviewed. One may need improved commit message. Am I supposed to resubmit the series or will this be done inline?

I'll take care of it, thanks for the ping ;)

Peter: I'm queuing this series (simpler for both of us I think).

