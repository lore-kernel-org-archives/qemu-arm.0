Received: by 2002:a05:6512:204:0:0:0:0 with SMTP id a4csp2308114lfo;
        Mon, 14 Mar 2022 10:39:52 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxmjpaTgFzCFQlMTwoF/mzWJbh2TRnUX+vkAzhI39UhZhOSs9uePU1XX/OsWX8aF3Sf3wNs
X-Received: by 2002:a17:906:6693:b0:6cf:3cb:89c9 with SMTP id z19-20020a170906669300b006cf03cb89c9mr19698577ejo.23.1647279591908;
        Mon, 14 Mar 2022 10:39:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1647279591; cv=none;
        d=google.com; s=arc-20160816;
        b=Pb5wW67/eTpar4dfQsnuc+255v0qnmA+D7Af0IhrykLQuRMa+s22aLU17YF8oRWCXb
         ljkTGl3Zf1TVBCoYGV35GeNCcOV3lBIOeWcKhJ4sfuCOe2+2oBcPX/9pfNb/XFm7cGIV
         1IQz0FO+By66OQUyCYuTsvEewQFNq7Ug6Erx11+7Cqn92zM9VLwzf4i7So4NPBisxlxz
         Y9o7KN5uwgZvAhD60YY/bLkvd+ztfPzBQXZZkT/L56DUh+Cfrf/0wZEVsKyUbIjHSD4L
         +KDjt7N+KxmAuvw+Zgj9uoBUqAlVIh4wSYS3OQwpHfT02v4Cz6WC3v3gRu4bC232Of+7
         D+zg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :reply-to:message-id:subject:cc:to:from:date:dkim-signature;
        bh=FuV+LXYAzCN8GlqarfyjrOMJEbdlSdj/IkmrSiaMB84=;
        b=0RCRHzBFR4fk96NX5Kg/IXGfZqFu7UqQktA9Fpq58SN3ygkTC5BgX5yu1oLKf8KAuR
         FDQ3eeqNPXGArfNQqfieUZzIt4PeQ5dSh6CPcYi/Aw05PbkGADCn+hQ108mO4Pn5RG16
         MDiwSsTGPHRjjfo5H0oFdGAvkjH0bMu5zsttXdUKBXQ/qD6/mPSW17s7gEvdZ7I0jaUn
         5M/xDxCVPYNsxy5QHcSqBWo7jqNKqI2pkjRRg7g1WbSAprWVYuhqvLpFbjCD8JLAsuEH
         0Yy6zAEfYS//zfTvnU2qPSDgj7u9O91TYfZieFueKYZbLli6Itxu1nS6aTb1F6uvjwmo
         /lEQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="crJ5J/E7";
       spf=pass (google.com: domain of berrange@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=berrange@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <berrange@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id di10-20020a170906730a00b006da6b6bebcdsi10931647ejc.941.2022.03.14.10.39.51
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 14 Mar 2022 10:39:51 -0700 (PDT)
Received-SPF: pass (google.com: domain of berrange@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="crJ5J/E7";
       spf=pass (google.com: domain of berrange@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=berrange@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1647279590;
	h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:  references:references;
	bh=FuV+LXYAzCN8GlqarfyjrOMJEbdlSdj/IkmrSiaMB84=;
	b=crJ5J/E7HiGU0wkJMFZIpC1obqquf6p48A22+ZZkT9mIkg/IA8VHiBWkuTZEs9xYeYCjXT
	XAyebj7B6FXFp1SyMB0j++lRkq8keIwEiM92RubjQJbcAZFdIIWugWUVlUG837vqh432XI
	MLS2UzS4R2cGMamsEQOjmodJOaU/+HE=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-614-5i1UFKH3MraiAoloP0STSQ-1; Mon, 14 Mar 2022 13:39:47 -0400
X-MC-Unique: 5i1UFKH3MraiAoloP0STSQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com [10.11.54.7])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6CE36180139E;
	Mon, 14 Mar 2022 17:39:44 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.154])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D155F140EBFE;
	Mon, 14 Mar 2022 17:39:32 +0000 (UTC)
Date: Mon, 14 Mar 2022 17:39:30 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Markus Armbruster <armbru@redhat.com>
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org,
	Paolo Bonzini <pbonzini@redhat.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Gerd Hoffmann <kraxel@redhat.com>,
	Christian Schoenebeck <qemu_oss@crudebyte.com>,
	"Gonglei (Arei)" <arei.gonglei@huawei.com>,
	=?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Igor Mammedov <imammedo@redhat.com>, Ani Sinha <ani@anisinha.ca>,
	Laurent Vivier <lvivier@redhat.com>, Amit Shah <amit@kernel.org>,
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
	Pavel Dovgalyuk <Pavel.Dovgaluk@ispras.ru>,
	Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
	David Hildenbrand <david@redhat.com>,
	Wenchao Wang <wenchao.wang@intel.com>,
	Kamil Rytarowski <kamil@netbsd.org>,
	Reinoud Zandijk <reinoud@netbsd.org>,
	Sunil Muthuswamy <sunilmut@microsoft.com>,
	Cornelia Huck <cohuck@redhat.com>, Thomas Huth <thuth@redhat.com>,
	Eric Blake <eblake@redhat.com>,
	Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
	John Snow <jsnow@redhat.com>, kvm@vger.kernel.org,
	qemu-arm@nongnu.org, xen-devel@lists.xenproject.org,
	qemu-ppc@nongnu.org, qemu-block@nongnu.org, haxm-team@intel.com,
	qemu-s390x@nongnu.org
Subject: Re: [PATCH 3/3] Use g_new() & friends where that makes obvious sense
Message-ID: <Yi990ucCF/ZWeDbU@redhat.com>
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
References: <20220314160108.1440470-1-armbru@redhat.com>
 <20220314160108.1440470-4-armbru@redhat.com>
 <CAFEAcA8Tb7e+mJGaietc5si7_xZWxbTixcTSvNpB9wH_LQJ7kQ@mail.gmail.com>
 <87k0cwqxwv.fsf@pond.sub.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <87k0cwqxwv.fsf@pond.sub.org>
User-Agent: Mutt/2.1.5 (2021-12-30)
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.7
X-TUID: hNwRGuNx/WWS

On Mon, Mar 14, 2022 at 05:52:32PM +0100, Markus Armbruster wrote:
> Peter Maydell <peter.maydell@linaro.org> writes:
> 
> > On Mon, 14 Mar 2022 at 16:01, Markus Armbruster <armbru@redhat.com> wrote:
> >>
> >> g_new(T, n) is neater than g_malloc(sizeof(T) * n).  It's also safer,
> >> for two reasons.  One, it catches multiplication overflowing size_t.
> >> Two, it returns T * rather than void *, which lets the compiler catch
> >> more type errors.
> >>
> >> This commit only touches allocations with size arguments of the form
> >> sizeof(T).
> >>
> >> Patch created mechanically with:
> >>
> >>     $ spatch --in-place --sp-file scripts/coccinelle/use-g_new-etc.cocci \
> >>              --macro-file scripts/cocci-macro-file.h FILES...
> >>
> >> Signed-off-by: Markus Armbruster <armbru@redhat.com>
> >> ---
> >
> >>  104 files changed, 197 insertions(+), 202 deletions(-)
> >
> > I'm not going to say you must split this patch up. I'm just going to
> > say that I personally am not looking at it, because it's too big
> > for me to deal with.
> 
> As with all big but trivial Coccinelle patches, reviewing the Coccinelle
> script and a reasonably representative sample of its output is almost
> certainly a better use of reviewer time than attempting to get all the
> patches reviewed.  They are mind-numbingly dull!
> 
> For what it's worth, we've used this script several times before.  Last
> in commit bdd81addf4.

This Coccinelle is simple enough to understand, that I'd suggest that
once we merge the Coccinelle script itself, then for ongoing usage,
its output can be considered effectively pre-reviewed.

The reviewer can just re-run the Coccinelle script themselves to prove
it has the same output as the submitter claims, to validate no manual
changes are hidden in the middle of the automated patch.

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|
