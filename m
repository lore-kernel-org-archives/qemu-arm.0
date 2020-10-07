Received: by 2002:ac2:4c26:0:0:0:0:0 with SMTP id u6csp458206lfq;
        Wed, 7 Oct 2020 07:28:38 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyFc1NRGy14MS+Bor/PZJPhBvtWU9/gP0vMheKDzh+HxJZYipxlB0pY9BMe2coXcmke0/oD
X-Received: by 2002:a25:e710:: with SMTP id e16mr4037691ybh.326.1602080917884;
        Wed, 07 Oct 2020 07:28:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1602080917; cv=none;
        d=google.com; s=arc-20160816;
        b=Wq4zcuGpnylctwuqP4z5qZuQ7quik4UEVHiXFLBN3JpCvLYNHxjDFpczZQnit8tSWv
         hwh947Ey+yKP8hEzWC1+JbTQR5/6MqR3io7fZrhbshG9lFygvSNOL28kDUd/sadShoh8
         s4viOpEOneKGzhs/jVtgJw0uHt5XQqoPqIVZfkxAtMf9FADKWfeJIc0KeKuhXrWSckTS
         /PHqFbhZtoI181KyY4XiKL1c9o2D0zOh31/NhrTNHTBiAC1a5Qd3/Sc3kubxZUSyIKn9
         kyZfLBGQDWjmcnxngxdYS3Gmy4ilai1rMk7G7RTloB4xDGBw+eVjh+icK/Mjp9b35/fM
         oOZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-disposition:in-reply-to
         :mime-version:references:message-id:subject:to:from:date
         :dkim-signature;
        bh=NUMvaSf9hEYMn3qWx45fPqnZW6zDsy/cWbz5TCdF3eA=;
        b=IBCpkFO4NUEiMkWBlhW7XXZNpY9hYbA6td7hdB9r4EGcj0yOqhkukSqVIPL4U1j+CA
         rnQeaIrGryl39YthGvIqecD2ZOgHwOMiIU9Q017XRDNpJx4QfoP38CpxsMsL8u9/8DeR
         15uFn1Cuiub9nv5UpBqiEr1GokiR1iEOiG/DlyN5jh9+5S5slwfrQ9LDXe5RH8PKzBZI
         dhS15CwiTA9TtjWA2pPX6M15bOwZNDm+og3I/qty9yP/KJicw8EUT+bzPXVZ5Fz/1l/N
         YYNYJyXtzFe013+DZ6Otax1EwbfQgMpQrAnKSiqxA9wrr/C+BcxNA6/ubnqNglloep3Q
         +clQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=Q6QKrEA0;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g20si1884811ybe.327.2020.10.07.07.28.37
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 07 Oct 2020 07:28:37 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=Q6QKrEA0;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:56350 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kQAQn-0002EH-60
	for alex.bennee@linaro.org; Wed, 07 Oct 2020 10:28:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41442)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1kQAQM-0002CZ-Lr
 for qemu-arm@nongnu.org; Wed, 07 Oct 2020 10:28:10 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:28258)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1kQAPz-0003Qt-A3
 for qemu-arm@nongnu.org; Wed, 07 Oct 2020 10:28:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1602080866;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=NUMvaSf9hEYMn3qWx45fPqnZW6zDsy/cWbz5TCdF3eA=;
 b=Q6QKrEA0t4Xo3OAGQQvgrKfXXP2KKpCgIyk0QSAUR42I3XsMEVBQQrIDddsOGEojZZ1c4H
 CA7SCRtW3pcUSx3zNuDaH3STfF9teXtFsNZT0PF4HaQjTBZgL84cyj/4l6LvqCNkP+ta/V
 GVJ9tltvvmDhKXhioyUOptB+DkXqc3Q=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-350-bW4MSx9SMcOlbZ9tVUW-vg-1; Wed, 07 Oct 2020 10:27:44 -0400
X-MC-Unique: bW4MSx9SMcOlbZ9tVUW-vg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8DCE780EF8B;
 Wed,  7 Oct 2020 14:27:43 +0000 (UTC)
Received: from localhost (ovpn-119-102.rdu2.redhat.com [10.10.119.102])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2839F7BE42;
 Wed,  7 Oct 2020 14:27:43 +0000 (UTC)
Date: Wed, 7 Oct 2020 10:27:42 -0400
From: Eduardo Habkost <ehabkost@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: Purpose of QOM properties registered at realize time?
Message-ID: <20201007142742.GV7303@habkost.net>
References: <20201006220647.GR7303@habkost.net>
 <a6e652d9-548f-4d4e-e451-48e3f5e11031@redhat.com>
 <20201007130240.GU7303@habkost.net>
 <659289e0-4133-b945-45fd-25e759c18b03@redhat.com>
MIME-Version: 1.0
In-Reply-To: <659289e0-4133-b945-45fd-25e759c18b03@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ehabkost@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=ehabkost@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/07 00:44:56
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.742,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org, qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
 "Daniel P. Berrange" <berrange@redhat.com>, John Snow <jsnow@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: StdenbJXU17o

On Wed, Oct 07, 2020 at 03:55:58PM +0200, Paolo Bonzini wrote:
> On 07/10/20 15:02, Eduardo Habkost wrote:
> > On Wed, Oct 07, 2020 at 02:04:23PM +0200, Paolo Bonzini wrote:
> >> On 07/10/20 00:06, Eduardo Habkost wrote:
> >>> Hi,
> >>>
> >>> While trying to understand how QOM properties are used in QEMU, I
> >>> stumbled upon multiple cases where alias properties are added at
> >>> realize time.
> >>>
> >>> Now, I don't understand why those properties exist.  As the
> >>> properties are added at realize time, I assume they aren't
> >>> supposed to be touched by the user at all.  If they are not
> >>> supposed to be touched by the user, what exactly is the purpose
> >>> of those QOM properties?
> >>
> >> In the case of GPIOs, I think they will be used by other devices that
> >> are added afterwards.
> > 
> > Do you know how exactly are they used?  Is this always wrapped
> > behind a specific API for GPIOs, or the devices can look for the
> > properties directly?
> 
> It is always wrapped, but (as far as I recall, because I have never
> worked with GPIOs) they are intentionally QOM properties and not just as
> an implementation detail.  It's meant to be accessible to the user if
> only through qom-get/qom-set.

Being accessible for debugging would be OK.  I'm just worried
about dynamic QOM properties being part of a stable and supported
API.

> 
> Paolo
> 
> > I'm concerned by the possibility of having QOM properties as an
> > undocumented part of an internal API.
> 

-- 
Eduardo

