Received: by 2002:a17:906:14cc:b0:9b2:89ee:1eb8 with SMTP id y12csp518824ejc;
        Thu, 5 Oct 2023 11:56:41 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE/dAIllMxWwJGJeHH1mrgcZVyObWvxD0xpZyjeBs2Rel4vMOxELXiO7Bli+DDT8CJpdCPK
X-Received: by 2002:a05:620a:4622:b0:76f:1ead:ddb9 with SMTP id br34-20020a05620a462200b0076f1eadddb9mr7358101qkb.51.1696532201247;
        Thu, 05 Oct 2023 11:56:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1696532201; cv=none;
        d=google.com; s=arc-20160816;
        b=x+/lwP/6fhPK5ea8cnmq72vkWeF/01nM/4vAzthjFJoLArLzM9r1ReHymgDzz60FGe
         kixu/pqA6VufVSKm6asmjcX8OvmtLq8x+syg2UHyKsKzmwMQsbtbDW6U7FxOtJGI0c4o
         5ndGu7lvX/FjdcLMVV5ci36tVROG5DktsBn3YkETox5MRkmRYiLl4EogotwfOxy8yQKf
         XXJ147HIXKkEc03YB7jdwlaJi/U6h0hGcRqctulO6ytUNzNSuPFL9f+H+ngQ6aCunFAn
         fbm/ayRC3gVj07+uC69Q52BCjglRj8JooQpIwJNWxHgOXVYuC08CMUGOTzStAp2PWC4A
         zEng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=user-agent:in-reply-to:content-transfer-encoding
         :content-disposition:mime-version:references:message-id:subject:cc
         :to:from:date:dkim-signature;
        bh=J0fO46ECHysOq4m3Ye+P6l8Lk6TABCFWmkDdrQNga3g=;
        fh=qxcIe+tFWvJ+i+FtrBHyvjWbmIvanBXERFJcTOLJkZA=;
        b=VNNKbIQR+u2g/KuafmtmdqWRw8kvhhL348vq+MMHUZ+gV8ZurwIJ5ElyBSZ65fFC3U
         zyh0NSffLwWAioJfJM1SroVqFD05khDXsLWN0m0S/Tm0kEvFrkbKJ6ekaRkBzzd5zTTT
         uDxPTFp9TU0C7ARuWgpWVMcqnA+88Isaj2EITRizNnDhEkYfYHxDObT21Uz0qA3pBaqX
         5uIU0CxnO/HZHOAWHC2xe2TGiRKRzy9h7CGdIY4kyK5XFK2CivgOqgvyLO7tzeMgtbiJ
         SGhaS89chQRVkV/M1bjTopBonEKQ3CSGKXrfF55PsKUbNkOA8vj8P8VCI0HvxVTiAtIW
         QJbw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=a0epBO1H;
       spf=pass (google.com: domain of eblake@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=eblake@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <eblake@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id u15-20020a05620a022f00b0076ee90878a9si1243062qkm.594.2023.10.05.11.56.41
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Oct 2023 11:56:41 -0700 (PDT)
Received-SPF: pass (google.com: domain of eblake@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=a0epBO1H;
       spf=pass (google.com: domain of eblake@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=eblake@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1696532200;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=J0fO46ECHysOq4m3Ye+P6l8Lk6TABCFWmkDdrQNga3g=;
	b=a0epBO1HKghPzRHEs5YmuAeUMn8FQAGe5AXYj1ogjI1lPeJh9gTef9gcKBMSYBws5uSmVf
	ROPpyiD+pyDeOJRC27S4CXZS53IuVCvwqSUFHBzXYOai2wm7pvZkMl8KVGcfH3WBGZrsT+
	VOvgMZoi83Hn+WOseV3kxoFGRDbkYsk=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-592-WR8VayRUMwmKDrE7lNtWJw-1; Thu, 05 Oct 2023 14:56:37 -0400
X-MC-Unique: WR8VayRUMwmKDrE7lNtWJw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com [10.11.54.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E1A1E811E86;
	Thu,  5 Oct 2023 18:56:36 +0000 (UTC)
Received: from redhat.com (unknown [10.2.16.63])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 005EF215670B;
	Thu,  5 Oct 2023 18:56:34 +0000 (UTC)
Date: Thu, 5 Oct 2023 13:56:33 -0500
From: Eric Blake <eblake@redhat.com>
To: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
Cc: qemu-block@nongnu.org, qemu-devel@nongnu.org, jsnow@redhat.com, 
	crosa@redhat.com, kwolf@redhat.com, hreitz@redhat.com, 
	Daniel P =?utf-8?B?LiBCZXJyYW5nw6k=?= <berrange@redhat.com>, Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>, 
	Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>, Thomas Huth <thuth@redhat.com>, 
	Wainer dos Santos Moschetta <wainersm@redhat.com>, Beraldo Leal <bleal@redhat.com>, 
	Peter Maydell <peter.maydell@linaro.org>, Aurelien Jarno <aurelien@aurel32.net>, 
	Halil Pasic <pasic@linux.ibm.com>, Christian Borntraeger <borntraeger@linux.ibm.com>, 
	Eric Farman <farman@linux.ibm.com>, Juan Quintela <quintela@redhat.com>, 
	Peter Xu <peterx@redhat.com>, Fabiano Rosas <farosas@suse.de>, 
	Leonardo Bras <leobras@redhat.com>, "open list:Integrator CP" <qemu-arm@nongnu.org>, 
	"open list:S390 Virtio-ccw" <qemu-s390x@nongnu.org>
Subject: Re: [PATCH v6 05/14] python/qemu: rename command() to cmd()
Message-ID: <huzq7ffxyvfdfceulpuz2wna5wubxtbjdxmrlkaztczjjmv6yn@tkwin4kqvms5>
References: <20231005135550.331657-1-vsementsov@yandex-team.ru>
 <20231005135550.331657-6-vsementsov@yandex-team.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20231005135550.331657-6-vsementsov@yandex-team.ru>
User-Agent: NeoMutt/20230517
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
X-TUID: qyyGlSmyQux6

On Thu, Oct 05, 2023 at 04:55:41PM +0300, Vladimir Sementsov-Ogievskiy wrote:
> Use a shorter name. We are going to move in iotests from qmp() to
> command() where possible. But command() is longer than qmp() and don't
> look better. Let's rename.
> 
> You can simply grep for '\.command(' and for 'def command(' to check
> that everything is updated (command() in tests/docker/docker.py is
> unrelated).
> 
> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
> Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
> ---
>  docs/devel/testing.rst                    |  10 +-

There's a risk that this will need rebasing on top of any other test
changes being made in parallel; hopefully we can get this series in
sooner rather than later.

Reviewed-by: Eric Blake <eblake@redhat.com>

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.
Virtualization:  qemu.org | libguestfs.org
