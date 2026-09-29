Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B50D9CA5FA1
	for <qemu-arm@archiver.kernel.org>; Tue, 29 Sep 2026 12:26:58 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xBWv3-0006xU-FK; Tue, 29 Sep 2026 08:26:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1xBWv0-0006xF-GA
 for qemu-arm@nongnu.org; Tue, 29 Sep 2026 08:26:46 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1xBWuy-0004GB-Vy
 for qemu-arm@nongnu.org; Tue, 29 Sep 2026 08:26:46 -0400
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 68TCELLe525130
 for <qemu-arm@nongnu.org>; Tue, 29 Sep 2026 12:26:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 8Ea4LwV7AW5F/Tu0HVFvFE50cJiL9+N9achJSzzlP74=; b=HtQ+9aK7xDncwwPl
 pnUrfhGQI7ig1xFe45+/choMLrDztAslRRF4lMP8TWKCjh4Injr3NxvQRfhSb5mR
 iDLHlgKIr5slri8BVqlt0fEV46aGKNVSGAKY3frzpRIysna4Cmihhq8V97Eiq7HV
 7cJsOdu1Ok/KLEMgwKhywMEQIaRhr/j0zcEykSSXaPg1NXF12KnIR/GtjegDu5lB
 JL0RdlhWY9fZ0lJmYijaLsjOPKblktr447wKLj8iJeCpP5DLMKD/qmAQuPN4fAFt
 rgk8NM4oxVZWL8M9rwI5Xf7hMhfRjqMfv/BV0Q7H/HtEXyWUNFxJ8SGjKujBUA1f
 vEebKg==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h00s4u022-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Tue, 29 Sep 2026 12:26:43 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id
 d75a77b69052e-5328dae1305so67502551cf.0
 for <qemu-arm@nongnu.org>; Tue, 29 Sep 2026 05:26:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1790684803; x=1791289603; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=8Ea4LwV7AW5F/Tu0HVFvFE50cJiL9+N9achJSzzlP74=;
 b=fa1yPk3M2SMafJfVJmKiOn8yDGrMEAx0I/bzbua5MiIPwBPjsB8swcjEsq/aDBm57L
 EARnvKDrZyIc2P5OiDPpcvIjO8sd9VRduZ3reOttcjxHpHn6VD3Z6t/2TVazCejEoqPE
 Tcjwrlb6deISsX9lBEZF4xaAuupRaVd9+1c7A10KArJ6gH1X38XG0W6pjGcXx3JRjtOs
 lbL9BMIlzlDaZoOAmpZwrHqVEtkkGmKjaOUMruNDeItKpNySJGpcIZJRyucmMtQf5YS4
 Ho4Knzcztlh67dWISTvEV8dQfmn+bHVGpGyImkLTrfHslhSk0/5dDjhs4CZ+qGpryTq3
 3T7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790684803; x=1791289603;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=8Ea4LwV7AW5F/Tu0HVFvFE50cJiL9+N9achJSzzlP74=;
 b=nd0qKcUUCuTUeR2GWVuUzTvyxhJijtBgltv53TFT+5mLCVWVywboctphpzuKLz7mjK
 PGKHoq5L6+Sb1tPjMjOtST7PrXAdYPp9MlfegRirFmIMdUdjBIyUuBsfh+M/edOzdQVA
 pUc6MsnWQdmJ1+BhhUPtR83OPybk1TkNc2nShqYnoxA8zt0prFsM1jpxDqWReX2Quu2Y
 sNyovjpjlhgKZk0ckY1WOmbtWFJRWL2FsTf3AVMT1OLAc4Oo898ZsaTeHsAcMsJ3mq+0
 MiKcm5YGfyGCnun6GZ351ydoC1iDIZhjdDdBtvOSxfA5sjyuoucVOjhCRZLjND9d33Ux
 79xA==
X-Forwarded-Encrypted: i=1;
 AKwUvBxfvYxXJtlpDPjmarNWE+XWIyzb/k3QTGiwv9wytTmDmjJctVTlHvuCofdQchkBKxELV8C+fyRPKg==@nongnu.org
X-Gm-Message-State: AFuF++kvFY5kmBr32+iL3/hLQu2YraieP1brqfbdcl7LsK8shy9nK+t/
 tzDoUiRu/LxcdBK2uKDaNLy6lC2oDEfVXzsb7jn1AJ+mWWxA/fciInA5OCptDE+vdMzq6/ccqpQ
 yJZweIwZbi7b7nH1bHXYn4BC+5C0Wpq0Gtepgp80ELejUyYrPBfiH3nc=
X-Gm-Gg: AYBFou0bZ1YFnkq1LTdz9KRKCOfo3+97rgbGxMimMqhxwYu+BuDekOmsDKpAgL3pRyj
 I6yMXhygb3YPi/nF2p017O6T7MuL505FKBuTIDq1QdcXTk5wr3ER00gmqW1VwJhd2IicuouFNyd
 aO5tdpw4cMKEk/tjxKegqIQZfnJ4erjkWUDnVju7QiDgaTiZsdnQgLIrx4BdyTarvttja1HPGrZ
 iaOU7xmNmx6PF/UiziWVy7koRTGb7/YV9dS7R9HXKAQNcPh26/AUgXrmH5qPJEEAI/PPsCFxRij
 O8keHMBl28ri5HDN3ynf1jhxsb60zNjCFpLEByhhDkVPlqwi04gbD5d8oTJUNjzMaMCWYyTafM7
 E76mMQmZ6AoJiNMHDxLhalfHwBbwJdHETvA==
X-Received: by 2002:a05:620a:6493:b0:936:77d7:55a4 with SMTP id
 af79cd13be357-93c43cfc87emr2595193685a.19.1790684800644; 
 Tue, 29 Sep 2026 05:26:40 -0700 (PDT)
X-Received: by 2002:a05:620a:6493:b0:936:77d7:55a4 with SMTP id
 af79cd13be357-93c43cfc87emr2595187885a.19.1790684800031; 
 Tue, 29 Sep 2026 05:26:40 -0700 (PDT)
Received: from [192.168.69.225] (pmd666.hd.free.fr. [88.187.86.199])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48af50abad2sm3307215f8f.37.2026.09.29.05.26.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 29 Sep 2026 05:26:39 -0700 (PDT)
Message-ID: <95bc55f2-9f89-4927-917f-6c83723dc3d1@oss.qualcomm.com>
Date: Tue, 29 Sep 2026 14:26:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 36/42] hw/char/imx_serial: Avoid casting from void *
Content-Language: en-US
To: Bernhard Beschow <shentey@gmail.com>, qemu-devel@nongnu.org
Cc: Phil Dennis-Jordan <phil@philjordan.eu>,
 Alistair Francis <alistair@alistair23.me>,
 Peter Maydell <peter.maydell@linaro.org>,
 Alexander Graf <agraf@csgraf.de>, Jason Wang <jasowangio@gmail.com>,
 qemu-arm@nongnu.org, Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>,
 Jean-Christophe Dubois <jcd@tribudubois.net>,
 Gaurav Sharma <gaurav.sharma_7@nxp.com>
References: <20260921214710.29422-1-shentey@gmail.com>
 <20260921214710.29422-37-shentey@gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
In-Reply-To: <20260921214710.29422-37-shentey@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI5MDA0OSBTYWx0ZWRfX9J9szb7bMzHn
 N59CQJ6rlGyQoa847GXloHeg7MDeud25tCxhVMkeI+x094BXPhE2kXHuolOFbU5c5Agdcge2Hvt
 FJZeGo4PVeFIe888QLLfdc1KXOnp8lA=
X-Authority-Analysis: v=2.4 cv=ALbfqNVA c=1 sm=1 tr=0 ts=6abbae83 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=1tSEMpTH9XP_W59IOagA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=iphPbDPzkScA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI5MDA0OSBTYWx0ZWRfX8tqKb2TpMbBQ
 sLMNNF0h/+00zWAfU9F7qXoWFi1MO9x8I+HFzFA3NoBBVek7ggml7usNmZ+cFKbc3pG6WJtnz68
 17RHVrv5ctTicHBzVB739SxJ6dC/fCCZnU+o2d8ps6QI7b+u4S8aNmYyLdBbcMVjhfOV4esp6DS
 unqOodfDNsxeDH32mBoI3zaSBSLeCRNknN72iKR5oOhUyaQB1e37b6YI5Y6doyKilI1/iXuXh0W
 rnU02yZdchFVM9b66S16Cimpxg7iY92vCheoND/O0HS8ZH2UFsw1GU50JPfyGKlNhxCve4wcWR8
 baZGr/4TZtLDDLHTuUGywvg8QAJihDEne5am1fp09zPP3TpmcaBPFv1TG9jVGpIAZuGkNNUFQfX
 3WtPOeHX94p1uP/cHRzF5CMx49zXc+NeY3LEdst3XEmJdNeJrJvGVTLU3q9KcLkhF4OShMyl/ge
 92O63lcVH6o2IgnTZpw==
X-Proofpoint-GUID: UIxVn8JCfMh1Y4qof9fDw6QdSPyIdwcB
X-Proofpoint-ORIG-GUID: UIxVn8JCfMh1Y4qof9fDw6QdSPyIdwcB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-29_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 spamscore=0 clxscore=1015 suspectscore=0
 impostorscore=0 phishscore=0 lowpriorityscore=0 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609290049
Received-SPF: pass client-ip=205.220.168.131;
 envelope-from=philmd@oss.qualcomm.com; helo=mx0a-0031df01.pphosted.com
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

On 21/9/26 23:47, Bernhard Beschow wrote:
> Signed-off-by: Bernhard Beschow <shentey@gmail.com>
> ---
>   hw/char/imx_serial.c | 10 +++++-----
>   1 file changed, 5 insertions(+), 5 deletions(-)

36-39:
Reviewed-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>

