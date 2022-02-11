Received: by 2002:a05:6512:40d:0:0:0:0 with SMTP id u13csp2160930lfk;
        Fri, 11 Feb 2022 01:40:30 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxxwHb7E0p5LfbiFo8gz5W+2o4+PcoZ/bYeSiyrydv1xrnsl4iwpuym9UIJ4+n9lv9nZCQk
X-Received: by 2002:a05:622a:c6:: with SMTP id p6mr467146qtw.161.1644572430207;
        Fri, 11 Feb 2022 01:40:30 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1644572430; cv=none;
        d=google.com; s=arc-20160816;
        b=QP8v5fsZ/0B6yD7t8nEx51lt2JuOnq02MZaQ569yVfEdocFfTElHENOBokO00LeZVY
         PYExnhcyL8IPYJNzVVK1/f56P8WO8KsCBqX9pAaYfxKPTncbPNxo6TNt+l/EGvdvIdMk
         eklFtAMBAL3vMDPsHOXZnWFhErDKacLhToMt2Z9wrV2JtaW0A/LELKQsCq0DWKa/fV2z
         h0gNhz1FdpidJnRejdPbw/+GrGaErKYXGBpQd/3AwpglV9wIsJnK22HAlkEFHAV4s801
         e1LLtLrUG4icQcUEaOYjxMfCAiVVn2XQ9mLD8R+85ODwWqzWvDSnHfWJ6Np93vfhZ00k
         dXhg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=from:reply-to:sender:errors-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:in-reply-to:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=aJfSBGp2vOTKBGUMIbKWNoUFwfdnRHNGvs2QGPGUpOE=;
        b=0O41d4QaeN/YIX61eMn44UEkl8LcfYUrWLBcB5liiTR3HMyG2y8t1rUGwStfAKfUYw
         nrbBb89wfLMaGAdeqJ6WkKV4ebyAC3v344m1Fnbct3/DUw1/5YiPYEGA1Zuva62gtFmT
         E3seWL9b7U2fm2NWWAZHTSMNFvcnED888r8NBbKGVEWhkMuvS7+U9rJAVYrLsetgFAhc
         HEf5QTVpK+XLaD783B6K6DxIpog5V8rXuiSQ9np1StHLIAQVDvqEmUz2loUeocuPg27X
         Rn9tgf9dzjvhTntPcyxZPoFe2nM/EViTwMV+kWd8odHZwNnEChqDT8RWcvLG8T9RjTp6
         Ek1g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20210112 header.b=g3+1hqbc;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id gh12si235588qvb.28.2022.02.11.01.40.30
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 11 Feb 2022 01:40:30 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20210112 header.b=g3+1hqbc;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1]:59386 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nISPl-0006w0-M1
	for alex.bennee@linaro.org; Fri, 11 Feb 2022 04:40:29 -0500
Received: from eggs.gnu.org ([209.51.188.92]:33548)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nISPX-0006sh-3B; Fri, 11 Feb 2022 04:40:15 -0500
Received: from [2607:f8b0:4864:20::830] (port=33741
 helo=mail-qt1-x830.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nISPU-0008C2-Cr; Fri, 11 Feb 2022 04:40:13 -0500
Received: by mail-qt1-x830.google.com with SMTP id p14so8570909qtx.0;
 Fri, 11 Feb 2022 01:40:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=aJfSBGp2vOTKBGUMIbKWNoUFwfdnRHNGvs2QGPGUpOE=;
 b=g3+1hqbctTfLTePv/xAMlJmVDm+FMJGh1p0Dq8lJmFOvMwsoXsMPLs3EiLe2wvZOqA
 DwKWV4QQsMEeK9R/bytYhxnj9/VhXwq0tuSDcZE1fSJI5UFDir/rxh482VTQpqqDHyxa
 u14EhOYRpnbCgVgx/FlqKjVN+2FWP/VLmaZbbfCBke5Vt5AD3fZYWZC+mOLch68Izz3n
 YHkXiR50g5yN+ekxF8p8ai2yvDlw6QqEDwWm5zCZKsV3NsIaBfrIL37Ie5hqRTeCURdS
 THp7t6nRNWQeDhXOS/pwJeNYSkfVKcBEhNx6KpCR47fmblV3zha4b5oSXJ9nREvPpzZX
 DHnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=aJfSBGp2vOTKBGUMIbKWNoUFwfdnRHNGvs2QGPGUpOE=;
 b=ZWQ066XXI32/Jox3AcKS7Kh7V+m4Tx/gdh33bWnowDpbnMZmQU3dtf5eM4wpNYM47d
 3WJb32/1Vx1rRKJBuqfxDatUz8EG+1EU0JmORfgaHcYc3Knv2T22cfxovO+j4bBFeJu9
 bQqAQCfmhRd22bneY6VY0VH5yaKgiSh9MTqRptdOsf1dBhr+t4T3+LTaKrAduIT4DqZh
 6kXIVyzVw1jjSDyJkWJ2FrWJAxqs412uRyEmyhl6b6fCVkYzXsXsElJKJo/FUmcs5k3l
 9jsazilCn9WsPqzBWp6OXuHfKP0uLTF9WPXqjeFGAxL5SEIzvqeOF+dOL0Zq3iKMYWtC
 V6IQ==
X-Gm-Message-State: AOAM530KM03gD2k9Ze5Azcct0l6N9b5TiX7uXbOAmUsfccs0QTUicFS6
 dXGfbpbpzbuokS61iv2jGE4=
X-Received: by 2002:ac8:5f4a:: with SMTP id y10mr486422qta.378.1644572410961; 
 Fri, 11 Feb 2022 01:40:10 -0800 (PST)
Received: from [192.168.1.33] (154.red-83-50-83.dynamicip.rima-tde.net.
 [83.50.83.154])
 by smtp.gmail.com with ESMTPSA id t15sm6363527qkp.48.2022.02.11.01.40.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 11 Feb 2022 01:40:10 -0800 (PST)
Message-ID: <c93b74e7-e166-fbef-7ecb-dc7856cd49a1@amsat.org>
Date: Fri, 11 Feb 2022 10:40:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.5.1
Subject: Re: [PATCH v3 1/2] hvf: arm: Use macros for sysreg shift/masking
Content-Language: en-US
To: Alexander Graf <agraf@csgraf.de>, Peter Maydell <peter.maydell@linaro.org>
Cc: Roman Bolshakov <r.bolshakov@yadro.com>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org, Cameron Esfahani <dirty@apple.com>,
 Ivan Babrou <ivan@cloudflare.com>
References: <20220209124135.69183-1-agraf@csgraf.de>
In-Reply-To: <20220209124135.69183-1-agraf@csgraf.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::830
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::830;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-qt1-x830.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Reply-to:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
From:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= via <qemu-devel@nongnu.org>
X-TUID: OpeQQ5d6VRDJ

On 9/2/22 13:41, Alexander Graf wrote:
> We are parsing the syndrome field for sysregs in multiple places across
> the hvf code, but repeat shift/mask operations with hard coded constants
> every time. This is an error prone approach and makes it harder to reason
> about the correctness of these operations.
> 
> Let's introduce macros that allow us to unify the constants used as well
> as create new helpers to extract fields from the sysreg value.
> 
> Suggested-by: Peter Maydell <peter.maydell@linaro.org>
> Signed-off-by: Alexander Graf <agraf@csgraf.de>
> ---
>   target/arm/hvf/hvf.c | 69 ++++++++++++++++++++++++++++++--------------
>   1 file changed, 47 insertions(+), 22 deletions(-)
> 
> diff --git a/target/arm/hvf/hvf.c b/target/arm/hvf/hvf.c
> index 92ad0d29c4..8d0447ab01 100644
> --- a/target/arm/hvf/hvf.c
> +++ b/target/arm/hvf/hvf.c
> @@ -35,9 +35,34 @@
>           ENCODE_AA64_CP_REG(CP_REG_ARM64_SYSREG_CP, crn, crm, op0, op1, op2)
>   #define PL1_WRITE_MASK 0x4
>   
> +#define SYSREG_OP0_SHIFT      20
> +#define SYSREG_OP0_MASK       0x3
> +#define SYSREG_OP0(sysreg)    ((sysreg >> SYSREG_OP0_SHIFT) & SYSREG_OP0_MASK)
> +#define SYSREG_OP1_SHIFT      14
> +#define SYSREG_OP1_MASK       0x7
> +#define SYSREG_OP1(sysreg)    ((sysreg >> SYSREG_OP1_SHIFT) & SYSREG_OP1_MASK)
> +#define SYSREG_CRN_SHIFT      10
> +#define SYSREG_CRN_MASK       0xf
> +#define SYSREG_CRN(sysreg)    ((sysreg >> SYSREG_CRN_SHIFT) & SYSREG_CRN_MASK)
> +#define SYSREG_CRM_SHIFT      1
> +#define SYSREG_CRM_MASK       0xf
> +#define SYSREG_CRM(sysreg)    ((sysreg >> SYSREG_CRM_SHIFT) & SYSREG_CRM_MASK)
> +#define SYSREG_OP2_SHIFT      17
> +#define SYSREG_OP2_MASK       0x7
> +#define SYSREG_OP2(sysreg)    ((sysreg >> SYSREG_OP2_SHIFT) & SYSREG_OP2_MASK)

Alternatively easier to read using the "hw/registerfields.h" macros:

FIELD(SYSREG, OP0, 20, 2)
FIELD(SYSREG, OP2, 17, 3)
FIELD(SYSREG, OP1, 14, 3)
FIELD(SYSREG, CRN, 10, 4)
FIELD(SYSREG, CRM,  1, 4)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
