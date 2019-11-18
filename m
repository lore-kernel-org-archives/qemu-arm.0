Received: by 2002:a05:6512:48d:0:0:0:0 with SMTP id v13csp2573963lfq;
        Mon, 18 Nov 2019 00:46:33 -0800 (PST)
X-Received: by 2002:adf:e74e:: with SMTP id c14mr27568394wrn.124.1574066792946;
        Mon, 18 Nov 2019 00:46:32 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1574066792; cv=none;
        d=google.com; s=arc-20160816;
        b=H8I8QFOuja1wu9p1Rk+yy6Tueme4r0rAGKRZgJaMA3Um1Fg4rbq8KiT9iFaDJHF9zk
         Q3jEaXEQMpAbF1kuCXUbiSrtoGOWbj3CAxPw3It32SY1+RLXc8ViGk/AUNNbTykK7/1p
         VzIymNlyEstpvLVtS5hYNzkPVvlRhDUknvgXrWgT+u+qWHdr/025cLn/dog+sTU4lySm
         3UOr9AsjSlJZ2mhO60wa3igBjg03Je0e5Eg166pwsU+GQ5DSFciNYtc4LZw0U10xh2mG
         VCmDlq9tkqQtwaDDZ4wbWaa/Hlhwa9n+mCNf5VnaumyzJsh740nvle7FzVjf6Y4e7euk
         QJhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:cc:to:subject
         :dkim-signature;
        bh=39OfZ/J1dOFY5eLk7gwS8kBRO4HQ1+nXIDUn6BWoxos=;
        b=k0OKqviXuO8WK3bs8ETYGRO27nNche0PatQ0unKjrIMjkd1xpw6ruOdwtudSg8gQ0A
         IoMEtLRdXlkP4HKJqjMyHvFOuBha9te4129kmhE9Pzt9itHhQhrPnkwaUBzlRUXjgN3U
         Afem2HD+k/c9tvm1GWo/V+Zviq/uTj6zUvqL+VGJBCagvCUO5vMWfMiI5ZbbAb0Y85NP
         OfI0x1qBCCOwEsihgfZF/fiWk6qfokVJuykZCCjpkSVux/kbutJeCUAwZt7V71b61ku+
         hGwWjaj/JAWCqjkF5//Fd2vvoMMlAgwrQMa1/eMmFPP/F0OEn6uvXiV0gcrvYHUStGTD
         lO5Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="n5fDL/GQ";
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id s5sor10761533wrr.7.2019.11.18.00.46.32
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 18 Nov 2019 00:46:32 -0800 (PST)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="n5fDL/GQ";
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=39OfZ/J1dOFY5eLk7gwS8kBRO4HQ1+nXIDUn6BWoxos=;
        b=n5fDL/GQCpyriBsTqwv0bXwa8J3DVytdiLnLHZlxsjUCfmvsiA2lQcA/NMYtpaRjw9
         rfxFLp3MuFPdeZJZV3kE7o9TEB1Tx2CMEg6jDWXt31f7IjNZ1K/g5yXW54JIew9Ajouv
         QNxR0DsQyBGz6v5/5d9HfhR7QWl3fEdR97czUN4mu59VnXYZmvdZpPTRrLO0+7B5k9yj
         k7ndBee1DT3BErPzjHf1qyN7iq1bHbRDIkhWwgAOsIksNQ5gYJ+RBifYO7ifGwjyMrvA
         tCnREZvFkwUgQGi/A6jnchMANoLYXA5b6FbgKbosPPix3mg45CA7Obj1pYkTJJEtBghb
         Fvxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=39OfZ/J1dOFY5eLk7gwS8kBRO4HQ1+nXIDUn6BWoxos=;
        b=WlrGiobZ0URB2W5PG2H+KdOPi4cgcRe6gKVIDt3PAuWpLBKYz5n7whPTccwektN2r9
         GyWCrLYQeSjyeRqxjCg7FY0tml9tik9Vj3scH6HUpznWLI1Wfxyp3g7IYDp341QFmwle
         siUiaJXChbKh76bsIAqCQXgDjMpu6faljAiOHqOxi1bzJHPKRJWspMEcSECqjmmbLTTM
         +dvyvMB+/ivDMRciqs+4DniiPK06vJjq+5rvRfUFQt1HmoeH206IJgC3VjUq5vm7F94y
         7Uy9N8c8ixSA9XBv16B1CesygK/bEwMqqyPa4tbkBdlwcg3RWpt5jV2fVouttvkw78zm
         ScBg==
X-Gm-Message-State: APjAAAUl334HEMISESQ87EcEX2FSdlI1YCcvnvhIXHtvSR2cMneolXpZ
	tZ+JorjzuUsxEoRasghKjuR3e/1i
X-Google-Smtp-Source: APXvYqy+o5zQNEBg5xErOPnx+93cChLNwmyDEiU3ElYtv7yTbH5XWp8GY9buCQj8X7mkEzj6O0SVxg==
X-Received: by 2002:adf:ff90:: with SMTP id j16mr19971770wrr.361.1574066792610;
        Mon, 18 Nov 2019 00:46:32 -0800 (PST)
Return-Path: <richard.henderson@linaro.org>
Received: from [192.168.8.102] (65.red-79-149-41.dynamicip.rima-tde.net. [79.149.41.65])
        by smtp.gmail.com with ESMTPSA id 11sm20378524wmb.34.2019.11.18.00.46.27
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 18 Nov 2019 00:46:32 -0800 (PST)
Subject: Re: [RFC PATCH 11/11] target/arm: generate xml description of our SVE
 registers
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: alan.hayward@arm.com, luis.machado@linaro.org,
 damien.hedde@greensocs.com, Peter Maydell <peter.maydell@linaro.org>,
 "open list:ARM TCG CPUs" <qemu-arm@nongnu.org>
References: <20191115173000.21891-1-alex.bennee@linaro.org>
 <20191115173000.21891-12-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <d3d7db44-6492-7309-1864-fd67d85bd404@linaro.org>
Date: Mon, 18 Nov 2019 09:46:16 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191115173000.21891-12-alex.bennee@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TUID: rZs8pUDcwscU

On 11/15/19 6:30 PM, Alex Bennée wrote:
> +int arm_gen_dynamic_svereg_xml(CPUState *cs, int base_reg)
> +{
> +    ARMCPU *cpu = ARM_CPU(cs);
> +    GString *s = g_string_new(NULL);
> +    DynamicGDBXMLInfo *info = &cpu->dyn_svereg_xml;
> +    g_autoptr(GString) ts = g_string_new("");
> +    g_autoptr(GString) us = g_string_new("");
> +    int i, j;
> +    info->num = 0;
> +    g_string_printf(s, "<?xml version=\"1.0\"?>");
> +    g_string_append_printf(s, "<!DOCTYPE target SYSTEM \"gdb-target.dtd\">");
> +    g_string_append_printf(s, "<feature name=\"org.qemu.gdb.aarch64.sve\">");
> +    /* first define types and the union they belong to */
> +    for (i = 0; i < ARRAY_SIZE(vec_lanes); i++) {
> +        int count = 128 / vec_lanes[i].size;
> +        g_string_printf(ts, "vq%d%s", count, vec_lanes[i].suffix);
> +        g_string_append_printf(s, "<vector id=\"%s\" type=\"%s\" count=\"%d\"/>",
> +                               ts->str, vec_lanes[i].gdb_type, count);
> +        g_string_append_printf(us, "<field name=\"%s\" type=\"%s\"/>",
> +                               vec_lanes[i].suffix, ts->str);
> +    }

Really?  Separate 128-bit registers for each Zreg lane?
Surely that's not what gdb does...


r~
