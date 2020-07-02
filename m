Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp1382415lfm;
        Thu, 2 Jul 2020 04:23:17 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzRdsn+Vs9rKIbrZKecrxrzVFrNH1cUNObvngZcOgoMjPWFEmrO+igHOC42S8k16Il0wgva
X-Received: by 2002:a25:4901:: with SMTP id w1mr51494696yba.31.1593688997305;
        Thu, 02 Jul 2020 04:23:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1593688997; cv=none;
        d=google.com; s=arc-20160816;
        b=qRfp7X1MNjfLgJyNf+dqpzZoQQ2hPEFBG0+P4hRLi/2R0yL+wvmYH7YcWowbliK4b2
         T39XAXxZBPBRUgVjxSruPG8Kl2ItXAI71yCf0LBdP0IDacljrujWIIem0yghRyjR/HlB
         eZnAMaRE7KDj0mTFt49cmn+xrR7mJZaG34NzFmJydZUw0TGuv8ygHlwScYobbJr6VLt6
         IAtMn9RtkaCeHU13w3oBrw670sgVeBxe792/ga4kppZsIaEOUrtgMm1d5AJFmlRD68sN
         i6qSwOdSMvkZa2VRHBjRRyIYlvvLeHklobgMZfxvEvSum2mK7rlFHj64yYZCvofjUzaZ
         oCvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-disposition:in-reply-to
         :mime-version:references:message-id:subject:to:from:date
         :dkim-signature;
        bh=2ts/IKAR1Odacoug5bc4yiBc2GKdluDPA2i+GTwsTGM=;
        b=dODz0S1aar5h83fC160iM+w9mCfG6K+Qgv1zuwxhObvIIkk5oNkw3jN84F13tO08iy
         Gv9TWq46M+XBSY8uiBKgasoZROM8gxehDtbkWWDDMx9yNw2fkAVC3A7J+wZLqgaLZ9nF
         wA5rCcA0mDYprwLeG+Hh9+T1QkuCzeA1Wxg/4Byc8C2MD2Vdht6dHaanlyzeCMZVJh4q
         9WDiS2evswfHKD4AThPqT8IbL6I7wcShYDHborrxDBQaxgw3MBrBAcY41NUZF1DTjN/P
         o8msqKvKPaKxJ2PwJK2EjeBD2vDCW7ErlMK88AuaScNpksf3NhInHUzuEspBkJApQ2C/
         q++Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=JpGXh3R0;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h10si7829647ybg.116.2020.07.02.04.23.17
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 02 Jul 2020 04:23:17 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=JpGXh3R0;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:54216 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jqxJE-0005Ct-It
	for alex.bennee@linaro.org; Thu, 02 Jul 2020 07:23:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53674)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1jqx9n-0005cC-90
 for qemu-arm@nongnu.org; Thu, 02 Jul 2020 07:13:31 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:52428
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1jqx9l-0002U3-Lu
 for qemu-arm@nongnu.org; Thu, 02 Jul 2020 07:13:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1593688409;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=2ts/IKAR1Odacoug5bc4yiBc2GKdluDPA2i+GTwsTGM=;
 b=JpGXh3R0J1268XIjtqjOiEHERqcfuQcPcYr0LuBxSbSybkFfRClhELToP0ZmmAxcvEy6aM
 PUM3h6xpF+J7x7OJ2vqdknRaao+Fn+WRB3fvmjZF7dkrewinLpMn/oOvVozP1Brx+5CiMD
 OGNp2Po3pUqR1Fl0QKHnRfIuG8hyccQ=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-51-Hai1CNjbM1qbjPzyk-Ys_g-1; Thu, 02 Jul 2020 07:13:27 -0400
X-MC-Unique: Hai1CNjbM1qbjPzyk-Ys_g-1
Received: by mail-wm1-f70.google.com with SMTP id v11so9560906wmb.1
 for <qemu-arm@nongnu.org>; Thu, 02 Jul 2020 04:13:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=2ts/IKAR1Odacoug5bc4yiBc2GKdluDPA2i+GTwsTGM=;
 b=hTXEkXjbzIGCW5wsDW7wOzd1keTwLf80oX6DMtWvf1kvcS3eJH/g+5b7FDtlkS0Cn4
 qCSZqgddx51UgdiZ4lEx9ax6gGqn0OGh7YWOqoo8qBEi/zibcQu7f7EL2yIcqgEu8gb8
 sViv9UthshjC62H7LyaRLLJNLEShjuuxD1L5ItrcXHvs29aj63Qeq1tf0TEv5Imitms2
 ANUeYJx7KSQikiXzgKX9oTmyzDq6+7x4niJjwtFnkwgdpVbh9ZqRGvp81CYU81C18+z+
 aN27ajR4aJWnH4MqvA3hrGTEGyyEqDhai89PDLx0DXubf6WqIc8k92bbHQwW7Bv7tvTA
 LOZQ==
X-Gm-Message-State: AOAM5339VxAxzaWRbTbCDG3Kr7cAlKsgPGy5gqoqRUBmNwwz8xLvuk+I
 5IBwv6GAzq/DyrwOXVM4k0kUNnpoONf0eHEL1C3EmtX6Vt1yj1qRATL+wHeU+4430hj9l+GQzFq
 Lt2tThOm8vNaO
X-Received: by 2002:a05:6000:1cf:: with SMTP id
 t15mr33491091wrx.180.1593688406494; 
 Thu, 02 Jul 2020 04:13:26 -0700 (PDT)
X-Received: by 2002:a05:6000:1cf:: with SMTP id
 t15mr33491072wrx.180.1593688406292; 
 Thu, 02 Jul 2020 04:13:26 -0700 (PDT)
Received: from redhat.com ([93.157.82.4])
 by smtp.gmail.com with ESMTPSA id m16sm5526947wro.0.2020.07.02.04.13.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Jul 2020 04:13:25 -0700 (PDT)
Date: Thu, 2 Jul 2020 07:13:22 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH 3/4] hw/arm/virt-acpi-build: Only expose flash on older
 machine types
Message-ID: <20200702071308-mutt-send-email-mst@kernel.org>
References: <20200629140938.17566-1-drjones@redhat.com>
 <20200629140938.17566-4-drjones@redhat.com>
 <20200702055245-mutt-send-email-mst@kernel.org>
 <CAFEAcA8EWAnXQ_9_S_7G0yY5EUJp0qshEPmpVuFf8943qfzn4Q@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAFEAcA8EWAnXQ_9_S_7G0yY5EUJp0qshEPmpVuFf8943qfzn4Q@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=207.211.31.120; envelope-from=mst@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/02 03:23:40
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: 2
X-Spam_score: 0.2
X-Spam_bar: /
X-Spam_report: (0.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 RCVD_IN_SBL_CSS=3.335, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: Andrew Jones <drjones@redhat.com>, Eric Auger <eric.auger@redhat.com>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>,
 Shannon Zhao <shannon.zhaosl@gmail.com>, qemu-arm <qemu-arm@nongnu.org>,
 ard.biesheuvel@arm.com, Igor Mammedov <imammedo@redhat.com>,
 Laszlo Ersek <lersek@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ckDedAekVskk

On Thu, Jul 02, 2020 at 11:16:03AM +0100, Peter Maydell wrote:
> On Thu, 2 Jul 2020 at 10:53, Michael S. Tsirkin <mst@redhat.com> wrote:
> >
> > On Mon, Jun 29, 2020 at 04:09:37PM +0200, Andrew Jones wrote:
> > > The flash device is exclusively for the host-controlled firmware, so
> > > we should not expose it to the OS. Exposing it risks the OS messing
> > > with it, which could break firmware runtime services and surprise the
> > > OS when all its changes disappear after reboot.
> > >
> > > As firmware needs the device and uses DT, we leave the device exposed
> > > there. It's up to firmware to remove the nodes from DT before sending
> > > it on to the OS. However, there's no need to force firmware to remove
> > > tables from ACPI (which it doesn't know how to do anyway), so we
> > > simply don't add the tables in the first place. But, as we've been
> > > adding the tables for quite some time and don't want to change the
> > > default hardware exposed to versioned machines, then we only stop
> > > exposing the flash device tables for 5.1 and later machine types.
> > >
> > > Suggested-by: Ard Biesheuvel <ard.biesheuvel@arm.com>
> > > Suggested-by: Laszlo Ersek <lersek@redhat.com>
> > > Signed-off-by: Andrew Jones <drjones@redhat.com>
> >
> > So who's merging this? Mostly ACPI things so I guess my tree?
> > If so can I get acks from ARM maintainers pls?
> 
> This is on my to-look-at queue but in theory I'm on holiday this week :-)
> 
> -- PMM

I picked up patch 1 for now :)

-- 
MST

