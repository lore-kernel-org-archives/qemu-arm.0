Received: by 2002:ac2:596f:0:0:0:0:0 with SMTP id h15csp3564332lfp;
        Thu, 21 Jul 2022 13:37:22 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1tWJN8RA6yipWruMxHBbZk3Rh9FpmEGgUlT2JKVO5bLMYbD1CWoUjPhHUsO8fdp5GWhqWWA
X-Received: by 2002:a37:98c3:0:b0:6b5:f2a1:ab4b with SMTP id a186-20020a3798c3000000b006b5f2a1ab4bmr223388qke.210.1658435842631;
        Thu, 21 Jul 2022 13:37:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1658435842; cv=none;
        d=google.com; s=arc-20160816;
        b=P6pD4fzZ2KDLgdV4dZC/3cW1VcxDM0mdLnHMv5F2JZcOnmXj6lyxq3o7vrZ7s9wKoe
         FNQwX99I9tDJLbNTDZtYH6N+4Sw+CRtekq+c9bzPCugt8opZH0AVtFQS/XFGtmRcGtgs
         0pLG+KHfof1BvtFAbwW84VQweU+IS2bYOdUiZJyE7ZqY5/n4NlPZxEH4TG4URTiyIgEs
         OsBM7hqRRMeEvXxgP+MDXboYccTjilzJ7VbU4Uy8jD4DNYP5+5B3UbbN8g1xM4tDrm/Z
         ioKrsN1EoOtuA9Mk4SaGYfzl6d3QgLlXEo5UAvMvV6vyuqHGrXtFdVOgCaU+Qpz8YGYk
         tGFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=1KMSPZt7dXYque1/g30OP2vns3HirBf35P8XjAm1P/E=;
        b=VHEWO9O/fhKSN+HmKEbBC/ohCHFXz+pbqAyBANFC3KRnYQwY63tQrPoEyzF8xu/S2Z
         Mm3x91VBEbwQDsXsCqjVjn7O4rbnBpirEd7ERsIJV2BNkY3/Wp/5C4aOhUq9NIYszAyZ
         i0JcWVYKyKZNnGoHMRdcPiafxR/q53az2pcmDNRoxKBR5Yi8xjTDBgbQ06sCPg6du+l3
         2ICwM87UzzYP5xtmBC+enpSnDoQVkz95B7w+BHt3XNx8JS8h7eHxj9cMK63dvdw4F6xi
         pxBsJkdnRiQXeZV4BnGGQgYVOuUx6yBh099SHoXi9zumqLowqXF8B66Es/bCSeAFOHdG
         8NXA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="LeZ9K6/o";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 2-20020ac85902000000b0031eaed115dasi2201233qty.652.2022.07.21.13.37.22
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 21 Jul 2022 13:37:22 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="LeZ9K6/o";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:45136 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1oEcvC-0005s1-5Z
	for alex.bennee@linaro.org; Thu, 21 Jul 2022 16:37:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46658)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oEcuh-0005rk-1e
 for qemu-arm@nongnu.org; Thu, 21 Jul 2022 16:36:51 -0400
Received: from mail-yw1-x1132.google.com ([2607:f8b0:4864:20::1132]:46693)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oEcuf-0004Zr-8X
 for qemu-arm@nongnu.org; Thu, 21 Jul 2022 16:36:50 -0400
Received: by mail-yw1-x1132.google.com with SMTP id
 00721157ae682-31e7c4b593fso29237687b3.13
 for <qemu-arm@nongnu.org>; Thu, 21 Jul 2022 13:36:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=1KMSPZt7dXYque1/g30OP2vns3HirBf35P8XjAm1P/E=;
 b=LeZ9K6/oBfbMU4d+7pXyr2Eh+4ZXK7EJq7YREyEZ7ubRW2sx6mSVYq1K784Wqvn1fU
 2qYCNexQECo6qIrNJWfxQ8NcqTHMpUg6OZVYXdW57+LEGkCUpDgUk4Z3x5PNJuul0vD5
 99upho5o/edWaEvIuTKyppmUy5OYJT7f2F8EXHA5Nu31pDGhsIjl1hzdkX4OfVFnQl9s
 iu82QdCocovBZUq6ugu7XD1MTtbjXrPe3Oa4eBpSBg62cBPSoJMtiDS9a0H/hKjfuYZu
 2XGqMF68dA6+Z/BTWUeJkSz1GBpOuOsI+FZk74eaL/NK3+qYl0a4IoZ6GynnrBhOFeH/
 Qx+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=1KMSPZt7dXYque1/g30OP2vns3HirBf35P8XjAm1P/E=;
 b=IN1rkHAJVOrICSz6ABjxifollXrCNRd2GiFuAeY5LGy/APWJXBGOYu1U+OqYQ6JTUB
 StgQg4xLxae3D8qka7ZPY0oRW+5T4mcTldJ5SnhtTokqiY7Yd0PZq/XR3oke3Rct4zrk
 rPvjmQf61uaWrcvROYijuu5Yx+NVP7yiuHbozXSnXmOmchcb1VXq0Cx0MIs1aOyZrULs
 shtEfFfO/NzQUh5R8qUMUjrsBuW77068SzBTsXDp9FQkrwFBDgUy/iNXlUw0P9yo0an8
 XvjPkFYJZpabxnN9PnG0zbzmqQDqFAuw5Fk3+Gv4JVtHyeatI54tseobJuhOwEiWdE2D
 FQUg==
X-Gm-Message-State: AJIora+MtuxUIdAER7CQiUMGdqd7X8ysTztrHadY+0Ubipq1F/mnMBtj
 Cj2l6n11wqrfiynZOc4qQ3jEcDb9SU4orXG2hVl8gQ==
X-Received: by 2002:a81:8d08:0:b0:317:a4cd:d65d with SMTP id
 d8-20020a818d08000000b00317a4cdd65dmr298942ywg.329.1658435803557; Thu, 21 Jul
 2022 13:36:43 -0700 (PDT)
MIME-Version: 1.0
References: <CAL7npF9T0148jkgTigVfE7cSzH2HKqy0NG0VQtAH2HMXjdBOOg@mail.gmail.com>
 <CAFEAcA8RHhRcrMSO_3MK0hSH=zWzde7S0DHHaLPZf4jOv48RLQ@mail.gmail.com>
 <CAL7npF9hKFsQF18Udi9QFnRZSH-G8cafXHBSBQcrs7jpJmPd7Q@mail.gmail.com>
 <CAFEAcA92=ne8weVYDnLLzNk0+z+aMFJgOJvW_7hSYcY1TimyHw@mail.gmail.com>
 <CAL7npF8Hg7hJBxw9j-1_7GRV_E52KS+hP1WXKfD3+r05C=CBgg@mail.gmail.com>
 <CAFEAcA8tGiaXq+y40-BtdG3jiBJpP=L6x9tsPL_5dF6dr=afEA@mail.gmail.com>
 <CAL7npF8d6LZHZtLWe65JiwQW+X-48JxLa2xBoGdxjJJWpKx-Fw@mail.gmail.com>
 <CAFEAcA9SM--_+Ret6fZwvWNe0J3E8TE-+do614TtTpi0rbAM9A@mail.gmail.com>
 <CAL7npF_8ErAn2cvFBQxVCdP96uKpdRQMs_3aL_UW5OLzm3Q=GQ@mail.gmail.com>
 <CAFEAcA-cTzrA6fZXw7onDJ77NMwjBrSFVwADYmttCgdOf9ODYw@mail.gmail.com>
 <CAL7npF9H_eKi0jA_m-wV=jSHy9hc6re7TpTe2ni=9NYK4CxRpA@mail.gmail.com>
 <CAFEAcA8xV-BdhvwvkzRHxqqEX9BAwDJGwHS=koBRbDeGHwQHEw@mail.gmail.com>
 <CAL7npF9bOP=bPtyFS-K+HgXGy9+W11M0ELRJMqQp1-JB_jVx1g@mail.gmail.com>
 <CAFEAcA8hbU7PJK-YvOkbjj2F2PBW1M9J10DkHqUPXTSxYOS-5Q@mail.gmail.com>
 <CAL7npF9neZUWweuZFqDkO5mh5=tZj3ybjZUvVoF932cJibpRiw@mail.gmail.com>
 <CAFEAcA9CnC5P4Myf1qMO=DLas93+kSVjNvnj6Vgty_yvdjH5vQ@mail.gmail.com>
 <CAL7npF8KNQKyfeW5ONY53+_u6Q4H8BDtY386Eyt-+gxaXdBBJA@mail.gmail.com>
 <CAFEAcA8hVyCwMbQ_ZNUgw8Nfb3wTvRk3gvUr8RC3gSH7Pkuv_g@mail.gmail.com>
 <CAL7npF897P3=Rro4pe_i_cmO+rUe-b1NqnJtmEM3K0kEF5VC7Q@mail.gmail.com>
 <CAFEAcA9y6zwErffpvrJrenS0hyLvGyoyhdF8Vo3mgFhLOvvOSw@mail.gmail.com>
 <CAFEAcA-9F6QDzEiAfiMa=DUVK3LGe9vLmD_OcMTfbU8ayv3Ffw@mail.gmail.com>
 <CAL7npF839onoBJxewXraSGRPmbK=8SqbPeU2W3YN7kFYW6j9tQ@mail.gmail.com>
In-Reply-To: <CAL7npF839onoBJxewXraSGRPmbK=8SqbPeU2W3YN7kFYW6j9tQ@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 21 Jul 2022 21:36:04 +0100
Message-ID: <CAFEAcA8wfEfxZh4NFpbDAsB=Rz=9-UcafOWbEtGkJ1WGZs71WQ@mail.gmail.com>
Subject: Re: [qemu-arm-static] timer_delete issue from Qemu 5.0.0 onwards
To: Jon Alduan <jon.alduan@gmail.com>
Cc: qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1132;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1132.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: mlBsYrgvC3/3

On Thu, 21 Jul 2022 at 20:03, Jon Alduan <jon.alduan@gmail.com> wrote:
>
> Here you have the output with the debug logs:
>
> next_free_host_timer: returning 0
> timer_create: host timer_create: returned 0x00000000, set phtimer 0x559dc5d8aa00 to (nil)
> timer_create: wrote 0xcaf0000 to guest address 0x408002e8
> Create timer 0 536880
> get_timer_id: guest timer id 0xcaf0000 -> index 0
> next_free_host_timer: returning 0
> timer_create: host timer_create: returned 0x00000000, set phtimer 0x559dc5d8aa00 to 0x1
> timer_create: wrote 0xcaf0000 to guest address 0x408002e8
> Create timer 1 537928
> get_timer_id: guest timer id 0xcaf0000 -> index 0
> next_free_host_timer: returning 1

For me I get:

next_free_host_timer: returning 0
timer_create: host timer_create: returned 0x00000000, set phtimer
0x562e7f755e20 to 0x562e81150040
timer_create: wrote 0xcaf0000 to guest address 0x407ffe90
Create timer 0 0x0x83520
get_timer_id: guest timer id 0xcaf0000 -> index 0
next_free_host_timer: returning 1
timer_create: host timer_create: returned 0x00000000, set phtimer
0x562e7f755e28 to 0x562e81215230
timer_create: wrote 0xcaf0001 to guest address 0x407ffe90
Create timer 1 0x0x83530
get_timer_id: guest timer id 0xcaf0001 -> index 1
next_free_host_timer: returning 2
timer_create: host timer_create: returned 0x00000000, set phtimer
0x562e7f755e30 to 0x562e81150720
timer_create: wrote 0xcaf0002 to guest address 0x407ffe90
Create timer 2 0x0x83540
get_timer_id: guest timer id 0xcaf0002 -> index 2
next_free_host_timer: returning 3
timer_create: host timer_create: returned 0x00000000, set phtimer
0x562e7f755e38 to 0x562e81150fc0
timer_create: wrote 0xcaf0003 to guest address 0x407ffe90
Create timer 3 0x0x83550
get_timer_id: guest timer id 0xcaf0003 -> index 3
next_free_host_timer: returning 4
timer_create: host timer_create: returned 0x00000000, set phtimer
0x562e7f755e40 to 0x562e81151200
timer_create: wrote 0xcaf0004 to guest address 0x407ffe90
Create timer 4 0x0x83560
get_timer_id: guest timer id 0xcaf0004 -> index 4

I think what is happening here is that for your system, the host
libc is returning timer ID values (host libc timer_t values)
which are integers 0, 1, 2, ... On my system the host libc returns
timer_t values which are pointers -- you can see they are
0x562e81150040, 0x562e81215230, etc.

The code in QEMU that determines "is this slot in the array
in use or not?" assumes that 0 is a value it can use to mark
"not used", ie that it is not a valid timer_t. That's clearly
a broken assumption. The effect is that when we're allocating
an ID for the second timer that gets created we look at the
slot that has the first timer's host timer_t ID, and because
on your system it's 0 we think it's not in use and reuse it.

Presumably your host has a different (older?) libc than mine,
which is why the difference.

Now I understand the cause of the bug I'll think about how to
best fix it, but I won't get to that until next week.

thanks
-- PMM
