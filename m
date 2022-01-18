Received: by 2002:a19:ca48:0:0:0:0:0 with SMTP id h8csp2633543lfj;
        Mon, 17 Jan 2022 23:28:02 -0800 (PST)
X-Received: by 2002:a05:600c:1c1c:: with SMTP id j28mr8158902wms.138.1642490882546;
        Mon, 17 Jan 2022 23:28:02 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1642490882; cv=none;
        d=google.com; s=arc-20160816;
        b=MUhvzPOmIglezMYya45r8a72f5jo7SaL2sK8l6QoxiE3R58A02VAOonPyUY7e1o0KL
         FhDoHpcj80ZtcfJgWJHQVdxU+RHFIy4orGVr6aOqSqDRMB1DMgGLNFEQV98xrIo78On5
         oxlALewna/RneS7NrX1DDd+pUWSxPGBgkxTJKgiar+IRGD0XPjO5OK4Upf1lbYTbPSaB
         tmiw5p0lQE4TjF1q/qkX/maY1M5aG6+lGAgIO7ehnoAIl+3bDQoHavwIfGSiO+LSnL06
         +FzU3ChK2mmI3oyr7uhRzg/fUDOvyy4G9yIZqsCKdJg5WrBy3XJkTZjjl5AfuTESyWvj
         zF9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :sender:dkim-signature;
        bh=NgyRMMTOvGQ3pt7/EL+KqgY2x9nGQO8woZhOsts7YiQ=;
        b=lhHSKuG+HST1uCnhVFQnAh+XuiaMJzwne23Bi5uN+JXLrHAHgtU95/VY7HIfjiojts
         /yXgKZ/n0544hNvqVguKP3J1FrtIXApgVl9mKW71TNUHfYRMbZIEZAYHNW7eB0Zvnw1W
         q2nxbnWmGCFSaxbCttIwoD+OIETmJw8VvaAG4j/wutPfNghhraub2eKs3ls/PnvcpLf8
         vbU+d+Yf0bJ7EiIUXp/jPx9kxbJMjmGjamFPdJZV5KtjXNJim1xnLifC2PfoOySF57PQ
         cpRm/+4+33EPEXkZuWWd4z+319wvC4qSP7kI2E1RvWZmhBNgGwKQkZtlnvDtiiTvYBX+
         jeBQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20210112 header.b="icc/iT1W";
       spf=pass (google.com: domain of philippe.mathieu.daude@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=philippe.mathieu.daude@gmail.com;
       dmarc=fail (p=QUARANTINE sp=QUARANTINE dis=QUARANTINE) header.from=amsat.org
Return-Path: <philippe.mathieu.daude@gmail.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id v10sor9594082wrn.71.2022.01.17.23.28.02
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 17 Jan 2022 23:28:02 -0800 (PST)
Received-SPF: pass (google.com: domain of philippe.mathieu.daude@gmail.com designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20210112 header.b="icc/iT1W";
       spf=pass (google.com: domain of philippe.mathieu.daude@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=philippe.mathieu.daude@gmail.com;
       dmarc=fail (p=QUARANTINE sp=QUARANTINE dis=QUARANTINE) header.from=amsat.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=NgyRMMTOvGQ3pt7/EL+KqgY2x9nGQO8woZhOsts7YiQ=;
        b=icc/iT1WgKpiz8DctvwrKbYXhhguVyNACwKaOMgJ/7IjFF+PoESvzQQVPlaBU15gyJ
         CXIvBXrRjh3WM59pkKd8/ztVut4CkCFA16l4AB6Ym7LSQjBMe13vHrond/5HTUnkz1S/
         o/1VlSE+4tXMv+brxXGlvht33rDVVY7EDX1Zy2LNfqj5ImBGtcyJ3mkvZTYHmAX/RX1H
         eyLnx62nDgCZVJfN99qjW6e7oA11ILu16s4rTmImbYE6bLxEz1rl5LaiAfiEs+x/qdf/
         3TNU909ghQwQF1519iaTZ5dD3LkxZLdDMgfnKlNqU3pJw+todIDK25zRaFd/NHKVLofz
         1OzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
         :subject:content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=NgyRMMTOvGQ3pt7/EL+KqgY2x9nGQO8woZhOsts7YiQ=;
        b=YvUPuRvBuzadbI/RACMUkErMJcleV4chxWkQEPkF628/RA4d3jauq4JitT7rgplohi
         AeTKutcUSux8LmKtcnlj8lGt1lr5Bv8Nf5zn5OTJ5gT3aJRy+u4kw1E1yQ265RDjeYx2
         ldS+uRnYtlZoofflc9HK44zMNoJB5DjAJFvvK8RkT8ruDz28ASgly+QM4a3qM/TUmIE3
         mcYbPiz27L7fIc1TgnW/OPyglhr9A8r1Txpy+jzH3xYv+cxjhAi8DgVhCFrOlNgUpABD
         tK3W/Ww2vQBSd2DQkpb2xwvz6vVzHVEp3RrZoap6tSgUykop8A9AcX37Cqxwa5b2Uk1I
         7tqA==
X-Gm-Message-State: AOAM5327aTsPKTYfzFcZ6SnPzP3WZLF0DjMYQjJq32+0tQmjkHRcXc1+
	hN0hJ2JApgjj32YYHabz7RZsPewlhzk=
X-Google-Smtp-Source: ABdhPJynNccjCJzPHntkISwIm+9x/LUGqof6+V2VvaHKH3Ok6uuLWEItOq70E5PV8O4FJtFDemkOPA==
X-Received: by 2002:a05:6000:1a43:: with SMTP id t3mr11512863wry.237.1642490882129;
        Mon, 17 Jan 2022 23:28:02 -0800 (PST)
Return-Path: <philippe.mathieu.daude@gmail.com>
Received: from [192.168.1.40] (154.red-83-50-83.dynamicip.rima-tde.net. [83.50.83.154])
        by smtp.gmail.com with ESMTPSA id f8sm7256299wry.23.2022.01.17.23.28.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Jan 2022 23:28:01 -0800 (PST)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philippe.mathieu.daude@gmail.com>
Message-ID: <0233464f-3ffd-9eb9-feda-f8859c0cfdda@amsat.org>
Date: Tue, 18 Jan 2022 08:28:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [RFC PATCH 6/6] docs/devel: add some clarifying text for aliases
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
References: <20220110175104.2908956-1-alex.bennee@linaro.org>
 <20220110175104.2908956-7-alex.bennee@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
In-Reply-To: <20220110175104.2908956-7-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: Qwy/vkBLyfHX

On 1/10/22 18:51, Alex Bennée wrote:
> We do mention the limitation of single parenthood for
> memory_region_add_subregion but lets also make it clear how aliases
> help solve that conundrum.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>  docs/devel/memory.rst | 14 +++++++++-----
>  1 file changed, 9 insertions(+), 5 deletions(-)

Thanks, queued via memory-api.
