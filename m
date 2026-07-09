Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2950BC43458
	for <qemu-arm@archiver.kernel.org>; Thu,  9 Jul 2026 15:32:01 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1whqjB-00064M-LF; Thu, 09 Jul 2026 11:31:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1whqj9-00063P-VU
 for qemu-arm@nongnu.org; Thu, 09 Jul 2026 11:31:51 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1whqj6-0002ls-HO
 for qemu-arm@nongnu.org; Thu, 09 Jul 2026 11:31:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1783611106;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jaHc/CL/aWA9MSr7n7QV5ZOO0n5A8cbT703vXzhZfrc=;
 b=TnYhKlfmF3Wr9bQnQjjRcKgUX9DAHx3uJPuPTqYiQ87l1M+ZpABVea+4npq3JTDV7E0/Bi
 q34w0Al7Q2uZO7CsRJbCLXMQn7srNpbUjkw/vqKx3Vc8I+7o05MYwN0xZGBgGYqr9jEngs
 wWninyH9+57WkH7P55PtAwmMBtl92Gc=
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com
 [209.85.216.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-441-WJJ_tBJcNmmnQgV55gG7jw-1; Thu, 09 Jul 2026 11:31:44 -0400
X-MC-Unique: WJJ_tBJcNmmnQgV55gG7jw-1
X-Mimecast-MFC-AGG-ID: WJJ_tBJcNmmnQgV55gG7jw_1783611104
Received: by mail-pj1-f69.google.com with SMTP id
 98e67ed59e1d1-3812b0c6f23so23391a91.1
 for <qemu-arm@nongnu.org>; Thu, 09 Jul 2026 08:31:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783611103; x=1784215903;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=jaHc/CL/aWA9MSr7n7QV5ZOO0n5A8cbT703vXzhZfrc=;
 b=b26tLeS8oFUbcP4MocGwo60mjbZSBsMmDDoiau7dJWS7Oe3Qtw25QBFzJjbvb49mys
 5hn8ZH6Ykx/Fk7QS6FH3P+RchnYCjCC4mbdZ3obqW50OYDcxtrR0TGtxaNiiJYP9+1+U
 HYvA09OX98H13rlh+eacuei4DRDviU/roRrEb+QK802eQBE8ANY2Fdl6i1C4bWmehCbu
 +Y21iMmaLK6ad1YaZae3hcaTot6HFaEBuCXRPKcMXumEGZ/VkdvB1Io1ovJVG6Os6ZHA
 rIum0WkD0AVm5tnkRILGCxCrVDSUZo5+4rAELIZEe7dnUStGbFqR1Sf9OhI1/FrWgjRO
 YU7g==
X-Forwarded-Encrypted: i=1;
 AHgh+RpCCcXNzFOTnM43hljhYe0xqJ7WeeY2Fu6/+RfmiQFIv4qr5hmaatjCnzqXlkPfaLIf/RVpfrUB7w==@nongnu.org
X-Gm-Message-State: AOJu0YxdtJDu6rCeOACt5bcqqnK8qddhwQU/cYRd9smvWo0mJPvEbYXP
 GqzLl8ani2fiDWEDDwpCPQvHz8Vn6cAHJa4TaneFlo/SswuDcEbNVogc82NFjBAdrNG4pK5Upl3
 5nOvIMUnnW5Qx76Bcej4Bnsb9Ql5SLk+4dpM4b6fxOq/jHFfw6fMzz3iqhKOYqE4I82pv4WS9TL
 eiNSu0KaAI9h+3giVO/hyfvAgPReUk
X-Gm-Gg: AfdE7cmajKlr57ha1QIa8tvKT0cKOeucFE5K16+qsAkXopwcmvDFNxS9rIFGT9lFXFp
 OUMgN5xGw2EebLmFhZan4LtdD4WG5A9BfNzooudiNHS7hkZPvjUGorOBfQNJ82zhisQ3FzBudXo
 oZRrKtWRqgnhxuOWYYCF76dFZk+rIG+i76CmsmSw9aHJ2qVmrntEEwdvCgNIPlC07UrlGBs/Qt7
 ZlcpBCkr6/M1/rO1oH8zLDmmOHiNmJrEpSXJ2DAZ1yEV+MwdBZk1N6FNgQgXsY15FWfjJkpnCsy
 91ttkHcO0CG4
X-Received: by 2002:a17:90b:56d0:b0:37f:9ce1:735e with SMTP id
 98e67ed59e1d1-38941bce343mr7939353a91.31.1783611103485; 
 Thu, 09 Jul 2026 08:31:43 -0700 (PDT)
X-Received: by 2002:a17:90b:56d0:b0:37f:9ce1:735e with SMTP id
 98e67ed59e1d1-38941bce343mr7939293a91.31.1783611102929; Thu, 09 Jul 2026
 08:31:42 -0700 (PDT)
MIME-Version: 1.0
References: <87o6gge6b0.fsf@pond.sub.org>
 <CAFEAcA9goRQuxw3VD7AqUOHHTdOXu8MSfCxdQMBviE3QgGD58w@mail.gmail.com>
 <87zf00cn7m.fsf@pond.sub.org> <ak-i1dNY_RrGNHAM@redhat.com>
 <CAFEAcA_=rz22ZqPr77REQa5BJRZVuEkriq-gJ9xGg4E46JPUxQ@mail.gmail.com>
 <CAJ+F1C+BiqriKhDO-vY15z5iQECVarJN-NoemiaW3w93c3EpNg@mail.gmail.com>
 <ak-p56pwFPq9omMz@redhat.com>
In-Reply-To: <ak-p56pwFPq9omMz@redhat.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
Date: Thu, 9 Jul 2026 19:31:31 +0400
X-Gm-Features: AVVi8CeFWLriYLnYysDmaMlaOx-gjGYYrarF3-SlGWFQd0loV4v9ra_NrWaY3jg
Message-ID: <CAMxuvaz=7RxVDjDsR8LeMxAgk-u46ZsKGshsAGKXxMykj7M=FA@mail.gmail.com>
Subject: Re: A few Machines crash when "no default audio driver available"
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org, 
 Jan Kiszka <jan.kiszka@siemens.com>, qemu-arm@nongnu.org, 
 BALATON Zoltan <balaton@eik.bme.hu>, qemu-ppc@nongnu.org, 
 Huacai Chen <chenhuacai@kernel.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@mailo.com>, 
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Gerd Hoffmann <kraxel@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: JoVEk-6A3R5cMLnBtyZU0MyPbviRJhv5QuWx5bxrPmI_1783611104
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mlureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.445,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

Hi

On Thu, Jul 9, 2026 at 6:02=E2=80=AFPM Daniel P. Berrang=C3=A9 <berrange@re=
dhat.com> wrote:
>
> On Thu, Jul 09, 2026 at 05:54:30PM +0400, Marc-Andr=C3=A9 Lureau wrote:
> > Hi
> >
> > On Thu, Jul 9, 2026 at 5:44=E2=80=AFPM Peter Maydell <peter.maydell@lin=
aro.org> wrote:
> > >
> > > On Thu, 9 Jul 2026 at 14:32, Daniel P. Berrang=C3=A9 <berrange@redhat=
.com> wrote:
> > > >
> > > > On Thu, Jul 09, 2026 at 03:22:05PM +0200, Markus Armbruster wrote:
> > > > > Cc: mainainters for "Overall Audio backends"
> > > > > Peter Maydell <peter.maydell@linaro.org> writes:
> > > > >
> > > > > > On Thu, 9 Jul 2026 at 12:44, Markus Armbruster <armbru@redhat.c=
om> wrote:
> > > > > >>
> > > > > >> I stumbled over ARM machine musicpal, PPC machines pegasos1, p=
egasos2,
> > > > > >> and MIPS machine fuloong2e crashes.
> > > > > >>
> > > > > >> I run them like this:
> > > > > >>
> > > > > >> $ qemu-system-aarch64 -M musicpal -nodefaults -S -display none=
 -monitor stdio
> > > > > >
> > > > > >> Died when device_set_realized() tried to propagate a "no defau=
lt audio
> > > > > >> driver available" error to &error_abort.
> > > > > >
> > > > > > Is this something we want to have be a possibility the devices
> > > > > > have to cope with? Can we have the "ignores all audio data"
> > > > > > backend be always available instead?
> > > > >
> > > > > There's plenty of precedence for /dev/null-like backends.
> > > > >
> > > > > > Otherwise every audio device needs to cope with "there is no
> > > > > > audio backend available" and implement "do nothing with the
> > > > > > audio data" itself.
> > > > >
> > > > > Yes.
> > > >
> > > > We've got a bit of tension between "no defaults" and "builtin audio
> > > > devices" here.
> > > >
> > > > Cnosider if I had instead done
> > > >
> > > >   qemu-system-x86_64 -M pc -device ac97 -nodefaults
> > > >
> > > > It is not unreasonable to expect to see an error because you asked
> > > > explicitly for 'ac97'  and forgot to wire up the required audio
> > > > backend, and asked to NOT have any defaults.
> > > >
> > > > But with your 'musicpal' machine example, you never asked for the
> > > > frontend device, so you should be forgiven for also not asking
> > > > for a audio backend.
> > >
> > > Ah, so this is because of -nodefaults, not because QEMU was
> > > somehow built with no audio backends in it.
> > >
> > > > If we guarantee a /dev/null audio backend always exists, we help
> > > > the second case but degrade the first case
> > >
> > > As a possible analogy, for network devices we just warn in
> > > the analogous "device created but no backend wired up":
> > >
> > >  ./build/x86/qemu-system-x86_64 -nodefaults -device e1000 -display no=
ne
> > > qemu-system-x86_64: warning: nic e1000.0 has no peer
> > >
> > > and the effective behaviour is that output packets are dropped.
> > >
> > > We could make audio devices do that (which would be basically
> > > equivalent to "if we need an audio backend and we don't have
> > > one, warn and create the null backend").
> > >
> >
> > Note that we don't have a real "null" backend. The "none" backend does
> > mixing/resampling/volume before dropping the audio (its parent is
> > MIXENG_BACKEND). I think it would be worth to add (so one day we can
> > compile qemu without the whole audio/ engine)
>
> Rather than adding "null" backend, IMHO, we should make "none" do
> what its name suggests, by removing the MIGENG_BACKEND from it.
>

It's a bit more complicated, the "none" backend can be used by vnc
(not spice or dbus), and we have the now-deprecated HMP wavcapture
command.

Note, the new "qemu-vnc" server does not mix/resample audio at this
point, it takes the first audio stream instead.

Fwiw, a "null" audio backend would still need to process audio data at
a correct pace.


