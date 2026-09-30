Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0B3BCA5FC5
	for <qemu-arm@archiver.kernel.org>; Wed, 30 Sep 2026 17:00:17 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xBxed-0005Qx-Fi; Wed, 30 Sep 2026 12:59:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1xBxeb-0005Pq-MT
 for qemu-arm@nongnu.org; Wed, 30 Sep 2026 12:59:37 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1xBxea-0004c2-5i
 for qemu-arm@nongnu.org; Wed, 30 Sep 2026 12:59:37 -0400
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 68UDxpxs3930106
 for <qemu-arm@nongnu.org>; Wed, 30 Sep 2026 16:59:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 mq9+c5qcr5TaQZK4cwINyvrQNaSIiPHnk7fwG7hwS3g=; b=MU2+ug8kU3Edln49
 BwrDlKstv5FQTSfyNJmLfihLoU5CQoDK0bhCl8moruQhQt0Xln8H4YUzRtaLNFsO
 FUTy4nkmj1JoU1ttGx7tlbRbD5K5/KfvJV7p7HnC3WsBCrOxadMyEBNWrRKUufjZ
 uDXUtokiAtGsXmtOXxzlnChiNer1g1PMdCL4ZN32DWlJXy+8oYOnwNb5lRgUJqA8
 Y7qr267jXW32DynNH+CUGcLzZoBEBXy39vuSgZNjYy27z7yZOQAIiuF7g1CGhfQA
 0dIQ1hg7e0g1IZmX6CScuZgAAGR6rTKuUkh9a1sa8SQBum8X2fcIS5cW1ybzKv/s
 rYZlLA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h0w142sv1-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Wed, 30 Sep 2026 16:59:34 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id
 af79cd13be357-93caf6c528aso88866985a.0
 for <qemu-arm@nongnu.org>; Wed, 30 Sep 2026 09:59:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1790787573; x=1791392373; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=mq9+c5qcr5TaQZK4cwINyvrQNaSIiPHnk7fwG7hwS3g=;
 b=JQEaUfuO0JoqSTEfc/IRmN7dUfAbmH2oGXTKDZyLVchBq2ybrbEnizeTUEBt8l/r0/
 MF/40Wk5m1bkmVzbHptIjTF0l0vDsNfmH69qJcVEd53wjwNjfLgU0LtS/70d51vzFzrc
 0af87IHedOV2llOGEpT5WpcKarwVLp5jQPZZlGXA/qsy7/FjzFx0OQbHOZyoYx/lQlMP
 rciy6d0ypj4F0amVINpTJpq9rFHhWy4UIo7AWYHoFaasZDCPLI19KOB6kavq/UcfaQrk
 HG3I/XUrKf1Igka8NG8GT2qrfaT/IYWFmEvZeZhwB/3y25YxMS7rX0HOnvD/xOiuIS14
 gWsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790787573; x=1791392373;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=mq9+c5qcr5TaQZK4cwINyvrQNaSIiPHnk7fwG7hwS3g=;
 b=uudBLTtbHY85qMY+px1EIBYgDUlGBJqi/kJ1ii/A86F8Su4xhZPOZdxAcgXanwpJ6j
 GnPr2GqJ/z3HWjQISsJs0lWZXZlunT5Vq4pAm6xwGJWF8NdcJ7mN361YqI4ItmL575Hn
 N2SsbEiyVtr4La/l9NuJ6QD3nmMJ9mvz3uG2vGWdN3LAjTFxdvpTW89K0jMXEeysTWK1
 KrFvKt8xY9Q+EsK0+TwGCXsp8iaoetnyKNtUoiTFJJLkcAf279I4IRaORbVJk1mm8JOx
 5yQYMHM1GeRINa1mNKIKdbL6PVvKOGh+OEq3eLsztWW9gtlx2JZkS99mNdetlVjw6Eux
 wHeg==
X-Forwarded-Encrypted: i=1;
 AKwUvBz3/mXUS5LmWzSAu7FM2WMUz9LqctO29kdQExfbAanT2zleTRp6vPkHsktodCZ+COrpXK6epj4iaQ==@nongnu.org
X-Gm-Message-State: AFuF++kiAVKuTmveHz7O/4wK5kMBECQgVct0FCkFQ87WyCTxfl6SZFe5
 l1S7FAEwzbn3hocVZTeMR31Pz8L6PzZCqNsfsZ7uqfbyLLCr43/D2gXgXfa4MI3M58NS96ydAaK
 AilPW/ONBuoSXx4plpzfta/xG+U0wua+BE8UDIWu2RNR1EQH4zT31xG0=
X-Gm-Gg: AYBFou0VrKA1NKmchLIZ5/LJv7cq8RuoOQQNQK5oPh6qT3COxLEubHuO4oLzeEh5ZOy
 GlHyfdIDtUBVcFOuzTaWlsBDAhzIZmGkTfbNaf6M8zoSZAeC/x657qglOVd6zhuX94zOEgoM/rc
 fTUvFHgbkzpXCmTIXElgQtH93RYij14DWaWdZO1PaRAPrsN/hPLQJW39flILNpFZA/0+Cxzi3Ii
 jnpDPb+GaJuJtzVNGvm2utltlgOarJik9+6dT8UM8J6eo1Gn7WU4O/OTwu8qx64Mc+oz/B9dbED
 FTPPrrwzfWlzt9rN3DTdlZ6wQvH9eL8fk5u6Kyk1SaUO8Shquw8cySqB9ibeUOS8S+NAMqBuVpT
 MWlH72UHKQFd0Sw6qUBlLC6PmohbtdpQ3vQ==
X-Received: by 2002:a05:620a:6910:b0:93c:23c0:c2b8 with SMTP id
 af79cd13be357-93ca95018f6mr361498885a.7.1790787573424; 
 Wed, 30 Sep 2026 09:59:33 -0700 (PDT)
X-Received: by 2002:a05:620a:6910:b0:93c:23c0:c2b8 with SMTP id
 af79cd13be357-93ca95018f6mr361493185a.7.1790787572904; 
 Wed, 30 Sep 2026 09:59:32 -0700 (PDT)
Received: from [192.168.69.225] (pmd666.hd.free.fr. [88.187.86.199])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48b0690e19asm331431f8f.18.2026.09.30.09.59.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 30 Sep 2026 09:59:32 -0700 (PDT)
Message-ID: <53419ffe-9540-40a5-b080-425c5bfbd1b3@oss.qualcomm.com>
Date: Wed, 30 Sep 2026 18:59:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 01/10] hmp: don't crash on invalid register
Content-Language: en-US
To: =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>,
 qemu-devel@nongnu.org
Cc: "Dr. David Alan Gilbert" <dave@treblig.org>,
 =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
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
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 Warner Losh <imp@bsdimp.com>, Kyle Evans <kevans@freebsd.org>
References: <20260911-query-reg-v1-0-0c04f0c02cf3@redhat.com>
 <20260911-query-reg-v1-1-0c04f0c02cf3@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
In-Reply-To: <20260911-query-reg-v1-1-0c04f0c02cf3@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTMwMDA2NyBTYWx0ZWRfXwhRYzW8XmmWK
 1VUjuX4Om5dL8gzsE6DfVwwrH98iDe/TXkA24pf5HIquRsPfyHlO66hZIMA4zeSGqSgB+lqH654
 sksLWEPMm/fchkd6XjLIr/zjUk20ma8=
X-Proofpoint-GUID: qgt0amLDs0F5ziYuC6BQSskzlqq5_ZAo
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTMwMDA2NyBTYWx0ZWRfX1UhmpfJxWnWA
 gmIm/RYufUMo2pQJMYzhdTQG6gQAXx3aNLyV2U30a0mIA4dYZNLPzCHwFxPsol1sg0YX97fvTv+
 qA2ZhZc/6vxEQp5ozdYnABvBVH6Qz5zB4DmjCr6nJBdZNw9J5BKQdVS/tJpNKNKxn5kWrehwx25
 nfYdtc7OCMzFcG5AD9VD6HYh3aj8qlMwJ0P8vSmjCGVmvpBACMdiXfs/Mj6XWQ/7ToiQDsIhgCh
 OIz2v0rNmboYy/o2M0veZH0RfhSHwPlTi5EqyPaX07YMsqaQtPlRyg0nSbKxeJLIneIB+8DgjhC
 ArTjMCbCWsV5RcRmuUT0F459f70OKZCL1NWDP8w4PBgRHNPi3DEdVSzO1dhtASEdWdrZEKp7j6G
 FIOuIUPade6dcDFzwqzkUWgif4C9Dw5BhmKZKpCZ67X4k1odJg3fi6xr2dBMLdW/S16+bW/exlU
 xjfp9ItOZB+DvyWhHHw==
X-Authority-Analysis: v=2.4 cv=J8Q/fwnS c=1 sm=1 tr=0 ts=6abd3ff6 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=20KFwNOVAAAA:8 a=EUspDBNiAAAA:8 a=B-miyySTQTp80Hq9ejcA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: qgt0amLDs0F5ziYuC6BQSskzlqq5_ZAo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-30_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 malwarescore=0 phishscore=0 clxscore=1015
 bulkscore=0 priorityscore=1501 suspectscore=0 adultscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609300067
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

On 11/9/26 14:27, Marc-AndrÃ© Lureau wrote:
> When printing an invalid/denied register, QEMU crashes with:
> ERROR:include/qemu/bswap.h:488:ldn_le_p: code should not be reached
> 
> (ex: "p $sireg" when siselect=0 on riscv)
> 
> Return false instead.
> 
> Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
> ---
>   monitor/hmp.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>

