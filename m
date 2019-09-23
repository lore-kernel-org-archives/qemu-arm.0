Received: by 2002:adf:ef42:0:0:0:0:0 with SMTP id c2csp3251912wrp;
        Mon, 23 Sep 2019 16:50:02 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxRAt23fpVPZa0mB89+D44cpAdwcQ52n6z97GWHl2942saQwIawvda82mP9R6i+Fi+REhhS
X-Received: by 2002:a0c:c2d3:: with SMTP id c19mr157558qvi.158.1569282602462;
        Mon, 23 Sep 2019 16:50:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1569282602; cv=none;
        d=google.com; s=arc-20160816;
        b=FHZwg9gB1cA/k0hGsWOpEHLd3VgfFac+xSUhReaC9Q5g48DQxL3SUYooNKrWXoLS0N
         8fKg8UNB9h2EXVyGUP5BlRtmDlneoRoMDnxBNvvDVPozQmXnlsv5/IHKOfyOn2Q3QZtq
         Px5ndptueswsBfKRYhxOgHcuVpCI2cRruqyvrKYYBVbr8ndq5KS3GHtZoiLj+KoDPp2G
         n4R4AJKa2rKHNBdhaFUUUmv/z7bEJWV2+fxK+7fI6bpe3/rhcjkufTaEnfSFI4Sj7mi6
         bwjEZ58yFdphIG+S0W0g2PC5ZBtdCPHT85u7UOSSztfWlGrmPHQUKZRXVMQQV4XPG75I
         CnwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:subject:to
         :from:date;
        bh=YNpdlLY1UAQCN/2jCWcO/ooDRO7y3+FtLsm2ZjEvwsQ=;
        b=0G0fkyPWiBzYcKtn25wOCINI8V0LEB2Q8ms74yxPKvGFT5z6x1ilf/gjMdCGK8yXJ9
         aQNyvq2/0y0PppN+Jo242bG77rmZuWgwYCqS+emumTHC3UEa635e9MyLg9cHEptQLdZz
         8hzukq1eJxGdADHMCWgNGoWSsAevfMpK0JWrjEyi87KiQergyOPXNbPFw8fMYf+BUFAT
         ROdmH+nt+QZS/WzdESzzwwoy7ihgI0ruPtJFPR+7CNM66AvH+M95N/7Qnxkib3UPJxCK
         mVOELsaMTRn7XCDS9S8QEGDqXZI/4STGEEQZ034W7+U5Aeiqzybm7xUUMzOWMlijoY4K
         jbtw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id z187si9442778qkd.135.2019.09.23.16.50.02
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 23 Sep 2019 16:50:02 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:37462 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iCY5h-000791-Sm
	for alex.bennee@linaro.org; Mon, 23 Sep 2019 19:50:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42196)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peterx@redhat.com>) id 1iCY5R-00078n-1M
 for qemu-arm@nongnu.org; Mon, 23 Sep 2019 19:49:46 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peterx@redhat.com>) id 1iCY5P-0006CS-7B
 for qemu-arm@nongnu.org; Mon, 23 Sep 2019 19:49:44 -0400
Received: from mx1.redhat.com ([209.132.183.28]:40182)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <peterx@redhat.com>) id 1iCY5O-0006C4-Vw
 for qemu-arm@nongnu.org; Mon, 23 Sep 2019 19:49:43 -0400
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com
 [209.85.214.197])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id B7A06C057E9A
 for <qemu-arm@nongnu.org>; Mon, 23 Sep 2019 23:49:41 +0000 (UTC)
Received: by mail-pl1-f197.google.com with SMTP id v4so9546982plp.23
 for <qemu-arm@nongnu.org>; Mon, 23 Sep 2019 16:49:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=YNpdlLY1UAQCN/2jCWcO/ooDRO7y3+FtLsm2ZjEvwsQ=;
 b=CwV14/rcUiw4b8xX22TQdy+QuoY0/NMvxdy6ombsyZ1gYQiMJKNKTkQWDhNro8LXoy
 WZAJpMCHj3Nq6XmT0rYlzaneYclMyEzqrvrpZHDODzB3rhaSFlcGD/M+huXc/BLejXph
 tJcAS5/JJ04We7NwDwcyAVYVNEupZKrQ7pr4yVSt8eWzjureJiG9lIZG5zCFRzgD84Sl
 ODObYvlGP/vXCEuMO5eo8sdx+Bxw5LhvTohqLeRDgD2yikW+02uRyX6H9jDUrPDvjLBq
 wC7l/CqpTf6IuXsxDz57g2tLbnTsAhkkMvt3r1GwSA0HnzW4bibEqJ4Es1NWoKhZTJUa
 AYNA==
X-Gm-Message-State: APjAAAW0Txujt4AGL1RCpGldwETHEQJPYANO25w97gGdlkfCs83nU7tv
 1Itp9V80JBCfdiIHSgTAtDF1tBPh9lgDlnSTnFg3OidRZhN4Q++JTiAt3ZtKOac/37mIqsRFh3Z
 kA0UCRKNmcgZJ
X-Received: by 2002:a17:90a:1c7:: with SMTP id 7mr2140750pjd.95.1569282581175; 
 Mon, 23 Sep 2019 16:49:41 -0700 (PDT)
X-Received: by 2002:a17:90a:1c7:: with SMTP id 7mr2140732pjd.95.1569282580824; 
 Mon, 23 Sep 2019 16:49:40 -0700 (PDT)
Received: from xz-x1 ([209.132.188.80])
 by smtp.gmail.com with ESMTPSA id w134sm21401194pfd.4.2019.09.23.16.49.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Sep 2019 16:49:40 -0700 (PDT)
Date: Tue, 24 Sep 2019 07:49:28 +0800
From: Peter Xu <peterx@redhat.com>
To: Alex Williamson <alex.williamson@redhat.com>
Subject: Re: [PATCH v3 1/2] vfio: Turn the container error into an Error handle
Message-ID: <20190923234928.GB28074@xz-x1>
References: <20190923065552.10602-1-eric.auger@redhat.com>
 <20190923065552.10602-2-eric.auger@redhat.com>
 <20190923075145.GA12806@xz-x1>
 <765755f6-4447-9322-d276-567d844ed50c@redhat.com>
 <20190923171043.4de13820@x1.home>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20190923171043.4de13820@x1.home>
User-Agent: Mutt/1.11.4 (2019-03-13)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
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
Cc: peter.maydell@linaro.org, mst@redhat.com, aik@ozlabs.ru,
 qemu-devel@nongnu.org, Auger Eric <eric.auger@redhat.com>, qemu-arm@nongnu.org,
 pbonzini@redhat.com, david@gibson.dropbear.id.au, eric.auger.pro@gmail.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 2gYsnfgznUpW

On Mon, Sep 23, 2019 at 05:10:43PM -0600, Alex Williamson wrote:
> On Mon, 23 Sep 2019 13:43:08 +0200
> Auger Eric <eric.auger@redhat.com> wrote:
> 
> > On 9/23/19 9:51 AM, Peter Xu wrote:
> > > On Mon, Sep 23, 2019 at 08:55:51AM +0200, Eric Auger wrote:  
> > >> @@ -1308,9 +1319,9 @@ static int vfio_connect_container(VFIOGroup *group, AddressSpace *as,
> > >>                                       &address_space_memory);
> > >>              if (container->error) {
> > >>                  memory_listener_unregister(&container->prereg_listener);
> > >> -                ret = container->error;
> > >> -                error_setg(errp,
> > >> -                    "RAM memory listener initialization failed for container");
> > >> +                ret = -1;
> > >> +                error_propagate_prepend(errp, container->error,
> > >> +                    "RAM memory listener initialization failed: ");  
> > > 
> > > (I saw that we've got plenty of prepended prefixes for an error
> > >  messages.  For me I'll disgard quite a few of them because the errors
> > >  will directly be delivered to the top level user, but this might be
> > >  too personal as a comment)  
> > That's true we have a lot of prefix messages.
> > 
> > The output message now is:
> > 
> > "vfio 0000:89:00.0: failed
> > to setup container for group 2: memory listener initialization failed:
> > Region smmuv3-iommu-memory-region-0-6: device 01.00.0 requires iommu MAP
> > notifier which is not currently supported"
> > 
> > Alex, any opinion?
> 
> Peter, I don't really understand what the comment is here.  Is it the
> number of prepends on the error message?  I don't really have an
> opinion on that so long as the end message makes sense.  Seems like if
> we're familiar with the error generation it helps to unwind the
> context.  Thanks,

True, the only major difference of the error that this series is
working on is that the user can easily trigger this simply by plugging
a device hence I'm not sure whether that's too long (it's not really a
comment and that's why I put it in brackets :).  Let's just keep them.

Thanks,

-- 
Peter Xu
