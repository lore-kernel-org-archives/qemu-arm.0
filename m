Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B49F5CEBF93
	for <qemu-arm@archiver.kernel.org>; Tue, 18 Nov 2025 08:08:03 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vLGkR-0006VA-UF; Tue, 18 Nov 2025 03:07:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kkostiuk@redhat.com>)
 id 1vLGkF-0006Tj-7M
 for qemu-arm@nongnu.org; Tue, 18 Nov 2025 03:07:25 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kkostiuk@redhat.com>)
 id 1vLGkC-0003al-7z
 for qemu-arm@nongnu.org; Tue, 18 Nov 2025 03:07:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1763453236;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=3iR+LhXoP2gmp7gqT4xeQERRB6Ft53yT4v6hmhCxXgg=;
 b=JZJGvxSHn8C+gnphs0nKgmNuZRFQmeP5d80WIL6Ykvwmy2mitLzgNN8kNzE7PssAIFNA9c
 7l2p9I9bVijV2fbSqKX7JwjxnjV04O0XTPw3sP2CvoABOWEoo+aHw5Kqc00h1EEBsrscMP
 472ET7wlIdVzQuqc0RkHtelXX88VUPY=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-356-AS9CEyuoNFiKY-S26wnsyQ-1; Tue, 18 Nov 2025 03:07:14 -0500
X-MC-Unique: AS9CEyuoNFiKY-S26wnsyQ-1
X-Mimecast-MFC-AGG-ID: AS9CEyuoNFiKY-S26wnsyQ_1763453234
Received: by mail-qv1-f70.google.com with SMTP id
 6a1803df08f44-880444afa2cso65289896d6.1
 for <qemu-arm@nongnu.org>; Tue, 18 Nov 2025 00:07:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763453234; x=1764058034;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=3iR+LhXoP2gmp7gqT4xeQERRB6Ft53yT4v6hmhCxXgg=;
 b=Rvmd8vG2/zRmuCxj/8kQM+H82oG6ogwRFDtjhcLYM1rGPHK/5UqIvVLXqUlEEcqXKN
 S7jDwgRkNd3x01O2eOyDK89VqrOxMQg3xtkksNW/xZHY76PCV59fy55rIVgTQcc2YwEz
 P2qNn0T8mRhs4wavrCy0cedZxyNaZ+/i6akWn4fZ8vf1rM8O8yUOsAYu4xpd/Jcu8CPi
 VvCOhi0LmGwx8YreJaBG7SGJ7aqyUAwDwN7XM4h+IbOqSbuI+qCfxcGS8h4PdH1e+Yig
 CkkYAgb4KhVGa9tZ3Lcl2qUs+ecBC/M7aQ0oJ66+LwWHnfP5bFvoVUu/EFkwtGGiTWii
 mvNg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUgduY/4aVNF9Ij9xAboA6VqFfwRn7itIFW7i1KSG9FmEoxE3bCeKxxNj3PeYtoUJ6jF/yYcuBEDQ==@nongnu.org
X-Gm-Message-State: AOJu0Yylm40orVmDFPwy21xXVhzN8L0HYYS2KCa4897ylhbCTWBt98L7
 w53O2lxf0SSO/bKfKGSRmsWAna5atvqp4C0ofWt5P8hQYBmwK5e9vYxNnFC2PbKSu7laaL49N8r
 dfS8VcrDcZPHSEz6HkDf6/Qmkoey5Y/VwS0nvhyvoLGYIDbScBXsEIXL4d+ApUJemhIGHgug2Rg
 RFGNOLcufQQjxIT2I5WnDfC1/6b1n4
X-Gm-Gg: ASbGnctheGEqTkZcp9t1e/y0nnvhqeci5gmUefprM/c71FqchKhmLnAVeE9VQhnHwJ/
 adBM5fyfb1lgEgdH7VD1BNICq07l00dP8YpLkoWWm7UNPhot9WhPPo9R20mwYI6tv2Qka3H0V4k
 NWLzD8S+mjC8P5TKL/8DeIv/33/peVJmjBiiv/8+kityZ5POdClww3JgMw17tO9K/OgRed
X-Received: by 2002:a05:6214:248e:b0:882:3453:8248 with SMTP id
 6a1803df08f44-882925f67a9mr208034216d6.28.1763453234125; 
 Tue, 18 Nov 2025 00:07:14 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEIO/f5bNmzx2F3Ep3rmDJZHpgQetc2E9I8LA2YX3HKLbRPvkqghDlIAREe/3qcARk0/IWqwwuMdPI9oRaDSLo=
X-Received: by 2002:a05:6214:248e:b0:882:3453:8248 with SMTP id
 6a1803df08f44-882925f67a9mr208034066d6.28.1763453233745; Tue, 18 Nov 2025
 00:07:13 -0800 (PST)
MIME-Version: 1.0
References: <20251117203834.83713-1-philmd@linaro.org>
 <20251117203834.83713-2-philmd@linaro.org>
In-Reply-To: <20251117203834.83713-2-philmd@linaro.org>
From: Kostiantyn Kostiuk <kkostiuk@redhat.com>
Date: Tue, 18 Nov 2025 10:07:02 +0200
X-Gm-Features: AWmQ_bm8fFLxWPfQ8_R5BIEiu3jhHPTrgiwwsy_xJP43J9JOu1t0hnpJgK4ncrU
Message-ID: <CAPMcbCo9t-WU1PDDNK5reNu2VmL0JSwb_=A=m9U1QYdh1-ajyA@mail.gmail.com>
Subject: Re: [PATCH-for-10.2 1/3] qga/commands: Include proper Solaris header
 for getloadavg()
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, Nick Briggs <nicholas.h.briggs@gmail.com>, 
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
 Li Zhijian <lizhijian@fujitsu.com>, Peter Xu <peterx@redhat.com>, 
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>, 
 Andrew Deason <adeason@sinenomine.net>, Eric Blake <eblake@redhat.com>, 
 Michael Roth <michael.roth@amd.com>, Paolo Bonzini <pbonzini@redhat.com>, 
 Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org, 
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 83bPqU5xAKc6l9-ZK05NemchXA_lLWdXzm34PX80fGE_1763453234
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="0000000000009361530643d9f33f"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kkostiuk@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

--0000000000009361530643d9f33f
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Reviewed-by: Kostiantyn Kostiuk <kkostiuk@redhat.com>

On Mon, Nov 17, 2025 at 10:38=E2=80=AFPM Philippe Mathieu-Daud=C3=A9 <philm=
d@linaro.org>
wrote:

> Solaris declares getloadavg() in <sys/loadavg.h>:
>
>     getloadavg(3C)       Standard C Library Functions       getloadavg(3C=
)
>
>     NAME
>            getloadavg - get system load averages
>
>     SYNOPSIS
>            #include <sys/loadavg.h>
>
>            int getloadavg(double loadavg[], int nelem);
>
>     [...]
>
>     Oracle Solaris 11.4           23 Jul 2020               getloadavg(3C=
)
>
> Include it in order to avoid:
>
>   ../qga/commands-posix.c: In function 'qmp_guest_get_load':
>   ../qga/commands-posix.c:1408:9: error: implicit declaration of function
> 'getloadavg' [-Wimplicit-function-declaration]
>    1408 |     if (getloadavg(loadavg, G_N_ELEMENTS(loadavg)) < 0) {
>       |         ^~~~~~~~~~
>   ../qga/commands-posix.c:1408:9: warning: nested extern declaration of
> 'getloadavg' [-Wnested-externs]
>
> ../configure relevant output:
>
>   C compiler for the host machine: gcc (gcc 14.2.0 "gcc (GCC) 14.2.0")
>   C linker for the host machine: gcc ld.solaris 5.11-1.3315
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
> ---
>  qga/commands-posix.c | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/qga/commands-posix.c b/qga/commands-posix.c
> index c7059857e44..66f3e6f6733 100644
> --- a/qga/commands-posix.c
> +++ b/qga/commands-posix.c
> @@ -43,6 +43,9 @@
>  #include <net/ethernet.h>
>  #endif
>  #ifdef CONFIG_SOLARIS
> +#ifdef CONFIG_GETLOADAVG
> +#include <sys/loadavg.h>
> +#endif
>  #include <sys/sockio.h>
>  #endif
>  #endif
> --
> 2.51.0
>
>

--0000000000009361530643d9f33f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Reviewed-by: Kostiantyn Kostiuk &lt;<a href=3D"mailto:kkos=
tiuk@redhat.com" target=3D"_blank">kkostiuk@redhat.com</a>&gt;</div><br><di=
v class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, Nov 1=
7, 2025 at 10:38=E2=80=AFPM Philippe Mathieu-Daud=C3=A9 &lt;<a href=3D"mail=
to:philmd@linaro.org" target=3D"_blank">philmd@linaro.org</a>&gt; wrote:<br=
></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;=
border-left:1px solid rgb(204,204,204);padding-left:1ex">Solaris declares g=
etloadavg() in &lt;sys/loadavg.h&gt;:<br>
<br>
=C2=A0 =C2=A0 getloadavg(3C)=C2=A0 =C2=A0 =C2=A0 =C2=A0Standard C Library F=
unctions=C2=A0 =C2=A0 =C2=A0 =C2=A0getloadavg(3C)<br>
<br>
=C2=A0 =C2=A0 NAME<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0getloadavg - get system load avera=
ges<br>
<br>
=C2=A0 =C2=A0 SYNOPSIS<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0#include &lt;sys/loadavg.h&gt;<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0int getloadavg(double loadavg[], i=
nt nelem);<br>
<br>
=C2=A0 =C2=A0 [...]<br>
<br>
=C2=A0 =C2=A0 Oracle Solaris 11.4=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A02=
3 Jul 2020=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0getloadavg=
(3C)<br>
<br>
Include it in order to avoid:<br>
<br>
=C2=A0 ../qga/commands-posix.c: In function &#39;qmp_guest_get_load&#39;:<b=
r>
=C2=A0 ../qga/commands-posix.c:1408:9: error: implicit declaration of funct=
ion &#39;getloadavg&#39; [-Wimplicit-function-declaration]<br>
=C2=A0 =C2=A01408 |=C2=A0 =C2=A0 =C2=A0if (getloadavg(loadavg, G_N_ELEMENTS=
(loadavg)) &lt; 0) {<br>
=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0^~~~~~~~~~<br>
=C2=A0 ../qga/commands-posix.c:1408:9: warning: nested extern declaration o=
f &#39;getloadavg&#39; [-Wnested-externs]<br>
<br>
../configure relevant output:<br>
<br>
=C2=A0 C compiler for the host machine: gcc (gcc 14.2.0 &quot;gcc (GCC) 14.=
2.0&quot;)<br>
=C2=A0 C linker for the host machine: gcc ld.solaris 5.11-1.3315<br>
<br>
Signed-off-by: Philippe Mathieu-Daud=C3=A9 &lt;<a href=3D"mailto:philmd@lin=
aro.org" target=3D"_blank">philmd@linaro.org</a>&gt;<br>
---<br>
=C2=A0qga/commands-posix.c | 3 +++<br>
=C2=A01 file changed, 3 insertions(+)<br>
<br>
diff --git a/qga/commands-posix.c b/qga/commands-posix.c<br>
index c7059857e44..66f3e6f6733 100644<br>
--- a/qga/commands-posix.c<br>
+++ b/qga/commands-posix.c<br>
@@ -43,6 +43,9 @@<br>
=C2=A0#include &lt;net/ethernet.h&gt;<br>
=C2=A0#endif<br>
=C2=A0#ifdef CONFIG_SOLARIS<br>
+#ifdef CONFIG_GETLOADAVG<br>
+#include &lt;sys/loadavg.h&gt;<br>
+#endif<br>
=C2=A0#include &lt;sys/sockio.h&gt;<br>
=C2=A0#endif<br>
=C2=A0#endif<br>
-- <br>
2.51.0<br>
<br>
</blockquote></div>

--0000000000009361530643d9f33f--


