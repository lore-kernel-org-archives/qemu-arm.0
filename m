Received: by 2002:a05:6512:3aa:0:0:0:0 with SMTP id v10csp1513572lfp;
        Tue, 21 Jan 2020 06:04:14 -0800 (PST)
X-Google-Smtp-Source: APXvYqzKp1a/fpv+DJNgX4X8dvfxc6BZ/hzCip6KBWAwHmIGBusTqVItOy5lohJL7ibIyeEvhz3C
X-Received: by 2002:aca:c509:: with SMTP id v9mr2943795oif.151.1579615454104;
        Tue, 21 Jan 2020 06:04:14 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1579615454; cv=none;
        d=google.com; s=arc-20160816;
        b=GBRbZ4f8NIeDBddp+zPM74BdZoehHjB2vs6VBzzXOPjEO8UnWXBSU3JfbhdzCrvOZP
         XQallgdrfQmTK9Z7WKD4LJqtk47YkW5ASdfSEcXy4rEe1YlVcBjvY6qwXMjCHJOiIkAh
         204F5CvwrFsry+risnyrwRvZwuvJwdzndGUyoTkmsB5UlrO5b3WDKFHCqe8UZHc9mAED
         HGoU1ebkh7RVJ/+59qS7fEx2CD9CGAtcAU0JyzLCxdMa+N2+6jMIkwZaC1BYTHWd/p7w
         V0ybQeI4JVp99Pbh9nRuLgyRavvVbPoER2rDqI6uTfYIQCFNhoxjmBL1Cfq13lEjSRCD
         hwpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-id:precedence:sender:content-transfer-encoding:mime-version
         :organization:references:in-reply-to:message-id:subject:cc:to:from
         :date:dkim-signature;
        bh=1yewETrp0bx5dCOhPi4FrNd4A1wPaHg/+rWGjLZ7t5k=;
        b=erTHta4/3UvKwrPYTgBk8oIciDqHY4ysSAXcKTKQxV0qE6rGe2TTKxj7SMysRPEKml
         OqiZoi/sbi0aYgqZ81XefktPIMZyd7Y0aGEENJnxxsgsyRUjzeA8eu6UJoDENKp3H2VX
         DtmmQBxFcH4sUDAeYne93mooZkuqPbB/B8za6lTpPvouy+RGqq1zIdPJTPiGXyWYSVbW
         1cSKUggccqsOAxI9ENpdA8K9ZvIhZqvu9Z5L4KAygkR0rh+BhUBnic0UuFLBYpp4Hyqv
         bqsFH5P8IwKRQ5WnAeDL7kuAXgmMZDvshKWqcF4gbyMVlf8+RQBJTjuEhBMQuQWbgL1y
         lEhg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=ZJE0lCnM;
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <kvm-owner@vger.kernel.org>
Received: from vger.kernel.org (vger.kernel.org. [209.132.180.67])
        by mx.google.com with ESMTP id g14si21143704otj.10.2020.01.21.06.04.13;
        Tue, 21 Jan 2020 06:04:14 -0800 (PST)
Received-SPF: pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) client-ip=209.132.180.67;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=ZJE0lCnM;
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728927AbgAUOEM (ORCPT <rfc822;daniel.diaz@linaro.org>
        + 4 others); Tue, 21 Jan 2020 09:04:12 -0500
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:58506 "EHLO
        us-smtp-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1728896AbgAUOEM (ORCPT <rfc822;kvm@vger.kernel.org>);
        Tue, 21 Jan 2020 09:04:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1579615451;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=1yewETrp0bx5dCOhPi4FrNd4A1wPaHg/+rWGjLZ7t5k=;
        b=ZJE0lCnMQ7FLZ16YDjNXDPKL13sK29oOloQ43fK9dLTiW3OXgk89KwXsNcZgiPYCu5f9ex
        lGwRV7/i+mO9GooiTJVb/gEHbyxxLQ+5GTE6yON5nBESyQICe2dJbldiPiqD8XvuoaD5SN
        UCTWdmlVSRa9UyX/knfx1g32xEv7O94=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-198-Q1TTmX2CM7ifNImeokplPw-1; Tue, 21 Jan 2020 09:04:09 -0500
X-MC-Unique: Q1TTmX2CM7ifNImeokplPw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 82ABD8010D6;
        Tue, 21 Jan 2020 14:04:07 +0000 (UTC)
Received: from gondolin (dhcp-192-195.str.redhat.com [10.33.192.195])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 945C08BE1E;
        Tue, 21 Jan 2020 14:04:00 +0000 (UTC)
Date:   Tue, 21 Jan 2020 15:03:58 +0100
From:   Cornelia Huck <cohuck@redhat.com>
To:     Philippe =?UTF-8?B?TWF0aGlldS1EYXVkw6k=?= <philmd@redhat.com>
Cc:     qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
        Marcelo Tosatti <mtosatti@redhat.com>,
        David Gibson <david@gibson.dropbear.id.au>,
        qemu-s390x@nongnu.org, David Hildenbrand <david@redhat.com>,
        qemu-ppc@nongnu.org, Eduardo Habkost <ehabkost@redhat.com>,
        Like Xu <like.xu@linux.intel.com>,
        Markus Armbruster <armbru@redhat.com>, qemu-arm@nongnu.org,
        Paolo Bonzini <pbonzini@redhat.com>,
        Richard Henderson <rth@twiddle.net>,
        Alistair Francis <alistair.francis@wdc.com>,
        kvm@vger.kernel.org (open list:Overall KVM CPUs)
Subject: Re: [PATCH v2 09/10] accel: Replace current_machine->accelerator by
 current_accel() wrapper
Message-ID: <20200121150358.63e5095b.cohuck@redhat.com>
In-Reply-To: <20200121110349.25842-10-philmd@redhat.com>
References: <20200121110349.25842-1-philmd@redhat.com>
        <20200121110349.25842-10-philmd@redhat.com>
Organization: Red Hat GmbH
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Sender: kvm-owner@vger.kernel.org
Precedence: bulk
List-ID: <kvm.vger.kernel.org>
X-Mailing-List: kvm@vger.kernel.org
X-TUID: ImtOGUKfDHpk

On Tue, 21 Jan 2020 12:03:48 +0100
Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com> wrote:

> We actually want to access the accelerator, not the machine, so
> use the current_accel() wrapper instead.
>=20
> Suggested-by: Paolo Bonzini <pbonzini@redhat.com>
> Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> ---
> v2:
> - Reworded description
> - Remove unused include in arm/kvm64
> ---
>  accel/kvm/kvm-all.c | 4 ++--
>  accel/tcg/tcg-all.c | 2 +-
>  memory.c            | 2 +-
>  target/arm/kvm64.c  | 5 ++---
>  target/i386/kvm.c   | 2 +-
>  target/ppc/kvm.c    | 2 +-
>  vl.c                | 2 +-
>  7 files changed, 9 insertions(+), 10 deletions(-)

> diff --git a/target/ppc/kvm.c b/target/ppc/kvm.c
> index b5799e62b4..45ede6b6d9 100644
> --- a/target/ppc/kvm.c
> +++ b/target/ppc/kvm.c
> @@ -258,7 +258,7 @@ static void kvm_get_smmu_info(struct kvm_ppc_smmu_inf=
o *info, Error **errp)
> =20
>  struct ppc_radix_page_info *kvm_get_radix_page_info(void)
>  {
> -    KVMState *s =3D KVM_STATE(current_machine->accelerator);
> +    KVMState *s =3D KVM_STATE(current_accel());
>      struct ppc_radix_page_info *radix_page_info;
>      struct kvm_ppc_rmmu_info rmmu_info;
>      int i;

What about the usage in kvmppc_svm_off()?
