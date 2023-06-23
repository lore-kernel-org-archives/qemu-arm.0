Received: by 2002:a17:906:6453:b0:98d:a79e:b696 with SMTP id l19csp3263ejn;
        Fri, 23 Jun 2023 00:09:46 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ7iY9CZFFRFPMJbViz2R3G83LHp+PQTC7VYkr36D/R5fBwv6xKQgI+dGjOIVoEi3X/A9HZj
X-Received: by 2002:a05:620a:268f:b0:762:3cbd:3fc9 with SMTP id c15-20020a05620a268f00b007623cbd3fc9mr22854531qkp.34.1687504186430;
        Fri, 23 Jun 2023 00:09:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1687504186; cv=none;
        d=google.com; s=arc-20160816;
        b=h4Y0fixcTGnX+0vUfiAfOHg4UhBwY6pkmxyZGeto4Jq5eNkvEndbcn89G8VWquycX1
         ddV1WOS1wo+cCcwYOaI/19qiT7VsaeGaM7GQYJ3WhDZbblpB9DRVVMjXshJoOOgfetd/
         ErBrX7QD6smiX+7VSYqhiSc3Pvhl7rmk4q6oeFbRmVDZ49EP/9SNT1UTpN/7MOxh/jX8
         3G9d0vpGHKIgyHfgCBqrETzHN2VvSy8CuX6gNXYX2w2lbs/RRr+CjqGyJ843pEwlCs8p
         xT2UoZsDyQms+tNdco6Ga8QW7NeujYGbUzVegNZx71OKgA0rfuj8+IB/m0fOhuGu6Nl3
         t7XQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-disposition:in-reply-to
         :mime-version:references:message-id:subject:cc:to:from:date
         :dkim-signature;
        bh=z3MVSkxZV5IEqQsfFV/zSBRfB0GasDlg+KTcmQYnw+4=;
        b=Sla+ZIP46Ey88mlmcBQIJBP6Su4xMUvfTXEujbd7y8FEvVubXJleThSwm4Z2IpaKV3
         9c9bduKBQSYJbcxJ1QTZokaLJrtXNHcA1AfLOFRXSSUXJTTtSzJYFFkKe8qRtnhTWQWK
         s9VulN125RZTqtCddAmI/lx4LYbmcIMvt173KwEf0bIOjvIhkr6bMATlKMhMmA/gRZsT
         p66mRFrKUGA609VNc8Gz2tZ9iuP3Ik5lssQLgWimCdOw0JyRM9ULlV/NQEW0eqkLHaD5
         hj0BYkEXtcRVYXatoT+aVrUG7Nk02PohDcNHGOe5DyeF+3Kn//K/NKhVp6yFv2vGYL24
         SRHA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=a3ZrwBs8;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g2-20020a05620a108200b007624986b3a9si3342903qkk.668.2023.06.23.00.09.46
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 23 Jun 2023 00:09:46 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=a3ZrwBs8;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qCav7-0002UW-8f; Fri, 23 Jun 2023 03:09:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1qCav5-0002UH-Mu
 for qemu-arm@nongnu.org; Fri, 23 Jun 2023 03:09:23 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1qCav4-0007w4-3r
 for qemu-arm@nongnu.org; Fri, 23 Jun 2023 03:09:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1687504160;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=z3MVSkxZV5IEqQsfFV/zSBRfB0GasDlg+KTcmQYnw+4=;
 b=a3ZrwBs8u5V6oX1EXYo0XvCFg6IwBsyE9w/mJ2hzptVjXl+6yIMK3+cnuPezZ/IA7i4bvI
 Ey/JMfZtIKonOtSd18eBiFAK9x7bLsajXucFkm2SxTWlzlQPFcaGrq3Zatqnsj/B3nrGGx
 dPaB52EbytEAxsJZ/W/pt1C/XwOH4sw=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-339-adTtajYLO7KHU-wTNjsnOA-1; Fri, 23 Jun 2023 03:09:19 -0400
X-MC-Unique: adTtajYLO7KHU-wTNjsnOA-1
Received: by mail-ej1-f70.google.com with SMTP id
 a640c23a62f3a-94a34d3e5ebso19316866b.3
 for <qemu-arm@nongnu.org>; Fri, 23 Jun 2023 00:09:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687504158; x=1690096158;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=z3MVSkxZV5IEqQsfFV/zSBRfB0GasDlg+KTcmQYnw+4=;
 b=H3QTHnV56LUwCqRXZLOcjQlE9FZQQg6Blb5Fbu4OhB7qEs1Opn6NIr0P8OdPCH+zBs
 fYOKafoUF/FcsqmZfTm11vMAfqLIevqQeYITLQ4veUfjO/u1kEVpDU6FTVa/9VuiPPJV
 LYUOaPdzKmzVzjDqpEuDBkWuN+jDsOVzy84J0uFv2kTNGOywPk64RyKdHSAy+ruCf2iA
 B/rjFJ6KOi6NjhWAdysjEpcBLprWHm4aYaeMFaybb166M93JzjEbU3VKc+5+fkO7gryh
 FpvYozeQwW0bAMptRFuKoHhBFSxCX8aMPDwmoVuANrGck9h4pb69Jso2bvexZMrj/QLe
 NLkg==
X-Gm-Message-State: AC+VfDxLyy5Moy2zvJfsDoOvdnqhc27XtP9vqflUi9K08g3rDA9oIwFw
 cqBJQE6CpNJ+eHPMtVJa6fZ0e8vfp0b01MxffVFWS9s8Iy9gI++34iJStSVKoU34QgqGYkY25Wf
 g2tiV8lWiolgt
X-Received: by 2002:a17:907:1ca8:b0:973:d076:67ab with SMTP id
 nb40-20020a1709071ca800b00973d07667abmr19038536ejc.42.1687504158516; 
 Fri, 23 Jun 2023 00:09:18 -0700 (PDT)
X-Received: by 2002:a17:907:1ca8:b0:973:d076:67ab with SMTP id
 nb40-20020a1709071ca800b00973d07667abmr19038517ejc.42.1687504158321; 
 Fri, 23 Jun 2023 00:09:18 -0700 (PDT)
Received: from redhat.com ([176.12.150.14]) by smtp.gmail.com with ESMTPSA id
 cd20-20020a170906b35400b00982881f1e2dsm5529307ejb.84.2023.06.23.00.09.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Jun 2023 00:09:17 -0700 (PDT)
Date: Fri, 23 Jun 2023 03:09:12 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: David Hildenbrand <david@redhat.com>
Cc: qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Igor Mammedov <imammedo@redhat.com>, qemu-arm@nongnu.org,
 Gavin Shan <gshan@redhat.com>
Subject: Re: [PATCH v1 0/5] virtio-mem: Device unplug support
Message-ID: <20230623030854-mutt-send-email-mst@kernel.org>
References: <20230613150210.449406-1-david@redhat.com>
 <20230623015740-mutt-send-email-mst@kernel.org>
 <81e0644d-96fa-8d1e-17b5-03f548729c93@redhat.com>
MIME-Version: 1.0
In-Reply-To: <81e0644d-96fa-8d1e-17b5-03f548729c93@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: 9RfldbIm12ZV

On Fri, Jun 23, 2023 at 09:04:37AM +0200, David Hildenbrand wrote:
> On 23.06.23 07:58, Michael S. Tsirkin wrote:
> > On Tue, Jun 13, 2023 at 05:02:05PM +0200, David Hildenbrand wrote:
> > > One limitation of virtio-mem is that we cannot currently unplug virtio-mem
> > > devices that have all memory unplugged from the VM.
> > > 
> > > Let's properly handle forced unplug (as can be triggered by the VM) and
> > > add support for ordinary unplug (requests) of virtio-mem devices that are
> > > in a compatible state (no legacy mode, no plugged memory, no plug request).
> > > 
> > > Briefly tested on both, x86_64 and aarch64.
> > > 
> > > Cc: Peter Maydell <peter.maydell@linaro.org>
> > > Cc: Paolo Bonzini <pbonzini@redhat.com>
> > > Cc: Richard Henderson <richard.henderson@linaro.org>
> > > Cc: Eduardo Habkost <eduardo@habkost.net>
> > > Cc: "Michael S. Tsirkin" <mst@redhat.com>
> > > Cc: Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
> > > Cc: Igor Mammedov <imammedo@redhat.com>
> > > Cc: qemu-arm@nongnu.org
> > > Cc: Gavin Shan <gshan@redhat.com>
> > 
> > Lots of duplication pc/arm. Which is not new but do we have to keep
> > growing this?  Can't we put at least the new common code somewhere?
> 
> There are some minor differences in the code, but I guess we could factor
> the (un)plug handlers out.

maybe with a callback.

> 
> hw/virtio/virtio-md.c
> include/hw/virtio/virtio-md.c
> 
> ?

Sure.

> -- 
> Cheers,
> 
> David / dhildenb

