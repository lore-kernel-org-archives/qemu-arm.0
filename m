Received: by 10.25.221.202 with SMTP id w71csp1496211lfi;
        Fri, 11 Aug 2017 16:22:47 -0700 (PDT)
X-Received: by 10.55.129.7 with SMTP id c7mr20735708qkd.29.1502493767219;
        Fri, 11 Aug 2017 16:22:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1502493767; cv=none;
        d=google.com; s=arc-20160816;
        b=NzslsUmSUcDqomaiCtmqggI+geQx37COwVckwdlQahhhYxw1fNymwm9iMbl4FNJsdo
         13ogMSO5r84k/rhBs48QinLWcNnUirwMtgB7AFbbkKt2CJtOV8nayisQ7whxMWPRJoOH
         kvIy3Ccg3aMLj1inw/lsH3ncILufUOrwF3ObC09RHxAQ7Btiaxqm3iZWUgnqbG2nLEq7
         MX4Cf3Gd/EW6yWQQiUiQGHuvzIStXmHUW4rKbUHwvTxQrzHZmupw3beBD9/Rk2XnJDa6
         sCxfIacliJkf4S1SzS0sZRpR2BxA83P2OaUBB9ve3FEIKKgrc9hvZIW00wx+vQQDGTNC
         TNfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=8g1YqebbzmFmaCrk5Iwzg4Qc8CE1lcarDjfgPi9EFSc=;
        b=Y9/tOOWTwRX3pxQiGTba3/lbwCVxfxVA8YiPPrfuPbPQ8Ju8bl1S1rUFlvhpcJmD2y
         5CliuP9TYgcstMvilIh7PzbXPbxzy1snWCHpby9SaGW7VnmxZP5G/9woqR812WLK6vIY
         uMnRCJyxM5z+Wz8GXo4Gl4lCaH5R8tx0LtHx0Or17xFQRuxHzse5HzZrJ0Dk/5Qs6eYl
         ys0eA0EM/LG2wZcSsgBJr4vGwcGXe3yV0lQ1LfU90O/LVDK2JIOzCvdOFkGMvs45XBl1
         lkYXP85JxrYC2DrUVqOkvCQUA7hT38bi9rOvpnYzMbkcto2VZLSRWoJJO/aFBH0C14I8
         I+ig==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=G1XyN+kf;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id r33si1711037qtd.191.2017.08.11.16.22.46
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 11 Aug 2017 16:22:47 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=G1XyN+kf;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:58321 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dgJGO-0006PF-Ms
	for alex.bennee@linaro.org; Fri, 11 Aug 2017 19:22:44 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50174)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1dgJFT-00062N-TN
	for qemu-devel@nongnu.org; Fri, 11 Aug 2017 19:21:48 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1dgJFS-00012W-S1
	for qemu-devel@nongnu.org; Fri, 11 Aug 2017 19:21:47 -0400
Received: from mail-wm0-x241.google.com ([2a00:1450:400c:c09::241]:38661)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <alistair23@gmail.com>)
	id 1dgJFS-00012L-KY; Fri, 11 Aug 2017 19:21:46 -0400
Received: by mail-wm0-x241.google.com with SMTP id y206so7955488wmd.5;
	Fri, 11 Aug 2017 16:21:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=8g1YqebbzmFmaCrk5Iwzg4Qc8CE1lcarDjfgPi9EFSc=;
	b=G1XyN+kfHOuWaVDM4G1wZ//D6yhIHxIcnBEN0XqkI3L7kMFiKzfKJgJStO9NzQ7v4a
	5FZPatFAYPefOAoauxjrvxFehohu0OjuNUdsQ30G+LDIc3JowpEu8oxd3cgadj4/HmtR
	xGIeo7Ugo/+Plp+W+BVald9ohEeFP2NaI2HfmZ6seNTP2XpV5wy19TDkKgB6ayNcRuLj
	IIld7drCw9+6bt9f8bQV2REVKirZXzBX/LrNv//JKVm/0ERzZk4fmHVh6VQU3guZL0X2
	do3lpxXlZ+f4f63jDu9ID8l1XFJzU7F11enzRiUmWKroQxr2GEqKWYjQ71P70JZuwa1E
	f/4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=8g1YqebbzmFmaCrk5Iwzg4Qc8CE1lcarDjfgPi9EFSc=;
	b=cQemfjXKTeyJWF70xtOghSafQ/AxU9jhQAiPIc6zHzEbTWgJiq7rsfPix3R3ESkDfJ
	+3bqK0OZQ34/HAfEo1QrDWNsG5KkrRf9Wd1dso6wLXtDXfKxKr5fl7c30mV0IzTqwG6O
	1n5BHXb5txH1hcZxjOBVUZ5+GEBFL/b9D4cBPgJZvXD7QoBicNZNYj5fI3IdYjW9fd8n
	A65/tUnQtHfQ2qurdOD+Nu3W8GJGdkpX199+yvn7gT47Y0kRGg0mCJjllugxPWPdFFsQ
	ZfIpGZfqwGH7acqHBcvh7Om6FblB6xQTJCZSIXw9D8uZe4LWDnWvwmCCknmVr4Z+tPLf
	Besg==
X-Gm-Message-State: AHYfb5ih+0uFbViqo33Y/5rihTLZS6QqFNCxMW0n0gjc6tad3LqIApcl
	9qz0eX3dTYKoUCxgIsFvOcwyF7+EmA==
X-Received: by 10.28.96.197 with SMTP id u188mr141850wmb.73.1502493705616;
	Fri, 11 Aug 2017 16:21:45 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.28.191.130 with HTTP; Fri, 11 Aug 2017 16:21:14 -0700 (PDT)
In-Reply-To: <cover.1502488636.git.alistair.francis@xilinx.com>
References: <cover.1502488636.git.alistair.francis@xilinx.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Fri, 11 Aug 2017 16:21:14 -0700
Message-ID: <CAKmqyKPe8_205KZ5x++cdZ0BR950tQiaQvPstRzcKrwArgpMOw@mail.gmail.com>
To: Alistair Francis <alistair.francis@xilinx.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:400c:c09::241
Subject: Re: [Qemu-devel] [PATCH v1 0/3] Fixup exclusive store logic
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Edgar Iglesias <edgar.iglesias@xilinx.com>,
	Peter Maydell <peter.maydell@linaro.org>, qemu-arm <qemu-arm@nongnu.org>,
	"qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
	Edgar Iglesias <edgar.iglesias@gmail.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ONyMmJgw9LZi

On Fri, Aug 11, 2017 at 3:17 PM, Alistair Francis
<alistair.francis@xilinx.com> wrote:
> I found some issues with the way exclusive store was working. This patch
> series seems to fix the test cases that were failing for me.
>
> The first patch is just a simple adjustment.
>
> The third patch fixes the main bug I was seeing.
>
> The second patch is left over from the RFC that seems like it is still a
> good idea.

After working with the internal fuzzy testing team I have a test case
where exclusive operations are failing on master but working on top of
this patch series.

Thanks,
Alistair

>
> Changes from RFC:
>  - Rewrite the third patch to correctly fix the issue.
>
> Alistair Francis (3):
>   target/arm: Update the memops for exclusive load
>   tcg/tcg-op: Expose the tcg_gen_ext_i* functions
>   target/arm: Correct exclusive store cmpxchg memop mask
>
>  target/arm/translate-a64.c | 4 ++--
>  tcg/tcg-op.c               | 4 ++--
>  tcg/tcg-op.h               | 2 ++
>  3 files changed, 6 insertions(+), 4 deletions(-)
>
> --
> 2.11.0
>
