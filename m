Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E327CD343F
	for <qemu-arm@archiver.kernel.org>; Fri, 15 May 2026 16:36:20 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wNvWI-0003PO-U2; Fri, 15 May 2026 12:36:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@oss.qualcomm.com>)
 id 1wNvWD-0003OP-Ez
 for qemu-arm@nongnu.org; Fri, 15 May 2026 12:36:11 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@oss.qualcomm.com>)
 id 1wNvW9-00045W-Kf
 for qemu-arm@nongnu.org; Fri, 15 May 2026 12:36:09 -0400
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 64FBp6pk3670428
 for <qemu-arm@nongnu.org>; Fri, 15 May 2026 16:36:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 ty5KWDWyMwAHT2zES/eRHS2ypg4oFfYgt2gM7KfKQ44=; b=lVowoCgK8gndZP0B
 M2gWh2e61qo1Q6IDMX1wCggHTdCliaLs00Vz5ZPsJHWByPE+mlyVMkwqgtuaP+Ce
 PTuHFOXpkcXE3BTLrWhhMkQJwJoiapyHcMzAOPeax0qNSvoAWmCnM5frZNDPCQxu
 m31QzaO8Dnf6qW+txFYHM0ANMzTwbUF8JZaNh9D+UDkCD4JfriNXFT0NCTcANQCZ
 AwFAT3Df6l+pTrvOLLmV0onuweADRiPoNNJSa6LCaMIpfS2B5WvZsd5oOc9wysIV
 SyWeLt1MDQP0rnKWGeRNAL4gRtIPfryDtO+XgF1dNhWY02QYjF3b2aMQwapTpVjS
 LYxyug==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com
 [74.125.82.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e5m1s43jg-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Fri, 15 May 2026 16:36:03 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id
 5a478bee46e88-2f525565b33so20605eec.0
 for <qemu-arm@nongnu.org>; Fri, 15 May 2026 09:36:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1778862962; x=1779467762; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=ty5KWDWyMwAHT2zES/eRHS2ypg4oFfYgt2gM7KfKQ44=;
 b=LHGPgmo5S5VhZUV+NGmL8T2X5JXJW7FgtaIo6by4By68s8Lp4JGk7iCVJOm60AFSCN
 76spZ+xRRNp/897ExHviPdkvJs/y5EECF16z43BHA5cTrp6UymY30T3xImy+nCQ7s5+k
 NDdwlLubuH42idu9unk+rFPx4LcRVmAhbI5NZW1dHuLqZIm0pH1i8srCN9e89iWrDyCj
 Ogf3AN182jRgvcxuHdyuWA1CSnSnQ6sA/pksULs8Na1FfhTrpfHDgb+UImnbtUFC279Q
 dliS5XZ9DF94MHrE+cn/RomxIke85ga18tcP9iDcXsjFornjghfoGvLGYVBPX4vbrzT9
 gueg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1778862962; x=1779467762;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ty5KWDWyMwAHT2zES/eRHS2ypg4oFfYgt2gM7KfKQ44=;
 b=EUeO8wfiSwhcpaIrTUpQe5jrGSpQ9IA2cFzl0gw4obl0OGJtnkMAUqpxtFMy4WeyWo
 f2cPzDiw/hzhPshwEftfU5CX2otmg6nr6h169bEM5IOj8PO+eHdU3UtP8e8P2eyLAncF
 CYRHb3OgCfCGtbg6FtrnHnUDrnG+l4n35BK8Lj0XZgrEezp9mxk5M+AryA1nyMEGC0OA
 1vm21XO1FKef7py6I2Ge7Gfrda73wsiSUpFvTfpSw+jbDVoSVNlS8X/JEc7BTnzUsJWs
 9hwAUXjgxAcH16EG+FxjiOaJU/70k+UbX0nXNHuRqh7/xSE6zWZxkmSFAznLGi43v07/
 hK4g==
X-Forwarded-Encrypted: i=1;
 AFNElJ9cQvc4ZPkvWJEq5reJci2AiqBTM3rKqlHCozE7Qcge9JpR4xlAn4S4OB2v897KYkGKp0RO6ZCIRQ==@nongnu.org
X-Gm-Message-State: AOJu0Yyk7WIsBS4hOPyK0VtmSD8ynRW2MFLws3ymMAhOPtf+EVtVUIU1
 O94IYADmYgCVl0emj/OXqn7OwgOC5WCewKZ3jziCbQ/31n0KCIbpq93hzTCCOxTL1ygpDio0x1F
 GU5EvVVzEorDwmV51p2IqroTiqKxo7/t0RMUYEyKAraOun+isGQ2HLdM=
X-Gm-Gg: Acq92OH1iiFv6My+SGNgps0WfCR15tR2RCxoMAOQMUnXncIUyUKQVKU8s31W13Wrv20
 nLeUNREcVUWUF4D05LNSfkPpqpuJ5hZcEatJtaU4Tm2t1wrJddtssERdCXcAPI4jw4FSFJB2lAz
 lT8bwycIaFiI+OVbkmRch7Mjbv5ya2ZJgpV+Bom2r6incIOLWb3mCEG+61o8pYGYjCQH+wsUfku
 sfSr1pEUoDoQnwzLxz6Iihk8DIEGtFSea2eOmJ8NX6Q4vkXo++SHE995c2mrFPKGhWq0JaPjn/A
 ez3/6D2lZK35XFRIC/3ddtNZe77TUKfDNHcpZbq1zMJG/B5fZgyhVm0jrs5LxqLtO14mKVhUATL
 F80ZjZx8wLeEAbjHGp3+lmGasKJMmenndxCyzBP00jz/6qEKZo492F/hc81m6FMJGgi/WTt0Yj9
 HM4/Fex/9yKEAVZ82iJRyXE8jY
X-Received: by 2002:a05:7300:df06:b0:2f2:8857:180a with SMTP id
 5a478bee46e88-3039813cb43mr2392068eec.7.1778862962337; 
 Fri, 15 May 2026 09:36:02 -0700 (PDT)
X-Received: by 2002:a05:7300:df06:b0:2f2:8857:180a with SMTP id
 5a478bee46e88-3039813cb43mr2392041eec.7.1778862961775; 
 Fri, 15 May 2026 09:36:01 -0700 (PDT)
Received: from [192.168.1.170] (216-71-219-44.dyn.novuscom.net.
 [216.71.219.44]) by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-302978b3cb2sm9568439eec.30.2026.05.15.09.36.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 15 May 2026 09:36:01 -0700 (PDT)
Message-ID: <3b5531ff-7769-4cdd-87b9-defe92d7f1bd@oss.qualcomm.com>
Date: Fri, 15 May 2026 09:35:59 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 01/20] hw/arm: Build ARM/HVF GICv3 stub once
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, =?UTF-8?Q?C=C3=A9dric_Le_Goate?=
 =?UTF-8?Q?r?= <clg@kaod.org>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-arm@nongnu.org,
 Joel Stanley <joel@jms.id.au>, Kane Chen <kane_chen@aspeedtech.com>,
 Troy Lee <leetroy@gmail.com>, Jamin Lin <jamin_lin@aspeedtech.com>,
 Steven Lee <steven_lee@aspeedtech.com>,
 Andrew Jeffery <andrew@codeconstruct.com.au>,
 Manos Pitsidianakis <manos.pitsidianakis@linaro.org>,
 Mohamed Mediouni <mohamed@unpredictable.fr>
References: <20260515141032.3271-1-philmd@linaro.org>
 <20260515141032.3271-2-philmd@linaro.org>
From: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260515141032.3271-2-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE1MDE3MCBTYWx0ZWRfX4OspCUbptZt6
 4EuDIykFm4rb3pfwqi6cklmVHb1QkNjOvhfWGkLchfdXfTSFa+wBRzGTp7RrSURAe2CBnnTn94A
 FeAHb8IW9+2mb91Mx92n7aQ4yz/qwdX2G+xiSiKMdoKCBr1047ruSqRs99O57T+jplo+A6wpjz2
 KbZ8jyzGlGH6tC1XXCccObq3WMeBsoacPKT9qN8DXWvaC4VTcd+0tmqlEERVJTrjR52yhtHjTXC
 YlB2ObwWVdRlWnMLK2OUrOk7acZ0vPcsclHLMCVdacUMuDAiLITkrMQRGjfht8FPpjnh6hD9HBZ
 bChEKwxPwdTKJyjqEin7xvUgkW2+yPfFxTwoGLE8jKZBHz0/kzVTmMtobLg0kUrFGouS6/0eZsb
 udjWwYM2rd1i2jRT70EI5FVq5ZwStIngVzohHLH4RLYjzLE0lSjPtaIlpLt8dEqWgsp+ZrFpl4P
 cK4yx+QnHydb7rztJLg==
X-Authority-Analysis: v=2.4 cv=Md5cfZ/f c=1 sm=1 tr=0 ts=6a074b73 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=iLqgmErQAxjCjdq5jj1Aqg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=duA0RHWJieNxBeiJALQA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=PxkB5W3o20Ba91AHUih5:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: 6adExBYeZ7IGQM6gw6LjZeLp56SxQBhT
X-Proofpoint-ORIG-GUID: 6adExBYeZ7IGQM6gw6LjZeLp56SxQBhT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-15_04,2026-05-15_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 bulkscore=0 priorityscore=1501
 impostorscore=0 malwarescore=0 adultscore=0 phishscore=0 spamscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605150170
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

On 5/15/2026 7:10 AM, Philippe Mathieu-Daudé wrote:
> Move arm_gicv3_hvf_stub.c, introduced in commit 48396ad6ce9
> ("hw/intc: arm_gicv3_hvf: save/restore Apple GIC state"), to
> the global stub_ss[] source set which holds stub files being
> built once for all binaries, instead of one time per system
> binary. This prevents symbol clash when trying to build a
> single QEMU system binary:
> 
>   clang: error: linker command failed with exit code 1 (use -v to see invocation)
>   duplicate symbol '_vmstate_gicv3_hvf' in:
>       libqemu-aarch64-softmmu.a.p/hw_intc_arm_gicv3_hvf_stub.c.o
>       libqemu-arm-softmmu.a.p/hw_intc_arm_gicv3_hvf_stub.c.o
>   ld: 1 duplicate symbols
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> Reviewed-by: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
> Reviewed-by: Mohamed Mediouni <mohamed@unpredictable.fr>
> ---
>  hw/intc/meson.build | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

Reviewed-by: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>

