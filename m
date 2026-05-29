Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2527CD4F54
	for <qemu-arm@archiver.kernel.org>; Fri, 29 May 2026 18:34:17 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wT21z-0003lZ-LU; Fri, 29 May 2026 14:34:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@oss.qualcomm.com>)
 id 1wT21s-0003j6-OG
 for qemu-arm@nongnu.org; Fri, 29 May 2026 14:33:57 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@oss.qualcomm.com>)
 id 1wT21r-0008Uu-8R
 for qemu-arm@nongnu.org; Fri, 29 May 2026 14:33:56 -0400
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 64TI2I7i589635
 for <qemu-arm@nongnu.org>; Fri, 29 May 2026 18:33:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 EL1vawXMSOJUeCfRx+LOIC25MexzLlr8n479/rlYl6E=; b=KT6RUB0+03pJm32K
 UWIbM1JbP2CEer6J007RfQcKqCjtmQ2NiSdwkZOCgz6/EsyYhEc4kHHDlEO/SRJ8
 VAOhj1qFhJFH3XJniX/rMzwhqoKqKhQjW724ofn3yTUa+x3MmXbImbeAY9swtBxw
 Numj1PLTax40foT9PpJtb+WZNZOo7rAVeoOAfKzYea80EJYUGtqGh2QXKDhkslrb
 sIoS84Lx0X26msM7x9ORs0aDkDQlVNsI4VmAOok6otM3f+CqYSbW1WYDqbvaf/td
 Si2IXfd+VJz3VcTiCtfvaH5BUB6m/ikwLNkDt0AXaqZ121WrpXsr9xqf2tAS/M2S
 IINt5w==
Received: from mail-dl1-f72.google.com (mail-dl1-f72.google.com [74.125.82.72])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ef8rcjj4a-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Fri, 29 May 2026 18:33:53 +0000 (GMT)
Received: by mail-dl1-f72.google.com with SMTP id
 a92af1059eb24-135f2aa4742so4908866c88.1
 for <qemu-arm@nongnu.org>; Fri, 29 May 2026 11:33:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1780079633; x=1780684433; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=EL1vawXMSOJUeCfRx+LOIC25MexzLlr8n479/rlYl6E=;
 b=GKKgewtjLjAs+PR4RomNPMxLP9gL+VwxzoJtc9B5y4f3QDMk5bPr7J2X62hdfoawEW
 2v/tEBekhz9nxCj84rsSwFFuMcqOVGwukmIBa4L2qPArjKCB+Q8g07QtXAWOOi6wExrL
 eUbqJODU6sPhstZOdu8ILaAKZmHhRS3CFDkiki3ZkBWOTEhc/sx369hhurZ5ZxCILLX3
 5xSpHaAAQjLpScNyOa5ZWAAQHzyAPbfklureCAD7nxoSMLtn/ZYykbKOxeKXYQTdSJ7z
 WvIPPwypf6jBZ7bTMf4uRlZaUVIk1llk4Wys1Urk2mEDbO1glcewrVAon22x42E4rSyw
 0fRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780079633; x=1780684433;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=EL1vawXMSOJUeCfRx+LOIC25MexzLlr8n479/rlYl6E=;
 b=DqnfRFVeFzg8OqYr4+gtpRI7Fo3Z7WI1NTVICikcB1h7vylQBEmI9rzFbnfjd9aHgU
 QBv494bhkRuuTSiOkJZZNInXx3k6yI+loIXGlY/v23bt2JPft81LSch+jUnzpLQpO2uK
 f8DnYdzK2aXQdLKnKPbTKZ6A4f/bgLS2izqtKB4hNPF/Dh8Xr4cgovpa/kGxzHupH36J
 Vc363LDBtCWGrDCHcJXYzspKxhpAln50q4AVfVZ+Zi85pzarVdKtyj8w0SBR50C3Zt3i
 HpQMdgY/412+5Ay266DwW1Rt2rH3jUddg7weSRc/NIB9jkk2QJZsuCa+G7XjJzZo0Jb5
 L/aQ==
X-Forwarded-Encrypted: i=1;
 AFNElJ/u2ZGiFaD93Ty9xZlI8lnOtrqVdvKdinELlV1dVEFcZ5syhhLBQRttuR9q4iLo8hvQJy+MpwakVw==@nongnu.org
X-Gm-Message-State: AOJu0YzdYRTZ7J7YdqSN09owOqi33DWVClEoAIH0lidXZypSRkFIJfZt
 TQNZ/mTvFWbuhpTMYoiArj+vAhmASL2d47nDk7BPLh8PsqusxcmtFmLDFct3tsGwFcfmxAdkOd5
 t08orzcBrMbiADnCy5Kl3nqCI0wHhnhnAx59LOfDtQsVNR+1szjv4VY8=
X-Gm-Gg: Acq92OFVS4jGkE1yQetkRrOruDH+G2NdsQ4dQkr0btiDZR5FPlsHMquEntyt+d0xPFv
 cR2W+Zc9WqvHY4TbjpdDyCN9KwdzvtaFbqhEZsuwt9Z2x3YPclS1yavSL8l0E5mcFVn8niAP1pp
 Jgq+fmBcVnPHadIVGnzo6gkXcwf4hSBloPDNwx+v8O7w2v1xvnempVHo5C3Yup+PBJDeAdodktu
 AmU5itCN5vt/O4XoAToRRi4R99oKywp4ByD0vHCgDJ9op0h7T8sCCCDqvvTTpZo1NksGxs3vM8D
 dIMTIXOg6ZCCFcQMW0BVnlSPhGArTyhFEnNrebLtz7qZj4kc1/DlTbrTOxG924GBRQ2LnEAEzIH
 McFQGlK10ExdwOky47IosG7ho8HRgnzMZZWuPLCC2pBzOSx3nsHrEbOfUf/KT0YH9CD6CyOa2wa
 +GJiL0THuiVkvr6e4+3qtbOhS/
X-Received: by 2002:a05:7022:6182:b0:136:8ca6:7032 with SMTP id
 a92af1059eb24-137d42839f5mr323696c88.34.1780079632991; 
 Fri, 29 May 2026 11:33:52 -0700 (PDT)
X-Received: by 2002:a05:7022:6182:b0:136:8ca6:7032 with SMTP id
 a92af1059eb24-137d42839f5mr323655c88.34.1780079632432; 
 Fri, 29 May 2026 11:33:52 -0700 (PDT)
Received: from [192.168.1.170] (216-71-219-44.dyn.novuscom.net.
 [216.71.219.44]) by smtp.gmail.com with ESMTPSA id
 a92af1059eb24-137b36c6eabsm1649163c88.7.2026.05.29.11.33.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 29 May 2026 11:33:51 -0700 (PDT)
Message-ID: <61143052-19fb-455b-b0b9-457b4e944c03@oss.qualcomm.com>
Date: Fri, 29 May 2026 11:33:49 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 06/17] accel: Introduce AccelOpsClass::cpu_instance_init
 handler
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
 <20260529142434.87880-7-philmd@linaro.org>
From: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260529142434.87880-7-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: EBgw_eqB7WQzati8jRk_LttxkdR7Deyu
X-Proofpoint-ORIG-GUID: EBgw_eqB7WQzati8jRk_LttxkdR7Deyu
X-Authority-Analysis: v=2.4 cv=DuNmPm/+ c=1 sm=1 tr=0 ts=6a19dc11 cx=c_pps
 a=bS7HVuBVfinNPG3f6cIo3Q==:117 a=iLqgmErQAxjCjdq5jj1Aqg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=x-YBvYG0Dqxg5h5i4QgA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=vBUdepa8ALXHeOFLBtFW:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI5MDE4NSBTYWx0ZWRfX0oNOQqmP+foq
 bIrYGXpAz1hYNSOfD4MPLyhcpda8u0njUlfAQo++NIE7d4cCKGehx/uC5BB4HvsBqaXDGdPpMwr
 lI3N17ChGsqFpxm9gR7aJbkWGbDV7wfT2idOaQEveGVAEo4Td1xtybV8Xnr8tKruxWNbRK1bVj8
 CrX7MYRzf7/aeyAwZdqPdCgvDgYAOaH5XcPHvf2o/bHAx00iBDtqI5htOE8zkrQ9Ea73l7sWSe2
 Rvqdx3hRlJf9Tf81nKdePl9LEaBSh39aEU58oBVoDiq3f9G3TFl8F21qGRHHJgdXZ764URRQMeh
 kQEllgzXAMqV+3j/Fb+hr5/f32f9PmUEM+B7mwgh3jsf4vdT+/0kk0P5xn4Ryno4KJ/mC0C4P5d
 MNFYgx/smWRTGsK/BC94w1LNtlGBzmdgrF2PaUcB2NqV4S4M27KhmoOyWdtNMNskhRuX0cLcm3J
 cASdhh96OJ4tnxcCpoA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-29_05,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 impostorscore=0 clxscore=1015 priorityscore=1501
 lowpriorityscore=0 suspectscore=0 malwarescore=0 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2605290185
Received-SPF: pass client-ip=205.220.168.131;
 envelope-from=pierrick.bouvier@oss.qualcomm.com;
 helo=mx0a-0031df01.pphosted.com
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
> accel_cpu_instance_init() currently dispatch via target specific
> AccelCPUClass which we want to remove. Introduce a similar hook
> in the generic AccelOpsClass structure.
> We will convert implementations from one struct to the other, so
> add an assertion to be sure only one implementation at a time.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>  include/accel/accel-cpu-ops.h |  1 +
>  accel/accel-common.c          | 10 +++++++++-
>  2 files changed, 10 insertions(+), 1 deletion(-)
> 

Reviewed-by: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>

