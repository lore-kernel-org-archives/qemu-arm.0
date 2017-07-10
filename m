Received: by 10.25.44.15 with SMTP id s15csp3543253lfs;
        Mon, 10 Jul 2017 08:23:28 -0700 (PDT)
X-Received: by 10.28.147.200 with SMTP id v191mr8268714wmd.95.1499700208721;
        Mon, 10 Jul 2017 08:23:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1499700208; cv=none;
        d=google.com; s=arc-20160816;
        b=w4lWildJF50oESRKNTnMlO6ONMLsw2GK7MfJN0kDY+0eNfiH+TRYHhfevZboglCqe4
         I70afg78aa3Xh//PSljmDU60/Xqw3pAPRSBKdxUw3Vw5z9HegNlHhGrg6Uj8GZ9ys2Ql
         rJzJUk7gPfiTjlbvOEAV4QeMkJAsLMjpkD1+NH2zK/e+F+s/O3WqW7JCnch5iynXGxR7
         Kq28TkHWMicP0Ygo6gohYxsLUQHJkCTbNj93vht9Lsx82CY5dgCevNE4UzUpUwh80OFg
         1x1qQzyX1qaOLJFwW6r/TlG00Wmk/SIvALjNktY5xdN9GfnYEwJiUkwkiBKOCZ1RhRMg
         w7/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=5UFlDuARTA2LBkt0MGlgzWfaov9Wzhx4MQPN3PLxiuI=;
        b=DSWOw8jQO4oP8muzDXFANqiEIgxk+Obf2PcAWRbhPQFa5pNR0iXhE2xCI36QgnU4nU
         IVFX6ItjxDh9FgiW3F0wEsv1WfvqKqNE4ghlVBfcPwnDa2YQiAt6nPBUBYZFbHoHfHFh
         flA3mHGtMBn2eQ8AJsu3VW42OVpe4VA382/POri1G42EiBxGN/bhG+HextTg2nkF+mYb
         5oYH6CJz6Qi2NzdFxxv+Y8cBLOJ5goCscuG1GeeitwzwJ2WFS/h2CIEts+C7cxgZepxa
         uPpx4QADdP4vwKaxZZkoG4Gpp7gv31xl8vYwHgdEwB9sEmgBrnPUa8EmkheAMpqWIJJe
         UZ4g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.b=BiNDvxlE;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 2a00:1450:400c:c0c::22b as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-wr0-x22b.google.com (mail-wr0-x22b.google.com. [2a00:1450:400c:c0c::22b])
        by mx.google.com with ESMTPS id 13si8275121wrb.329.2017.07.10.08.23.28
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 10 Jul 2017 08:23:28 -0700 (PDT)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 2a00:1450:400c:c0c::22b as permitted sender) client-ip=2a00:1450:400c:c0c::22b;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.b=BiNDvxlE;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 2a00:1450:400c:c0c::22b as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: by mail-wr0-x22b.google.com with SMTP id c11so143202684wrc.3
        for <alex.bennee@linaro.org>; Mon, 10 Jul 2017 08:23:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=5UFlDuARTA2LBkt0MGlgzWfaov9Wzhx4MQPN3PLxiuI=;
        b=BiNDvxlElI7g92NWbnQ2YsU+ZGvCXwTd6cJVWOVSsvP1Isnc28rwaxYTcw2UPhWoer
         JKcVc4t2QiGr5G8apTXYOfyPN1MqSx4h65msrE0dS5sT1rwxQRruzFVcbmQl6uV/pNl4
         NfC6m0vRFgDwiylt5M1rgg0IcqfoAgH+6sgpg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=5UFlDuARTA2LBkt0MGlgzWfaov9Wzhx4MQPN3PLxiuI=;
        b=JJUxJIbp9rxHQtEj+SBJ0yLay75ln5DqZE/wSsEDSeCEwue6qCncZBwfFpL9VomAaF
         SXjoS35Zd4yJ4DlCRDFFsHy35HygXDUG8kmyLGO9/9DaoOJgHLtIITnxSVZPmwely4Be
         e2WNIpqIODUJzdtYCllD20NOaKycZv+l2FmwL4yg7jtwHVyl92n3kwrSxfeAgI3G/tlv
         7Y+nyJfu0Fi0TR8sTzwMaBVvR7G4UA3zyyP8J4qCa+JZ6kn4N/QRt3MpTZU6FE4LnVSK
         uqHxcQt3TT158uewDt2IXka+hnoleYZ5eBzoYtp+d8BZPy5TTEVYR4VtVCES5TBN3l/f
         Ut3A==
X-Gm-Message-State: AIVw111saGbu1Em88gHlAzdUDXsHalKWuxjM/c6QVRxkBwTO6vLJcI0Y
	/q07Rx6Re09oyD5WWn/l/YiuN1fqR7qByEAsaA==
X-Received: by 10.28.126.87 with SMTP id z84mr8251248wmc.65.1499700208198;
 Mon, 10 Jul 2017 08:23:28 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.223.134.2 with HTTP; Mon, 10 Jul 2017 08:23:07 -0700 (PDT)
In-Reply-To: <87pod89v9e.fsf@linaro.org>
References: <20170710142850.10468-1-alex.bennee@linaro.org>
 <CAFEAcA-eLe6b-0pKkoam1TBQD680W0nunARrSFxQTgUkoqug+w@mail.gmail.com> <87pod89v9e.fsf@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 10 Jul 2017 16:23:07 +0100
Message-ID: <CAFEAcA_gfVo6yJhQ0u+CjSsNC7ub+oTu8R9KbhUjxzz+TqDAkQ@mail.gmail.com>
Subject: Re: [RFC PATCH] include/exec/cpu-defs.h: try and make SoftMMU page
 size match target
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: Pranith Kumar <bobby.prani@gmail.com>, QEMU Developers <qemu-devel@nongnu.org>, 
	qemu-arm <qemu-arm@nongnu.org>, Paolo Bonzini <pbonzini@redhat.com>, 
	Peter Crosthwaite <crosthwaite.peter@gmail.com>, Richard Henderson <rth@twiddle.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: txT+Pb2V4y+v

On 10 July 2017 at 16:17, Alex Benn=C3=A9e <alex.bennee@linaro.org> wrote:
>
> Peter Maydell <peter.maydell@linaro.org> writes:
>
>> On 10 July 2017 at 15:28, Alex Benn=C3=A9e <alex.bennee@linaro.org> wrot=
e:
>>> While the SoftMMU is not emulating the target MMU of a system there is
>>> a relationship between its page size and that of the target. If the
>>> target MMU is full featured the functions called to re-fill the
>>> entries in the SoftMMU entries start moving up the perf profiles. If
>>> we can we should try and prevent too much thrashing around by having
>>> the page sizes the same.
>>>
>>> Ideally we should use TARGET_PAGE_BITS_MIN but that potentially
>>> involves a fair bit of #include re-jigging so I went for 10 bits (1k
>>> pages) which I think is the smallest of all our emulated systems.
>>
>> The figures certainly show an improvement, but it's not clear
>> to me why this is related to the target's page size rather than
>> just being a "bigger is better" kind of thing?
>
> Well this was driven by a discussion with Pranith last week. In his
> (admittedly memory intensive) bench-marking he was seeing around 30%
> overhead is coming from mmu related functions with the hottest being
> get_phys_addr_lpae() followed by address_space_do_translate(). We
> theorised that even given the high hit rate of the fast path the slow
> path was triggered by moving over SoftMMU's effective page boundary. A
> quick experiment in extending the size of the TLB made his hot spots
> disappear.
>
> I don't see quite such a hot-spot in my simple boot/build benchmark test
> but after helper_lookup_tb_ptr quite a lot of hits are part of the
> re-fill chain:

Right, but why do we know that the target page size matters rather
than this just being "smaller TLB -> more TLB misses -> more calls
to the slow path -> functions called in the slow path appear more
in profiling" ?

thanks
-- PMM
