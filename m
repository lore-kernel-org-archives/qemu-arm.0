Received: by 2002:a17:505:840b:b0:1be9:327d:8ee3 with SMTP id lq11csp256522njc;
        Tue, 21 Jan 2025 09:40:30 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCVSPHF9Rh2aon6NK+0e8CvwdRvr1HcWbJgMREEAXMYB3CyZr+YYjjK4pda5olBLIaoDPmNIE3BRkFtMbA==@linaro.org
X-Google-Smtp-Source: AGHT+IG/eg6pT6n8W63/GCIz/cjHKf5Pm05ZO9bmK6tD5mJSRMxJqv3fllUtEtMSL58VAkt9XEq4
X-Received: by 2002:a05:6214:5b81:b0:6d8:8874:2126 with SMTP id 6a1803df08f44-6e1b21793a0mr256586616d6.11.1737481230456;
        Tue, 21 Jan 2025 09:40:30 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1737481230; cv=none;
        d=google.com; s=arc-20240605;
        b=gVU6VDwr55IvAIwbUVxgEd9HT4ekH0aU2zkZ1M1FsxJkrY6NMg4Yv7/8FNjLP8KXUd
         TftrD0gdllRZwa42bFZwTrXZdbYHJT9nuP3gkZvAsJ32Kj+1ge9ix2SB4GsfqkqCedZu
         Qu+z73B/uzBcEoraEg7ucVYetTOHdw52fgxZd8q+uofExrUhKhfW86U+Nh7lZedtteoh
         zsYSiumaXIwb6PkWKKxFa9lvWydHd0FogLV0Usa5Mr+BkKKEelyc4/poyrYrYHXssq1w
         YxFpmbMSFXA4XBWYkG9V8EEa8GXlDoIp5oz55biFdprCw/yP4SS9R9Fkdf4a9fwsPQpn
         hcyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=urqt7a22dhLPtw1A6TPrAusY6/mCkSDM1vs/YAPMn5w=;
        fh=0x02lppkLxXhIiE7xZbZgDcfbAbeGuFNrPrDDNatcxw=;
        b=WL3RI3JnKeq2pcWt0QgDim7ji/O6NTk3YgI/oiHTbQshRu4pAZWpNBnqg32xDzWEBv
         qHlBfBWDHnPlK/Zdq6k5D+9IO+YU1FbDb/pW193XBhPW0qmxI4JbMQsRTuvVr4BGifWl
         Hq1NAr/8br1tOcNxYdOZD1vm8LwgQeiqni8i3ZncxeRCHZI9aPLnx8XHDrFqGXaslJTO
         19vwobV8cTpPtyAm4UHvFg2q9Rbz1FdSjCf++IeZoNM8tbhtCxlogsPzFOCjPlQPeoUZ
         kqTs+7RDKzlvjfEGt3I8lb5AtTq8hsl4ZerGLDPN2jmc8HJ4K92b/1vEDZL15UNnk/Vz
         KwdQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=PoQbsQ6j;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=qualcomm.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6e1afd15da3si139338446d6.441.2025.01.21.09.40.30
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 21 Jan 2025 09:40:30 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=PoQbsQ6j;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=qualcomm.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1taIEX-0005YA-0M; Tue, 21 Jan 2025 12:40:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <brian.cain@oss.qualcomm.com>)
 id 1taIEC-0005JH-Uq
 for qemu-arm@nongnu.org; Tue, 21 Jan 2025 12:39:53 -0500
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <brian.cain@oss.qualcomm.com>)
 id 1taIEA-0002yy-DS
 for qemu-arm@nongnu.org; Tue, 21 Jan 2025 12:39:52 -0500
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50LHQa4t024199
 for <qemu-arm@nongnu.org>; Tue, 21 Jan 2025 17:39:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 urqt7a22dhLPtw1A6TPrAusY6/mCkSDM1vs/YAPMn5w=; b=PoQbsQ6jOqqsoXpJ
 EHszinBtOI5uluh9wNOzNzKRCujZUe5TC/1o1gl4dlrb4IBArMTWsrBtqEFdWKOy
 MdcXhcgVaC2KqUAKuYh7vt2dnd3rOl7A2inrsvsILQL4REfdj5crJllzrlJ/j5Jy
 9sEN7Qrz2i07nU0h2eOvM1IGHdA0ULQiWzw22tdzUArej5zzfyPNMsJFF/jF5vYQ
 Zn7q2vfdOdyHh4UqTniGAczRtmAEChO1P7Jc9gy0UUQhDpMLSC4k+xDvka76zLXa
 YTsigGqmGYkDra+TZsFgk2jkbU2/tgKLV/K3Fh6AQyZZodE1DwK/sanmfa19it1b
 qKAqCw==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44ag00r16b-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Tue, 21 Jan 2025 17:39:47 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id
 6a1803df08f44-6d895f91a7dso92912266d6.0
 for <qemu-arm@nongnu.org>; Tue, 21 Jan 2025 09:39:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737481186; x=1738085986;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=urqt7a22dhLPtw1A6TPrAusY6/mCkSDM1vs/YAPMn5w=;
 b=dc4u/GKUq1M6FIV4yvFlr65gJFyUPfOkB2mLJrKzymdUuGiCNUZiBgjK57SZMLYvcK
 IdRTOUCXKN5tZTnb5rcyrWGgmUg0ryKn/NInAe2MwoYMSXUk5RvTlTmPfNrs3Ws/OAq/
 Mu4jisc06FYTZErpi+uu5qJX2cL57cmegJm2/owmjhI1uYA9M0DoaSkIsXzhsdma+u+T
 iX+anXLBS0CxlarkDWLoNBEoLYPylXBt+CUamMU3UNoh4Ui5d8GBh4CFE0cXRwYAWkYM
 DPUMG3kivm+sL31XaXZvPYlQ6u0c7uBo23jRACfMJ6JVN1chSBGhqgpfnHlP6o+Z8v2E
 vrbA==
X-Gm-Message-State: AOJu0Yy/1n3uO2UD4l1HdV5laGOlHvpzKmiZvl0oLPXl8h/Lp+l2Mf6l
 q7lRhTEgLKp8eEGY/itgvcz/Ag/Ee262SvNotDZoSoyv6JqxfJqCBGVSJL8lqBzmKVPvEKW39ox
 x+1Psh09K4WX/PgFTVTbM7FrnnofG0/hVO0C3Gw+DV3VlKZYjh6o=
X-Gm-Gg: ASbGncuDych+z9fOon8/5vQ2Cv77XFJwoffMoUmDlU4agaIGv4dQJ63hTOfijgSp6aZ
 eGkeaB3H49bcF0wWP7eW43peeI7uqhiEp7XbYSo5o9xkL7IXoCx2nJfkcG0jEhDiypYt6CEZ/Bt
 G9XrUbqIbBCwzg1LgF1T6DseQSpxgHM39sHC/j8mqq5kNjjmgGfgQNN5X9HOpWP32MBKNdxWXts
 UYFUcAviQ2o3F4qvJl0kco0L41qRf0+3yZvEnr7qN7T0fubA7NR458LdlgRllRkuv0Ay3DwjM2q
 coWj6pGFmHnHGG9JaO1oiFhZxQHr7U/oPsRYS47Ky39+YkkuvKZzmqudzL/F9iBblSHnjZM=
X-Received: by 2002:ad4:596c:0:b0:6d8:aa52:74a3 with SMTP id
 6a1803df08f44-6e1b2213f57mr284730356d6.28.1737481186241; 
 Tue, 21 Jan 2025 09:39:46 -0800 (PST)
X-Received: by 2002:ad4:596c:0:b0:6d8:aa52:74a3 with SMTP id
 6a1803df08f44-6e1b2213f57mr284729986d6.28.1737481185835; 
 Tue, 21 Jan 2025 09:39:45 -0800 (PST)
Received: from [192.168.1.157] (104-54-226-75.lightspeed.austtx.sbcglobal.net.
 [104.54.226.75]) by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-46e104027afsm54879231cf.50.2025.01.21.09.39.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 21 Jan 2025 09:39:45 -0800 (PST)
Message-ID: <8df0bb65-9482-4b04-81ae-a8b7c5292142@oss.qualcomm.com>
Date: Tue, 21 Jan 2025 11:39:44 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 01/28] target/hexagon: Ensure not being build on system
 emulation
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-s390x@nongnu.org, qemu-riscv@nongnu.org,
 qemu-ppc@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>
References: <20250121142341.17001-1-philmd@linaro.org>
 <20250121142341.17001-2-philmd@linaro.org>
Content-Language: en-US
From: Brian Cain <brian.cain@oss.qualcomm.com>
In-Reply-To: <20250121142341.17001-2-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: gAAF3cIBlYuNx57LNS5Y-vpruKWTYk5B
X-Proofpoint-ORIG-GUID: gAAF3cIBlYuNx57LNS5Y-vpruKWTYk5B
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-21_07,2025-01-21_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 spamscore=0
 malwarescore=0 suspectscore=0 clxscore=1015 impostorscore=0
 priorityscore=1501 lowpriorityscore=0 adultscore=0 phishscore=0
 mlxlogscore=667 bulkscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2411120000 definitions=main-2501210141
Received-SPF: pass client-ip=205.220.168.131;
 envelope-from=brian.cain@oss.qualcomm.com; helo=mx0a-0031df01.pphosted.com
X-Spam_score_int: -26
X-Spam_score: -2.7
X-Spam_bar: --
X-Spam_report: (-2.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: PZpg48af4wdd


On 1/21/2025 8:23 AM, Philippe Mathieu-Daudé wrote:
> Currently only user emulation is supported.
> Assert no target code is built for system emulation.
>
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>   target/hexagon/cpu.h | 4 ++++
>   1 file changed, 4 insertions(+)
>
> diff --git a/target/hexagon/cpu.h b/target/hexagon/cpu.h
> index 79e60d4bfa1..f78c8f9c2a0 100644
> --- a/target/hexagon/cpu.h
> +++ b/target/hexagon/cpu.h
> @@ -26,6 +26,10 @@
>   #include "mmvec/mmvec.h"
>   #include "hw/registerfields.h"
>   
> +#ifndef CONFIG_USER_ONLY
> +#error "Hexagon does not support system emulation"
> +#endif
> +
>   #define NUM_PREGS 4
>   #define TOTAL_PER_THREAD_REGS 64
>   

We hope to mitigate this one in the not-too-distant future. Staged 
commits on my tree implement system emulation, undergoing some 
review/revision now. ;)

But of course this change makes sense for the time being.

Reviewed-by: Brian Cain <brian.cain@oss.qualcomm.com>

