Received: by 2002:a05:6512:204:0:0:0:0 with SMTP id a4csp2278902lfo;
        Mon, 14 Mar 2022 09:52:38 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy4SVq0CgZSUy0GUOuBhp3j2LEbz1pPMHO1iJCO00B7WEyxVae+bep+DvMLKU5QL1CNOEre
X-Received: by 2002:a17:907:a0c8:b0:6db:5733:aebf with SMTP id hw8-20020a170907a0c800b006db5733aebfmr19122087ejc.263.1647276758444;
        Mon, 14 Mar 2022 09:52:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1647276758; cv=none;
        d=google.com; s=arc-20160816;
        b=S7sTYq2rmLBW63gNIWCJMHeBWfEW4ZVD0p8g6rG2RdxiMwal0mPRwOkuxmEy21x1MW
         ItA7KXGJUQoXbXcZrp/g77KGBAf2ynSkqiYVBcNPRyrk1rNLGGThfdVF14TvItpQVxeQ
         x7Ppw7inSWxI899mVecUgDHkEf/ii3rhs5XYiXewMAoT7IY8Q36uQZxC/oKkX/ROJR0C
         ANuw7ADCFFNq6V/sjN0tvxP+9ILjf26COvtPEwjArVQ35SnAgPYN2+YSR+zRtiPXLlZi
         CbeL97VcG75Q569CUxYmS1wpTs7iO3CpXFgL8t8+4G+c4sePyLwZCfnbV9xbxcCZGXdi
         7DFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:user-agent:message-id:in-reply-to:date:references
         :subject:cc:to:from:dkim-signature;
        bh=hoVbdS414dD8S5HvfKlVfGNq0xYQ8aEfO5LCXtdVxms=;
        b=DbuqxRHv511szPpPKopxJvvW8EaCs6ODeynE1wOnBVvN2IXVweYkqUDNe6xod6JNTs
         Eti7VkA91HRnmS5vOQ03N+sr7LjGhpuhOggxXh5z2F40Rk0d6m+38c2nTcOqtrGRwgMV
         g7wZ/ppz7P7fSJivssLHKyLlFC5Mzld1oCORKt6JaYGzhHoxSfJRR7Fj+0wnpXqhx0o7
         9W+9FnAnme8IeHTwa+ZXtxHqO4JZ/P7kq0pUgOoheoDdJRMZ5o9Ke0mwsBpNLMkZIGJ6
         LKQqaOTcOhf+lx842g/HJKmQupez5IU64urY1IIjlo2WFEAd8esypYccsxsm9pKQCPiI
         v29A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=XG3499nn;
       spf=pass (google.com: domain of armbru@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=armbru@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <armbru@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id eb10-20020a0564020d0a00b004161b4c6143si10676781edb.599.2022.03.14.09.52.38
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 14 Mar 2022 09:52:38 -0700 (PDT)
Received-SPF: pass (google.com: domain of armbru@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=XG3499nn;
       spf=pass (google.com: domain of armbru@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=armbru@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1647276757;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=hoVbdS414dD8S5HvfKlVfGNq0xYQ8aEfO5LCXtdVxms=;
	b=XG3499nnTatsMPDMTbFpCMpbjY6G1YBx3fWhZiqGJjID5p4RAhr4oXTc4kG9yTtNOwGtMK
	3HbiGiVANS4sFip//5DAS7mPICDz1EyJ3ZtLdAtJwqzGGXq6TLvrqIxequ5aEgcOaLJ0dt
	3IzzmQziLHa/oyRXAMD/iEQYw9I6DAg=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-278-N1xO-bcsMhWHXGmr0LX6PA-1; Mon, 14 Mar 2022 12:52:36 -0400
X-MC-Unique: N1xO-bcsMhWHXGmr0LX6PA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3E815801585;
	Mon, 14 Mar 2022 16:52:34 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.36.112.3])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 5D70AC50942;
	Mon, 14 Mar 2022 16:52:33 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
	id 30A6821E66C8; Mon, 14 Mar 2022 17:52:32 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: Markus Armbruster <armbru@redhat.com>,  qemu-devel@nongnu.org,  Paolo
 Bonzini <pbonzini@redhat.com>,  Richard Henderson
 <richard.henderson@linaro.org>,  Gerd Hoffmann <kraxel@redhat.com>,
  Christian Schoenebeck <qemu_oss@crudebyte.com>,  "Gonglei (Arei)"
 <arei.gonglei@huawei.com>,  =?utf-8?Q?Marc-Andr=C3=A9?= Lureau
 <marcandre.lureau@redhat.com>,  "Michael S. Tsirkin" <mst@redhat.com>,
  Igor Mammedov <imammedo@redhat.com>,  Ani Sinha <ani@anisinha.ca>,
  Laurent Vivier <lvivier@redhat.com>,  Amit Shah <amit@kernel.org>,
  Stefano Stabellini <sstabellini@kernel.org>,  Anthony Perard
 <anthony.perard@citrix.com>,  Paul Durrant <paul@xen.org>,  =?utf-8?Q?Her?=
 =?utf-8?Q?v=C3=A9?=
 Poussineau <hpoussin@reactos.org>,  Aleksandar Rikalo
 <aleksandar.rikalo@syrmia.com>,  Corey Minyard <cminyard@mvista.com>,
  Patrick Venture <venture@google.com>,  Eduardo Habkost
 <eduardo@habkost.net>,  Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
  Peter Xu <peterx@redhat.com>,  Jason Wang <jasowang@redhat.com>,
  =?utf-8?Q?C=C3=A9dric?=
 Le Goater <clg@kaod.org>,  Daniel Henrique Barboza
 <danielhb413@gmail.com>,  David Gibson <david@gibson.dropbear.id.au>,
  Greg Kurz <groug@kaod.org>,  Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?=
 <f4bug@amsat.org>,
  Jean-Christophe Dubois <jcd@tribudubois.net>,  Keith Busch
 <kbusch@kernel.org>,  Klaus Jensen <its@irrelevant.dk>,  Yuval Shaia
 <yuval.shaia.ml@gmail.com>,  Yoshinori Sato <ysato@users.sourceforge.jp>,
  Magnus Damm <magnus.damm@gmail.com>,  Fabien Chouteau
 <chouteau@adacore.com>,  KONRAD Frederic <frederic.konrad@adacore.com>,
  Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,  Artyom Tarasenko
 <atar4qemu@gmail.com>,  Alex Williamson <alex.williamson@redhat.com>,
  Eric Auger <eric.auger@redhat.com>,  Max Filippov <jcmvbkbc@gmail.com>,
  Juan Quintela <quintela@redhat.com>,  "Dr. David Alan Gilbert"
 <dgilbert@redhat.com>,  Konstantin Kostiuk <kkostiuk@redhat.com>,  Michael
 Roth <michael.roth@amd.com>,  Daniel P. =?utf-8?Q?Berrang=C3=A9?=
 <berrange@redhat.com>,
  Pavel Dovgalyuk <Pavel.Dovgaluk@ispras.ru>,  Alex =?utf-8?Q?Benn=C3=A9e?=
 <alex.bennee@linaro.org>,  David Hildenbrand <david@redhat.com>,  Wenchao
 Wang <wenchao.wang@intel.com>,  Kamil Rytarowski <kamil@netbsd.org>,
  Reinoud Zandijk <reinoud@netbsd.org>,  Sunil Muthuswamy
 <sunilmut@microsoft.com>,  Cornelia Huck <cohuck@redhat.com>,  Thomas Huth
 <thuth@redhat.com>,  Eric Blake <eblake@redhat.com>,  Vladimir
 Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,  John Snow
 <jsnow@redhat.com>,  kvm@vger.kernel.org,  qemu-arm@nongnu.org,
  xen-devel@lists.xenproject.org,  qemu-ppc@nongnu.org,
  qemu-block@nongnu.org,  haxm-team@intel.com,  qemu-s390x@nongnu.org
Subject: Re: [PATCH 3/3] Use g_new() & friends where that makes obvious sense
References: <20220314160108.1440470-1-armbru@redhat.com>
	<20220314160108.1440470-4-armbru@redhat.com>
	<CAFEAcA8Tb7e+mJGaietc5si7_xZWxbTixcTSvNpB9wH_LQJ7kQ@mail.gmail.com>
Date: Mon, 14 Mar 2022 17:52:32 +0100
In-Reply-To: <CAFEAcA8Tb7e+mJGaietc5si7_xZWxbTixcTSvNpB9wH_LQJ7kQ@mail.gmail.com>
	(Peter Maydell's message of "Mon, 14 Mar 2022 16:08:15 +0000")
Message-ID: <87k0cwqxwv.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.8
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
X-TUID: MRLe9gPfCNFA

Peter Maydell <peter.maydell@linaro.org> writes:

> On Mon, 14 Mar 2022 at 16:01, Markus Armbruster <armbru@redhat.com> wrote:
>>
>> g_new(T, n) is neater than g_malloc(sizeof(T) * n).  It's also safer,
>> for two reasons.  One, it catches multiplication overflowing size_t.
>> Two, it returns T * rather than void *, which lets the compiler catch
>> more type errors.
>>
>> This commit only touches allocations with size arguments of the form
>> sizeof(T).
>>
>> Patch created mechanically with:
>>
>>     $ spatch --in-place --sp-file scripts/coccinelle/use-g_new-etc.cocci \
>>              --macro-file scripts/cocci-macro-file.h FILES...
>>
>> Signed-off-by: Markus Armbruster <armbru@redhat.com>
>> ---
>
>>  104 files changed, 197 insertions(+), 202 deletions(-)
>
> I'm not going to say you must split this patch up. I'm just going to
> say that I personally am not looking at it, because it's too big
> for me to deal with.

As with all big but trivial Coccinelle patches, reviewing the Coccinelle
script and a reasonably representative sample of its output is almost
certainly a better use of reviewer time than attempting to get all the
patches reviewed.  They are mind-numbingly dull!

For what it's worth, we've used this script several times before.  Last
in commit bdd81addf4.
