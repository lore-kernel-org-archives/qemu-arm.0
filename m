Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A025CD98C7
	for <qemu-arm@archiver.kernel.org>; Mon, 15 Jun 2026 10:57:32 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wZ50R-0004YR-Bb; Mon, 15 Jun 2026 06:57:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wZ50P-0004WW-Ty
 for qemu-arm@nongnu.org; Mon, 15 Jun 2026 06:57:25 -0400
Received: from mail-yx1-xb134.google.com ([2607:f8b0:4864:20::b134])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wZ50O-0003ij-CJ
 for qemu-arm@nongnu.org; Mon, 15 Jun 2026 06:57:25 -0400
Received: by mail-yx1-xb134.google.com with SMTP id
 956f58d0204a3-6603246b66dso3245732d50.1
 for <qemu-arm@nongnu.org>; Mon, 15 Jun 2026 03:57:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781521043; cv=none;
 d=google.com; s=arc-20240605;
 b=MnQ9diwtHr0Vo0oFb39kiCKdWJ6WUlbiXgB1B1a6zmvXVCjfbhjuoEccnVVaV1tx+5
 q+27KX0/1yd6vQSzf/DXgl4Nwbgu86jwM8bmkPLJMHHgpToKbkpz21rmMXlWRQGO3JQd
 051yNLBdS5nihhbywzxKTqqFV0LX2Pi5BLaQbjfnwyixoT9q9S6o8zQsz6LcguBodgiE
 wOHJmI6y9NL3qkBc7VrYi/4u0H2byb+f8PZ5YYyU71BYXb8DX65ZjZ+pQ9pW3G1qe8oq
 7X7CohubJhLxMb9Zba/ypcl2ETtCdOpDjg6pZFRInJaYX9TrqHikY6WDZsS0ppnMwkIT
 u9Qw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=S/wz8lKERvbYqf5bVZv2UL7q03dzo45KKXIRywWSaCY=;
 fh=w90OkhXHIOYSOmZWdZC3cQSvA4EPbbOVsMQJEMWVOEo=;
 b=TIfp9Xx+p6pLkHSgelUy7v2V6fLMX7rBymlSIRJR9EqBs2l9s1crdy4DQmVBN6bQ0f
 Dad3knHYEzw/nztSHh/qvltHc7NfsexPAejZq97fMiVzDTuAQZt/AX7SlPsgNvH7+QuF
 NgGTqSNHfbN46yHoD+K0y5iiE8t6TJ8BirjODSXfnOzMAFCMMCLcCh4KDSeoJNpP0aFc
 Njb0wnz+fgWG0K+U1SbFMW8Y0V54v877vrhCR4864tMulajhbfkDylzBlJ22hOONG2FZ
 X/BLo/PSedYGgF68zEBNp+Mf8Nvc9CJ6wqvMBCDkobHZ4lMEp7VJeuuLykrPfNZVxC9T
 7+JA==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1781521043; x=1782125843; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=S/wz8lKERvbYqf5bVZv2UL7q03dzo45KKXIRywWSaCY=;
 b=EgsGvmDWM4N4lLNx5cF9bPkeVmS59Mp59Lzbg4T7lHpiV7x0ynq7iEsJdtlAe1SDfb
 3b656I3TMnW8X02NEb1Q8LwxV4REPvue6Wg4D7Lyvw2PiTfFd/CY/dBKqnV/AVRyONLE
 4up6lDwZ7H0cUjdYImQEN+FlFcnY8SqYRbTFV80AzQofl5b09kqRvd/Fm2XfohYI6JY0
 tEq4/a5Sq3KNcUK5Z13DtTQmSVFvSjcRrWOIHGkuAJ/bySJTlw72DzHYCYC1ZHweZrMI
 z5ksdH228nvVqAHFFYBrGHlsooX3+9Hn0OXnAcmgOcXPDrvY32tkNw8qN9gBk5qvgf9H
 8VLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781521043; x=1782125843;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=S/wz8lKERvbYqf5bVZv2UL7q03dzo45KKXIRywWSaCY=;
 b=JKUj2Q0W0ZsBdY4xfvhzE3wVrSi4UOTVZqOiaK7SHJ3UduXiPu0tGoJvkDpH9KQTkr
 NYpnFhxb4jxLlDeuqzCMjUsgwP9K+6tUZODcPF72duU+vmDDIlDPgqync0YntCsTCQm4
 c85bsJh1myrnaQ64lMgDb1uWSUDN9Ftm2je+LBoPqZTDkgDt6aYS6IvLQWVDRrct3REV
 PVxY/w3SIHcjATl0zho6myAitOllXXRg5CUYsKtRSWl7Ekf2BhsQv9BDkKaigN7LkSne
 MAf4b+6IgssBAJE69lZ4dmcu3erYHQFJtk+McPfEinClAqtXqL4M3gXfvOZ9R7Sgi79f
 diMg==
X-Gm-Message-State: AOJu0YynTiGKvyj2GPa2MtZu8tn+Bpbe6KZ09MYUA5M4UDwCeFZwujoS
 eN7e96aUu4qvfEx9kShmZhFVs+fU0wBCaA2d7mst9MBR0MAtESKnZtiVD5gkbhMhPnkCN++Dva+
 niUYHoqoODcqFw2xztNySHLs1hds4EVhVkHHdr9+XaA==
X-Gm-Gg: Acq92OELx0ZCfUwFz1FYJ+wFY9I4gPzhmSfQBk6sUK+Sju1d2y+5moLZHB3MgRClfTO
 y9uXvvM08os9H3DQmebgnWTjkr8k7mt16wDmI89i8naIBXDwXk5++zwhLnpEQLak+ouoAASLPh3
 wBaRa9PeA5wpuMt2ujW1p8uxwxHoyK4ncVxFKD1E52EWY+4TF6KYycHawj0fkHLUENypkVGQYOY
 Jn4XKa3EsVhc6sPyMTP3chGSOn1H6gnQO193c0E8KLgRz4+/7AEjmGpo5efoOHUgDJq/3bkKBpA
 +Vv5zhpwBIL9gjOndiPr1eBUVd7JOjXvzIUeSIV6Ctz/EDc2BMRoyzTOwxMbrbOgEtg=
X-Received: by 2002:a05:690e:124a:b0:660:460e:2563 with SMTP id
 956f58d0204a3-66278315b87mr12295166d50.33.1781521042754; Mon, 15 Jun 2026
 03:57:22 -0700 (PDT)
MIME-Version: 1.0
References: <20260615100200.266968-1-gshan@redhat.com>
 <20260615100200.266968-2-gshan@redhat.com>
In-Reply-To: <20260615100200.266968-2-gshan@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 15 Jun 2026 11:57:09 +0100
X-Gm-Features: AVVi8CcK9114rxVcfcgzUre6M_pMgbMdzMc0d-r31hNGHyPhIEI2Ir4K7Kfrb2s
Message-ID: <CAFEAcA9CT6E8dhEV7Ek6ruT_o2dKUf==2V+U-1WFDOLtYbgeeQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] system/memory: Use qemu_ram_{copy, move}() in ram
 device region accessors
To: Gavin Shan <gshan@redhat.com>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, mst@redhat.com, 
 peterx@redhat.com, alex@shazbot.org, richard.henderson@linaro.org, 
 berrange@redhat.com, philmd@oss.qualcomm.com, philmd@mailo.com, 
 david@kernel.org, clg@redhat.com, pbonzini@redhat.com, phrdina@redhat.com, 
 jugraham@redhat.com, liugang24219@sangfor.com.cn, dinghui@sangfor.com.cn, 
 shan.gavin@gmail.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b134;
 envelope-from=peter.maydell@linaro.org; helo=mail-yx1-xb134.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

On Mon, 15 Jun 2026 at 11:03, Gavin Shan <gshan@redhat.com> wrote:
>
> All ram device regions were turned to be indirectly accessible by commit
> 4a2e242bbb ("memory: Don't use memcpy for ram_device regions"). This leads
> to guest hang on attempt to build 'cuda-samples' as reported by Julia. The
> guest is started by the following command lines, with GH100 GPU card passed
> from the host.

> diff --git a/include/system/memory.h b/include/system/memory.h
> index 1417132f6d..5878727d09 100644
> --- a/include/system/memory.h
> +++ b/include/system/memory.h
> @@ -2897,6 +2897,8 @@ void address_space_register_map_client(AddressSpace *as, QEMUBH *bh);
>  void address_space_unregister_map_client(AddressSpace *as, QEMUBH *bh);
>
>  /* Internal functions, part of the implementation of address_space_read.  */
> +void qemu_ram_copy(void *dest, const void *src, size_t n);
> +void qemu_ram_move(void *dest, const void *src, size_t n);

New function prototypes in include headers need documentation comments.

In particular for these, it's really important that we clearly say
what semantics we are attempting to provide with them, so that
(a) when we're reviewing or later updating the implementation we
know what we are trying to provide
(b) when we're looking at the callsites we know what the function
is guaranteeing to us and what it is not, and thus whether it's
OK to use it or we need something els.

> +#if defined(__i386__) || defined(__x86_64__)
> +#define HOST_UNALIGNED_MMIO_OK 1
> +#else
> +#define HOST_UNALIGNED_MMIO_OK 0
> +#endif

We need to do something better than this. We can't
just say "oh, we trust that on x86 this works": it is
neither actually true that the compiler guarantees it even
on x86, nor is it the case that only x86 can do unaligned
accesses to normal RAM.

thanks
-- PMM

