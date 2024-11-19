Received: by 2002:a17:505:a60a:b0:1be9:327d:8ee3 with SMTP id qv10csp3117025njc;
        Tue, 19 Nov 2024 00:25:46 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCUYmLvdG397mRrY4+ZHKxW0Xezk7MJOVSH5AOS20PPBz6qpaQC16A5+MFg3olOB3KthsI4HZr0Gui66tw==@linaro.org
X-Google-Smtp-Source: AGHT+IEjuQItZZxd9oLYWOMvjRwQhgxGixAwtsVmog+ep4I7IDWcmjBioRdzu2v8qOeldZKM64Gg
X-Received: by 2002:a05:620a:1706:b0:7b1:41c8:332a with SMTP id af79cd13be357-7b3623649d8mr1954132885a.50.1732004746568;
        Tue, 19 Nov 2024 00:25:46 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1732004746; cv=none;
        d=google.com; s=arc-20240605;
        b=WapsodAoBZBJW4PKapfILmHfMydT2JmhtAJAYNckjVxPT5Q72T+fLyI3+33lHATpeu
         HARddlvP5P/RGzMZIC2X2DOanVpmdwjFnyTBRnXeJqOlg0UjRiMthgRbbSjrw8RHhOaY
         5lNhus6aru8/JwSqle46Hi5cRltwITEbHQRTvTjWjKaiHgYMmxagx3iSMHLDFw2fZfoe
         gcTrYViYezPngyf6Fw4ln7gqBVX+J8byZOiT9qAm+Sc0FK3WJ0vSzKz2N47XudGjyPSz
         VVUuyJaHNrizXGiRoLhNmZsSiXm6C6PfbOAu0MqxFHa1aMZiLU+L7KMRC7hvlj3DKg1V
         g1gQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:content-language:in-reply-to:autocrypt
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:dkim-signature;
        bh=M2yfTqQ3vppzhEcSaKHEuAeOjvgmEvwTo7J10wQXAEA=;
        fh=APr2BZtPtWjLEo5S84ZC7sKOuKyKsZsaoztXyMZjwLM=;
        b=gwDw+lbhUT8RIaZgsC39svMqHK6BTnna+3TOjF+OA+xj3gHyjbN1hSnnurXAknp4Ih
         5zHX9Jtp/FKQ/jz0e+xBGkjacwDYrZou9bb1IAWWMNJE6u1Cd98DxM8dqk9Fpb2aCLUH
         h/5OWuSKvd7OXJGKV3kSLdX2pvSOJDe1msy6nb+bUea/I/TM0lZGdAmUo41vb2k0t13h
         hdvr4xO9m2411tdUZVt2JGclWghWdjsP9fFdtLyUp20pgIAWCiWFMP3IqslboPu6KWgG
         da6R+EGPWsvxI0RDiUOvKcHHzHR3DtA5QHRJHp8AuS1HuxODfyiq5U69R8FQptM3qTJw
         oN9w==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=T2zTJZmF;
       spf=pass (google.com: domain of thuth@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <thuth@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id af79cd13be357-7b37a89864bsi177841585a.470.2024.11.19.00.25.46
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Nov 2024 00:25:46 -0800 (PST)
Received-SPF: pass (google.com: domain of thuth@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=T2zTJZmF;
       spf=pass (google.com: domain of thuth@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1732004746;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=M2yfTqQ3vppzhEcSaKHEuAeOjvgmEvwTo7J10wQXAEA=;
	b=T2zTJZmFPhpCK9wDSd9YL1AgsuDgE7oVR4GW8J9v3TZK5W0S276ry9Fr5ZYIcu0lLKM8FU
	YbK5vicET4RaUdpobblHmSuOEViVBeUqgxpXLVfDGMU9pJ9+WoJUqNBPckp8lMfuyeJnbe
	W+N9rJ34aFU9XiT/VTV+haIn31v7xuU=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-423-P5Qckb3IM5-IbO4doY2Jeg-1; Tue, 19 Nov 2024 03:25:42 -0500
X-MC-Unique: P5Qckb3IM5-IbO4doY2Jeg-1
X-Mimecast-MFC-AGG-ID: P5Qckb3IM5-IbO4doY2Jeg
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-38240c98b68so326094f8f.2
        for <alex.bennee@linaro.org>; Tue, 19 Nov 2024 00:25:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732004742; x=1732609542;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=M2yfTqQ3vppzhEcSaKHEuAeOjvgmEvwTo7J10wQXAEA=;
        b=SXZTQmpALqXPJczAgvPXHvfM2PCgWpec2YQ0GuyweiBD5ll6SQWmY+hDZjIKaRvw30
         0XIZLUpKed192EcruCAzJ6I1aJWcwmiD2tOSyo+rwj8NKwEfyf3oqGjmXR9+RlU+7Nft
         Af1vVgQXabFSBsFsIj2PKRy5IWcRWMosshxI0raj+VW8eHuItisDp43MGqW7Qq1bgjA7
         R+DY70/T675KAA0l0dawnS9Y+xVtm004KUI6/pJt5rdRrjodlbO7TmrhkJ/wKBx673IK
         btEKL6VjVRqKgOjQwleBbXupuKh2YxHpz3HyEBXnzQ4uQrFThcLCkiDfjfHJ6iXxOppM
         ocWA==
X-Forwarded-Encrypted: i=1; AJvYcCUwzIeQh2NXxmS/Ng7mxEXrgWgbc9RWgAQ4wKJVwyrpIe7gIRHP1I8d6Cxo3v0q2VYSqEcDI0ovvr7kXg==@linaro.org
X-Gm-Message-State: AOJu0YwAyblsgV+eAtXiSh8BhzhcugsQRXmunVsw4Nw6jwye2YpXjAZ8
	m/Sbhs6gRLgjWq04pXFQcSB7e8poCE8gU4H00UhenMPn+0NI5Y1oKi6Eq+4PH6USh8NQEl7ynV8
	nBLZP3z9c//DqGdXmn+8MHyPX33vkbxztb8S+3AZ32X4Wj62fREgJ1w==
X-Received: by 2002:a05:6000:1a8d:b0:382:4a9d:28fa with SMTP id ffacd0b85a97d-3824a9d2e2cmr2959115f8f.30.1732004741680;
        Tue, 19 Nov 2024 00:25:41 -0800 (PST)
X-Received: by 2002:a05:6000:1a8d:b0:382:4a9d:28fa with SMTP id ffacd0b85a97d-3824a9d2e2cmr2959076f8f.30.1732004741317;
        Tue, 19 Nov 2024 00:25:41 -0800 (PST)
Return-Path: <thuth@redhat.com>
Received: from [10.33.192.239] (nat-pool-str-t.redhat.com. [149.14.88.106])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3821ada3e65sm15033314f8f.13.2024.11.19.00.25.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 19 Nov 2024 00:25:40 -0800 (PST)
Message-ID: <f438cd57-3eb6-40be-84d1-1aecd499904e@redhat.com>
Date: Tue, 19 Nov 2024 09:25:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/7] docs/devel: remove dead video link for sourcehut
 submit process
To: Pierrick Bouvier <pierrick.bouvier@linaro.org>, qemu-devel@nongnu.org
Cc: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Andrew Melnychenko <andrew@daynix.com>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 Jason Wang <jasowang@redhat.com>, alex.bennee@linaro.org,
 Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 Fabiano Rosas <farosas@suse.de>, Kevin Wolf <kwolf@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Eric Blake <eblake@redhat.com>,
 qemu-arm@nongnu.org, Yuri Benditovich <yuri.benditovich@daynix.com>,
 manos.pitsidianakis@linaro.org, qemu-block@nongnu.org,
 Michael Roth <michael.roth@amd.com>, Konstantin Kostiuk
 <kkostiuk@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Peter Xu <peterx@redhat.com>, gustavo.romero@linaro.org,
 Peter Maydell <peter.maydell@linaro.org>,
 QEMU Trivial <qemu-trivial@nongnu.org>
References: <20241118172357.475281-1-pierrick.bouvier@linaro.org>
 <20241118172357.475281-2-pierrick.bouvier@linaro.org>
From: Thomas Huth <thuth@redhat.com>
Autocrypt: addr=thuth@redhat.com; keydata=
 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
In-Reply-To: <20241118172357.475281-2-pierrick.bouvier@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: remSYf3_j5LFJlABfDyiVP2G8olWc46YhRsefEkgVmo_1732004742
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TUID: SlGxyB27QOwg

On 18/11/2024 18.23, Pierrick Bouvier wrote:
> Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
> ---
>   docs/devel/submitting-a-patch.rst | 5 +----
>   1 file changed, 1 insertion(+), 4 deletions(-)
> 
> diff --git a/docs/devel/submitting-a-patch.rst b/docs/devel/submitting-a-patch.rst
> index 83e9092b8c0..349c32ee3a9 100644
> --- a/docs/devel/submitting-a-patch.rst
> +++ b/docs/devel/submitting-a-patch.rst
> @@ -252,10 +252,7 @@ patches to the QEMU mailing list by following these steps:
>   #. Send your patches to the QEMU mailing list using the web-based
>      ``git-send-email`` UI at https://git.sr.ht/~USERNAME/qemu/send-email
>   
> -`This video
> -<https://spacepub.space/videos/watch/ad258d23-0ac6-488c-83fc-2bacf578de3a>`__
> -shows the web-based ``git-send-email`` workflow. Documentation is
> -available `here
> +Documentation for sourcehut is available `here
>   <https://man.sr.ht/git.sr.ht/#sending-patches-upstream>`__.
>   
>   .. _cc_the_relevant_maintainer:

Reviewed-by: Thomas Huth <thuth@redhat.com>
