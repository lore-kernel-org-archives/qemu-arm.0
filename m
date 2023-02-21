Received: by 2002:a17:906:da85:b0:8b1:202f:4753 with SMTP id xh5csp3126986ejb;
        Tue, 21 Feb 2023 02:36:58 -0800 (PST)
X-Received: by 2002:adf:ea8c:0:b0:2c5:4d57:e840 with SMTP id s12-20020adfea8c000000b002c54d57e840mr2502421wrm.71.1676975818257;
        Tue, 21 Feb 2023 02:36:58 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1676975818; cv=none;
        d=google.com; s=arc-20160816;
        b=d2K7c+8DJpPG2Ug8pdMUiPYGGqyTsnUSVZ4aF2bDRZUvmlZmyRipwLugwojjFmocBj
         Cc3FuQwSBvBVhfTN2zTGYRDOvOHpqk80wWqSgow2oAjo11HWmnaQFSME0tSwoT381kav
         XmMedzfu+FxTTV/SWpgfgB7/iW+vELhZp8gmGvLKS/f5TLw87RZdq8KMSTo8jrJPjNuc
         F+08+DBDAXDOQ8hH6O9sSMyuEf2zGAIj7vztU2f71EXjgs8cPVndbQ5eH71vnkrlCvUV
         IJIXHuWaN76PvofO3WKFK3wKTWxqGuHaA7daslzxNYDl/GPC1xRHwiqMz1XMUtY+fc3q
         z6Gg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=dgSv7ZuWk/DxEc28BEwMqUn8a6ouFhzMgY0nXBMnv3c=;
        b=Vm79eK3aOZqhNHxXY7cfFHQxogzYpDWnOtueo/fNwnSuHZFCe/opvnuUb7+Na+bpFn
         /IkoHOB4w4hYvq5OETRut8av5CQi4KtuD6MIcqnhGfqhtaVELhbtN78ziRR9Hij0w/Hg
         lwkjNZ/otmQ0LbJ36QuOInH1VEUcfhppXipIp3xCujcsicc264EbSZo9n7/jMc5+sH0C
         vzp3J17dYkqbGtDqknLPNNvWo5FZOChrha/DnFreSouNdsLV0/4+3QPbchuqqqYb5EdX
         9O9RiW3a64KRPJtNgNrQNZu5LW591uRVG02FO4OCh0mylPNphrqkau/4EO+qcg0Y5vfh
         BUxg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=gSD3+QJ6;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id m4-20020a5d4a04000000b002be518094a0sor1039310wrq.58.2023.02.21.02.36.58
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 21 Feb 2023 02:36:58 -0800 (PST)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=gSD3+QJ6;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=dgSv7ZuWk/DxEc28BEwMqUn8a6ouFhzMgY0nXBMnv3c=;
        b=gSD3+QJ6f2d5ZTFGNgKygthUJkM2/5za1YQvOA8fadW/QeOwF8NyauQlmH9vVQsY0P
         KPZbhFgvi60PRJK/MUgvy0ycHwmHcoeehAlmpqC2mWzazc2iTuuVUiEEeTS4toNvuHtQ
         swNM/coAl+b0HCUSMJQzBMoHRBIY0cJnQ12XdLDqaD424HQJrGJmB44X0PINcd5sbrMK
         fIazIpqpWcYaQxYaL8jBAJMkhySzhk1BlrZHWoDfjusH3tvXqHa962uTAcPsyN6lFuKa
         QJv22QJtNFpYRY+na87qcFcSfwn39sTycN6qHOrK7iIj4pgqYHhUmsotXw3HDKWA7W4i
         YaCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dgSv7ZuWk/DxEc28BEwMqUn8a6ouFhzMgY0nXBMnv3c=;
        b=OcWz5mej9nXl8euWfrwkk2BzI/pCTa2s+AHsZuZczkGoSlMMomfXn2muBNJtykraav
         kltIrwT/Wa2bUwdNgLDKVJvlbfDRrfTF62vtHVJbsA0q9BPxqmL0beKBq00fiLCNzenb
         Dui/W4PEzF8JiXlFyNFdh0Rz7j6jfncmZ0I6lOMESlT30vN2YkGKZX4TRWocua+PPVQb
         y7knTuwRTsgsLPUKlGO9bXHIaqiY7AZC0yz43gErtDEttdUPHxjs0Tfiyy1IWaxMhPKN
         9yYmKLRKB5EGEVKX1NYeEUpUbV8UyfFcvvASe7DI2lgCjlL1JKLqXzOFpbw9Ua9r0w5V
         BHug==
X-Gm-Message-State: AO0yUKUryAq0XrPAaQGQCwj4kQtC23tWuWGg//UBAbq8X8W4aBFhqUC9
	+ohqKVjp2qJBYO+tWMoUrKjQXDTUEqrXJHKIhSQ=
X-Google-Smtp-Source: AK7set9YmpKN15cEB+oZRwiUb+eoHt3T2WuNiHGayxO+4abA4GLG/6GxsNiUVviAJgV0KlInd9vOPA==
X-Received: by 2002:a5d:55c3:0:b0:2c5:55c6:28f1 with SMTP id i3-20020a5d55c3000000b002c555c628f1mr2792351wrw.19.1676975817711;
        Tue, 21 Feb 2023 02:36:57 -0800 (PST)
Return-Path: <philmd@linaro.org>
Received: from [192.168.30.216] ([81.0.6.76])
        by smtp.gmail.com with ESMTPSA id v15-20020a5d678f000000b002c6e84cadcbsm2331840wru.72.2023.02.21.02.36.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Feb 2023 02:36:57 -0800 (PST)
Message-ID: <07192b8a-c6e3-6dcb-ada3-35842f800068@linaro.org>
Date: Tue, 21 Feb 2023 11:36:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.8.0
Subject: Re: [PATCH v2 04/14] tests: be a bit more strict cleaning up fifos
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: Markus Armbruster <armbru@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Yonggang Luo <luoyonggang@gmail.com>, Li-Wen Hsu <lwhsu@freebsd.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Ed Maste <emaste@freebsd.org>, Bandan Das <bsd@redhat.com>,
 Cleber Rosa <crosa@redhat.com>, Qiuhao Li <Qiuhao.Li@outlook.com>,
 qemu-block@nongnu.org, Beraldo Leal <bleal@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>, qemu-arm@nongnu.org,
 Michael Roth <michael.roth@amd.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>, Alexander Bulekov
 <alxndr@bu.edu>, Darren Kenny <darren.kenny@oracle.com>,
 Aurelien Jarno <aurelien@aurel32.net>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 John Snow <jsnow@redhat.com>, =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?=
 <berrange@redhat.com>
References: <20230221094558.2864616-1-alex.bennee@linaro.org>
 <20230221094558.2864616-5-alex.bennee@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230221094558.2864616-5-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: ljQOeXZFNSW7

On 21/2/23 10:45, Alex Bennée wrote:
> When we re-factored we dropped the unlink() step which turns out to be
> required for rmdir to do its thing. If we had been checking the return
> value we would have noticed so lets do that with this fix.
> 
> Fixes: 68406d1085 (tests/unit: cleanups for test-io-channel-command)
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> Suggested-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>   tests/unit/test-io-channel-command.c | 6 +++++-
>   1 file changed, 5 insertions(+), 1 deletion(-)

Per v1
https://lore.kernel.org/qemu-devel/20230215192530.299263-5-alex.bennee@linaro.org/

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Thomas Huth <thuth@redhat.com>
