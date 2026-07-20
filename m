Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACE4AC44524
	for <qemu-arm@archiver.kernel.org>; Mon, 20 Jul 2026 08:41:08 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wljYU-0005E5-8O; Mon, 20 Jul 2026 04:40:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wljYT-0005Dj-49
 for qemu-arm@nongnu.org; Mon, 20 Jul 2026 04:40:53 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wljYR-0003OD-L5
 for qemu-arm@nongnu.org; Mon, 20 Jul 2026 04:40:52 -0400
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 66K7YEY12043804
 for <qemu-arm@nongnu.org>; Mon, 20 Jul 2026 08:40:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 L0oNE6+duxQAcJ50aEgbhzeLujnpIgklrwRnZa1EXBo=; b=bU51+rtGtqoSp6bz
 elfFK9VfeCeLSEXFFtPoUXX6zNPE4+byfZ1V2yYyVCfzOJX5TyhkbGRTfGX94P4C
 La0V+j3/A+2/KA84hU0bbmtQo3gDFt8MFQVz6HDnQQ8HWST8FQGCjsUgOR1ZAI84
 0LnKHHRyzPHAB9W8zu6haBd/BCcAPJTiWb2OQFLHlQIYIv35ruNa96Wv+gXjBZnm
 kz+klN9XLyYBdBZxnf6/Zh1s0o/pmZfO9I3/QM89kGk91IZGP01iQAFLnAh4uVlu
 wxdd2Z7ZnubXIsn3rHgTfGzZiuU2dN2beRaJIwN6AcuhVoFfL2qARZCC6Brm2o1c
 TQAxEw==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fhfdcg7w6-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Mon, 20 Jul 2026 08:40:44 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id
 d75a77b69052e-522de3c645dso48681141cf.3
 for <qemu-arm@nongnu.org>; Mon, 20 Jul 2026 01:40:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1784536843; x=1785141643; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=L0oNE6+duxQAcJ50aEgbhzeLujnpIgklrwRnZa1EXBo=;
 b=PfOD84NGCphWmpojdXrJrfkBCV34o00w8lp1bIC/hpecm2TYRdGjW4Mi0nO+u1zvCN
 XKqRLYO0tBvq+keZC/eYLSh6MnmHh6QbixbsDD/J7bodfJn7Ho39Luoe8CDqHZgX7v7b
 8SYEdA1IviTzlvzFVvy8TQv5N1BnQgMKjtnbSAceRUdJBHaPm+Il6GQP3c49yR1Wcenc
 VHEVlgPFKnwKPqgUbS7rAEKXv2SeJCtbhaXnx/cS6IHH0JxGXhaHES/R8AFg82PgJAEH
 c8GGYmaYxYx3kvYRTTg8pnVvcgWHxoGmINOyZS98XpdR2Gt/EykjlPKyiBwWJwNBuP9Q
 snBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1784536843; x=1785141643;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=L0oNE6+duxQAcJ50aEgbhzeLujnpIgklrwRnZa1EXBo=;
 b=hdEVRk5vqTkUAtwNFQhwbXPChpHlqFZSmAGh1YKviydIzIwvUJoTmDgk1sQPeoq/de
 OKEHkGHzDPvhp7n8p27yF4pUZrKOJy9R158o5ZTah6cpK98bn23kP40f4d9nopVOCavY
 Y8/hgdCV+z0cESBpJENYM+74WxdiKf5savth/77v2rc+2ziew8tT2lbEIkxeXDDjR5kX
 q9falz8XSlAg2kIOTSf++UDeb3wjxv3XkUKh/Zo+WgknRKMg6enuIu1+HCMU0Oc8d4wJ
 rmcma2+do7K8dvfHYY6niAghKbTDhX7uYGAeTzZIQ2uur6cAr12884ohlBEHPPFrmOnK
 ZtHw==
X-Gm-Message-State: AOJu0Yyn9J9EtK0MMrlAWxhuwL2wD2v2Nx6ESH3YkYaO3S3jTZCsHNMB
 qlZ1uK9A0WreNuNxCsQFB0aF6M7F9bUeitV8nPmYcBOmYJdpBCSpM7meYmK0sbPi+FH8ZBMvW83
 Slltovf9YR765skHdqVAYfgSKrXs5LU9XmXab+5CDzQiomM5knQWf2Ho=
X-Gm-Gg: AfdE7cknspl3oUYy5++4t1NZ5dx2kU2UQ4QaucDeR/VteGjX9KlfRDDsKtmIX9Vyw31
 LUHBpQXTCdW6S6QdjvLpGWkUC5jiAxzgy0BtZsJakUzGrQQ0Jxy2xjLxmwkf1mRsIeegtLwUoC/
 OI/24a1qjG/AXW00RZSx/lVTDPfCnUM43ZJnvyDvkkE7brvHgC9pJwDo3IzoJvMFVOCB0HScrE3
 6DW1yZVdUf/hSHa961/9CGkGHsfGo73N0abGqSS/yQudIsgG12iBWDEtT37pSML+vbt7rMdLKOE
 fDP7NfQqxxedwa745UqlB+nCTClvJ8xw5eBGp1eElKv4hcYJInYpj6XK64YHRTeaOFhwGxqX9g+
 xVxJb8KUq8PUUp1vYal+2lTUhe9N+NPEHfA0ejLVe+KyxYcgGHSs=
X-Received: by 2002:ac8:598c:0:b0:51b:e92f:ec5 with SMTP id
 d75a77b69052e-5213a385911mr137223111cf.3.1784536843524; 
 Mon, 20 Jul 2026 01:40:43 -0700 (PDT)
X-Received: by 2002:ac8:598c:0:b0:51b:e92f:ec5 with SMTP id
 d75a77b69052e-5213a385911mr137222991cf.3.1784536843164; 
 Mon, 20 Jul 2026 01:40:43 -0700 (PDT)
Received: from [192.168.69.219] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-47f63ed244asm26746564f8f.20.2026.07.20.01.40.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 20 Jul 2026 01:40:42 -0700 (PDT)
Message-ID: <17becc5a-233f-454c-8c4c-c89ab2beaee9@oss.qualcomm.com>
Date: Mon, 20 Jul 2026 10:40:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 11/17] target/arm: Expand dczid_bs in DisasContext
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
References: <20260717232306.378988-1-richard.henderson@linaro.org>
 <20260717232306.378988-13-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
In-Reply-To: <20260717232306.378988-13-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: 6eKublV3JHjuUjTKQaE288jiC7jr7egS
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIwMDA5NSBTYWx0ZWRfX3AIBrEqd0QhU
 Po+IYOQSUo+JrM1qZOsQ3qpV15eG8hIkUKRBFhtkMCXUMeRvZSng+gZsbaE2a1JU13I707EZ3j0
 DKpkSTHbtyVUHz9CcNxLL2IyNZlqkRN3KsxcAFIoY+N11dpc6zh0YDecxGjTGjIy8tFf3Yvo2Qd
 GXnMU7VgoKcWBIwhGk+115g3z60q0W7aXtm4ireHM6oOTF2fhUHWzxgHeb/lbM7VD2tJDzSm7aL
 WftvSoVQBUlty6Q8D3NtQncpCXqdXN0Mr2NKJyyZYGcbNvCbnRSc4gx05NFvPq71DtJIE854xft
 eU1v/hOKKkBo59Kdwjl/79hV4Y8IZxQAS1foaDs4nILG9TetokMt12mjo73B5Tp85OYgU58XebD
 lwEeCGzQEhfl/HOlksW4NljUzOrnR3Lj54wx1YQw/YyUBcU5c6z+gSomKYBMJtX8xh7UYhpaRNY
 PkFQBh7s6rOyTIcTqrg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIwMDA5NSBTYWx0ZWRfX363CwzKZbNIW
 pMuVFZKrYjpP/aIP0bH8kbynx6fo4ypUOCl3PNCDElqI054L5N+KknAlMuCM6PbOLSVuxGrsaeu
 kceK4MdKChduYzR1DsBqFpaCZqKjQ7o=
X-Proofpoint-GUID: 6eKublV3JHjuUjTKQaE288jiC7jr7egS
X-Authority-Analysis: v=2.4 cv=bv58wkai c=1 sm=1 tr=0 ts=6a5ddf0c cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=1tSEMpTH9XP_W59IOagA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-20_01,2026-07-17_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 priorityscore=1501 spamscore=0 malwarescore=0
 phishscore=0 lowpriorityscore=0 clxscore=1015 suspectscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607200095
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

On 18/7/26 01:22, Richard Henderson wrote:
> Store the true blocksize, not the encoding.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   target/arm/tcg/translate.h     | 4 ++--
>   target/arm/tcg/translate-a64.c | 5 ++---
>   2 files changed, 4 insertions(+), 5 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>

