Received: by 2002:a17:906:18b1:b0:a2e:1324:ea5c with SMTP id c17csp783310ejf;
        Tue, 16 Jan 2024 02:13:57 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFi4zWCHUxjjdefu6kqSqnIhG7o/BkgxPBzqQCBvTOg/0Jx53Wlltbhvnd9ca08HQ+uL0nM
X-Received: by 2002:a05:6214:20ca:b0:681:59e7:33c6 with SMTP id 10-20020a05621420ca00b0068159e733c6mr4322839qve.61.1705400037342;
        Tue, 16 Jan 2024 02:13:57 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1705400037; cv=none;
        d=google.com; s=arc-20160816;
        b=XnovLjcOTO40gubAKNiYxhMzC8T++GWWuiZGd0L1qEJAIqF6s9lW/7FI0n98mIuWNS
         t9IpxbwlITiVP7lmSXpinWIEcLWNTlq19ecBXPUn3NZHCodHf4ur7DPJ52hGsIb+Dg92
         lPw1+ODrStvFmqbTPag/xLRQ+HHT4P9G0B9Up+L/BR7tnRPmKcjI0H5HoQF6NJQD+dQV
         8TWf7a45lNP5O+yvfprWOpTJtYlfAChOctdGEmWvQiZUtsks+oZ1Uv5KJZhzuOVfeXMI
         zg3kZ7dLGRWHLNVYA9Dlav0yWGnEhoVc+uOjVIJRhW5KIKk6vGRcMbHyeHM70JL9QWE9
         8bVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:in-reply-to
         :content-transfer-encoding:content-disposition:mime-version
         :references:message-id:subject:cc:to:from:date:dkim-signature;
        bh=MpWi+L4ZWJ/XMmIb+M3pEmfV0lcr7dmh1AMV2PVn04Y=;
        fh=yH9yBtPzue/GtXSqG+L2pFp6y67DTZqTj9doNEtRF8A=;
        b=xRFxjN0yMu80DOsrtNXuWfLmMrIBn6Bd+81m2MgZBKtyKOwvwzOid9y1xt4zknijm8
         g5Mp88mqXSVAnWB6gHcNktxc8g7xk8aZcFAcf/zDy3ezojzs11+ujRcaLYuzh/eGDS/1
         6cUtIqZSzS3LGUhuQCzTfmjcrrFWpIoHwiRdykROPVSk9pfZGrgPX/ybPbO7QylWzRiY
         2e5WGkvK2CqKdtCxyeI+lNzTgeAYXR3k7k3WR+cnc8bK1HOD8yr3aqfQfAV3FEf1xAZ6
         HlstSiDPH3soDQSWs632ZPjQRBhNe5MUBuAmMuFymzfk2wXTYth4z3ZZKGqpLFpRBJ/v
         7/YA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=RosiiXqY;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u7-20020a0c8dc7000000b0067f9f28533asi9325250qvb.505.2024.01.16.02.13.57
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 16 Jan 2024 02:13:57 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=RosiiXqY;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rPgS6-0002JT-AQ; Tue, 16 Jan 2024 05:13:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1rPgS1-0002Dd-DF
 for qemu-arm@nongnu.org; Tue, 16 Jan 2024 05:13:45 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1rPgRz-0001Cg-V3
 for qemu-arm@nongnu.org; Tue, 16 Jan 2024 05:13:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1705400022;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=MpWi+L4ZWJ/XMmIb+M3pEmfV0lcr7dmh1AMV2PVn04Y=;
 b=RosiiXqY57a7Fwg0s+o6XzzHeqQZ64MCYSmampao3DSXcXdLw57TtkyQY0+Nnu8PRnio+j
 +M34bcCx+6mCUNhc8hmbFZDOqp8GRN3RlZNGMMUKw7zD7sZ2bDSV57/5e/DSpcppnlkOoK
 pkMBhJ5yo3ii0yhfsJfdngw2f4/dhlw=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-513-aEXiGwCYNVWPjNQvwo8UIw-1; Tue, 16 Jan 2024 05:13:39 -0500
X-MC-Unique: aEXiGwCYNVWPjNQvwo8UIw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id CEE64895685;
 Tue, 16 Jan 2024 10:13:38 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.193.155])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 832BD2166B31;
 Tue, 16 Jan 2024 10:13:38 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 19D9D1800987; Tue, 16 Jan 2024 11:13:37 +0100 (CET)
Date: Tue, 16 Jan 2024 11:13:37 +0100
From: Gerd Hoffmann <kraxel@redhat.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>, 
 Peter Maydell <peter.maydell@linaro.org>, Paolo Bonzini <pbonzini@redhat.com>, 
 Beniamino Galvani <b.galvani@gmail.com>,
 Strahinja Jankovic <strahinja.p.jankovic@gmail.com>, 
 qemu-devel@nongnu.org, qemu-arm@nongnu.org, Alexander Graf <agraf@csgraf.de>, 
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, Thomas Huth <thuth@redhat.com>, 
 "Michael S. Tsirkin" <mst@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Subject: Re: Re: [PATCH 1/3] hw/arm: Add EHCI/OHCI controllers to Allwinner
 R40 and Bananapi board
Message-ID: <ccs4nfcdm7e5iek2enycw4echbyny2okstx4pg2es7pggjlgld@5vftyjpgfot2>
References: <20240113191651.1313226-1-linux@roeck-us.net>
 <20240113191651.1313226-2-linux@roeck-us.net>
 <56f692d8-41b1-4126-96b9-80d274624984@linaro.org>
 <56fde49f-7dc6-4f8e-9bbf-0336a20a9ebf@roeck-us.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <56fde49f-7dc6-4f8e-9bbf-0336a20a9ebf@roeck-us.net>
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.6
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.531,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
X-TUID: uFefxPn2Q9Jo

On Mon, Jan 15, 2024 at 08:12:29AM -0800, Guenter Roeck wrote:
> On 1/15/24 03:02, Philippe Mathieu-Daudé wrote:
> > On 13/1/24 20:16, Guenter Roeck wrote:
> > > If machine USB support is not enabled, create unimplemented devices
> > > for the USB memory ranges to avoid crashes when booting Linux.
> > 
> > I never really understood the reason for machine_usb() and had on my
> > TODO to do some archeology research to figure it out since quite some
> > time. Having to map an UnimpDevice due to CLI options seems like an
> > anti-pattern when the device is indeed implemented in the repository.
> 
> Me not either. I copied the code from aw_a10_init(), trying to use the
> same pattern. I am perfectly fine with making it unconditional, but then
> I would argue that it should be unconditional for Allwinner A10 as well
> (not that I really care much, just for consistency).
> 
> The "-usb" option says "enable on-board USB host controller (if not
> enabled by default)". Unfortunately, that doesn't tell me much,
> and most specifically it doesn't tell me how to enable it by default.
> One option I can think of would be to enable it on the machine level,
> i.e., from bananapi_m2u.c, but then, again, I don't see if/how
> that is done for other boards. Any suggestions ?

The -usb switch is there as long as I remember (which goes back to qemu
0.1x days).  I suspect it was introduced in the early usb emulation
days, where usb emulation was more fragile and turning it on by default
didn't look like a good plan.

usb emulation in modern qemu should be stable enough that enabling it by
default should not be much of a problem.  ohci/uhci/ehci emulation is
somewhat expensive due to polling being wired into the hardware design,
but as long as there are no usb devices connected this should not be
much of a concern either as the guest drivers usually put the usb host
adapter to sleep in that case (which saves power on physical hardware
and stops the polling timer in qemu).

So, turning on usb support by default makes sense to me when emulating
boards, where guests expect the usb controllers being present at
specific MMIO addresses, so mapping UnimpDevice is not needed.

In case guests detect hardware via generated device tree / generated
ACPI tables / pci bus scan (i.e. arm virt + microvm + pc + q35) it IMHO
makes sense to keep current behavior.

take care,
  Gerd

