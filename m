Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D240C43458
	for <qemu-arm@archiver.kernel.org>; Thu,  2 Jul 2026 12:24:07 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wfGSI-0008T0-Tj; Thu, 02 Jul 2026 08:23:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wfGSG-0008O7-S9
 for qemu-arm@nongnu.org; Thu, 02 Jul 2026 08:23:44 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wfGSF-00006Q-GT
 for qemu-arm@nongnu.org; Thu, 02 Jul 2026 08:23:44 -0400
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6629nXWx4139672
 for <qemu-arm@nongnu.org>; Thu, 2 Jul 2026 12:23:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 CvdR7H4wM5hxDEsVoGozeURPNP8zWTfyL/fabghl30I=; b=EPmocWiOPbmESckv
 b7ksGK6BBtGNEBUQNKibT7M67PpT4js+4y31VyCvNX+N5nUiaCO5+IzGuFcDnDBp
 HadFRQYvUqbj4YpSk6zTnV4WvV3jLINAJ2ea1kfua1NbVVaRYL/OwHps2+4nzYN7
 WmU0aVEvvASRJajsbo6+b00UsqOGegSy7MgZd4s0I7NO7BhSmXOpbbJVFLgtNGAA
 WPPyJzZZ+LJOKG1lkSK/pYjufi27onbf6ll/WFXg5gjNsYXazOc5q3PbpUDT6QVZ
 TN+fU0uJjNDDvh8BJ/IWAgTpqY/cqRrB2JSKqgSHHburpB7M+x790rQzF+LVIlSj
 fiRf9w==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f5npr8jpf-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Thu, 02 Jul 2026 12:23:42 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id
 af79cd13be357-92e56b2b350so322959785a.3
 for <qemu-arm@nongnu.org>; Thu, 02 Jul 2026 05:23:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1782995021; x=1783599821; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=CvdR7H4wM5hxDEsVoGozeURPNP8zWTfyL/fabghl30I=;
 b=haRixW6+BHqubp1nXvj26pzvTjUXzp4Dcv3OkKBuyYdIwaAonua2JFZeWHgm1vK4WT
 DCiIXq0uhDouIlWNFFbBPDMV4y0czXVS83NNLrIeJX2MCa2pZkj2MCrB4LrhPI8HVDhv
 f4Ga/07LMZCfqfVFLDlMOnILZU+Hr6UsqsYEsZzzMd1ySLtpbRdXONEerggfvVOzDUYQ
 7jIb9HN2FSfxkhgb+fqK6C/JXbRYSaq7KWEL/bDVjwNK4oxALDRdUxLOKnMA9DsWQRBz
 Je3FccW3833rjO1h4u09/ZbWvSB9v51cdhjkKNFoYcP4fE52hIkl78AsCV5K4gtoqyL2
 na8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1782995021; x=1783599821;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=CvdR7H4wM5hxDEsVoGozeURPNP8zWTfyL/fabghl30I=;
 b=Ia5VpFDwekH77Ro6mCWOPfmoNn4BEgjf9cxxPlkOGJDPe060Ok02ErkPJ+Yw64xosm
 4fut7Vwa7doDaeWMrdpwd7c+X6yXOtXBbxfMmEjlWn7yIhJk3unNkxKaqpTkZIuwMI3G
 /d3e5XxcfH5bLm4cNds08Y12Q2cyWiGQn8VhM3rEcT8AiXgrUp6dxMIcKiacFz19WP4l
 bsrcvV551hDSMy7wy6drujqN2O1sd1dtEmmfnldfbuQiPdZewTEL8mdg9iC5cBtNYQCR
 gUD6OBoZkv6Ro8RXnGJkJj9Oq5l5dz/OYBKfkKfBquofd/TxUAn8JBRueMS/i86pxvYp
 JUXA==
X-Forwarded-Encrypted: i=1;
 AFNElJ/GpIwlZki8CyBqjxpDGsbqIfXYMsabTIK8b3Zw4Pk1TH9xB5T9uXBTAMTtjZ3trRfMPMFjTIhxMQ==@nongnu.org
X-Gm-Message-State: AOJu0YxM/RCFJ3pVsJz9b5bRNf2cnrTSfmuzV9ym5MmroWFapT+mIRMU
 STRXhD0/aSkpT4n480vHJtayMSiX/rPWEGq+hAcLBZmXAlbj/7aNv4Ar1c1hWCAdssdLUNynnr6
 ATjZg50dqn5ma59QGff0MY4pti7T6Pl4wCoRsZ9R8JWCnFc8d3aiyJmQ=
X-Gm-Gg: AfdE7ckeGBT9O9ujPhhpKG5j759VQcGJdRXGOR+K5Kd6C7dtJe0gDmnJir632AyxjMz
 9jFqIbtDNGvNk3D3dENEketHnXzjXdTdlit3k9upOm5BvLFu8/38X2TzogYziwXS3997Histy0d
 HbY2yhBtbTLF199kRfjfi/ud0ocS1JcZSr+IPU0HP/5NV9wPWamxkKFjhp8DR8pLdtboWLkuRDB
 TodNYOp5UBLThF9rd0hMLhbH/8XZoWR056SYGDGJSzqMJrE0FLxPYADKi8DfDUKqg4ZKLf+lD/8
 7mwwbkXy8raECTPfVZq+tflflw3vUS/6v3UZk7OcYn3Ro7Qsje9mf3LVzTwn8m4Z4vOphG1ZvRq
 dZVuM+ASxXjW8X0UlijfVEUaJm06YJerrn6ep3+6l/dI9gZYOxbgkvw9751cyuA==
X-Received: by 2002:a05:620a:6309:10b0:92e:7d7a:108b with SMTP id
 af79cd13be357-92e7d7a11d8mr404764685a.50.1782995021022; 
 Thu, 02 Jul 2026 05:23:41 -0700 (PDT)
X-Received: by 2002:a05:620a:6309:10b0:92e:7d7a:108b with SMTP id
 af79cd13be357-92e7d7a11d8mr404760185a.50.1782995020427; 
 Thu, 02 Jul 2026 05:23:40 -0700 (PDT)
Received: from [192.168.69.212] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-477ddf0f27bsm8331816f8f.30.2026.07.02.05.23.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 02 Jul 2026 05:23:39 -0700 (PDT)
Message-ID: <310ab638-f574-484e-acf8-ccdb49d105e1@oss.qualcomm.com>
Date: Thu, 2 Jul 2026 14:23:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] hw/arm/imx8mp-evk: Introduce FslImx8mpEvkState
Content-Language: en-US
To: Bernhard Beschow <shentey@gmail.com>, qemu-devel@nongnu.org
Cc: Gaurav Sharma <gaurav.sharma_7@nxp.com>,
 Pavel Pisa <pisa@cmp.felk.cvut.cz>, Jason Wang <jasowang@redhat.com>,
 Francisco Iglesias <francisco.iglesias@amd.com>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 Matyas Bobek <matyas.bobek@gmail.com>,
 Jean-Christophe Dubois <jcd@tribudubois.net>,
 Vikram Garhwal <vikram.garhwal@bytedance.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
References: <20260701224612.48342-1-shentey@gmail.com>
 <20260701224612.48342-4-shentey@gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
In-Reply-To: <20260701224612.48342-4-shentey@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: Eq6Mj0hJ6C5FoxgRdPC5l3BoFHyc5L1A
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAyMDEzMCBTYWx0ZWRfX3s1Ne855TN+r
 Ss5CiUpi8nkSlx8Od/8xasGsaqXnU64udHEAGSKKWnHpdKza1IRAO0SDKvcvOJpYdut1KuLulti
 qO4es8IW+ETSnmHKXDGdAcDOF+CLN+w=
X-Authority-Analysis: v=2.4 cv=NsvhtcdJ c=1 sm=1 tr=0 ts=6a46584e cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=1tSEMpTH9XP_W59IOagA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: Eq6Mj0hJ6C5FoxgRdPC5l3BoFHyc5L1A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAyMDEzMCBTYWx0ZWRfX3undclpsuiqn
 NFzMt8M1ljK8MVM1fkRghSTkUHlK3AhR8tH4qvDjRLWgCFB5FehBDp5Dm+A5/1Jpz9SERjYejnq
 HO2ptu9MhVGyBZjDXfJ795I5Sh41dOlXITzcbPDnczy3O7OiBfV21C6v1/URqBuWAs9XATfpdGj
 IFtvfwZcZoprKdteOS14txhIG3siJpCbLVdrVe/d0oYwU88Q4/axRStYLqRdvT3opmAv9rJ0xWW
 HrMxbDpkQKTamnVsQF66ZP26rc+KrFQUQ6fK69/A/JKMof6e1kIFmUubTjLEu6iASpOr7prUTvQ
 kGG2eHc8V5qN2UZehL6qcJfKmIDODG5xD09s3087B7DFLEz+cWHEGXWbYNj8qVxajj0xbye3hxs
 v+xFZbBxzTUxYW5VOUE3Ue+idDAWOWz1O7buIcDS7M4V5WsJlCXMlCox2RZZWN847MczrhLLZC/
 nCOA9NyVdjBf0f24Mjg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-02_01,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 bulkscore=0 phishscore=0 suspectscore=0
 malwarescore=0 adultscore=0 clxscore=1015 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607020130
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

On 2/7/26 00:46, Bernhard Beschow wrote:
> Introduce class FslImx8mpEvkState which will be needed for holding
> CanBusState attributes and associated properties.
> 
> Signed-off-by: Bernhard Beschow <shentey@gmail.com>
> ---
>   hw/arm/imx8mp-evk.c | 30 ++++++++++++++++++++----------
>   1 file changed, 20 insertions(+), 10 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>

