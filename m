Received: by 2002:a17:907:c68a:b0:84d:2074:29bb with SMTP id ue10csp4416419ejc;
        Wed, 11 Jan 2023 16:37:30 -0800 (PST)
X-Received: by 2002:a17:90a:1957:b0:225:a78a:942f with SMTP id 23-20020a17090a195700b00225a78a942fmr76820012pjh.5.1673483850135;
        Wed, 11 Jan 2023 16:37:30 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1673483850; cv=none;
        d=google.com; s=arc-20160816;
        b=Axv5/ghmm2Skg53AIoWPdKiTNPgxrdPE8b2gKWtbiRpmS855hIHLS6V3XVSN2HJxPY
         ogv85LxidjMeLt6jAWdt+FyWIgSE/HO+NeYSt0ntAIo0WcOYlgsmUeVzZEynTLK78/p5
         kwBTXfkiocowX2JjrF6I2SW6jbwj6l345Z3wKdsZtcouPCfvujLG29/lmwCHfEmTGEoF
         UEba5i4iwuM2Ai9Sou5LytMyHNKJaXGL3CxYQNcStaSw2+M8uelQsLUSINbpuJT9LH1j
         OCDHMzT3XkmMvmP6B2XCrSC5c0uI+CthYEexo2mgHH/G+5u6NByuiebW/wIWPOnOBUC3
         LiQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=NHe9dNY1K3nmf+eGBsXRPck1pnlk9Q/oUevBJyUKEic=;
        b=L+oe3MhSKfw/KLoguSh+FRRW70kKNDyhj4xa8QVDeYUZNqV+yWi1id+CRdaFb2uifQ
         KtI1c4ugYMiU5sZYAgQUVOVZaHfjQT9wN4oIoR69kiKJb/lsD6yd7X8mPRjQ04G/8VxI
         Hy0t0WbPMTlKpWMpIBiyEsTstZJHbKK0AcknAWvkAj0Sg/9mTOhy225QdQhDlYIL4q7p
         7I1OP3QMTAPhlRZM4Dwv++7yeqv6jZ84CjCTwEDgeeCRU2RSb9SwOJOawax2Kz39O6lo
         +8/50Vq7o25Q3vnkDDXKQfnUxyQpVZO5EM1CUR6n+HZwXuvAJfvwfy0+/+6vdsxxS3RS
         ejCg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=RjG68IZf;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id n61-20020a17090a5ac300b00225eb703074sor9568369pji.37.2023.01.11.16.37.29
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 11 Jan 2023 16:37:30 -0800 (PST)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=RjG68IZf;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=NHe9dNY1K3nmf+eGBsXRPck1pnlk9Q/oUevBJyUKEic=;
        b=RjG68IZfTyPWTbOK/wtTwhVfd8EhlSUoxqbR9NQTfRNUkAfAxC/D/Ru4czxLy/1AhX
         PyT/Ln6QdcFd7N7bOB2+/clGNzYp6vLjtYKVQ3XKJ1xZOkZCjhzD9wzKK1KgYmi7FxJB
         OH2fDqskLCpTMBTjYwKBv0fcCw7TvKL8LNEd45lcJSW4xAUHzas6F4kuYe8wpgNd0yd7
         m4YkRzXHKQG/vCA9861oxPJBT5H5TDrooPLxrA9C1bvjMNDOU4R+oyWjU90wbrc7Zhtn
         4rHAyG/Ds9afTXivA3cSHOBCt+XIEnJ44GZyfZ+7iEGmtCu5pQ2rnBul7KMjMXUhCamx
         VPmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NHe9dNY1K3nmf+eGBsXRPck1pnlk9Q/oUevBJyUKEic=;
        b=FR5TuLL9Gw5gMucCxXQfqxD0vT3IY/ZyWutIb3iKck/FY6/+qDpF7NWh2eo9TzQaTS
         W0DB1UWhuEi0t4wCcwLwc9A7F0fRZ+XnWuUIZ/OqFR6tig0gwK4mKKcQCHprBvhhy/m6
         iNErpGfVgvQ/eKr5jGIPWDqdx4FxO21nVPn96/mTWibW6uIY885Q3c0u5NjH6DsuuPZd
         8Y2z76NRgnOKVaV1QMr52oTAA0UbrSy2Hs5VwXoUBrgEculwxvlTDy60ez078BqA7yEB
         6a3KqQRengbZXkN8hID5Nw7O3YStkLJ4atWNnFhN6eE+JIMXfMieDB4Ga9mpdfNe782r
         +qog==
X-Gm-Message-State: AFqh2kqJMgqZ7tP4C30yZDcIzwAJCjoGNv7MNBU+hyRyiJwbXWy3ghiZ
	0TxJW2OJhndqxN+2tW2o8WVVj3vM
X-Google-Smtp-Source: AMrXdXtDu06Ah38uPc1HPAtBxFq2YcxnLMVyEJFHcwIINvKH5asLHydbqKYEW8kNQ8wJgz0Jm9ak6Q==
X-Received: by 2002:a17:90a:6443:b0:226:f85c:2333 with SMTP id y3-20020a17090a644300b00226f85c2333mr16843963pjm.20.1673483849634;
        Wed, 11 Jan 2023 16:37:29 -0800 (PST)
Return-Path: <richard.henderson@linaro.org>
Received: from [192.168.5.146] (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
        by smtp.gmail.com with ESMTPSA id em6-20020a17090b014600b00223ffe2ba61sm9631602pjb.15.2023.01.11.16.37.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Jan 2023 16:37:29 -0800 (PST)
Message-ID: <57ec8753-a08c-914f-d0ab-3e1e62682cb6@linaro.org>
Date: Wed, 11 Jan 2023 10:29:09 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [RFC PATCH v2 12/19] target/arm: Move hflags code into the tcg
 directory
Content-Language: en-US
To: Fabiano Rosas <farosas@suse.de>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Claudio Fontana <cfontana@suse.de>,
 Eduardo Habkost <ehabkost@redhat.com>, Alexander Graf <agraf@csgraf.de>
References: <20230109224232.11661-1-farosas@suse.de>
 <20230109224232.11661-13-farosas@suse.de>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230109224232.11661-13-farosas@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TUID: jxmc6YhP4rMy

On 1/9/23 14:42, Fabiano Rosas wrote:
> +inline void assert_hflags_rebuild_correctly(CPUARMState *env)
> +{
> +#ifdef CONFIG_DEBUG_TCG
> +    CPUARMTBFlags c = env->hflags;
> +    CPUARMTBFlags r = rebuild_hflags_internal(env);
> +
> +    if (unlikely(c.flags != r.flags || c.flags2 != r.flags2)) {
> +        fprintf(stderr, "TCG hflags mismatch "
> +                        "(current:(0x%08x,0x" TARGET_FMT_lx ")"
> +                        " rebuilt:(0x%08x,0x" TARGET_FMT_lx ")\n",
> +                c.flags, c.flags2, r.flags, r.flags2);
> +        abort();
> +    }
> +#endif
> +}

Inline marker non-functional.

Anyway, this should not be separated from cpu_get_tb_cpu_state, where it folds to no-op 
when --disable-debug-tcg.  Indeed, I once had it textually inlined in 
cpu_get_tb_cpu_state, before Philippe thought it looked nicer as a separate helper function.

Otherwise,
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~
