Received: by 2002:a17:906:18b1:b0:a2e:1324:ea5c with SMTP id c17csp1590253ejf;
        Wed, 17 Jan 2024 06:51:52 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFNd8HLRY7ngP8BEYihlPAcPTteP6f/edufQOK0AC00MFzj8+9mI0nzDhPTiD4TfaQtFEMG
X-Received: by 2002:a37:c40d:0:b0:783:4887:563c with SMTP id d13-20020a37c40d000000b007834887563cmr10075575qki.99.1705503112385;
        Wed, 17 Jan 2024 06:51:52 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1705503112; cv=none;
        d=google.com; s=arc-20160816;
        b=XnVVbFzLkHp5QQxzpGrT5gOSNMk8VIZp5Ac5qK5D7g01dMfo64T8O/13kwiHnL8Ftn
         kkZWiCCZqV79SHf+QS8eoBM3UKIhOau0PdQy6IQkBOgNMsgEWDHOPSlJys1o2x4SFF9w
         L7XB6mS32bs2x5z3WHdyTH/yckP4q5OtZODzkL178n2F+KVkqiuXMwSZSdc0TZprhSFP
         l3BOuRkYrJP6YGG3wuU9YDswTgQ33Ew9+EGS9KxvSGF2vXeO9r60ud8I365CcrPy7enh
         VLY/ziB0YjXuWeUlJbzvMM1aaW311IT/YibuikW1t6IM0pc8pqf9pWaiEc1JiYoB0k1+
         YViQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:in-reply-to:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :dkim-signature;
        bh=5133YznikRQyggWW0C3GP7dUOzq4ccMLoFfeH9DjTtA=;
        fh=BQEssqSLueOFOkD4cmY1CEwFH++7Awq0Z4dQLLdn+dM=;
        b=cvVl559o/ObHi16DpKd8ruZla9sSFmruIh0ZipDJrTlvrQOgkt7R2WQQQs9TX5Jz7r
         LmPciYM/LX354Kb9l/1gm0jPAi4PKYG/x2KHCaXTThPI4/OjCW6xPyM8YKt1e21oBAyH
         LZs7l9AvGlCThQafqx1aZZXu7wAHkBbE3FP7Gd3V36TMK8xrEKjDL3dxjTYrKu2PWOuR
         vm74kRCPNavlVZGHNX8PZT/QFCMHt7t+2hUL0GWyhjlgj4GnU0mMt6jPa4YfEomGO7PB
         BV8j4KoZpZuYjseiFn6fc55Sz8HtajdPiemPrrpZ/0glcoVhd6uqyjMH+rDAl6ADU7je
         a80g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=aeZPpEts;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x6-20020ae9e646000000b007725a68ea34si11546081qkl.89.2024.01.17.06.51.52
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 17 Jan 2024 06:51:52 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=aeZPpEts;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rQ7Gd-0002rD-4v; Wed, 17 Jan 2024 09:51:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1rQ7Ga-0002qQ-4N
 for qemu-arm@nongnu.org; Wed, 17 Jan 2024 09:51:44 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1rQ7GY-0001k4-Gm
 for qemu-arm@nongnu.org; Wed, 17 Jan 2024 09:51:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1705503100;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=5133YznikRQyggWW0C3GP7dUOzq4ccMLoFfeH9DjTtA=;
 b=aeZPpEtseDFa1zs+xi3KBs2qFvcW/jfHr6QluViu0L/ZvClud9iUjCbAXEEthgYt9DFtWW
 ORJBs1bdVq6yeb9laqOxlU05SWqYKy9A0ShAl3qYTCmPCexuvV4NygCxQTHRozszdBNC2/
 Tc4Aao4maE8bHL+NdZ+Ba5S4tN/raA0=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-134-xfig9KbKMWK3gKpZO8-gFQ-1; Wed, 17 Jan 2024 09:51:38 -0500
X-MC-Unique: xfig9KbKMWK3gKpZO8-gFQ-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1A0448489AF;
 Wed, 17 Jan 2024 14:51:38 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.194.48])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id BC21B492BC6;
 Wed, 17 Jan 2024 14:51:37 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 4C3E31800DC8; Wed, 17 Jan 2024 15:51:36 +0100 (CET)
Date: Wed, 17 Jan 2024 15:51:36 +0100
From: Gerd Hoffmann <kraxel@redhat.com>
To: Bernhard Beschow <shentey@gmail.com>
Cc: qemu-devel@nongnu.org, Guenter Roeck <linux@roeck-us.net>, 
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>, 
 Paolo Bonzini <pbonzini@redhat.com>, Beniamino Galvani <b.galvani@gmail.com>, 
 Strahinja Jankovic <strahinja.p.jankovic@gmail.com>, qemu-arm@nongnu.org,
 Alexander Graf <agraf@csgraf.de>, 
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, Thomas Huth <thuth@redhat.com>, 
 "Michael S. Tsirkin" <mst@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Subject: Re: Re: Re: [PATCH 1/3] hw/arm: Add EHCI/OHCI controllers to
 Allwinner R40 and Bananapi board
Message-ID: <rznnf6h3leadg43xgcnfw74quwt2rhhaj7zzlwj5skd7egbpwc@bjn5knhei2ks>
References: <20240113191651.1313226-1-linux@roeck-us.net>
 <20240113191651.1313226-2-linux@roeck-us.net>
 <56f692d8-41b1-4126-96b9-80d274624984@linaro.org>
 <56fde49f-7dc6-4f8e-9bbf-0336a20a9ebf@roeck-us.net>
 <ccs4nfcdm7e5iek2enycw4echbyny2okstx4pg2es7pggjlgld@5vftyjpgfot2>
 <51F3A473-7A20-4C0C-BDF1-98D839E56A0F@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <51F3A473-7A20-4C0C-BDF1-98D839E56A0F@gmail.com>
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.9
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -38
X-Spam_score: -3.9
X-Spam_bar: ---
X-Spam_report: (-3.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.806,
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
X-TUID: a7dqZiI3wWTg

> >In case guests detect hardware via generated device tree / generated
> >ACPI tables / pci bus scan (i.e. arm virt + microvm + pc + q35) it IMHO
> >makes sense to keep current behavior.
> 
> I remember similar discussions with Phil during PIIX consolidation
> where the motivation was to make the code simpler by removing options.
> That is, if a piece of silicon contains multiple functions, the QEMU
> model should always instantiate all (available) functions rather than
> providing options for cherry-picking.
> 
> Especially in highly integrated devices (such as south bridges) there
> might be interconnections between functions that are hard to handle
> when some are optional. For example, the ACPI function in the VIA
> south bridges detect activity from all other functions. In both PIIX
> and VIA, the USB function can be (de)activated by software from the
> ISA function (not implemented yet).
> 
> The latter would allow the current behavior of the pc machine(s) to be
> implemented while avoiding the cherry picking problem: The BIOS could
> switch the USB function on or off depending on fw_cfg (please correct
> me if I'm wrong). I think this would't even need compat machinery. Of
> course, support would need to be added in SeaBIOS and -- I guess --
> Tianocore. I'd like to look into that but, as usual, no guarantees
> when this will arrive.

Well, our chipsets are quite old.  piix has uhci, q35 has uhci+ehci.
Modern usb is xhci, which also is more virtualization friendly hardware
design.  Also qemu usb configuration is much simpler in case there is
only one usb bus (xhci) instead of two (xhci + chipset) because you
don't have to explicitly assign usb devices to a specific usb bus if
there is only one.  So I don't like the idea to have the chipset usb bus
present by default.

We have a similar problem in the LPC bridges.  They likewise have bits
in the pci config space to enable/disable ISA devices such as floppy,
serial port, parallel port.  These bits are implemented, but read-only.
So it is possible to read them to figure whenever a given device is
present, but it is not possible to set them to enable/disable devices.
Before we switched the ACPI DSDT to be 100% generated we actually had
some AML functions reading those bits to figure whenever these ISA
devices are present or not.

I'd suggest to follow that design pattern for the config bits in the
south bridge ACPI function.

take care,
  Gerd

