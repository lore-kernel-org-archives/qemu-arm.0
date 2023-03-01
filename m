Received: by 2002:a17:907:1627:b0:8ed:b3f:fd98 with SMTP id hb39csp6979616ejc;
        Wed, 1 Mar 2023 05:52:24 -0800 (PST)
X-Google-Smtp-Source: AK7set8yTrqIp8F7x6Ft9CFAeDEGJ1Z6FiFNLNK5C48Hd8+1PyKwdNvc9AV4kUhronKtBP4keYIE
X-Received: by 2002:a05:6214:c46:b0:56e:ad32:2d58 with SMTP id r6-20020a0562140c4600b0056ead322d58mr11007184qvj.6.1677678744229;
        Wed, 01 Mar 2023 05:52:24 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1677678744; cv=none;
        d=google.com; s=arc-20160816;
        b=HyG5taSVRIdvwSzQsjVkUSxawcSrsOJNXs6NQ8RVUhve53Y4gN/rTl4dz8UV3c+oFl
         BaVy0ok4Z2feuQrIx+gxocsMyd51eJr5dkvDYT+M9y4BzzfLqN9vDysidUMIEV677Qqb
         Ucq9BLE6zUJ0zwYdJ3bSae7RWfA5NjqzR30DIBynCx5Y/tLjqrqIPou1as6vceVUdZ1P
         bqdp2HpfOXpZspW1kAV3OBBVSTwELEobXtoD2gCnlgXb5wvFePvA15DtGaYvwbqo/PP1
         RMJH6/ennhS0js+kXg6E+W7ZU95TaZoqudwBow+feW7SWzMFTGl+NqJXTXBNTPoOHnCj
         LVYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :in-reply-to:mime-version:references:from:dkim-signature;
        bh=mftfQEi9wdaH6McKuPClmRUmMChN2OhoG+1UjGPOpjw=;
        b=dva1lt3Fm94WTf/Rnb79tTjn13yDbSyhaf/bQjvdyA9ek96VsswohofGP7txngd7dI
         jGloQyMeBmUhELOsZXhILEnkiQxZLZq38P93Rb/Z/19LGc7+grZY6Ll1bV2S4eiwRFWC
         BWm9TxWXKYNbNX4jphVVzwlzEv79Q2h54pGfDfMAtglob3OxeeAWFikspCnbseyi9ekT
         5yVpGOr7lezk5ZO48yGTt4+/eEm/enTmPTC7b9/1CV9ZpNc5yXD0oBUiCEbzRNPlpYby
         FBnyZhPCBkqHhsSAN5Z0TRym8eB2LGO7bLsXylVGdl9mX+Ex6p4mizeetL++1sseBIj1
         MVCA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=AIXUY9ap;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o6-20020a0c8c46000000b0056e97e16218si10927983qvb.526.2023.03.01.05.52.24
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 01 Mar 2023 05:52:24 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=AIXUY9ap;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pXMsH-0007p6-IG; Wed, 01 Mar 2023 08:52:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <abologna@redhat.com>)
 id 1pXMsD-0007oc-VZ
 for qemu-arm@nongnu.org; Wed, 01 Mar 2023 08:52:01 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <abologna@redhat.com>)
 id 1pXMsC-0002gN-A6
 for qemu-arm@nongnu.org; Wed, 01 Mar 2023 08:52:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677678719;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=mftfQEi9wdaH6McKuPClmRUmMChN2OhoG+1UjGPOpjw=;
 b=AIXUY9apdKrVPNzPQ9jpLaG/2Mi1Pw3tcexix89ipHBAYuIABqpcaYGP2D3KonbWDr9Gfw
 ncP5ZsALiGDTjWrGbKcD6qYCZfCM41dG2da61/HZ4EirRhsfbdacCZ4mW+UFpSGznUSQAp
 3i6nmynfCkbpl+z7pZaR/9+3BoISo5Y=
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com
 [209.85.210.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-479-6UWNQMp9PRqL0TTj6whSAQ-1; Wed, 01 Mar 2023 08:51:58 -0500
X-MC-Unique: 6UWNQMp9PRqL0TTj6whSAQ-1
Received: by mail-pf1-f197.google.com with SMTP id
 h14-20020aa786ce000000b005a89856900eso291250pfo.14
 for <qemu-arm@nongnu.org>; Wed, 01 Mar 2023 05:51:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:in-reply-to:mime-version:references
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=mftfQEi9wdaH6McKuPClmRUmMChN2OhoG+1UjGPOpjw=;
 b=tjCQORVzi7mP2GDEhFqH2ZohnMf9Hq2t/RAxhdlCnnQMJ0BR3OeEOPYD43v5w3UzIN
 Uwe8fSL0zcV4LEgncEslQinyxtjRC3a9F1V070WNoF8p6QD/q4Fa/Apm/FJEdD6iFLqZ
 UVmWl3/k5O/fbWEr1wCXpQAOkKcxAWP2OGViMK/hJCAc7Vzxz4iTlsxEbyOhdM7bQpmW
 bENB49nnyVa39GX5PV/fiH2LCKmWxWXqfZlKUqIR1JctudlS5z8m+VIfSUGSd6MlpTY3
 /z/Oi1byXNwWvMrIqPnFcdHJLaf5E2M04u3OcXCHsVXTFWMSOOjUb0HJ3gkuuGFnEUEC
 QOGg==
X-Gm-Message-State: AO0yUKUPHebpWYwKl1njmnUJR+ZUYCC1yvudeFBRE4+fq3W4fR1DnAfx
 4WKRiIIxT3hcw5a9B06kMdeAtUElfkEUuw5OfzRG/ivPEdNk9fm+jE+PQqzxYmCnnEkq73VNxYV
 FjT66skZL3aQaDiylWmOPn3QY9lys
X-Received: by 2002:a17:902:a3cd:b0:19c:be03:ce10 with SMTP id
 q13-20020a170902a3cd00b0019cbe03ce10mr2318744plb.9.1677678717057; 
 Wed, 01 Mar 2023 05:51:57 -0800 (PST)
X-Received: by 2002:a17:902:a3cd:b0:19c:be03:ce10 with SMTP id
 q13-20020a170902a3cd00b0019cbe03ce10mr2318736plb.9.1677678716764; Wed, 01 Mar
 2023 05:51:56 -0800 (PST)
Received: from 744723338238 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 1 Mar 2023 05:51:56 -0800
From: Andrea Bolognani <abologna@redhat.com>
References: <20230228150216.77912-1-cohuck@redhat.com>
 <20230228150216.77912-2-cohuck@redhat.com>
 <CABJz62OHjrq_V1QD4g4azzLm812EJapPEja81optr8o7jpnaHQ@mail.gmail.com>
 <874jr4dbcr.fsf@redhat.com>
MIME-Version: 1.0
In-Reply-To: <874jr4dbcr.fsf@redhat.com>
Date: Wed, 1 Mar 2023 05:51:56 -0800
Message-ID: <CABJz62MQH2U1QM26PcC3F1cy7t=53_mxkgViLKjcUMVmi29w+Q@mail.gmail.com>
Subject: Re: [PATCH v6 1/2] arm/kvm: add support for MTE
To: Cornelia Huck <cohuck@redhat.com>
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>, 
 Laurent Vivier <lvivier@redhat.com>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org, 
 kvm@vger.kernel.org, Eric Auger <eauger@redhat.com>, 
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Juan Quintela <quintela@redhat.com>, Gavin Shan <gshan@redhat.com>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 Richard Henderson <richard.henderson@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=abologna@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: 7d4AEuAL06gL

On Wed, Mar 01, 2023 at 11:17:40AM +0100, Cornelia Huck wrote:
> On Tue, Feb 28 2023, Andrea Bolognani <abologna@redhat.com> wrote:
> > On Tue, Feb 28, 2023 at 04:02:15PM +0100, Cornelia Huck wrote:
> >> +MTE CPU Property
> >> +================
> >> +
> >> +The ``mte`` property controls the Memory Tagging Extension. For TCG, it requires
> >> +presence of tag memory (which can be turned on for the ``virt`` machine via
> >> +``mte=on``). For KVM, it requires the ``KVM_CAP_ARM_MTE`` capability; until
> >> +proper migration support is implemented, enabling MTE will install a migration
> >> +blocker.
> >
> > Is it okay to use -machine virt,mte=on unconditionally for both KVM
> > and TCG guests when MTE support is requested, or will that not work
> > for the former?
>
> QEMU will error out if you try this with KVM (basically, same behaviour
> as before.) Is that a problem for libvirt, or merely a bit inconvinient?

I'm actually a bit confused. The documentation for the mte property
of the virt machine type says

  mte
    Set on/off to enable/disable emulating a guest CPU which implements
    the Arm Memory Tagging Extensions. The default is off.

So why is there a need to have a CPU property in addition to the
existing machine type property?

From the libvirt integration point of view, setting the machine type
property only for TCG is not a problem.

-- 
Andrea Bolognani / Red Hat / Virtualization

