Received: by 2002:adf:c793:0:0:0:0:0 with SMTP id l19csp2988575wrg;
        Mon, 13 May 2019 09:05:53 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxS2Wa0TRqYIapfFG1arV7UJlANLMqkr3Cexr1nbg5ckmwab0c0nbx2uKEz5Cjl6tXK24SH
X-Received: by 2002:a17:906:7b58:: with SMTP id n24mr23073129ejo.224.1557763553285;
        Mon, 13 May 2019 09:05:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1557763553; cv=none;
        d=google.com; s=arc-20160816;
        b=FSyTYX2VkHBVoB4EownXghrOx2vy/VtcJP04t70jzjwe8Eqoa2V6boofqCA2s4guU8
         R0OuMLkRxjkd7ba9LRBYZAVXQn4grSuhY0nOMju++RCs+HDINxT3lSE7NGYe3j3nHH2Q
         C7bhqyq+bhPnywZA0OQsgAcdzdxJ3qyQK3zQHzpbDRcKcBfo5vcPZTayeFfAN1kBO63H
         qI5yFTpJCDryz9QXCpYTPtOSH4E+YhlqYBSQ9mMRWmM4ggTJulDkKQRcgXjeO9ci17XB
         foPcDxLjDwqFiM1KCAFJA4b2LsDYsqoShgb14H7RdN5jJ77qoRXBiC761im6La+L/Ijk
         /LIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date;
        bh=KHBNInBPMWiDHxDGHmQjvYXUOe/Byy0mxIcJMSDvoA8=;
        b=EF5rMmJLW6oHJZH78OCg037DuS+hJLMKpB28o30XMX5SAbx6CqbWbpDGs9AA8nCqY+
         IJMaDJ3C7ft14HfInYto5WX7cDkb4A2iY/LYxJinDGIoIxAtt/cH0858cqNRgkO9EiH4
         bb1WduH+Tl7AIevvylF/9+0tpRJArwwcdYbk2ayGHMn6Wqd1Yxao/TMA8BlPSfC7XyqI
         LbbsTnfWc4t6vua5duOBdhEVbiM0WEBh4sH3G8Ce5WIt83cAh6EbJP+ROBZ8y9Pk8+30
         UV8fWCz3JeJeGYiZLisYVDc3zQeDZxty6nhE9oM7/sHHvqNSJHmZ+/YvPp8zXoUau25F
         9vAg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of dave.martin@arm.com designates 217.140.101.70 as permitted sender) smtp.mailfrom=Dave.Martin@arm.com
Return-Path: <Dave.Martin@arm.com>
Received: from foss.arm.com (usa-sjc-mx-foss1.foss.arm.com. [217.140.101.70])
        by mx.google.com with ESMTP id z22si4387032eji.331.2019.05.13.09.05.52;
        Mon, 13 May 2019 09:05:53 -0700 (PDT)
Received-SPF: pass (google.com: domain of dave.martin@arm.com designates 217.140.101.70 as permitted sender) client-ip=217.140.101.70;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of dave.martin@arm.com designates 217.140.101.70 as permitted sender) smtp.mailfrom=Dave.Martin@arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.72.51.249])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 322A5341;
	Mon, 13 May 2019 09:05:52 -0700 (PDT)
Received: from e103592.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.72.51.249])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id AB16F3F71E;
	Mon, 13 May 2019 09:05:50 -0700 (PDT)
Date: Mon, 13 May 2019 17:05:48 +0100
From: Dave Martin <Dave.Martin@arm.com>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: Andrew Jones <drjones@redhat.com>,
	"richard.henderson@linaro.org" <richard.henderson@linaro.org>,
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
	"armbru@redhat.com" <armbru@redhat.com>,
	"qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
	"abologna@redhat.com" <abologna@redhat.com>,
	"alex.bennee@linaro.org" <alex.bennee@linaro.org>
Subject: Re: [Qemu-devel] [PATCH 05/13] target/arm/kvm: Add
 kvm_arch_get/put_sve
Message-ID: <20190513160547.GM28398@e103592.cambridge.arm.com>
References: <20190512083624.8916-1-drjones@redhat.com>
 <20190512083624.8916-6-drjones@redhat.com>
 <20190513123110.GE28398@e103592.cambridge.arm.com>
 <20190513135501.ztggqdac57qbpuft@kamzik.brq.redhat.com>
 <20190513153116.GL28398@e103592.cambridge.arm.com>
 <CAFEAcA95LbXZOJNUAYuYoVDkM0auj-RGACXPp9Qe9ANp_b3C=w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAFEAcA95LbXZOJNUAYuYoVDkM0auj-RGACXPp9Qe9ANp_b3C=w@mail.gmail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-TUID: xGYxvFTvXX5A

On Mon, May 13, 2019 at 04:40:52PM +0100, Peter Maydell wrote:
> On Mon, 13 May 2019 at 16:31, Dave Martin <Dave.Martin@arm.com> wrote:
> >
> > On Mon, May 13, 2019 at 02:55:01PM +0100, Andrew Jones wrote:
> > > QEMU keeps its 128-bit and larger words in the same order (least
> > > significant word first) for both host endian types. We need to
> > > do word swapping every time we set/get them to/from KVM.
> >
> > I'm not sure whether this is appropriate here, though it depends on
> > what QEMU does with the data.
> 
> The layout is optimised for TCG emulation to be able
> to work with it, I think (rth would have the definite
> reason, though).

So long as we are agreed about the ABI, this is none of my concern :)

> > Something non-obvious to be aware of:
> >
> > As exposed through the signal frame and the KVM ABI, the memory
> > representation of an SVE reg is invariant with respect to the
> > endianness.
> 
> Yes; we handle this conversion as we write out the signal frame:
> https://github.com/qemu/qemu/blob/master/linux-user/aarch64/signal.c#L184

Right.  I hadn't focused consciously on this, since the architecture
does the work for us in the kernel (mostly).

I will check the documentation to make sure the behaviour is clearly
described, anyhow.

Cheers
---Dave
