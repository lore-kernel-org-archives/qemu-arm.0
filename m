Received: by 2002:a17:505:ab84:b0:1be9:327d:8ee3 with SMTP id pj4csp1056846njc;
        Thu, 20 Mar 2025 09:04:11 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCV/krU9yByS2cZqOJd6rZajtLGAFwJ1VDN+DtH9tjrAqeJysy+DSxxWHpRX+5Sh73dxSzq168rDhYQJMA==@linaro.org
X-Google-Smtp-Source: AGHT+IFu6NqnwJg1qru1cN4NBM43ZkITo4fn4ObYBnBz7mhcf+zpFZQcXEpdN2BHcCYFKjC5A2xF
X-Received: by 2002:a05:6512:4016:b0:545:291:7ee0 with SMTP id 2adb3069b0e04-54ad067fa91mr1522746e87.34.1742486648392;
        Thu, 20 Mar 2025 09:04:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1742486648; cv=none;
        d=google.com; s=arc-20240605;
        b=j+KSHn5q/x9G/Yiq1D+5uybVPU0hmK44xXgD36NxOf0S6chIzhMzpvh1nm1Rqx4sYs
         25SneJx07FRk0Ok6cqDbJGdW9c47wJxHQApnFDMvqCj4FvH1W+eEWRxGaeApmKEoRZHy
         3eEvBEdkomM2vi7sOiTlRjxQEh6V5+cDYC7AsdfT1prSLCoQroq9Ar5P1FS707Roky1D
         94fDUCDAE0bq10aOmshE+Lr9hoYcW583GQ5r6QLwDYU5NOc+o76deKOpgwvIC8F4Ysly
         iVtFvYMhus0s7cK9VbL2O500epMUyVgU3M7WE+vU+PLt2DVm9Ff4JoPRRj0wmpCw+8R+
         99zg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=E+Sf9DL7K6o+3a/CLwhMlF23h8gEkovuxLF/f3YhuR4=;
        fh=IEgoWN3kttOiWf8ZKn69cUo7spnzBMkeBRajErov3tA=;
        b=TgkLPEAXJfdb+6mCzt08RvlMkXgxGFC2YZdWOWE4Oief7D5XN/xcsKpwxkGUgGRF+A
         M6BJWvN9P9u624SVUifk1MJWQQqYmgr2vI+6Zig1lLrIxOkodAlqgzOv8txNtL3Mwsod
         JgZwl94uatzIxrrMiyn5aNQcBnpBDhjh58mEJNA67vs/v2An04Uh2J1Xy6Va4y59sAsX
         ZtP4IFeUtCqypIETiWh1qlezUE0UV/w3dsXIPTtEmtYfwXIYf8/WJ8ikNPWB7Ai89vvX
         vmO9jlvo/SJvagmhVUXm4r7YeqAtt/dCwLPLHcHgp8ZJuyDMUJ7CFVAARkOw0y3vEapn
         4lRw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Y0oRufVs;
       spf=pass (google.com: domain of qemu-rust-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-rust-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-rust-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 2adb3069b0e04-549ba86914esi11278440e87.470.2025.03.20.09.04.08
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 20 Mar 2025 09:04:08 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-rust-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Y0oRufVs;
       spf=pass (google.com: domain of qemu-rust-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-rust-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-rust-bounces@nongnu.org>)
	id 1tvIN6-0005Oy-DZ; Thu, 20 Mar 2025 12:04:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1tvILq-0004wv-KP
 for qemu-rust@nongnu.org; Thu, 20 Mar 2025 12:02:37 -0400
Received: from mail-yb1-xb32.google.com ([2607:f8b0:4864:20::b32])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1tvILo-0003Qn-Gk
 for qemu-rust@nongnu.org; Thu, 20 Mar 2025 12:02:34 -0400
Received: by mail-yb1-xb32.google.com with SMTP id
 3f1490d57ef6-e549b0f8d57so764152276.3
 for <qemu-rust@nongnu.org>; Thu, 20 Mar 2025 09:02:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1742486551; x=1743091351; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=E+Sf9DL7K6o+3a/CLwhMlF23h8gEkovuxLF/f3YhuR4=;
 b=Y0oRufVs098Fl3OOV5u4Pp/J3vpy0WlMcXVndoVCPqxJRizuB3uAc3aeVoYiVQu3/s
 J1Z6+DiiK6ByHchmNqRmq0TsLUnP+X35veDb9aNYm7P2smZUKjgY1YB52d/7z4F5cpnL
 +921DCiCcvSAVbjc+bZyIvax1pFBM4zLbrqeJ2dd2R9EPp6/MuazP9fAa9/3RmGgh+T+
 ScZUnfKBqojzYKSxgeBeXKzFiGmoIVTKo7DRGjky6nDaJDkikLahY2hfdDCeVj9h+eDB
 1qMvHis+IAmmBs/5vHl61BTM6iZteQMvfxvE6FIOv8Rsvi5lPnJuQFdG+7b5CqZzgleY
 21TA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742486551; x=1743091351;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=E+Sf9DL7K6o+3a/CLwhMlF23h8gEkovuxLF/f3YhuR4=;
 b=X9ZbzwRnLPT2VnOVjo7Wgi3jncwkslKE2tp2CQSpKW/1y9XSlehUgztQnckZqONaLy
 oKmccT7dVnKL/bt57m+RI1MGJ/BQ9nVo3Qm8yiaxPwGNY0pmnGE673pY+CkfwkJOdhXp
 PE8XQiaXciZ0luagjDLFGT5NEQiNF1dEccwbv7Vj++EIhah3SbliHjIzOTOkhyJDjzgN
 3D5hEXdLbjLz8+uo9p6g+he2lIajsc96VJ+kBoFnUghIxfXdxs3Vib//Wc3YooHG9OCF
 UopnN51/fqfeQWlVQXR8vjDHWdaY058A0/2nSOtUsGTqMQYGTkgEJRvOdm99+zrEHxgW
 KzGg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUgK1KT6vrjD2eJVU8TGTSfr257E33WFGp63gL4gEVpN+mACkYcLUyT2dojSLbOUnsjfyDl7rNk2JQ=@nongnu.org
X-Gm-Message-State: AOJu0Yz82HJ3muvcFNMGEfYP8f/aYzNaiuK2xb2MSrhvt6Kp3E3PlnJs
 nC8JCA0u0TTW6xIjrm/q25i0bmKfKvwE/eAcLMc0HigUyXIsCOTlWgmsDuS0e8+YTAEtm6n6WF2
 zx9wj/TuZ5qz/7YhwT5nKUveP7g0oI3AQcrsZCQ==
X-Gm-Gg: ASbGnctRHG3Cgghyozzz6xC4xRMoP2hbOLLJyPW/9ZhHe7Noru7zLQI5UvXJd4xfgwD
 rKEA7//oqYPsDHov/xk2O+dZ3W/tBbgw6+I2xJnC0I3pW08r1LnCTPUcrVoOa1OdaZsuOqlKLRE
 GDt5KuKa1LqUPQqJz9SOwHibHnLhc=
X-Received: by 2002:a05:6902:a83:b0:e63:d10e:edae with SMTP id
 3f1490d57ef6-e6691fcc667mr4844297276.9.1742486550621; Thu, 20 Mar 2025
 09:02:30 -0700 (PDT)
MIME-Version: 1.0
References: <20250320133248.1679485-1-peter.maydell@linaro.org>
 <20250320133248.1679485-4-peter.maydell@linaro.org>
 <Z9w4Gttv8QeBRKfZ@intel.com>
In-Reply-To: <Z9w4Gttv8QeBRKfZ@intel.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 20 Mar 2025 16:02:18 +0000
X-Gm-Features: AQ5f1JosCL3C1qhXgcxEF8zsqSxe893cvDN9OzDYbgh3vZyZOvh4FvKcapkpXjc
Message-ID: <CAFEAcA_BQOtzugW31ke=sit1mKnvxieGC_GXLOG4=MK_O2mKqw@mail.gmail.com>
Subject: Re: [PATCH 3/3] rust: pl011: Check size of state struct at compile
 time
To: Zhao Liu <zhao1.liu@intel.com>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, qemu-rust@nongnu.org, 
 Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b32;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb32.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-rust@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: QEMU Rust-related patches and discussion <qemu-rust.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-rust>,
 <mailto:qemu-rust-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-rust>
List-Post: <mailto:qemu-rust@nongnu.org>
List-Help: <mailto:qemu-rust-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-rust>,
 <mailto:qemu-rust-request@nongnu.org?subject=subscribe>
Errors-To: qemu-rust-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-rust-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: NeSRxYOKXNGf

On Thu, 20 Mar 2025 at 15:25, Zhao Liu <zhao1.liu@intel.com> wrote:
>
> > -use std::{ffi::CStr, ptr::addr_of_mut};
> > +use std::{ffi::CStr, mem, ptr::addr_of_mut};
>
> maybe mem::size_of (since there're 2 use cases :-))?
>
> >
> >  use qemu_api::{
> > +    bindings,
> >      chardev::{CharBackend, Chardev, Event},
> > +    static_assert,
>
> This one looks like it breaks the alphabetical ordering (this nit can be
> checked and fixed by "cargo +nightly fmt" under rust directory, which is
> like checkpatch.pl).

Yep; I put it here because I started with Paolo's v1 patch
which called the macro "const_assert", and then when v2
changed the macro name I forgot to move it later in the use {}.

> >      impl_vmstate_forward,
> >      irq::{IRQState, InterruptSource},
> >      memory::{hwaddr, MemoryRegion, MemoryRegionOps, MemoryRegionOpsBuilder},
> > @@ -124,6 +126,12 @@ pub struct PL011State {
> >      pub migrate_clock: bool,
> >  }
> >
> > +// Some C users of this device embed its state struct into their own
> > +// structs, so the size of the Rust version must not be any larger
> > +// than the size of the C one. If this assert triggers you need to
> > +// expand the padding_for_rust[] array in the C PL011State struct.
> > +static_assert!(mem::size_of::<PL011State>() <= mem::size_of::<bindings::PL011State>());
> > +
>
> maybe use qemu_api::bindings::PL011State directly? Because bindings
> contains native C structures/functions and their use should not be
> encouraged, I think it's better to 'hide' bindings (not list it at the
> beginning of the file).

Yeah, I wasn't sure what our preferred style approach is here
regarding what we "use" and what we just directly reference
(and the same in the other direction for mem::size_of vs
size_of). Is there a "normal" pattern to follow here ?

Speaking of size_of, I noticed that Rust provides both
core::mem::size_of and std::mem::size_of, and in rust/ at
the moment we have uses of both. What's the difference?

thanks
-- PMM
