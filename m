Received: by 2002:a19:ee0d:0:0:0:0:0 with SMTP id g13csp2361313lfb;
        Tue, 20 Apr 2021 11:29:46 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzZMxcJ9h0br7mSmWSTzEhtyDrDJ/HNz3nxWUj3/08CW12UPL61Gk4NudHMH69lDkJhY6oe
X-Received: by 2002:a05:6638:1390:: with SMTP id w16mr22458505jad.83.1618943386372;
        Tue, 20 Apr 2021 11:29:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1618943386; cv=none;
        d=google.com; s=arc-20160816;
        b=a3U6YoXlcYMD02t7HFC0jcvRbx04TpVd88rSoqrmltLM20pmTGDGDpfYjz5iZGHfEa
         vOP8ZMS3m1QLSbnl/oEs6kzAgna7+ldCMMfA6Ar0/WbouEvJFchFmb4WSJV9J34eTo93
         0y/POMlp76Bf8c/5A6bT5SuWaynK1ApDWhPikd521G2EtC3ip4R9wgYHtMiPRgYqdNOS
         B0WQpM0YaaUwD9gqkBEi5EDmuTrZq62gsOn0NbxI6wrzHa0TzKHpPfHRsynTLzff6hly
         5QkdM6iazf72hOfTZiBY7w83USXGY1M5fgrMGpUKX3aF1ARTidIcv+ga3BjEGSFdYVdD
         VSJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-disposition:in-reply-to:mime-version:references:message-id
         :subject:to:from:date:dkim-signature;
        bh=ynMILBPjrnkkMlaqpr5C71HDruRd/nqxaUH4S2Rd2MQ=;
        b=JXAcLxxPyr2iZRruKbfxdRWPgBn4oxGeFX9Zv14CyLRHLbB5TqqQ4GWGJHaKf2Y9Y0
         +CVOTn312yfe34eoQP0Yu0/1tM7+4/gb9FoXFfgwv3aYAkQgc9t8Yb/ecCjDvZgrPlFZ
         +ZX3eq9U3fPzM/LEgVPEA0bV5pKhhCN6vE5iz5e2V3o+jaOojfoaGuyNW1bT3qRQHliB
         foIaVWw92NxeDG1+KcVR5ulTdNC1ZZAINUlDA3hdko+mmrIvx+c/1HTkmUGYcEHiD3zh
         8nehBfdU61Zt80j6DCGpiKriDijweBgBtQlrfyPZ7EvguVIvdlo46lfRGzWLbthaKc41
         IYbQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=Us52guug;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v20si3351245ilo.64.2021.04.20.11.29.46
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 20 Apr 2021 11:29:46 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=Us52guug;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:42192 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lYv82-0003T3-Bp
	for alex.bennee@linaro.org; Tue, 20 Apr 2021 14:29:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35744)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1lYv72-0003Ph-A9
 for qemu-arm@nongnu.org; Tue, 20 Apr 2021 14:28:40 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:54213)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1lYv70-0004Ju-MJ
 for qemu-arm@nongnu.org; Tue, 20 Apr 2021 14:28:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1618943317;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ynMILBPjrnkkMlaqpr5C71HDruRd/nqxaUH4S2Rd2MQ=;
 b=Us52guugVWOM0/gw/8xHWYQuV0RH8BEQdvtmkTx2AVHBVEH2rDeKJbI+WeWiUTNoEqM4Xa
 yaI1ZBmg/eVUOUeaCDRBeM1CWThQ2S9fOhzyBuL7nAsnwO9JBwnF6gO6gT6fyQnrwZr8NS
 ovtAv7EFQGxAIVae7VedqazRYDbJPuI=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-549-DAYv7DZLMry3nXS8MyWyjA-1; Tue, 20 Apr 2021 14:28:22 -0400
X-MC-Unique: DAYv7DZLMry3nXS8MyWyjA-1
Received: by mail-qk1-f197.google.com with SMTP id
 r123-20020a378f810000b029028244d5f023so7829688qkd.2
 for <qemu-arm@nongnu.org>; Tue, 20 Apr 2021 11:28:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=ynMILBPjrnkkMlaqpr5C71HDruRd/nqxaUH4S2Rd2MQ=;
 b=mx5tzOtwne82rK1LSiCGQ6czyGo1X9cP+snRd9SOrD7FnDn4oSs1mwlfz7wt1YqbIT
 OaHSB1kjnccyr0XBYpfVEWI0A+a9cSJ421LJe2UmJ6XfnG6bvV9ecR8GteXMqOD4AySr
 ISwRxd5KrFO8D6lo19V0eQVOixG8bdXAO2uPc/+YIYW9kjD+AwKIw9LwuW4+3GO0EAH7
 VUSF+r0/KMeZUGtgVJgOPisJUysL07vjQLO18wXo3gI3NkCfhhfoG4SzyvDq8xNToAw/
 M3DqfEkhE3rnFyBqGcyrh76O1/ApZtfy5ekgWPYDdZtkPEbHk3du57VrgndUVn2aWj7z
 0y4Q==
X-Gm-Message-State: AOAM533C+VwFYFs9Xs6thlJyKiYusYKqJvs1+Uawfao69g9WI74nh/ow
 pfMDabzjUbHvYhf05+x3MST4riMHPcNNn75l03Vuh9wV4hypzWqdkVPpc2uLRoaVC6gFqCXphb0
 zZ0RGFhl2iPla
X-Received: by 2002:a37:2cc1:: with SMTP id
 s184mr18817024qkh.489.1618943301461; 
 Tue, 20 Apr 2021 11:28:21 -0700 (PDT)
X-Received: by 2002:a37:2cc1:: with SMTP id
 s184mr18816990qkh.489.1618943301196; 
 Tue, 20 Apr 2021 11:28:21 -0700 (PDT)
Received: from xz-x1 (bras-base-toroon474qw-grc-88-174-93-75-154.dsl.bell.ca.
 [174.93.75.154])
 by smtp.gmail.com with ESMTPSA id n6sm11641563qtx.22.2021.04.20.11.28.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Apr 2021 11:28:20 -0700 (PDT)
Date: Tue, 20 Apr 2021 14:28:19 -0400
From: Peter Xu <peterx@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: Re: [PATCH v2 01/11] hw/arm/aspeed: Do not directly map ram
 container onto main address bus
Message-ID: <20210420182819.GD4440@xz-x1>
References: <20210417103028.601124-1-f4bug@amsat.org>
 <20210417103028.601124-2-f4bug@amsat.org>
MIME-Version: 1.0
In-Reply-To: <20210417103028.601124-2-f4bug@amsat.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
 qemu-devel@nongnu.org, Joel Stanley <joel@jms.id.au>, qemu-arm@nongnu.org,
 qemu-ppc@nongnu.org, =?utf-8?Q?C=C3=A9dric?= Le Goater <clg@kaod.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?utf-8?B?SGVydsOp?= Poussineau <hpoussin@reactos.org>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: VTe3OTsTNTm/

On Sat, Apr 17, 2021 at 12:30:18PM +0200, Philippe Mathieu-Daudé wrote:
> The RAM container is exposed as an AddressSpace.

I didn't see where did ram_container got exposed as an address space.

I see it's added as one subregion of get_system_memory(), which looks okay?

-- 
Peter Xu

