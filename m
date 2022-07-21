Received: by 2002:ac2:596f:0:0:0:0:0 with SMTP id h15csp3517433lfp;
        Thu, 21 Jul 2022 12:03:52 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1vOt8SmX29IzPaPobatapIDXHJgSYaNVXUcZ7PhM+DBWVOszHp7SEukgpb4tNbeyU7DhGHG
X-Received: by 2002:a05:622a:10e:b0:31f:1edf:c417 with SMTP id u14-20020a05622a010e00b0031f1edfc417mr130qtw.488.1658430232280;
        Thu, 21 Jul 2022 12:03:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1658430232; cv=none;
        d=google.com; s=arc-20160816;
        b=0kspxgcFEdFflQAWZRaWFTfhiyc8cuK3ov/xIV9ky+efrfiJ8Ur+5RYy6RAKKEXrl6
         KS+Fi4V81RZHAjmedEkXeqvERGXS4blZSC77X6tpzD12PyxDbTpJ0LqtE+P5+z2zQudo
         PCfpoFrWP4fv5jwc8bP5CGYGhqVHodsZ2437SbS59PV9JFuDi6oGgE8gUANEu/da+cWz
         eg3H1M97BNEV02JaSMFuMf1KfGc2Yso4+luIbd6S6PXU4rLS4dhfc/p6oTmPwRZ4qxMO
         IFNLeRgMdM3YDOg2CziibohfeB4sLBebUjOzjZuhrabBTIdB5cVDvHFQcUheii60OKeq
         Plhg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=p7EepByjxCdF7wWWvcgowKPWm7VslJ8jUkWIXNUWThw=;
        b=wg9ikgXdWvk2zoEEKlSXXWm60UYbDGOHN4Itt+D+Qy/VFgGQQRD6oInGDyI5TOUzo1
         tr3zrMJ84enBNA2yT+DU7GJN874TsSCNM8zO21g2Wgh//G305DscUkdZAtj/zYQEoWxx
         6x48s+xhLi3mDaAI2Rxjr5raM4/Vdr7QNsy2OgMgkpCwnSN8wLiNXRBkVZ47kyjcrkHz
         EK3YZrLmH5gN5T9PGqoGF7btqywnb9k/fGHgYFRehMxO8DCYE3R/v9tQrKqSCkU2tvp/
         5p3NfBjHvpg+Cwl5ThgqV1hKIucwGTTWACh3J4Jz76jhTCz0tuqq1xm3YyUnAmpF8MSh
         q9TQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@gmail.com header.s=20210112 header.b=o9A3jvY3;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f9-20020ac80149000000b0031ed2b5664bsi1633654qtg.133.2022.07.21.12.03.52
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 21 Jul 2022 12:03:52 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@gmail.com header.s=20210112 header.b=o9A3jvY3;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:37940 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1oEbSh-00072t-PU
	for alex.bennee@linaro.org; Thu, 21 Jul 2022 15:03:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55274)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jon.alduan@gmail.com>)
 id 1oEbST-00072i-FZ
 for qemu-arm@nongnu.org; Thu, 21 Jul 2022 15:03:37 -0400
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c]:33591)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jon.alduan@gmail.com>)
 id 1oEbSR-0006jJ-O6
 for qemu-arm@nongnu.org; Thu, 21 Jul 2022 15:03:37 -0400
Received: by mail-ed1-x52c.google.com with SMTP id t3so3378347edd.0
 for <qemu-arm@nongnu.org>; Thu, 21 Jul 2022 12:03:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=uslML0Phs0m6IoSSS2vUWYGnu4eekUfnFZBEtSx8SYo=;
 b=o9A3jvY3ByGnVE5ue+OhnFiJMepK8J7LcTMOd1lRxMLk6HDS2waeNsFoV7n4rX4vKP
 CBqv7W37WFvBVrzUjBNdx0io3cT9Yg8xeB1ORSBcfc3dJw4tLrJeTTa3ODDcZ3ospbZl
 f6pjT1B+sj9D4ryAHZTWVvJy7uUcI+4Riew/H15P1+kS4AcewERJV3dYWf3zxqV573N1
 jDuvB+ygfecpDrDWLPBKR4RLmymvxE/C0H2RaJA4UZKj07DBbCgT8e0bXJAsi4Q5d6Zt
 cudvAvfgPaV/YCMuNiw8LRW1lerA5bDDri+8zR+CL8ITYuVkCtO5u3MEkgueJw8813bu
 qXAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=uslML0Phs0m6IoSSS2vUWYGnu4eekUfnFZBEtSx8SYo=;
 b=hFdyIgTZu5MRLw1zxip+IdBLjQQrQKH7eJESJkk3K5lbMLqcys/jTgl5atRjbGgNKP
 hvshAN7Z6Zquqzvrrl/M81PHMr+77nfjsomHJEykyADJh4jIE/djuSNRPkgh2igU/sM/
 7RgZWq3WRuu8hJva5K74aqRH8kU3NmIjrg/ofXZroZQTbPR72FGsQDjU+kKVfROyhDPx
 oaudkzpssLqxbG/1HiJP9Ng7QLAf0oqWdN0HLIBaF3mj1MNQ3UxWlzPnsUIZ0OBQbYMw
 tnYuWdK7ngGZ291PhpQo0pCL2FkJPlVuoACnd5aGVzzebTdpnRi4xHYlOXpqYOVUrtLG
 wzBA==
X-Gm-Message-State: AJIora/lvbtKfz2t4dWRRmv6qAKxUrIf9fm6cQwKTTy2AAv/+XibyyAf
 pwG+y7PSu5hXFibegWSc5SuiSnPJ5pcA1lWJwaM=
X-Received: by 2002:aa7:d6d0:0:b0:43b:c997:25da with SMTP id
 x16-20020aa7d6d0000000b0043bc99725damr3406658edr.224.1658430214026; Thu, 21
 Jul 2022 12:03:34 -0700 (PDT)
MIME-Version: 1.0
References: <CAL7npF9T0148jkgTigVfE7cSzH2HKqy0NG0VQtAH2HMXjdBOOg@mail.gmail.com>
 <CAFEAcA8RHhRcrMSO_3MK0hSH=zWzde7S0DHHaLPZf4jOv48RLQ@mail.gmail.com>
 <CAL7npF9hKFsQF18Udi9QFnRZSH-G8cafXHBSBQcrs7jpJmPd7Q@mail.gmail.com>
 <CAFEAcA92=ne8weVYDnLLzNk0+z+aMFJgOJvW_7hSYcY1TimyHw@mail.gmail.com>
 <CAL7npF8Hg7hJBxw9j-1_7GRV_E52KS+hP1WXKfD3+r05C=CBgg@mail.gmail.com>
 <CAFEAcA8tGiaXq+y40-BtdG3jiBJpP=L6x9tsPL_5dF6dr=afEA@mail.gmail.com>
 <CAL7npF8d6LZHZtLWe65JiwQW+X-48JxLa2xBoGdxjJJWpKx-Fw@mail.gmail.com>
 <CAFEAcA9SM--_+Ret6fZwvWNe0J3E8TE-+do614TtTpi0rbAM9A@mail.gmail.com>
 <CAL7npF_8ErAn2cvFBQxVCdP96uKpdRQMs_3aL_UW5OLzm3Q=GQ@mail.gmail.com>
 <CAFEAcA-cTzrA6fZXw7onDJ77NMwjBrSFVwADYmttCgdOf9ODYw@mail.gmail.com>
 <CAL7npF9H_eKi0jA_m-wV=jSHy9hc6re7TpTe2ni=9NYK4CxRpA@mail.gmail.com>
 <CAFEAcA8xV-BdhvwvkzRHxqqEX9BAwDJGwHS=koBRbDeGHwQHEw@mail.gmail.com>
 <CAL7npF9bOP=bPtyFS-K+HgXGy9+W11M0ELRJMqQp1-JB_jVx1g@mail.gmail.com>
 <CAFEAcA8hbU7PJK-YvOkbjj2F2PBW1M9J10DkHqUPXTSxYOS-5Q@mail.gmail.com>
 <CAL7npF9neZUWweuZFqDkO5mh5=tZj3ybjZUvVoF932cJibpRiw@mail.gmail.com>
 <CAFEAcA9CnC5P4Myf1qMO=DLas93+kSVjNvnj6Vgty_yvdjH5vQ@mail.gmail.com>
 <CAL7npF8KNQKyfeW5ONY53+_u6Q4H8BDtY386Eyt-+gxaXdBBJA@mail.gmail.com>
 <CAFEAcA8hVyCwMbQ_ZNUgw8Nfb3wTvRk3gvUr8RC3gSH7Pkuv_g@mail.gmail.com>
 <CAL7npF897P3=Rro4pe_i_cmO+rUe-b1NqnJtmEM3K0kEF5VC7Q@mail.gmail.com>
 <CAFEAcA9y6zwErffpvrJrenS0hyLvGyoyhdF8Vo3mgFhLOvvOSw@mail.gmail.com>
 <CAFEAcA-9F6QDzEiAfiMa=DUVK3LGe9vLmD_OcMTfbU8ayv3Ffw@mail.gmail.com>
In-Reply-To: <CAFEAcA-9F6QDzEiAfiMa=DUVK3LGe9vLmD_OcMTfbU8ayv3Ffw@mail.gmail.com>
From: Jon Alduan <jon.alduan@gmail.com>
Date: Thu, 21 Jul 2022 21:03:22 +0200
Message-ID: <CAL7npF839onoBJxewXraSGRPmbK=8SqbPeU2W3YN7kFYW6j9tQ@mail.gmail.com>
Subject: Re: [qemu-arm-static] timer_delete issue from Qemu 5.0.0 onwards
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-arm@nongnu.org
Content-Type: multipart/mixed; boundary="000000000000cacb8405e4555f08"
Received-SPF: pass client-ip=2a00:1450:4864:20::52c;
 envelope-from=jon.alduan@gmail.com; helo=mail-ed1-x52c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: NkgtvdoP7zQm

--000000000000cacb8405e4555f08
Content-Type: multipart/alternative; boundary="000000000000cacb8105e4555f06"

--000000000000cacb8105e4555f06
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Here you have the output with the debug logs:




*next_free_host_timer: returning 0timer_create: host timer_create: returned
0x00000000, set phtimer 0x559dc5d8aa00 to (nil)timer_create: wrote
0xcaf0000 to guest address 0x408002e8*







*Create timer 0 536880get_timer_id: guest timer id 0xcaf0000 -> index
0next_free_host_timer: returning 0timer_create: host timer_create: returned
0x00000000, set phtimer 0x559dc5d8aa00 to 0x1timer_create: wrote 0xcaf0000
to guest address 0x408002e8Create timer 1 537928get_timer_id: guest timer
id 0xcaf0000 -> index 0next_free_host_timer: returning 1*

So, it does create two different timers, but second one will be addressed
as being first one?
...

El jue, 21 jul 2022 a las 16:52, Peter Maydell (<peter.maydell@linaro.org>)
escribi=C3=B3:

> On Thu, 21 Jul 2022 at 14:44, Peter Maydell <peter.maydell@linaro.org>
> wrote:
> >
> > On Thu, 21 Jul 2022 at 14:10, Jon Alduan <jon.alduan@gmail.com> wrote:
> > > Yes, exactly. When removing timer 0, time 1 will be removed instead.
> > > Other timers are not affected. If you create a dummy timer 0, there
> > > are no more problems (that I can address).
> >
> > Yeah, but it's complicated, because there are multiple "timer IDs" here=
:
>
> I've attached a patch which adds some debug printing to QEMU's
> timer_create/timer_delete code. Could you please apply this patch,
> rebuild QEMU, run that with the test program, and send me the
> output ?
>
> thanks
> -- PMM
>


--=20
j.A

--000000000000cacb8105e4555f06
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Here you have the output with the debug logs:</div><d=
iv><br></div><div><i>next_free_host_timer: returning 0<br>timer_create: hos=
t timer_create: returned 0x00000000, set phtimer 0x559dc5d8aa00 to <span st=
yle=3D"color:rgb(255,153,0)">(nil)</span><br>timer_create: wrote 0xcaf0000 =
to guest address 0x408002e8<br></i></div><div><i><b>Create timer 0 536880<b=
r>get_timer_id: guest timer id 0xcaf0000 -&gt; index 0</b><br><span style=
=3D"color:rgb(255,0,0)">next_free_host_timer: returning 0</span><br>timer_c=
reate: host timer_create: returned 0x00000000, set phtimer <span style=3D"c=
olor:rgb(255,0,0)">0x559dc5d8aa00 </span>to 0x1<br>timer_create: wrote 0xca=
f0000 to guest address 0x408002e8<br><b>Create timer 1 537928<br>get_timer_=
id: guest timer id <span style=3D"color:rgb(255,0,0)">0xcaf0000</span> -&gt=
;<span style=3D"background-color:rgb(255,255,255)"> <span style=3D"color:rg=
b(255,0,0)">index 0</span></span></b><br>next_free_host_timer: returning 1<=
/i></div><div><br></div><div>So, it does create two different timers, but s=
econd one will be addressed as being first one?<br></div><div>...<br></div>=
</div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">=
El jue, 21 jul 2022 a las 16:52, Peter Maydell (&lt;<a href=3D"mailto:peter=
.maydell@linaro.org">peter.maydell@linaro.org</a>&gt;) escribi=C3=B3:<br></=
div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bor=
der-left:1px solid rgb(204,204,204);padding-left:1ex">On Thu, 21 Jul 2022 a=
t 14:44, Peter Maydell &lt;<a href=3D"mailto:peter.maydell@linaro.org" targ=
et=3D"_blank">peter.maydell@linaro.org</a>&gt; wrote:<br>
&gt;<br>
&gt; On Thu, 21 Jul 2022 at 14:10, Jon Alduan &lt;<a href=3D"mailto:jon.ald=
uan@gmail.com" target=3D"_blank">jon.alduan@gmail.com</a>&gt; wrote:<br>
&gt; &gt; Yes, exactly. When removing timer 0, time 1 will be removed inste=
ad.<br>
&gt; &gt; Other timers are not affected. If you create a dummy timer 0, the=
re<br>
&gt; &gt; are no more problems (that I can address).<br>
&gt;<br>
&gt; Yeah, but it&#39;s complicated, because there are multiple &quot;timer=
 IDs&quot; here:<br>
<br>
I&#39;ve attached a patch which adds some debug printing to QEMU&#39;s<br>
timer_create/timer_delete code. Could you please apply this patch,<br>
rebuild QEMU, run that with the test program, and send me the<br>
output ?<br>
<br>
thanks<br>
-- PMM<br>
</blockquote></div><br clear=3D"all"><br>-- <br><div dir=3D"ltr" class=3D"g=
mail_signature">j.A</div>

--000000000000cacb8105e4555f06--

--000000000000cacb8405e4555f08
Content-Type: application/octet-stream; 
	name="testTimer_peter_patch_debug_output.log"
Content-Disposition: attachment; 
	filename="testTimer_peter_patch_debug_output.log"
Content-Transfer-Encoding: base64
Content-ID: <f_l5ve9mx00>
X-Attachment-Id: f_l5ve9mx00

JDovaG9tZS9naXQvcWVtdSMgL2hvbWUvZ2l0L3FlbXUvYnVpbGQvcWVtdS1hcm0gL2hvbWUvam9u
L3Rlc3RfcWVtdV90aW1lci9wZXRlci90aW1lcnRlc3QNCm5leHRfZnJlZV9ob3N0X3RpbWVyOiBy
ZXR1cm5pbmcgMA0KdGltZXJfY3JlYXRlOiBob3N0IHRpbWVyX2NyZWF0ZTogcmV0dXJuZWQgMHgw
MDAwMDAwMCwgc2V0IHBodGltZXIgMHg1NTlkYzVkOGFhMDAgdG8gKG5pbCkNCnRpbWVyX2NyZWF0
ZTogd3JvdGUgMHhjYWYwMDAwIHRvIGd1ZXN0IGFkZHJlc3MgMHg0MDgwMDJlOA0KQ3JlYXRlIHRp
bWVyIDAgNTM2ODgwDQpnZXRfdGltZXJfaWQ6IGd1ZXN0IHRpbWVyIGlkIDB4Y2FmMDAwMCAtPiBp
bmRleCAwDQpuZXh0X2ZyZWVfaG9zdF90aW1lcjogcmV0dXJuaW5nIDANCnRpbWVyX2NyZWF0ZTog
aG9zdCB0aW1lcl9jcmVhdGU6IHJldHVybmVkIDB4MDAwMDAwMDAsIHNldCBwaHRpbWVyIDB4NTU5
ZGM1ZDhhYTAwIHRvIDB4MQ0KdGltZXJfY3JlYXRlOiB3cm90ZSAweGNhZjAwMDAgdG8gZ3Vlc3Qg
YWRkcmVzcyAweDQwODAwMmU4DQpDcmVhdGUgdGltZXIgMSA1Mzc5MjgNCmdldF90aW1lcl9pZDog
Z3Vlc3QgdGltZXIgaWQgMHhjYWYwMDAwIC0+IGluZGV4IDANCm5leHRfZnJlZV9ob3N0X3RpbWVy
OiByZXR1cm5pbmcgMQ0KdGltZXJfY3JlYXRlOiBob3N0IHRpbWVyX2NyZWF0ZTogcmV0dXJuZWQg
MHgwMDAwMDAwMCwgc2V0IHBodGltZXIgMHg1NTlkYzVkOGFhMDggdG8gMHgyDQp0aW1lcl9jcmVh
dGU6IHdyb3RlIDB4Y2FmMDAwMSB0byBndWVzdCBhZGRyZXNzIDB4NDA4MDAyZTgNCkNyZWF0ZSB0
aW1lciAyIDUzNzk0NA0KZ2V0X3RpbWVyX2lkOiBndWVzdCB0aW1lciBpZCAweGNhZjAwMDEgLT4g
aW5kZXggMQ0KbmV4dF9mcmVlX2hvc3RfdGltZXI6IHJldHVybmluZyAyDQp0aW1lcl9jcmVhdGU6
IGhvc3QgdGltZXJfY3JlYXRlOiByZXR1cm5lZCAweDAwMDAwMDAwLCBzZXQgcGh0aW1lciAweDU1
OWRjNWQ4YWExMCB0byAweDMNCnRpbWVyX2NyZWF0ZTogd3JvdGUgMHhjYWYwMDAyIHRvIGd1ZXN0
IGFkZHJlc3MgMHg0MDgwMDJlOA0KQ3JlYXRlIHRpbWVyIDMgNTM3OTYwDQpnZXRfdGltZXJfaWQ6
IGd1ZXN0IHRpbWVyIGlkIDB4Y2FmMDAwMiAtPiBpbmRleCAyDQpuZXh0X2ZyZWVfaG9zdF90aW1l
cjogcmV0dXJuaW5nIDMNCnRpbWVyX2NyZWF0ZTogaG9zdCB0aW1lcl9jcmVhdGU6IHJldHVybmVk
IDB4MDAwMDAwMDAsIHNldCBwaHRpbWVyIDB4NTU5ZGM1ZDhhYTE4IHRvIDB4NA0KdGltZXJfY3Jl
YXRlOiB3cm90ZSAweGNhZjAwMDMgdG8gZ3Vlc3QgYWRkcmVzcyAweDQwODAwMmU4DQpDcmVhdGUg
dGltZXIgNCA1Mzc5NzYNCmdldF90aW1lcl9pZDogZ3Vlc3QgdGltZXIgaWQgMHhjYWYwMDAzIC0+
IGluZGV4IDMNCnRocmVhZDA6IHN0YXJ0ZWQNCnRocmVhZDA6IHNhdyAwIGFsYXJtcyBmcm9tIDAN
CnRocmVhZDE6IHN0YXJ0ZWQNCnRocmVhZDI6IHN0YXJ0ZWQNCnRocmVhZDM6IHN0YXJ0ZWQNCnRo
cmVhZDQ6IHN0YXJ0ZWQNCnRocmVhZDU6IHN0YXJ0ZWQNCnRocmVhZDY6IHN0YXJ0ZWQNCnRocmVh
ZDc6IHN0YXJ0ZWQNCnRocmVhZDg6IHN0YXJ0ZWQNCnRocmVhZDk6IHN0YXJ0ZWQNCnNpZ25hbCBm
cm9tIGFsYXJtIDQgNTM3OTc2IDQNCnNpZ25hbCBmcm9tIGFsYXJtIDAgNTM2ODgwIDANCnNpZ25h
bCBmcm9tIGFsYXJtIDIgNTM3OTQ0IDINCnNpZ25hbCBmcm9tIGFsYXJtIDQgNTM3OTc2IDQNCnNp
Z25hbCBmcm9tIGFsYXJtIDEgNTM3OTI4IDENCnNpZ25hbCBmcm9tIGFsYXJtIDMgNTM3OTYwIDMN
CnNpZ25hbCBmcm9tIGFsYXJtIDAgNTM2ODgwIDANCnNpZ25hbCBmcm9tIGFsYXJtIDIgNTM3OTQ0
IDINCnNpZ25hbCBmcm9tIGFsYXJtIDQgNTM3OTc2IDQNCnNpZ25hbCBmcm9tIGFsYXJtIDIgNTM3
OTQ0IDINCnNpZ25hbCBmcm9tIGFsYXJtIDAgNTM2ODgwIDANCnNpZ25hbCBmcm9tIGFsYXJtIDAg
NTM2ODgwIDANCnNpZ25hbCBmcm9tIGFsYXJtIDIgNTM3OTQ0IDINCnNpZ25hbCBmcm9tIGFsYXJt
IDQgNTM3OTc2IDQNClJlbW92ZSB0aW1lciAwIDUzNjg4MA0KZ2V0X3RpbWVyX2lkOiBndWVzdCB0
aW1lciBpZCAweGNhZjAwMDAgLT4gaW5kZXggMA0KdGltZXJfZGVsZXRlOiBndWVzdCBhcmcgMHgw
Y2FmMDAwMCBob3N0IHRpbWVyX3QgMHgxOiBkZWxldGluZw0Kc2lnbmFsIGZyb20gYWxhcm0gMyA1
Mzc5NjAgMw0Kc2lnbmFsIGZyb20gYWxhcm0gMSA1Mzc5MjggMQ0Kc2lnbmFsIGZyb20gYWxhcm0g
MCAwIDANCnNpZ25hbCBmcm9tIGFsYXJtIDIgNTM3OTQ0IDINCkVycm9yLCBhbHJlYWR5IGRlbGV0
ZWQNCnNpZ25hbCBmcm9tIGFsYXJtIDQgNTM3OTc2IDQNCnNpZ25hbCBmcm9tIGFsYXJtIDAgMCAw
DQpFcnJvciwgYWxyZWFkeSBkZWxldGVkDQpzaWduYWwgZnJvbSBhbGFybSAyIDUzNzk0NCAyDQpz
aWduYWwgZnJvbSBhbGFybSA0IDUzNzk3NiA0DQpzaWduYWwgZnJvbSBhbGFybSAzIDUzNzk2MCAz
DQpzaWduYWwgZnJvbSBhbGFybSAwIDAgMA0KRXJyb3IsIGFscmVhZHkgZGVsZXRlZA0Kc2lnbmFs
IGZyb20gYWxhcm0gMiA1Mzc5NDQgMg0KUmVtb3ZlIHRpbWVyIDEgNTM3OTI4DQpnZXRfdGltZXJf
aWQ6IGd1ZXN0IHRpbWVyIGlkIDB4Y2FmMDAwMCAtPiBpbmRleCAwDQp0aW1lcl9kZWxldGU6IGd1
ZXN0IGFyZyAweDBjYWYwMDAwIGhvc3QgdGltZXJfdCAobmlsKTogZGVsZXRpbmcNCnNpZ25hbCBm
cm9tIGFsYXJtIDQgNTM3OTc2IDQNCnNpZ25hbCBmcm9tIGFsYXJtIDIgNTM3OTQ0IDINCnNpZ25h
bCBmcm9tIGFsYXJtIDMgNTM3OTYwIDMNCnNpZ25hbCBmcm9tIGFsYXJtIDQgNTM3OTc2IDQNCnNp
Z25hbCBmcm9tIGFsYXJtIDIgNTM3OTQ0IDINCnNpZ25hbCBmcm9tIGFsYXJtIDQgNTM3OTc2IDQN
CnNpZ25hbCBmcm9tIGFsYXJtIDIgNTM3OTQ0IDINCnNpZ25hbCBmcm9tIGFsYXJtIDMgNTM3OTYw
IDMNCnNpZ25hbCBmcm9tIGFsYXJtIDQgNTM3OTc2IDQNCnNpZ25hbCBmcm9tIGFsYXJtIDIgNTM3
OTQ0IDINCnNpZ25hbCBmcm9tIGFsYXJtIDQgNTM3OTc2IDQNClJlbW92ZSB0aW1lciAyIDUzNzk0
NA0KZ2V0X3RpbWVyX2lkOiBndWVzdCB0aW1lciBpZCAweGNhZjAwMDEgLT4gaW5kZXggMQ0KdGlt
ZXJfZGVsZXRlOiBndWVzdCBhcmcgMHgwY2FmMDAwMSBob3N0IHRpbWVyX3QgMHgyOiBkZWxldGlu
Zw0Kc2lnbmFsIGZyb20gYWxhcm0gNCA1Mzc5NzYgNA0Kc2lnbmFsIGZyb20gYWxhcm0gMyA1Mzc5
NjAgMw0Kc2lnbmFsIGZyb20gYWxhcm0gNCA1Mzc5NzYgNA0Kc2lnbmFsIGZyb20gYWxhcm0gMyA1
Mzc5NjAgMw0Kc2lnbmFsIGZyb20gYWxhcm0gNCA1Mzc5NzYgNA0Kc2lnbmFsIGZyb20gYWxhcm0g
NCA1Mzc5NzYgNA0Kc2lnbmFsIGZyb20gYWxhcm0gMyA1Mzc5NjAgMw0Kc2lnbmFsIGZyb20gYWxh
cm0gNCA1Mzc5NzYgNA0KUmVtb3ZlIHRpbWVyIDMgNTM3OTYwDQpnZXRfdGltZXJfaWQ6IGd1ZXN0
IHRpbWVyIGlkIDB4Y2FmMDAwMiAtPiBpbmRleCAyDQp0aW1lcl9kZWxldGU6IGd1ZXN0IGFyZyAw
eDBjYWYwMDAyIGhvc3QgdGltZXJfdCAweDM6IGRlbGV0aW5nDQpzaWduYWwgZnJvbSBhbGFybSA0
IDUzNzk3NiA0DQpzaWduYWwgZnJvbSBhbGFybSA0IDUzNzk3NiA0DQpzaWduYWwgZnJvbSBhbGFy
bSA0IDUzNzk3NiA0DQpzaWduYWwgZnJvbSBhbGFybSA0IDUzNzk3NiA0DQpzaWduYWwgZnJvbSBh
bGFybSA0IDUzNzk3NiA0DQpzaWduYWwgZnJvbSBhbGFybSA0IDUzNzk3NiA0
--000000000000cacb8405e4555f08--
