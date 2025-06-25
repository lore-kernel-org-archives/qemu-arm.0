Received: by 2002:a05:7301:4085:b0:178:84eb:402c with SMTP id pt5csp1015893dyb;
        Wed, 25 Jun 2025 10:35:43 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWMu6xjZCOdWrUG8DMaGxBc45p/qcMR9Qj8lLf49W+w4Nuymgzhapuv0jPA2yWmZa20ICRNk2U1WaBsIw==@linaro.org
X-Google-Smtp-Source: AGHT+IFsQywwo22rNuuVqeRL22TrYsLf/YEtcaT2NVnGzLTTpcGHt6ZA0qBwlSq91oIb7qaHDJGH
X-Received: by 2002:a05:6102:4a81:b0:4e9:b0d4:1133 with SMTP id ada2fe7eead31-4ecc7671bbbmr3122463137.20.1750872943453;
        Wed, 25 Jun 2025 10:35:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1750872943; cv=none;
        d=google.com; s=arc-20240605;
        b=Ge6cC35qJRqgwTfwfOzY83MnFxFwhrfRHLShkPt3AHXiwEyNFfY1nfyMp53TBNZ5a+
         T6hQoCYqt17JUIrYxA+EJ1yhYvzrAjNz4qVb14jHp3eK7GYJqOFMVjUsMhjRnPqCVVgy
         QDm04AnJ22AA59u6kNV3P4izqlEShjC59OCqcQLVSXkZvE9Ru0EzH8PQ+tW43A4H4pnZ
         H9OWwkPZNY3vDFrrZMaQK9UEtQblUqfduQca24lYxATPweGeknSciT8+DUIqg8jf72ng
         GhTmLxtmM9Z5qNBjJU7Ob7VEPILXLUx2oUmdJAyYp9TDOEeh7WuqwbaAjmUauTi+Us0n
         9K0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=00DB+SSRdwHKOyusU4cMMbYpeqAuVYJIoyFzCQOSb6w=;
        fh=hTUJC5YgHRaRO+DdmJoRA94enms0+tUlH0OLBxW1SdY=;
        b=UKC1LKjg184sBO99J4RgFccfWtHeHRz3OWfhdiwbH7TE6w7TFe35XOXogQ+60mBvHp
         tVwwTR9swNHydyrQXK9l6XtgHgLZOhBIe9nFxoYhECtRC/QeEoQbBQ7vvjyMZQeRrtzU
         5KjIHfingdCazK3W1/SH+tq8fscxD0XUofG2wq56MRaNkcfUhXmeEXGcCc7pP2tPBrK5
         SqC1bMSA3hD3d5V5FtM4tf8g4beHu2WvgUb9EhJKO3apWo5bBOgrUBJfMPC4u/CQRoA3
         U4cQnmOs8LhxvRnnuvL9Reg3ASedva3eb1n8EZYRFXwY4oXC40txgolqU77MsqAIaylP
         R//Q==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=TspfQV++;
       spf=pass (google.com: domain of jsnow@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=jsnow@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Return-Path: <jsnow@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id a1e0cc1a2514c-8811aea575asi2187260241.166.2025.06.25.10.35.43
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jun 2025 10:35:43 -0700 (PDT)
Received-SPF: pass (google.com: domain of jsnow@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=TspfQV++;
       spf=pass (google.com: domain of jsnow@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=jsnow@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1750872943;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=00DB+SSRdwHKOyusU4cMMbYpeqAuVYJIoyFzCQOSb6w=;
	b=TspfQV++OJh8td4fCtpwpXhiLO98z68HB6KW0jaLbnn2NKoYkMqcapTOTNqN4cWMrsxDm8
	yIWnew01t15eVoNqWukhlaOOFuT8U58I0LdTF5zRUK07lvaBICc9LuOwZfa16P7/U8uCOq
	4h+pwZfsKBvu9Rj7omXS1cH6YK6x/gM=
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com
 [209.85.214.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-387-Q9LAe2E-PV6IYfuV5-5PDg-1; Wed, 25 Jun 2025 13:35:41 -0400
X-MC-Unique: Q9LAe2E-PV6IYfuV5-5PDg-1
X-Mimecast-MFC-AGG-ID: Q9LAe2E-PV6IYfuV5-5PDg_1750872940
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-23824a9bc29so1853695ad.3
        for <alex.bennee@linaro.org>; Wed, 25 Jun 2025 10:35:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750872940; x=1751477740;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=00DB+SSRdwHKOyusU4cMMbYpeqAuVYJIoyFzCQOSb6w=;
        b=Q3/TFWzV2B6tYprlCEfav66iZ51l19YW2TiTbYaU4chzC0270JWIj5JofKdXzIIbex
         hQf16YBELPcAewyEXm/UxvFfp/rExdOxT/FkzcZ9mmuRDM9T3pUqF5RzFDyLkPR/3bTV
         xEx40vwpd9cDK9OXSuI3AlGn0KTwbzArqEnhLBN0NYGILNLZ0bDgLfjOgYDFSFNXfnDg
         RwV+czUW5l+rBXW9D9u0o2cepkT+aQWPHB1SPZKi6m2l64ZQB/YDVBFxbMd4aSjoIyq7
         YfZ4oWwVdv6WpE+iArAA56QDQ2Tf9PI0tMx+dAQtmyOATQjB0HkzaYjU25KuXysURHSQ
         RfwA==
X-Forwarded-Encrypted: i=1; AJvYcCXTRPznScnLHp9D1ZbcY9+WguMBQrGgXoPaJO4PbP9sh5W17xUm+606WBzVQinpz7NS+/oHLTxwa0q0gw==@linaro.org
X-Gm-Message-State: AOJu0Yyk0gyeFJVIlBlxokQskyHuvUng6qjwvfxHS7Jg1k82evR1PW+l
	zSKgzdpmmqYssjO5A9Uh3+UIoD4EelwqN7ewmzX4GVxaturwRRJQTHXtfCtpJA4UjZZgGSr+zU6
	8M6fzTt4f/b3p7aHOqP+Wb7IsCRpO1U1/9xxxHQJxlPqic7AwF++egRfwxStMp+XrxQkkLZQUeZ
	0H3Vm06RITPmJHXo9jg3mvQ26cNWaWcYs8
X-Gm-Gg: ASbGncsf3E52fUtoCOYqa9JmKJE4G1AhXKL7AKiN9tsWdKovcC2bTgk0R0o0JFTqErC
	ACETswsoPndbhFapyZCMnwqotp2KB4qDjeG+kwdBOyvQa3a9F5knEeXauxNI3RsHI/oj6azQUiN
	Y0LyynVfZp2mhlSIUP2gCUlKSuW4iupW3mvkQ=
X-Received: by 2002:a17:903:4b0c:b0:234:b44c:d3c8 with SMTP id d9443c01a7336-2382407271emr60408035ad.37.1750872940118;
        Wed, 25 Jun 2025 10:35:40 -0700 (PDT)
X-Received: by 2002:a17:903:4b0c:b0:234:b44c:d3c8 with SMTP id
 d9443c01a7336-2382407271emr60407225ad.37.1750872939601; Wed, 25 Jun 2025
 10:35:39 -0700 (PDT)
MIME-Version: 1.0
References: <20250612205451.1177751-1-jsnow@redhat.com> <20250612205451.1177751-7-jsnow@redhat.com>
 <87cyatmw40.fsf@pond.sub.org>
In-Reply-To: <87cyatmw40.fsf@pond.sub.org>
From: John Snow <jsnow@redhat.com>
Date: Wed, 25 Jun 2025 13:35:24 -0400
X-Gm-Features: AX0GCFu24gcy7gu7f1D_mcQaqWYN_lmZubp5dC6zB91-XnM9SnsHagHu3mq7Xgg
Message-ID: <CAFn=p-YPN6MWZiETi7XWkyYVPpe7uew49CwjEdAsMmW=ZPOx5A@mail.gmail.com>
Subject: Re: [PATCH v2 06/12] python: upgrade to python3.9+ syntax
To: Markus Armbruster <armbru@redhat.com>
Cc: qemu-devel@nongnu.org, Joel Stanley <joel@jms.id.au>, Yi Liu <yi.l.liu@intel.com>, 
	=?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
	Helge Deller <deller@gmx.de>, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, 
	Andrew Jeffery <andrew@codeconstruct.com.au>, Fabiano Rosas <farosas@suse.de>, 
	Alexander Bulekov <alxndr@bu.edu>, Darren Kenny <darren.kenny@oracle.com>, 
	Leif Lindholm <leif.lindholm@oss.qualcomm.com>, =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>, 
	Ed Maste <emaste@freebsd.org>, Gerd Hoffmann <kraxel@redhat.com>, Warner Losh <imp@bsdimp.com>, 
	Kevin Wolf <kwolf@redhat.com>, Tyrone Ting <kfting@nuvoton.com>, Eric Blake <eblake@redhat.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Yoshinori Sato <ysato@users.sourceforge.jp>, 
	Troy Lee <leetroy@gmail.com>, Halil Pasic <pasic@linux.ibm.com>, 
	Akihiko Odaki <odaki@rsg.ci.i.u-tokyo.ac.jp>, Michael Roth <michael.roth@amd.com>, 
	Laurent Vivier <laurent@vivier.eu>, Ani Sinha <anisinha@redhat.com>, Weiwei Li <liwei1518@gmail.com>, 
	Eric Farman <farman@linux.ibm.com>, Steven Lee <steven_lee@aspeedtech.com>, 
	Brian Cain <brian.cain@oss.qualcomm.com>, Li-Wen Hsu <lwhsu@freebsd.org>, 
	Jamin Lin <jamin_lin@aspeedtech.com>, qemu-s390x@nongnu.org, 
	Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>, qemu-block@nongnu.org, 
	Bernhard Beschow <shentey@gmail.com>, 
	=?UTF-8?Q?Cl=C3=A9ment_Mathieu=2D=2DDrif?= <clement.mathieu--drif@eviden.com>, 
	Maksim Davydov <davydov-max@yandex-team.ru>, Niek Linnenbank <nieklinnenbank@gmail.com>, 
	=?UTF-8?Q?Herv=C3=A9_Poussineau?= <hpoussin@reactos.org>, 
	Christian Borntraeger <borntraeger@linux.ibm.com>, Paul Durrant <paul@xen.org>, 
	Manos Pitsidianakis <manos.pitsidianakis@linaro.org>, Jagannathan Raman <jag.raman@oracle.com>, 
	Igor Mitsyanko <i.mitsyanko@gmail.com>, Max Filippov <jcmvbkbc@gmail.com>, 
	Pierrick Bouvier <pierrick.bouvier@linaro.org>, "Michael S. Tsirkin" <mst@redhat.com>, 
	Anton Johansson <anjo@rev.ng>, Peter Maydell <peter.maydell@linaro.org>, Cleber Rosa <crosa@redhat.com>, 
	Eric Auger <eric.auger@redhat.com>, Yanan Wang <wangyanan55@huawei.com>, qemu-arm@nongnu.org, 
	Hao Wu <wuhaotsh@google.com>, Mads Ynddal <mads@ynddal.dk>, 
	Sriram Yagnaraman <sriram.yagnaraman@ericsson.com>, qemu-riscv@nongnu.org, 
	Paolo Bonzini <pbonzini@redhat.com>, Jason Wang <jasowang@redhat.com>, 
	Nicholas Piggin <npiggin@gmail.com>, Michael Rolnik <mrolnik@gmail.com>, Zhao Liu <zhao1.liu@intel.com>, 
	Alessandro Di Federico <ale@rev.ng>, Thomas Huth <thuth@redhat.com>, Antony Pavlov <antonynpavlov@gmail.com>, 
	Jiaxun Yang <jiaxun.yang@flygoat.com>, Hanna Reitz <hreitz@redhat.com>, 
	Ilya Leoshkevich <iii@linux.ibm.com>, Marcelo Tosatti <mtosatti@redhat.com>, 
	Nina Schoetterl-Glausch <nsg@linux.ibm.com>, Daniel Henrique Barboza <danielhb413@gmail.com>, 
	Qiuhao Li <Qiuhao.Li@outlook.com>, Hyman Huang <yong.huang@smartx.com>, 
	=?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
	Magnus Damm <magnus.damm@gmail.com>, qemu-rust@nongnu.org, Bandan Das <bsd@redhat.com>, 
	Strahinja Jankovic <strahinja.p.jankovic@gmail.com>, 
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, 
	=?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
	kvm@vger.kernel.org, Fam Zheng <fam@euphon.net>, Jia Liu <proljc@gmail.com>, 
	=?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>, 
	Alistair Francis <alistair@alistair23.me>, Subbaraya Sundeep <sundeep.lkml@gmail.com>, 
	Kyle Evans <kevans@freebsd.org>, Song Gao <gaosong@loongson.cn>, 
	Alexandre Iooss <erdnaxe@crans.org>, Aurelien Jarno <aurelien@aurel32.net>, 
	Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, Peter Xu <peterx@redhat.com>, 
	Stefan Hajnoczi <stefanha@redhat.com>, BALATON Zoltan <balaton@eik.bme.hu>, 
	Elena Ufimtseva <elena.ufimtseva@oracle.com>, "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, 
	=?UTF-8?B?RnLDqWTDqXJpYyBCYXJyYXQ=?= <fbarrat@linux.ibm.com>, 
	qemu-ppc@nongnu.org, Radoslaw Biernacki <rad@semihalf.com>, 
	Beniamino Galvani <b.galvani@gmail.com>, David Hildenbrand <david@redhat.com>, 
	Richard Henderson <richard.henderson@linaro.org>, David Woodhouse <dwmw2@infradead.org>, 
	Eduardo Habkost <eduardo@habkost.net>, Ahmed Karaman <ahmedkhaledkaraman@gmail.com>, 
	Huacai Chen <chenhuacai@kernel.org>, Mahmoud Mandour <ma.mandourr@gmail.com>, 
	Harsh Prateek Bora <harshpb@linux.ibm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: jSOFbRqmr-uo9R2SU8tW1-OC-v3jR46X_8QKMZDPNQA_1750872940
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="0000000000009cc6ee063868df67"
X-TUID: e4Ob26qeKCZz

--0000000000009cc6ee063868df67
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 24, 2025 at 3:34=E2=80=AFAM Markus Armbruster <armbru@redhat.co=
m> wrote:

> John Snow <jsnow@redhat.com> writes:
>
> > This patch is fully automated, using pymagic, isort and autoflake.
> >
> > Create a script named pymagic.sh:
> >
> > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D
> >
> > pyupgrade --exit-zero-even-if-changed --keep-percent-format \
> >           --py39-plus "$@"
> >
> > autoflake -i "$@"
> >
> > isort --settings-file python/setup.cfg \
> >       -p compat -p qapidoc_legacy -p iotests -o qemu "$@"
> > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D
> >
> > Then, from qemu.git root:
> >
> >> find . -type f -name '*.py' | xargs pymagic
> >> git grep --name-only "#!/usr/bin/env python" | xargs pymagic
> >
> > This changes a lot of old Pythonisms, but in particular it upgrades the
> > old Python type hint paradigm to the new 3.9+ paradigm wherein you no
> > longer need to import List, Dict, Tuple, Set, etc from the Typing modul=
e
> > and instead directly subscript the built-in types list, dict, tuple,
> > set, etc. The old-style annotations are deprecated as of 3.9 and are
> > eligible for removal starting in Python 3.14, though the exact date of
> > their removal is not yet known.
> >
> > pyupgrade updates the imports and type hint paradigms (as well as
> > updating other old 'isms, such as removing the unicode string
> > prefix). autoflake in turn then removes any unused import statements,
> > possibly left behind by pyupgrade. Lastly, isort fixes the import order
> > and formatting to the standard we use in qemu.git/python and
> > scripts/qapi in particular.
> >
> > Signed-off-by: John Snow <jsnow@redhat.com>
>
> [...]
>
> >  448 files changed, 1959 insertions(+), 1631 deletions(-)
>
> *=C3=84chz*
>

Gesundheit.


>
> I hate it when people ask me to split up my mechanical patches...
>
> One split is by subsystem / maintainer.  I've done this a few times, and
> it's quite a bother.  Questionable use of your time if you ask me.
>

I'd prefer not to unless it is requested of me specifically. I don't think
most maintainers really care about the nuances of Python and as long as
their stuff continues to work they're not going to mind much.

Or, to be frank: I don't think this series would ever garner enough review
and attention to warrant the labor it'd take to tailor it to such a review.
It's mechanical, it's boring, it should be fine.

I switched from a manual patch series to a tool-driven one specifically to
make it more mindless and less interesting, and going through and splitting
it back out is ... eh. I would prefer not to.


>
> There's another split here...  Your pymagic.sh runs three tools.  If you
> commit after each one, the patch splits into three.
>

I use all three because each one alone isn't sufficient to then pass the
static analysis checks, they each do a little bit of damage that another
tool corrects afterwards.

pyupgrade works to modernize syntax, but leaves impotent import statements
hanging.
autoflake removes those impotent imports.
isort fixes the import statement ordering and formatting to our standard.
(And then I do some manual fixups to fix the linting tests where things
were auto-formatted suboptimally.)

I can still split it out for review purposes, like I did here with some
manual fixups appended to the end.

Just, for merge, they'll be combined by necessity as a result of our
no-regressions-for-bisect rule.


>
> I understand you pass --py39-plus to pyupgrade to get the type hints
> modernized.  If you run it without --py39-plus for all the miscellaneous
> upgrades, commit, then run it with --py39-plus for just the type hint
> upgrades, commit, the last patch splits again.
>

I can try it! I actually didn't try running it without py39-plus at all, so
I don't know what that'll do. but no harm in an experiment.


>
> Thoughts?


First and foremost I just thought it'd be good to get this mechanical
change squared away in one giant patch so we could add this one singular
horrible mega-commit into the git blame "ignored commits" list to minimize
the impact of the "flag day".

This upgrade will have to happen "eventually" but it needn't be "right
now", but I figured it'd be good to get it out of the way... or put another
way, "better my mess than someone else's".

--js

--0000000000009cc6ee063868df67
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote g=
mail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, Jun 24,=
 2025 at 3:34=E2=80=AFAM Markus Armbruster &lt;<a href=3D"mailto:armbru@red=
hat.com">armbru@redhat.com</a>&gt; wrote:<br></div><blockquote class=3D"gma=
il_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,2=
04,204);padding-left:1ex">John Snow &lt;<a href=3D"mailto:jsnow@redhat.com"=
 target=3D"_blank">jsnow@redhat.com</a>&gt; writes:<br>
<br>
&gt; This patch is fully automated, using pymagic, isort and autoflake.<br>
&gt;<br>
&gt; Create a script named pymagic.sh:<br>
&gt;<br>
&gt; =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D<br>
&gt;<br>
&gt; pyupgrade --exit-zero-even-if-changed --keep-percent-format \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0--py39-plus &quot;$@&quot;<br>
&gt;<br>
&gt; autoflake -i &quot;$@&quot;<br>
&gt;<br>
&gt; isort --settings-file python/setup.cfg \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0-p compat -p qapidoc_legacy -p iotests -o qe=
mu &quot;$@&quot;<br>
&gt; =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D<br>
&gt;<br>
&gt; Then, from qemu.git root:<br>
&gt;<br>
&gt;&gt; find . -type f -name &#39;*.py&#39; | xargs pymagic<br>
&gt;&gt; git grep --name-only &quot;#!/usr/bin/env python&quot; | xargs pym=
agic<br>
&gt;<br>
&gt; This changes a lot of old Pythonisms, but in particular it upgrades th=
e<br>
&gt; old Python type hint paradigm to the new 3.9+ paradigm wherein you no<=
br>
&gt; longer need to import List, Dict, Tuple, Set, etc from the Typing modu=
le<br>
&gt; and instead directly subscript the built-in types list, dict, tuple,<b=
r>
&gt; set, etc. The old-style annotations are deprecated as of 3.9 and are<b=
r>
&gt; eligible for removal starting in Python 3.14, though the exact date of=
<br>
&gt; their removal is not yet known.<br>
&gt;<br>
&gt; pyupgrade updates the imports and type hint paradigms (as well as<br>
&gt; updating other old &#39;isms, such as removing the unicode string<br>
&gt; prefix). autoflake in turn then removes any unused import statements,<=
br>
&gt; possibly left behind by pyupgrade. Lastly, isort fixes the import orde=
r<br>
&gt; and formatting to the standard we use in qemu.git/python and<br>
&gt; scripts/qapi in particular.<br>
&gt;<br>
&gt; Signed-off-by: John Snow &lt;<a href=3D"mailto:jsnow@redhat.com" targe=
t=3D"_blank">jsnow@redhat.com</a>&gt;<br>
<br>
[...]<br>
<br>
&gt;=C2=A0 448 files changed, 1959 insertions(+), 1631 deletions(-)<br>
<br>
*=C3=84chz*<br></blockquote><div><br></div><div>Gesundheit.</div><div>=C2=
=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8e=
x;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
I hate it when people ask me to split up my mechanical patches...<br>
<br>
One split is by subsystem / maintainer.=C2=A0 I&#39;ve done this a few time=
s, and<br>
it&#39;s quite a bother.=C2=A0 Questionable use of your time if you ask me.=
<br></blockquote><div><br></div><div>I&#39;d prefer not to unless it is req=
uested of me specifically. I don&#39;t think most maintainers really care a=
bout the nuances of Python and as long as their stuff continues to work the=
y&#39;re not going to mind much.</div><div><br></div><div>Or, to be frank: =
I don&#39;t think this series would ever garner enough review and attention=
 to warrant the labor it&#39;d take to tailor it to such a review. It&#39;s=
 mechanical, it&#39;s boring, it should be fine.</div><div><br></div><div>I=
 switched from a manual patch series to a tool-driven one specifically to m=
ake it more mindless and less interesting, and going through and splitting =
it back out is ... eh. I would prefer not to.</div><div>=C2=A0</div><blockq=
uote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1p=
x solid rgb(204,204,204);padding-left:1ex">
<br>
There&#39;s another split here...=C2=A0 Your pymagic.sh runs three tools.=
=C2=A0 If you<br>
commit after each one, the patch splits into three.<br></blockquote><div><b=
r></div><div>I use all three because each one alone isn&#39;t sufficient to=
 then pass the static analysis checks, they each do a little bit of damage =
that another tool corrects afterwards.</div><div><br></div><div>pyupgrade w=
orks to modernize syntax, but leaves impotent import statements hanging.</d=
iv><div>autoflake removes those impotent imports.</div><div>isort fixes the=
 import statement ordering and formatting to our standard.</div><div>(And t=
hen I do some manual fixups to fix the linting tests where things were auto=
-formatted suboptimally.)</div><div><br></div><div>I can still split it out=
 for review purposes, like I did here with some manual fixups appended to t=
he end.</div><div><br></div><div>Just, for merge, they&#39;ll be combined b=
y necessity as a result of our no-regressions-for-bisect rule.</div><div>=
=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0=
.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
I understand you pass --py39-plus to pyupgrade to get the type hints<br>
modernized.=C2=A0 If you run it without --py39-plus for all the miscellaneo=
us<br>
upgrades, commit, then run it with --py39-plus for just the type hint<br>
upgrades, commit, the last patch splits again.<br></blockquote><div><br></d=
iv><div>I can try it! I actually didn&#39;t try running it without py39-plu=
s at all, so I don&#39;t know what that&#39;ll do. but no harm in an experi=
ment.</div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"marg=
in:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1e=
x">
<br>
Thoughts?</blockquote><div><br></div><div>First and foremost I just thought=
 it&#39;d be good to get this mechanical change squared away in one giant p=
atch so we could add this one singular horrible mega-commit into the git bl=
ame &quot;ignored commits&quot; list to minimize the impact of the &quot;fl=
ag day&quot;.</div><div><br></div><div>This upgrade will have to happen &qu=
ot;eventually&quot; but it needn&#39;t be &quot;right now&quot;, but I figu=
red it&#39;d be good to get it out of the way... or put another way, &quot;=
better my mess than someone else&#39;s&quot;.</div><div><br></div><div>--js=
</div></div></div>

--0000000000009cc6ee063868df67--
