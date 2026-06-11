Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F20FCD98CC
	for <qemu-arm@archiver.kernel.org>; Thu, 11 Jun 2026 11:21:02 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wXdSf-0000Jm-5m; Thu, 11 Jun 2026 07:20:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wXdSd-0000JH-Hz
 for qemu-arm@nongnu.org; Thu, 11 Jun 2026 07:20:35 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wXdSc-0007qs-1V
 for qemu-arm@nongnu.org; Thu, 11 Jun 2026 07:20:35 -0400
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 65BA1olh271437
 for <qemu-arm@nongnu.org>; Thu, 11 Jun 2026 11:20:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 AD/Q7/2636o3hlObJyzSqNEjXF0nwYvyi+Igpex9TlQ=; b=WWdnyq84GjpkYHad
 GGWfq3qyW2tV83c3aYdK1w1hSYVM72VM7rxPRKX2teKuxdsx7Hc3niZs1M0+seJm
 hj7AOvmjFYHd0bGaASSwoiScPG9GBmGIyt3WSTxs8xY25gV8zmcbwFtWwYvErRF/
 2zg/B1tJseN7FAqYkKekPJSQF/JeIIou8YuD23jjfjJtv8Q8EQR18zngE9zS/URP
 4+tAO2QawPZsGC5NY1MIKf/Od2jyxXPSDTBClhcynRIRs88lBmXC13rxGkMwLVUt
 zTEzfcsDZoX5i1TZpNPZ3ia87+0jBf19/3FOHPvn87JtUT0GEqV3RgbtljuHoDwH
 +ky/YQ==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com
 [209.85.217.69])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eqe71k7dp-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Thu, 11 Jun 2026 11:20:30 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id
 ada2fe7eead31-6c33d75153dso2977726137.0
 for <qemu-arm@nongnu.org>; Thu, 11 Jun 2026 04:20:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1781176830; x=1781781630; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=AD/Q7/2636o3hlObJyzSqNEjXF0nwYvyi+Igpex9TlQ=;
 b=HIEjC/DTDcwk1t5wbEwp27BRt0BOheVcGtQJDwmhDG7yWxtHQJtLwfFY/r20u2B4g4
 E7dMlyDmplnTjT416L/nbVlzxYzZZtLwsxsind2H15YoX7z+abU6y4s+oW3QZA4LkYEp
 cXVecYL1VWoK19f5NIkK7HWkBFO2+ynlkgghf82Ce3KEeBb8h8wGreW+/NQH3K1wZKDc
 W/a5NiaIePLxfD4aZR05Bj0tQtMUDJSxGvq4JCpCBqpHjGsjx8Kv9EZ9ydBoMDRg4/+2
 79lZOgTe326YJ0qILBjEckYYK/SSBlqHtubtLBHMIzSa9359l1nI2zjhQfgVLqMXuXfS
 l7zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781176830; x=1781781630;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=AD/Q7/2636o3hlObJyzSqNEjXF0nwYvyi+Igpex9TlQ=;
 b=Sx9ouPIHxAAPeJ/zyyX9AIwenoWy0l80XW2+anPleopL3nWZMHk1W0/mv9jwVNf+6Q
 uX/Tru+3qLfC7NlyJjMt1XAY7XOWLK6tfOaggL+OaIKGEIaebT2E8g0NakLfR75sfwQx
 ARMXi2LuDFpYCj95zfP0cEuZA5a7Ra6bAgTYQrTdbHuG4MT7AI606osx8uGoEMz02YJB
 TxCiZgfDtfd0hKwW8eTusTUx/O7HEngGZAIe4uci7z4dD777LZkzVUAdZoJRoNk5KTtE
 Kdy2JCU565aJx/68pNiGdVaptI8ns4sJYcUol4Ge/HVMB8j8umR8wSJJtQEgnWY+atD8
 VdmA==
X-Forwarded-Encrypted: i=1;
 AFNElJ96GR0JnCVw7EWVCgXDiwQT5F4nEagP9oHp0hp+FHPNcFnpMibZVxmI/CXrzxqJWBXGYUD9r71vXA==@nongnu.org
X-Gm-Message-State: AOJu0YyLaDddEvH1J1f/Ctv0bziirg5AcRYQHFXt+BhYebWFqMdIFDE0
 tUWacHad+zcWsz0OU4aNuNRMxGTEoJJHVrvjyFfu4WAMqXI+qR758mEVuDSE0W7UZo6afYJd+LE
 mQtXTd/CEBFJkpuKt2ffLhlrHwQYsQ2oDZwYKpX1jBy43v1D8/95+FiI=
X-Gm-Gg: Acq92OG0IMwwdyBTI2L0NOu4f3+VLQaqwXnGu7pewXXf/6+WXhz2LaqPcln28kcRxlb
 Ui0RCqIYK3WKfukXpDr0ZWZt1csfBYvuFqPfcGG/jm5TnGiKKm+VWMaEEIlKDrwYjVaQTVK34NC
 p1K+h1trwIq7VNiNrYXI/xQb+QE9Df/gnwpV//E3F3G7E6O4+nClrUmk4qcsQWKmpHMqDWBO+Ev
 LDID1z0697oWOH6StIZ9f6WQNkrRsdUoVF++sv5TlkqhtpkaRP4XI6JtnjINBkYJB6IX61IBZGs
 Jh5W3z8cNxdFdNeKX6XwmDZ4DWXqnInKjJAhv/lofPCVofUmcinkNWhFAE1tHsEjSNxBF6FjiYW
 USkEMRY8vC5xHLBnxxRch8pcPVMhYfdTG4DOO9hFp9dhBY4Xxfe5L3m6UtI5NyVIiTjqZyFQdCU
 lguzQ3CDQ8rFot
X-Received: by 2002:a05:6102:a51:b0:62f:34db:9474 with SMTP id
 ada2fe7eead31-71d5f9c6774mr701231137.20.1781176830109; 
 Thu, 11 Jun 2026 04:20:30 -0700 (PDT)
X-Received: by 2002:a05:6102:a51:b0:62f:34db:9474 with SMTP id
 ada2fe7eead31-71d5f9c6774mr701211137.20.1781176829620; 
 Thu, 11 Jun 2026 04:20:29 -0700 (PDT)
Received: from [192.168.69.208] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-490e2c9057bsm67424305e9.5.2026.06.11.04.20.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 11 Jun 2026 04:20:28 -0700 (PDT)
Message-ID: <63c62a8e-2ff0-4175-be70-0aecd13c406c@oss.qualcomm.com>
Date: Thu, 11 Jun 2026 13:20:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 01/22] hmp-commands.hx: fix button_state doc
Content-Language: en-US
To: =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>,
 qemu-devel@nongnu.org
Cc: "Dr. David Alan Gilbert" <dave@treblig.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Jan Kiszka <jan.kiszka@web.de>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-ppc@nongnu.org,
 Thomas Huth <th.huth+qemu@posteo.eu>
References: <20260610-ui-input-v2-0-f68452dd6a22@redhat.com>
 <20260610-ui-input-v2-1-f68452dd6a22@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
In-Reply-To: <20260610-ui-input-v2-1-f68452dd6a22@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: 4ZY8PfKMPiDjTCFdNd7Qrl6tpFnlP9yQ
X-Proofpoint-GUID: 4ZY8PfKMPiDjTCFdNd7Qrl6tpFnlP9yQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjExMDExMyBTYWx0ZWRfX+mUWDS0p67t9
 8/CL/Vm83p2QD9PKR4iDgbcWURU2RNFN/21WDC2aes43ruOC/lx8Z0gkjB34SYRmWs6nlIeoa7m
 6XTneumAHQ2LYiqyUvWdHGtk1NHdTrmOnYHBNJNxX7n9TedGDsDVtuZsW0sYCIXkcm1CouYqjqi
 gw0wpvAJiHOAaxSAON1nhLEBWPOcoiku/yqaHyeMEuQYlhIPFzBBSexFMRXRaokr3IjxTwfwaki
 bzkNJz7ZdRfTeZgPddMYbtWoKbWWdqiOtpdHaeJcQKeYM230G+0bDd548hkZ9p/aOPOBjfHlyN+
 I4uFnR89bDVgpMkWK4MRTInQ2294YNhw5IzvtDxtBzLHYxQcbIuwOlaC4dODrNDY4UhovIq4sYg
 WYJgG/DAQYAUKn2CCZVQCbetIgJXGHXakbgwd1NQiw1BlqsL1apZ7dC0YvmRGEha4MAxy4bpr+A
 n57DP75kdzQXRwr1d9w==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjExMDExMyBTYWx0ZWRfX7BLIAp+EckKc
 +zKCWuFco2Ero7HaDUn0TaSc1pBHsIVx28sbT7c4aCKWJwu4Y3jBD2smbaQd6rU605QgI/kP8/5
 EnSthxdYiQZ48n62K/rPML5DB1Eocfg=
X-Authority-Analysis: v=2.4 cv=Lf0MLDfi c=1 sm=1 tr=0 ts=6a2a99fe cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=3WJfbomfAAAA:8 a=20KFwNOVAAAA:8 a=EUspDBNiAAAA:8 a=1tSEMpTH9XP_W59IOagA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=gYDTvv6II1OnSo0itH1n:22
 a=1cNuO-ABBywtgFSQhe9S:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-11_02,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 spamscore=0 lowpriorityscore=0 malwarescore=0
 suspectscore=0 phishscore=0 clxscore=1015 bulkscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606110113
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

On 10/6/26 12:56, Marc-André Lureau wrote:
> Right & middle buttons are inverted (see hmp_mouse_button)
> 
> Acked-by: Dr. David Alan Gilbert <dave@treblig.org>
> Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
> ---
>   hmp-commands.hx | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>

