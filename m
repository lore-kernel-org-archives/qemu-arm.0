Received: by 2002:a19:c345:0:0:0:0:0 with SMTP id t66csp1351583lff;
        Fri, 13 Dec 2019 12:53:26 -0800 (PST)
X-Google-Smtp-Source: APXvYqyBGdJkQGxzIeORpAjRXYLWiXsvAMnpG4iAzaRRoq2Gf9dJ6r3hbiv+rbUDGCUEsTTS0R1G
X-Received: by 2002:a9d:708a:: with SMTP id l10mr15875898otj.263.1576270406461;
        Fri, 13 Dec 2019 12:53:26 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1576270406; cv=none;
        d=google.com; s=arc-20160816;
        b=b/KU+HKBgXys0B+RUS8RbPptMYwgk30NQf3XUxi6cDrBdLlRegGB8mSPORapSeC+3e
         tfO7FQyCrl7RqTr/HmR44ClC4lw0DUZY3skAMjfcROxafKSDqFYyv4VSQLRnIp7hunuW
         aDNb5tWGcCm7JSK5Hz7oaH3OUFhIOtqhfvQs8QrrS1OYGPVmq3WcsEUbcNbNbIq9S5eU
         6B2SqIKcUEMf3qW56WgojFnpBz+9J7AfFdD5Qn50sp6gzEzvM1X15d/rk1TJdyfoLuvQ
         C5TE5c9M+p23+uwxz9iVuIL8N4vP5W0EyvlGC3neFc8FhC1SxEHQZwTMFitt3w9WtrAC
         qOYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=7O/3muIl5YW9JzXllxM/+0aPIk+ONdsqFZ3gZ4p5TYI=;
        b=ZCNya9kRap2ZPw/um4RNe2DzRi/PkHHY6BpT/ROLNc8ZjOwr7gILtm0R1czjAe8NEA
         gTN85gIT+2/q8++B2IEyPPEeeNENt8lZ0aQlLtPE7+yyY1uMfUzcBN0AuBza0NHD/5dq
         yy2M8hkMCX5oD6v8ynQtag4YW9CXnOQSyFUI/hG/yEqGKBhDWeEOkhLtW/JKxLGGjvT9
         Ug0Frk13LcsUB43SzRNk9JByg7qoEqFb6x0z6SO6Z3Sijqbe/GMoz/5Nd6MhXi9eSXji
         GUV568ijzBiLnkGkmlmJhz9CViP48szL7DNKu56vmbsyvNhjimBAZxOUwaS/abVxrqXi
         goTQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=c1EGIIBB;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l12si5859988otj.30.2019.12.13.12.53.26
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 13 Dec 2019 12:53:26 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=c1EGIIBB;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:53318 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ifrwD-000302-GN
	for alex.bennee@linaro.org; Fri, 13 Dec 2019 15:53:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42047)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <nieklinnenbank@gmail.com>) id 1ifrvO-0002Zr-D3
 for qemu-devel@nongnu.org; Fri, 13 Dec 2019 15:52:36 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <nieklinnenbank@gmail.com>) id 1ifrvM-0007x0-R3
 for qemu-devel@nongnu.org; Fri, 13 Dec 2019 15:52:34 -0500
Received: from mail-il1-x141.google.com ([2607:f8b0:4864:20::141]:40140)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <nieklinnenbank@gmail.com>)
 id 1ifrvM-0007v5-Kc; Fri, 13 Dec 2019 15:52:32 -0500
Received: by mail-il1-x141.google.com with SMTP id b15so540457ila.7;
 Fri, 13 Dec 2019 12:52:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=7O/3muIl5YW9JzXllxM/+0aPIk+ONdsqFZ3gZ4p5TYI=;
 b=c1EGIIBBlbP87N1dzNs3xElOM4EBJmIMGPQPkrXmKpYT8MjGjaCmezQRlHrTpa/QoP
 j5O57vytCX4zwpilrml3FJiHyvvHedbJmsXXAmItNbq/RlvPVFKQ5ye/IPsvFP+/Uv5g
 pPz9OMnZfyXwplsUe1PNAOjMsudT7O/tNcMMpAeqj6Z9+03VwU5ViXim+6x8Gzeiy6GD
 A8nRSVSEOJpWV/HhIUNKmMV8DQKRoQDSyZioCYDkXgL0cUNPo6GDyLsG7PKc+qGvbhjV
 VbsmT4RKoVK9rO4vVGrakU6gmEoAUf5la5glX2NifN/WV54vBteFHLYgBzk19I+fZmeu
 c7Ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=7O/3muIl5YW9JzXllxM/+0aPIk+ONdsqFZ3gZ4p5TYI=;
 b=qcD3PODdYjgrEI3Tc7bbweHSAxcND1tQomAqB1GQ+PUpGJZSXh0BTdWVjjdITsZt5w
 HK9yuMsr+V/H1dHI5U+6RM38yDEhmRrJV7UGTXfl21ePSafZ0B0d6YhHJL9A5724M0aH
 MUp4cRBt2KqH2lC0JDjm/uwOXMF8HNhKIG4w2CEJWA9mrUVpoF/UlEWfhHphV0MJN7Fp
 SDDZCY5ObwQb1wrGX8bINNquRqEOZsUe9xzCazoij+XknwbWJjD1mwYhBs8toSW5zXnK
 g5e6WxQyyvx3XVELkWfNFopx5zYUOEtNQX1Ur8uE4lCSDzizrBvo0/Sar+1lIpga2nGt
 I8wA==
X-Gm-Message-State: APjAAAUHiDYJuJO2ppIBBJ9y5Feodrf0s1K9l0/Ws4zIwEOBOd4lB+Hv
 FHy2HIP8rtrLM3A7nF87q32Lbuto6YWpoFONu9k=
X-Received: by 2002:a92:af08:: with SMTP id n8mr1201992ili.217.1576270351912; 
 Fri, 13 Dec 2019 12:52:31 -0800 (PST)
MIME-Version: 1.0
References: <20191202210947.3603-1-nieklinnenbank@gmail.com>
 <20191202210947.3603-7-nieklinnenbank@gmail.com>
 <CAFEAcA9XxH7zSmm6=KR-2ttfuqdauXxq05SWw++WgGEWw06NEQ@mail.gmail.com>
 <CAPan3WrYWpa2ymBjy5zCWAEdeVXVRYo7arNVOXWsbFeTAi0ucA@mail.gmail.com>
In-Reply-To: <CAPan3WrYWpa2ymBjy5zCWAEdeVXVRYo7arNVOXWsbFeTAi0ucA@mail.gmail.com>
From: Niek Linnenbank <nieklinnenbank@gmail.com>
Date: Fri, 13 Dec 2019 21:52:21 +0100
Message-ID: <CAPan3Wqw0enwMDd8ZmEDU=JeC+XQCZvfxaoEVtVJd9tsP3=Qww@mail.gmail.com>
Subject: Re: [PATCH 06/10] arm/arm-powerctl: set NSACR.{CP11,
 CP10} bits in arm_set_cpu_on()
To: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Content-Type: multipart/alternative; boundary="0000000000006552af05999c0a02"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::141
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Beniamino Galvani <b.galvani@gmail.com>, qemu-arm <qemu-arm@nongnu.org>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 0QoO4+FtlaD5

--0000000000006552af05999c0a02
Content-Type: text/plain; charset="UTF-8"

Hi Peter,

Philippe discovered that this patch triggers an hflags assertion error when
building QEMU
with debugging enabled (--enable-debug and --extra-cflags=-ggdb).

See this thread for details:
https://www.mail-archive.com/qemu-devel@nongnu.org/msg665049.html

What I added to resolve that is to call arm_rebuild_hflags() after setting
CP10,CP11.
However I'm not sure of any other side effects because I just don't know
this area of the code very well.

Regards,
Niek

diff --git a/target/arm/arm-powerctl.c b/target/arm/arm-powerctl.c
index f77a950db6..cf2f3d69ab 100644
--- a/target/arm/arm-powerctl.c
+++ b/target/arm/arm-powerctl.c
@@ -104,6 +104,9 @@ static void arm_set_cpu_on_async_work(CPUState
*target_cpu_state,
         /* Processor is not in secure mode */
         target_cpu->env.cp15.scr_el3 |= SCR_NS;

+        /* Set NSACR.{CP11,CP10} so NS can access the FPU */
+        target_cpu->env.cp15.nsacr |= 3 << 10;
+
         /*
          * If QEMU is providing the equivalent of EL3 firmware, then we need
          * to make sure a CPU targeting EL2 comes out of reset with a
@@ -124,6 +127,9 @@ static void arm_set_cpu_on_async_work(CPUState
*target_cpu_state,
         target_cpu->env.regs[0] = info->context_id;
     }

+    /* Ensure hflags is rebuild */
+    arm_rebuild_hflags(&target_cpu->env);
+
     /* Start the new CPU at the requested address */
     cpu_set_pc(target_cpu_state, info->entry);





On Fri, Dec 6, 2019 at 9:01 PM Niek Linnenbank <nieklinnenbank@gmail.com>
wrote:

> Hey Peter,
>
> On Fri, Dec 6, 2019 at 3:25 PM Peter Maydell <peter.maydell@linaro.org>
> wrote:
>
>> On Mon, 2 Dec 2019 at 21:10, Niek Linnenbank <nieklinnenbank@gmail.com>
>> wrote:
>> >
>> > This change ensures that the FPU can be accessed in Non-Secure mode
>> > when the CPU core is reset using the arm_set_cpu_on() function call.
>> > The NSACR.{CP11,CP10} bits define the exception level required to
>> > access the FPU in Non-Secure mode. Without these bits set, the CPU
>> > will give an undefined exception trap on the first FPU access for the
>> > secondary cores under Linux.
>> >
>> > Fixes: fc1120a7f5
>> > Signed-off-by: Niek Linnenbank <nieklinnenbank@gmail.com>
>> > ---
>>
>> Oops, another place where we failed to realise the ramifications
>> of making NSACR actually do something.
>>
>> Since this is a bugfix I'm going to fish it out of this patchset
>> and apply it to target-arm.next with a cc: stable.
>>
>> Thanks for the catch!
>>
>
> Sure, I'm happy to help. Note that I only tested this fix with
> the Allwinner H3 SoC patches that I'm working on.
>
> OK, I'll keep an eye out for it. Once it is solved in master, I'll remove
> this patch from the patch series.
>
> Regards,
> Niek
>
>>
>> -- PMM
>>
>
>
> --
> Niek Linnenbank
>
>

-- 
Niek Linnenbank

--0000000000006552af05999c0a02
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi Peter,</div><div><br></div><div>Philippe discovere=
d that this patch triggers an hflags assertion error when building QEMU</di=
v><div>with debugging enabled (--enable-debug and --extra-cflags=3D-ggdb).<=
/div><div><br></div><div>See this thread for details:</div><div><a href=3D"=
https://www.mail-archive.com/qemu-devel@nongnu.org/msg665049.html">https://=
www.mail-archive.com/qemu-devel@nongnu.org/msg665049.html</a></div><div><br=
></div><div>What I added to resolve that is to call arm_rebuild_hflags() af=
ter setting CP10,CP11.</div><div>However I&#39;m not sure of any other side=
 effects because I just don&#39;t know this area of the code very well.<br>=
</div><div><br></div><div>Regards,</div><div>Niek<br></div><div><br></div><=
div><pre>diff --git a/target/arm/arm-powerctl.c b/target/arm/arm-powerctl.c
index f77a950db6..cf2f3d69ab 100644
--- a/target/arm/arm-powerctl.c
+++ b/target/arm/arm-powerctl.c
@@ -104,6 +104,9 @@ static void arm_set_cpu_on_async_work(CPUState *target_=
cpu_state,
         /* Processor is not in secure mode */
         target_cpu-&gt;env.cp15.scr_el3 |=3D SCR_NS;
=20
+        /* Set NSACR.{CP11,CP10} so NS can access the FPU */
+        target_cpu-&gt;env.cp15.nsacr |=3D 3 &lt;&lt; 10;
+
         /*
          * If QEMU is providing the equivalent of EL3 firmware, then we ne=
ed
          * to make sure a CPU targeting EL2 comes out of reset with a
@@ -124,6 +127,9 @@ static void arm_set_cpu_on_async_work(CPUState *target_=
cpu_state,
         target_cpu-&gt;env.regs[0] =3D info-&gt;context_id;
     }
=20
+    /* Ensure hflags is rebuild */
+    arm_rebuild_hflags(&amp;target_cpu-&gt;env);
+
     /* Start the new CPU at the requested address */
     cpu_set_pc(target_cpu_state, info-&gt;entry);
=20
</pre></div><div><br></div><div><br></div><div><br></div><div class=3D"gmai=
l_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Fri, Dec 6, 2019 at 9:01 =
PM Niek Linnenbank &lt;<a href=3D"mailto:nieklinnenbank@gmail.com">nieklinn=
enbank@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" =
style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);pa=
dding-left:1ex"><div dir=3D"ltr"><div>Hey Peter,<br></div><br><div class=3D=
"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Fri, Dec 6, 2019 at =
3:25 PM Peter Maydell &lt;<a href=3D"mailto:peter.maydell@linaro.org" targe=
t=3D"_blank">peter.maydell@linaro.org</a>&gt; wrote:<br></div><blockquote c=
lass=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px soli=
d rgb(204,204,204);padding-left:1ex">On Mon, 2 Dec 2019 at 21:10, Niek Linn=
enbank &lt;<a href=3D"mailto:nieklinnenbank@gmail.com" target=3D"_blank">ni=
eklinnenbank@gmail.com</a>&gt; wrote:<br>
&gt;<br>
&gt; This change ensures that the FPU can be accessed in Non-Secure mode<br=
>
&gt; when the CPU core is reset using the arm_set_cpu_on() function call.<b=
r>
&gt; The NSACR.{CP11,CP10} bits define the exception level required to<br>
&gt; access the FPU in Non-Secure mode. Without these bits set, the CPU<br>
&gt; will give an undefined exception trap on the first FPU access for the<=
br>
&gt; secondary cores under Linux.<br>
&gt;<br>
&gt; Fixes: fc1120a7f5<br>
&gt; Signed-off-by: Niek Linnenbank &lt;<a href=3D"mailto:nieklinnenbank@gm=
ail.com" target=3D"_blank">nieklinnenbank@gmail.com</a>&gt;<br>
&gt; ---<br>
<br>
Oops, another place where we failed to realise the ramifications<br>
of making NSACR actually do something.<br>
<br></blockquote><div></div><blockquote class=3D"gmail_quote" style=3D"marg=
in:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1e=
x">
Since this is a bugfix I&#39;m going to fish it out of this patchset<br>
and apply it to target-arm.next with a cc: stable.<br>
<br>
Thanks for the catch!<br></blockquote><div>=C2=A0</div><div><div>Sure, I&#3=
9;m happy to help. Note that I only tested this fix with</div><div>the Allw=
inner H3 SoC patches that I&#39;m working on.</div></div><div><br></div><di=
v> OK, I&#39;ll keep an eye out for it. Once it is solved in master, I&#39;=
ll remove this patch from the patch series.<br></div><div>=C2=A0</div><div>=
Regards,</div><div>Niek<br></div><blockquote class=3D"gmail_quote" style=3D=
"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-le=
ft:1ex">
<br>
-- PMM<br>
</blockquote></div><br clear=3D"all"><br>-- <br><div dir=3D"ltr"><div dir=
=3D"ltr"><div>Niek Linnenbank<br><br></div></div></div></div>
</blockquote></div><br clear=3D"all"><br>-- <br><div dir=3D"ltr" class=3D"g=
mail_signature"><div dir=3D"ltr"><div>Niek Linnenbank<br><br></div></div></=
div></div>

--0000000000006552af05999c0a02--
