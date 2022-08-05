Received: by 2002:a05:6512:1086:0:0:0:0 with SMTP id j6csp898088lfg;
        Fri, 5 Aug 2022 02:25:13 -0700 (PDT)
X-Google-Smtp-Source: AA6agR5+QxCMdAHBhiWDQNysOnHPGSpFfMpt0/xDz0S+tqdNFaAhFqBfW329qJvp4dKhiTSbAnZU
X-Received: by 2002:a0c:eb09:0:b0:474:9b46:f9f6 with SMTP id j9-20020a0ceb09000000b004749b46f9f6mr4875098qvp.78.1659691512846;
        Fri, 05 Aug 2022 02:25:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1659691512; cv=none;
        d=google.com; s=arc-20160816;
        b=OvXjQSVH9ttX49FabEqU5kOYD/l/aChIxc+SE81leUtxo+o/znjp8VQrm4PjNPmbjn
         HOEvk62KKGju2gt5DMm8d3siD2c/omxTyfRkh/6Cax6Yo6sDPWmqGYLtGJGUV1E5RAHF
         b5D6N6y/z5rDV7UMUeZmPA7KF+DOtkjm1RIETWJQMtybl4K5gDSSQjF8/NR8kRX4QxCA
         pHm8qubLLgOsHw5yowU3rh8VnhsjHqOY0sDcRDKwpowHWSOnlxB9VBk8XwtTr78X/xOH
         iOlaK2zAzFgMBvNtLBfAwYYTAZkm7kXhCNDR5F9Y4VzH9UdsgsHQcvzrALqwhe1+c2F3
         NiHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=Nk0MpEGp6s06a+FVqnJVQ0MagwkoRyanPy1l9WyWctI=;
        b=qQfOJxwFabE5wdedCanE684K2a2J+/8S++f8mIYUn58OsIBuMpb7O8sH88uqnjD6Yf
         t5vlwGR+8QQYic6Ic+8/2sPzIrbLoIBnwx20ikwZN3vA/rnuLSnws99eUT2kX0dZnz46
         NMELEBh/t2y2HbtOwUiX8vX9buRYrhQa5NMZtafF3fxILvcS4ABYxMLw1OYPsN26aaUr
         lVkkW9bjGT7KBHOiV3bpvnMWdSWRa7DVOEtat77Uf4AejmSddmXASAWL+irjEaUKZ4DO
         KnctFnrTzWLqyma8npdE7XHzi1bn3A/NcsNM4hlgyXUbw+S761Up1QyMTBBCJ/4L0UeM
         YGtQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20210112 header.b=KXH3EnKZ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id hr9-20020a05621423c900b00474108c0fd1si1805439qvb.580.2022.08.05.02.25.12
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 05 Aug 2022 02:25:12 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20210112 header.b=KXH3EnKZ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:46106 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1oJtZw-0005QH-BC
	for alex.bennee@linaro.org; Fri, 05 Aug 2022 05:25:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46572)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jon.alduan@gmail.com>)
 id 1oJtXJ-0003rd-Qe
 for qemu-arm@nongnu.org; Fri, 05 Aug 2022 05:22:30 -0400
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632]:41699)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jon.alduan@gmail.com>)
 id 1oJtXI-00070N-3y
 for qemu-arm@nongnu.org; Fri, 05 Aug 2022 05:22:29 -0400
Received: by mail-ej1-x632.google.com with SMTP id gk3so3943344ejb.8
 for <qemu-arm@nongnu.org>; Fri, 05 Aug 2022 02:22:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc;
 bh=Nk0MpEGp6s06a+FVqnJVQ0MagwkoRyanPy1l9WyWctI=;
 b=KXH3EnKZBF+UpntR/tOc5VdfiIqGaq68Y7yWM4qq3FUnU18BO69U+fcFuYIf3/qKcP
 FWek7yCbOp9ycRfz7PYbw7l7ayeee3ADrvMCvPE4Np5Jbwv2lMV8WrurfFAyU5hxALlE
 xKM+Yz+W0kuY+L68UHYu1tQHKw62tSsKlOfnc26AZ3ueFzC61pukAqqHkERj5QTb6red
 EtzgihfaupMhCsMOb/5tOesAtzJdTfFJOCnkIx/fEc+Fdxyg6DHhZGQc72ewHEXOMiWO
 etBdnt93IGGPoDhqYCVdDZWlkTdwbPiVauFe5203L+hKb457ue0PJ+pj8c4HJPu9pNOR
 o1MA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=Nk0MpEGp6s06a+FVqnJVQ0MagwkoRyanPy1l9WyWctI=;
 b=DtsiLFe26ndpGg+CAJ/E+YBAhVnE+3d5m6tAJ8JdYG9DLovZa2V9q+f2ckpaHfA9f3
 9Vb3U83r5Lel6rDc2Gc3gjq42jQ5Uq0dQ1/iVxTQCZlxkiXdoXuyV6CHZF9zGQn/bAr6
 ECeJtxyd90bjHEo6IoC3e6WJwrzLwBt/RI+h8lPJ1x9JjgKrERg+lwse6C4ZYmli8nWG
 g1EL32p5bPXrvy3diGyEiEV+28Rj3+o5Bvd4GhAwg8v33yvhcRf5//mut5WbmzOgUxOK
 ltXjEo3Ct1QFj24ZJfQ41HhcQ1f8N3hYNNnnCjlvHQqiAX/nzkuINpJR+9Pauj+0bEGt
 s2eg==
X-Gm-Message-State: ACgBeo2xQU4DDEFrShUDxvbWkmC3X2K2X34dFD1vTJ+kkX8ZHkyCLUOy
 rbA3CDhzNStuIlA5uNLCyYf4X/X8KJbuC3HGrUg=
X-Received: by 2002:a17:907:2bc4:b0:730:aa9c:bd86 with SMTP id
 gv4-20020a1709072bc400b00730aa9cbd86mr4702686ejc.341.1659691345665; Fri, 05
 Aug 2022 02:22:25 -0700 (PDT)
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
 <CAL7npF839onoBJxewXraSGRPmbK=8SqbPeU2W3YN7kFYW6j9tQ@mail.gmail.com>
 <CAFEAcA8wfEfxZh4NFpbDAsB=Rz=9-UcafOWbEtGkJ1WGZs71WQ@mail.gmail.com>
 <CAFEAcA9GdtaUmn_Ft3uYobfwNX0wkg2tDUTC2uS2erim32W8YA@mail.gmail.com>
In-Reply-To: <CAFEAcA9GdtaUmn_Ft3uYobfwNX0wkg2tDUTC2uS2erim32W8YA@mail.gmail.com>
From: Jon Alduan <jon.alduan@gmail.com>
Date: Fri, 5 Aug 2022 11:22:13 +0200
Message-ID: <CAL7npF89woO0-rXJkc2chvAwpH+mtbBnz+QZt8q2B+YY=hb2FQ@mail.gmail.com>
Subject: Re: [qemu-arm-static] timer_delete issue from Qemu 5.0.0 onwards
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-arm@nongnu.org
Content-Type: multipart/alternative; boundary="00000000000018633b05e57b0130"
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
X-TUID: 0Cp0OZwrGPOn

--00000000000018633b05e57b0130
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello Peter,

I did some more tests and saw that you have limited the max. number of
POSIX timers at any time to 32. Do you have any special reason to do that?

Thank you for your support.

Best regards
Jon

El lun, 25 jul 2022 a las 13:07, Peter Maydell (<peter.maydell@linaro.org>)
escribi=C3=B3:

> On Thu, 21 Jul 2022 at 21:36, Peter Maydell <peter.maydell@linaro.org>
> wrote:
> > Now I understand the cause of the bug I'll think about how to
> > best fix it, but I won't get to that until next week.
>
> I've now posted a patch which I think should fix it:
> https://patchew.org/QEMU/20220725110035.1273441-1-peter.maydell@linaro.or=
g/
>
> -- PMM
>


--=20
j.A

--00000000000018633b05e57b0130
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hello Peter,</div><div><br></div><div>I did some more=
 tests and saw that you have limited the max. number of POSIX timers at any=
 time to 32. Do you have any special reason to do that?</div><div><br></div=
><div>Thank you for your support.</div><div><br></div><div>Best regards</di=
v><div>Jon<br></div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" c=
lass=3D"gmail_attr">El lun, 25 jul 2022 a las 13:07, Peter Maydell (&lt;<a =
href=3D"mailto:peter.maydell@linaro.org">peter.maydell@linaro.org</a>&gt;) =
escribi=C3=B3:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0=
px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">O=
n Thu, 21 Jul 2022 at 21:36, Peter Maydell &lt;<a href=3D"mailto:peter.mayd=
ell@linaro.org" target=3D"_blank">peter.maydell@linaro.org</a>&gt; wrote:<b=
r>
&gt; Now I understand the cause of the bug I&#39;ll think about how to<br>
&gt; best fix it, but I won&#39;t get to that until next week.<br>
<br>
I&#39;ve now posted a patch which I think should fix it:<br>
<a href=3D"https://patchew.org/QEMU/20220725110035.1273441-1-peter.maydell@=
linaro.org/" rel=3D"noreferrer" target=3D"_blank">https://patchew.org/QEMU/=
20220725110035.1273441-1-peter.maydell@linaro.org/</a><br>
<br>
-- PMM<br>
</blockquote></div><br clear=3D"all"><br>-- <br><div dir=3D"ltr" class=3D"g=
mail_signature">j.A</div>

--00000000000018633b05e57b0130--
