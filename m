Received: by 2002:a19:cb43:0:0:0:0:0 with SMTP id b64csp1657729lfg;
        Tue, 25 Feb 2020 05:04:56 -0800 (PST)
X-Google-Smtp-Source: APXvYqw1y/H2SkMRRCRbjCZGNFsrvrDxl/0X4/tT7q4fsSW1OirZNhksdMvJHkABBNwc4XFKm03S
X-Received: by 2002:a0c:f412:: with SMTP id h18mr51673331qvl.124.1582635895958;
        Tue, 25 Feb 2020 05:04:55 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1582635895; cv=none;
        d=google.com; s=arc-20160816;
        b=qId9U90fkn6bk0SFi2BaTUABXM58csMkau07Guua5Jx7iGvTNzd4MSTZYTWucKUEt5
         k7PmI/MiROXkDYl2zKpJ68gge2lBLBop19gAiZKZvlDJQiiSBSYogzmtjDOSNS+anm+T
         QV31SNwwpZ1iHMhmgsw3y+BD52MFwZPAyZML6xQLbJiGcO4Rtsc/6MwRIbxkth8MyXTJ
         xIFkEU5tMZ/bvO+H3FB4T+hCLB/qomsbh5w2njZZWmpqln6lfmxgFlznEBhmPUf5eqtp
         +MQekraMPV+8u4oIhg36EZGEDwRnuCDp1EGUWRnFIaNRetZvTsJVFEA8GJhJLaQw7IMW
         mRdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Acw6Js8G5cqiyhObPuNAuN3cnonY0/zHBkQOyuuBJU0=;
        b=SxCc2u2TL4zDTLrjYCPBBJN2XzG/qBk6NTa31ec29eTTisHRo0LRcuEI2Ke8oV2RMm
         PcIr4oHnV44Q8p25KwRDA/BvyKfxS5AHSywiyQD8kpxKjXdIqTJAJIHYJFOOzdRJiv8k
         I3yBhn37mm8qdRP0aH7pwhJ6JiP38B71Kf/kI4tHCrs6MyzWJwQJXaoT4gRnrg53KEws
         gU/jVHOedbG6Opgr6z8gGofP3y9G9LcMZzmKMMesd6FTyzG5+ghRWvXYsc7CiXD1umtw
         +TULYLioxsst43C0XvEtQWjJEwqcmtnET4kA7TsObOj2+KqW2ZwAYxp5ym8BnQnwwr6r
         QgjA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=zCbUrq2O;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w26si7310871qto.306.2020.02.25.05.04.55
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 25 Feb 2020 05:04:55 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=zCbUrq2O;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:55184 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1j6ZtP-0007Te-9H
	for alex.bennee@linaro.org; Tue, 25 Feb 2020 08:04:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35595)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1j6ZsQ-0007PS-Bv
 for qemu-devel@nongnu.org; Tue, 25 Feb 2020 08:03:56 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1j6ZsP-00012g-8j
 for qemu-devel@nongnu.org; Tue, 25 Feb 2020 08:03:54 -0500
Received: from mail-oi1-x244.google.com ([2607:f8b0:4864:20::244]:34481)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1j6ZsP-00011N-1U
 for qemu-devel@nongnu.org; Tue, 25 Feb 2020 08:03:53 -0500
Received: by mail-oi1-x244.google.com with SMTP id l136so12442261oig.1
 for <qemu-devel@nongnu.org>; Tue, 25 Feb 2020 05:03:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Acw6Js8G5cqiyhObPuNAuN3cnonY0/zHBkQOyuuBJU0=;
 b=zCbUrq2OJlviLLGzmr9QI0s6YRHcpqy6/CN8Zvy6Drs2fOwySwbT++2ZUYGZBlwf7K
 gV7vwILhtAP9UvuTJtgE27+r1d4/8siO2sac8REPNlPgE+uxAPoihEGKnZJiZL8M7jXm
 wq69XlhnDwPvcjH+s334uA9jeakCZKtil4WpOSogtVMaCxjReVF5/WKIqw8igYbL5iBc
 T+t84K2jx8Tmw+nkqbFBwBCe7nXONv/cuF8HrPw/X5m8eI4W33NoULa+XWzwubE7C4j1
 /0ubKM7OJRrWA3CXKhezYzfNSa2PsBre4e2HDigKr3rNkR3rSDfqYTrvVf9hOrXtoxUB
 BsZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Acw6Js8G5cqiyhObPuNAuN3cnonY0/zHBkQOyuuBJU0=;
 b=VAA8YSxkUctbOrgGt6CtLigRvP/MKQ8kX/gmRndTh2mzE40FZZNf4mGTf09/JqeTU9
 pU1XS6CHyPRtZKEcwPrfJul/yJToMlgHcSEbSkPiBXUZD2T21EOxksPyPJqJyUQyrpK2
 Pe4WrGVzIGOZpTa4cMxA28jlzk+uvig480e3CbO+bRRQewSgB9q0m9vqMCxvdrbLiDIO
 XF3UC31GbC2Sdz/KD8CduPsDsQNq2ysnjpSL3PfrsOA8C56yeAXfiCHU+ukawJr6SLfh
 whNMEHLXI062cquT8VBEEcywmvl1BRtBonq1Fd/eyAgegZovmVrBlKxLz20P5rldaBX8
 N/Rg==
X-Gm-Message-State: APjAAAWgmxccl4vO5Jd734lhY+oGGg4M9PakfJKnhGec/UOw/x4wTvzG
 9n42Hd9+q0ZDrOf085yPvV8ccj5m4M6BNJWxe+2AKw==
X-Received: by 2002:a05:6808:289:: with SMTP id
 z9mr3339127oic.48.1582635831963; 
 Tue, 25 Feb 2020 05:03:51 -0800 (PST)
MIME-Version: 1.0
References: <1582537164-764-1-git-send-email-sai.pavan.boddu@xilinx.com>
In-Reply-To: <1582537164-764-1-git-send-email-sai.pavan.boddu@xilinx.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 25 Feb 2020 13:03:40 +0000
Message-ID: <CAFEAcA9_SvWkqiq67noeHEfkOT7nMX=yHNuikUkBPkM=_bi0jA@mail.gmail.com>
Subject: Re: [PATCH v3 0/3] Fix number of priority bits for arm boards
To: Sai Pavan Boddu <sai.pavan.boddu@xilinx.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::244
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Alistair Francis <alistair@alistair23.me>,
 QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>,
 Anthony Liguori <anthony@codemonkey.ws>,
 "Edgar E . Iglesias" <edgar.iglesias@gmail.com>,
 =?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber@suse.de>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: wxy/BzmrcBVU

On Mon, 24 Feb 2020 at 09:44, Sai Pavan Boddu
<sai.pavan.boddu@xilinx.com> wrote:
>
> This patch series implements the mask for unimplemented priority bits in
> arm-gic. Which will return the expected number of priority bits on read.
>
> Changes for V2:
>     Followed gicv3 code for defining mask for unimplemented bits
>     Hardcoded num priority bits for A9 and ARM11MPCore boards
> Changes for V3:
>     Fixed the code as suggested in V1.
>     Implemented checks for max and min priority bits.
>
> Sai Pavan Boddu (3):
>   arm_gic: Mask the un-supported priority bits
>   cpu/a9mpcore: Set number of GIC priority bits to 5
>   cpu/arm11mpcore: Set number of GIC priority bits to 4

Applied to target-arm.next, thanks. (I tweaked a few of
the commit messages to give a little more detail.)

-- PMM
