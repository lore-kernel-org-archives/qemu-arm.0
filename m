Received: by 2002:adf:b2b8:0:0:0:0:0 with SMTP id g53-v6csp4135733wrd;
        Mon, 17 Sep 2018 09:31:10 -0700 (PDT)
X-Google-Smtp-Source: ANB0VdaZKCCcIM7n7BWIjFSjpwq4arxfPJGQ0Cv3K1WH5XS0/mC17KGvx2eWB4bQIMpJxBfV0Nnd
X-Received: by 2002:a63:5e45:: with SMTP id s66-v6mr24042803pgb.151.1537201870493;
        Mon, 17 Sep 2018 09:31:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1537201870; cv=none;
        d=google.com; s=arc-20160816;
        b=mSuyvAAdAZl4FtYVTqGVFLE9IeWpJCfTb3T7RvMkmkpnFU8Y4G1aGHkWedi2CSHXJe
         b7L2lSkxIYnPCcAZgtE4n4oh7b1iUhYCHbOEfradpL4GDv8Mn1D/0lZpI7N/0LHVsJBE
         UNFtDrv3q9JthNLphBGMJQEHykjXnd8CqZk/bpbfnjM9Dpy7dHQ7qTItQBU9H+iJc33N
         rrinX7AKmMKJLVjMQRJPhL3RPWfXGfRMuqRlIyR8g5brEt8EzXVybJTgdeippNa6PjHv
         2reNGE78g1jRpAc5qKM1VXh8JiqXwmVegzHeVD5L65ygEgQhqsUHOfkVSgkua30YbOhR
         cNaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-id:precedence:sender:message-id:date:subject:cc:to:from
         :dkim-signature:dkim-signature;
        bh=nlsoG9m8yGUSHTs1R/APkFMFm0M3YeBhPrB3nO6/i7o=;
        b=b5T4MC3lpKdZORllYU8ZdT4UkKlPfGrOhi+ECJMdp+M2M6tGX2+7SofO7bAvuVmSCO
         7z0ueuSiIlGKU2F9xXXcgwW0kWirnlmsXEeSudt6NWg6oA1rfm/sRSeetBQ9tADu11d7
         F56P8pjtvWqxDfBeq8spUJ2rmch8MbqIygGuOP/A3c1uCwHgH22AWax5NjerqX+pFmC0
         CK3H3xL4z2CPVzcL4+TJo4SSnHD/tUzUrAyVO5HfWYO1g9/F48fUrIsDM8tHRu72UqAc
         HQciLWDr+TQiQVkGGyR8VqFXExBEZ6drLwrtE5mePP+W9zhE19XWgX4eOgVt1MAqOhqQ
         QJNQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@braap.org header.s=mesmtp header.b=z6ufFDuz;
       dkim=pass header.i=@messagingengine.com header.s=fm3 header.b=Iq17SxsE;
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org
Return-Path: <kvm-owner@vger.kernel.org>
Received: from vger.kernel.org (vger.kernel.org. [209.132.180.67])
        by mx.google.com with ESMTP id 184-v6si15838464pgi.614.2018.09.17.09.31.10;
        Mon, 17 Sep 2018 09:31:10 -0700 (PDT)
Received-SPF: pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) client-ip=209.132.180.67;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@braap.org header.s=mesmtp header.b=z6ufFDuz;
       dkim=pass header.i=@messagingengine.com header.s=fm3 header.b=Iq17SxsE;
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728437AbeIQV7N (ORCPT <rfc822;francois.ozog@linaro.org>
        + 4 others); Mon, 17 Sep 2018 17:59:13 -0400
Received: from out1-smtp.messagingengine.com ([66.111.4.25]:53405 "EHLO
        out1-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728016AbeIQV7N (ORCPT
        <rfc822;kvm@vger.kernel.org>); Mon, 17 Sep 2018 17:59:13 -0400
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
        by mailout.nyi.internal (Postfix) with ESMTP id 0F8F221B7F;
        Mon, 17 Sep 2018 12:31:07 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute4.internal (MEProxy); Mon, 17 Sep 2018 12:31:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=braap.org; h=cc
        :date:from:message-id:subject:to:x-me-sender:x-me-sender
        :x-sasl-enc; s=mesmtp; bh=nlsoG9m8yGUSHTs1R/APkFMFm0M3YeBhPrB3nO
        6/i7o=; b=z6ufFDuzBOoy0aqrHOrpcyBfkirCFRko9MBPbHLpsSX9ivxDSRF2yq
        fX3IgDbnQ7BtoZI5R+k1RoUuMYQiAisMZCD9AxPgLpZbsIygF0O03gRNVeZ48HKF
        SerSSx0HxiATtcHE799LcL5TWRY4+ACnJhf+DfXmTjE5zU4FGzrEU=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:date:from:message-id:subject:to
        :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=nlsoG9m8yGUSHTs1R
        /APkFMFm0M3YeBhPrB3nO6/i7o=; b=Iq17SxsEd59oh1sMRPfo3p8PQxxgxSO8t
        HthgrGRVQVMdcDgPyPSb0a2H+I5K/4wFrlK95yV0h1axRjLKM7frY+gMAqWZEicy
        oNzDl/hUmP0Cr9DRG0Nb8YBJnVD53JN0KDP/lVfIMtSv/v86lPJwmo0bNKW985R6
        5f+knQD8ba/wpe2YnYUD2PyQGl5JT3KTRlbN5gGbECff2DOt2C+qrfynZ6vLcCU3
        YslcZkOzEGG3pvyw2Yy1EO2z8/hOetPhs4tGBSPGoKxNxurwWgB3NHEdgXNqJm0p
        kJ1JvZHSAbNcfSTZTmGnKjJSR+R/PIjTlL+J51ShP+C+ZNvmPtUug==
X-ME-Proxy: <xmx:yNafW11P5RjPGRc0yjg0KM5bCtl1PSS46EcohZpoBTmbWaLYcDbpow>
    <xmx:yNafWwAYYwpfuKt4i6QFIN9oGCD9vH7igl7jUWzzFkKhqwyijonFeQ>
    <xmx:yNafW6fut5c-ddOWmgMEPEjvCXyo8fU_DczUHDmXr5iEjJkahFvRWA>
    <xmx:yNafW6ywVMP3eYc0v3Pr-HNMx1zYFErG9Z4c_8r6StH8idMiJdCqpQ>
    <xmx:yNafW9MePV1eYjd6ZzZiWf5HglII59J_saZ2WA_OH_EWOGbwiF6MAg>
    <xmx:y9afW-jnriYd1lOXNjWieFCePMUclvTz72qjh3nJ--NBx2qUwNh1_w>
X-ME-Sender: <xms:yNafW5-EFxEvqcYhbsnzJVkKyetq_mAmv-Do-DYiVl7ewJDyDoXK1w>
Received: from localhost (flamenco.cs.columbia.edu [128.59.20.216])
        by mail.messagingengine.com (Postfix) with ESMTPA id 43331E414C;
        Mon, 17 Sep 2018 12:31:04 -0400 (EDT)
From:   "Emilio G. Cota" <cota@braap.org>
To:     qemu-devel@nongnu.org
Cc:     Paolo Bonzini <pbonzini@redhat.com>,
        Aleksandar Markovic <amarkovic@wavecomp.com>,
        Alexander Graf <agraf@suse.de>,
        Anthony Green <green@moxielogic.com>,
        Artyom Tarasenko <atar4qemu@gmail.com>,
        Aurelien Jarno <aurelien@aurel32.net>,
        Christian Borntraeger <borntraeger@de.ibm.com>,
        Chris Wulff <crwulff@gmail.com>,
        Cornelia Huck <cohuck@redhat.com>,
        David Gibson <david@gibson.dropbear.id.au>,
        David Hildenbrand <david@redhat.com>,
        "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
        Eduardo Habkost <ehabkost@redhat.com>,
        Guan Xuetao <gxt@mprc.pku.edu.cn>,
        James Hogan <jhogan@kernel.org>, kvm@vger.kernel.org,
        Laurent Vivier <laurent@vivier.eu>,
        Marcelo Tosatti <mtosatti@redhat.com>,
        Marek Vasut <marex@denx.de>,
        Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
        Michael Walle <michael@walle.cc>,
        Peter Crosthwaite <crosthwaite.peter@gmail.com>,
        Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
        qemu-ppc@nongnu.org, qemu-s390x@nongnu.org,
        Richard Henderson <rth@twiddle.net>,
        Stafford Horne <shorne@gmail.com>
Subject: [PATCH 00/35] exec: drop BQL from interrupt handling
Date:   Mon, 17 Sep 2018 12:30:28 -0400
Message-Id: <20180917163103.6113-1-cota@braap.org>
X-Mailer: git-send-email 2.17.1
Sender: kvm-owner@vger.kernel.org
Precedence: bulk
List-ID: <kvm.vger.kernel.org>
X-Mailing-List: kvm@vger.kernel.org
X-TUID: 6KTOb7tBVqd4

This series comes originally from a series of patches that Paolo
sent to me a long time ago. I have kept most of his S-o-b tags,
but I have done the forward port of the patches to the current
QEMU code base, so please blame all possible bugs on me, not him.

The goal of this series is to push the BQL out of interrupt
handling wherever possible. Many targets do not need the BQL
to handle interrupts, so for those targets we get rid of the
BQL in interrupt handling. In TCG mode, this by itself does
not yield measurable performance gains. However, it is a
necessary first step before tackling BQL contention when
managing CPU states (i.e. exiting the exec loop always
involves taking the BQL, which does not scale).

The patches:

- Patch 0 accesses icount_decr.u16 consistently with atomics.
  This is important because we use it across threads to signal
  that an interrupt is pending.

- 2-28: convert direct callers of cpu->interrupt_request
  to use atomic accesses or CPU helper functions that use atomics.
  I have broken these up into individual patches to ease review.
  Note that in some cases I have added many atomic_reads, most
  of which are probably unnecessary. However, I'd leave this up
  to the maintainers, since I do not want to break things by
  doing a single atomic_read(&cpu->interrupt_request) at the
  beginning of a function and then miss subsequent updates to
  cpu->interrupt_request.

- 29-31: drop the BQL requirement when handling cpu->interrupt_request

- 32-33: drop now unnecessary BQL acquisitions in i386 and ppc

- 34-35: push down the BQL acquisition to cpu->do_interrupt
  and cpu->cpu_exec_interrupt. Here I am Cc'ing everyone so that
  we can make sure I am not missing any target that requires
  the BQL on either do_interrupt or cpu_exec_interrupt.

This series is checkpatch-clean, and can be fetched from:
  https://github.com/cota/qemu/tree/cpu-lock

Note that the series applies on top of patches that are
already on the qemu-devel list and will hopefully soon
be upstream. This series begins after commit
4ece0cbd74 ("cpus: access .qemu_icount_bias with atomic64")
in that tree.

Thanks,

		Emilio
