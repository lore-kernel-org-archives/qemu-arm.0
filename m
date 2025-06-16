Received: by 2002:a17:504:5d2c:b0:1be9:327d:8ee3 with SMTP id et12csp1683897njc;
        Mon, 16 Jun 2025 00:15:12 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVk2eN0wg/XA9cbZos1DzfUp+pmChtAw/yDoUZ6IF+e8Y5Hcs7GQmB9pgjHgz/+FGM3LCF/jskM3j2Hng==@linaro.org
X-Google-Smtp-Source: AGHT+IHCY8pc3Lu8/rrnzmGWXzJv5MqXb1Hz9hABP2LPeTJNT72skrZJ3sDe32AIV7+fQ6GkJiKY
X-Received: by 2002:ac8:5a4d:0:b0:494:993d:ec30 with SMTP id d75a77b69052e-4a73c4c9ba4mr126418931cf.16.1750058112072;
        Mon, 16 Jun 2025 00:15:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1750058112; cv=none;
        d=google.com; s=arc-20240605;
        b=ONU8OVPSKxXGl8gdVpUN9IeRpSRTHEUEBZJqy89C8g2za/D7EhlU8ucemjjRXO2E97
         A8Hf3BXvihQBhmilk4DMpqrXb5VlMfwllNTh9ltmSjiHkvsdQ8sgXNvKCrhxAGsxuojz
         pw4XjrE6O4fMeKnTZjBZzh66v5AkhErwOypa5TVlGSAiEcbhZWTRGNwcZiuWsHa6GB4k
         xDdgV0Lst6Fq0CGwAiXqTO0cYwJ6PtB3nka8mvVOUttngpyPj3TsAwjZ2zYMZbkc0MMQ
         O8P3jl6sxcDOBuHGNIF8h9XN96dAWxuLmp9Lb9wuRCbwFdIg4nSjYO/9gClSYgbavbNx
         3nWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence:user-agent
         :in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :dkim-signature;
        bh=53u6Ibi2e20mX9tJMJxFj+VZBpYM1PZmCNCM5FDpWGg=;
        fh=4CebTczPcLgU6qs/cJbII9EqbiJpAAjLt82QuAIUYhA=;
        b=SuK8gh41qFj8tIkyRIaRdi08Yid5K6E+iBjPl5U28qS0C81tfWv7eo956hSzMz/Fy0
         PC8a09dMVt2mghAEgFIpDsbfIj11Jo5hEjyFWzLzaG2cnse15AvQGtolpTYutefnBweT
         MPuEOvZoF8zdGk4PerFoulwmiA8F+Nkn6fe33VSE0KSVVTrxE4+h83EYbBISmauJCtsJ
         DpBxdStLvGmGBZWoR0LLWCM5W3jPYi6EzcCxjmP03q+aYi6HajkA0zKTEm6jntFkh7OW
         cB+F3cDWVKc39sbsbrXCEszwi7ueCyMGdXRcJXv2wW3FYg+8zNZ4KSMSYhSB5MB3f/Q/
         +14Q==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=V8beZL7g;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-4a72a564dbdsi88122411cf.668.2025.06.16.00.15.11
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 16 Jun 2025 00:15:12 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=V8beZL7g;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uR43V-0003G8-QK; Mon, 16 Jun 2025 03:14:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1uR43C-0003CX-8N
 for qemu-arm@nongnu.org; Mon, 16 Jun 2025 03:14:39 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1uR43A-0000s6-Dc
 for qemu-arm@nongnu.org; Mon, 16 Jun 2025 03:14:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1750058075;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=53u6Ibi2e20mX9tJMJxFj+VZBpYM1PZmCNCM5FDpWGg=;
 b=V8beZL7ghesnGOKZdBdKVZcdn0QoHEWegLkV+NjivXUbUC5IvlW9ezltpcM8QSbJRzfd3D
 XbXw7u7VcEdADUctOIdHFNht0q9lVSkjXKw3GRkap2j+MKLvoesKfqGcMjrK3ws0JBwKIJ
 LRFzyU4zOGkwNti3/33iRSEgmqd8Z68=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-411-yco5kPGJO6S6sG0a_ut16w-1; Mon,
 16 Jun 2025 03:14:31 -0400
X-MC-Unique: yco5kPGJO6S6sG0a_ut16w-1
X-Mimecast-MFC-AGG-ID: yco5kPGJO6S6sG0a_ut16w_1750058069
Received: from mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.15])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 343F2195608F; Mon, 16 Jun 2025 07:14:27 +0000 (UTC)
Received: from redhat.com (unknown [10.42.28.53])
 by mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 5AEC51956094; Mon, 16 Jun 2025 07:14:22 +0000 (UTC)
Date: Mon, 16 Jun 2025 08:14:19 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: =?utf-8?Q?C=C3=A9dric?= Le Goater <clg@kaod.org>
Cc: Sean Wei <me@sean.taipei>, qemu-devel@nongnu.org,
 "open list:ASPEED BMCs" <qemu-arm@nongnu.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 Steven Lee <steven_lee@aspeedtech.com>,
 Troy Lee <leetroy@gmail.com>, Jamin Lin <jamin_lin@aspeedtech.com>,
 Andrew Jeffery <andrew@codeconstruct.com.au>,
 Joel Stanley <joel@jms.id.au>, "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
Subject: Re: [PATCH 05/12] include/hw: replace FSF postal address with
 licenses URL
Message-ID: <aE_ESxAF9CkNvp4R@redhat.com>
References: <20250613.qemu.patch@sean.taipei>
 <20250613.qemu.patch.05@sean.taipei>
 <3aa8de03-911e-4906-a0c5-5b8ea269ad28@kaod.org>
 <CAGvOXg_VK0+DA_OHy0oWGC4QuL6icFd7yabLKeRzQMc8OpU-rA@mail.gmail.com>
 <66a0c462-deb3-46c9-bcd1-1395137dc108@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <66a0c462-deb3-46c9-bcd1-1395137dc108@kaod.org>
User-Agent: Mutt/2.2.14 (2025-02-20)
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.15
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: 2SVaI2L7zG9O

On Sat, Jun 14, 2025 at 05:33:42PM +0200, Cédric Le Goater wrote:
> Hello Sean,
> 
> + Daniel
> 
> On 6/14/25 14:58, Sean Wei wrote:
> > Hi Cédric,
> > 
> > Thank you for the quick review and for suggesting the SPDX approach.
> > 
> > On Sat, Jun 14, 2025 at 1:36 AM Cédric Le Goater <clg@kaod.org> wrote:
> > > 
> > > Instead,  I would remove the license boiler plate and add :
> > > 
> > >     SPDX-License-Identifier: GPL-2.0-or-later
> > > 
> > 
> > Before we respin the patch, could you please confirm the scope below?
> > 
> > 
> > 1. For the two headers currently under review
> >     (aspeed_i2c.h and aspeed_timer.h)
> > 
> >     I will drop the multi-line GPL boiler-plate and replace it
> >     with SPDX line, while keeping the copyright statements.
> 
> Fine with me.
> 
> > 2. For the other ASPEED-maintained files
> > 
> >         hw/*/*aspeed*
> >         include/hw/*/*aspeed*
> >         tests/*/*aspeed*
> > 
> >     Would you prefer to convert them as well? If so, I'd prefer to
> >     send a dedicated patch series after this one.
> 
> OK. As you wish.
> 
> I think you can convert all QEMU files while at it.  See:
> 
>   https://lore.kernel.org/qemu-devel/20250519171004.352636-10-berrange@redhat.com/

Note that rules triggers *exclusively* for new files, not for any
existing files.


With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|

