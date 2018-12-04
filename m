Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp8413221wrt;
        Tue, 4 Dec 2018 10:40:15 -0800 (PST)
X-Google-Smtp-Source: AFSGD/Vw9wF61NZSAYkX8Ldbt5UtSLeafTS2n/e54PdxWDSiNY4Ts+y4UzyyaQQDa+hD4+YT812f
X-Received: by 2002:a37:5107:: with SMTP id f7mr20360406qkb.124.1543948815268;
        Tue, 04 Dec 2018 10:40:15 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1543948815; cv=none;
        d=google.com; s=arc-20160816;
        b=PzEWsFlTX4SyyTVQuDukLyO8Io1K7pNAQWtyyhxvs+LErg+Flo0oiTJfFRj/ra+3fj
         YXq89i2P50qN++eEgYdH/elv+kepn+hRDpDr/kNEKzH6a5xoj8VRiotgeVE20NYA3e26
         qUWSTxz9P/4lwjf/qWNQxV99bYIhZvo4Ml/67O7JYqW5+qJ4TmyKoDaNjLERH6RuZvvq
         wjnDzH5zgA9WGcsGwo2UWJ3TAJLXowhVCB8a/YxmUrMdUfy2jevxKsQgSi2fVgNfgVl2
         7iWv+V8WEatTYyalpsxQYMi1iHvLOQcyDIeTsj4QALYtewXKn+GFpxzTc7p10jlhyKB5
         dUaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=DNEKtLL0XW8YU14jk+/Za1K+q4tYOM+uP+Hv0VGDstQ=;
        b=QIWKz8RhKpoO92BjmhIfFtmHGe56o34hKkFM1ndGHtdtkj2vjhUsxcg/CSKva1nlkH
         8WyozmssEhm5IGQycKSkArkg0S5370kZNuw7soOr4qPpzb0PcXvLOvELN1EOHyrDdZIb
         Tw7EZ8NYrnJU7vaP6/TpNpMV6dqQyRXm9UgwveqllVR0YaCr76Ske2kxTrCanOY/GOtV
         Xh6AOpMCOccr9xvx5q3crmXLwauO28dDevof9sx7XT9osJBFQw8yAOpHDKca58ViFH7e
         u5ZOfj36yqWUwvC9kcTdW1/9/18lF5f7qDieiUkfmuqNL/jF+3FQ5UH6wHpHD/de7mBK
         NGKA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=kaazl7iP;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id a50si2559648qva.46.2018.12.04.10.40.15
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 04 Dec 2018 10:40:15 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=kaazl7iP;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:58437 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gUFcE-00055E-Fn
	for alex.bennee@linaro.org; Tue, 04 Dec 2018 13:40:14 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46225)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1gUFbd-0004vr-6C
	for qemu-devel@nongnu.org; Tue, 04 Dec 2018 13:39:38 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1gUFN1-0005Zw-TI
	for qemu-devel@nongnu.org; Tue, 04 Dec 2018 13:24:32 -0500
Received: from mail-oi1-x229.google.com ([2607:f8b0:4864:20::229]:41036)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1gUFN1-0005ZV-GD
	for qemu-devel@nongnu.org; Tue, 04 Dec 2018 13:24:31 -0500
Received: by mail-oi1-x229.google.com with SMTP id j21so15129756oii.8
	for <qemu-devel@nongnu.org>; Tue, 04 Dec 2018 10:24:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=DNEKtLL0XW8YU14jk+/Za1K+q4tYOM+uP+Hv0VGDstQ=;
	b=kaazl7iPSnc55iggyoSvCwEcE3KtEE1QINg2/MnxwYLs8jtbkxc3JGgqsspvFc2uoh
	tk8m/wvUJIC6hO2zkwafznx4CcSVug373D4FHP49svyB3FSAuCtxIDpTd92EYtQewg7c
	f8VOGKdHVr6QXh3L9Am6Rb9vPuKIraghKxJeU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=DNEKtLL0XW8YU14jk+/Za1K+q4tYOM+uP+Hv0VGDstQ=;
	b=p3vLIeJ4tDLzx363HOGc9gGppRje4HB7pIR2gzaVMfmN3wHXpSiTlhMIIB0GSwOKep
	CHcCjteBTWXWo/U9uc+BKJmSGIqr+7Re4YsRbmFr/IoS/z3GNKpT9rkp1gCcsSGZZsXA
	7zruwmBE1DMCcGgkG25Uydr6OddsvsS3LpTu0QHNilnDAgJiYGt10JCikRgEzIO22zbw
	8cdG1A0yV8Vl0ypTZbnEIbUUc+M2VcmyH5VMIPrGSUip81/7qIelFwF/uX23s/PSSu7H
	Pjs/Gu7B+BrbwxXoZElSf+HQarw56NCiG3UxKauzSxt5a50tCiDO9hiZZFUexwlxtRDk
	PvAw==
X-Gm-Message-State: AA+aEWbSbC05/EDMphokuhLq7+c1O5uBBLZRs96G9KebcdckAQq8kIRG
	BjcgOmvmWum3I3rq9cwu1h7eiqaJXnDnGntWHgLFnQ==
X-Received: by 2002:aca:c501:: with SMTP id v1mr12278046oif.48.1543947870786; 
	Tue, 04 Dec 2018 10:24:30 -0800 (PST)
MIME-Version: 1.0
References: <20181123091729.29921-1-luc.michel@greensocs.com>
	<20181123091729.29921-2-luc.michel@greensocs.com>
	<20181123181059.GN18284@habkost.net>
	<65d3a572-9a80-f332-1f88-69e43e8a3663@redhat.com>
	<20181126132731.GJ18284@habkost.net>
	<CAFEAcA8D7ZjO059Sgrx-4i0iT+V3gxT4f=DvdmUAJS7KomtyOg@mail.gmail.com>
	<b8e20686-e5d1-a844-48f7-a4ae471e3fd5@greensocs.com>
	<CAFEAcA8j4xTiS3_ktiA0hm2N4cu5RvxAtYqUHgvY-bUXgcwbjQ@mail.gmail.com>
	<50645862-a638-ad2a-bafe-1b46be42aec4@greensocs.com>
	<20181204180607.GB18284@habkost.net>
In-Reply-To: <20181204180607.GB18284@habkost.net>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 4 Dec 2018 18:24:19 +0000
Message-ID: <CAFEAcA9JXeRGfKzouYJQKxgXuw_Z-up0a1ijZX9hZvXbdkwiuA@mail.gmail.com>
To: Eduardo Habkost <ehabkost@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::229
Subject: Re: [Qemu-devel] [PATCH v7 01/16] hw/cpu: introduce CPU clusters
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Alistair Francis <alistair@alistair23.me>,
	Mark Burton <mark.burton@greensocs.com>,
	QEMU Developers <qemu-devel@nongnu.org>,
	=?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
	Sai Pavan Boddu <saipava@xilinx.com>, Edgar Iglesias <edgari@xilinx.com>,
	qemu-arm <qemu-arm@nongnu.org>,
	=?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>,
	Luc Michel <luc.michel@greensocs.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: UWEbjpg3hioN

On Tue, 4 Dec 2018 at 18:06, Eduardo Habkost <ehabkost@redhat.com> wrote:
> In either case, I'm still missing a clear description of what a
> cluster is supposed to represent, exactly (see my previous reply
> on this thread).

Here's my attempt:

A cluster is a group of CPUs which are all identical and have
the same view of the rest of the system.
If CPUs are not identical (for example, Cortex-A53 and
Cortex-A57 CPUs in an Arm big.LITTLE system) they should be
in different clusters.
If the CPUs do not have the same view of memory (for example
the main CPU and a management controller processor) they should
be in different clusters.

I agree that this is slightly confusing, because the concept
is on the boundary between something that's real in hardware
(eg in a big.LITTLE setup the CPUs are in separate hardware
clusters, and of coures a BMC processor and the main CPU
are definitely different things) and something that we're
defining for its effects on the GDB UI and so we can make
sure we don't share TCG translated code where we shouldn't.

thanks
-- PMM
