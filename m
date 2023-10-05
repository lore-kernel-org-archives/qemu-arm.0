Received: by 2002:a17:906:14cc:b0:9b2:89ee:1eb8 with SMTP id y12csp337384ejc;
        Thu, 5 Oct 2023 07:05:56 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG4SJ1sK3o8yV1ypi9ORY9Z0vWtfG7Ex6U3yoL17FryMpfdcc/uIzmHiqSpRHBEvpNxD9oM
X-Received: by 2002:a05:6358:71c:b0:150:8ba9:4d with SMTP id e28-20020a056358071c00b001508ba9004dmr5045226rwj.3.1696514755968;
        Thu, 05 Oct 2023 07:05:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1696514755; cv=none;
        d=google.com; s=arc-20160816;
        b=t2r8Qjd3oGx+IXn0mQXtRpJLcB54lNHA3KMCyHu2OGmWPlfDJsmq6txaHJh7UCfOLv
         aS6myOSNG5qR1ZHg5hCB3W4IZuCwfEODhNCCrHQqJMrKEQe2jc0Oy73juF1MuMQv3DaI
         dBYZBPH5AWOmBKQ81civ9AzMi+6UND0v72QHduxmgFr9FjFZPcdheZKelBWRTJpaKUg4
         54Kt5eVZNuxEu+OsgrhXqwTzlnOJk+IZ4Bt2t+NXxtnrEgC/BXYd/mrht1c/ve8yKwKb
         OhIPpZVMCoJWAx8b1RKRUT4q9vyAplzMdxcN8fnTKDJgmBPbu8do/j9bH7J2ACUsdQiS
         wd4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:dkim-signature;
        bh=yknJkCwR0b+emy/Wf/qMM6fTnIcbO/vojHGvb1RvAow=;
        fh=mdA2j3gql5s/+iiBsLEaII3z4KFuvj9rboRytfvtYug=;
        b=LoucqOGK5ed6WvWxW1R+YPRv/MADpAguhFebklx+/8OOsU9osKlfyXYsoDtVkcEMYf
         X37a5AgjAAEBFdzNqx7TVsgnar+4vtieYbFS8oqK03YDGXNOjz4JykdOUdGfAiV0iT6R
         IQRTq4lvK2mvLG1fubOxwz0IZpkDRcRUXWtRFl0syF3rvA3p4Zc5TtCl8jFTi2+B33GV
         iSD8YFJOYr0zl3CKi7W6O2V4GdIQzptY4cm4L2F235yKK3xcq4/E+7wXK5ifoIOioOeS
         yDFVSzeGluBLKYNH2fh1vKixGmddTS5Zk31jjNxXyIZgXvcCD7zuwnGR9/cGDUMb1rwt
         dtEQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=bTxgtyaN;
       spf=pass (google.com: domain of eblake@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=eblake@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <eblake@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id j7-20020a05622a038700b004180ac7c98bsi977132qtx.20.2023.10.05.07.05.55
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Oct 2023 07:05:55 -0700 (PDT)
Received-SPF: pass (google.com: domain of eblake@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=bTxgtyaN;
       spf=pass (google.com: domain of eblake@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=eblake@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1696514755;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=yknJkCwR0b+emy/Wf/qMM6fTnIcbO/vojHGvb1RvAow=;
	b=bTxgtyaN72jIEB0K27h3JoGR/yRtNjDebGHOOlH2TdvPrOfqwBYheAme/pKOs8T6KW8ob5
	Pz+wmQrRvL2ag5O7lvg3ZX85RsxEgiNZHXL0g/ykJHbhqQwALxr9NkrGcVLSG1QwmhF9Za
	hsAnpLfsEsKW5kUWzc5tf925nKJi4WY=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-397-k8iY5kUxMlqXBBzfJ7WoJQ-1; Thu, 05 Oct 2023 10:05:51 -0400
X-MC-Unique: k8iY5kUxMlqXBBzfJ7WoJQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com [10.11.54.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 23EAD2810D4A;
	Thu,  5 Oct 2023 14:05:51 +0000 (UTC)
Received: from redhat.com (unknown [10.2.16.63])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 3778040C2015;
	Thu,  5 Oct 2023 14:05:49 +0000 (UTC)
Date: Thu, 5 Oct 2023 09:05:47 -0500
From: Eric Blake <eblake@redhat.com>
To: John Snow <jsnow@redhat.com>
Cc: qemu-devel@nongnu.org, 
	Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>, =?utf-8?Q?C=C3=A9dric?= Le Goater <clg@kaod.org>, 
	Wainer dos Santos Moschetta <wainersm@redhat.com>, Kevin Wolf <kwolf@redhat.com>, Andrew Jeffery <andrew@aj.id.au>, 
	Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>, Cleber Rosa <crosa@redhat.com>, 
	Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org, Joel Stanley <joel@jms.id.au>, 
	qemu-block@nongnu.org, Beraldo Leal <bleal@redhat.com>, 
	Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>, Hanna Reitz <hreitz@redhat.com>, 
	"Michael S. Tsirkin" <mst@redhat.com>, Vladimir Sementsov-Ogievskiy <v.sementsov-og@mail.ru>, 
	Thomas Huth <thuth@redhat.com>, Ani Sinha <anisinha@redhat.com>, 
	Eduardo Habkost <eduardo@habkost.net>, Markus Armbruster <armbru@redhat.com>
Subject: Re: [PULL 1/9] Python/iotests: Add type hint for nbd module
Message-ID: <cnpmerggwpvnybezttkrnxmt7xpscxxlc4rglmzijpm4f3onzt@thdoszxqyint>
References: <20231004194613.2900323-1-jsnow@redhat.com>
 <20231004194613.2900323-2-jsnow@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231004194613.2900323-2-jsnow@redhat.com>
User-Agent: NeoMutt/20230517
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
X-TUID: WGcYsCDlS/m2

On Wed, Oct 04, 2023 at 03:46:05PM -0400, John Snow wrote:
> The test bails gracefully if this module isn't installed, but linters
> need a little help understanding that. It's enough to just declare the
> type in this case.
> 
> (Fixes pylint complaining about use of an uninitialized variable because
> it isn't wise enough to understand the notrun call is noreturn.)
> 
> Signed-off-by: John Snow <jsnow@redhat.com>
> ---
>  tests/qemu-iotests/tests/nbd-multiconn | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)

Since there's questions about this pull request seeming to be the
first time this patch has appeared on list, I'll go ahead and review
it here on the assumption that a v2 pull request is warranted.

> 
> diff --git a/tests/qemu-iotests/tests/nbd-multiconn b/tests/qemu-iotests/tests/nbd-multiconn
> index 478a1eaba27..7e686a786ea 100755
> --- a/tests/qemu-iotests/tests/nbd-multiconn
> +++ b/tests/qemu-iotests/tests/nbd-multiconn
> @@ -20,6 +20,8 @@
>  
>  import os
>  from contextlib import contextmanager
> +from types import ModuleType
> +
>  import iotests
>  from iotests import qemu_img_create, qemu_io
>  
> @@ -28,7 +30,7 @@ disk = os.path.join(iotests.test_dir, 'disk')
>  size = '4M'
>  nbd_sock = os.path.join(iotests.sock_dir, 'nbd_sock')
>  nbd_uri = 'nbd+unix:///{}?socket=' + nbd_sock
> -
> +nbd: ModuleType

Is it possible to put this closer to the code actually using 'nbd', as
in this region?

| if __name__ == '__main__':
|     try:
|         # Easier to use libnbd than to try and set up parallel
|         # 'qemu-nbd --list' or 'qemu-io' processes, but not all systems
|         # have libnbd installed.
|         import nbd  # type: ignore

but then again, open_nbd() right after your current location utilizes
the variable, so I guess not.  I trust your judgment on silencing the
linters, so whether or not you move it (if moving is even possible),

Reviewed-by: Eric Blake <eblake@redhat.com>

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.
Virtualization:  qemu.org | libguestfs.org
