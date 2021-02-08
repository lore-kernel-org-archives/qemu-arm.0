Received: by 2002:a19:690d:0:0:0:0:0 with SMTP id e13csp1461102lfc;
        Mon, 8 Feb 2021 12:07:01 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzhXYMWwTJvRynQb6cT328QfQ11aYM6zpc5dmzgyp9pzo/DAGRQJ4/TH9S1Jdn+7n+0JaLC
X-Received: by 2002:a25:3345:: with SMTP id z66mr28645197ybz.466.1612814821277;
        Mon, 08 Feb 2021 12:07:01 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1612814821; cv=none;
        d=google.com; s=arc-20160816;
        b=iuFJ1iDmI6bt2jZU/Scvzi5nBDZVJ7qMZMRR4E6jte0+bf5kUp75DxRCnesC70Vrdo
         STi5R287Zb0Mzuk5GLlp0BWRWU6UtwlmFPrCKP9bvc7I0YAlpoRO8dSn4xzGZom5Pku+
         8O3r5PQN7N+ljzQO0IdvfASH0z2q5TOJ6sIhOtvC4SAgFAPUqjxjubvPTjLzO6yEYdfu
         HZKWM3BzWYTqXcMJf77EbFDWo60mnHd33Vx+BS29IyXHFeVQmD8n6a/AqFVpxMSORwfo
         Am9M0h02a48oEa6vVE0Us8WubaLGp6j0tlz5VX+4Ppkh3i8kj9RgzeBTdioHBw0Kz2fc
         7P8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=FqCpWRCKFTIjIvrnhk2aqBk60y7WA/3PAmrs3DYY24U=;
        b=t/8TcwMxG7UGUoy6a/gKr05neXNaopRXfzL3U9GNa2Ev4TxhXQ410kz3MB5Donzgq5
         TnLzFmP64PLKWYqz8UU1YZCzvzwVIbFY3ey/4IIlBt28XRxmGrYdXk3fgs7jIbJ2+mlo
         yQOXZ1dpQrEmsWwQNJgBCwFXAL0lGvHlLb0jexbM+ZmxuBg2BWWAvA9MXldz1mHi36QN
         AswuVnkG4pu9BUJvEMzWFMqZ5ZUjWZ53dTUoJkcrcNogWWmP3Cg1SG1+RZNDPeCJTeZ2
         cZr5FdCGtToWX406btnIkVBd4GPfBK1qAGWrT+c/Fsn7KAm51CqBbcxEI4Ob0eS0o6MO
         aROg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=N9TtvdWD;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id r11si18288028ybb.116.2021.02.08.12.07.01
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 08 Feb 2021 12:07:01 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=N9TtvdWD;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:34412 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1l9CoG-0002kO-MZ
	for alex.bennee@linaro.org; Mon, 08 Feb 2021 15:07:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49710)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l96uq-0004SP-Dg
 for qemu-arm@nongnu.org; Mon, 08 Feb 2021 08:49:32 -0500
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529]:40290)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l96ui-0007lF-L6
 for qemu-arm@nongnu.org; Mon, 08 Feb 2021 08:49:24 -0500
Received: by mail-ed1-x529.google.com with SMTP id s3so18124223edi.7
 for <qemu-arm@nongnu.org>; Mon, 08 Feb 2021 05:49:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=FqCpWRCKFTIjIvrnhk2aqBk60y7WA/3PAmrs3DYY24U=;
 b=N9TtvdWDEDjLP8c0ZY0rQ5AdJ3m+JcptSPhHUx5sqZTCYnst4tjRgMlyDFTudK/YKz
 WJOF59RBXqUo640cM/G5pY9k+/PBctBJIFKEBK6SEMDmNzzdHHxmpz1Zax8Ld+SR0km9
 p2F/x4KjJuJKwsIlqrtAXiZpa0zRbLJuV3+3W+eD6hBooaBfc41SrQC/jgEcvqxthpXB
 3dHtRc491nuH8aolbH+41k7pRff4cW7wIBg13fGeLnqjx+1TqOBBqAqRZTA6Teke833n
 rB7/imOFoDj9Hxbk0daFH7+Q3IlUZt09DT5t6iGRfw0ar2xS75EhDWaFyGi8pYYH6ZHm
 dBfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=FqCpWRCKFTIjIvrnhk2aqBk60y7WA/3PAmrs3DYY24U=;
 b=H8Idw+W1mFK6kbAReBIXy38OZQW2g9CafLcdaM1Zeeskp7XRsYRR7KUj+3GckdWrd8
 4yQWsPnuxEKROuCZP+G5jGZiI+vhbOYKpRSGz8nf8tKDF/ls+FHIN+eTeyHpJuCGU89c
 DFLRrYHBAKhc8oiHnmOURE63RdGWgaObDfg50LREH/T8NA9gug0EHVSl+i8Wy/imnfpQ
 wWvWVpocfeF1m/HO0N5yGneuS/B6QGtI/HU8K9dDVwrm1yv6P45Ek7lf2CjSv3e4d/ev
 6r+40I0SXmqPHp1j9Dun4hVaqnPBqHfB90CtSe1+3JvFNd3xuWZn6NTz/7W8+JUxK5lH
 hRdA==
X-Gm-Message-State: AOAM531z75ORy95MOHadlyHQnq6WG+s+KVvHVxgzywZ8RjG5lN5j6/Rf
 4kyAA4ceGQyC1vjCAkzSxuZbIHD3H3552BiK+No7Ig==
X-Received: by 2002:a05:6402:5107:: with SMTP id
 m7mr17125673edd.52.1612792143545; 
 Mon, 08 Feb 2021 05:49:03 -0800 (PST)
MIME-Version: 1.0
References: <20210203190010.759771-1-richard.henderson@linaro.org>
 <20210203190010.759771-16-richard.henderson@linaro.org>
In-Reply-To: <20210203190010.759771-16-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 8 Feb 2021 13:48:52 +0000
Message-ID: <CAFEAcA8+oaMWc=poXvvcve8iUKfsg4vNSM9cStPFYWAQa-2KBA@mail.gmail.com>
Subject: Re: [PATCH v5 15/31] exec: Rename guest_{addr,
 range}_valid to *_untagged
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::529;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x529.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: uz2zSTVzywbJ

On Wed, 3 Feb 2021 at 19:00, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> The places that use these are better off using untagged
> addresses, so do not provide a tagged versions.  Rename
> to make it clear about the address type.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  include/exec/cpu_ldst.h |  4 ++--
>  linux-user/qemu.h       |  4 ++--
>  accel/tcg/user-exec.c   |  9 ++++++---
>  linux-user/mmap.c       | 12 ++++++------
>  linux-user/syscall.c    |  2 +-
>  5 files changed, 17 insertions(+), 14 deletions(-)
>

> @@ -211,13 +212,15 @@ static int probe_access_internal(CPUArchState *env, target_ulong addr,
>          g_assert_not_reached();
>      }
>
> -    if (!guest_addr_valid(addr) || page_check_range(addr, 1, flags) < 0) {
> +    addr = cpu_untagged_addr(env_cpu(env), addr_tagged);

This change isn't part of a simple function-rename and should
presumably be in a different patch?

Otherwise
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
