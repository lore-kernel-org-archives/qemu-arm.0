Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp1671586lfm;
        Thu, 23 Jul 2020 05:44:46 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyfbeVqHBeDW+2w9KTASQ+UxVrQKlnmez32Dpi31QwzCetqlr2ymzGLOwCfT3u+AyX0KxZF
X-Received: by 2002:a25:e0cb:: with SMTP id x194mr6543148ybg.338.1595508286719;
        Thu, 23 Jul 2020 05:44:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1595508286; cv=none;
        d=google.com; s=arc-20160816;
        b=ja0dwrVohSJ3hsFAbGnWE/j8tHA+kyA9T/aQ40ds5XS2091fI+q3u7Mn9zVkvQqIox
         uajK9ZwSMvb1MPjIbDcFBuljZ+q/xUTnB0iU3IKtqQ/Js1SkuBwPdv4PAebjI6nUCABg
         1F7KT1unjS2pALsRvpj0CXLar0pONFVv8ATwOVJkpTqAePhbBSSxTKDX4UZ31zzzdlGs
         SVs8Wn0RYjE7tUCxdhKT3S7QAr0k6fAgS21QAqhtPjJG8RaSr9MJqLOE9XLJiBW8LFG/
         ATlk2CvEbrVZ9m5gD4YGwI89F9G3dnzCGxRL1qoPpjIO5CEJfpsgj+dSPkTHVLbnJkc9
         Uxog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-disposition:in-reply-to
         :mime-version:references:message-id:subject:to:from:date
         :dkim-signature;
        bh=xC7Tj39CjdXAN8iTuIpZLrGpZUblquZV8bI/RY9S8s0=;
        b=Hci01SbL7vXUoK/At06t8vAEe8+F2mAAAQiBH0yMx+bhx/ah4fqmCueji2zZ7U1zO2
         8RRisaUpTEUYdgXGilaASzuuBkjGIPeFp5maatA+GqtPUk6adbE07aa4j//hbZ1chPlD
         fonFVkVmStLptgqKMfqNgcjaKnat8ImvZxGB4l+icTHQoI0eh+ur9rtQYjjlDSnn3OER
         yv4qPA1rkyViyTUNTj17NfSilcPwE/osBMRy0EjwC7ACfEGk2MCAMQl2M4NeofXITuFM
         tPwutn8Dj0pF5ZIZVXYfaPKIAbaXrmlUhhlG8i7rq/I56Mji+xGw6MMiimc5xjKE6188
         suiw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=EQcRHHEW;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h39si2926219ybj.23.2020.07.23.05.44.46
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 23 Jul 2020 05:44:46 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=EQcRHHEW;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:37978 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jyaac-0005vb-5m
	for alex.bennee@linaro.org; Thu, 23 Jul 2020 08:44:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39406)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1jyaaU-0005u7-9P
 for qemu-arm@nongnu.org; Thu, 23 Jul 2020 08:44:38 -0400
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:44545
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1jyaaR-0005x1-Sx
 for qemu-arm@nongnu.org; Thu, 23 Jul 2020 08:44:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1595508274;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=xC7Tj39CjdXAN8iTuIpZLrGpZUblquZV8bI/RY9S8s0=;
 b=EQcRHHEWVOQlFxLcbFGVvFdQfghj3McQRUV03qp8ING2PDdDdPm9Kt9ASyhqwwknK4Ip6r
 rWcH0M2dqAW4dGW3DZXWC8oWZr8uYEgxQwgGZ+W06dSPiI8Ayme2ctInd0B8viSLW+zYHH
 PwmWAzJSZBXZuUwHISHdBitEYL/+vcE=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-95-Z9M8h2-SNSOVubhxVykpmg-1; Thu, 23 Jul 2020 08:44:33 -0400
X-MC-Unique: Z9M8h2-SNSOVubhxVykpmg-1
Received: by mail-wr1-f69.google.com with SMTP id i12so1356088wrx.11
 for <qemu-arm@nongnu.org>; Thu, 23 Jul 2020 05:44:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=xC7Tj39CjdXAN8iTuIpZLrGpZUblquZV8bI/RY9S8s0=;
 b=b8LME7TRDKVA1ovpIhh4DjeMVFayMmUFEnt6q89LPhpBEQiK+XVyhw01+MPq2uAkdt
 1qIuZsKX7AgTNVfkHS0MCZgnyV4Kkh+UZlewA9LflVp2NLkJE2+7x+WNshhAvdRfiTTB
 xnghRrr/dIChsb11bbIEpBwco7DAEt+QhbbfGkNsl47UXMbEZ9yR9uqay9DZZLfihRs0
 x832oXoxo8RvCOJDiItNFlMpKkdYP9H5zMSKmrHmePCzhl7doSfexhYnhXQgwyiOF0KC
 3lyyeZfi2LkahetlddDdIrRAwXF4sUHLyMmJFtOOkB+60gOLrcdmCutphVuZiNy2mFky
 Xvfw==
X-Gm-Message-State: AOAM533MZWpMQr5e+PVMhAXQrVg7IHfERucKWsDeSv52INhrVdBjCDHH
 Y6lB8LXbnBCpPGT/JpMd8UmfF/FywszeabGKw0E496IWE/u9gqUnugDJ7MzR+h/KwRu2p0p4+n3
 K/C6fLRkcNyLV
X-Received: by 2002:a1c:2045:: with SMTP id g66mr3834110wmg.184.1595508271976; 
 Thu, 23 Jul 2020 05:44:31 -0700 (PDT)
X-Received: by 2002:a1c:2045:: with SMTP id g66mr3834080wmg.184.1595508271700; 
 Thu, 23 Jul 2020 05:44:31 -0700 (PDT)
Received: from redhat.com (bzq-79-179-105-63.red.bezeqint.net. [79.179.105.63])
 by smtp.gmail.com with ESMTPSA id v5sm3228590wmh.12.2020.07.23.05.44.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Jul 2020 05:44:30 -0700 (PDT)
Date: Thu, 23 Jul 2020 08:44:27 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Anthony PERARD <anthony.perard@citrix.com>
Subject: Re: [PATCH] acpi: Fix access to PM1 control and status registers
Message-ID: <20200723084405-mutt-send-email-mst@kernel.org>
References: <20200701110549.148522-1-anthony.perard@citrix.com>
 <20200701075914-mutt-send-email-mst@kernel.org>
 <20200701124836.GD2030@perard.uk.xensource.com>
 <20200702063310-mutt-send-email-mst@kernel.org>
 <20200710094258.GF2030@perard.uk.xensource.com>
MIME-Version: 1.0
In-Reply-To: <20200710094258.GF2030@perard.uk.xensource.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=207.211.31.81; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/23 02:26:42
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Andrew Jeffery <andrew@aj.id.au>,
 Alistair Francis <alistair@alistair23.me>, qemu-devel@nongnu.org,
 "open list:ASPEED BMCs" <qemu-arm@nongnu.org>,
 =?iso-8859-1?Q?Herv=E9?= Poussineau <hpoussin@reactos.org>,
 =?iso-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>, pbonzini@redhat.com,
 Igor Mammedov <imammedo@redhat.com>, "open list:PReP" <qemu-ppc@nongnu.org>,
 Joel Stanley <joel@jms.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 6G3zOGPaW7xi

On Fri, Jul 10, 2020 at 10:42:58AM +0100, Anthony PERARD wrote:
> On Thu, Jul 02, 2020 at 07:12:08AM -0400, Michael S. Tsirkin wrote:
> > memory: align to min access size
> > 
> > If impl.min_access_size > valid.min_access_size access callbacks
> > can get a misaligned access as size is increased.
> > They don't expect that, let's fix it in the memory core.
> > 
> > Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
> > 
> > ---
> > 
> > 
> > diff --git a/memory.c b/memory.c
> > index 9200b20130..ea489ce405 100644
> > --- a/memory.c
> > +++ b/memory.c
> > @@ -532,6 +532,7 @@ static MemTxResult access_with_adjusted_size(hwaddr addr,
> >      }
> >  
> >      /* FIXME: support unaligned access? */
> > +    addr &= ~(access_size_min - 1);
> >      access_size = MAX(MIN(size, access_size_max), access_size_min);
> >      access_mask = MAKE_64BIT_MASK(0, access_size * 8);
> >      if (memory_region_big_endian(mr)) {
> 
> I've tried this (and .impl.min_access_size=2) but that wasn't enough.
> 
> In the guest, I did `inb(base_addr + 1)`, but I've got back the value as
> if `inb(base_addr)` was run.
> 
> The device emulation read callbacks did get addr=0 width=2, so that's
> fine, but the result returned to the guest wasn't shifted. Same thing
> for write access, the write value isn't shifted, so a write to the
> second byte would be written to the first.
> 
> Thanks,

So is there still an issue with my latest pull req?
Or is everything fixed?


> -- 
> Anthony PERARD

