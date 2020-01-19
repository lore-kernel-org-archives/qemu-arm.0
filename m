Received: by 2002:a19:c345:0:0:0:0:0 with SMTP id t66csp952304lff;
        Sat, 18 Jan 2020 16:27:06 -0800 (PST)
X-Received: by 2002:a92:1906:: with SMTP id 6mr5144618ilz.130.1579393625952;
        Sat, 18 Jan 2020 16:27:05 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1579393625; cv=none;
        d=google.com; s=arc-20160816;
        b=jHfQHIHU/vEX0J9gH6gWNy5k2rMGxUlLsdAsO+KlRJyPD0FG0/9i1DV3TzZAf5irMz
         ef9geK1rGQ1OMliOCbh7Hxlg3vZcoRkTGI4Q3KAP44c13aAvuiTrJMLleF0hmS/eXa5v
         6TtoR98plvMUPkxTgMXXnquSNV/GzLsHNP6oca3EHSk+WybyxS5nu3S1aQx4+ucvn3AN
         rpMvYEBkgAQ4u2cpbgl9pYUJoumTW6OJ2fNHlPyoNYmozySiwXAyqh0i9bWjhx9l98ku
         dPqcfwebYj3zNOxfkOAkY6wXPZajpBrKrh2VlfDa7nVmiBDxm9vfy0KMA17Wf+Pgipyx
         sa5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=qaDTQE9Xs/M5JD5bz7OeKEUK7FrITUNeOBAznWlPD0s=;
        b=jMFNmHgfjy8U60XK0Wt3ladXHp8xPe6Bn8GAUIppPMPh0w26BZz/0mlEAiDthzkpgK
         33Fk5Co8SOYQsx0S1ZyGBej0qzsQv6mKAmF/6xduDjZ6CYsfDAeE3lfqtUpbdKKLVeBL
         f3vAfnbh2TVNYLPFPrve6YD32Ryfymi3iO4a1/hA3qCZqQ4pR2Ng9rBO9v2xsKnla+pz
         ixAq9r37t51qvn63TFavvTu1/oVn2siJT21RyNa4bNh4r+S8F8a/qbwro4lyXNXJjvea
         Mmewpt/9HXf46iFVrueY+w+bRz6Tolhuhjd+gBwsz5VB24hVoBYQi0jneFV+OD7qDaQM
         RwEg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=OKNdJKCf;
       spf=pass (google.com: domain of nieklinnenbank@gmail.com designates 209.85.220.65 as permitted sender) smtp.mailfrom=nieklinnenbank@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <nieklinnenbank@gmail.com>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id q3sor28848939jaa.10.2020.01.18.16.27.05
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Sat, 18 Jan 2020 16:27:05 -0800 (PST)
Received-SPF: pass (google.com: domain of nieklinnenbank@gmail.com designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=OKNdJKCf;
       spf=pass (google.com: domain of nieklinnenbank@gmail.com designates 209.85.220.65 as permitted sender) smtp.mailfrom=nieklinnenbank@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=qaDTQE9Xs/M5JD5bz7OeKEUK7FrITUNeOBAznWlPD0s=;
        b=OKNdJKCfM6s/XO8q5AucRvbJfGh+/GfWv+DJowTMUxq9L8Jxc4MUGCctmdlBKacr+6
         xzubt/7pcuj53HaslAkm5KBnO7tx99OndLQGJKCrD14VJbJyKLTHjbpUdxtmZV2TOvB2
         9DGEXR9EKmz/kAczlVnf71OFeC9RuK2H0XfCOPfcnwSpjh4VBMycXzsXlo9ZLihf4AEi
         zsS6HZCVphkBcz3e6CA/U5B4CwLdPSS4T9bUZoXZgarB9uAnvAp4Qkhx2E43j0YOUWsj
         dP7wEwfoY+bOhDhpEDaFVU+AL4/m/JgE+KCISNpLDGAIrl6mAj7Tn1L7BheM35L9nTCY
         WZ1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=qaDTQE9Xs/M5JD5bz7OeKEUK7FrITUNeOBAznWlPD0s=;
        b=jf6rXhAof6ni0m44iGwDbqDTRG9kvEkw2BjNj0VKlljXvlEGTdOXQbTEvTCZH7NP4K
         eYP7etGeY01Cw0pqzasu5raIoQXr7bDe4TfPbdJA6Luch1uUvKN7NS9Gko8Zm+PX2ZKB
         4HdURai6VaxjuRVMIQKoHkB59YKWzY30n+O7plgh1/BWuys3ice5X5xVy+Isi+hKwS4Y
         qIZ6h1DAd6lBeaOBDnveZvXTN9KMkHoHSrnMiK0qn4hcEnhhtdaH3ijQPl0o9z9TBRrO
         jXHL9FgOK2jylkTNp/A0W8vxxIjy8EP/xsxUGaRbRHedyLWp3xMd7yZMs2rgqcDgHqZh
         UpgA==
X-Gm-Message-State: APjAAAVDwVGu5nvGHBKjZvQzwZE3sy/FgKq0M90nvjfZL20q6yLcEqN3
	smQLe3KtoAPg6Wi+BYRnpc2/ezggxSXnm9Jetlw=
X-Google-Smtp-Source: APXvYqwrjQ1Skzf7Yi8ID6NpJkv/K3tHsMWNd2V/dbHHtuLBpaj7i+pWnbplKmDRT7nvU1m5I1AaQXruf5LsBC4cfU8=
X-Received: by 2002:a02:856a:: with SMTP id g97mr6430035jai.97.1579393625624;
 Sat, 18 Jan 2020 16:27:05 -0800 (PST)
MIME-Version: 1.0
References: <20200118191623.32549-1-f4bug@amsat.org> <20200118191623.32549-3-f4bug@amsat.org>
In-Reply-To: <20200118191623.32549-3-f4bug@amsat.org>
From: Niek Linnenbank <nieklinnenbank@gmail.com>
Date: Sun, 19 Jan 2020 01:26:54 +0100
Message-ID: <CAPan3WpecxTceifvgfpyrO=BHufU1v=2UrCXbfBGXAJx+Dm0pw@mail.gmail.com>
Subject: Re: [PATCH 2/4] Acceptance tests: Add interrupt_interactive_console_until_pattern()
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Cc: QEMU Developers <qemu-devel@nongnu.org>, Cleber Rosa <crosa@redhat.com>, 
	=?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
	Eduardo Habkost <ehabkost@redhat.com>, Fam Zheng <fam@euphon.net>, qemu-arm <qemu-arm@nongnu.org>, 
	=?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>, 
	Kamil Rytarowski <kamil@netbsd.org>
Content-Type: multipart/alternative; boundary="000000000000041689059c733c3c"
X-TUID: 0bmh8zTXiwCd

--000000000000041689059c733c3c
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Jan 18, 2020 at 8:16 PM Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.or=
g>
wrote:

> We need a function to interrupt interactive consoles.
>
> Example: Interrupt U-Boot to set different environment values.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
>
Tested-by: Niek Linnenbank <nieklinnenbank@gmail.com>

> ---
>  tests/acceptance/avocado_qemu/__init__.py | 32 +++++++++++++++++++++--
>  1 file changed, 30 insertions(+), 2 deletions(-)
>
> diff --git a/tests/acceptance/avocado_qemu/__init__.py
> b/tests/acceptance/avocado_qemu/__init__.py
> index 0a50fcf2be..d4358eb431 100644
> --- a/tests/acceptance/avocado_qemu/__init__.py
> +++ b/tests/acceptance/avocado_qemu/__init__.py
> @@ -56,13 +56,15 @@ def pick_default_qemu_bin(arch=3DNone):
>
>
>  def _console_interaction(test, success_message, failure_message,
> -                         send_string):
> +                         send_string, keep_sending=3DFalse):
> +    assert not keep_sending or send_string
>      console =3D test.vm.console_socket.makefile()
>      console_logger =3D logging.getLogger('console')
>      while True:
>          if send_string:
>              test.vm.console_socket.sendall(send_string.encode())
> -            send_string =3D None # send only once
> +            if not keep_sending:
> +                send_string =3D None # send only once
>          msg =3D console.readline().strip()
>          if not msg:
>              continue
> @@ -74,6 +76,32 @@ def _console_interaction(test, success_message,
> failure_message,
>              fail =3D 'Failure message found in console: %s' %
> failure_message
>              test.fail(fail)
>
> +def interrupt_interactive_console_until_pattern(test, success_message,
> +                                                failure_message=3DNone,
> +                                                interrupt_string=3D'\r')=
:
> +    """
> +    Keep sending a string to interrupt a console prompt, while logging t=
he
> +    console output. Typical use case is to break a boot loader prompt,
> such:
> +
> +        Press a key within 5 seconds to interrupt boot process.
> +        5
> +        4
> +        3
> +        2
> +        1
> +        Booting default image...
> +
> +    :param test: an Avocado test containing a VM that will have its
> console
> +                 read and probed for a success or failure message
> +    :type test: :class:`avocado_qemu.Test`
> +    :param success_message: if this message appears, test succeeds
> +    :param failure_message: if this message appears, test fails
> +    :param interrupt_string: a string to send to the console before tryi=
ng
> +                             to read a new line
> +    """
> +    _console_interaction(test, success_message, failure_message,
> +                         interrupt_string, True)
> +
>  def wait_for_console_pattern(test, success_message, failure_message=3DNo=
ne):
>      """
>      Waits for messages to appear on the console, while logging the conte=
nt
> --
> 2.21.1
>
>

--=20
Niek Linnenbank

--000000000000041689059c733c3c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Sat, Jan 18, 2020 at 8:16 PM Phili=
ppe Mathieu-Daud=C3=A9 &lt;<a href=3D"mailto:f4bug@amsat.org">f4bug@amsat.o=
rg</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margi=
n:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex=
">We need a function to interrupt interactive consoles.<br>
<br>
Example: Interrupt U-Boot to set different environment values.<br>
<br>
Signed-off-by: Philippe Mathieu-Daud=C3=A9 &lt;<a href=3D"mailto:f4bug@amsa=
t.org" target=3D"_blank">f4bug@amsat.org</a>&gt;<br></blockquote><div>Teste=
d-by: Niek Linnenbank &lt;<a href=3D"mailto:nieklinnenbank@gmail.com">niekl=
innenbank@gmail.com</a>&gt; <br></div><blockquote class=3D"gmail_quote" sty=
le=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddi=
ng-left:1ex">
---<br>
=C2=A0tests/acceptance/avocado_qemu/__init__.py | 32 +++++++++++++++++++++-=
-<br>
=C2=A01 file changed, 30 insertions(+), 2 deletions(-)<br>
<br>
diff --git a/tests/acceptance/avocado_qemu/__init__.py b/tests/acceptance/a=
vocado_qemu/__init__.py<br>
index 0a50fcf2be..d4358eb431 100644<br>
--- a/tests/acceptance/avocado_qemu/__init__.py<br>
+++ b/tests/acceptance/avocado_qemu/__init__.py<br>
@@ -56,13 +56,15 @@ def pick_default_qemu_bin(arch=3DNone):<br>
<br>
<br>
=C2=A0def _console_interaction(test, success_message, failure_message,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0send_string):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0send_string, keep_sending=3DFalse):<br>
+=C2=A0 =C2=A0 assert not keep_sending or send_string<br>
=C2=A0 =C2=A0 =C2=A0console =3D test.vm.console_socket.makefile()<br>
=C2=A0 =C2=A0 =C2=A0console_logger =3D logging.getLogger(&#39;console&#39;)=
<br>
=C2=A0 =C2=A0 =C2=A0while True:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if send_string:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0test.vm.console_socket.send=
all(send_string.encode())<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 send_string =3D None # send only=
 once<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if not keep_sending:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 send_string =3D No=
ne # send only once<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0msg =3D console.readline().strip()<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if not msg:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0continue<br>
@@ -74,6 +76,32 @@ def _console_interaction(test, success_message, failure_=
message,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fail =3D &#39;Failure messa=
ge found in console: %s&#39; % failure_message<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0test.fail(fail)<br>
<br>
+def interrupt_interactive_console_until_pattern(test, success_message,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 failure_message=3DNone,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 interrupt_string=3D&#39;\r&#39;):<br>
+=C2=A0 =C2=A0 &quot;&quot;&quot;<br>
+=C2=A0 =C2=A0 Keep sending a string to interrupt a console prompt, while l=
ogging the<br>
+=C2=A0 =C2=A0 console output. Typical use case is to break a boot loader p=
rompt, such:<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 Press a key within 5 seconds to interrupt boot=
 process.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 5<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 4<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 3<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 2<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 1<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 Booting default image...<br>
+<br>
+=C2=A0 =C2=A0 :param test: an Avocado test containing a VM that will have =
its console<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0read and pro=
bed for a success or failure message<br>
+=C2=A0 =C2=A0 :type test: :class:`avocado_qemu.Test`<br>
+=C2=A0 =C2=A0 :param success_message: if this message appears, test succee=
ds<br>
+=C2=A0 =C2=A0 :param failure_message: if this message appears, test fails<=
br>
+=C2=A0 =C2=A0 :param interrupt_string: a string to send to the console bef=
ore trying<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0to read a new line<br>
+=C2=A0 =C2=A0 &quot;&quot;&quot;<br>
+=C2=A0 =C2=A0 _console_interaction(test, success_message, failure_message,=
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0interrupt_string, True)<br>
+<br>
=C2=A0def wait_for_console_pattern(test, success_message, failure_message=
=3DNone):<br>
=C2=A0 =C2=A0 =C2=A0&quot;&quot;&quot;<br>
=C2=A0 =C2=A0 =C2=A0Waits for messages to appear on the console, while logg=
ing the content<br>
-- <br>
2.21.1<br>
<br>
</blockquote></div><br clear=3D"all"><br>-- <br><div dir=3D"ltr" class=3D"g=
mail_signature"><div dir=3D"ltr"><div>Niek Linnenbank<br><br></div></div></=
div></div>

--000000000000041689059c733c3c--
