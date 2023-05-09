Received: by 2002:a17:906:4810:b0:965:a47e:1721 with SMTP id w16csp2593440ejq;
        Tue, 9 May 2023 02:42:36 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ6w/PyiotG4+cwjuo5qCf0oyhiI43nFYjmfnVC0/+8AUU6EB2DFdV7OKtXLnxRGtj/5q5Na
X-Received: by 2002:ac8:5b06:0:b0:3ef:6c09:edb6 with SMTP id m6-20020ac85b06000000b003ef6c09edb6mr17523173qtw.27.1683625356571;
        Tue, 09 May 2023 02:42:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1683625356; cv=none;
        d=google.com; s=arc-20160816;
        b=St6o//via2M5bbcocVWPh5dDZhplNQufmCSFr41VveewXoeXEGF1IJtSv4bSq1ntEv
         WLJ0/pT6oZzQ3qA8j0300tUAiHuwI3MXvgwYlUYzckASVT39ryKWbSeP+UwjpnWg3djp
         KHuMRh4R+5WrVcRS4X8cMxX1LqlvOkX+AGJTrudXICk2NyMTRBQQytu8vA75oOJnR+kt
         hBS/+Bj7+PKzYWNbz9hrtiTWRakGPFiqQhXW42l5fs6WCGMwwAOazuUpbYPCAK7Gx04W
         M4B4yQBdHAflpe7TkYs8F3MziBynigUHayCKHe6Vdml19FMeVauBQlk7eNITFnI5v4oO
         07hA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=pzyzsRyc9yht/HJanfsUPJ0wkeEzXXSIdJZxKgl9dkA=;
        b=PAZUyTc9jjGGjrRHNfyRt4tmSrH/nXnb0jA6RJOJ/491tau9XVf+rRbrf769bY0ZO/
         ChxNFq7Jzv0z0kCSBXHecNFV9C3uUBfR27yuwAij9kmRzsCnlyFzvezdiRWZMYFsrcel
         kOy55lT9QKUFnRpsEaEHl1bVTmpzYAGFnfisJKVZZMJ3PGEpRKaCEJQ7s3BkWGRKk8J9
         uG881A5pUVYMc3qVWSianra0I1GlRoH9XnSIEkXe8n4VAQf+Yku7cReNfyTDKkU4/xaP
         ierflJjgiFmGL0KYaQvJ7bDpsd/Cl5kxIcmI8iL1CKyZ0zSoiZ+ZvK0ff45taetuABTq
         XNYA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=So2hkLd+;
       spf=pass (google.com: domain of pbonzini@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=pbonzini@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <pbonzini@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id m9-20020ae9e709000000b0074e4136b8cfsi3673507qka.435.2023.05.09.02.42.36
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 May 2023 02:42:36 -0700 (PDT)
Received-SPF: pass (google.com: domain of pbonzini@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=So2hkLd+;
       spf=pass (google.com: domain of pbonzini@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=pbonzini@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1683625356;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=pzyzsRyc9yht/HJanfsUPJ0wkeEzXXSIdJZxKgl9dkA=;
	b=So2hkLd+thyYq9+dd3dFnaxJPfmX2UYKsbqITkovGV2K7qC/dKpZmfcujDZjqNN8TrOdgG
	qc2XrgHJI6DHonqSixsNUgD7Tm/RsvfzWVlTdJ7drDFiSxNM/HxxZfaHHnRfTdynfHep6k
	PkWEJ9n5AHOcBMoASZMgSfC5Lh6Ytcg=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-425-BH3nw7EZOCWzxdXvSRRIew-1; Tue, 09 May 2023 05:42:35 -0400
X-MC-Unique: BH3nw7EZOCWzxdXvSRRIew-1
Received: by mail-ej1-f70.google.com with SMTP id a640c23a62f3a-9532170e883so698230166b.3
        for <alex.bennee@linaro.org>; Tue, 09 May 2023 02:42:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683625353; x=1686217353;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pzyzsRyc9yht/HJanfsUPJ0wkeEzXXSIdJZxKgl9dkA=;
        b=Gn9uVNHez9OLVIGGYxO6esbje0qaV1kQfYp58ChvqbOLl6wjZZNaQMGGCqxrQW21+u
         vRvFBvYe8uHeO0n00PE/HQSqsnLcxK+CWRWdTJT2cKaQr4271n38w7yiWB9cCNI7ObOC
         zYbqhvnTfK5uVefk5yIwYyHv5AbKvYnedlkGQJqqXosO5wOU7NlmaC224eS2SNMQpTXT
         62+YhIRm44EEEEgM/2pX+/ArlxTEwOgBDEhvLO80oQ6qyfCkt1wq5uxhUqX9B9W52RSG
         MaSnIeeg5nnOwLPe5S3aMSA4BAyvXpk0Y7odq/yZo0qLs2HEmwWOWCaoXzF9OAEvLWhh
         MFgg==
X-Gm-Message-State: AC+VfDw91lJRD0BDZ0LNEYn0PECTR3rbzISFrmxQXZMGF6whpf930HQ+
	IKSfGzBxVhnTEy+0sa8lZ7I3arvc5hzDLDIVU5aoThgax+6pw1QIeFm7++yAHHL/atY7H0bcMA7
	SR9rmuHQuLpu8ig0DYHZWkWtI
X-Received: by 2002:a17:907:7d8e:b0:94f:19b5:bafd with SMTP id oz14-20020a1709077d8e00b0094f19b5bafdmr12929592ejc.42.1683625353673;
        Tue, 09 May 2023 02:42:33 -0700 (PDT)
X-Received: by 2002:a17:907:7d8e:b0:94f:19b5:bafd with SMTP id oz14-20020a1709077d8e00b0094f19b5bafdmr12929573ejc.42.1683625353292;
        Tue, 09 May 2023 02:42:33 -0700 (PDT)
Return-Path: <pbonzini@redhat.com>
Received: from ?IPV6:2001:b07:6468:f312:9af8:e5f5:7516:fa89? ([2001:b07:6468:f312:9af8:e5f5:7516:fa89])
        by smtp.googlemail.com with ESMTPSA id z6-20020a17090665c600b00968382ebf40sm1100404ejn.40.2023.05.09.02.42.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 May 2023 02:42:32 -0700 (PDT)
Message-ID: <c4545a92-8e37-a916-9f1e-ef537dcb1e06@redhat.com>
Date: Tue, 9 May 2023 11:42:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH 05/22] hw/arm: Select VIRTIO_NET for virt machine
To: Peter Maydell <peter.maydell@linaro.org>
Cc: Fabiano Rosas <farosas@suse.de>, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>, qemu-devel <qemu-devel@nongnu.org>,
 Laurent Vivier <lvivier@redhat.com>, Artyom Tarasenko <atar4qemu@gmail.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Leif Lindholm <quic_llindhol@quicinc.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Helge Deller <deller@gmx.de>,
 Xiaojuan Yang <yangxiaojuan@loongson.cn>,
 Stefan Hajnoczi <stefanha@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>, Juan Quintela <quintela@redhat.com>,
 John Snow <jsnow@redhat.com>, Yoshinori Sato <ysato@users.sourceforge.jp>,
 =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 Ilya Leoshkevich <iii@linux.ibm.com>,
 Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>, Andrew Jeffery
 <andrew@aj.id.au>, qemu-s390x <qemu-s390x@nongnu.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 qemu-arm <qemu-arm@nongnu.org>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Beraldo Leal <bleal@redhat.com>, Max Filippov <jcmvbkbc@gmail.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Radoslaw Biernacki
 <rad@semihalf.com>, Aurelien Jarno <aurelien@aurel32.net>,
 David Hildenbrand <david@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Song Gao <gaosong@loongson.cn>, Joel Stanley <joel@jms.id.au>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
References: <20230503091244.1450613-1-alex.bennee@linaro.org>
 <20230503091244.1450613-6-alex.bennee@linaro.org>
 <531a2eab-f0e6-46a5-c021-c82746c1ae38@redhat.com> <87y1m5s9yl.fsf@linaro.org>
 <5fb214d8-4a54-f896-f23f-fe9e646e4b2d@redhat.com>
 <CAFEAcA-Cfz8CkNeTQodoSitocBmm4ddk25Dq8x=5FiiGvaS34Q@mail.gmail.com>
 <e7185f74-f041-05b1-0f76-bab6d724e796@redhat.com> <878re4cl1u.fsf@suse.de>
 <CABgObfYYFfGk2X6M5MxbEbVqCYOp1Km53xkTNrfHwkK=aZOpyw@mail.gmail.com>
 <CAFEAcA91kfdgP3GD8OzgpePX6yXxsLZgARfsNhjY8WyEtKwUuA@mail.gmail.com>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <CAFEAcA91kfdgP3GD8OzgpePX6yXxsLZgARfsNhjY8WyEtKwUuA@mail.gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TUID: A6h+fmw+bIvN

On 5/9/23 11:27, Peter Maydell wrote:
> On Mon, 8 May 2023 at 23:24, Paolo Bonzini <pbonzini@redhat.com> wrote:
>> --without-default-devices is not about choosing to not build
>> some devices; it is about making non-selected devices opt-in
>> rather than opt-out.
> 
> Hmm, so it's basically "the person doing the configuration needs
> to know what they're doing, the Kconfig system will give them
> no hints about what devices might or might not be needed to
> make machine type M functional" ?

It depends on what you mean by functional.  I would say you do get what 
is needed to have a functional machine, but not what is needed to have a 
useful machine.

But typically the latter is the easier of the two, because you should 
have an idea of what -devices are useful *to you*.

Paolo
