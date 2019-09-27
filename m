Received: by 2002:adf:ef42:0:0:0:0:0 with SMTP id c2csp3216837wrp;
        Fri, 27 Sep 2019 01:55:48 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwWlMXfB0uas85aBMtbVgCkkxSZsRpr9hYnDt6Pe92sFqPQ0hClZWN6sZYhKDUcNOJFjz53
X-Received: by 2002:a02:a999:: with SMTP id q25mr7586699jam.27.1569574548049;
        Fri, 27 Sep 2019 01:55:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1569574548; cv=none;
        d=google.com; s=arc-20160816;
        b=kbEsJ2a981W6OxSzL54JvriPK8lH7GXG3X2g96H8+HpWGuMOstOb+hPUqggobRvRE2
         gc7QS9IprrJUhrWqGYNBXm8ZmU0XlVAzyhvAXQnLRo2LeSTk3ncg6IpPMdAEP/vecrrJ
         GgKUzP36K1fqtH+1UL/m7DI1ZUqBdaWdh79zmrRAIbGtxrDx5lmvu7+5GPjUZuTo7Dsy
         KU0XhljmhYeSsGy10IKzmtHoPR+v5Fse7PujLS51RCMUIWegudwW9FvIWhcU6DsL49W2
         O1xJGeViujqPm1Lkaf+lfcWvC+a16qIeey9NUseKbChYvmJPLDvRUhUBOYCypj4B3qcQ
         U7hQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date;
        bh=HpzZel2KTX6OCfdw+4dJHHiMdlVnXcbMhw+zSbNjBKI=;
        b=cfpp1eAxiKLLFU9VNi4txXwe1knKpu2u/tv5TOHMCV+Ir5XJgzV1IXu5IWhhU9tkvL
         U2qRDf7iZPmQ+t4USB35bIc9FnBRTOp2K1JRkGbRHMcG/9usReugbs8JqfFVqpWGLeBM
         21RAE0RX1/zJp9J/n7c11qvjNg7JuYXtPiNx2tw4pWwyalHJ/h77bCKp8YNtD+qaHzve
         XYCqUdPqbH73xylXWE/RnLopxtHo1n3mSVaj85wVMELXA1ebFQ4G/T8Nn1yYRo7D0nD8
         y3JH3pkFLLTm1wePQOHilIvq24RmNwkjqUNkw08T6wpmiFBIfCdMk8XOkKn4RJRXC2PN
         AKsg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of kraxel@redhat.com designates 209.132.183.28 as permitted sender) smtp.mailfrom=kraxel@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <kraxel@redhat.com>
Received: from mx1.redhat.com (mx1.redhat.com. [209.132.183.28])
        by mx.google.com with ESMTPS id f24si7095130jad.113.2019.09.27.01.55.47
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 27 Sep 2019 01:55:48 -0700 (PDT)
Received-SPF: pass (google.com: domain of kraxel@redhat.com designates 209.132.183.28 as permitted sender) client-ip=209.132.183.28;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of kraxel@redhat.com designates 209.132.183.28 as permitted sender) smtp.mailfrom=kraxel@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 37DF018CB8FB;
	Fri, 27 Sep 2019 08:55:47 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-47.ams2.redhat.com [10.36.116.47])
	by smtp.corp.redhat.com (Postfix) with ESMTP id E3DF5600C6;
	Fri, 27 Sep 2019 08:55:46 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
	id 234A017535; Fri, 27 Sep 2019 10:55:46 +0200 (CEST)
Date: Fri, 27 Sep 2019 10:55:46 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Cc: Peter Maydell <peter.maydell@linaro.org>,
	"open list:RISC-V" <qemu-riscv@nongnu.org>,
	Richard Henderson <richard.henderson@linaro.org>,
	QEMU Developers <qemu-devel@nongnu.org>,
	qemu-discuss <qemu-discuss@nongnu.org>,
	qemu-s390x <qemu-s390x@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>,
	qemu-ppc@nongnu.org,
	Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: Re: [RFC PATCH] configure: deprecate 32 bit build hosts
Message-ID: <20190927085546.2aemjmwudvgpek3y@sirius.home.kraxel.org>
References: <20190925233013.6449-1-alex.bennee@linaro.org>
 <CAFEAcA9vb5_Mi_axWpu7269Zg0xMLbiiV80ofLeyDpfws3G4nQ@mail.gmail.com>
 <20190926125817.GB19660@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190926125817.GB19660@redhat.com>
User-Agent: NeoMutt/20180716
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2 (mx1.redhat.com [10.5.110.63]); Fri, 27 Sep 2019 08:55:47 +0000 (UTC)
X-TUID: X8RxTs0qPpAP

  Hi,

> That leaves armv7 as the only 32-bit arch in Fedora that is somewhat
> active & maintained. I don't have any real insight on whether any
> armv7 (Fedora) users are making much use of QEMU/KVM though, either
> system or user emulation. 

Played with system emulation a while back.  I doubt this is used much
in practice.  It's very slow for various reasons (no gic, no armv8 arch
updates to support kvm virt better, slow sdcard/usb I/O).  TCG on a
beefy x86 box is roughly the same speed.  Also 1G of memory isn't that
much even without considering virtual machines.

The rpi4 with 4G (disclaimer: don't have one) probably works better.
But note they are finally working on a 64bit kernel for raspbian,
which I expect is only a first step for better 64bit support.

cheers,
  Gerd
