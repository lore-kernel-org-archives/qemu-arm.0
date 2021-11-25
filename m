Received: by 2002:ac2:5544:0:0:0:0:0 with SMTP id l4csp280003lfk;
        Thu, 25 Nov 2021 07:48:41 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzXrFJCmutlPNrCrkt79zG/lNeDF0bVZkW892prBIKgB1HN83SF35WLiV6YNTX3InnN185k
X-Received: by 2002:a05:6122:2158:: with SMTP id m24mr12647463vkd.1.1637855321130;
        Thu, 25 Nov 2021 07:48:41 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1637855321; cv=none;
        d=google.com; s=arc-20160816;
        b=Zxm9O7o8R0SyLTSCwKH2dIqUt52TJSjS4AJnUWqcFMTx2WDxQTCwcPbkSImny0+iQ/
         HPISZTfcpQscxFzD+YC8m8BnG9Xmz90IsFgkpnymJjmFiKn/YeGkzaDQmH3gq1E69/uE
         zmBPy6SI73Yud2/b8wd6JWUv5BQqIPMeq7tfuXVLXBrogoN3c4SY+lJBE/tomGLT75GU
         DEo7rFAN7QxUrytmCLu/f1q7+z2hhG0sNCuw7Av3OD96v5ROfF9s1K3k+s7RYCxanob8
         gMYiPpBke6j0bez6IUGH6lSsDFLran0EVTL9wCGDGeWEUS1J6HRHJZEc7JYZjhjmkXpX
         atxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=WOvcTccvesEWZ4KsC11CLEJ2ozS9TZEsN6axSvwIXOU=;
        b=kAw7IwO/d99tF24L8vRhZjLI0pNJ4Ud7sfNHcmgQRrZjQId5pd3ipr7dwghsKhBoFY
         Ydy4XUnj+nN4aCD06hhr0vYB3VtHzJfurL0fM8XMYUoRYUN1CVkW4W0mMSaesND+I2zl
         v/pE+uP4za4rsoPFGKdnGuirT50y5ZWS1eunGKxHp5f/SQQoVM0JTSUEOm901MN6V3+M
         q8UNUJZWPQc23YaMxC+RpufEKQCY8ceYAJWtl1AfCowSJmDLiFD+iFMi5ONlISgDqfTz
         g5EckMHzcU+u5KkF0akMjMBNIo+sEHF/heM02c9D+QJIdErCrih+j/HgNsgo7XQn6jZx
         QB7g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=VwXMO9H8;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id r20si5847750vsj.575.2021.11.25.07.48.40
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 25 Nov 2021 07:48:41 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=VwXMO9H8;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:56036 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mqGzI-0002F0-I5
	for alex.bennee@linaro.org; Thu, 25 Nov 2021 10:48:40 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48954)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mqGyD-0000Eb-ME
 for qemu-devel@nongnu.org; Thu, 25 Nov 2021 10:47:33 -0500
Received: from [2a00:1450:4864:20::42f] (port=38466
 helo=mail-wr1-x42f.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mqGyB-00054u-BA
 for qemu-devel@nongnu.org; Thu, 25 Nov 2021 10:47:33 -0500
Received: by mail-wr1-x42f.google.com with SMTP id u18so12566592wrg.5
 for <qemu-devel@nongnu.org>; Thu, 25 Nov 2021 07:47:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=WOvcTccvesEWZ4KsC11CLEJ2ozS9TZEsN6axSvwIXOU=;
 b=VwXMO9H8LnWvmxxWDwIioGxhl1UI/UVoOycTp6JFwm2crz2RJUnF1V3Gs6sl8tGRp7
 EO+2p4dV5oGPYLamKMzIGWHyVOu+vOfw23Mc7SIafHh0ErLLzsoLW+2U+TEBS+xHLFim
 qwpmg/zKs8ixKFYh7l7KGTRkrZeNuoU7hgR+NyWSz/gpN9qZGrmptlXQcFfQjB3dY5Fe
 MQ9GRFMjoMazyzGDJrHnn5snj3SL+1RWENcDc/ZMg8uyFcmZ+kVp2q8U8d3Mdz8Yk1xF
 Ectvg47EkQuUZ55kYJABDeK9k2Jb6wK6Dde0gMRA+HqQA7CRso4XqDOV/6nbT8LPZxGO
 GABg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=WOvcTccvesEWZ4KsC11CLEJ2ozS9TZEsN6axSvwIXOU=;
 b=iCgHRaD4O8FOujXxGKRzPQhuKH5AYMmDGYZxzZ3Uy5tbqcZvUhm6KAswT9Djx6D0t9
 /279gHPkp9AIC3PyvDZbbzTwltY/iumiEZasrHHFhfBIdFW7KjAu5Aj6dm4HLvl6CNc2
 d00Aka7pWEtiLwA/Vm+oOeI82iWN0DHw9n+U6Zto9ZrcxPhlncxMWr8gaCIBxNsLBjRD
 fWi0DPcKCRHdtAyErPuZLhRQ43sUsr12uIOR6F4zp0vqgk3EbUWdtwhZn+NWEZOigWa4
 um56mKUO0tMnV1/a5ihLb8epW9P2G0bihK8BMmvGV18EwEyv9MGky4TrB1gJoduSl9lw
 ZELQ==
X-Gm-Message-State: AOAM531MFjiHieMN/ndgEUKodbBsyZFQ89su4ENuiyQ1PR9CDaOtGDnC
 t5V++jJctDBgiXDC/ttzp7SUbyARLzTYRk24j+l4iw==
X-Received: by 2002:adf:cf05:: with SMTP id o5mr7539485wrj.325.1637855249606; 
 Thu, 25 Nov 2021 07:47:29 -0800 (PST)
MIME-Version: 1.0
References: <20211124182246.67691-1-shashi.mallela@linaro.org>
In-Reply-To: <20211124182246.67691-1-shashi.mallela@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 25 Nov 2021 15:47:18 +0000
Message-ID: <CAFEAcA-spJc2Dg=D=9=XgPYxdzi_d4sJh27BRDW_DD9y_+O0JQ@mail.gmail.com>
Subject: Re: [PATCH] hw/intc: cannot clear GICv3 ITS CTLR[Enabled] bit
To: Shashi Mallela <shashi.mallela@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::42f
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42f.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: leif@nuviainc.com, qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 rad@semihalf.com
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: M4Vn6xnRjEej

On Wed, 24 Nov 2021 at 18:22, Shashi Mallela <shashi.mallela@linaro.org> wrote:
>
> When Enabled bit is cleared in GITS_CTLR,ITS feature continues
> to be enabled.This patch fixes the issue.
>
> Signed-off-by: Shashi Mallela <shashi.mallela@linaro.org>
> ---
>  hw/intc/arm_gicv3_its.c | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
>
> diff --git a/hw/intc/arm_gicv3_its.c b/hw/intc/arm_gicv3_its.c
> index 84bcbb5f56..c929a9cb5c 100644
> --- a/hw/intc/arm_gicv3_its.c
> +++ b/hw/intc/arm_gicv3_its.c
> @@ -896,13 +896,14 @@ static bool its_writel(GICv3ITSState *s, hwaddr offset,
>
>      switch (offset) {
>      case GITS_CTLR:
> -        s->ctlr |= (value & ~(s->ctlr));
> -
> -        if (s->ctlr & ITS_CTLR_ENABLED) {
> +        if (value & R_GITS_CTLR_ENABLED_MASK) {
> +            s->ctlr |= ITS_CTLR_ENABLED;
>              extract_table_params(s);
>              extract_cmdq_params(s);
>              s->creadr = 0;
>              process_cmdq(s);
> +        } else {
> +            s->ctlr &= ~ITS_CTLR_ENABLED;
>          }
>          break;
>      case GITS_CBASER:

The code looks fine, so in that sense
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

It seems odd that we have two different #defines for the
same bit, though (ITS_CTLR_ENABLED and R_GITS_CTLR_ENABLED_MASK).
We should probably standardize on the latter and drop the
former.

thanks
-- PMM
