Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A1FCFF8861
	for <qemu-arm@archiver.kernel.org>; Mon, 27 Apr 2026 10:11:05 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wHIvR-0006KC-RN; Mon, 27 Apr 2026 06:10:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wHIvN-0006Je-C1
 for qemu-arm@nongnu.org; Mon, 27 Apr 2026 06:10:46 -0400
Received: from mail-yx1-xb12b.google.com ([2607:f8b0:4864:20::b12b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wHIvK-0004Ae-Os
 for qemu-arm@nongnu.org; Mon, 27 Apr 2026 06:10:45 -0400
Received: by mail-yx1-xb12b.google.com with SMTP id
 956f58d0204a3-6501c9903edso10025001d50.1
 for <qemu-arm@nongnu.org>; Mon, 27 Apr 2026 03:10:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777284641; cv=none;
 d=google.com; s=arc-20240605;
 b=hbsBXj3JwjcWDqq2JLO7UDN7XhMEb3yX8IaIb60g45885OvibIN0ykjWJbHxHl6Zpi
 Ypxr6JN5K6RxBSuFWGJEtmrCuFeJ7Sab4Ws6icxmjPOZPRadnmf7HJ9o3LTQ4xOGugK8
 nJhZlssoRkzWxYbqnnv3qIWxIbyKxSBHo57Ni2CheG1ZHRQwFP25Oxxd+2PRjJw/L0PL
 KSRO43ppBb2VTquqeQFL6GRvz5dKjwCNQEs4e38LNupSwsb+1FlsjiNDyISP9sTav7X6
 +3ZC1eYBLNO04sY2CIZPufAumDtp3c5pyggMI5mQhAG05jDcQzR0cpo4F+BWNAsHH9TX
 TKKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=h+aMrKzg5iRPFOP39nzcxuRJir3KbM+Vvk75eAq8OzI=;
 fh=1ZpgXVBjfCzRcqXSaN2dL5RjW93SO3lhxcDtG4DPmME=;
 b=b13nQZzhqSfAeIbtBjL5vbOa8b1z8On1ORJCJiOCQHUHOjW8HFfUZ6xcHz5HnE/LTo
 EJ8mwhWduT9lYc0M+V3WFWJVrJPjaVZoulvvsqTwQvLDiTj7lUxGa8zhDDShPYDNppHS
 xPHTnQAm4yvjCr6U7xKMD2OpcYPpjdpXjAZB8tGjUtPTsg4hxt7QmPc0cc4hELpsxwBi
 JPd/viPV7wva5d57LQ9CK5MEIAqRylYOzjv0juRl4aOyQBNn55PcZS+lZsA7Z1hxxl00
 2rv+e4JwZ75UDpejUCj2tVLk0PoSOH0LTPOsD4BSa3jdi2WNuXHi+l5sD9qk4Fa+/JOc
 H9HA==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1777284641; x=1777889441; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=h+aMrKzg5iRPFOP39nzcxuRJir3KbM+Vvk75eAq8OzI=;
 b=rfGPhx7ksbK68BwXy7ydrRvl997asoQmog5NUwy5RDK3F2fd4KWagjqqI0vcXjNYyQ
 FTbPiT3Umtnf+sbb7BNEeaNQzecK7YaOJmJGDI1CoPgiXqkmBnBHWby2HdY38kyfjc7O
 tJEHSh0XGRnUbHykGl6l4zqBBU1t3DZOf/4I/tj2h8uB6UouJcN0IrOQhk3jLZFo6UTm
 +pRjTfQEtzJzu8aY982njaxCca27TVT6t6RhjWr+cb4IEwk3c46Wka8/x/sDw8j0ymJ0
 7rC55qyNAAqs5mZ7TpP/zBowEkf8hKutxsb/q4iRGa4OMDUoFy8I2VD/W8iM3Rzbjt7F
 gmGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1777284641; x=1777889441;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=h+aMrKzg5iRPFOP39nzcxuRJir3KbM+Vvk75eAq8OzI=;
 b=kYzptx0mvN/LhR2/3mAenh6P3kYk2NufccHvmQnnPO8PtSi0K7zeGDxdN26mpdfBRC
 jqhk+P7qh9G1c47jcX3GRx4Wp6KqhDIsUMwLN4qKAV1TRwHnI0yoxW2Ydx6T+W3w5Mfn
 IiDwZdzpplf1suxKVR+X1nWO8XAA0YzFN9WWwwOjww8kY5QZu+c96oNkHuSuLgs2ivdx
 Cty6wT48ttbD9GDG2mbkavH0rgqegyMF0QzAknORbCKLiaVq1GvHbL08I6WNRjQnREP8
 4kISolvXkqTiaiwdHJ/EUP/fmUlBCBfdkEuT7P8119d3pP9cyvOZbhrKdZU08bji3zan
 J8FA==
X-Forwarded-Encrypted: i=1;
 AFNElJ8ZqU96+kXWWbwHwvlZ7Hef4sk5yLCq8POJx7jVDG8QsqDq847o0umipOrWgKLr+bkwHBMEWMn97A==@nongnu.org
X-Gm-Message-State: AOJu0YypRWkgO/0q2OEngpyTDCUaMQusQgLDzQfh88bKOTdlaXqBD4A/
 nHuqaYYOH9AE0gqdo4FHHDzDOehpvsY8WQ7RIMCgyoJ8QjEl8TUKe/8TuZH81l5d04/nzd/8XU0
 Un6ESSn5vs05RPGadDd1wmAIBSEUF5kY3FdDe0j9SFA==
X-Gm-Gg: AeBDiet5WCoef7x8O8faAZvYNs6QenxlteMBCR+EZ9GjHz89KEDCEBftdVHoY8350sI
 aEkxUSEBnaaqYahpYI+cpUCIbSInnpF6JTPotq18hAEeVyikGvVbzLn0Rr90AEpqaUMg6NtIuvL
 p/zGeOZFienZWsXCBuiyRtrkv9Ydxn6cPkfLPShCHVUfKj/Od2Wcaa1Z1ZywBrsk5kMrCPbl+/F
 ffZIKSHM7AeZzt0SFV4plZ3qVDwawxkAKrq0BM1DwGFzsU6o4jLS1L91gfro5HQocIy5TzhHLUG
 OdFYLWwSDIHdh9cRJu+SfWlXvztZHsYwVbswYxAr/VBjiR9/2EK6upcs9MhXkes+DY9sZM4C0vi
 ovA==
X-Received: by 2002:a05:690e:124a:b0:650:3064:4cf2 with SMTP id
 956f58d0204a3-653107edd2fmr38869649d50.5.1777284640958; Mon, 27 Apr 2026
 03:10:40 -0700 (PDT)
MIME-Version: 1.0
References: <20260409220614.65558-1-lucaaamaral@gmail.com>
In-Reply-To: <20260409220614.65558-1-lucaaamaral@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 27 Apr 2026 11:10:29 +0100
X-Gm-Features: AQROBzAWX_aSS4_al0qqAOlI6OkPMuzx8z2mWLn_PkvrE7S1lPeleeKvQ713hc4
Message-ID: <CAFEAcA-8BeBte6CxH_5Zsk3wvs0zJJW6+=8cNaroRTBegK-M5A@mail.gmail.com>
Subject: Re: [PATCH v6 0/6] target/arm: ISV=0 data abort emulation library
To: Lucas Amaral <lucaaamaral@gmail.com>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, agraf@csgraf.de, 
 mohamed@unpredictable.fr, alex.bennee@linaro.org, 
 richard.henderson@linaro.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b12b;
 envelope-from=peter.maydell@linaro.org; helo=mail-yx1-xb12b.google.com
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

On Thu, 9 Apr 2026 at 23:06, Lucas Amaral <lucaaamaral@gmail.com> wrote:
>
> Add a shared emulation library for AArch64 load/store instructions that
> cause ISV=0 data aborts under hardware virtualization, and wire it into
> HVF (macOS) and WHPX (Windows).
>
> When the Instruction Syndrome Valid bit is clear, the hypervisor cannot
> determine the faulting instruction's target register or access size from
> the syndrome alone.  This previously hit an assert(isv) and killed the
> VM.  The library fetches and decodes the faulting instruction using a
> decodetree-generated decoder, then emulates it directly against the vCPU
> register file and memory.

>  target/arm/emulate/a64-ldst.decode | 293 +++++++++++
>  target/arm/emulate/arm_emulate.c   | 805 +++++++++++++++++++++++++++++

Hi; looking at this I share Mohamed's question about how much
of the atomics/etc we really need. This is a thousand lines of
code handling instructions that in a lot of cases the guest really
ought not to be using on MMIO regions in the first place.

If we have real examples of this being needed, that's one thing,
but I'm not very enthusiastic about implementing "doesn't actually
have the atomic properties" instructions otherwise. Presumably
the guest was using an atomic insn for a reason, so it's either
buggy or else it actually needs the atomic handling and we won't
be providing it.

thanks
-- PMM

