Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D52BCD6E49
	for <qemu-arm@archiver.kernel.org>; Fri, 29 May 2026 18:37:09 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wT24Q-0005Ul-Al; Fri, 29 May 2026 14:36:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@oss.qualcomm.com>)
 id 1wT24N-0005SZ-Qy
 for qemu-arm@nongnu.org; Fri, 29 May 2026 14:36:31 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@oss.qualcomm.com>)
 id 1wT24M-00013a-9W
 for qemu-arm@nongnu.org; Fri, 29 May 2026 14:36:31 -0400
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 64TI2Ixr198999
 for <qemu-arm@nongnu.org>; Fri, 29 May 2026 18:36:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 jwetY48q6jZKjFlfIkES0/E/aJ1gDs1xBquYmzI+n/I=; b=fz/XNF6/GfXjQFNX
 0UfcuCtloIVagGtD2+GvOtQGw8+Qf7lrJtaNYE5Ixumx2tn12ObRsAyZEVbu0S2N
 F/9QInpSsmfg/5zHR04qy+juDSw/qCvhDvgkZnKTXXkvqduFaUOBn8u3wPeLiSPo
 uthc5JZEmuTo+Ab1x0L2ZTnPWeOdqgeyd6tKbwF/dqfP7rctsFD5/YKEG1XChL6d
 pfVErFptt7TYD9Jbt2yc6xxxWFcX8Lm8JZf0rjl9F6cctSM3MHXFQlIMGtGQyT8p
 ltL+Ow1mQxjGnJtsQxQFWyZ55W7s2U6UY9HQ6H9Mor5LKNJzUx/XrYkcQvSQNDXF
 QiNkkA==
Received: from mail-dl1-f72.google.com (mail-dl1-f72.google.com [74.125.82.72])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4efdjnh6dp-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Fri, 29 May 2026 18:36:29 +0000 (GMT)
Received: by mail-dl1-f72.google.com with SMTP id
 a92af1059eb24-1353a6f29deso4810010c88.1
 for <qemu-arm@nongnu.org>; Fri, 29 May 2026 11:36:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1780079788; x=1780684588; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=jwetY48q6jZKjFlfIkES0/E/aJ1gDs1xBquYmzI+n/I=;
 b=caqyAcFfxNMAiGoqS1cJxBcNy84kkhVRXCQFvdAZt0HV8JjLPwY+lVBFh/ml1ejVcE
 ao46PGvlMU2Izwcda4Ao4ezxwLeHBAtB2riSYU7qpFcoIWUuRm94Wv1nMOq7O3sxI73q
 jjSazWZV/AwYbySOGP958laUduQL50xwnpb5wUbIc5da87xU6dlsEG7GN16S9Zw1SeNB
 Y9Wj6n+E586X1cLtIzHbLjEo+UMowsW7/2bU5bIEQhQ4GAaRFbTtnTaacbQ3wv/Dhby/
 4MKPqF3DjU7HbRuQxXAVcN0DhOT+C8itifZ2uB9YtOIzYu+jAvKWU3imekBh4w+/yKFk
 1eyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780079788; x=1780684588;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=jwetY48q6jZKjFlfIkES0/E/aJ1gDs1xBquYmzI+n/I=;
 b=MpJA0p6S785p8YSF/ONAyli3tS7RcXa6eV835rTowjHlZUW0dXxZQTNjWMVkJs78bN
 orZ+bIISx9tCvyU9g6Xttik0dSpcM5B5JQ0m8yiMPsuf5CcXolZApjRWtaR8gQnjBK0J
 DpMejO83sxv/uyPkUAHTGP4X6tOIezYKJGnzz1xmOBH9arWwU00YMepBCNcnJo7L3IKZ
 RsU/nHF8CatVGVDt8Ep+7oEkzI10Zl6hGoahU69xmpx5X9D3tR8b5qAeLudi5Ig9vBBB
 LcvrWnbZaTfJP7JyuiVkORr66LxUR5NTdHE7onFkNfTfyQbYKn46PHOeqxmn3Gp0yAaV
 c2RA==
X-Forwarded-Encrypted: i=1;
 AFNElJ9h0Qqw/bN5Tc21CbFr098yzdUuxbWwtETnHch0geTYJFo97sOeVNewL/jw9MYNWjS8sMOULZweJA==@nongnu.org
X-Gm-Message-State: AOJu0Yym/F0fxNRUFOJpCx2Tl6CPm9omCFIhwY4kqRtB8lMTOz6N4yfB
 wLWpSBkLk17rNsn2rG+qHRnazdQolUb92Qatpt9hiY91yhq3glhlDdukgqtMnYOqQzwyv38uKvf
 XHNlfdUutuHBldNMGVVPh6Bcg6+4Vq4ZlEXLpzIpr2fnckKJAMbLT5+Y=
X-Gm-Gg: Acq92OH/UMyNSIqr8e9pll92UtEUMXZG1wAF/oSqelbj9oAHIZDwwghrOWJvAQuS/JG
 3cza8f8mxJKpD3StdTSVs8k4GY5zbFutsNB077lQ16wOyDkjdsScTQbnfYOLfDgqQox/BcrFihf
 P1hvzMFCld1cxEHiOCubW5Brht4931qIHM2phxkwqK1P8dX+oQesRCiyNlURYE8H9gHf1gVeDxh
 eqPt07WZ7ooP75Pn2kyHfRkhl9lpEKYXvvQEBHHnhOlmJkfdWKD0aubl1MMXU6d/wRls4v85VTU
 78n2rZnBo4xydwBRaElKWwrgDvetRO9m78+VZNZWzIUW8k4PJHL8QVSkiD4ZK0Qx5D+603Iqe+i
 h3UMXYTRH5BaOHTHMSE+EAy8danWz8HhwkAFnAmmQGTgkX0M1gFykQi9o2qzMWTUMwRjvqKuFYW
 UxWTldQQ/0CS80Mmis+5E0KBjJ
X-Received: by 2002:a05:7022:503:b0:136:4a60:43ce with SMTP id
 a92af1059eb24-137d3e11dccmr448191c88.11.1780079788543; 
 Fri, 29 May 2026 11:36:28 -0700 (PDT)
X-Received: by 2002:a05:7022:503:b0:136:4a60:43ce with SMTP id
 a92af1059eb24-137d3e11dccmr448155c88.11.1780079788022; 
 Fri, 29 May 2026 11:36:28 -0700 (PDT)
Received: from [192.168.1.170] (216-71-219-44.dyn.novuscom.net.
 [216.71.219.44]) by smtp.gmail.com with ESMTPSA id
 a92af1059eb24-137b36af6edsm1682252c88.5.2026.05.29.11.36.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 29 May 2026 11:36:27 -0700 (PDT)
Message-ID: <7f3da38a-96d0-496c-8c8e-e8a51624fdaf@oss.qualcomm.com>
Date: Fri, 29 May 2026 11:36:25 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 08/17] accel/nvmm: Convert AccelCPUClass ->
 AccelOpsClass::cpu_instance_init
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
 <20260529142434.87880-9-philmd@linaro.org>
From: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260529142434.87880-9-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI5MDE4NSBTYWx0ZWRfXyEN1e3BTOYU0
 DIiP/mEwSF65GTBwjaDzvKc3mS0FUgleKlHfSiDIaEhJ5Juh6yiSbwySuNn41FnSXeauBj5aGaH
 FPOlVtbsWuaQxOfSg5Pp/SDaBNvqaL17fQWReJK+1xRnWhue5OPvTpbsYOoNaveyVgrtwJJIhj9
 ZIEmF/iQ4nT8tNr1dJcTjXpNWxtSduPjDeor/ySVSgKEpDLh7e5Abbo//xPNa2z7LQJGlA7sGEP
 k4xnaDyyHdlhfWk6UXWKTfxsDqWzFzbn/Z7A1QELS/aGYYNEIvYSVT3HmewmbdHzz14XQhVWPzC
 CqXVeVa59iDPmMBht7/C5DXWe+KtxLf/1wXG7r08Y7h2FPwxDao3cv42HKdBVCLwvfN3zOB6gtt
 6YNz6G6omWof2ibY8a5mI+5OjlqgFIIx2E5YMDnkLk/96uVu+193I0CfI4M0LAQC7T58+t2d+uQ
 evW5FoHlBFSYX6aINGg==
X-Proofpoint-GUID: Pr-P2xtNVnkGPZtWnnMULrIrJtYVht7d
X-Proofpoint-ORIG-GUID: Pr-P2xtNVnkGPZtWnnMULrIrJtYVht7d
X-Authority-Analysis: v=2.4 cv=PtKjqQM3 c=1 sm=1 tr=0 ts=6a19dcad cx=c_pps
 a=bS7HVuBVfinNPG3f6cIo3Q==:117 a=iLqgmErQAxjCjdq5jj1Aqg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=Kyjw8ylCigwU-0_J9SUA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=vBUdepa8ALXHeOFLBtFW:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-29_05,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 phishscore=0 bulkscore=0 suspectscore=0
 adultscore=0 impostorscore=0 spamscore=0 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2605290185
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
> Register the new AccelOpsClass::cpu_instance_init hook.
> 
> ACCEL_CPU_NAME("nvmm") TypeInfo is now empty, remove it.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>  target/i386/nvmm/nvmm-accel-ops.h |  2 ++
>  target/i386/nvmm/nvmm-accel-ops.c |  2 ++
>  target/i386/nvmm/nvmm-all.c       | 19 +------------------
>  3 files changed, 5 insertions(+), 18 deletions(-)
> 

Reviewed-by: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>

