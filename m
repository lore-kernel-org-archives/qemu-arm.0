Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E30CACD6E4A
	for <qemu-arm@archiver.kernel.org>; Fri, 29 May 2026 18:39:17 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wT26X-00088U-8R; Fri, 29 May 2026 14:38:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@oss.qualcomm.com>)
 id 1wT26E-0007wg-Q1
 for qemu-arm@nongnu.org; Fri, 29 May 2026 14:38:30 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@oss.qualcomm.com>)
 id 1wT26B-0001cG-IN
 for qemu-arm@nongnu.org; Fri, 29 May 2026 14:38:25 -0400
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 64TI2LAu120501
 for <qemu-arm@nongnu.org>; Fri, 29 May 2026 18:38:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 qu6dr6kFW3wuBHlsRpljUoTZoNPGCNwbOjajcP/koUI=; b=PLq+NDF8T/m4cGIC
 hannQkkSQDlnNJfi+xc2N0Mvl7l0RN0lrF4v9/UL5h40v/+EgmbIbsY3Jf3DuX9r
 4/pfck0UdAtbqE/KVyOd9XgDaxE9suRivtiU5xespvIBnbYDbDz8ccfw2pRgGyc2
 pIGkWGqpTz9AVCPGb97l+PYiU1G7r5pjJuEEHhn0862ZZ6gKOdbZOEtfP06cjtlG
 Eku4VpzGsa2spLDWWerpoHeINpreDLqH4L+gfvTT5PE8G0Cejr32LvIDoPPMGZoz
 AQgjQCoLc3a1L1IM2IPI77ExhrRX95wdtta0ZQ0FGBBAe/TsxVh6Z5CRrDQ/TJnn
 ndb9wQ==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com
 [74.125.82.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eety5x4tw-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Fri, 29 May 2026 18:38:08 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id
 5a478bee46e88-304f23c55b2so862267eec.0
 for <qemu-arm@nongnu.org>; Fri, 29 May 2026 11:38:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1780079888; x=1780684688; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=qu6dr6kFW3wuBHlsRpljUoTZoNPGCNwbOjajcP/koUI=;
 b=MkEKW0WtKV9oxXmFom09UDduNVF1c5lVIEEnwItLyn3vj71+wIfCMI7Z6YFDKmgD8O
 vplvdKt/axDiKdE0npBVZ5kA7DEYmUHuzCF5KCZMHIhULipWiSAR8kIuHRaL+5MZidVb
 kU3KRYeT4JsY0wCYEd9p3HJKp1lop7BOFI0VPTLOhPMbx1PiVpgYDfUUgvgLMjZEkWQG
 YMA7SwLzMycDvmYIn15WzE7DhYq0TAUu2hnr9LGQOopz04sZEPEXmSDt+xRW7fFE2ibu
 U03lUWDnXWUH7Puivn+1kzPWF1HkNyRd52Rd79yB1sRoInN7PCWQt8Pwx3jVXJ7MhZnr
 i2Zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780079888; x=1780684688;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=qu6dr6kFW3wuBHlsRpljUoTZoNPGCNwbOjajcP/koUI=;
 b=G66GXZRKt9tkorrp7E1rgkBoRUEFP+Xuf4MI40QW80McHk+faMjb5UspWKiPvkguQo
 K88/3zE0Aw8SHA/yVMmlNAxN4QuCYAD9Byur/i9uJICRO+8OC0KBUMohn4KhBWxjeWez
 2V3rtmitOg6wfVB9ZFZ/XWnqOXM/NkDlGibpIKprHVS4NNCNmL2WZcCGTDX+vWuWryAV
 BHI9XeV5BvJBTPXaoFsN+ZvvKQ4ZS/ZPGHAsxlT7BgWRiLKpYaLSCx+pA3hSv1GdEEWQ
 kuvHfmnzNkGBLn0OH2ycVkjvJvY/kR0xtmuiC/EN3rJ2DZRylqdbV8nwrUNGLCyXzx2+
 T4Cg==
X-Forwarded-Encrypted: i=1;
 AFNElJ9n/52nBsKdARhgTgDTXWXkIXZyfAkYN7cy8oXV+VT6Avmf18q+npCQ7yloyro/ad/nlKA11YguAg==@nongnu.org
X-Gm-Message-State: AOJu0YxfA+OwoeVuV3RPuyXPGE7E9DR5H8HQaiP8wlXZnjS8AS8Hi0Kz
 Emwd/t3hjUg7OsImYlnz61/+npxvKAjGjsocRsmgriN3gsyEwlezRFj6556A02tMiv62r2diEds
 hAEvkIJ72g1eKlrJ1uRzv7CVi8i5xRPGxAOEklmoqVOZNT6JgKcm4Nog=
X-Gm-Gg: Acq92OG5VGuj7+xKJo+QLLds0ssiPOhf0W5mUpot+3b9DwMzJgfPduZR741Z3M0nPSe
 g48Gs08VQRQ6qLa6DGhWJqCy/UfUtKFl5PNymfL2csZFha+vGK1O7jpybOiEZ2dm4qxV1Kqw1OW
 E4YHtIr5edQRhpKC9H5Ko6rKos3o7Lk7OVlGK+h4doK1SWIhjf8sc49BIayY0nnTLjREEC3h0ki
 QfRE3aopgY3s+fyP22pEd5963MWkKtzGQwJpspOAZEJvc62Tbhm4412wlpzqKNIuJFLlU6U5GSB
 YhtUwczZnbSubX0U+mp9cx6yzLU9CKdrgbTsM/nOSH5ZjunYl8H494E7H1hcS7KXmOuilsqK3pw
 TnKqRuKgF/L9+34rC/AyQRqpsdYelUKstZ8tw/nVDHZotZJj7LMFGUmmrzPv9YgyQ6KdTAsf4si
 5itFKY+ECpvlQ3zFsXRRbDAjWy
X-Received: by 2002:a05:7301:100a:b0:304:dbcc:5809 with SMTP id
 5a478bee46e88-304fa6e71b3mr502265eec.31.1780079887508; 
 Fri, 29 May 2026 11:38:07 -0700 (PDT)
X-Received: by 2002:a05:7301:100a:b0:304:dbcc:5809 with SMTP id
 5a478bee46e88-304fa6e71b3mr502228eec.31.1780079887020; 
 Fri, 29 May 2026 11:38:07 -0700 (PDT)
Received: from [192.168.1.170] (216-71-219-44.dyn.novuscom.net.
 [216.71.219.44]) by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-304ed578c48sm1982340eec.20.2026.05.29.11.38.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 29 May 2026 11:38:06 -0700 (PDT)
Message-ID: <0b095216-411d-4bb2-8b76-2dd8169cf330@oss.qualcomm.com>
Date: Fri, 29 May 2026 11:38:04 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 13/17] accel/tcg: Convert AccelCPUClass -> new
 TCGCPUOps::cpu_realize
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Reinoud Zandijk <reinoud@netbsd.org>,
 Pedro Barbuda <pbarbuda@microsoft.com>,
 Nicholas Piggin <npiggin@gmail.com>,
 Glenn Miles <milesg@linux.ibm.com>, Alexander Graf <agraf@csgraf.de>,
 Peter Maydell <peter.maydell@linaro.org>,
 Marcelo Tosatti <mtosatti@redhat.com>, qemu-arm@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>,
 Roman Bolshakov <rbolshakov@ddn.com>, Anton Johansson <anjo@rev.ng>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@mailo.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Song Gao <gaosong@loongson.cn>,
 qemu-riscv@nongnu.org, Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Harsh Prateek Bora <harshpb@linux.ibm.com>,
 Phil Dennis-Jordan <phil@philjordan.eu>,
 Alistair Francis <alistair.francis@wdc.com>, qemu-ppc@nongnu.org,
 Weiwei Li <liwei1518@gmail.com>, Chao Liu <chao.liu.zevorn@gmail.com>,
 kvm@vger.kernel.org, Claudio Fontana <cfontana@suse.de>,
 Chinmay Rath <rathc@linux.ibm.com>,
 Mohamed Mediouni <mohamed@unpredictable.fr>
References: <20260529142434.87880-1-philmd@linaro.org>
 <20260529142434.87880-14-philmd@linaro.org>
From: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260529142434.87880-14-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: 8wLgRF8CIzwil85JAhlpGblTFr3IiaWl
X-Authority-Analysis: v=2.4 cv=TeqmcxQh c=1 sm=1 tr=0 ts=6a19dd10 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=iLqgmErQAxjCjdq5jj1Aqg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=RhbWdbH4l8ml5Vp1eOsA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=PxkB5W3o20Ba91AHUih5:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: 8wLgRF8CIzwil85JAhlpGblTFr3IiaWl
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI5MDE4NiBTYWx0ZWRfX1/jww9Da1+G6
 GcnV3y6EDWC1lYBVpuHn/g1YTXimnjrAeKyBHcNCFLn9QjabJOk1ARJ8BgWgKW/WaFvA7scC7Oo
 ZsKfZYnCYJhNZHT9P7WvJN+G5yAZmS6zR6bhSp5RCien1bGkIn0mxiwRtznbDF+zetKjcLgajWP
 CRfH6bTa1/X7paLEArgpe6tnE0jmZHcsFOiYCnebjtOzcc6+AZLmMILc/ujfy8pMPiwezwMzvVJ
 BFNd8jLeUxXR5F07JAfAzUkBu+BYXyC6WcuRD9Uypkhu/vAi8mw7erL4PrRMa1y1aQe5xcNx5d0
 YWvHLmZlDGFpjp84kE7kLKIPAKNT3MS1pRPPmpkIr+QeSQ7Eodi3N7o/G/UJWuua/eEjXeBxqPU
 yV0wHhO3Uc2B52YX1UG1Jdp2fu3dx+8Rsx1+ejzUUbuida2y/+SwYva8jn3cGEIvxpwwV3+4sVo
 MFiQuqdvQ5iVhzV/yGw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-29_05,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 clxscore=1015 lowpriorityscore=0
 spamscore=0 suspectscore=0 bulkscore=0 malwarescore=0 adultscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2605290186
Received-SPF: pass client-ip=205.220.180.131;
 envelope-from=pierrick.bouvier@oss.qualcomm.com;
 helo=mx0b-0031df01.pphosted.com
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

On 5/29/2026 7:24 AM, Philippe Mathieu-Daudé wrote:
> Introduce a TCGCPUOps::cpu_realize hook and call it at
> the end of tcg_exec_realizefn().
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>  include/accel/tcg/cpu-ops.h | 1 +
>  accel/tcg/cpu-exec.c        | 6 +++++-
>  2 files changed, 6 insertions(+), 1 deletion(-)
> 

Reviewed-by: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>

