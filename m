Received: by 2002:a19:e20e:0:0:0:0:0 with SMTP id z14csp32049lfg;
        Wed, 5 May 2021 00:07:57 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzEA/DIJbPV+1SFxpy5OiPZUWb/IQqvzKMC6U2uzQmQvhpoxpTqr0jJuup46cVGSLWvnout
X-Received: by 2002:a17:907:1b11:: with SMTP id mp17mr26202219ejc.1.1620198477480;
        Wed, 05 May 2021 00:07:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1620198477; cv=none;
        d=google.com; s=arc-20160816;
        b=eBiEwQ0Rif8NypKytFJneVQZd65+FFzlAi1sdRdDkZIuvPwLUzLURJgUW2v5Cz3Hy9
         Z6Q4Jy4tODdjNrF+dMYMwEQvy5ERMAmaLMmcdcKC14cvg4O8pncsFVxcCzaFc5gkmfZ3
         v8dXjfVw9wP0SSf3gLzyFj1IcChcnZEfR5mWCscZsW11/ZN5DQRIwOvDGYpxGM2PdatT
         bNyOB4I7WJFufb7URZrQLtYGkdufvdKUdWNDVMHcE4FC3YBgQpaxrFOcZGSVFErvsxNZ
         u6Edhl9tO/x/ymWCclDR/GPWzPxFrXsQtFIt0l9jMfBUW3OMZOPQHKySerpHth990iW0
         d8eg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:user-agent:message-id
         :in-reply-to:date:references:subject:cc:to:from:dkim-signature;
        bh=eTpLyIhDwYuICaVzKPOcBF+ue89WeeJqefHx0UT2uLg=;
        b=AyeqPeKmPZamI242CukvLJUgttawb+PCympEJ1DR+lnUDYif9oSceIxM5rJOk9HmP1
         TbRWj5YSSxgvElLs6oK3GTEMz9CR8PW7Rqi//iaN+6+E38r63tllpTXohwQATjgTNhaJ
         M4JoK3Cr4P9kCv8vOHxdxkfW8FKVkZcLzseMeqoIcHNFrUG3rpJeMqIfaKE9RA8/QKLM
         FZJS3BVuHOb2KwnKQr9A5Gev23Z5AClsgjjYYLZdhvdEdYaWD3h+KCVlDqHY/SVYygHn
         y7b/z7FEMe3GCxskesF5LWUWQMdAfqa0PMWYgLTRAlw0Rt2tR3V+2E6xVnGbSJhFttLs
         fYew==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=E7xih+Bm;
       spf=pass (google.com: domain of armbru@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=armbru@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <armbru@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id lj17si4561945ejb.535.2021.05.05.00.07.57
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 05 May 2021 00:07:57 -0700 (PDT)
Received-SPF: pass (google.com: domain of armbru@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=E7xih+Bm;
       spf=pass (google.com: domain of armbru@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=armbru@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1620198476;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=eTpLyIhDwYuICaVzKPOcBF+ue89WeeJqefHx0UT2uLg=;
	b=E7xih+BmeGxkDL5uFSl2DJI7DlPfa4USFg/yeSt1sz+br46/yp5d/p742l+Q2CR9B27lRc
	eX+T+F/y1zW1BfmjaU8DMSJxtSISpt/4D8ACzreeLkm+jq6yvx/iJUZeaE7jXHnkPkc9pn
	s3FYNYofF3D0/iqRQs2FXN/4bQOeXyo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-148-xL1GAqDbMw--cREhl1m_yw-1; Wed, 05 May 2021 03:07:54 -0400
X-MC-Unique: xL1GAqDbMw--cREhl1m_yw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CE4361926DA1;
	Wed,  5 May 2021 07:07:53 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-114-17.ams2.redhat.com [10.36.114.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 88C935D6D1;
	Wed,  5 May 2021 07:07:53 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
	id 038791138529; Wed,  5 May 2021 09:07:52 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Cc: qemu-devel@nongnu.org,  Andrew Jones <drjones@redhat.com>,  Eduardo
 Habkost <ehabkost@redhat.com>,  Juan Quintela <quintela@redhat.com>,
  Richard Henderson <richard.henderson@linaro.org>,  Thomas Huth
 <thuth@redhat.com>,  "Dr. David Alan Gilbert" <dgilbert@redhat.com>,  Alex
 =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,  qemu-arm@nongnu.org,
  Claudio Fontana
 <cfontana@suse.de>,  Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH v5 02/10] accel: Introduce 'query-accels' QMP command
References: <20210501223638.510712-1-philmd@redhat.com>
	<20210501223638.510712-3-philmd@redhat.com>
Date: Wed, 05 May 2021 09:07:51 +0200
In-Reply-To: <20210501223638.510712-3-philmd@redhat.com> ("Philippe
	=?utf-8?Q?Mathieu-Daud=C3=A9=22's?= message of "Sun, 2 May 2021 00:36:30
 +0200")
Message-ID: <87o8dpvet4.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: dEWyrPEXsW0T

Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com> writes:

> Introduce the 'query-accels' QMP command which returns a list
> of built-in accelerator names.
>
> - Accelerator is a QAPI enum of all existing accelerators,
>
> - AcceleratorInfo is a QAPI structure providing accelerator
>   specific information. Currently the common structure base
>   provides the name of the accelerator, while the specific
>   part is empty, but each accelerator can expand it.
>
> - 'query-accels' QMP command returns a list of @AcceleratorInfo
>
> For example on a KVM-only build we get:
>
>     { "execute": "query-accels" }
>     {
>         "return": [
>             {
>                 "name": "qtest"
>             },
>             {
>                 "name": "kvm"
>             }
>         ]
>     }
>
> Note that we can't make the enum values or union branches conditional
> because of target-specific poisoning of accelerator definitions.

Let me try to complete this argument;

  If we did, enum Accelerator could only be used in target-specific
  code.  But we want to use it in generic code, too.

Which generic code exactly?

> Reviewed-by: Eric Blake <eblake@redhat.com>
> Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> Tested-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>

Patch looks good to me.
