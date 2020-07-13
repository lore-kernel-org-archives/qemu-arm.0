Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp3119178lfm;
        Mon, 13 Jul 2020 02:46:58 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxlNs7nsiuFR35N0UMwAFiteTi3Gz8VSzKxWRf9SOxOz3LrPr6rN1KHfCouvswUKEjdSRwO
X-Received: by 2002:a25:ae0c:: with SMTP id a12mr54861718ybj.443.1594633618160;
        Mon, 13 Jul 2020 02:46:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1594633618; cv=none;
        d=google.com; s=arc-20160816;
        b=07cekeTWMYjsjv+jc01Fz5jtl3n/vHlIKJHjF4wPCiM1Wlw2jCF8v9Akm8oUBoCLdc
         lNeL0UXyRztNwqJTNJQ9gQGWwBt1v6F6SvPLpp6sgRr9xNZIIwFKDsT6vFRr0dHDDH5A
         /fUylrZ1mrSy3Jo0yJ0MmxsaXXsLUtEdvW07QP5XImgMuFOOYecjOhaCKlpUjaWALcVX
         5Rw9fsZ6rfhVKWvmOAFF9U3YHRCFpIrW59Q71mxPUcxiSWyPnMlk4nQTTEep5LSu1+kg
         pafUopNzZOhnu+hAiApJLHnmlHdOt0XZXBGCmzDpsk3wxvrdwnDWKjudo3kB246EtD/O
         Eskw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-disposition
         :content-transfer-encoding:in-reply-to:mime-version:references
         :message-id:subject:to:from:date:dkim-signature;
        bh=B0Oe5UV2qyeUG9Z0o/6/qc3LlnZaZG6gs7b/Di/jHF4=;
        b=Bgp8KLmhp5C91vg7CvAilVBEemxkX9Wa7jbUj+cNwQbLgW+9ISQJfVnSddNgLuXtx+
         9vPlwP0S37UhJgLb918aLMrhA2VEqcYatni0zqyDbD2XHFTJVgvFCigtiiR9ndO7fQxY
         TwfMLfWNpmPGpoVmt8CLRLGFeihYAOrbzcpBrLx0gAyPhz1ZhudAhsMVOLd6Be1wTUIi
         pOkYyl+gJK/H4oC97uxwCLYCMLHAMt5ylpYt9R9YMLvilRAmC0F/Hy+V3WixfYL6Nh6r
         MzbhsDP9ufLoUb2f7G7rbG0Ls5N1cNixHqNSI9WQsTCBaXYCZ3J8y6JHUomcnn1uEca3
         59Iw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=BHYuLQvm;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u4si7839293ybo.253.2020.07.13.02.46.57
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 13 Jul 2020 02:46:58 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=BHYuLQvm;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:47224 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1juv33-0005Wf-IA
	for alex.bennee@linaro.org; Mon, 13 Jul 2020 05:46:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35890)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1juv2q-0005UQ-LH
 for qemu-arm@nongnu.org; Mon, 13 Jul 2020 05:46:44 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:52456
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1juv2p-0000cJ-75
 for qemu-arm@nongnu.org; Mon, 13 Jul 2020 05:46:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1594633602;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=B0Oe5UV2qyeUG9Z0o/6/qc3LlnZaZG6gs7b/Di/jHF4=;
 b=BHYuLQvmnzHYRZx3lLh5dROgNhPKourrhvcRc4UpTLygC+2dB4YELI5Lbk7InoIDgYc7IN
 rid1wGEPhIq1rb6GSRz55tCXa59dwSBvHGnh76n6j24ebXeeWBG/laftw1BCAYvVDAmDaL
 DZbWjux4YZ468kruaHFnoc9kv/q+4hA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-180-SmNjCEALNaCu-3G69JToMA-1; Mon, 13 Jul 2020 05:46:38 -0400
X-MC-Unique: SmNjCEALNaCu-3G69JToMA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6DB3E8015F4;
 Mon, 13 Jul 2020 09:46:34 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-115-89.ams2.redhat.com
 [10.36.115.89])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 303A327DE7C;
 Mon, 13 Jul 2020 09:46:24 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 1CA893EBB1; Mon, 13 Jul 2020 11:46:24 +0200 (CEST)
Date: Mon, 13 Jul 2020 11:46:24 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: Re: [PATCH 00/26] hw/usb: Give it love, reduce 'hw/usb.h' inclusion
 out of hw/usb/
Message-ID: <20200713094624.occmvxdb56kvbqy2@sirius.home.kraxel.org>
References: <20200704144943.18292-1-f4bug@amsat.org>
MIME-Version: 1.0
In-Reply-To: <20200704144943.18292-1-f4bug@amsat.org>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Content-Disposition: inline
Received-SPF: pass client-ip=205.139.110.120; envelope-from=kraxel@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/13 03:20:22
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -40
X-Spam_score: -4.1
X-Spam_bar: ----
X-Spam_report: (-4.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-devel@nongnu.org,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, BALATON Zoltan <balaton@eik.bme.hu>,
 Huacai Chen <chenhc@lemote.com>, Stefano Stabellini <sstabellini@kernel.org>,
 xen-devel@lists.xenproject.org, Yoshinori Sato <ysato@users.sourceforge.jp>,
 Paul Durrant <paul@xen.org>, Magnus Damm <magnus.damm@gmail.com>,
 Markus Armbruster <armbru@redhat.com>,
 =?utf-8?B?SGVydsOp?= Poussineau <hpoussin@reactos.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Anthony Perard <anthony.perard@citrix.com>,
 Samuel Thibault <samuel.thibault@ens-lyon.org>,
 Leif Lindholm <leif@nuviainc.com>, Andrzej Zaborowski <balrogg@gmail.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Alistair Francis <alistair@alistair23.me>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Beniamino Galvani <b.galvani@gmail.com>,
 Niek Linnenbank <nieklinnenbank@gmail.com>, qemu-arm@nongnu.org,
 =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>,
 Richard Henderson <rth@twiddle.net>,
 Radoslaw Biernacki <radoslaw.biernacki@linaro.org>,
 Igor Mitsyanko <i.mitsyanko@gmail.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Paul Zimmerman <pauldzim@gmail.com>, qemu-ppc@nongnu.org,
 David Gibson <david@gibson.dropbear.id.au>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: vANmo/c726B7

On Sat, Jul 04, 2020 at 04:49:17PM +0200, Philippe Mathieu-Daudé wrote:
> Hi,
> 
> This is the second time I try to replace a magic typename string
> by a constant, and Zoltan warns me this is counter productive as
> "hw/usb.h" pulls in an insane amount of code.
> 
> Time to give the usb subsystem some love and move forward.
> 
> This series can be decomposed as follow:
> 
>  1-2:    preliminary machine cleanups (arm/ppc)
>  3-13:   usb related headers cleanups
>  14-15:  usb quirks cleanup
>  16-18:  refactor usb_get_dev_path() to add usb_get_port_path()
>  19:     let spapr use usb_get_port_path() to make USBDevice opaque
>  20:     extract the public USB API (for machine/board/soc)
>  21:     make the older "usb.h" internal to hw/usb/
>  22-25:  use TYPENAME definitions
>  26:     cover dwc2 in MAINTAINERS
> 
> Please review.

Looks good overall, I don't fell like squeezing this into 5.1 though.
Can you repost (with the few comments addressed) once 5.2 is open for
development in roughly a month?

thanks,
  Gerd

