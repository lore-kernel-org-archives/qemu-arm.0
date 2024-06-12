Received: by 2002:a17:906:6a09:b0:a6f:1bf6:7fc1 with SMTP id qw9csp390454ejc;
        Wed, 12 Jun 2024 06:28:31 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCX2kls6zA/5f4zGQSkV8w/G9y3DMc1bykoBS3NDn/J2PQn2QJ/KN17t9yMNCfjsgJTzMjabrBPWGezHoelZaGz6GMHJopYi
X-Google-Smtp-Source: AGHT+IGqm1heVzjr1xe42+3Vg0Sl/PkWtkhetRrjyHc+2AB34L5Yr7ldGgcp4QfKR49Xg8tquFFw
X-Received: by 2002:adf:ed0b:0:b0:35f:2c43:8861 with SMTP id ffacd0b85a97d-35fe89259f1mr1250476f8f.66.1718198911668;
        Wed, 12 Jun 2024 06:28:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1718198911; cv=none;
        d=google.com; s=arc-20160816;
        b=rDUPN2jZanZnedv/2MzX9Z4CBKOs+xggkpyzCuqloH62NzXnPHkQCBt+djGF6dNuXG
         e4mSm/CCzZfp1Ul1i5Q0Ee6Kd4/9aHhrssbgDZElYS6fIPSqp/2QrWaijdre7Jb1uhh5
         o6e3+Av6A2bknZSan+/BNe1h2icllr4hHur2+dLGSTo3GN806XRow5u8cpNl3NOYnGFa
         l1BMjqTcbtI28ne5t2DLwSx7+pjlZrzwbaRUVw2Akcx7cNMcjx6XiRVWZACDXzT9HLSG
         I5bFhwDo2Wq9buci7u5ydnaYDqVrhbQCRAPwn3RT/aQEWHX5Fakd5AxtAJuYEg6P/p3e
         eBww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=GFr3fZmqM7guIIyHjGunMfMnnDi4exUIFHXwNN3VOCo=;
        fh=Fn8A+ERDIRbJ5gqi+M7NhMa4T9krcRh481jaOzfWO6o=;
        b=nJPsaRmj2ydx2tip87vkatxMZXnIXH4KkcSN+lDbs91Zw6Sxx9aU352jkbYT5x71c1
         sozk9zUql/Wa0bh3Bi6X3a0YLiKPSHD/jziqjIE2VoQYYpPsCQ/X5ERcuYO38zozA6xk
         Aw6mLGqbHMLMrrRLhMcTrw7CFAuTbf8CbPowkeSIS6Qy0nOZne42c8MBQeC0FsfkGh6W
         nhuND/6DOLK9E9zZb0vPQWuYJ9gu/3wbv5HKZN7RrODh+hSpBz2cCeFHlWnxFtcHV01A
         Q3YbMelwxn1tuH8SvAKYkG6KcGYReNQVwl/63WLn+IgaHyzhIKTCBPh3Azrunmt533SC
         FQYQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Vhz20U1z;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ffacd0b85a97d-35f169157a3si5660041f8f.971.2024.06.12.06.28.31
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 12 Jun 2024 06:28:31 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Vhz20U1z;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sHO1J-00064q-Lj; Wed, 12 Jun 2024 09:28:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kkostiuk@redhat.com>)
 id 1sHO1I-00064J-NP
 for qemu-arm@nongnu.org; Wed, 12 Jun 2024 09:28:08 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kkostiuk@redhat.com>)
 id 1sHO1G-0005Hx-EX
 for qemu-arm@nongnu.org; Wed, 12 Jun 2024 09:28:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1718198885;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=GFr3fZmqM7guIIyHjGunMfMnnDi4exUIFHXwNN3VOCo=;
 b=Vhz20U1zkUSF8Wkcd4C69goHXWLTINxWixm+D6MOSZG9bbQv+L5wt6klZYGKXhNypMjrb3
 N5sKkwCvZtPjty4EiecuiKCpgTVlImA+5teUfcwW6XxvVVfMW23tcpRMkvPMv1CkOCOuVF
 7eogBwxsJlA5XJhM7mHnEa6ShTPQJvA=
Received: from mail-oa1-f69.google.com (mail-oa1-f69.google.com
 [209.85.160.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-513-DHvAw-QDOI6OZRNNLodR8w-1; Wed, 12 Jun 2024 09:28:01 -0400
X-MC-Unique: DHvAw-QDOI6OZRNNLodR8w-1
Received: by mail-oa1-f69.google.com with SMTP id
 586e51a60fabf-254dfc90aadso2322318fac.1
 for <qemu-arm@nongnu.org>; Wed, 12 Jun 2024 06:28:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718198881; x=1718803681;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=GFr3fZmqM7guIIyHjGunMfMnnDi4exUIFHXwNN3VOCo=;
 b=DCoNyINny2nv6hpUNpf+8YRKB4pbywQUjgwmJDJnF+pCRvaNTi1hoN4IsC0zzU29H9
 mr2FdmRX9ERnMPd7nmplvwN3h779kz22qxPDtL7kvYRADIKPdkEZy2guKnd9ApY0zr2R
 GL+icXckkP77iKzrU679OWk5+h6ItOQn7H40Hi+SwNSdClFCG9OXRWpcJ6aTH+9ZSOLA
 5afaLoa1rZDXGNgURx1/CazLtkkIZZ1PNvz2PI9rKm6UHfpk5hGKPRlDxY22BphuLDUo
 7uIJX8oF58pngjPHV5G1+05QOGo3PmIGJfZKUvLWjd4+arl7jhNoN//ZHl4QJqDZAX+9
 4uIQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUg7pbSbgr63MCpLA3pIK/wQCAqXQA8Pdy1ItboItsGm0inFX9OwrW2hT8Ilhdi8xQPaZF4fmSiFwGbCUSPt7HMteqD
X-Gm-Message-State: AOJu0YznVgj6TNqKYvN5s1N5d5oSFrwE271YP2mwOw9Rvw+Sx3kZZLEz
 /PlACKk/1c6aQNDBVFwDf2XuvNz51b7WDOIrxBAT2xvQOHwc4ftvmekzfue+ocnuzEDwjN+S7WW
 lEqb1BmTTGC4fc/x3r7Dtkkr9fZCMgiDu3DzVbscGOKMLnK4S8F8LPtvZ9BuYRN1hKL9vY83vHG
 KWaXvyRlxSuxqiGXF91u/+6GX8
X-Received: by 2002:a05:6870:b151:b0:24c:a395:1957 with SMTP id
 586e51a60fabf-25514cdf739mr2372844fac.26.1718198880956; 
 Wed, 12 Jun 2024 06:28:00 -0700 (PDT)
X-Received: by 2002:a05:6870:b151:b0:24c:a395:1957 with SMTP id
 586e51a60fabf-25514cdf739mr2372821fac.26.1718198880618; Wed, 12 Jun 2024
 06:28:00 -0700 (PDT)
MIME-Version: 1.0
References: <20231005045041.52649-1-philmd@linaro.org>
 <20231005045041.52649-22-philmd@linaro.org>
 <87mswx5n63.fsf@pond.sub.org>
 <18739a67-84bb-4fd3-adb6-0db0f0eb7af1@linaro.org>
 <87plsmfgxq.fsf@pond.sub.org>
In-Reply-To: <87plsmfgxq.fsf@pond.sub.org>
From: Konstantin Kostiuk <kkostiuk@redhat.com>
Date: Wed, 12 Jun 2024 16:27:49 +0300
Message-ID: <CAPMcbCqPya2bV1y=WG=DXMCtc_b1N3AybrMbYM=Uoqbqkfvewg@mail.gmail.com>
Subject: Re: [RFC PATCH v2 21/22] qapi: Inline and remove QERR_UNSUPPORTED
 definition
To: Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Cc: Michael Roth <michael.roth@amd.com>, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, 
 qemu-ppc@nongnu.org, qemu-block@nongnu.org, qemu-s390x@nongnu.org
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="000000000000eeeb83061ab15977"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kkostiuk@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.143,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: fgcNnkvbzdg6

--000000000000eeeb83061ab15977
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Markus and Philippe,

I agree to remove QERR_UNSUPPORTED and have more specific errors
or even remove the functions from the schema in some cases instead of
copy-paste QERR_UNSUPPORTED from platform to platform.

Best Regards,
Konstantin Kostiuk.


On Wed, Jun 12, 2024 at 4:07=E2=80=AFPM Markus Armbruster <armbru@redhat.co=
m> wrote:

> Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org> writes:
>
> > Michael, Konstantin, QERR_UNSUPPORTED is only used by QGA.
> >
> > Do you mind giving our maintainer's position on Markus
> > analysis so we can know how to proceed with this definition?
>
> Daniel Berrang=C3=A9 recently posted patches that get rid of most instanc=
es
> of QERR_UNSUPPORTED:
>
>     [PATCH 00/20] qga: clean up command source locations and conditionals
>
> https://lore.kernel.org/qemu-devel/20240604134933.220112-1-berrange@redha=
t.com/
>
> I pointed out a possible opportunity to remove even more.
>
> I think we should let the dust settle there, then figure out how to
> eliminate remaining QERR_UNSUPPORTED, if any.
>
>

--000000000000eeeb83061ab15977
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi Markus and Philippe,</div><div><br></div><div>I ag=
ree to remove QERR_UNSUPPORTED and have more specific errors</div><div>or e=
ven remove the functions from the schema in some cases instead of</div><div=
>copy-paste QERR_UNSUPPORTED from platform to platform.<br></div><div><br><=
/div><div><div><div dir=3D"ltr" class=3D"gmail_signature" data-smartmail=3D=
"gmail_signature"><div dir=3D"ltr"><div>Best Regards,</div><div>Konstantin =
Kostiuk.</div></div></div></div><br></div></div><br><div class=3D"gmail_quo=
te"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, Jun 12, 2024 at 4:07=E2=
=80=AFPM Markus Armbruster &lt;<a href=3D"mailto:armbru@redhat.com">armbru@=
redhat.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">Philippe Mathieu-Daud=C3=A9 &lt;<a href=3D"mailto:philmd@linaro.=
org" target=3D"_blank">philmd@linaro.org</a>&gt; writes:<br>
<br>
&gt; Michael, Konstantin, QERR_UNSUPPORTED is only used by QGA.<br>
&gt;<br>
&gt; Do you mind giving our maintainer&#39;s position on Markus<br>
&gt; analysis so we can know how to proceed with this definition?<br>
<br>
Daniel Berrang=C3=A9 recently posted patches that get rid of most instances=
<br>
of QERR_UNSUPPORTED:<br>
<br>
=C2=A0 =C2=A0 [PATCH 00/20] qga: clean up command source locations and cond=
itionals<br>
=C2=A0 =C2=A0 <a href=3D"https://lore.kernel.org/qemu-devel/20240604134933.=
220112-1-berrange@redhat.com/" rel=3D"noreferrer" target=3D"_blank">https:/=
/lore.kernel.org/qemu-devel/20240604134933.220112-1-berrange@redhat.com/</a=
><br>
<br>
I pointed out a possible opportunity to remove even more.<br>
<br>
I think we should let the dust settle there, then figure out how to<br>
eliminate remaining QERR_UNSUPPORTED, if any.<br>
<br>
</blockquote></div>

--000000000000eeeb83061ab15977--

