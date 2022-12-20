Received: by 2002:a17:906:a84b:b0:7c1:2a22:dc39 with SMTP id dx11csp4718803ejb;
        Tue, 20 Dec 2022 15:13:16 -0800 (PST)
X-Google-Smtp-Source: AA0mqf4rQ6XrDCoiV7SIXUGvOl9kLKIOT0BCv+eDPHrbE3J40eA1a/eu5cm4DUnNC+/hYWezHb2n
X-Received: by 2002:ac8:6988:0:b0:3a6:6eb7:3347 with SMTP id o8-20020ac86988000000b003a66eb73347mr59206824qtq.19.1671577996766;
        Tue, 20 Dec 2022 15:13:16 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1671577996; cv=none;
        d=google.com; s=arc-20160816;
        b=QAzGGECqgYD4ucsgzJLjBCTGtNeDDi0Bq37Rl067Wx6JbLmr0k2sAlEaXf7NkBr/Pv
         EEHJVoxnsPP8FF9KvMAK4Wrhr7GR54WgfBa0LNpyomM9jCwznzXIZKA/zt7mZESsfQVY
         glZqvMMXT2wCgPD8kPqvufC/SunHiXXHlB4dxUxdp9lH9tTdfwutAPRUWBNxvC3Bp6GJ
         r+kKr/Yl869MxQhx1XW/8po2ce/mNtaIZjHMwKvP9U+0/QITG7TrSnpoX+4ZO0Csby4h
         dEM1I1GXdnc9mRHRS2PARu+ZIG2BPmFGZUx+F3vjAEXpJ4fnQBlsZKFDSdGbMSD/y40g
         KBCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:in-reply-to
         :content-transfer-encoding:content-disposition:mime-version
         :references:message-id:subject:cc:to:from:date:dkim-signature;
        bh=5Wz7NntDF/HRX/Splxt9mXQ4QhGsikxUi5AaRvWZrLw=;
        b=uw5hbluQDzKk6zErjWXF7mcMEjiE0cKBJf+IRd4kyOLPJJnIF/dz36EHjNoLg7eOKk
         YQno/yx2QhIqS9JFgCLl1YBssu+lRgeE79sCGICXwQB7Z9PSRYcF7qwZrc3zjuy/OXgu
         8/EysDmKTTbREQORalC/85GkQ0BD+EbWEgwtrPPdjpBszjD6fZjsQ1BMCDwXi3BOnyHT
         nsr7/iDYaCoqLulJMZGkewY8gGo4ZA1ol55oXph8J+96YJP6tWhA2ZYkoj97Ac+N9tIX
         NpmmGx7xhR5HS81BYGp85cYL+4LM1AEnulWruPnjwVdk8IYdeOTewRD+Je9zkb2l3DIa
         ommA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=LdX8vdtu;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id k17-20020ac84791000000b0039cdad4d788si5596397qtq.777.2022.12.20.15.13.16
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 20 Dec 2022 15:13:16 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=LdX8vdtu;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p7llH-0002ds-8B; Tue, 20 Dec 2022 18:11:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1p7llD-0002dR-IO
 for qemu-devel@nongnu.org; Tue, 20 Dec 2022 18:10:59 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1p7llC-0000TW-A7
 for qemu-devel@nongnu.org; Tue, 20 Dec 2022 18:10:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1671577857;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5Wz7NntDF/HRX/Splxt9mXQ4QhGsikxUi5AaRvWZrLw=;
 b=LdX8vdtuzf23xRO9FuRh80bXrE7atooVEI5sZFXnTnJ5RVbi1TPIq9LIFf9k6EMJTFN0YE
 GJDQC84mNDZCuXCM/7UPX7NGm2cb6s2v0dXYHhEXM/CKWayc7YKJneEgB4nQqPKiZzNz+4
 4wIIJMjZKSQ2qiCO+ZlOkVLXjCD20rs=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-213-VIYHcv1pOB29oMH3b3PtaA-1; Tue, 20 Dec 2022 18:10:53 -0500
X-MC-Unique: VIYHcv1pOB29oMH3b3PtaA-1
Received: by mail-qk1-f199.google.com with SMTP id
 f13-20020a05620a408d00b006fc740f837eso10472479qko.20
 for <qemu-devel@nongnu.org>; Tue, 20 Dec 2022 15:10:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=5Wz7NntDF/HRX/Splxt9mXQ4QhGsikxUi5AaRvWZrLw=;
 b=nPUu/y+OcK6NOCBBdPa2HPynmvGCf58dU3uZ6yqtt9fmeUi3v1S/aeSFLixgl1i5Rw
 eUCkuSKJuI5IvHL+5wc352uPLQ6CynU3kU+SRVwNpK2qFMfNEJ7j1ABDR3/8K9Ryjmoz
 HhuHVapVi6kWJaqKww4/unn2r9wNB4Pa7alY6s4jX6ea8ty9Mz36ySjn3ikmE8YshN1k
 6zkfIwQJ9GnNT/tzaH4VU8vIWfA7DjBG+ePRfKlWSqm5WguNQzB1EaJYIMmAyAGnTwGu
 Swq4OwWGCPiBdyDHDu5SobPhfQM8FJnEOQVBfDwIsDT0cYCDA8nEE7SVdff2ZDs9eH9Z
 an5w==
X-Gm-Message-State: AFqh2krrGI1DjgzJg++jZzcg4g2hjOGjGPtKCDtXnPNs8X/Ipvwx3Sn6
 QST5EM5YuXEgzGKwsuRtPguRjJyTcJQlExXV39+gsId+iEaqC3h8Q/4O8hQKylouZHPqRQp5viY
 tbKKchTqn0OZ0G8I=
X-Received: by 2002:a05:6214:8ce:b0:520:e57b:191d with SMTP id
 da14-20020a05621408ce00b00520e57b191dmr2622821qvb.15.1671577852721; 
 Tue, 20 Dec 2022 15:10:52 -0800 (PST)
X-Received: by 2002:a05:6214:8ce:b0:520:e57b:191d with SMTP id
 da14-20020a05621408ce00b00520e57b191dmr2622792qvb.15.1671577852465; 
 Tue, 20 Dec 2022 15:10:52 -0800 (PST)
Received: from redhat.com ([37.19.199.117]) by smtp.gmail.com with ESMTPSA id
 n17-20020a05620a223100b006fc40dafaa2sm9307749qkh.8.2022.12.20.15.10.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Dec 2022 15:10:52 -0800 (PST)
Date: Tue, 20 Dec 2022 18:10:45 -0500
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
Message-ID: <20221220181024-mutt-send-email-mst@kernel.org>
References: <20221120150550.63059-1-shentey@gmail.com>
 <17a7d714-8a1e-8a17-f657-2172060d02e5@linaro.org>
 <3F5A5F52-5815-4CB2-9DE8-894D59B0EB8C@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <3F5A5F52-5815-4CB2-9DE8-894D59B0EB8C@gmail.com>
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: J1Uqh9ohkvnd

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

To clarify, you want this dropped for now?

-- 
MST

