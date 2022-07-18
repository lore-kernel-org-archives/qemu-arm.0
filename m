Received: by 2002:ac2:596f:0:0:0:0:0 with SMTP id h15csp1201356lfp;
        Mon, 18 Jul 2022 02:46:32 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1s6phEXWp5bxfRnbLhBep6ShFxxGzKPJkJUfYtG9jhUE07NBkNFr6yzMcRibqToFo4crA+4
X-Received: by 2002:ac8:5787:0:b0:31e:df6b:653 with SMTP id v7-20020ac85787000000b0031edf6b0653mr9683156qta.249.1658137592306;
        Mon, 18 Jul 2022 02:46:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1658137592; cv=none;
        d=google.com; s=arc-20160816;
        b=W7UBuulNJXuQ40VZ1oUHlgSMgzYWlHVLVh0Agam+2nSgE5UsUuzt9prkJ1xf4ED2a5
         X4fkTTVD5z0bscIlYPfPU6co3bwZnIKWZMdxgEpOJ42OPrXpsDoDsSXBIsT7Axf2CrV1
         1ZimTYNWBKEy79qjpRV2lxmSHDXsgSI20TbQUTyFzY2WhQfeB+DbpDPvIin46uEFV5N9
         4uY5zDCJgYLHlk5qf7Rn+VMm69B7p4q/C5wCkUHDsETGyK43ycTpPNVMXHuHqDXDdEIh
         1NbQ+S2gT494O/KeGKwlP0MbtonAXA4B1BhJ+FSgc3ywQgnCb2jS4IPqNhyrIMt+yEJl
         yZfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence:user-agent
         :in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :dkim-signature;
        bh=/qi7K6ph/yfELE8yfWd1w7KL7GltZIn0IMAPsRtB2JY=;
        b=LUOSWdU595e0I7E3NVVA79BqbSmV6yiP1a9hoD5FoQsZRlilVTdwtKn9ZM6sol94OK
         bX20umPvaeZYbJamKEZi5zG4un6/bHot5KC9fUd0gNZpQoMsx1nAfL0/DtzxvZL23+Qw
         6CsfUNru9s1C1DDC83GlPcilseN6EvJK0WK9fMpVoD4q/4HjTGc2PC65jKGXTdkr6yFX
         yK2mUFnawuDokync0kP5/T8UJFlglZlrXwGeCY5Muo78kq4IPkhOgqoZ/RPSq9wSF6ZU
         EeCmmNpleEcHfjkAIzbnddKtCYso65iaRP8x5AoyxmYmfs5E10E0u+1tWhAoe94Y1M7p
         moHQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=RWMP1rqp;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o1-20020ac85a41000000b0031d482768fdsi6180981qta.271.2022.07.18.02.46.32
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 18 Jul 2022 02:46:32 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=RWMP1rqp;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:39450 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1oDNKh-0004oq-PE
	for alex.bennee@linaro.org; Mon, 18 Jul 2022 05:46:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42732)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1oDNKO-0004o6-HH
 for qemu-arm@nongnu.org; Mon, 18 Jul 2022 05:46:12 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:55558)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1oDNKL-0002QU-UC
 for qemu-arm@nongnu.org; Mon, 18 Jul 2022 05:46:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1658137568;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/qi7K6ph/yfELE8yfWd1w7KL7GltZIn0IMAPsRtB2JY=;
 b=RWMP1rqp7yMYsS06DQBlf3+WY7r5clYNqOHcFGikdPW5x5vEIZcqa8rpO95qJpf6uJJ1em
 r69EDL4FUvpMJnbg240o4LkXZYXnEZL3BhbzePKLWTn9yPiI201ykX9czIaTaW0kUzUn9Z
 pj0vXMmqXDop2Vg7GjVI39JHaksNkHU=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-477-qyyusIj9NiKBgTEhOdwM-A-1; Mon, 18 Jul 2022 05:46:06 -0400
X-MC-Unique: qyyusIj9NiKBgTEhOdwM-A-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3694A28004A4;
 Mon, 18 Jul 2022 09:46:06 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.51])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D05702026D64;
 Mon, 18 Jul 2022 09:46:04 +0000 (UTC)
Date: Mon, 18 Jul 2022 10:46:02 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Cornelia Huck <cohuck@redhat.com>
Cc: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org,
 qemu-s390x@nongnu.org, qemu-arm@nongnu.org,
 David Hildenbrand <david@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH 0/3] target: RFC: display deprecation note for '-cpu help'
Message-ID: <YtUr2qG9r0zfyY2J@redhat.com>
References: <20220714150735.1835166-1-berrange@redhat.com>
 <30e66f70-a004-6789-d66a-351becaa48e2@redhat.com>
 <87wncapxr4.fsf@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <87wncapxr4.fsf@redhat.com>
User-Agent: Mutt/2.2.6 (2022-06-05)
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: HYq1gx2B4nHQ

On Mon, Jul 18, 2022 at 11:37:35AM +0200, Cornelia Huck wrote:
> On Mon, Jul 18 2022, Thomas Huth <thuth@redhat.com> wrote:
> 
> > On 14/07/2022 17.07, Daniel P. Berrangé wrote:
> >> $ qemu-system-x86_64 -cpu help:
> >> Available CPUs:
> >> x86 486                   (alias configured by machine type) (deprecated: use at least 'Nehalem' / 'Opteron_G4', or 'host' / 'max')
> >> 
> >> I wonder if this is too verbose, and we should just do a
> >> concise flag like approach, similar to QMP:
> >> 
> >> $ qemu-system-x86_64 -cpu help:
> >> Available CPUs:
> >> x86 486                   (alias configured by machine type) (deprecated)
> >> 
> >> leaving the full message to be displayed at runtime ? I'm slightly
> >> inclined to the simpler more concise output.
> >
> > I'd prefer to keep it short here and just write "deprecated" without the 
> > reason. Otherwise this will overflow the lines and break the readability of 
> > the output. And it's also what we're also doing for "-machine", e.g.:
> >
> > $ ./qemu-system-ppc64 -M help | grep deprecate
> > taihu                taihu (deprecated)
> > $ ./qemu-system-ppc64 -M taihu
> > qemu-system-ppc64: warning: Machine type 'taihu' is deprecated: incomplete, 
> > use 'ref405ep' instead
> 
> Ok, following what -machine does is certainly a good point.

Yes, I should have thought to check what -machine does, it makese
sense to be consistent.

> Is it easy enough the figure out the deprecation note? I think you
> either have to actually start something with the deprecated entity, or
> use qmp (which is not that straightforward)?

QMP doesn't tell you the note, just a boolean deprecation flag. It is
only printed on startup only right now.

In the context of libvirt what happens is that libvirt can report that
something is deprecated (based on the QMP response). If you go ahead
and use it anyway, you'll get the deprecation message in the logfile
for the VM, and the VM gets marked tainted by libvirt, which serves
as a guide to look in the logfile.

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|

