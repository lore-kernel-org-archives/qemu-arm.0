Received: by 2002:a17:906:a84b:b0:7c1:2a22:dc39 with SMTP id dx11csp4928593ejb;
        Tue, 20 Dec 2022 22:33:46 -0800 (PST)
X-Google-Smtp-Source: AMrXdXt6TVJ7RCS5/HRXFf2seFomCFON0aGP7cVZlrAb1649BNHcvAaTh7EkzTgq7hRIjB7ULuls
X-Received: by 2002:a05:6214:1fd8:b0:51f:3ce9:3911 with SMTP id jh24-20020a0562141fd800b0051f3ce93911mr1121752qvb.26.1671604426327;
        Tue, 20 Dec 2022 22:33:46 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1671604426; cv=none;
        d=google.com; s=arc-20160816;
        b=gAQEcL6UsRVj4BzthExcz8dVR63lzpfr7KSq9saGyRP5TBg596/B0l9FsjryVrpvs2
         Aef1lhFoT6G8meHWguCfrbve8a/Fp+YHZiAs97BP1GUodx+mJHFOV8bK9VPpwoNTpZql
         J3BYUgsEIr4M+fwByaisJmApKFliD5GvYyjMNhqjgwZ3C9c9zbALcvqfQ2atwf9Puy/2
         XNcXr+HBdtgZri7CrIDYFMbhAE2kn1EtKp7Azvk9m/dUFExEMiUqPt/Awu9GcHST1BWY
         F+61icD9ElO030nb0v0JNNwUFvoUyTglvLXf0pFNgKEq89oL8UU5rNJ1bE5BDL/nqs17
         bHvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-disposition:in-reply-to:mime-version:references:message-id
         :subject:cc:to:from:date:dkim-signature;
        bh=TOtYSI9j1IXqesYdn2lI0JZEo5L715hj/lcpEeX6tfc=;
        b=ACJI5ySDOhI4OzqvZmNN8YxRpSRkKuKds9xAO+pBQIzllm/NZ9u+hNSuiKGiL5ubFG
         RzctQ+naJG6hS1YLU1z6qECJ/PFCYof6p4kkeVBzERukQ9nldMK/QgbmxW2RUwDg+sJ9
         AINjTYJlB5m9jsvCSVFpvB/7iXXm+esx7FoJTolAzCKel7VZehRRO3m1YBHC3+oeUdSu
         znwCONwPCbmRGpa58Y+6QT3pL7791V+DXC63qlgcmeAjbNppAnREOpiR/miFjSsFIRNM
         p623J75h8782tDCqddzASkv86ImHI6LLO+ZP9pVXT9PHqwissDaQdLgIBi9luvBAgwo3
         vyUg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=HC3mEpQr;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 127-20020a370a85000000b006fa26d80788si5879247qkk.5.2022.12.20.22.33.46
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 20 Dec 2022 22:33:46 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=HC3mEpQr;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1p7sfV-00038q-9t; Wed, 21 Dec 2022 01:33:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1p7sfU-00038Y-AT
 for qemu-arm@nongnu.org; Wed, 21 Dec 2022 01:33:32 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1p7sfS-0001LQ-Ro
 for qemu-arm@nongnu.org; Wed, 21 Dec 2022 01:33:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1671604410;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=TOtYSI9j1IXqesYdn2lI0JZEo5L715hj/lcpEeX6tfc=;
 b=HC3mEpQrUuyO1uAF6d5BFATH1RiTaEd6yUHdHClig9RlWfTkwY0/hnAtTycJ8FuVbZR3/G
 kDqzbIj93gOkWP9YSkxT169ITdVXC1EArLaKNInOmFvwyOaK+DvGcqZo+XIMulk0CroPdJ
 JCEYNs5BZ32UW9HS6Zr+SffoBny6VSw=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-25-MxvFHGboOwSP7ey1P88uCQ-1; Wed, 21 Dec 2022 01:33:29 -0500
X-MC-Unique: MxvFHGboOwSP7ey1P88uCQ-1
Received: by mail-qk1-f200.google.com with SMTP id
 l16-20020a05620a28d000b00704af700820so256234qkp.5
 for <qemu-arm@nongnu.org>; Tue, 20 Dec 2022 22:33:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=TOtYSI9j1IXqesYdn2lI0JZEo5L715hj/lcpEeX6tfc=;
 b=OFb3iueg9JJedORBeSNHiB06HvT21muIvTKT9cbj6IN5GsV3165xgN9KC2Q2CiFbIC
 nTqTWkSUZAcqT0xMTmRKsDQ+UaexYnpBecfxMv4iCuiCb4CDtwYJqskUBt/2fYJikDHD
 T9fIHQo4m5rPTxNkjbJ+XBYp9S3PWeNuoK8Nd5RUizQmyt1Goxf5Nfw8YuK0Dfzs7iUQ
 yP5Q9+Dfd4QXZcbtdTjUXzZ1jLzDCi1dbl2fW9A78XKKdnpGzZIwhVZMUgyd0pcFQ9lc
 PxwhSG/DDriK0uHrw2r4U7JEswBH760dz+kBA8jYojWiQtfFACnEsLjOwQVYYqN7hTx8
 Lxyw==
X-Gm-Message-State: AFqh2kqd8maR2HvKRr3G+pt9QNFMyeKBIk66e3zbc1C52+R6z5FZhIQ4
 j+XcdpoPmnmOxGb4mZ9Nvi1XFuyr2YuFfOLAdxo0n9WWdi8L16NPJHFRgr58ZqitXnQCBst79/+
 3WOeGl+VZiMXn
X-Received: by 2002:a0c:8070:0:b0:512:3228:dc07 with SMTP id
 103-20020a0c8070000000b005123228dc07mr953165qva.22.1671604408492; 
 Tue, 20 Dec 2022 22:33:28 -0800 (PST)
X-Received: by 2002:a0c:8070:0:b0:512:3228:dc07 with SMTP id
 103-20020a0c8070000000b005123228dc07mr953145qva.22.1671604408219; 
 Tue, 20 Dec 2022 22:33:28 -0800 (PST)
Received: from redhat.com ([37.19.199.117]) by smtp.gmail.com with ESMTPSA id
 bn35-20020a05620a2ae300b006ce76811a07sm10149201qkb.75.2022.12.20.22.33.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Dec 2022 22:33:27 -0800 (PST)
Date: Wed, 21 Dec 2022 01:33:20 -0500
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
Message-ID: <20221221013309-mutt-send-email-mst@kernel.org>
References: <20221120150550.63059-1-shentey@gmail.com>
 <17a7d714-8a1e-8a17-f657-2172060d02e5@linaro.org>
 <3F5A5F52-5815-4CB2-9DE8-894D59B0EB8C@gmail.com>
 <20221220181024-mutt-send-email-mst@kernel.org>
 <B8EAD0D4-F86D-4FDB-A1B9-D4A1612CE40C@gmail.com>
MIME-Version: 1.0
In-Reply-To: <B8EAD0D4-F86D-4FDB-A1B9-D4A1612CE40C@gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
X-TUID: yBa3qfKavsCl

On Tue, Dec 20, 2022 at 11:26:42PM +0000, Bernhard Beschow wrote:
> 
> 
> Am 20. Dezember 2022 23:10:45 UTC schrieb "Michael S. Tsirkin" <mst@redhat.com>:
> >On Sun, Dec 18, 2022 at 10:21:49AM +0000, Bernhard Beschow wrote:
> >> 
> >> 
> >> Am 9. Dezember 2022 15:23:59 UTC schrieb "Philippe Mathieu-Daudé" <philmd@linaro.org>:
> >> >On 20/11/22 16:05, Bernhard Beschow wrote:
> >> >> v1:
> >> >> ===
> >> >> 
> >> >> During my PIIX consolidation work [1] I've noticed that both PIIX models have
> >> >> quite different pci_slot_get_pirq() implementations. These functions seem to
> >> >> map PCI INTx pins to input pins of a programmable interrupt router which is
> >> >> AFAIU board-specific. IOW, board-specific assumptions are baked into the device
> >> >> models which prevent e.g. the whole PIIX4 south bridge to be reusable in the PC
> >> >> machine.
> >> >> 
> >> >> This series first factors out pci_bus_map_irqs() from pci_bus_irqs() which
> >> >> then allowes for moving the two board-specific PIIX pci_slot_get_pirq()
> >> >> funtions into their respective boards. With these changes, the PIIX4 south
> >> >> bridge could eventually become an alternative to the PIIX3-Frankenstein
> >> >> solution in the PC machine.
> >> >
> >> >Series:
> >> >Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> >> 
> >> Ping
> >> 
> >> Who will pull this?
> >
> >To clarify, you want this dropped for now?
> 
> Yeah, let's merge via mips-next since this series is related to the PIIX consolidation series (see above) and mips-next is planned to be pulled soon.
> 
> Thanks,
> Bernhard


For that

Acked-by: Michael S. Tsirkin <mst@redhat.com>


