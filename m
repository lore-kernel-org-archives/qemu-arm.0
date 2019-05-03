Received: by 2002:adf:9061:0:0:0:0:0 with SMTP id h88csp486043wrh;
        Fri, 3 May 2019 05:12:23 -0700 (PDT)
X-Received: by 2002:a9d:7616:: with SMTP id k22mr6055643otl.51.1556885543473;
        Fri, 03 May 2019 05:12:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1556885543; cv=none;
        d=google.com; s=arc-20160816;
        b=rMeqoSX6PVJ0jSGH0lkCD9/ZWAPOB0a7ceCe2+ivBjgYPGHFNaW7YDwgvrqkRN8YuK
         ShsqEtKAzRGUfyw8RG5ecgv+JLV4bwVuTEhzBG/zR4i/SHLMSnvrDfGNp4X4C3bxS8r/
         GdtrpAoIiMz1aeoON3/bHZYipNNLTNtLC9VfMx2bEtOZ2SZ0RJLuGr0020loA6rbmfeC
         2gb1LW8/HGXZZqUTwOn9MrYyWgqYtol4/XCQpzmDEYXcO5ju5JSNIQtQjWSQY7iMV73M
         S82wGyYjYmxYVF9C1pKiIqXWuRZhJCTlTJKZ3103V8cnyksUBKhlqW2R1WIZq4oL5jBl
         JEmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=xY4c6NQjMMrKGjoUgDqOaSKuTDDWLkPb/all4IGS2jc=;
        b=v+VGF6nM/Ell3mNsmrEgH8w9sugF4oo6UXaLFTUZ4jilizNveJ+S/Ii3g3W2K+lCZ1
         Hbq2bWpvpqniJ1m+ZkJ9MjnivhIQyr92acOrg902SsthhT5YTjOlCIl6w/bK9+Osr7hA
         GHgt6PmxD2tvSDK7CvcbycJH+gNAZCXBdaYDtu71XkzSuBKmfffhBVRSYD1+WYyOtYXV
         /xXtUKj68P5I9rQ7zAFc/JAq+TLVyfgwZAbpYckp+tot46EVSXMRBcnUPfE6ua7JTHch
         qjGYh8m0yWeTX353wJjab5S+DeC/8My26CC6z17kh9F2+3w6I6aa3t57OE/gXvkJNCd6
         BWIg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=daBevHAB;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id g4sor800542oif.125.2019.05.03.05.12.23
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 03 May 2019 05:12:23 -0700 (PDT)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=daBevHAB;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=xY4c6NQjMMrKGjoUgDqOaSKuTDDWLkPb/all4IGS2jc=;
        b=daBevHABE5he1oZESthBSkjMDnCRJBbZo94xf+lOhRKR6NY0UGoc10nv1/LzuM+ThS
         Uv9iM3QxiTtacaUJD9n8cjEntG9uQX8gzAOEP/co3Xqw5p35p87ZHYuA4WrrwjU30Huk
         lqqM0T8hYeRSwTFZf7h8XTvehPXGC3EYLUhyHTj/6KvcXTPDJfVGAqKqCZ3xs2bDsd9N
         yunlEgG0yLTAdy3ox/5epC8yzPqRdu37jOzbJBpeR37dDS+k9rMGtL0cn0TuGn1CWbzN
         RNDl4FNEBT3PBXRm7agD5Z0op1Oc8Ra5XjOgZTT37yr1t7WQbxTMhkBzSpULFUZGch0D
         c91w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=xY4c6NQjMMrKGjoUgDqOaSKuTDDWLkPb/all4IGS2jc=;
        b=AuGBd1zHCKLZigyKUSBLhATNXqjjTUYm4mpogj591w26R0OpKUimTVDqnP/EGg8dNQ
         AUEztsWuzoEJxRNHE/2HfsPymb0ekJYup+L6NyRp/p31gy+l7nwEH7gVBXsl5vuAPvhc
         aWL/pV7Pi1U4Z9CRgCu/J1wkZo5iSk/QSdiHi9IHQQJ64HLlW6G93tfy5DYGoIoa84Lk
         t0mYYtIusBmWIzMLIpOpd6R1imYCYPco8f/lnQBuEOeTygw0AuTDKHbigTku1zz8+ELI
         ++m/2EqD8LOTwwt9f3ArmPV12P/qlz80XASxq7b5V4OemZmpFAAMKwg5Fs5dagmpOvs3
         A1jQ==
X-Gm-Message-State: APjAAAXBU6p7SrEzgach+/T7CxXLvBdbVw3nk8A/jGHC0xnmSq/HO4xI
	weqKDxBPeYlUTDs2FhLgqGVRDZMc2x/gMhJbAcOumJ9xejxblw==
X-Google-Smtp-Source: APXvYqznBDqv2ujVNsqrz4w/CrWOOXV5WBLhCQncNPWtsD8CQe6/ps/pNkqEtiLCs4xG0CXi6iG1l+zkseXdL4bwvLo=
X-Received: by 2002:aca:ab12:: with SMTP id u18mr5314971oie.48.1556885542950;
 Fri, 03 May 2019 05:12:22 -0700 (PDT)
MIME-Version: 1.0
References: <20190315143057.20165-1-peter.maydell@linaro.org>
 <87sgvkw4vp.fsf@zen.linaroharston> <CAFEAcA_n2MvRfCdydianR9EgDxdP093+Fi-Co2WRa0ncAF=Pgg@mail.gmail.com>
In-Reply-To: <CAFEAcA_n2MvRfCdydianR9EgDxdP093+Fi-Co2WRa0ncAF=Pgg@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 3 May 2019 13:12:11 +0100
Message-ID: <CAFEAcA88dHzePhpOBdKFXr4HpF3J40FqY6qdwFpNhyBgxbehkQ@mail.gmail.com>
Subject: Re: [PATCH for-4.0?] arm: Allow system registers for KVM guests to be
 changed by QEMU code
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>, 
	"patches@linaro.org" <patches@linaro.org>, Dongjiu Geng <gengdongjiu@huawei.com>, 
	Eric Auger <eric.auger@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: 6ArjikNQx4H+

On Mon, 25 Mar 2019 at 10:25, Peter Maydell <peter.maydell@linaro.org> wrot=
e:
>
> On Mon, 18 Mar 2019 at 15:59, Alex Benn=C3=A9e <alex.bennee@linaro.org> w=
rote:
> >
> >
> > Peter Maydell <peter.maydell@linaro.org> writes:
[...]
> > > Support this by making kvm_arch_put_registers() synchronize
> > > CPU state back into the list. We sync only those registers
> > > where the initial write succeeds, which should be sufficient.
> > >
> > > This commit is the same as commit 823e1b3818f9b10b824ddc which we
> > > had to revert in commit 942f99c825fc94c8b1a4, except that the bug
> > > which was preventing EDK2 guest firmware running has been fixed:
> > > kvm_arm_reset_vcpu() now calls write_list_to_cpustate().

> > > Should we try to put this in for rc1? Not sure... Testing
> > > definitely appreciated.
>
> > Hmm so running my testcase:
> >
> >  * gdbstub enabled with an active sw or hw breakpoint
> >  * run userspace program in guest:
> >    - sw breakpoint works fine
> >    - hw breakpoint never triggers because guest segs
>
> Further testing from Alex suggests this is some unrelated
> bug or regression (ie not caused by this patch), but:
> since the only in-tree use for this patch is to get nested
> debugging working and it would be broken for this other
> reason even with this patch, I'm going to postpone applying
> this patch until the start of the 4.1 cycle.

Since we're now in the 4.1 cycle I'm going to apply this
patch, as I suggested above -- I'm putting it into my
target-arm.next queue to go in in my next pullreq.

We should make sure we investigate the debugging-KVM
breakage Alex described at some point this cycle too.

thanks
-- PMM
