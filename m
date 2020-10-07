Received: by 2002:ac2:4c26:0:0:0:0:0 with SMTP id u6csp387979lfq;
        Wed, 7 Oct 2020 06:03:44 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwDH9kGqxkQ3QiJNPt1VvRHlWDUydZzOHjeNidRzWydNVqdrcJumAthJBTvk84OYgKwg1nP
X-Received: by 2002:a5b:302:: with SMTP id j2mr4261358ybp.50.1602075824528;
        Wed, 07 Oct 2020 06:03:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1602075824; cv=none;
        d=google.com; s=arc-20160816;
        b=e5Rtz1YWD/AQglSRKJpm53qxe3hUHXJhzCS1WXTJrmUTnUlBD+bghsa1Wn9WPC3B51
         hMG1u2bZep4u+7Ud1EvTxRcHeEQRLRr01k5kpwl+YNWvAtHp8nNbyzgjgiHivqeb1l0F
         BNCjDWwlOB8ZVJgRTxW4ARMW1jdVcu6trhpj8lAc71TUF5+N3evqsr/nkBdr6K+nxf18
         57iMW5V8YZjkVzNL1gfuRSARxNP4x3m3jKYqUSW3nxrWXV04S++z9VK8JU3ZbocjL8d3
         IZok7IE8bWiPAz4URs2oanqQFPQKdpAKUtJ6OQ1Mmvy038AAk3SrQuqzPHROw7Q1JQrr
         8zBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-disposition:in-reply-to
         :mime-version:references:message-id:subject:to:from:date
         :dkim-signature;
        bh=YAC7NOB+gtz3eLsj/JsOKrn9rwcp50yoW4Q24mtEiaQ=;
        b=b7mXHXx7/J6aApikwys02HlerZ45Uw2PHgQ/tQbRQfOaUNmYlggtvUEIYC480h9BkA
         nqL7Jug/maA3bQro6MHZQ2ytYkW6M1PPsD3gKvJPBkwVrOYui0s1LBD/kpI0SvSkSMDw
         UgncPiNegddaAle288shkPB7+lFVzzy7ir3zLzw0T2zx2pvR8SjifUn3waLUuOeisriR
         KAnhuQvQfQH/lGwlv0BaMqDhvuSaMtTb1l9fDqOHM48rgbHqRDHAyNUZLG9HXDVSQfwg
         hsNvsbPC6vn/2liT9oW3DHrpJhVIDKWxE6zZBpK7zQqGAPqE3V/krTbnk8gux3mDKdKP
         L0fA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=CR5QbWHT;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c18si1751365ybn.331.2020.10.07.06.03.44
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 07 Oct 2020 06:03:44 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=CR5QbWHT;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:46548 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kQ96d-0000EY-UL
	for alex.bennee@linaro.org; Wed, 07 Oct 2020 09:03:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50396)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1kQ95p-0008Ud-AV
 for qemu-arm@nongnu.org; Wed, 07 Oct 2020 09:02:53 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:24025)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1kQ95j-0001hW-1p
 for qemu-arm@nongnu.org; Wed, 07 Oct 2020 09:02:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1602075766;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=YAC7NOB+gtz3eLsj/JsOKrn9rwcp50yoW4Q24mtEiaQ=;
 b=CR5QbWHTHCcAMREm1d+wdKE3eeuzWa0Woq3QPQ4TygARCOcLZNL1StmSsPm6XJaqEAO2qr
 2e7sFPCxD3p9tY5xzN6Q0tDqD7UWs5BCJx1TnQMvSJh5sCy6S+ki1mkqXKvXdY/XYCwwbs
 aWy4D9NnFkFj4P4JO+9loi5pPEjDoXw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-535-6Tu-Sz0zO3ylFGAV9iP4mg-1; Wed, 07 Oct 2020 09:02:42 -0400
X-MC-Unique: 6Tu-Sz0zO3ylFGAV9iP4mg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 38B9A804013;
 Wed,  7 Oct 2020 13:02:41 +0000 (UTC)
Received: from localhost (ovpn-119-102.rdu2.redhat.com [10.10.119.102])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B33BC60BF1;
 Wed,  7 Oct 2020 13:02:40 +0000 (UTC)
Date: Wed, 7 Oct 2020 09:02:40 -0400
From: Eduardo Habkost <ehabkost@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: Purpose of QOM properties registered at realize time?
Message-ID: <20201007130240.GU7303@habkost.net>
References: <20201006220647.GR7303@habkost.net>
 <a6e652d9-548f-4d4e-e451-48e3f5e11031@redhat.com>
MIME-Version: 1.0
In-Reply-To: <a6e652d9-548f-4d4e-e451-48e3f5e11031@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ehabkost@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=ehabkost@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/07 00:54:30
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.742,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org, qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
 "Daniel P. Berrange" <berrange@redhat.com>, John Snow <jsnow@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: YasBuxUIWcBc

On Wed, Oct 07, 2020 at 02:04:23PM +0200, Paolo Bonzini wrote:
> On 07/10/20 00:06, Eduardo Habkost wrote:
> > Hi,
> > 
> > While trying to understand how QOM properties are used in QEMU, I
> > stumbled upon multiple cases where alias properties are added at
> > realize time.
> > 
> > Now, I don't understand why those properties exist.  As the
> > properties are added at realize time, I assume they aren't
> > supposed to be touched by the user at all.  If they are not
> > supposed to be touched by the user, what exactly is the purpose
> > of those QOM properties?
> 
> In the case of GPIOs, I think they will be used by other devices that
> are added afterwards.

Do you know how exactly are they used?  Is this always wrapped
behind a specific API for GPIOs, or the devices can look for the
properties directly?

I'm concerned by the possibility of having QOM properties as an
undocumented part of an internal API.


> 
> The remaining ones are:
> 
> > hw/arm/allwinner-h3.c=232=static void allwinner_h3_realize(DeviceState *dev, Error **errp)
> > hw/arm/allwinner-h3.c:359:    object_property_add_alias(OBJECT(s), "sd-bus", OBJECT(&s->mmc0),
> > --
> > hw/arm/bcm2835_peripherals.c=128=static void bcm2835_peripherals_realize(DeviceState *dev, Error **errp)
> > hw/arm/bcm2835_peripherals.c:322:    object_property_add_alias(OBJECT(s), "sd-bus", OBJECT(&s->gpio), "sd-bus");
> > --
> > hw/arm/bcm2836.c=69=static void bcm2836_realize(DeviceState *dev, Error **errp)
> > hw/arm/bcm2836.c:87:    object_property_add_alias(OBJECT(s), "sd-bus", OBJECT(&s->peripherals),
> > --
> > hw/arm/xlnx-zynqmp.c=276=static void xlnx_zynqmp_realize(DeviceState *dev, Error **errp)
> > hw/arm/xlnx-zynqmp.c:522:        object_property_add_alias(OBJECT(s), bus_name, sdhci, "sd-bus");
> 
> And this are probably usable with "bus=sd-bus" or something like that on
> other devices, too.
> 
> Paolo
> 

-- 
Eduardo

