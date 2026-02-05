Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E2C1EC1EA4
	for <qemu-arm@archiver.kernel.org>; Thu,  5 Feb 2026 11:53:15 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vnxv4-0000Lw-8c; Thu, 05 Feb 2026 06:53:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1vnxv2-0000Jg-Bl
 for qemu-arm@nongnu.org; Thu, 05 Feb 2026 06:53:08 -0500
Received: from mail-yw1-x1134.google.com ([2607:f8b0:4864:20::1134])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1vnxv0-000394-Pg
 for qemu-arm@nongnu.org; Thu, 05 Feb 2026 06:53:08 -0500
Received: by mail-yw1-x1134.google.com with SMTP id
 00721157ae682-795055a17a3so8856327b3.0
 for <qemu-arm@nongnu.org>; Thu, 05 Feb 2026 03:53:06 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770292385; cv=none;
 d=google.com; s=arc-20240605;
 b=BIL5uMpopH1YWldqM2hDbe5vVNOlmSHWgmXiWOJR9CrOyo9oVuXUZKsY9HzFcuXIp+
 x15uwMjEe/Br5/XzGEmzf9CcSCcRg4huj611Z7xKT7xAmLMCVUfUnhthx+IyAZS8eEz0
 ihBH2yz4tIpwmHKx3eUb/02jM91q/3Htro+dLBlSLxuoC+8DPbVIq3xvpA0tbMNWkps+
 0P353yh45DZz4lzIcJkCifITI4YrpYPo6/P4SJzMiKlN7Ees80oNkCTR1IAvZHKEsUET
 20HSBjOq4S1a8A6LNAc4zWag1UFn9MvdueimxkKkcxMMznV0c2FHbBOSk05yJkfEvmQa
 rSyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=oaL8q7aoEKpl6+aTJa8/maUr715vd8ePhDvN3aomsDY=;
 fh=f+RO6hXed5QAgIe8DZMLehWeOpgXSMzMG1Z00UqcEKQ=;
 b=FUlSiFBrqR9FWI9tCxdeGhhEV5HG5WwiZaBcHKvxU7w3KPq9v9tnfhDZH8EpNh/3BS
 SYoDxe/OjIGkmFXtVrxwzG61LMCMsWoKFi2DPkQ7Gr8TZGs71qGtcE5+miuv4gCqj3sP
 4StZt/6+jjIMo9nA6WOe8mICO8ZgA8x92y7ATU2rV6imjL0uWzJrJIGYnyQ2RicWUotI
 IZ2duRKDVuyIQzUfHSCJycORVQLTSWLCQUW5CzbgRe65eixS76Pjj0gw9vrBigssjAsG
 XLxHp3kyHVno1ghdVlo1D/IDCPfrhLzTc4u0D3aKl0l7SZyCd6HGUXLhn1l2bK9/c3NQ
 d5Eg==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1770292385; x=1770897185; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=oaL8q7aoEKpl6+aTJa8/maUr715vd8ePhDvN3aomsDY=;
 b=aO2hhF6BKlGx25XK/E/5ru0Pzyu9biZv0n02AREihvgF1sGyo7lVvxS7zfWu2Fofii
 4c++/PSD3MCn2jT2azHaj6QrPi2+uPbLRHMAFjVoriuYZ3vzDpehSxEfE+qQQWPw8b9Q
 aFCGMzlxNYj5R9tXoOTTYSjKvL1GLq8oos+Nw1fxTQW1+yNWvj3l4GisLtQkybfpBLyv
 /AoC83Zz84I3GvsJMB1rd5mE654o+UmHeljMyRnPRHs0icwkMpyQBVkx7XDhABnxdi8S
 0nRMXXqa7Fj4pKTR0H8qwmuQieVYLxV80QT3KQHJF8zfWSuFkrYLRi8eWQgeD7LqMvha
 ansQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770292385; x=1770897185;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=oaL8q7aoEKpl6+aTJa8/maUr715vd8ePhDvN3aomsDY=;
 b=OTxt6Vgn3N+9BEdE7VmRirbZTOuyYogXPc57gyGwFwzo2bXesqpcxbgFg2wHkVLYOX
 hdIcPvSG82uV1LHouqKrFr/4jZlxCAEERhLaoUKvd4PireM1nrXmOz1xz7Gfk+VxH1IA
 xy/AK48i5YfoXT9iyT7C3oKKNjw4lQeJcsWU/qxh1OlNN7k+4Q/3fdE8YzQpg6kziOts
 FL4hFRgSSNGiRTwNi+bK8n+khYcoKEM5G5HaZyFuqolUgdviY3XMTALZjtDnkWKcDhKb
 nWr5L+wAprcrG1NI1zjQBEEvmxSuNhy2cd1e97RBx5gWNpKIiClRB6pQatz15zTojEnk
 sBcw==
X-Gm-Message-State: AOJu0Yz/vY4lLxFgaXZ1sRWAb9O/ryQCq3IiJVSf84vYflWR9xa1wxAZ
 AKbv7Q7maJcJlsY4DWumNHwLqgeWY81Mn5F6Va2v9qWU2yQd+Lf8hBfkrTWGGsXAJcTHLLyhu+w
 2UpQsdEoteULhCBovFlGPGo37AjpxPc7HtgkNgDwwTQ==
X-Gm-Gg: AZuq6aLIQIxF0ixXHWVez5sik+vAMPj9Wdj2L/u7RbPY1TyHnyBUyvZWA39TDX6iCJo
 rrJBuQHXjGdTgAoAVJI12D2UZIwQGsQA7gQADfOB2VZdqfkJkD7VtnPk5Yv2xV5DErgntuJJGsH
 OZ9PK5HUjWXHHWG4TdjoFHgADdw3p0VhbWlxprefuGM7L5FMb2S+aSMEerg8H2YgN0W3zkyNTNC
 XIUv4SF12EzXs2rWRbO3jK8mLg3UZv70243JBpJhhvDCOIEuC0CGyavCAu+nsOAfDyAsA==
X-Received: by 2002:a05:690c:ed6:b0:794:959e:c534 with SMTP id
 00721157ae682-794fe63b579mr60175087b3.3.1770292385272; Thu, 05 Feb 2026
 03:53:05 -0800 (PST)
MIME-Version: 1.0
References: <20260204133229.297061-1-cohuck@redhat.com>
In-Reply-To: <20260204133229.297061-1-cohuck@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 5 Feb 2026 11:52:54 +0000
X-Gm-Features: AZwV_Qgr7SIV9ctsC01ny2dLouZ2q79_H8IARKugnsUfSeSrEDGmdpp2E5Mnv0A
Message-ID: <CAFEAcA9SvgjUvwLb8VjOzyDNy_g0E30wpUKSN=ENfm3HXx_-SA@mail.gmail.com>
Subject: Re: [PATCH v2 0/3] arm: demuxed ID registers (CCSIDR_EL1)
To: Cornelia Huck <cohuck@redhat.com>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, 
 Eric Auger <eric.auger@redhat.com>, Sebastian Ott <sebott@redhat.com>, 
 Jonathan Cameron <jonathan.cameron@huawei.com>,
 Alireza Sanaee <alireza.sanaee@huawei.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1134;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1134.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On Wed, 4 Feb 2026 at 13:32, Cornelia Huck <cohuck@redhat.com> wrote:
> RFC because there are still some open questions:

> - There's a slight disagreement between the current code (providing 16
>   entries for CCSIDR_EL1) and the KVM code (providing (7 cache levels) *
>   (data/unified, instruction) = 14 entries.) With FEAT_MTE2, we might be
>   needing 7 more entries.

This is because architecturally the CCSELR_EL1 register is:
 bit 4 : TnD (tag-not-data)
 bits [3:1] : level
 bit 0 : InD (instruction-not-data)

but the 'level' field has 0b111 as Reserved, and KVM doesn't
(currently) handle the FEAT_MTE2 TnD bit, so from KVM's point
of view only 0..13 are valid values here.

The architecture says that if you set CSSELR_EL1 to an invalid
setting then reading CCSIDR_EL1 can be:
 * a NOP
 * UNDEF
 * return an UNKNOWN value

For TCG we opted to permit any indexes 0..15, so that we treat
the architecturally invalid 0b1110 and 0b1111 the same way as
we treat "you picked a level this particular CPU doesn't implement"
(and return a 0 from our cpu->cssidr[] array). Otherwise we would
have had to add an extra check for "and level isn't invalid".

TCG also doesn't do anything with the FEAT_MTE2 TnD bit: looks
like we missed that functionality when we added MTE2 emulation.
Setting TnD and InD at once isn't a valid combination, so we
could either extend our cpu->ccsidr[] array to 32 words (and
live with 8 of the extras being unused), or else add a new
8-word array for the MTE tag-cache ID values.

-- PMM

