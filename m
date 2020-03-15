Received: by 2002:a19:f015:0:0:0:0:0 with SMTP id p21csp2144546lfc;
        Sun, 15 Mar 2020 13:46:58 -0700 (PDT)
X-Received: by 2002:a63:89c1:: with SMTP id v184mr24863717pgd.333.1584305218432;
        Sun, 15 Mar 2020 13:46:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1584305218; cv=none;
        d=google.com; s=arc-20160816;
        b=bpignlMuC6vkhAqLTI1JHZ4aOTb02dLTn9Mck8lUIG1tWr8kCyoY3BGbrLYTaTJ+/t
         iE6Pbu8cSVTmk1Mzm0vkTRpQ2rzJTNMmKQUd6a4mIo2SOXicUvQ32jLPcs03JAl53/NT
         E+QTiyFZr80BfbsnAntVrSqs8wVuwV+vuwMhsF6+1cmZW6ZG7moDhsCNblRuJ+pRn13u
         dVL2Y37wr1ND4Gqnd9TlzmVR2jM/HL36h7cfmq3DCKCgJiLRkx6GgwmDp1K7zTFBVUhh
         AfjP7IAnFhmrL/fs6wrsNjaEtcBun14sFLuLyCyIyOOF3+/Huew/SSTwUBZumQNVrp0S
         9l6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :dkim-signature;
        bh=6Khs/0XZvB9pqQYMEDwzvpGeETU8JRzc3/6wT/zCEJk=;
        b=GZBZHyPmPKslCBTyZqOSldecq2eTMdXZlwbf3vJy4iXb36c6VkFU8HW/JiIEj+W2ZU
         NSfCWjtcrG7kTv0E55kfIoLmN29Q4LFRn8mreUqFsKF8Xld9oJUErnrcijyIq9hsmGMA
         KlqOxWLJt8HFaXv7my+X1pVNNq6nAy7ck2bwtvWkgyv1/RHU5Ba0etKQykM8cF3NbJGF
         F6ur8w0SvIgcybiwu7QoaXY3JDTvEarhYVpgPz6wDKPdu+QailEVkmoPW1UpPxzkYZbZ
         R7lcHSkw22e2nWgXhTDbS3nby9XrBDV/3PpeZTGHDEvolZOKSCLhRmitx1wOgPPJiZ/X
         Mhww==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=F8LLSDYo;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id h4sor18020348pjb.32.2020.03.15.13.46.58
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Sun, 15 Mar 2020 13:46:58 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=F8LLSDYo;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=6Khs/0XZvB9pqQYMEDwzvpGeETU8JRzc3/6wT/zCEJk=;
        b=F8LLSDYokjrvKwG2NQoQYGcetH+fik9pnmkrqUH61GX0Ecp+Gb5MuTDhYkZ161ebLp
         BPuoefzHvR+F0GAnsWcTsEjXYI9SHQ7bbjqKzOWWvsh+m0jDCjXFAqNdg/6sRvxbc9I7
         IEK8ArLybbuVCbeqwIf1e999QdNRDKkzlXKTxhxMmWJjw3jI15NgFZInTA2mDJl2w2vi
         V24ulgs1pjsnUeB6yvfFuczE4ynR5tufpqj1g3NIi2Mi7/PEhW131Oc8O2s/uOwY2bO1
         roi17YX0kEfLTW3hBWopcWI8Vz5kqfQWEXq/nsD12VXWfzqt8ILK6Rh4OX2rvMGFbLfw
         NP4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=6Khs/0XZvB9pqQYMEDwzvpGeETU8JRzc3/6wT/zCEJk=;
        b=SbcJtRe9t1qF3OAxYOaVUuEImmRFsGu82EEtufUnFA0A8pOEbNNbbMewHXPUNuwCzb
         KdjK+B0gaxGJzIqE2hjZWEs2wVsbWA9fMgNYvWut/I5jEKChKSCtwxBWXN3aVGwaiANe
         d5LmAn1BXbgdpnRM0ovlBQFmmGxfQsyxA030BTvIjaIBWm9cKaEy5qWoS2fn0mxYAMwv
         5kCwo4bwEiCZM5BOi9jtK5pC7HJRqOuM7qeVyxdPZZWmliY/chCfWIsnMXVctnJE1To5
         cXOfmQca74V2XI5KRUk/mEyU3zHmYJst8veATOgtLcoKofCOY4GNS2QmnMCtBoCs/BhJ
         frbQ==
X-Gm-Message-State: ANhLgQ1yRhHkocTlPiuRg8CpvPwjmNuXCkDoy7JjIxWDqai35GoVFwY9
	qXZ1xyAvc3DPnBqHv/crE6Xg/GPQ
X-Google-Smtp-Source: ADFU+vuJfz8Bo0sTahw3ewMurLHkMeVZW8PiA9ut4lbIj02rxUkZbRcyZ1v29XaQvf4kU30AvZePRQ==
X-Received: by 2002:a17:90b:288:: with SMTP id az8mr19863626pjb.25.1584305217951;
        Sun, 15 Mar 2020 13:46:57 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from [192.168.1.11] (97-126-123-70.tukw.qwest.net. [97.126.123.70])
        by smtp.gmail.com with ESMTPSA id b189sm8661705pfa.209.2020.03.15.13.46.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 15 Mar 2020 13:46:57 -0700 (PDT)
Subject: Re: [PATCH 13/14] target/s390x: Restrict CpuClass::get_crash_info()
 to system-mode
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-riscv@nongnu.org,
 Eduardo Habkost <ehabkost@redhat.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 David Hildenbrand <david@redhat.com>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Cornelia Huck <cohuck@redhat.com>, Laurent Vivier <laurent@vivier.eu>,
 qemu-s390x@nongnu.org, qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Richard Henderson <rth@twiddle.net>
References: <20200313183652.10258-1-philmd@redhat.com>
 <20200313183652.10258-14-philmd@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <71ef67f7-3b14-8769-868c-ae339b84e364@linaro.org>
Date: Sun, 15 Mar 2020 13:46:55 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200313183652.10258-14-philmd@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TUID: 3dqqge+sfs/q

On 3/13/20 11:36 AM, Philippe Mathieu-Daudé wrote:
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> ---
>  target/s390x/cpu.c | 12 +++++-------
>  1 file changed, 5 insertions(+), 7 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
