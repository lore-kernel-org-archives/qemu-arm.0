Received: by 2002:a05:6512:3aa:0:0:0:0 with SMTP id v10csp847569lfp;
        Thu, 23 Jan 2020 08:18:05 -0800 (PST)
X-Google-Smtp-Source: APXvYqwFQGYoJ2D6+qPKGrZ3wtMnZrx4ht4e9KFEdEMkqz2B5N75fnB9M35q7H1cukNUnt8JpYd6
X-Received: by 2002:a50:e88a:: with SMTP id f10mr7453584edn.277.1579796285651;
        Thu, 23 Jan 2020 08:18:05 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1579796285; cv=none;
        d=google.com; s=arc-20160816;
        b=hAWy7D1nC0ySSFIUxXTOl/yFEq0r4I7aSQ0jg2WT/E2fF+sUHeZ6w54qTKKM2I0gA5
         4j/g3MFUP/jmvORpdWcewsV1xLdFfR907EOd8FuMFfnrPp4lKkN8hq6AGuwNGN22EVg6
         UZZyqXEvTseG8E5ssrWIew5EFGtgwI5Cw0ZbbSiw1WA8Cen6TfTETYVKr0iyrIRf0ih/
         WxbYbVaNlnMvq1ddVZKqPlRv3NOiiJhmhRohb4eE7oYvqxJULe8fDCwHaFX6rTKO2ZsB
         b7nY+gCjuGsXFd4lqbKqZo7mH8qmJtRGL/QIC1hWpyLRGipI4uJrKHpQXNB3U6uco7uP
         Y41g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-disposition:content-transfer-encoding:in-reply-to
         :mime-version:references:message-id:subject:cc:to:from:date
         :dkim-signature;
        bh=VKwo6yXRdMFGGFhb6nzWt7c5A0r9Gan3VMFkQ5bI3Ms=;
        b=oD4x2J4xsv0Zvt+1uhe7tpxqGn5bn6FKJNGEaWuGZHww9jWIBDNTUxY86vRKqy6DUL
         46ZaKzbyKJdx1hrAh0nVO3TTB34h890aGlkG1iQOPXbtlPHve30JthkBu0uDpRfSW0Gr
         DnU0OTVoJ/PQ3++GwRWb8Aqznu54sZtlPQXBizH9TUEYlhK+h7x9dmIATSqm2sm8Hd0Z
         rmwwJXKlw1+sBkavGoM1/fy+KfcO3ysES08xrHPyyYvWfgsrIl1IQE+V3DzLi1OBOtWl
         uX7MC7VLracJxYbQF7ZkM1uHqMtPL00xszHiEoQsQRs8K11brr6+NNX+kPvUvUECV1Tn
         xBEA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=H9h8dzF8;
       spf=pass (google.com: domain of drjones@redhat.com designates 207.211.31.81 as permitted sender) smtp.mailfrom=drjones@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <drjones@redhat.com>
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com. [207.211.31.81])
        by mx.google.com with ESMTPS id d14si1429751edv.227.2020.01.23.08.18.05
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 23 Jan 2020 08:18:05 -0800 (PST)
Received-SPF: pass (google.com: domain of drjones@redhat.com designates 207.211.31.81 as permitted sender) client-ip=207.211.31.81;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=H9h8dzF8;
       spf=pass (google.com: domain of drjones@redhat.com designates 207.211.31.81 as permitted sender) smtp.mailfrom=drjones@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1579796284;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=VKwo6yXRdMFGGFhb6nzWt7c5A0r9Gan3VMFkQ5bI3Ms=;
	b=H9h8dzF8Oe74bk2VGv0x0IFRv3hdoTQTLAMnZsNwKSqO2886Vb27NhccodSJ25NDcbbGIL
	8i0wN1SKq1HefmUT6AMzOqov6rD1SIp76jwkXMPY6aCCEyELY0ETUMl5wEAuGHbhNYiW9s
	sd5qI+iXTuPim93BJ/csfq8CeT+iPjk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-35-eaPHjztJMDuXqihKILqsyQ-1; Thu, 23 Jan 2020 11:17:48 -0500
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E009E1005514;
	Thu, 23 Jan 2020 16:17:46 +0000 (UTC)
Received: from kamzik.brq.redhat.com (unknown [10.43.2.160])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id EFB3785753;
	Thu, 23 Jan 2020 16:17:42 +0000 (UTC)
Date: Thu, 23 Jan 2020 17:17:40 +0100
From: Andrew Jones <drjones@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>,
	Richard Henderson <richard.henderson@linaro.org>,
	Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Dave P Martin <Dave.Martin@arm.com>,
	Eric Auger <eric.auger@redhat.com>
Subject: Re: [PATCH REPOST v3] target/arm/arch_dump: Add SVE notes
Message-ID: <20200123161740.dkukm5sy2dvjjdej@kamzik.brq.redhat.com>
References: <20200120101832.18781-1-drjones@redhat.com>
 <CAFEAcA9+amcwA7WGzXxc2Cb_J7-=rxFb6ubk3ZYn-Y+zWoWk4w@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAFEAcA9+amcwA7WGzXxc2Cb_J7-=rxFb6ubk3ZYn-Y+zWoWk4w@mail.gmail.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-MC-Unique: eaPHjztJMDuXqihKILqsyQ-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
X-TUID: HtOOJq322aGN

On Thu, Jan 23, 2020 at 02:53:42PM +0000, Peter Maydell wrote:
> On Mon, 20 Jan 2020 at 10:18, Andrew Jones <drjones@redhat.com> wrote:
> >
> > When dumping a guest with dump-guest-memory also dump the SVE
> > registers if they are in use.
> >
> > Signed-off-by: Andrew Jones <drjones@redhat.com>
> > Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> > ---
> >  include/elf.h          |   2 +
> >  target/arm/arch_dump.c | 124 ++++++++++++++++++++++++++++++++++++++++-
> >  target/arm/cpu.h       |  25 +++++++++
> >  target/arm/kvm64.c     |  24 --------
> >  4 files changed, 149 insertions(+), 26 deletions(-)
> >
>=20
>=20
> Applied to target-arm.next, thanks (I fixed up the checkpatch
> nits).
>

You mean the ones in include/elf.h? I had left those on purpose in
order to exactly match the glibc elf.h. I just checked QEMU's
elf.h, though, and see other changes were reformatted. Next time
I'll do the same.

Thanks,
drew
