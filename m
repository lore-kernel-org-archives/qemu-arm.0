Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F348ACA600D
	for <qemu-arm@archiver.kernel.org>; Thu,  8 Oct 2026 18:02:34 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xEsRn-0004YH-JD; Thu, 08 Oct 2026 14:02:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fuad.tabba@linux.dev>)
 id 1xEsRl-0004Xz-UC
 for qemu-arm@nongnu.org; Thu, 08 Oct 2026 14:02:25 -0400
Received: from out-130.mta1.migadu.com ([2001:41d0:203:375::82]
 helo=mta1.migadu.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <fuad.tabba@linux.dev>)
 id 1xEsRj-00080g-KY
 for qemu-arm@nongnu.org; Thu, 08 Oct 2026 14:02:25 -0400
X-Envelope-To: qemu-arm@nongnu.org
DKIM-Signature: a=rsa-sha256; bh=jU6GDQ0fJbLuacS3jddnGX6Gx21ZsLiy/RhDp+9bc88=; 
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1791482539; v=1; x=1792087339;
 b=Tl/RvL6VLQQ9EjOGc8SJHy/QCi5zNRt1Mvc/1rJJjwSLatPwburySVVa/I5Dmr6Oyounw2nV
 sPSnhe6IlQxrmG4I2LGhKH/zJOhrJJ4tIQuxuNIdRf83kCOVvBN8BNbhhne6LIycKGR7R6QmNe1
 zQxTjO89ZhR69dwBqahqsZ64=
X-Envelope-To: qemu-arm@nongnu.org
Received: by smtp.migadu.com with ESMTPS id d238dbdce2570186;
 Thu, 08 Oct 2026 18:02:19 +0000
X-Mizu-Trace-ID: d238dbdce2570186
X-Migadu-Flow: FLOW_OUT
Received: by mail-lf1-f53.google.com with SMTP id
 2adb3069b0e04-5bcbb378fc9so1051e87.0
 for <qemu-arm@nongnu.org>; Thu, 08 Oct 2026 11:02:18 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AKwUvByNCKRgJNIow+nej7h1HRKYeTv8vgTCJLQ6BfZbJMIJ5nHLbx34sqViG4Uhod/MLi9DZV7Bz/vBeA==@nongnu.org
X-Gm-Message-State: AFq9FYL5XQ0a5Oluvg9wzqiHaL1afCIsMqjY5CZuyHPCYDvYmVsHgDwr
 z/X4+mGF7uKrA582eAqzhRpZuSVVT6zgovw/HJrKSnuhW+K0s36lmD29eups01oSjqrrYhEImTl
 cjgbv6hPrhVtkkGZfA07B0j9BCQhGITPrsakwR9j/
X-Received: by 2002:a05:6512:3e0d:b0:5bb:27df:415f with SMTP id
 2adb3069b0e04-5bcd58a00b2mr166665e87.15.1791482537918; Thu, 08 Oct 2026
 11:02:17 -0700 (PDT)
MIME-Version: 1.0
References: <20261007080019.350315-1-fuad.tabba@linux.dev>
 <20261007080019.350315-4-fuad.tabba@linux.dev>
 <4ajscli4c4ef7agtizxzdiopjseck5qwa6s4n4mmwwjdrqlnby@xit5l76dxm2w>
 <CA+EHjTxsC8K1Bw6fAMs6APaqVDpup8192dCeJs+vfeh2fN+6Aw@mail.gmail.com>
 <3dqmrslvb3zrr3ndzmcmy2tv5vqovntordzdjqkp2vn2deklua@qkcedhe4owgv>
In-Reply-To: <3dqmrslvb3zrr3ndzmcmy2tv5vqovntordzdjqkp2vn2deklua@qkcedhe4owgv>
From: Fuad Tabba <fuad.tabba@linux.dev>
Date: Thu, 8 Oct 2026 19:01:41 +0100
X-Gmail-Original-Message-ID: <CA+EHjTwnpaFRFEzT8N34=t6JzKn+x=a6GUqa1U6vH2e+vW6C8g@mail.gmail.com>
X-Gm-Features: AclHuK8yKj6g9Ofrj1aWGEVt6NjDny5SPHd9V97LWwmYXzLzRa1XNrjqqSOSOSk
Message-ID: <CA+EHjTwnpaFRFEzT8N34=t6JzKn+x=a6GUqa1U6vH2e+vW6C8g@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] tests/tcg/aarch64: Add a test for the 52-bit TTBR
 base address layout
To: Gustavo Romero <gromero@redhat.com>
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org, 
 Richard Henderson <richard.henderson@linaro.org>, Will Deacon <will@kernel.org>,
 Itaru Kitayama <itaru.kitayama@linux.dev>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2001:41d0:203:375::82;
 envelope-from=fuad.tabba@linux.dev; helo=mta1.migadu.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_PASS=-0.001,
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

Hi Gustavo,

On Thu, 08 Oct 2026 17:40:27 +0100, Gustavo Romero <gromero@redhat.com> wrote:
[...]
> RAM_BASE is precisely defined as 1 << 30 because the way we link the tests based
> on the memory layout defined in tests/tcg/aarch64/system/kernel.ld, right?

Yes. The tables are static, so they're linked a few MB above RAM_BASE,
inside the blocks both stages map at RAM_BASE (and stage 2 again at
HIGH_IPA | RAM_BASE).

> That's the bit that also confused me, like, how Stage 2 entries:
>
> s2_l2[RAM_BASE >> 29] = RAM_BASE | S2_BLOCK;
> s2_l2_high[RAM_BASE >> 29] = RAM_BASE | S2_BLOCK
>
> are taking us back to s1_l0. How s1_l0 ends up related to RAM_BASE :)
>
> Hence, I think it's worth mentioning that relationship also in this text. How
> about something like:
>
> "RAM_BASE is chosen to match the memory layout defined in kernel.ld. As a
> result, s1_l0 resides at an offset from RAM_BASE after linking."
>
> Wdyt?

Agree. The stage 1 and VTCR.DS stage 2 mappings depend on it too, so
I've put it on the RAM_BASE define for v3 rather than in that comment:

        /*
         * kernel.ld links the test at 1GB, so the tables below lie within the
         * blocks mapped at RAM_BASE.
         */
        #define RAM_BASE    0x40000000UL

Cheers,
/fuad

