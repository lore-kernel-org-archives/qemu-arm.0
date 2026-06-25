Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A51FCDE000
	for <qemu-arm@archiver.kernel.org>; Thu, 25 Jun 2026 13:24:09 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wck3O-0005sQ-1X; Thu, 25 Jun 2026 09:23:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1wck3M-0005s0-E2
 for qemu-arm@nongnu.org; Thu, 25 Jun 2026 09:23:36 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1wck3K-0003Sc-BJ
 for qemu-arm@nongnu.org; Thu, 25 Jun 2026 09:23:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1782393813;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=wMY9lMDBnjSffkY0dB2lI6teviTlM5DqXq9Zm4u/Fio=;
 b=XYLHLWAz2C4XNimNXNHu3eSIhFR+Agg3+jGV16rbTKcB5akCOsLeD7weR+NDKRhzDFVZQJ
 Q6JpE/45XLq0sD0bHscuXGVY2YmqGti+fnj/P6cnFrXX4CgeugPfcZgUvdc55HwxAvMJdB
 zdB2g2aI7r+Ejim/D4gTXWw3DDPiAP8=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-692-7MGzMBNcNhe0RP7NPRk9hw-1; Thu, 25 Jun 2026 09:23:32 -0400
X-MC-Unique: 7MGzMBNcNhe0RP7NPRk9hw-1
X-Mimecast-MFC-AGG-ID: 7MGzMBNcNhe0RP7NPRk9hw_1782393811
Received: by mail-wr1-f72.google.com with SMTP id
 ffacd0b85a97d-46dc84ca717so461026f8f.3
 for <qemu-arm@nongnu.org>; Thu, 25 Jun 2026 06:23:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1782393811; x=1782998611;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=wMY9lMDBnjSffkY0dB2lI6teviTlM5DqXq9Zm4u/Fio=;
 b=AX/NbSpvdmx0mPPgDz4Eab8SQYN5XTecHY6Xm1cHaGME2yT46EXwfr6BgESxbH6oyc
 QqGji/jlB1Bc5W7TO32zWE4ChI+XMOT1kFeuZx5n9pvTUjwv+89dMBXEP2ZdbK25xchU
 /0SxREQjxhQpMXiZHBjDvgS/H3AG07AMZsMCl9sLiOYQPEmsIGtX6EeVIpPmG+57ju6+
 xsmFg/NEJtUF7a0hGKATEZOa8rTHSwx7BEiB0wNShjm2TLE4sq1sk2OFQBPtB6kW2py3
 cxWPmkbXPlVTn1sLCeC0Rilx+zu2qDH4Xzr2vUMpe1A9Inr0OPpLhVGWSJIFQb21+iWL
 DTpA==
X-Forwarded-Encrypted: i=1;
 AHgh+RpR3VexqlVC5G9DEPk9yyJ0GAvy8GyAK78JqmLD4tWdcugV0gv681x8sNcX+3lL9XxcPzieQFGdHg==@nongnu.org
X-Gm-Message-State: AOJu0Yzbx3e32uiD4AnYac6qJucwSrlIbomA4cap+Dkv0GqT5i5YlCUj
 bblNnOAYsk2fMzNKgkADBcN2CNEnLo/jw2Sst0XNnlILN7Rp9Leup66E6JU9q4vriGSQQCyT/Q9
 WRrUgeZtcYIGpeyfIjQu3WBmieix5JIBpGY2X9p723wFCLsM6KXA4Bg==
X-Gm-Gg: AfdE7ck5ejFKVKruO1WAKS3Gh0c6r2b97Jp+okaW5q9oIO2oZ3XRuwIKn5tdZrsYsp4
 F0QjTOn/D3eNssKLCq2TAWuWrnwCtCIJCFK/TZr3vH+V3MuVQR1+Zg7M+eWORSznT/91FPVP7FV
 1FkpH7jhvWBanif4B6RsWhHZs6gMY3LUP156c4zzmkNdrA4O+kWPnv63IGTPff6Ore2VQDPpoaD
 JqImIUYyp7CMmYQUg/M3KD4xvB7PnxR96ExU2eyVjctJN07qalq5AuP5Q1HOGHLoAouDHvDGOhv
 g0zZKORTDmgYGD5Q6jG4U5ySzY1o9qW9ZCtYJdneCq7XIXMwNIOLg+fDUvkuAwjt14M+tN0wW5S
 ofH1m1E72oJPynMubUzY+4fVCtyOr/8UQ
X-Received: by 2002:a5d:5f56:0:b0:460:3a90:b2b6 with SMTP id
 ffacd0b85a97d-46dbf1199e5mr4556884f8f.11.1782393811127; 
 Thu, 25 Jun 2026 06:23:31 -0700 (PDT)
X-Received: by 2002:a5d:5f56:0:b0:460:3a90:b2b6 with SMTP id
 ffacd0b85a97d-46dbf1199e5mr4556811f8f.11.1782393810507; 
 Thu, 25 Jun 2026 06:23:30 -0700 (PDT)
Received: from redhat.com (IGLD-80-230-85-71.inter.net.il. [80.230.85.71])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-46c22c68239sm18940073f8f.36.2026.06.25.06.23.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Jun 2026 06:23:29 -0700 (PDT)
Date: Thu, 25 Jun 2026 09:23:26 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: Gavin Shan <gshan@redhat.com>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org, peterx@redhat.com, alex@shazbot.org,
 richard.henderson@linaro.org, berrange@redhat.com,
 philmd@oss.qualcomm.com, philmd@mailo.com, david@kernel.org,
 clg@redhat.com, pbonzini@redhat.com, phrdina@redhat.com,
 jugraham@redhat.com, liugang24219@sangfor.com.cn,
 dinghui@sangfor.com.cn, shan.gavin@gmail.com
Subject: Re: [PATCH v3 1/2] system/memory: Use qemu_ram_{copy, move}() in ram
 device region accessors
Message-ID: <20260625091334-mutt-send-email-mst@kernel.org>
References: <20260616052552.389021-1-gshan@redhat.com>
 <20260616052552.389021-2-gshan@redhat.com>
 <CAFEAcA-mf14=jpRFHarAbN6AbQwvW=Yu6WB1JiNMsECEdaxD3A@mail.gmail.com>
 <20260625070551-mutt-send-email-mst@kernel.org>
 <CAFEAcA8YJZq9TqrUd0zTnewAdVDm5y6UV7BJQZ0C60TZ=RT98Q@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAFEAcA8YJZq9TqrUd0zTnewAdVDm5y6UV7BJQZ0C60TZ=RT98Q@mail.gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: FeP2ERHXL6LOGu-YtjGsdHXynndvqh2-_01YM66PgjA_1782393811
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.445,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

On Thu, Jun 25, 2026 at 01:48:11PM +0100, Peter Maydell wrote:
> On Thu, 25 Jun 2026 at 12:07, Michael S. Tsirkin <mst@redhat.com> wrote:
> >
> > On Thu, Jun 25, 2026 at 11:09:26AM +0100, Peter Maydell wrote:
> > > This is still wrong. We should not have "x86 magically works
> > > and all other hosts do something different" ifdefs. Define what
> > > semantics you need and then we can figure out how to
> > > implement them.
> > >
> > > My current thought is that we need to handle accesses of
> > > 1, 2, 4 and 8 bytes that are naturally aligned by ensuring that we
> > > do exactly one host load/store of that type, and that anything else
> > > is "the guest isn't relying on specific semantics here, we can just
> > > assume it's plain old RAM and do whatever". That would not
> > > require any architecture specific ifdefs.
> 
> > Well. X86 is special, as usual. It allows unaligned mmio so
> > we really have no way to know an x86 guest does not intend
> > just that. That can only be emulated perfectly on x86
> > which is sad but I see no reason to actively break it.
> 
> What actual hardware will rely on unaligned accesses
> appearing to it as single unaligned accesses?

/me shrugs
any hardware that was only tested under windows?

> And if we do need this, we need to specify:
> - what are the semantics we need to provide?

match what happens on bare metal

> - what is the use case that relies on these?
> Then we can see how closely we can match that.

passhtrough of weird devices, first of all.

> 
> There's a lot of extra complexity added in here for
> something it I don't think is ever going to matter,
> and having the most common host architecture take a
> totally different codepath from everything else is
> a recipe for that other codepath breaking.
> 
> -- PMM

Not sure we have to be pedantic. We have arch specific code and the
world did not end.  It's not a lot of code, it's just for unaligned
accesses on MMIO, which might or might not be broken anyway.
And it worked already, so it's more about going back to what we
did earlier.

-- 
MST


