Received: by 2002:a19:c345:0:0:0:0:0 with SMTP id t66csp3497328lff;
        Sun, 15 Dec 2019 07:27:26 -0800 (PST)
X-Google-Smtp-Source: APXvYqyZyN1lAEr/EXQzoLVf6qvRzheMHNe5FWIzzcBZQ6VecEaO7OBQ9J5IyCubYCSxnqEsiM1Z
X-Received: by 2002:a05:6830:128e:: with SMTP id z14mr25820438otp.184.1576423646062;
        Sun, 15 Dec 2019 07:27:26 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1576423646; cv=none;
        d=google.com; s=arc-20160816;
        b=Rb3ckRR/gHl9WYJYKKwp0FxZkV8sYKP2hUt7U32diKnn2qqy7lYr3AX+xYmHfKISCx
         qfOEYqQCetrSAB++uQeoSx8/HzfYdxr5MxgoHk6EcK4RpTHan5XK5LVrFw6UW+AhaFy8
         ILS1qsJJjFkcNovNRgBXHREK0G+VF97q+MEDakXNmMBQHZtzLblgbyUY6N5NoFO2tSS7
         zZ95dWl2OewdxtTxQqv+pqKJKU/vOVn+mXW3YUtEEX2zZfnrd5Vk27k5niJEDMFTmSGa
         ehnohJMQ82oitBxT7hZ46qXspXwPlsMNFc78o7NqlnidnyEcUkG8/2OlEqH+u/SYn7zQ
         O3XA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-id:precedence:sender:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=7RRaL3Yvu+i2tlgto54WRPCcxOMll246e8ITYnRGwDI=;
        b=nooO4DLMhzOrFtAnpmoRWhQF2woN92+F6CHzKrrbZosil5QGbDBRMsEFNEMiaOVMt1
         ylz/nZxSfSRlj+gwz4YbFqHrfmtUrtkVpqcv/M4M90TmcAv6xVf2bkV4nZCNzXDg+Oy4
         1R4D73c8MRCQB95+Dh6KL8Q4rQ9Oruw7YdpDENcS551DWCq3ebr2ayRNVO/crxFqBBAz
         415jm6hUyr6oMErI1G/WXd1oH+FHUb4nnh1Dvc22RwUrQbT+HaNjcRSiBC/33v2H67FY
         f2aCLzPAOy6nPs2oKQNhxPeKRL7SdS52fgumI4I+uRpKd0kss2j0w6jHOVZUOocS6Ubn
         m1TQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=afNFnLcr;
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <kvm-owner@vger.kernel.org>
Received: from vger.kernel.org (vger.kernel.org. [209.132.180.67])
        by mx.google.com with ESMTP id u16si8980436otq.92.2019.12.15.07.27.25;
        Sun, 15 Dec 2019 07:27:26 -0800 (PST)
Received-SPF: pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) client-ip=209.132.180.67;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=afNFnLcr;
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726437AbfLOP1Y (ORCPT <rfc822;daniel.diaz@linaro.org>
        + 4 others); Sun, 15 Dec 2019 10:27:24 -0500
Received: from mail-ot1-f67.google.com ([209.85.210.67]:34180 "EHLO
        mail-ot1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726282AbfLOP1Y (ORCPT <rfc822;kvm@vger.kernel.org>);
        Sun, 15 Dec 2019 10:27:24 -0500
Received: by mail-ot1-f67.google.com with SMTP id a15so5621724otf.1
        for <kvm@vger.kernel.org>; Sun, 15 Dec 2019 07:27:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=7RRaL3Yvu+i2tlgto54WRPCcxOMll246e8ITYnRGwDI=;
        b=afNFnLcrQzgm3wKSvboSfSwxBBar1xP6aIEXir1TfRJQmEcuWTD8m3Prm2Zq1+sUXn
         mufCXi5v4RO9S72Bxj7dEdCY5OMGgbnL9SHZPMT4lPDfwGWZCW6xGMjfFKwSSeGp468G
         YRwhcW4YLUfvSJhZ/z/W9In99fNBrOcoAY+fPrMzi6LvpiP9gaH4MLQ3TmKbVl/mG5dC
         gNafKso8pqii1V/qe69nCCWYxcY7r/G0x7cTtKThfdT3IrXKQMmv1S5zO/bcFFPL3gQk
         ennG+TzktZvgs3k5QvrL37Gf+inJjSzJTez2gfFOsECR4j63ThkjNmuSzGA84iPqgYQy
         GofA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=7RRaL3Yvu+i2tlgto54WRPCcxOMll246e8ITYnRGwDI=;
        b=kTyRxjci76yYPxAw4eqDb6AkogXWAHM6J7/tLs5lf38Ds/Ce2UxatKSs6Ul1TPspb4
         oNtBjEBGmUEbK/jlM3AMHNSJL9HbyIXHR6vRLE7IOHvhi03D5sD+N09+nZzO1CeuHxkV
         7O+j3XvX40BlayGGhh5ysCH55w1erlt3c6uEsYpXYaAj5JE9NyIF+I9Rs2aOAp68jLLc
         0z+ZQiQcuWhRBd0YmzqArMK1h/GB4ZSzrf+ir22EcZhvAl8wT9vcLr5eiVu0Nq5Et5UV
         aFVqB1HCop5woHPICdymI6gKfHnlAjTs+SBzR+nGyoCdpq2M12migV1LOy8L0LFXQCs3
         19nQ==
X-Gm-Message-State: APjAAAWGap7gsvvWZjBmz/mmhPbCSo3twVRUN04ZTlLIlra4VxEQncuo
        qVVF8cCz8RC72x8q28etkl3KmoFtmH+upP2nggdHaw==
X-Received: by 2002:a05:6830:2001:: with SMTP id e1mr25512778otp.97.1576423643528;
 Sun, 15 Dec 2019 07:27:23 -0800 (PST)
MIME-Version: 1.0
References: <20191214155614.19004-1-philmd@redhat.com> <CAFEAcA_QZtU9X4fxZk2oWAkN-zxXdQZejrSKZbDxPKLMwdFWgw@mail.gmail.com>
 <20191215044759-mutt-send-email-mst@kernel.org>
In-Reply-To: <20191215044759-mutt-send-email-mst@kernel.org>
From:   Peter Maydell <peter.maydell@linaro.org>
Date:   Sun, 15 Dec 2019 15:27:12 +0000
Message-ID: <CAFEAcA9ZF3VTR7kG_D-cJ+vPFTgd8zjmt2VPfJC7urNemF-5AQ@mail.gmail.com>
Subject: Re: [PATCH 0/8] Simplify memory_region_add_subregion_overlap(..., priority=0)
To:     "Michael S. Tsirkin" <mst@redhat.com>
Cc:     =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>,
        QEMU Developers <qemu-devel@nongnu.org>,
        Andrew Baumann <Andrew.Baumann@microsoft.com>,
        Aurelien Jarno <aurelien@aurel32.net>,
        kvm-devel <kvm@vger.kernel.org>,
        Alex Williamson <alex.williamson@redhat.com>,
        Aleksandar Markovic <amarkovic@wavecomp.com>,
        Joel Stanley <joel@jms.id.au>, qemu-arm <qemu-arm@nongnu.org>,
        Marcelo Tosatti <mtosatti@redhat.com>,
        Alistair Francis <alistair@alistair23.me>,
        Eduardo Habkost <ehabkost@redhat.com>,
        Richard Henderson <rth@twiddle.net>,
        Aleksandar Rikalo <aleksandar.rikalo@rt-rk.com>,
        Paul Burton <pburton@wavecomp.com>,
        Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
        "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
        Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Sender: kvm-owner@vger.kernel.org
Precedence: bulk
List-ID: <kvm.vger.kernel.org>
X-Mailing-List: kvm@vger.kernel.org
X-TUID: AfVUMOviw4E5

On Sun, 15 Dec 2019 at 09:51, Michael S. Tsirkin <mst@redhat.com> wrote:
>
> On Sat, Dec 14, 2019 at 04:28:08PM +0000, Peter Maydell wrote:
> > (It doesn't actually assert that it doesn't
> > overlap because we have some legacy uses, notably
> > in the x86 PC machines, which do overlap without using
> > the right function, which we've never tried to tidy up.)
>
> It's not exactly legacy uses.
>
> To be more exact, the way the non overlap versions
> are *used* is to mean "I don't care what happens when they overlap"
> as opposed to "will never overlap".

Almost all of the use of the non-overlap versions is
for "these are never going to overlap" -- devices or ram at
fixed addresses in the address space that can't
ever be mapped over by anything else. If you want
"can overlap but I don't care which one wins" then
that would be more clearly expressed by using the _overlap()
version but just giving everything that can overlap there
the same priority.

> There are lots of regions where guest can make things overlapping
> but doesn't, e.g. PCI BARs can be programmed to overlap
> almost anything.
>
> What happens on real hardware if you then access one of
> the BARs is undefined, but programming itself is harmless.
> That's why we can't assert.

Yeah, good point, for the special case where it's the
guest that's determining the addresses where something's
mapped we might want to allow the behaviour to fall out
of the implementation. (You could instead specify set of
priorities that makes the undefined-behaviour something
specific, rather than just an emergent property of
the implementation QEMU happens to have, but it seems
a bit hard to justify.)

thanks
-- PMM
