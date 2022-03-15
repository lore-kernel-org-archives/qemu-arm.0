Received: by 2002:a05:6512:204:0:0:0:0 with SMTP id a4csp2723234lfo;
        Tue, 15 Mar 2022 02:08:01 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyBAZYafeQKLz6jfoc/K0dlAJ7tgNBqtZ6kAlYp6RvwBXbY8+r6NqQBBohsRvjtMwdjUtTD
X-Received: by 2002:a17:906:2ad5:b0:6cf:9cca:d9db with SMTP id m21-20020a1709062ad500b006cf9ccad9dbmr21283101eje.252.1647335281296;
        Tue, 15 Mar 2022 02:08:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1647335281; cv=none;
        d=google.com; s=arc-20160816;
        b=rDqEYQQlgJieSomujzPXo58mEbaKfHyYjxgrHBUsC6zvGlHWbhjPvSB8MX44zdESxv
         /gGn9fSrppEXPzqerkWLkEC83aYXJsmZpfX0yuvXwPJughsEWZ0OV/UHK3tesj9prYJw
         68zaG7jCcm4+UWFdIn1wuzzKuHg8qu0Qg9oYiSIu5axv/hOQwl10d5j6WtGCDGxY7omN
         Ee4/D4yyXljlzVrA76qaXtfbzExAQqFobp3dKkczbvzn/a1/TU6eqW6gUvxWl/HmJuH2
         qp7IEIFVh5rdYSobLSp3YmeMWbjRFijZiBuEGrwK0QjIKRBZYOr4kFY4SAbwRyJr02vd
         QVvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:dkim-signature;
        bh=x2QdncLjS9RyVOy6Iatqoky3XG297fiHr6QRUqmYbXw=;
        b=KN0R6rs6XIzoS7PEObJSoVquGveTAwIrmmNlSRZZAnIspkY+I5Awm8+aOiVMuv0S6Z
         6NRVP4mmsfKi37xo5Q335SZ5erxgExXSg8kZR26bY0+Y5qKWRIhw7V14ZHZ41vbNnoHA
         xwB5OTRLycesSv8dXuroRl2If5itxzvhzqqtOJkoWDvRHjUgQUXUXCmIlJ+OYhmQL0JQ
         Bc+8ocXeYJUOtAGXFT1kqBsrkcsWGA9mv1G0NJAi5ld14pqHAOm/Ae/3atozF3z34F10
         PmJs9OoBY5/oH7wa7X0uB0F7RAnyRfA/F/L7SV554toTP89mXh5kT8j+HAFIKpjaSlws
         5hCQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=i6zaMYfV;
       spf=pass (google.com: domain of eblake@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=eblake@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <eblake@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id b16-20020aa7cd10000000b00418d547ddcdsi158037edw.356.2022.03.15.02.08.00
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 15 Mar 2022 02:08:01 -0700 (PDT)
Received-SPF: pass (google.com: domain of eblake@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=i6zaMYfV;
       spf=pass (google.com: domain of eblake@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=eblake@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1647335280;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=x2QdncLjS9RyVOy6Iatqoky3XG297fiHr6QRUqmYbXw=;
	b=i6zaMYfVvOYLgg8pBXl5ABhkHzJVhuWK9bIAnkzG4OE7yATYB+Y+uz2cQSDFGoGon/egnO
	HNQ4WhA4CtvH3r0dluV4kgLmj9qjynW89++TmzZh8UiGa+19Yj99l3pgiFe6tly7ANKxKY
	Nogl5mmB1jO6QjBJG0koaLK1Qwd3YAw=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-398-licyuROAPcScV15uQzTVhQ-1; Tue, 15 Mar 2022 05:07:58 -0400
X-MC-Unique: licyuROAPcScV15uQzTVhQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com [10.11.54.2])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C84D0803B22;
	Tue, 15 Mar 2022 09:07:56 +0000 (UTC)
Received: from redhat.com (unknown [10.22.17.185])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9478240C128B;
	Tue, 15 Mar 2022 09:07:50 +0000 (UTC)
Date: Tue, 15 Mar 2022 04:07:48 -0500
From: Eric Blake <eblake@redhat.com>
To: Markus Armbruster <armbru@redhat.com>
Cc: qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Gerd Hoffmann <kraxel@redhat.com>,
	Christian Schoenebeck <qemu_oss@crudebyte.com>,
	"Gonglei (Arei)" <arei.gonglei@huawei.com>,
	=?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Igor Mammedov <imammedo@redhat.com>, Ani Sinha <ani@anisinha.ca>,
	Laurent Vivier <lvivier@redhat.com>, Amit Shah <amit@kernel.org>,
	Peter Maydell <peter.maydell@linaro.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Anthony Perard <anthony.perard@citrix.com>,
	Paul Durrant <paul@xen.org>,
	=?utf-8?B?SGVydsOp?= Poussineau <hpoussin@reactos.org>,
	Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
	Corey Minyard <cminyard@mvista.com>,
	Patrick Venture <venture@google.com>,
	Eduardo Habkost <eduardo@habkost.net>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Peter Xu <peterx@redhat.com>, Jason Wang <jasowang@redhat.com>,
	=?utf-8?Q?C=C3=A9dric?= Le Goater <clg@kaod.org>,
	Daniel Henrique Barboza <danielhb413@gmail.com>,
	David Gibson <david@gibson.dropbear.id.au>,
	Greg Kurz <groug@kaod.org>,
	Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	Jean-Christophe Dubois <jcd@tribudubois.net>,
	Keith Busch <kbusch@kernel.org>, Klaus Jensen <its@irrelevant.dk>,
	Yuval Shaia <yuval.shaia.ml@gmail.com>,
	Yoshinori Sato <ysato@users.sourceforge.jp>,
	Magnus Damm <magnus.damm@gmail.com>,
	Fabien Chouteau <chouteau@adacore.com>,
	KONRAD Frederic <frederic.konrad@adacore.com>,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
	Artyom Tarasenko <atar4qemu@gmail.com>,
	Alex Williamson <alex.williamson@redhat.com>,
	Eric Auger <eric.auger@redhat.com>,
	Max Filippov <jcmvbkbc@gmail.com>,
	Juan Quintela <quintela@redhat.com>,
	"Dr. David Alan Gilbert" <dgilbert@redhat.com>,
	Konstantin Kostiuk <kkostiuk@redhat.com>,
	Michael Roth <michael.roth@amd.com>,
	Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>,
	Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>,
	Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
	David Hildenbrand <david@redhat.com>,
	Wenchao Wang <wenchao.wang@intel.com>,
	Colin Xu <colin.xu@intel.com>, Kamil Rytarowski <kamil@netbsd.org>,
	Reinoud Zandijk <reinoud@netbsd.org>,
	Sunil Muthuswamy <sunilmut@microsoft.com>,
	Cornelia Huck <cohuck@redhat.com>, Thomas Huth <thuth@redhat.com>,
	Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
	John Snow <jsnow@redhat.com>, kvm@vger.kernel.org,
	qemu-arm@nongnu.org, xen-devel@lists.xenproject.org,
	qemu-ppc@nongnu.org, qemu-block@nongnu.org, haxm-team@intel.com,
	qemu-s390x@nongnu.org
Subject: Re: [PATCH 3/3] Use g_new() & friends where that makes obvious sense
Message-ID: <20220315090748.acju5mjbe4tax272@redhat.com>
References: <20220314160108.1440470-1-armbru@redhat.com>
 <20220314160108.1440470-4-armbru@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220314160108.1440470-4-armbru@redhat.com>
User-Agent: NeoMutt/20211029-427-23b03a
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
X-TUID: FFenAxQOyvk+

On Mon, Mar 14, 2022 at 05:01:08PM +0100, Markus Armbruster wrote:
> g_new(T, n) is neater than g_malloc(sizeof(T) * n).  It's also safer,
> for two reasons.  One, it catches multiplication overflowing size_t.
> Two, it returns T * rather than void *, which lets the compiler catch
> more type errors.
> 
> This commit only touches allocations with size arguments of the form
> sizeof(T).
> 
> Patch created mechanically with:
> 
>     $ spatch --in-place --sp-file scripts/coccinelle/use-g_new-etc.cocci \
> 	     --macro-file scripts/cocci-macro-file.h FILES...
> 
> Signed-off-by: Markus Armbruster <armbru@redhat.com>
> ---

I agree that this is mechanical, but...

<snip>
>  qga/commands-win32.c                     |  8 ++---
>  qga/commands.c                           |  2 +-
>  qom/qom-qmp-cmds.c                       |  2 +-
>  replay/replay-char.c                     |  4 +--
>  replay/replay-events.c                   | 10 +++---
>  scripts/coverity-scan/model.c            |  2 +-

...are we sure we want to touch this particular file?

> diff --git a/scripts/coverity-scan/model.c b/scripts/coverity-scan/model.c
> index 9d4fba53d9..30bea672e1 100644
> --- a/scripts/coverity-scan/model.c
> +++ b/scripts/coverity-scan/model.c
> @@ -356,7 +356,7 @@ int g_poll (GPollFD *fds, unsigned nfds, int timeout)
>  typedef struct _GIOChannel GIOChannel;
>  GIOChannel *g_io_channel_unix_new(int fd)
>  {
> -    GIOChannel *c = g_malloc0(sizeof(GIOChannel));
> +    GIOChannel *c = g_new0(GIOChannel, 1);
>      __coverity_escape__(fd);
>      return c;
>  }

Our model has a definition of g_malloc0(), but I'm not sure whether
Coverity picks up the macro g_new0() in the same manner.

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org
