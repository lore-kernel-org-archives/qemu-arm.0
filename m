Received: by 2002:a0c:e741:0:0:0:0:0 with SMTP id g1csp1853960qvn;
        Fri, 5 Nov 2021 09:19:44 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxyrcnxYeoyhCJ4LiUgGKOtz5ecGrGcZQRkUXYML9iSXQiZAq7RdzaVDCXe/HgmfcK6kuSO
X-Received: by 2002:a17:907:7f90:: with SMTP id qk16mr12461011ejc.169.1636129184576;
        Fri, 05 Nov 2021 09:19:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1636129184; cv=none;
        d=google.com; s=arc-20160816;
        b=kK/Jb8o/hVlksPxDuh2Mkdk+USBixci9OtJ7qIfniy2ij5vsZxk5pNkvCEoj/TchjZ
         IJuHCkvcQSSQ6XY4YvOK/8VbPgkR30zjdA9Re+51DH42DM6vwyF1tHTHFRpjEAJSO4JU
         YbMD9HVdDXr18AO98ZQMYLrxh4rTbrkoeP/6EXfnIJwDDp5clShEk7AdBjlxZsdHK8Op
         eOwdtrLfbgFlSVfQ/SzmkBA53wHysUpRPbp2LmUl+97iYlMIiJ+HiBq1tb8ywQHxFvep
         ndZO2P87+T3cHkC7IqmtFYglp6ZWy9zScejwJM30VqQMQJdKkTX3TtLd9I2qxCPbLega
         0LIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=TDNbqPJ8a/Az0zn+2YxIGgzz/QKquWqg/kHPO/ej/5w=;
        b=vvddqyilYqZnUnwiBsP9O/Z8AKQQ/WO80QUJh3dqdAN9LyAsHbxbIbCwHWYFkSKCO6
         t9kJ6iWg5o6i8rqZHXfeSGToWaFg51UgHnt08tDObSp6Ze/oKhUkICVbtYXNM1C5Q888
         foX+gASmXiyyaT/XfMFwp/TKhJE8xGgLgyrOU+oMaolY17NmIqNMfQpkHBjpiNAP6lIj
         v3fsaj0vCCQ3gkh7LmlSCXIo4rZpPmdG5yKxK2wXCdgazKrcV7HiZxCEHNlQdY3RWzKG
         AsSMdW494UVYdMPesL8gwDiaGOX5QecCZK1yNhxe99i6ic69G4L9vExIAJgyrWWIDzwu
         IJzA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=QZmDY0uJ;
       spf=pass (google.com: domain of philmd@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <philmd@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id nb21si16252518ejc.63.2021.11.05.09.19.44
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 05 Nov 2021 09:19:44 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=QZmDY0uJ;
       spf=pass (google.com: domain of philmd@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1636129183;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=TDNbqPJ8a/Az0zn+2YxIGgzz/QKquWqg/kHPO/ej/5w=;
	b=QZmDY0uJJXj5gToBeKYvBbmqkAdorKhTaLCYe86A+bnzorPoHm5BT2q0IcjygyvC2T4O1u
	/l1ILpS3ZojHbWPRU9QIXtFWfLPi/BDB6R76OQTiw8PZIGZA8Yus83a3htHa9Cc6oqXElX
	VvO0aZ/3LPE4w8m9dQifCNc0m9J9SW8=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-14-VWo9Kv7AN32w5a9KXYgb0A-1; Fri, 05 Nov 2021 12:19:42 -0400
X-MC-Unique: VWo9Kv7AN32w5a9KXYgb0A-1
Received: by mail-wm1-f70.google.com with SMTP id j193-20020a1c23ca000000b003306ae8bfb7so3466309wmj.7
        for <alex.bennee@linaro.org>; Fri, 05 Nov 2021 09:19:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=TDNbqPJ8a/Az0zn+2YxIGgzz/QKquWqg/kHPO/ej/5w=;
        b=rLPCyYXGGeISWgp2faNadZeZHLaNun4MlEOngqrsUjb2BUbin10lDBoz17Zyg+tpoS
         9QlYqKgjJLJ/hmioPMH2QWdFmPYvcD/aLK7HCdseYM7oDPl+27cV8qWX3d9sX20Kpfi2
         wn9JHaEnMcq7UAOpj9wOEj9s2oYiayuYvWMw9ah1WO9e7ATNlM5u8uPc7cSAH9qr0xsP
         WxGECLaXWhl9Bo5F4ALzxOu2oFb1Pw8laHtb8Z9gHq+NCcpbpnFCUx7EdueOoXQ0HISf
         x2ursH0a0yObPjcN2k90Dai4KK54Yt1frWq3rIp+cWmTxnb3XsRV4a+jiw2nnjThCzxr
         jcpg==
X-Gm-Message-State: AOAM532+K5op2yzgymUueY8hqRB1JDdniVBhZ3nfFlQhqxGGx2s1Oar8
	Fcau4xY/G1yH/oNQkYKEC17L/ImEekGsYRYfPZMqyKPmorL5Un03ecFtYt6xxu1IfFVBTUnlU9n
	0TERQPDM0Blqs0+H7
X-Received: by 2002:a05:600c:3b1b:: with SMTP id m27mr22998873wms.125.1636129180714;
        Fri, 05 Nov 2021 09:19:40 -0700 (PDT)
X-Received: by 2002:a05:600c:3b1b:: with SMTP id m27mr22998852wms.125.1636129180530;
        Fri, 05 Nov 2021 09:19:40 -0700 (PDT)
Return-Path: <philmd@redhat.com>
Received: from [192.168.1.36] (62.red-83-57-168.dynamicip.rima-tde.net. [83.57.168.62])
        by smtp.gmail.com with ESMTPSA id v185sm11590507wme.35.2021.11.05.09.19.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 05 Nov 2021 09:19:40 -0700 (PDT)
Message-ID: <4f8f6425-7b5f-644c-6b80-bd5432d08015@redhat.com>
Date: Fri, 5 Nov 2021 17:19:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v2 1/2] tests/acceptance: introduce new check-avocado
 tartget
To: Willian Rampazzo <willianr@redhat.com>, qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>, Michael Rolnik <mrolnik@gmail.com>,
 Niek Linnenbank <nieklinnenbank@gmail.com>,
 =?UTF-8?Q?Herv=c3=a9_Poussineau?= <hpoussin@reactos.org>,
 John Snow <jsnow@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>, qemu-ppc@nongnu.org,
 qemu-arm@nongnu.org, Cleber Rosa <crosa@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, libvir-list@redhat.com,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
References: <20211105155354.154864-1-willianr@redhat.com>
 <20211105155354.154864-2-willianr@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
In-Reply-To: <20211105155354.154864-2-willianr@redhat.com>
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: /0H7U0SnZC+T

On 11/5/21 16:53, Willian Rampazzo wrote:
> This introduces a new `make` target, `check-avocado`, and adds a
> deprecation message about the `check-acceptance` target. This is
> a preparation for renaming the `tests/acceptance` folder to
>  `tests/avocado`.
> 
> The plan is to remove the call to the `check-avocado` target one
> or two months after the release and leave the warning to force
> people to move to the new `check-avocado` target.
> 
> Later, the `check-acceptance` target can be removed. The intent
> is to avoid a direct impact during the current soft freeze.
> 
> Suggested-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> Signed-off-by: Willian Rampazzo <willianr@redhat.com>
> ---
>  docs/about/deprecated.rst | 13 +++++++++++++
>  tests/Makefile.include    | 17 ++++++++++++-----
>  2 files changed, 25 insertions(+), 5 deletions(-)

Typo "target" in subject (no need to respin).

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Tested-by: Philippe Mathieu-Daudé <philmd@redhat.com>
