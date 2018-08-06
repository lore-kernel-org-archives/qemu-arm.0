Received: by 2002:a5d:6782:0:0:0:0:0 with SMTP id v2-v6csp2873252wru;
        Mon, 6 Aug 2018 03:01:21 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpercxEYYFFCqRkG8KWXHnvwcdaokr+vF9AlzBQ6P5fBGEkXwOtA9jRQORJloJpAZ7Merqqi
X-Received: by 2002:ac8:1b0e:: with SMTP id y14-v6mr13685539qtj.349.1533549681854;
        Mon, 06 Aug 2018 03:01:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1533549681; cv=none;
        d=google.com; s=arc-20160816;
        b=jWGJDwOWHq+754lMzZcbXZtYCWRUudVxizan5qUAz3uZubHGdaJgLlU3lT7yOY6oCg
         rfsRHI35wwASV4pJ6zd3XPHIat5WhqYFSJXbdPSBDuyxcWcp3tuF+GlCTdkshrGual+U
         ewj3pmHCogEBSYsvfpT/PfEuRYXwYL/UtEvBlifWWLJny9WeB4LeJw+7QE5oqkE4hqYx
         lSy3u7HDWXSEPlmYx20R73RwtEw1dFpH1MxnjWxPbknpjHzs/ICMchHiwTBwhgTCmK06
         I7ONPyJc3QP9GwFVwxCLKclK9VbXdvTVPByfWz8BctFoD8khPylmcpS31/oIOAo8M1cn
         E0Ew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=W3Dn+9aFnzoZqrE7sAw39qM29bdQeVeaR3YsmLnliss=;
        b=O99wcMBDLbnUFLmhwRmoxh3KPIR2UxqTTtBEWn04obr4cWRnkkc4z+g8TSh0ibYdpL
         3ewugr26ObILEcTY4l08b2g0YU5NDCV9RgG1gd1VuXJpKiAsG/xnI+cAgjNmm/dN4KA5
         0m/9hfOUGAlHpyEXYOrai1YCcPn1ykgboQiXahNWLTmR0bPbHiV68+UtfczhLiVUJCQA
         INsf4E2w33B4dy5LfVoiXn/aHByBIu75W0tsASDW8EQySNlvQ3qsdQR+5rypUfbrJ0Pp
         w1J986VA7o736wP7whT6WPENzk36QZjr4AJec+J3mi2590/LdmHXudTiqfh73VfWHLo/
         spNg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=BgTCqpzR;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id z30-v6si1353242qve.249.2018.08.06.03.01.21
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 06 Aug 2018 03:01:21 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=BgTCqpzR;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:33225 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fmcKG-0001vT-Ch
	for alex.bennee@linaro.org; Mon, 06 Aug 2018 06:01:20 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38490)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fmcK4-0001um-58
	for qemu-arm@nongnu.org; Mon, 06 Aug 2018 06:01:12 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fmcJy-00034s-Gg
	for qemu-arm@nongnu.org; Mon, 06 Aug 2018 06:01:08 -0400
Received: from mail-oi0-x243.google.com ([2607:f8b0:4003:c06::243]:46344)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1fmcJy-00034c-Al
	for qemu-arm@nongnu.org; Mon, 06 Aug 2018 06:01:02 -0400
Received: by mail-oi0-x243.google.com with SMTP id y207-v6so21045568oie.13
	for <qemu-arm@nongnu.org>; Mon, 06 Aug 2018 03:01:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=W3Dn+9aFnzoZqrE7sAw39qM29bdQeVeaR3YsmLnliss=;
	b=BgTCqpzRVs+9G9um/iRU6W5X1T1OJf9SYAx/I3edP0YxJwhWL89LomipQo3RexIM0r
	WgeKypqDAL+/VuPIApWiGrQJos0fMPt/PewzWtUZn7pEDY1nm+gd77ku57/poTeJha7L
	GvtJ2DbD/aVnSXvpWMkSv5oZKcUBoUtogTAho=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=W3Dn+9aFnzoZqrE7sAw39qM29bdQeVeaR3YsmLnliss=;
	b=CDJGN77f1WmRlnVtUlqgiOnN8hjuxuXxr2XE2FbJ60iaGpqTZiSXjl6yjV5d0Pm9CE
	4Ak7Qkq8NPudfOCN73GpW6osDJUWN5ycgrUyFXIkLN5kfSP+1D5GEibvVth/LIc/XwhL
	xmtFLpb7THi4ycqz/uWFwsKMdu4JZhm3uGYP5eRdwRTHgb3xRxHg1f4+0Jl0Qud/SHPD
	ri3aBGyOgsd5wcSpxLhHu9Gh7c9ebi1Uc2q1oC9DAN6ktoTmLlEf8wijdKOw4fR6JBfx
	Bx5a05BrJCxtYsklU44/56Mlh7bKbXeHvFSTPvr4h62jNFBNH5EAfBAVeZvwSr63nbR2
	nb1g==
X-Gm-Message-State: AOUpUlFMWZ4ifdRrbCM+nX9wM+Jx2fjRE0sl9Tan1Cf2etsRBeb4HGjy
	glsdgwpN+KZQ+vGNPBNhJfs2RM/5msG9pkqc0zHqjxY2OelCtg==
X-Received: by 2002:aca:7247:: with SMTP id
	p68-v6mr14658643oic.252.1533549661252; 
	Mon, 06 Aug 2018 03:01:01 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:5c8a:0:0:0:0:0 with HTTP;
	Mon, 6 Aug 2018 03:00:40 -0700 (PDT)
In-Reply-To: <20180803163646.31068-2-peter.maydell@linaro.org>
References: <20180803163646.31068-1-peter.maydell@linaro.org>
	<20180803163646.31068-2-peter.maydell@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 6 Aug 2018 11:00:40 +0100
Message-ID: <CAFEAcA_qmdth9SjAcoRrAmDLP36-oHyT6BmaQv0U88mnDh2+7w@mail.gmail.com>
To: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c06::243
Subject: Re: [Qemu-arm] [PATCH 1/3] hw/intc/arm_gicv3_common: Give
 no-migration-shift-bug subsection a needed function
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Shannon Zhao <zhaoshenglong@huawei.com>,
	Shannon Zhao <shannon.zhaosl@gmail.com>,
	"patches@linaro.org" <patches@linaro.org>,
	"Dr . David Alan Gilbert" <dgilbert@redhat.com>,
	Juan Quintela <quintela@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Ic3B30zfM5Qx

Forgot to cc Shannon on this one. Given that the missing .needed
function meant we weren't ever transmitting the subsection with
the no-shift-bug flag, this ought to mean that for current
master migration of KVM goes wrong (since the destination thinks
the source has the bug when it does not). I'm just going to try
to set up to test this...

thanks
-- PMM

On 3 August 2018 at 17:36, Peter Maydell <peter.maydell@linaro.org> wrote:
> Currently the migration code incorrectly treats a subsection with
> no .needed function pointer as if it was the subsection list
> terminator -- it is ignored and so is everything after it.
> Work around this by giving vmstate_gicv3_gicd_no_migration_shift_bug
> a 'needed' function that always returns true.
>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
> This should go into 3.0 to avoid awkward migration compat problems:
> the no-migration-shift-bug subsection is new in 3.0.
> ---
>  hw/intc/arm_gicv3_common.c | 6 ++++++
>  1 file changed, 6 insertions(+)
>
> diff --git a/hw/intc/arm_gicv3_common.c b/hw/intc/arm_gicv3_common.c
> index ff326b374ad..e58bc8b8105 100644
> --- a/hw/intc/arm_gicv3_common.c
> +++ b/hw/intc/arm_gicv3_common.c
> @@ -203,10 +203,16 @@ static int gicv3_gicd_no_migration_shift_bug_post_load(void *opaque,
>      return 0;
>  }
>
> +static bool needed_always(void *opaque)
> +{
> +    return true;
> +}
> +
>  const VMStateDescription vmstate_gicv3_gicd_no_migration_shift_bug = {
>      .name = "arm_gicv3/gicd_no_migration_shift_bug",
>      .version_id = 1,
>      .minimum_version_id = 1,
> +    .needed = needed_always,
>      .pre_load = gicv3_gicd_no_migration_shift_bug_pre_load,
>      .post_load = gicv3_gicd_no_migration_shift_bug_post_load,
>      .fields = (VMStateField[]) {
> --
> 2.17.1
