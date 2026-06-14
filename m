Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D5E7CD98C5
	for <qemu-arm@archiver.kernel.org>; Sun, 14 Jun 2026 17:23:33 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wYoYB-0000KV-EW; Sun, 14 Jun 2026 13:23:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1wYoY9-0000Jw-H4
 for qemu-arm@nongnu.org; Sun, 14 Jun 2026 13:23:09 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1wYoY8-0004fn-2y
 for qemu-arm@nongnu.org; Sun, 14 Jun 2026 13:23:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1781457786;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=HGs2h+lMn0M3AiOOwvFy6S0QGjQprX44OL7WY5rr53s=;
 b=InBOuhwP/clVScK4Nee96eK9dtV1dsP6NRPJ5ie5AccH3MyO5Cv+1yVniipTAW7U5PqmQP
 R5Nvw+EZk2bKm3qOoyjjB9H63zPPDXhtLec8aTpfxPMBs+8Uakd5f3GqSsHMmVmqDy9Har
 kpf/6Jdm0IFUmZ96xFm91ShnkPxl+Ko=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-186-b2PGkBxHOx2DrHrauDT7Ew-1; Sun, 14 Jun 2026 13:23:05 -0400
X-MC-Unique: b2PGkBxHOx2DrHrauDT7Ew-1
X-Mimecast-MFC-AGG-ID: b2PGkBxHOx2DrHrauDT7Ew_1781457784
Received: by mail-wm1-f69.google.com with SMTP id
 5b1f17b1804b1-490b61243easo27994595e9.2
 for <qemu-arm@nongnu.org>; Sun, 14 Jun 2026 10:23:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781457784; x=1782062584;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=HGs2h+lMn0M3AiOOwvFy6S0QGjQprX44OL7WY5rr53s=;
 b=o6vIPVJDonMALD4CoBajWHm7vo3tH3wJzRSMe7WDpf73PRZBHxtrDNJfu1cEInXRQ+
 m0diQ8AkPPwx+dVBTgg1cMsrLzSqEhpNi0pB1Ug7EskQd1jkkFIp69RCiRqWAZ37ZYOr
 ZurqyISJXZX8s0Rlc+8TKRm76eM/6zVxKmv8meBFnBq93N1qQ+jpl+uFJRdJGbU5qMar
 olHWNzQDuCi1dPg9pPkiBjYqBEVlTtPgMLVZiQiRlm7cyZ50Jj0lF3Y0NPydp5vrrzla
 g4G4JEFOQY2J3eR+pTvjlJUqYPZWr0VPbTyjQdv9lb11QgFp2YB5RyOEbHoYXMz7JDdE
 9Dzw==
X-Forwarded-Encrypted: i=1;
 AFNElJ9q2xgDnvK70v0+CkTBIyjLhlylns8ChtMvrLKBdkhXfynTkJAETYp4HzfoMkZBOL9/1XejvUlirA==@nongnu.org
X-Gm-Message-State: AOJu0Yy7Cb0BR5DuSREUs96MOB+Mafclc4P2YQaBq3cPET89FONhRirZ
 Sg6MrVrIkOrmehyZMAaSqGCE5SrMJcE6NCEgRz4QM9mj1wg6wYD4fNxyNR1QeD6tYS6BLMBG6A9
 ssl9SAFuNpHTFoLWrcHntNqUQUZpWjQelUMeKw74f123t2g7mLiYW7w==
X-Gm-Gg: Acq92OHZ165Qu3y8jm8YloB8k8GvALN+nLh72qlq6wfcZJbPphaaj9ty2Xg8cHW4rom
 coTZk2y5CWw6KWo2d1Z2ByOBF6Is268rUZQ4KgMF2DykUn3F1PJwuEp3OrivA5P9m3mWrEZOP7b
 3K7aknvOnjVes7sOfwJUOJ0nM0HpIktZwOfKuOFqRjw9yZU+/jfvAOOowLsrYGmlUKYP/g8kSTd
 ZI3nxPD4a0+aEm0vpgkVCjCQMCeaEGJbz5PVJgQc2fypmHGzgs9+Y3QYJRkqCqE4G4cXiKuv6EE
 Eqg5NGcce93um0Z0OK99j/3grCuLjgZOXgT9Mt9o1EREHwXjw/hea0hl80bKFWPvd4w1ZDC+DbB
 4FZAA2/Fn8kSLXQUuMrKtKfiZpngvH7Qo0wcjBcG6A8w=
X-Received: by 2002:a05:600d:8497:20b0:490:ba61:7981 with SMTP id
 5b1f17b1804b1-490ec4ee151mr97774905e9.23.1781457784055; 
 Sun, 14 Jun 2026 10:23:04 -0700 (PDT)
X-Received: by 2002:a05:600d:8497:20b0:490:ba61:7981 with SMTP id
 5b1f17b1804b1-490ec4ee151mr97774595e9.23.1781457783620; 
 Sun, 14 Jun 2026 10:23:03 -0700 (PDT)
Received: from redhat.com (IGLD-80-230-85-71.inter.net.il. [80.230.85.71])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4606f263945sm26656918f8f.8.2026.06.14.10.23.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 14 Jun 2026 10:23:02 -0700 (PDT)
Date: Sun, 14 Jun 2026 13:22:59 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Richard Henderson <richard.henderson@linaro.org>
Cc: Peter Maydell <peter.maydell@linaro.org>, Gavin Shan <gshan@redhat.com>,
 qemu-arm@nongnu.org, qemu-devel@nongnu.org, peterx@redhat.com,
 berrange@redhat.com, david@kernel.org, alex@shazbot.org,
 clg@redhat.com, pbonzini@redhat.com, philmd@mailo.com,
 phrdina@redhat.com, jugraham@redhat.com, shan.gavin@gmail.com
Subject: Re: [PATCH 1/2] system/memory: Use __builtin_mem{cpy, move} in
 accessors of ram device region
Message-ID: <20260614131704-mutt-send-email-mst@kernel.org>
References: <20260612110307.1264798-1-gshan@redhat.com>
 <20260612110307.1264798-2-gshan@redhat.com>
 <223f5f94-b9b7-46b0-8466-5be655203a0e@linaro.org>
 <CAFEAcA-TgP_BM0WQo3rysZmvhNN17Gc_nrSYB6pXn-mvs5w13g@mail.gmail.com>
 <123d9e80-d731-42c7-81cc-71de47bb13d3@linaro.org>
 <20260614084004-mutt-send-email-mst@kernel.org>
 <02d809b0-6396-40dd-a2c5-866028b7cc4d@linaro.org>
MIME-Version: 1.0
In-Reply-To: <02d809b0-6396-40dd-a2c5-866028b7cc4d@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: hV-A884TeWOJS8W46PgugFFtOQb17UkwnGik7FCjWbA_1781457784
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.445,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On Sun, Jun 14, 2026 at 09:45:51AM -0700, Richard Henderson wrote:
> On 6/14/26 08:13, Michael S. Tsirkin wrote:
> > Yes, I think it does work because we use -fno-strict-aliasing.
> > For bigger sizes we'll need packed because the addresses
> > could be unaligned.
> ...
> > For most host/guest pairs things simply work even for unaligned.
> > 
> > And yes, guest drivers do do this.
> > 
> > On classical pci, there are no transactions as such and
> > an unaligned access will be split anyway.
> 
> I'm saying, if you're talking about pass-through to real devices, that won't
> work. For instance, AArch64 will trap unaligned accesses to Device memory.

Presumably, AArch64 drivers don't do unaligned at all then?

> You need to actually handle unaligned.  Perhaps something like
> 
>     /* Find unit to fit size and alignment of dst */
>     uintptr_t test = (uintptr_t)dst | size;
>     uintptr_t lsb = test & -test;
> 
>     switch (lsb) {
>     case 1:   // loop over uint8_t
>     case 2:   // loop over uint16_t
>     case 4:   // loop over uint32_t
>     default:  // loop over uint64_t
>     }
> 
> with the expectation that normally we'll have aligned addresses and size
> such that the loop will iterate once.
> 
> 
> r~

And ifdef for arches without unaligned support?

-- 
MST


