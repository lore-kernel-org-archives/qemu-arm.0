Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BCC21CD8CB9
	for <qemu-arm@archiver.kernel.org>; Wed, 10 Jun 2026 12:36:50 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wXIAO-0003CX-4R; Wed, 10 Jun 2026 08:36:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wXEOK-0003Vz-UR
 for qemu-arm@nongnu.org; Wed, 10 Jun 2026 04:34:28 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wXEOJ-00056W-Gc
 for qemu-arm@nongnu.org; Wed, 10 Jun 2026 04:34:28 -0400
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 65A7iqPF997573
 for <qemu-arm@nongnu.org>; Wed, 10 Jun 2026 08:34:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 rGhgJ0YNVVGJdJIhrXioE9s+m3PZGCBQYfOkZ5atW8Y=; b=UVx2gDV6gjYAsqLx
 6zq6WVCs/ry6IktP2HBSyrfhbKUQH5+gXHNNuqwiIIRKuN++T/KRq/hQ4NxsPMLB
 okz6yDPskV1zBG4HllfbVHOBrgKWqjXgmyOUZY0eGJpiM3DulzWKyVsFXd+mkPuf
 U+gq1Q6BAkLRFIOE/OReRYORN8N/gw5z5aEQbIYS98YT6h0dS8K05cM1PaOAaTqm
 6U6FlDF7Ae4jqZHREwfPwBwxABXlolbJ9mKMSpIRExFMOoEX+z1D13NXTBPHvwk3
 /X0+Tn7NcAggFGJIsZdkerCUD9iP3U7FTN9e95DtvBPxl2pR2JYhxw6j5svzYguy
 JLj2MA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eq10a8usf-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Wed, 10 Jun 2026 08:34:25 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id
 d75a77b69052e-5176d949c58so159702011cf.0
 for <qemu-arm@nongnu.org>; Wed, 10 Jun 2026 01:34:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1781080465; x=1781685265; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=rGhgJ0YNVVGJdJIhrXioE9s+m3PZGCBQYfOkZ5atW8Y=;
 b=OzYhmyvia0GbBxCZ4xyA9KPl+Q/SqUxne7EecyG7mhOjNzZb+tlOn4Hnn3qgPtyevX
 sRWyYNqR8oC0TBO+svfh1db1SxgZlm4I7hUF6vb9Psa0PxghB6K/keTbwU4D7oXSIjZt
 kvRsLkPjLiQfWFf1/45douZ01jo3wK4rCX4Ocgn0AYFyoh9QVT/VvbY9fczJNl4h0FQK
 0ghsBQi+ulE+6C7IKp+Sn+y70z7a80hCMg9g/Z03M5+Gj7Jzw2q8tXPMlRGlMlOAQkEl
 qQnLo61C5sZnjw58OvbK4DnyCOM+ef244ebm9ZFnG/q32DPus5LosYMTtQuNpIwJEIj/
 xGYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781080465; x=1781685265;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=rGhgJ0YNVVGJdJIhrXioE9s+m3PZGCBQYfOkZ5atW8Y=;
 b=pV8y6jnFOd80w405jeakLoBwYO5UlBtWzeLEudap0LMxU3g1OxdR4Ir/f5+mJWTAOB
 RcfL4ME7PIiBC4maWn3tONtY4hIMB+ViTBeIuRCJzZii0pRv75yMUIrg5do412W8GZMq
 c152DOMisor2C/ME0oyViFWoiH3mb2vXUh8tz9rQ6T90i9l2xZLMk1HOVU3hbD/sE5zn
 v/Jj094mRaaHlsEecmureCVdJTmgHMMQ1FtWoDRpR905uXLlbek88dQDz3C3jo3+oIXT
 RXOMkckF7Pbm7lnTAUqkbItMlHs9DE6iOAUQh++7dO93IkbtaUXXPcJ+EleahTbSxhbM
 oz3w==
X-Forwarded-Encrypted: i=1;
 AFNElJ8vpVHGSlilrFZgJ8ePa2PLXst21ntboAAOZKkiXogEJ2F0dbaf0iDiDCwYDWK8XIe0x8D5vf3dUg==@nongnu.org
X-Gm-Message-State: AOJu0Yy0bdbDgmOG9oI9nVtrDq/2ihybbwJGfz2codVFvbpaJaS0NLem
 sswnCVaq7l6StoILDJcUsDrGUQwlUo/iEE171mJrEK+ZZezX4YP40LXhpylg4mWRZsbNxafO1hX
 niwglSYYhtPnJ7X7V1i2o19WXzBNx48aBbqq+SjkAeFBQsUZB3YbfTWM=
X-Gm-Gg: Acq92OGora8/yD5n0fgw2MPWgHYHycEquiw1ENS5IlYjZUSn/4LVbzPye+pqFG5kSvG
 ZChhJ8AjkHYXpdyHgQMhyvPvgmAaEGanMd+4Mbg9fuxArR60z9SYXkYkQ4iIXQXCmhQCifHPQwe
 9P1O5rQzLUuAE6nSG64tSFR8sIZRcYdpx/vNs1C0PUPyaVAXCTSVFHJfrmCj3Z497fOKsSOZeIF
 /im+6whjS/QrmTqS+pxfez6+ye2qlZ/9y2Jz6giNW/7cftntpWmLuQazS8YZrtjwdgB9IHunmW9
 qhU7GzIkPSJ0qvPub6C3/Tq/3qDc8AEqJdDqeL+HOeHUbvbNB8tRwT8l3Q3DAtHxBwNEHA9h5w2
 x836KVasF3AW+ZcKCoGZLR7OW/5VAFbNKdOhnkX1byGMONl4ZzZ/0sweFLuWTFCyGsp1P1n8tSg
 ==
X-Received: by 2002:a05:622a:1811:b0:50d:9e8d:9837 with SMTP id
 d75a77b69052e-517959d5454mr340518151cf.11.1781080465347; 
 Wed, 10 Jun 2026 01:34:25 -0700 (PDT)
X-Received: by 2002:a05:622a:1811:b0:50d:9e8d:9837 with SMTP id
 d75a77b69052e-517959d5454mr340517741cf.11.1781080464842; 
 Wed, 10 Jun 2026 01:34:24 -0700 (PDT)
Received: from [10.156.84.244] (49.170.88.92.rev.sfr.net. [92.88.170.49])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-bf051770994sm1167552166b.13.2026.06.10.01.34.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 10 Jun 2026 01:34:24 -0700 (PDT)
Message-ID: <463f2096-560f-4551-bc12-41732c1e6288@oss.qualcomm.com>
Date: Wed, 10 Jun 2026 10:34:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 14/27] tests/tcg/meson.build: add default flag for testing
 compiler support
Content-Language: en-US
To: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>, qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Manos Pitsidianakis <manos.pitsidianakis@linaro.org>,
 =?UTF-8?Q?Daniel_P_=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-arm@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Alexandre Iooss <erdnaxe@crans.org>, Peter Maydell
 <peter.maydell@linaro.org>, Gustavo Romero <gustavo.romero@linaro.org>
References: <20260609214745.772536-1-pierrick.bouvier@oss.qualcomm.com>
 <20260609214745.772536-15-pierrick.bouvier@oss.qualcomm.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
In-Reply-To: <20260609214745.772536-15-pierrick.bouvier@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=GoFyPE1C c=1 sm=1 tr=0 ts=6a292191 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=YLXAUxGLE6hMr2F5uSHVqQ==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=1tSEMpTH9XP_W59IOagA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=VxAk22fqlfwA:10 a=zgiPjhLxNE0A:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-ORIG-GUID: zSUNgAU1HHHOguHbB85t0Kj_cln90xm7
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjEwMDA4MCBTYWx0ZWRfXzWD9i1CnO4lG
 yVtSJm64+dmwfb7qdPeuZtDR4RX4Aw2mEJfTOa5AnKtt5j/a4mad/vrwuu659zwiw02AGFALk3b
 zm1segxRBjL610jgrBascGywXJ5SDO8A/63lIJybMVJSzSi75/GiB9l2pCRssdIzU55KdAOFVA9
 u5U3RCjhdNnXi5ZzGlZYKVUsnNRYMLd3WTwfpATb+VzKwMW67fQBjT/AfjFf8Zkkr0gmYtzPLVJ
 Na4ZQYw6KF9XxyQhuBGkuPxhlROzq7UGU8gk3ICqb2OJG4Rgriu+WVyoX+D6AwncQ5YxbaToOYo
 kd0u2xEkzzoSZBZh9xSEugUK0G4/gjomScJNCFmF2MB0umD1SteDyNacMgvVOqptqH9s67+4b+/
 dReqpgACuxcfLfOSusgjX2/t8fotARlTpcmGtUYKRpZX4kMgjJBgD9qFufRD3uINQHoqQETTk7/
 aKnHH7/jSg47+iFOZeg==
X-Proofpoint-GUID: zSUNgAU1HHHOguHbB85t0Kj_cln90xm7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-10_02,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 impostorscore=0 priorityscore=1501
 suspectscore=0 adultscore=0 clxscore=1015 spamscore=0 phishscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606100080
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
X-Mailman-Approved-At: Wed, 10 Jun 2026 08:36:17 -0400
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

On 9/6/26 23:47, Pierrick Bouvier wrote:
> This global variable can be used as cflags when checking if a compiler
> supports specific flags.
> 
> Signed-off-by: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
> ---
>   tests/tcg/meson.build | 1 +
>   1 file changed, 1 insertion(+)

Reviewed-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>

