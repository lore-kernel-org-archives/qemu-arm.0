Received: by 2002:a17:906:a84b:b0:7c1:2a22:dc39 with SMTP id dx11csp2768657ejb;
        Sun, 18 Dec 2022 05:06:23 -0800 (PST)
X-Google-Smtp-Source: AMrXdXtREV73YXBjem63b1xTn8SSNFs8zDJmzkkH++9PK96RFkcEKpSYaxktcJLYMzro13RmcLCD
X-Received: by 2002:ac8:70d2:0:b0:3a9:75b9:4b7b with SMTP id g18-20020ac870d2000000b003a975b94b7bmr10937529qtp.39.1671368783171;
        Sun, 18 Dec 2022 05:06:23 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1671368783; cv=none;
        d=google.com; s=arc-20160816;
        b=MA71trrfArWKJ/q6YkBUjL2gWYD3LOFLsSlICBKCsz562SUBN54lOYdc0UJzBp36K/
         IBGP/SlwgePF2ZJM0qitEhsO33M5VqYZqL7ZZ8Hau4JFxQeWKrD5ulCrfl3k0PYvAxP4
         52/w42Ouv8BPTPHq6EfQvVqTPdvOQldFUmakFYyZPOuI0dJ1g8OPnbW9znsdEeBke16g
         cEGHP5rJuuiGMYENUcehnfuVrND17lt+UdW41NaLfLqkkruq0ic6S7mqQUgSwB0P/9VT
         JhAlePoqXDdS0ofibSu1AVPvvxwzvL0yOG9xKau8B7GYh97a5Dkc8U7P5ZdoQrBoGxqG
         JE+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-disposition:in-reply-to:mime-version:references:message-id
         :subject:cc:to:from:date:dkim-signature;
        bh=5MmwUpEzu2jQZv0ay5Cgna1CDK+fw4siq1KaKp8eo3w=;
        b=k3djZbAWZgMGfBJK0KhyQHNLzHzS5xJLddmcNkhPepomKsm5d+HhhCnOiaC5IrlEwc
         L/zNzxl4yOgOOtoQ/LNEheU2cGCvE+uJ4/dpY+illokfdc63DbhLZ9QME+/A0e5g74Sj
         ORWwueW/bkqrXztBcuUGqbKaLum1Eow7cwvX5aq46PTww04vnKZKQKQzrEp8cPYpONbD
         Kqwkja7WstWcX0jBm2fKdI11ckUYlY0BNpqAPn3ye0KCyvfvoi5s2a+x5oFunlgU1+qG
         E7/M70rpuQT2cnorDhxNXF2MOothW+n5lFcv1u1RUFBGk5HhX4z5lgDhRCK+tan3jX/L
         Mb8g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=YnCEnkHj;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id fb15-20020a05622a480f00b003a97c56d020si1909190qtb.364.2022.12.18.05.06.23
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 18 Dec 2022 05:06:23 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=YnCEnkHj;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1p6tMD-0002WC-9S; Sun, 18 Dec 2022 08:05:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1p6tMA-0002Ur-PE
 for qemu-arm@nongnu.org; Sun, 18 Dec 2022 08:05:30 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1p6tM9-0007k3-5j
 for qemu-arm@nongnu.org; Sun, 18 Dec 2022 08:05:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1671368727;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5MmwUpEzu2jQZv0ay5Cgna1CDK+fw4siq1KaKp8eo3w=;
 b=YnCEnkHj+wmkYnR4F310gB929WKGs2a2SMSda6Fk9oBHQrdHhdkX9p+2VQj0L7Z33Ch4Ia
 AD7ixt8qJwG/kKYnivFu4QlW85jKh4WDdPH4RbqhXScUBV9ytWaZctxynDMcP8y8WYQv5S
 2Zq9P/KOQGCW8E1TLMlBqDkeX9RdA7s=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-175-Ir_RUVpHOHSkqUX7F9xa9A-1; Sun, 18 Dec 2022 08:05:26 -0500
X-MC-Unique: Ir_RUVpHOHSkqUX7F9xa9A-1
Received: by mail-wm1-f72.google.com with SMTP id
 o5-20020a05600c510500b003cfca1a327fso3805717wms.8
 for <qemu-arm@nongnu.org>; Sun, 18 Dec 2022 05:05:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=5MmwUpEzu2jQZv0ay5Cgna1CDK+fw4siq1KaKp8eo3w=;
 b=fGleUN9P56dYHlMwEDgyyTJxZizN2BrcBfp3bVWebQwxxCFBeZfvSjwn0nQJWAkyC9
 9RGUMhpxipNndTFX8Vx1s5qfIO3XzJOyWpA4AxBSzdTb11EUr0VBM8L+Sz4tQJtnQgf5
 1JuMhDDEmzsgkKO007wPJFgATpN9fVPVXALI2R+z6/DHMNTUv4MT5BXz6K2Cg/CUoHIb
 soVHxf4jZ4w6qORvhNFLztBZ08uCm0swG4kB0DoHmbqb15IpruU6dGIm/JS96rxXUl9t
 m/iqfoTEWpw1WXCMcGHH2zTJzubsOIA9d3rB7Jn1KwDWDP8PSKE3Q0fSIttFnIeKQrxs
 lWxw==
X-Gm-Message-State: ANoB5pnffDFjZXTrB0HDX+bf5ZrJxkZy099bNXKLSkxrzbwhkguvMolX
 p9ekb4tCMXwQRwnBsA78fnpal8sz4qQtWlG7zy1kRz3hgJWyVZxFSBreuQFB1N2q2t5FdpWiq/z
 HX8/L+y3xFiRM
X-Received: by 2002:a05:6000:1b04:b0:242:5023:46c7 with SMTP id
 f4-20020a0560001b0400b00242502346c7mr24512687wrz.57.1671368725307; 
 Sun, 18 Dec 2022 05:05:25 -0800 (PST)
X-Received: by 2002:a05:6000:1b04:b0:242:5023:46c7 with SMTP id
 f4-20020a0560001b0400b00242502346c7mr24512661wrz.57.1671368724975; 
 Sun, 18 Dec 2022 05:05:24 -0800 (PST)
Received: from redhat.com ([2.52.25.20]) by smtp.gmail.com with ESMTPSA id
 c3-20020a5d5283000000b0024206ed539fsm7293990wrv.66.2022.12.18.05.05.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 18 Dec 2022 05:05:23 -0800 (PST)
Date: Sun, 18 Dec 2022 08:05:19 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Bernhard Beschow <shentey@gmail.com>
Cc: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org, John G Johnson <john.g.johnson@oracle.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Huacai Chen <chenhuacai@kernel.org>, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Aurelien Jarno <aurelien@aurel32.net>, Paolo Bonzini <pbonzini@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?iso-8859-1?Q?Herv=E9?= Poussineau <hpoussin@reactos.org>,
 Elena Ufimtseva <elena.ufimtseva@oracle.com>,
 Eduardo Habkost <eduardo@habkost.net>,
 Jagannathan Raman <jag.raman@oracle.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 qemu-ppc@nongnu.org, qemu-arm@nongnu.org
Subject: Re: [PATCH v2 0/3] Decouple INTx-to-LNKx routing from south bridges
Message-ID: <20221218080511-mutt-send-email-mst@kernel.org>
References: <20221120150550.63059-1-shentey@gmail.com>
 <17a7d714-8a1e-8a17-f657-2172060d02e5@linaro.org>
 <3F5A5F52-5815-4CB2-9DE8-894D59B0EB8C@gmail.com>
MIME-Version: 1.0
In-Reply-To: <3F5A5F52-5815-4CB2-9DE8-894D59B0EB8C@gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: ktLMQaeyFiBL

On Sun, Dec 18, 2022 at 10:21:49AM +0000, Bernhard Beschow wrote:
> 
> 
> Am 9. Dezember 2022 15:23:59 UTC schrieb "Philippe Mathieu-Daudé" <philmd@linaro.org>:
> >On 20/11/22 16:05, Bernhard Beschow wrote:
> >> v1:
> >> ===
> >> 
> >> During my PIIX consolidation work [1] I've noticed that both PIIX models have
> >> quite different pci_slot_get_pirq() implementations. These functions seem to
> >> map PCI INTx pins to input pins of a programmable interrupt router which is
> >> AFAIU board-specific. IOW, board-specific assumptions are baked into the device
> >> models which prevent e.g. the whole PIIX4 south bridge to be reusable in the PC
> >> machine.
> >> 
> >> This series first factors out pci_bus_map_irqs() from pci_bus_irqs() which
> >> then allowes for moving the two board-specific PIIX pci_slot_get_pirq()
> >> funtions into their respective boards. With these changes, the PIIX4 south
> >> bridge could eventually become an alternative to the PIIX3-Frankenstein
> >> solution in the PC machine.
> >
> >Series:
> >Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> 
> Ping
> 
> Who will pull this?

I'll merge this, thanks!

