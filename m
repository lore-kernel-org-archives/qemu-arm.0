Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 814A9CC6B03
	for <qemu-arm@archiver.kernel.org>; Tue, 13 Oct 2026 10:55:29 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xGa9u-0006Rw-1r; Tue, 13 Oct 2026 06:55:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1xGa9s-0006R3-9T
 for qemu-arm@nongnu.org; Tue, 13 Oct 2026 06:55:00 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1xGa9q-0006R9-D5
 for qemu-arm@nongnu.org; Tue, 13 Oct 2026 06:55:00 -0400
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 69D9SYN23476214
 for <qemu-arm@nongnu.org>; Tue, 13 Oct 2026 10:54:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 hvWuEvNP+3saozX8oJUV0OWaeiW78/Qzn3EIdx3RLVY=; b=cqnH4UfgXWcyWBvW
 3gUhyGLoXTEio8hx/vDEwfl706fTG/Wg3V+yUJetAYA1r4TxslmppkY6tzQSv3Gq
 KHSXp8AQpsMiTVTG1dTqoaNPUxoPPqHolI+KGVbyiSDo1PQ0iYZRF7SSyqVH579A
 BiDvi//6/GFPY6qfJvbOiy3qfd1uYmpy2rvAQ4+NzIrMPlC9/yJt/kkSiNnVU9V6
 8oI73eU6Ah99yoj0vFJ6GRJlN8bXsHFgfWKM8nouTGtFAGtvfkqgDIKwBgDsi8HQ
 kwCvshFnJKLMrdZdV08yVf6wL/GBPNtUwHaq09MZn/3NCyz6FT+b+dRo15Wb1OFK
 9xoftA==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h9d7j9n6t-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Tue, 13 Oct 2026 10:54:56 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id
 6a1803df08f44-91b92acedd9so33043106d6.2
 for <qemu-arm@nongnu.org>; Tue, 13 Oct 2026 03:54:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1791888895; x=1792493695; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :to:content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=hvWuEvNP+3saozX8oJUV0OWaeiW78/Qzn3EIdx3RLVY=;
 b=VchrnNfOhGRWzLJSEm07XreFQws2T/BazFUfqhkNsofv3e4wyFPRwF51R5Nyt1gq2p
 yD8yifOVjyITcN3MvZDU0I2oiNLBiXFsz8bVGiGdOVEDv86MoUAiV/VY7l+gANurNP5x
 Bu7XFBQ8A3G76k9pHSS2K6hHXHgBQpcX6S1EKakUZeLf4r9ggiPZnmraWyFVG1DQHzjB
 JTOXQ5zoG/G0+HmofXbAS/4lnb5HsUDzTqzK2TeC2OY+oT81rmLd5T1oGVXeLFtVAQ9x
 E4xIsW77uTQ8IJtlkFa2VTNbEf/IAq/2JmACd0JehDZdw8KCL+PQx/x9RxUwAcSr/atf
 9O1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791888895; x=1792493695;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :to:content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to:content-type;
 bh=hvWuEvNP+3saozX8oJUV0OWaeiW78/Qzn3EIdx3RLVY=;
 b=wGGgCm7d01U1CexpuQdmdu1ZJ9LSLTaVo3a61ypeYamIcapjC3+uhPQjG/MRYKxp4R
 VsA7wRkxGuZhK3SnJBMiPGqdq7Qe+KsagK86n44L1teW8Sx1zb6nD70PzlmlySRFD7kg
 oeWNU1XL5wd+jQtXXsciRrvXqTrhotV/ixh9hbJdzJ+9HDydjm0zW0ViKs05R1dNqMnf
 lxiXfxemvR/KiFAQIZeYrLnLBXHH0Ql2DC89UEefocvShz45kcGAQlk3gIPtS/SXCOyl
 UyvxC/Fl4BdDQynjH0bWudYaizrtsg+8QXVQxU0RoSQir0TdSRftiGf4Aasz+/HG/vZM
 aBgA==
X-Forwarded-Encrypted: i=1;
 AKwUvBztnFrgrZs/aPaMw28BC/wihElmtgJNZHT06Z4nO6jFtiB7yB4pvpDPAWIm+wOgAX7rO9+VyEzZYQ==@nongnu.org
X-Gm-Message-State: AFq9FYKbm0kJc0XnH6SfgwyQimFABtumF4mlt2+OGWgymUeXzaalWsmh
 QHfgOWjagsWvrkdV5Dc0LRdvUrdkyp25ycvdAjbb3KDYwsFjlJL8YyiNHOPBpPWv83Rj6BkJbXD
 Pz3xY96fjhXnPIvBlJylO4DbApZaMNuFVWQCTvB9v+TnGaD8EZcN99fU=
X-Gm-Gg: AYBFou2mhBNJTaSRfDDGqO1bDRyPK5Kgjch/WDtxwH51wCY3Soy3sBpxniwXWBL3syp
 m2CfjAeYt6qQB+aYyLXBNBmGl4wa0ZFHLvZeZKdrfYvm4eXRh+afy9f03S+v468p+2kffuTQO12
 0ml/NAolnxDZ4b7YSIjPMFFsuzOWk1RpaO7xcRYHM2xDNcqQFNHGD8jex0Y/ocBGeBDiZzGTM0Y
 0reqTUHvra1HGSifVLt7jMJW/qOYCi/ETWPpjaeLMzHUP/C5M4h4TuMQjXCLY8Wnjo6MJCeboi/
 4B3JU5T0VceO1qPf1cg3m34PemmVTOWNkL2sVDNSiG/Q1/Nvhk06wsYd5E1DIzRZTFG7BdBt+Fm
 FhqRg+6P90d5uRRYDiVU0vzNQMnJMWDnpmA==
X-Received: by 2002:a05:620a:1991:b0:93b:db80:e0cf with SMTP id
 af79cd13be357-93ebd281acbmr2046762385a.60.1791888895377; 
 Tue, 13 Oct 2026 03:54:55 -0700 (PDT)
X-Received: by 2002:a05:620a:1991:b0:93b:db80:e0cf with SMTP id
 af79cd13be357-93ebd281acbmr2046760685a.60.1791888894904; 
 Tue, 13 Oct 2026 03:54:54 -0700 (PDT)
Received: from [192.168.69.210] (pmd666.hd.free.fr. [88.187.86.199])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a18be96549sm507270015e9.6.2026.10.13.03.54.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 13 Oct 2026 03:54:54 -0700 (PDT)
Message-ID: <a693c8e2-5a15-429c-9427-d8dc68096830@oss.qualcomm.com>
Date: Tue, 13 Oct 2026 12:54:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 68/86] hw/intc/arm_gicv5: Implement gicv5_set_resident()
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20261013083933.1024405-1-peter.maydell@linaro.org>
 <20261013083933.1024405-69-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
In-Reply-To: <20261013083933.1024405-69-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 74eegLb1lNHwxiN3atA5RYd8K1psCcd_
X-Proofpoint-ORIG-GUID: 74eegLb1lNHwxiN3atA5RYd8K1psCcd_
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEzMDA0MyBTYWx0ZWRfX65mPblHwZP1W
 ZGwRoFzdUGKH7v6nQhq6RIUAgs9daAOnFbN0EqEZJD9c7qiZVlEC/zJe2Nu7eqPqdlVYvoouRyD
 HcbNYBRjN5pz8FTQnCDYq6xL6M3MxV8=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEzMDA0MyBTYWx0ZWRfX+NtT6uEjqfbU
 YuMaFjdMLKn75upwNcbUf0syVN+0a5u6wxl5mpQ+gWeDho0apmeOLU6EDrXYYf+w6R0P97kJkAs
 4pA3MmAZExFzGNiO19xGQ9xDa7GTen4afmWFxuqIe67AV2qi2PG07IpauZO451ZCEM244TaqjGm
 S/vXc2ZfQQ5l9+5K3X81yUlmtlMFpLWFXYhOrxP7a2C2leHLTIxQzlgDlEqMyOMnN1zISMSAviT
 rGGww5LoU6NwMHWnnF9AjueuCnNcjjQn5oJSxfnaApZytiSAojapPBrg+klw0VGY0+ujif8lt6J
 r6uH9RzJ+Q/4Zkn4Gk2SKmcYGuwdL7mGZZKMDa9Q0unEKVD1Dcuf5zMkiG5Y1r056zK4mlmhAQH
 XFJbcqtyUy/GaXYHmvDGiNN335+XmTk6BzeeRJiUP4itX7AJHjpduPAV88meSbF5dgWNiejOh7t
 ODlrUoNqyvJkP9qoRfQ==
X-Authority-Analysis: v=2.4 cv=PMGaavqC c=1 sm=1 tr=0 ts=6ace0e00 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=KKAkSRfTAAAA:8 a=ecGInKZYiohcrdBcGAMA:9 a=QEXdDO2ut3YA:10
 a=iYH6xdkBrDN1Jqds4HTS:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 impostorscore=0 malwarescore=0
 lowpriorityscore=0 clxscore=1015 adultscore=0 spamscore=0 phishscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610130043
Received-SPF: pass client-ip=205.220.168.131;
 envelope-from=philmd@oss.qualcomm.com; helo=mx0a-0031df01.pphosted.com
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

On 13/10/26 10:39, Peter Maydell wrote:
> When the GICv5 CPU interface wants to make a VPE resident, it calls
> gicv5_set_resident(). Currently that is a do-nothing placeholder;
> implement the required behaviour of tracking on the IRS side that
> the VPE is resident on this CPU, and remembering the information
> about the doorbell interrupt.
> 
> For each CPU, we keep a note of the current VPE that is resident (if
> any), so we have an easy way to get to that information given the CPU
> index in functions like gicv5_set_priority().  Since the only way to
> make a VPE invalid is to make the entire VM invalid, we only need to
> set this info in gicv5_set_resident() and then clear it when a VM
> becomes invalid or the whole VM table is made invalid.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>   hw/intc/arm_gicv5.c         | 115 +++++++++++++++++++++++++++++++++++-
>   hw/intc/trace-events        |   2 +
>   include/hw/intc/arm_gicv5.h |   5 ++

(please enable scripts/git.orderfile to ease mailing list code review)


> @@ -1566,6 +1649,8 @@ static void irs_vmt_baser_write(GICv5 *s, GICv5Domain domain, uint64_t value)
>               return;
>           }
>           irs_clean_vm_cache(cs, &s->vmt_config[domain]);
> +        /* No VPE is now resident on any CPU */
> +        memset(s->res_vpe, 0, sizeof(VPE) * cs->num_cpus);

res_vpe is declared as:

   VPE **res_vpe;

so IIUC we should use sizeof(*VPE), or the sizeof(*s->res_vpe)
used below to keep the same style.

>           cs->irs_vmt_baser[domain] = FIELD_DP64(cs->irs_vmt_baser[domain],
>                                                  IRS_VMT_BASER, VALID, valid);


> @@ -2884,6 +2985,11 @@ static void gicv5_reset_hold(Object *obj, ResetType type)
>               g_hash_table_remove_all(s->vmt_config[i].vm_cache);
>           }
>       }
> +
> +    if (s->res_vpe) {
> +        /* No VPE is now resident on any CPU */
> +        memset(s->res_vpe, 0, sizeof(*s->res_vpe) * cs->num_cpus);

OK.

> +    }
>   }
>   
>   static void gicv5_set_idregs(GICv5Common *cs)
> @@ -2988,6 +3094,10 @@ static void gicv5_realize(DeviceState *dev, Error **errp)
>               s->hppi[i] = g_new0(GICv5PendingIrq, cs->num_cpus);
>           }
>       }
> +
> +    if (cs->has_virt) {
> +        s->res_vpe = g_new0(VPE *, cs->num_cpus);

OK.

> +    }
>   }


> diff --git a/include/hw/intc/arm_gicv5.h b/include/hw/intc/arm_gicv5.h
> index 28417317376..ac85cad3eb5 100644
> --- a/include/hw/intc/arm_gicv5.h
> +++ b/include/hw/intc/arm_gicv5.h
> @@ -40,6 +40,8 @@ typedef struct GICv5VMTConfig {
>       GHashTable *vm_cache;
>   } GICv5VMTConfig;
>   
> +typedef struct VPE VPE;
> +
>   /*
>    * This class is for TCG-specific state for the GICv5.
>    */
> @@ -53,6 +55,9 @@ struct GICv5 {
>   
>       /* We cache the HPPI for each CPU for each domain here */
>       GICv5PendingIrq *hppi[NUM_GICV5_DOMAINS];
> +
> +    /* Array: for each CPU, either NULL or ptr to the resident VPE */
> +    VPE **res_vpe;
>   };
>   
>   struct GICv5Class {


