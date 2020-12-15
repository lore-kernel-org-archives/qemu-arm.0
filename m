Received: by 2002:ac2:4c03:0:0:0:0:0 with SMTP id t3csp3420707lfq;
        Tue, 15 Dec 2020 03:54:43 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyQ5KkGZytB+g5l1f/Joy5eXfkPc5KU+bAHIrtYVOpEOrXv5Z6l++TNNjBn5DFf2yf0HyLa
X-Received: by 2002:a25:42d0:: with SMTP id p199mr44030483yba.352.1608033282907;
        Tue, 15 Dec 2020 03:54:42 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1608033282; cv=none;
        d=google.com; s=arc-20160816;
        b=BJQbFSeF3oIYI4lZSTJ1jm5ddRU919Z8BSXAI318p+z7JLtAXUAC9sxHm9ss5ETa/v
         FivMO9DM9qq2tQq5k95pY7gALNBtpyUCLIaX09PTYZ2vLW4XSKHrJovSK02yWGLKPXhC
         BpECH5uXzfpwpMPzHQkihOY+e2DzSyD7j8QMW3uqihbLtPuBptcXKxLDBmiGzsUZ6qGG
         YLDZIkayXCANn97/SV5zsHbJZGaY0ap6vEs1BYvDJkBzXOST+14yFF/afGQZsKDpaV5/
         tkwn3rXb9W/YNADPWMIeGXQBFcJPRVRTcO7s8eP5M9UHnRrvYEZsslf7eYG+MIWnkmsE
         BIMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:subject:to
         :from:date:dkim-signature;
        bh=/9QQtjKAJGy//+MTZlPDZ6IKf2rSvh+1DJ3vCYIdDTI=;
        b=JFwZ6kX1U8X0nkx080hgTZ90WRwrorkoR+CBrwM8RQG1EUNyhSHinxiVotGsTV5AKV
         q6ZcnncQX2ifmP0in0enXhGaPjpYvkFFzL7x6rfamS1IUPzeIGDDCeBBWhaf6OOj0zx7
         SRZmwRtr8m+j0Sm4SaPJSz4L47iEHVlYmaHoQ1TnewcNm30O044m3DGOWVQ/Yhg5ZBJ3
         EFrxOHiLd59GqWZPKwerdzVhKxGDC5UUxe+X8NbqsLsyTNix/7bmACM8T/806WobuNuV
         fBupNwY0q+CT0Nc7q69ENmYLhi+ve6+f/OcRZg92mdxEyuj5wxvRwsoccYv6xY/jO0+b
         lvhw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@nuviainc-com.20150623.gappssmtp.com header.s=20150623 header.b=gl8+BAhe;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x77si9426996ybe.13.2020.12.15.03.54.42
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 15 Dec 2020 03:54:42 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@nuviainc-com.20150623.gappssmtp.com header.s=20150623 header.b=gl8+BAhe;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:47310 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kp8ug-0006w4-BS
	for alex.bennee@linaro.org; Tue, 15 Dec 2020 06:54:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60214)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <leif@nuviainc.com>) id 1kp8pr-0000Zh-Rc
 for qemu-arm@nongnu.org; Tue, 15 Dec 2020 06:49:43 -0500
Received: from mail-wm1-x344.google.com ([2a00:1450:4864:20::344]:52689)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <leif@nuviainc.com>) id 1kp8pp-0001Pw-38
 for qemu-arm@nongnu.org; Tue, 15 Dec 2020 06:49:43 -0500
Received: by mail-wm1-x344.google.com with SMTP id a6so16613235wmc.2
 for <qemu-arm@nongnu.org>; Tue, 15 Dec 2020 03:49:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nuviainc-com.20150623.gappssmtp.com; s=20150623;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=/9QQtjKAJGy//+MTZlPDZ6IKf2rSvh+1DJ3vCYIdDTI=;
 b=gl8+BAhekKeLNRD6oy/XGkse7JAVU6AGOpP2P4L4GNlA4UeKS+77NIRu2D836YHRxq
 oUr6kBf7ymGAxTjqvoqggszIB38lQ5o04vsue/YyLFXXt/moVNSKgEAolBRqCp0ce6Rp
 07rEiQ89odcDS3HMhmaqaAE16SgH2MeHRxILeYuUOlxyyxKZjhCr5eq5fDd4TIFLhH/w
 OkgyavbFrxMfzAA2SoJL+YUma0O1FAcrQUjtBuvaGgqvzKexWLAODiWuADvQX0uggBlc
 TbItV8leLWFCrm4VO+P1t9kqb/LXMaxH9S5P815o0BfPGDZqiWtJ5LInaTHoFvjr47yc
 6zRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=/9QQtjKAJGy//+MTZlPDZ6IKf2rSvh+1DJ3vCYIdDTI=;
 b=neL2aBOitIsHeEG4Jh+EYx4JrTYeLrylcT3sZp/Va/+6u7GfTD4mX+R5KJQ+URZwt3
 o1ju/7fk1l1n3YGEcKHli8K3NmVmhodKkh0aBLINyIaTAyFY4V+kY+nI6RL1pKpmZmvd
 LOTPHdd/z7S5Oz7byTQQf0Z5wydn86lUWimLjn+ZsstVUce1vc2VSDQSrg2GykegM6uY
 oLbKMvSbysoz/jT3EPAASem10vya+rSbCr8lY8kWQOU7BmQckpmD613mDH/lfc0uJdGC
 k7xVv1BXuTQMn6/YC66DcMOSVs8YL62d3QC+3IycmsoTQ7qMaxxU31kVWC4XDBVnq65l
 +GAg==
X-Gm-Message-State: AOAM531wS8ySMVP/kXQGH+RzbHTsYtQgYn3SD+PWo0sRJ5EgIvmFD3zH
 W0+fAvgwIatoYcX/x3X2KogOtg==
X-Received: by 2002:a1c:40c:: with SMTP id 12mr31927455wme.40.1608032979528;
 Tue, 15 Dec 2020 03:49:39 -0800 (PST)
Received: from vanye (cpc1-cmbg19-2-0-cust915.5-4.cable.virginm.net.
 [82.27.183.148])
 by smtp.gmail.com with ESMTPSA id g184sm38507050wma.16.2020.12.15.03.49.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Dec 2020 03:49:39 -0800 (PST)
Date: Tue, 15 Dec 2020 11:49:37 +0000
From: Leif Lindholm <leif@nuviainc.com>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH v2 3/5] target/arm: add descriptions of CLIDR_EL1,
 CCSIDR_EL1, CTR_EL0 to cpu.h
Message-ID: <20201215114937.GV1664@vanye>
References: <20201214123553.2515-1-leif@nuviainc.com>
 <CAFEAcA-X-JV9TXgnuoqw0ZDH8W9ZyiHAEiBW=epsYyb3fJ7FkA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAFEAcA-X-JV9TXgnuoqw0ZDH8W9ZyiHAEiBW=epsYyb3fJ7FkA@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Received-SPF: pass client-ip=2a00:1450:4864:20::344;
 envelope-from=leif@nuviainc.com; helo=mail-wm1-x344.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: f/mz2OW07aKB

On Mon, Dec 14, 2020 at 13:36:51 +0000, Peter Maydell wrote:
> On Mon, 14 Dec 2020 at 12:36, Leif Lindholm <leif@nuviainc.com> wrote:
> >
> > Signed-off-by: Leif Lindholm <leif@nuviainc.com>
> > ---
> > v1->v2:
> > - Correct CCSIDR_EL1 field sizes.
> 
> Hi -- could you resend the whole series for a v2, please?
> The tools (and people) that handle patches get a bit confused
> by partial series.

Of course :)
Done, and noted for future.

/
    Leif
