Received: by 2002:a19:ee12:0:0:0:0:0 with SMTP id g18csp2739504lfb;
        Wed, 8 Jun 2022 03:15:01 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxKvm73Tgx7Vm6DejxvcqUT6qjUVpY4w7LHyKNmL4qPUN11xTImykByEL/U+WeSR1xRxY16
X-Received: by 2002:a05:622a:15c4:b0:304:d9e7:786c with SMTP id d4-20020a05622a15c400b00304d9e7786cmr23604985qty.114.1654683301152;
        Wed, 08 Jun 2022 03:15:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1654683301; cv=none;
        d=google.com; s=arc-20160816;
        b=fCBSrgmRhgyB40ZGPgRIwVt2bE2YSB5PVjjxx6mi1yEB6Ls/N2lzid5MDmtZ84putk
         mhebtN8DU6DD7mah1jGYyT9NaW7Yt1Jjb7M9bZ+zBFV0YmEcw/Wto1ELCLc7grxtrXYY
         CEgHv5DmJ6Uee26TE6eEaB43Hiz+cFbH8fKUQnVW/tjFX1FIBqzPfAT12Hg8skPUFUxN
         UhztzoBdhhdF+AsAn+l6WjUZKl0AnEqvJSxPdDC2t12e7jhnVDHobxPetk1TILp2LCw1
         oWfNR83W1IkFjPE0Jom/MaMt06uvf5y+z9lTJ8ZT6dZjM+k4yOirR7ET333btZKU7Xls
         M2qQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:mime-version:message-id:date
         :user-agent:references:organization:in-reply-to:subject:cc:to:from
         :dkim-signature;
        bh=7fZ7puPZpMBdW0QRh/AoLSh/CTVqI79nWjIG/nQXq24=;
        b=j5Tdb60ZK4AHHV8f432mX6LMkI7j7bP0kB/lr8wO8qzlNGVPqTOQkw/6Wa5Ad+wWtV
         gh6nJmsD8+oqPLMSRAaSXEL2y8vl9HOQQsTROmwYwBb2nSwDFMTtSHqDKWvdX2IPoLkl
         5MkW6Fr7uoAxOh237nYnZnABx3Qm3JoTJuOScYxJscZQ1chIqhjw+knZJiOQ1y9JXgVU
         dzljJDCeLVeg1QhlOMIlrhbs6w+jYi+2G2HhJJik+JhJutowiaxnjet48mSEetjaHWWA
         ItmQbVce1MBttTKYdi/eqncYQe2E0mbdZKF6Tw5z4b0y1rY5VWMre2oaLDbkaO6vuqlC
         2WqA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=cT7uepmN;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f71-20020a379c4a000000b006a6af73de9esi5598264qke.591.2022.06.08.03.15.00
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 08 Jun 2022 03:15:01 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=cT7uepmN;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:49364 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nysiK-0004JA-J9
	for alex.bennee@linaro.org; Wed, 08 Jun 2022 06:15:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55458)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1nyshw-0004Iq-FK
 for qemu-arm@nongnu.org; Wed, 08 Jun 2022 06:14:36 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:59009)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1nysht-0005Ff-PO
 for qemu-arm@nongnu.org; Wed, 08 Jun 2022 06:14:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1654683271;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=7fZ7puPZpMBdW0QRh/AoLSh/CTVqI79nWjIG/nQXq24=;
 b=cT7uepmNVG4YJNdKMheB3bvJj4CkwC8RsfXI+2dJZLe26lBjLbTy2GWF5ftePkqx15Erwa
 s001xJqUgYjM58Lvy2TP8nbYhZGrhD70hXadQrBgSnb0ulZydZQYL71Mpm7mT9PyJH21K4
 8LhL4+LL5XWsK/mO45fCt7KuEpLXEz0=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-557-rHi4lKVoONyeemPiAAYtGA-1; Wed, 08 Jun 2022 06:14:28 -0400
X-MC-Unique: rHi4lKVoONyeemPiAAYtGA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 07AA7801756;
 Wed,  8 Jun 2022 10:14:28 +0000 (UTC)
Received: from localhost (unknown [10.39.192.245])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B2692400F3FF;
 Wed,  8 Jun 2022 10:14:27 +0000 (UTC)
From: Cornelia Huck <cohuck@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth
 <thuth@redhat.com>, Laurent Vivier <lvivier@redhat.com>, Haibo Xu
 <haibo.xu@linaro.org>
Cc: Andrew Jones <drjones@redhat.com>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org, kvm@vger.kernel.org
Subject: Re: [PATCH RFC 0/2] arm: enable MTE for QEMU + kvm
In-Reply-To: <20220512131146.78457-1-cohuck@redhat.com>
Organization: Red Hat GmbH
References: <20220512131146.78457-1-cohuck@redhat.com>
User-Agent: Notmuch/0.36 (https://notmuchmail.org)
Date: Wed, 08 Jun 2022 12:14:26 +0200
Message-ID: <87zgina2d9.fsf@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
Received-SPF: pass client-ip=170.10.129.124; envelope-from=cohuck@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: sAZSza1yeSWh

On Thu, May 12 2022, Cornelia Huck <cohuck@redhat.com> wrote:

> This series enables MTE for kvm guests, if the kernel supports it.
> Lightly tested while running under the simulator (the arm64/mte/
> kselftests pass... if you wait patiently :)
>
> A new cpu property "mte" (defaulting to on if possible) is introduced;
> for tcg, you still need to enable mte at the machine as well.
>
> I've hacked up some very basic qtests; not entirely sure if I'm going
> about it the right way.
>
> Some things to look out for:
> - Migration is not (yet) supported. I added a migration blocker if we
>   enable mte in the kvm case. AFAIK, there isn't any hardware available
>   yet that allows mte + kvm to be used (I think the latest Gravitons
>   implement mte, but no bare metal instances seem to be available), so
>   that should not have any impact on real world usage.

...so it seems there was a series some time ago related to MTE +
migration, which my initial search somehow managed to avoid.

https://lore.kernel.org/all/CAJc+Z1FZxSYB_zJit4+0uTR-88VqQL+-01XNMSEfua-dXDy6Wg@mail.gmail.com/
talks about some kernel changes needed in order to support postcopy; has
there been any update, as my search fu might be failing me again?

> - I'm not at all sure about the interaction between the virt machine 'mte'
>   prop and the cpu 'mte' prop. To keep things working with tcg as before,
>   a not-specified mte for the cpu should simply give us a guest without
>   mte if it wasn't specified for the machine. However, mte on the cpu
>   without mte on the machine should probably generate an error, but I'm not
>   sure how to detect that without breaking the silent downgrade to preserve
>   existing behaviour.
> - As I'm still new to arm, please don't assume that I know what I'm doing :)
>
>
> Cornelia Huck (2):
>   arm/kvm: enable MTE if available
>   qtests/arm: add some mte tests
>
>  target/arm/cpu.c               | 18 +++-----
>  target/arm/cpu.h               |  4 ++
>  target/arm/cpu64.c             | 78 ++++++++++++++++++++++++++++++++++
>  target/arm/kvm64.c             |  5 +++
>  target/arm/kvm_arm.h           | 12 ++++++
>  target/arm/monitor.c           |  1 +
>  tests/qtest/arm-cpu-features.c | 31 ++++++++++++++
>  7 files changed, 137 insertions(+), 12 deletions(-)

