Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4FF7C5AD5A
	for <qemu-arm@archiver.kernel.org>; Wed, 12 Aug 2026 11:17:23 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wu6xF-0005cv-4D; Wed, 12 Aug 2026 07:17:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wu6wT-0005aT-IZ
 for qemu-arm@nongnu.org; Wed, 12 Aug 2026 07:16:18 -0400
Received: from mail-yw1-x1132.google.com ([2607:f8b0:4864:20::1132])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wu6wP-0003jc-ER
 for qemu-arm@nongnu.org; Wed, 12 Aug 2026 07:16:16 -0400
Received: by mail-yw1-x1132.google.com with SMTP id
 00721157ae682-81f36179d72so11506447b3.2
 for <qemu-arm@nongnu.org>; Wed, 12 Aug 2026 04:16:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786533372; cv=none;
 d=google.com; s=arc-20260327;
 b=aBl4lqscPe6HbXxjUaH6TLG1hRI6ICtUHKRupaIgHOboPA1YFDXjXQME2lKaHdWYK7
 xIxNcryUqXEbPwsVnDE04K9KWCgRYsUpuO/gU6AvQIH/GMPATsgAWm6YbMmVsVFrL2Yv
 iHQHTsoRfh88YF7prFIyiy2gGF5KLgd2ijhxsQzJ0YPhyXA/YotolW+s+OF5DMmO6jQU
 7fdZh6WTpcSI9xrNVdu5Vnm1RZ4SLPIt7aDSE8yJhseGTnL3kq2VMOgkCM1khDhklOv0
 JNAbUQLrjkCLcX89cs48h0z9TC30A6qGNwX2WFzgO1C1w23g9mMCUqA4NjdElfPj0Ju3
 cldA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=OjWcQUJKDi7jq2I4AWhV+OpD+ESWrsN8UirciFn/lyE=;
 fh=7GwEF5NT5ZYk1YVGAjkZ5sECRZFQbZWlQ6h9dN0adrQ=;
 b=UR2Uz/1rsap/uUWXOHK0tKyUgTHCdOUYzNpnaFcQ+bLgr8otowKtEDmKhGn+S6NJSB
 NYsNJ7wltmwuSayUS4rtV/x7K7lajAanrFul3tnGIhaN0r8AO/fd5H4i6mpHefmaDOsZ
 k1lMUqaztH5Fuq+7h7hWDSWlz2KmrBxATXMSl8h5KcEwZyWKbJDef2o/YvZc4LvEuXqG
 hWuRKZ0+7C9eYpEBdsgeXedNmJmXz1NTOIYbk8HnujjwnmwP1m5wqPALTME8lWhHKOyE
 BP2wNtOYREXNEkkpsIG0tWRBQuUf95jobzNwgJr0Xo4fNrNED1WZ8hEFSdDU8exfx3ic
 Xs6g==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1786533372; x=1787138172; darn=nongnu.org;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=OjWcQUJKDi7jq2I4AWhV+OpD+ESWrsN8UirciFn/lyE=;
 b=kixkMeLGgEzWS4rOnn3lH+aczPa64LfIx5WbPHkoZSIK+W3oQoFUj99q8Kvtp3Zfat
 bCHgpbgTB4hw/5TYNaToqmSueuiPnxTJ/WRbj/6WekxxqEUwUJLzEU7TqG3kReEkal90
 ODyd7N5g2LCRrR2ItgNhvU22rGymEML2VcPepnqoJXjPT46DfQTnsTP49HANESSVSTi7
 yxXiHu+kAktcpUUMuKfJXPb5R88eFtjlEiUNC2Whw3nw8Xbz4zPH2Ryv4Nf6hdwRxYpC
 QQjqBBuaoLHYIUHFox9RVR8A2phUZHM4khitn+FaVWx136dnWs94M+ie6vXCMGOeV/+6
 NMbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1786533372; x=1787138172;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=OjWcQUJKDi7jq2I4AWhV+OpD+ESWrsN8UirciFn/lyE=;
 b=jxEUMrFnq6LRnIpw16zFSclAGv2Y6FRgqbOhfpuVaZnUZG2AdqPAvNnpgEr8Hh9vTn
 sAqRDMAJlmf7zMl+4T+PZG0bav6/ukt6Jr0XYE6RmiQUzq1zrMzONYSjNNC5+u7UYp4O
 SADmETkAXYJNgQhv4eWVy/EnXcfmla4DjTDZh84IbkHB55jMLB5eRoouor8B2n1zOjn2
 hqeRbyzNWFeNRXP/vWzZ5S5DzbyCssqsWxYiVy/rU0VrVfoJOc2nzsBTi8CIKsvreyVY
 YUYljO1Ts6V83cihbBHSNyONs0xh3+4n8x1QFhJ25SQNfWQNUDl0cDIWP5yxSthDbaQ6
 av4A==
X-Forwarded-Encrypted: i=1;
 AHgh+RqQ6qj3aVDqbXELCvYn1DnamiaaEBidRxYmCe/mSGEnTx+NVd0d5O/oNaeHqkKJ5k5RsDSx8e7+NA==@nongnu.org
X-Gm-Message-State: AOJu0YwqyZflQRsj+IdnP8pg/RKsYunaozvzCpsHM5/XhRWWx8VO5oCv
 5uXD56lDB6AMki/KdLXIivyteT19MvUnjey+URby9TdXNgr7N1h8rX6Cz6ZRCnjRwFxy/w1IvHE
 emHHDa/W14SmE8aHUD43VZVaqB1yy3w0RxSIF8TspPA==
X-Gm-Gg: AR+sD11ynGzYgcfS4dwW2G3DZzgqtewOnDzLWtyfHhlRI4kC5jkw/+ZEKE7+PAYidZQ
 mXer3KSw8oc9p6HIghYlccEp9rcTtiHTo5/ZU1VA8Fty3PtbToiJ3bl0hIFZKLNhI0bLWaEWRZs
 wQtLjnFuvU0HpBXp7M7PTTNETb8+PmGr4hEPT8uJ4rZNotMH5isXDwwWCDaogcLvPvNCCUzzPre
 39pgMzSO7qz/ba8ZfPT2SYvC8cxzBNnj/7eu5MJDxnIRqVI7Aj7/JEAR36lICAkhbbASsuG746a
 iy9JQd2XsTBvZHeiPDMmwwsw78zuZ6IjagjrNwJfmdRfDaaUixe9/GHzOiwMpku7+Yo4nO1MWRs
 4jshNblTGn1X7qAq9Ljwb6jL/zOJ7Vg==
X-Received: by 2002:a05:690c:3746:b0:7dc:aa85:5c67 with SMTP id
 00721157ae682-83107542990mr25218167b3.11.1786533371673; Wed, 12 Aug 2026
 04:16:11 -0700 (PDT)
MIME-Version: 1.0
References: <20260806163939.328201-1-richard.henderson@linaro.org>
 <CAFEAcA8stJZ6JZW1un++6zj+CDwkR-zTpA4G9ksTetO-xOn01w@mail.gmail.com>
In-Reply-To: <CAFEAcA8stJZ6JZW1un++6zj+CDwkR-zTpA4G9ksTetO-xOn01w@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 12 Aug 2026 12:15:58 +0100
X-Gm-Features: AUfX_mzON05yEI6YGaZeENZTFRmfXETFaJMzdj2Q53bqbNlsUwJvbDPEEBYn1Bg
Message-ID: <CAFEAcA_KTrt1=PstjYvtkatvWqhUYaSNwX1kq6NB5j-NxGcOwQ@mail.gmail.com>
Subject: Re: [PATCH 0/7] target/arm: Introduce cpu types max-v8 and max-v9
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1132;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1132.google.com
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

On Wed, 12 Aug 2026 at 11:27, Peter Maydell <peter.maydell@linaro.org> wrote:
>
> On Thu, 6 Aug 2026 at 17:41, Richard Henderson
> <richard.henderson@linaro.org> wrote:
> >
> > This is something that we've talked about for quite some time,
> > having separate "max" cpu types for Armv{8,9}, because Armv9
> > prohibits some deprecated Armv8 features.  Retaining all features
> > simultaneously has the potential to cause confusion.
> >
> > r~
> >
> > Richard Henderson (7):
> >   target/arm: Tidy cpu_max_initfn
> >   target/arm: Pass ARMCPU to aarch64_aa32_a57_init
> >   target/arm: Pass aarch64_enabled to aarch64_aa32_a57_init
> >   target/arm: Sink aarch64_aa32_a57_init into aarch64_max_tcg_initfn
>
> I've taken these first four cleanup patches into target-arm.next.

Turns out the first patch causes the cross-arm-kvm-only and
cross-arm-xen-only builds to fail:

/usr/lib/gcc-cross/aarch64-linux-gnu/14/../../../../aarch64-linux-gnu/bin/ld:
libsystem_arm.a.p/target_arm_cpu-max.c.o: in function
`cpu_max_initfn':
/builds/pm215/qemu/build/../target/arm/cpu-max.c:223:(.text+0x4c0):
undefined reference to `aarch64_max_tcg_initfn'

I think this is because we used to have the call to
aarch64_max_tcg_initfn() inside an "if (tcg_enabled())"
block, so the compiler was able to eliminate it in the
TCG-disabled config. Now we've dropped that, the call
is still present and the link fails.

I've dropped the series from target-arm.next.

-- PMM

