Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B1D3C5DF81
	for <qemu-arm@archiver.kernel.org>; Thu, 20 Aug 2026 15:29:21 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wx4h1-0000qv-9m; Thu, 20 Aug 2026 11:28:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <brian.cain@oss.qualcomm.com>)
 id 1wx4gv-0000ld-O5
 for qemu-arm@nongnu.org; Thu, 20 Aug 2026 11:28:30 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <brian.cain@oss.qualcomm.com>)
 id 1wx4gt-0003si-Ax
 for qemu-arm@nongnu.org; Thu, 20 Aug 2026 11:28:29 -0400
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 67KE7rnV2444662
 for <qemu-arm@nongnu.org>; Thu, 20 Aug 2026 15:28:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 D5tEUgkATbXtPs1itPNBDCfx+mXdUP7NE+SgBr2PHD0=; b=Op6Z8uouz/3587yi
 AtpW2oA32elrE7qdvuNLUL7/zrRvZ1dRqm+jg/g8QHGzorCwayTGcu5gDJzw40jy
 Ckuwvz8jT5RFEIwAbDDqy8SgFeWQsqTdgvOLT7QeedGN+WddV5GFf9lW1W/1j2Vy
 ANMnb8f4DAPvIJCbYv1pg+s8zuLh060FmzXaA7AEYvOagCDy/UJuf48iw8yqA11M
 UmWE3JpaeYyVKnlN9YecqJtpKmsPWgn858jootZLhaJpu4679maVQOL7p/Kofb0O
 juwyy+EB4goMYcK+HkKJku5KVkJhxZZ0MibsOeyzdEXipb6EbbFlirjZH6j0WVIm
 yXHFMA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g5x05sqvv-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Thu, 20 Aug 2026 15:28:21 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id
 d75a77b69052e-5276aa86d00so27184381cf.2
 for <qemu-arm@nongnu.org>; Thu, 20 Aug 2026 08:28:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1787239701; x=1787844501; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=D5tEUgkATbXtPs1itPNBDCfx+mXdUP7NE+SgBr2PHD0=;
 b=IH8QA+NmaIbnmm9YqBPObp0C46VtAl0Ku2NOwDClF3XlRUATb/2+bEsuKSNvtNlgUX
 2jfq+4vqWW3K/CuUaA5OTra7NHAakbtCqAkaHemU8YPLUK7aUpCXt22AeTctwqhXvBeO
 JkneqhZu+2KEUkKN8eDAwFK+BYHlaKDQ9ZsMPvuL30JA76de+jN399C4NSNU8+bKKSZZ
 FgPx1d4lbbRpT37DZQ7MoyHauBVaONhMO1RUjYNf6Lr/2+D7h4JfeNnAZevHsqexbDiF
 eZKNBJOQbuCPxD1+XPVWARLkUQ8Yb4qsE6Hz4G3xN9o3zghPyUW9jaynypHtHhTujsX/
 SSrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1787239701; x=1787844501;
 h=content-transfer-encoding:content-type:in-reply-to:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=D5tEUgkATbXtPs1itPNBDCfx+mXdUP7NE+SgBr2PHD0=;
 b=q47nuJ5PkRSq8sNYdLrBvqUfASv4YP4xOrkVaFy4IZESDSn82wtnOV0PSkzZ5g02Uh
 7H6I5F4V6qqdS/YFgzQ17UiS8p08CLNRb85lt54pkqlKLt57YwNeCFNXzfnYca1uVaFi
 r96380OiC91uni12/3D/RlZEfMjX7y+DxANoFlyG7Ivvia8bS1TuAwo6xPj9v0M9o38I
 GJwhcCh9U+t7IRu8qgrFHJ3bMww6Shj1FYH8ocp3hffcPAoF2ZfP1CKUh/GBNA39OaT+
 I6fLU8aKIhSyZC23/1Lg/+yWfGmOKbAkGdn5DVZS8yXBuLLnH6fCVFEMxJRS0Gh5vZCD
 XFSw==
X-Forwarded-Encrypted: i=1;
 AHgh+RpRhAyu7jhJ/xsrOFeixhQcFoPMNtzCJZVbTOegapy1MlE91KCCZgMrkQRIl0MZcMppQrcfYx+fQg==@nongnu.org
X-Gm-Message-State: AOJu0Yw2BnpUCVDkaXsysIbRILYOH2VPGqbrJyg2H1eSQIt8HchQXHlc
 2Iw5BMkN3I5BF29Fd1NywPDG3liSAtlgm5QCVwwi2HsTf97kc5m7YErjtCXrqmX7exbFIRnFujB
 rAmemxypk9oYtc8sW9qCKleILvzU6CXq6e/4W4eiZX99hOcksust8vD0=
X-Gm-Gg: AR+sD11NTsWc0K+6XPevMtmp+rDg31EpQUZq659+hNf0//aiu7ddggz1FLvr629N9A7
 IohupjBuD/sZEXRtpAhgKw0BloQuD7ZObyM0lx3PsJ7MP/464e2lUDneuwUoQdNUrx/gpezvmZO
 lzj/WQr0AxHWB2AjXOfK+YiyBSzIGb3c+wBCZjepEdKA9x6mHxL8tRWyQkqowjXEIsknJ+TTrXA
 KPRWsqWM1S9vDAwUwQz+EEyhhAUWyExGYfZm5gKv8mAkIj+KrIRWQ9l35Pb+SmzTbYFLzzMCJAU
 FSVXSa2BIc5zDrms069Ke8PDQ6XHNAu1MWpJ3fpZXmkGzfTlkQwmaxQwFSAbKs71NiyxqXuC1Wc
 bBzDkaRDrgo1LSw+eGqjZC5mDO0wKW+PQJLmRVvVjWLv8PbnNCAQXmTQLQxLy34YI
X-Received: by 2002:a05:622a:147:b0:52d:9879:8532 with SMTP id
 d75a77b69052e-52dd5cd7b84mr104163341cf.20.1787239700329; 
 Thu, 20 Aug 2026 08:28:20 -0700 (PDT)
X-Received: by 2002:a05:622a:147:b0:52d:9879:8532 with SMTP id
 d75a77b69052e-52dd5cd7b84mr104162521cf.20.1787239699721; 
 Thu, 20 Aug 2026 08:28:19 -0700 (PDT)
Received: from [10.222.168.219] (Global_NAT1_IAD_FW.qualcomm.com.
 [129.46.232.65]) by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-52dd857b049sm32667231cf.4.2026.08.20.08.28.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 20 Aug 2026 08:28:17 -0700 (PDT)
Message-ID: <fd1d2cd6-c470-4d77-8df9-3511737642e4@oss.qualcomm.com>
Date: Thu, 20 Aug 2026 10:28:15 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 11/13] target/hexagon: Constify CPUHexagonState in
 hexagon_thread_is_enabled()
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>,
 qemu-devel@nongnu.org
Cc: qemu-s390x@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-ppc@nongnu.org,
 qemu-riscv@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>, qemu-arm@nongnu.org,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
References: <20260820104730.25462-1-philmd@oss.qualcomm.com>
 <20260820104730.25462-12-philmd@oss.qualcomm.com>
Content-Language: en-US
From: Brian Cain <brian.cain@oss.qualcomm.com>
In-Reply-To: <20260820104730.25462-12-philmd@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: mERCZtAQBhAQJz3IPMhCOe7sor6TgRtU
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODIwMDExNiBTYWx0ZWRfX002jxiPfqqyp
 RF8j69NnBmbBP6NKw2DHN7CDbzwGncUk40b4ua1wUAJ3lvtqB57q/7WKOA67FHGbhatXaEwM/ME
 MfUO3wwPX7Er1n0VZAbrQWNJtYAszEqhTkU4Q9A4GFn5wY5ts/U9t1NQFFHYVMl2Si5M44o3Hq+
 6trhhMuCN2TbHRwedHdqcNmvq5KneRvr7kSgomOfGTgN1xOWVfrdJBOyxk8oI0hLnBhkpwx4kc7
 8zO3ccMPBBCSjvD4YzvHZGEyLZ9Gr0YNuftpDLComNF7iTkl61sxMcUVFlfcvrp1VlA2EHu/yiz
 j/6LLiLvDeAXX4roS17H/rQ6kYTvlq9fWqzeYSvMXlrLEVIvj+g69Ql19kQZrp1CwH12FGb3s2y
 HXC7sh83nUyRvrvHTZCCfYbGjnru5WjiPNSP5H5s0D48o97oCczSjSaFT6I3bXAvN3gjIetJg+f
 /f4dyFiJSZM4jj3GOAA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODIwMDExNiBTYWx0ZWRfX4Zq4gUEHmUtA
 JZiEcpGAfMMunoa84iEJd+DCMf3dKpPQiiCs+llgBTWdBuFqUrcrA3F5VWEA9SNdEq0vrTaDiZG
 50cronoDXRtCFbX4TFrdP8ttFhmMRRE=
X-Authority-Analysis: v=2.4 cv=VfPH+lp9 c=1 sm=1 tr=0 ts=6a871d15 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=GFBKWpBzVshaxgVpWEgA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-GUID: mERCZtAQBhAQJz3IPMhCOe7sor6TgRtU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-19_06,2026-08-20_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 phishscore=0 lowpriorityscore=0 clxscore=1015
 priorityscore=1501 suspectscore=0 malwarescore=0 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608200116
Received-SPF: pass client-ip=205.220.180.131;
 envelope-from=brian.cain@oss.qualcomm.com; helo=mx0b-0031df01.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=0.001, SPF_HELO_NONE=0.001,
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


On 8/20/2026 5:47 AM, Philippe Mathieu-Daudé wrote:
> Use the recently introduced env_archcpu_const() helper and
> qualify @env as being const in hexagon_thread_is_enabled().
>
> Signed-off-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>
> ---


Reviewed-by: Brian Cain <brian.cain@oss.qualcomm.com>


>   target/hexagon/cpu.h | 2 +-
>   target/hexagon/cpu.c | 4 ++--
>   2 files changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/target/hexagon/cpu.h b/target/hexagon/cpu.h
> index c50fbb3f72a..e4f120eda17 100644
> --- a/target/hexagon/cpu.h
> +++ b/target/hexagon/cpu.h
> @@ -216,7 +216,7 @@ G_NORETURN void hexagon_raise_exception_err(CPUHexagonState *env,
>    * @return true if the @a thread_env hardware thread is
>    * not stopped.
>    */
> -bool hexagon_thread_is_enabled(CPUHexagonState *thread_env);
> +bool hexagon_thread_is_enabled(const CPUHexagonState *thread_env);
>   uint32_t hexagon_greg_read(CPUHexagonState *env, uint32_t reg);
>   void hexagon_cpu_soft_reset(CPUHexagonState *env);
>   #endif
> diff --git a/target/hexagon/cpu.c b/target/hexagon/cpu.c
> index 9765716b516..7ae5740899b 100644
> --- a/target/hexagon/cpu.c
> +++ b/target/hexagon/cpu.c
> @@ -345,9 +345,9 @@ static void hexagon_cpu_synchronize_from_tb(CPUState *cs,
>   }
>   
>   #ifndef CONFIG_USER_ONLY
> -bool hexagon_thread_is_enabled(CPUHexagonState *env)
> +bool hexagon_thread_is_enabled(const CPUHexagonState *env)
>   {
> -    HexagonCPU *cpu = env_archcpu(env);
> +    const HexagonCPU *cpu = env_archcpu_const(env);
>       uint32_t modectl;
>       uint32_t thread_enabled_mask;
>       bool E_bit;

