Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63B32CD4F54
	for <qemu-arm@archiver.kernel.org>; Fri, 29 May 2026 18:30:51 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wT1yc-0000SG-8t; Fri, 29 May 2026 14:30:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@oss.qualcomm.com>)
 id 1wT1yM-0000B5-SO
 for qemu-arm@nongnu.org; Fri, 29 May 2026 14:30:26 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@oss.qualcomm.com>)
 id 1wT1yJ-0007PS-T0
 for qemu-arm@nongnu.org; Fri, 29 May 2026 14:30:18 -0400
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 64TI2dSM1863872
 for <qemu-arm@nongnu.org>; Fri, 29 May 2026 18:30:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 WVa12isQ6aEb9mJ/d1cwSJ+qKvKQJLYVeyR/ltxHKsM=; b=GsjShRk7u7YK67Ct
 ZkrYRssXZvfIlyBagnRiTa2izPqbZADPM8JyAtjJS9k4TkLkO+D7l8tvDM3aTp3L
 tZTa765Erlf0W6GNRA+7CVO9hB6qNOL4FZ/ShMyavbXcdxJxCDnRvlcLjMrsWI28
 Tz6bPLVucwsv4h2zF/PH5udFCiiCrEaAONGsZ9prp1HvbQff0CDVARQ+j3DBULaw
 AZDc5yfz85JwXD93xB9G3dkhtxpHKw6zcTj8tbnCjZP60zZEmVpbhuiCS87lH+3g
 oMegk60w0qPZCa/6ZpD06YjcdI50HDcZDrdcAmqCn9qO2Ek8HVSuVAkIsnG0b5lh
 o9Z5Ow==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com
 [74.125.82.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ef3te3v67-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Fri, 29 May 2026 18:30:13 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id
 5a478bee46e88-304dd917645so1824099eec.1
 for <qemu-arm@nongnu.org>; Fri, 29 May 2026 11:30:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1780079413; x=1780684213; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=WVa12isQ6aEb9mJ/d1cwSJ+qKvKQJLYVeyR/ltxHKsM=;
 b=ZTR8ExgzRCZX18AMCl2w8LtNk/IQrc0Fom8s3m3KSsdV39t9UsZnj+YAICbUnyt8wD
 a20M97d2/4NKttXGj9LxASYFuf4rU59iL8LfpIVjMpxJavYAM5MENHg6/WA5am/2GVAd
 ZeSCw7RU9zPn0S+8g+7CnahtPYpv2k2oiEmESFGMGGawftrou1X9yJ3bt6IGj9K/nxiI
 HKVsV31UoIZQaDMVKuiZ6GRT93hGADT9sTIg2jzHvoxGBS7x6dIbW1VaVBFDvjxzz/77
 jihZAyjFvzF5k4tUqats3+gnvYdruYytkwjZihad60XDgYJsTmJdhjgG4bGNz7O+eWqJ
 JUGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780079413; x=1780684213;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=WVa12isQ6aEb9mJ/d1cwSJ+qKvKQJLYVeyR/ltxHKsM=;
 b=gBxKC13jefsmX8t4GLjdE4ll7H+ETyepWsmigOj4f7QSgDP+9pR1+UMcI2BwomROnV
 pqrQUvZsJsJK0fxKzsPUwimusFHq+yvIr5YIYvrD5UavuU1+7pxgragtVCmqscbmLa7Y
 Hpy3n77sd+SWCCVsJXzmFJD0qXLfwVts7dg9G/HL2kRy/LpSvY8+qvGE01nTQLrY5opG
 amvMUXQh0Cv1txwcRgzK9W903RfuPkbD/28vKwLEn4ay643f60+aavQ4d2Hu3vNpAxbN
 6RjbRnotO6kTwgqR9V/gaKwSHfjQplPyP+PeuGqJ+wTyop0UFrbKhzabn2ZvrIpJUK1T
 m+Eg==
X-Forwarded-Encrypted: i=1;
 AFNElJ/3qBkuKeyW9KP/rmKY4KoVG9U7jSF/uM13ZMp4QQm7R0oZ2Yc7tOmFxWWrqSb90KsuWNIV9mavNQ==@nongnu.org
X-Gm-Message-State: AOJu0YxA23v2mvX4Ma4suhUELJh7IxJDiDG9IfGYSvTRPJWNnUD4CHEQ
 /KnJb7KP/iYW3087XfFwTq7zUz3XaO7k0Ee6f3bDFqhs/j/s27iX+9ShF2Y/ZFt/Yy6uXq8OvfU
 Dt6YCutt/IW0SzxeYrIRLRmr08oKOuLFbYzJ3Y2kWYzA55+uUuGr0m6k=
X-Gm-Gg: Acq92OFEQZLj+AoAkqart/eEHUYnw9n7ApsU6qmJ8h3jmQPj3zmlH2NS5e24ST+UvKS
 GRwMVkUUHLLkZiQJbZtWROHOMCPnQQZRnLLJuiCYFoS6sa5OAS4dqFoeVLi1U9WCW5ZnGFWNVM1
 kxiSbMrnWNCaiTErTetZLSZysQ0djpKJahE8LGLkQwp7ykjjIuuWa+uf5mUfa49C9ugLwpjQHTh
 fO9oAhEzK4HLOnG5Qi3o0mk1AmFWY7KAQ1TGNxHy1FatKDNLcJucisuX7ynipIIITo5b5l29pGM
 MEITBQ++0COBeSM7joP6jXnuIhP+xKCtMfWKuvdqx5OThzlvcBKcmXFByr+vVYvxvkMqgUrd7Hs
 /dFgFASivyQW6rMBMPsOr8G0M3Wv8+JodppL6TwawZV/h04gr/hS3ffVJOnk352IsrEISk8ckTL
 MiysyJyGDPmj4XgdPwpZ2D4wlM
X-Received: by 2002:a05:7301:290b:b0:2ed:e12:3769 with SMTP id
 5a478bee46e88-304fa6b6007mr531243eec.31.1780079412915; 
 Fri, 29 May 2026 11:30:12 -0700 (PDT)
X-Received: by 2002:a05:7301:290b:b0:2ed:e12:3769 with SMTP id
 5a478bee46e88-304fa6b6007mr531212eec.31.1780079412222; 
 Fri, 29 May 2026 11:30:12 -0700 (PDT)
Received: from [192.168.1.170] (216-71-219-44.dyn.novuscom.net.
 [216.71.219.44]) by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-304ed53f002sm2113454eec.18.2026.05.29.11.30.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 29 May 2026 11:30:11 -0700 (PDT)
Message-ID: <5a8cbc9c-1206-4140-ae91-235996f8374c@oss.qualcomm.com>
Date: Fri, 29 May 2026 11:30:09 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 02/17] accel: Remove AccelCPUClass::cpu_class_init()
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
 <20260529142434.87880-3-philmd@linaro.org>
From: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260529142434.87880-3-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: vl7rsq9MN46FbGClIzFdOqzlttLNB1gx
X-Proofpoint-GUID: vl7rsq9MN46FbGClIzFdOqzlttLNB1gx
X-Authority-Analysis: v=2.4 cv=daSwG3Xe c=1 sm=1 tr=0 ts=6a19db35 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=iLqgmErQAxjCjdq5jj1Aqg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=M4ieH9tDHB7thNhbP8AA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=bBxd6f-gb0O0v-kibOvt:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI5MDE4NCBTYWx0ZWRfX1PmIiYIwuFok
 pPEaRly98giDLZppTa8BQUpRbsogrxZ70eQvLABEzQQ94KIL9otdQ75yXqSjxUq+knnd07rSeT2
 VLxWiJBtTRs7k2uWRe3KnfhhSN0lPEKebvxWxk3KY5S0dqOVgqsHlGYmJXwo4Gy5bLRNjzsmaOq
 HDXYFuuVEBAqX1HNpeKMt7Hw+Vj/ImLQJ8WQEioA5E6gWjLz8zqXxDx6xY43CpbFB0u3N38wq+C
 5VejMrEbCYSFU9bOvg1Zf8sWhOfLzV1Jqn+hy0cYTqA+RoZqbPkyRdC2BcF3L1vTyHa81LKTmiZ
 tjq/N/idO2MlDzbD7ABBWrTPrLM0jdjCsiUozVZD79T+PDvC1ILyB3pBaaXIG5oQpb/qqcwplcz
 mhXVPjyc24+SBXhO3+btzqLfhH4ed381kYdra5oMIuQZ2+G8oSuMKkVr9QB0OFtxSxDa6p8qhYb
 Kj2EBfZ24okOLhWgx2Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-29_05,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 priorityscore=1501 impostorscore=0 suspectscore=0
 clxscore=1015 spamscore=0 phishscore=0 lowpriorityscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2605290184
Received-SPF: pass client-ip=205.220.168.131;
 envelope-from=pierrick.bouvier@oss.qualcomm.com;
 helo=mx0a-0031df01.pphosted.com
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
> Last implementation were removed in commits f50d0f335a6 and
> a522b04bb9c ("Remove AccelCPUClass::cpu_class_init need").
> Remove as dead code.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>  include/accel/accel-cpu.h |  1 -
>  accel/accel-common.c      | 33 ---------------------------------
>  2 files changed, 34 deletions(-)
> 

Reviewed-by: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>

