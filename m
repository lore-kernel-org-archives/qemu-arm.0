Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E479CD343F
	for <qemu-arm@archiver.kernel.org>; Fri, 15 May 2026 17:01:14 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wNvuK-0005TD-LT; Fri, 15 May 2026 13:01:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@oss.qualcomm.com>)
 id 1wNvtk-0005IT-DV
 for qemu-arm@nongnu.org; Fri, 15 May 2026 13:00:47 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@oss.qualcomm.com>)
 id 1wNvti-0006IE-Gb
 for qemu-arm@nongnu.org; Fri, 15 May 2026 13:00:28 -0400
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 64FGn1Ft2691586
 for <qemu-arm@nongnu.org>; Fri, 15 May 2026 17:00:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 Sfolq7MzbHD6peVLfG5i0h0QkicqqGnj/cmPdRRzSoA=; b=p8PVJzP1rthX6s32
 9GgWm15sQ1BRI7UD94KK5GM9UPQgiulUyYAgXej2bRUc7Sdoq9ykSvOy8L0Jm7k0
 XQN/KarEGJ2mYEd8u7UQNbR8lENXBuZ5Hk921qYqLF3cLx27qNMOaHj8EEfzVNpP
 DKG70YfhalWNwg+hqMsdcpDaedZqVU4BVFnw43H8oMd+fUPHYHrHrEUQl5ol/sVu
 HnoJOS35EQ83bOTATBky6QNfZqAV3yMTp8t0FEx+ZSPR7QhqnKRlNuFotamkAl5k
 HAo7615VDevrfhHZ6Bisjo1SRCrb1g7k27hsdcSkMcjqvJP4JufTzyCB49GO0gxe
 TmnRlg==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com
 [74.125.82.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e67ber138-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Fri, 15 May 2026 17:00:24 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id
 5a478bee46e88-2efc342ef15so27509eec.1
 for <qemu-arm@nongnu.org>; Fri, 15 May 2026 10:00:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1778864424; x=1779469224; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Sfolq7MzbHD6peVLfG5i0h0QkicqqGnj/cmPdRRzSoA=;
 b=kK389qmPpnD9pUsK7B341GJLLUsNBfoL8qGZxzHdSc3go8RWoTNSWwQKzevPzW3CBh
 GofpVaulQAqnabO3BIE//Mf9UReRJ8zFTULhqcOvljwA0s0UJw7S/rHvhSgH3Uu6Vp6b
 itSMkIPcwaJj3XmAE96t++iZFNZAON1Wn74Fb4/bxUS3zctCSIEEZ2udIp9sskGBaUST
 M3yCnHQ5gHVAwhv9ZZdMQsqFZOEGkhehiPYSoNb0QkPaYWI2sWXIUXtf7s35N7KcET9Y
 u/9wDCkWVW85+p9lTZwF8n9k3pSSNghK4tnesAfHPKb2PCYH8gF3QLT5Pw+dC3hYYLN8
 1kDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1778864424; x=1779469224;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Sfolq7MzbHD6peVLfG5i0h0QkicqqGnj/cmPdRRzSoA=;
 b=JiTjpiQreaNlxFS9hH+VdmZteXQyfcXgyBZIG2F0SCqZN14xBKbkZkVtSWiSmEgM3e
 K/TmjJ/pOn8enVbsPjh1zp7rOhAUFGMMEmpQaXmb6uYDQcvkvuV3qYAUC0o3UyohYW90
 Vw7+0fTOKimqgKo+8ztfTxZygitw5YGxo0VxpOw2PYRPPpvyjgBwUWYNC68x/n7BFQOd
 KU4dglFQP+FSNKwzAiyuF3MZ2vLnevsWQ/+6WMWLfBlTs6wAiRO8nv7xk5eKpNzXrKK+
 im4g6/LpddqvadA8XuWR5GGRKHFcK3ZS6v5Y3VVf7jGCQed7C/IJZxQWzGmuos6RPQY/
 ETMA==
X-Forwarded-Encrypted: i=1;
 AFNElJ9uPokdQhLy7HYYzw35PMlEYI6NxCmG9oljLx01s+AESfaoePfa5ZP9PT6AeRsGrK1n5QB3cUlqPg==@nongnu.org
X-Gm-Message-State: AOJu0YwAHGKLY+/XmS//R7RwFRx27gyHe3qADnc1UcX7SNMavcO3EoOz
 dmnaY3f1KOiqjTK+NVXrMKFNhh3qI/DSqI3cHtYItnCQ/9s5QZmi5+c1XnU1xnOsrSY1L+kyVUM
 3TWJm1npdMGDwRohoAF75qvoZFcxDzpjzocXf999y66vf2JapSG9fubCv97cNnzygzg==
X-Gm-Gg: Acq92OE7oyfHTVOwp9/bnWEVxpVQbdveu+qdqoLzOaisO5WDT4k5VZqdmOIbNdHhPk+
 paf0mFk0g3i792G5z2r793DghwMXHwE/Vyeq1Zxbg7LwbBmWiAcFyB60s8ztVvAX9k/1cbAzAXA
 x0oVgySkzBz4pYCve8Pd7oQEtJ13egD/8ljncbCZ3GjxQO6bs0V726eh1FF18aTcwOtIRsJU0l9
 a2BKexg3t3IuHE7YhZCYtZ+jKU4Z5LkJltY8KaNGE7+oXmVoZn4LOreN5CnHal9Twnav/120j+Y
 qZyQ0gOQNHB5VlmHrrfWaLVok0/sh2xnbz3VvaR3CVEgneA8QCkx4HDGggr2zqWCT8/SsKVWyXV
 vSJHL1U93DljDwqWP5vj/4wk/83jSaIEfjsetTAXWOr81aSs36Q07QOQ9ONtfs+g74xG+XRWhwh
 oHmOURpQtZetI/jQ==
X-Received: by 2002:a05:7301:1983:b0:2f3:a348:a2db with SMTP id
 5a478bee46e88-303982bffb9mr2299139eec.10.1778864423473; 
 Fri, 15 May 2026 10:00:23 -0700 (PDT)
X-Received: by 2002:a05:7301:1983:b0:2f3:a348:a2db with SMTP id
 5a478bee46e88-303982bffb9mr2299087eec.10.1778864422737; 
 Fri, 15 May 2026 10:00:22 -0700 (PDT)
Received: from [192.168.1.170] (216-71-219-44.dyn.novuscom.net.
 [216.71.219.44]) by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-302978b1a79sm7556858eec.28.2026.05.15.10.00.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 15 May 2026 10:00:22 -0700 (PDT)
Message-ID: <6fad8023-e720-4aa8-a755-e605f79109b2@oss.qualcomm.com>
Date: Fri, 15 May 2026 10:00:20 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 04/20] hw/arm/aspeed: Initialize 64-bit CPU types
 during DeviceRealize()
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
 <20260515141032.3271-5-philmd@linaro.org>
From: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260515141032.3271-5-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: Y4r_BQWiYjes7SM4jxu5xzgJOJlsRL70
X-Proofpoint-ORIG-GUID: Y4r_BQWiYjes7SM4jxu5xzgJOJlsRL70
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE1MDE3MyBTYWx0ZWRfX70uYBeO2T6la
 /ygGl7BONdjR7Ed6nBvPUAU/rG0OG4dVPdlegNbMWOJwUKJ9qLtAHdJORN4BLup9b74d7Uw0ZzW
 74JMrKWTlMsNBDMxKcO+c8f3eGnscKFKXSeqqb/YhbLurWA2Edv+rQnwEvgoHYFlaG8z/DJ2T+f
 MJsUUBdR1WwfaGXrCtdECRDWL73G1ehvwDx/7G+zVXdURjcy3yZwsND8bP1LKCMWrL2NhrhZk0I
 bpur8f6XhTN59ZynIywbcbrIObwfDsx5zmdMv7uiaoXP2tnB16JtDVRN8S6UGET9edixNArOR0y
 xmk8XoOnFWYbPz7Ip/6DTZAwOqxoLZh6KTZRz30o0dEczqk3T8Z4BLU0apvbbGt7G9i+xgwNNKl
 B3aIxqImFkdHpdL2I7OM5SDHumXXZUI1nvRuC3Rn3WlJnCXnov4Wl324VedbnW/vt/AMtkOlUtZ
 w12TsVeFGEX70k3S5Rg==
X-Authority-Analysis: v=2.4 cv=IrUutr/g c=1 sm=1 tr=0 ts=6a075128 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=iLqgmErQAxjCjdq5jj1Aqg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=Pc64puJslZYGwNK1JiYA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10 a=scEy_gLbYbu1JhEsrz4S:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-15_04,2026-05-15_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 malwarescore=0 suspectscore=0 lowpriorityscore=0
 priorityscore=1501 spamscore=0 clxscore=1015 phishscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605150173
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

On 5/15/2026 7:10 AM, Philippe Mathieu-Daudé wrote:
> aspeed_ast27x0.c models 2 similar SoC based on a 64-bit only
> CPU (Cortex-A35), only available in the 64-bit binary.
> 
> If we build this file as common object, these SoCs become
> available in both 32 and 64-bit binaries; however when running
> the introspection test on the 32-bit binary, the init() method
> tries to init the Cortex-A35 type -- although not realizing it
> -- which is not available. This can be avoided by deferring the
> CPU type initialization to the SoC DeviceRealize step (this is
> safe because nothing uses the CPU type before, only the GIC
> access them, just after their realization).
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>  hw/arm/aspeed_ast27x0.c | 7 ++-----
>  1 file changed, 2 insertions(+), 5 deletions(-)
> 

Reviewed-by: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>

