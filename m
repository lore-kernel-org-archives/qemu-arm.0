Received: by 2002:a05:6512:3aa:0:0:0:0 with SMTP id v10csp1314270lfp;
        Thu, 6 Feb 2020 03:20:57 -0800 (PST)
X-Received: by 2002:a1c:80d4:: with SMTP id b203mr4124904wmd.102.1580988057462;
        Thu, 06 Feb 2020 03:20:57 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1580988057; cv=none;
        d=google.com; s=arc-20160816;
        b=PaK1HOp1LE+h+6bu8bGmvF8kR6F+sc2NQWtjJOPEE5+SwPdkVF/Zvazf4blEguouu/
         bwJuRCmSN65FNrUMXGxT/PwRX3S6ynfuz+97f0XT5kLmH4oYwgfQ4vHPqP/HHlcjGkT7
         pl+ffltNBys7u+xHaqBA0LSztl+RSIQrf3TKsSPUPpsV58To7HQWviRrdtsvN4yzexJR
         JOPiuCFaL2Osp3cNf4TKF6GTAR9vwpcy/86GiKAZzQipZoAGVi2lWKG/f6cY2E32+uea
         Cuo/532DZZNRSOV9148pI2l4CJ/ODgwmlbCrV2RCcG5M9NqSkPVMT1GCV3edZUyasQqp
         6RTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :dkim-signature;
        bh=DUVPfj0Doeo1oaIiHPJS4+xEoCsIB4ACDpNMnv0yaWE=;
        b=MJXiu7W2a7uXgnc7+W4XtyVZNFae+sNihsRniLkmci41G9MnAw1b7hFUeVDseNcRfl
         g2Zd6+IQ2DscnTglgwtB8GvwWVSC5/DpSlfmIXcDjl3X4YGcgrmV5HGn7bpAO58dBTlK
         +YjInUmO7d1VRuEK/N3cIq/RovwtgoeEijiszB+pHubC2UIK1Q3rI9AuszrvMihr3WGs
         s4ItH6SQ+c/PRlDNZXF2dn9BWZlqHMWAVpBM2KurTR0M4NiEKHJc1AybxRvckqoHDmoh
         u0YejotdaQ3LvIIdul8sWy6DbspopnUoUN3pXsLZ68BpjMcRa7IdLHxlLdbVnBI0xV0f
         C3QA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=QAPegndC;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id v6sor1834253wrp.36.2020.02.06.03.20.57
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 06 Feb 2020 03:20:57 -0800 (PST)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=QAPegndC;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=DUVPfj0Doeo1oaIiHPJS4+xEoCsIB4ACDpNMnv0yaWE=;
        b=QAPegndCpsbpg/ghhVdB9yR33j9mH+HN+jItd66lg8uQPS7G6zU0wVVv4xCOvq0xyP
         dvOWp1RwR+yUREY4b4LJRIlRGw127M6D5P2G+Z51x7f0wWrOfwZHb6MN9X1a8YBEcfrc
         En+MD2M7qcSkTYBF3rIPympL8zHRVcEiOhjgB6rgRh/TqXFEMinxpLkc+8ep5sObs4dF
         DHsWHZSxVQAMBK4H9OrUTYrXGy4qJVSwxrFy713xqwkp80vhvqGCIsjmsCTvUAhmuyem
         tfoduSgX8oEELTh1DPX7IPMNt7IDTfElsId6dTkdvoPtzNTSH5xZ48ssaklagVXoCC6w
         KbKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=DUVPfj0Doeo1oaIiHPJS4+xEoCsIB4ACDpNMnv0yaWE=;
        b=kAkNGUsOrsl53c4uoVxLemqrq4u++mnooR5U1dKDW8HsTMZXRcjv2rqCQ52reg4Dn0
         rlIk/ci9D8OFRLiDwHCQ+b3B0uuezmrF6mNWmyDYPitOrZy4mydm/WyImxmCwRWQXrOj
         DdABXKzNSQsWWanSOLGVa4fEsExyqIALdEf0hr73Jfdt8qcHYdUCfHLrsdS8YV0OPWpQ
         mctwv/hZ3D9YMChdmGWYZpigIteghf2Yk44YvHnqor2qP1ix7AlkgaDIhQ1wM9Czf83D
         5mkLQgm59Pk8OJqWBbYW89bj7KVCRkTRN8moxY3iwvYu6LkGXcMmSwIN+UiBIG1yX7eB
         Dhpw==
X-Gm-Message-State: APjAAAWGxLfPQ5L+hY9Wx0lNii9MtOkOJLUtib1Sx4N5KfDfMl4C/Y9b
	93IDmS4dEbxHT7p/8VmgWemzwtTm
X-Google-Smtp-Source: APXvYqw+UUklzJNwoTL4FxDiA37aoKExeHFoItXJou+3HUojmICWQk5tJ+rr9UW/kQaM7mL9cLAzHA==
X-Received: by 2002:adf:ce87:: with SMTP id r7mr3302102wrn.245.1580988057130;
        Thu, 06 Feb 2020 03:20:57 -0800 (PST)
Return-Path: <richard.henderson@linaro.org>
Received: from [10.43.13.93] ([135.196.99.211])
        by smtp.gmail.com with ESMTPSA id x7sm3720499wrq.41.2020.02.06.03.20.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Feb 2020 03:20:56 -0800 (PST)
Subject: Re: [PATCH v6 13/22] target/arm: generate xml description of our SVE
 registers
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: alan.hayward@arm.com, luis.machado@linaro.org,
 damien.hedde@greensocs.com, Peter Maydell <peter.maydell@linaro.org>,
 "open list:ARM TCG CPUs" <qemu-arm@nongnu.org>
References: <20200205171031.22582-1-alex.bennee@linaro.org>
 <20200205171031.22582-14-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <0e13f013-b251-aa65-ff11-2c981ac0c965@linaro.org>
Date: Thu, 6 Feb 2020 11:20:55 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200205171031.22582-14-alex.bennee@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TUID: LM1uGLMUE/jI

On 2/5/20 5:10 PM, Alex Bennée wrote:
> +    case 51:
> +        return gdb_get_reg32(buf,
> +                             sve_zcr_len_for_el(env, arm_current_el(env)) + 1);

vg = vq * 2.  Need the multiplication here.


r~
