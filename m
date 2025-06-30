Received: by 2002:a05:7300:232a:b0:178:84eb:402c with SMTP id r42csp2545156dye;
        Mon, 30 Jun 2025 08:23:12 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWkIuJlTYh78inWc4Jl9jQGbLiGLjZz3qAOklCWdVyrwYGOkxwVpJx3j/tzEjy4vVWHD0ZgA1jhGx28YA==@linaro.org
X-Received: by 2002:a05:690c:7105:b0:70f:83ef:ddff with SMTP id 00721157ae682-7151719a23emr198626197b3.30.1751296992128;
        Mon, 30 Jun 2025 08:23:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1751296992; cv=none;
        d=google.com; s=arc-20240605;
        b=jIcn8MNLq/oy8OqLummlLcaev//7oYDbHAakf+IQtgSDmZEUaGCWxIIiSi77k3wtUo
         glY0HIk1LEgGg/Pij28dqzS+iSPE4LLEeZgBaFmre3t86wY4NaQVEK/nWKAP+0ZxhZQj
         CSRBfUMs0UNV3hsP5e0YelGBQE5+AVGhtAwW5y6YDTCO0erhGsaXnqffWZ3f6/Ix+0gm
         +8qfR5QUtD2FtzDNZ4/RJY7vj2+py1oKolDkju9IHk7IibhRBVeoSSBAzW5Tbqd37cY/
         WmWLVMCIgoS82uRNCmrHve+Ix+cupzDUiyr9VfSpIlZX6ZR4AIXA/lj/VykRxU7Pp6Dx
         nIxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=m40CaCvXv6dQ/Kik62QOQVVIz2NlJXmaGa9e5MrI4kA=;
        fh=qnpvK+ylMf0XIhTLX1H1uZ/3NkhMtb40CsJAOc7BNNI=;
        b=BFJZeXyWEl56ovVoI+jNVKuOBNfK0SAWIp8KnMv/5tR6k741M/9syR6ei04iUed+4v
         4Nwuct0PxnWbqvYQpWCrlXSniFBJZXsxXPsZd7PiRqiR1LyV3f5y3h5yUQEaI3ozVH18
         3eXPSz/v6gLqmUqos8vA9mb5/jfYjJLxp4y9xOg+XBMNs0dG8L2L0joOWHgp5Kh+SAjS
         7X9FwN8rq4WikmNVWMVCOoDaEGB0ozNyrNRbA3TozsstIvokhFGjb4yxueAgVJLD7rr7
         nieItv+7XiD89k6t9kvenBwzRK3nZfdW9log1ZY/F3hKFVXe0mLNfrAwdjSvifq3UQ5Z
         U2DA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=WF92Y6th;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 00721157ae682-71515bff2f0sor50241257b3.5.2025.06.30.08.23.12
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 30 Jun 2025 08:23:12 -0700 (PDT)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=WF92Y6th;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751296991; x=1751901791; darn=linaro.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=m40CaCvXv6dQ/Kik62QOQVVIz2NlJXmaGa9e5MrI4kA=;
        b=WF92Y6thHC6geWhmd24S9mSkdEQytTC8YJKl+hsRXLMsTSxZBwooaf9j3JRN+p1yw6
         LZMrRFlp5VZYDhtoldvlrI20tKUpYQ12lbWGiMszQvQ9PCbN5Z0eUbfaBJZlRdH3zYhO
         CJQazl44dN2wj5oNTUQZrWPP06Uejgy4lCWhgrjzNSm7UO0NdHQ9KO5jXcCe50Si9L/a
         rnryGqLZcUmJUWjD63YagQN1zXsvr6njwscVuuzx0kX3vs6NENu+RvuNv0767f0X/E8M
         wwYBmHz3VGhcFMPpGTPgHtyBrnWcN0rFhU5lt9XlMiIvHjUyke4zhSUEFwNYuQvmccy4
         Zd3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751296992; x=1751901792;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=m40CaCvXv6dQ/Kik62QOQVVIz2NlJXmaGa9e5MrI4kA=;
        b=eZYVzFQadKM8ZPGKD493e252SFS5IHKK8UeO+vPlWMIzjgM3ScXgrQY0ZLKbwbU3mL
         e7p606WjxiLMgqvnFXjIHVm+qhUNzKusHtgMggyUp8AenoVzI2Wtm0HI7kP+3wPt/Wye
         rK1NEkrfISjZWhFfNXLLKxds+odDtHJiFitzbMNj4iyJ+v1aWOLHzEh51IrOL7fP3+R4
         /xOkW8X0YdIGFzVY6kc1TjCZkIsJo1rtuIpjthxTEjecnczZ8k3n5X7BIE+XOuSWvPvz
         69h9CUPDENmmu5onwSHWOnvLSI0XO49NbST09xkc9yyK4rM5kq8sjfORC8UITj+/cZ3K
         gqog==
X-Forwarded-Encrypted: i=1; AJvYcCXwDHCe7jnljvm8teatJHrSXo+OeqgB6v6dZp19gjLVEbNzV9jgkI+FKJGH+iedTQJa4V4I7NpPlTZ+6A==@linaro.org
X-Gm-Message-State: AOJu0Yx4kdFQ8yFYJT58s4fPH//LCERoiUTm8hcoVZ4YdOQXE7HH+D0C
	eBRsZfp38ULiseNjENbdXaTb9HSH0mBTP+T/l73GK/lo7UXXrJm8BXqS47l0BqTNDTeRo7Fy8It
	vAIeQTO8Sss/sbGdPS62HrGZMy2Q4oKPUz7RXDABEZraf
X-Gm-Gg: ASbGncvzNXVQuRWd+WgA3WFBhVG2/lX74wSWC9pj5ZFXRXX7qaZMTz/cEvIzabNkv4e
	Akwz0DcvWn6J17FAPBvDJL2mhEMATnKtXCuYQHv0XcNBdzjx1u12MgGUigma6v6CxmhVOLpn/XT
	uHSVpF7yJb85Wehk319hTfN74zi4s4YHRrd4WxNHpvObkH
X-Google-Smtp-Source: AGHT+IFLey3gbDO7x3IaACwxZKzj8qTloEuvMAvkPa8CTVEMIeapmV9N19RDAtE8dOmUNYaIULXNoTjX4myy8R9g/Lc=
X-Received: by 2002:a05:690c:d85:b0:702:52af:7168 with SMTP id
 00721157ae682-7151713694bmr204905857b3.2.1751296991584; Mon, 30 Jun 2025
 08:23:11 -0700 (PDT)
MIME-Version: 1.0
References: <20250617153931.1330449-1-cohuck@redhat.com> <20250617153931.1330449-14-cohuck@redhat.com>
In-Reply-To: <20250617153931.1330449-14-cohuck@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 30 Jun 2025 16:23:00 +0100
X-Gm-Features: Ac12FXx_QA1CfRyIPMvH1-pew-Ema3cEXUdffZUdmGWz7Wrn2y7JuUohVq0azp4
Message-ID: <CAFEAcA9OXi4v+hdBMamQv85HYp2EqxOA5=nfsdZ5E3nf8RP_pw@mail.gmail.com>
Subject: Re: [PATCH v8 13/14] arm/cpu: switch to a generated cpu-sysregs.h.inc
To: Cornelia Huck <cohuck@redhat.com>
Cc: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org, 
	qemu-arm@nongnu.org, kvmarm@lists.linux.dev, richard.henderson@linaro.org, 
	alex.bennee@linaro.org, maz@kernel.org, oliver.upton@linux.dev, 
	sebott@redhat.com, shameerali.kolothum.thodi@huawei.com, armbru@redhat.com, 
	berrange@redhat.com, abologna@redhat.com, jdenemar@redhat.com, 
	agraf@csgraf.de, shahuang@redhat.com, mark.rutland@arm.com, philmd@linaro.org, 
	pbonzini@redhat.com
Content-Type: text/plain; charset="UTF-8"
X-TUID: VVDURO0pSYxp

On Tue, 17 Jun 2025 at 16:41, Cornelia Huck <cohuck@redhat.com> wrote:
>
> Generated against Linux 6.15.
>
> Reviewed-by: Sebastian Ott <sebott@redhat.com>
> Reviewed-by: Eric Auger <eric.auger@redhat.com>
> Signed-off-by: Cornelia Huck <cohuck@redhat.com>

Stripping out all the lines that just moved around,
here are the additions:

> +DEF(ID_AFR0_EL1, 3, 0, 0, 1, 3)

This is ARMCPU::id_afr0. If we want to store this in
the idregs[] array that's fine but we ought to move it.

> +DEF(ID_AA64PFR2_EL1, 3, 0, 0, 4, 2)

> +DEF(ID_AA64FPFR0_EL1, 3, 0, 0, 4, 7)

> +DEF(ID_AA64DFR2_EL1, 3, 0, 0, 5, 2)

These are all ID registers we don't implement yet
because we don't implement any features that are
described in them (i.e. our implementation is RAZ/WI).
I guess it's OK to list them here, though we won't
do anything with the array entry.

> +DEF(ID_AA64AFR0_EL1, 3, 0, 0, 5, 4)

ARMCPU::id_aa64afr0

> +DEF(ID_AA64AFR1_EL1, 3, 0, 0, 5, 5)

ARMCPU::id_aa64afr1

> +DEF(ID_AA64ISAR3_EL1, 3, 0, 0, 6, 3)

> +DEF(ID_AA64MMFR4_EL1, 3, 0, 0, 7, 4)

More ID regs for features we don't implement yet.

> +DEF(CCSIDR_EL1, 3, 1, 0, 0, 0)

CCSIDR_EL1 isn't a single ID register, it's an array
of them (indexed by CCSELR_EL1). We keep them in
ARMCPU::ccsidr[]. I don't think it makes sense to
have an entry in isar.idregs[] for this.

> +DEF(CLIDR_EL1, 3, 1, 0, 0, 1)

ARMCPU::clidr

> +DEF(CCSIDR2_EL1, 3, 1, 0, 0, 2)

This is an array too.

> +DEF(GMID_EL1, 3, 1, 0, 0, 4)

Another ID register for a feature we don't yet implement
(and a slightly oddball one in that it should UNDEF
until we do implement FEAT_MTE2).

> +DEF(SMIDR_EL1, 3, 1, 0, 0, 6)

We implement this as a fixed zero in helper.c.

> +DEF(DCZID_EL0, 3, 3, 0, 0, 7)

We construct the value of this one in aa64_dczid_read()
based on ARMCPU::dcz_blocksize plus some runtime info.

-- PMM
