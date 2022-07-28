Received: by 2002:a05:6512:1086:0:0:0:0 with SMTP id j6csp408447lfg;
        Thu, 28 Jul 2022 10:09:34 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1suZEulxGh7FdIUUPNEarbuVZnKNK9OzzwQrYiVs+8fk3zcbITpkNoNfbs0tGiUY5e70n4o
X-Received: by 2002:ad4:57ae:0:b0:474:3edc:89cf with SMTP id g14-20020ad457ae000000b004743edc89cfmr20947814qvx.28.1659028174135;
        Thu, 28 Jul 2022 10:09:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1659028174; cv=none;
        d=google.com; s=arc-20160816;
        b=LTsQ2BSr6SopDiucmByYtAGmovVsiU32yiwd8gPUtQHyY6wAEq+vcCbjKjRgJkbr9b
         SFDZev2ZFEDi+M69u4cYzM+85wTIaPKoGYYUtYhBiZlv4W5tm7x1LUyUTbAUB0UAo32P
         +Ye3DDMv1Hgh4fwPc2/5NORxn9LSaYDRLL/GLtvRegAZeLwI1yWZw+2GnlSikymZSr6B
         ba7ZGj/kfptrK6FjpUOtxy6wrYbdozSINlr1uJ+OPeFeKwWIFhN5IrH1+GFnpvDffQSD
         t+RHr6aMWVtqSjtGHMlBe2s/+kYkDk8bnxIEf+NJIf1aB04NEzF45yzAeZc9R59iWfAQ
         qIZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:in-reply-to:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :dkim-signature;
        bh=DogADKDCHu9M+X1pX23VQYzagzQQ9RO4hkFFwkg90B8=;
        b=ZVtccSCMWNjFfAq1jZf0QXIVX5g+Ps80vfj6ipFZM2eJIkiuie5RuVF/KXefqzty02
         i6Om5Pm5Ts7y6OXzcPUHK318I9sjCqQ3PGJ2QZKyjcDuWb42za1ZfLYboxivdhx7jY/l
         V08E06xQwcKSahTY3CimWQQQG/U3OJeOJYxSTK/72jpFyg9F8d0aLU5ZLT0sM0VDvI0P
         cQ5FLMHCdZUjC8ZSFa2x8TcuKLeVCgt8iGoYtx7Bh3vFxrW+tAwK+y+eUPD96nyTTtbz
         yexP8Jde0AXd7rosr2+GOWs5fKmc5A/33vfIW29x0o62F4nOcFi7oj4HJ5lYgXEXZGIe
         1yrg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=abfQZYZG;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id fz14-20020a05622a5a8e00b0031ed3add06fsi765794qtb.282.2022.07.28.10.09.33
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 28 Jul 2022 10:09:34 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=abfQZYZG;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:34950 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1oH70v-0004mF-K5
	for alex.bennee@linaro.org; Thu, 28 Jul 2022 13:09:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42348)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1oH70a-0004la-Aq
 for qemu-arm@nongnu.org; Thu, 28 Jul 2022 13:09:12 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:47242)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1oH70X-0000pa-KN
 for qemu-arm@nongnu.org; Thu, 28 Jul 2022 13:09:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1659028147;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=DogADKDCHu9M+X1pX23VQYzagzQQ9RO4hkFFwkg90B8=;
 b=abfQZYZGxA/Wocr08utuRaQcSkD1jUMkCUiTzooylfc5hbrfirOj5Sbtwg0b4MlvCvNiXt
 dp840SpKmCFQd5M67tl0h9Ay1LhUXVWUtH0B/OYU5vzVL4uO7YE5WtkwYi4YIo7oaO0UmX
 lEI5O6SHGwgPlJ7ZNZmyxgtWRMuKE1s=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-50-6wLUm-IRPUu0CNEkCYNGQQ-1; Thu, 28 Jul 2022 13:09:03 -0400
X-MC-Unique: 6wLUm-IRPUu0CNEkCYNGQQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id BACA51824600;
 Thu, 28 Jul 2022 17:09:01 +0000 (UTC)
Received: from redhat.com (unknown [10.39.194.41])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 87EAB2026D64;
 Thu, 28 Jul 2022 17:08:58 +0000 (UTC)
Date: Thu, 28 Jul 2022 19:08:57 +0200
From: Kevin Wolf <kwolf@redhat.com>
To: Markus Armbruster <armbru@redhat.com>
Cc: Peter Maydell <peter.maydell@linaro.org>, Hao Wu <wuhaotsh@google.com>,
 richard.henderson@linaro.org, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org, venture@google.com, Avi.Fishman@nuvoton.com,
 kfting@nuvoton.com, hskinnemoen@google.com, f4bug@amsat.org,
 bin.meng@windriver.com, qemu-block@nongnu.org, thuth@redhat.com,
 Hanna Reitz <hreitz@redhat.com>
Subject: Re: [PATCH v5 5/8] blockdev: Add a new IF type IF_OTHER
Message-ID: <YuLCqeG21TCyBSTF@redhat.com>
References: <20220714182836.89602-1-wuhaotsh@google.com>
 <20220714182836.89602-6-wuhaotsh@google.com>
 <87ilnuda33.fsf@pond.sub.org> <YuGMFRDj3tLOIJK7@redhat.com>
 <CAFEAcA-_TkDW4tPxvmwEt-Rr6VAr_7aWNX2++CE+1G5cBPtiBg@mail.gmail.com>
 <YuKPVi9UjmZVqw5a@redhat.com> <878rodxpeq.fsf@pond.sub.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <878rodxpeq.fsf@pond.sub.org>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: E+hwBZm/H1hK

Am 28.07.2022 um 16:50 hat Markus Armbruster geschrieben:
> Kevin Wolf <kwolf@redhat.com> writes:
> 
> > Am 28.07.2022 um 11:46 hat Peter Maydell geschrieben:
> >> On Wed, 27 Jul 2022 at 20:03, Kevin Wolf <kwolf@redhat.com> wrote:
> >> >
> >> > Am 18.07.2022 um 11:49 hat Markus Armbruster geschrieben:
> >> > > An OTP device isn't really a parallel flash, and neither are eFuses.
> >> > > More fast-and-lose use of IF_PFLASH may exist in the tree, and maybe of
> >> > > other interface types, too.
> >> > >
> >> > > This patch introduces IF_OTHER.  The patch after next uses it for an
> >> > > EEPROM device.
> >> > >
> >> > > Do we want IF_OTHER?
> >> >
> >> > What would the semantics even be? Any block device that doesn't pick up
> >> > a different category may pick up IF_OTHER backends?
> >> >
> >> > It certainly feels like a strange interface to ask for "other" disk and
> >> > then getting as surprise what this other thing might be. It's
> >> > essentially the same as having an explicit '-device other', and I
> >> > suppose most people would find that strange.
> >> >
> >> > > If no, I guess we get to abuse IF_PFLASH some more.
> >> > >
> >> > > If yes, I guess we should use IF_PFLASH only for actual parallel flash
> >> > > memory going forward.  Cleaning up existing abuse of IF_PFLASH may not
> >> > > be worth the trouble, though.
> >> > >
> >> > > Thoughts?
> >> >
> >> > If the existing types aren't good enough (I don't have an opinion on
> >> > whether IF_PFLASH is a good match), let's add a new one. But a specific
> >> > new one, not just "other".
> >> 
> >> I think the common thread is "this isn't what anybody actually thinks
> >> of as being a 'disk', but we would like to back it with a block device
> >> anyway". That can cover a fair range of possibilities...
> >
> > How confident are we that no board will ever have two devices of this
> > kind?
> >
> > As long as every board has at most one, if=other is a bad user interface
> > in terms of descriptiveness, but still more or less workable as long as
> > you know what it means for the specific board you use.
> >
> > But if you have more than one device, it becomes hard to predict which
> > device gets which backend - it depends on the initialisation order in
> > the code then,
> 
> Really?  Board code should use IF_OTHER devices just like it uses the
> other interface types, namely connecting each frontend device to a
> backend device with a well-known and fixed interface type and index (or
> bus and unit instead, where appropriate).
> 
> >                and I'm pretty sure that this isn't something that should
> > have significance in external interfaces and therefore become a stable
> > API.
> 
> I agree that "implied by execution order" is a bad idea: commit
> 95fd260f0a "blockdev: Drop unused drive_get_next()".

Ah good, I was indeed thinking of something drive_get_next()-like.

In case the board works with explicit indices, the situation is not as
bad as I was afraid. It will certainly be workable (even if not obvious)
for any boards that have a fixed number of devices with block backends,
which should cover everything we're intending to cover here.

I still consider if=other a bad user interface because what it means is
completely opaque, but if that's okay for you in your board, who am I to
object.

(Of course, the real solution would be having a generic way to set qdev
properties for on-board devices. I'm not expecting that we're getting
this anytime soon, though.)

Kevin

