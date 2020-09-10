Received: by 2002:ac2:4c26:0:0:0:0:0 with SMTP id u6csp1133796lfq;
        Thu, 10 Sep 2020 02:11:28 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwUZDTZdEGjGpdBMr+MqRQ5L5Vb7IhB9K2Rr97vqz6gBeSd7vXNdrvHXxsLZyJpeD5dYpVj
X-Received: by 2002:a25:5887:: with SMTP id m129mr12477530ybb.11.1599729088528;
        Thu, 10 Sep 2020 02:11:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1599729088; cv=none;
        d=google.com; s=arc-20160816;
        b=LgfS2Es8AudsqRxEuPVkRWyvOxpm5wGn64J9xbnG4YNB6JvIuOvejKgYQHuqc7JAV8
         dhcZyKjLOjlRsUY6s+4RG6wWgs6yNzzeDsxs4gTK4j4KvW5uL5SHcaDuRKDA2Uv+iuZI
         z3adV3OwsrTUm7hoFSGFgaCgb8mM4jI5sAxsyY3EN2cuwyNODMq8trTvyhjGazZcdeiw
         gwfpYRZpV79IMKcshDjIRI4EuTlRbkB7dLCvYU3w9u8xiCkdtaH4fLIUI3wr1SaygtDB
         JjFjE9c/s6yYV4upRRRIa79jTNHlZwz/xmro5OiTMUhsQu2EpIhfLRuFRBsX5BRBKMoF
         hZNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-language:content-transfer-encoding:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :dkim-signature;
        bh=2S+dASRYX7B6gIlF4p7C2wh2Lfe0xE+w23SHE4uKPDk=;
        b=NqbnNt2kuGmVqmzOIfWEKAmgBydndw4/5ICYdLRhr9iMsGDgWDTmBD5rGLtZF8UL81
         wcQcsvzZvI0g+ZC7vssYbFkNmB5bEnW0CIh52e79zGSNeMYbqsO63mcSNAaifQEFKV53
         +A5u6a2r+6GIsAnlrP/Pkf6+S+mZ+2J4IY/4WPx4g7oq+lwqGHaSISoU1M71gEYZQ6v/
         tr2jthiRhD3QeTE78IxiU2U1uLprnAGviqi+sZIlXx9zP7/D9+laRfbYQrgHFwZcUzI6
         fnzaIsG/AJ2mlFpNK2630tsqGmVvNE8JVi+gKbnkX8/7dUfNPesoD1eCwZKzxKZOzN47
         iMHQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=TIXXQNnt;
       spf=pass (google.com: domain of pbonzini@redhat.com designates 205.139.110.120 as permitted sender) smtp.mailfrom=pbonzini@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <pbonzini@redhat.com>
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com. [205.139.110.120])
        by mx.google.com with ESMTPS id o81si6836447ybc.465.2020.09.10.02.11.28
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 10 Sep 2020 02:11:28 -0700 (PDT)
Received-SPF: pass (google.com: domain of pbonzini@redhat.com designates 205.139.110.120 as permitted sender) client-ip=205.139.110.120;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=TIXXQNnt;
       spf=pass (google.com: domain of pbonzini@redhat.com designates 205.139.110.120 as permitted sender) smtp.mailfrom=pbonzini@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1599729088;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2S+dASRYX7B6gIlF4p7C2wh2Lfe0xE+w23SHE4uKPDk=;
	b=TIXXQNnt3q9+qWdGgzezLVDc0PBEqUoZQa2uCbKtvrO3pVewd7YqcIcZoZecVvrIHi6XbH
	fEL5oByU1NBW7y+l497ozAVshZepQLzwAspOyPmXI0LL9QrCpMvakQ49kj7nn9DajbwtYo
	sCcokMYUpVbG11rZ3csWWD5+IQlKBcQ=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-406-pd0k51vWOn2tCKTuk3h7BA-1; Thu, 10 Sep 2020 05:11:26 -0400
X-MC-Unique: pd0k51vWOn2tCKTuk3h7BA-1
Received: by mail-ed1-f69.google.com with SMTP id n4so2167733edo.20
        for <alex.bennee@linaro.org>; Thu, 10 Sep 2020 02:11:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=2S+dASRYX7B6gIlF4p7C2wh2Lfe0xE+w23SHE4uKPDk=;
        b=Z7ZaOhXQh3JJosN3iKBLKwzRBOnbjEjVSUNKTtMf+U7EahNsO2GXk/PU5jVUAchu92
         26cdQruUBTpDwuy6Uj5uVlpt+RcpiAA7YM8cjmFEJjyLYF7gQ67SD5b0yYPBX7E8Cz+8
         GeEonnxgziqzcgAICTTiCijhAd3xoejDuJxgUIrlzmAkJRH0NOm/HGLHX4b/zYSzC4cD
         xNSBUfwQVVE8kEr7vKYEhPPtAdXCt62ROQq08mSm8Ps4/enelZoLdooDkm21tBUhpqnY
         TCRGYJg03P8/tWh+1nM4H1MDOR5AOyrh2qOLLB6KAUH9GugXzKF+BmS0glU5GpjYmVZH
         7n4g==
X-Gm-Message-State: AOAM533t/DmbfweShYTm+mx3fscEujDCFh2IY8KlmEzI0StdeE2DLkDr
	WLr50eoWzv0kkYQ2NXRtwhqwZeBkRxhsOz7OLKv26FHNHMVXKXgaQ8MLGGTETDq8OrldMncDMRd
	PXQcgNtBQUchez3+t
X-Received: by 2002:a17:906:1542:: with SMTP id c2mr8069333ejd.533.1599729085433;
        Thu, 10 Sep 2020 02:11:25 -0700 (PDT)
X-Received: by 2002:a17:906:1542:: with SMTP id c2mr8069317ejd.533.1599729085289;
        Thu, 10 Sep 2020 02:11:25 -0700 (PDT)
Return-Path: <pbonzini@redhat.com>
Received: from ?IPv6:2001:b07:6468:f312:2744:1c91:fa55:fa01? ([2001:b07:6468:f312:2744:1c91:fa55:fa01])
        by smtp.gmail.com with ESMTPSA id br7sm6403283ejb.76.2020.09.10.02.11.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Sep 2020 02:11:24 -0700 (PDT)
Subject: Re: [PATCH 5/6] hw/pci-host/q35: Rename PCI 'black hole as '(memory)
 hole'
To: Thomas Huth <thuth@redhat.com>, =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philmd@redhat.com>, qemu-devel@nongnu.org
Cc: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 kvm@vger.kernel.org, qemu-arm@nongnu.org,
 Marcelo Tosatti <mtosatti@redhat.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, =?UTF-8?Q?C=c3=a9dric_Le_Goater?=
 <clg@kaod.org>, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Laurent Vivier <lvivier@redhat.com>, Peter Maydell
 <peter.maydell@linaro.org>, Andrew Jeffery <andrew@aj.id.au>,
 Jason Wang <jasowang@redhat.com>, Alistair Francis <alistair@alistair23.me>,
 qemu-trivial@nongnu.org, Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <rth@twiddle.net>, Joel Stanley <joel@jms.id.au>
References: <20200910070131.435543-1-philmd@redhat.com>
 <20200910070131.435543-6-philmd@redhat.com>
 <7dbdef90-1ca6-bf27-7084-af0c716d01d9@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <d04610d8-2ba3-4f36-2820-56044324a73d@redhat.com>
Date: Thu, 10 Sep 2020 11:11:29 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <7dbdef90-1ca6-bf27-7084-af0c716d01d9@redhat.com>
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0.002
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-TUID: pECMamJT9I9u

On 10/09/20 09:15, Thomas Huth wrote:
> On 10/09/2020 09.01, Philippe Mathieu-Daudé wrote:
>> In order to use inclusive terminology, rename "blackhole"
>> as "(memory)hole".
> A black hole is a well-known astronomical term, which is simply named
> that way since it absorbes all light. I doubt that anybody could get
> upset by this term?
> 

Agreed.  This is a memory region that absorbs all writes and always
reads as zero, the astronomical reference is obvious.

Paolo
