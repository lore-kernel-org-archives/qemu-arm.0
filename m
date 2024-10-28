Received: by 2002:a17:504:c05:b0:1be9:327d:8ee3 with SMTP id k5csp1586063njf;
        Mon, 28 Oct 2024 09:16:44 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCU4wEYsWDtzFA9A258kDjGI2EeggbUBJ2+k0Yw7DRnSdHb8fnv6UnSPXvlzUw3spDlK23l/H6ZJXfyyEg==@linaro.org
X-Received: by 2002:a05:6402:278b:b0:5cb:615a:f073 with SMTP id 4fb4d7f45d1cf-5cc19645453mr125036a12.7.1730132204594;
        Mon, 28 Oct 2024 09:16:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1730132204; cv=none;
        d=google.com; s=arc-20240605;
        b=AULaE80qM/JSPOmyxnWqlMPb+ZaSW3oiNiURDOin9sMoxzSjpKnVkKBlKZOoCEILF0
         S18msH0jHk+fUHoVKDAEmaE8N59f3mj31gt00nz9xP1jbgvZrkD4gdB4YEZcGX5TOfmX
         y5sAhN67hibHLJaIoNf8AZmlCkJOqBb09g3q/V3qg81fX/Wk4XVf6AbQqFgQKHzXHwk8
         CT15+WGdnEaZPA/xfv4jHjwhj8AirhibCmVF6DYTBhPNrypR0Wuq1+wvk5E6R+LOauaY
         mYmfNBzMvgaW/66sARoJtd8Vkz4Utb9gbnud3BsYP/zlRm8fIF/PS+XTFw0bqS5Itxe5
         QKMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=6wqc0Mytncd4ocb+4kmZP30a/3t9yuKUeJQBreLTvPE=;
        fh=j2Tc2VSwuW8hbTkfwtgsx+7Su0j41k/d4RCOQ+apRAE=;
        b=etWIQDVM2i+Se5m8QUjsWhuwg5b2fKX1Jbaj/F/9qRr+NHDru6SpWpCidqvwLY76V/
         6FHF/gMKAEvqeJTQVOAu40Yqcv9UXZWvIiQ0Qj02H0UM8XUyA5bZrH3qDjxZKHjKLYmn
         4gtU2G5DXiJH/0dINND93lDoB8c/xron8onlPB0xaf/6b36pHul0jXGiovSlpCck8sn5
         ybsiZS8rDCQ2DqzP9x1f2jdnNRl8Bsyq9X5tLNS7J3F/CeyUW+apYLubeqfhOk8Fw51K
         UJq52gX8Xl+S33RZQ0EAxHs4IoOVcw1Ov8T68o+VTwEo+QrzzPLjK6hIYdqnkpvb4oY2
         pNUw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ZKiHJXry;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 4fb4d7f45d1cf-5cbb341b520sor3408904a12.3.2024.10.28.09.16.44
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 28 Oct 2024 09:16:44 -0700 (PDT)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ZKiHJXry;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730132204; x=1730737004; darn=linaro.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6wqc0Mytncd4ocb+4kmZP30a/3t9yuKUeJQBreLTvPE=;
        b=ZKiHJXryt63wN/FbSdcP4Vrvia9Dk6aeuu4e4Pm3fm3IMPqu1Sx1ncegGsh5EKGMPo
         Xm8l/2V8lDkU4u6XQNUKDY8YsKUkMWdmLmoWyofhZW+6+5jYRZxx3VtoTOZf9dkNt3MV
         1neqPoLIcab3H0NVEh67Ixf2dQLg5bLq/C08IEQQOvuKgSXYX3OjOfqXAlNUSrQ/tQTm
         H61Fx+RPVrXDscKgoGHih7vNDUo15iPz2Kphme1mwFZQyn4o7FpT78f5eRwWbTcEMDlb
         UFHJEvAb8AEo5y6MV3uUYqPZnzVZVHzSKMOdGg5X54ZxyRHK4QgJJ5QBGhfnuAS2sRar
         dJTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730132204; x=1730737004;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6wqc0Mytncd4ocb+4kmZP30a/3t9yuKUeJQBreLTvPE=;
        b=NWgT/Jq8anptssHUFZ7GGGcqFY22qo9GuMwkVwV2ugiam/X7xNkuto8aKVxyB9koow
         tmwocOwHaMtTmxkSuF02nr3pO9+9LRB1jB4hI6MMpQtPsEJjZfMtWw0RMz7PhrqRpS9U
         M8o48oB3KkeEX2WlQGyhoFvAIWIoQLQ++N4wV0Jz0bdEpatiBOxqiwYsIIU4WXrJ2td+
         GBAPzpQtxRd/404/XEEVMPOCpKO7Z7m0RlPtFrTzqAsrdQduxZsyEliKOKZQb8w+GvHP
         VRSD3ppFS4QRml8vlvYyhMzznVk4k7icsb8UWUnEqqsnNpfgR3jB6LLJ8cnxUHQgQWB1
         NUeA==
X-Forwarded-Encrypted: i=1; AJvYcCXyWUG2gHI3SxH/A6VaMMRde3w7DsYku8B5VR3HpwwE1tepwmlVldzkpg0zodJwrpHv0z5QTvPLZceQBg==@linaro.org
X-Gm-Message-State: AOJu0YzY8B5+ws/obanXktTHsxSC1+Q+XD1o65Y4bqxXj1A73h0nKuCL
	PS6t/5Na2skchLgwmnFNIF4YAZ4djdjPFnGH3+USfdXC0epjcJkodEr/h69txeGhgTwsWpaAWuN
	Uh+jFY4haBbDrwB8lLpCDZqZCTfQCfd9clzcr3WrK
X-Google-Smtp-Source: AGHT+IFSr9SWfgXnn1VX0OvmWu0cAtcZmGcuumJXCuQuyg7HC2Kje6V2twZXQfCfvpGcOd/Llmg2R9DBtIU36NHY3sQ=
X-Received: by 2002:a05:6402:d08:b0:5cb:77d1:fd7f with SMTP id
 4fb4d7f45d1cf-5cc196360f8mr133123a12.7.1730132203869; Mon, 28 Oct 2024
 09:16:43 -0700 (PDT)
MIME-Version: 1.0
References: <20241025101959.601048-1-eric.auger@redhat.com>
 <20241025101959.601048-19-eric.auger@redhat.com> <ZxuX4i9NjVRizB72@redhat.com>
 <cb6c8f62-c5dc-416d-865f-fbdf96164dac@redhat.com> <Zxub7ol4p8P_sWF8@redhat.com>
In-Reply-To: <Zxub7ol4p8P_sWF8@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 28 Oct 2024 16:16:31 +0000
Message-ID: <CAFEAcA_wQu17y0PyQwxw0wuf2H5y2VE5aX16nLP2-u7QUP2ggA@mail.gmail.com>
Subject: Re: [RFC 18/21] arm/cpu: Introduce a customizable kvm host cpu model
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Cc: Eric Auger <eric.auger@redhat.com>, eric.auger.pro@gmail.com, cohuck@redhat.com, 
	qemu-devel@nongnu.org, qemu-arm@nongnu.org, kvmarm@lists.linux.dev, 
	richard.henderson@linaro.org, alex.bennee@linaro.org, maz@kernel.org, 
	oliver.upton@linux.dev, sebott@redhat.com, 
	shameerali.kolothum.thodi@huawei.com, armbru@redhat.com, abologna@redhat.com, 
	jdenemar@redhat.com, shahuang@redhat.com, mark.rutland@arm.com, 
	philmd@linaro.org, pbonzini@redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: dMHpGp5kXPtz

On Fri, 25 Oct 2024 at 14:24, Daniel P. Berrang=C3=A9 <berrange@redhat.com>=
 wrote:
> On Fri, Oct 25, 2024 at 03:18:25PM +0200, Eric Auger wrote:
> > On 10/25/24 15:06, Daniel P. Berrang=C3=A9 wrote:
> > > Also, is this naming convention really the same one that users
> > > will see when they look at /proc/cpuinfo to view features ? It
> > No it is not. I do agree that the custom cpu model is very low level. I=
t
> > is very well suited to test all series turning ID regs as writable but
> > this would require an extra layer that adapts /proc/cpuinfo feature
> > level to this regid/field abstraction.
> >
> > In /cpu/proc you will see somethink like:
> >  Features    : fp asimd evtstrm aes pmull sha1 sha2 crc32 atomics fphp
> > asimdhp cpuid asimdrdm lrcpc dcpop asimddp
>
> Right, IMHO, this is the terminology that QEMU must use in user
> facing APIs.

/proc/cpuinfo's naming is rather weird for historical
reasons (for instance there is only one FEAT_FP16 feature
but cpuinfo lists "fphp" and "asimdhp" separately).
Currently QEMU only has to care about cpuinfo name tags
in linux-user/elfload.c where there's a bunch of data
structures for "what hwcaps do we need to advertise
given what the CPU has?". I would definitely prefer it if
we could use architectural feature names...

On other architectures do we do anything to forbid
invalid combinations? For Arm there are architectural
rules about feature X requiring features Y and Z.
Are we going to just let the user create a CPU that
the guest OS will barf on if they want to? (The
user-experience for that is potentially not very nice,
because something like "-cpu cortex-a57,+sve" seems like
something you might want to do but isn't actually valid;
even listing the direct required dependency of FEAT_SVE
like "-cpu cortex-a57,+sve,+fp16" isn't sufficient
because SVE is optional-from-v8.2 and so a guest could
in theory assume the presence of anything mandatory in
v8.1 and v8.2. But even merely diagnosing invalid
combinations is a huge pain, and automagically pulling
in every mandatory implicit or explicit dependency
seems like it might be surprising to users, as well as
being annoying to implement. Currently we sidestep
all of these problems by (a) only allowing the command
line to disable a feature, not to enable it where it
didn't previously exist and (b) mostly not providing
command line flags for individual features...)

thanks
-- PMM
