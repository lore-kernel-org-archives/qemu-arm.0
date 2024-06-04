Received: by 2002:a17:906:7fcb:b0:a66:557b:2f6e with SMTP id r11csp2794737ejs;
        Tue, 4 Jun 2024 01:44:10 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCW0pSxts9XK/fDdld3Y/U7SoKt8EaDe+HxhDyCm+MXw5j0W3SXxO79iCKFzapULhAI0O1KpBIHKsgNeFU5pI24rl7jqZayO
X-Google-Smtp-Source: AGHT+IHiAByIWQ8AtcxO55JpPl9iyzav7SumY1f0J474XgJ2XlYqq0bjzpaPvU7YoSvJprrIoHY/
X-Received: by 2002:a05:620a:4691:b0:794:f6ad:3cd2 with SMTP id af79cd13be357-794f6ad3f9bmr1392333585a.55.1717490650412;
        Tue, 04 Jun 2024 01:44:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1717490650; cv=none;
        d=google.com; s=arc-20160816;
        b=yOoD0A38U2KXcXSnmcIP6Lo3OH0+bSoZM60MQbESQw+imoTzEFbPy7fzWP3HhGIsYq
         9FgcX3UGkzoxd7FRD6Gwj27yStkx93f8yZZHL4uXFvDGd9jNmiyOptNsUAXsgQJXRxbc
         Uqy8iwV/QwkbvcCHPdV0OPzTCJ6o1A3DFqKYKv2OyQXaiyNZH4LVe/l210RzXcFiiEsf
         Scl6lxvAag5uPSLVewt9PhCCys15XbLgctv0R9Vnzt2Nxn9ANLgR1+ULFhA2sFvYjYIb
         7GzI/g1ZrG0TwQXRLDaSklt7YrmdTt4G7Va9t0j4XHU0NMvsZNPIbLX3CI7wY7ETfRO9
         xz6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:user-agent:message-id:date:references:in-reply-to
         :subject:cc:to:from:dkim-signature;
        bh=zh7oc39RI723rzfabH7zb7UQwK5DnQcHFkmye0dvQB8=;
        fh=YtMdrrrL4AdjARoXd5Fxw8LjXJzXSJRO9dQYlO5BjO8=;
        b=OL+Q2eMGawvMCqpurwXWU63J0cCdw9MxCrUrtIJrC0no0Ho0RxXNy6G6xHaHjMs23j
         oQqTHot8MU59LM9e8y5qGr4EfZFsa1EPEUtvrphqV8kzuU5jykisnRdojm15GZJkEMZO
         R0dlYP67G/3EvXvdE+1mrKTBD0tNjJMHk+gn753Xmhjhqd5XRvL666Buu4aEvi4mZS1i
         mCMyeXc6Az3IjgOyEy7iF/WkVJrzV6ff5+E1q6ZE7EmCAu2ydkSG49eerkB19GPKwpR5
         Q68yc38J8BlExRdJOFHrqH+ixLVhNxpN2+6dJg+DmxEvqfnCGOCib+ZUhMOGqcf5rOeZ
         spqQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=hK6C5WYN;
       spf=pass (google.com: domain of armbru@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=armbru@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <armbru@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id af79cd13be357-794f3063844si152899685a.299.2024.06.04.01.44.10
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Jun 2024 01:44:10 -0700 (PDT)
Received-SPF: pass (google.com: domain of armbru@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=hK6C5WYN;
       spf=pass (google.com: domain of armbru@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=armbru@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1717490650;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=zh7oc39RI723rzfabH7zb7UQwK5DnQcHFkmye0dvQB8=;
	b=hK6C5WYNLOGnwH7HXejeP9WY9yiDnR4PUTh936Rk19IfMo93diP0SumPnQA1VS9RI5G5Qh
	fkQRIjZ2L/MY6oHD3WPwbGvZgGdE/0liJByl486xyIlMPUAaE1pFGHlGJVf3/ItdplPVnc
	S6LWaNlA1OgxpMkB5u0Yb6hfNir2vtg=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-27-4NDhaJXWMhGamih_1BkHOg-1; Tue,
 04 Jun 2024 04:44:03 -0400
X-MC-Unique: 4NDhaJXWMhGamih_1BkHOg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com [10.11.54.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id BE1AB1C03D84;
	Tue,  4 Jun 2024 08:44:02 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.192.93])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 4CF982875;
	Tue,  4 Jun 2024 08:44:02 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
	id 720C521E6687; Tue,  4 Jun 2024 10:44:01 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Zhao Liu <zhao1.liu@intel.com>
Cc: Daniel P . =?utf-8?Q?Berrang=C3=A9?= <berrange@redhat.com>,  Eduardo
 Habkost
 <eduardo@habkost.net>,  Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
  Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>,  Yanan Wang
 <wangyanan55@huawei.com>,  "Michael S . Tsirkin" <mst@redhat.com>,  Paolo
 Bonzini <pbonzini@redhat.com>,  Richard Henderson
 <richard.henderson@linaro.org>,  Eric Blake <eblake@redhat.com>,  Marcelo
 Tosatti <mtosatti@redhat.com>,  Alex =?utf-8?Q?Benn=C3=A9e?=
 <alex.bennee@linaro.org>,
  Peter Maydell <peter.maydell@linaro.org>,  Jonathan Cameron
 <Jonathan.Cameron@huawei.com>,  Sia Jee Heng
 <jeeheng.sia@starfivetech.com>,  qemu-devel@nongnu.org,
  kvm@vger.kernel.org,  qemu-riscv@nongnu.org,  qemu-arm@nongnu.org,
  Zhenyu Wang <zhenyu.z.wang@intel.com>,  Dapeng Mi
 <dapeng1.mi@linux.intel.com>,  Yongwei Ma <yongwei.ma@intel.com>
Subject: Re: [RFC v2 1/7] hw/core: Make CPU topology enumeration arch-agnostic
In-Reply-To: <Zl7S0IOlLvnua319@intel.com> (Zhao Liu's message of "Tue, 4 Jun
	2024 16:39:44 +0800")
References: <20240530101539.768484-1-zhao1.liu@intel.com>
	<20240530101539.768484-2-zhao1.liu@intel.com>
	<87y17mfccp.fsf@pond.sub.org> <Zl7S0IOlLvnua319@intel.com>
Date: Tue, 04 Jun 2024 10:44:01 +0200
Message-ID: <878qzlayi6.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.5
X-TUID: Pe7gxztRs9yk

Zhao Liu <zhao1.liu@intel.com> writes:

[...]

>> > +##
>> > +# @CPUTopoLevel:
>> > +#
>> > +# An enumeration of CPU topology levels.
>> > +#
>> > +# @invalid: Invalid topology level, used as a placeholder.
>> 
>> Placeholder for what?
>
> I was trying to express that when no specific topology level is
> specified, it will be initialized to this value by default.
>
> Or what about just deleting this placeholder related words and just
> saying it's "Invalid topology level"?

Works for me.

[...]
