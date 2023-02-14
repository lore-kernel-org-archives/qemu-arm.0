Received: by 2002:a17:906:da85:b0:8b1:202f:4753 with SMTP id xh5csp1426825ejb;
        Tue, 14 Feb 2023 08:33:56 -0800 (PST)
X-Google-Smtp-Source: AK7set+V2H5kLzieEi/fjF5w3vIMrksD/806l2HR3Xrx3CVQjMyD5zlX4yGRTLoMHtNUgtiwCj7b
X-Received: by 2002:ad4:5bec:0:b0:56e:a976:7d16 with SMTP id k12-20020ad45bec000000b0056ea9767d16mr5175700qvc.51.1676392436450;
        Tue, 14 Feb 2023 08:33:56 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1676392436; cv=none;
        d=google.com; s=arc-20160816;
        b=o2YUfsHOeJZA1sfrvXs4WGHsRCHgdVRolgkh2CVfBuEcE0IopqseN0eC6+Xk9TbHj6
         TTbn7zRRs7cAvF5RMqXfaWK3nHrFSdC8kUFEWRMDbxRIgbjcf/srNNU4JB+1l9K/GCRp
         FT0z6UeHXZeCfhdMHx21UnJQOhesAvY+7avmsfY9CwWGnyK63n6MNA2jwSdhEP5EUUZw
         cRR9V+8Gas6R60cdEf1z8YnmGkZCFZq63SPYUEERZL1cdBz2SM8BoOt2t23bDpB45n73
         bicuLA9hHuXp6VgZJHeE/tuThpFpL9cMv1nPeQNmP3jUe3G+IS3Wf1imwLrIIhmx3zG8
         LvbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:content-language:references:cc:to:from:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=fv06KlHm5S4u36VvVzh5hMjpgZcdil237xZ56Q/ZUek=;
        b=tAnOjSJM6b8cqxH+twAxrKn51646h1fjraAUni179JoquQw5XoEMam2HjKJFFuXQXs
         CS7Xa8z4f89E/qvAQobnRF7/7GRDq1PkZ92I+Rb1Vn3aUWVXel8jtqWi9OoE74iQ2r+c
         wppK7s5GSlDhNb5VofWzmI6/2KIxQ0fXpOaln5YfuSd/MfOjixJRnVDgzD4Si6i1v0XO
         S8K0RLMMba8andYIoJXO3ZjhUNjdoKjiyR1Dx4z/43u3sNsQC94oFik6LKTOAA+Waul2
         M9C5+TO3iy7lxjSqqUlUImWNHSmZJHS7LUf1K6dfMVXvX3k8iQJF2Wx+MsaFh18pGIGg
         0Lkw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=DfURLumt;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s9-20020a0cdc09000000b00531e6869535si5796100qvk.167.2023.02.14.08.33.56
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 14 Feb 2023 08:33:56 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=DfURLumt;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pRyFG-0006cM-Ut; Tue, 14 Feb 2023 11:33:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pRyFB-0006Vc-Eu
 for qemu-devel@nongnu.org; Tue, 14 Feb 2023 11:33:26 -0500
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pRyF9-0002gB-6x
 for qemu-devel@nongnu.org; Tue, 14 Feb 2023 11:33:25 -0500
Received: by mail-pf1-x42f.google.com with SMTP id r3so5122200pfh.4
 for <qemu-devel@nongnu.org>; Tue, 14 Feb 2023 08:33:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:content-language:references
 :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
 :cc:subject:date:message-id:reply-to;
 bh=fv06KlHm5S4u36VvVzh5hMjpgZcdil237xZ56Q/ZUek=;
 b=DfURLumt4Oep0/Ju9FilOCZuUbhe94xy/DJo8apYjebI1P/jmIcrq8EhzgO6uVH2uc
 MYSNGrN/gfylNg76rWg2gUECB6T5u32SUC2h6DK7ALVu6CUoBFT2+YZ0YEQUPfaXh4h9
 x084NxHbvWWQXehVcbwapVvhP3VZSL7p9vtEy44sKyfriUhcCG2jstE5RQRCyvRvTwDU
 ay3db83qJY0Ll9121thnOBV3XxxJyBioe0Evmex/tdyeLk0CglU1nFCB2o5gHwLPLoel
 3gYjt/kquh60gdJG/MdJEmX1UDt/kOeozo/q0kdreaD4YGIzv+v9cNf/QWtqj8X6YOyY
 AofQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:content-language:references
 :cc:to:from:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=fv06KlHm5S4u36VvVzh5hMjpgZcdil237xZ56Q/ZUek=;
 b=rayIhk2J6McpF/2M8IgfO5oz2rPEeEqt3TtJeZYhc5E6owFfkOs+u3mFhjyD4psT+1
 Nw4/fUQ14wUfiWcqWeel5s632RknFvciHzGJWn7vCWDMKMDH6OSgpud3wADVuS6SOTko
 W3JpHj7RTB4mmcF+LqOFxHW1wfLcpjo+H/85Oz51TGtyiKRMIbX0kJ90hmEoYxQUO4s0
 t5gA5x76+izVdaoHg4MrFbxEw7hLwQzlDoG8+HKRzekIFXvCtXOcaetdcDvP0Fi0xceC
 rQHT8v16lzPe0+AAgmLaO0Km7f6ZgJGP3yVAe1O6xY9eV0EByUN9qfcCTnkrVQNuNM2/
 +QYw==
X-Gm-Message-State: AO0yUKVmDkYxelWflw79r21jJUB+3ZPLebkjV2WvI3tq4JVaAYxlFLno
 P9z50rEfT60+1DdfMRLGYhEnJljQ7ppcJPxGSgs=
X-Received: by 2002:a62:5b05:0:b0:5a8:eb62:293e with SMTP id
 p5-20020a625b05000000b005a8eb62293emr638323pfb.7.1676392401323; 
 Tue, 14 Feb 2023 08:33:21 -0800 (PST)
Received: from [192.168.192.227] (rrcs-74-87-59-234.west.biz.rr.com.
 [74.87.59.234]) by smtp.gmail.com with ESMTPSA id
 s13-20020a62e70d000000b0059442ec49a2sm5129762pfh.146.2023.02.14.08.33.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 14 Feb 2023 08:33:20 -0800 (PST)
Message-ID: <3faabe0a-032a-f50d-c405-f4b8e70e5647@linaro.org>
Date: Tue, 14 Feb 2023 06:33:16 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 14/14] target/arm: Support reading m-profile system
 registers from gdb
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-arm@nongnu.org, David Reiss <dreiss@meta.com>
References: <20230214163048.903964-1-richard.henderson@linaro.org>
 <20230214163048.903964-15-richard.henderson@linaro.org>
Content-Language: en-US
In-Reply-To: <20230214163048.903964-15-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42f.google.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.35,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: d65sweEZE7TG

On 2/14/23 06:30, Richard Henderson wrote:
> +    for (i = 0; i < ret; i++) {
> +        if (arm_feature(env, m_systemreg_def[i].feature)) {
> +            g_string_append_printf(s,
> +                "<reg name=\"%s\" bitsize=\"32\" regnum=\"%d\"/>\n",
> +                m_systemreg_def[i].name, base_reg + i);
> +        }
> +    }
> +
> +    if (arm_feature(env, ARM_FEATURE_M_SECURITY)) {
> +        for (i = 0; i < ret; i++) {
> +            g_string_append_printf(s,
> +                "<reg name=\"%s_ns\" bitsize=\"32\" regnum=\"%d\"/>\n",
> +                m_systemreg_def[i].name, base_reg + (i | M_SYSREG_NONSECURE));
> +        }
> +        for (i = 0; i < ret; i++) {
> +            g_string_append_printf(s,
> +                "<reg name=\"%s_s\" bitsize=\"32\" regnum=\"%d\"/>\n",
> +                m_systemreg_def[i].name, base_reg + (i | M_SYSREG_SECURE));
> +        }
> +        QEMU_BUILD_BUG_ON(M_SYSREG_SECURE < M_SYSREG_NONSECURE);
> +        ret |= M_SYSREG_SECURE;
> +    }

Peter, from our chat on IRC it sounds as if you would put this block #ifndef CONFIG_USER_ONLY.


r~
