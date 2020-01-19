Received: by 2002:a19:c345:0:0:0:0:0 with SMTP id t66csp1397727lff;
        Sun, 19 Jan 2020 03:20:52 -0800 (PST)
X-Received: by 2002:a5d:6151:: with SMTP id y17mr12849524wrt.110.1579432852665;
        Sun, 19 Jan 2020 03:20:52 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1579432852; cv=none;
        d=google.com; s=arc-20160816;
        b=epszWQ2vfNlV+zKMIXzO5CxwfPuZ2oqK922WWBPX4ygwicd+dLDMs69hL9bGHH9HYt
         BjkN79fLsqdM3ApHha9ycEkjAsyklBq9NqBpnJ86bYZB6KuHOR2eZzxepHAKPL9bqpfK
         +dZdio22TYYvuLK3f+f6ZOuP1I61ZdMLR7AX2PqlVK4Iewa9ay/S9wTxrJuq+D0ayx9y
         4ilirzH6cOJqqqkNdcSBCkpJxjPbo/PIGBDF745SzMHdWAgwY0jPXWw9RIRXOZ4+t+wk
         dfEQ8qjqG93b26MJPICFb6RLF11vjAX8C5moVNpq4Y7zp9RWABjYia4pbT4U+1Pb/nXN
         TYmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:autocrypt:from:references:cc:to:subject
         :sender:dkim-signature;
        bh=z8F/Xiqx2dBHiolY1H5OIrLdryFgwrL0HpyGQNTEs/4=;
        b=hS1QffDOuudGEmgx5ltr3qsIhud/rYS9AILtZTGoEGa/Z7tGpoFU+qlyLLh8nU5OV+
         DQWJLgjpVbaLh2UEapFPJJ8D70jvnqm743u47D2P6xyXbfMdXiNbF8Xp5B3wzfEh786T
         /vpO8YFPiH1AWCO0SYYNEUMetnG6oXHcWM50UHgTG3h1YjdyCsF4SQWVUXGaFhRT21EZ
         iaQDJnYYPOKLmgzIvvVN7NjoKF5wa6E/fpaK/ZefpEGJXkWgDtIWeG2PnCYopo5sV1ga
         9DDhN/TikYt+7o10iOeaZ7vEosbJC5bB7tJGi3YVWIBx1pebxJTpkGbFXzrMOtkozXFa
         HXlg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=KQ+4gWQu;
       spf=pass (google.com: domain of philippe.mathieu.daude@gmail.com designates 209.85.220.65 as permitted sender) smtp.mailfrom=philippe.mathieu.daude@gmail.com;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <philippe.mathieu.daude@gmail.com>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id q16sor13564477wrn.7.2020.01.19.03.20.52
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Sun, 19 Jan 2020 03:20:52 -0800 (PST)
Received-SPF: pass (google.com: domain of philippe.mathieu.daude@gmail.com designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=KQ+4gWQu;
       spf=pass (google.com: domain of philippe.mathieu.daude@gmail.com designates 209.85.220.65 as permitted sender) smtp.mailfrom=philippe.mathieu.daude@gmail.com;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:autocrypt:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=z8F/Xiqx2dBHiolY1H5OIrLdryFgwrL0HpyGQNTEs/4=;
        b=KQ+4gWQurOcCKF+3v+tPhN+ul4aKWOyGMKGRa2clprj2IJQSR5gyjbjEl0BDfO/2iM
         mO9oJdry2c4rdENap+OsV95CpFJW5eUeT/ZMbJ608dQHvTIPPmcUGrzODNrednYr/y3Q
         Iud4uhYfCmv2oBWxGlYnUOaugeL0m+/e9pINscoJ/VXGLRwhlpQTmCHzaUepDi6AydzC
         MFCWh7/wfgC8xvOxOIs9ZfqyvIAHv45u+5jse6ehnTcMC4L+lld+X7Bz8R1cCg7CRogP
         ytm9xn0Bivkx1tV8tQiVrs2zZeRhe3hjuEqg18gNTbzibN3Mq0rmP1anoHqm8EsX0F7p
         QkOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=z8F/Xiqx2dBHiolY1H5OIrLdryFgwrL0HpyGQNTEs/4=;
        b=N6swyTP97NnpiQtWoDxPF+k/af/5pKF+PjOhiyFjmChyAJRByJTV4bXNg7A9NLnD4U
         aSN0Av8sNCCCb5mQom2zpax+RZaxAZFnge5vdTTJB4YSGHZFfXesKmPL8N9XHqutet+l
         87a0qvyHqiwFaUGYH/nlPhHuVrGiXXTS8sU+dsTw6gaN5nguhiqkAeRj7NxjkqaHOMVD
         uXA1o51+x9gIye0v0Xm3sFxDBvVmz/NeebHsBwn0LS9xoWcnco+FNEWwnbRqRNsbIDyk
         8FBhJE1lYRnQC8ceh04f26hTTAXdpnF7Wp5WZ3LHfCvIl4jL4HGVyT2rNX2tqqGXTUZi
         b5mw==
X-Gm-Message-State: APjAAAX4I++ShIFuyKl3/nwDSppSi031u/r2XpZpEFFtjDHxQkwsIh+M
	s4o4pvKPdaXPHvvHN3XfeU8=
X-Google-Smtp-Source: APXvYqxjKZGTfg4sPqeA1ftDdiHCdFlSQ2Eg9jnZBT2jX5ElrUtJdn991iKqW67i7LkKBiOP1PnO2A==
X-Received: by 2002:a5d:6144:: with SMTP id y4mr12867350wrt.15.1579432852346;
        Sun, 19 Jan 2020 03:20:52 -0800 (PST)
Return-Path: <philippe.mathieu.daude@gmail.com>
Received: from [192.168.1.35] (113.red-83-57-172.dynamicip.rima-tde.net. [83.57.172.113])
        by smtp.gmail.com with ESMTPSA id v14sm42410102wrm.28.2020.01.19.03.20.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 19 Jan 2020 03:20:51 -0800 (PST)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philippe.mathieu.daude@gmail.com>
Subject: Re: [PATCH 4/4] .travis.yml: Allow untrusted code and large files
To: Niek Linnenbank <nieklinnenbank@gmail.com>
Cc: QEMU Developers <qemu-devel@nongnu.org>, Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>, Fam Zheng <fam@euphon.net>,
 qemu-arm <qemu-arm@nongnu.org>, =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philmd@redhat.com>, Kamil Rytarowski <kamil@netbsd.org>
References: <20200118191623.32549-1-f4bug@amsat.org>
 <20200118191623.32549-5-f4bug@amsat.org>
 <CAPan3WpLXi+23k7JDidmGRefz-rwxwaJmh-rRXO125zh422zpw@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Autocrypt: addr=f4bug@amsat.org; keydata=
 mQINBDU8rLoBEADb5b5dyglKgWF9uDbIjFXU4gDtcwiga9wJ/wX6xdhBqU8tlQ4BroH7AeRl
 u4zXP0QnBDAG7EetxlQzcfYbPmxFISWjckDBFvDbFsojrZmwF2/LkFSzlvKiN5KLghzzJhLO
 HhjGlF8deEZz/d/G8qzO9mIw8GIBS8uuWh6SIcG/qq7+y+2+aifaj92EdwU79apZepT/U3vN
 YrfcAuo1Ycy7/u0hJ7rlaFUn2Fu5KIgV2O++hHYtCCQfdPBg/+ujTL+U+sCDawCyq+9M5+LJ
 ojCzP9rViLZDd/gS6jX8T48hhidtbtsFRj/e9QpdZgDZfowRMVsRx+TB9yzjFdMO0YaYybXp
 dg/wCUepX5xmDBrle6cZ8VEe00+UQCAU1TY5Hs7QFfBbjgR3k9pgJzVXNUKcJ9DYQP0OBH9P
 ZbZvM0Ut2Bk6bLBO5iCVDOco0alrPkX7iJul2QWBy3Iy9j02GnA5jZ1Xtjr9kpCqQT+sRXso
 Vpm5TPGWaWljIeLWy/qL8drX1eyJzwTB3A36Ck4r3YmjMjfmvltSZB1uAdo1elHTlFEULpU/
 HiwvvqXQ9koB15U154VCuguvx/Qnboz8GFb9Uw8VyawzVxYVNME7xw7CQF8FYxzj6eI7rBf2
 Dj/II6wxWPgDEy3oUzuNOxTB7sT3b/Ym76yOJzWX5BylXQIJ5wARAQABtDFQaGlsaXBwZSBN
 YXRoaWV1LURhdWTDqSAoRjRCVUcpIDxmNGJ1Z0BhbXNhdC5vcmc+iQJVBBMBCAA/AhsPBgsJ
 CAcDAgYVCAIJCgsEFgIDAQIeAQIXgBYhBPqr514SkXIh3P1rsuPjLCzercDeBQJd660aBQks
 klzgAAoJEOPjLCzercDe2iMP+gMG2dUf+qHz2uG8nTBGMjgK0aEJrKVPodFA+iedQ5Kp3BMo
 jrTg3/DG1HMYdcvQu/NFLYwamUfUasyor1k+3dB23hY09O4xOsYJBWdilkBGsJTKErUmkUO2
 3J/kawosvYtJJSHUpw3N6mwz/iWnjkT8BPp7fFXSujV63aZWZINueTbK7Y8skFHI0zpype9s
 loU8xc4JBrieGccy3n4E/kogGrTG5jcMTNHZ106DsQkhFnjhWETp6g9xOKrzZQbETeRBOe4P
 sRsY9YSG2Sj+ZqmZePvO8LyzGRjYU7T6Z80S1xV0lH6KTMvq7vvz5rd92f3pL4YrXq+e//HZ
 JsiLen8LH/FRhTsWRgBtNYkOsd5F9NvfJtSM0qbX32cSXMAStDVnS4U+H2vCVCWnfNug2TdY
 7v4NtdpaCi4CBBa3ZtqYVOU05IoLnlx0miKTBMqmI05kpgX98pi2QUPJBYi/+yNu3fjjcuS9
 K5WmpNFTNi6yiBbNjJA5E2qUKbIT/RwQFQvhrxBUcRCuK4x/5uOZrysjFvhtR8YGm08h+8vS
 n0JCnJD5aBhiVdkohEFAz7e5YNrAg6kOA5IVRHB44lTBOatLqz7ntwdGD0rteKuHaUuXpTYy
 CRqCVAKqFJtxhvJvaX0vLS1Z2dwtDwhjfIdgPiKEGOgCNGH7R8l+aaM4OPOd
Message-ID: <13c731e7-fb67-3c10-65b7-de84aea007ab@amsat.org>
Date: Sun, 19 Jan 2020 12:20:48 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <CAPan3WpLXi+23k7JDidmGRefz-rwxwaJmh-rRXO125zh422zpw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TUID: mOHczlL0ItRf

On 1/19/20 1:28 AM, Niek Linnenbank wrote:
> Hi Philippe,
> 
> For some reason, I can't apply this patch with git am:
> 
> Applying: .travis.yml: Allow untrusted code and large files
> error: patch failed: .travis.yml:260
> error: .travis.yml: patch does not apply
> Patch failed at 0001 .travis.yml: Allow untrusted code and large files
> Use 'git am --show-current-patch' to see the failed patch
> 
> I didn't change the .travis.yml file. I'm using latest master from
> commit 7fb38daf256bd1bcbcb5ea556422283d0d55a1b1

I described on the series cover but forgot to remember it here too,
this is because this series is based on your v3:

 Based-on: <20200108200020.4745-1-nieklinnenbank@gmail.com>
 "Add Allwinner H3 SoC and Orange Pi PC Machine" v3
 https://www.mail-archive.com/qemu-devel@nongnu.org/msg669328.html

I'll respin a v2 of this single patch, don't worry.

Regards,

Phil.

> Regards,
> Niek
> 
> On Sat, Jan 18, 2020 at 8:16 PM Philippe Mathieu-Daudé <f4bug@amsat.org
> <mailto:f4bug@amsat.org>> wrote:
> 
>     As Travis CI runs our tests in a disposable environment, we don't
>     care much if the binaries are trusted. The more we test the better.
> 
>     Also, as of this commmit, the smallest available announced [1] is
>     "approx 18GB", plenty of space to run our acceptance tests.
> 
>     Enable the proper environment variables to allow Avocado download
>     from untrusted sources, and to download large files.
> 
>     Note: As of this commit, all our tests "Ran for 17 min 7 sec"
>     before succeeding, see [2].
> 
>     [1]
>     https://docs.travis-ci.com/user/reference/overview/#virtualisation-environment-vs-operating-system
>     [2] https://travis-ci.org/philmd/qemu/jobs/638823612#L3817
> 
>     Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org
>     <mailto:f4bug@amsat.org>>
>     ---
>      .travis.yml | 2 ++
>      1 file changed, 2 insertions(+)
> 
>     diff --git a/.travis.yml b/.travis.yml
>     index 638fba4799..b8b9df65a6 100644
>     --- a/.travis.yml
>     +++ b/.travis.yml
>     @@ -260,6 +260,8 @@ matrix:
> 
>          # Acceptance (Functional) tests
>          - env:
>     +        - AVOCADO_ALLOW_LARGE_STORAGE="yes"
>     +        - AVOCADO_ALLOW_UNTRUSTED_CODE="sure"
>              - CONFIG="--python=/usr/bin/python3
>     --target-list=x86_64-softmmu,mips-softmmu,mips64el-softmmu,aarch64-softmmu,arm-softmmu,s390x-softmmu,alpha-softmmu,ppc-softmmu,ppc64-softmmu,m68k-softmmu,sparc-softmmu"
>              - TEST_CMD="make check-acceptance"
>            after_failure:
>     -- 
>     2.21.1
> 
> 
> 
> -- 
> Niek Linnenbank
> 
