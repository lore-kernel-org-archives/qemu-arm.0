Received: by 2002:a17:906:1c87:0:0:0:0 with SMTP id g7csp255146ejh;
        Thu, 8 Sep 2022 04:22:38 -0700 (PDT)
X-Google-Smtp-Source: AA6agR56tdEZZRmHEAeVu5BvsUFcwRbIxBQBT7uVqnVAwHbUvPCSg+y7Vaw+yV4QvQHMl0MQnXaU
X-Received: by 2002:ac8:5fc1:0:b0:344:53f9:1871 with SMTP id k1-20020ac85fc1000000b0034453f91871mr7186654qta.448.1662636158147;
        Thu, 08 Sep 2022 04:22:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1662636158; cv=none;
        d=google.com; s=arc-20160816;
        b=ALxvvSTp0jAWlARnMzzy0fcM2uWpQMqEGiLymZKu6+J9O4JxAGZSaPZtBzYlTElnJd
         6jIqbwYCmp5ATaf/IvmKgluiidcVSqV9Pdey4lk0N7LjO1ls7ryFZ8heDjyVEUO2Ql0K
         nALTRk7dAYj+7MU0RCt9nS0bvPltGc7mAuCom8WLrbjfxWDgJKF3DevODf7FtcgrHQ2K
         BkDJvAkeEEKdpkl3UBSPlw6czHmsuoePU9NwkALTMe1pD3DP6ZA5oEFX7Czf+s98YZmf
         NPBdyVZ+bIipxY3QW3ewmgaO4AybD5Uv1H7NGMAbjcaMd0YjuNDAj1JhqIRGz19eOoyr
         /6eg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:in-reply-to:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :dkim-signature;
        bh=f3yVar5BHwfemzbv7AvxJbI8BMmPIogQtx9G7he5bBA=;
        b=STrZf5GQZpXeCwXUDDZ7K0sZ86/9aI52f8EidQjp9FOcFw1C+sVPyQ34WvaQykDWEu
         OJurqXUgrfbal7/Z97ZYlGyy9pm0SIT1EGO4zQmof062zwBScA+6Cj7hxwQArEWlikge
         VEeUy4rjLbDgF6nmUvO1MRqwN5qJB7yhlY52yRQp9U4ZQJ1X2pfkla5jEZXmI3FIFIRP
         TcQmYmNAV7ObW5+O9NqVhhs6KNblY/yMrMiZJhpr0PYM9jzObG2E12nT56LxLaiBzQrZ
         QoeNuuM0IGtz+tKdLp1uKKZbvfCmqyWNu+C8ubZiXssV6fktAdavZlbLT7M8hxh2Mhhu
         Hypg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=XwJhJ7IC;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id k13-20020a05620a414d00b006bb4eb9510dsi12843056qko.302.2022.09.08.04.22.38
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 08 Sep 2022 04:22:38 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=XwJhJ7IC;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:45984 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1oWFcD-0006QS-NM
	for alex.bennee@linaro.org; Thu, 08 Sep 2022 07:22:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45830)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1oWFZr-00051h-HA
 for qemu-devel@nongnu.org; Thu, 08 Sep 2022 07:20:11 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:30189)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1oWFZp-0003li-AE
 for qemu-devel@nongnu.org; Thu, 08 Sep 2022 07:20:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1662636008;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=f3yVar5BHwfemzbv7AvxJbI8BMmPIogQtx9G7he5bBA=;
 b=XwJhJ7ICmEq3bbKAnCUJVh6aE1S6JeV3K/DEfV6hM0eIaDQUPdxThFhYsFVR3lphuZVPul
 oIzjXlA7iE9cHBbVxacHF0lpwrkL+BntDU80+n3QhAgdCrUhv0xNuFaQqJlrcp3oPk2xmM
 CmcB/4RaGOBtTEEwmp/b9s76UYdKVUg=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-505-UdpsHN3xO0e9xQYvqYwS6w-1; Thu, 08 Sep 2022 07:20:03 -0400
X-MC-Unique: UdpsHN3xO0e9xQYvqYwS6w-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5BF80185A794;
 Thu,  8 Sep 2022 11:20:02 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.194.14])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B67A3C15BB3;
 Thu,  8 Sep 2022 11:20:00 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 51F1318009BE; Thu,  8 Sep 2022 13:19:59 +0200 (CEST)
Date: Thu, 8 Sep 2022 13:19:59 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: Sunil V L <sunilvl@ventanamicro.com>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, qemu-riscv@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>,
 Xiaojuan Yang <yangxiaojuan@loongson.cn>,
 Song Gao <gaosong@loongson.cn>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Andrew Jones <ajones@ventanamicro.com>,
 Anup Patel <apatel@ventanamicro.com>,
 Atish Kumar Patra <atishp@rivosinc.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Heinrich Schuchardt <heinrich.schuchardt@canonical.com>,
 Pawel Polawski <ppolawsk@redhat.com>
Subject: Re: [PATCH V4 0/3] hw/riscv: virt: Enable booting S-mode firmware
 from pflashy
Message-ID: <20220908111959.e3lssz2xbqsnr57p@sirius.home.kraxel.org>
References: <20220906090219.412517-1-sunilvl@ventanamicro.com>
 <20220906104128.zlwzvbbswlzyplkc@sirius.home.kraxel.org>
 <20220906123200.GA237800@sunil-laptop>
 <20220907071037.tnnewqhi5v2xmiln@sirius.home.kraxel.org>
 <20220908102527.GB88864@sunil-laptop>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220908102527.GB88864@sunil-laptop>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.8
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: WVA1Q+0BPvS2

  Hi,

> Thanks Gerd. One question: Is it possible to have separate code + vars
> even when there is TF-A? My understanding is, TF-A will take one drive
> and will be hidden from the non-secure word. So, there is only one flash
> left for edk2. Is that correct?

Yes.

> In RISC-V, I think we have the this situation always since M-mode is
> mandatory. The first flash is always reserved for secure fw. So, we will
> have to increase the number of flash supported to 3 to support edk2 use
> case.

Well.  Adding one more flash is certainly the easiest approach.  Another
possible option would be to have the secure world store the efi variables.
That might be needed anyway for secure boot support.

> I have a fix RISC-V which resolves truncate issue leveraging logic from
> x86. It also creates 2 flash drives within non-secure space.
> EDK2 also needs to be modified to work with smaller code flash. But
> because the patch takes care of the actual size, it allows to have
> bigger code and smaller var images.

The size of the code flash and thereby the address of the varstore is
known at compile time too, so yes, that approach should work fine.

Note that changing the flash size can lead to compatibility problems
(for example when live migrating), so I'd suggest to be generous with
code/vars sizes.  On x64 the upstream default flash size is 2M and when
all compile-time options are enabled things don't fit any more.

So, assuming size figures are roughly the same for risc-v, I'd suggest
to go for 4M or 8M code flash and 1M vars flash.

> Same thing can be adopted to arm also since both seem to follow the same
> logic.

Yes.  The tricky part here is dealing with backward compatibility and
the transition from padded to non-padded images.  I suspect at the end
of the day keeping the vars flash mapping fixed at 64M (and have a hole
between code and vars) will be easier.

> But I think that will be a separate patch than this series. I
> will run that as a separate RFC patch. Is that fine?

No objections.

take care,
  Gerd

