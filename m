Received: by 2002:a17:907:c68a:b0:84d:2074:29bb with SMTP id ue10csp503123ejc;
        Fri, 13 Jan 2023 08:10:30 -0800 (PST)
X-Google-Smtp-Source: AMrXdXsuhCDgArKEW8/3/ztRyAdwx+jia7kckgbwpBtjqMi/erGweyBTlk1QMcJMG3djrhJisutA
X-Received: by 2002:a5b:84e:0:b0:749:199:7a4d with SMTP id v14-20020a5b084e000000b0074901997a4dmr70107450ybq.3.1673626229794;
        Fri, 13 Jan 2023 08:10:29 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1673626229; cv=none;
        d=google.com; s=arc-20160816;
        b=puVWdBjv/YgLiXFwYl0Q2U3rRB/4nk7mi9v5Qfd5w0fEwsUYfQX9kcKkvnLxDnfzbO
         Lz01QPrfdOoS+i4M7QLtNzQ0HI1/QBfX1/xe32i+sjjavJZy3pwYYNgnY8FmzQDd2JrP
         OxYIGGZDkLteU87NZLx3Rce36KNHDvjjMi1evubtTUcYR+d/G+jAg2GnnN5pm/YZOSqZ
         Yg1EFBQf8e+XKYSCmJh7a8DmNJo8z24zKFsx7to07r5kV/JhLjgRm8pOXOOtKCzeT2Zf
         FhokTbJd866p36V2bTFgAjVwY/YwjKSaZbwHhhydMsAGQ1P6efrczdohSfGmpi/SETQN
         bMvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=vkgd2woBpRo26uHCemMo9WU6F0+re3NfVWCPGzqP/EU=;
        b=mRPTFoKkcFccxLW8IJHJkODiQxhXo1kEfDJW/Wk8G3HFVoCpkcTyjhCCjjqB6jM3cv
         b+Dee0pWsVWHAPZv7cMqof30yUeQPGzrOjeA9CwDJL29utSStS2u96FtzJ8q5PT1gcND
         xi/1JVxAlvEDZC70Be6NfF4lQTSQLYr7l5w/KkLqr5oerXavVRaeChLdL4HBgFD/hbzp
         zDkkv7FxGxBVAvmWsyv+qJB5wtel0MC9b3z+5b1Unsoi7UDOTxPN16Mh/HwDfe9+gM0g
         rAHH32QptoaT1sfVGxhF1r+VEDJsJsmvgk1BXHSeReJsEvYxwg6NPJSqpH7hbvuJlUGa
         JgFg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=fLARkXwA;
       spf=pass (google.com: domain of mlureau@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=mlureau@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <mlureau@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id 132-20020a25188a000000b00706f2056da1si18084499yby.86.2023.01.13.08.10.29
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Jan 2023 08:10:29 -0800 (PST)
Received-SPF: pass (google.com: domain of mlureau@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=fLARkXwA;
       spf=pass (google.com: domain of mlureau@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=mlureau@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1673626229;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=vkgd2woBpRo26uHCemMo9WU6F0+re3NfVWCPGzqP/EU=;
	b=fLARkXwA/fUhOIYN0/H/9g/dq/wdP0MMxjde+LoxCzDGlsVequPFzimlArrLs/jAXPn1VQ
	26+5lci1wyHFRC+sGiK/LhhhredzZrBqi8W0I7cCN7/xu0yZINWgyF6CxLXf5MEY/YlCqy
	9+96MJB5KP4CLkF2kkNfy85DECsL1gY=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-459-S4Z51P7zOLqlDhX-vUG7rA-1; Fri, 13 Jan 2023 11:10:28 -0500
X-MC-Unique: S4Z51P7zOLqlDhX-vUG7rA-1
Received: by mail-ej1-f71.google.com with SMTP id dr5-20020a170907720500b00808d17c4f27so15265095ejc.6
        for <alex.bennee@linaro.org>; Fri, 13 Jan 2023 08:10:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vkgd2woBpRo26uHCemMo9WU6F0+re3NfVWCPGzqP/EU=;
        b=HEaVUiZlzbrLFuKJ3oLcSmjpkZ69zQuILCchKAnYoj9o2udfDxL+zOsNGQ9w6iVxAe
         n4wayET1oHnsFmh1jqoCCjr8c088umjI2V+nevn2eFf/gpXfobaXpOe756D3E2stKbI9
         5YjWP3gV6nvIrk1WEEmwq9kpdq29oJXf1V5buw1jk4UNLxSU2C6RF2ZftxMUNhNFJ4lp
         slesTSxdfJlQJEv5mV75V2vi9zXTPxXVK8BiorduEX3Lsxn5DYdm48dmoFx1PWL7kObT
         G+P50pFA5Yqh5mZ4dzLcwz59axTtxjat1eszPF+A5LxeBxTV4fQQaPVIWebMqlV6K5zo
         hNAQ==
X-Gm-Message-State: AFqh2kpuWJ3bIkZjzgwF4YWUfee/ipq1/bQkSxQ+gzrsF74WOP+a7SAV
	Me5lxmSR1K6p4+TgxRFsrCn8I4c2HbdJLbN9DEIbIkMICpWUx+vBilSEO0qvO1UB3GHczXR2D9E
	cY9GBd/ZDpA1evxKoQRoiJMnx/3chK6Qv
X-Received: by 2002:a17:906:5255:b0:7c1:6b1f:e131 with SMTP id y21-20020a170906525500b007c16b1fe131mr5182857ejm.557.1673626225976;
        Fri, 13 Jan 2023 08:10:25 -0800 (PST)
X-Received: by 2002:a17:906:5255:b0:7c1:6b1f:e131 with SMTP id
 y21-20020a170906525500b007c16b1fe131mr5182840ejm.557.1673626225805; Fri, 13
 Jan 2023 08:10:25 -0800 (PST)
MIME-Version: 1.0
References: <20230110173922.265055-1-alex.bennee@linaro.org> <20230110173922.265055-5-alex.bennee@linaro.org>
In-Reply-To: <20230110173922.265055-5-alex.bennee@linaro.org>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
Date: Fri, 13 Jan 2023 20:10:14 +0400
Message-ID: <CAMxuvazJc7Om2o1L+CjsuzK+ECq9aV-BOwi4afDfcGX7Jt6x6g@mail.gmail.com>
Subject: Re: [PATCH 04/26] tests/unit: drop hacky race avoidance in test-io-channel-command
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org, Richard Henderson <richard.henderson@linaro.org>, 
	Alexandre Iooss <erdnaxe@crans.org>, Beraldo Leal <bleal@redhat.com>, Thomas Huth <thuth@redhat.com>, 
	John Snow <jsnow@redhat.com>, Eduardo Habkost <eduardo@habkost.net>, 
	Elena Ufimtseva <elena.ufimtseva@oracle.com>, Ed Maste <emaste@freebsd.org>, 
	Yanan Wang <wangyanan55@huawei.com>, Cleber Rosa <crosa@redhat.com>, 
	Li-Wen Hsu <lwhsu@freebsd.org>, Markus Armbruster <armbru@redhat.com>, 
	Jagannathan Raman <jag.raman@oracle.com>, =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
	=?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
	Michael Roth <michael.roth@amd.com>, Wainer dos Santos Moschetta <wainersm@redhat.com>, qemu-arm@nongnu.org, 
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, Peter Maydell <peter.maydell@linaro.org>, 
	Paolo Bonzini <pbonzini@redhat.com>, Mahmoud Mandour <ma.mandourr@gmail.com>, 
	John G Johnson <john.g.johnson@oracle.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="000000000000ad282405f22778fa"
X-TUID: G2aYAfM+1gTF

--000000000000ad282405f22778fa
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi

On Tue, Jan 10, 2023 at 9:39 PM Alex Benn=C3=A9e <alex.bennee@linaro.org> w=
rote:

> We don't need to play timing games to ensure one socat wins over the
> other, just create the fifo they both can use before spawning the
> processes. However in the process we need to disable two tests for
> Windows platforms as we don't have an abstraction for mkfifo().
>
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1403
> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> ---
>  tests/unit/test-io-channel-command.c | 14 ++++++++++----
>  1 file changed, 10 insertions(+), 4 deletions(-)
>
> diff --git a/tests/unit/test-io-channel-command.c
> b/tests/unit/test-io-channel-command.c
> index 19f72eab96..425e2f5594 100644
> --- a/tests/unit/test-io-channel-command.c
> +++ b/tests/unit/test-io-channel-command.c
> @@ -20,6 +20,8 @@
>
>  #include "qemu/osdep.h"
>  #include <glib/gstdio.h>
> +#include <sys/types.h>
> +#include <sys/stat.h>
>  #include "io/channel-command.h"
>  #include "io-channel-helpers.h"
>  #include "qapi/error.h"
> @@ -29,6 +31,7 @@
>
>  static char *socat =3D NULL;
>
> +#ifndef _WIN32
>

sigh, I give up trying to keep it running on windows then...

You can further cleanup #ifdef stuff it seems

 static void test_io_channel_command_fifo(bool async)
>  {
>      g_autofree gchar *tmpdir =3D
> g_dir_make_tmp("qemu-test-io-channel.XXXXXX", NULL);
> @@ -40,12 +43,13 @@ static void test_io_channel_command_fifo(bool async)
>      QIOChannel *src, *dst;
>      QIOChannelTest *test;
>
> +    if (mkfifo(fifo, 0600)) {
> +        g_error("mkfifo: %s", strerror(errno));
> +    }
> +
>      src =3D QIO_CHANNEL(qio_channel_command_new_spawn((const char **)
> srcargv,
>                                                      O_WRONLY,
>                                                      &error_abort));
> -    /* try to avoid a race to create the socket */
> -    g_usleep(1000);
> -
>      dst =3D QIO_CHANNEL(qio_channel_command_new_spawn((const char **)
> dstargv,
>                                                      O_RDONLY,
>                                                      &error_abort));
> @@ -60,7 +64,6 @@ static void test_io_channel_command_fifo(bool async)
>      g_rmdir(tmpdir);
>  }
>
> -
>  static void test_io_channel_command_fifo_async(void)
>  {
>      if (!socat) {
> @@ -80,6 +83,7 @@ static void test_io_channel_command_fifo_sync(void)
>
>      test_io_channel_command_fifo(false);
>  }
> +#endif
>
>
>  static void test_io_channel_command_echo(bool async)
> @@ -124,10 +128,12 @@ int main(int argc, char **argv)
>
>      socat =3D g_find_program_in_path("socat");
>
> +#ifndef _WIN32
>      g_test_add_func("/io/channel/command/fifo/sync",
>                      test_io_channel_command_fifo_sync);
>      g_test_add_func("/io/channel/command/fifo/async",
>                      test_io_channel_command_fifo_async);
> +#endif
>      g_test_add_func("/io/channel/command/echo/sync",
>                      test_io_channel_command_echo_sync);
>      g_test_add_func("/io/channel/command/echo/async",
> --
> 2.34.1
>
>

--000000000000ad282405f22778fa
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi<br></div><br><div class=3D"gmail_quote=
"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, Jan 10, 2023 at 9:39 PM Ale=
x Benn=C3=A9e &lt;<a href=3D"mailto:alex.bennee@linaro.org" target=3D"_blan=
k">alex.bennee@linaro.org</a>&gt; wrote:<br></div><blockquote class=3D"gmai=
l_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,20=
4,204);padding-left:1ex">We don&#39;t need to play timing games to ensure o=
ne socat wins over the<br>
other, just create the fifo they both can use before spawning the<br>
processes. However in the process we need to disable two tests for<br>
Windows platforms as we don&#39;t have an abstraction for mkfifo().<br>
<br>
Resolves: <a href=3D"https://gitlab.com/qemu-project/qemu/-/issues/1403" re=
l=3D"noreferrer" target=3D"_blank">https://gitlab.com/qemu-project/qemu/-/i=
ssues/1403</a><br>
Signed-off-by: Alex Benn=C3=A9e &lt;<a href=3D"mailto:alex.bennee@linaro.or=
g" target=3D"_blank">alex.bennee@linaro.org</a>&gt;<br>
---<br>
=C2=A0tests/unit/test-io-channel-command.c | 14 ++++++++++----<br>
=C2=A01 file changed, 10 insertions(+), 4 deletions(-)<br>
<br>
diff --git a/tests/unit/test-io-channel-command.c b/tests/unit/test-io-chan=
nel-command.c<br>
index 19f72eab96..425e2f5594 100644<br>
--- a/tests/unit/test-io-channel-command.c<br>
+++ b/tests/unit/test-io-channel-command.c<br>
@@ -20,6 +20,8 @@<br>
<br>
=C2=A0#include &quot;qemu/osdep.h&quot;<br>
=C2=A0#include &lt;glib/gstdio.h&gt;<br>
+#include &lt;sys/types.h&gt;<br>
+#include &lt;sys/stat.h&gt;<br>
=C2=A0#include &quot;io/channel-command.h&quot;<br>
=C2=A0#include &quot;io-channel-helpers.h&quot;<br>
=C2=A0#include &quot;qapi/error.h&quot;<br>
@@ -29,6 +31,7 @@<br>
<br>
=C2=A0static char *socat =3D NULL;<br>
<br>
+#ifndef _WIN32<br></blockquote><div><br></div><div>sigh, I give up trying =
to keep it running on windows then...</div><div><br></div><div>You can furt=
her cleanup #ifdef stuff it seems<br></div><div><br></div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex">
=C2=A0static void test_io_channel_command_fifo(bool async)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0g_autofree gchar *tmpdir =3D g_dir_make_tmp(&quot;qemu-=
test-io-channel.XXXXXX&quot;, NULL);<br>
@@ -40,12 +43,13 @@ static void test_io_channel_command_fifo(bool async)<br=
>
=C2=A0 =C2=A0 =C2=A0QIOChannel *src, *dst;<br>
=C2=A0 =C2=A0 =C2=A0QIOChannelTest *test;<br>
<br>
+=C2=A0 =C2=A0 if (mkfifo(fifo, 0600)) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 g_error(&quot;mkfifo: %s&quot;, strerror(errno=
));<br>
+=C2=A0 =C2=A0 }<br>
+<br>
=C2=A0 =C2=A0 =C2=A0src =3D QIO_CHANNEL(qio_channel_command_new_spawn((cons=
t char **) srcargv,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0O_WRONLY,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&amp;error_abort));<br>
-=C2=A0 =C2=A0 /* try to avoid a race to create the socket */<br>
-=C2=A0 =C2=A0 g_usleep(1000);<br>
-<br>
=C2=A0 =C2=A0 =C2=A0dst =3D QIO_CHANNEL(qio_channel_command_new_spawn((cons=
t char **) dstargv,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0O_RDONLY,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&amp;error_abort));<br>
@@ -60,7 +64,6 @@ static void test_io_channel_command_fifo(bool async)<br>
=C2=A0 =C2=A0 =C2=A0g_rmdir(tmpdir);<br>
=C2=A0}<br>
<br>
-<br>
=C2=A0static void test_io_channel_command_fifo_async(void)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0if (!socat) {<br>
@@ -80,6 +83,7 @@ static void test_io_channel_command_fifo_sync(void)<br>
<br>
=C2=A0 =C2=A0 =C2=A0test_io_channel_command_fifo(false);<br>
=C2=A0}<br>
+#endif<br>
<br>
<br>
=C2=A0static void test_io_channel_command_echo(bool async)<br>
@@ -124,10 +128,12 @@ int main(int argc, char **argv)<br>
<br>
=C2=A0 =C2=A0 =C2=A0socat =3D g_find_program_in_path(&quot;socat&quot;);<br=
>
<br>
+#ifndef _WIN32<br>
=C2=A0 =C2=A0 =C2=A0g_test_add_func(&quot;/io/channel/command/fifo/sync&quo=
t;,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0test_io_channel_command_fifo_sync);<br>
=C2=A0 =C2=A0 =C2=A0g_test_add_func(&quot;/io/channel/command/fifo/async&qu=
ot;,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0test_io_channel_command_fifo_async);<br>
+#endif<br>
=C2=A0 =C2=A0 =C2=A0g_test_add_func(&quot;/io/channel/command/echo/sync&quo=
t;,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0test_io_channel_command_echo_sync);<br>
=C2=A0 =C2=A0 =C2=A0g_test_add_func(&quot;/io/channel/command/echo/async&qu=
ot;,<br>
-- <br>
2.34.1<br>
<br>
</blockquote></div></div>

--000000000000ad282405f22778fa--
