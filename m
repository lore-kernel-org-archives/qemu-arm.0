Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D04F3CDB479
	for <qemu-arm@archiver.kernel.org>; Thu, 25 Jun 2026 15:24:33 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wclvx-0005MF-PE; Thu, 25 Jun 2026 11:24:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wclvw-0005LW-Bs
 for qemu-arm@nongnu.org; Thu, 25 Jun 2026 11:24:04 -0400
Received: from mail-yx1-xb12c.google.com ([2607:f8b0:4864:20::b12c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wclvt-0008BD-6G
 for qemu-arm@nongnu.org; Thu, 25 Jun 2026 11:24:03 -0400
Received: by mail-yx1-xb12c.google.com with SMTP id
 956f58d0204a3-662bcc30fafso2565672d50.2
 for <qemu-arm@nongnu.org>; Thu, 25 Jun 2026 08:24:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782401040; cv=none;
 d=google.com; s=arc-20260327;
 b=RGO/b5XmAMBc+mJesQYL8i5VaPnQMwHT1V4TKqakPda/Xc/Wk9AJzM3QVYYwbz7E7+
 38Gd3YNi70WlM1Yf5/UKlgfLzNnq9ZvszHiOO4hISzhtFQ3Sp8YPbwP9nhXc99hAPQe1
 c69eRu8VwfQT4W+bXmnrAQ1jEiU1aD8ubVeFxJl39yQVRTZQUrFNnC4nZUtnPEOc4xuv
 Ju0IrMBv91Vi16gUnEfehIBg1yaEz7kPHf+cmUwb+1blli9EmIfrwrqpi0IPF+4arX+l
 6V9/6+6PJ6EjdnXBOKnvg+vQi2RG7bMA91n0kk+Bd4i8qbWYF3BFHDYGwXMRdXEuVmx7
 yNKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=bqc5Wouj3/R29KoIGjvPJ9rd3M6o/N3gDiPFOQAvYeE=;
 fh=1ncXL2GVgoFX8mzt8fUhWZDBx85c3GkCUfycHqy6s70=;
 b=SRYPRXtli3Mho8dFscAeJm+s6CHVdpgkwubp6sWgkDJZP63qgVheXIGrT1l6iyn/uC
 4Dj1YhXUYksZ6nq4BSwJp8KRMtUy13lau+E3Kab3uzPhAIAByCJYiM1CKi6Ra1H10Gby
 ZfcsIoXVEawTG+ScTbYxNQfLgcABJJuxJ11BUr8Gj9NXIjeit0XrnaQsyJj97qSt6Mnq
 BnaZXpnXcAu/7TPS+fASlEabSZJLHr5dEqbX7WaUvyg46syq8RX8AJmrAfmxAStMLTuX
 wnObjAqno0t8Y0mhgSRakvZtSEAr0P1/6yCofG5LcWuLxNvuZi62daAf9O58cKtt0XES
 46Cw==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1782401040; x=1783005840; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=bqc5Wouj3/R29KoIGjvPJ9rd3M6o/N3gDiPFOQAvYeE=;
 b=HqmM7kjqf0fGpwOYLZn3lqFhWkKp8xhVhkPcVkmBcdyrWkbqycTInQYO+mLzUx9cS4
 N/GiuR7hqdXM5vlC+jXeIiQO0qzFSCDRUGL2avMTzxWVTPz6QqBawJ4RgnR0OOhTR8zq
 RP3QAL2ZqYSLz8H7iIFbr7rlaoOOyQ3vkkfSY1YCUvgRAqY6tnOYCTcA43fx/3iIxKzs
 fevwFFkxPYCedSMPDMDfmipnMoFKiR0nBX3Jx9SNRO4R9ilSCnnnMDkfp99M+5VE+5Ps
 rC3B4X5PY+R3q2f96ojPgonayryrBf91Hw/zI9AQbhfkzVn/t4XFRpDZSO43zNRPTlFg
 N6EQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1782401040; x=1783005840;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=bqc5Wouj3/R29KoIGjvPJ9rd3M6o/N3gDiPFOQAvYeE=;
 b=q81BiqmIxnIN4ssyw3MzvylFBlLey890bv4l+QqGAdcf9AcbK7Ihz1DryNyJF1JSmg
 vKVMNiOnykzMjdFcabLRcfMixOu/1TuA6iG75zhidoGOFCvqCw6vGFoGnem3x9JhA4I7
 NQ4HjM7OzYgELhW+GNO5d5VntQw3hisHVYagepjOtoKakYoFW3g00PYhIeW49J3SYU/V
 ktxyIM7VdETF4qOk8EA33OgVCdBS6v/ljMLTsSHFBX+BYLh8aDN1kTepyfOVAEwaZss3
 /eG5r/H7Uve7QzYqpTR9alVXvMWz0gxt5FQ91vHXIOXr/HFL/KyLrRqBY3f5ZlQb6sJv
 maGg==
X-Forwarded-Encrypted: i=1;
 AHgh+Rr/3i/0EXIF1zkEmq2tYZjWyc6flI06bRx29qtntS8G1ToEzUBw+lM6DEcVVbpn+17Fa1EBPwJF3w==@nongnu.org
X-Gm-Message-State: AOJu0Yy1u5OoCjvJgxBN/+EXt2dXYqnzQQHqNg6kgfPBAcPnHjEXiZde
 ydIjyunvCZy7v8XdsJFpkJ0rJRyogwm6o0M+kPrkyDFqFqfez7zNXIgnstIsWL5GBN0eC57FNqQ
 CAoJOb9I/n2jRmhIQgL2vDJhql4Kn5gCxZCXkdKL9Pg==
X-Gm-Gg: AfdE7ckg7Y8/dZxlHyyxvEd5WlfKyHmQ8iO7o171EIgi/8Lb5ZmBw6QeeYJog6et6gw
 ERm/Wf5+3EfxEyUy/WaIcTpjNohtk4bSM11RJVZ5qOaRlARSzlsL5xSvaCY9dHV3DIbwVDLCMIn
 O0oMEo1xYXv9hsL+N/CIOJmdPCXEs4qN0nR/Or7TwnjFHkGvhOGZPdB+WDBLS16mC5FOVEQuSSY
 aDMAQx/TOP0/HF1Uz5Y9IEzORYjliDkPD6SbYJv2x0ANBhxZlEndDiiC5dUQ79a9MzzTbrc2xtG
 giS2nj815D3dqO+ylGSNwCcJgI2a2bMoQtiDHhQqUAX2V2DLlsC7joEq
X-Received: by 2002:a05:690e:13c8:b0:656:30a1:70e2 with SMTP id
 956f58d0204a3-66487b36261mr2298408d50.6.1782401039812; Thu, 25 Jun 2026
 08:23:59 -0700 (PDT)
MIME-Version: 1.0
References: <20260616052552.389021-1-gshan@redhat.com>
 <20260616052552.389021-2-gshan@redhat.com>
 <CAFEAcA-mf14=jpRFHarAbN6AbQwvW=Yu6WB1JiNMsECEdaxD3A@mail.gmail.com>
 <20260625070551-mutt-send-email-mst@kernel.org>
 <CAFEAcA8YJZq9TqrUd0zTnewAdVDm5y6UV7BJQZ0C60TZ=RT98Q@mail.gmail.com>
 <20260625091334-mutt-send-email-mst@kernel.org>
 <CAFEAcA8xK+t3-prEphtkq-o9UY2mgS6cowhs880GOaxL9dKSGw@mail.gmail.com>
 <20260625101817-mutt-send-email-mst@kernel.org>
In-Reply-To: <20260625101817-mutt-send-email-mst@kernel.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 25 Jun 2026 16:23:47 +0100
X-Gm-Features: AVVi8CcTfQ8bSXrsW_GWrobYdcAF931uZMAOr09cHRp0s4EaJ7pMxXFgpbvs2PQ
Message-ID: <CAFEAcA8-Un+Q1yBDqLWCLPRwtgTA_VhJqGobgZChrFhAeVfG8A@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] system/memory: Use qemu_ram_{copy, move}() in ram
 device region accessors
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Gavin Shan <gshan@redhat.com>, qemu-arm@nongnu.org, qemu-devel@nongnu.org, 
 peterx@redhat.com, alex@shazbot.org, richard.henderson@linaro.org, 
 berrange@redhat.com, philmd@oss.qualcomm.com, philmd@mailo.com, 
 david@kernel.org, clg@redhat.com, pbonzini@redhat.com, phrdina@redhat.com, 
 jugraham@redhat.com, liugang24219@sangfor.com.cn, dinghui@sangfor.com.cn, 
 shan.gavin@gmail.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b12c;
 envelope-from=peter.maydell@linaro.org; helo=mail-yx1-xb12c.google.com
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

On Thu, 25 Jun 2026 at 15:52, Michael S. Tsirkin <mst@redhat.com> wrote:
> I think there is exactly 1 kinda reasonable case. A 2 byte read/write at
> offset 0x1 within a dword. This maps nicely to even classical PCI byte
> enable mechanism and so yes it works if your CPU can initiate these
> things, and it's atomic.
>
> I tried reading LEDCTL on e1000e:
>
>        byte  @ 0xe00: 0x64
>        byte  @ 0xe01: 0x2a
>        byte  @ 0xe02: 0x00
>        byte  @ 0xe03: 0x00
>        word  @ 0xe00: 0x2a64
>        word  @ 0xe01: 0x002a
>
> Works fine.

The e1000e datasheet actually documents what it does in this
case (slightly surprising, since hardware engineers love to
leave this kind of corner case undocumented):

# For registers that should be accessed as 32-bit double words,
# partial writes (less than a 32-bit double word) does not take
# effect (such as, the write is ignored). Partial reads
# return all 32 bits of data regardless of the byte enables.
#
# Note: Partial reads to clear-by-read registers (such as, ICR)
# can have unexpected results since all 32 bits are actually read
# regardless of the byte enables. Partial reads should not be done.

So for this specific device that access is out-of-spec.

I guess what I'm wondering is: can we just have code
that does an aligned exact-width access in the 1/2/4/8
byte aligned case, and the host's best approximation to
an unaligned exact-width access for the 2/4/8 byte
unaligned case? (so on sparc you get multiple smaller
accesses, and on most archs including x86 and arm you
get an unaligned load). That would mean the guest could
potentially provoke a fault on the load/store on an
access to a passthrough device, but if you give the
guest passthrough access it can very likely provoke
a fault anyway, depending on exactly what the device is.

I think the most likely reason for an unaligned access
in this codepath is "it's actually RAM, either really
host RAM or else something memory-like in a BAR", and
either way if the guest does a 4-byte unaligned access
then doing a 4-byte unaligned access seems better than
second-guessing it, even on non-x86.

-- PMM

