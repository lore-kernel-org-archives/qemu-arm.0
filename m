Received: by 2002:a17:906:5ac8:b0:98d:b2f5:1316 with SMTP id x8csp324498ejs;
        Wed, 16 Aug 2023 05:41:00 -0700 (PDT)
X-Received: by 2002:a17:907:7639:b0:992:d013:1132 with SMTP id jy25-20020a170907763900b00992d0131132mr1268414ejc.1.1692189660615;
        Wed, 16 Aug 2023 05:41:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1692189660; cv=none;
        d=google.com; s=arc-20160816;
        b=XqKOZ1j6Bw0syVsnX6rtd9a3mARcqdthhZodNy+icNgZe+jw5tcgKUwrhU2k0lDi14
         IoJgME6ugTJk5XMnlPn2D5bmsw5I4/f1ITOBrqGdAvqzdIIuntyuGh82attTTa2cy/Df
         8j6NlcYzG4Ypbnn4HW5jdqIPycANyGIhw/GKZkRHcB6zJl4bavCUR7tH29HmgMjtA0eq
         lxg6RuPvcs5LaOTZLa+rWppkxDUp2vNV2vg5BsINN90C8ZwQVtOnztNGlMTaFFqAEHz0
         OsYRbXuKuYtzVSIzIMEmAVrvjjevJP4+VEtG5ftBfTeBtdYb5LL7KwE8ErPuNCjZfzIU
         HW0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=9kvBi5fEowBW2HuI8nVdpqcb808Pu4Oq74FuMs/OXCQ=;
        fh=/5+kKKbcGfziZJ5ep9dAf54H7ML1KkZqHsQr4EVTdYo=;
        b=r/AWtRzgC130QF3lYBMyfu0YA1X7FES3OAsKIEx2pidiNKianmqRQkOuEVeHVnr4Is
         WgU5jAEidqVaqLfdoWzF3c7eTPwgz9epyITQ0kEpx3d7WWh+GWG7NHzfSH80TK5p2BVp
         /eax/W041cWVtogiLHTMSSGQvZruzPcKFC04QQZnE/5C7giORUWbs8LRaQlTvPBs14P/
         jq2pq9mCljO0kC8g5+bwRFODSSSoU8XXoDcyA2+PhHLxmrU3dsOX72E4zVIemFCtiAPv
         LJ+BR0mwrd6t4v1Ua6wfEgy1tun0lUqwW9YoEhBQ7j3U9gf5pf7KEunKi6VccUKRPtbR
         toVg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=wT+aUo3u;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id gz13-20020a170907a04d00b0099d9ab82786sor2833962ejc.7.2023.08.16.05.41.00
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 16 Aug 2023 05:41:00 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=wT+aUo3u;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1692189660; x=1692794460;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9kvBi5fEowBW2HuI8nVdpqcb808Pu4Oq74FuMs/OXCQ=;
        b=wT+aUo3uKV3xUq9VHKGNTaXL+PtgBDvy1D1XBgW73XMjEw1MHCg+Svl18H4HyiMLvR
         6iDVoTBs51D47f1WdA9uac2pEIajBriBW7D9WeMIIpKhhMvkfM8nVV1KGzKd+KUrQQkF
         75gSF16xTMTQxLPqbrZj14e8VJXmyO8UW8wlhKa4kvat5C6DKnQejU++Hym6PSzmw2+T
         +uR9Gtc7FPlP7sKvltO61QgPll12jEtXUDkCwKhU2Hv3vLHuv1L90KxBQNSwLqnJSWgI
         BwDMFCSdxs01TTdg/+s0gjz/12/dJvVNb9NFIZyI58XA2LN10cg7OaX5fJJTSdCRQQA/
         PZEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692189660; x=1692794460;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9kvBi5fEowBW2HuI8nVdpqcb808Pu4Oq74FuMs/OXCQ=;
        b=ZJt4PZAk9xZY5D54u1unAHcxKNga9m0+x6P+K8u4lY5Ynfp14q60ujFg9KAI8Yc+e6
         g/3J6craIBtZX4F2f7MXjXvDb4VZFAYdBtQypDH46YzXtvHgOTT8HyIXYQFQ4WuoJY7g
         bYgtr7ELdR66CwqnTDoX0QpkPbY6XuWD04w927ACDAYjWh/6M1gpkPSFH+QWPTeIVbe4
         fIfaeDzwJBQL5SI7GTM22jGKQdCAerPVIA6OVW8vtxqjj/3MBHBD4hqh3F7HPKe3Rxr/
         S7lO7Ci9Rpkbep0259EsUmU5q1vA2m8O/J7pK7N00NCPtbX5IMcEfV5GZCQJzStNwVjN
         luoA==
X-Gm-Message-State: AOJu0YxWEXYvycZj36P5KHtYkE5NOco8wnw54We4sFtVk9rV+IzXFx1A
	QbF/PQPXk8GwU5O1FngSsSizrsWlz35avTakTzQs1A==
X-Google-Smtp-Source: AGHT+IF+q5ksjLYe3HwZFjs5c///uexOhrNVNWZL0+DFCchXpnitME//rOV76fnJJDDloZ5INzO9vQ==
X-Received: by 2002:a17:906:20d7:b0:99c:613c:9027 with SMTP id c23-20020a17090620d700b0099c613c9027mr1484668ejc.21.1692189660038;
        Wed, 16 Aug 2023 05:41:00 -0700 (PDT)
Return-Path: <philmd@linaro.org>
Received: from [192.168.1.102] (mna75-h02-176-184-40-35.dsl.sta.abo.bbox.fr. [176.184.40.35])
        by smtp.gmail.com with ESMTPSA id gg15-20020a170906e28f00b00982b204678fsm8436608ejb.207.2023.08.16.05.40.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Aug 2023 05:40:59 -0700 (PDT)
Message-ID: <3c3ddf27-00e4-465e-fb2b-a06e0f370188@linaro.org>
Date: Wed, 16 Aug 2023 14:40:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.14.0
Subject: Re: [PATCH 5/9] tests/tcg: clean-up gdb confirm/pagination settings
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: Beraldo Leal <bleal@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Akihiko Odaki <akihiko.odaki@daynix.com>, Thomas Huth <thuth@redhat.com>,
 David Hildenbrand <david@redhat.com>, Yonggang Luo <luoyonggang@gmail.com>,
 qemu-arm@nongnu.org, Daniel Henrique Barboza <danielhb413@gmail.com>,
 David Gibson <david@gibson.dropbear.id.au>, Greg Kurz <groug@kaod.org>,
 =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-s390x@nongnu.org,
 Ilya Leoshkevich <iii@linux.ibm.com>, qemu-ppc@nongnu.org,
 Nicholas Piggin <npiggin@gmail.com>
References: <20230815145126.3444183-1-alex.bennee@linaro.org>
 <20230815145126.3444183-6-alex.bennee@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230815145126.3444183-6-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: FlW0oPR3q87h

On 15/8/23 16:51, Alex Bennée wrote:
> We can do this all in the run-test.py script so remove the extraneous
> bits from the individual tests which got copied from the original
> non-CI gdb tests.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>   tests/guest-debug/run-test.py                         | 2 ++
>   tests/tcg/aarch64/gdbstub/test-sve-ioctl.py           | 3 ---
>   tests/tcg/aarch64/gdbstub/test-sve.py                 | 3 ---
>   tests/tcg/multiarch/gdbstub/memory.py                 | 3 ---
>   tests/tcg/multiarch/gdbstub/sha1.py                   | 4 ----
>   tests/tcg/multiarch/gdbstub/test-proc-mappings.py     | 4 ----
>   tests/tcg/multiarch/gdbstub/test-qxfer-auxv-read.py   | 4 ----
>   tests/tcg/multiarch/gdbstub/test-thread-breakpoint.py | 4 ----
>   tests/tcg/s390x/gdbstub/test-signals-s390x.py         | 4 ----
>   tests/tcg/s390x/gdbstub/test-svc.py                   | 4 ----
>   10 files changed, 2 insertions(+), 33 deletions(-)

No change since previous version ([*]), so:

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

[*] 
https://lore.kernel.org/qemu-devel/20230810153640.1879717-6-alex.bennee@linaro.org/
