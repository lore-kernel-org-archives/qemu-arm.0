Received: by 2002:a17:505:8d87:b0:1be9:327d:8ee3 with SMTP id ri7csp2300485njc;
        Mon, 22 Jul 2024 22:10:37 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXUXwXBhVhkeHr7LGoMbpVEt/B+/oUQaoEOr8dcbKejVzU/IlfTzxFv1IDP16OzTmhLIHrmv8e1Ytntr8+V/9F+kyHEY1iB
X-Google-Smtp-Source: AGHT+IE/nUdhuSPwCzXR/myiKsnjwz10GEDPjPlMpmL/2+D/PY3BSGNxPPXBe+MpC9wrHyk2yroy
X-Received: by 2002:a05:622a:11c2:b0:441:57c1:b05c with SMTP id d75a77b69052e-44fa525e2bdmr122431161cf.3.1721711436973;
        Mon, 22 Jul 2024 22:10:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1721711436; cv=none;
        d=google.com; s=arc-20160816;
        b=ZYG6hIPkHAbTKpYKoHEEVX7adWjk8GqMJh+SpJR//7WKHkmGjau5eDzs5DJ80Njh+D
         GOXnh4d9h8YOPlYITLOf5P1KF3sYnRu+ZcqTmUYS7jImSQb7bPqIqiWKk8Cq0TopCKtK
         Z+0kCHf5Xne4BLr+/2ZDMmSrAY5IvTf8SsAAv/mS2BHdaM6UK/EjmOevNDwBWrDWjwHF
         x16cnnLz8Hk+cqWuqxAZoBhz5J2g2Nqt40AjM6T6FGxdtxQZqc8TWQLUO3ljaEuenrco
         ni5urdHMvm9LAY/22FMs34z+k/tyNCGwLREG+cQeYOn6SxQQLA22XAcYJKPLy/UW8Ya4
         UFxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=Vyq2wUMKyYXpntLfe5MN1knz1P5z94GusgZyzfTU9xk=;
        fh=ArXmQX6eBQZqjUIGy7+YfpxuVNkn5dWL32h2efp6PiA=;
        b=uUiYd44IWh5zXFOQscG+7CUYYTbie72Ts9BG0Tr00C9BlSoGKZVGQbxkOT2j8Oj4JT
         sQbJ8MnzZQ40PHN/mh0fQkOjGA7avluV5r5au5GqkZsKxFZTJfL0R0lA+IedZfMgpUrU
         eQNxg5uVxRNU8ub61ZRBXDjKmqOPdxm1KRcnatBzLo67FOgnlNIBO2ihT6qKCQNzCuiC
         l58+KWRryQKyYVPzHqjBG/d22MpqnGt4gdTlWGnpnkGMXsLBi9HVobdcvU6ZseI2fiOR
         W37ED8TCfO7GAYnqPxKr47LVCjG7VchKRYxCR3QUAchbyeR0zlqdKiDYv3dPeuH+5Bhf
         6UMg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@bsdimp-com.20230601.gappssmtp.com header.s=20230601 header.b=O4Lkkj5A;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-44f9ccf847asi87856471cf.113.2024.07.22.22.10.36
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 22 Jul 2024 22:10:36 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@bsdimp-com.20230601.gappssmtp.com header.s=20230601 header.b=O4Lkkj5A;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sW7n9-0006gn-63; Tue, 23 Jul 2024 01:10:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1sW7n7-0006Yu-Ai
 for qemu-arm@nongnu.org; Tue, 23 Jul 2024 01:10:25 -0400
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1sW7n4-00016S-AL
 for qemu-arm@nongnu.org; Tue, 23 Jul 2024 01:10:24 -0400
Received: by mail-pj1-x1030.google.com with SMTP id
 98e67ed59e1d1-2cb63ceff6dso2703737a91.1
 for <qemu-arm@nongnu.org>; Mon, 22 Jul 2024 22:10:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20230601.gappssmtp.com; s=20230601; t=1721711418; x=1722316218;
 darn=nongnu.org; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=Vyq2wUMKyYXpntLfe5MN1knz1P5z94GusgZyzfTU9xk=;
 b=O4Lkkj5A4iCamyIzHkRAMs+2c/9HM3LPYUJu6P9CX4eYBg11ymNEIlS5MiIYMccZ5p
 kuROQvYazhSFh09GcL+c2eSupxuPN4bDEokXGIdzNLOOSx3o0ghgJPPho40HqneIVkfU
 Uvmd3EC/jp4SgItFF7dEviWBmNjgDTqtRHm9M42o5e3dANnUDqfGIC9M6bzPu0NeTbBl
 NvY5O7Xc3vCK1+ld+T3qWeauZQPiFAdSXxIih1C5puymDZE2AkkPTGBXXO6WeQj5wWot
 NzZYJbttSWz6gCVvr3YHcqFE1cKVZBcOnY0TIGWfZR/iKePjpUQ7mrAW/IBWv+GULnc3
 RdyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721711418; x=1722316218;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Vyq2wUMKyYXpntLfe5MN1knz1P5z94GusgZyzfTU9xk=;
 b=ZijKsh5xTac7rsqarG3jYBN1H/xrWAW3DS8WijVehnV/pR46i1Zq218BPwS2hSyAXb
 JztBmsuxLGqydiSa9e6Gw6LdrhBIQmidfRR21TKFTT31PlF+OWqUNASQXvJ1qHEuA2Un
 lcfqZLP3la3t0rbptQvIfq9Au1pSQKf71lfEDrPfv1yaJmTOPVRqY3oRCsUzamuX1Ogv
 WiRskFkSIPfw7kAA40myEtactSNsvig96YjxEEYuRro3ItP+x35+OpnCLAWCzUnIRBFV
 gN6KdG+htXZ3VMyKF0TVtfyTBzjHxCkW+LYRYrGtGnhDP/xx1uHtDWVEX6ipzwRPKnoC
 dRmQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWGdUNKlK5x79esDSww1yGQJp2Te+2yG7t5Yit0oueXe03JRsiorbfPlUqshSYzBoRCuXAvJAwtgOVRSEQ0lag8D59/
X-Gm-Message-State: AOJu0Yz03C0j6VH1zUXohdj+LLhmgmNlnSWrPGhp9s7WM4s7ySt35c0v
 Vj/9ereRl8FYjZ/cnNFJrddYVrsv0nZ2UsQNh5wiE4Mo8CRmWHct3zhX3JjYnip1Sa1zKjxkd/O
 MQH6HyiNXuwIezlij6qR7bXfVVYk7KlvmmLalwA==
X-Received: by 2002:a17:90b:10b:b0:2c9:a015:ac2e with SMTP id
 98e67ed59e1d1-2cd2740f73cmr5192544a91.14.1721711417863; Mon, 22 Jul 2024
 22:10:17 -0700 (PDT)
MIME-Version: 1.0
References: <20240722214313.89503-1-imp@bsdimp.com>
 <20240722214313.89503-15-imp@bsdimp.com>
 <f3c9d0c0-1cfd-46c8-8524-cffbe5180d3f@linaro.org>
 <CANCZdfpPrjt8G5WWRPdMNWyb=hskk7ZCVS3HEAcway=XO=K3ng@mail.gmail.com>
 <f2f6c27e-7625-471f-b888-0f3a870bb0c4@linaro.org>
 <0b7514dc-f9ed-4c48-be37-5a5de7b26229@linaro.org>
 <CANCZdfo0cw-T29wTg9dQVOE1zmyOxdm_DnxT+GvbPVGE7OWvzw@mail.gmail.com>
In-Reply-To: <CANCZdfo0cw-T29wTg9dQVOE1zmyOxdm_DnxT+GvbPVGE7OWvzw@mail.gmail.com>
From: Warner Losh <imp@bsdimp.com>
Date: Mon, 22 Jul 2024 23:10:06 -0600
Message-ID: <CANCZdfo6xycbtvP5=ZnTyRFuQT42ZtqOo_=n7d0B8PQCMqsCBw@mail.gmail.com>
Subject: Re: [PATCH 14/14] bsd-user: Add aarch64 build to tree
To: Richard Henderson <richard.henderson@linaro.org>
Cc: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 qemu-devel@nongnu.org, Kyle Evans <kevans@freebsd.org>, qemu-arm@nongnu.org, 
 Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>, 
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Content-Type: multipart/alternative; boundary="00000000000077cb42061de32d3b"
Received-SPF: none client-ip=2607:f8b0:4864:20::1030;
 envelope-from=wlosh@bsdimp.com; helo=mail-pj1-x1030.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
X-TUID: ZnAuumBxOiS1

--00000000000077cb42061de32d3b
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Oh, also, can I get a reviewed-by?

Warner

On Mon, Jul 22, 2024 at 11:08=E2=80=AFPM Warner Losh <imp@bsdimp.com> wrote=
:

>
>
> On Mon, Jul 22, 2024 at 7:17=E2=80=AFPM Richard Henderson <
> richard.henderson@linaro.org> wrote:
>
>> On 7/23/24 08:11, Philippe Mathieu-Daud=C3=A9 wrote:
>> > On 23/7/24 00:06, Warner Losh wrote:
>> >>
>> >>
>> >> On Mon, Jul 22, 2024 at 3:54=E2=80=AFPM Philippe Mathieu-Daud=C3=A9 <
>> philmd@linaro.org
>> >> <mailto:philmd@linaro.org>> wrote:
>> >>
>> >>     Hi Warner,
>> >>
>> >>     On 22/7/24 23:43, Warner Losh wrote:
>> >>      > Add the aarch64 bsd-user fragments needed to build the new
>> >>     aarch64 code.
>> >>      >
>> >>      > Signed-off-by: Warner Losh <imp@bsdimp.com <mailto:
>> imp@bsdimp.com>>
>> >>      > ---
>> >>      >   configs/targets/aarch64-bsd-user.mak | 3 +++
>> >>      >   1 file changed, 3 insertions(+)
>> >>      >   create mode 100644 configs/targets/aarch64-bsd-user.mak
>> >>
>> >>     Can we build aarch64 on Cirrus-CI? (not clear on
>> >>     https://cirrus-ci.org/guide/FreeBSD/
>> >>     <https://cirrus-ci.org/guide/FreeBSD/>). If so, could you add
>> >>     a follow-up patch to build that on our CI, patching
>> >>     .gitlab-ci.d/cirrus.yml?
>> >>
>> >>
>> >> We can build aarch64 host for bsd-user for sure. I'll see if we can d=
o
>> it in cirrus CI.
>> >> If so, I'll try to add it to cirrus.yml.
>> >>
>> >> This patch series adds aarch64 guest...
>> >
>> > Yes, we want to use a aarch64 FreeBSD host to build your FreeBSD
>> > aarch64 bsd-user guest and test it. Am I wrong?
>> >
>>
>> This is adding guest support, so your suggestion is orthogonal.
>>
>
> Yea...  It's a good suggestion, but not what I'm working on right now...
>
> Warner
>

--00000000000077cb42061de32d3b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Oh, also, can I get a reviewed-by?</div><div><br></di=
v><div>Warner<br></div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr=
" class=3D"gmail_attr">On Mon, Jul 22, 2024 at 11:08=E2=80=AFPM Warner Losh=
 &lt;<a href=3D"mailto:imp@bsdimp.com">imp@bsdimp.com</a>&gt; wrote:<br></d=
iv><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bord=
er-left:1px solid rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr"><div =
dir=3D"ltr"><br></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Mon, Jul 22, 2024 at 7:17=E2=80=AFPM Richard Henderson &=
lt;<a href=3D"mailto:richard.henderson@linaro.org" target=3D"_blank">richar=
d.henderson@linaro.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_q=
uote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,2=
04);padding-left:1ex">On 7/23/24 08:11, Philippe Mathieu-Daud=C3=A9 wrote:<=
br>
&gt; On 23/7/24 00:06, Warner Losh wrote:<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt; On Mon, Jul 22, 2024 at 3:54=E2=80=AFPM Philippe Mathieu-Daud=C3=
=A9 &lt;<a href=3D"mailto:philmd@linaro.org" target=3D"_blank">philmd@linar=
o.org</a> <br>
&gt;&gt; &lt;mailto:<a href=3D"mailto:philmd@linaro.org" target=3D"_blank">=
philmd@linaro.org</a>&gt;&gt; wrote:<br>
&gt;&gt;<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 Hi Warner,<br>
&gt;&gt;<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 On 22/7/24 23:43, Warner Losh wrote:<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0=C2=A0 &gt; Add the aarch64 bsd-user fragments n=
eeded to build the new<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 aarch64 code.<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0=C2=A0 &gt;<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0=C2=A0 &gt; Signed-off-by: Warner Losh &lt;<a hr=
ef=3D"mailto:imp@bsdimp.com" target=3D"_blank">imp@bsdimp.com</a> &lt;mailt=
o:<a href=3D"mailto:imp@bsdimp.com" target=3D"_blank">imp@bsdimp.com</a>&gt=
;&gt;<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0=C2=A0 &gt; ---<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0=C2=A0 &gt;=C2=A0 =C2=A0configs/targets/aarch64-=
bsd-user.mak | 3 +++<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0=C2=A0 &gt;=C2=A0 =C2=A01 file changed, 3 insert=
ions(+)<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0=C2=A0 &gt;=C2=A0 =C2=A0create mode 100644 confi=
gs/targets/aarch64-bsd-user.mak<br>
&gt;&gt;<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 Can we build aarch64 on Cirrus-CI? (not clear o=
n<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 <a href=3D"https://cirrus-ci.org/guide/FreeBSD/=
" rel=3D"noreferrer" target=3D"_blank">https://cirrus-ci.org/guide/FreeBSD/=
</a><br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 &lt;<a href=3D"https://cirrus-ci.org/guide/Free=
BSD/" rel=3D"noreferrer" target=3D"_blank">https://cirrus-ci.org/guide/Free=
BSD/</a>&gt;). If so, could you add<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 a follow-up patch to build that on our CI, patc=
hing<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 .gitlab-ci.d/cirrus.yml?<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt; We can build aarch64 host for bsd-user for sure. I&#39;ll see if w=
e can do it in cirrus CI.<br>
&gt;&gt; If so, I&#39;ll try to add it to cirrus.yml.<br>
&gt;&gt;<br>
&gt;&gt; This patch series adds aarch64 guest...<br>
&gt; <br>
&gt; Yes, we want to use a aarch64 FreeBSD host to build your FreeBSD<br>
&gt; aarch64 bsd-user guest and test it. Am I wrong?<br>
&gt; <br>
<br>
This is adding guest support, so your suggestion is orthogonal.<br></blockq=
uote><div><br></div><div>Yea...=C2=A0 It&#39;s a good suggestion, but not w=
hat I&#39;m working on right now...</div><div><br></div><div>Warner <br></d=
iv></div></div>
</blockquote></div>

--00000000000077cb42061de32d3b--
