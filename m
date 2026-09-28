Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BFADC9833F
	for <qemu-arm@archiver.kernel.org>; Mon, 28 Sep 2026 10:06:48 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xB8Fw-0006Nr-OB; Mon, 28 Sep 2026 06:06:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1xB8Fv-0006ME-EB
 for qemu-arm@nongnu.org; Mon, 28 Sep 2026 06:06:43 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1xB8Ft-0001E5-TQ
 for qemu-arm@nongnu.org; Mon, 28 Sep 2026 06:06:43 -0400
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 68S9M6cs1445810
 for <qemu-arm@nongnu.org>; Mon, 28 Sep 2026 10:06:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 CljvZEFQAdMtbaPvMfiOFg0AK10LzPiqYmEnv2ZTMec=; b=djzaeNZnmtCVTeAv
 Lq7uI+8RAd3leXu7xRDaDKLPWuDKlNt4j+ajhWfnpZpOG6jVFa+vMuArlYvarxwV
 ABgEHuGWhHG76DzkYnNRCu+H7zfEQPLDXUfNlHnbiqxQlvMUc36BlyCtHeCcmVo8
 61bVeIWG2fiqM/mGerFHT591byAiEA5Oa9XRrL5wqvidELump/7KWbWAz9cVmKXh
 x9iyBeGsSRoQ9Z3caRFwR84fIcwYUTPQpkkFRfisOQUBFEvCfg7RgC5M5SAdPu5B
 tc73WB9rYus90PXLo/XCgAEfkh8DoSus9y1r7t+8er6HmTgoGYec5F9az6UmR6JZ
 PMCIqQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gynfkr6cr-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Mon, 28 Sep 2026 10:06:39 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id
 af79cd13be357-93a0c7126e7so530766285a.2
 for <qemu-arm@nongnu.org>; Mon, 28 Sep 2026 03:06:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1790589999; x=1791194799; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=CljvZEFQAdMtbaPvMfiOFg0AK10LzPiqYmEnv2ZTMec=;
 b=capTQnIPewgLmsFesUfuOgf65YSNGz3Sod8vF06C9nP/xmRn7Yv6tFGdjcY318rHja
 7WpGnVQNO7hCUhSBGurCqSNllRP+pD8wixpqxrDLO3c4tJBJlq43AU9Xrl4W9V7B7yJF
 Je1+XD9K5rWrPPHYDs1wfB9PVkbZNcT40W7o/65YLMLI0peiDiRO9FN/3yjBnbMhuxq4
 ACU357jeva9zs85SFxSuNqHmvVUUIbmryxoRtX9PICVFtAGhIqI1CPHE88Ok7n138BMz
 6iTmsUVNh+ZhWEcI4gJLBXMYlCHYv3SWVRp5REnF2V3m68b6xSdVj3cl37H13MOpHFGu
 pFQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790589999; x=1791194799;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=CljvZEFQAdMtbaPvMfiOFg0AK10LzPiqYmEnv2ZTMec=;
 b=FC6zp6ZSIvq5xQqExmIIVLWBbC3BzHmIXCL0pV89QnAjlA4UwU9LPXSVqzE7m8Kvnw
 2Skg+TKD5QGo1WRBYaMpXuUngFGlmsTuZxazbeJF31TClSQji0D0Uv2cAAbOQK9qCeo4
 CivdmPjGjpjTVtCtNna9lLuNWqIMF7OyBemY6t2Qa/zDRscglR7iHYPlzD9ExFoAQobk
 5uQrBBYgZpg0bTuYMZR2ySBB2n8hell4+Ve8Q1cbfXRLK/pOQUHiBOtpIjwGf1BAV4Cn
 2tnL+7RPhuQHNAji5S9iGw8Yf3O0AOqb2AsH1m0bDa+23nG/rUNoJF2RTIc398d73la6
 hjhg==
X-Forwarded-Encrypted: i=1;
 AKwUvBybgJZSefjTuiBb55q2gQ4HQt0y0D5bFNTS4AoPHQDZzR2ECStQXIAjhFdc742DTypObZRrpap6Kg==@nongnu.org
X-Gm-Message-State: AFuF++kw+LU+VttNpkp5v36luHQpQBoDqO05/6taRNHentHwOOul83qW
 H6fTFPtHKaJK4Vvo2iZgXe/QM3alLSultHmPNaosJqPUa+riFI6R2n4pknFBWIkWglvp5LoFtOj
 VboZWj8Asnr8G4f+mnwiablYD6O9gP3KXyalA1U5/Y5P54r+oyhmhV3k=
X-Gm-Gg: AYBFou0nNkTdiCCng/WTCpV7HMoXX12ReunZz1GcalpSh5L2rnmQL7WohoGz5XL941o
 nhUVEqOAuXjMJcfSIm5lmxTkxPWiNGpfZ8p/Kvwz5DI0ZDtXVeJvf+5F6tw2fSAp1v3Dot8SKLM
 RTIueqi3YJYEAfP44fDKYlHrMy4V0BaGzYFi1yjjoRCCixenMagDZS/OQoTWcEipDEl3p5nzjvM
 Ye9eOnZsBBOYEMgSd0yJjMh9K8v5uJl/ikWu6Cbw2SUOmvPOgaQnQGmCIEsPVE4Mpuah98n7LBO
 n9GY7tzio15DdMyvQyARIOpoSAvdYzK23MKoLdPo7rztzaAE7+TNbmkoGCrKGKuPfzryyTN6Dyr
 a2NXAAhZ5C8ck4R57na+L5e1nXqZpRUl0iA==
X-Received: by 2002:a05:620a:2548:b0:93a:2d07:142f with SMTP id
 af79cd13be357-93c43b833c3mr2024214685a.7.1790589999330; 
 Mon, 28 Sep 2026 03:06:39 -0700 (PDT)
X-Received: by 2002:a05:620a:2548:b0:93a:2d07:142f with SMTP id
 af79cd13be357-93c43b833c3mr2024210785a.7.1790589998880; 
 Mon, 28 Sep 2026 03:06:38 -0700 (PDT)
Received: from [192.168.69.225] (pmd666.hd.free.fr. [88.187.86.199])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4887a3625ccsm28028826f8f.22.2026.09.28.03.06.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 28 Sep 2026 03:06:37 -0700 (PDT)
Message-ID: <b08562d9-cb3f-4e91-a20b-794576079708@oss.qualcomm.com>
Date: Mon, 28 Sep 2026 12:06:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 15/55] target/arm: allow -cpu host with Nitro
Content-Language: en-US
To: Yonggang Luo <luoyonggang@gmail.com>, qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 Fabiano Rosas <farosas@suse.de>, Laurent Vivier <lvivier@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Alistair Francis <alistair@alistair23.me>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>,
 qemu-arm@nongnu.org, kvm@vger.kernel.org
References: <20260926070057.1234-1-luoyonggang@gmail.com>
 <20260926070057.1234-16-luoyonggang@gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
In-Reply-To: <20260926070057.1234-16-luoyonggang@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI4MDA0MCBTYWx0ZWRfXydk2JFh19DCG
 pxsUUj1quqEoEkxhfU6AbGuA6NHzeoSs3xY2XIFzHiPRmseEi73dOCawhufEMWzfrgC/QyvJazE
 hDwN4TA3YXGZXVGnxSGl+eb0C2H4A6SBTJlpAfP8woheGEdrD9aVchKbYJtlFDGzmkXiygZJgxA
 7/94jADBn2FMz9DPjbw8dio3sG21cueM/ENWxlvX3IdUbWck+Pd7+ifJtd0g6zCT42nWJNbinqh
 d+xrcM0Jb+OOJe7rIzbqV7P7cotkj7CHW0jRn7tIQrnUyMSAa8zTGvpk+QLBOkmMQjBc/XHCS4F
 NDdaCpRZIhtH9yfjXIBFFkxtZpUW96qbmvRKqO51h+2sP6R4lX0TgzrF7YeboUBCXkyCooTLfiu
 bR8NZYHbsY9a7wUhVs6h0+5+JoaOFCMjm7Cfedw+epOi9Cdueqd3bzt2GftmGQTcWRSYqL2LNRo
 KojO+Tca5s7YhwEHjMA==
X-Authority-Analysis: v=2.4 cv=e6aT2qp/ c=1 sm=1 tr=0 ts=6aba3c2f cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=pGLkceISAAAA:8 a=ZfbxjF3Mmzy_Fv5pO5cA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: LvuYbi6LchfwCAPwSbhw7vwMxWR__yff
X-Proofpoint-ORIG-GUID: LvuYbi6LchfwCAPwSbhw7vwMxWR__yff
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI4MDA0MCBTYWx0ZWRfX9YbA47wP/w/F
 LXqdlSi0euJ6y0lOwdQYBx7jy29tavrS3Ja9lW0VKQESScnwG7YPGDc+Uq7OJTREUsfX3fuyucl
 Gyqiq/JAHytTQ+oMIrm7nBTaBlMTxOI=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-28_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 adultscore=0 suspectscore=0 bulkscore=0
 clxscore=1015 impostorscore=0 malwarescore=0 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609280040
Received-SPF: pass client-ip=205.220.180.131;
 envelope-from=philmd@oss.qualcomm.com; helo=mx0b-0031df01.pphosted.com
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

On 26/9/26 09:00, Yonggang Luo wrote:
> Register the AArch64 host CPU when CONFIG_NITRO is set, matching
> the existing initfn early-return for nitro_enabled().
> 
> - Add CONFIG_NITRO to the aarch64_cpus host type guard
> - Treat nitro_enabled() like the other accels in realize
> - Mention Nitro in the host-CPU realize error
> - Set host_cpu_probe_failed instead of asserting when only Nitro
>    is compiled in and it is not selected
> 
> Signed-off-by: Yonggang Luo <luoyonggang@gmail.com>
> ---
>   target/arm/cpu.c   | 5 +++--
>   target/arm/cpu64.c | 5 +++--
>   2 files changed, 6 insertions(+), 4 deletions(-)
> 
> diff --git a/target/arm/cpu.c b/target/arm/cpu.c
> index 090470da40a..c138c4c0587 100644
> --- a/target/arm/cpu.c
> +++ b/target/arm/cpu.c
> @@ -1835,8 +1835,9 @@ static void arm_cpu_realizefn(DeviceState *dev, Error **errp)
>        * this is the first point where we can report it.
>        */
>       if (cpu->host_cpu_probe_failed) {
> -        if (!kvm_enabled() && !hvf_enabled() && !whpx_enabled()) {
> -            error_setg(errp, "The 'host' CPU type can only be used with KVM, HVF or WHPX");
> +        if (!kvm_enabled() && !hvf_enabled() && !whpx_enabled() &&
> +            !nitro_enabled()) {
> +            error_setg(errp, "The 'host' CPU type can only be used with KVM, HVF, WHPX or Nitro");

if (!hwaccel_enabled()) { "'host' CPU type can only be used with 
hardware accelerator" } ?

>           } else {
>               error_setg(errp, "Failed to retrieve host CPU features");
>           }


