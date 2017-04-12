Received: by 10.25.0.144 with SMTP id 138csp138043lfa;
        Tue, 11 Apr 2017 22:07:33 -0700 (PDT)
X-Received: by 10.55.132.3 with SMTP id g3mr55915750qkd.300.1491973653795;
        Tue, 11 Apr 2017 22:07:33 -0700 (PDT)
Return-Path: <cota@braap.org>
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com. [66.111.4.25])
        by mx.google.com with ESMTPS id y10si8264571qkb.235.2017.04.11.22.07.33
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 11 Apr 2017 22:07:33 -0700 (PDT)
Received-SPF: pass (google.com: domain of cota@braap.org designates 66.111.4.25 as permitted sender) client-ip=66.111.4.25;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@braap.org;
       dkim=pass header.i=@messagingengine.com;
       spf=pass (google.com: domain of cota@braap.org designates 66.111.4.25 as permitted sender) smtp.mailfrom=cota@braap.org
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
	by mailout.nyi.internal (Postfix) with ESMTP id 3ACF220C57;
	Wed, 12 Apr 2017 01:07:33 -0400 (EDT)
Received: from frontend1 ([10.202.2.160])
  by compute4.internal (MEProxy); Wed, 12 Apr 2017 01:07:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=braap.org; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to:x-me-sender:x-me-sender:x-sasl-enc
	:x-sasl-enc; s=mesmtp; bh=Hq9ID9E0qczz1XceUvpnBXpQFyPOvqlAzoI4ci
	m6238=; b=pfdejkQQqzcwHvcUjZ1QwgkqxxdXF0EwsO5g0oRnRVo9AvRAxygHRx
	ZOTfBbR24iUg+dMvWOnKsgJyZ/B5sgadaCxwo3lw/bQaxkFNUSI1NGTIt8m3Wwu/
	MjaJKDAkXM6uZjqNX9CEhxQFZv37irhNwspllIEYOjTe8dBpvcGF0=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to:x-me-sender
	:x-me-sender:x-sasl-enc:x-sasl-enc; s=fm1; bh=Hq9ID9E0qczz1XceUv
	pnBXpQFyPOvqlAzoI4cim6238=; b=LtfjYywQWc6uTqiV/dTOISKKgiil3aTjgT
	frKAA53PycLIoP/bWJK6hsoSsnVW9sAdkgVqOnTbZOCOMm/z9VxEOu9wwoUe8Icg
	1vgVSm5sxso/ia/IlmzkoMNDAtgTYASTL/dr6W3ruKfIgWsYW0+Nh1749joEOaOl
	ZYV8gMb8DKUkz3MK33jloUnGUhdV7uw8yg8QYuvQ1UUX7I1CHl/2teNcIZSQ4Amr
	F47ymoLEFHzFLJtG7u0WYUB4hv4TSQRmoP5aC8rnnboPS4WD1cfKa+mMquLXMvhF
	xRqystVCb/SRPOpt19KUbNwBm+nPet3cplj9wrLeooI5FLuzjzfA==
X-ME-Sender: <xms:FbbtWEnsZwJvXtWbEBjtbjk1jkNLgMVW1iJU0yHso3AkP7g8jSPJlg>
X-Sasl-enc: SwtJTGVGVpyINVYfPRLgzZp4i9wkIw9t1xgP3KW4PT4W 1491973652
Received: from localhost (flamenco.cs.columbia.edu [128.59.20.216])
	by mail.messagingengine.com (Postfix) with ESMTPA id E8FAF7E638;
	Wed, 12 Apr 2017 01:07:32 -0400 (EDT)
Date: Wed, 12 Apr 2017 01:07:32 -0400
From: "Emilio G. Cota" <cota@braap.org>
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: qemu-devel@nongnu.org, Peter Crosthwaite <crosthwaite.peter@gmail.com>,
	Richard Henderson <rth@twiddle.net>,
	Peter Maydell <peter.maydell@linaro.org>,
	Eduardo Habkost <ehabkost@redhat.com>,
	Andrzej Zaborowski <balrogg@gmail.com>,
	Aurelien Jarno <aurelien@aurel32.net>,
	Alexander Graf <agraf@suse.de>, Stefan Weil <sw@weilnetz.de>,
	qemu-arm@nongnu.org, alex.bennee@linaro.org,
	Pranith Kumar <bobby.prani+qemu@gmail.com>
Subject: Re: [PATCH 10/10] tb-hash: improve tb_jmp_cache hash function in
 user mode
Message-ID: <20170412050732.GA10279@flamenco>
References: <1491959850-30756-1-git-send-email-cota@braap.org>
 <1491959850-30756-11-git-send-email-cota@braap.org>
 <93ae643a-582f-8f1a-3f2a-63ae2d9261bc@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <93ae643a-582f-8f1a-3f2a-63ae2d9261bc@redhat.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-TUID: 1v+MqjX6y2+V

On Wed, Apr 12, 2017 at 11:46:47 +0800, Paolo Bonzini wrote:
> 
> 
> On 12/04/2017 09:17, Emilio G. Cota wrote:
> > +
> > +/* In user-mode we can get better hashing because we do not have a TLB */
> > +static inline unsigned int tb_jmp_cache_hash_func(target_ulong pc)
> > +{
> > +    return (pc ^ (pc >> TB_JMP_CACHE_BITS)) & (TB_JMP_CACHE_SIZE - 1);
> > +}
> 
> What about multiplicative hashing?
> 
> 	return (uint64_t) (pc * 2654435761) >> 32;

I tested this one, taking the TB_JMP_CACHE_SIZE-1 lower bits of
the result:

  http://imgur.com/QIhm875

In terms of quality it's good (I profile hit rates and they're all
pretty good), but shift+xor are just so hard to beat: shift+xor
take 1 cycle each; the multiplication takes on my machine 3 or 4
cycles (source: Fog's tables).

Thanks,

		E.
