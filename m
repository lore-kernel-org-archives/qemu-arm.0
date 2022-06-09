Received: by 2002:a19:ee12:0:0:0:0:0 with SMTP id g18csp707729lfb;
        Thu, 9 Jun 2022 14:26:44 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwN5/yqUjnOViNPJ6YG+HMvFpNyy2xf63Wge36Fd+n5Oef1Rksfk5OOtKWRr4/N7nqJwGDt
X-Received: by 2002:a05:622a:104b:b0:305:bcb:9c78 with SMTP id f11-20020a05622a104b00b003050bcb9c78mr5230377qte.456.1654810003834;
        Thu, 09 Jun 2022 14:26:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1654810003; cv=none;
        d=google.com; s=arc-20160816;
        b=yWKip+Qocz+DTd+tsheobyimuyd83lJpYwc36QMBFaInQa9+6A6PYjEWgprcEawZx9
         F2kxiOSbRiPazjmm7G/kYmwbJw7i7/83gosASB/wom/AGb894aTneSHjKhTrFE38D86O
         9jgGm79JRPWygiyK86oFVvcUVdcaXjHsnjCxqCxbouZj5sanrn/VLvcG81BKP7tc8YRp
         Q0+1vPmrSdbNOrlKVI5ru2HOhEg+jiebIjvGD7QloA6wTkF5TrM6mQ5OYSP9vVG2oInj
         wnhNc77h7EEiEBuxGqrh9bSqqNoNZD7KAmCoJsxswYPM4TypHQtouCqKIhZ8KRsFwpi4
         NoIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=j25t1EHex6Nz7LLqX73h6Ki6+7SnNbh3pvKYcQm8SR0=;
        b=asM866JfcYEbqvFh9xk6+C2L4BLPDuvGMLyaIAgypIihRVZFmKzhI94H3WXiAc8qI8
         dUhy4NVM53RcNE/qw0M7zKQKd6Evd5bG71Y5DCvgxiYXQCgdp9I0VP/TCa58Zx0NoPG/
         cp0pcBIdvvEMvcFDhcYm4HKh3UV4DlqRVU/zk6TapdGvj9Jr6Frz7JF8iXcLwN0v8d1f
         t9R2CWrr5x9JWVK90ctAyJWv+dqemtXYSjrSBK7Cgko2EoXyDh/4fGVkibIfTd9P5lgI
         a7T2krmQNW0tQzeOi/tSD7fNwmdIAlgrRyFOdmxchNhlZlQ1VQUbR2g22ya1317gtV7L
         EU4Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20210112 header.b=ntEbfIvY;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m2-20020a05620a24c200b006a6f369ed9asi5253247qkn.216.2022.06.09.14.26.43
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 09 Jun 2022 14:26:43 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20210112 header.b=ntEbfIvY;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Received: from localhost ([::1]:33340 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nzPfv-0007RG-8X
	for alex.bennee@linaro.org; Thu, 09 Jun 2022 17:26:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53530)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wuhaotsh@google.com>)
 id 1nzPfV-0007Pq-6n
 for qemu-arm@nongnu.org; Thu, 09 Jun 2022 17:26:17 -0400
Received: from mail-qv1-xf33.google.com ([2607:f8b0:4864:20::f33]:44627)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wuhaotsh@google.com>)
 id 1nzPfH-0000RZ-5h
 for qemu-arm@nongnu.org; Thu, 09 Jun 2022 17:26:15 -0400
Received: by mail-qv1-xf33.google.com with SMTP id h18so17414728qvj.11
 for <qemu-arm@nongnu.org>; Thu, 09 Jun 2022 14:26:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=j25t1EHex6Nz7LLqX73h6Ki6+7SnNbh3pvKYcQm8SR0=;
 b=ntEbfIvYWJfQEtXEishJGKVA5rhhivgCx0C22xWjl1kkND9Sm+Y82oWdp5Y7CrdR34
 dPN2uyCwYtl2gwSFVYjtZ4CuLQo8Pq4SvrNo6O+OTcQKLXsjmc8JK76KJF5hpfd4LOiP
 CK1eTpngk1jv0Q61d3J8gYepwueljlClFCdR0a6kQVDWa7iyvIVl/2SFJRWSwJ/wt3ou
 lcCEERXPqC1327TJ7baJ1Bv1c5pGvgJSlKwF+LMPJdcwWuPNFrQfCpBkXgmP1+YqK1cN
 JZa0mn6xIJbJEJf7tzFs4+WCyuEaUAE0+tRWhuXb0du56PIMFKoafAL5WGvObSHzdB+n
 KaxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=j25t1EHex6Nz7LLqX73h6Ki6+7SnNbh3pvKYcQm8SR0=;
 b=cuA8Jsli2eyRpbLiHMOEcbsDtHXeCOaX36+eaLWfyfA2RVlZ9kEJdUXjDa3BBn/44m
 8il5yhycweFu0cIy+cIOth+On1iNNh3Ay0wO2v/rohXyMV7afCfosqmgCbpERrhhdvFp
 JjLK6ilpx9Yf+3qt1/JtUOxYl8m4mF9X2miZqXlfccZSpqYO6RwN4PJzoo4pCl71U1o0
 J/XdVsF+43lzO9EW34XCLB7sfvVxLZyPaYRq8ERvGAkYVedV24OvnUQxb1JYIzvplbzF
 0Zw6ffmZpMqdh5XL+mpq5XUzMGJ3Sq7eV9jvBedjPoJetwtjOB2l8EGvCh7iNseZbS8z
 xjZg==
X-Gm-Message-State: AOAM533yZmqHk2AqJcDtP3uWkE/8ovkvmaQlssKCw76P05rf98T5tGsZ
 JrN/VpNpvhvGv2h3T/EVg/wcs27rQgFtxxMHK1LLUA==
X-Received: by 2002:ad4:5bc1:0:b0:42c:531c:ef12 with SMTP id
 t1-20020ad45bc1000000b0042c531cef12mr88387890qvt.15.1654809961323; Thu, 09
 Jun 2022 14:26:01 -0700 (PDT)
MIME-Version: 1.0
References: <20220225174451.192304-1-wuhaotsh@google.com>
 <CAFEAcA8vcRme05raLOhtaxmvbbLhLrSZwEaz1BVk5uUYSdmL6w@mail.gmail.com>
 <CAO=notyz+SjAoomWGubV5pBuc4qSmNdJF5cmMBf7J8DevF9T4A@mail.gmail.com>
In-Reply-To: <CAO=notyz+SjAoomWGubV5pBuc4qSmNdJF5cmMBf7J8DevF9T4A@mail.gmail.com>
From: Hao Wu <wuhaotsh@google.com>
Date: Thu, 9 Jun 2022 14:25:49 -0700
Message-ID: <CAGcCb13k1RtJ7VVhp3goYhUrD61ScWMWrhGuARtuUOH17GozCg@mail.gmail.com>
Subject: Re: [PATCH v5] tests/qtest: add qtests for npcm7xx sdhci
To: Patrick Venture <venture@google.com>
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm <qemu-arm@nongnu.org>, 
 QEMU Developers <qemu-devel@nongnu.org>, Chris Rauer <crauer@google.com>, 
 Shengtan Mao <stmao@google.com>, John Snow <jsnow@redhat.com>
Content-Type: multipart/alternative; boundary="000000000000eabdeb05e10a7789"
Received-SPF: pass client-ip=2607:f8b0:4864:20::f33;
 envelope-from=wuhaotsh@google.com; helo=mail-qv1-xf33.google.com
X-Spam_score_int: -175
X-Spam_score: -17.6
X-Spam_bar: -----------------
X-Spam_report: (-17.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 ENV_AND_HDR_SPF_MATCH=-0.5, HTML_MESSAGE=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01, USER_IN_DEF_DKIM_WL=-7.5,
 USER_IN_DEF_SPF_WL=-7.5 autolearn=unavailable autolearn_force=no
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
X-TUID: t0Id9tuuQOei

--000000000000eabdeb05e10a7789
Content-Type: text/plain; charset="UTF-8"

Hi,

We did some experiments on this issue. It looks like the image size
restriction is in firmware. So in qtest we can make it
much smaller (e.g. 1MB) and the test still passes. We can send a patch with
this change if necessary.

On Thu, May 26, 2022 at 9:21 AM Patrick Venture <venture@google.com> wrote:

>
>
> On Thu, May 26, 2022 at 8:54 AM Peter Maydell <peter.maydell@linaro.org>
> wrote:
>
>> On Fri, 25 Feb 2022 at 17:45, Hao Wu <wuhaotsh@google.com> wrote:
>> >
>> > From: Shengtan Mao <stmao@google.com>
>> >
>> > Reviewed-by: Hao Wu <wuhaotsh@google.com>
>> > Reviewed-by: Chris Rauer <crauer@google.com>
>> > Signed-off-by: Shengtan Mao <stmao@google.com>
>> > Signed-off-by: Patrick Venture <venture@google.com>
>>
>> Hi; John Snow tells me that this test fails in the tests/vm/netbsd
>> VM (you can test this with 'make vm-build-netbsd') because the
>> assert() on the ftruncate() call fails:
>>
>> > +    ret = ftruncate(fd, NPCM7XX_TEST_IMAGE_SIZE);
>> > +    g_assert_cmpint(ret, ==, 0);
>>
>> > +#define NPCM7XX_TEST_IMAGE_SIZE (1 << 30)
>>
>> I haven't investigated the exact cause, but this is a
>> gigabyte, right? That's a pretty massive file for a test case to
>> create -- can we make the test use a more sensible size of
>> sd card image ?
>>
>
> It looks like the nuvoton part had an issue with a smaller image size, but
> we can resurrect that thread and poke at it a bit and see what shakes out.
>
>
>>
>> thanks
>> -- PMM
>>
>

--000000000000eabdeb05e10a7789
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi,<div><br></div><div>We did some experiments on this iss=
ue. It looks like the image size restriction is in firmware. So in qtest we=
 can make it</div><div>much smaller (e.g. 1MB) and the test still passes. W=
e can send a patch with this change if necessary.</div></div><br><div class=
=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, May 26, 2022=
 at 9:21 AM Patrick Venture &lt;<a href=3D"mailto:venture@google.com">ventu=
re@google.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" sty=
le=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddi=
ng-left:1ex"><div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"=
gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, May 26, 2022 at =
8:54 AM Peter Maydell &lt;<a href=3D"mailto:peter.maydell@linaro.org" targe=
t=3D"_blank">peter.maydell@linaro.org</a>&gt; wrote:<br></div><blockquote c=
lass=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px soli=
d rgb(204,204,204);padding-left:1ex">On Fri, 25 Feb 2022 at 17:45, Hao Wu &=
lt;<a href=3D"mailto:wuhaotsh@google.com" target=3D"_blank">wuhaotsh@google=
.com</a>&gt; wrote:<br>
&gt;<br>
&gt; From: Shengtan Mao &lt;<a href=3D"mailto:stmao@google.com" target=3D"_=
blank">stmao@google.com</a>&gt;<br>
&gt;<br>
&gt; Reviewed-by: Hao Wu &lt;<a href=3D"mailto:wuhaotsh@google.com" target=
=3D"_blank">wuhaotsh@google.com</a>&gt;<br>
&gt; Reviewed-by: Chris Rauer &lt;<a href=3D"mailto:crauer@google.com" targ=
et=3D"_blank">crauer@google.com</a>&gt;<br>
&gt; Signed-off-by: Shengtan Mao &lt;<a href=3D"mailto:stmao@google.com" ta=
rget=3D"_blank">stmao@google.com</a>&gt;<br>
&gt; Signed-off-by: Patrick Venture &lt;<a href=3D"mailto:venture@google.co=
m" target=3D"_blank">venture@google.com</a>&gt;<br>
<br>
Hi; John Snow tells me that this test fails in the tests/vm/netbsd<br>
VM (you can test this with &#39;make vm-build-netbsd&#39;) because the<br>
assert() on the ftruncate() call fails:<br>
<br>
&gt; +=C2=A0 =C2=A0 ret =3D ftruncate(fd, NPCM7XX_TEST_IMAGE_SIZE);<br>
&gt; +=C2=A0 =C2=A0 g_assert_cmpint(ret, =3D=3D, 0);<br>
<br>
&gt; +#define NPCM7XX_TEST_IMAGE_SIZE (1 &lt;&lt; 30)<br>
<br>
I haven&#39;t investigated the exact cause, but this is a<br>
gigabyte, right? That&#39;s a pretty massive file for a test case to<br>
create -- can we make the test use a more sensible size of<br>
sd card image ?<br></blockquote><div><br></div><div>It looks like the nuvot=
on part had an=C2=A0issue with a smaller image size, but we can resurrect t=
hat thread and poke at it a bit and see what shakes out.</div><div>=C2=A0</=
div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bor=
der-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
thanks<br>
-- PMM<br>
</blockquote></div></div>
</blockquote></div>

--000000000000eabdeb05e10a7789--
