Received: by 2002:a17:907:6195:b0:a52:fc6:5c40 with SMTP id mt21csp847444ejc;
        Thu, 11 Apr 2024 03:04:01 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXzIOPGs1FsuqfQ2iwGyV1fXB1yPLwcowAWj9m6kllpA0atgEZdBZcIxXmCcDbYftmQsLYfAC9KsNuhLsCFXAps6cP+EEni
X-Google-Smtp-Source: AGHT+IE8oK9baCyTrmixFfijpfDvH0mKi5GCkUB96QNL++6u8YNvdvsyCjtxsx45vELorypU2ijI
X-Received: by 2002:a05:6808:1414:b0:3c6:500:a154 with SMTP id w20-20020a056808141400b003c60500a154mr4875082oiv.36.1712829840788;
        Thu, 11 Apr 2024 03:04:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1712829840; cv=none;
        d=google.com; s=arc-20160816;
        b=jNIvuseJKTc4VjOE2ATBWPyCVsAMBqLl46AVsfJ1MTSXSmsE03uLUrSWMFy7d2yVG6
         hP3YxnpTQg8FWY8l4y+vkZB/RFI/eD7jCUemsfjXDAAG7C5wzPCGcceQbBTxLwlBzYtj
         sqteViOGwPU2vBUfl2E4256eEzS7go4OlECL/YQs9OB2TEBX1bGAiE8xwsCf+7rxx2nt
         e16FFwdSZp1WUi7t3qJzHPFxZ9v7y8EqA8kJ4XpSKiU5WW05rQsUraLq8gIjGdB03VTB
         uNx1t92GXbWxOgWpqbCedBm8RMwTILAVDQprfhKmApGhFymsYr2NEX3myx0ndLP4wnf/
         jmLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:in-reply-to
         :content-transfer-encoding:content-disposition:mime-version
         :references:message-id:subject:cc:to:from:date:dkim-signature;
        bh=GsKRHfVFY1S1SwAai119QOi6hYJhCEIaE8J48KyCgKg=;
        fh=zxYLHcCljaxcgzDvlTMeui49l5Brlv6L2vFslf1U0xY=;
        b=l1xSvTuC9mcFIFPDZFmosgZyP79LBUR20e4D5iiCsXlxj36cLri2mhWPbkyHGN0md+
         bGwcOhkHceZWSi/ijw6Ai4xDQuq0knROtOgBgt2a8KDWl0qCdbJdCnrmDM9UQD9NsV+E
         bSzK919or2NZLumkobj3Ig45w6+wml3g3/m706SM8x32CIALnAQsQ6ThaOvZeK8RM9Kl
         c7nqwOq2xou6J+5E9x6VS5NkjCsoT4NAOxfQ2N0CotaJ8/lO1m8DLv8eBlqSusTNqoi3
         odi0Hpguvrvg0XwZ2tL0EALbzUKxI3+THmmbvWld5KRC2aqUKwOAnAen+7KA6qXMPwjo
         8crQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=QHkKAq5j;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 5-20020ac85705000000b00434ee91f709si1174709qtw.537.2024.04.11.03.04.00
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 11 Apr 2024 03:04:00 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=QHkKAq5j;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rurGu-00035u-Bu; Thu, 11 Apr 2024 06:03:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1rurGs-00034d-AS
 for qemu-arm@nongnu.org; Thu, 11 Apr 2024 06:03:06 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1rurGq-0005Rf-I5
 for qemu-arm@nongnu.org; Thu, 11 Apr 2024 06:03:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1712829783;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GsKRHfVFY1S1SwAai119QOi6hYJhCEIaE8J48KyCgKg=;
 b=QHkKAq5jsDFu1R3YHsGUr1/Ke1tBl1QK3Tr0Wd8xINKO/VruPUufd27qdelQOYzcbdj40J
 GiKdb+uDrfkfC06DnwPZKOAP8lOu40TTt9Pj0O/epFPPY3fbCf/GuoPpUCBfxbwd2eYkO0
 OjXHJNv8KP1/KPk+1rg6/RFqe2ZnMto=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-613-HcLHS3cANuOaFO6LdG3srA-1; Thu, 11 Apr 2024 06:03:00 -0400
X-MC-Unique: HcLHS3cANuOaFO6LdG3srA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D5752802A6F;
 Thu, 11 Apr 2024 10:02:59 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.192.204])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 74FA32166B31;
 Thu, 11 Apr 2024 10:02:59 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 42418180063D; Thu, 11 Apr 2024 12:02:54 +0200 (CEST)
Date: Thu, 11 Apr 2024 12:02:54 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-ppc@nongnu.org, qemu-arm@nongnu.org, 
 qemu-block@nongnu.org,
 =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>
Subject: Re: [PATCH 01/12] ui/console-vc: Replace sprintf() by
 g_strdup_printf()
Message-ID: <spbj5olgyvktcaaardmh3mgkylkwtby5bsvyxtbtt3iktnm234@3xmownbeuu3c>
References: <20240410160614.90627-1-philmd@linaro.org>
 <20240410160614.90627-2-philmd@linaro.org>
 <dx3zdfuwz7gam7brijaqfd4kg4uttybr2s2pjonhl4twyivhf3@afcjz4iulzcn>
 <4c683f51-fe0f-4ef9-b424-aee8a859df0e@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <4c683f51-fe0f-4ef9-b424-aee8a859df0e@linaro.org>
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.6
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -40
X-Spam_score: -4.1
X-Spam_bar: ----
X-Spam_report: (-4.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-2.049,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: Fz0iB0+2nMxO

On Thu, Apr 11, 2024 at 11:36:10AM +0200, Philippe Mathieu-Daudé wrote:
> On 11/4/24 09:47, Gerd Hoffmann wrote:
> >    Hi,
> > 
> > >      Due to security concerns inherent in the design of sprintf(3),
> > >      it is highly recommended that you use snprintf(3) instead.
> > 
> > > -    char response[40];
> > > +    g_autofree char *response = NULL;
> > 
> > > -                    sprintf(response, "\033[%d;%dR",
> > > +                    response = g_strdup_printf("\033[%d;%dR",
> > 
> > Any specific reason why you don't go with the recommendation above?
> > 
> > While using g_strdup_printf() isn't wrong it allocates memory which
> > is not needed here because you can continue to use the stack buffer
> > this way:
> > 
> > 	snprintf(response, sizeof(response), ...);
> 
> I thought GLib/GString was recommended for formatting,

If you allocate the output buffer anyway (and there are patches in this
series where this is the case) it's clearly better to use
g_strdup_printf instead of malloc + snprintf.

In case a fixed-size buffer can be used I wouldn't switch to dynamic
allocation ...

take care,
  Gerd

