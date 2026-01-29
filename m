Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ABA08D6101A
	for <qemu-arm@archiver.kernel.org>; Thu, 29 Jan 2026 13:59:26 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vlSY6-0004qi-6Z; Thu, 29 Jan 2026 08:59:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1vlSY5-0004qG-02
 for qemu-arm@nongnu.org; Thu, 29 Jan 2026 08:59:05 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1vlSY3-0001gS-KH
 for qemu-arm@nongnu.org; Thu, 29 Jan 2026 08:59:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1769695142;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=0mzBwcr4SPvpOv7IvzCKtPngX3nJdjp02emv6IwJHXk=;
 b=LPj+JBbvmyARsAlUX/96Z48QKSnJguWxYE+J/MRcAjoYphR6lt3qZqww9ncQPIJtQoZN//
 ymLMhFKYgYlwP7clSiG+DHaSZ1ItMfxdbnJEx45HXdAfhFujzBcu8mWMPbHwQ5WW4GejC/
 7sItTii8tMmsgsU/bFw/40GXpNJGxew=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-678-BX5gQKemMN-a2vA1g3xmmQ-1; Thu, 29 Jan 2026 08:58:59 -0500
X-MC-Unique: BX5gQKemMN-a2vA1g3xmmQ-1
X-Mimecast-MFC-AGG-ID: BX5gQKemMN-a2vA1g3xmmQ_1769695138
Received: by mail-wm1-f70.google.com with SMTP id
 5b1f17b1804b1-4806e7c4220so8511035e9.2
 for <qemu-arm@nongnu.org>; Thu, 29 Jan 2026 05:58:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1769695138; x=1770299938;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=0mzBwcr4SPvpOv7IvzCKtPngX3nJdjp02emv6IwJHXk=;
 b=Xe/WiWW1/TGoX2XecuJjVipIdLH8pKluES9eiWsCwWxFAnBwJa2Wz4uEccDUOvdU0E
 /lqzRD3A/jOrz7DNHs2pxLcVTV+WmwpxZwjHWrWh0NGac1rEbXm7XgQw7W5WeHARqEjZ
 oZkE5d5Lkmw2zHa58L0Hn7P2YcH5VdyI2WB7M8Ptz3siovQcsHE6OzGUCJowD3AA96SY
 TkeXlJDUpv9Xa9e8tjLzQeG48YbnmLZdTpZ3L02GE8BHTXYQUCYr6Dp8rPGBcMLE68aB
 9T6Hjyjc8GROgv1wjP1KFDt+MJPk9vf5Hl0fWljuaLGeQGhRVy/Kc0uAA3k2ZKHkDh2n
 C+WA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUrNEKqQatTorZDKd8NrCtPRd/IRvQfN6JfoVKMilei7RFCqHQcQDYOKMob5JGogO+xzn2SqnI2pg==@nongnu.org
X-Gm-Message-State: AOJu0YwVOBeEC6v1hQG+pYFBaN5JqJw86ki6Xc3Cp+SJWWYxFtXzwQlv
 XmmtFJdhGf/Os5hqKDZfiqzrMK7gIfDqOxGrcZjcGbuc8PTL+KpN92W1LZE6iBgCb2O+WLiLQe6
 EMTer9SCotLZw+Yvxn5jvGSdzws6kxtOZEFrnagGYNhFGP1Tn/ZOb1w==
X-Gm-Gg: AZuq6aKEreC4pcJdZeYTC3yeXUp13DKEcK5rLZ29BUxAyQjAE6zbZuJsOGcQbPlzJap
 veDPRPosiBvs/Bp+TTOqceSUsWhq/wO3Rv0j4bbo7L8dRpPFQlh2i1MNFJO1YcxV0CanzNmqjFE
 gEfkfqwLaFziHXH6LqTRR5qontbeEnajuLxtNKYMWHi6EO+5uKsjyEVsfI9kubI65nVhCm5IupH
 ybo5MqNrR+Zcyxtp8wriHCkMoT+KQQDYr94Zcb7fbmMXW//2hB2H4Omzi02fyXLm4wtTfVdfRXs
 zZlnaXHoL4eF/go6WYEOb81d7trVc7RZ/yKY1eCjS+40ZBSA7cDsnqSjRYbudh1Ph8TJ2SeFLj6
 i3KnnbyqGm4ZJ6G+AHxOUHEnL/YGmrtDmPA==
X-Received: by 2002:a05:600c:1e1c:b0:479:2f95:5179 with SMTP id
 5b1f17b1804b1-48069c161d3mr113493685e9.15.1769695137959; 
 Thu, 29 Jan 2026 05:58:57 -0800 (PST)
X-Received: by 2002:a05:600c:1e1c:b0:479:2f95:5179 with SMTP id
 5b1f17b1804b1-48069c161d3mr113493445e9.15.1769695137573; 
 Thu, 29 Jan 2026 05:58:57 -0800 (PST)
Received: from redhat.com (IGLD-80-230-34-155.inter.net.il. [80.230.34.155])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-435e1353ac2sm15682263f8f.38.2026.01.29.05.58.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Jan 2026 05:58:57 -0800 (PST)
Date: Thu, 29 Jan 2026 08:58:53 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: Mohamed Mediouni <mohamed@unpredictable.fr>, qemu-devel@nongnu.org,
 Zhao Liu <zhao1.liu@intel.com>,
 Roman Bolshakov <rbolshakov@ddn.com>, qemu-arm@nongnu.org,
 Ani Sinha <anisinha@redhat.com>,
 Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@linaro.org>,
 Yanan Wang <wangyanan55@huawei.com>,
 Akihiko Odaki <odaki@rsg.ci.i.u-tokyo.ac.jp>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Pedro Barbuda <pbarbuda@microsoft.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?iso-8859-1?Q?Marc-Andr=E9?= Lureau <marcandre.lureau@redhat.com>,
 Shannon Zhao <shannon.zhaosl@gmail.com>,
 Igor Mammedov <imammedo@redhat.com>, Cameron Esfahani <dirty@apple.com>,
 Alexander Graf <agraf@csgraf.de>, Eduardo Habkost <eduardo@habkost.net>,
 Phil Dennis-Jordan <phil@philjordan.eu>
Subject: Re: [PATCH v18 05/22] tests: data: update AArch64 ACPI tables
Message-ID: <20260129085831-mutt-send-email-mst@kernel.org>
References: <20260127182805.73212-1-mohamed@unpredictable.fr>
 <20260127182805.73212-6-mohamed@unpredictable.fr>
 <CAFEAcA9qtLv1wOKkEmtNO5UsGTAM0x7YD+y8Fsu8hCQRAD_o5A@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAFEAcA9qtLv1wOKkEmtNO5UsGTAM0x7YD+y8Fsu8hCQRAD_o5A@mail.gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: g0DU0OMikAGyCZvurKd3PG2tCztped6S4khmfWY4O3E_1769695138
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On Thu, Jan 29, 2026 at 01:36:49PM +0000, Peter Maydell wrote:
> On Tue, 27 Jan 2026 at 18:28, Mohamed Mediouni <mohamed@unpredictable.fr> wrote:
> >
> > After the previous commit introducing GICv3 + GICv2m configurations,
> > update the AArch64 ACPI tables for the GICv2 case.
> >
> > Signed-off-by: Mohamed Mediouni <mohamed@unpredictable.fr>
> > ---
> >  tests/data/acpi/aarch64/virt/IORT               | Bin 128 -> 84 bytes
> >  tests/data/acpi/aarch64/virt/IORT.smmuv3-dev    | Bin 364 -> 260 bytes
> >  tests/data/acpi/aarch64/virt/IORT.smmuv3-legacy | Bin 276 -> 192 bytes
> >  tests/qtest/bios-tables-test-allowed-diff.h     |   3 ---
> >  4 files changed, 3 deletions(-)
> 
> The process documented in tests/qtest/bios-tables-test.c says
> that this commit is supposed to have the diff of the disassembled
> table data in the commit message, so that human reviewers can
> confirm that the changes are as expected. (If you git log
> tests/data/acpi you can see how this looks.)

not just that, also so the patch can be rebased.

> Can you provide the ASL diff, please? (If this is going to be the
> only fix needed to this version of the series, which I hope it
> will be, then I can update the commit message as I apply the
> series, so you don't need to respin, just reply with the updated
> commit message with the diff in it.)
> 
> thanks
> -- PMM


