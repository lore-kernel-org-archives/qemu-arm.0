Received: by 2002:a17:907:1006:b0:9d0:bf65:29fa with SMTP id ox6csp2321807ejb;
        Mon, 20 Nov 2023 08:51:28 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEyFfp5Jm5Ac869SHncPOi4reRlRoIPQ6SMb5qAEcNZMUe9R5Z1LQupqFqmZSEhm8lyO2Cb
X-Received: by 2002:a05:620a:2d97:b0:778:92d6:db0f with SMTP id tr23-20020a05620a2d9700b0077892d6db0fmr7531894qkn.20.1700499088014;
        Mon, 20 Nov 2023 08:51:28 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1700499087; cv=none;
        d=google.com; s=arc-20160816;
        b=RtqXUg0vud+eEC+uXWHdU2od5OT0QpSTQLXQfANuxeVbKxxoWCgVuSj2TLZmqa55co
         6kVD/t73NUxI8BKU79oterrBbVVJhga9EhWm8aiS2+SKy26y6xT7fts4ZM0ma6GCWqm4
         zZKis7q5frj3R10BC+iZS0Pz6ZNKQvmDtdGgqG8wGCchpVtNDB9uhZkf2E1UjkgXCUNR
         BBiJ3VhcwU2uSzRemCzworpGlGx/LCP3xx9idExKMccN+qs9b7dSxciupT+An6BEqXrX
         A56gt7NGwJe+TpnrMfryz07u50cpLVEcrcLjnsA/cYqeFUYycNCMV54w8pMWf3K8awct
         yqqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:in-reply-to
         :content-transfer-encoding:content-disposition:mime-version
         :references:message-id:subject:cc:to:from:date:dkim-signature;
        bh=YmKaC5N53mP3rtUiB1S6AXp94gGlkwsUhlg9kWEpr2k=;
        fh=+RwECkNDvMah6ihkfKjHHGUfpxcorTaFno7pGQjOhew=;
        b=MulFJi5KSmA2W2BSQrR0Ji3uBJhms7EgNKKpjyIU6r6Q+AEdjRi0DyjNUoVVPKMEqk
         Vw6h8dp+F58oDD+nADJY9CR0J250QtTM2Y7EUcM2oZeEyvA6nD6ycr3SXrLayO0n0QYX
         thU9YmQZAXei0UmEXcumExXXPXPUrhycCD3oVpe2SSh5ieO3Lq+2yCc7EDlTEpvAllpi
         LCOxYLQNc9CRUwyEO2QfF2RrXhwGhgB0BNUiC7AW2W93yg6Wj+dtP79Yo6PAo6T4E2QO
         zqqCMyOusQzEv5b2pZb/gnfLAGQyvcw0oIQcAOGpdVHvcBD+pK3Mf07UOHQMGEs6bFTZ
         AfWg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=BJ1ARj7X;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ou5-20020a05620a620500b0077074ac99besi7467397qkn.763.2023.11.20.08.51.27
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 20 Nov 2023 08:51:27 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=BJ1ARj7X;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1r57Tx-0006Zs-5H; Mon, 20 Nov 2023 11:50:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1r57Tp-0006Xi-J0
 for qemu-arm@nongnu.org; Mon, 20 Nov 2023 11:50:38 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1r57Tn-0003gk-Kz
 for qemu-arm@nongnu.org; Mon, 20 Nov 2023 11:50:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1700499031;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YmKaC5N53mP3rtUiB1S6AXp94gGlkwsUhlg9kWEpr2k=;
 b=BJ1ARj7Xt1NCqv08XmYMQBAoQuHnS4w10htxRmkxOmIN6+Hm+0qb6cV9uaGH7K5+62KpCx
 ZuPMD6qOPXsoZ/JEu02rthEydOqgkUQaX4m9WHBv0KsNSQfVzcQploMsvKqeGRXAz066hn
 rXohMp6DnkgWXWHya2EKtpcVEBmuCrk=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-584-mbiHMhWMOvuuNCR-zWnQ7w-1; Mon, 20 Nov 2023 11:50:30 -0500
X-MC-Unique: mbiHMhWMOvuuNCR-zWnQ7w-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9D2B181100E;
 Mon, 20 Nov 2023 16:50:29 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.193.50])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id F1F99C15882;
 Mon, 20 Nov 2023 16:50:28 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 9611E18009BB; Mon, 20 Nov 2023 17:50:27 +0100 (CET)
Date: Mon, 20 Nov 2023 17:50:27 +0100
From: Gerd Hoffmann <kraxel@redhat.com>
To: Alexander Graf <graf@amazon.com>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, 
 Eric Blake <eblake@redhat.com>, Thomas Huth <thuth@redhat.com>, 
 Michael Roth <michael.roth@amd.com>, Paolo Bonzini <pbonzini@redhat.com>, 
 Peter Maydell <peter.maydell@linaro.org>,
 =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>, 
 =?utf-8?B?TMOhc3psw7Mgw4lyc2Vr?= <lersek@redhat.com>,
 Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>, 
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Markus Armbruster <armbru@redhat.com>, 
 Ard Biesheuvel <ardb@kernel.org>, mimoja@mimoja.de
Subject: Re: [PATCH 00/16] hw/uefi: add uefi variable service
Message-ID: <nxzed5dhgjpn3fafjttocvxe6ztxxf5xhghaqncpdxup6y7o7y@47i3eyoehio2>
References: <20231115151242.184645-1-kraxel@redhat.com>
 <9db15906-9474-4a6e-82a9-5275c72cf2b4@amazon.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <9db15906-9474-4a6e-82a9-5275c72cf2b4@amazon.com>
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.8
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.035,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: AIQ1L4mSK3aL

On Mon, Nov 20, 2023 at 12:53:45PM +0100, Alexander Graf wrote:
> Hey Gerd!
> 
> On 15.11.23 16:12, Gerd Hoffmann wrote:
> > This patch adds a virtual device to qemu which the uefi firmware can use
> > to store variables.  This moves the UEFI variable management from
> > privileged guest code (managing vars in pflash) to the host.  Main
> > advantage is that the need to have privilege separation in the guest
> > goes away.
> > 
> > On x86 privileged guest code runs in SMM.  It's supported by kvm, but
> > not liked much by various stakeholders in cloud space due to the
> > complexity SMM emulation brings.
> > 
> > On arm privileged guest code runs in el3 (aka secure world).  This is
> > not supported by kvm, which is unlikely to change anytime soon given
> > that even el2 support (nested virt) is being worked on for years and is
> > not yet in mainline.
> > 
> > The design idea is to reuse the request serialization protocol edk2 uses
> > for communication between SMM and non-SMM code, so large chunks of the
> > edk2 variable driver stack can be used unmodified.  Only the driver
> > which traps into SMM mode must be replaced by a driver which talks to
> > qemu instead.
> 
> 
> I'm not sure I like the split :). If we cut things off at the SMM
> communication layer, we still have a lot of code inside the Runtime Services
> (RTS) code that is edk2 specific which means we're tying ourselves tightly
> to the edk2 data format.

Which data format?

Request serialization format?  Yes.  I can't see what is wrong with
that.  We need one anyway, and I don't see why inventing a new one is
any better than the one we already have in edk2.

Variable storage format?  Nope, that is not the case.  The variable
driver supports a cache, which I think is a read-only mapping of the
variable store, so using that might imply we have to use edk2 storage
format.  Didn't check in detail through.  The cache is optional, can be
disabled at compile time using PcdEnableVariableRuntimeCache=FALSE, and
I intentionally do not use the cache feature, exactly to avoid unwanted
constrains to the host side implementation.

> It also means we can not easily expose UEFI
> variables that QEMU owns,

Qemu owning variables should be no problem.  Adding monitor commands to
read/write UEFI variables should be possible too.

> which can come in very handy when implementing MOR
> - another feature that depends on SMM today.

Have a pointer for me?  Google finds me
https://learn.microsoft.com/en-us/windows-hardware/drivers/bringup/device-guard-requirements,
which describes the variable behavior (which I think should be no
problem to implement), but doesn't say a word about what exactly gets
locked when enabled ...

> In EC2, we are simply serializing all variable RTS calls to the hypervisor,

The edk2 code effectively does the same (with PcdEnableVariableRuntimeCache=FALSE).

> similar to the Xen implementation
> (https://www.youtube.com/watch?v=jiR8khaECEk).

Is the Xen implementation upstream?  Can't see a xen variable driver in
OvmfPkg.  The video is from 2019.  What is the state of this?

> The edk2 side code we have built is here:
> https://github.com/aws/uefi/tree/main/edk2-stable202211 (see anything with
> VarStore in the name).

Ok, so it's just the variables.  The edk2 variant also sends variable
policy requests (see Edk2VariablePolicyProtocol,
https://github.com/tianocore/edk2/blob/master/MdeModulePkg/Library/VariablePolicyLib/ReadMe.md).
And it can easily be extended should the need arise in the future (all
requests are tagged with a protocol/event guid).

> Given that we deal with untrusted input, I would strongly prefer if we could
> move it to a Rust implementation instead though.

Valid point.

I've started in C because I have next no to experience with rust (yet),
so getting a test-able / demo-able implementation done was much easier
for me.  Also I think we don't have any rust infrastructure in qemu
(yet?).  Being able to use the qapi / qobject support to read/write the
variable store in json format is nice too.

But I'm open to discuss other options.

> We started a Rust
> reimplementation of it that interface that can build as a library with C
> bindings which QEMU could then link against:
> 
>   https://github.com/Mimoja/rs-uefi-varstore/tree/for_main
> 
> The code never went beyond the initial stages,

Hmm.  Why not?

> but if we're pulling the variable store to QEMU, this would be the
> best path forward IMHO.

Ok, so you are trying to sell me a prototype as solution?
/me looks a bit skeptical ...

take care,
  Gerd

