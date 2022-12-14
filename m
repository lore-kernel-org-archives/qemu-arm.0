Received: by 2002:a17:906:a84b:b0:7c1:2a22:dc39 with SMTP id dx11csp486327ejb;
        Wed, 14 Dec 2022 06:30:17 -0800 (PST)
X-Google-Smtp-Source: AA0mqf5ZshcgPX0P4mqQUY5vTfCca0NWLmc2BAl9tDRqqhF3BxMLQAtF4BgD1f7daQfsaSsHnNPD
X-Received: by 2002:a0c:a69a:0:b0:4bb:6b75:bf98 with SMTP id t26-20020a0ca69a000000b004bb6b75bf98mr28216401qva.31.1671028216860;
        Wed, 14 Dec 2022 06:30:16 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1671028216; cv=none;
        d=google.com; s=arc-20160816;
        b=JGOPvlh2KSBHNxgLUytLUurseot8YxbPSDXH+WaqYLS60CkHDCnCz7LRDLELrtuWts
         7yNJi+FoOQ57X9+2r9bA0EOxCpgEI7x7JiCvtXmYXmYKn66JpV2/kMRI1V/r0cLy/Tgw
         uxhzA32l+OhsAamQq7m3v+UQRaL1yO4Ni3sCw1HTsaDjukeRPTB0Z9r9YgXYUZLjnT1r
         TMy6TEVhqiXM26WfyCs2tJKgwvG7BXyAqccx0r/VUZ5jPxlHgOgjv8hNl01OKqTZaown
         ia42qR5xFd9XQeh0lHnr6gVbqDfuO0LdPMlgA8I1Hi62t/OpDijFIUJ+wFNmtM6kJwCb
         woZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:message-id:date:user-agent:references:organization
         :in-reply-to:subject:cc:to:from:dkim-signature;
        bh=PeHbrQMOzoHlYATkut7MsyIGzVE2Lr3uqBc4rAw21uI=;
        b=skk7dIucpcCG+XqV5Bz2VN24pXQeN9rUJuPTk4FkWthsO9IIH1Bt1hdKntmzA/qMUp
         pQQV3zb5avl1ZVRyjijZuvuTU+bKxQKTEo6CLbYak6BRPCZ1NfHxhFTk78uX8r6DT0p5
         vxyhdU6mPQ+K7S9SBNSQ8InQNQF3g2wdcOw2n5rkz8FaE2SrlULety6GNg602bKL4JZg
         bvFKO0qExmb8izTOrY0PQ5W//7338Fv3YgXnRlXqlJhIPFCHe/lUVLCQWZP+aN9W10kf
         4o7uC+Hjyl+YoN/IpTRkT7Ozk/VMyO3qHqpgz9d6LLJGePNu659/hCklgwn/OpwHt9/5
         ItYA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=HzQovLA1;
       spf=pass (google.com: domain of cohuck@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=cohuck@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <cohuck@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id gm2-20020a056214268200b004c690c44449si9635198qvb.187.2022.12.14.06.30.16
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Dec 2022 06:30:16 -0800 (PST)
Received-SPF: pass (google.com: domain of cohuck@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=HzQovLA1;
       spf=pass (google.com: domain of cohuck@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=cohuck@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1671028216;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=PeHbrQMOzoHlYATkut7MsyIGzVE2Lr3uqBc4rAw21uI=;
	b=HzQovLA1JUjsGJZdv9yHnum2/QeQxV6ErF4SdEAx0jobOg2c9wsTKLwuQGL9tRFuZo2ap3
	OpGnOrBZUTs7juGMG6WYNLhQ0Xe9bMcpmBtiPVbfm0O26wctr53gRTcvkcIFzmgTIv7DsM
	HQ+9kd9qPsVzXig2wkeHmHTeEyygHDU=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-299-Q3fg9tkCOhqZJQLoPKvHtA-1; Wed, 14 Dec 2022 09:30:12 -0500
X-MC-Unique: Q3fg9tkCOhqZJQLoPKvHtA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com [10.11.54.3])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id CCD278E1FD0;
	Wed, 14 Dec 2022 14:30:08 +0000 (UTC)
Received: from localhost (unknown [10.39.193.110])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 394D11121314;
	Wed, 14 Dec 2022 14:30:08 +0000 (UTC)
From: Cornelia Huck <cohuck@redhat.com>
To: Fabiano Rosas <farosas@suse.de>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>, Philippe
 =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>, Richard Henderson
 <richard.henderson@linaro.org>, Alex =?utf-8?Q?Benn=C3=A9e?=
 <alex.bennee@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Roman Bolshakov
 <r.bolshakov@yadro.com>, Claudio Fontana <cfontana@suse.de>, Eduardo
 Habkost <eduardo@habkost.net>
Subject: Re: [PATCH 0/6] target/arm: general cleanups
In-Reply-To: <20221213190537.511-1-farosas@suse.de>
Organization: Red Hat GmbH
References: <20221213190537.511-1-farosas@suse.de>
User-Agent: Notmuch/0.37 (https://notmuchmail.org)
Date: Wed, 14 Dec 2022 15:30:04 +0100
Message-ID: <87wn6u9hxv.fsf@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
X-TUID: HJKmVQPPuXII

On Tue, Dec 13 2022, Fabiano Rosas <farosas@suse.de> wrote:

> Hi folks,
>
> I'm splitting this big series from Claudio from last year into more
> manageable chunks (at least for me):
>
> https://lore.kernel.org/r/20210416162824.25131-1-cfontana@suse.de
>
> This is the first chunk with only the most trivial patches that make
> sense even without the kvm/tcg and sysemu/user splits.
>
> Claudio Fontana (1):
>   target/arm: cleanup cpu includes
>
> Fabiano Rosas (5):
>   target/arm: Fix checkpatch comment style warnings in helper.c
>   target/arm: Fix checkpatch space errors in helper.c
>   target/arm: Fix checkpatch brace errors in helper.c
>   target/arm: Remove unused includes from m_helper.c
>   target/arm: Remove unused includes from helper.c
>
>  target/arm/cpu.c      |   1 -
>  target/arm/cpu64.c    |   6 -
>  target/arm/helper.c   | 439 ++++++++++++++++++++++++++----------------
>  target/arm/m_helper.c |  16 --
>  4 files changed, 278 insertions(+), 184 deletions(-)

For the series

Reviewed-by: Cornelia Huck <cohuck@redhat.com>
