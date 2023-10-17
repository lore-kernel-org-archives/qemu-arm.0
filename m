Received: by 2002:a17:907:8744:b0:9bd:85f7:2662 with SMTP id qo4csp3836632ejc;
        Tue, 17 Oct 2023 04:06:31 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHJoM7CLaLm+yWtdYDbIqQkaRDHK9+1nDgne/xHMePyCuKp2BMgg/Pa+pypeYU5Xi8Z2ECH
X-Received: by 2002:a05:651c:204e:b0:2c2:c1f6:3097 with SMTP id t14-20020a05651c204e00b002c2c1f63097mr1328655ljo.22.1697540791337;
        Tue, 17 Oct 2023 04:06:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1697540791; cv=none;
        d=google.com; s=arc-20160816;
        b=PQjrZWhs0U9xb/SLEfThyI7ub5vcvNSViLvRnnZW1NGZnyvthigzd/04pixwKerELi
         SLxeYosEqTpJix9h1vGKsOgdjZ6/Sc8c/JTdJ/eFMXVFz4MnO8X6K1dXR94ld3bQ6HZR
         aL2N0FSrntLSINMZWAvQgz5LF2dQUSoo6TBN/WhzUbtfWFbFQ49JKgTwDXHYtESeIAxS
         Jnnc0m0A3cfCXePyWlNQmYbQO3d1argu9ai0MbG18nk5rOYXJkDWc86hcUtuoxIzMU9d
         Jn/u/cB2NGAVSs8/7kaf2W24ZF48d9Yp5Uz7T9XqRHNbVI0Pfv1KK+2Vgm+IpJWaBcXC
         NT/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=8pvqoR2EfmQWgc2zL6d3konBLE9CeojvJ7dEECO+zKI=;
        fh=S+p+tOwmC8STmIe5zYWdpiJxpmX6TtlC8/9U1svyduo=;
        b=rCI2Nct1HlOHv86tET5SMdEtm33lzH4DAQBA6uZcc6h/9Xe4MBTUvSIAb2kv4R4cQp
         kLG0hBZf+x+2POBxMOV4+a7v6xOaCVq7IkryxxWpnzTOgGFoEPGHQjySp+D8hsprJN0t
         G2Dac2cJnufW4DHJl5soUHmGnSjEkF137sZegGgrIHwfMlBzRbJuz1fvyFfGVZiNRg2p
         k3xoQwa8mDFa1hHaESlXNJQEFZK1iluUSEZFdYEr4uAVrd9hjuySYTcmeVbZo9JPee4W
         j4A0+pq7Vj6btaLJRnC9vKOGjnKZgCPhLHRK7h35lfJ1KVIdmcPKobevPFnVWkj9r9g1
         uH9w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@yandex-team.ru header.s=default header.b=mAJGCL56;
       spf=pass (google.com: domain of vsementsov@yandex-team.ru designates 2a02:6b8:c03:500:1:45:d181:df01 as permitted sender) smtp.mailfrom=vsementsov@yandex-team.ru;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=yandex-team.ru
Return-Path: <vsementsov@yandex-team.ru>
Received: from forwardcorp1c.mail.yandex.net (forwardcorp1c.mail.yandex.net. [2a02:6b8:c03:500:1:45:d181:df01])
        by mx.google.com with ESMTPS id p17-20020a2e9ad1000000b002c17df114a1si425165ljj.364.2023.10.17.04.06.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Oct 2023 04:06:31 -0700 (PDT)
Received-SPF: pass (google.com: domain of vsementsov@yandex-team.ru designates 2a02:6b8:c03:500:1:45:d181:df01 as permitted sender) client-ip=2a02:6b8:c03:500:1:45:d181:df01;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@yandex-team.ru header.s=default header.b=mAJGCL56;
       spf=pass (google.com: domain of vsementsov@yandex-team.ru designates 2a02:6b8:c03:500:1:45:d181:df01 as permitted sender) smtp.mailfrom=vsementsov@yandex-team.ru;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=yandex-team.ru
Received: from mail-nwsmtp-smtp-corp-canary-81.sas.yp-c.yandex.net (mail-nwsmtp-smtp-corp-canary-81.sas.yp-c.yandex.net [IPv6:2a02:6b8:c08:ba1:0:640:375a:0])
	by forwardcorp1c.mail.yandex.net (Yandex) with ESMTP id 87B1A6236F;
	Tue, 17 Oct 2023 14:06:30 +0300 (MSK)
Received: from [IPV6:2a02:6b8:b081:8006::1:24] (unknown [2a02:6b8:b081:8006::1:24])
	by mail-nwsmtp-smtp-corp-canary-81.sas.yp-c.yandex.net (smtpcorp/Yandex) with ESMTPSA id R6i4ZkHOoa60-9x3X1mXp;
	Tue, 17 Oct 2023 14:06:29 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
	s=default; t=1697540789;
	bh=8pvqoR2EfmQWgc2zL6d3konBLE9CeojvJ7dEECO+zKI=;
	h=From:In-Reply-To:Cc:Date:References:To:Subject:Message-ID;
	b=mAJGCL56B+8FlWNsSY9hzfAlPMZqv4AyxyzLrvbDvvwt8QrESZl3rpO3M/6K9/vFX
	 7UiZ+o9MiD4UyHBo8k535KDyKW9aK+mG9OrVhuK9d8RBNL76DQniG5+m6dlyy/3/lT
	 0d2flneZc9YiW9k38jVuQ8VjShayk2OQrICp4pbM=
Authentication-Results: mail-nwsmtp-smtp-corp-canary-81.sas.yp-c.yandex.net; dkim=pass header.i=@yandex-team.ru
Message-ID: <0b07407b-06bc-40b1-af1b-3c8023cb6bdc@yandex-team.ru>
Date: Tue, 17 Oct 2023 14:06:26 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PULL 00/25] Python patches
Content-Language: en-US
To: John Snow <jsnow@redhat.com>
Cc: qemu-devel@nongnu.org, Kevin Wolf <kwolf@redhat.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>, qemu-arm@nongnu.org,
 Vladimir Sementsov-Ogievskiy <v.sementsov-og@mail.ru>,
 Ani Sinha <anisinha@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, qemu-s390x@nongnu.org,
 Peter Xu <peterx@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 Markus Armbruster <armbru@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 Eric Blake <eblake@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>,
 =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Fabiano Rosas <farosas@suse.de>,
 qemu-block@nongnu.org, Eduardo Habkost <eduardo@habkost.net>,
 Juan Quintela <quintela@redhat.com>, Leonardo Bras <leobras@redhat.com>,
 Joel Stanley <joel@jms.id.au>, Paolo Bonzini <pbonzini@redhat.com>,
 Andrew Jeffery <andrew@aj.id.au>, =?UTF-8?Q?C=C3=A9dric_Le_Goater?=
 <clg@kaod.org>, Eric Farman <farman@linux.ibm.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Halil Pasic <pasic@linux.ibm.com>, Cleber Rosa <crosa@redhat.com>
References: <20231013190941.3699288-1-jsnow@redhat.com>
 <20231016192101.GA161375@fedora>
 <CAFn=p-aO0ADr-oD3XvQs=8keNs27p3b5LGHzvZxeoMWLbu-KpQ@mail.gmail.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
In-Reply-To: <CAFn=p-aO0ADr-oD3XvQs=8keNs27p3b5LGHzvZxeoMWLbu-KpQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: Z3C4RFBxDXIh

On 17.10.23 02:44, John Snow wrote:
> On Mon, Oct 16, 2023 at 3:21 PM Stefan Hajnoczi <stefanha@redhat.com> wrote:
>>
>> Applied, thanks.
>>
>> Please update the changelog at https://wiki.qemu.org/ChangeLog/8.2 for any user-visible changes.
> 
> Hi Vladimir: all done!
> 

Thanks!

> I've created a MR to backport your changes to the standalone repo
> here: https://gitlab.com/qemu-project/python-qemu-qmp/-/merge_requests/30

Looks good to me.

> - please give it a quick glance to make sure I didn't butcher anything
> in transit.
> 
> Thanks,
> --js
> 

-- 
Best regards,
Vladimir
