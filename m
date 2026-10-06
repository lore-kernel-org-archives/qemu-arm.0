Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90FF7CA5FF1
	for <qemu-arm@archiver.kernel.org>; Wed,  7 Oct 2026 09:06:12 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xENUp-0007tW-4S; Wed, 07 Oct 2026 04:59:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fuad.tabba@linux.dev>)
 id 1xEKsJ-0003Dr-S6
 for qemu-arm@nongnu.org; Wed, 07 Oct 2026 02:12:16 -0400
Received: from out-141.mta0.migadu.com ([2001:41d0:1004:224b::8d]
 helo=mta0.migadu.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <fuad.tabba@linux.dev>)
 id 1xEKs5-00029a-5u
 for qemu-arm@nongnu.org; Wed, 07 Oct 2026 02:11:30 -0400
X-Envelope-To: qemu-arm@nongnu.org
DKIM-Signature: a=rsa-sha256; bh=23mYlrG2cdi53aM9FDjWK41Tu5taXomCLzhdx5ei8vo=; 
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1791353458; v=1; x=1791958258;
 b=Gl5negLgPJVWXTdkncz5xsDrwllW6BB0uPlhAbasfXzgTdy+4lB+WtkSzdlMVn1ZAzx0/UoA
 NxHxzjdmj1nVkI3lfAljfW7m3vIy0lglrZuj9pl8KWK+N1hKdTmhh3+NIneHuFSLyytLru/Osgn
 JSktPhnvziImb014Asrs1Ff8=
X-Envelope-To: qemu-arm@nongnu.org
Received: by smtp.migadu.com with ESMTPS id bae64502f10e2f86;
 Tue, 06 Oct 2026 09:28:12 +0000
X-Mizu-Trace-ID: bae64502f10e2f86
X-Migadu-Flow: FLOW_OUT
Received: by mail-lf1-f51.google.com with SMTP id
 2adb3069b0e04-5bcbb378fc9so6575e87.0
 for <qemu-arm@nongnu.org>; Tue, 06 Oct 2026 02:28:12 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AKwUvBz68nZetTPC2vs2s2JVYT1uH4JYYAgL2nSiEvJstq4k16JywvbbfnVh79XVqAqqlBx5y8VX2BzD3Q==@nongnu.org
X-Gm-Message-State: AFq9FYKOXhRwKCKHgseEgQPxIa3R60lmqU20UM3rveL7oDuMKRWl+alL
 aPdcq5MsZNJkVOPxG6QqB/RsNf+hc4+ZbZnv3Lozcr1bJ10dWwEkniuFX6n9SBwWKNBiMWwezTn
 yI6n/iOpw3rXtruzw511sMckaPpKFAKLjZfyT2ucK
X-Received: by 2002:a05:6512:33d4:b0:5b8:e882:5148 with SMTP id
 2adb3069b0e04-5bcca86ee33mr79019e87.14.1791278891513; Tue, 06 Oct 2026
 02:28:11 -0700 (PDT)
MIME-Version: 1.0
References: <20261001175003.ttbr-baddr-52bit-0-fuad.tabba@linux.dev>
 <20261002070925.2627344-1-fuad.tabba@linux.dev>
 <l5hcpwnktn2hvbt55ux42xzb2euc5zqohnxtaiftr7lxynfx2g@myyytd4e4owp>
 <20261005214451.1036668-1-fuad.tabba@linux.dev>
 <CAFEAcA81JuAjk-aOnBWcT1ZXWy0U9tVrWRoa5yYQ4WtvhZJKjg@mail.gmail.com>
In-Reply-To: <CAFEAcA81JuAjk-aOnBWcT1ZXWy0U9tVrWRoa5yYQ4WtvhZJKjg@mail.gmail.com>
From: Fuad Tabba <fuad.tabba@linux.dev>
Date: Tue, 6 Oct 2026 11:27:35 +0200
X-Gmail-Original-Message-ID: <CA+EHjTzvAKMf5LWVfvSLv6tqoi+MaVi91E++RvYpTDL6tzrZ5w@mail.gmail.com>
X-Gm-Features: AclHuK-xl8GepuyPVLw1vn7yLRDxqOS795mMrZVyjK5xBzUL2FH1vTgtAK5mv54
Message-ID: <CA+EHjTzvAKMf5LWVfvSLv6tqoi+MaVi91E++RvYpTDL6tzrZ5w@mail.gmail.com>
Subject: Re: [PATCH 1/2] target/arm: Clear TTBR[5:0] from a 52-bit table base
 address
To: Peter Maydell <peter.maydell@linaro.org>
Cc: Gustavo Romero <gromero@redhat.com>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org, 
 Richard Henderson <richard.henderson@linaro.org>, Will Deacon <will@kernel.org>,
 Itaru Kitayama <itaru.kitayama@linux.dev>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2001:41d0:1004:224b::8d;
 envelope-from=fuad.tabba@linux.dev; helo=mta0.migadu.com
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

Hi Peter,

On Tue, 6 Oct 2026 at 11:03, Peter Maydell <peter.maydell@linaro.org> wrote:
[...]
> Personally I prefer "fix commit first, test commit second", especially
> for cases like this where the fix is a one-liner and the test case is
> 150 lines; but I don't object to single-commit strongly enough to
> require splitting it if it wouldn't otherwise require a respin.

Since Gistavo had other feedback, I'm happy to respin with this.

Cheers,
/fuad

> thanks
> -- PMM

