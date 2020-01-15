Received: by 2002:a19:c345:0:0:0:0:0 with SMTP id t66csp7575009lff;
        Wed, 15 Jan 2020 15:11:16 -0800 (PST)
X-Received: by 2002:a17:90a:9f04:: with SMTP id n4mr2931194pjp.76.1579129876040;
        Wed, 15 Jan 2020 15:11:16 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1579129876; cv=none;
        d=google.com; s=arc-20160816;
        b=1DwUvproB6riLeze0P2chL8nf9/7ddeNSeIy1huTvNGfuMsjBcRlIQGD56//EsY/WL
         DQGjLF6kqpw1ecaJuRZ7pCrHy7aJZqY/e2CjzWpacz2CCcKQIPodTijcnmO+sf474k+k
         AYZXoY0FpmCp3ASoazQjvYSCcAON0/59sO0c6xkTcjwnY9bhWe4zAWJapY/GGmiCdlCi
         aLkRkkXND/El7KfsQej6Uqg6Iesk/jPfQCa4LOAru6Rp+O+UpMotiqe9LQbyx0NzcXDj
         4dR/nN67XAwWq1Vb7PI5h+AlesBMB50Lciw4aPJfob868lU9nnJj2lVODoWk/JkfvLsd
         tK2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :dkim-signature;
        bh=I4mPk1xFiq8gQFU3P93Y8xgcA4rB7BYe5F5zsE7N3dU=;
        b=k/LJ1765SgFWJLhMHGeZWdE3uG4vHRAfsXLbYXqTl0uSlvruevBcrJC6GNV9ar6qT3
         yFqB7bHWVbOVTJRPeMcmo5PhUHFAp0yRdfFBRky8zu271O8/5a6qMDt/5RnO2FnyKuD8
         iq1PC1P967SjA5U0jYGFMV0cf4gUhYB4DHsSo9AsNqfRQEjvpWZig97N7pyoPs4Y7/T5
         jtzDmTEZiBGpo08Q2qPbxFbbfQelzGVOC79lMaDmGCCrHj4n8WtLvstDDYYgRNzuICRu
         aoUU104ficq8JWs30B5XevzLlNOgQXF6YRR+hbLn6oUjRwLqm++fbKjbZ58lb/T+tecm
         1TIw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=DyIaH8FG;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id h17sor22286243pfo.48.2020.01.15.15.11.15
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 15 Jan 2020 15:11:16 -0800 (PST)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=DyIaH8FG;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=I4mPk1xFiq8gQFU3P93Y8xgcA4rB7BYe5F5zsE7N3dU=;
        b=DyIaH8FGkhu/CA+uVCXwbRLim9Q7CjinkDB5ERikPasYG+H8tU0MDbESXRkyMY/Rd3
         23bMzEVcEQJO9+beSpJeHoN9EvFFLG0xiSWLvBmslcPK7RQlAc2KpvhMEJizEvV1KQFv
         x/0W6C5ivtyD0noIk+YyR/TPNaIlO1fYAhwkGY8QZV7YRcfFCR1Yk0V5Z8PM+huMsqJL
         HXHxlJ3s+w37RF0NeBFNPFa2CZluPByHCmHncKheGXvbFlKpRp4QQ5Pj2NAUJIC1C5qa
         z7KOVByKMxfosJFUIduNBaoouUovOYBWOHPRrkjvC/caDLsWbcZJFRfR8eCOhpaGYL2o
         +0sA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=I4mPk1xFiq8gQFU3P93Y8xgcA4rB7BYe5F5zsE7N3dU=;
        b=jOCh8iSwRfd4MnDyYIXTkvO1Ccmg5+cJyjz7fL424uX/RF8k1cqr42sclRq8UojJzg
         yuMgubIdZbWZR3okvxzXb23SQIvCfSu3ZHPW1rRjnHV7Bo83xhff/785goVEACEKkGjo
         5srf5agkzm8SELRwAKSBFxGcJB7L1j5mhoo/XPcDRA71/zaaBx2XsAqSJWOQgp/mhfJr
         3Bv7X7UkSnWHAHkGNcAL38uLOHRFRsdkrGhaYSPbKw9ig/uDfGwrl/sIsmtPNeQYS1pB
         38ACvHsk7p+QM70IG5DatXXc36cfHJYdvALNPXz2Qp3SCsmEcZ5MFgi9wd+kSXXgCshC
         SsHg==
X-Gm-Message-State: APjAAAXGnr4bToW4NV3Ht6p7ytRYjonGv/HKWCkqn3namZUB6qbwW9CH
	E+2aGTiKkccOHEBlygoW2EUWD6SSve8+7A==
X-Google-Smtp-Source: APXvYqw1qe3S943tSAygc0/NJUhfiBkgsW4BSLbxPyF78qmuGDE02G9dMz7Am6dJMo7ZRekVXFvzGQ==
X-Received: by 2002:aa7:95a9:: with SMTP id a9mr33392046pfk.15.1579129875682;
        Wed, 15 Jan 2020 15:11:15 -0800 (PST)
Return-Path: <richard.henderson@linaro.org>
Received: from [192.168.3.43] (rrcs-66-91-136-155.west.biz.rr.com. [66.91.136.155])
        by smtp.gmail.com with ESMTPSA id u11sm485199pjn.2.2020.01.15.15.11.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Jan 2020 15:11:15 -0800 (PST)
Subject: Re: [PATCH v5 22/22] gdbstub: do not split gdb_monitor_write payload
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: Damien Hedde <damien.hedde@greensocs.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-arm@nongnu.org, Luc Michel <luc.michel@greensocs.com>
References: <20200114150953.27659-1-alex.bennee@linaro.org>
 <20200114150953.27659-23-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <0905799a-eb0c-e64e-eccc-38d9d517b1f6@linaro.org>
Date: Wed, 15 Jan 2020 13:11:11 -1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <20200114150953.27659-23-alex.bennee@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TUID: 2WpNsSpAmOn+

On 1/14/20 5:09 AM, Alex Bennée wrote:
> From: Damien Hedde <damien.hedde@greensocs.com>
> 
> Since we can now send packets of arbitrary length:
> simplify gdb_monitor_write() and send the whole payload
> in one packet.
> 
> Suggested-by: Luc Michel <luc.michel@greensocs.com>
> Signed-off-by: Damien Hedde <damien.hedde@greensocs.com>
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> Message-Id: <20191211160514.58373-3-damien.hedde@greensocs.com>
> ---
>  gdbstub.c | 23 +++--------------------
>  1 file changed, 3 insertions(+), 20 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~
