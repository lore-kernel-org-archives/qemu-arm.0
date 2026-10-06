Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D38FCA6002
	for <qemu-arm@archiver.kernel.org>; Wed,  7 Oct 2026 09:06:08 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xENZh-0006NZ-5Z; Wed, 07 Oct 2026 05:04:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fuad.tabba@linux.dev>)
 id 1xEKv5-0004X1-HB
 for qemu-arm@nongnu.org; Wed, 07 Oct 2026 02:14:40 -0400
Received: from out-246.mta0.migadu.com ([2001:41d0:1004:224b::f6]
 helo=mta0.migadu.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <fuad.tabba@linux.dev>)
 id 1xEKv3-0002HU-Uh
 for qemu-arm@nongnu.org; Wed, 07 Oct 2026 02:14:27 -0400
X-Envelope-To: qemu-arm@nongnu.org
DKIM-Signature: a=rsa-sha256; bh=aAN/XlWKe3vzezqMTFJTikdkacLxb9VQKFQPP6ebSgs=; 
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1791353663; v=1; x=1791958463;
 b=VDjmvDCFwQuW8DP7kUvZJ4vv6h0v9MTvnEkqm5bne3H4QRG4UCR6VEok/xzIlJ7+TbvEN9e8
 nClh2O1NmRnh8RCUTfq3CYOkWOoGEfEKG/i1qOmZG7M/GltAfyjrFtj6+ox1J70fetpJAirZpX/
 t2RuPrCQphS+8gus2VakoFjY=
X-Envelope-To: qemu-arm@nongnu.org
Received: by smtp.migadu.com with ESMTPS id 9cbd6d586af39a00;
 Tue, 06 Oct 2026 13:21:15 +0000
X-Mizu-Trace-ID: 9cbd6d586af39a00
X-Migadu-Flow: FLOW_OUT
Received: by mail-lf1-f49.google.com with SMTP id
 2adb3069b0e04-5ba40832934so6733e87.1
 for <qemu-arm@nongnu.org>; Tue, 06 Oct 2026 06:21:13 -0700 (PDT)
X-Gm-Message-State: AFq9FYIA1hmtN8VhozUHaWaF3Nib5nlFDzcG3AwgdNHUN41M1BmF1WE+
 oyg0ddovzLtgl5wh882NlAccQcWHwNHT0eHzEB6YmR0u5tMyjkwjc0f3nZUjxR6AanyCMFV9TwF
 0vVDaUzrfpn2pd7H4c0AzjZWuvzzJ3pc67Ux6/+hD
X-Received: by 2002:a05:6512:a35b:b0:5bc:ce83:91ec with SMTP id
 2adb3069b0e04-5bcce8392bdmr15395e87.1.1791292872633; Tue, 06 Oct 2026
 06:21:12 -0700 (PDT)
MIME-Version: 1.0
References: <20261001175003.ttbr-baddr-52bit-0-fuad.tabba@linux.dev>
 <20261002070925.2627344-2-fuad.tabba@linux.dev>
 <CAFEAcA_+gr25p1gix=qto5DQzh=VAguhAUh6Una9uMLzNYWZmg@mail.gmail.com>
In-Reply-To: <CAFEAcA_+gr25p1gix=qto5DQzh=VAguhAUh6Una9uMLzNYWZmg@mail.gmail.com>
From: Fuad Tabba <fuad.tabba@linux.dev>
Date: Tue, 6 Oct 2026 15:20:36 +0200
X-Gmail-Original-Message-ID: <CA+EHjTwrmbaosLOX6qQdCJdREAw4Xt8z2JUJr0nJnDmiXYUJVQ@mail.gmail.com>
X-Gm-Features: AclHuK8sHLIhdrV-DH-J8b3qI381NPEJMEuE98W1XlA_KVkx4d3n8CjDNXN_uKo
Message-ID: <CA+EHjTwrmbaosLOX6qQdCJdREAw4Xt8z2JUJr0nJnDmiXYUJVQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] target/arm: Use the 52-bit TTBR base address layout
 when TCR.DS is set
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, 
 Richard Henderson <richard.henderson@linaro.org>, Will Deacon <will@kernel.org>,
 Itaru Kitayama <itaru.kitayama@linux.dev>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2001:41d0:1004:224b::f6;
 envelope-from=fuad.tabba@linux.dev; helo=mta0.migadu.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

Hi Peter,

On Tue, 06 Oct 2026 12:24:17 +0100, Peter Maydell
<peter.maydell@linaro.org> wrote:
[...]
> >      /*
> > -     * With a 52-bit OA (FEAT_LPA or FEAT_LPA2), bits [51:48] of descaddr are
> > -     * in [5:2] of TTBR, and bits [5:0] of the base address are zero: a table
> > -     * under 64 bytes is still 64-byte aligned (R_KBLCR).
> > +     * With a 52-bit OA, or with TCR.DS, bits [51:48] of the base address are
> > +     * in [5:2] of TTBR, and bits [5:0] of the base address are zero: the
> > +     * table is at least 64-byte aligned.
>
> You put that R_KBLCR reference into this comment in patch 1, so
> why are you deleting it again in patch 2?

I'll keep it in v2.

> >       *
> > -     * Otherwise, if the base address is out of range, raise AddressSizeFault.
> > -     * In the pseudocode, this is !IsZero(baseregister<47:outputsize>),
> > -     * but we've just cleared the bits above 47, so simplify the test.
> > +     * If the base address is out of range, raise AddressSizeFault, as
> > +     * AArch64_OAOutOfRange() does in the pseudocode.
>
> Please don't drop information that's still relevant. This comment is
> remarking that although the pseudocode is doing an IsZero check only
> on the bits of the address between the max physaddr size and the
> outputsize, QEMU is doing a check on all the upper bits, and saying
> why that's OK. This is still the case, although the pseudocode has
> changed a little so AArch64_OAOutOfRange()'s test is now:
>    return !IsZero(address[NUM_PABITS-1:oasize]);
> (and NUM_PABITS is 56).

I'll put it back in v2, updated to the current pseudocode. v2 will
also have the test in its own patch, after the two fixes.

Cheers,
/fuad

