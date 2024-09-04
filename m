Received: by 2002:a17:505:1f8d:b0:1be9:327d:8ee3 with SMTP id pt13csp62858njb;
        Wed, 4 Sep 2024 03:14:10 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVuS7ELwrMNtBuB+QXsJjNDw5GrlwRpT1H0OBb3eETZ5M6Iti2ReJhD3zRUtH6LC2S2oB/bvaBoQkkbkA==@linaro.org
X-Google-Smtp-Source: AGHT+IFTRTezJSYdeRjjk09xoCbVG3Mbonx+b9q30Pe1Rwbk9lh1hv/ToVATjsd2txrYAdciMdqZ
X-Received: by 2002:a05:620a:2f4:b0:7a7:d6db:4016 with SMTP id af79cd13be357-7a98889f94dmr227926185a.18.1725444849988;
        Wed, 04 Sep 2024 03:14:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1725444849; cv=none;
        d=google.com; s=arc-20160816;
        b=ZeI9/urv5g//x//qzbAbkPrkAsLhvK3eYvO3Jr7Y3mfa1NaBv6xLi+23W8sU4rpJFV
         0lTY/j3MX8Ur6Ubx7d4yRsX9DNyNunCxuIF9pJQnDTBZFUYGWwLrsnX3fd0uR7FsDwnm
         g9v0O0122agp3B+6Ak9L+OTyEUE6Z6tAuXi5avv3knJAxsWeB5Sxjy3rSFmz9HDl7Eal
         muWARDFaGlFYyNE/Enam2fzpUKWVL3hFQkqN9rNMwWbwwF4zdEpBK6XhLtunjeVKZB2h
         WMmN6rmPoEK5zSJA/M8i/3hnOKu5omjTvIkwQiZCxZDYR3gP0Y6T3QAMyeH5LtAgMBDa
         lngA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=SazIJTIecdyJvBZe0ZZhDbZonR5qrYKQbkiwH788/DM=;
        fh=evJQLQpibKMQm55pibu+AafhkP99QjW/vKyFNR8VFt8=;
        b=mlMxAbpGglDiFi42UGr9KU1ao+nH8oKdHTp2iiVCm3OD/qyvZKkE4FdpMlnccGlJ+L
         hmjjKYXcYklIPzL2o1JYk/3rJUvgdoli8RDO8I529hfgXaoEH+jiwZPN6Yq4P9a1+vT/
         5dr+geLlG7//aXBqAbDqSJSMKG8IepsImII7JCohKL+0vKp3iv/xzionlOHVJ25pLKCU
         LXVQEwAF3nH0rBiQxnyKw9TxviDQGFaN3cncYBrF38DmUUrfpN5VmGml5W0ss2/BAv2m
         asK/3gOBnvUBKVcUe2d0juvQRysv30OepndspreLeIDHDDH5/uXGVIdvHveX2jZg+nC9
         S2wQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=Iz4JpUUE;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7a806db3d53si1477485685a.566.2024.09.04.03.14.09
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 04 Sep 2024 03:14:09 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=Iz4JpUUE;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sln1K-0007zw-Jv; Wed, 04 Sep 2024 06:13:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marietto2008@gmail.com>)
 id 1sln1G-0007kU-PZ; Wed, 04 Sep 2024 06:13:46 -0400
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marietto2008@gmail.com>)
 id 1sln1B-0002Oo-CW; Wed, 04 Sep 2024 06:13:45 -0400
Received: by mail-pj1-x102f.google.com with SMTP id
 98e67ed59e1d1-2d87176316eso437411a91.0; 
 Wed, 04 Sep 2024 03:13:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1725444819; x=1726049619; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=SazIJTIecdyJvBZe0ZZhDbZonR5qrYKQbkiwH788/DM=;
 b=Iz4JpUUEJ7KFmUTLOf+E3ZRfFKq3qcUGEJDsGulFDyS6EAsjCbM7WjnfALgi2y6a8Q
 QGcJvE26DoDkx7B20uqOgY3S2wTeej+61KmIZndS5Omk1sTVPrDwFR4bIc+iWbZW9eDK
 Gs3R8BZkWWnh7Q7p7R0J63v6Xlt4LLsvn1f9RZL0pV1hb3AGI8MQ/DVo2cHmLXKGzqHq
 AZ8cN5t+cSx+bCt8ZhlUi22hpzh4H+WS7JopZo14dv1c7C9nKOTNvxi8yD/uF+/bBM1K
 pa0WElXrW5O5mmcNqhTQIFbOiwCegLICkADXiJFCY3iba8QJG9b4lRm2OfLFz1uoD+MG
 AqeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725444819; x=1726049619;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=SazIJTIecdyJvBZe0ZZhDbZonR5qrYKQbkiwH788/DM=;
 b=H8PDYevXzGBRewbYz77tt3Y/HvfqPB9SDAlRB55rf+5htUrKI1dEb2rMx8+EWWyOjB
 ioEN0IP7vlka6KG2s3WaQ7SamS5gbwxgUrOIM6CwJhdN3W7TTENTpTE6LGa8Df9y8x7G
 aQqv7qM2GPO8vTUL85WiTGdLDdZqkk8DaPYSaRqWDqXtUz4ZvMffhzCYDMkvQuLZLa+v
 FnjbfDW0xwDRlliRIikgA01QTMhuzKoXB4BfzOwR5EuhrLwrMHDOutmfMKVzhMLBQ3aA
 DGWhLqUnlmt+b7k1VKbu7uqVrX/ySIUOKb35Oe+KG+yQlAGm33f8QBkfR5SxO6fpMDdG
 8fLw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUwuJogY6BH61C87+FeTXZxQynv11XUSrTQQO4wr46Ug8o1lrV1f/IeeSa04k3YgRpiGBnmcasJ/L/38aCx@nongnu.org,
 AJvYcCXFh6onoEse99HegSuzZNoOLuebWOadDYv25y9uwOC3B9x/n2ZTFOubwTp8mz3URlTxsgoVp+XC5Q==@nongnu.org
X-Gm-Message-State: AOJu0Yy+BMdP/xkYKTBt32UH/NQnOpT1dIbnFGZpBYyqj+JWjoNWLGQF
 A4QZAuqiUuPd6PpfwFQNaNiQlqa3JUaK4g9Wk1XS+FycCjLm3amrN5MYkkSO3SM6eF85fJz1uS8
 5NiS4CJWiZE6yxABBDMxVDbT7hF0XO7Lyz0Q=
X-Received: by 2002:a17:90a:bc95:b0:2d8:7c44:487c with SMTP id
 98e67ed59e1d1-2da8eef0349mr2638430a91.12.1725444819505; Wed, 04 Sep 2024
 03:13:39 -0700 (PDT)
MIME-Version: 1.0
References: <CA+1FSiirzpq4wjcKTLSexiOWtv26sgD37h=wA2qxv8Qh5MW_-w@mail.gmail.com>
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
 <6eac1f19-59a2-440a-a5b3-f4d9654ba539@linaro.org>
 <CA+1FSigjog5DO4UJ4bjo+rvtRc2ih+yJF0q9HM7y6N=aSg6w=A@mail.gmail.com>
 <CA+1FSijxZ5Ocic-aGTikNxr_faS54fP=P+2uuCxfypMJKEE2aQ@mail.gmail.com>
 <2eeb9049-3444-49e0-892e-7022ab045647@linaro.org>
In-Reply-To: <2eeb9049-3444-49e0-892e-7022ab045647@linaro.org>
From: Mario Marietto <marietto2008@gmail.com>
Date: Wed, 4 Sep 2024 12:13:02 +0200
Message-ID: <CA+1FSigoFF_FSKSGbs4jOyya6DJrEH9O0MMV84+XowZ7RkmFNw@mail.gmail.com>
Subject: Re: Error : init: partition(s) not found in /sys, waiting for their
 uevent(s): mmcblk0p2, mmcblk0p3 while trying to emulate Android 14 on Ubuntu
 24.04 X64 bit using qemu-system-aarch64.
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Cc: Pierrick Bouvier <pierrick.bouvier@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>, 
 qemu-discuss@nongnu.org, qemu-arm <qemu-arm@nongnu.org>
Content-Type: multipart/alternative; boundary="0000000000008bd97c0621486d9c"
Received-SPF: pass client-ip=2607:f8b0:4864:20::102f;
 envelope-from=marietto2008@gmail.com; helo=mail-pj1-x102f.google.com
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
X-TUID: bUJ4MM3UmuXE

--0000000000008bd97c0621486d9c
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

-> What do you mean by "qemu patched"?

Isn't this version of qemu :

https://github.com/antmicro/kvm-aosp-qemu/releases/tag/5.0.0-kvm-aosp

properly patched or adapted,I don't know how to define it,to boot Android
10 on the Jetson Nano ?

-> Hopefully you are right, but unlikely:
>
https://github.com/antmicro/kvm-aosp-qemu/compare/fdd76fecdd...5.0.0-kvm-ao=
sp
<https://github.com/antmicro/kvm-aosp-qemu/compare/fdd76fecdd...5.0.0-kvm-a=
osp>

What do you mean with "Hopefully you are right,but unlikely" ?


On Wed, Sep 4, 2024 at 11:54=E2=80=AFAM Philippe Mathieu-Daud=C3=A9 <philmd=
@linaro.org>
wrote:

> On 3/9/24 22:52, Mario Marietto wrote:
> > Unfortunately the usage of qemu patched to boot Android 10 on the Jetso=
n
> > nano didn't change anything. I get the same exact errors as before. :(
>
> What do you mean by "qemu patched"?
>
>

--=20
Mario.

--0000000000008bd97c0621486d9c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div><span class=3D"gmail-im">-&gt; </span>What do you mea=
n by &quot;qemu patched&quot;?</div><div><br></div><div>Isn&#39;t this vers=
ion of qemu :<br></div><div><br></div><div><a href=3D"https://github.com/an=
tmicro/kvm-aosp-qemu/releases/tag/5.0.0-kvm-aosp" target=3D"_blank">https:/=
/github.com/antmicro/kvm-aosp-qemu/releases/tag/5.0.0-kvm-aosp</a></div><di=
v><br></div><div>properly patched or adapted,I don&#39;t know how to define=
 it,to boot Android 10 on the Jetson Nano ?</div><div><br></div><div>-&gt; =
Hopefully you are right, but unlikely:<br>
<a href=3D"https://github.com/antmicro/kvm-aosp-qemu/compare/fdd76fecdd...5=
.0.0-kvm-aosp" rel=3D"noreferrer" target=3D"_blank">&gt; https://github.com=
/antmicro/kvm-aosp-qemu/compare/fdd76fecdd...5.0.0-kvm-aosp</a></div><div><=
br></div><div>What do you mean with &quot;Hopefully you are right,but unlik=
ely&quot; ?<br></div><div><br></div></div><br><div class=3D"gmail_quote"><d=
iv dir=3D"ltr" class=3D"gmail_attr">On Wed, Sep 4, 2024 at 11:54=E2=80=AFAM=
 Philippe Mathieu-Daud=C3=A9 &lt;<a href=3D"mailto:philmd@linaro.org">philm=
d@linaro.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" styl=
e=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddin=
g-left:1ex">On 3/9/24 22:52, Mario Marietto wrote:<br>
&gt; Unfortunately the usage of qemu patched to boot Android 10 on the Jets=
on <br>
&gt; nano didn&#39;t change anything. I get the same exact errors as before=
. :(<br>
<br>
What do you mean by &quot;qemu patched&quot;?<br>
<br>
</blockquote></div><br clear=3D"all"><br><span class=3D"gmail_signature_pre=
fix">-- </span><br><div dir=3D"ltr" class=3D"gmail_signature">Mario.<br></d=
iv>

--0000000000008bd97c0621486d9c--
