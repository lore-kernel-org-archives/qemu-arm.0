Received: by 2002:adf:a557:0:0:0:0:0 with SMTP id j23csp4703368wrb;
        Wed, 10 Jul 2019 02:18:01 -0700 (PDT)
X-Received: by 2002:aca:b406:: with SMTP id d6mr2604722oif.173.1562750281065;
        Wed, 10 Jul 2019 02:18:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1562750281; cv=none;
        d=google.com; s=arc-20160816;
        b=EctRTOgNWZD0/3kH0yKO9bFkNQqn07L8BdBsz2jN2mnfaUTBJUV6R+gBwE52GIpio9
         26JrKJxEx0FsxGgIbwXaCeRJqbL2ZhloitXBOyPtEdcwtn6rTKn4txDBZb0o70dspy5T
         ym/rxwVZDfxSeKc5bAlJZRiE9OaTiuTYwvRPVNNWEgdGDZbvahOBOoGdDZjoj2dz6mz7
         wULRM6gc1w73+ZUIxJuFa9pVTuVRvnrTWgVu+7yADoQlcze/VIqQpGxK6V8hnlKrvGzL
         vGfchj/0M4xMjGI5pjkSXXWT9Z44INgTV/z/lw8Ef/yzDN53d/NxNPePiXqYcAqx2B1K
         4bwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:subject:message-id:date:from:references:in-reply-to
         :mime-version:dkim-signature;
        bh=TfkIJsjeqUROcHWl3drZrM/brmN8+MRc8b8b7cP4CDM=;
        b=VzM4XsufSBmVD5RfmMimGyaSiUnzL4euHOrU9VTpaaJO2CZHsS3ZJCXVyfpjwHe06v
         DYlhZDLgcC10oKtCVcg1H6W59Ra3ko821OADZyEUmDIzjToe8HnqsXqBhuJtI2hlSA5B
         epWoFRwqj5X8sdT/fwTg0A0UreBFJEFaUPC2d3CBRB+bFlAcSk6aLNlJPqgsjSu87NH5
         x1bMnL2wnnBQHcKOflx4owa9f9HSb+GJtmnzwUuKpVQoGH+HP6gN9VEXOiQcVh7LWnK/
         G41umsphrsMJQvpCg8PIrmNN+t6pGHQdz304dKq6RbQtAvm0YqAMIGIMlODdnNs3bYl4
         jhPQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=UU7imOps;
       spf=pass (google.com: domain of aleksandar.m.mail@gmail.com designates 209.85.220.65 as permitted sender) smtp.mailfrom=aleksandar.m.mail@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <aleksandar.m.mail@gmail.com>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id l13sor773731otr.23.2019.07.10.02.18.00
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 10 Jul 2019 02:18:01 -0700 (PDT)
Received-SPF: pass (google.com: domain of aleksandar.m.mail@gmail.com designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=UU7imOps;
       spf=pass (google.com: domain of aleksandar.m.mail@gmail.com designates 209.85.220.65 as permitted sender) smtp.mailfrom=aleksandar.m.mail@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc;
        bh=TfkIJsjeqUROcHWl3drZrM/brmN8+MRc8b8b7cP4CDM=;
        b=UU7imOpscOOvaBTyrJRxPdjRIa1/XDRypuW9zqWcvbaCtoTcYWLl1wJzSzKXTNTa2S
         d79WWflu9gsXnYvYgweFzW4Z9+t9iUsWlhXlWCGYs9szKo/0V5BIuzuNtjI0grp9QhsM
         3KFpKCvyWIwDOjlKsVssHt31DMrbNoQnIod/VKuB2dUvkUU8q6UtBas6AyUCmS0YE8U4
         wNtzFeoFbLPH04kdJcOIXJDywkxH6w4XYWl9swo3slbTwx8Rk9PR4HQrB7RxpV+jJYY4
         CrgJ6CiQzyGdLC/svUs9vP+PEQlXqEb0u7k0VBND8imX2XB0Ajq+QS4i5nLJTcKAYZqp
         pBmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from:date
         :message-id:subject:to:cc;
        bh=TfkIJsjeqUROcHWl3drZrM/brmN8+MRc8b8b7cP4CDM=;
        b=YfpYGR8PcLGmG8g3kk+Uq4OXjGnpNwOhTrwOs775L9GY7OO+exKXfcNSNK9cwmR6do
         L5iUP0obOi6yP9ykq8kvJQewXwxhxluV8oljOCXQ4DqKG3k3VaqwldbM+EJG5KY9opzA
         mXle/5tLsanV8NfWWF7pKT86MXexEZQtt3QrVWnt2uiE8LlKLhr0A3cZmtDYFOU0yX2r
         l0NLgCHJ/p1YGNIV3SK0nJIyciv2N42X/V2eUFtrL1z4HKXJIdKyqxhPVxp22as9crld
         gKoEgcia0Ht1yMeGTrDPigdKBhI97ZbffrpD3mz8muYkTa6/JmJ5PBAHlnyQOuYvrYvy
         AhdA==
X-Gm-Message-State: APjAAAWdDreAikXI/b5DjthR6ONc2Ne/3DRbGfDWUzdBV/8OyjLtY8P4
	XrYU2Kj21pt49jmrf+MLm2bFGgP1hCVTj9T/h0GA/Q==
X-Google-Smtp-Source: APXvYqzx85w5pAtzh2nrlYTmITXXqiRT0M9OIuujUfXlKPQmnCcru1vOGzWQA9w44fPLEh5sW6SFOlWeqyrUsC0ctV8=
X-Received: by 2002:a05:6830:c6:: with SMTP id x6mr6190688oto.64.1562750280435;
 Wed, 10 Jul 2019 02:18:00 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:4798:0:0:0:0:0 with HTTP; Wed, 10 Jul 2019 02:17:59
 -0700 (PDT)
Received: by 2002:a9d:4798:0:0:0:0:0 with HTTP; Wed, 10 Jul 2019 02:17:59
 -0700 (PDT)
In-Reply-To: <20190705160421.19015-6-alex.bennee@linaro.org>
References: <20190705160421.19015-1-alex.bennee@linaro.org> <20190705160421.19015-6-alex.bennee@linaro.org>
From: Aleksandar Markovic <aleksandar.m.mail@gmail.com>
Date: Wed, 10 Jul 2019 11:17:59 +0200
Message-ID: <CAL1e-=i08h1j0V7d97p7a-OQqdNXzG1s5QATmLDxfGCDtwE-4Q@mail.gmail.com>
Subject: Re: [Qemu-devel] [PATCH v1 5/5] gdbstub: revert to previous set_reg behaviour
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org, =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>, 
	Jon Doron <arilou@gmail.com>, qemu-arm@nongnu.org, 
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Content-Type: multipart/alternative; boundary="000000000000568d9b058d50278b"
X-TUID: SvyIz16z71X2

--000000000000568d9b058d50278b
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Jul 5, 2019 6:08 PM, "Alex Benn=C3=A9e" <alex.bennee@linaro.org> wrote:
>
> The refactoring of handle_set_reg missed the fact we previously had
> responded with an empty packet when we were not using XML based
> protocols. This broke the fallback behaviour for architectures that
> don't have registers defined in QEMU's gdb-xml directory.
>
> Revert to the previous behaviour and clean up the commentary for what
> is going on.
>
> Fixes: 62b3320bddd
> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> Cc: Jon Doron <arilou@gmail.com>
> Cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
> ---

Do you plan to integrate this patch in 4.1?

Thanks, Aleksandar

>  gdbstub.c | 18 ++++++++++++------
>  1 file changed, 12 insertions(+), 6 deletions(-)
>
> diff --git a/gdbstub.c b/gdbstub.c
> index ea3349d1aa..b6df7ee25a 100644
> --- a/gdbstub.c
> +++ b/gdbstub.c
> @@ -1669,12 +1669,23 @@ static void handle_remove_bp(GdbCmdContext
*gdb_ctx, void *user_ctx)
>      put_packet(gdb_ctx->s, "E22");
>  }
>
> +/*
> + * handle_set/get_reg
> + *
> + * Older gdb are really dumb, and don't use 'G/g' if 'P/p' is available.
> + * This works, but can be very slow. Anything new enough to understand
> + * XML also knows how to use this properly. However to use this we
> + * need to define a local XML file as well as be talking to a
> + * reasonably modern gdb. Responding with an empty packet will cause
> + * the remote gdb to fallback to older methods.
> + */
> +
>  static void handle_set_reg(GdbCmdContext *gdb_ctx, void *user_ctx)
>  {
>      int reg_size;
>
>      if (!gdb_has_xml) {
> -        put_packet(gdb_ctx->s, "E00");
> +        put_packet(gdb_ctx->s, "");
>          return;
>      }
>
> @@ -1694,11 +1705,6 @@ static void handle_get_reg(GdbCmdContext *gdb_ctx,
void *user_ctx)
>  {
>      int reg_size;
>
> -    /*
> -     * Older gdb are really dumb, and don't use 'g' if 'p' is avaialable=
.
> -     * This works, but can be very slow.  Anything new enough to
> -     * understand XML also knows how to use this properly.
> -     */
>      if (!gdb_has_xml) {
>          put_packet(gdb_ctx->s, "");
>          return;
> --
> 2.20.1
>
>

--000000000000568d9b058d50278b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<p dir=3D"ltr"><br>
On Jul 5, 2019 6:08 PM, &quot;Alex Benn=C3=A9e&quot; &lt;<a href=3D"mailto:=
alex.bennee@linaro.org">alex.bennee@linaro.org</a>&gt; wrote:<br>
&gt;<br>
&gt; The refactoring of handle_set_reg missed the fact we previously had<br=
>
&gt; responded with an empty packet when we were not using XML based<br>
&gt; protocols. This broke the fallback behaviour for architectures that<br=
>
&gt; don&#39;t have registers defined in QEMU&#39;s gdb-xml directory.<br>
&gt;<br>
&gt; Revert to the previous behaviour and clean up the commentary for what<=
br>
&gt; is going on.<br>
&gt;<br>
&gt; Fixes: 62b3320bddd<br>
&gt; Signed-off-by: Alex Benn=C3=A9e &lt;<a href=3D"mailto:alex.bennee@lina=
ro.org">alex.bennee@linaro.org</a>&gt;<br>
&gt; Reviewed-by: Philippe Mathieu-Daud=C3=A9 &lt;<a href=3D"mailto:philmd@=
redhat.com">philmd@redhat.com</a>&gt;<br>
&gt; Cc: Jon Doron &lt;<a href=3D"mailto:arilou@gmail.com">arilou@gmail.com=
</a>&gt;<br>
&gt; Cc: Mark Cave-Ayland &lt;<a href=3D"mailto:mark.cave-ayland@ilande.co.=
uk">mark.cave-ayland@ilande.co.uk</a>&gt;<br>
&gt; ---</p>
<p dir=3D"ltr">Do you plan to integrate this patch in 4.1?</p>
<p dir=3D"ltr">Thanks, Aleksandar</p>
<p dir=3D"ltr">&gt; =C2=A0gdbstub.c | 18 ++++++++++++------<br>
&gt; =C2=A01 file changed, 12 insertions(+), 6 deletions(-)<br>
&gt;<br>
&gt; diff --git a/gdbstub.c b/gdbstub.c<br>
&gt; index ea3349d1aa..b6df7ee25a 100644<br>
&gt; --- a/gdbstub.c<br>
&gt; +++ b/gdbstub.c<br>
&gt; @@ -1669,12 +1669,23 @@ static void handle_remove_bp(GdbCmdContext *gd=
b_ctx, void *user_ctx)<br>
&gt; =C2=A0 =C2=A0 =C2=A0put_packet(gdb_ctx-&gt;s, &quot;E22&quot;);<br>
&gt; =C2=A0}<br>
&gt;<br>
&gt; +/*<br>
&gt; + * handle_set/get_reg<br>
&gt; + *<br>
&gt; + * Older gdb are really dumb, and don&#39;t use &#39;G/g&#39; if &#39=
;P/p&#39; is available.<br>
&gt; + * This works, but can be very slow. Anything new enough to understan=
d<br>
&gt; + * XML also knows how to use this properly. However to use this we<br=
>
&gt; + * need to define a local XML file as well as be talking to a<br>
&gt; + * reasonably modern gdb. Responding with an empty packet will cause<=
br>
&gt; + * the remote gdb to fallback to older methods.<br>
&gt; + */<br>
&gt; +<br>
&gt; =C2=A0static void handle_set_reg(GdbCmdContext *gdb_ctx, void *user_ct=
x)<br>
&gt; =C2=A0{<br>
&gt; =C2=A0 =C2=A0 =C2=A0int reg_size;<br>
&gt;<br>
&gt; =C2=A0 =C2=A0 =C2=A0if (!gdb_has_xml) {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 put_packet(gdb_ctx-&gt;s, &quot;E00&quot;=
);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 put_packet(gdb_ctx-&gt;s, &quot;&quot;);<=
br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return;<br>
&gt; =C2=A0 =C2=A0 =C2=A0}<br>
&gt;<br>
&gt; @@ -1694,11 +1705,6 @@ static void handle_get_reg(GdbCmdContext *gdb_c=
tx, void *user_ctx)<br>
&gt; =C2=A0{<br>
&gt; =C2=A0 =C2=A0 =C2=A0int reg_size;<br>
&gt;<br>
&gt; -=C2=A0 =C2=A0 /*<br>
&gt; -=C2=A0 =C2=A0 =C2=A0* Older gdb are really dumb, and don&#39;t use &#=
39;g&#39; if &#39;p&#39; is avaialable.<br>
&gt; -=C2=A0 =C2=A0 =C2=A0* This works, but can be very slow.=C2=A0 Anythin=
g new enough to<br>
&gt; -=C2=A0 =C2=A0 =C2=A0* understand XML also knows how to use this prope=
rly.<br>
&gt; -=C2=A0 =C2=A0 =C2=A0*/<br>
&gt; =C2=A0 =C2=A0 =C2=A0if (!gdb_has_xml) {<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0put_packet(gdb_ctx-&gt;s, &quot;&quo=
t;);<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return;<br>
&gt; -- <br>
&gt; 2.20.1<br>
&gt;<br>
&gt;<br>
</p>

--000000000000568d9b058d50278b--
