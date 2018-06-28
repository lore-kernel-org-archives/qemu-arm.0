Received: by 2002:a5d:4301:0:0:0:0:0 with SMTP id h1-v6csp7578100wrq;
        Thu, 28 Jun 2018 08:47:26 -0700 (PDT)
X-Received: by 2002:a63:6a89:: with SMTP id f131-v6mr9357748pgc.311.1530200846172;
        Thu, 28 Jun 2018 08:47:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1530200846; cv=none;
        d=google.com; s=arc-20160816;
        b=zY0sVAC4gvAxQ0qCa6CQaXvziu03nXzlU+O3LO70grK2VxZcivpTvfxYYLfKHyMCUy
         OJL+EA7gLzO5koLKUMM7u1RTaT39H4nfj9AndbSz71U9Er/BMjo/NaHu5bQcTwlPMoO8
         01x2DKJmqC1V6rk4iXmePo0+5My7kYsgQhd8D+bB0n8kMplvzdounP/CpwptEuN2IpE3
         tQ3iqLwxtGtwfCZUWZZ/NP50mYaI5VBG1jqiEPdLN9cTnh51pYlwNEwVYRn+s6t6OU9Z
         HsP2ChNoLBwpTcTR9wbUfKPXmDNc2DmumsTakswSjasp9DhM/oA1F8P2GlgNC+XZwFdB
         gs7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:cc:to:subject
         :dkim-signature:arc-authentication-results;
        bh=Mg6txVge/zn4QxG6TvyjsASPrdWyoyPGgPJeoezhu6Y=;
        b=DYSkFwcjnv7Zwd0h3UTL8te3XSg4nY4I5fPMnN2Bedvn/3TMSOmOJqtLg/RclXaz1i
         7KDSfXmfLZBfwWOVyRZJQ5pdbeB7lfcOrpEy7T627Kwws/73dg2C7GdtjgIfs/KU9Edu
         TO2ZdqSlequWagHjaZIvlvQ8YFLrmWMuydM0AuYogTppjX+lfejElulV9Hgv7djf0UgJ
         FFrW7g4ILdoKO8H/B09RtdN5NirqUE1QfPvlaDAvEZHkfvfDNTzhQ/70SnQysrngDitE
         2tfrJuk5j7hxDXI22uNDnMmDEv3J6yN8cZUsg1iB/Rf5jMLOogtbP89zjV0jlt2hLLSy
         JZUQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="e/Zj6zf5";
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id d10-v6sor1963886pfb.51.2018.06.28.08.47.26
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 28 Jun 2018 08:47:26 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="e/Zj6zf5";
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=Mg6txVge/zn4QxG6TvyjsASPrdWyoyPGgPJeoezhu6Y=;
        b=e/Zj6zf5Ca8yTgTt78uN889N0ETV+UsCTyAMrrcXyjRHCt0OpTRnRDlBFpLQUcK3j/
         2VdDpsA4TBmQrAY4am+fR62vKNYoU8QI7JynXJD75B1li9FOh2/Atjodn5bVHzAszk1u
         VlJ245FK5xHoZB6orNy21jnuiJvRWOW1371eg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=Mg6txVge/zn4QxG6TvyjsASPrdWyoyPGgPJeoezhu6Y=;
        b=KkHG+NrJiCTSWjglxOpcuowo/Ljj86wET7RUEvpn8P1Ocpur0cqCpChHbE3gkgfPiP
         0G5GuEwrcqlD+YyEWiYIZYD0/W2lCfSLU17/meV/NNY2rm0aGZlokOVwL+actaMajque
         6zjKp81YaQqlg49Im3PPgub17VOiRkmV+afCrSMa4fygbiwlg6Fr7FPIB8raq5OqRwpT
         p0DSzlQwIAqgMePlGrh5FO9BWJIOfJ0bpbGcyMJp5Bu99O6CWjqKjfL6kV5owtjfWDQX
         ZhBvzUIlcDMcfZ2O5XXVNsaIsA4GnBw0YWzbN4yIKPIizTRt9cBX5Sj6bcoo+fUzGbxZ
         Et4A==
X-Gm-Message-State: APt69E2j1TbjItQzP/obo078oaFoYw+01ioRiuopBaXzEVwliAHLHjJF
	MYeNpykZivF5xW38+SWiNJ+QTgzEH9uFSA==
X-Google-Smtp-Source: AAOMgpdm701G4PTmheZDjz8Exd35/7OXzIUFfoHlwUHiXckq8rbuD7sG/vFMsyP2Iw0hfs2PJXwblA==
X-Received: by 2002:a62:a018:: with SMTP id r24-v6mr4654533pfe.144.1530200845715;
        Thu, 28 Jun 2018 08:47:25 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from cloudburst.twiddle.net (97-126-112-211.tukw.qwest.net. [97.126.112.211])
        by smtp.gmail.com with ESMTPSA id 67-v6sm12431248pga.9.2018.06.28.08.47.24
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 28 Jun 2018 08:47:24 -0700 (PDT)
Subject: Re: [Qemu-arm] [PATCH v6 33/35] target/arm: Implement SVE dot product
 (indexed)
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org, peter.maydell@linaro.org, qemu-arm@nongnu.org
References: <20180627043328.11531-1-richard.henderson@linaro.org>
 <20180627043328.11531-34-richard.henderson@linaro.org>
 <87sh57uhva.fsf@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <a6a72cd5-d4c9-ee47-434d-1576a5e455d3@linaro.org>
Date: Thu, 28 Jun 2018 08:47:23 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.8.0
MIME-Version: 1.0
In-Reply-To: <87sh57uhva.fsf@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TUID: bb7w6Quqytyv

On 06/28/2018 07:04 AM, Alex Bennée wrote:
> Looking at the dissembler output I guess the metrics don't make it worth
> the compiler vectorising any of this which is a shame.

I think dot product pattern recognition is still being worked on.  At least
that's what I recall from a conversation from Richard Sandiford a few weeks ago.


r~
