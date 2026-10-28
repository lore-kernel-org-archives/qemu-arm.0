Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F57B606A31A
	for <qemu-arm@archiver.kernel.org>; Wed, 28 Oct 2026 20:57:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Z9lV5xVH;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=LB/5Lsjr
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xMAhp-0006kG-5u; Wed, 28 Oct 2026 16:57:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@oss.qualcomm.com>)
 id 1xMAha-0006az-Fx
 for qemu-arm@nongnu.org; Wed, 28 Oct 2026 16:56:59 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@oss.qualcomm.com>)
 id 1xMAhX-0006JA-FQ
 for qemu-arm@nongnu.org; Wed, 28 Oct 2026 16:56:54 -0400
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 69SIPnT11395620
 for <qemu-arm@nongnu.org>; Wed, 28 Oct 2026 20:56:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 hWYsdfBUBiupeyoRh6a+368mcsTHFLGdO3OnlEUj2eY=; b=Z9lV5xVHlYohQgfy
 HaXvWqZjypyHunxBfwlFQTTpU5GNQrLTKBWyPmupw9QG15M6eeW+uv+mwqYNG9Dz
 huc2lcH6HclZxk1u1X+3CUsf9H+83OXMDvEuLeRpxsD3D+PPsVKLIjR9UDggPjmC
 BYCPC5K+FcGNqM5oUSgswCfHaiN9oFQ78UVEOrAHojiPBsfjTWLaHHxpgH2+cWIj
 rDlztPiu9yfrZ++0RkkyUlDNkHX7z2NYjBXohs5vGP7h/K+Wj1mcSWwBvQeEQGKp
 xcshe3KBipB+X5ZVUpQJqTNplwrA8a0n0tJ0Y9rpdxS6htqUNVKs8B0ZtH7+ye8D
 TDpI2g==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com
 [74.125.82.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hkhtjhxhk-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Wed, 28 Oct 2026 20:56:49 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id
 5a478bee46e88-35c5aef2a74so4724169eec.0
 for <qemu-arm@nongnu.org>; Wed, 28 Oct 2026 13:56:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1793221009; x=1793825809; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=hWYsdfBUBiupeyoRh6a+368mcsTHFLGdO3OnlEUj2eY=;
 b=LB/5Lsjr0jwmjDJPd9Mi+qDLAV8GtVChherzBjv3/qjs1iYNwRd+qdM9rD6mjHftyv
 9sBnAkIio6bOh3NmmILSPj/OyLQ/zXz1H0x8o7bLeMgMMcRV5rLdd2F2H+tMlyc4YeZC
 cLC6ZRkrS+eh404pGmACNGUbou8GVFK0aQPGmBwDPVKPGgpNSvtX+C9Sh6mrk9+vbaIX
 i8TgRDkpfWzGJlA/6b7HEifO3km9ZDEwwtSHpdjw2wp3nbQQaVV/trl7sidbHkWuy9cH
 TrUKvCNXTvblXyW8MWuYT1eONV+zhJLC8NP4ODFflBGqdSDUWrDJvxFy0G8B+GzoMpCK
 TgGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793221009; x=1793825809;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=hWYsdfBUBiupeyoRh6a+368mcsTHFLGdO3OnlEUj2eY=;
 b=Gvqj/l4IjCmx+mC9/vnlAimsnBfEXOGdErOsAeKAF6RkX2i0LquuwiONv4TzAli41x
 Z08WikYXjYwUVZs922u7Iu1EHXZMyZGAqMdlsupH+mGw2/vPq7tKEo1oTgKJH6pQD+V2
 hFcxWT8lAxeeYIPhaXACRAFueHlSFzux3r/HtWvzRfBD/j1jV13eu3lIX99LnSWPlrs4
 oalCfNyziYGGdlY9IeyzlGBTVe88GOKUAPvS3o/CxWEm5PLOu3CBAxJwYHpms1+qDeC1
 79HU25R2nTV0fdefHXDb+OUqViy0DCpwi/8U+8ce2Sj0+uCa9QiR4O/pt5SNtyallDrd
 0gew==
X-Forwarded-Encrypted: i=1;
 AKwUvByARK4/XtoE0AlSDqpdQx/GS7YvY8uCjUSCa9YsWx4SnrpCLgbrT/X09O+oePb+Z/3qlou317Ph/A==@nongnu.org
X-Gm-Message-State: AFq9FYJ4xmhE4B0Te+a/xd08apfDGhx0HouGtFuQWJwiax3/UPKkATOX
 XikgHaArVC0MDvpq0YuMhHCESlDpTwt2AWcRlY+6UoivwsPLHHs4pGtjzMnr8NKeF1D5yQjgxrZ
 OgheQkC54gVKHWDsUkjdkpU8++VwFllGUI92zr5OYAe2nJhGmntMyguE=
X-Gm-Gg: AYBFou0ElhGGF70nH0389xLBGQJgIjJqWRuRk9Qd4f+NMRkPwAxZYxp5512aM7iKeqG
 HikkXlAi6QpbzmD261yQlAtUotnGaNNYKOEARKcnMJDxLoNgxjP/IHinm3W9QziAuBUx8hccgUe
 elAK4zewuBDRFE4LHlfSHLuB2/mPKF3GL8YfR4LeIWcmAjIkNF63j5/NU6EH1MqufImJQgFVHVZ
 b9fYBXZgDOEyqjt7+7PiFwSpBW8s1q8NV6T7WZs5OpXL5eBhAbcXuVuIu9LxP/vIYmzUX7xo2T8
 ash5C2M69mR6R3a4/PEfwucYJxCZfuM+1HqLpZ9MNiRdtpPz+4v1u9n+KjPbSuRrWNyC9ARdZaL
 IzaAnD+NiOTjK9l4XDSpQzaY3o/sTluaYyRdEgeJE6a9r1IYgSh7anpgEbZu9prNPJUMRGrUpDG
 ccXRazEJIt40e3wVUHKnescp/79qpXHR6mwdgO3Ub9qxI=
X-Received: by 2002:a05:693c:4196:20b0:35c:85fa:5a68 with SMTP id
 5a478bee46e88-36a2043f09emr5604182eec.31.1793221009055; 
 Wed, 28 Oct 2026 13:56:49 -0700 (PDT)
X-Received: by 2002:a05:693c:4196:20b0:35c:85fa:5a68 with SMTP id
 5a478bee46e88-36a2043f09emr5604140eec.31.1793221008340; 
 Wed, 28 Oct 2026 13:56:48 -0700 (PDT)
Received: from [192.168.1.199] (192-80-163-190.dyn.novuscom.net.
 [192.80.163.190]) by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-36a239644efsm14525270eec.23.2026.10.28.13.56.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 28 Oct 2026 13:56:47 -0700 (PDT)
Message-ID: <0c372e45-eb39-4917-9b71-20658dbd3b6f@oss.qualcomm.com>
Date: Wed, 28 Oct 2026 12:56:46 -0800
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 10/12] target-info: add target_base_i386() and
 target_not_base_i386()
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
 <20261028201557.2688-11-luoyonggang@gmail.com>
From: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20261028201557.2688-11-luoyonggang@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI4MDA4MyBTYWx0ZWRfX+lOhrMdLSJe/
 sU/JgBFYs5cHwrrDAZIACAsWcowxsxQtJuS0KtFUiQiyWvQxOQEgLlBvpJsDaHpIGE3T3DTKz+J
 fBzeM9AJA90y5JqUt85+JhvyBdnOPOMuKmIC0YUIRikmjsvtumAw4Fxcw4uHGS0RdUcuZakeZYZ
 nCLr/9eSiMbIuiRBfbBvQDDcmWIREvZj52HXlxWZuZr6V/zz4Liu2fi8z/zsro7f/MAScYXSaMJ
 rLQVBXyTNIeNpEdHPR/KLMXQN5ZScE7EdMH4aMzbGhp1bLWGHAcY6UotDSsZzG/yU1RzDN3vcoc
 dybxNL8ikA2QkakfGUMZ44JSH9+e2qO07gg5U2Fn1BBPpwqPliHihn7ppq+zvPtDz8PQse8flKL
 iUTLnIi1LOKeotz9+p7wp/sY+7ukILi/Bc5pu6YrQAgN7nGqB2kmU47EuuhVogwtKLy0EilyEet
 SnFkpVKv8cqCFuORT9Q==
X-Proofpoint-GUID: _Eqo4Ph8XB7k3vh1iKPByoiN6hnXqBWU
X-Proofpoint-ORIG-GUID: _Eqo4Ph8XB7k3vh1iKPByoiN6hnXqBWU
X-Authority-Analysis: v=2.4 cv=LdipeTfi c=1 sm=1 tr=0 ts=6ae26191 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=9852oil1ID9t5xBSyQ/BEA==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=pGLkceISAAAA:8 a=yzYXBvia8gfhOsAmHUQA:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI4MDA4MyBTYWx0ZWRfX4Gnik6geHXas
 wJ1Gu6wj5uQu2J70GiqJLnsfQbaFwz6G1sFLI2/qkUdVcu/PXOL2t+vXMxWDVHr0Ijx3HPhkLiM
 BRbeuWhYUfft2Vm6DtW/ICn3VgPbySE=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-28_06,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0 adultscore=0 priorityscore=1501 malwarescore=0
 clxscore=1015 impostorscore=0 suspectscore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610280083
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
> target_base_arm(), target_base_ppc() and target_base_riscv() report
> whether the selected target belongs to a CPU family. Add the same
> predicate for i386 and x86_64, and target_not_base_i386() as its negation.
> 
> Signed-off-by: Yonggang Luo <luoyonggang@gmail.com>
> ---
>  include/qemu/target-info.h | 14 ++++++++++++++
>  target-info.c              | 16 ++++++++++++++++
>  2 files changed, 30 insertions(+)
> 
> diff --git a/include/qemu/target-info.h b/include/qemu/target-info.h
> index 4bc25789d8d..48206d01ba9 100644
> --- a/include/qemu/target-info.h
> +++ b/include/qemu/target-info.h
> @@ -57,6 +57,20 @@ bool target_heterogeneous(void);
>   */
>  bool target_base_arm(void);
>  
> +/**
> + * target_base_i386:
> + *
> + * Returns whether the target architecture is i386 or x86_64.
> + */
> +bool target_base_i386(void);
> +
> +/**
> + * target_not_base_i386:
> + *
> + * Returns whether the target architecture is not i386 or x86_64.
> + */
> +bool target_not_base_i386(void);
> +
>  /**
>   * target_arm:
>   *
> diff --git a/target-info.c b/target-info.c
> index d9e15c939d6..32ba85691b7 100644
> --- a/target-info.c
> +++ b/target-info.c
> @@ -59,6 +59,22 @@ bool target_base_arm(void)
>      }
>  }
>  
> +bool target_base_i386(void)
> +{
> +    switch (target_arch()) {
> +    case SYS_EMU_TARGET_I386:
> +    case SYS_EMU_TARGET_X86_64:
> +        return true;
> +    default:
> +        return false;
> +    }
> +}
> +
> +bool target_not_base_i386(void)
> +{
> +    return !target_base_i386();
> +}
> +
>  bool target_arm(void)
>  {
>      return target_arch() == SYS_EMU_TARGET_ARM;

Same comment than for target_not_s390x, keep it local where needed.

