Received: by 2002:a05:6512:204:0:0:0:0 with SMTP id a4csp2891871lfo;
        Tue, 15 Mar 2022 06:59:32 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxiVw4IMHA1jVo0DCZGKuuX1M3BGTdOG21wsghaTM22PNBYb67Vs4He7/isF1z1B55C2bVD
X-Received: by 2002:a05:622a:1a24:b0:2e0:722c:b13a with SMTP id f36-20020a05622a1a2400b002e0722cb13amr22369708qtb.519.1647352771987;
        Tue, 15 Mar 2022 06:59:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1647352771; cv=none;
        d=google.com; s=arc-20160816;
        b=SONdGHW5jdvB99egaZjzuboW6IJ+IOH8YOStkdANippijiJ8n0yHlF13egv+52w+vq
         yqldTyGyEF7Wo2SPATtxkARsRfecX/Zmj75Pe0iTea9VEDoO/6BzUccALfU2wMiWeBh4
         KGI7MFCJtqfIUVH8OxtD44v1Px5FawyB20f9YTTv5a5YZxjp9ua1vbxhG/ci8+G2Yqjd
         wbYbbIlHYGVCYUUSdddHkbWdBcZEN2UQhcvWxgwkeqqqudRr92vIBqFLMYaww9hjqI0C
         3oqv/BRRNv5M5sfddNznbmpCU16Znd27RgzwAqBjcQxUvy/LlTwU8UoIvo7KVYMJWTX+
         msrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:user-agent:message-id
         :in-reply-to:date:references:subject:cc:to:from:dkim-signature;
        bh=10cE4rX5AbTqcs0aOxAVWmDdYLmGBY4pMBpqNlvJA4U=;
        b=l7kIWEvBFGn2zoVz+li6A0ED4RHP8d+g4brA5Mr6o123M93itww1LbNpROa8jrConH
         FHave05Ccj7dTogAyeBFAKpeZzWwNJ/C9fk2ngNumO8plAObwrSEhW/PnqePAnahiSW6
         Kq1Z4Hc+1RGKhL1E3dDQrrVQw5Vj1yDMT1XwL5fh7DZU+qG1rSk1P7L0LCtKu7+9/XlI
         lFf4nCfYVywlyZT5lPtIt0oCnGug1Kyvbjhi/jowd/vbAXw8a1d1285CaXTOCQIvAKov
         gCGM8qwuZjOJnrYZ/4eqsCm2gTCx1nuFel381NUYOWKkOK+Fu89l/YT4UFMlKSP+6+N6
         m76A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=WYCmK2Ic;
       spf=pass (google.com: domain of armbru@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=armbru@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <armbru@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id gi15-20020a056214248f00b00440abc3b9a6si2871727qvb.231.2022.03.15.06.59.31
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 15 Mar 2022 06:59:31 -0700 (PDT)
Received-SPF: pass (google.com: domain of armbru@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=WYCmK2Ic;
       spf=pass (google.com: domain of armbru@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=armbru@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1647352771;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=10cE4rX5AbTqcs0aOxAVWmDdYLmGBY4pMBpqNlvJA4U=;
	b=WYCmK2IcLNHwAKFunA/FTv3SAsln3J9aZDgV1sewl6qRTnsW12ZIHChi+YbUwtGIRci7AU
	uGTqRwhG/ydrVMuBKKLcqkNzkFd3F7yDNN4ZcMbHcTah4xT+NZeFdMmldjFoTGVIHGg/6w
	HnvwJ0PnC6QiKOKyvM6x6BmpnwY2g7I=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-297-Upv_Mb-OOSWIHvms5WArsw-1; Tue, 15 Mar 2022 09:59:27 -0400
X-MC-Unique: Upv_Mb-OOSWIHvms5WArsw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E16CB3C18527;
	Tue, 15 Mar 2022 13:59:25 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.36.112.3])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6292CC50943;
	Tue, 15 Mar 2022 13:59:25 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
	id 1623721E6821; Tue, 15 Mar 2022 14:59:24 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org,  Paolo Bonzini <pbonzini@redhat.com>,  Richard
 Henderson <richard.henderson@linaro.org>,  Gerd Hoffmann
 <kraxel@redhat.com>,  Christian Schoenebeck <qemu_oss@crudebyte.com>,
  "Gonglei (Arei)" <arei.gonglei@huawei.com>,  =?utf-8?Q?Marc-Andr=C3=A9?=
 Lureau
 <marcandre.lureau@redhat.com>,  "Michael S. Tsirkin" <mst@redhat.com>,
  Igor Mammedov <imammedo@redhat.com>,  Ani Sinha <ani@anisinha.ca>,
  Laurent Vivier <lvivier@redhat.com>,  Amit Shah <amit@kernel.org>,  Peter
 Maydell <peter.maydell@linaro.org>,  Stefano Stabellini
 <sstabellini@kernel.org>,  Anthony Perard <anthony.perard@citrix.com>,
  Paul Durrant <paul@xen.org>,  =?utf-8?Q?Herv=C3=A9?= Poussineau
 <hpoussin@reactos.org>,
  Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,  Corey Minyard
 <cminyard@mvista.com>,  Patrick Venture <venture@google.com>,  Eduardo
 Habkost <eduardo@habkost.net>,  Marcel Apfelbaum
 <marcel.apfelbaum@gmail.com>,  Peter Xu <peterx@redhat.com>,  Jason Wang
 <jasowang@redhat.com>,  =?utf-8?Q?C=C3=A9dric?= Le Goater <clg@kaod.org>,
  Daniel Henrique
 Barboza <danielhb413@gmail.com>,  David Gibson
 <david@gibson.dropbear.id.au>,  Greg Kurz <groug@kaod.org>,  Philippe
 =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,  Jean-Christophe Dubois
 <jcd@tribudubois.net>,  Keith Busch <kbusch@kernel.org>,  Klaus Jensen
 <its@irrelevant.dk>,  Yuval Shaia <yuval.shaia.ml@gmail.com>,  Yoshinori
 Sato <ysato@users.sourceforge.jp>,  Magnus Damm <magnus.damm@gmail.com>,
  Fabien Chouteau <chouteau@adacore.com>,  KONRAD Frederic
 <frederic.konrad@adacore.com>,  Mark Cave-Ayland
 <mark.cave-ayland@ilande.co.uk>,  Artyom Tarasenko <atar4qemu@gmail.com>,
  Alex Williamson <alex.williamson@redhat.com>,  Eric Auger
 <eric.auger@redhat.com>,  Max Filippov <jcmvbkbc@gmail.com>,  Juan
 Quintela <quintela@redhat.com>,  "Dr. David Alan Gilbert"
 <dgilbert@redhat.com>,  Konstantin Kostiuk <kkostiuk@redhat.com>,  Michael
 Roth <michael.roth@amd.com>,  Daniel P. =?utf-8?Q?Berrang=C3=A9?=
 <berrange@redhat.com>,
  Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>,  David Hildenbrand
 <david@redhat.com>,  Wenchao Wang <wenchao.wang@intel.com>,  Colin Xu
 <colin.xu@intel.com>,  Kamil Rytarowski <kamil@netbsd.org>,  Reinoud
 Zandijk <reinoud@netbsd.org>,  Sunil Muthuswamy <sunilmut@microsoft.com>,
  Cornelia Huck <cohuck@redhat.com>,  Thomas Huth <thuth@redhat.com>,  Eric
 Blake <eblake@redhat.com>,  Vladimir Sementsov-Ogievskiy
 <vsementsov@virtuozzo.com>,  John Snow <jsnow@redhat.com>,
  kvm@vger.kernel.org,  qemu-arm@nongnu.org,
  xen-devel@lists.xenproject.org,  qemu-ppc@nongnu.org,
  qemu-block@nongnu.org,  haxm-team@intel.com,  qemu-s390x@nongnu.org
Subject: Re: [PATCH 3/3] Use g_new() & friends where that makes obvious sense
References: <20220314160108.1440470-1-armbru@redhat.com>
	<20220314160108.1440470-4-armbru@redhat.com>
	<87y21c401e.fsf@linaro.org>
Date: Tue, 15 Mar 2022 14:59:24 +0100
In-Reply-To: <87y21c401e.fsf@linaro.org> ("Alex =?utf-8?Q?Benn=C3=A9e=22's?=
 message of "Mon, 14
	Mar 2022 22:52:52 +0000")
Message-ID: <875yofl3k3.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.8
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: jCDqUuHtO89e

Alex Benn=C3=A9e <alex.bennee@linaro.org> writes:

> Markus Armbruster <armbru@redhat.com> writes:
>
>> g_new(T, n) is neater than g_malloc(sizeof(T) * n).  It's also safer,
>> for two reasons.  One, it catches multiplication overflowing size_t.
>> Two, it returns T * rather than void *, which lets the compiler catch
>> more type errors.
>>
> <snip>
>> diff --git a/semihosting/config.c b/semihosting/config.c
>> index 137171b717..6d48ec9566 100644
>> --- a/semihosting/config.c
>> +++ b/semihosting/config.c
>> @@ -98,7 +98,7 @@ static int add_semihosting_arg(void *opaque,
>>      if (strcmp(name, "arg") =3D=3D 0) {
>>          s->argc++;
>>          /* one extra element as g_strjoinv() expects NULL-terminated ar=
ray */
>> -        s->argv =3D g_realloc(s->argv, (s->argc + 1) * sizeof(void *));
>> +        s->argv =3D g_renew(void *, s->argv, s->argc + 1);
>
> This did indeed break CI because s->argv is an array of *char:
>
> ../semihosting/config.c:101:17: error: assignment to =E2=80=98const char =
**=E2=80=99 from incompatible pointer type =E2=80=98void **=E2=80=99 [-Werr=
or=3Dincompatible-pointer-types]
>   101 |         s->argv =3D g_renew(void *, s->argv, s->argc + 1);
>       |                 ^
> cc1: all warnings being treated as errors
>
> So it did the job of type checking but failed to build ;-)

You found a hole in my compile testing, thanks!

I got confused about the configuration of my build trees.  Catching such
mistakes is what CI is for :)
