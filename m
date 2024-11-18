Received: by 2002:a17:505:a60a:b0:1be9:327d:8ee3 with SMTP id qv10csp2679632njc;
        Mon, 18 Nov 2024 07:54:35 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGRAJZCq4At3zwn/GT5bJZSdPkww27X8Ar8TUy2IaFI6qgkvTkUn57/fMiBGiZFTT1o2u8X
X-Received: by 2002:a05:622a:1455:b0:461:2b8b:52db with SMTP id d75a77b69052e-46363e944a9mr209538741cf.37.1731945275160;
        Mon, 18 Nov 2024 07:54:35 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1731945275; cv=none;
        d=google.com; s=arc-20240605;
        b=KkL5DoXAhTgNhJOeF+cllWgLRUFQ/bCEa+xsjPTwOElcJO+x8O3h7OWu+r2revtk1V
         H3MXy3wx17Prh0dYfceXea1F5eEe4t5TctzkmirOtop/QgLMCymt27ykoENhYlG22nDr
         dMhDIec6unOtw+My6tbGbsVr8R9SvcQvGb1sv58nWgWzpxSlqyEm6T/s1djX9CYe5mhE
         CeGiD6QROOGnl/+rehrdcDZ6Cf5WywBb4KrH+d14TKhzqdR++wPzwgUzsF1S4bbAJwbn
         VNzSpf7AaGwZWMtEELIxQn5NkOoA1vWdmTiD/BIoCfu3JyLUqlQp8+U6VKD/LOJlq00V
         Mamg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Wa1r9aZImSfGgniRWdh7zmJr4Ai6Q7DzylMHq8VWga8=;
        fh=yRPYJMpCFfsMzYGtxoZIVOEqgSWxs0L87n+SAUvZeNI=;
        b=ED3YiNE/f+P0fK885K9gN+ZRJ3S7ROABk4o4No/ismNTpjCdd7s+QJInSgnM6Qy8ym
         BiTAycsyCSxSmHD0WOwbvDqdKok4NfyRTwffjoEDwt1IrFwXV75E1GtSoJwaL035batH
         MsyU5c0449NveR4hygMa/Rm8q0z1FgLfUvM2VJkFniyyOk621wgjdiK7/UjscviWEOQM
         SJkYxKl3SXwEx6aAVqNqHMaUaj9I8CRfY39vEGzy59HLntKFobx5AZcurPodT8nJQBJj
         V1gt/XXAyTEeHlh3Ofi0voHGD+OXBBL+v8kuq1VBKDKVrnnIXDGP9bhRY2aNC96au74/
         nSYw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=KSBY6ZXZ;
       spf=pass (google.com: domain of pbonzini@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=pbonzini@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <pbonzini@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id d75a77b69052e-4635aa97288si106415101cf.229.2024.11.18.07.54.34
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Nov 2024 07:54:35 -0800 (PST)
Received-SPF: pass (google.com: domain of pbonzini@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=KSBY6ZXZ;
       spf=pass (google.com: domain of pbonzini@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=pbonzini@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1731945274;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Wa1r9aZImSfGgniRWdh7zmJr4Ai6Q7DzylMHq8VWga8=;
	b=KSBY6ZXZWdNQh4V7/wDqPsA2gBenRLtVNKh3cfcrG9fw/GKL+AanwqPJBSVxOdwsv8de1d
	cWJC8CzfUmGOqVahJeIC6MI3lmpHfwJevh3vbuNjU8Qvw+2lFUv3gtjq7+GkMsXl5g8WRE
	tar2ekUtPRFYDRVqiiBdXuzGqMrqJoU=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-118-S85Mh7OXPBO_kDUn8Qe0vw-1; Mon, 18 Nov 2024 10:54:33 -0500
X-MC-Unique: S85Mh7OXPBO_kDUn8Qe0vw-1
X-Mimecast-MFC-AGG-ID: S85Mh7OXPBO_kDUn8Qe0vw
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-381d0582ad3so1689723f8f.0
        for <alex.bennee@linaro.org>; Mon, 18 Nov 2024 07:54:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731945272; x=1732550072;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Wa1r9aZImSfGgniRWdh7zmJr4Ai6Q7DzylMHq8VWga8=;
        b=piBik97X8RE+Kz0tmQ1ohUKzMd47hhp08fT2QnN4Afj3i0jJ2bqGFbqBYtmoIFH4pE
         G8G5Pxv4q+kcrpbnF3uPyJ8L7ur0wazw3f/hoJPluQih5kHNbMy0AbC3FuK+GCMGp7BK
         bwMW2NJVdEuyzwgryuvymAEf3F/q3qyZyIRvktM5tginhpyt1AXJOYsXEkS7drXn2aEQ
         UHF2AN9/tuYpWc8qpyYG0I05YiT8VNWdqB2PxkZVPCqaM3PpH0vXvOlmzt2UXwSpsDza
         SlNQ3SwbHRQpUPtBblaMFyTWRXRPDO3IovjNDfa3GQg/dlvyJJPCW1K60pQQ/5/0Zh9P
         NiwA==
X-Gm-Message-State: AOJu0YxR5OZGSBCVZNgYlarSN05AKmFWHMHNC5OgVTR8Dpu141eNDFJq
	aJ3WcZgKQyWbbzhTS1J9Rkvn3iCq9esr9Z0j60eYGG5Kt86kbLhLuDivhMnlbaVj6aM61Uy/26T
	tDLzepQ0ICNfGxnE3imrfiO7E29iG2I2LVz+bbbFc5QXEdHHKFk1rEBSj8tkHvVZE/0xciqwlvi
	66E2ydeYeS/8JTN0rkYbnsV9g5oBi0
X-Received: by 2002:a05:6000:2ac:b0:382:2f62:bd3c with SMTP id ffacd0b85a97d-3822f62bf96mr9747287f8f.19.1731945272378;
        Mon, 18 Nov 2024 07:54:32 -0800 (PST)
X-Received: by 2002:a05:6000:2ac:b0:382:2f62:bd3c with SMTP id
 ffacd0b85a97d-3822f62bf96mr9747269f8f.19.1731945272025; Mon, 18 Nov 2024
 07:54:32 -0800 (PST)
MIME-Version: 1.0
References: <20241117161039.3758840-1-manos.pitsidianakis@linaro.org>
 <875xoku5vd.fsf@draig.linaro.org> <n5ibr.51opa2z9dha@linaro.org>
In-Reply-To: <n5ibr.51opa2z9dha@linaro.org>
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Mon, 18 Nov 2024 16:54:19 +0100
Message-ID: <CABgObfaO0eppxerv=VDy7D9dhHJyUtqiQQn0ZWDNsaZpuBXmRQ@mail.gmail.com>
Subject: Re: [PATCH v3] rust/pl011: Fix DeviceID reads
To: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
Cc: =?UTF-8?Q?Alex_Benn=C3=A9_e?= <alex.bennee@linaro.org>, 
	qemu-devel@nongnu.org, qemu-arm@nongnu.org, qemu-rust@nongnu.org, 
	Gustavo Romero <gustavo.romero@linaro.org>, Peter Maydell <peter.maydell@linaro.org>, 
	=?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
	Pierrick Bouvier <pierrick.bouvier@linaro.org>, 
	Richard Henderson <richard.henderson@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: nsRba3PWnS0CkTZRRvHDnnEO0yBjNOwMEFfcqMdCbaA_1731945272
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: EbQINEICr+iJ

On Mon, Nov 18, 2024 at 3:46=E2=80=AFPM Manos Pitsidianakis
<manos.pitsidianakis@linaro.org> wrote:
> Yep, const fns are evaluated at compile time

This is not correct; "const fn"s *can* be evaluated at compile time.
In this case they won't since "self" is only available at run time.
The match statements persist in the final compiled code.

> >Perhaps this comes down to unfamiliarity with the way macros are working
> >here but in general macros should be eliding boilerplate to allow us to
> >concisely represent the relevant data and functionality. Here it adds an
> >additional indirection when reading the code just to see what is going
> >on.
>
> Well in the previous patch versions the concern was that it was
> "verbose". But even if the registers are available as memory mapped in
> the device it's the wrong abstraction to use here; this is a higher
> level language than C and using indices is a "when you have a hammer
> everything looks like a nail" situation.
>
> We have different programming paradigms in Rust, allowing as to have
> documented code (via rustdoc), so either we take advantage of Rust or we
> don't.

Your usage of macros also is a "when you have a hammer everything
looks like a nail" situation. You're going straight from code that
might be a bit C-like to code that looks like Perl. Rust macros can be
useful to reduce boilerplate, but in this case the macro-based
solution does not make it much easier to see all values at once for
verification purposes, and makes it harder to understand the code's
behavior.

What makes code more "Rusty" would be things like using Result for
error handling, taking advantage of the type system, using traits for
polymorphism, using references to guarantee memory safety. QEMU is
hardly doing any of this, and the rustdoc for qemu_api is also just
starting, so maybe this patch is getting a bit ahead of ourselves?

It's not reasonable to use 50 lines of code just for eight
identification bytes. Even the spec says "The registers can
conceptually be treated as a 32-bit register", which to me suggests
making its contents a u32 const and calling it a day. But if you want
to make it overengineered but sensible, then do this:

const fn getPartNumber(self) -> u12 {0x11}
const fn getDesignerID(self) -> u8 {match ...}
const fn getRevision(self) -> u4 {0x1}
const fn getConfiguration(self) -> u8 {match ...}

and then a getPeriphId(idx: u8) that puts the four together in a u32
and returns ((val32 >> (8 * idx)) & 255) as u8.

For PCellID, the spec itself says the value is 0xB105F00D, so *please*
just hardcode them in the read method. Anything else is a waste of
everybody's time. And since we're in hard freeze, maybe we should
reconsider the one line fix and leave everything for later.

> I had sent patches on a previous patch series that only some patches of
> them were picked up for merging, I plan to send a new revision soon

Cool, thanks.

Paolo
