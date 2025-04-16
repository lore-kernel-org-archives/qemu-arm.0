Received: by 2002:a17:504:14cd:b0:1be9:327d:8ee3 with SMTP id g13csp3210189njc;
        Wed, 16 Apr 2025 02:31:47 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVoZJrMTJ568ai+yNqeTKi18nkNe6nk5eZ6FZlkqVd3kQYqMVFOvSUhEEhHhP/9P++ORzslAF9K+HamRA==@linaro.org
X-Google-Smtp-Source: AGHT+IGDA6IgE9S7aH4Qfq+JXeOTFnDPnXg0Yj+O2urBoKplbtcDVb6iPVMhuc+o1qaFq6831Sus
X-Received: by 2002:a05:620a:1a90:b0:7c7:b5dc:2e36 with SMTP id af79cd13be357-7c918fefe6cmr122902085a.18.1744795907138;
        Wed, 16 Apr 2025 02:31:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1744795907; cv=none;
        d=google.com; s=arc-20240605;
        b=Spfq3+E+hPR5ZV4EL1tcfTQ3IfZ1Co0kVJZMK4TDCj7BI+zXjxVgPlwBW1VIYRftO0
         KJqbt+OMbPZUYbsTZ6eRsRzJn0wkQ/P1I16RgZamcBumhrI2/ZaWa50hQLSg1wqp8mdR
         KXHJIffPAibbbD9LdFH7a1mldEOflY/pFNwJMPUO2DoZbvHFe7Oib+6pdouMfCYnM/BS
         FgYGnMKsauiXU/uy3EM7GhRkFRwHx4CPKMYLdUjFslB+/lRfow0nLuff3fYm+E+eCX5I
         jQT/n2mg5mOj5CPO4j3msBzOSg8NSKwYVn8pKzAO9hGt2Ii02VNonME2G36ASeJrsJ5Q
         U+lg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=skqtdhN7QA0IcUoH1fCyWPFAlYDxTTbWK90TW3BN9pg=;
        fh=OTU7BshoMPSuFb58W1H1EwTS9P2yziKWb0kTEINLlH4=;
        b=EdsUx+J7UhCBlFCAxupNmkx5sJbIuykuQPwjOQyVl0nx+a3QVFQnG1DmZ2kTsLlYAv
         1ZECxNdIu4lRFUx+Qbr5yM6YJ1r64HALgvq+8H3YqrKvOEiM2ztb3J99m0Cav3IOGr6Z
         YBx+iiMWTcmAiZXUfUa6WZXKKYDH5+8id1nwNh349CJ82MuFyqfP93GEnuP9NKKhjAzW
         n8AGY3DlggwdIbij8TSFYYw8vQIR7kN5eGPDU9DDhM+7iQx+FrN5TxFj2xjNFrQVLHsu
         wRccf940Q5fZRWvtD4JVAPjsRfw90Zyo0Rmbkcq108a1ir+Vq00FTYAz8+7aq0qR3/WG
         JXlg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=EpIAFqmf;
       spf=pass (google.com: domain of pbonzini@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=pbonzini@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Return-Path: <pbonzini@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id af79cd13be357-7c7a8a20a86si1293656085a.564.2025.04.16.02.31.46
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Apr 2025 02:31:47 -0700 (PDT)
Received-SPF: pass (google.com: domain of pbonzini@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=EpIAFqmf;
       spf=pass (google.com: domain of pbonzini@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=pbonzini@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1744795906;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=skqtdhN7QA0IcUoH1fCyWPFAlYDxTTbWK90TW3BN9pg=;
	b=EpIAFqmf/IHgIIeGPevcdG4bD8QHWuit6LpCY6VKSQMpRCpIxcZbCvq1HJa+nnE2kUBsa+
	YEfbifWcVHCryGhGk55J/UvgWfhzhKkn6VPLdPgJ+sKjsTZpQRqOxURx4l2mkXt9cRZORQ
	GKZjLmPDhkmgXxFwbGB4PjJBk7z+aBc=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-557-kIeC4qycN2uFN7bOVh7wlg-1; Wed, 16 Apr 2025 05:31:45 -0400
X-MC-Unique: kIeC4qycN2uFN7bOVh7wlg-1
X-Mimecast-MFC-AGG-ID: kIeC4qycN2uFN7bOVh7wlg_1744795904
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-39141ffa913so3759990f8f.2
        for <alex.bennee@linaro.org>; Wed, 16 Apr 2025 02:31:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744795904; x=1745400704;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=skqtdhN7QA0IcUoH1fCyWPFAlYDxTTbWK90TW3BN9pg=;
        b=wHqQGsypfs2svJ1aGdzfyVD3xW3bz1ztazV3ZJrYKgbfln8EkNtea6LFV84Bl2MhKb
         T0LpmEuohS+Mr4htp22tmtCNuMomo1n1oUbvRFu2RrUNq1lCxsqgp9Cr3bzxvdMQiC6C
         /Ngwihsj0r1VTRPi4nKc0CMlbjwPViLQ7ASK/woqVPLUSjtIqo2R3lhTLqqDLRoq3hcs
         f1JwYlUIzwvO+HlzjZ/loBdl+2lwGuOisgv2ToWKV7aZ49gbLddIMCKrWOjVUeyQKVBB
         D8GCr5nqlzoAKZEypKg+C9JY7ft+91LU8KHqMA/tHeS01TAPeabwHLeI3kbPdlWsp1kc
         G/ZQ==
X-Forwarded-Encrypted: i=1; AJvYcCVZuyQa1ScyHGcqj6pl2jOHtW52J3fsaddGPcAdXTq3MucAcdf9qMD8u1tZVWpQFJEeoRSOIbjU01t2Qg==@linaro.org
X-Gm-Message-State: AOJu0YzDwJvq5KYw2BIC8XolgYGdH+FZORU752Jd/Hnfw2Xtjj/zPpUv
	In4EyNx3rx7ufEe3RKbCllDlLpfKP8hdTaeNi5Dkig8lxAmu8iUQcWbCXH//fU3z0bn7duEqaHQ
	AXACNqKMKiB58mJstBPQocbTLzGugHZlrP6mv3KojDUY+saC1U6uQu2DqxyMkGP8LUNGv3RpVwA
	igj+nVd1RIJaIVi31pkK+hlxuvFUko
X-Gm-Gg: ASbGncs4G2Pv9H+FDdxjMGXCRKYCy1foHVUQD2IuM9z85WVH7Q0PqSNY8Gbx3otRROP
	4jnTGRnr3FS8d4oXnmk3o1WuoL2RVc+rnknJce11ixgqLSkVPfXFhAcFyh9X84bGim2/yeA==
X-Received: by 2002:a05:6000:2489:b0:39c:12f2:2f86 with SMTP id ffacd0b85a97d-39ee5b1393bmr860321f8f.8.1744795903946;
        Wed, 16 Apr 2025 02:31:43 -0700 (PDT)
X-Received: by 2002:a05:6000:2489:b0:39c:12f2:2f86 with SMTP id
 ffacd0b85a97d-39ee5b1393bmr860296f8f.8.1744795903544; Wed, 16 Apr 2025
 02:31:43 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1744787186.git.ktokunaga.mail@gmail.com>
 <44e9ef95ea6e8aa33560ca8580db0033623f0e91.1744787186.git.ktokunaga.mail@gmail.com>
 <Z_9qIQhjsI5zOwXA@redhat.com> <CABgObfaj0ycyc2jVSJEVvQJ1m+uLf=_HYiOafn2MECgU36aspw@mail.gmail.com>
 <Z_90aqNE74sonn8O@redhat.com>
In-Reply-To: <Z_90aqNE74sonn8O@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Wed, 16 Apr 2025 11:31:31 +0200
X-Gm-Features: ATxdqUFJ48Fhcc32Y40PChLtT5VWGv4yNFczwgamedATrI6jPJV30diLkw6OozY
Message-ID: <CABgObfaNAEsRQrr8O8fpuGGoQHq14Q_niBnQf1Yj4iD33a0LVA@mail.gmail.com>
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
X-Mimecast-MFC-PROC-ID: b6XJp9pD94FfGOvXxKMEjWUUep_0VgHNMmA6geNiYnI_1744795904
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="0000000000000972e20632e1f4de"
X-TUID: 7LJL5KXYfpRl

--0000000000000972e20632e1f4de
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Il mer 16 apr 2025, 11:12 Daniel P. Berrang=C3=A9 <berrange@redhat.com> ha
scritto:

> > I suggested this solution to Kohei because it's easy to check that we'r=
e
> > converting all users and not introducing new ones in the future (see
> > poisoning in patch 10).
>
> It is easy to check this /one/ example, but this pattern of bad casts
> is typical in glib with likely many more examples, so avoidance in this
> way does not feel like a sustainable long term strategy to me.
>

If you refer to the general case of function casting then yes, I agree that
there could be other problems in the future but that would have to be
solved in glib.

However QEMU's use of glib is overall relatively limited and for now this
seems to be the only case we hit. What this patch is doing is both
effective at solving the immediate issue, and future proof.

Paolo


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

--0000000000000972e20632e1f4de
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">Il mer 16 apr 2025, 11:12 Daniel P. Berrang=C3=A9 &lt;=
<a href=3D"mailto:berrange@redhat.com" target=3D"_blank" rel=3D"noreferrer"=
>berrange@redhat.com</a>&gt; ha scritto:<br></div><blockquote class=3D"gmai=
l_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,20=
4,204);padding-left:1ex">&gt; I suggested this solution to Kohei because it=
&#39;s easy to check that we&#39;re<br>
&gt; converting all users and not introducing new ones in the future (see<b=
r>
&gt; poisoning in patch 10).<br>
<br>
It is easy to check this /one/ example, but this pattern of bad casts<br>
is typical in glib with likely many more examples, so avoidance in this<br>
way does not feel like a sustainable long term strategy to me.<br></blockqu=
ote></div></div><div dir=3D"auto"><br></div><div dir=3D"auto">If you refer =
to the general case of function casting then yes, I agree that there could =
be other problems in the future but that would have to be solved in glib.</=
div><div dir=3D"auto"><br></div><div dir=3D"auto">However QEMU&#39;s use of=
 glib is overall relatively limited and for now this seems to be the only c=
ase we hit. What this patch is doing is both effective at solving the immed=
iate issue, and future proof.</div><div dir=3D"auto"><br></div><div dir=3D"=
auto">Paolo</div><div dir=3D"auto"><br></div><div dir=3D"auto"><div class=
=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px =
0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
<br>
With regards,<br>
Daniel<br>
-- <br>
|: <a href=3D"https://berrange.com" rel=3D"noreferrer noreferrer noreferrer=
" target=3D"_blank">https://berrange.com</a>=C2=A0 =C2=A0 =C2=A0 -o-=C2=A0 =
=C2=A0 <a href=3D"https://www.flickr.com/photos/dberrange" rel=3D"noreferre=
r noreferrer noreferrer" target=3D"_blank">https://www.flickr.com/photos/db=
errange</a> :|<br>
|: <a href=3D"https://libvirt.org" rel=3D"noreferrer noreferrer noreferrer"=
 target=3D"_blank">https://libvirt.org</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0-o-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 <a href=3D"https://fstop138=
.berrange.com" rel=3D"noreferrer noreferrer noreferrer" target=3D"_blank">h=
ttps://fstop138.berrange.com</a> :|<br>
|: <a href=3D"https://entangle-photo.org" rel=3D"noreferrer noreferrer nore=
ferrer" target=3D"_blank">https://entangle-photo.org</a>=C2=A0 =C2=A0 -o-=
=C2=A0 =C2=A0 <a href=3D"https://www.instagram.com/dberrange" rel=3D"norefe=
rrer noreferrer noreferrer" target=3D"_blank">https://www.instagram.com/dbe=
rrange</a> :|<br>
<br>
</blockquote></div></div></div>

--0000000000000972e20632e1f4de--
