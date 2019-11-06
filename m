Received: by 2002:adf:db01:0:0:0:0:0 with SMTP id s1csp1093644wri;
        Wed, 6 Nov 2019 09:55:50 -0800 (PST)
X-Google-Smtp-Source: APXvYqyfkZA8shnJjDBy8FTh0eCAyGJZiANEI0pCLfjLBKm0ggO+zcMe9O89z7Fqx0t5yvabqkH7
X-Received: by 2002:a17:906:5859:: with SMTP id h25mr36405248ejs.2.1573062950922;
        Wed, 06 Nov 2019 09:55:50 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1573062950; cv=none;
        d=google.com; s=arc-20160816;
        b=ZV1nuZeiE5gjpXVJ3Dzbk3lB4iL24tgRhXtc6iONEMEx6pfk/n41oZpRFTIZjjMJb7
         HBCYetGAniGDDzR9x/zKzGJhiQ/eGCKRuZ/z2DTpyotzFcRbPEorBcw5kyRBON3gnnaz
         NL4TiV6HQ0we3yMP/KRBqxOoVWs1LTq33UVZ9kQL9OLymvIHrjU45qP4u0HTPY2/2XzY
         62ghFZ2zh1tn5S572mVlEoj0tSa9wA932pu4X8hA07XYVEv2o8A2E53e8BpVJTIcv7pT
         vl/SjSnX/xRh4aq6AqyLIfRfXsy8RqRtm6J8/7g0slxZcoRptZMptvtxXrfRSyJCn+s5
         PkDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:organization:references:in-reply-to:message-id:subject
         :to:from:date:dkim-signature;
        bh=q/sQyRgFw+9/RcW7NfVajRFE3P8eOjZF/FPFFSHK0fE=;
        b=dHvbHokUqQSPIvTCoUV28mVPKlctQFW96+pRNNoBsYHzriXrN2/TpYQsp/kKLhOwvP
         8zERk4pZxPpIxf6pBGk4pdvOuVKjgxsfPk9jVEpPwpyAtp24YPxSLs6v1jVO/A7ltyoq
         TUZDcUUZ2EKVlin1XTVpekAi75naHTQkY2tQzY8cOrmmhHQ2s/GrT9lCWnJpIIYMf5Pq
         GpEe3MiNcSiXVJVxZ1oAoDVEFMxFGXb/7xmut4y6pudfskelSMhJqEuqn7xb0AY4O66H
         E9d9GePp0yCydTgni3PjK7jTQIlc3W8bejWyjavyzc7dtJh5HxE9WYQfL0JXH/zZ6Sl1
         jZ4Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=MpVZAEuQ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id p20si14140864eju.109.2019.11.06.09.55.50
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 06 Nov 2019 09:55:50 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=MpVZAEuQ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:33876 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iSPX3-0004Nj-OR
	for alex.bennee@linaro.org; Wed, 06 Nov 2019 12:55:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51267)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <cohuck@redhat.com>) id 1iSPWs-0004LN-Aw
 for qemu-arm@nongnu.org; Wed, 06 Nov 2019 12:55:39 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <cohuck@redhat.com>) id 1iSPWr-0006yJ-6c
 for qemu-arm@nongnu.org; Wed, 06 Nov 2019 12:55:38 -0500
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:50776
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <cohuck@redhat.com>) id 1iSPWr-0006wF-3e
 for qemu-arm@nongnu.org; Wed, 06 Nov 2019 12:55:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1573062936;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=q/sQyRgFw+9/RcW7NfVajRFE3P8eOjZF/FPFFSHK0fE=;
 b=MpVZAEuQsiY/getVPNGCHxMtW/yTEtJKQkYoihm3x7zKF8XqmQoxsZdY3FSlCKPi+QnInT
 aB1ZuuB2fSBeNjZHyToqxor0yxAEOLa4D1qtDX1s0BpcY/3AxQhvKe8yVNpghJBv6/7HEI
 SMC9H66uequTqZaE/ust4bLqQgD05uA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-327-4s9pU-fJMAS0NcmNh66v8g-1; Wed, 06 Nov 2019 12:55:32 -0500
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4860E1005500;
 Wed,  6 Nov 2019 17:55:31 +0000 (UTC)
Received: from gondolin (dhcp-192-218.str.redhat.com [10.33.192.218])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D5DF85C240;
 Wed,  6 Nov 2019 17:55:26 +0000 (UTC)
Date: Wed, 6 Nov 2019 18:55:24 +0100
From: Cornelia Huck <cohuck@redhat.com>
To: Heyi Guo <guoheyi@huawei.com>
Subject: Re: [RFC v2 11/14] linux-headers/kvm.h: add capability to forward
 hypercall
Message-ID: <20191106185524.0fe51c50.cohuck@redhat.com>
In-Reply-To: <20191105091056.9541-12-guoheyi@huawei.com>
References: <20191105091056.9541-1-guoheyi@huawei.com>
 <20191105091056.9541-12-guoheyi@huawei.com>
Organization: Red Hat GmbH
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-MC-Unique: 4s9pU-fJMAS0NcmNh66v8g-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.81
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Mark Rutland <mark.rutland@arm.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Marc Zyngier <marc.zyngier@arm.com>,
 qemu-devel@nongnu.org, qemu-arm@nongnu.org, James Morse <james.morse@arm.com>,
 Paolo Bonzini <pbonzini@redhat.com>, wanghaibin.wang@huawei.com,
 Dave Martin <Dave.Martin@arm.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 9P2d3W2ONHO3

On Tue, 5 Nov 2019 17:10:53 +0800
Heyi Guo <guoheyi@huawei.com> wrote:

> To keep backward compatibility, we add new KVM capability
> "KVM_CAP_FORWARD_HYPERCALL" to probe whether KVM supports forwarding
> hypercall to userspace.
>=20
> The capability should be enabled explicitly, for we don't want user
> space application to deal with unexpected hypercall exits. After
> enabling this cap, all HVC calls unhandled by kvm will be forwarded to
> user space.
>=20
> Signed-off-by: Heyi Guo <guoheyi@huawei.com>
> Cc: Peter Maydell <peter.maydell@linaro.org>
> Cc: "Michael S. Tsirkin" <mst@redhat.com>
> Cc: Cornelia Huck <cohuck@redhat.com>
> Cc: Paolo Bonzini <pbonzini@redhat.com>
> Cc: Dave Martin <Dave.Martin@arm.com>
> Cc: Marc Zyngier <marc.zyngier@arm.com>
> Cc: Mark Rutland <mark.rutland@arm.com>
> Cc: James Morse <james.morse@arm.com>
> ---
>  linux-headers/linux/kvm.h |  1 +
>  target/arm/sdei.c         | 16 ++++++++++++++++
>  target/arm/sdei.h         |  2 ++
>  3 files changed, 19 insertions(+)
>=20
> diff --git a/linux-headers/linux/kvm.h b/linux-headers/linux/kvm.h
> index 3d9b18f7f8..36c9b3859f 100644
> --- a/linux-headers/linux/kvm.h
> +++ b/linux-headers/linux/kvm.h
> @@ -1000,6 +1000,7 @@ struct kvm_ppc_resize_hpt {
>  #define KVM_CAP_PMU_EVENT_FILTER 173
>  #define KVM_CAP_ARM_IRQ_LINE_LAYOUT_2 174
>  #define KVM_CAP_HYPERV_DIRECT_TLBFLUSH 175
> +#define KVM_CAP_FORWARD_HYPERCALL 176
> =20
>  #ifdef KVM_CAP_IRQ_ROUTING

Is this cap upstream already? I would have thought your header sync
would have brought it in, then. (Saying this, that header sync looks
awfully small.)

If it is not upstream yet, please split off this hunk into a separate
patch -- it's a bit annoying, but makes life easier for merging.

