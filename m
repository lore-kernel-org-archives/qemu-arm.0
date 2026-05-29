Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E812CD6E49
	for <qemu-arm@archiver.kernel.org>; Fri, 29 May 2026 18:40:28 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wT27s-0001bk-4t; Fri, 29 May 2026 14:40:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@oss.qualcomm.com>)
 id 1wT27q-0001aO-47
 for qemu-arm@nongnu.org; Fri, 29 May 2026 14:40:06 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@oss.qualcomm.com>)
 id 1wT27o-00025r-J8
 for qemu-arm@nongnu.org; Fri, 29 May 2026 14:40:05 -0400
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 64TI2MwB518459
 for <qemu-arm@nongnu.org>; Fri, 29 May 2026 18:40:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 RkEQuCKrcklDQCnz7aw4dOFoxK8gdGG2aMehc/BQwV4=; b=Xyug3sSARIlWYX/x
 Ith4qLI6J3gFfn034GMoPyUZGRGz01GgUWgzQodTVoaQbf+D5iYVBEPAfBjbYOgu
 3sgwxEIwJTLzUI/5dWp925AnGKUF/Y+vc2f3B8QNi71qhXLjRqySpYN6SS37s3iF
 zZB4d8EoPsWt3+CaWMtsNbSyorkl2v1tmgsINEypFM+rCTPSeVgLr5BJfzaO7nzn
 NxL95tzLw/WgUCPobmhbCjzTiI9Zq8hOCPSVFgR5d9cXl2vHTg24Idi8g/GEXIj5
 uKdYWhz2vqakLkEJYxzVeI7gWCrXR/6i+1DZyE3628UZlmr+ntZcwN6kMiBAxn1/
 sH1ixg==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com
 [74.125.82.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4efechgveq-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Fri, 29 May 2026 18:40:03 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id
 5a478bee46e88-304e4636205so2965511eec.1
 for <qemu-arm@nongnu.org>; Fri, 29 May 2026 11:40:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1780080002; x=1780684802; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=RkEQuCKrcklDQCnz7aw4dOFoxK8gdGG2aMehc/BQwV4=;
 b=kpSO/WuXCjyoTusTrva15/ckI74fU6UNE2qi8Dk5htw6vSK33WJy24oLPXGdJX/0Eo
 ks1H4mtu8iERwv7EcoO2c0JbrNZ3t0Hk5ZQ4O8UrsjMK/alJfymEailpHlQvNe0DUqaO
 e8DNKUxDAHEDsG6mLXIn0VAnfhtaYF3V/M5jX4s3nSaAZ+XDS+I5E1/QPDP4FLzcYtE5
 x+YruA53MaiNTyjFU6F+t5vstaLU19UyAcu98YknhqTBWqyVKYZCzdrBPzBWlU49S39f
 DfA94j6LojEqWUT+fZWrX1LQh4fh/we5TfccXGOO8lloGC68g4eR5GJRKQ5nIYVXCR6E
 qyIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780080002; x=1780684802;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=RkEQuCKrcklDQCnz7aw4dOFoxK8gdGG2aMehc/BQwV4=;
 b=b5qb/yMeyAOT9YdDarPvPyKG9wheZSrtp6ZW52sNmtZ13ruBYCJ6MglmmQtK3XknlN
 IMNHnGxKKjoyuQaRWtxsrAcRebio12ZPjvTt+eEf/wC3Tkqr/bgKGilLxkHGjLlYXh46
 AH/972WzvYzLn/yYfRlmBehPaQHWXsRUiwA7tXY3S0iVY+CcYWXgvtgXdPzqaomycvdi
 7HANFRrxozqqSI8oGncDW5lyBk6zTfTSvXzOjyjvvNVCdOG7ltKpWuz0F8EpldmLoeTs
 pPI2xlHFhyQ7tFCbfg1hzowgpPkwtvBctGWKGPdaDeOaYX+Qxs7LJfj49RD69lqdLeVn
 inVQ==
X-Forwarded-Encrypted: i=1;
 AFNElJ99cQVGXVMFgEDTZMl0HeNgEwM5Q+GrBJC4QrXuawx2o+17nT92jxJD3N12PH6hXe31CmGj/jCq6A==@nongnu.org
X-Gm-Message-State: AOJu0YxRXg+cf+zxc1QYr1KEGW6e8HJuL8TDSB0phJBBEbZjhV9be/Za
 MY6Wa4AKAOvpIh7mmHH4fd0XZ4Ddc5g2qG/zERbV64nBpPJ9snPbg8x+YphDkAruuIxxfewnfhn
 YzcT68Vd50eyzjQp1ryvtP3YM4nEqlsULbvo1H7Fu5i33bH2Xnq3BUn0=
X-Gm-Gg: Acq92OHvHIUVYZsk/MZPmK/9uc8k7pF/12Sa9urDmG/TXSbncoJ3q2pjvNMzdIME8Xg
 FlEdlAzRcNiQcVW+ta/PPaUOGfkatbBeTMP1lkuZrK1462VrACTowmEn0zCoKA6JFfEE5yiwtpX
 twVQ7EhhZ8f163TImqA63owZ6ku7WIaf2htUvrXnch1Cy/czAsDG37mL+Y1+BYJoDXBKyuD2nao
 8Xh+ijgViaABQ5nyvsL5w51gWeifcMHbOvV81PgXbBfnabAqtcdoNapfHWzDKlrUbQxBtTS6ofL
 WdY82fBy4K/Q/uAR9j386uJkET0sUY+hiGlOYiO3RvAut0AyKyGbaa9LpD6lfrAI5OyvJUGFlE1
 8xv409mWUqYb8fpmUwO8t4Whj5TXy2InidjNz6cf9wn4fHY+M2c9nCPUkGm7G9S22KcwNtkzWuI
 u/csw0PtniRhtK/bltbJH2mIbN
X-Received: by 2002:a05:7300:3212:b0:304:e72a:d4d1 with SMTP id
 5a478bee46e88-304fa75f26bmr499514eec.30.1780080002214; 
 Fri, 29 May 2026 11:40:02 -0700 (PDT)
X-Received: by 2002:a05:7300:3212:b0:304:e72a:d4d1 with SMTP id
 5a478bee46e88-304fa75f26bmr499498eec.30.1780080001730; 
 Fri, 29 May 2026 11:40:01 -0700 (PDT)
Received: from [192.168.1.170] (216-71-219-44.dyn.novuscom.net.
 [216.71.219.44]) by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-304ed2c10c1sm2028341eec.1.2026.05.29.11.39.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 29 May 2026 11:40:00 -0700 (PDT)
Message-ID: <d7666e7a-d5cc-411b-a1a5-1c76d0b6d353@oss.qualcomm.com>
Date: Fri, 29 May 2026 11:39:58 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 15/17] accel/tcg: Convert RISCV AccelCPUClass ->
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
 <20260529142434.87880-16-philmd@linaro.org>
From: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260529142434.87880-16-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: iAnBB1xsw4cI3_5w63Gg_qn8ySC-wUpY
X-Proofpoint-GUID: iAnBB1xsw4cI3_5w63Gg_qn8ySC-wUpY
X-Authority-Analysis: v=2.4 cv=U6Siy+ru c=1 sm=1 tr=0 ts=6a19dd83 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=iLqgmErQAxjCjdq5jj1Aqg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=TJZcotH2JYSlfeF52QUA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=bBxd6f-gb0O0v-kibOvt:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI5MDE4NiBTYWx0ZWRfX1tYSMx89eKB/
 UZzY8sHcvTFtEZxhjVYFM0k07PMoePRt0qR/sDX2tB7teE2ubR4vbgywLTa0tB/VxsQ8hrD1MSO
 XRAbWYdWNpePwuIH7SzN/TpApESuBabcMflVTjHiOSjuMA3XjfutVHbgsP3ghy+R4J/pSw+Iay2
 CP0rfTYkOV3tNETf1jZZ1NHj6+fqiY4JG4i3zKiZoKuMrBp9c4IIcXJWZpYgrpmaeCD46xeJp3u
 8Tzk4V+Ct9VkOnMgsBjUZLwgQsdSlikjn+/yoZBkuqjY8N+epHOVFx24wTSiskD2kY74q9BxLNR
 1eZECoiUfTYZAnCrsWRrg2UTwkolJZUAKyCjTfq1+eV+/2Edr6VbS/XLI3+kSwy8Er14TJgOK5V
 O0YdKQk6SDGoOG0XDKuRgYpRoJutw0Nks9I7LVE1I+5XrdVHo1vpJWeQxbrwwsPBn9a3Ijh+LwS
 QkWBaMYGNfOgBn3FGSg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-29_05,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 lowpriorityscore=0 bulkscore=0 spamscore=0
 clxscore=1015 phishscore=0 impostorscore=0 adultscore=0 suspectscore=0
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
> Register AccelCPUClass::cpu_target_realize as
> riscv_tcg_ops::cpu_realize. RISCV's ACCEL_CPU_NAME("tcg")
> TypeInfo is now empty, remove it.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>  target/riscv/tcg/tcg-cpu.c | 24 ++----------------------
>  1 file changed, 2 insertions(+), 22 deletions(-)
> 

Reviewed-by: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>

