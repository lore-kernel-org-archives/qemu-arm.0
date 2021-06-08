Received: by 2002:a19:4310:0:0:0:0:0 with SMTP id q16csp4544436lfa;
        Tue, 8 Jun 2021 08:43:32 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz9oGSEX0iV8ePbxwkZIA7cnplJFPUoRN2aeua4xsr1XzMw/bHe/kL/QTbXScuVGPCKIORi
X-Received: by 2002:a17:907:2057:: with SMTP id pg23mr23732511ejb.113.1623167012360;
        Tue, 08 Jun 2021 08:43:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1623167012; cv=none;
        d=google.com; s=arc-20160816;
        b=R5BGaFOTovSg/S/UBG6l0GegYW5uv5CGsqHPE/Jv2HyeCQjxA5DgcqwWcMmGdp7GSf
         uy3XsO1Gzdefw9Eao5ajKxm/W2v1bTmruAITNrO34JsJWEjEfzZNTk9ifinVjgXjRc9w
         mOZkqQwYd2diTiOzq1UAHyICFdhVz2JpHdKWF5+kmFG3VS328MgzHoKyeLLiQo4PrUGz
         DcBdlEVmse6KC5Abr/XZDySDPRz7wrIEjpTqM7vNpGMLPp4Q87yG7yDv1x95wvPYD5hr
         j4COtn8g66qR3L8Tt2PVrjRorkzClFwVxqyznL0y08VbwRnRNXW81U/m74ZnvJ2hIhTT
         9n1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ak7KE6SsAlXwA5SW0eMXDPVZwmz3BYbLWfKjOCNHXKs=;
        b=KUlBMgqxawGaj77vMUQgJbKhIfl9gquu05b3LUQoabBHx2t51vw/2hPmz1NBAnMQ3B
         8htSOhJXE0mu9RepMwVs3EY4GMKE37+clzqNjjFLXP8EWNKumYC7ASIFfxa44rI/hIzt
         lP2e/1j9d46jcl0YViIhhRw/uB2bx00t8AGK3kpojR2FGr850CaAMawoksWVzRADByke
         vRsWBiaYcJbxgXNr6srHAhua7NEnuEVROiLJFxco9Ua/3FrmGuRX1eA2ABpa/GJ1YpvT
         X6umGKBzSixkLNucYyRZr239T1/VLk39+ws1XFyFelAGp8vKflV/vR3SFdDHiqy4u8cH
         swQQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=G4D0Tzvp;
       spf=pass (google.com: domain of philmd@redhat.com designates 216.205.24.124 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <philmd@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [216.205.24.124])
        by mx.google.com with ESMTPS id w8si22178ejs.658.2021.06.08.08.43.31
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 08 Jun 2021 08:43:32 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@redhat.com designates 216.205.24.124 as permitted sender) client-ip=216.205.24.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=G4D0Tzvp;
       spf=pass (google.com: domain of philmd@redhat.com designates 216.205.24.124 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1623167011;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ak7KE6SsAlXwA5SW0eMXDPVZwmz3BYbLWfKjOCNHXKs=;
	b=G4D0TzvpklXiGxGXrDspP7Oa889b8C45gZVT+hHqS94s+EoOZkwsD0bygB06D4o8dB4LJL
	uGBBHabqzEymrbUcu3HtCaxb6Ert19DGBFUZNyYVyiTxxIY4Ka3nKsHdVrWvngy5FB1Svd
	qVI4d6cQ9nDgHI2sMYmlTtdjOq5AevA=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-343-l4mG6s2PNE6Q7hxVojVBlQ-1; Tue, 08 Jun 2021 11:43:30 -0400
X-MC-Unique: l4mG6s2PNE6Q7hxVojVBlQ-1
Received: by mail-ej1-f69.google.com with SMTP id mp38-20020a1709071b26b02903df8ccd76fbso6986021ejc.23
        for <alex.bennee@linaro.org>; Tue, 08 Jun 2021 08:43:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=ak7KE6SsAlXwA5SW0eMXDPVZwmz3BYbLWfKjOCNHXKs=;
        b=BKpEzTN55/ycUm4YpvAPhcqnb+l1eMA46YedREjmAv/wYgM9o8VUo3bTPLBhocTPUm
         Eb4oM9AZw3rRFf3aNpvxPeQs2QeQT6A/WGii6eBGUk7SDZHbrX2hpGT27BcvdEecIgl2
         EPTcD2dQiA5y+YJboGMcQMoc4f+zHW9GxrMyMCGdY96PUkWpvcmSumE1yjHNk/E2cLj8
         OWziQISr4fg+DzkaK1868MtHO7D4Yz3Qb5xodglrshIQwQbiJZAlLdoIJgv/Q3u3dJcR
         9bD/8CZKeNy8BZgsxHd2DS5UxH+4YMsgRiv42yatwBh6j765zs9ZHuXa/L2xVdLZLG0m
         RAPw==
X-Gm-Message-State: AOAM532dJmJTUrsnUyNlT8/NGntCGgN1GhTbRcxUD7RkLmu3km/62W32
	etJGRTYLOY2zBtbeksrRJ3uhpjvQkmPIRRcVxZvezsOKR3UrUYjwcbs8u5bkIwFGAGejoTT3VAb
	/yjzk5AvGGq9bECLpcQbPLJRp6ojIwVzN
X-Received: by 2002:a17:906:85d5:: with SMTP id i21mr22119104ejy.360.1623167008585;
        Tue, 08 Jun 2021 08:43:28 -0700 (PDT)
X-Received: by 2002:a17:906:85d5:: with SMTP id i21mr22119092ejy.360.1623167008475;
 Tue, 08 Jun 2021 08:43:28 -0700 (PDT)
MIME-Version: 1.0
References: <20210604155312.15902-1-alex.bennee@linaro.org>
 <20210604155312.15902-3-alex.bennee@linaro.org> <87r1hcwegq.fsf@dusky.pond.sub.org>
In-Reply-To: <87r1hcwegq.fsf@dusky.pond.sub.org>
From: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Date: Tue, 8 Jun 2021 17:43:17 +0200
Message-ID: <CAP+75-VQn81us+fX9RZW4sOdjxYX8nEY6GBNv+FMrOWaqBTZZw@mail.gmail.com>
Subject: Re: [PATCH v16 02/99] accel: Introduce 'query-accels' QMP command
To: Markus Armbruster <armbru@redhat.com>
Cc: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
	QEMU Developers <qemu-devel@nongnu.org>, Eduardo Habkost <ehabkost@redhat.com>, 
	Richard Henderson <richard.henderson@linaro.org>, qemu-arm <qemu-arm@nongnu.org>, 
	Paolo Bonzini <pbonzini@redhat.com>
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: 7mMevSCJNrf1

On Tue, Jun 8, 2021 at 5:42 PM Markus Armbruster <armbru@redhat.com> wrote:
> Alex Benn=C3=A9e <alex.bennee@linaro.org> writes:

> > Reviewed-by: Eric Blake <eblake@redhat.com>
> > Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> > Tested-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> > Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> > Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> > Message-Id: <20210505125806.1263441-3-philmd@redhat.com>
>
> I assume this one's superseded by Phil's "[PATCH v8 02/12] accel:
> Introduce 'query-accels' QMP command", i.e. I should review that one,
> not this one.

Correct.
