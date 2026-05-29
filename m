Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A444ACD4F54
	for <qemu-arm@archiver.kernel.org>; Fri, 29 May 2026 18:43:24 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wT2AS-0003Cu-Rs; Fri, 29 May 2026 14:42:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@oss.qualcomm.com>)
 id 1wT2A7-000373-P8
 for qemu-arm@nongnu.org; Fri, 29 May 2026 14:42:35 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@oss.qualcomm.com>)
 id 1wT2A3-0002o7-RX
 for qemu-arm@nongnu.org; Fri, 29 May 2026 14:42:26 -0400
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 64TI2Qo0313023
 for <qemu-arm@nongnu.org>; Fri, 29 May 2026 18:42:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 Pm+sHTslY8Xo7S6QxYIAKzzkMwpEb83HM+2t5OkXI/k=; b=PLAu1H3WR3+Czofn
 QrHCzXQ2rYrUSreW+oxBfFtM4v28YomEJePxyVlqK/N2v3CTq0v3IAUIdZjHjxGV
 HacDrXoXaj+8MeoXjddaHc14AEpm/xQrMnUPXa+y7X6eRbJgIrbLjx+teVYgeOLu
 Hzmo7LMRjWC5wLFdvHQZl2/sguDkLnh/B4tFgRNOrw1nZLtkZA98G6/DvSO7n4ax
 RDJ6Ze3B6xMH7a3lPngcJ8YW1umMQYBusC4nN2I4RBp+aiZ1Hrkok9AdQEW6hG1t
 4i5Z179jre67KbryQ3OXvuJN17s8jlPIeiCY9pNKk8PjF1n9k9e2F9ktgsr57NAs
 v1PSWA==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com
 [74.125.82.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eex6m57mc-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Fri, 29 May 2026 18:42:22 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id
 5a478bee46e88-304d8e9563eso526425eec.0
 for <qemu-arm@nongnu.org>; Fri, 29 May 2026 11:42:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1780080142; x=1780684942; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:content-language:references
 :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
 :cc:subject:date:message-id:reply-to;
 bh=Pm+sHTslY8Xo7S6QxYIAKzzkMwpEb83HM+2t5OkXI/k=;
 b=jUJc5aDKIw9kkvyv+MpHv41/c6jHszdb9HOHPNJcPolcf1CF5+bpasrQssbxYbKHSY
 kjOCqN9XA33goGIbfPZxKObrPTHwBuX/ZNwDwz/EwhGDOioKMn8yZ4q04COw+w05l6/6
 20rl3whbTh6EyPeUMyz/nujMDCKs90n7QYIzawPwHVE5TMX7+RdctBZ4znlnCj396O/G
 JwTUGdnZiDvjHZklQFv+dkc/7LXN5TEJMTY+FYddf6GBQPpuumk2Rq6MosMDfZA7hZhz
 68reOF/jgeSvva+hcUOhi+vpeirOuDs4nw1HmdpMXgH8Id+I38eEOr4+qOApLrQE/Mx6
 j8iA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780080142; x=1780684942;
 h=content-transfer-encoding:in-reply-to:content-language:references
 :cc:to:subject:from:user-agent:mime-version:date:message-id:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Pm+sHTslY8Xo7S6QxYIAKzzkMwpEb83HM+2t5OkXI/k=;
 b=bYjInbRsPpGm39jGko8xvayDvH9uPHYkr1YtbA32hG499yJwaM6uHJ6NqK+lwLLxq+
 5IMK2wxAr6npB6o4G2GF2argKBarwHp6lDk8KMDW74FID7tf2nDYqha6LnP2fTWBabb3
 KPkaEUyOZ4zE/9LTWUHAWnxfK5jvlJIr4673yrMKmrgqfRiGv2f04fbVdRpr1btbnzlK
 U9T1WZ4lepUzZ1mzOLue1xFgEQPbwX4sk3ItZwmeX8hWlUgVtJoXgqRWznURCpazN6hC
 YTSfkzBBabCA5u95A2NwWLkqzaFPcQLuy3ZvHwoPSqAxyu8HF2A2goo0DpbHiGBIMRqG
 lOnQ==
X-Forwarded-Encrypted: i=1;
 AFNElJ/BiNRxxKs7jm5qAo3+ITkiiXqvjwFG3PqqiWCEpzUklPucZ0jcOnUx2tpOaa4ytv8zYAPphSk62w==@nongnu.org
X-Gm-Message-State: AOJu0Yxpb8Q33YoNNVhUeJ0+1arLhQu2GCt88zxwPZ6aI98AutaWsnCh
 WE6fIP3uSoRY9l3//yeP3RjC+spfMD2cB2H2sybdr5p/3JVx7z7Q0NKt+55zOJcFqjCpE1BBYZc
 RhvzD7uoYiY4REFiTdmOD2X6OpBAv/NguGxMPIAiQIhp/VqBe+ybULN4=
X-Gm-Gg: Acq92OFGfOnh3AojeVb7dWeKYdDw7NUlFCDrzq62lS+4vDzlsZDGIUY6WAErNUoMISM
 n7oVixYimobKXUzP8Nyuzqh/Ycb92IKe+joLUCZJTdWcsgQ/7VO51SXpE5WSU3Zt/7XHkbtRMPd
 BTpaz3qPi8XJisrlKfIXLi+tEYp56vHYBYsqFIdgRdvigOCS0mQUFw2FVC1khW1FDMWYmxsHbcn
 5l5bSyLd5EqbyuJRqEyh7hL5jAPDTeWFhg/cQg66sjrBKwTMPE53Y5Xca3g3U8m8ockGm01e+6G
 M5wfzPQdXEXkeHBmnU3ms5f1Uup2ZhEGpnEodH8kdr8Wq4eRIjK/qqtmHHLwsJpJIEuidzC8jvZ
 fxg8WKujvM1zIcUekyUHzQg4M5atGpjnylD+7c/5XfpFrs5YDrJggSzBj7y5MVE7S8tHaCnmGJz
 oOZI1g4Uczh/wj+UjadQULJx1n
X-Received: by 2002:a05:7300:e12a:b0:304:d8cb:841a with SMTP id
 5a478bee46e88-304fa51a556mr528067eec.14.1780080141750; 
 Fri, 29 May 2026 11:42:21 -0700 (PDT)
X-Received: by 2002:a05:7300:e12a:b0:304:d8cb:841a with SMTP id
 5a478bee46e88-304fa51a556mr528043eec.14.1780080141233; 
 Fri, 29 May 2026 11:42:21 -0700 (PDT)
Received: from [192.168.1.170] (216-71-219-44.dyn.novuscom.net.
 [216.71.219.44]) by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-304ee0dd8e1sm2444594eec.21.2026.05.29.11.42.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 29 May 2026 11:42:20 -0700 (PDT)
Message-ID: <ac461b24-6e8e-44c9-a4fc-954f869dcae5@oss.qualcomm.com>
Date: Fri, 29 May 2026 11:42:18 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
Subject: Re: [PATCH 16/17] accel: Remove AccelCPUClass::cpu_target_realize()
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
 <20260529142434.87880-17-philmd@linaro.org>
Content-Language: en-US
In-Reply-To: <20260529142434.87880-17-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI5MDE4NiBTYWx0ZWRfX6vK3i0IAtEAh
 yOOW0+GhJ9B+4F8CgS9hog2rV3ZXvATC/8N6gLh+WNOroD/cGqpkybGKLuWQYCIqoWBApkBQYvf
 0gEiW7DTLdljOLOrmBhX52sTrqjL84MbhqmoJaMAUA8ZRLYcLtAatPAVocdc/+HygbCLMKkOyKQ
 KLXOoEU8fwUZr4zR5tFezPYcLaL54tog9z9D/A3GsrCQ3XOK7Gktr7UrKnkfDIN5jYe21VngD+m
 5shFwpvM5fVARKILUSPYD0JuD4lIbDPBNqBTgjWapakhhB3i16cQ9xOqYU5nhFMTolFyGMxAEoE
 54wvVqgR/220XAUFygFiMRs1CdV77czX9Ai7O2GvQIr+QEFuJnEEWlPXtJm8AeFWXTgKycw3zkM
 L9H5MzAJiyAj+uIXhMJxnj7ZOXNZ/zJvGRWiI3g4c5engE6GR3DgEoEuCuox5YLILt49n/JUnGQ
 C+JEFt4Fl8pJ/HxBWuA==
X-Authority-Analysis: v=2.4 cv=frnsol4f c=1 sm=1 tr=0 ts=6a19de0e cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=iLqgmErQAxjCjdq5jj1Aqg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=M4ieH9tDHB7thNhbP8AA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=6Ab_bkdmUrQuMsNx7PHu:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: 4-Z8hmQgqsCSrEx-OY_0cApSnKKqDh4m
X-Proofpoint-ORIG-GUID: 4-Z8hmQgqsCSrEx-OY_0cApSnKKqDh4m
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-29_05,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 suspectscore=0 adultscore=0 clxscore=1015
 malwarescore=0 impostorscore=0 phishscore=0 bulkscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2605290186
Received-SPF: pass client-ip=205.220.180.131;
 envelope-from=pierrick.bouvier@oss.qualcomm.com;
 helo=mx0b-0031df01.pphosted.com
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

On 5/29/2026 7:24 AM, Philippe Mathieu-Daudé wrote:
> We removed all implementations of AccelCPUClass::cpu_target_realize,
> remove the calls in accel_cpu_common_realize().
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>  include/accel/accel-cpu.h | 2 --
>  accel/accel-common.c      | 7 -------
>  2 files changed, 9 deletions(-)
> 

Reviewed-by: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>

