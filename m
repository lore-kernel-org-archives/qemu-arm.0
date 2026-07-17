Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67B56C4451B
	for <qemu-arm@archiver.kernel.org>; Fri, 17 Jul 2026 13:56:09 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wkj2s-0000p4-92; Fri, 17 Jul 2026 09:56:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1wkj2o-0000iR-Uj
 for qemu-arm@nongnu.org; Fri, 17 Jul 2026 09:56:04 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1wkj2n-00031B-Ku
 for qemu-arm@nongnu.org; Fri, 17 Jul 2026 09:56:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1784296561;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=gkJPRonxFAdLMfRYaeucxbkp4HT737Jnx3N5/XSgThw=;
 b=gxuwcIfQ7NQ3Y/TCQ/iaVs0WKPEkbXPag2qF8x4kY9lW/AdvmOkSUttwWfB++1d9gYdJHl
 NJslbr2xPJ124CYjN/UDHBqvvjxJlMtSZYpfOiems24hE8lS1h4gUKcTDlmMwB23CvpgrW
 yUUpHZDED7PjN14w3NsCO/oyTrqF1Ps=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-569-KyyCYVfcNcqC4bqZkEfIDg-1; Fri, 17 Jul 2026 09:55:40 -0400
X-MC-Unique: KyyCYVfcNcqC4bqZkEfIDg-1
X-Mimecast-MFC-AGG-ID: KyyCYVfcNcqC4bqZkEfIDg_1784296539
Received: by mail-wr1-f72.google.com with SMTP id
 ffacd0b85a97d-4767036f8faso4994516f8f.3
 for <qemu-arm@nongnu.org>; Fri, 17 Jul 2026 06:55:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1784296539; x=1784901339;
 h=in-reply-to:content-disposition:content-type:mime-version
 :references:message-id:subject:cc:to:from:date:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=gkJPRonxFAdLMfRYaeucxbkp4HT737Jnx3N5/XSgThw=;
 b=LVSvjgYu2epkUn6KB9mdv+5LvbpUJEDPvLdIJ1lv35dphbcFIe5YxqXzMniKBXMUVT
 gsOYe8lAAJrP1QdA1uvMFzFm4YdT8T5wqVLrbaIVPu6uW4IMIVAMmr75bti90U76YcIL
 pWzVineiNIsX21i7QOZzzTgDPyo3UMEMHjZkZ5sCE9YweV574G3zEqSQCfo8XgFhLUwy
 aKiqhG7WchbOIz6HPHxOYOjIaqWUCzW0Z9lmfgINV2J0J8ZhuEFSW51uuJk1wtzvzyF2
 kKC0HDmNdQO+o8w7A6veOCK+WKr03kXEHYdp7p+M+bbwz6dpa3FnTQH8hYBYzrluj9KH
 diYQ==
X-Forwarded-Encrypted: i=1;
 AHgh+RoDm3eW/rTNKVZRxnBD/zB5Ybc2USFJfFj4H8vxTHHZSbOCYjHpTmdzrMA8hLKN4u6F+1suvmOgWQ==@nongnu.org
X-Gm-Message-State: AOJu0YydqorHWyVwuoV1Oxc73JvnMvhupywZkRPKN7s/8DZGaijKTCKp
 ozjWnsO1SmQ9qR3f69vxuLHakoEGjK5vAooLmXw/TUDAe206PEjPDjv3NfyhvraF2rWg2usC97f
 MknnkBCcBO8PhsbZ56UYW8GsStq9u71LQS9f7QAfcUXiNvNke+VeHsg==
X-Gm-Gg: AfdE7cm8bnnYoK0Dt14Qqx7levhIuoWiXyt9GlOpCtuJ+hF1xkqi0dJen7dEy3f0bMA
 UJiru45KmFx7nfjCjv9CYquBfz8C+93W3SkNVQbuuwKWt+oh2QfdDZJdfSuBw7E6ErDBAGt2vEX
 tgOODqshmZfRTPS1TtRxDv+gidBt54sTA1LWO1m6tbRDQlA52ASf7pmYKLsSF83hI3/UgfHnSpB
 Q73+7lVvQky7966o6CYqOjtpoPf0OW/YtpBUwu2eLQCsThmUWt1L9hwGrokyRAY8LamRMni19C9
 YCt9yFO80rRb2WxHW370lQlaIskI+pEC7srtk8+unQpOD9w2H4lulzVLKlTFR/fv3gUW69c+eVI
 RINC21YcaBaTWBCRtjcFQn79D
X-Received: by 2002:a05:6000:41d3:b0:47d:e547:8965 with SMTP id
 ffacd0b85a97d-47f6233fbe9mr3585467f8f.58.1784296539118; 
 Fri, 17 Jul 2026 06:55:39 -0700 (PDT)
X-Received: by 2002:a05:6000:41d3:b0:47d:e547:8965 with SMTP id
 ffacd0b85a97d-47f6233fbe9mr3585403f8f.58.1784296538470; 
 Fri, 17 Jul 2026 06:55:38 -0700 (PDT)
Received: from redhat.com (IGLD-80-230-24-117.inter.net.il. [80.230.24.117])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-47f63ed1911sm4114351f8f.22.2026.07.17.06.55.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Jul 2026 06:55:37 -0700 (PDT)
Date: Fri, 17 Jul 2026 09:55:34 -0400
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
Message-ID: <20260717095407-mutt-send-email-mst@kernel.org>
References: <20260625091334-mutt-send-email-mst@kernel.org>
 <CAFEAcA8xK+t3-prEphtkq-o9UY2mgS6cowhs880GOaxL9dKSGw@mail.gmail.com>
 <20260625101817-mutt-send-email-mst@kernel.org>
 <CAFEAcA8-Un+Q1yBDqLWCLPRwtgTA_VhJqGobgZChrFhAeVfG8A@mail.gmail.com>
 <20260625123119-mutt-send-email-mst@kernel.org>
 <CAFEAcA8UjtXgmPC27fOKMwbaWs2piwGYudtwCNWQHuu3E_7A-A@mail.gmail.com>
 <5faf04b9-d596-4a1d-9fe3-5e9ad5f0a99a@redhat.com>
 <73f79841-8cc7-4ca6-8f6b-fb97b53a6fe8@redhat.com>
 <20260717091756-mutt-send-email-mst@kernel.org>
 <CAFEAcA-O6Z4JrVV0DL_tta6khRyUta_Zz5mJt6OszaW1mu0o6Q@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAFEAcA-O6Z4JrVV0DL_tta6khRyUta_Zz5mJt6OszaW1mu0o6Q@mail.gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: Ur8LXOsxDsanuHYEDKWpa_GO5QbK0KNlTvKHvONZ_70_1784296539
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: permerror client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.01, SPF_HELO_PASS=-0.001,
 T_SPF_PERMERROR=0.01 autolearn=unavailable autolearn_force=no
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

On Fri, Jul 17, 2026 at 02:49:53PM +0100, Peter Maydell wrote:
> On Fri, 17 Jul 2026 at 14:24, Michael S. Tsirkin <mst@redhat.com> wrote:
> >
> > On Thu, Jul 09, 2026 at 07:52:12PM +1000, Gavin Shan wrote:
> > > Hi Michael and Peter,
> 
> > >
> > > Could you help to confirm if the conclusion is to have unified qemu_ram_{copy, move}()
> > > for all architectures? In qemu_ram_{copy, move}(), the fixed sized accesses like
> > > 1/2/4/8 bytes are handled by __builtin_{memcpy, memmove}() and fall back to
> > > memcpy/memmove() for other sized accesses. It's basically what was proposed by
> > > Michael :-)
> >
> > No. __builtin_ and  memcpy/memmove are same on modern linuxes.
> >
> > I'd say as a 1st step, on x86 hosts we can do a fixed size
> > memmove for 1/2/4/8, on other hosts
> > *aligned* 1/2/4/8 bytes can do
> >  __atomic_store ... __ATOMIC_RELAXED
> > and the rest can hobble along on memmove
> > and hope for the best.
> 
> I don't think we should be doing something that's x86-host specific,
> as I've mentioned previously.
> 
> -- PMM

Shrug. Of course we already have arch specific code in asm.
But we can make the unaligned 1/2/4/8 for x86 host a separate
optimization on top. They are unlikely to be common.

-- 
MST


