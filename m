Received: by 2002:a17:504:1e0a:b0:1be9:327d:8ee3 with SMTP id i10csp965519njk;
        Fri, 24 Jan 2025 09:27:22 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCVDj6QbFZuOJZIct+aq2rYHpo67F9uE7Zm1ANDo9amnMFPikNWvTOr0Yk0y8/rezzIMXDfntiCT1f/taw==@linaro.org
X-Google-Smtp-Source: AGHT+IGpIoEGODGay2nJlZmf1+1swKOryf0OJj9Oa2ZSeMXYxPNPp2JjtzODrn/pSuAFzYZSqjOc
X-Received: by 2002:ac8:59d2:0:b0:464:c8f2:e553 with SMTP id d75a77b69052e-46e12b75d96mr390428251cf.42.1737739642274;
        Fri, 24 Jan 2025 09:27:22 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1737739642; cv=none;
        d=google.com; s=arc-20240605;
        b=Y3HJIDYPqp0AfSmwOtBQ60X876cq413JsgeVKCrcwyGdUl1FNBCntCdbZ7KhF7+1bj
         H8zfGdX0jRU1abI5Cp4ZYjcbSVm1qhhjIaecAPdmWVdr1vhAuNItLbTkU2wFMPxHgK/k
         3dEiw6C2VmxzcypysNmkiBtWNBR50m1pD8YX0ZpqeLzwl4VPCBFqMOtcY08kXH+4Wimx
         OdD9zWMD3tjN3In2LD2BUCclRR6Uu2wnjyul6X+0Ja8BCkXYjaUQuAB6wUnkGkAdMh+D
         +OugQMV7/mPbOIgD5vCAVGOf8rFItyOmt2ZS9j+rBeYNBcWn8kSi9I2UXIfUZyRJwAPZ
         WlDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=1iNjhcmeuwab8iVPAdNGqiqQK1M7BBG3ikuwGU5J3CA=;
        fh=0x02lppkLxXhIiE7xZbZgDcfbAbeGuFNrPrDDNatcxw=;
        b=Y8qLwFXoKuyPkOEwf+YHM4QiBsbfKPhr8vwnzXUM5+DOFGikHYWc5rZ2b2hkscKxZb
         MS9wrn5LrqShWU2MZz8me1AvErfM4lqwU55uK42eXzOaFm4T0R9IfwgRk4sk71c6FWH5
         VL1nHkRWe6xOHaloxiUvcxmT+QGvRMIz+KJeRw7gI953uOBLw98LEqGt2FGfKx8GPAEc
         pHUfrZjBgRR6aJJEra4wauE6v4RmKMnLwzid8Qi4ekB3krLAL0ZewdU9qWQAdYxw7Odv
         QORbhUZFsj5N9eqw1N83dWFEYqOcm2EOsfIoA/WCI3PwAS+suGY/OiYCM9+BSb7ri31D
         Dm6A==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=CMe4mr7n;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=qualcomm.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-46e66ba36c9si25951231cf.540.2025.01.24.09.27.22
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 24 Jan 2025 09:27:22 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=CMe4mr7n;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=qualcomm.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tbNSE-00067s-0V; Fri, 24 Jan 2025 12:26:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <brian.cain@oss.qualcomm.com>)
 id 1tbNSB-00064L-Un
 for qemu-arm@nongnu.org; Fri, 24 Jan 2025 12:26:47 -0500
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <brian.cain@oss.qualcomm.com>)
 id 1tbNS9-0008B9-NM
 for qemu-arm@nongnu.org; Fri, 24 Jan 2025 12:26:47 -0500
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50OAoUYc025504
 for <qemu-arm@nongnu.org>; Fri, 24 Jan 2025 17:26:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 1iNjhcmeuwab8iVPAdNGqiqQK1M7BBG3ikuwGU5J3CA=; b=CMe4mr7nKtSPFejP
 k3EynlLL2zy0Cx8ORP9cVxrFNqyPgaczaX5NmhzShCAc+VN9/LniJjK2KTXjKCRy
 M5ctygqNPerT7DVpnadRVa4v5Rr0KZfhQQUtHIL7tu8NRJC3wy8ari9lKfl8NziA
 csGBDsWhl3ZUaUUPBkdin50crPuol8m0ZUoNiRuO22/RItXYvZUcbop1MbLhgwbh
 kq85A7qB8dX2m8/ebeGjfmcdrq2KkG9kmVk+Dfmk++eL7R7YFZtxp7tp4jzKpOG1
 lsH7sDC24asFGgxwKqkph22yNyLKnQkHrHV7VTwink/0BspClVKpLwRAvkg4xMur
 9nrE6g==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44c9fd0yq3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Fri, 24 Jan 2025 17:26:42 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id
 af79cd13be357-7b6c6429421so363524685a.0
 for <qemu-arm@nongnu.org>; Fri, 24 Jan 2025 09:26:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737739601; x=1738344401;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=1iNjhcmeuwab8iVPAdNGqiqQK1M7BBG3ikuwGU5J3CA=;
 b=XtPCzDzNvsWwuTBvoxePhxWsMsvlD5ehoKCz7dSZnhzojubK3UxOh8OpNCggEr/+To
 nDF/7bE+3Vzx2E1jeLGVFQLhqhKOQY8LFqhB/ZknJrtQwKA4iCcxAoK5B0vf+cdsn49Z
 gWkTS6agH8RDMctRCsxHG909zoWwMvs/16UN/obggaub904adwRZZNNu0u1wbb2QfVmx
 PsOUHEtTqpJRx5EBh1Cr6vjxUD93NV5AlDPc1YarS/C8hEVV/oKWd046fdzyvFwN3Tcp
 /9BC8aAzWmbbJ2z8QFJV9H4VVjcISK3xF6MA5daLKEm14QayrQgsPqahnRTuFAQiYrtc
 Z7Vg==
X-Gm-Message-State: AOJu0Yw0iKVACha92ee4qToKz1/JxQ+Lw/IWzzMro95D+Rl1f2fprY0v
 wN1o1DebA/VmSZMsKCKAXgtLkGMhO8Iai+XBZ9rRlP2FuSTP3PJ0eGUXgoGIWR4xuGsbdpu0vqM
 9+PLAkbwTRlLwq61kr6Pfw5Rz4NbTnmI5QZ/1BHq5xhfQ5KAw7MY=
X-Gm-Gg: ASbGncuEyeHZNC8LUYJeuueDBAOyRMEwcZWmbGWrzDLYlfz9EPtl6xLhYdDzjyssrtA
 ez5M4VvjNFy/r9B1vxLUx0HqEpUYdP2y3WRYj+Bjl6Hv1T2UbcBP01+5zsFV9Um2YwL+f6qAMOb
 QgNeusWYImv0C88a+epWw0Mi1p19kVr4e5JrMzF7BT4Qn0YpzLtC5GD8rjyaREX2A8btbYfg71H
 mZy35QN6rCC6SOEB9cUr/ozq9PHV6bf6plZyQ2CEMxtwK7a+6UU1/+kZTy4whfUxUweM1MzwDta
 pU3IiENLfQpObHHDT8YWlc64MY1I3vW0LydaNDpdbwuC4GZXy8aV
X-Received: by 2002:a05:620a:4142:b0:7bc:e736:27f2 with SMTP id
 af79cd13be357-7be6323b6bemr5014858985a.18.1737739600632; 
 Fri, 24 Jan 2025 09:26:40 -0800 (PST)
X-Received: by 2002:a05:620a:4142:b0:7bc:e736:27f2 with SMTP id
 af79cd13be357-7be6323b6bemr5014856785a.18.1737739600328; 
 Fri, 24 Jan 2025 09:26:40 -0800 (PST)
Received: from [10.222.168.90] (Global_NAT1_IAD_FW.qualcomm.com.
 [129.46.232.65]) by smtp.gmail.com with ESMTPSA id
 af79cd13be357-7be9ae8c048sm114208085a.47.2025.01.24.09.26.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 24 Jan 2025 09:26:40 -0800 (PST)
Message-ID: <f2b27d7b-8788-414c-b8ae-a76780a5278f@oss.qualcomm.com>
Date: Fri, 24 Jan 2025 11:26:38 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 11/28] target/hexagon: Remove CPUClass:has_work() handler
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-s390x@nongnu.org, qemu-riscv@nongnu.org,
 qemu-ppc@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>
References: <20250121142341.17001-1-philmd@linaro.org>
 <20250121142341.17001-12-philmd@linaro.org>
Content-Language: en-US
From: Brian Cain <brian.cain@oss.qualcomm.com>
In-Reply-To: <20250121142341.17001-12-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: CiDC5koSRhW3xV8GF2XLapOnPGrAySwk
X-Proofpoint-GUID: CiDC5koSRhW3xV8GF2XLapOnPGrAySwk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-24_07,2025-01-23_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999
 suspectscore=0 adultscore=0 phishscore=0 priorityscore=1501 spamscore=0
 malwarescore=0 lowpriorityscore=0 bulkscore=0 clxscore=1015
 impostorscore=0 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501240122
Received-SPF: pass client-ip=205.220.168.131;
 envelope-from=brian.cain@oss.qualcomm.com; helo=mx0a-0031df01.pphosted.com
X-Spam_score_int: -26
X-Spam_score: -2.7
X-Spam_bar: --
X-Spam_report: (-2.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: EvwP1n1DPZnm


On 1/21/2025 8:23 AM, Philippe Mathieu-Daudé wrote:
> Remove as unreachable code.
>
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---

Reviewed-by: Brian Cain <brian.cain@oss.qualcomm.com>


>   target/hexagon/cpu.c | 6 ------
>   1 file changed, 6 deletions(-)
>
> diff --git a/target/hexagon/cpu.c b/target/hexagon/cpu.c
> index 0b7fc98f6ce..f77e305d611 100644
> --- a/target/hexagon/cpu.c
> +++ b/target/hexagon/cpu.c
> @@ -262,11 +262,6 @@ static void hexagon_cpu_synchronize_from_tb(CPUState *cs,
>       cpu_env(cs)->gpr[HEX_REG_PC] = tb->pc;
>   }
>   
> -static bool hexagon_cpu_has_work(CPUState *cs)
> -{
> -    return true;
> -}
> -
>   static void hexagon_restore_state_to_opc(CPUState *cs,
>                                            const TranslationBlock *tb,
>                                            const uint64_t *data)
> @@ -345,7 +340,6 @@ static void hexagon_cpu_class_init(ObjectClass *c, void *data)
>                                          &mcc->parent_phases);
>   
>       cc->class_by_name = hexagon_cpu_class_by_name;
> -    cc->has_work = hexagon_cpu_has_work;
>       cc->dump_state = hexagon_dump_state;
>       cc->set_pc = hexagon_cpu_set_pc;
>       cc->get_pc = hexagon_cpu_get_pc;
