Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21C26CA0FFE
	for <qemu-arm@archiver.kernel.org>; Tue,  2 Sep 2025 16:10:32 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1utTZs-0003SF-Ip; Tue, 02 Sep 2025 12:09:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1utTZq-0003Qq-UZ
 for qemu-arm@nongnu.org; Tue, 02 Sep 2025 12:09:46 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1utTZo-0003Vt-NP
 for qemu-arm@nongnu.org; Tue, 02 Sep 2025 12:09:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1756829381;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UpcHDAAyOTYM3eawixZKhDYVLH1RxWSoq6LduiFlQRw=;
 b=E7D+839pLM0+/xu78aR14CoJkDkjVZVuawImtuZ4bocCaq1+qUPBZlTP0CvqS7GfQF+J7u
 ZSZ0PVU6IWTUKPHYUeKtZOJWbsFSWiXfrfisbnezgfPdrzI0bEa1u2gXXGp+bYHM6iZCqt
 m8l7yrBfFEOdwHVbOULowIPSUB7W2TY=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-365-ncNF5U4DP3uIHVB1OrLaFQ-1; Tue, 02 Sep 2025 12:09:40 -0400
X-MC-Unique: ncNF5U4DP3uIHVB1OrLaFQ-1
X-Mimecast-MFC-AGG-ID: ncNF5U4DP3uIHVB1OrLaFQ_1756829380
Received: by mail-qv1-f71.google.com with SMTP id
 6a1803df08f44-720408622c3so14834566d6.0
 for <qemu-arm@nongnu.org>; Tue, 02 Sep 2025 09:09:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756829380; x=1757434180;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=UpcHDAAyOTYM3eawixZKhDYVLH1RxWSoq6LduiFlQRw=;
 b=N/9bA9pUlEQAQ+jAEJNnBc9HiQ6oRB/Wqs4yyb1cebjb/JAYF44XhzwdBj0OI7IORc
 q52YkyAvPQp2U2A2LEt1WDlbbIWCmfLefkvYr/gmiNufwEczuFYS4VIYR/UN4VJmSM5A
 FlRm1qzTaxWtcVboeUYU6HQm2WpNctgbqxc1s1rzlsjjhHzykMhaJub+107zRE+tiFfv
 CZyI8jD5gjPjzgXuqbSBXd5aAee7bzKnQzXBZY/SODOnCxAbToJXPafLsHP0pOTy272z
 3+Pyh8DkSFB7f9ebycqXKGOws5Ct25HYUxvyBAfiLBH3SPyIdUaEQ0cCQs6r3wf6qxSR
 OsEA==
X-Forwarded-Encrypted: i=1;
 AJvYcCW+voCpG+mZlgifs6pLnMui/zgoyUjlcK5UufYiV0ka63Rc7Ykl1TNaq5PNtC2IzpQGUzpIv/PfSg==@nongnu.org
X-Gm-Message-State: AOJu0YxlD+2OGokqXM+9zZt2gdB08iJ7MpIVKYK9iT7zUuuY1MagxA3Y
 tSGpuBHkk5Nl8VydJfne47lC8UiL4MpeNtZC3DPQXdOba2UKq9KcM4jIbgCfGknIg5U6Bh3k805
 0R53d4Lk+EVt2XYHjZGmf2Q6JzNhMFF2dBtlZU6qP6JEqdbGdOcHXcA==
X-Gm-Gg: ASbGncvrnu3e8mvaq1GGhY0xkbL0brLyoJONvTZirb05B4L3ZkWMnWxY4OASeSy6y+/
 3KmqZnK5M9g7vLc9Q9XobqOyZNLDJynZoCqja7Nx1IJzxvF3huJOdtPBwQ/3S6AEwircjF79R5N
 F/9ZGDO4ZK4YTYs/ctHZQPuTXVg3Jt0VBfKBxuU+WuS/fOb3h3bYAP1417K9h6MeqbxN/mh0Ix2
 MPm3lB7WK8F1+/zOOyCnAubgT0eNxW9LNez1Hn81kje9HpGKMTvO3WgJ/298dfAhDywBBFjTyiz
 2bIcDqVgmemqW3u3IQIqPlhqy1zrM10ShsH9Y/8A2GWoqUCrFLjMIxv/ijBbWClUjpwta4RNn3H
 SdftRu7k3gQd17MLciBd8Jw==
X-Received: by 2002:ad4:5bea:0:b0:719:8c9:ac46 with SMTP id
 6a1803df08f44-71908c9b053mr84640136d6.31.1756829379314; 
 Tue, 02 Sep 2025 09:09:39 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFFA+o8MtdVn6jh8uqZQg4EkE9j0wQjPLs6EY5RaKa/Upm95l8mvxsJO1EplXbmIuVokSj4Lg==
X-Received: by 2002:ad4:5bea:0:b0:719:8c9:ac46 with SMTP id
 6a1803df08f44-71908c9b053mr84639366d6.31.1756829378573; 
 Tue, 02 Sep 2025 09:09:38 -0700 (PDT)
Received: from x1.local
 (bras-base-aurron9134w-grc-11-174-89-135-121.dsl.bell.ca. [174.89.135.121])
 by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-720b4947b1asm13911186d6.41.2025.09.02.09.09.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Sep 2025 09:09:37 -0700 (PDT)
Date: Tue, 2 Sep 2025 12:09:33 -0400
From: Peter Xu <peterx@redhat.com>
To: CJ Chen <cjchen@igel.co.jp>
Cc: qemu-devel@nongnu.org, qemu-block@nongnu.org, qemu-riscv@nongnu.org,
 qemu-arm@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Keith Busch <kbusch@kernel.org>, Klaus Jensen <its@irrelevant.dk>,
 Jesper Devantier <foss@defmacro.it>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Weiwei Li <liwei1518@gmail.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Tyrone Ting <kfting@nuvoton.com>, Hao Wu <wuhaotsh@google.com>,
 Max Filippov <jcmvbkbc@gmail.com>, David Hildenbrand <david@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Fabiano Rosas <farosas@suse.de>, Laurent Vivier <lvivier@redhat.com>,
 Tomoyuki Hirose <hrstmyk811m@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [RFC PATCH v2 1/9] doc/devel/memory.rst: additional explanation
 for unaligned access
Message-ID: <aLcWvR5Snm1RXEcY@x1.local>
References: <20250822092410.25833-1-cjchen@igel.co.jp>
 <20250822092410.25833-2-cjchen@igel.co.jp>
MIME-Version: 1.0
In-Reply-To: <20250822092410.25833-2-cjchen@igel.co.jp>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: mahaA-5VF-uXAsGhptTpxIvxzIjNcXmAr7zykCqJq68_1756829380
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
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

On Fri, Aug 22, 2025 at 06:24:02PM +0900, CJ Chen wrote:
> Add documentation to clarify that if `.valid.unaligned = true` but
> `.impl.unaligned = false`, QEMU’s memory core will automatically split
> unaligned guest accesses into multiple aligned accesses. This helps
> devices avoid implementing their own unaligned logic, but can be
> problematic for devices with side-effect-heavy registers. Also note
> that setting `.valid.unaligned = false` together with
> `.impl.unaligned = true` is invalid, as it contradicts itself and
> will trigger an assertion.
> 
> Signed-off-by: CJ Chen <cjchen@igel.co.jp>
> Acked-by: Tomoyuki Hirose <hrstmyk811m@gmail.com>
> Suggested-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  docs/devel/memory.rst | 18 ++++++++++++++++++
>  1 file changed, 18 insertions(+)
> 
> diff --git a/docs/devel/memory.rst b/docs/devel/memory.rst
> index 57fb2aec76..71d7de7ae5 100644
> --- a/docs/devel/memory.rst
> +++ b/docs/devel/memory.rst
> @@ -365,6 +365,24 @@ callbacks are called:
>  - .impl.unaligned specifies that the *implementation* supports unaligned
>    accesses; if false, unaligned accesses will be emulated by two aligned
>    accesses.
> +- Additionally, if .valid.unaligned = true but .impl.unaligned = false, the
> +  memory core will emulate each unaligned guest access by splitting it into
> +  multiple aligned sub-accesses. This ensures that devices which only handle
> +  aligned requests do not need to implement unaligned logic themselves. For
> +  example, see xhci_cap_ops in hw/usb/hcd-xhci.c: it sets  .valid.unaligned
> +  = true so guests can do unaligned reads on the xHCI Capability Registers,
> +  while keeping .impl.unaligned = false to rely on the core splitting logic.
> +  However, if a device’s registers have side effects on read or write, this
> +  extra splitting can introduce undesired behavior. Specifically, for devices
> +  whose registers trigger state changes on each read/write, splitting an access
> +  can lead to reading or writing bytes beyond the originally requested subrange
> +  thereby triggering repeated or otherwise unintended register side effects.
> +  In such cases, one should set .valid.unaligned = false to reject unaligned
> +  accesses entirely.
> +- Conversely, if .valid.unaligned = false but .impl.unaligned = true,
> +  that setting is considered invalid; it claims unaligned access is allowed
> +  by the implementation yet disallowed for the device. QEMU enforces this with
> +  an assertion to prevent contradictory usage.

Some cosmetic comments only..

This shouldn't be another bullet, but rather a separate sub-section,
because it describes the relationship of above two entries.

IMO it can be better like this:

MMIO Operations
---------------

...

- .valid.min_access_size, .valid.max_access_size...

- .valid.unaligned...  See :ref:`unaligned-mmio-accesses` for details.

- .impl.min_access_size, .impl.max_access_size...

- .impl.unaligned...  See :ref:`unaligned-mmio-accesses` for details.

.. _unaligned-mmio-accesses:

Unaligned MMIO Accesses
~~~~~~~~~~~~~~~~~~~~~~~

...

-- 
Peter Xu


