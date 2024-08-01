Received: by 2002:a17:505:3f8c:b0:1be9:327d:8ee3 with SMTP id bm12csp910019njb;
        Thu, 1 Aug 2024 05:59:42 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUYe7RaStCFIyZVRiBvPTupdg1bwFvLsmlrpJV49tU5ghidYA6/BwGGjQqrFQKDA/P8wvpTDTOvu44GNa+OI2nUONG//5jR
X-Received: by 2002:a05:6000:1884:b0:367:8e52:3bb9 with SMTP id ffacd0b85a97d-36bb35bd92emr1499280f8f.22.1722517182324;
        Thu, 01 Aug 2024 05:59:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1722517182; cv=none;
        d=google.com; s=arc-20160816;
        b=UvHvc9dTkyWC7J51SXRgQJPq5gPPylbJfyYDL1RaI5hAuvdpRzF+JIOB7jM4r96Whn
         knIq+WZlPgs6fV3cOckuFZ9U0zwnFTh12TnoExHqgxA8DaxCjAAJGNhvy/FdwDEGwfFV
         oYk5Q4kRX4uqJOIEIoea9ms+3kuPKOZ3p8ZG8hlBE9I4ypoDgFd6jxDaSmArkYFdqT/a
         jRGlWkvCBioN0+j27lZHopUYcEUvWinG59kgyaGsoBJXmBpaqjOIYQ0W8tJndEQBe0hK
         Q+/DJZtxjxbv1A3ItJe8ugpWLS+XC5TrfTHTxdD3Yjgk62sjLjYojrXm+rhZjQE2fWqD
         GDeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=reWrZU/QJhlSWLyInbA0OjyEvus8Fj5OWJF3KGaYwP4=;
        fh=b8euCnWo18ZL7wvQLGdWlrvHjOteObErmvn3tNh+aRM=;
        b=e9UMycSWdW4PCfqMVKSkzfgS1aUVewl2EibGHsg4iBsG/ZO+0N55YphJCeQKrpb3Pw
         00UOWDSmZEzyskpl/Ke3KOgSTOyQaCCfk+XoVM/Nj4Mry3PSWfUCJrWDHzdOOfsG6Z3n
         gYnL6Mtg7V+SBSXSmRGf+8ufjslq0oY6+AU0t2RXqY9l8jSp7dYmxAOuHBKqu49dfMGG
         Zu+Ik92JBQtwpcWfa8OwPTgIqFQaTwyM9IcLZN0/DjHZeQ/DmbchlgnM6XVZFrPVjfAx
         H3NvsRuWllLQBfw1k2abKHA2dPI17Ng9DkeYtUbhdUjYinOYKfBl+QeR27jk0x1l4sEQ
         Jd3Q==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=zNoNcmn2;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id ffacd0b85a97d-36ba094a4e0sor748596f8f.2.2024.08.01.05.59.42
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 01 Aug 2024 05:59:42 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=zNoNcmn2;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1722517182; x=1723121982; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=reWrZU/QJhlSWLyInbA0OjyEvus8Fj5OWJF3KGaYwP4=;
        b=zNoNcmn2r1Q3rfU5gqZQaeRhvFS55RK9d5CiNDgoO/b+Oacwg689YEozWha8v5Cie6
         8quU1/RmUkFEbTzUdZkSbcOGESKAG3BM7sNfNd40YtnRZ4riE7gvaE0oRB64QWBjLNEZ
         dT9Hrmu3I7ZS07g/506A3zcoSObhpvfxlZUh97BYLesPy4DqTOM7UJtABlfEhfwQohiI
         qSlJ9Srgg1SN82Swdi98PMEPlZZn5FQGy9+ePMIM+eMNN72Gk1+ukAF6quCHDwRXRxUg
         fK21LEB0N8RMPsWqtRLsoD89gw4LNUcs1qS5f4MdSVz0hzY+Nl4Q5ssfobnx0HdN76IY
         FnWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722517182; x=1723121982;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=reWrZU/QJhlSWLyInbA0OjyEvus8Fj5OWJF3KGaYwP4=;
        b=pOWq47HB716I7ilE2R41rDdBmxUsK1oA32V43AWuVB72KMwE8DoOFRan1LFcpmN2KS
         JFT2Ra9N3g35Y9PRp/Ar2GTpsWHzkOvCqIoe6FwXUKEHt/7oB0JgV4ny69gtTHZ46XxB
         LAR/GGQ65lQ/g17yh8P+/CHenDJPn6t9od1FO3bwtLS8IRcx/hQ/GGm75fTcQoVNJYMS
         CTG6qxzBmbZJe7uJQrK8l/MRXWv0UGgjJRUKK7qFYeP5gN9cN2NpHKEcRs629KgesPqu
         /A4NI+03YVCGbpNvRp1xD/YxjyCBt8O9pwAm8P6wDrgrZq3W3cn7dFzUQ9lB1Wtl4M9r
         zqlA==
X-Forwarded-Encrypted: i=1; AJvYcCXcza/OaFWNT7jzFP6WIMcADDiVoyEASNbg0/MgzfZzuCUpXzv4Du29/tmwrAQzW9olQyW/1U68SyqMR1BgwJRWUH/GS817
X-Gm-Message-State: AOJu0YziqVBGGOWmTbQQqpXU9NNYSKGqSCCIWD32N8sThKTTZYRIdslk
	u8dTHZn6P9BAiCjIV1bxshzPGIX052uHMfXBYg68buDkP3iTbP7eA/pOgca84BZO6g==
X-Google-Smtp-Source: AGHT+IEnKobr50cUvKpNW3LP+tEde2Lwq8dMN/vsZsHAj9TorGHmI2pf873uTdTxjhnLjEz93nmnWA==
X-Received: by 2002:a05:6000:1b0b:b0:367:940b:b662 with SMTP id ffacd0b85a97d-36bb35d6147mr1226150f8f.31.1722517181543;
        Thu, 01 Aug 2024 05:59:41 -0700 (PDT)
Return-Path: <philmd@linaro.org>
Received: from [192.168.69.100] ([176.176.130.148])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-36b36857d66sm19329382f8f.83.2024.08.01.05.59.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 01 Aug 2024 05:59:40 -0700 (PDT)
Message-ID: <68710de3-02da-4fa3-936c-62c85197893c@linaro.org>
Date: Thu, 1 Aug 2024 14:59:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 10/13] tests/avocado/tuxrun_baselines.py: use Avocado's
 zstd support
To: Cleber Rosa <crosa@redhat.com>
Cc: qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Thomas Huth <thuth@redhat.com>, Beraldo Leal <bleal@redhat.com>,
 Sriram Yagnaraman <sriram.yagnaraman@ericsson.com>,
 David Woodhouse <dwmw2@infradead.org>,
 Leif Lindholm <quic_llindhol@quicinc.com>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, kvm@vger.kernel.org,
 =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>, qemu-arm@nongnu.org,
 Radoslaw Biernacki <rad@semihalf.com>, Paul Durrant <paul@xen.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Akihiko Odaki <akihiko.odaki@daynix.com>
References: <20240726134438.14720-1-crosa@redhat.com>
 <20240726134438.14720-11-crosa@redhat.com>
 <a7f2d78a-4de6-4bc6-9d54-ee646a9001fe@linaro.org>
 <CA+bd_6L7o05mENKVuLLfMFK9OF6ckU23ue0xmxiWO5oiT4ZEbw@mail.gmail.com>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <CA+bd_6L7o05mENKVuLLfMFK9OF6ckU23ue0xmxiWO5oiT4ZEbw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: pUZD01ab8y+G

On 1/8/24 05:39, Cleber Rosa wrote:
> On Mon, Jul 29, 2024 at 10:39 AM Philippe Mathieu-Daudé
> <philmd@linaro.org> wrote:
>>
>> On 26/7/24 15:44, Cleber Rosa wrote:
>>> Signed-off-by: Cleber Rosa <crosa@redhat.com>
>>> ---
>>>    tests/avocado/tuxrun_baselines.py | 16 ++++++----------
>>>    1 file changed, 6 insertions(+), 10 deletions(-)
>>>
>>> diff --git a/tests/avocado/tuxrun_baselines.py b/tests/avocado/tuxrun_baselines.py
>>> index 736e4aa289..bd02e88ed6 100644
>>> --- a/tests/avocado/tuxrun_baselines.py
>>> +++ b/tests/avocado/tuxrun_baselines.py
>>> @@ -17,6 +17,7 @@
>>>    from avocado_qemu import QemuSystemTest
>>>    from avocado_qemu import exec_command, exec_command_and_wait_for_pattern
>>>    from avocado_qemu import wait_for_console_pattern
>>> +from avocado.utils import archive
>>>    from avocado.utils import process
>>>    from avocado.utils.path import find_command
>>>
>>> @@ -40,17 +41,12 @@ def get_tag(self, tagname, default=None):
>>>
>>>            return default
>>>
>>> +    @skipUnless(archive._probe_zstd_cmd(),
>>
>> _probe_zstd_cmd() isn't public AFAICT, but more importantly
>> this doesn't work because this method has been added in v101.0.
>>
> 
> While it's not the best practice to use private functions, I just
> couldn't accept rewriting that for the skip condition.  I can make
> sure future  versions (including 103.1) make it public.
> 
> Also, these patches count on the bump to 103.0 indeed.

Then either mention it in the commit description to avoid wasting
time to developers cherry-picking / testing this single patch, or
move it after the version bump, avoiding bisectability issues.

Thanks,

Phil.
