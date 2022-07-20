Received: by 2002:ac2:596f:0:0:0:0:0 with SMTP id h15csp2700065lfp;
        Wed, 20 Jul 2022 08:19:30 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1uGycfGWzlqRA4hoE1ccDVQLIoP9sxdLGHsCQD0oHt1emjWWqCm4v60FTNUMtsWvm2Uyqfq
X-Received: by 2002:a05:620a:31c:b0:6b5:d5a5:687f with SMTP id s28-20020a05620a031c00b006b5d5a5687fmr15937409qkm.375.1658330370403;
        Wed, 20 Jul 2022 08:19:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1658330370; cv=none;
        d=google.com; s=arc-20160816;
        b=Sc6QrARhhwW8FCztVWkKoWKdlIkr/JYj8nZ1Eixr6aY2XRpQRU03BwhDHHqOvimnz3
         dy8gKBgAWEUvTWlH8DWR7Hk9iRycGkbwlg01NU1p2popyO2e0E6y4QIqV/8jhnumNK3/
         uHDzSH6oJtvEQ17zI9E9UJa0MhV/q9A9I/po8Tcsp5R0g1EINsXRnaK9jxJ7rav4Y8Y0
         9c1znaMHndqzVes4OZ3i7NOETc54ifO1GCKcDJ/uMV7vFfBVafpdBQ3+sw/RrGnaZDiF
         9U5Q6ml1xgDpgdvDqI32fq55qe8QTGQkjYmIlJUZVnKRnCHpg3r7D2aFKnU7G+Sp9kg1
         wf2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=CoNQLo7y+eKbSYlWQaXCuiGbczG8wOl5RYVpznbeIio=;
        b=tJhgAbF+CC0LGWNr176GZHZPKdqlCG75iC0binDQXYZNUG7x8S0Gk2JkvtzN4bCvpu
         oPXb43nyVtrVIGsOhkf+3oJ+6Y/vYjvnVRTEAhAUPgvhHasY1g6ZL0w5ZGm7Dx/+dtmt
         tBI9PMo21Rk0QkLkQfEM6FhKjFHEAkWrGvXQYOP27p8pXxD/TC9nwYnqlZIRanQ5WHC9
         +QMpHbNbdzzzlJoJcI9V8FhT2APn+oQnpPAJZlRGi510Qli8HJ2BZVu1h2XIfNNvFG7u
         0Zpu9J1feKFzKPSAzM1ImKULdyjVWhVT/4S0008Q8UkmY/g4AjoZvjBbg6f/oSP/a+bu
         oQsQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20210112 header.b=EoHjgtvE;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y19-20020a05620a25d300b006af6aad3a2esi3246241qko.71.2022.07.20.08.19.30
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 20 Jul 2022 08:19:30 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20210112 header.b=EoHjgtvE;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:55898 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1oEBU1-0007j9-Ul
	for alex.bennee@linaro.org; Wed, 20 Jul 2022 11:19:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35202)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jon.alduan@gmail.com>)
 id 1oEBTq-0007iy-Ns
 for qemu-arm@nongnu.org; Wed, 20 Jul 2022 11:19:18 -0400
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a]:40686)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jon.alduan@gmail.com>)
 id 1oEBTo-00042H-TQ
 for qemu-arm@nongnu.org; Wed, 20 Jul 2022 11:19:18 -0400
Received: by mail-ej1-x62a.google.com with SMTP id tk8so22285900ejc.7
 for <qemu-arm@nongnu.org>; Wed, 20 Jul 2022 08:19:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=CoNQLo7y+eKbSYlWQaXCuiGbczG8wOl5RYVpznbeIio=;
 b=EoHjgtvEwRTO3tVi/4vKX7EUS/Iv8xIkaynGpH8j2UvH006QzrCEpq4yn3zMfWZbEg
 BTx+cNOH96XdTDc2WkZKAtS2vCLK1iJP4+9R4R1yZlw5LfrQFLO2YfkJ/RymetTrpaXz
 059Uuqu4rRHyBUushXpzHdz/yWoRtux/Rb8wyUNNf6dgFWpn1G3142TRoyQ9XZQ5DwGA
 Zr/pZWqBqkDkpLyqBvrUTaJcc9xHrJJkGMRfba1mvFhs07Nc+2Y0VjVJcRZO2spCj5sb
 zFXdQFnZUUNuOyBDSRMPCKMOS4VozBs5bZBQsOet6HORfvCaZIGCs0w8jQvdW2Poz3oA
 o7bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=CoNQLo7y+eKbSYlWQaXCuiGbczG8wOl5RYVpznbeIio=;
 b=pGeyOrNCAIuJpdSofCfLLsozy3GMopePyaEGRx0oUSQuSGdiKIO0x4Vf9L1ntNglOs
 HOB+SN1hCzAN2RjaB9Iuzro38poPvWA5GE4ByBW7gHAbGnncKCF+N/q8pPRR/3otRTp+
 z8A3OADXpNWGyxgGgkQlp9bURP1BGweY1xphnC8po7viWgWFAtMB5HVLQ5Q0sBKkGw+i
 vRVgjbnqZzk52RznmSlY7zCf2bCT4RLjnnI8eIi9THrKxfyB6dKLkqn7uWonz2JxEHSo
 r3Hhse7HxIPgJlq27Rpws5vJR+IVem0I1ATa09Zo8Nl9tBTzDruF51BT7jINgsfmFI9H
 4wug==
X-Gm-Message-State: AJIora+5hK8jBxNTqziUk/fH7/p5g6s6rhYLbI4JEZuCPp1Z64WnZK8H
 38OAsLCsBqYbQBzSinwgUxLWcXeS4hIhSgQQuuM=
X-Received: by 2002:a17:907:96a4:b0:72b:647e:30fd with SMTP id
 hd36-20020a17090796a400b0072b647e30fdmr35220030ejc.723.1658330354826; Wed, 20
 Jul 2022 08:19:14 -0700 (PDT)
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
In-Reply-To: <CAFEAcA8hbU7PJK-YvOkbjj2F2PBW1M9J10DkHqUPXTSxYOS-5Q@mail.gmail.com>
From: Jon Alduan <jon.alduan@gmail.com>
Date: Wed, 20 Jul 2022 17:19:03 +0200
Message-ID: <CAL7npF9neZUWweuZFqDkO5mh5=tZj3ybjZUvVoF932cJibpRiw@mail.gmail.com>
Subject: Re: [qemu-arm-static] timer_delete issue from Qemu 5.0.0 onwards
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-arm@nongnu.org
Content-Type: multipart/alternative; boundary="000000000000b8450f05e43e1f92"
Received-SPF: pass client-ip=2a00:1450:4864:20::62a;
 envelope-from=jon.alduan@gmail.com; helo=mail-ej1-x62a.google.com
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
X-TUID: nadtOK7G1TQf

--000000000000b8450f05e43e1f92
Content-Type: text/plain; charset="UTF-8"

Ok. Did you try out the qemu-arm-static_500 I provided?

I have no clue what else we can check for. I tested It on WSL2 with kernel
versions 5.4 and 5.10 and also on a VM with 5.13. Same issue everywhere.
Could It be the difference, that I am running Linux on virtual envoronments
and you on a real Linux system?
Could this fact influence qemu behavior?

Best regards
Jon


Peter Maydell <peter.maydell@linaro.org> igorleak hau idatzi zuen (2022
uzt. 20, az. 17:09):

> On Wed, 20 Jul 2022 at 15:45, Jon Alduan <jon.alduan@gmail.com> wrote:
> >
> > Hi Peter,
> >
> > then, this is the key. Please try a newer version. As I put in the
> title, this issue is only to see from 5.0.0 onwards. Qemu version 4.2.1
> works fine for that.
>
> Er, yes, I know 4.2.1 is fine. That's not what I've been testing
> with -- I built versions 5.0 and current-head-of-git from source.
> But you asked what the Ubuntu qemu-arm version on my system was,
> so I answered that...
>
> thanks
> -- PMM
>

--000000000000b8450f05e43e1f92
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Ok. Did you try out the qemu-arm-static_500 I provided?<d=
iv dir=3D"auto"><br></div><div dir=3D"auto">I have no clue what else we can=
 check for. I tested It on WSL2 with kernel versions 5.4 and 5.10 and also =
on a VM with 5.13. Same issue everywhere.</div><div dir=3D"auto">Could It b=
e the difference, that I am running Linux on virtual envoronments and you o=
n a real Linux system?</div><div dir=3D"auto">Could this fact influence qem=
u behavior?</div><div dir=3D"auto"><br></div><div dir=3D"auto">Best regards=
</div><div dir=3D"auto">Jon</div><div dir=3D"auto"><br></div></div><br><div=
 class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">Peter Maydell =
&lt;<a href=3D"mailto:peter.maydell@linaro.org">peter.maydell@linaro.org</a=
>&gt; igorleak hau idatzi zuen (2022 uzt. 20, az. 17:09):<br></div><blockqu=
ote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc s=
olid;padding-left:1ex">On Wed, 20 Jul 2022 at 15:45, Jon Alduan &lt;<a href=
=3D"mailto:jon.alduan@gmail.com" target=3D"_blank" rel=3D"noreferrer">jon.a=
lduan@gmail.com</a>&gt; wrote:<br>
&gt;<br>
&gt; Hi Peter,<br>
&gt;<br>
&gt; then, this is the key. Please try a newer version. As I put in the tit=
le, this issue is only to see from 5.0.0 onwards. Qemu version 4.2.1 works =
fine for that.<br>
<br>
Er, yes, I know 4.2.1 is fine. That&#39;s not what I&#39;ve been testing<br=
>
with -- I built versions 5.0 and current-head-of-git from source.<br>
But you asked what the Ubuntu qemu-arm version on my system was,<br>
so I answered that...<br>
<br>
thanks<br>
-- PMM<br>
</blockquote></div>

--000000000000b8450f05e43e1f92--
