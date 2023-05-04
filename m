Received: by 2002:a17:906:4810:b0:965:a47e:1721 with SMTP id w16csp282278ejq;
        Thu, 4 May 2023 06:01:17 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ6R13AIa91sSBQ9o9hH47jA9Vi1B03hgjDL4uGcVEMAm5kI6Lr5R5U2PmxKtFexqeE/UAbq
X-Received: by 2002:a5d:46c2:0:b0:307:1bba:5cf with SMTP id g2-20020a5d46c2000000b003071bba05cfmr1353782wrs.17.1683205276565;
        Thu, 04 May 2023 06:01:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1683205276; cv=none;
        d=google.com; s=arc-20160816;
        b=jRDsRWp1tAAeEBwIUHwLKoVrsCsiyjYvoR7OZvWYAiFReJgyNbHdnFW1HoL+sI0Y1J
         GFzgo894/dyikaU8Iyz0NNYn6qspOuHzCfimmnnfDe0flY1fBTGe1PI9yRl6fuSluD4C
         t0B+bsL/VsJiwBdVu/HV3jM6n5n0KyQ5R7HM6CCe/DJZwwPozRgC1qCeTV1XwoR/w4PO
         gJS4n8/9zrWSKhfmnUXzpIRBEQ7RqCvxhBKycjEwISUCV4WKQQrpwTJIYBetYZ9687OR
         zNjEe9VDnaUVLJ9Pq8H78NvRw6B2U+bVUTM7evgsJqAWV1ShPNlRL6AA3qp5+JOLjITp
         E8KQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:dkim-signature:dkim-signature;
        bh=0CNvTeBJC9NJbW36bHQEsE9hma/Iv/am1DYHSeKhXYU=;
        b=f4HU7QX3GEF8H7c+moW9oH3pBX6oHQ0EYCKV6E7RXSQpsdxtAu4Wh8mqaoTmfvwP8D
         QKIwHhgQ6OW1GEWKCsmQjtb0CoR1xAJF8R2ramlUYWFMh4Xhz8cr0tQ/o+fpHuSX0Z2y
         NGqjcUa2nFP274ZDgyiB9Wy3grdbUKA9TII0pXavVTy7iPYw+Kqj5T8jOwJwSWXDDUVK
         4F5q6UNM/s9w7xRL1teRQ6RBUdLyfBPtF298ynG8cNP1ybi7VsqFmfXrCceAD2CGk81M
         Eg9KhyJ9k5900lphC0Yk0fA+XGM3qRi6NaVxnkoiNswMfSxs19ZXSBoRLfQ8S1OI7lGK
         LBsw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b=1XEGdvf6;
       dkim=neutral (no key) header.i=@suse.de header.b=hYOmSgZt;
       spf=pass (google.com: domain of farosas@suse.de designates 195.135.220.28 as permitted sender) smtp.mailfrom=farosas@suse.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=suse.de
Return-Path: <farosas@suse.de>
Received: from smtp-out1.suse.de (smtp-out1.suse.de. [195.135.220.28])
        by mx.google.com with ESMTPS id u4-20020adff884000000b0030643e04393si2633455wrp.588.2023.05.04.06.01.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 May 2023 06:01:16 -0700 (PDT)
Received-SPF: pass (google.com: domain of farosas@suse.de designates 195.135.220.28 as permitted sender) client-ip=195.135.220.28;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b=1XEGdvf6;
       dkim=neutral (no key) header.i=@suse.de header.b=hYOmSgZt;
       spf=pass (google.com: domain of farosas@suse.de designates 195.135.220.28 as permitted sender) smtp.mailfrom=farosas@suse.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=suse.de
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id CF988339FE;
	Thu,  4 May 2023 13:01:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1683205275; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=0CNvTeBJC9NJbW36bHQEsE9hma/Iv/am1DYHSeKhXYU=;
	b=1XEGdvf6vMCVSTb4QYfLvzlNb6u1HyHFbMjHgKD55zDr7HpvJ7XUQFjbJ7Q7TD++/OEDF/
	/RE6WEG3nDX8EkD1zEnl3OIr7EFTbPPDr5wgR/Iqj0LoNHvuN2XHrCxdBiSfWQiqyNPrIs
	VcXsQOEUNX5cNsN2vOp0P61gRa5IMeo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1683205275;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=0CNvTeBJC9NJbW36bHQEsE9hma/Iv/am1DYHSeKhXYU=;
	b=hYOmSgZtufLv0n6XLuWaojVL1UG5wP0WA83NVrwt0dxN3La5e/f3eqx3bx6ADJWlz7jbSB
	Se/bY6GB7gLugjAA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 5C59813444;
	Thu,  4 May 2023 13:01:15 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id 0MicCZusU2TdTwAAMHmgww
	(envelope-from <farosas@suse.de>); Thu, 04 May 2023 13:01:15 +0000
From: Fabiano Rosas <farosas@suse.de>
To: Paolo Bonzini <pbonzini@redhat.com>, Peter Maydell
 <peter.maydell@linaro.org>
Cc: qemu-devel <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>, Richard
 Henderson
 <richard.henderson@linaro.org>, Alex =?utf-8?Q?Benn=C3=A9e?=
 <alex.bennee@linaro.org>
Subject: Re: [PATCH 1/3] target/arm: Use CONFIG_SEMIHOSTING instead of TCG
 for semihosting
In-Reply-To: <CABgObfbBTUUAOmvKz9U2Esi3rmdYmbhw3uR5iouFYUwFGoG32Q@mail.gmail.com>
References: <20230503193833.29047-1-farosas@suse.de>
 <20230503193833.29047-2-farosas@suse.de>
 <3f8ed21a-6c05-e7a4-ab9a-c8f6ca041013@redhat.com>
 <CAFEAcA9y0tZVCSz93ziHkwYaM_whaEnCko2=Zzyb=BGFySJyRg@mail.gmail.com>
 <CABgObfbBTUUAOmvKz9U2Esi3rmdYmbhw3uR5iouFYUwFGoG32Q@mail.gmail.com>
Date: Thu, 04 May 2023 10:01:12 -0300
Message-ID: <875y98cktj.fsf@suse.de>
MIME-Version: 1.0
Content-Type: text/plain
X-TUID: 0y22H0rwH/Tx

Paolo Bonzini <pbonzini@redhat.com> writes:

> Il gio 4 mag 2023, 10:59 Peter Maydell <peter.maydell@linaro.org> ha
> scritto:
>
>> On Thu, 4 May 2023 at 08:33, Paolo Bonzini <pbonzini@redhat.com> wrote:
>> >
>> > On 5/3/23 21:38, Fabiano Rosas wrote:
>> > > When building --without-default-devices, the semihosting code will not
>> > > be available, so check the proper config.
>>
>> I think the changes to the ifdeffery are conceptually
>> fine (only do semihosting if it was configured in), but
>> it sounds like there's a separate problem here.
>> Whether we need semihosting depends on the accelerator (ie
>> "is it TCG or not"), not on what set of devices we're building.
>> So the problem seems to me to be that --without-default-devices
>> is causing the semihosting code not to be built in.
>>
>> > Acked-by: Paolo Bonzini <pbonzini@redhat.com>
>> >
>> > for this change; however, there are two more related issues:
>> >
>> > 1) you still want to leave out the code if !TCG, because KVM is not able
>> > to exit to userspace on semihosting calls as far as I understand
>> >
>> > 2) I am not sure why CONFIG_ARM_COMPATIBLE_SEMIHOSTING=y appears in
>> > config/targets/{arm,riscv32,riscv64}-softmmu/default.mak.
>>
>> Because those are the architectures which have
>> "arm-compatible" semihosting ABIs ?
>>
>
> Yes but is there a reason to do it in configs/ where all the other symbols
> are boards, or was it just overlooked and a "default y" (as I suggested in
> the previous reply) or "imply" is better?

For arm it has been taken out of configs/ and moved into
target/arm/Kconfig:

...
# This config exists just so we can make SEMIHOSTING default when TCG
# is selected without also changing it for other architectures.
config ARM_SEMIHOSTING
    bool
    default y if TCG && ARM
    select ARM_COMPATIBLE_SEMIHOSTING

So I guess we'd need a similar change to what you suggested for ARM_V7M:

config ARM
    bool
    select ARM_V7M if TCG
    select ARM_COMPATIBLE_SEMIHOSTING if TCG
