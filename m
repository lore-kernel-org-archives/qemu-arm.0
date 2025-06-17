Received: by 2002:a17:504:5d2c:b0:1be9:327d:8ee3 with SMTP id et12csp2380665njc;
        Tue, 17 Jun 2025 02:16:22 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVEjxuHQe5PVWZjMzQykp8gznfAVrR5Nb2i4AHeoyJ9QU9K9r39HmezYnivDcpq1RkbbBAqrxENRZUZ4A==@linaro.org
X-Google-Smtp-Source: AGHT+IHIwWUB9M6xCjwTTaD5O7cpZ/uyQVzIy1PSiiTBohBytH5MEyekYE42dnqPEtinpDGewZUI
X-Received: by 2002:a05:622a:1346:b0:4a4:3fb2:113c with SMTP id d75a77b69052e-4a73c628b97mr185450091cf.45.1750151781816;
        Tue, 17 Jun 2025 02:16:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1750151781; cv=none;
        d=google.com; s=arc-20240605;
        b=IVasVHWJV/MEZyNejzuvKIEytwZYSd/4HrWRJ+TWBWXUx8o/tw44ISiuu/okUi8yzz
         EHL0PeqxC2X6sIrohq6UhBAsjhS66vYOUh5qENo9jgHs+8TtR/hDxUssMkZN9T8EPwQQ
         hlssIovJ/MHjHzJ3gKx8vObAuXZeesaZjObSXbXEIpx6WcZ0+Xm4O5lIWvfJgXBrFxKa
         N2UrVzJLbsPIWtf5QMJbghfMe1HSRfIqsLmDPGWC3nEnkLPrF7ErOcHgF/f66w9Vrhc1
         P6hUnWhGSvpjWxTjIILZZ3hs2BjbpXicfLhxf8xpCU/SrsyR6D/phw1OqN+FUo/oa32t
         9XHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:dkim-signature;
        bh=F2Lk87g/ffbwU6AtjA/WqgttL7/b0yIw5RLWx7pPGH8=;
        fh=AKtc0CCYGDQSuHIvgZUtfKg9HcnLUIZwGCAhLIhjN24=;
        b=QMuMMjESEK0kzJikqulRqi1A8qxRvhC15uueLvsBXgXgqjsJwPFNnudCkKSBsYu/Kc
         TcFTouXOnTnSxn8HohNDyL49gHGu05f3cUfAmYkWVdXEjzaytnrJCyG+Yuhm8Mk08oSg
         Zgoi/M8Ia8ZS22Hats6S+9PE2fNGw8JqtqtcmegKQVQ+aYuxzMnBAyuj3W7X8FDdxgCD
         YVDnSik/o2DVj6YwThXc/ex+Wk89pH3eB+9+YqgNlcWg0UH8RFllO4r88PfCYbOr5fVo
         krvEyvRa+reYke2cAnPuSSDhNf1R9a9Fxy++B26RVDXyla8Elrc1wTYE0h37i04Cln6i
         eUOA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@ynddal.dk header.s=sig1 header.b="t/ebtiKW";
       spf=pass (google.com: domain of mads@ynddal.dk designates 57.103.87.90 as permitted sender) smtp.mailfrom=mads@ynddal.dk
Return-Path: <mads@ynddal.dk>
Received: from outbound.qs.icloud.com (p-east3-cluster1-host9-snip4-7.eps.apple.com. [57.103.87.90])
        by mx.google.com with ESMTPS id d75a77b69052e-4a72a4f3ff8si124899981cf.470.2025.06.17.02.16.21
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Jun 2025 02:16:21 -0700 (PDT)
Received-SPF: pass (google.com: domain of mads@ynddal.dk designates 57.103.87.90 as permitted sender) client-ip=57.103.87.90;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@ynddal.dk header.s=sig1 header.b="t/ebtiKW";
       spf=pass (google.com: domain of mads@ynddal.dk designates 57.103.87.90 as permitted sender) smtp.mailfrom=mads@ynddal.dk
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ynddal.dk; s=sig1;
	bh=F2Lk87g/ffbwU6AtjA/WqgttL7/b0yIw5RLWx7pPGH8=;
	h=Content-Type:Mime-Version:Subject:From:Date:Message-Id:To:x-icloud-hme;
	b=t/ebtiKWDY2QkbdzHbQ8JHAQfW1irYE31MIXq5FeLuQBVi2srySC4AW71wet8gKuQ
	 NlCtlcJtugl2N8OExL2XPUcYb01vz9cJeaP4XAHUNki1VR/W0mWuIgJx8RWVrvaWRH
	 Byaa4t7oX7MCpWsgwXdEpyufTUl6xr1VGUemjO2LowKLdrX8vshUlah0LMXLG0/Otn
	 DqAICXcAFc5hhPAYSdZkfGlEh+oBwZSg/5iGUd51B84db5dd/YZZ76xa8b442qkjH0
	 ayL40utni9I3IDatF919KJrglGL7z8PuqtzAFeSjhXkTD/GNBcY1MXtOOq2jDTx/F/
	 PhTKUTD3kuRQA==
Received: from outbound.qs.icloud.com (unknown [127.0.0.2])
	by outbound.qs.icloud.com (Postfix) with ESMTPS id 2FDF5180120B;
	Tue, 17 Jun 2025 09:16:15 +0000 (UTC)
Received: from smtpclient.apple (qs-asmtp-me-k8s.p00.prod.me.com [17.57.155.37])
	by outbound.qs.icloud.com (Postfix) with ESMTPSA id 9338118011E4;
	Tue, 17 Jun 2025 09:16:04 +0000 (UTC)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.600.51.1.1\))
Subject: Re: [PATCH v2 06/12] python: upgrade to python3.9+ syntax
From: Mads Ynddal <mads@ynddal.dk>
In-Reply-To: <20250612205451.1177751-7-jsnow@redhat.com>
Date: Tue, 17 Jun 2025 11:15:53 +0200
Cc: qemu-devel@nongnu.org,
 Joel Stanley <joel@jms.id.au>,
 Yi Liu <yi.l.liu@intel.com>,
 =?utf-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Helge Deller <deller@gmx.de>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Andrew Jeffery <andrew@codeconstruct.com.au>,
 Fabiano Rosas <farosas@suse.de>,
 Alexander Bulekov <alxndr@bu.edu>,
 Darren Kenny <darren.kenny@oracle.com>,
 Leif Lindholm <leif.lindholm@oss.qualcomm.com>,
 =?utf-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>,
 Ed Maste <emaste@freebsd.org>,
 Gerd Hoffmann <kraxel@redhat.com>,
 Warner Losh <imp@bsdimp.com>,
 Kevin Wolf <kwolf@redhat.com>,
 Tyrone Ting <kfting@nuvoton.com>,
 Eric Blake <eblake@redhat.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Troy Lee <leetroy@gmail.com>,
 Halil Pasic <pasic@linux.ibm.com>,
 Akihiko Odaki <odaki@rsg.ci.i.u-tokyo.ac.jp>,
 Michael Roth <michael.roth@amd.com>,
 Laurent Vivier <laurent@vivier.eu>,
 Ani Sinha <anisinha@redhat.com>,
 Weiwei Li <liwei1518@gmail.com>,
 Eric Farman <farman@linux.ibm.com>,
 Steven Lee <steven_lee@aspeedtech.com>,
 Brian Cain <brian.cain@oss.qualcomm.com>,
 Li-Wen Hsu <lwhsu@freebsd.org>,
 Jamin Lin <jamin_lin@aspeedtech.com>,
 qemu-s390x@nongnu.org,
 Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 qemu-block@nongnu.org,
 Bernhard Beschow <shentey@gmail.com>,
 =?utf-8?Q?Cl=C3=A9ment_Mathieu--Drif?= <clement.mathieu--drif@eviden.com>,
 Maksim Davydov <davydov-max@yandex-team.ru>,
 Niek Linnenbank <nieklinnenbank@gmail.com>,
 =?utf-8?Q?Herv=C3=A9_Poussineau?= <hpoussin@reactos.org>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Paul Durrant <paul@xen.org>,
 Manos Pitsidianakis <manos.pitsidianakis@linaro.org>,
 Jagannathan Raman <jag.raman@oracle.com>,
 Igor Mitsyanko <i.mitsyanko@gmail.com>,
 Max Filippov <jcmvbkbc@gmail.com>,
 Markus Armbruster <armbru@redhat.com>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Anton Johansson <anjo@rev.ng>,
 Peter Maydell <peter.maydell@linaro.org>,
 Cleber Rosa <crosa@redhat.com>,
 Eric Auger <eric.auger@redhat.com>,
 Yanan Wang <wangyanan55@huawei.com>,
 qemu-arm@nongnu.org,
 Hao Wu <wuhaotsh@google.com>,
 Sriram Yagnaraman <sriram.yagnaraman@ericsson.com>,
 qemu-riscv@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>,
 Jason Wang <jasowang@redhat.com>,
 Nicholas Piggin <npiggin@gmail.com>,
 Michael Rolnik <mrolnik@gmail.com>,
 Zhao Liu <zhao1.liu@intel.com>,
 Alessandro Di Federico <ale@rev.ng>,
 Thomas Huth <thuth@redhat.com>,
 Antony Pavlov <antonynpavlov@gmail.com>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Hanna Reitz <hreitz@redhat.com>,
 Ilya Leoshkevich <iii@linux.ibm.com>,
 Marcelo Tosatti <mtosatti@redhat.com>,
 Nina Schoetterl-Glausch <nsg@linux.ibm.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Qiuhao Li <Qiuhao.Li@outlook.com>,
 Hyman Huang <yong.huang@smartx.com>,
 =?utf-8?B?IkRhbmllbCBQLiBCZXJyYW5nw6ki?= <berrange@redhat.com>,
 Magnus Damm <magnus.damm@gmail.com>,
 qemu-rust@nongnu.org,
 Bandan Das <bsd@redhat.com>,
 Strahinja Jankovic <strahinja.p.jankovic@gmail.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 =?utf-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 kvm@vger.kernel.org,
 Fam Zheng <fam@euphon.net>,
 Jia Liu <proljc@gmail.com>,
 =?utf-8?Q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>,
 Alistair Francis <alistair@alistair23.me>,
 Subbaraya Sundeep <sundeep.lkml@gmail.com>,
 Kyle Evans <kevans@freebsd.org>,
 Song Gao <gaosong@loongson.cn>,
 Alexandre Iooss <erdnaxe@crans.org>,
 Aurelien Jarno <aurelien@aurel32.net>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Peter Xu <peterx@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 BALATON Zoltan <balaton@eik.bme.hu>,
 Elena Ufimtseva <elena.ufimtseva@oracle.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 =?utf-8?B?RnLDqWTDqXJpYyBCYXJyYXQ=?= <fbarrat@linux.ibm.com>,
 qemu-ppc@nongnu.org,
 Radoslaw Biernacki <rad@semihalf.com>,
 Beniamino Galvani <b.galvani@gmail.com>,
 David Hildenbrand <david@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 David Woodhouse <dwmw2@infradead.org>,
 Eduardo Habkost <eduardo@habkost.net>,
 Ahmed Karaman <ahmedkhaledkaraman@gmail.com>,
 Huacai Chen <chenhuacai@kernel.org>,
 Mahmoud Mandour <ma.mandourr@gmail.com>,
 Harsh Prateek Bora <harshpb@linux.ibm.com>
Content-Transfer-Encoding: quoted-printable
Message-Id: <9C057F25-8BE4-45FC-9332-99F24440DB92@ynddal.dk>
References: <20250612205451.1177751-1-jsnow@redhat.com>
 <20250612205451.1177751-7-jsnow@redhat.com>
To: John Snow <jsnow@redhat.com>
X-Mailer: Apple Mail (2.3826.600.51.1.1)
X-Proofpoint-ORIG-GUID: IweXgYkE3E1R4VKwqx9qMGv7w_Y-E-Wb
X-Proofpoint-GUID: IweXgYkE3E1R4VKwqx9qMGv7w_Y-E-Wb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-17_04,2025-06-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=893
 mlxscore=0 adultscore=0 bulkscore=0 phishscore=0 clxscore=1030 spamscore=0
 malwarescore=0 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.22.0-2503310001 definitions=main-2506170075
X-TUID: ECTQr2pa9yYN


> diff --git a/scripts/simpletrace.py b/scripts/simpletrace.py
> index cef81b0707f..a013e4402de 100755
> --- a/scripts/simpletrace.py
> +++ b/scripts/simpletrace.py
> @@ -9,13 +9,15 @@
> #
> # For help see docs/devel/tracing.rst
>=20
> -import sys
> -import struct
> import inspect
> +import struct
> +import sys
> import warnings
> -from tracetool import read_events, Event
> +
> +from tracetool import Event, read_events
> from tracetool.backend.simple import is_string
>=20
> +
> __all__ =3D ['Analyzer', 'Analyzer2', 'process', 'run']
>=20
> # This is the binary format that the QEMU "simple" trace backend
> @@ -166,11 +168,9 @@ def runstate_set(self, timestamp, pid, =
new_state):
>=20
>     def begin(self):
>         """Called at the start of the trace."""
> -        pass
>=20
>     def catchall(self, event, rec):
>         """Called if no specific method for processing a trace event =
has been found."""
> -        pass
>=20
>     def _build_fn(self, event):
>         fn =3D getattr(self, event.name, None)
> @@ -208,7 +208,6 @@ def _process_event(self, rec_args, *, event, =
event_id, timestamp_ns, pid, **kwar
>=20
>     def end(self):
>         """Called at the end of the trace."""
> -        pass
>=20
>     def __enter__(self):
>         self.begin()
> @@ -263,7 +262,6 @@ def runstate_set(self, new_state, *, timestamp_ns, =
pid, **kwargs):
>=20
>     def catchall(self, *rec_args, event, timestamp_ns, pid, event_id, =
**kwargs):
>         """Called if no specific method for processing a trace event =
has been found."""
> -        pass
>=20
>     def _process_event(self, rec_args, *, event, **kwargs):
>         fn =3D getattr(self, event.name, self.catchall)
> @@ -279,7 +277,7 @@ def process(events, log, analyzer, =
read_header=3DTrue):
>     """
>=20
>     if isinstance(events, str):
> -        with open(events, 'r') as f:
> +        with open(events) as f:
>             events_list =3D read_events(f, events)
>     elif isinstance(events, list):
>         # Treat as a list of events already produced by =
tracetool.read_events
> @@ -332,7 +330,7 @@ def run(analyzer):
>     except (AssertionError, ValueError):
>         raise SimpleException(f'usage: {sys.argv[0]} [--no-header] =
<trace-events> <trace-file>\n')
>=20
> -    with open(trace_event_path, 'r') as events_fobj, =
open(trace_file_path, 'rb') as log_fobj:
> +    with open(trace_event_path) as events_fobj, open(trace_file_path, =
'rb') as log_fobj:
>         process(events_fobj, log_fobj, analyzer, read_header=3Dnot =
no_header)
>=20
> if __name__ =3D=3D '__main__':

I'm not really a fan of the implicit default arguments, but I guess the =
rest is fine. If this is the way everyone else wants to go, I won't =
stand in the way.

=E2=80=94
Mads Ynddal
