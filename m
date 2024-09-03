Received: by 2002:a17:504:3a8f:b0:1be9:327d:8ee3 with SMTP id g15csp1539103njf;
        Tue, 3 Sep 2024 11:03:03 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWp/eyVDT495KzmGeg+pprWVBalAgyAFofHP8d/PjQ/Z/wkKARh7gLj31PgTnpSgdOj7Vvwe3j+gwJSKg==@linaro.org
X-Google-Smtp-Source: AGHT+IFSBKvxNoRUHNUK+Mt90qvTq5pnOeVcsLB3Mv30IySBDxa1r1Qgow/eQEJSSCeZYzYRkIvl
X-Received: by 2002:a05:6214:570a:b0:6c3:5a86:6a2e with SMTP id 6a1803df08f44-6c510d11ffamr28344366d6.50.1725386583599;
        Tue, 03 Sep 2024 11:03:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1725386583; cv=none;
        d=google.com; s=arc-20160816;
        b=AbgEm+ChcmmkWGefOq+PQ1Flq4vMkJJMM+rZA+W5oCJTFZP5lGDFu4HfgFTJVqrbFu
         zKeT9UuqiCU73+QcxkKFiqJKM4CfA0FCcxlP6GDgYc3w5+Ep4JnjZzLl1xi2kDSjJwNI
         7S1K9v7WKS09Cifi6hPUQwux7LEVrWHrejEOimZ+zbDp1xH4Gb2YhIfmXBUaN+8Nz4em
         U8OmGoRHMBHHmkVjs2HZuU0xKb/nl6ZwFgnS2fcFxektCkb9Wb36Vp6dwuYhNd+32Onk
         phmWTmoj8TpPCiSdzLhHNxt81TX+2PGs4mxusE9IU4rFrHqPO/l/l27DEd0fvgULuTLt
         /JHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=zGjYCgAVP/s2lurUaatLvU13RQcOdBsPzWCckAdj8Ms=;
        fh=seewz1LyQho/OixjzGbedxTv9n5Cw0upkH3SsLQf1p4=;
        b=xt/U1NSESywp/xOnpm8zOB0E6Z6DD36oxEVTu8Bbq172BK+zfVTa8/3pJK1A9iO1oS
         FjrMf64Z0DAxNltmfq5bnAqiTJKd1G+6gfJuMxnmGNeFXZKa+SbydNgkP4eDDnllVSvq
         zwSd0aIdyoV5Wj1+SSNX12jqYr4sxF0QAtUphPmJah6ie3M/M31vEsYBoy70h2+LO6ys
         0mAZij9xFAxD8VX5yNxZxdjkJGlBkhp6fRTFd28xKUet/8cKd0wk3TeflWzjt+PifNRx
         d0APzqNWwvtaZj7Cck8J3ZaSTRSnVwPGIepvsznJefJ+QaYQ7dK/khyfHp3HO2JN5pvh
         vSzA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=SJIJ0QNN;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6c34fb930b5si103297186d6.356.2024.09.03.11.03.03
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 03 Sep 2024 11:03:03 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=SJIJ0QNN;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1slXri-00034B-Cb; Tue, 03 Sep 2024 14:02:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marietto2008@gmail.com>)
 id 1slXrP-0002sZ-E6; Tue, 03 Sep 2024 14:02:35 -0400
Received: from mail-pg1-x536.google.com ([2607:f8b0:4864:20::536])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marietto2008@gmail.com>)
 id 1slXrN-0000Cp-GN; Tue, 03 Sep 2024 14:02:35 -0400
Received: by mail-pg1-x536.google.com with SMTP id
 41be03b00d2f7-7c3e1081804so3051693a12.3; 
 Tue, 03 Sep 2024 11:02:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1725386551; x=1725991351; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=zGjYCgAVP/s2lurUaatLvU13RQcOdBsPzWCckAdj8Ms=;
 b=SJIJ0QNNRVDTESFcBRudF97ssyK/Lhw3YbQMOKi+SjPgCdLH28q8cI2JoYrUQU92jW
 LsY8Vdy2ih0BN5BYUTofbtDE3KTm/qW/UdpuT/XT+w2Gq94QrBAvtzvUpWlNPGyPmjbb
 AZfFR2D4K27YLtlRetlKo0lnyBY0NW8/ML4JYDlU79yPfs3iCe5bPhgy6AHdY4lSpi6M
 q6gSNNSbvrqtAKHvHZAoAWaMMsyh57oq76J/7ojyOeGZ2NXevkqauQqxix2csastsakU
 uKp+me/s0C6bsbXKGjqhTfb6T/JDNxDau+uLZTAfeR5zcqVD+WufDSKGiqi0KyAfIBjt
 4u/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725386551; x=1725991351;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=zGjYCgAVP/s2lurUaatLvU13RQcOdBsPzWCckAdj8Ms=;
 b=uVM5BmbctkSt+MoMz9+t3gFM6DTww0IO4wwSKOlkEEv8fUkEAzOgHu/nWIN4YnRpme
 yA0TfvQ7vpo3qnpZQ6AbI9ZoQ8DbF5J3I/QI3gP6M13Pm5rSHiDZHm9vqMa1G8MHjZH5
 S4c/RBNApfwjLAgp/Pi97L3dwGCXH8cxpDq7s/+AdkDvzKaDwaKVpl7NCGlgZym58nWt
 omdQ0tD7m8Naj/rHopH6zcix9Q+agWUFL5UvVasJkzdCsRO3KV+iEELsRuSkBBZ60Am0
 733tTvGVgdsAYoa1UysKVQx75fM7cN0Vl34VGhq/XrB5DCaPXnAZHtGmN6VryY+5kVSA
 sPNA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUpoyd39iih06wnPxnDIA519J6c/UuHbB9VfQy80bYgKVTwBp4AlQ6/h9GMOzg3f6CQKOyGXojbcw==@nongnu.org,
 AJvYcCWVfDh3ePffzJaofXXbWZQAyKfwtPt5DFoW1iu8nfuJydQ3HERLSIDnhRWQEQDtpW4worjgxD3pDd+WbRTC@nongnu.org
X-Gm-Message-State: AOJu0YzMJn9m3y5attC1R0UCWb581yFmlZ2dRB2wxqOjTcj2ACSmj3Jc
 QnNe4HOSCWC/DHA9kfPJLub2sqRcHNln8CFazuZ20jouMTZ0bYgjBNr3+z85wo7lXYjo5QUrMba
 SrK3cSGebeYoBlZ+NGRftJ+HsKhY=
X-Received: by 2002:a17:90b:1a8f:b0:2d8:82da:2627 with SMTP id
 98e67ed59e1d1-2da63424f8emr3042695a91.27.1725386551410; Tue, 03 Sep 2024
 11:02:31 -0700 (PDT)
MIME-Version: 1.0
References: <CA+1FSiirzpq4wjcKTLSexiOWtv26sgD37h=wA2qxv8Qh5MW_-w@mail.gmail.com>
 <23d60255-614a-4a06-b449-644f215555d0@linaro.org>
 <CA+1FSiitcSBa3JZaAZMGkdB356d2M0rPqscwFnNXGML5HghVCQ@mail.gmail.com>
 <c80e855a-ac1c-40b6-8a76-966e53c0b7d7@linaro.org>
 <4cbc21b0-0634-445d-8a67-7705a4e186d8@linaro.org>
 <CA+1FSigiu8xXF1OPs1oSPS7LiGe23gsN73RwPpJUYH=X5EkTRQ@mail.gmail.com>
 <CA+1FSiiH9LP-7UupNLjDyZJGqJAHAjN2nSLFm9fCx=ZNphxGoQ@mail.gmail.com>
 <CA+1FSih6t-Ccnxh1GvOFMf9pMjcfV1V+yyJHV=ZH0c2RY0Kjng@mail.gmail.com>
 <268989a3-cd5c-41fc-ba0d-5eb71bc6e9dc@linaro.org>
 <CA+1FSijygoVZmTkYR8Xoob4yQQdf9o3CZ2-LmzDrBh2e0VaerQ@mail.gmail.com>
 <CA+1FSigOmKen0QPKSEQqt15Zzrx4UFSCpj+5DJMCJtGnFcE+Hw@mail.gmail.com>
 <CA+1FSijfe+5V4RHs-1ow2JwAeiKcmW31V2Ddx9a9zxb_kybDFg@mail.gmail.com>
 <70b240aa-98de-4998-8c1b-34349fc831ba@linaro.org>
 <CA+1FSiiyb2v7oy43exRuY7kQpLgUcEifAE2zrEtpYPkgAY+TRw@mail.gmail.com>
 <dc0370e6-1f31-431c-8510-a954b065cf8e@linaro.org>
In-Reply-To: <dc0370e6-1f31-431c-8510-a954b065cf8e@linaro.org>
From: Mario Marietto <marietto2008@gmail.com>
Date: Tue, 3 Sep 2024 20:01:54 +0200
Message-ID: <CA+1FSijjTM3q+ZZb7P65YduWV6WXUuOs7bbduonS2E04iwDLww@mail.gmail.com>
Subject: Re: Error : init: partition(s) not found in /sys, waiting for their
 uevent(s): mmcblk0p2, mmcblk0p3 while trying to emulate Android 14 on Ubuntu
 24.04 X64 bit using qemu-system-aarch64.
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Cc: Pierrick Bouvier <pierrick.bouvier@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>, 
 qemu-discuss@nongnu.org, qemu-arm <qemu-arm@nongnu.org>, 
 Eric Blake <eblake@redhat.com>
Content-Type: multipart/alternative; boundary="0000000000007f491d06213adcfd"
Received-SPF: pass client-ip=2607:f8b0:4864:20::536;
 envelope-from=marietto2008@gmail.com; helo=mail-pg1-x536.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, HTML_MESSAGE=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: VVQN2AtCpAdN

--0000000000007f491d06213adcfd
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

> Hopefully you are right, but unlikely:
>
https://github.com/antmicro/kvm-aosp-qemu/compare/fdd76fecdd...5.0.0-kvm-ao=
sp

What do you mean ?

On Tue, Sep 3, 2024 at 7:51=E2=80=AFPM Philippe Mathieu-Daud=C3=A9 <philmd@=
linaro.org>
wrote:

> On 3/9/24 19:17, Mario Marietto wrote:
> > @Pierrick Bouvier :
> >
> > ---> I'm really glad to see it worked! Are you already running the
> > raspberry image, or vanilla AOSP ?
> >
> > No and I don't think I will. I have a project that I'm working on that
> > aims to emulate Android for Arm on Linux x64 bit. I knew that it would
> > be slow,but I didn't think it would be so much. When I used AVD as an
> > emulator,Android went faster.
> >
> >
> >       @Peter Maydell <mailto:peter.maydell@linaro.org> :
> >
> >
> > I think that I've understood the reason why several years ago it worked=
.
> > Probably I'd used this special version of qemu :
> >
> >
> > https://github.com/antmicro/kvm-aosp-qemu/releases/tag/5.0.0-kvm-aosp
> > <https://github.com/antmicro/kvm-aosp-qemu/releases/tag/5.0.0-kvm-aosp>
> >
> > I'm sure that it contains the necessary patches to be able to boot
> > Android 10 on the Jetson Nano.
>
> Hopefully you are right, but unlikely:
>
> https://github.com/antmicro/kvm-aosp-qemu/compare/fdd76fecdd...5.0.0-kvm-=
aosp
>
> Also, quoting Eric Blake:
>
>    On technical lists, it's best to avoid top-posting, and to
>    instead reply inline to make the conversation easier to follow;
>    it's also okay to trim quoted parts irrelevant to your reply,
>    as it can be assumed that anyone joining the conversation can
>    find the public list archives to catch up on the full thread.
>
> Regards,
>
> Phil.
>


--=20
Mario.

--0000000000007f491d06213adcfd
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">&gt; Hopefully you are right, but unlikely:<br><div>
&gt; <a href=3D"https://github.com/antmicro/kvm-aosp-qemu/compare/fdd76fecd=
d...5.0.0-kvm-aosp" rel=3D"noreferrer" target=3D"_blank">https://github.com=
/antmicro/kvm-aosp-qemu/compare/fdd76fecdd...5.0.0-kvm-aosp</a></div><div><=
br></div><div>What do you mean ? <br></div></div><br><div class=3D"gmail_qu=
ote"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, Sep 3, 2024 at 7:51=E2=
=80=AFPM Philippe Mathieu-Daud=C3=A9 &lt;<a href=3D"mailto:philmd@linaro.or=
g">philmd@linaro.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quo=
te" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204=
);padding-left:1ex">On 3/9/24 19:17, Mario Marietto wrote:<br>
&gt; @Pierrick Bouvier :<br>
&gt; <br>
&gt; ---&gt; I&#39;m really glad to see it worked! Are you already running =
the <br>
&gt; raspberry image, or vanilla AOSP ?<br>
&gt; <br>
&gt; No and I don&#39;t think I will. I have a project that I&#39;m working=
 on that <br>
&gt; aims to emulate Android for Arm on Linux x64 bit. I knew that it would=
 <br>
&gt; be slow,but I didn&#39;t think it would be so much. When I used AVD as=
 an <br>
&gt; emulator,Android went faster.<br>
&gt; <br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0@Peter Maydell &lt;mailto:<a href=3D"mailto:=
peter.maydell@linaro.org" target=3D"_blank">peter.maydell@linaro.org</a>&gt=
; :<br>
&gt; <br>
&gt; <br>
&gt; I think that I&#39;ve understood the reason why several years ago it w=
orked. <br>
&gt; Probably I&#39;d used this special version of qemu :<br>
&gt; <br>
&gt; <br>
&gt; <a href=3D"https://github.com/antmicro/kvm-aosp-qemu/releases/tag/5.0.=
0-kvm-aosp" rel=3D"noreferrer" target=3D"_blank">https://github.com/antmicr=
o/kvm-aosp-qemu/releases/tag/5.0.0-kvm-aosp</a> <br>
&gt; &lt;<a href=3D"https://github.com/antmicro/kvm-aosp-qemu/releases/tag/=
5.0.0-kvm-aosp" rel=3D"noreferrer" target=3D"_blank">https://github.com/ant=
micro/kvm-aosp-qemu/releases/tag/5.0.0-kvm-aosp</a>&gt;<br>
&gt; <br>
&gt; I&#39;m sure that it contains the necessary patches to be able to boot=
 <br>
&gt; Android 10 on the Jetson Nano.<br>
<br>
Hopefully you are right, but unlikely:<br>
<a href=3D"https://github.com/antmicro/kvm-aosp-qemu/compare/fdd76fecdd...5=
.0.0-kvm-aosp" rel=3D"noreferrer" target=3D"_blank">https://github.com/antm=
icro/kvm-aosp-qemu/compare/fdd76fecdd...5.0.0-kvm-aosp</a><br>
<br>
Also, quoting Eric Blake:<br>
<br>
=C2=A0 =C2=A0On technical lists, it&#39;s best to avoid top-posting, and to=
<br>
=C2=A0 =C2=A0instead reply inline to make the conversation easier to follow=
;<br>
=C2=A0 =C2=A0it&#39;s also okay to trim quoted parts irrelevant to your rep=
ly,<br>
=C2=A0 =C2=A0as it can be assumed that anyone joining the conversation can<=
br>
=C2=A0 =C2=A0find the public list archives to catch up on the full thread.<=
br>
<br>
Regards,<br>
<br>
Phil.<br>
</blockquote></div><br clear=3D"all"><br><span class=3D"gmail_signature_pre=
fix">-- </span><br><div dir=3D"ltr" class=3D"gmail_signature">Mario.<br></d=
iv>

--0000000000007f491d06213adcfd--
