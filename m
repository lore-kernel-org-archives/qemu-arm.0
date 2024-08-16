Return-Path: <alex.bennee@linaro.org>
Received: from draig.lan ([85.9.250.243])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3718983a0eesm3645536f8f.1.2024.08.16.05.58.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Aug 2024 05:58:49 -0700 (PDT)
Received: from draig (localhost [IPv6:::1])
	by draig.lan (Postfix) with ESMTP id CBF135F867;
	Fri, 16 Aug 2024 13:58:48 +0100 (BST)
From: =?utf-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Jason Wang <jasowang@redhat.com>
Cc: "Michael S. Tsirkin" <mst@redhat.com>,  Nicholas Piggin
 <npiggin@gmail.com>,  qemu-devel@nongnu.org,  Alistair Francis
 <alistair.francis@wdc.com>,  Michael Roth <michael.roth@amd.com>,  Palmer
 Dabbelt <palmer@dabbelt.com>,  Mahmoud Mandour <ma.mandourr@gmail.com>,
  Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>,  Yoshinori Sato
 <ysato@users.sourceforge.jp>,  Weiwei Li <liwei1518@gmail.com>,  Eduardo
 Habkost <eduardo@habkost.net>,  =?utf-8?Q?Marc-Andr=C3=A9?= Lureau
 <marcandre.lureau@redhat.com>,  Markus Armbruster <armbru@redhat.com>,
  David Hildenbrand <david@redhat.com>,  Beraldo Leal <bleal@redhat.com>,
  Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,  Eric Auger
 <eric.auger@redhat.com>,  Song Gao <gaosong@loongson.cn>,
  qemu-arm@nongnu.org,  Peter Xu <peterx@redhat.com>,  Jiri Pirko
 <jiri@resnulli.us>,  Eric Blake <eblake@redhat.com>,  Fabiano Rosas
 <farosas@suse.de>,  qemu-s390x@nongnu.org,  Peter Maydell
 <peter.maydell@linaro.org>,  Daniel Henrique Barboza
 <dbarboza@ventanamicro.com>,  John Snow <jsnow@redhat.com>,  Alexandre
 Iooss <erdnaxe@crans.org>,  Konstantin Kostiuk <kkostiuk@redhat.com>,
  Pierrick Bouvier <pierrick.bouvier@linaro.org>,  Cleber Rosa
 <crosa@redhat.com>,  Ilya Leoshkevich <iii@linux.ibm.com>,
  qemu-riscv@nongnu.org,  Thomas Huth <thuth@redhat.com>,  Paolo Bonzini
 <pbonzini@redhat.com>,  Richard Henderson <richard.henderson@linaro.org>,
  Bin Meng <bmeng.cn@gmail.com>,  Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?=
 <philmd@linaro.org>,  Wainer dos Santos Moschetta <wainersm@redhat.com>,
  Pavel Dovgalyuk <Pavel.Dovgalyuk@ispras.ru>
Subject: Re: [PATCH v2 16/21] virtio-net: Use replay_schedule_bh_event for
 bhs that affect machine state
In-Reply-To: <CACGkMEtS6kges+_hOum2QnpTWotT_ohkJv8PaFHsycjR10QY5w@mail.gmail.com>
	(Jason Wang's message of "Fri, 16 Aug 2024 10:31:41 +0800")
References: <20240813202329.1237572-1-alex.bennee@linaro.org>
	<20240813202329.1237572-17-alex.bennee@linaro.org>
	<20240813164631-mutt-send-email-mst@kernel.org>
	<D3FEPPLH78YW.3BYA9B4HYGN1U@gmail.com>
	<20240814030308-mutt-send-email-mst@kernel.org>
	<87y14z81ak.fsf@draig.linaro.org>
	<D3GARIYVC16C.20SXVKSIMLED4@gmail.com>
	<20240815102754-mutt-send-email-mst@kernel.org>
	<CACGkMEtS6kges+_hOum2QnpTWotT_ohkJv8PaFHsycjR10QY5w@mail.gmail.com>
Date: Fri, 16 Aug 2024 13:58:48 +0100
Message-ID: <874j7k39pz.fsf@draig.linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: a+8MZKLiMcng

Jason Wang <jasowang@redhat.com> writes:

> On Thu, Aug 15, 2024 at 10:29=E2=80=AFPM Michael S. Tsirkin <mst@redhat.c=
om> wrote:
>>
>> On Thu, Aug 15, 2024 at 05:12:32PM +1000, Nicholas Piggin wrote:
>> > Could be a good idea. Although I'm not sure what to do with
>> > all types, maybe we can restrict what is supported.
>> >
>> > > Is this wider re-factoring something that can wait for the next
>> > > developer cycle?
>> >
>> > I would say so. It's not quite trivial to do nicely since
>> > things are a bit tangled between util/async and replay.
>> >
>> > > >> I had started on a conversion once but not completed it.
>> > > >> I could resurrect if there is agreement on the API?
>> > >
>> > > I would certainly welcome it being cleaned up. The supported replay
>> > > devices are very piecemeal at the moment.
>> >
>> > I'll tidy up and post an RFC for how the new API might look.
>> >
>> > Thanks,
>> > Nick
>>
>> Fundamentally it's virtio net, up to Jason.
>
> It seems it has been in the pull request from Alex Benn=C3=A9e.

Sorry I'd suibmitted the PR before I saw mst's update.

>
>> I don't like messy
>> APIs and people tend to get distracted and not fix them up
>> if one does not make this a blocker.
>
> +1

do you want me to drop the series for 9.1 and leave it in its current
(broken) state? Nick has already posted a suggestion for the API update
but it seems a bit late in the cycle to include it in the release.

>
>>
>> --
>> MST
>
> Thanks
>
>>

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro
