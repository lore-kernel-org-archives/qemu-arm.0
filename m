Received: by 2002:a19:ee0a:0:0:0:0:0 with SMTP id g10csp579397lfb;
        Wed, 11 Nov 2020 08:53:08 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxZwbiUNsN96O3mtahkDZNMLKXT9Lathxv+SSO9vcHklJatlN+RpzrpztRIIktAr5Q07KVm
X-Received: by 2002:a25:5016:: with SMTP id e22mr2374206ybb.156.1605113588656;
        Wed, 11 Nov 2020 08:53:08 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1605113588; cv=none;
        d=google.com; s=arc-20160816;
        b=Bb9ap0zWebID8MDHAV1Ghr7EKENr5OubBBlhhS54wAQWO6MOj2GJTyTzmRBd6jkjlr
         5SLTJxRE3xBUGBy6CmsJhtp3OlN2kh25YkE1xm9oPX7D6l34B5NcUHfms/7LJAR9OSjx
         Lk+RaKdIFWA6dygvQxXUY/3/wpfspWP7XeXno9GP71hz07hQelG+QXwnC8CvGREDkEa2
         O7w6UEF/EGwb6GXkUuwpEqaQ5263N5bIQA6u1qyMyvSQRDJsRjqRNV18Dk4FVJ3DgzZC
         YH3I7c7BDGeRVKk8rffFCVOzg8xfihObk5mCtNE4EZ0DnznJAQav8B2DQki7g1R9Qp/U
         OfEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=OZPp11DvRVV9lUx7GVVmPc1W5GyoG8cNsXDBQwAqY/I=;
        b=FFIiIpx9pYtLoXcB2Gn4ps7I73Y8mviLU8wPTqnucogAZsiXyQjTwMAaNgvBy3PuoA
         mvI0SPhgaCdpTHu9NpMAhEqjwyiKUuFjVtinyudAomiqh2VW5pA4iAH8R5Jvs3v6CQEK
         +DH/qNxePyIx7R6PT4C/yPy/GmHdoReEFwMMdKkFqj2lfRMU3u5vioRYtFNsFDfBvC0h
         i7ojm+GgqkopJtMa43Uclbzn/2qE8zRHGcy3DYzYL9grnpap5HdIdtD1sMWVev8/Xpmi
         k9JzJShfnEGRIy77fmE6nozDVwhO+JGWlKCwm1twM4Dyh2dy7wij7eh2QWnzeD4Oyx7G
         slQw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b="ad7j/XoP";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id b139si737141ybg.237.2020.11.11.08.53.07
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 11 Nov 2020 08:53:08 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b="ad7j/XoP";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:50164 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kctMp-0003ge-8v
	for alex.bennee@linaro.org; Wed, 11 Nov 2020 11:53:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46044)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rbsingh1983@gmail.com>)
 id 1kctMi-0003gX-GL
 for qemu-arm@nongnu.org; Wed, 11 Nov 2020 11:53:00 -0500
Received: from mail-lj1-x22e.google.com ([2a00:1450:4864:20::22e]:38995)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <rbsingh1983@gmail.com>)
 id 1kctMg-0003TW-Da
 for qemu-arm@nongnu.org; Wed, 11 Nov 2020 11:53:00 -0500
Received: by mail-lj1-x22e.google.com with SMTP id o24so2834044ljj.6
 for <qemu-arm@nongnu.org>; Wed, 11 Nov 2020 08:52:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=OZPp11DvRVV9lUx7GVVmPc1W5GyoG8cNsXDBQwAqY/I=;
 b=ad7j/XoPg5Efye1OEFpbCAPFVVc2h70+pWEVfGgo4Yimb9gRutAuH323GdQAL2VVcg
 WSh6Pxd7eIU8CRRErTSAs51MVOBXW9I0ekef3XgEyEAiNZU0VJZ7L/oicSGIZD/G+MDX
 vsj7vTdMnc5T1iX0k+3Izws19lXnbrmsG3MWCi3XTgG1MsTLwWmriI9BrxLK6LH+jDVD
 fkrffYmbuuGUZLj3h/5Wr6UCUM/e1kXusxgVtcZiisTiy4cNq9hPdz9qIJMXRRciIYq7
 2XbEAENy8JTenWM3put4j6U/J5HlFye5SzUJNDBQJiwMAZBnLQGxHRSu8PDa3TzgMfyO
 gX6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=OZPp11DvRVV9lUx7GVVmPc1W5GyoG8cNsXDBQwAqY/I=;
 b=TTDJFWfC1g9zkh12oX2Pa8sn5nNSos0ptZPtUtGrU+DQpcff6xz1OQJCpbPA7IAOVx
 MuKqTyNViKx+TnSFRUMSn5NnvqB/o4qKYnvQdH4GkaRf2nEchA6x25e5ISIyGZkmNzL4
 bJfmxJ6fnxEFcOuV1pOdn0cnV/D8xNlsUoq5kp0xcZFK6heJbEUyIShSZ3LCC8hV/WtI
 ceC8n70O0l7QJnxE9lrnYffi6vWRMhnhm675cJn1wafQvUhUXR0iVQn9nYEsf2qAKTil
 mI5N8jJ4VNKclMYE3xeu5lS6sRstn8LJXPFrMuhAIz/kIyvIUygV/4D1X8/Irmqy2v5F
 Sn2Q==
X-Gm-Message-State: AOAM532zmFrzAuNiPed/qY3Lj8g3SN2ryu0HL63VnKzf+yxqVfYyAiqd
 wL2lm6HuwAv9mRWuAIkeOXxRUSudEB39WlSTiWc=
X-Received: by 2002:a2e:91cd:: with SMTP id u13mr10115129ljg.239.1605113576025; 
 Wed, 11 Nov 2020 08:52:56 -0800 (PST)
MIME-Version: 1.0
References: <CAB+VpJkthrifUseJdx667T_UL=579ySZ=v6+aW8bWYBcsg08Wg@mail.gmail.com>
 <CAFEAcA_RCZfCjk2_KQ=_9fhz1O6A6Ev+GNAOTmGThnAHBaxs5w@mail.gmail.com>
 <CAB+VpJkQR0kd1MY8jnv+oCVKzGq1MJR15ed1tG-MO2-d3R41Vg@mail.gmail.com>
 <CAFEAcA_p8_WfVYtxAiDJS2P2Y622Xcb-k01AJzkqtBy776Co0g@mail.gmail.com>
In-Reply-To: <CAFEAcA_p8_WfVYtxAiDJS2P2Y622Xcb-k01AJzkqtBy776Co0g@mail.gmail.com>
From: Rajan Singh <rbsingh1983@gmail.com>
Date: Wed, 11 Nov 2020 11:52:44 -0500
Message-ID: <CAB+VpJkXhLTbf-REe5PXO=m_wahEr1pJMaCNYyVA0MUYLhXq8Q@mail.gmail.com>
Subject: Re: Error while configuring Qemu
To: Peter Maydell <peter.maydell@linaro.org>
Content-Type: multipart/alternative; boundary="00000000000085f41e05b3d7a020"
Received-SPF: pass client-ip=2a00:1450:4864:20::22e;
 envelope-from=rbsingh1983@gmail.com; helo=mail-lj1-x22e.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, HTML_MESSAGE=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: qemu-arm <qemu-arm@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: TQM2C43Qz3W1

--00000000000085f41e05b3d7a020
Content-Type: text/plain; charset="UTF-8"

Hi Peter,
I am noe using ubuntu20.4 and doing all these configuration.I am getting
below error-

*./meson.build:568:2: ERROR: Dependency "sdl2" not found, tried pkgconfig
and config-tool*

could you pls help.

Thanks.

On Wed, Nov 11, 2020 at 11:27 AM Peter Maydell <peter.maydell@linaro.org>
wrote:

> On Wed, 11 Nov 2020 at 16:06, Rajan Singh <rbsingh1983@gmail.com> wrote:
> >
> > Hi Peter,
> > Thanks for the information.It helped me.
> > Now I am getting an error regarding meson.Could help to fix this .
> > Here is the screenshot of the error-
>
> Please quote error messages by cutting and pasting their text,
> not by taking screen shots.
>
> The error message from the build seems clear enough to me:
> it could not find the pixman-1 dependency, so you need to
> install it. The wiki provides some information on installing
> dependencies on Linux hosts:
> https://wiki.qemu.org/Hosts/Linux#Building_QEMU_for_Linux
>
> I see also that you appear to be using Ubuntu 16.04.
> This is a version that is older than any Ubuntu which
> QEMU currently supports. QEMU may still build OK, or on
> the other hand you may find that configure complains that
> it requires a newer version of some dependency than is
> available in the Ubuntu 16.04 packages. (You can in theory
> build such missing dependencies locally yourself but it's
> probably easier to just upgrade to a newer Ubuntu.)
>
> (QEMU's distro support policy is documented here:
> https://www.qemu.org/docs/master/system/build-platforms.html
> For distros like Ubuntu with a 'long-lifetime' type release
> (like LTS), we support the most recent major version, and
> the previous major version up until 2 years after the next
> major version was released. So we support 20.04 LTS (the
> most recent) and also will support 18.04 LTS until at least
> April 2022 (since 20.04 was released in April 2020), but
> anything older than that is not officially supported and
> may or may not work.)
>
> thanks
> -- PMM
>

--00000000000085f41e05b3d7a020
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi Peter,<div>I am noe using ubuntu20.4 and doing all thes=
e configuration.I am getting below error-</div><div><br></div><div><b>./mes=
on.build:568:2: ERROR: Dependency &quot;sdl2&quot; not found, tried pkgconf=
ig and config-tool</b><br></div><div><br></div><div>could you pls help.</di=
v><div><br></div><div>Thanks.</div></div><br><div class=3D"gmail_quote"><di=
v dir=3D"ltr" class=3D"gmail_attr">On Wed, Nov 11, 2020 at 11:27 AM Peter M=
aydell &lt;<a href=3D"mailto:peter.maydell@linaro.org">peter.maydell@linaro=
.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"mar=
gin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1=
ex">On Wed, 11 Nov 2020 at 16:06, Rajan Singh &lt;<a href=3D"mailto:rbsingh=
1983@gmail.com" target=3D"_blank">rbsingh1983@gmail.com</a>&gt; wrote:<br>
&gt;<br>
&gt; Hi Peter,<br>
&gt; Thanks for the information.It helped me.<br>
&gt; Now I am getting an error regarding meson.Could help to fix this .<br>
&gt; Here is the screenshot of the error-<br>
<br>
Please quote error messages by cutting and pasting their text,<br>
not by taking screen shots.<br>
<br>
The error message from the build seems clear enough to me:<br>
it could not find the pixman-1 dependency, so you need to<br>
install it. The wiki provides some information on installing<br>
dependencies on Linux hosts:<br>
<a href=3D"https://wiki.qemu.org/Hosts/Linux#Building_QEMU_for_Linux" rel=
=3D"noreferrer" target=3D"_blank">https://wiki.qemu.org/Hosts/Linux#Buildin=
g_QEMU_for_Linux</a><br>
<br>
I see also that you appear to be using Ubuntu 16.04.<br>
This is a version that is older than any Ubuntu which<br>
QEMU currently supports. QEMU may still build OK, or on<br>
the other hand you may find that configure complains that<br>
it requires a newer version of some dependency than is<br>
available in the Ubuntu 16.04 packages. (You can in theory<br>
build such missing dependencies locally yourself but it&#39;s<br>
probably easier to just upgrade to a newer Ubuntu.)<br>
<br>
(QEMU&#39;s distro support policy is documented here:<br>
<a href=3D"https://www.qemu.org/docs/master/system/build-platforms.html" re=
l=3D"noreferrer" target=3D"_blank">https://www.qemu.org/docs/master/system/=
build-platforms.html</a><br>
For distros like Ubuntu with a &#39;long-lifetime&#39; type release<br>
(like LTS), we support the most recent major version, and<br>
the previous major version up until 2 years after the next<br>
major version was released. So we support 20.04 LTS (the<br>
most recent) and also will support 18.04 LTS until at least<br>
April 2022 (since 20.04 was released in April 2020), but<br>
anything older than that is not officially supported and<br>
may or may not work.)<br>
<br>
thanks<br>
-- PMM<br>
</blockquote></div>

--00000000000085f41e05b3d7a020--
