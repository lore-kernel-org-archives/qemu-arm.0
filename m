Received: by 2002:a19:c345:0:0:0:0:0 with SMTP id t66csp9790648lff;
        Fri, 17 Jan 2020 05:18:19 -0800 (PST)
X-Google-Smtp-Source: APXvYqzuQupiEJyb9/Fq3Wtz48+8zOuDhsCWLc7zHq5Qbycz7mxjOugamrloKXC/7Mk1/pGTOe8+
X-Received: by 2002:a17:906:3596:: with SMTP id o22mr7721508ejb.235.1579267099065;
        Fri, 17 Jan 2020 05:18:19 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1579267099; cv=none;
        d=google.com; s=arc-20160816;
        b=VRXpv81S6gvvU+6QhG7Gxp3L9ELEN+NOXzKAyT+T7ckwebhfRcoV2//FltrxUcwJ2B
         lIn479K5EXEy+TcL99Amu78oe+ndgmTYFSrip3de51CP3ZkiDoslmXp12Q9a5cwsIJYF
         biY3vMjeyfhESoW6h2DRGTGavBo4v2+4lciLOE1Q0DwxfGvAJ9sAXuArBAdoBP8oesMG
         AiBoseJavxzTu58bxydPMpURl5OcVxqw5jp3z+rPg5t4XJnyVD7u5b6pMIzvctPkRx+A
         yKmTiS6ts1+MSHiQ9ro1C7kG7h5PffZxkZ6xxJyOGOsmKbUwhr/EdSwFWkX1gNUm29uU
         UqUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:user-agent:in-reply-to
         :content-transfer-encoding:content-disposition:mime-version
         :references:message-id:subject:to:from:date:dkim-signature;
        bh=KpZ3QLKUbQJ0Z3RVINWucb9Ndt3JDsMoblKjT9M/9xA=;
        b=Khfdz0sTg2FZ6q9kTJj7esDN1maAYgA9hg7R2NLL586K7e/yvZwZC6ic3To7FxKeH/
         ehNlJAcQTfLGc7yse8D0nmm00UY63qi0KXVM2rQ5e7mJ1BWPtIqImscd4GPxZyU3dHXw
         oZgC/mn0cxIsgnLW78jUa52AAK32z6OOscefaJVv6Axx1b60xioFkxYk7+t0SkKXN+0l
         rfIgvoJbV9JO0sVdCxMXczmZOKqnXE+klcGnag9yE14CYFTKNkbQvi1ZHtbLOgV4ay1J
         eWCwDRmBAyy5QNxLfZL10+MGB5fnIaxLO5D5yclZvvP8L9gfbJ1SCtWG4G6JOVqlyrS0
         k1bg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@nuviainc-com.20150623.gappssmtp.com header.s=20150623 header.b="S/mxOHEo";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id r15si16144649edw.296.2020.01.17.05.18.19
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 17 Jan 2020 05:18:19 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@nuviainc-com.20150623.gappssmtp.com header.s=20150623 header.b="S/mxOHEo";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:57100 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1isRVx-0003Bq-Th
	for alex.bennee@linaro.org; Fri, 17 Jan 2020 08:18:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47111)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <leif@nuviainc.com>) id 1isRVm-00039b-HF
 for qemu-arm@nongnu.org; Fri, 17 Jan 2020 08:18:07 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <leif@nuviainc.com>) id 1isRVl-00026l-9G
 for qemu-arm@nongnu.org; Fri, 17 Jan 2020 08:18:06 -0500
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343]:35880)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <leif@nuviainc.com>) id 1isRVk-00024H-Rt
 for qemu-arm@nongnu.org; Fri, 17 Jan 2020 08:18:05 -0500
Received: by mail-wm1-x343.google.com with SMTP id p17so7613958wma.1
 for <qemu-arm@nongnu.org>; Fri, 17 Jan 2020 05:18:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nuviainc-com.20150623.gappssmtp.com; s=20150623;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to
 :user-agent; bh=KpZ3QLKUbQJ0Z3RVINWucb9Ndt3JDsMoblKjT9M/9xA=;
 b=S/mxOHEormBkphE4gQVdY3OX/KaVy/+i1P3gpd1rJKWGtxnz18jzsh4lIjEtadcZkn
 jZgwdL1xocWEfYj4B/ISgXwo7SBA0ZNW3mJRG33L84OoHQnOP85CJijBqGnr/1gmhwFC
 rY5rCiJpdhmRNip7fH+La69ZGwxRUfL6830ZYQM/nV1Hn5wV8XZsqvZptRyd34QArBPG
 tP7NW7/3+1jIOVnja7QtqBS7tw1RxC90IMccEmxp6h3inrbuBwR8te2If+KgNaoVox7W
 S8A/49I5lw61IdVxDzBnuQKpLf31QAhS1FvcTP17jV8ND3RdNANN4he8WqPbMJzGq2eH
 Pqyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=KpZ3QLKUbQJ0Z3RVINWucb9Ndt3JDsMoblKjT9M/9xA=;
 b=t1p2Q7hSOsqnI277j6HaXx2MnFLsFBtdqryMwiZlJAjLkmYTz20NaW0xdE2wDmGm/f
 HW/PCgBZDcGZ9EqLVsB7P86/0Swele4olTFpG3+6oTc7esIcaW7VZKLATw16ydUyPrYD
 ukP4ZJrIUqkUcSJ+up/dh/1zcbmNlbVfzcUiOrCExcjK6n444km03BjGOpjQOl4cwM08
 gpaR6VD5MPItf91G0YKlCogUgwrhL+CD9al0GWjdZkmmTj4ywbl0QmuwuOTpG0ieR+hy
 1CzLLIQviF6c2Hf+kNSJ4Fd3q7vgdgSyVZuI25I+pahgideXPUxyETf32EW9CvioObVC
 JyhQ==
X-Gm-Message-State: APjAAAVMrzoZ+QwKMddTdc+47ClqVaMHyh1Gj2LQb0fXw2YHXecADA5w
 3GOR/b/i5NZpiPSstgXWUo8Dxw==
X-Received: by 2002:a7b:c1c7:: with SMTP id a7mr4498500wmj.168.1579267083496; 
 Fri, 17 Jan 2020 05:18:03 -0800 (PST)
Received: from bivouac.eciton.net (bivouac.eciton.net.
 [2a00:1098:0:86:1000:23:0:2])
 by smtp.gmail.com with ESMTPSA id a9sm7986389wmm.15.2020.01.17.05.18.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Jan 2020 05:18:02 -0800 (PST)
Date: Fri, 17 Jan 2020 13:18:01 +0000
From: Leif Lindholm <leif@nuviainc.com>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>
Subject: Re: [EXTERNAL] Re: [PATCH] MAINTAINERS: update Leif Lindholm's address
Message-ID: <20200117131801.GI15141@bivouac.eciton.net>
References: <20200116174226.4780-1-leif@nuviainc.com>
 <a2fc8a4f-0b56-7868-0e52-51c2abfd97f7@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <a2fc8a4f-0b56-7868-0e52-51c2abfd97f7@redhat.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::343
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Radoslaw Biernacki <radoslaw.biernacki@linaro.org>,
 QEMU Trivial <qemu-trivial@nongnu.org>, qemu-devel@nongnu.org,
 Leif Lindholm <leif.lindholm@linaro.org>, qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: yVy+xF6XhAnz

On Thu, Jan 16, 2020 at 19:25:52 +0100, Philippe Mathieu-Daudé wrote:
> On 1/16/20 6:42 PM, Leif Lindholm wrote:
> > Update address to reflect new employer.
> > 
> > Signed-off-by: Leif Lindholm <leif@nuviainc.com>
> > ---
> >   MAINTAINERS | 2 +-
> >   1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/MAINTAINERS b/MAINTAINERS
> > index 483edfbc0b..3c8653f26f 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -735,7 +735,7 @@ F: include/hw/ssi/imx_spi.h
> >   SBSA-REF
> >   M: Radoslaw Biernacki <radoslaw.biernacki@linaro.org>
> >   M: Peter Maydell <peter.maydell@linaro.org>
> > -R: Leif Lindholm <leif.lindholm@linaro.org>
> > +R: Leif Lindholm <leif@nuviainc.com>
> >   L: qemu-arm@nongnu.org
> >   S: Maintained
> >   F: hw/arm/sbsa-ref.c
> > 
> 
> You might want to add yourself a .mailmap entry too:
> 
> -- >8 --
> diff --git a/.mailmap b/.mailmap
> index 3816e4effe..a521c17b44 100644
> --- a/.mailmap
> +++ b/.mailmap
> @@ -44,6 +44,7 @@ Aleksandar Markovic <amarkovic@wavecomp.com>
> <aleksandar.markovic@imgtec.com>
>  Aleksandar Rikalo <aleksandar.rikalo@rt-rk.com> <arikalo@wavecomp.com>
>  Anthony Liguori <anthony@codemonkey.ws> Anthony Liguori
> <aliguori@us.ibm.com>
>  James Hogan <jhogan@kernel.org> <james.hogan@imgtec.com>
> +Leif Lindholm <leif@nuviainc.com> <leif.lindholm@linaro.org>
>  Paul Burton <pburton@wavecomp.com> <paul.burton@mips.com>
>  Paul Burton <pburton@wavecomp.com> <paul.burton@imgtec.com>
>  Paul Burton <pburton@wavecomp.com> <paul@archlinuxmips.org>
> ---

If that use of .mailmap is common for QEMU, that sounds like a good
idea. And the comment for that section of the file indeed suggests so,
so thanks!

> 
> If you ack this snippet maybe a maintainer is willing to amend it to your
> patch :)
> 
> Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> Tested-by: Philippe Mathieu-Daudé <philmd@redhat.com>

Acked-by: Leif Lindholm <leif@nuviainc.com>
(The other guy agrees.)
