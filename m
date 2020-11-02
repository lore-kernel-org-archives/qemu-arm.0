Received: by 2002:a19:6b17:0:0:0:0:0 with SMTP id d23csp3714920lfa;
        Sun, 1 Nov 2020 23:54:29 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyyZ8OKhFm9+Bswec7951OzzJubKsDaoeFzDf35iWytRPREaEsNmV8X8FLkQTZyCledfzGO
X-Received: by 2002:a17:90a:2e87:: with SMTP id r7mr16112352pjd.193.1604303669486;
        Sun, 01 Nov 2020 23:54:29 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1604303669; cv=none;
        d=google.com; s=arc-20160816;
        b=ZbnOj8JQHIMmllp6kZvur/bwDUu2PwN1lBwNkVgtJ315dHt/qwncs245vlUO8WrGIH
         ZEYfucXSeqlHxQ2OsUy5VOgp7KyYlvuaLW/IKLW3ghTfPaSS1YC4gKZZ2KR51FD5Ivko
         s0MVtNejALKu5jxdYFhuL6ehvYPPs/fB8xKD5Ux2MpaELqJm+Py9YhjpK+UgdlKDcTcg
         Oy6uaria73EECb5LmavU1JNPjOAcgLLBzX92/Tyak7jHhUFXLOtXlmM0mB6dM0It+Sxo
         nvdRo6k93mDpvhAF+TQvCe6FdmAeppgy3BNzK3Vozbcg07etl00l+3+m4bhyN0E0sRuM
         hGUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=F5vuhNkKRO7o46PvH/+PE0ESFkVOT1m3vE0VTQ6XJr4=;
        b=S+UCzcvB/nzYMTUGTD8iPqe0Kk71UCZdrQTTKFY+56uhOp2av9Cf5iTj4Al2yUJmNX
         Dbb2PerkY/P0uD+hpnFvOJhB4tzwpZhBex1kUNMuqckNG62hWE1OOVx78S2N4RLEEl/e
         9BtaD91IasqC49EvXWTdoN2xBsSAk+7htgoLr6j9zmFrFZDhWDMu5oQ/MM2kPy997+Ik
         8lBrt+d137StPuKjSx7gDDVNCb/UXCl8BKPf/xauwW2v9+M+iq8rvApfQF9xzIolp3bp
         d4qtWUMS7PXjBGOnORKNdS6Nwan/fmvbID6RRTRoz4LUhTxgPBVIYyBzVShqR2nsCb9i
         Q7rA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@kernel.org header.s=default header.b=W+Rb5nVB;
       spf=pass (google.com: domain of ardb@kernel.org designates 198.145.29.99 as permitted sender) smtp.mailfrom=ardb@kernel.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=kernel.org
Return-Path: <ardb@kernel.org>
Received: from mail.kernel.org (mail.kernel.org. [198.145.29.99])
        by mx.google.com with ESMTPS id y1si14409119pgl.82.2020.11.01.23.54.29
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 01 Nov 2020 23:54:29 -0800 (PST)
Received-SPF: pass (google.com: domain of ardb@kernel.org designates 198.145.29.99 as permitted sender) client-ip=198.145.29.99;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@kernel.org header.s=default header.b=W+Rb5nVB;
       spf=pass (google.com: domain of ardb@kernel.org designates 198.145.29.99 as permitted sender) smtp.mailfrom=ardb@kernel.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=kernel.org
Received: from mail-oi1-f170.google.com (mail-oi1-f170.google.com [209.85.167.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id B22B321556;
	Mon,  2 Nov 2020 07:54:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1604303668;
	bh=F5vuhNkKRO7o46PvH/+PE0ESFkVOT1m3vE0VTQ6XJr4=;
	h=From:Date:Subject:To:From;
	b=W+Rb5nVBXS+N6FTLAOjEgkbZyWklMXrTbrwM28vXxDA9m/BCoyYV/5QlLalfjizoJ
	 e702kWRasybM0nTTktHH0grkdHdU4GycUrTO9F6xIuE93OLQ+xBX9i304eiM8ld0HV
	 73EpbP03yfm9HZljkLyfUvwKagKuMcyva3KX0u6o=
Received: by mail-oi1-f170.google.com with SMTP id m13so4750165oih.8;
        Sun, 01 Nov 2020 23:54:28 -0800 (PST)
X-Gm-Message-State: AOAM532eFhDEyRM7OuzUxfBbJQ1svuDX8v5AQmo7Bk8AC4MaXQkEdCzh
	bXjNhHrEj0ikCSgxd8E8lmmpGnROmg84jznLe08=
X-Received: by 2002:aca:2310:: with SMTP id e16mr8789594oie.47.1604303667997;
 Sun, 01 Nov 2020 23:54:27 -0800 (PST)
MIME-Version: 1.0
From: Ard Biesheuvel <ardb@kernel.org>
Date: Mon, 2 Nov 2020 08:54:16 +0100
X-Gmail-Original-Message-ID: <CAMj1kXFDWJOt+m-nC8CdQ4WeAZmUkaB33fTiSz8TSczfu1c7Fw@mail.gmail.com>
Message-ID: <CAMj1kXFDWJOt+m-nC8CdQ4WeAZmUkaB33fTiSz8TSczfu1c7Fw@mail.gmail.com>
Subject: regression in TCG emulation of VTBL neon instruction
To: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>, 
	=?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
	Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-TUID: MIE+s14V0XHM

Hello all,

I spotted an issue with the TCG emulation of VTBL instructions in 32-bit mode.

It seems that when using the 4 register version, indexes in the range
[0x10 .. 0x1f] are not handled correctly, and I end up with all zero
vectors in the output.

For example, I am optimizing Linux's NEON ChaCha20 implementation to
use overlapping loads and stores, and this requires the final cipher
stream block to be shifted accordingly, using a sequence such as

vtbl.8 d4, {q4-q5}, d4
vtbl.8 d5, {q4-q5}, d5
vtbl.8 d6, {q4-q5}, d6
vtbl.8 d7, {q4-q5}, d7

where q4-q5 contain 32 bytes of cipher stream, and d4-d7 contain a set
of permutation vectors, where each value is in the range [0x0, 0x1f].

The above works fine with older QEMU and KVM, but with recent QEMU,
this fails, seemingly because d6 and d7 always turn up as all zeros.

This can be reproduced by running the zImage I prepared [0] as follows:

qemu-system-aarch64 -M virt -cpu cortex-a15 -m 2048 -net none
-nographic -kernel arch/arm/boot/zImage

and it will print the following (somewhere halfway down the kernel
log) on the affected builds of QEMU:

alg: skcipher: chacha20-neon encryption test failed (wrong result) on
test vector 1, cfg="in-place"
alg: skcipher: xchacha20-neon encryption test failed (wrong result) on
test vector 1, cfg="in-place"
alg: skcipher: xchacha12-neon encryption test failed (wrong result) on
test vector 1, cfg="in-place"



[0] https://people.linaro.org/~ard.biesheuvel/qemu-tcg-vtbl/zImage
