Received: by 2002:a17:907:c68a:b0:84d:2074:29bb with SMTP id ue10csp2892090ejc;
        Mon, 9 Jan 2023 21:41:18 -0800 (PST)
X-Received: by 2002:a17:902:e30c:b0:193:30bc:ed86 with SMTP id q12-20020a170902e30c00b0019330bced86mr5763694plc.48.1673329277898;
        Mon, 09 Jan 2023 21:41:17 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1673329277; cv=none;
        d=google.com; s=arc-20160816;
        b=rKIx7NwonRWNlwJ/+JWkOZugPKXlF+/gAR72ZOTSlzFSRIZSpAcPdr8C9+A0st7p5t
         Rpcj/XBlGOVW+uzY6ysoec/Y9RodiME95iLkJ5GdVfJ4mVc82wwnVPD93g9QfAQH7lhD
         EZZQYXOrY3mVwyyEPFhZiiuLUdJE6+Ewl3S6uXN5JpOIKR8EOG5sV53Y8loWh9ibeuSs
         mYg01AJtIlrmMklC8jfSDgeN0DahEbMctTR8Gkq+YHEgzLE6ld1du9PJ1V0ctvfgNsFE
         urB7GvjsXqMXDN+vFFqi1Om8Luvy4zY5XwoQggwLEPndQ9fuhiDwtXHGq9VTGiKHHaHt
         2ylw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=CMcsgO4s+upnfvngtEhHPVefgeFSugrU4khaEdbHlnc=;
        b=eprcuKbEjuSga8cF1sDTTC9HEH6HUQeZv24ZRLIpvbQaCph6nYLICsMUzluVRPPnEg
         VXy6tyTBNFrwdzgEAkRyQq2tCTPAlHxMdmOVgKPh08xQzmJ3jf7Lw96L6t8cFkAsDuuF
         Gbs3fuOIfym/ox57DeO1xmcXZhFf98D36IX4YjlkcQ94ky6FNXLbi0YtFW5dzwy2KFYl
         CJl2g837X/jD6f/RvJw+B2KbDcwaXDI+GMlKuUmKJOTkeqMxrHxCnqf9+E2udmjcuUIV
         qLeURN3VDLKw6RoMa3gbCJcqrB1f1zIoGLNvymEPLwaOlFqEdARP1EStWZOkEZ+RJBTA
         kDRA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=yQHZ+czk;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id a9-20020a170902ee8900b001925284c1f1sor5148205pld.156.2023.01.09.21.41.17
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 09 Jan 2023 21:41:17 -0800 (PST)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=yQHZ+czk;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=CMcsgO4s+upnfvngtEhHPVefgeFSugrU4khaEdbHlnc=;
        b=yQHZ+czk58zJJGchc5mLwAEWKKhsGwPReAMdEB3g2peL6Msf7vEz5l651EdlKLfqiN
         dh5j3cdddo4rI/3P6AieaV7AYJUmXHrTmuHQZFrVbIqYhCBlvf0G/IWZqgzucIB6gYCO
         n0TXYWIqkoUPfXirKfHuJNkb9j/zaO1mn2Q9CAqborOLKwJG7mrrWtbBVQBs2ouFv8Ta
         IN1xbnzQg24S3RvXooCUf+55CDa2hDx/g83b4SxJABCq+yA+5QAaZEdWG6/cVyg84Y75
         ocxhzd6kT95ScBom3j+tLr3dLCF5zmK91pSVDirJv1OXWGSqQly5U9KfFkDVDe2wBfxe
         Tvww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CMcsgO4s+upnfvngtEhHPVefgeFSugrU4khaEdbHlnc=;
        b=zSn2XxRnd6riDwe/Y3N9I+t9dW3tZh6mLqEj3dMPYEPxtzcqlAY+5XFIAJOQ/KqmS6
         2uR8ON3934K2jX4qUaGky0TeMmFw4zMoLrBLYGByCZ0bDtE3pZ5b4f1z8A7K72F+48ZM
         sGvkw85PGp79pukU/Qqf3TsMO034n5TfHI1HopxKaNaUAOr1h51oyUOZm9vzWwF1QBW9
         VnpTEXQiLzotZEHzIzmTRtg3UovkrB0R4FBKXg+GJIwF777aDwXrYKPgGOznTyHGJ3v7
         KmAG7MBRFk7MaryjWChZFWdiiXEoI7gS6S26aeNyFNDfSu/eB3QniAYE4ZjvaxptJDD+
         2uEw==
X-Gm-Message-State: AFqh2kp1MWdSy9RYdiML6VELEU/mRJ6tMd3kKgpzIaqHRFPRe0kX8Oxu
	p/C7NDuXY10xs9mdC1xhUDjHcVUj
X-Google-Smtp-Source: AMrXdXt2AHtBPOJpDiZyY+Bob8LdzQH6gsfMJFzZhaNVymZCbb9yt5WDlGUKbyex8eiNpm0l4o2Zdg==
X-Received: by 2002:a17:902:d491:b0:192:ad82:dc98 with SMTP id c17-20020a170902d49100b00192ad82dc98mr52769018plg.34.1673329277425;
        Mon, 09 Jan 2023 21:41:17 -0800 (PST)
Return-Path: <richard.henderson@linaro.org>
Received: from ?IPV6:2602:47:d48c:8101:fbd5:d294:fb18:71f9? ([2602:47:d48c:8101:fbd5:d294:fb18:71f9])
        by smtp.gmail.com with ESMTPSA id n14-20020a170902d2ce00b00189c26719cdsm7033852plc.272.2023.01.09.21.41.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Jan 2023 21:41:16 -0800 (PST)
Message-ID: <4e758b11-9de7-ab44-d400-8457a3f51262@linaro.org>
Date: Mon, 9 Jan 2023 21:41:14 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [RFC PATCH v2 06/19] target/arm: Move define_debug_regs() to
 cpregs.c
Content-Language: en-US
To: Fabiano Rosas <farosas@suse.de>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Claudio Fontana <cfontana@suse.de>,
 Eduardo Habkost <ehabkost@redhat.com>, Alexander Graf <agraf@csgraf.de>
References: <20230109224232.11661-1-farosas@suse.de>
 <20230109224232.11661-7-farosas@suse.de>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230109224232.11661-7-farosas@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TUID: l0SzoylC1qLC

On 1/9/23 14:42, Fabiano Rosas wrote:
> -    hw_breakpoint_update_all(cpu);
> -    hw_watchpoint_update_all(cpu);
> +    if (tcg_enabled()) {
> +        hw_breakpoint_update_all(cpu);
> +        hw_watchpoint_update_all(cpu);
> +    }
>   

This and the other tcg_enabled() addition don't belong with code movement.

Otherwise,
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~
