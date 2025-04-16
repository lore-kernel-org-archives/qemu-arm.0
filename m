Received: by 2002:a17:504:14cd:b0:1be9:327d:8ee3 with SMTP id g13csp3196558njc;
        Wed, 16 Apr 2025 02:01:00 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCU67h96qxe3tOJoEGTvkasVk7InjrkMU9n46hGwRBiwG6yjOlVq1YImH8olD/qiVoEy7poOjU53pftHCg==@linaro.org
X-Google-Smtp-Source: AGHT+IFesvKYIaLqZkAMvCb7A4SS2FvOSQvJLainHd7V8tJW72PXcsGfm27sINVYvKg5xNZueSgq
X-Received: by 2002:a05:6808:2f11:b0:3f6:a9ea:eab3 with SMTP id 5614622812f47-400b01be32bmr533565b6e.5.1744794060600;
        Wed, 16 Apr 2025 02:01:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1744794060; cv=none;
        d=google.com; s=arc-20240605;
        b=Z5mxxcM5eGS9pwcLs8FgsC68jhBu8A9w3BqQ32+mQvVHQrnfj5MKaJpqwSZYvEA+LP
         Lgbpbs8xoLpro/nLfQKAsXGyF0qSeUCTr1N/F91KNRtqDBGNt5suwFWvr/Dhgjn+tSxk
         6WmKwVWK9JkJ97DC38FuFO7YM3o46tmfqFSO7UJB9AMlcxGMXcx7xK4nvZ+X3H+OYGcd
         J6jLKA8zzJutR2msoSdlBXLaWzE18aZUkXdtuafFTDMuDUxJFMecEjR4Joi9CSYh/ZON
         UF0/yNZfRtXp1SsZIcqtyO96MgUf2CZI5gC0ukxV4dfTve/tKA3L48ZiO4oLnew9BRe8
         TjNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=t4cUu06qS+cFN9mZzfjcJYWfoQ19aC/j63DrCIx4FSQ=;
        fh=8EJtza2Ebp+3BUB89jyBVmLuMP8rk+++txGiWOm7O+w=;
        b=X4MKmR6SSKHWB1H1NJr/A6R/aLOONQLutRLkdE2n3/3cKBFxiMX8SiktPncw6rR6cR
         5xCgWNqK+Qhw83LbQWN8b/taIpcTSJEBdQIgi65h0GgYZbLxgMlQmCit6hTtGW4tVOiP
         0RbTT2EiPfpTXgCu/szuNDWZZ+ou/qtKtmIMAas0qEdvTKBxhtmr1zxRO7wgcOCf67z4
         keEgp+xhuqCDegFVdJzvE/LON53zFxTqqVLQykMMx8Qgs9ZkMtTZGSSW0OhfD/Y6oOuW
         g/0ts0DKXtbG0dhK7z9jmqbBBN/yD/eTVnX5iDrierEXto+kK7ZG7XJjQXYeIjX/iThT
         pwnw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=BdcLVSxT;
       spf=pass (google.com: domain of pbonzini@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=pbonzini@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Return-Path: <pbonzini@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id 5614622812f47-4007629a5b8si9283285b6e.81.2025.04.16.02.01.00
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Apr 2025 02:01:00 -0700 (PDT)
Received-SPF: pass (google.com: domain of pbonzini@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=BdcLVSxT;
       spf=pass (google.com: domain of pbonzini@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=pbonzini@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1744794059;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=t4cUu06qS+cFN9mZzfjcJYWfoQ19aC/j63DrCIx4FSQ=;
	b=BdcLVSxTRr+wefCkPtWN7o7fUvlKZ6SXczgE+3AdlWKumh/+3am03gwdWTZEBBrNwOVFix
	7zSUXKKgFD58toAiRvHkDWVq5YldZ2Em7Q/DW2k/nA8b4ABUgLHQPr+AnoJ4pb45VtfnZf
	NY+p0Q2u6+E+A4pNAN0LHo1L5lWV7eg=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-570-fp8XvAI_PkiOT5mZxSm2wQ-1; Wed, 16 Apr 2025 05:00:51 -0400
X-MC-Unique: fp8XvAI_PkiOT5mZxSm2wQ-1
X-Mimecast-MFC-AGG-ID: fp8XvAI_PkiOT5mZxSm2wQ_1744794050
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-3912fe32a30so2649530f8f.1
        for <alex.bennee@linaro.org>; Wed, 16 Apr 2025 02:00:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744794050; x=1745398850;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=t4cUu06qS+cFN9mZzfjcJYWfoQ19aC/j63DrCIx4FSQ=;
        b=dKp0GUhxwNZMxyClJRrPlZgPO4yn/KbiZkc/KSk9MpZGEJg+9e/xeH7j5GmFmg1/7D
         fyr7oSWYTWMoXhjpouPkMz1+r/UWLLAUcNXM321j9MxjEk2eZkBVYc4Qb9qyBKUomimW
         nN15/AyvYbvsMnRlPiUhtGCT8gS4Mmq6/JXaMLsmb4+iEBCpd1RlWR71z5euYfehJz1/
         GBR6ZGBtOdKQtJ+PBjp2UEmx9Rp4ewBMthjxMDNBDLboxMGjnCAOgkseYPuiktN+coyB
         L+RXTFAVSEnSsQ6lKNt6o7teORZZQ5MzCzKKbGWAJpg6gWFv/qLeUsy5/tqSay+lkeuq
         pwvQ==
X-Forwarded-Encrypted: i=1; AJvYcCXEyFvmPXfGpsiU1bVqyXGp7T9n/wmWpHXwD3Brl++Dg8X8fdl6X+XdTlj5qCkjWKz+ThH9WgEc7I5DPQ==@linaro.org
X-Gm-Message-State: AOJu0YyZpQkER6urukM2J8GXNqIAksYtZsoj98OH1YLUHgTwW9nY92Mt
	EJIZPh4hywoHYxoUp+QTn7l6V+2uzt4rlZ8K8eGrtTp+rrOYYgLSXDy4mHgz9/xKN0WPU4tFZwa
	fYJk5lw/r8GtY/3KA0v2mffrr+vThyXbOtvLE9A/ff5o33K7lH5jpLBKdsyI9q1YMW66VSuM1/0
	3aNzRSs8SdeKnPsLDHtfe97z9WIPBp
X-Gm-Gg: ASbGnctQAlhj+hXOinxOVRqzvONwQMhhOmXCIq/Ya8j2cRls1xr4dHKYYQp9y1za2vG
	nvdS+Ya4xaXJ76pyeTjKbXfG3DBd+19HZRTpN8MzFlhjTWuYpJfCEhpxWbjoIAxTJ73m/7w==
X-Received: by 2002:a05:6000:4282:b0:391:4231:40a with SMTP id ffacd0b85a97d-39ee5b35cc7mr868351f8f.33.1744794049635;
        Wed, 16 Apr 2025 02:00:49 -0700 (PDT)
X-Received: by 2002:a05:6000:4282:b0:391:4231:40a with SMTP id
 ffacd0b85a97d-39ee5b35cc7mr868327f8f.33.1744794049313; Wed, 16 Apr 2025
 02:00:49 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1744787186.git.ktokunaga.mail@gmail.com>
 <44e9ef95ea6e8aa33560ca8580db0033623f0e91.1744787186.git.ktokunaga.mail@gmail.com>
 <Z_9qIQhjsI5zOwXA@redhat.com>
In-Reply-To: <Z_9qIQhjsI5zOwXA@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Wed, 16 Apr 2025 11:00:37 +0200
X-Gm-Features: ATxdqUF_yxp8UmiitEgBJlwXgw5fD6l4Tq_i7Q_t6dBFJg29p48TP3GllPE74hs
Message-ID: <CABgObfaj0ycyc2jVSJEVvQJ1m+uLf=_HYiOafn2MECgU36aspw@mail.gmail.com>
Subject: Re: [PATCH 01/19] hw/core/loader.c: Fix type conflict of GLib
 function pointers
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Cc: Kohei Tokunaga <ktokunaga.mail@gmail.com>, qemu-devel <qemu-devel@nongnu.org>, 
	=?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
	=?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
	Thomas Huth <thuth@redhat.com>, Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>, 
	Alexandre Iooss <erdnaxe@crans.org>, Mahmoud Mandour <ma.mandourr@gmail.com>, 
	Pierrick Bouvier <pierrick.bouvier@linaro.org>, Pavel Pisa <pisa@cmp.felk.cvut.cz>, 
	Francisco Iglesias <francisco.iglesias@amd.com>, Vikram Garhwal <vikram.garhwal@bytedance.com>, 
	Jason Wang <jasowang@redhat.com>, =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>, 
	Eduardo Habkost <eduardo@habkost.net>, Peter Maydell <peter.maydell@linaro.org>, 
	Zhao Liu <zhao1.liu@intel.com>, Nicholas Piggin <npiggin@gmail.com>, 
	Daniel Henrique Barboza <danielhb413@gmail.com>, David Hildenbrand <david@redhat.com>, 
	Richard Henderson <richard.henderson@linaro.org>, Ilya Leoshkevich <iii@linux.ibm.com>, 
	Stefan Hajnoczi <stefanha@redhat.com>, "open list:Block layer core" <qemu-block@nongnu.org>, 
	qemu-arm <qemu-arm@nongnu.org>, 
	"zmta06.collab.prod.int.phx2.redhat.com, list@suse.de" <qemu-ppc@nongnu.org>, qemu-s390x <qemu-s390x@nongnu.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: GSjXypDIt19H51iBLuWeCxDQHFtQZkU73pm5yg8wLVU_1744794050
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="000000000000841ee60632e185e4"
X-TUID: blGMAgmPg5dR

--000000000000841ee60632e185e4
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Il mer 16 apr 2025, 10:29 Daniel P. Berrang=C3=A9 <berrange@redhat.com> ha
scritto:

> > -    secs =3D g_list_sort(secs, sort_secs);
> > +    secs =3D g_list_sort_with_data(secs, sort_secs, NULL);
>
> I don't see what the problem is with the original code.
>
> The commit message says we have a bad function cast, but the original
> method decl is
>
>   GList *g_list_sort(GList*list, GCompareFunc compare_func);
>
> where the callback is
>
>    typedef gint (*GCompareFunc)(gconstpointer a, gconstpointer b);
>
> Our code complies with that GCompareFunc signature.
>

The cast is inside glib; g_list_sort casts the function pointer and calls
g_list_sort_with_data.

I suggested this solution to Kohei because it's easy to check that we're
converting all users and not introducing new ones in the future (see
poisoning in patch 10).

Paolo

For comparison the new code uses:
>
>   GList *g_list_sort_with_data(GList *list, GCompareDataFunc
> compare_func, gpointer user_data);
>
> where the callback is
>
>   typedef gint (*GCompareDataFunc)(gconstpointer a, gconstpointer b,
> gpointer user_data);
>
> which the new code complies with, but it is undesirable since we
> have no use for the data parameter.
>
> With regards,
> Daniel
> --
> |: https://berrange.com      -o-
> https://www.flickr.com/photos/dberrange :|
> |: https://libvirt.org         -o-
> https://fstop138.berrange.com :|
> |: https://entangle-photo.org    -o-
> https://www.instagram.com/dberrange :|
>
>

--000000000000841ee60632e185e4
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote gmail_quote_contai=
ner"><div dir=3D"ltr" class=3D"gmail_attr">Il mer 16 apr 2025, 10:29 Daniel=
 P. Berrang=C3=A9 &lt;<a href=3D"mailto:berrange@redhat.com">berrange@redha=
t.com</a>&gt; ha scritto:<br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">&gt; -=C2=A0 =C2=A0 secs =3D g_list_sort(secs, sort_secs);<br>
&gt; +=C2=A0 =C2=A0 secs =3D g_list_sort_with_data(secs, sort_secs, NULL);<=
br>
<br>
I don&#39;t see what the problem is with the original code.<br>
<br>
The commit message says we have a bad function cast, but the original<br>
method decl is<br>
<br>
=C2=A0 GList *g_list_sort(GList*list, GCompareFunc compare_func);<br>
<br>
where the callback is<br>
<br>
=C2=A0 =C2=A0typedef gint (*GCompareFunc)(gconstpointer a, gconstpointer b)=
;<br>
<br>
Our code complies with that GCompareFunc signature.<br></blockquote></div><=
/div><div dir=3D"auto"><br></div><div dir=3D"auto">The cast is inside glib;=
 g_list_sort casts the function pointer and calls g_list_sort_with_data.</d=
iv><div dir=3D"auto"><br></div><div dir=3D"auto">I suggested this solution =
to Kohei because it&#39;s easy to check that we&#39;re converting all users=
 and not introducing new ones in the future (see poisoning in patch 10).</d=
iv><div dir=3D"auto"><br></div><div dir=3D"auto">Paolo</div><div dir=3D"aut=
o"><br></div><div dir=3D"auto"><div class=3D"gmail_quote gmail_quote_contai=
ner"><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bo=
rder-left:1px solid rgb(204,204,204);padding-left:1ex">
For comparison the new code uses:<br>
<br>
=C2=A0 GList *g_list_sort_with_data(GList *list, GCompareDataFunc=C2=A0 com=
pare_func, gpointer user_data);<br>
<br>
where the callback is<br>
<br>
=C2=A0 typedef gint (*GCompareDataFunc)(gconstpointer a, gconstpointer b, g=
pointer user_data);<br>
<br>
which the new code complies with, but it is undesirable since we<br>
have no use for the data parameter.<br>
<br>
With regards,<br>
Daniel<br>
-- <br>
|: <a href=3D"https://berrange.com" rel=3D"noreferrer noreferrer" target=3D=
"_blank">https://berrange.com</a>=C2=A0 =C2=A0 =C2=A0 -o-=C2=A0 =C2=A0 <a h=
ref=3D"https://www.flickr.com/photos/dberrange" rel=3D"noreferrer noreferre=
r" target=3D"_blank">https://www.flickr.com/photos/dberrange</a> :|<br>
|: <a href=3D"https://libvirt.org" rel=3D"noreferrer noreferrer" target=3D"=
_blank">https://libvirt.org</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-o-=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 <a href=3D"https://fstop138.berrange.com=
" rel=3D"noreferrer noreferrer" target=3D"_blank">https://fstop138.berrange=
.com</a> :|<br>
|: <a href=3D"https://entangle-photo.org" rel=3D"noreferrer noreferrer" tar=
get=3D"_blank">https://entangle-photo.org</a>=C2=A0 =C2=A0 -o-=C2=A0 =C2=A0=
 <a href=3D"https://www.instagram.com/dberrange" rel=3D"noreferrer noreferr=
er" target=3D"_blank">https://www.instagram.com/dberrange</a> :|<br>
<br>
</blockquote></div></div></div>

--000000000000841ee60632e185e4--
