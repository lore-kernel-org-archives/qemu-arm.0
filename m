Received: by 10.28.71.27 with SMTP id u27csp693706wma;
        Fri, 26 Jan 2018 05:16:19 -0800 (PST)
X-Google-Smtp-Source: AH8x224RgfAkp3z5ZFBI5bZC3dq/iwSL3GKkxczcUykWkVUtxI6cnc+n1KnC+rUEj3m3EeG4TlA6
X-Received: by 10.37.219.199 with SMTP id g190mr10491441ybf.373.1516972579519;
        Fri, 26 Jan 2018 05:16:19 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1516972579; cv=none;
        d=google.com; s=arc-20160816;
        b=Ro6OH5r5HCTKmp1ONgFBm2sQVdilcjlDg7FVGczZvwrvO72dmCSYDDPeA0euHmzAzo
         qB+21NY84GrHHsCtk7KaskKNloX0YCbIewnbGjVCCnL5XL3W2ProaVlXGzZuDT2jTqNP
         XiBRDzu85iq6XArRvqPuzEXfDQXQF92SOa6SW8YKw+vzREd9HHRGQSZ9zc+03OMC+S7p
         OOTTnFQfcXc9BvfTPCij67z7vHZgl2VE4oma2i+qCXOg2nfGLz50Lfydjub0QUHY2w2+
         1hviOwJm/dWt/Gqp1FK/AokPzaBXB4O59gDMizBLYO6CwOIgLJzvKRaNhsfL0fV3qTov
         lB4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date
         :arc-authentication-results;
        bh=iEKrdIO/uzp0IpafNXpqN/0ykagjytZEpYZyMA7Q9ns=;
        b=t6Xy8+Blp/NGHTuTpdZC3BLBGZdS4l1zKZy8M1Ef2lQz65VwugjuIe63ltSyD4fWu5
         pVlOROXviWcABsCWLRq+5KjQLMbRoBpy2kobh5lCovkctB86dfjYvGOgzLH4BswfYZYB
         mMN3celxbb1XNmqAQiUozS41lqdDvg4RVCtQ5TSHm3I8fm2fRsT+0cslUwA4M4KykTLr
         SApfwdaKw4sPWwB3e7P0UUFMOd04PQ1maxCjgA7QvM57VOr/fd9hHgicQQ4gsT/mTFXQ
         OIkbBaQj21lmUtON5NgvQ7kt7R4gr1CkBD3pIZsZ7s3yej3QVyFlTPsSLVFFwdOu2JWH
         KX4w==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id s186si907401ywd.679.2018.01.26.05.16.19
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 26 Jan 2018 05:16:19 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:54853 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ef3re-0006an-Q3
	for alex.bennee@linaro.org; Fri, 26 Jan 2018 08:16:18 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:44225)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1ef3nk-0002gv-42
	for qemu-arm@nongnu.org; Fri, 26 Jan 2018 08:12:17 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1ef3nh-0005Hi-V1
	for qemu-arm@nongnu.org; Fri, 26 Jan 2018 08:12:16 -0500
Received: from mx1.redhat.com ([209.132.183.28]:50156)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <ehabkost@redhat.com>)
	id 1ef3nh-0005Gu-Kf; Fri, 26 Jan 2018 08:12:13 -0500
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id AF0DDC03E841;
	Fri, 26 Jan 2018 10:42:49 +0000 (UTC)
Received: from localhost (ovpn-116-57.gru2.redhat.com [10.97.116.57])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 414E15C269;
	Fri, 26 Jan 2018 10:42:49 +0000 (UTC)
Date: Fri, 26 Jan 2018 08:42:47 -0200
From: Eduardo Habkost <ehabkost@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Message-ID: <20180126104247.GF25150@localhost.localdomain>
References: <1512670493-18114-1-git-send-email-peter.maydell@linaro.org>
	<CAFEAcA-UO5Y_ACSZ2EEQEzgy30wdfEm3u8wUrBrXWaQaE_v+Kw@mail.gmail.com>
	<20171209010811.GJ3037@localhost.localdomain>
	<CAFEAcA9oG=+mJ+jSGTM_z54S09gjHoFowDkOvofdkhJd+g3=Cw@mail.gmail.com>
	<20180122183301.GA31237@localhost.localdomain>
	<CAFEAcA8pGXMs3hMxSs-t7qGfeR__H-CQ1roRVe5NFMCP8R2vjw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAFEAcA8pGXMs3hMxSs-t7qGfeR__H-CQ1roRVe5NFMCP8R2vjw@mail.gmail.com>
X-Fnord: you can see the fnord
User-Agent: Mutt/1.9.1 (2017-09-22)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.31]);
	Fri, 26 Jan 2018 10:42:49 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [PATCH 0/6] arm: support -cpu max (and
 gic-version=max)
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
	"patches@linaro.org" <patches@linaro.org>,
	"Richard W . M . Jones" <rjones@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: nvcf24zRBkVx

On Thu, Jan 25, 2018 at 02:41:50PM +0000, Peter Maydell wrote:
> On 22 January 2018 at 18:33, Eduardo Habkost <ehabkost@redhat.com> wrote:
> > About QOM type names:
> >
> > On x86, all CPU models are resolved to "<model>-<suffix>", and
> > i386 and x86_64 have different suffixes.  So the QOM type name is
> > "max-x86_64-cpu" on qemu-system-x86_64, and "max-i386-cpu" on
> > qemu-system-i386.
> 
> OK. Looking at the target/arm code we do a similar suffix
> trick, but we seem to have cut-n-pasted the handling in
> aarch64_cpu_register(), so it uses the TYPE_ARM_CPU as the
> suffix, rather the TYPE_AARCH64_CPU.
> 
> Am I right in thinking that we can fix this (changing the
> QOM type names for all the aarch64 CPUs) without breaking
> migration? (I guess I can just test this easily enough.)

This is not supposed to affect migration (at least it didn't when
we introduced per-cpu-model subclasses), but it's a good idea to
test it anyway.  It might break other code that tries to extract
info from the class names.


> 
> If we did that then we'd have, like x86, "max-arm-cpu" in
> the qemu-system-arm binary, and "max-aarch64-cpu" in
> the qemu-system-aarch64 binary.
> 
> Does x86 provide a way to say "give me the max-i386-cpu"
> in the qemu-system-x86_64 binary ?

No, the *-i386-cpu classes aren't even compiled in on
qemu-system-x86_64.

> 
> > About how it should behave:
> >
> > An important expectation about "max" is about the
> > query-cpu-model-expansion return value.  Having a property set to
> > true on the return value of "query-cpu-model-expansion model=max"
> > means the corresponding feature is supported on the current host
> > and can be enabled on the command-line.
> 
> On Arm when I try to use this I get:
> { "execute": "query-cpu-model-expansion", "arguments": { "type":
> "static", "model": { "model": { "name": "max" } } } }
> {
>     "error": {
>         "class": "CommandNotFound",
>         "desc": "The command query-cpu-model-expansion has not been found"
>     }
> }
> 
> It looks like we only implement this QMP API for x86 and S390
> (via #ifdeffery in monitor.c).
> 
> I'm not sure if we actually support command line setting/unsetting
> of features for Arm CPUs -- is there a command line option to
> get QEMU to print the features it thinks can be set this way?

Unfortunately -cpu command-line parsing is still a mess (we
currently have lots of arch-specific parsing hooks).  Once we
make this uniform across targets, we could make "-cpu ?" print
all known properties.

But you can look at the list of QOM properties for your CPU
classes (-cpu options are simply translated to QOM properties).
e.g.:

  (QEMU) device-list-properties typename=pxa270-a0-arm-cpu
  {"return": [{"type": "uint32", "name": "midr"}, {"type": "uint64", "name": "mp-affinity"}, {"type": "child<irq>", "name": "unnamed-gpio-in[0]"}, {"type": "uint32", "name": "psci-conduit"}, {"type": "bool", "name": "reset-hivecs"}, {"type": "link<qemu:memory-region>", "name": "memory"}, {"type": "link<irq>", "name": "unnamed-gpio-out[2]"}, {"type": "link<irq>", "name": "unnamed-gpio-out[3]"}, {"type": "int32", "name": "node-id"}, {"type": "bool", "name": "start-powered-off"}, {"type": "link<irq>", "name": "unnamed-gpio-out[1]"}, {"type": "link<irq>", "name": "unnamed-gpio-out[0]"}, {"type": "link<irq>", "name": "gicv3-maintenance-interrupt[0]"}, {"type": "bool", "name": "cfgend"}, {"type": "child<irq>", "name": "unnamed-gpio-in[2]"}, {"type": "child<irq>", "name": "unnamed-gpio-in[3]"}, {"type": "child<irq>", "name": "unnamed-gpio-in[1]"}]}



> 
> >> (The code in this patchset makes '-cpu max' give the same
> >> QOM type name for both qemu-system-arm and qemu-system-aarch64,
> >> with different behaviour depending on the binary. If that means
> >> we don't provide the same behaviour as x86 then I can change that,
> >> but I'm not sure where the difference is exposed to the user?)
> >
> > This is not how the QOM names work on x86, but I don't think QOM
> > type names choices have important user-visible side-effects
> > today.  Choosing unique QOM type names is more important to make
> > the code future-proof for when we merge QEMU binaries, than to
> > make user-visible behavior consistent.
> 
> Good point -- assuming it doesn't break migration I can fix
> the aarch64 types to use the right suffix string and then they'll
> have different QOM type names.
> 
> thanks
> -- PMM

-- 
Eduardo
