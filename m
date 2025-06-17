Received: by 2002:a17:504:5d2c:b0:1be9:327d:8ee3 with SMTP id et12csp2609149njc;
        Tue, 17 Jun 2025 08:53:00 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXmO1TiEAP7Bl40puUkAZpPKd4KFrJ69suQw4B1YVzZw5lEUDQPMDF5AWST0S9WOrAW6e8XRI0KAysICw==@linaro.org
X-Google-Smtp-Source: AGHT+IFnXPxdOgBFUbW+tZymEDWnhiqZME3wI2mzaEcwwx7iNtsr2WQ6WPAgGHejPYghnyR9FbrF
X-Received: by 2002:ad4:5748:0:b0:6fa:c41e:cc70 with SMTP id 6a1803df08f44-6fb477955d9mr244712336d6.22.1750175580426;
        Tue, 17 Jun 2025 08:53:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1750175580; cv=none;
        d=google.com; s=arc-20240605;
        b=gFCxpRVp1XBN7gfgSnOw0xGUeA07xqzyAjLbBNnymKDMdbPazlHyh2fH0tEkBGk9Fl
         ZPB9NYH/Fjhhq5LIVq7bZjgp3dePMP11Bv0FdhuKl9VjFWKvbGC8rugE/8s4A7qzkSZl
         jpTBnx4mZVKr4LzP+rkBkXkPMKo7qdIsiKj0GXBSKEH4wRiAv4Jn36kXB6h/V4GVu1sc
         9t83ZlbVUT7qhNiHFazhVRILcizPP862lpsNTxkh1S45d12Uuu1rEvi7VDPBJHB3Fl9t
         9skZehx/yfCFl1UuDmvKgxR5t4ZeomXT+MWNRRgyU/74vIZkfXwiNcbLCTgqOCmhr+ND
         t9tw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=F4Gxdm+xcAbyZgNWf3Hg1JfGy7tAiBkLt6vETvm7wdo=;
        fh=p7nz51tqMsNVJXX/dIUFmPnYE0GYau4nIpUixwT4H9k=;
        b=QFetQU0giPU5U/i25kyiMpgQaqvuhqnO0sXY0r6CebN7J1xkxZpOqzbKsLtk/rMHo1
         xYE2jN5L9sngcmrCR2VneoFpENpJ+yM1whxk5uh/KiX3aI+0qOHHoimQsjk5LdFMKyYl
         IkFvnWCd4VP6zXeHhbetkmAUC7BoPvOX2Ue0ETeh4zBNHfRAYvedtfojqg5S4nVLo9SD
         F4LQGuuFwhhka7JGN2WWOIq8Sy+Z0QHW2c9o6U/+RwBDo4/Z/U0KCW0+lwDSeBEb8JTe
         zefk6tf24qBx64awxHNWZEGJSMj2/xzfWev3aT3L9pa/mrcKlt+/lLRHiVK2PwHmYRQd
         5eog==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Yg21N+A0;
       spf=pass (google.com: domain of jsnow@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=jsnow@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Return-Path: <jsnow@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id 6a1803df08f44-6fb52a32f06si61768396d6.69.2025.06.17.08.53.00
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Jun 2025 08:53:00 -0700 (PDT)
Received-SPF: pass (google.com: domain of jsnow@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Yg21N+A0;
       spf=pass (google.com: domain of jsnow@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=jsnow@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1750175580;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=F4Gxdm+xcAbyZgNWf3Hg1JfGy7tAiBkLt6vETvm7wdo=;
	b=Yg21N+A0P2m4BWwWpHpELLO5zNu6aPuEYn5RL+1zcrXiN/nYXTty2S6sfYoqvq0uuYoMAA
	9BgoaJrbwzmO4JZGCf5akqu1ZzAFRgB/ziqgHFW1VhJ74hebwv5l+ShNGnY5slf70kwGNr
	m/6NLDrCkUMPth9clqFWUzAqULv6Msw=
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com
 [209.85.215.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-635-HrfZQV-pOWezinuYsbSYew-1; Tue, 17 Jun 2025 11:52:56 -0400
X-MC-Unique: HrfZQV-pOWezinuYsbSYew-1
X-Mimecast-MFC-AGG-ID: HrfZQV-pOWezinuYsbSYew_1750175575
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-b00e4358a34so3673883a12.0
        for <alex.bennee@linaro.org>; Tue, 17 Jun 2025 08:52:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750175575; x=1750780375;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=F4Gxdm+xcAbyZgNWf3Hg1JfGy7tAiBkLt6vETvm7wdo=;
        b=ndEXFvnXNHfy7C9/v2Wx7zjimVW3s80CXAo07Fiu2mEFxMsqCrDiUmxmeaTF2qS0ag
         7Xtb/AeHJTsBb04h376BYTubjLfSl3YkkOdCJZPFGNepBQhXM7IWcIFIcR3R/88i4WFO
         4GQLCiRFlS2gihPYXib1jMPASWwt9qBT3dZdb7jzBfb4fzY+YwR8MuvF3kZoTdF0FodH
         C4mdZp212TISXuKMaiYJeMeHrvOJoSblDN6i4AENIOW8RnbzpIFX+LsuHBQhUX4M/fgf
         KUoWuFrHzQGQZcb7MaaDx8zNL+TjS3+Ycq821JAcA+osoJQ0bkJ7VG+dfqK/g77RIPpC
         Vmaw==
X-Forwarded-Encrypted: i=1; AJvYcCVZc8jeAK5zLVfM0aeS1VYGL8OPlhI7MofUjtVsZUYbJtpo/8zoUttRolbzVp7NTbi9Lwk+VJ9L0yMWJQ==@linaro.org
X-Gm-Message-State: AOJu0YzkyOWt8mID34i/HnaSgW82zwRNuXmuzIWxBo/Gtt53GXXEpy8/
	RzmQyJZj46laanvURGV3ZD19NwIEGN3QqtjCGx0Ds4VsUv6zYilC//WqcGAP1vz53IWOAq8DAdW
	ycIxHbMQQOsXIZmcqaepUt1Lj6Go2Z0NpJpLjiB/ePkJlXVIslqQjpnXexbuOwhnvJEb6ruMJS9
	z90nSDeT2oOT5j0W59EBobwmsrCQtUz9fj
X-Gm-Gg: ASbGncuPTyj++Gc2tiquZPDAaoD1IhXpvJ86YZG2eL+t3k8Vhl+U/HWJ7O8M7uNEI0u
	h6Q63F3HH+elDZoAO+77t/tBOkTOVDKZ4HTKB3SfW0aPqhvpAYRGlKoVWyCh4GjvY1yAJvUFnoz
	obJUCvRDSPAG/qBkluMe32lw8+RcLqUJ32kQ==
X-Received: by 2002:a17:90b:350c:b0:312:f0d0:bb0 with SMTP id 98e67ed59e1d1-313f1ca0fbfmr26514741a91.12.1750175574718;
        Tue, 17 Jun 2025 08:52:54 -0700 (PDT)
X-Received: by 2002:a17:90b:350c:b0:312:f0d0:bb0 with SMTP id
 98e67ed59e1d1-313f1ca0fbfmr26514626a91.12.1750175573986; Tue, 17 Jun 2025
 08:52:53 -0700 (PDT)
MIME-Version: 1.0
References: <20250612205451.1177751-1-jsnow@redhat.com> <20250612205451.1177751-7-jsnow@redhat.com>
 <9C057F25-8BE4-45FC-9332-99F24440DB92@ynddal.dk>
In-Reply-To: <9C057F25-8BE4-45FC-9332-99F24440DB92@ynddal.dk>
From: John Snow <jsnow@redhat.com>
Date: Tue, 17 Jun 2025 11:52:40 -0400
X-Gm-Features: AX0GCFsuUgDDRlS0rl88kz7AniydcsMDdrQ5XUJ9XCcVPUFVLTFv0N4Feru0eFA
Message-ID: <CAFn=p-ZMB61pN6swURytd_m7vJuXEW+HyuTmVcWzkME-XNMCqw@mail.gmail.com>
Subject: Re: [PATCH v2 06/12] python: upgrade to python3.9+ syntax
To: Mads Ynddal <mads@ynddal.dk>
Cc: qemu-devel <qemu-devel@nongnu.org>, Joel Stanley <joel@jms.id.au>, Yi Liu <yi.l.liu@intel.com>, 
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
	Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>, Qemu-block <qemu-block@nongnu.org>, 
	Bernhard Beschow <shentey@gmail.com>, 
	=?UTF-8?Q?Cl=C3=A9ment_Mathieu=2D=2DDrif?= <clement.mathieu--drif@eviden.com>, 
	Maksim Davydov <davydov-max@yandex-team.ru>, Niek Linnenbank <nieklinnenbank@gmail.com>, 
	=?UTF-8?Q?Herv=C3=A9_Poussineau?= <hpoussin@reactos.org>, 
	Christian Borntraeger <borntraeger@linux.ibm.com>, Paul Durrant <paul@xen.org>, 
	Manos Pitsidianakis <manos.pitsidianakis@linaro.org>, Jagannathan Raman <jag.raman@oracle.com>, 
	Igor Mitsyanko <i.mitsyanko@gmail.com>, Max Filippov <jcmvbkbc@gmail.com>, 
	Markus Armbruster <armbru@redhat.com>, Pierrick Bouvier <pierrick.bouvier@linaro.org>, 
	"Michael S. Tsirkin" <mst@redhat.com>, Anton Johansson <anjo@rev.ng>, Peter Maydell <peter.maydell@linaro.org>, 
	Cleber Rosa <crosa@redhat.com>, Eric Auger <eric.auger@redhat.com>, 
	Yanan Wang <wangyanan55@huawei.com>, qemu-arm <qemu-arm@nongnu.org>, 
	Hao Wu <wuhaotsh@google.com>, Sriram Yagnaraman <sriram.yagnaraman@ericsson.com>, 
	qemu-riscv@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>, 
	Jason Wang <jasowang@redhat.com>, Nicholas Piggin <npiggin@gmail.com>, 
	Michael Rolnik <mrolnik@gmail.com>, Zhao Liu <zhao1.liu@intel.com>, 
	Alessandro Di Federico <ale@rev.ng>, Thomas Huth <thuth@redhat.com>, Antony Pavlov <antonynpavlov@gmail.com>, 
	Jiaxun Yang <jiaxun.yang@flygoat.com>, Hanna Reitz <hreitz@redhat.com>, 
	Ilya Leoshkevich <iii@linux.ibm.com>, Marcelo Tosatti <mtosatti@redhat.com>, 
	Nina Schoetterl-Glausch <nsg@linux.ibm.com>, Daniel Henrique Barboza <danielhb413@gmail.com>, 
	Qiuhao Li <Qiuhao.Li@outlook.com>, Hyman Huang <yong.huang@smartx.com>, 
	=?UTF-8?B?IkRhbmllbCBQLiBCZXJyYW5nw6ki?= <berrange@redhat.com>, 
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
X-Mimecast-MFC-PROC-ID: i-hwVKb9uONLsXd7wMl3K_sFX0m56VONn8-FzNJ-x4A_1750175575
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="0000000000006200220637c68115"
X-TUID: YBKXw/KcEaGb

--0000000000006200220637c68115
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 17, 2025, 5:16=E2=80=AFAM Mads Ynddal <mads@ynddal.dk> wrote:

>
> > diff --git a/scripts/simpletrace.py b/scripts/simpletrace.py
> > index cef81b0707f..a013e4402de 100755
> > --- a/scripts/simpletrace.py
> > +++ b/scripts/simpletrace.py
> > @@ -9,13 +9,15 @@
> > #
> > # For help see docs/devel/tracing.rst
> >
> > -import sys
> > -import struct
> > import inspect
> > +import struct
> > +import sys
> > import warnings
> > -from tracetool import read_events, Event
> > +
> > +from tracetool import Event, read_events
> > from tracetool.backend.simple import is_string
> >
> > +
> > __all__ =3D ['Analyzer', 'Analyzer2', 'process', 'run']
> >
> > # This is the binary format that the QEMU "simple" trace backend
> > @@ -166,11 +168,9 @@ def runstate_set(self, timestamp, pid, new_state):
> >
> >     def begin(self):
> >         """Called at the start of the trace."""
> > -        pass
> >
> >     def catchall(self, event, rec):
> >         """Called if no specific method for processing a trace event ha=
s
> been found."""
> > -        pass
> >
> >     def _build_fn(self, event):
> >         fn =3D getattr(self, event.name, None)
> > @@ -208,7 +208,6 @@ def _process_event(self, rec_args, *, event,
> event_id, timestamp_ns, pid, **kwar
> >
> >     def end(self):
> >         """Called at the end of the trace."""
> > -        pass
> >
> >     def __enter__(self):
> >         self.begin()
> > @@ -263,7 +262,6 @@ def runstate_set(self, new_state, *, timestamp_ns,
> pid, **kwargs):
> >
> >     def catchall(self, *rec_args, event, timestamp_ns, pid, event_id,
> **kwargs):
> >         """Called if no specific method for processing a trace event ha=
s
> been found."""
> > -        pass
> >
> >     def _process_event(self, rec_args, *, event, **kwargs):
> >         fn =3D getattr(self, event.name, self.catchall)
> > @@ -279,7 +277,7 @@ def process(events, log, analyzer, read_header=3DTr=
ue):
> >     """
> >
> >     if isinstance(events, str):
> > -        with open(events, 'r') as f:
> > +        with open(events) as f:
> >             events_list =3D read_events(f, events)
> >     elif isinstance(events, list):
> >         # Treat as a list of events already produced by
> tracetool.read_events
> > @@ -332,7 +330,7 @@ def run(analyzer):
> >     except (AssertionError, ValueError):
> >         raise SimpleException(f'usage: {sys.argv[0]} [--no-header]
> <trace-events> <trace-file>\n')
> >
> > -    with open(trace_event_path, 'r') as events_fobj,
> open(trace_file_path, 'rb') as log_fobj:
> > +    with open(trace_event_path) as events_fobj, open(trace_file_path,
> 'rb') as log_fobj:
> >         process(events_fobj, log_fobj, analyzer, read_header=3Dnot
> no_header)
> >
> > if __name__ =3D=3D '__main__':
>
> I'm not really a fan of the implicit default arguments, but I guess the
> rest is fine. If this is the way everyone else wants to go, I won't stand
> in the way.
>

I can manually restore it. It just happens to be the style the upgrade tool
prefers which saves an awful lot of manual work, but I have no prejudice
against explicit open parameters.

Thanks for reviewing!


> =E2=80=94
> Mads Ynddal
>
>

--0000000000006200220637c68115
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote gmail_quote_contai=
ner"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, Jun 17, 2025, 5:16=E2=80=
=AFAM Mads Ynddal &lt;<a href=3D"mailto:mads@ynddal.dk">mads@ynddal.dk</a>&=
gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0=
 .8ex;border-left:1px #ccc solid;padding-left:1ex"><br>
&gt; diff --git a/scripts/simpletrace.py b/scripts/simpletrace.py<br>
&gt; index cef81b0707f..a013e4402de 100755<br>
&gt; --- a/scripts/simpletrace.py<br>
&gt; +++ b/scripts/simpletrace.py<br>
&gt; @@ -9,13 +9,15 @@<br>
&gt; #<br>
&gt; # For help see docs/devel/tracing.rst<br>
&gt; <br>
&gt; -import sys<br>
&gt; -import struct<br>
&gt; import inspect<br>
&gt; +import struct<br>
&gt; +import sys<br>
&gt; import warnings<br>
&gt; -from tracetool import read_events, Event<br>
&gt; +<br>
&gt; +from tracetool import Event, read_events<br>
&gt; from tracetool.backend.simple import is_string<br>
&gt; <br>
&gt; +<br>
&gt; __all__ =3D [&#39;Analyzer&#39;, &#39;Analyzer2&#39;, &#39;process&#39=
;, &#39;run&#39;]<br>
&gt; <br>
&gt; # This is the binary format that the QEMU &quot;simple&quot; trace bac=
kend<br>
&gt; @@ -166,11 +168,9 @@ def runstate_set(self, timestamp, pid, new_state)=
:<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0def begin(self):<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;&quot;&quot;Called at the start=
 of the trace.&quot;&quot;&quot;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 pass<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0def catchall(self, event, rec):<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;&quot;&quot;Called if no specif=
ic method for processing a trace event has been found.&quot;&quot;&quot;<br=
>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 pass<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0def _build_fn(self, event):<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fn =3D getattr(self, <a href=3D"http:=
//event.name" rel=3D"noreferrer noreferrer" target=3D"_blank">event.name</a=
>, None)<br>
&gt; @@ -208,7 +208,6 @@ def _process_event(self, rec_args, *, event, event=
_id, timestamp_ns, pid, **kwar<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0def end(self):<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;&quot;&quot;Called at the end o=
f the trace.&quot;&quot;&quot;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 pass<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0def __enter__(self):<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self.begin()<br>
&gt; @@ -263,7 +262,6 @@ def runstate_set(self, new_state, *, timestamp_ns,=
 pid, **kwargs):<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0def catchall(self, *rec_args, event, timestamp_ns, =
pid, event_id, **kwargs):<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;&quot;&quot;Called if no specif=
ic method for processing a trace event has been found.&quot;&quot;&quot;<br=
>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 pass<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0def _process_event(self, rec_args, *, event, **kwar=
gs):<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fn =3D getattr(self, <a href=3D"http:=
//event.name" rel=3D"noreferrer noreferrer" target=3D"_blank">event.name</a=
>, self.catchall)<br>
&gt; @@ -279,7 +277,7 @@ def process(events, log, analyzer, read_header=3DT=
rue):<br>
&gt;=C2=A0 =C2=A0 =C2=A0&quot;&quot;&quot;<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0if isinstance(events, str):<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 with open(events, &#39;r&#39;) as f:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 with open(events) as f:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0events_list =3D read_ev=
ents(f, events)<br>
&gt;=C2=A0 =C2=A0 =C2=A0elif isinstance(events, list):<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# Treat as a list of events already p=
roduced by tracetool.read_events<br>
&gt; @@ -332,7 +330,7 @@ def run(analyzer):<br>
&gt;=C2=A0 =C2=A0 =C2=A0except (AssertionError, ValueError):<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0raise SimpleException(f&#39;usage: {s=
ys.argv[0]} [--no-header] &lt;trace-events&gt; &lt;trace-file&gt;\n&#39;)<b=
r>
&gt; <br>
&gt; -=C2=A0 =C2=A0 with open(trace_event_path, &#39;r&#39;) as events_fobj=
, open(trace_file_path, &#39;rb&#39;) as log_fobj:<br>
&gt; +=C2=A0 =C2=A0 with open(trace_event_path) as events_fobj, open(trace_=
file_path, &#39;rb&#39;) as log_fobj:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0process(events_fobj, log_fobj, analyz=
er, read_header=3Dnot no_header)<br>
&gt; <br>
&gt; if __name__ =3D=3D &#39;__main__&#39;:<br>
<br>
I&#39;m not really a fan of the implicit default arguments, but I guess the=
 rest is fine. If this is the way everyone else wants to go, I won&#39;t st=
and in the way.<br></blockquote></div></div><div dir=3D"auto"><br></div><di=
v dir=3D"auto">I can manually restore it. It just happens to be the style t=
he upgrade tool prefers which saves an awful lot of manual work, but I have=
 no prejudice against explicit open parameters.</div><div dir=3D"auto"><br>=
</div><div dir=3D"auto">Thanks for reviewing!</div><div dir=3D"auto"><br></=
div><div dir=3D"auto"><div class=3D"gmail_quote gmail_quote_container"><blo=
ckquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #c=
cc solid;padding-left:1ex">
<br>
=E2=80=94<br>
Mads Ynddal<br>
<br>
</blockquote></div></div></div>

--0000000000006200220637c68115--
