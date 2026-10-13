Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0848CC6B12
	for <qemu-arm@archiver.kernel.org>; Tue, 13 Oct 2026 20:09:03 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xGino-0001z9-2K; Tue, 13 Oct 2026 16:08:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@oss.qualcomm.com>)
 id 1xGinm-0001yJ-Fh
 for qemu-arm@nongnu.org; Tue, 13 Oct 2026 16:08:46 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@oss.qualcomm.com>)
 id 1xGinl-0003bN-02
 for qemu-arm@nongnu.org; Tue, 13 Oct 2026 16:08:46 -0400
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 69DE3u361460100
 for <qemu-arm@nongnu.org>; Tue, 13 Oct 2026 20:08:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 rj9r141RWtHB3KYqKxzY/ZhotZnYoO8l4GVKDBqz3qY=; b=bjAfv/x7qiv+PPDX
 sPsDojiCtMpRF0ntdsp+hbuOmtQsCY/yvrBlRqA3m/ck78En+Pl+lNnE1+qtgjC4
 B0qkvN91eCx4wEYmEoGS2zJ7sKZ/mimbb5tvf8en+sZHdna8zHmvtsmJExf8zviU
 t1sdx6W5bv7MBwIi6eoYXtXxZ/N7LtoiWAdnV7Ld2al7USy0S3bOmPSXju5iqUCv
 ttiLX4QwhnMBsYX93Nkh8MVNDijHSNSbvtY58SNz2dYHN+76m+49wzuaAUEVaytR
 /kPj6oCUqaBeicuRCBzPpZlm8fC0z4jXNSjidzNjE5YL4XfdiqsdHsUdlliVFVNF
 dz8z/A==
Received: from mail-dl1-f72.google.com (mail-dl1-f72.google.com [74.125.82.72])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h9hmjtvy5-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Tue, 13 Oct 2026 20:08:42 +0000 (GMT)
Received: by mail-dl1-f72.google.com with SMTP id
 a92af1059eb24-151ba226e1bso3647406c88.0
 for <qemu-arm@nongnu.org>; Tue, 13 Oct 2026 13:08:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1791922116; x=1792526916; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=rj9r141RWtHB3KYqKxzY/ZhotZnYoO8l4GVKDBqz3qY=;
 b=j4Yw0aGIi+QROmL2c8tpi651msLSBUu+iyDHpxt9q6QhXVPjCrArClhz+s34YsGBit
 q7ZB/qu+9s7dcOH0zP+pV4EENLQcOJs6Tz7kufeez5elnloiaBJKVm0/f1yanmYSGFjx
 CeKZVa4aEH2zb4xhLUrMFts3RGvF6Mh75TTVup6WdkNCDaLOtY8LBT9gs7nlezAnethJ
 3GXWg+EEPa4rp7WKGaMZSzEzFONusJuWoUxYS03f/jSDp3adwKGpPqsjhZoaDLQQ4p9G
 AYhp0gnxIvtiaLzT4XXhimCQjv9wVNRp2n4Ub2J3z5+DF25TIhJXjsmPmL6iXF/jAlo/
 Hi0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791922116; x=1792526916;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=rj9r141RWtHB3KYqKxzY/ZhotZnYoO8l4GVKDBqz3qY=;
 b=xwny5sMRI2Nk5FL6ZS6ZIFe+fROYF6ZSZi+H2IjtJOqxWHHSjHCk5BLHqKneTO+Hhh
 rDpBe/mgFrDekWkX0PlxrWAlY6rUHhjYhz6OHCMaStFVa1kT8J9adst+FRb1K0BmmdCm
 fM/24ltvhMV5fKPRpIyQw5vZ0E6GnchwR8frVT7u9pFPh2R97ptk39sw6xAudRcTeNVy
 jRi46lCOjJlzjM7ccxHnKzbxDVlx3YnjaSga0iAlOFnk5Zq/ZdpqVdnYha+Ovs+VnM4g
 O8fn45SIPmk5wKEYwdqp0RCEXC38NaA66O3gp8ImabDisXoGK00/pAl1kQWv4jwnWV0U
 kyAw==
X-Gm-Message-State: AFq9FYJdvNYmMMUdkUYFocowY/XRHmozkpeh5wIzgCCkwyhZy8A9rHWu
 JoWGDEBgG7i5qSIhYxhWfBrPksrZCoM8QhmO1ukjp0JJMo9R9TsVtAobU83ie4siC8j93bpj2qd
 2alMOyDIU89v3kV+Z4dujy7iDl1gA10/oHyVYOh41X8MtSoPMca5zic4=
X-Gm-Gg: AYBFou12djgW+IjbVQo17pGVG/+yORrrM+35o82ze0WGSiDbxU2rzhLw2ZDTqrpuu28
 cT00AYdgRFuhAO93wCsh8E0oAddrpe3H37Xzma/ddkYBbJICMQdrTgk2t4O7jFgf+iZOrI+2tGS
 AlQU68QtPkgVvP5tjmFjDHLPMxlgwxgl552Pb/v6LysMkOjdXhWmo8bmKJKQAhrnRpJiTDNBciG
 FkhvTX10LUsxtLWE0qAWfz3qHhQnEsfeWupajztLS28je/iiUi6GbgQziCGfUajEAAA688MI9ns
 vXeWqVszGdvyaU9gI/FDH7vcsNePGHSpgmTZjtwVhQYnn1BviUwKkd6yi315AaMSCVWYSc5ksj7
 pwZIsQAOTt0qUExQB0phzqzQdpg0Cc4aTNwvzmJ/pdatrhRp0dm9c/1N7Iw7yD3BjtT9sSw==
X-Received: by 2002:a05:701b:260d:b0:157:cbf6:89c4 with SMTP id
 a92af1059eb24-16a5faa76d7mr17283342c88.26.1791922116272; 
 Tue, 13 Oct 2026 13:08:36 -0700 (PDT)
X-Received: by 2002:a05:701b:260d:b0:157:cbf6:89c4 with SMTP id
 a92af1059eb24-16a5faa76d7mr17283293c88.26.1791922115504; 
 Tue, 13 Oct 2026 13:08:35 -0700 (PDT)
Received: from [192.168.1.199] (192-80-163-190.dyn.novuscom.net.
 [192.80.163.190]) by smtp.gmail.com with ESMTPSA id
 a92af1059eb24-169a442956asm51705646c88.16.2026.10.13.13.08.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 13 Oct 2026 13:08:34 -0700 (PDT)
Message-ID: <f3649d73-1edf-440a-9534-7b00da4d075d@oss.qualcomm.com>
Date: Tue, 13 Oct 2026 13:08:33 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] target/arm: defer max-v8 initializer selection until CPU
 creation
To: Yonggang Luo <luoyonggang@gmail.com>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Philippe Mathieu-Daude <philmd@mailo.com>,
 Peter Maydell <peter.maydell@linaro.org>
References: <20261013195606.152-1-luoyonggang@gmail.com>
From: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20261013195606.152-1-luoyonggang@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEzMDA4MCBTYWx0ZWRfX0wVB4gvtDL47
 XJzpIjoBDvCmNT0AhRqfa03Re64hI/uokzOvClsI2yk0oP5rRs9N2lRx71+z2VtoEt4C8hlJQtZ
 v3orHqLxDmi9x/raFBYwFRcJBzx7ehI=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEzMDA4MCBTYWx0ZWRfX5Cx1mClbRY96
 ojw2Z8pliJb9Sd+QfhBuG8Ee4jb76jPmjqNoXJwoKluC6TWgWqB2kG7IYR6jTteQtnT923WNpil
 +SvoWTipMAcCXmFk0/6cqiPfsDasNpBtbUJ9QuyruSF3qbJje827qsyf6xW3cCnYhD+Jad1am9v
 BrlQHyJhXkf2wOssAEgixywTkuwlDb34sni2+lE9JNzosNen5x30B9YUPQgLwkeHnMEFtGISgsj
 ncJouT+a0ZXXDuby/Ui+nvo5FcSmIfqnvMrFqNjzLkjauQVM+79PC4YvEZO+hpYXXwhf6q8Ez5R
 mYT5CavNXepiiIXske+ycO6tsYbkPfFNlwRqQfV8nW0/xcolp8eHhz8GKMGeD+qEkRe/5iWLb4G
 oYTo6Hmb/RpZ98MBDtDg8BeWtlczWom1xFmUKxorLzZIscEusWmvkLgk4D8YLwB1dCYBvz52md5
 A0z75SCEPmKJTT8YufA==
X-Proofpoint-ORIG-GUID: IPMp7Qz2Wu54LpvOK9TaMFGaB04KmlkO
X-Authority-Analysis: v=2.4 cv=O5+sLx9W c=1 sm=1 tr=0 ts=6ace8fca cx=c_pps
 a=bS7HVuBVfinNPG3f6cIo3Q==:117 a=9852oil1ID9t5xBSyQ/BEA==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=pGLkceISAAAA:8 a=lC7IDxeUqbZSPR3gfYMA:9 a=QEXdDO2ut3YA:10
 a=vBUdepa8ALXHeOFLBtFW:22
X-Proofpoint-GUID: IPMp7Qz2Wu54LpvOK9TaMFGaB04KmlkO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 adultscore=0 spamscore=0 priorityscore=1501
 bulkscore=0 malwarescore=0 lowpriorityscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610130080
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

On 10/13/2026 12:56 PM, Yonggang Luo wrote:
> This is for avoid "max-v8" qom name conflict in multi-target qemu
> 
> Signed-off-by: Yonggang Luo <luoyonggang@gmail.com>
> ---
>  target/arm/tcg/cpu-max-v8.c | 17 +++++++++++++----
>  1 file changed, 13 insertions(+), 4 deletions(-)
> 
> diff --git a/target/arm/tcg/cpu-max-v8.c b/target/arm/tcg/cpu-max-v8.c
> index 65f851f2006..d7323ab431c 100644
> --- a/target/arm/tcg/cpu-max-v8.c
> +++ b/target/arm/tcg/cpu-max-v8.c
> @@ -119,12 +119,21 @@ void aarch32_max_v8_tcg_initfn(Object *obj)
>  #endif
>  }
>  
> +static void max_v8_tcg_initfn(Object *obj)
> +{
> +    if (target_aarch64()) {
> +        aarch64_max_v8_tcg_initfn(obj);
> +    } else {
> +        aarch32_max_v8_tcg_initfn(obj);
> +    }
> +}
> +
>  static void cpu_max_v8_register_type(void)
>  {
> -    static const ARMCPUInfo max_v8[2] = {
> -        { .name = "max-v8", .initfn = aarch32_max_v8_tcg_initfn },
> -        { .name = "max-v8", .initfn = aarch64_max_v8_tcg_initfn },
> +    static const ARMCPUInfo max_v8 = {
> +        .name = "max-v8",
> +        .initfn = max_v8_tcg_initfn,
>      };
> -    arm_cpu_register(&max_v8[target_aarch64()]);
> +    arm_cpu_register(&max_v8);
>  }
>  type_init(cpu_max_v8_register_type)

It works for the current need, but will require further changes for
heterogeneous emulation. A more versatile solution could be:

arm_cpu_register(&aarch32_max_v8, target_arm);
arm_cpu_register(&aarch64_max_v8, target_aarch64);
/* and fix other call sites */
And arm_cpu_register could take a new parameter, to set
TypeInfo.is_available with the callback passed in.

@Peter: do you have a preference on this? I'm fine with having current
patch and delay further changes to arm_cpu_register until we have proper
heterogeneous support if you prefer.

Regards,
Pierrick

