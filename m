Received: by 2002:a19:c345:0:0:0:0:0 with SMTP id t66csp5378232lff;
        Tue, 14 Jan 2020 03:24:05 -0800 (PST)
X-Google-Smtp-Source: APXvYqzMs0YbrPmwF0YcsvkuL+/tWkTtjyd3Nnf19M5A6p/8nzHUpGlDq09wqt+GmKPl5vcpV3rA
X-Received: by 2002:a05:6402:1858:: with SMTP id v24mr22363215edy.203.1579001045073;
        Tue, 14 Jan 2020 03:24:05 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1579001045; cv=none;
        d=google.com; s=arc-20160816;
        b=TfNcSGbJRxQKiXy4xEFiOjsX4ZZSArukVuAW9kfZHvHqwuDxKoWpMD536Bzrmi8Bwc
         XyB7QBvxm4KobcvJe9fTFAP3FG+f8HO87DRJScI8vo6nxILeLT9zLtaInMAU85HhEOFy
         U9ZDm0UcNVHpdkK6RGCI2zaYdc5i2AwaI9qnf5UPVYsO/l9xajr6aja6gfUWdGpu3+5f
         Rp+xxza+R5kUVAZu+1PwZ8ixgpzrVXQg+D3NTP/qCsHNisGdJfB6ZFwgrtgTTwnovnT3
         idy17osEYquZi9kohSDkROAouLZwruCN40feftbK2QiT3XsASSopSM/ChAyl+sLZPBfM
         /5dg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=eLtOGnrWBSUk7yc4uJqc+K2sQW+NnelyLPsR72FSB60=;
        b=dkFwaav0K5qNzGS/a25LOf7FJ10M658rgAxfP+hr+kpq4mfFr8mozJjtthrX7H+m5e
         bjq8KH71othK96ZxHQQmPtN1jJpWTuECOsIQtqHfkpBd72XSl6CkZfmJ/C9uf+PuzShp
         2ZORgVItXhazvZPKoLv8xNYIvU9SzgxK8RwW8VLTwpir8JY2Cj0w+X8Z/Gm61neUoBO6
         kNJcOMnfNvyZ7JP/DDiC+nA/tpuQOv4/mPNCFh4o6/ekOJGFnhYu3g/0lKI+6yI7BvaM
         Ph8QQgvDi0zTKPk/JpIrlJDV0g3LWOPInSJdyxFMk3fjHyJrxAWSbAjNgpFZbidLhjYh
         lORw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=sW7VMcwk;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id cq7si11468104edb.262.2020.01.14.03.24.05
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 14 Jan 2020 03:24:05 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=sW7VMcwk;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:37352 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1irKIl-00023K-NJ
	for alex.bennee@linaro.org; Tue, 14 Jan 2020 06:24:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52085)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1irKIV-0001yF-8G
 for qemu-arm@nongnu.org; Tue, 14 Jan 2020 06:23:48 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1irKIU-0005TH-7A
 for qemu-arm@nongnu.org; Tue, 14 Jan 2020 06:23:47 -0500
Received: from mail-oi1-x229.google.com ([2607:f8b0:4864:20::229]:47066)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1irKIU-0005Sr-2Y
 for qemu-arm@nongnu.org; Tue, 14 Jan 2020 06:23:46 -0500
Received: by mail-oi1-x229.google.com with SMTP id 13so11410584oij.13
 for <qemu-arm@nongnu.org>; Tue, 14 Jan 2020 03:23:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=eLtOGnrWBSUk7yc4uJqc+K2sQW+NnelyLPsR72FSB60=;
 b=sW7VMcwksrYyxWd94VSSbQq7sNUx4dcK7CSzCM+8S81ZKRwl3zw9erIIqe1lieBipw
 E8b03zJO7mIH/58OY5NXE+5yAopFxaPydgs1SJt7YqoAuhbxe9ktGvN+0gfuRb/nW0XI
 A7qFcs8pH3ia16xaVSMSWe7UyOZq+2yo+kEwS++0Ozfh4oq7x+ASNhQiBMKtJchoElNs
 CPxvJQhha3Ndc+hU0r7AYrnE1Um+mpg28520avI17FY6J1qHAcv1FUapHCKollYPblr1
 8Gz91/8Rx52HA/52Vy5ZQ846KsR7kPBZ61y70N4SRTU1IlrK7+o+Hci7DO3lGjGL8vth
 8iIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=eLtOGnrWBSUk7yc4uJqc+K2sQW+NnelyLPsR72FSB60=;
 b=qTn8x+59KwexrtwkTv8hScG+ZFUc5BPIjZ7/wQWtB7BXwkUl6FOtik84Us7WW+1uaw
 b3OEV0G3UaK/fHOIyIuVyDynOfN3gDExxDD1AIfGE+MRZCT11cu8qH+oQ/c9jJ2Wt4hG
 ajDe4FuKzsvVmsgFf1MvFQZ7UM7rYDbUNzBXSx6S/l2Hm7ZXCYreAo18ota2F+lnF9fM
 axDPBfISVAso0TYsjcQmU0gZoy2RwnhTg8NFtthK6orjLLSI2f/L6nMqwSwGSFIt59+V
 sv0iWP3TaPymqTg1HOmOqVqzDcGCXU7tFa3fu1NCLdhq1vsq00cGTNXyBXQTskPzLPEE
 7aKQ==
X-Gm-Message-State: APjAAAWcyoo2rcDAajT9Mbm4hGcYZhD9wNZxKgaIh3H4MGJgx7bW2Dou
 LPHWWXsR7IgYKjDMCogsIlWlQ+qs5w/vYtR6pRelGA==
X-Received: by 2002:aca:570d:: with SMTP id l13mr15625752oib.146.1579001025198; 
 Tue, 14 Jan 2020 03:23:45 -0800 (PST)
MIME-Version: 1.0
References: <20200114092606.1761-1-quintela@redhat.com>
 <CAFEAcA-7aLrp4n9gtD=0MzmMDpzNyJCUpOmY2XPxNOun5MKeGA@mail.gmail.com>
 <875zhewae5.fsf@secure.laptop>
In-Reply-To: <875zhewae5.fsf@secure.laptop>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 14 Jan 2020 11:23:34 +0000
Message-ID: <CAFEAcA8JCmxx4XGbGnT1gJZ9b=Mj3Tq4yS8-9y2NrKFvSBK3_g@mail.gmail.com>
Subject: Re: [PULL 00/29] Migration pull patches (second try)
To: Juan Quintela <quintela@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::229
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
Cc: Laurent Vivier <lvivier@redhat.com>, Corey Minyard <cminyard@mvista.com>,
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Stefan Weil <sw@weilnetz.de>, Jason Wang <jasowang@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, qemu-arm <qemu-arm@nongnu.org>,
 qemu-ppc <qemu-ppc@nongnu.org>, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 Andrzej Zaborowski <balrogg@gmail.com>, Richard Henderson <rth@twiddle.net>,
 Stefan Berger <stefanb@linux.ibm.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: yWVQpwHs0mLe

On Tue, 14 Jan 2020 at 11:22, Juan Quintela <quintela@redhat.com> wrote:
>
> Peter Maydell <peter.maydell@linaro.org> wrote:
> > Still fails on hosts where ram_addr_t is 32 bits.
> > Looks like you still haven't got the fix for the problem
> > Dan pointed out where multifd_save_setup() is using the
> > wrong type when it calculates p->packetlen to allocate the
> > data structure.
>
> Ouch.  Then there is "yet" another different problem. I fixed the one
> that daniel pointed.

Daniel pointed out both bugs back in July, in the same email,
and again this time around...

thanks
-- PMM
