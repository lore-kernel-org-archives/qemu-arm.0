Received: by 2002:a5d:6790:0:0:0:0:0 with SMTP id v16csp185414wru;
        Fri, 28 Jun 2019 17:10:31 -0700 (PDT)
X-Received: by 2002:a1c:cb43:: with SMTP id b64mr8435958wmg.135.1561767031627;
        Fri, 28 Jun 2019 17:10:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1561767031; cv=none;
        d=google.com; s=arc-20160816;
        b=GaiEpq1M3ajZ+EjMaC6nY04Pri0DbhFjgwqhOGtQMDB943vPn5qBtrQPh44xGJzVqa
         eAOL+IiZiwuN4/4YOjKFfTsRFbVwFK3Q8J1VnzH4p2cbEvDB6hgyEY8XajmUydhBHwOj
         aFlzrXZDUa4jJsnY5p3ROfl7w0JFllnwSYIL4l6t0ITmKH6Kvqfr3CC+lK05OhIijV0R
         jayAIkrN9UrIDXW7rdVY4RqWulJfoncDdSdrwtZfrbnuNKxHX9Vmp8pWgziJ1xPRL+zW
         89Wjg3Hz8wmja+APEvA3m7yaKCIHY9ISXUrZDVCA+rEN49aAGrR0utj9aUvIFW7Ujk+r
         F6hA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:cc:to:subject
         :dkim-signature;
        bh=W+njdGYXMwVUlALGNOEmZlA+AIB17I1tvTOGcXyYBh8=;
        b=V8xSih1xiqMQJ5s1p/9CzF94YhakYncXpRZ+1xJ7/mpSR8Vobm0v69ZA7jrRCYd2Ho
         mwhV4vvkQ94wsSd6sDYwp1UFrLCaryN9Nx2MwWfgfTDXWfE759WO/Ll97HL2UytqiSMB
         CRLWnnITj2HA9wFCpP+4RTNXdlmlYXzaCWv7ffVKYPSlJ4DHriZhR7YlEDbWSuXDEuAq
         m8mPQJ7pZCZEWGgmNTw55g/6T08JlQWfVotOVx/2lQnJ4kZ8ENkdSTo7AqOPTpn0HNaR
         QrWr6c1mqRA49r64HNr0ilT7M/L1ueJQUxpOBxmEiybWt40ADFwf3HUVhcvfCHPyeIm4
         Igmw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=D7DO1Zx4;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id f12sor17363wrx.4.2019.06.28.17.10.31
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 28 Jun 2019 17:10:31 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=D7DO1Zx4;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=W+njdGYXMwVUlALGNOEmZlA+AIB17I1tvTOGcXyYBh8=;
        b=D7DO1Zx4LFlZv82Ve8Ko0ckgqU+QXNdsUmp8uS7zRoQw6dANh88Y1fNuhyWq+wezYU
         135DGD1jyq9AI9G9iFlx92vbF+Osuz4uMWg1vgeH6EROGOHGeP+cSQ0F0868rdQrrML8
         CBxt/GBos0abrAEsuS5F/AHv7exN4QoRsrbHuqOF2uXhXhpmQJaZN7TC/1m9TS6gcisI
         BOnRz2awErC1feNxG/HIu+OkUAht06YQ/uF3VXqqfPaXSBk1XybkYebirJFpx8gI8ezK
         d0P2ZI1T2gFVDiCeRtFQaEHg3TqNM5XfHGf+y71a1DBd9fjAKGM5sWEwhoD8KT8HLzlj
         AIEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=W+njdGYXMwVUlALGNOEmZlA+AIB17I1tvTOGcXyYBh8=;
        b=pGE7MEaxyXBvnv3Zie3gsT0lWqAXZ3SBC+2Aqi9+t259KK+2kOAQaCvcc/dfKaQ+9a
         ZvbPS4g4W8KNNBjIjKf38y8EpKyU8mKPFu98p23cTILwnCgD4z+ZB/FX6PG++0+sFE3/
         OiXVRsTYb/OTE9nONZLSxZHB5ojcOAkCL3I4iDaCE1yqnqTmAhj3tWAHoWb4TV8FdL+u
         orZ9VvheBFoRr5nuop9LtyDlwplqirvTHmq6038Vo5lQqBalClYIfhjkqQje6/8cZTR1
         86S+65f3PKUvmKUlx+0fExpt9YZs7MJ580l2KmXEKyFXDm9eN01KlsptayPO7M5Fnum6
         bY/w==
X-Gm-Message-State: APjAAAUAoBgKaYDTyJpU35E6IKCZI6gPgy4S/BAY9mMf5RFJFwkTjLDv
	Slxj1Ph8KNcI1r4DprdWRrJkmP9Z
X-Google-Smtp-Source: APXvYqzXU4YGekZflP4unR6sVeEcOT5iZjp1JU2syJ42wVg/T4f3tOjW9MnQGTWXP6aSfqv7DZ+puA==
X-Received: by 2002:adf:efc8:: with SMTP id i8mr9694825wrp.220.1561767031306;
        Fri, 28 Jun 2019 17:10:31 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from [192.168.2.137] (93-34-153-63.ip50.fastwebnet.it. [93.34.153.63])
        by smtp.gmail.com with ESMTPSA id z5sm3470476wmf.48.2019.06.28.17.10.29
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 28 Jun 2019 17:10:30 -0700 (PDT)
Subject: Re: [Qemu-devel] [PATCH v2 07/14] target/arm/cpu64: max cpu:
 Introduce sve<vl-bits> properties
To: Andrew Jones <drjones@redhat.com>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, peter.maydell@linaro.org,
 armbru@redhat.com, eric.auger@redhat.com, imammedo@redhat.com,
 alex.bennee@linaro.org, Dave.Martin@arm.com
References: <20190621163422.6127-1-drjones@redhat.com>
 <20190621163422.6127-8-drjones@redhat.com>
 <be805987-250d-93a7-7d11-5204f0e16e7b@linaro.org>
 <20190628072739.5t2o2yqaejn6pyd5@kamzik.brq.redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <4e7e78a6-1e6f-4190-4b15-12f443d9be78@linaro.org>
Date: Sat, 29 Jun 2019 02:10:28 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190628072739.5t2o2yqaejn6pyd5@kamzik.brq.redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TUID: Sf3jCLHsC1kl

On 6/28/19 9:27 AM, Andrew Jones wrote:
> Also, while it's true we can always
> get the max vq with next-smaller(ARM_MAX_VQ + 1), having it cached in
> cpu->sve_max_vq is convenient. That said, I think we'd rather keep it.

When is it convenient, and for what?

Certainly the only thing that we check after boot is the largest enabled vq not
larger than x.  And for that I don't see that sve_max_vq is relevant at all.

Oh, something that we should also think about is -cpu foo, where foo is one of
the Fujitsu thingumies.  We should be able to default sve_vq_map to that which
a real bit of hw actually supports.  I, for one, welcome our typedef long
overlords.  ;-)


r~
