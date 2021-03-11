Received: by 2002:a19:6d5:0:0:0:0:0 with SMTP id 204csp496129lfg;
        Thu, 11 Mar 2021 09:43:35 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzpkkpYLLkn51igv7u0BUnjn5ZsKhp3xaROYqTtYnjCNGWQrzMFNAB9HL4NiFQib3X1bLm5
X-Received: by 2002:a5d:9bc8:: with SMTP id d8mr6953578ion.115.1615484615405;
        Thu, 11 Mar 2021 09:43:35 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1615484615; cv=none;
        d=google.com; s=arc-20160816;
        b=EDmyzVzDVgdN6yfi+gRe93wnGSyNoIVL5/213QfQlkMddGwOK/IU89HFsNs60iIhtW
         zH3W4iDUpR+rfpU3lgbb7IpUmC+/mOdVTU/+Egofj6+sf0oFzX8zBimdrn/xrbAxEuRR
         2p+i5EEai3tUQL5dprqK/prm/rtv/bqNqncIHEbJBgNjLLQdVepUfc3W4rLDLTqo2pTV
         op3upNKsu1KOWL0Uj2K5a/nP5keXSIxdBu/4AeSnMeEDX5VnZa/txAJBh3H38wB7RiBc
         y9kMZIZ3KazLV2YKSYxU/vU1s9s2TTlakiJxmtQ0UrAJ2dRwdNJjyKdixmpQxnM7BEkR
         aWaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-disposition:in-reply-to
         :mime-version:references:message-id:subject:to:from:date
         :dkim-signature;
        bh=z9BAfz9Bjabg1I30s9BkUrYl8Zg6yUfheJ5XQOedF6E=;
        b=DPeB79xXCUw5UzYsMFYYldziZO2fcltCj+q4IAdapXwzVnZreB87Y1dYAHcYI0iacN
         kpVj8PGDfq9UgpC4WVba+QEgGUakogt9SM8Feo98DEMSthG8Oe5RenL0xol3J0VvuIke
         A6OOXtNeswG1nq20g0mCv8yDbxf1yVrVyKdb+bKqybuN7AxrqaLAJ5sn5ZjhELZLhAth
         WvCLaIpbqQaUdRTN593zax3GFY9t/zsEnxPSheQg8aqYkfCdmZbb3/A79Pq8eoADm9bN
         yPb5fQ8ku8wrYIKY/AMWiIZVV9HzXN+JmQ+EvSMo/Dex2BzAokyta+GBu4C0CRM3VSAu
         TyFg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=iFSQUDEM;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e11si3147936ilu.32.2021.03.11.09.43.35
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 11 Mar 2021 09:43:35 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=iFSQUDEM;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:55932 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lKPLS-00043Y-MG
	for alex.bennee@linaro.org; Thu, 11 Mar 2021 12:43:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39294)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1lKPE9-00053o-04
 for qemu-arm@nongnu.org; Thu, 11 Mar 2021 12:36:01 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:47887)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1lKPE6-0005oV-D9
 for qemu-arm@nongnu.org; Thu, 11 Mar 2021 12:36:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615484157;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=z9BAfz9Bjabg1I30s9BkUrYl8Zg6yUfheJ5XQOedF6E=;
 b=iFSQUDEMgnyqBxi+NtsMgaTZi5m1IkhChC9DAY0I1yBy0sv8Huv/Fusc8sRHP7lLykLY/w
 MK+3zaWQtZqLIlKl0ZmtrHJtbU1MaRQr4Sayw1DfcR2FZn0vWAMOKsxJiiX67e7jQxxZis
 grBIpYwTZyrzS33t1BHh3je5/XCppWg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-202-NQfiGKUJORydZxbqj2RPGw-1; Thu, 11 Mar 2021 12:35:55 -0500
X-MC-Unique: NQfiGKUJORydZxbqj2RPGw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 179BD1084CA7;
 Thu, 11 Mar 2021 17:35:54 +0000 (UTC)
Received: from localhost (ovpn-2-69.rdu2.redhat.com [10.22.2.69])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D311F5D742;
 Thu, 11 Mar 2021 17:35:53 +0000 (UTC)
Date: Thu, 11 Mar 2021 12:35:53 -0500
From: Eduardo Habkost <ehabkost@redhat.com>
To: Claudio Fontana <cfontana@suse.de>
Subject: Re: arm: "max" CPU class hierarchy changes possible?
Message-ID: <20210311173553.GP3139005@habkost.net>
References: <11e9d3bb-c94c-4ad7-35b0-b698376c5e00@suse.de>
 <CAFEAcA8T+u6QG9PQWs40PTSZ86SEeLQrciT8WHxFyH3UVbipiA@mail.gmail.com>
 <2e6a5d98-e022-0b39-5f30-92eb74491d3b@redhat.com>
 <2277fdf5-ec92-476a-8fe5-0d4eee23dfef@suse.de>
MIME-Version: 1.0
In-Reply-To: <2277fdf5-ec92-476a-8fe5-0d4eee23dfef@suse.de>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ehabkost@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=ehabkost@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 qemu-arm <qemu-arm@nongnu.org>, qemu-devel <qemu-devel@nongnu.org>,
 Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 9kIorTaP7w/U

On Thu, Mar 11, 2021 at 06:16:52PM +0100, Claudio Fontana wrote:
> On 3/11/21 5:18 PM, Paolo Bonzini wrote:
> > On 11/03/21 16:02, Peter Maydell wrote:
> >> On Thu, 11 Mar 2021 at 14:27, Claudio Fontana <cfontana@suse.de> wrote:
> >>> the "max" cpu in x86 and s390 is a class,
> >>>
> >>> and then "host" has "max" as parent.
> >>>
> >>> This would be a convenient setup for ARM too, as it would allow to put common code between kvm and tcg in the "max" class,
> >>> and allow "host" to specialize the behavior for KVM (and in the future HVF probably).
> >>>
> >>> Would changing the class hierarchy this way be acceptable, cause any problems?
> >>
> >> It's not clear to me why 'host' would be a subtype of 'max':
> >> that doesn't seem like an obvious relationship.
> > 
> > On x86, "-cpu host" is essentially the same as "-cpu max" with the only 
> > difference that it errors out on TCG.  So:
> > 
> > - with TCG: "-cpu max" enables all that can be emulated, "-cpu host" fails
> > 
> > - with KVM: "-cpu max" enables all that can be virtualized, "-cpu host" 
> > does the same
> > 
> > Paolo
> > 
> 
> Maybe Peter you could clarify similarly what the intended meaning of "max" is on ARM?
> 
> TCG: for aarch64, the starting point seems to be Cortex-A57, and then lots of other features are added on top of it,
> and for non-aarch64, the starting point seems to be Cortex-A15, plus "old-style VFP short-vector support".
> 
> Is the intention to enable all that can be emulated here too, like for X86?
> 
> 
> KVM: (aarch64-only): aarch64_max_initfn():
> 
> The following comment in the code seems wrong to me:
> 
> /* -cpu max: if KVM is enabled, like -cpu host (best possible with this host); */
> 
> This is not exactly true:
> 
> "-cpu max" calls kvm_arm_set_cpu_features_from_host(), (which checks "dtb_compatible", and if not set gets the features from the host, if set ...?)
> After that, calls aarch64_add_sve_properties() and then adds also "svw-max-vq". This code is common with TCG.
> 
> In the case of cpu host instead,
> 
> "-cpu host" calls kvm_arm_set_cpu_features_from_host(), same as max, then calls aarch64_add_sve_properties() but does NOT add "svw-max-vq".
> 
> Is this a bug?
> 
> Are "max" and "host" for KVM supposed to be the same like with x86?

Note that even on x86 "max" and "host" are allowed to be
different, because they have different purposes.

This can happen if a feature is supported by the host software
and hardware (so it will be included in "max") but can't be
enabled by default on "host" for some reason (e.g. if a feature
doesn't work out of the box without extra configuration options).

-- 
Eduardo

