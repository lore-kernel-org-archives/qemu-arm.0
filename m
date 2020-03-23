Received: by 2002:ac2:5937:0:0:0:0:0 with SMTP id v23csp1220788lfi;
        Mon, 23 Mar 2020 02:35:53 -0700 (PDT)
X-Google-Smtp-Source: ADFU+vspOaIYV/foBrxQUsMHlA44CWrNVCNH+VQ6OpLOxoMVqIM26wSzRPoQdeeIZQPcWm2cTFEe
X-Received: by 2002:ae9:eb0e:: with SMTP id b14mr18172314qkg.283.1584956152949;
        Mon, 23 Mar 2020 02:35:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1584956152; cv=none;
        d=google.com; s=arc-20160816;
        b=KGXJHvfO+nxifD2VHCSBlX5JU0EkYOqJV6bP80R6XC4a4mSlTvgLY1WTjbdtsltNRd
         gzEKuMzLtJJAmnnhSkiZTpIiqnLiWzJKJZOvtBBKvDEHkjJrOwhjNlNB1/yvZMUttTsc
         yR/s1yJ+ymueO/XbAcO7kkPsczY+PqMIxt8nBZ3ITx2q6rxgyo/74ZUB6y/Bh9VLPeG+
         7fbiQLRp6yDiSD2jAH7pASwohcQDuNqCqOhwBnOMyPbrlkzT9CqVLSKrFDRBpNjQsdMR
         amlO+xFMHmyAo7bfq0kBumqsLX+a32E+9MfzQGAEVLSzHe5ibkJSl8RRiXTUJnnGUfeJ
         K8OA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=O+YkPzOa4hWYpyxmrZjqWbRMhH8PmQAPR7ip4o4KW+s=;
        b=goPx5bOWkMmM1K02ZnwzufkPJp0TrZeriZ3s2mdWT0bjGNNQZOOcAgBDZKuL6NrPuT
         bLe2jzzp0ozk6tRCZSdamJOO/aRoIrr91WMc2hbOVWXZbxjBYO+UiqFf4xuVmI2SxNJi
         34UT2GlbVLQlSHSB1OmaDlDqO1VELraI8SijXlc+3iyf93gM0u4+V1kuVIZObPGUpkuM
         COoGEp9Y8ilXzAXWPeocLa3IN0fPQ8EcQU2VialN/A3pXkcp4zqp5lhUnqiXAJWApHRo
         j82Ks9lL25Q0D3gU4ScxwZrSuCf9y4XT0hmqHc3PbSg+8AFmAaUtJ2Ht9UGvFA5JPeHa
         uPoA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=p6uAKWnp;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 68si8474886qkm.291.2020.03.23.02.35.52
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 23 Mar 2020 02:35:52 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=p6uAKWnp;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:59252 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jGJUu-0004FS-DG
	for alex.bennee@linaro.org; Mon, 23 Mar 2020 05:35:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54782)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1jGJUm-0004FH-3I
 for qemu-arm@nongnu.org; Mon, 23 Mar 2020 05:35:45 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1jGJUl-00057X-2c
 for qemu-arm@nongnu.org; Mon, 23 Mar 2020 05:35:43 -0400
Received: from mail-oi1-x241.google.com ([2607:f8b0:4864:20::241]:46535)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1jGJUk-00055W-Ne
 for qemu-arm@nongnu.org; Mon, 23 Mar 2020 05:35:43 -0400
Received: by mail-oi1-x241.google.com with SMTP id q204so6255424oia.13
 for <qemu-arm@nongnu.org>; Mon, 23 Mar 2020 02:35:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=O+YkPzOa4hWYpyxmrZjqWbRMhH8PmQAPR7ip4o4KW+s=;
 b=p6uAKWnpVSvz5nwX/P7zC1WYU1u7uqEuYTw4CyrMWd+aZYnkuTKr1r6N3i/slnQvdQ
 /oWRWIX+KqGWF9Rk40vayIwhP9zgpxuv7AWouWWtAedwzck7KOxuuliHT8Rcgd2IxKuh
 vhQQGTxRoC0M8vp4hN18FLwuXPxquhDeSbMYLfAAdEjpGU1JcVA0DjAJWybPIppb1k5p
 mCynZSwCkudheoti5jEPhtljaVv9XzPk/DmRQSLvMR+YQCn/PxHb7TuKR/i8khtzkNSQ
 hoHvBaDhN4orFfrkQN/7bcjz7wl/bVEQh7ElFA+LuKRIYQsmHwPtT71geMetQcK0vy8r
 We8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=O+YkPzOa4hWYpyxmrZjqWbRMhH8PmQAPR7ip4o4KW+s=;
 b=C+E+r1hYo2v4qbPtWshiEwg2UQNNbk/EaIH3p30ayagBBSkTmWwCSXB0WtyCcsNYLw
 rDIpFHF+0lvLDVTozt4WF+l6nntE7gGR2GmyyY3BJeVwvuzkqAlbjYbfxFwiyTMGS3fL
 7zQGkkapyDrdDDu7s8VMChWGDw9s0WdHkYKmchhynTu00SRcePr4DXipRZNNKGUg2004
 CnvjZIpRcvtXWxQvuL1yCcTDr107K98GpFUqKFn61Vn720KPQ1FqumBVBrd9utzY4+QA
 y6sYYO+mYHp+I60g+w46kBS8Q6sM95ZWV5Lz8D5BQCCF+Zj8kWA9jH1TKTl3cLvZZck7
 AAhA==
X-Gm-Message-State: ANhLgQ3kV5KMxdOZe+E6vi7Bmjzob/8wJbq+H/9oE80YfVHLk6V7LxbN
 69OCNBiB6vuy110NYhzNBM8A2Ju6AwCuuy8mX7Szgg==
X-Received: by 2002:a05:6808:64c:: with SMTP id
 z12mr5594319oih.146.1584956141839; 
 Mon, 23 Mar 2020 02:35:41 -0700 (PDT)
MIME-Version: 1.0
References: <20200320160622.8040-1-richard.henderson@linaro.org>
In-Reply-To: <20200320160622.8040-1-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 23 Mar 2020 09:35:30 +0000
Message-ID: <CAFEAcA9PNLJyHewNAo2JiXQOzs6ajcwcWzHP7Q6xgiOgbRb7fQ@mail.gmail.com>
Subject: Re: [PATCH 0/3] target/arm: Coverity tweaks
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::241
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
X-TUID: 6TScaFTVDLx/

On Fri, 20 Mar 2020 at 16:06, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Only the first of these appears to be a real bug.
> The other two are adjustments to help satisfy Coverity.
>
>
> r~
>
>
> Richard Henderson (3):
>   target/arm: Rearrange disabled check for watchpoints
>   target/arm: Assert immh != 0 in disas_simd_shift_imm
>   target/arm: Move computation of index in handle_simd_dupe



Applied to target-arm.next, thanks.

-- PMM
