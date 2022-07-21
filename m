Received: by 2002:ac2:596f:0:0:0:0:0 with SMTP id h15csp3300246lfp;
        Thu, 21 Jul 2022 06:11:01 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1t1haxC5QRsi7oBhgkSl8fip1V++IxtOmxeBX37DU37qgUw3lfbpEnxcY7JaDYyilys5A/b
X-Received: by 2002:a05:620a:28cf:b0:6b5:e32f:febb with SMTP id l15-20020a05620a28cf00b006b5e32ffebbmr14944006qkp.258.1658409061376;
        Thu, 21 Jul 2022 06:11:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1658409061; cv=none;
        d=google.com; s=arc-20160816;
        b=XryKoO1SLcPZwQoxWv4mKttAX8XWJ25kob5JzWklyq8CeeKM1nfmAHbX0LTFTJlcb+
         pQsLMcOnFc9X8YT88jQZaGpVDlFrSBD+7wNRC77Y9ux2XqNxgJ5XlvkRQ7uN0Eujuoxo
         VGK5bTyulg2J9Ywk6VFb5A5yqiaJDM0OI63W30n2d7zNZAGMlqqtNwvcFzA/5wv0AdLq
         mUOD1MJx/ux6dvPgSbLQiPV4LKZrRY1KiGDZJ0dOI7TtdsG8pjkbwHcaQB+/ecfUrvFn
         tRr2+0up+xMRqd9FyJejypHfam2KgByl7MMAExTJYGuTGtoLVWLJUMRoWLWS+nLxHE4w
         18jw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=YCTEGCGnuxA7ToMtmJm5TZuEOBpPy9P3BKHDtJdOqAo=;
        b=tpGMWaW5ICCCYSguo8SPmGLtLCK4cK1Nhoum8pJHMkKMJoUykXakYP+cBXFijPbO5H
         WoZK5PPbjd1T1qe0abRkGctWpaYqEvWJjRmm8eOry8rnyscTRtjn3ZkXFbTsaiSalsXp
         PEfnMY5TwZoFK9JKEJ2PPm/fMDBvnsMixKWn1Ha0KKTTSuBdmbDinuWSWFmut2MyvHw6
         O+bKb90olPSmzntGTUO347aP4Jmy26XcL+MoHDpC36K3G2efuazlpLLkqUNX25Fw59uG
         mRgRatDI4RKk7ftdIc0O2veXUC0IxyExjU45c6Mjdazjbddyutc0EqtoLI0IpYQA0Rnr
         7+oQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20210112 header.b=DR+Fad7H;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o22-20020ac87c56000000b0031eebefe9besi1104218qtv.549.2022.07.21.06.11.01
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 21 Jul 2022 06:11:01 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20210112 header.b=DR+Fad7H;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:42258 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1oEVxE-0008Ci-Qe
	for alex.bennee@linaro.org; Thu, 21 Jul 2022 09:11:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44800)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jon.alduan@gmail.com>)
 id 1oEVws-0008AS-8p
 for qemu-arm@nongnu.org; Thu, 21 Jul 2022 09:10:38 -0400
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632]:34608)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jon.alduan@gmail.com>)
 id 1oEVwo-0004Vq-Ky
 for qemu-arm@nongnu.org; Thu, 21 Jul 2022 09:10:37 -0400
Received: by mail-ej1-x632.google.com with SMTP id oy13so3116291ejb.1
 for <qemu-arm@nongnu.org>; Thu, 21 Jul 2022 06:10:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=YCTEGCGnuxA7ToMtmJm5TZuEOBpPy9P3BKHDtJdOqAo=;
 b=DR+Fad7HwYA1Tc+FtD9/jQsvboaFSzToIBcE6Par0xuxBLKzcP0yBdN3iQeykRMNm8
 3VVzzcWMSi0u2PlFVXwt4ZtKRVk7mCanG0GLaysLiaUXVIfSwwozS5/cxtdP49FOOO8q
 NurDyEK8Vv4sQmX4S7CuXbml73fiDkG9yHIxvkivYw95+PXBnbPDn2/a8CHEqhmaQqRO
 pfcnBcnjeQY9RCtKj6ahSaFGoDtkELawdm+3nY9mjdHyRac1BfUy5fyhPhLUk/t5W35P
 h9RgyUGvfT0n6Usc2iO1Afo6mJIU9ZkxRfFwe32dYc5qqZZ1HTIhntdGProDiZvDTwXb
 a8kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=YCTEGCGnuxA7ToMtmJm5TZuEOBpPy9P3BKHDtJdOqAo=;
 b=hlBrDvQBYtG5ReB8tshIqlQSd0BRw3ddwId4ZHT727V8A452ESgBO/LezMCkCYrhjZ
 7IvO/F2eDX0KV7POlcpoZ3ECD2i+YsEskYnAmy+rixspS2kq+gat5M7NrXk/KuCHECCL
 yWn4KgmPJ01xtxyAOv28e8tvNx9+/DhoRIajaTUj8rYaDWOozRP8SLh2XE7sAWq+r+b+
 pUYc9NdD8Sus8SqzUJNHHuFcx+FUKSgFUHSw9wGkpA7N71xP5MeH2vcToO2t4IjyWWOp
 JJ4bZ9Dw//U/bIBjXLCIhjrcCgdXPH+U+4HiQn3Z3JPVVFDl/ADE5lt0qvqG4WWHrgxE
 BVxQ==
X-Gm-Message-State: AJIora9jE7Eg6Lvs3gNJU25v7RWFaZDPBslhj0PvsHknaizsyrX1f64S
 u2huYDHPx8mk/jAbUVdN7jHqUeCcDLE4Eh6p5xU=
X-Received: by 2002:a17:906:8443:b0:72b:67a6:a42f with SMTP id
 e3-20020a170906844300b0072b67a6a42fmr40221905ejy.309.1658409032459; Thu, 21
 Jul 2022 06:10:32 -0700 (PDT)
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
In-Reply-To: <CAFEAcA8hVyCwMbQ_ZNUgw8Nfb3wTvRk3gvUr8RC3gSH7Pkuv_g@mail.gmail.com>
From: Jon Alduan <jon.alduan@gmail.com>
Date: Thu, 21 Jul 2022 15:10:21 +0200
Message-ID: <CAL7npF897P3=Rro4pe_i_cmO+rUe-b1NqnJtmEM3K0kEF5VC7Q@mail.gmail.com>
Subject: Re: [qemu-arm-static] timer_delete issue from Qemu 5.0.0 onwards
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-arm@nongnu.org
Content-Type: multipart/alternative; boundary="00000000000045a9bd05e4507191"
Received-SPF: pass client-ip=2a00:1450:4864:20::632;
 envelope-from=jon.alduan@gmail.com; helo=mail-ej1-x632.google.com
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
X-TUID: 3Jfarw/Ru+O2

--00000000000045a9bd05e4507191
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Yes, exactly. When removing timer 0, time 1 will be removed instead. Other
timers are not affected. If you create a dummy timer 0, there are no more
problems (that I can address).

Thank you and looking forward to your feedback.

Jon

El jue, 21 jul 2022 a las 15:04, Peter Maydell (<peter.maydell@linaro.org>)
escribi=C3=B3:

> On Thu, 21 Jul 2022 at 13:22, Jon Alduan <jon.alduan@gmail.com> wrote:
> >
> > Hi Peter,
> >
> > I already did that with my application, here I send you the output of
> strace you requested using the application delivered by you.
>
> Thanks. There are some clues in there at least. From the
> host strace:
>
> 26585 14:18:22.936490 write(1, "Remove timer 0 536880\n", 22 <unfinished
> ...>
> 26590 14:18:22.936513 <... rt_sigprocmask resumed>NULL, 8) =3D 0
> 26591 14:18:22.936542 rt_sigprocmask(SIG_SETMASK, ~[RTMIN RT_1],
> <unfinished ...>
> 26585 14:18:22.936566 <... write resumed>) =3D 22
> 26590 14:18:22.936587 rt_sigprocmask(SIG_SETMASK, ~[RTMIN RT_1],
> <unfinished ...>
> 26585 14:18:22.936610 futex(0x905ac, FUTEX_WAKE_PRIVATE, 1 <unfinished ..=
.>
> 26591 14:18:22.936631 <... rt_sigprocmask resumed>NULL, 8) =3D 0
> 26585 14:18:22.936651 <... futex resumed>) =3D 0
> 26590 14:18:22.936671 <... rt_sigprocmask resumed>NULL, 8) =3D 0
> 26591 14:18:22.936691 rt_sigprocmask(SIG_SETMASK, [RT_4],  <unfinished ..=
.>
> 26585 14:18:22.936715 timer_delete(1 <unfinished ...>
> 26590 14:18:22.936735 rt_sigprocmask(SIG_SETMASK, [],  <unfinished ...>
> 26585 14:18:22.936757 <... timer_delete resumed>) =3D 0
>
> So the problem seems like we're straightforwardly deleting the wrong host
> timer,
> rather than being something complicated involving race conditions or how
> we pass the signal handler the ID value or whatever. I'll see if I can
> work out from the code how this might happen...
>
> -- PMM
>


--=20
j.A

--00000000000045a9bd05e4507191
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Yes, exactly. When removing timer 0, time 1 will be r=
emoved instead. Other timers are not affected. If you create a dummy timer =
0, there are no more problems (that I can address).</div><div><br></div><di=
v>Thank you and looking forward to your feedback.</div><div><br></div><div>=
Jon<br></div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D=
"gmail_attr">El jue, 21 jul 2022 a las 15:04, Peter Maydell (&lt;<a href=3D=
"mailto:peter.maydell@linaro.org">peter.maydell@linaro.org</a>&gt;) escribi=
=C3=B3:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px =
0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">On Thu, =
21 Jul 2022 at 13:22, Jon Alduan &lt;<a href=3D"mailto:jon.alduan@gmail.com=
" target=3D"_blank">jon.alduan@gmail.com</a>&gt; wrote:<br>
&gt;<br>
&gt; Hi Peter,<br>
&gt;<br>
&gt; I already did that with my application, here I send you the output of =
strace you requested using the application delivered by you.<br>
<br>
Thanks. There are some clues in there at least. From the<br>
host strace:<br>
<br>
26585 14:18:22.936490 write(1, &quot;Remove timer 0 536880\n&quot;, 22 &lt;=
unfinished ...&gt;<br>
26590 14:18:22.936513 &lt;... rt_sigprocmask resumed&gt;NULL, 8) =3D 0<br>
26591 14:18:22.936542 rt_sigprocmask(SIG_SETMASK, ~[RTMIN RT_1],<br>
&lt;unfinished ...&gt;<br>
26585 14:18:22.936566 &lt;... write resumed&gt;) =3D 22<br>
26590 14:18:22.936587 rt_sigprocmask(SIG_SETMASK, ~[RTMIN RT_1],<br>
&lt;unfinished ...&gt;<br>
26585 14:18:22.936610 futex(0x905ac, FUTEX_WAKE_PRIVATE, 1 &lt;unfinished .=
..&gt;<br>
26591 14:18:22.936631 &lt;... rt_sigprocmask resumed&gt;NULL, 8) =3D 0<br>
26585 14:18:22.936651 &lt;... futex resumed&gt;) =3D 0<br>
26590 14:18:22.936671 &lt;... rt_sigprocmask resumed&gt;NULL, 8) =3D 0<br>
26591 14:18:22.936691 rt_sigprocmask(SIG_SETMASK, [RT_4],=C2=A0 &lt;unfinis=
hed ...&gt;<br>
26585 14:18:22.936715 timer_delete(1 &lt;unfinished ...&gt;<br>
26590 14:18:22.936735 rt_sigprocmask(SIG_SETMASK, [],=C2=A0 &lt;unfinished =
...&gt;<br>
26585 14:18:22.936757 &lt;... timer_delete resumed&gt;) =3D 0<br>
<br>
So the problem seems like we&#39;re straightforwardly deleting the wrong ho=
st timer,<br>
rather than being something complicated involving race conditions or how<br=
>
we pass the signal handler the ID value or whatever. I&#39;ll see if I can<=
br>
work out from the code how this might happen...<br>
<br>
-- PMM<br>
</blockquote></div><br clear=3D"all"><br>-- <br><div dir=3D"ltr" class=3D"g=
mail_signature">j.A</div>

--00000000000045a9bd05e4507191--
