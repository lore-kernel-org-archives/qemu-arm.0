Received: by 2002:a17:907:1627:b0:8ed:b3f:fd98 with SMTP id hb39csp7004416ejc;
        Wed, 1 Mar 2023 06:15:45 -0800 (PST)
X-Google-Smtp-Source: AK7set+8cpDB0cRhhvu8XX/G+56oDieip1aY93e66rcn7o1IEcR+bDKyC2oJR/N5z8gmk2OlgF/l
X-Received: by 2002:a05:6122:54e:b0:401:b5d9:37e0 with SMTP id y14-20020a056122054e00b00401b5d937e0mr3855655vko.1.1677680144944;
        Wed, 01 Mar 2023 06:15:44 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1677680144; cv=none;
        d=google.com; s=arc-20160816;
        b=Siy7stqLW0uTbpRffnKDXyBzTkepWqOv5nlNOM8oKBaPyRAsu9rGIOpRcxrQESV78L
         fhthK2dRNmC1LXG31NndMQHXglVQvPAhXS7Joi4ssuEFEfA8xScppbssnittTZMDXQHH
         p4wjb1Uc0QBVD2i/2+K2OTt+6iMkHk0ow8kBCut0IoXHdflgYs3AGDIl1Bf9y6s7KGyg
         iab/P+rdX/BKs8j2BffumeHg777B3Al1yeqWAxvVtb3WyBBUN46RbAYukNeZjUvswlox
         3KjS6L+eVZqRWMCsrepHSuuiW22zygNjTkSzXx85EFFWH8Ynz4aND+y7+Fp9TwXhXhke
         ZYhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:mime-version:message-id:date
         :user-agent:references:organization:in-reply-to:subject:cc:to:from
         :dkim-signature;
        bh=KZK/Eir0iXKfCuBI/Twp952puaSpLfvrLp9JkJpn/ZA=;
        b=Ki5k2Q/49GoeO7nAh7MZ6u03G+iF9xjFSfVhSW8hBEBwdWwt67Kb5Yf+ByJLDFQ2ab
         +TPHhfDOaztCa2mOQ8GjeI8uibRwx9Tn1M9zpZQtlVALboC4dtFJNWVq/RKxR6RXPXhE
         chDk2DoXD/rglF8SBTb1xH1exJHuWguBUUjokyh73LSL+pNyTS6r/oBzLh+vRjz2MfDD
         0sBaB9nSRgDxi681Nw9NL4rg1xgCrE4Kgpqg8ShlpNo/Mx88UIBpIi9fNKlJGeYqrms+
         RGSwQnCVedF5YfGuDPTm+DxPQ+WcLgIHgEdIg8yKN3IWdETEdLG5BlZt+Co+5ybYx4TE
         YBuA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=cIHAUQrA;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x28-20020a05620a0b5c00b0073ba9cd4798si9833238qkg.78.2023.03.01.06.15.44
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 01 Mar 2023 06:15:44 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=cIHAUQrA;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXNF2-0005Ii-0G; Wed, 01 Mar 2023 09:15:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1pXNEu-0005Gi-Cy
 for qemu-devel@nongnu.org; Wed, 01 Mar 2023 09:15:28 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1pXNEr-0007e4-8g
 for qemu-devel@nongnu.org; Wed, 01 Mar 2023 09:15:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677680124;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=KZK/Eir0iXKfCuBI/Twp952puaSpLfvrLp9JkJpn/ZA=;
 b=cIHAUQrArVB2DN2q4gQ47Di9DuiDZ+EP91JoWnfpqfoT+DNNIxhqmt+HpY0eKRogSflP4U
 WTOsnYf/7Zf4A6uhSFPiD6EurTjIrbbYXJsyBZjGC0MJiOMsS9YY8+rDm7zRkx/R5xuAAf
 eXhM4U/lfl0Aril0rMkvfW1dS6wZsww=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-659-x_3F7MgmPfq2-Z2EsiR_vg-1; Wed, 01 Mar 2023 09:15:20 -0500
X-MC-Unique: x_3F7MgmPfq2-Z2EsiR_vg-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 842B5100F90F;
 Wed,  1 Mar 2023 14:15:19 +0000 (UTC)
Received: from localhost (dhcp-192-239.str.redhat.com [10.33.192.239])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 3D699492C3E;
 Wed,  1 Mar 2023 14:15:19 +0000 (UTC)
From: Cornelia Huck <cohuck@redhat.com>
To: Andrea Bolognani <abologna@redhat.com>
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth
 <thuth@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 qemu-arm@nongnu.org, qemu-devel@nongnu.org, kvm@vger.kernel.org, Eric
 Auger <eauger@redhat.com>, "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Juan Quintela <quintela@redhat.com>, Gavin Shan <gshan@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>, Richard
 Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH v6 1/2] arm/kvm: add support for MTE
In-Reply-To: <CABJz62MQH2U1QM26PcC3F1cy7t=53_mxkgViLKjcUMVmi29w+Q@mail.gmail.com>
Organization: Red Hat GmbH
References: <20230228150216.77912-1-cohuck@redhat.com>
 <20230228150216.77912-2-cohuck@redhat.com>
 <CABJz62OHjrq_V1QD4g4azzLm812EJapPEja81optr8o7jpnaHQ@mail.gmail.com>
 <874jr4dbcr.fsf@redhat.com>
 <CABJz62MQH2U1QM26PcC3F1cy7t=53_mxkgViLKjcUMVmi29w+Q@mail.gmail.com>
User-Agent: Notmuch/0.37 (https://notmuchmail.org)
Date: Wed, 01 Mar 2023 15:15:17 +0100
Message-ID: <87sfeoblsa.fsf@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
Received-SPF: pass client-ip=170.10.129.124; envelope-from=cohuck@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: fY/Z9DbudWPg

On Wed, Mar 01 2023, Andrea Bolognani <abologna@redhat.com> wrote:

> On Wed, Mar 01, 2023 at 11:17:40AM +0100, Cornelia Huck wrote:
>> On Tue, Feb 28 2023, Andrea Bolognani <abologna@redhat.com> wrote:
>> > On Tue, Feb 28, 2023 at 04:02:15PM +0100, Cornelia Huck wrote:
>> >> +MTE CPU Property
>> >> +================
>> >> +
>> >> +The ``mte`` property controls the Memory Tagging Extension. For TCG, it requires
>> >> +presence of tag memory (which can be turned on for the ``virt`` machine via
>> >> +``mte=on``). For KVM, it requires the ``KVM_CAP_ARM_MTE`` capability; until
>> >> +proper migration support is implemented, enabling MTE will install a migration
>> >> +blocker.
>> >
>> > Is it okay to use -machine virt,mte=on unconditionally for both KVM
>> > and TCG guests when MTE support is requested, or will that not work
>> > for the former?
>>
>> QEMU will error out if you try this with KVM (basically, same behaviour
>> as before.) Is that a problem for libvirt, or merely a bit inconvinient?
>
> I'm actually a bit confused. The documentation for the mte property
> of the virt machine type says
>
>   mte
>     Set on/off to enable/disable emulating a guest CPU which implements
>     the Arm Memory Tagging Extensions. The default is off.
>
> So why is there a need to have a CPU property in addition to the
> existing machine type property?

I think the state prior to my patches is actually a bit confusing: the
user needs to set a machine type property (causing tag memory to be
allocated), which in turn enables a cpu feature. Supporting the machine
type property for KVM does not make much sense IMHO: we don't allocate
tag memory for KVM (in fact, that would not work). We have to keep the
previous behaviour, and explicitly instructing QEMU to create cpus with
a certain feature via a cpu property makes the most sense to me.

We might want to tweak the documentation for the machine property to
indicate that it creates tag memory and only implicitly enables mte but
is a pre-req for it -- thoughts?

>
> From the libvirt integration point of view, setting the machine type
> property only for TCG is not a problem.

Ok.

