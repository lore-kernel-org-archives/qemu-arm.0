Received: by 2002:a17:505:610b:b0:1be9:327d:8ee3 with SMTP id tt11csp6631752njc;
        Mon, 11 Nov 2024 05:16:04 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCXt7xPlT4tfxBfhGDabEwZeih+aOKhvS0GnB0qJPDv16cDRX/4Cz9DycDIDLtao4vfXvecYHZeejv/IAw==@linaro.org
X-Google-Smtp-Source: AGHT+IGFnN1BbayEvqkhOIM2vik/Gd0u1yhwWuJsh0cpCoVJLAlllqcrQFB7pMprn6kfuIX1Ck7K
X-Received: by 2002:a05:6102:290d:b0:4a4:7928:637a with SMTP id ada2fe7eead31-4aae13500e7mr11016752137.3.1731330963816;
        Mon, 11 Nov 2024 05:16:03 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1731330963; cv=none;
        d=google.com; s=arc-20240605;
        b=dWLbVI7L1ynFgZawKN5ERUIYHd2d/sG6Cr14Iz3RQMhdaPdsIXpLpNljkMINccbfeP
         8io+p/LGJvx6rYgT3InaOkwyO52QWiFtheyUnAdA4Q+LMyGypOz/Qx5eW18I15056Xh7
         7x5felP1/X0sCN1f7utq6LmoN063GWszEi+O7SCXCNmAMJO9RO9p6FU42QvSmt3OHgjF
         ofHXXsaAqvll99YOaOQP7FOxFeGKMF4KIM7mfhjKerVDju7BxdWjlMMCku7sYlSsQCTP
         uaorvcujlq485mJDhYfSyIF6ztxN7Bs3wY/qCteeghsCo86X+4gKGZIxpD7/CWdyBuca
         uuuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=YOtFwL/0XdPPVFLoKcXj8TJt12Yj2gaaOx7wuBxhDOY=;
        fh=1HQ4BGX462Y3UnwO1W4F0BQvJ38usJq/vvC676RK8yg=;
        b=OHPI5WSRrI4Lh/9Yd8P8rAgOHhf/3tlFbxSFVK1HJHQjRGSm60FCaMH9GLQil3zeGG
         rgeKfcUxgU1bR0W9hGTeimLhdUqnwU7zldjL2HdgHyR/VcrCkwjeNF2QKDJedO1IqmHc
         naOCi9tC6sZR57xZn22zuLS598bMcVbwPj9GUjwB48LwZOeKBoeDVDWNqWmNhRWNHkWX
         Wq+yuxw9xVj7jFpyoCNsqRE+ueQK59uI2sht8wodsLD9mFwro0e31GRGWd9RLlxa7Gfx
         n5MDl98uvk9dH30m7qkqGi8Bs4urhKvqKHWZ/5Qnd71D4NZWFV0hThPCaWPsT2Y4e1/r
         exiw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@philjordan-eu.20230601.gappssmtp.com header.s=20230601 header.b=1Mqb7nPE;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ada2fe7eead31-4aa97d35129si2225309137.99.2024.11.11.05.16.03
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 11 Nov 2024 05:16:03 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@philjordan-eu.20230601.gappssmtp.com header.s=20230601 header.b=1Mqb7nPE;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tAUGp-0001s2-2F; Mon, 11 Nov 2024 08:15:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <phil@philjordan.eu>)
 id 1tAUGZ-0001o3-Ih
 for qemu-arm@nongnu.org; Mon, 11 Nov 2024 08:15:42 -0500
Received: from mail-ot1-x32a.google.com ([2607:f8b0:4864:20::32a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <phil@philjordan.eu>)
 id 1tAUGW-0008DA-2U
 for qemu-arm@nongnu.org; Mon, 11 Nov 2024 08:15:39 -0500
Received: by mail-ot1-x32a.google.com with SMTP id
 46e09a7af769-71809fe188cso2260620a34.0
 for <qemu-arm@nongnu.org>; Mon, 11 Nov 2024 05:15:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=philjordan-eu.20230601.gappssmtp.com; s=20230601; t=1731330934; x=1731935734;
 darn=nongnu.org; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=YOtFwL/0XdPPVFLoKcXj8TJt12Yj2gaaOx7wuBxhDOY=;
 b=1Mqb7nPEJtlp2QzkknsB/inyf8B+zrPpVIsgU0QsYvlSDqkplnrX1u4RkQr/ia1+XI
 rzacj9/IMmPtw3dDl/Yax9vlNUtPYtP8BFEBzoD0v1dHecOl1sP7tdDsGkgU/zzzWkuS
 I+5mb2fX4NJVLXVrdlli5RBh7oMT3KFkkdKw0HdaNi7ie2vjlToy5lxVN61Sul2K8vkv
 lo5z2ytGAphrJ6TKlv+55NHtUsJ0vlJlx6ZT6VRHSOzDPeY+LP4DBEjLY5mbbwCDnfyR
 9zlccSVA/yIFO0vzF1naCcDWHnaHQZp3d5nKsqd7X7ZJc7QaYp5kuCVQ21WFPynuG6m1
 zXIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1731330934; x=1731935734;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=YOtFwL/0XdPPVFLoKcXj8TJt12Yj2gaaOx7wuBxhDOY=;
 b=E2yyk7katiDoe8E4a4Q2O4fKdV31mdFO2zNsRTL3kBXYx02h8i5HDFREfdCSSHGbWi
 qL4Enl4holoaabiAG+bDgFC/PosUDXw+1oQPRcV5HM/4fBSCzp50KarWWxhao0DRlwoR
 nR2I3pmEKAJArqTFMxVhCbhGeyPR1R+spqH9yQ4tPXCvPDceu+grHTGcJOBe8HlmVH5x
 5CDOpJuFKpuqwX86x2RcU/40y10eCpvb0K7kS4kKwCm+WvWWnUuixNm7IIWTM4LVXgpA
 w9EAAiBAFIpSMBhUFqbTBFQdzf8iLHHu9cdYoyMmrepYgvYA/g0L9MxZ8dieQKBTQzSi
 qGVA==
X-Forwarded-Encrypted: i=1;
 AJvYcCU4MgplXEDFMyd5jXSqzIsNRvOCPTP3u/VsPPAW+Q5n9QbGTHnK5xnJA5w2ouC+YnzMbKfAp/j+rw==@nongnu.org
X-Gm-Message-State: AOJu0Yw67xSGHpfmYkkdf9oF1VdPtN+SWv88hxZU8bEJFA0zORX6OTh5
 xc8oRQm4iBdy/yVIjAPJaZse2z78uI2Aw/Oq1Xf3CaGHnVuDdyo0v1KjFzTKcdTA9IppXy1Iv+R
 0/tD9x9/kQEr2zyWCpnKWAOHaT7UHv9W3xAwF
X-Received: by 2002:a05:6358:e9cd:b0:1bc:4589:cfcf with SMTP id
 e5c5f4694b2df-1c641ea733fmr455052355d.6.1731330933946; Mon, 11 Nov 2024
 05:15:33 -0800 (PST)
MIME-Version: 1.0
References: <20241108144709.95498-1-phil@philjordan.eu>
 <20241108144709.95498-2-phil@philjordan.eu>
 <9c2e0b96-2125-4041-9f66-116d54accb04@daynix.com>
 <CAAibmn3NbtOEwWLQFOo_UmAGTehOj+dDP04A=-JGMZVK9AYMDw@mail.gmail.com>
 <ZzHJgAbBJZYrSt84@redhat.com>
 <CAAibmn2+pT_kpcdHd26KsFggRNRR3yPep11fToOK=GZ9AEDHpw@mail.gmail.com>
 <e08017b1-5b38-f482-5534-cea4dcc0f000@eik.bme.hu>
In-Reply-To: <e08017b1-5b38-f482-5534-cea4dcc0f000@eik.bme.hu>
From: Phil Dennis-Jordan <phil@philjordan.eu>
Date: Mon, 11 Nov 2024 14:15:22 +0100
Message-ID: <CAAibmn2MPxgB+HQPMz_U=1LEeg8GzQEovKzoLe-gYRYv9EX89A@mail.gmail.com>
Subject: Re: [PATCH v8 01/15] ui & main loop: Redesign of system-specific main
 thread event handling
To: BALATON Zoltan <balaton@eik.bme.hu>
Cc: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
 Akihiko Odaki <akihiko.odaki@daynix.com>, qemu-devel@nongnu.org,
 agraf@csgraf.de, 
 peter.maydell@linaro.org, pbonzini@redhat.com, rad@semihalf.com, 
 quic_llindhol@quicinc.com, stefanha@redhat.com, mst@redhat.com, 
 slp@redhat.com, richard.henderson@linaro.org, eduardo@habkost.net, 
 marcel.apfelbaum@gmail.com, gaosong@loongson.cn, jiaxun.yang@flygoat.com, 
 chenhuacai@kernel.org, kwolf@redhat.com, hreitz@redhat.com, philmd@linaro.org, 
 shorne@gmail.com, palmer@dabbelt.com, alistair.francis@wdc.com, 
 bmeng.cn@gmail.com, liwei1518@gmail.com, dbarboza@ventanamicro.com, 
 zhiwei_liu@linux.alibaba.com, jcmvbkbc@gmail.com, marcandre.lureau@redhat.com, 
 qemu-arm@nongnu.org, qemu-block@nongnu.org, qemu-riscv@nongnu.org
Content-Type: multipart/alternative; boundary="0000000000004e9c7b0626a2e5be"
Received-SPF: neutral client-ip=2607:f8b0:4864:20::32a;
 envelope-from=phil@philjordan.eu; helo=mail-ot1-x32a.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_NEUTRAL=0.779 autolearn=no autolearn_force=no
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
X-TUID: AngcmA/C6r7m

--0000000000004e9c7b0626a2e5be
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 11 Nov 2024 at 13:41, BALATON Zoltan <balaton@eik.bme.hu> wrote:

> On Mon, 11 Nov 2024, Phil Dennis-Jordan wrote:
> > On Mon, 11 Nov 2024 at 10:08, Daniel P. Berrang=C3=A9 <berrange@redhat.=
com>
> > wrote:
> >
> >> On Sun, Nov 10, 2024 at 08:08:16AM +0100, Phil Dennis-Jordan wrote:
> >>> On Sun 10. Nov 2024 at 08:01, Akihiko Odaki <akihiko.odaki@daynix.com=
>
> >>> wrote:
> >>>
> >>>> On 2024/11/08 23:46, Phil Dennis-Jordan wrote:
> >>>>> macOS's Cocoa event handling must be done on the initial (main)
> >> thread
> >>>>> of the process. Furthermore, if library or application code uses
> >>>>> libdispatch, the main dispatch queue must be handling events on the
> >> main
> >>>>> thread as well.
> >>>>>
> >>>>> So far, this has affected Qemu in both the Cocoa and SDL UIs,
> >> although
> >>>>> in different ways: the Cocoa UI replaces the default qemu_main
> >> function
> >>>>> with one that spins Qemu's internal main event loop off onto a
> >>>>> background thread. SDL (which uses Cocoa internally) on the other
> >> hand
> >>>>> uses a polling approach within Qemu's main event loop. Events are
> >>>>> polled during the SDL UI's dpy_refresh callback, which happens to r=
un
> >>>>> on the main thread by default.
> >>>>
> >>>> GTK should also do the same as SDL and requires treatment; I forgot =
to
> >>>> note that in previous reviews.
> >>>
> >>>
> >>> Although it=E2=80=98s possible to build Qemu with GTK support enabled=
 on macOS,
> >>> that UI doesn=E2=80=99t actually work on macOS at all, and apparently=
 hasn=E2=80=99t
> been
> >>> supported since 2018, see:
> >>> https://stackoverflow.com/a/51474795
> >>>
> >>> I don=E2=80=99t think there=E2=80=99s any point making adjustments to=
 the GTK code by
> >>> guessing what might be needed if someone did fix that to work with
> macOS
> >> at
> >>> some point.
> >>
> >> If we don't support GTK on macOS, then we should update meson.build
> >> to actively prevent users enabling GTK on macOS builds, rather than
> >> letting them suffer random runtime crashes.
> >>
> >>
> > Agreed - I'm now more confused than ever though because
> > https://gitlab.com/qemu-project/qemu/-/issues/2539 sort of implies that
> > Philippe has previously been using it successfully. Or perhaps this was
> > created in response to
> https://gitlab.com/qemu-project/qemu/-/issues/2515 ?
> > But it seems like even the SDL implementation isn't perfect:
> > https://gitlab.com/qemu-project/qemu/-/issues/2537
> >
> > Basically, it seems like Qemu's UI threading on macOS is currently a bi=
t
> of
> > a mess, except in the Cocoa UI.
>
> Maybe it worked with older MacOS X releases but broke around the same tim=
e
> when commit 5588840ff77800 was needed to fix the cocoa UI? Maybe gtk need=
s
> a similar fix or whatever cocoa was changed to use since somewhere in gtk
> or QEMU?
>

Possible! Calling the Cocoa UI APIs from anything other than the main
thread has never officially been supported as far as I'm aware, but perhaps
some subset silently worked on earlier releases. Modern versions definitely
enforce the rule to some extent.

Also I find it strange to require UI backends to NULL init a global. If
> the cocoa UI is the only one that needs it could that also set it instead
> of doing it in /system? That would also confine macOS specific code to
> cocoa.m and the other UIs would not need any change that way.
>

Well, that's the whole point, it's not just the Cocoa UI - other macOS
system frameworks also need a runloop or libdispatch to be handling events
on thread 0. Relevant here are the ParavirtualizedGraphics.framework that's
integrated with patches 2-4 from this patch set, as well as the
Metal.framework, which PVG uses internally, and which we need to use
directly to some extent to complete the generated guest frames. These
frameworks internally use libdispatch, and they just don't work if nothing
is processing events on the main dispatch queue/runloop. So without patch
01/16, PV graphics will only work in conjunction with Cocoa or SDL, because
those do process the runloop on the main thread. But if you were to run
with -nographic, or VNC/SPICE-only, Mac PV graphics just wouldn't work. So
the idea is to uncouple the main thread's runloop from the Cocoa UI.

An then, the GTK+ and SDL libraries themselves call down into Cocoa on
macOS. Windows also has specific rules about its Win32 UI API and
threading. SDL says outright that everything needs to be done from the main
thread. GTK+ says everything needs to be called from a single thread on
Win32; it seems like the rule on macOS is the same, except that thread must
be thread 0. Both those UIs in Qemu seem to violate the threading rules of
the libraries they integrate, as evidenced by the bug reports listed above.
This brokenness is entirely independent of this patch set here, it's just
that we're bumping up against the same underlying issue of needing runloop
handling on thread 0 in macOS.

With regard to NULL'ing the qemu_main function pointer from the SDL or GTK
UIs in Qemu: I had implemented a different approach to solving the problem
in v4, where each UI declared up-front what kind of threading arrangement
it needed rather than each one just overwriting a global variable. This was
somewhat more complex than the current one though.
https://patchew.org/QEMU/20241024102813.9855-1-phil@philjordan.eu/202410241=
02813.9855-2-phil@philjordan.eu/

Ultimately, it seems like someone needs to take a look at the SDL and GTK
integrations in Qemu and rework them in a way that doesn't violate the SDL
and GTK+ libraries' own threading rules. Once we've figured out what
requirements fall out of that, we can tidy up the qemu_main arrangement.

But that's an undertaking that's out of scope for this patch - I see the
current patch as a step towards a global solution to the problem.
Definitely not the last word on the matter, but at least starting to get
away from the situation where each UI does whatever it wants with zero
regard for the rest of the code base.

--0000000000004e9c7b0626a2e5be
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Mon, 11 Nov 2024 at 13:41, BALATON=
 Zoltan &lt;<a href=3D"mailto:balaton@eik.bme.hu">balaton@eik.bme.hu</a>&gt=
; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px=
 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">On Mon,=
 11 Nov 2024, Phil Dennis-Jordan wrote:<br>
&gt; On Mon, 11 Nov 2024 at 10:08, Daniel P. Berrang=C3=A9 &lt;<a href=3D"m=
ailto:berrange@redhat.com" target=3D"_blank">berrange@redhat.com</a>&gt;<br=
>
&gt; wrote:<br>
&gt;<br>
&gt;&gt; On Sun, Nov 10, 2024 at 08:08:16AM +0100, Phil Dennis-Jordan wrote=
:<br>
&gt;&gt;&gt; On Sun 10. Nov 2024 at 08:01, Akihiko Odaki &lt;<a href=3D"mai=
lto:akihiko.odaki@daynix.com" target=3D"_blank">akihiko.odaki@daynix.com</a=
>&gt;<br>
&gt;&gt;&gt; wrote:<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt; On 2024/11/08 23:46, Phil Dennis-Jordan wrote:<br>
&gt;&gt;&gt;&gt;&gt; macOS&#39;s Cocoa event handling must be done on the i=
nitial (main)<br>
&gt;&gt; thread<br>
&gt;&gt;&gt;&gt;&gt; of the process. Furthermore, if library or application=
 code uses<br>
&gt;&gt;&gt;&gt;&gt; libdispatch, the main dispatch queue must be handling =
events on the<br>
&gt;&gt; main<br>
&gt;&gt;&gt;&gt;&gt; thread as well.<br>
&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt; So far, this has affected Qemu in both the Cocoa and S=
DL UIs,<br>
&gt;&gt; although<br>
&gt;&gt;&gt;&gt;&gt; in different ways: the Cocoa UI replaces the default q=
emu_main<br>
&gt;&gt; function<br>
&gt;&gt;&gt;&gt;&gt; with one that spins Qemu&#39;s internal main event loo=
p off onto a<br>
&gt;&gt;&gt;&gt;&gt; background thread. SDL (which uses Cocoa internally) o=
n the other<br>
&gt;&gt; hand<br>
&gt;&gt;&gt;&gt;&gt; uses a polling approach within Qemu&#39;s main event l=
oop. Events are<br>
&gt;&gt;&gt;&gt;&gt; polled during the SDL UI&#39;s dpy_refresh callback, w=
hich happens to run<br>
&gt;&gt;&gt;&gt;&gt; on the main thread by default.<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt; GTK should also do the same as SDL and requires treatment;=
 I forgot to<br>
&gt;&gt;&gt;&gt; note that in previous reviews.<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; Although it=E2=80=98s possible to build Qemu with GTK support =
enabled on macOS,<br>
&gt;&gt;&gt; that UI doesn=E2=80=99t actually work on macOS at all, and app=
arently hasn=E2=80=99t been<br>
&gt;&gt;&gt; supported since 2018, see:<br>
&gt;&gt;&gt; <a href=3D"https://stackoverflow.com/a/51474795" rel=3D"norefe=
rrer" target=3D"_blank">https://stackoverflow.com/a/51474795</a><br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; I don=E2=80=99t think there=E2=80=99s any point making adjustm=
ents to the GTK code by<br>
&gt;&gt;&gt; guessing what might be needed if someone did fix that to work =
with macOS<br>
&gt;&gt; at<br>
&gt;&gt;&gt; some point.<br>
&gt;&gt;<br>
&gt;&gt; If we don&#39;t support GTK on macOS, then we should update meson.=
build<br>
&gt;&gt; to actively prevent users enabling GTK on macOS builds, rather tha=
n<br>
&gt;&gt; letting them suffer random runtime crashes.<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt; Agreed - I&#39;m now more confused than ever though because<br>
&gt; <a href=3D"https://gitlab.com/qemu-project/qemu/-/issues/2539" rel=3D"=
noreferrer" target=3D"_blank">https://gitlab.com/qemu-project/qemu/-/issues=
/2539</a> sort of implies that<br>
&gt; Philippe has previously been using it successfully. Or perhaps this wa=
s<br>
&gt; created in response to <a href=3D"https://gitlab.com/qemu-project/qemu=
/-/issues/2515" rel=3D"noreferrer" target=3D"_blank">https://gitlab.com/qem=
u-project/qemu/-/issues/2515</a> ?<br>
&gt; But it seems like even the SDL implementation isn&#39;t perfect:<br>
&gt; <a href=3D"https://gitlab.com/qemu-project/qemu/-/issues/2537" rel=3D"=
noreferrer" target=3D"_blank">https://gitlab.com/qemu-project/qemu/-/issues=
/2537</a><br>
&gt;<br>
&gt; Basically, it seems like Qemu&#39;s UI threading on macOS is currently=
 a bit of<br>
&gt; a mess, except in the Cocoa UI.<br>
<br>
Maybe it worked with older MacOS X releases but broke around the same time =
<br>
when commit 5588840ff77800 was needed to fix the cocoa UI? Maybe gtk needs =
<br>
a similar fix or whatever cocoa was changed to use since somewhere in gtk <=
br>
or QEMU?<br></blockquote><div><br></div><div>Possible! Calling the Cocoa UI=
 APIs from anything other than the main thread has never officially been su=
pported as far as I&#39;m aware, but perhaps some subset silently worked on=
 earlier releases. Modern versions definitely enforce the rule to some exte=
nt.<br></div><div><br></div><blockquote class=3D"gmail_quote" style=3D"marg=
in:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1e=
x">
Also I find it strange to require UI backends to NULL init a global. If <br=
>
the cocoa UI is the only one that needs it could that also set it instead <=
br>
of doing it in /system? That would also confine macOS specific code to <br>
cocoa.m and the other UIs would not need any change that way.<br>
</blockquote><div><br></div><div>Well, that&#39;s the whole point, it&#39;s=
 not just the Cocoa UI - other macOS system frameworks also need a runloop =
or libdispatch to be handling events on thread 0. Relevant here are the Par=
avirtualizedGraphics.framework  that&#39;s integrated with patches 2-4 from=
 this patch set, as well as the Metal.framework, which PVG uses internally,=
 and which we need to use directly to some extent to complete the generated=
 guest frames. These frameworks internally use libdispatch, and they just d=
on&#39;t work if nothing is processing events on the main dispatch queue/ru=
nloop. So without patch 01/16, PV graphics will only work in conjunction wi=
th Cocoa or SDL, because those do process the runloop on the main thread. B=
ut if you were to run with -nographic, or VNC/SPICE-only, Mac PV graphics j=
ust wouldn&#39;t work. So the idea is to uncouple the main thread&#39;s run=
loop from the Cocoa UI.<br></div><div><br></div><div>An then, the GTK+ and =
SDL libraries themselves call down into Cocoa on macOS. Windows also has sp=
ecific rules about its Win32 UI API and threading. SDL says outright that e=
verything needs to be done from the main thread. GTK+ says everything needs=
 to be called from a single thread on Win32; it seems like the rule on macO=
S is the same, except that thread must be thread 0. Both those UIs in Qemu =
seem to violate the threading rules of the libraries they integrate, as evi=
denced by the bug reports listed above. This brokenness is entirely indepen=
dent of this patch set here, it&#39;s just that we&#39;re bumping up agains=
t the same underlying issue of needing runloop handling on thread 0 in macO=
S.</div><div><br></div><div><div>With regard to NULL&#39;ing the qemu_main =
function pointer from the SDL or GTK UIs in Qemu: I had implemented a diffe=
rent approach to solving the problem in v4, where each UI declared up-front=
 what kind of threading arrangement it needed rather than each one just ove=
rwriting a global variable. This was somewhat more complex than the current=
 one though. <a href=3D"https://patchew.org/QEMU/20241024102813.9855-1-phil=
@philjordan.eu/20241024102813.9855-2-phil@philjordan.eu/">https://patchew.o=
rg/QEMU/20241024102813.9855-1-phil@philjordan.eu/20241024102813.9855-2-phil=
@philjordan.eu/</a></div></div><div><br></div><div>Ultimately, it seems lik=
e someone needs to take a look at the SDL and GTK integrations in Qemu and =
rework them in a way that doesn&#39;t violate the SDL and GTK+ libraries&#3=
9; own threading rules. Once we&#39;ve figured out what  requirements fall =
out of that, we can tidy up the qemu_main arrangement.</div><div><br></div>=
<div>But that&#39;s an undertaking that&#39;s out of scope for this patch -=
 I see the current patch as a step towards a global solution to the problem=
. Definitely not the last word on the matter, but at least starting to get =
away from the situation where each UI does whatever it wants with zero rega=
rd for the rest of the code base.</div><div><br></div><div><br></div><div><=
br></div></div></div>

--0000000000004e9c7b0626a2e5be--
