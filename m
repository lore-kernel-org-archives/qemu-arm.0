Received: by 2002:a17:505:d21:b0:1be9:327d:8ee3 with SMTP id vh1csp862356njb;
        Wed, 8 Jan 2025 06:03:11 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCV/ZWk+qGx48PfixrcEWgh5gXzLLbWOvtXXUaUwQxN/bsb7dPsKyd+U8Nc4lkpI4GY/qzfT25va9XjtAg==@linaro.org
X-Google-Smtp-Source: AGHT+IGWlFrtWQzgVDi1B7QmTz2y1089UIiIl0t0WDeuP6hl4ZrZh2HJz9g6hR1KrJXWH6cO5gG5
X-Received: by 2002:a05:6000:710:b0:385:e0d6:fb73 with SMTP id ffacd0b85a97d-38a872da4ccmr2413968f8f.15.1736344990557;
        Wed, 08 Jan 2025 06:03:10 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1736344990; cv=none;
        d=google.com; s=arc-20240605;
        b=C48pq8rWpo5N46o/7lgpwFARRpd32sgB67YGnddvhUI4BgIU40v5r9ZZI9RocD0Cn2
         DC+bwlw0PVPFLpa2/anVEvdQ3S5H73mD7Qd+ULMhSmQOat7JpV5QLh7h3ztzg+QWcP8G
         TaQ7FE/zJ3AbL2+KnVt0SLkO4QQ1Beu8K3vnAVC9E0iZLyRsqpSI7Dbai8F0T7s5JTlh
         91IIrmDwlxxsCquEPLy2nrSWOZ61P6rXoJl07qkKSOqKbKOXJ8G4OvUfL7YNNjIBBsX/
         q/hNoUvUwGXQQm/8T4kl1BfTk2wLz4/ZjhNDKrbuIsyhYao4q+TcmS7S9qj0/mGoAsjg
         il2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:in-reply-to:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :dkim-signature;
        bh=E6jJe8yXIHBeeef6GjObc81Y2a9IYh+ijGCPoh9KBPw=;
        fh=awV7+ozLYNdzildpnkrze8DhIwgtXCuu/8kYHnAhhfc=;
        b=FsafBiidc/wPxh6qolaeDQ10wrFrPF5rEatGeLbjFxdP3GA7XFXwMgpJik45DEIVDp
         5ameeageN95ro5zxsymvE2Rk8ZcqJuHQgdfLszeB8Wq7eJJ0/aTKUsAv1/a1cZDIdQv2
         qlpUGVbrTVTFLZeCsuuJC6wZROwfWcED/zSFnZR3iTYsRk52U8Ht3An358DWmIvGTCw/
         mJtYBydesP4+1G78NF7Oxh+I+hf/pXlotEG3fS+BKmDWpW2dhxhJa0WnyfBPL7gBKKP+
         Gdq8D0huJOAkmGOGLNttriDiDg/2Fa+a9yi+tQ9jq2FSG7DvnRp6+43Td9d+YnA9AjLa
         387w==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="QQrNY/MF";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ffacd0b85a97d-38a1c8b89adsi26659094f8f.374.2025.01.08.06.03.10
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 08 Jan 2025 06:03:10 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="QQrNY/MF";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tVWe7-00008a-Qe; Wed, 08 Jan 2025 09:02:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1tVWe5-00007s-FC
 for qemu-arm@nongnu.org; Wed, 08 Jan 2025 09:02:53 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1tVWe2-0000Ew-R8
 for qemu-arm@nongnu.org; Wed, 08 Jan 2025 09:02:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1736344969;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=E6jJe8yXIHBeeef6GjObc81Y2a9IYh+ijGCPoh9KBPw=;
 b=QQrNY/MFFqnkRJxV0jD099grhNcqEHvaNBlp1hH6Q+NHn6xihnmDSU5/gxdKi8aef4IQ8b
 60TD1dMeeOV1Y7THIegpdtEkXNz9b7hANi8ullKTFQm2BAyIO1pc/I1cK8qmUK2252rk7/
 TfzHwY8B3hbAi7MO46Q3m6YMMT7gmkQ=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-258-TcJFhFaXMOm8GiFLFXV21A-1; Wed,
 08 Jan 2025 09:02:45 -0500
X-MC-Unique: TcJFhFaXMOm8GiFLFXV21A-1
X-Mimecast-MFC-AGG-ID: TcJFhFaXMOm8GiFLFXV21A
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 3B1A21955E80; Wed,  8 Jan 2025 14:02:18 +0000 (UTC)
Received: from dobby.home.kraxel.org (unknown [10.39.192.243])
 by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 740F3300018D; Wed,  8 Jan 2025 14:02:17 +0000 (UTC)
Received: by dobby.home.kraxel.org (Postfix, from userid 1000)
 id CF1EE2CDE95; Wed, 08 Jan 2025 15:02:14 +0100 (CET)
Date: Wed, 8 Jan 2025 15:02:14 +0100
From: Gerd Hoffmann <kraxel@redhat.com>
To: =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>
Cc: qemu-devel@nongnu.org, graf@amazon.com, 
 Paolo Bonzini <pbonzini@redhat.com>, Michael Roth <michael.roth@amd.com>, 
 Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>, 
 Thomas Huth <thuth@redhat.com>, qemu-arm@nongnu.org,
 Eric Blake <eblake@redhat.com>, 
 Peter Maydell <peter.maydell@linaro.org>, Markus Armbruster <armbru@redhat.com>
Subject: Re: [PATCH v2 00/21] hw/uefi: add uefi variable service
Message-ID: <r574aim43uwh7qhfkvifcy3hmim4xpbxxi5eedl7iglrtxvirf@c3rddfvmihpz>
References: <20250107153353.1144978-1-kraxel@redhat.com>
 <CAMxuvazrd+3v2qqO-5o3qpky-ULRTwvU48jkwdxMPZG5c1RA1A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMxuvazrd+3v2qqO-5o3qpky-ULRTwvU48jkwdxMPZG5c1RA1A@mail.gmail.com>
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.432,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: Y+rfFc74tnlC

  Hi,

> > The design idea is to reuse the request serialization protocol edk2 uses
> 
> I suppose this is a stable protocol. (some parts are set by the UEFI
> spec probably)

Partly yes, partly this is edk2-internal stuff.  In theory there is some
freedom to change the internal parts, in practice I have not seen this
changing in incompatible ways to far.

> There doesn't seem to be a defined way to query either side version or
> capability, I suppose this could be added later assuming an initial
> behaviour/magic etc.

There is a 'magic' device register, so should the need arise there is
the option to define a new magic cookie for incompatible changes.

> > A edk2 test branch can be found here (build with "-D QEMU_VARS=TRUE").
> > https://github.com/kraxel/edk2/commits/devel/secure-boot-external-vars
> 
> ok, perhaps it would be nice to have some basic unit tests in qemu
> too. Almost none of this new code is exercised by the qemu tests yet.

I have some unit tests, they are using edk2 though.  So having unit
tests right from the start is somewhat difficult.  I don't feel like
re-implementing the guest side of the serialization protocol for the
qemu unit tests.

Once the edk2 changes have landed in a edk2 stable tag and qemu bundled
firmware has been updated it should be relatively easy to add those
tests to qemu.  With updated edk2 firmware we can also add some
end-to-end testing such as booting a fedora cloud image with secure boot
turned on.

take care,
  Gerd

