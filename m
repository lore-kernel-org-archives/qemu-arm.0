Received: by 2002:ac2:4c26:0:0:0:0:0 with SMTP id u6csp914412lfq;
        Tue, 8 Sep 2020 13:21:27 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzvJOjxGdSkJaicZdKWK02JmW0Vm7078Vr1KczJL+AEyiv0kk51elk3EMbf4zubOeGN52FU
X-Received: by 2002:a05:6402:78b:: with SMTP id d11mr806990edy.341.1599596487724;
        Tue, 08 Sep 2020 13:21:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1599596487; cv=none;
        d=google.com; s=arc-20160816;
        b=chDnA/uAFVIxiddHVTBXJTJy3Ry/HihL3ppp00MH2iidd3k3Ad+HpPb3NCrhFX3p82
         uhZQANXTUXZ6mXDoaTxKj2bEfjZkVukpy7+sLOP6duzH+ddcT8yUipo+18GYutLnj2uU
         Vhfdxrapj4mpclogGhtjkpXzSfV3u6RdaVng4jdg40ZiQzdjHXKvRgNyBw5ZpIwOdSQk
         8yPl33TTQLqsbywNWbhm0B+AgR0eOFB/H5oq1Rr4+nu+4wcGRrzeyEGI3Ldg5GRo3sO7
         SU6D+6SZYXmISBGB9XUYhySRiWQWL+e/7KgSrElg54MMrTNcUVEaMTnzi0pn+vzZPmZu
         G1BA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-language:content-transfer-encoding:in-reply-to:mime-version
         :user-agent:date:message-id:autocrypt:from:references:cc:to:subject
         :dkim-signature;
        bh=fFxASpuTWlbPCKH4Wz3K+JpJTmD5oLonMUjycGG2aXE=;
        b=gwUJfasRLN4BiBUdNoOqWwDVI5TuefPBgNkvHKBe7KN8zxzTRYH3KqG/Etb3LBCHef
         P9f2+ZFxaOBv2dnUVX1/FFiyk8eOjk6zIYpfY45/f46v5KVfPCv3mDr15v5GKSCUf8QT
         tQjp4iM4X5FdN/T4aqC6KL4jwC6pbfn3+5nVP7AsjhOax4dZ1Ctc4xdr7fhkFaRRXXVC
         8RYL6MOC6Z7BytgYeCBH3Nt0HaUoczTcy6LuMNN4UqD10BfB/fMMU0Llf5YLcyAIhOc1
         0+h5C1gK93rdA9nIyUz2lfBuzYlEiOR5l3kQzZKhPqCcV4RGX8Z+jUekfMPLzLnNTO6U
         57ag==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=UYRqyrwu;
       spf=pass (google.com: domain of philmd@redhat.com designates 216.205.24.124 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <philmd@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [216.205.24.124])
        by mx.google.com with ESMTPS id ck10si84474ejb.167.2020.09.08.13.21.27
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 08 Sep 2020 13:21:27 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@redhat.com designates 216.205.24.124 as permitted sender) client-ip=216.205.24.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=UYRqyrwu;
       spf=pass (google.com: domain of philmd@redhat.com designates 216.205.24.124 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1599596486;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=fFxASpuTWlbPCKH4Wz3K+JpJTmD5oLonMUjycGG2aXE=;
	b=UYRqyrwuAMJfF1NDCzyMeOMtMBukC4ARgb6pffqq+2RMwwscD+ichH7TOabaywk+MFyAAj
	GzfdJqOLmU6JmjmKWOl0HZyKuTxiUgGjSWhmVkf3oCLvpeyq+7qrGVlCEpYZCt5tEpIQva
	jZVwkBewTYuyWC6uNDVNaXcErm6cWdA=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-251-HXywtoPkPsCuHIAz-kJMlA-1; Tue, 08 Sep 2020 16:21:25 -0400
X-MC-Unique: HXywtoPkPsCuHIAz-kJMlA-1
Received: by mail-wr1-f72.google.com with SMTP id 33so45692wrk.12
        for <alex.bennee@linaro.org>; Tue, 08 Sep 2020 13:21:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=fFxASpuTWlbPCKH4Wz3K+JpJTmD5oLonMUjycGG2aXE=;
        b=O1zHRpPrrS8OZGdNVdIRA09Gf6aQT6rsf5oooLiyvPE/Es/SPf10vbgkiHfXevqkeI
         8Q/kVfpRADGbxCvuMJ/T+Dn4+n8+hWXgwn9ZEnbUIxMaQkSxSIT48diwPnKwg17yAdFo
         qB0Tw7WxGBvbN3zJcSaPHeIL5U9ZORAHo6EnO9T/xKUOBSag/4CF56VtqkW4IQBKpnSc
         MUxsOFIkn4V4GDeYYqMFzSmXi06bKSNANdkxx4HYBrDsZ6q/bZMNO/LVVRA4dB47mEm+
         HKdiICURBvUDlaCrhNsYOOGkgMf0wuA7v8wHqE4fwotYyAGVCbtPzKGmnpvspjUI5vL+
         4lZw==
X-Gm-Message-State: AOAM53326c8aquLrcN2i5WHcRw52ZTPdUTLHfeo5Rolz99avvmYyQCSS
	4czMZxuenug0dPCAAO584/KbIByDtxFhwHw/6ETGvmqNBMQum3gCqILRK9DMPy8z5CTBnNOSP5Z
	/jQNYV/uoFwN94FU9
X-Received: by 2002:a5d:5273:: with SMTP id l19mr408448wrc.64.1599596483639;
        Tue, 08 Sep 2020 13:21:23 -0700 (PDT)
X-Received: by 2002:a5d:5273:: with SMTP id l19mr408421wrc.64.1599596483484;
        Tue, 08 Sep 2020 13:21:23 -0700 (PDT)
Return-Path: <philmd@redhat.com>
Received: from [192.168.1.36] (65.red-83-57-170.dynamicip.rima-tde.net. [83.57.170.65])
        by smtp.gmail.com with ESMTPSA id r13sm732783wrj.83.2020.09.08.13.21.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Sep 2020 13:21:22 -0700 (PDT)
Subject: Re: [PATCH 0/4] Acceptance Tests: update assets location and cancel
 tests if missing
To: Cleber Rosa <crosa@redhat.com>, qemu-devel@nongnu.org
Cc: Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>,
 Fabien Chouteau <chouteau@adacore.com>,
 Antony Pavlov <antonynpavlov@gmail.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Eduardo Habkost <ehabkost@redhat.com>, Andrzej Zaborowski
 <balrogg@gmail.com>, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>,
 Aurelien Jarno <aurelien@aurel32.net>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Beraldo Leal <bleal@redhat.com>,
 KONRAD Frederic <frederic.konrad@adacore.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Michael Rolnik <mrolnik@gmail.com>, Willian Rampazzo <wrampazz@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Sarah Harris <S.E.Harris@kent.ac.uk>,
 Peter Maydell <peter.maydell@linaro.org>, Paolo Bonzini
 <pbonzini@redhat.com>, qemu-ppc@nongnu.org, qemu-arm@nongnu.org,
 =?UTF-8?Q?Herv=c3=a9_Poussineau?= <hpoussin@reactos.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <20200907042000.415931-1-crosa@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Autocrypt: addr=philmd@redhat.com; keydata=
 mQINBDXML8YBEADXCtUkDBKQvNsQA7sDpw6YLE/1tKHwm24A1au9Hfy/OFmkpzo+MD+dYc+7
 bvnqWAeGweq2SDq8zbzFZ1gJBd6+e5v1a/UrTxvwBk51yEkadrpRbi+r2bDpTJwXc/uEtYAB
 GvsTZMtiQVA4kRID1KCdgLa3zztPLCj5H1VZhqZsiGvXa/nMIlhvacRXdbgllPPJ72cLUkXf
 z1Zu4AkEKpccZaJspmLWGSzGu6UTZ7UfVeR2Hcc2KI9oZB1qthmZ1+PZyGZ/Dy+z+zklC0xl
 XIpQPmnfy9+/1hj1LzJ+pe3HzEodtlVA+rdttSvA6nmHKIt8Ul6b/h1DFTmUT1lN1WbAGxmg
 CH1O26cz5nTrzdjoqC/b8PpZiT0kO5MKKgiu5S4PRIxW2+RA4H9nq7nztNZ1Y39bDpzwE5Sp
 bDHzd5owmLxMLZAINtCtQuRbSOcMjZlg4zohA9TQP9krGIk+qTR+H4CV22sWldSkVtsoTaA2
 qNeSJhfHQY0TyQvFbqRsSNIe2gTDzzEQ8itsmdHHE/yzhcCVvlUzXhAT6pIN0OT+cdsTTfif
 MIcDboys92auTuJ7U+4jWF1+WUaJ8gDL69ThAsu7mGDBbm80P3vvUZ4fQM14NkxOnuGRrJxO
 qjWNJ2ZUxgyHAh5TCxMLKWZoL5hpnvx3dF3Ti9HW2dsUUWICSQARAQABtDJQaGlsaXBwZSBN
 YXRoaWV1LURhdWTDqSAoUGhpbCkgPHBoaWxtZEByZWRoYXQuY29tPokCVQQTAQgAPwIbDwYL
 CQgHAwIGFQgCCQoLBBYCAwECHgECF4AWIQSJweePYB7obIZ0lcuio/1u3q3A3gUCXsfWwAUJ
 KtymWgAKCRCio/1u3q3A3ircD/9Vjh3aFNJ3uF3hddeoFg1H038wZr/xi8/rX27M1Vj2j9VH
 0B8Olp4KUQw/hyO6kUxqkoojmzRpmzvlpZ0cUiZJo2bQIWnvScyHxFCv33kHe+YEIqoJlaQc
 JfKYlbCoubz+02E2A6bFD9+BvCY0LBbEj5POwyKGiDMjHKCGuzSuDRbCn0Mz4kCa7nFMF5Jv
 piC+JemRdiBd6102ThqgIsyGEBXuf1sy0QIVyXgaqr9O2b/0VoXpQId7yY7OJuYYxs7kQoXI
 6WzSMpmuXGkmfxOgbc/L6YbzB0JOriX0iRClxu4dEUg8Bs2pNnr6huY2Ft+qb41RzCJvvMyu
 gS32LfN0bTZ6Qm2A8ayMtUQgnwZDSO23OKgQWZVglGliY3ezHZ6lVwC24Vjkmq/2yBSLakZE
 6DZUjZzCW1nvtRK05ebyK6tofRsx8xB8pL/kcBb9nCuh70aLR+5cmE41X4O+MVJbwfP5s/RW
 9BFSL3qgXuXso/3XuWTQjJJGgKhB6xXjMmb1J4q/h5IuVV4juv1Fem9sfmyrh+Wi5V1IzKI7
 RPJ3KVb937eBgSENk53P0gUorwzUcO+ASEo3Z1cBKkJSPigDbeEjVfXQMzNt0oDRzpQqH2vp
 apo2jHnidWt8BsckuWZpxcZ9+/9obQ55DyVQHGiTN39hkETy3Emdnz1JVHTU0Q==
Message-ID: <14ade196-172b-58b5-f036-4fef01f66ab7@redhat.com>
Date: Tue, 8 Sep 2020 22:21:20 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <20200907042000.415931-1-crosa@redhat.com>
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0.001
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-TUID: t2/JsvSDVH3S

Hi Cleber,

On 9/7/20 6:19 AM, Cleber Rosa wrote:
> This updates a couple of asset locations, because their locations on
> their origin distributions are not permanently stable.
> 
> To minimize the inconvenciente caused by test and job failures in the
> future, an option is enabled that will cancel (AKA skip) tests early
> when those assets are not available.
> 
> Cleber Rosa (3):
>   Acceptance tests: use an available kernel image package for arm
>   boot linux test: update arm bionic URL
>   Acceptance tests: cancel tests on missing assets
> 
> Pavel Dovgaluk (1):
>   tests: bump avocado version

I value your patches but I prefer to consider them as
new tests added, and not tests fixed (as discussed elsewhere
in this series). Therefore I'll post another simpler approach
until the discussion gets a consensus.

Regards,

Phil.
