Received: by 2002:adf:ef42:0:0:0:0:0 with SMTP id c2csp627638wrp;
        Wed, 2 Oct 2019 02:10:42 -0700 (PDT)
X-Google-Smtp-Source: APXvYqyfe5pLWs9nA9T+poBjPqF+CXw/IVwYJDJ9fLsAaZm7PwO1X+rlgtW/1S2Hq0ekv4km+83a
X-Received: by 2002:a92:995a:: with SMTP id p87mr2841898ili.115.1570007442764;
        Wed, 02 Oct 2019 02:10:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1570007442; cv=none;
        d=google.com; s=arc-20160816;
        b=KhLoeJTzH3LX/efGhfYpTx1kmhQikxnI53aCKmffjKYi62dXT87ZlnvrANIFpHncTY
         epUGrdphaubjQVtDAezdZv85T4tkxUtgBacouKBj69/eVw6ADd92wduBXjY2fkZH9O+c
         bjoyFskvBUaOsDvbChFjBAO/yEaggA22gCLIKg3Uya9i5O8EFAy/WpIhISfHu4t+enwC
         PTdqPn/K52fz733l5AczmWaEzC+6ggeSqds5BKSLYAC/zAzhGInxt/OMPqAzztdFlMrH
         JdQy0Vs95YgZYHk1pnpkKJGP3Hc5RXKKhO1ORpbbzlLtBIK3BDtHMtE29WArhhXuxMGc
         CItA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :reply-to:message-id:subject:cc:to:from:date;
        bh=NjZX81yIG6w8ZY1KaS8bfah0cA3I/JjWk8YKbpuhHmg=;
        b=yhRi172gfsU3QKVWvzYz6mmNaWTmEQ2kJVXg+pE1jZWmxmbVbeex+TbY1w9n26KcTw
         l29jol43OlOPYEFl2wOkbqTZI/xdvKvu1+VA8F+sJMyLx6n3C5S7xjRS1nC3olNxLd56
         uLsm+ZBCqvZAiOmBMV/yf39+GW+hipkjLPV7hr0QhaJbq6z3qunvjfKB/F2alXnxuYrW
         cW3pPrScA63kAzCkw9tKjF9inkcW90viw5+FaGaDyXSR/8szcAahz0gpfmrvBNxoDc1+
         7FBZkWu+mWC/xzIT1fpFbmS5dj3xnZZxJIPHZ6siodkYfgS9HKshWM8xVrfspusC1OJ9
         kvAw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of berrange@redhat.com designates 209.132.183.28 as permitted sender) smtp.mailfrom=berrange@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <berrange@redhat.com>
Received: from mx1.redhat.com (mx1.redhat.com. [209.132.183.28])
        by mx.google.com with ESMTPS id 124si26063493iou.58.2019.10.02.02.10.42
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 02 Oct 2019 02:10:42 -0700 (PDT)
Received-SPF: pass (google.com: domain of berrange@redhat.com designates 209.132.183.28 as permitted sender) client-ip=209.132.183.28;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of berrange@redhat.com designates 209.132.183.28 as permitted sender) smtp.mailfrom=berrange@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id E8A388F4E1;
	Wed,  2 Oct 2019 09:10:41 +0000 (UTC)
Received: from redhat.com (unknown [10.42.17.55])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id CD3175D9D3;
	Wed,  2 Oct 2019 09:10:39 +0000 (UTC)
Date: Wed, 2 Oct 2019 10:10:37 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Richard Henderson <richard.henderson@linaro.org>
Cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
	Peter Maydell <peter.maydell@linaro.org>,
	Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
	QEMU Developers <qemu-devel@nongnu.org>,
	"qemu-discuss@nongnu.org" <qemu-discuss@nongnu.org>,
	qemu-s390x <qemu-s390x@nongnu.org>,
	"qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
	qemu-ppc <qemu-ppc@nongnu.org>,
	"open list:RISC-V" <qemu-riscv@nongnu.org>
Subject: Re: [RFC PATCH] configure: deprecate 32 bit build hosts
Message-ID: <20191002091037.GB607@redhat.com>
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
References: <20190925233013.6449-1-alex.bennee@linaro.org>
 <CAFEAcA9vb5_Mi_axWpu7269Zg0xMLbiiV80ofLeyDpfws3G4nQ@mail.gmail.com>
 <4512b61a-ed82-e628-88e5-f44ef87c2b50@linaro.org>
 <20190930092519.GB11996@redhat.com>
 <87impakrky.fsf@linaro.org>
 <CAFEAcA8_Zt+4RuXh8ww3Xm5=fQT+e_XcjZ6VC2N9k5mzLy0bnw@mail.gmail.com>
 <ddf455e3-742e-81ce-c51a-d783e8d2ad55@ilande.co.uk>
 <58da7aa4-877b-2c85-71f5-e703a841e6d4@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <58da7aa4-877b-2c85-71f5-e703a841e6d4@linaro.org>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.28]); Wed, 02 Oct 2019 09:10:42 +0000 (UTC)
X-TUID: ZRuhDZxpvQSF

On Tue, Oct 01, 2019 at 11:02:14AM -0700, Richard Henderson wrote:
> On 10/1/19 10:56 AM, Mark Cave-Ayland wrote:
> > Just out of interest, which host/compiler combinations don't currently implement
> > int128_t?
> 
> GCC only implements int128_t for 64-bit targets.

QEMU probes for that during configure  and sets CONFIG_INT128

If I'm reading correctly include/qemu/int128.h then provides a
fallback type based on a struct with two int64s.

This has some inconvenience though as you have to use the the (inline)
function calls for all the basic operands and will be less efficient
when using the fallback.

Presumably this is not viable for TCG ?

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|
