Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0DCF606A31A
	for <qemu-arm@archiver.kernel.org>; Wed, 28 Oct 2026 20:50:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=OZKz2OjJ;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=DyzMon1E
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xMAaO-0003Rf-1y; Wed, 28 Oct 2026 16:49:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@oss.qualcomm.com>)
 id 1xMAaC-0003GE-BZ
 for qemu-arm@nongnu.org; Wed, 28 Oct 2026 16:49:17 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@oss.qualcomm.com>)
 id 1xMAaA-0005RS-14
 for qemu-arm@nongnu.org; Wed, 28 Oct 2026 16:49:16 -0400
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 69SIPDMX2969680
 for <qemu-arm@nongnu.org>; Wed, 28 Oct 2026 20:49:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 KPiLMfEuY9N9FK6Ioiqp9e8AHt0hBtl35Btg8aT9T94=; b=OZKz2OjJsPEgWcSY
 rCS+cmLjaxDaUqcLYUQmz21JL0ZOdI2tWUnrKNR3Hpz6M8bv52BaC1J2Zip4SMm6
 Mskog2kubNylVFDiliQ2ym7PwUzPfF54qKhB8Szs182zaDdzlFJACb1iRdMRZtjk
 slmhqEipCrr35zRBM/agIU324TSrlYM5yLhgk1Qed3c9sST/GIQGHC2Q7tfPVzKj
 3t9jLHT6R+B8ITkzs3QbfAgzYAStJ6xtuvieOYot5TwiHYZHDC5WJPy7IBR/NBS6
 abouQUwGVjNyG6/QCGbbADhqxX+Yo6YFiI3gOn3ZSXC5UM7ocQJBenxbzLWzbzd8
 c447bw==
Received: from mail-dl1-f71.google.com (mail-dl1-f71.google.com [74.125.82.71])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hkkehseqv-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Wed, 28 Oct 2026 20:49:11 +0000 (GMT)
Received: by mail-dl1-f71.google.com with SMTP id
 a92af1059eb24-139b62317d0so4010617c88.0
 for <qemu-arm@nongnu.org>; Wed, 28 Oct 2026 13:49:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1793220551; x=1793825351; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=KPiLMfEuY9N9FK6Ioiqp9e8AHt0hBtl35Btg8aT9T94=;
 b=DyzMon1EF1xrPvzhG8Uo16Nl5N/4KVRHIv1ONdWJN4dSsgjdkTQsfhcL9mDmnVWMb+
 aINXVCuXmpdl8bEhBy1nRwgr5g8vbjlalkOicUIwm8yxt+JxsPlTO7z6C3PWynpWKCQT
 G8+AZ+ZG8+pILvCZ17CyPbjNAQaQYANVXEEfltt9UN71gtH8WLOvw59wKPOlko5k2I2a
 STazg9XzSLNjTUB1YA/l56S55set27aJcA+KqZCjJCLBEiKjgEifXdw/gxOXPICGCfmu
 nVizj0pXj5ElNHDK7JojvDhyiZaJWymCvxoLs2jbLUoGhAPdDfl+vgYxEJv/4hYvjZwR
 N+vA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793220551; x=1793825351;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=KPiLMfEuY9N9FK6Ioiqp9e8AHt0hBtl35Btg8aT9T94=;
 b=DaqC7PR/vCWyutAcUZ3+E/53YyNCPHYSgQwi5PJ7gwNSaACsk+BzJWsx4dO6D0qYAt
 d+5GjZfSUgHoX/Dvug8FOvz4DEwVlg6XDyM+1XmEc4giXLJttOw2kefVFfaM9xcm0vUv
 uEZc0Z2cbuhZ48syZzIjHhYrvfoEYz/8fj0svkmmKnv7n9/AFn2JHtmfD9hpqVDkHbkQ
 85wbjGSZnJv9hMF9YC2geLq/CE0JGMLoUuKYzuSsCMTLnyZ853f12FKggiUVuPW0aLR3
 IudgsoEz67uWAo5JVBHwZcgroWeltYEMNA+NO3bww+x+6JYnWOlo8ONu4K6xKAaJMsCM
 oowA==
X-Forwarded-Encrypted: i=1;
 AKwUvBzr+E6cJ8GKj+CmfyAyrXjTswTTbyi9vQ1qnNLsy2t3rlA6Bhl5ZoEPdfjEb2BgYyzXmfTpX0Xwsg==@nongnu.org
X-Gm-Message-State: AFq9FYJmHdjKB3+7+ctWMTMgbWbPL6Y8c10h4eXNCQjXBdjS/WTD1xNk
 YKlFokUdbE4BLzX+mbHlLQnTPuwhrxqfztCJVO0jBbyGoV3QoLR2Ap8y37glwySUwTTBG8i+Cgc
 XJXpDKaPLq5KP4PkUGvVqCL3zb9l1+d8f1c0CL3BEjuHdg3988tyReqM=
X-Gm-Gg: AYBFou1exGuv7aM9fMsUkaTQYY48jv4n5lq7NaTWnEB8vxy5D1BLBQdAzk3CdWsoBLF
 +E2CLCywqksRkIyh/5jlhhmsoQJtYcYTFt9Rz2sH5b4y1EkXu+T8apSAwKXWIukJ9pFyliQD2mS
 C+4aMTtwaY/hQ+G/qvWZ6Wz97u3hq19EhU/WGgVEDhhTy+TZ46x3kboUwVmG3umuBZJ/0T+4zH3
 Mtvba+cyFFx/8BwE5PBzSn6/zfs/PBvNGYpff7BCjCpMa19fZ1f+vwxw0TzPxLMpGh65d/9gYmr
 1aZI+y35nw8G8WSVAZoUoZQ0ttMAH3fV5Gq/oxj6UL9m5w5ec1beDXQg5VJNHEomeTrn81k0yTk
 0cpIPp94adXjyZA4OC2IZxR8gd9FRDc3dyioKwBHWO/+K0t15d3IQTppu05cn01OprxoPZDCJGh
 vdTjm6UjkWgzDP0pVb0QfDyH0eN8mO74PpdCTQjtrOH+s=
X-Received: by 2002:a05:7022:ea45:b0:17e:ee5f:6715 with SMTP id
 a92af1059eb24-1a6cdb52f07mr4327230c88.27.1793220550728; 
 Wed, 28 Oct 2026 13:49:10 -0700 (PDT)
X-Received: by 2002:a05:7022:ea45:b0:17e:ee5f:6715 with SMTP id
 a92af1059eb24-1a6cdb52f07mr4327207c88.27.1793220550003; 
 Wed, 28 Oct 2026 13:49:10 -0700 (PDT)
Received: from [192.168.1.199] (192-80-163-190.dyn.novuscom.net.
 [192.80.163.190]) by smtp.gmail.com with ESMTPSA id
 a92af1059eb24-1a75d85f23dsm6901679c88.11.2026.10.28.13.49.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 28 Oct 2026 13:49:09 -0700 (PDT)
Message-ID: <50baca42-5591-4d9d-8071-07ef3237fe2b@oss.qualcomm.com>
Date: Wed, 28 Oct 2026 12:49:07 -0800
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 06/12] target-info: add target_not_s390x()
To: Yonggang Luo <luoyonggang@gmail.com>, qemu-devel@nongnu.org
Cc: "Michael S. Tsirkin" <mst@redhat.com>,
 David Hildenbrand <david@kernel.org>, qemu-s390x@nongnu.org,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Eric Farman
 <farman@linux.ibm.com>, Song Gao <17746591750@163.com>,
 Max Filippov <jcmvbkbc@gmail.com>, Cornelia Huck <cohuck@redhat.com>,
 Fam Zheng <fam@euphon.net>, =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?=
 <philmd@oss.qualcomm.com>, Matthew Rosato <mjrosato@linux.ibm.com>,
 Philippe Mathieu-Daude <philmd@mailo.com>, qemu-arm@nongnu.org,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>
References: <20261028201557.2688-1-luoyonggang@gmail.com>
 <20261028201557.2688-7-luoyonggang@gmail.com>
From: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20261028201557.2688-7-luoyonggang@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 8yedVPvm55Q9Zz37WddQ_UsSm6ciy2jg
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI4MDA4MiBTYWx0ZWRfXwK4+xZ9EKUUj
 ts1WknYmVVjD7PqoaBNfWfvTvyOYFCKncd4ZnB1hQBc85fKpwSiWl1Psae/T7DYRG7m7R9KWKp7
 7KYaE8iMm7Bt9XJFGK9EPxFmT8I0sMCFzwe5tBya0oiwQhN9l3wffgUb4TD+H6pY5G+rxDA7vIH
 jHSxEeA901gIIq7az4Ry/p3ymML3A/KOhYwhfRynCPM25RIcw0B72ox19cqrAwWli0g6wLuq1Z2
 2866kKw27Q4WCstrJ19ijvJPTepCAy4OCu3+MjOrM450IIpSPsSrbJR9cWDIax9+23bQVoLnybN
 NASVIDtFxgR1rTnEOyYaGlc44EZA/L3tIYzshL0de/EdheiPRDikK/5w04gciW9V8qFlwQFiPFN
 l8v3vB0XyPHTS1a6pbDN1ko+E7ONQQQ89cEx/P558PTuSGkp0n/0ciHcWyi+Ln8Kj7fXGliE9eY
 JRgIbWp4S4nPZ3v+0iw==
X-Proofpoint-GUID: 8yedVPvm55Q9Zz37WddQ_UsSm6ciy2jg
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI4MDA4MiBTYWx0ZWRfX6cLqc6tR6Po4
 WZWUncfFODTY83ADmbzst91iBG9Z7byCcwdF4IUgsfvjDIVeMX41oKiPiU0GsL4fpJnWV+mWaM3
 1Snrq1hHezxuLki1/qtA56SEGpHLMgg=
X-Authority-Analysis: v=2.4 cv=bYv+w+PB c=1 sm=1 tr=0 ts=6ae25fc7 cx=c_pps
 a=JYo30EpNSr/tUYqK9jHPoA==:117 a=9852oil1ID9t5xBSyQ/BEA==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=pGLkceISAAAA:8 a=cPbV9nJD0Ymvok1AWO4A:9 a=QEXdDO2ut3YA:10
 a=Fk4IpSoW4aLDllm1B1p-:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-28_06,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 malwarescore=0 bulkscore=0 spamscore=0
 phishscore=0 lowpriorityscore=0 clxscore=1015 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610280082
Received-SPF: pass client-ip=205.220.168.131;
 envelope-from=pierrick.bouvier@oss.qualcomm.com;
 helo=mx0a-0031df01.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, KHOP_DYNAMIC=0.001,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 10/28/2026 12:15 PM, Yonggang Luo wrote:
> Add the negation of target_s390x() so an is_available callback can
> select every target except s390x.
> 
> Signed-off-by: Yonggang Luo <luoyonggang@gmail.com>
> ---
>  include/qemu/target-info.h | 7 +++++++
>  target-info.c              | 5 +++++
>  2 files changed, 12 insertions(+)
> 
> diff --git a/include/qemu/target-info.h b/include/qemu/target-info.h
> index 1d6c6f4472c..4bc25789d8d 100644
> --- a/include/qemu/target-info.h
> +++ b/include/qemu/target-info.h
> @@ -134,6 +134,13 @@ bool target_ppc64(void);
>   */
>  bool target_s390x(void);
>  
> +/**
> + * target_not_s390x:
> + *
> + * Returns whether the target architecture is not S390x.
> + */
> +bool target_not_s390x(void);
> +
>  /**
>   * target_base_riscv:
>   *
> diff --git a/target-info.c b/target-info.c
> index 07dc88fd366..d9e15c939d6 100644
> --- a/target-info.c
> +++ b/target-info.c
> @@ -126,6 +126,11 @@ bool target_s390x(void)
>      return target_arch() == SYS_EMU_TARGET_S390X;
>  }
>  
> +bool target_not_s390x(void)
> +{
> +    return !target_s390x();
> +}
> +
>  bool target_base_riscv(void)
>  {
>      switch (target_arch()) {

Let's not introduce this globally.
Instead, we can define local functions where required.

Regards,
Pierrick

