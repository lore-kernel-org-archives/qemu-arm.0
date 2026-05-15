Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4AF06CD343F
	for <qemu-arm@archiver.kernel.org>; Fri, 15 May 2026 17:05:18 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wNvyF-0007gG-3U; Fri, 15 May 2026 13:05:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@oss.qualcomm.com>)
 id 1wNvxz-0007Yn-5A
 for qemu-arm@nongnu.org; Fri, 15 May 2026 13:04:53 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@oss.qualcomm.com>)
 id 1wNvxw-0007bJ-T0
 for qemu-arm@nongnu.org; Fri, 15 May 2026 13:04:50 -0400
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 64FGkqDd1353908
 for <qemu-arm@nongnu.org>; Fri, 15 May 2026 17:04:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 HuWq2PXDWexUYykSjczxrh3RPBLCkILhiuEHKTPP/Jc=; b=N8xbUzS5XQHqVaX3
 pb13uE83fjZTqv+rgpf2bdgQKhrgpWVBued6wJLUm82EsxDrlfFVHLvLWdGZfrqm
 +ZITHFq6yFqm+k3S7h4Ol1BUcK/zcbvhme2L8saX8q1alXEoRgh4x4SugJv3mwZn
 KHOA2+kYei5eYTMQEJ8R1EkKsOc9Qgj/5EsRopPdNr7UUwYPpAzpbpmtPm/2nYo1
 3ZPu6Ywo1oL1br5+RPkJO5jpBBPLoKyzu4+wP5ClggXaEw9CVX6pCnzrzRGEhJJV
 vuIjZvalG9OXN+ZwWYd6kmWc37s7olvJDLLf+53AOqr0bwFcVfe5cpgSQyQGbwWY
 5jL+qw==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com
 [74.125.82.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e67ac81ut-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Fri, 15 May 2026 17:04:47 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id
 5a478bee46e88-2efc342ef15so42375eec.1
 for <qemu-arm@nongnu.org>; Fri, 15 May 2026 10:04:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1778864687; x=1779469487; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=HuWq2PXDWexUYykSjczxrh3RPBLCkILhiuEHKTPP/Jc=;
 b=K2B3r9l1Q9xA6mDgccv+mWGdr+/1vV3PPFwqWHwgmSSKZAfOuB1cvfGhHyh4jEGsyq
 2HIE2m7m5qqmB4RpEpB3F5giVADQJahjhqNdSk6frrkZ9VdosoGjZSi44r5fsndjJu8i
 mkOSnzMaBcYT1icdUSClgjqrTUbYfDkVpzHmV7SQBXr7S/fedMrKnA+LSrrGXtl3qbAi
 RkmuIkJmcLWBr5NYoEpEodcVSrOAeY9lgxEoNJbkcUuoH9ltO2aNQ6j+uA/UT8KNja4Z
 +N4wxiqcbW/k+VWcqKdmjib2+R42pqZ7RW2NaBntCgH5ShexqPniwTgz9m0dupLe7PO/
 3lXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1778864687; x=1779469487;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=HuWq2PXDWexUYykSjczxrh3RPBLCkILhiuEHKTPP/Jc=;
 b=Fwz6LRpXiDfLtFGg0uRb4zmYfm6/1gfP7pqydNuBDsPUMhQ253SnTXutFBJPyLRWjw
 geT85/KV3zF6Y3l3OT/nZOUnRPW5Kt+y0meJHatvuJMIu1b4Hf/q0NlQihab47pU65fZ
 tbYwcq+vLU+cMuBbzhPl4Mfoz7PH8RR5DRJIbD/roW9ITMchD5NiDfINIes9d2ZUQ7Cu
 q31GcG5dSXJceqUg2CUOA9RtPjITYlQ/SFEAmmP8AbL4KtlWn+r6+QDN+M0spJJ9r8ga
 Fqo2+JBDk4Xhtp9+ZAkxopPGZ65nZyriUwV9OhMpWiATybR+JrByytM/htBhRu1shp8W
 huNg==
X-Forwarded-Encrypted: i=1;
 AFNElJ99NLO0o1D37VTHRp6gXFMXovXEYtyzR6TjAlG2BX/z7nJlgAXspcMIhy1LkMTrrtpAE6ReQyFnJA==@nongnu.org
X-Gm-Message-State: AOJu0Yx2405SzgXEYBON6RaeK18AHa8ZboFF3whyJmd/m+10kODzbHJy
 mbrIRB92aHIMdRm4OZwVBZBRn1ErUUKjf4gsSN5PaXapejnNI4pV76hX3ycDPuHEv6mk9yWqwHU
 EysRJ3HJ3fkvgR0BYXVZ/PK27P7PGuEGIpnZqmlFcVEShdbxMmcm+xoY=
X-Gm-Gg: Acq92OHcHPoKlS4u2FRRYBXHnJYz0KnQPabuxwScJzmbGhOd9MQtfwPeU+tPRlRgB8w
 JW0vpO95rZVSgZ2MMbjG1oKENqonmbXiqPyjVezg3VCUIXNW8FTnPyaYeQA3uXeezOqt4HJ6Ozx
 kb7iLloKZFJEZ8MiABrEhZJk1GF3LBunzMsR2oMjt8HspVznkwt5PLlCYMj5JM8SVSoCcwMkOMe
 R3jbqaogaL8g+/WP8C4SkO/kPAQaom+I1fm9oPor53bMXMu2wptvAo0n81ylc2hHfmf0smGpz0H
 1bWIbsJ0/9wOpj8IqIlw7bCHJ5+9IVosVm1EYsMGLjyimnLD8wt/sry7i4ES/+CvVk4+FuB+8xP
 U6/53pks31R+bICIgb4mhAnmfzoLL+ooo1bmoQW1r5UBssa7Hp59m35xSO2tYwlKDr3wP7JfzAW
 t7MSrcq7R/W4pyCQ==
X-Received: by 2002:a05:7301:1983:b0:2f3:a348:a2db with SMTP id
 5a478bee46e88-303982bffb9mr2322502eec.10.1778864686676; 
 Fri, 15 May 2026 10:04:46 -0700 (PDT)
X-Received: by 2002:a05:7301:1983:b0:2f3:a348:a2db with SMTP id
 5a478bee46e88-303982bffb9mr2322468eec.10.1778864686118; 
 Fri, 15 May 2026 10:04:46 -0700 (PDT)
Received: from [192.168.1.170] (216-71-219-44.dyn.novuscom.net.
 [216.71.219.44]) by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-30297bbc9a3sm7635462eec.31.2026.05.15.10.04.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 15 May 2026 10:04:45 -0700 (PDT)
Message-ID: <fa870950-73dc-452f-9b0a-5d450a9e86a6@oss.qualcomm.com>
Date: Fri, 15 May 2026 10:04:44 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 08/20] target/arm: Build gdbstub64.o as common object
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, =?UTF-8?Q?C=C3=A9dric_Le_Goate?=
 =?UTF-8?Q?r?= <clg@kaod.org>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-arm@nongnu.org,
 Joel Stanley <joel@jms.id.au>, Kane Chen <kane_chen@aspeedtech.com>,
 Troy Lee <leetroy@gmail.com>, Jamin Lin <jamin_lin@aspeedtech.com>,
 Steven Lee <steven_lee@aspeedtech.com>,
 Andrew Jeffery <andrew@codeconstruct.com.au>,
 Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
References: <20260515141032.3271-1-philmd@linaro.org>
 <20260515141032.3271-9-philmd@linaro.org>
From: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260515141032.3271-9-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: tB5ZzmZcRcOCmjoN4fpz8skIVD_xoh2V
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE1MDE3NCBTYWx0ZWRfX8f7LX9RzEAp+
 IW8SaqGZwoqt8GJuPVffVqPVbXm7RvkrdfPz6c95LCi7eEa41Y7WdRw66Z2bv+gEYPboa6kcg87
 +3f7BmpAcKoR98OScTZQ2KfYyr+eMu2OwrqOq0qDKkBnpt6ed6V7iozqeTl+Rgs9PyUuHKuefgH
 vgu5Vig3SqDlzAQFhVYqzKrDGnY9FrZT4e38WOkYSgam6qZgaVeoykFvQvAA1z9P+MZqa3Iazmb
 +3YU7MokaL7bfa5udcFVblDchSkG2kMuFBPJOr1jalUVr1AelTrISgvRfATlr+kuBT0N1RxuTi0
 MxyS/JddaD39wdjBaI960q/7pWsv8RoaXfNURJRqBu/PxqhWD8qlUEoek7YAaD3apoZWWLPa7sQ
 jGIhdnj0B4n6NJv67fEmJZbIP7m7xjTKXWJ7CwIbfZ1wtx02LB8qbN2jaPDoniezUXH8eKJZ0r/
 PpUU/66xXzjHsu9K6+g==
X-Authority-Analysis: v=2.4 cv=SuWgLvO0 c=1 sm=1 tr=0 ts=6a07522f cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=iLqgmErQAxjCjdq5jj1Aqg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=r4GAUBs5Yzx3MdfDzK4A:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=scEy_gLbYbu1JhEsrz4S:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: tB5ZzmZcRcOCmjoN4fpz8skIVD_xoh2V
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-15_04,2026-05-15_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 lowpriorityscore=0 adultscore=0
 impostorscore=0 clxscore=1015 suspectscore=0 phishscore=0 spamscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605150174
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

On 5/15/2026 7:10 AM, Philippe Mathieu-Daudé wrote:
> While gdbstub64.o is already built once, build it as
> common object, reducing target-specific set in arm_ss[].
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>  target/arm/meson.build | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 

Reviewed-by: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>

