Received: by 2002:a05:6000:88:0:0:0:0 with SMTP id m8csp967726wrx;
        Thu, 28 Mar 2019 11:54:37 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwAUNS6Gqc7Sm1sDjDp3ycRLGviGx1RVnX+I3XQJvLg69vFi6rpATwntWEbr7yVfXCyyhXt
X-Received: by 2002:a02:9a12:: with SMTP id b18mr32028623jal.45.1553799276929;
        Thu, 28 Mar 2019 11:54:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1553799276; cv=none;
        d=google.com; s=arc-20160816;
        b=LoNEjVtiOAehLjb2uf18Qk13ICIPEEWk1qX4/S/W6RZwGYP9p63rr3JL5+JByxA4XN
         tGB3ABclOSxWfB14urMTQO8tXIBCQH9xU708g5sQQJ9H5PUz2NJVeKAWL4BTdlb/tBds
         izS+DLVJAFXlx4rXix4US0+VUYlKqbzTsvq5IrYa93GPO+/42Yvx5o4Q1IVDO3uk1J/h
         80jY8+2o3Lx2eLDEoHN8w9uqPAjvHvh3bZrRLkQjw11O+MdzLmLhr5ToAq6JYhBl8UpY
         KsixO/yBDUTEO/q6gAPwXCOf99QGbNXgVRYFgjuNZwLDDwIRMKDLcMk4C2dMdUsHdryY
         rwFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :in-reply-to:references:mime-version;
        bh=A4LAx65JwVqjnYc9tkPn4fThktnvCBxPqXTWDYlv0U4=;
        b=it7Ynb0lZewx25OibIHLwbSPqxCy0LSZiR53PTUy9vJJ9eiLPG6T2I9kfpKd6mbk7m
         HVLgOl94hoUibB/M/dc1D6WnCpi5NC0i2zZFliF4QooOp4CUvuDjoWf5Y5KilbXZVhrI
         /4SnBrqmwj7pSes2/gqXCplwl3IbIS+iAUHDpXpV5vxdJ9+ubK+bJ1U5/WU2JnQ9G4kn
         qPSTZNyYtskzRKbBUq1YfpJ8K5d78GQ7vcOzMNA8CyDpzzJGoyWH03NWCBfP7N9NT6x9
         IuB/CmiHc1J984YeakUyM86TWFyOhGQkfNBzNNW8I/RAbzEiTjWbFt3/i7BbfjX3FuLJ
         MtwA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s16si2226337itk.65.2019.03.28.11.54.36
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 28 Mar 2019 11:54:36 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([127.0.0.1]:40728 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1h9aAe-0001Em-8J
	for alex.bennee@linaro.org; Thu, 28 Mar 2019 14:54:36 -0400
Received: from eggs.gnu.org ([209.51.188.92]:50867)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1h9aAW-0001EN-9n
	for qemu-arm@nongnu.org; Thu, 28 Mar 2019 14:54:29 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1h9aAV-0006rL-7Z
	for qemu-arm@nongnu.org; Thu, 28 Mar 2019 14:54:28 -0400
Received: from mail-yw1-f65.google.com ([209.85.161.65]:35202)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1h9aAU-0006rG-Vz; Thu, 28 Mar 2019 14:54:27 -0400
Received: by mail-yw1-f65.google.com with SMTP id d132so3109151ywa.2;
	Thu, 28 Mar 2019 11:54:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=A4LAx65JwVqjnYc9tkPn4fThktnvCBxPqXTWDYlv0U4=;
	b=cD3lVHYNHU/KIMY2DZlr+CcSiiWLsiY4Vd37Lkn5HB8uFLeGmjKRHG4e4veFMLZLhv
	XMZqM12kPBLJ9gTEsxrfS52OcCO0GNQhpoc1ZRywRY+yxuw8gjqkptYLeoGvWBHf4Eol
	v1yPLoDsJ22PozEHu7pwhfIgcXs9ZoroQft8/pKZBPnEl1eon+T88Hq1yagXlJDFj/Ox
	jSTiEkxjMc55dNJeUyETADFH5lXaaI36l6aBVa9abg5p6ygjlK94m1kjcBFeMXdb93tf
	XMrAM7J/vCeyXojSAKTABy0WGMrVxYWZbtRi6/8DiObCZJYehhmLk0CsINTuba8+uwH/
	fkWA==
X-Gm-Message-State: APjAAAV10Ez+bVnEtHo12KNJrLFh1MK3hCm8vRUfi3H2Q5pUDTO0dR3+
	WV8dbxetHuC7i1qiSkqmL+pYMhKpRb3J6SIVzM8=
X-Received: by 2002:a81:5ec5:: with SMTP id
	s188mr27164321ywb.381.1553799266435; 
	Thu, 28 Mar 2019 11:54:26 -0700 (PDT)
MIME-Version: 1.0
References: <20190328143003.16702-1-peter.maydell@linaro.org>
In-Reply-To: <20190328143003.16702-1-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Date: Thu, 28 Mar 2019 19:54:13 +0100
Message-ID: <CAAdtpL6ruwtCahrcRW4jugk7pg+cMEve6k5=JP+bvoSp47ymcw@mail.gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
Content-Type: multipart/alternative; boundary="00000000000054071f05852c159d"
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.161.65
Subject: Re: [Qemu-arm] [PATCH for-4.1] target/arm: Stop using variable
 length array in dc_zva
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: qemu-arm <qemu-arm@nongnu.org>,
	"qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
	patches@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: toBlos3El+0e

--00000000000054071f05852c159d
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le jeu. 28 mars 2019 15:30, Peter Maydell <peter.maydell@linaro.org> a
=C3=A9crit :

> Currently the dc_zva helper function uses a variable length
> array. In fact we know (as the comment above remarks) that
> the length of this array is bounded because the architecture
> limits the block size and QEMU limits the target page size.
> Use a fixed array size and assert that we don't run off it.
>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
> A small move in the direction of "avoid using variable length
> arrays in QEMU"...
>
>  target/arm/helper.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
>
> diff --git a/target/arm/helper.c b/target/arm/helper.c
> index a36f4b3d699..1b6225cb598 100644
> --- a/target/arm/helper.c
> +++ b/target/arm/helper.c
> @@ -1,4 +1,5 @@
>  #include "qemu/osdep.h"
> +#include "qemu/units.h"
>  #include "target/arm/idau.h"
>  #include "trace.h"
>  #include "cpu.h"
> @@ -12412,11 +12413,13 @@ void HELPER(dc_zva)(CPUARMState *env, uint64_t
> vaddr_in)
>           * same QEMU executable.
>           */
>          int maxidx =3D DIV_ROUND_UP(blocklen, TARGET_PAGE_SIZE);
> -        void *hostaddr[maxidx];
> +        void *hostaddr[DIV_ROUND_UP(2 * KiB, 1 << TARGET_PAGE_BITS_MIN)]=
;
>

Or g_new()... For 2K nowadays that is fine.

Reviewed-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>

         int try, i;
>          unsigned mmu_idx =3D cpu_mmu_index(env, false);
>          TCGMemOpIdx oi =3D make_memop_idx(MO_UB, mmu_idx);
>
> +        assert(maxidx <=3D sizeof(hostaddr));
> +
>          for (try =3D 0; try < 2; try++) {
>
>              for (i =3D 0; i < maxidx; i++) {
> --
> 2.20.1
>
>
>

--00000000000054071f05852c159d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><div class=3D"gmail_quote"><div dir=3D"ltr">Le j=
eu. 28 mars 2019 15:30, Peter Maydell &lt;<a href=3D"mailto:peter.maydell@l=
inaro.org">peter.maydell@linaro.org</a>&gt; a =C3=A9crit=C2=A0:<br></div><b=
lockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px =
#ccc solid;padding-left:1ex">Currently the dc_zva helper function uses a va=
riable length<br>
array. In fact we know (as the comment above remarks) that<br>
the length of this array is bounded because the architecture<br>
limits the block size and QEMU limits the target page size.<br>
Use a fixed array size and assert that we don&#39;t run off it.<br>
<br>
Signed-off-by: Peter Maydell &lt;<a href=3D"mailto:peter.maydell@linaro.org=
" target=3D"_blank" rel=3D"noreferrer">peter.maydell@linaro.org</a>&gt;<br>
---<br>
A small move in the direction of &quot;avoid using variable length<br>
arrays in QEMU&quot;...<br>
<br>
=C2=A0target/arm/helper.c | 5 ++++-<br>
=C2=A01 file changed, 4 insertions(+), 1 deletion(-)<br>
<br>
diff --git a/target/arm/helper.c b/target/arm/helper.c<br>
index a36f4b3d699..1b6225cb598 100644<br>
--- a/target/arm/helper.c<br>
+++ b/target/arm/helper.c<br>
@@ -1,4 +1,5 @@<br>
=C2=A0#include &quot;qemu/osdep.h&quot;<br>
+#include &quot;qemu/units.h&quot;<br>
=C2=A0#include &quot;target/arm/idau.h&quot;<br>
=C2=A0#include &quot;trace.h&quot;<br>
=C2=A0#include &quot;cpu.h&quot;<br>
@@ -12412,11 +12413,13 @@ void HELPER(dc_zva)(CPUARMState *env, uint64_t va=
ddr_in)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * same QEMU executable.<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 */<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0int maxidx =3D DIV_ROUND_UP(blocklen, TAR=
GET_PAGE_SIZE);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 void *hostaddr[maxidx];<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 void *hostaddr[DIV_ROUND_UP(2 * KiB, 1 &lt;&lt=
; TARGET_PAGE_BITS_MIN)];<br></blockquote></div></div><div dir=3D"auto"><br=
></div><div dir=3D"auto">Or g_new()... For 2K nowadays that is fine.</div><=
div dir=3D"auto"><br></div><div dir=3D"auto">Reviewed-by: Philippe Mathieu-=
Daud=C3=A9 &lt;<a href=3D"mailto:f4bug@amsat.org">f4bug@amsat.org</a>&gt;<b=
r></div><div dir=3D"auto"><br></div><div dir=3D"auto"><div class=3D"gmail_q=
uote"><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-l=
eft:1px #ccc solid;padding-left:1ex">
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0int try, i;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0unsigned mmu_idx =3D cpu_mmu_index(env, f=
alse);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0TCGMemOpIdx oi =3D make_memop_idx(MO_UB, =
mmu_idx);<br>
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 assert(maxidx &lt;=3D sizeof(hostaddr));<br>
+<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0for (try =3D 0; try &lt; 2; try++) {<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0for (i =3D 0; i &lt; maxidx=
; i++) {<br>
-- <br>
2.20.1<br>
<br>
<br>
</blockquote></div></div></div>

--00000000000054071f05852c159d--
