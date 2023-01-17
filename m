Received: by 2002:a17:907:c68a:b0:84d:2074:29bb with SMTP id ue10csp2586688ejc;
        Tue, 17 Jan 2023 09:54:29 -0800 (PST)
X-Google-Smtp-Source: AMrXdXtiq5heIE6R2D0tIDE+A9uXgCYbk/XWFo2tB5hDeir98Pz/D8RXONMahQzq0VJrQnS0RGlP
X-Received: by 2002:ac8:544e:0:b0:3b6:3406:81b6 with SMTP id d14-20020ac8544e000000b003b6340681b6mr9608133qtq.11.1673978068926;
        Tue, 17 Jan 2023 09:54:28 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1673978068; cv=none;
        d=google.com; s=arc-20160816;
        b=qxm7rqcuW0518rj5RlIFLUimQbVnj+5tgQ5KZRfz98GViSmyoOwiqDUyf4JIcaUrvF
         Gd77ZKSTvMTquRIQA6q3xIwwdLDX+nagNEOPObhoGOy+dTIS0RlSO/P6OlWJ2sJnRfuM
         VQv5RYcLQ7AFIr7PwPJEXv7JLxza2xJA+0b391ETa3zTNN/f9hURcMWKTuvd6oOBzkLe
         Jhp3yDJZV6dNV8BYUkjo37wSD4s7SezBK9XpIUTOcibgHu9r4Z/80pi9Y7oQE4j7rOTU
         5rxr64ftCIGEJI8R1dzF7lpk6BSnQ7YxCCEaaS+HWqKea3BzWbSDLLiq4ps/hKXxbZ5N
         bW5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-disposition:user-agent
         :in-reply-to:mime-version:references:message-id:subject:cc:to:from
         :date:dkim-signature;
        bh=OjgstlamuylfDiM6J62Gz76c1zI/KKwYNW5GH181734=;
        b=JMbX7n4IMnD6YAAYxFoCTyBPUvk2b9kcc93gECByRymlA6rdFVP8qmCxTVmQmFk9Lr
         w63L3/yXBX2JNmuo5FKAA7/MraIo0rQSXMOKDk41rVOpxJ4Gzxms7zTWGwXHwFMJtSaL
         VSoM+EUMOYwolVValMvvQx0hht43CHE/vRN/QWlmxdxbRgGMulMG3E9vqrbu86Hdsx/c
         JBdLcTV41hWdN/qDKHSD+tg2IRvLzEecNGZW2mBp+GZ6oVA26XP+Tq/QcFBnX2I63dJG
         L+iXJarPt2XslEApNpv+5o86RxGiHs7AsUDQOxBKMl5PVcBADK30CbG9SoEOSe0DDxMF
         EYOQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=C62oUPWP;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s11-20020ac8758b000000b003b6308532a8si3135279qtq.247.2023.01.17.09.54.28
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 17 Jan 2023 09:54:28 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=C62oUPWP;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pHq9x-0003KD-CO; Tue, 17 Jan 2023 12:54:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1pHq9w-0003K3-28
 for qemu-arm@nongnu.org; Tue, 17 Jan 2023 12:54:08 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1pHq9u-0005Br-2P
 for qemu-arm@nongnu.org; Tue, 17 Jan 2023 12:54:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1673978044;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=OjgstlamuylfDiM6J62Gz76c1zI/KKwYNW5GH181734=;
 b=C62oUPWPFqLUmY5HQfAMYhmGqWZIsv1DvmCxTLCPSVuAspYbPxK6X6I4CuNxSLsGjnomDO
 G/Q+KL739oNUFqpLZlbhiCWImQlLujUcm/j/yLVx+ztTboiJmYibokT3O3qIZCkmq8CQxE
 BYQngt4qcQgrCiUURuZ9py+SAJeOtJ8=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-472-vc5fF6fDPHWwzHpOkxE_oA-1; Tue, 17 Jan 2023 12:54:03 -0500
X-MC-Unique: vc5fF6fDPHWwzHpOkxE_oA-1
Received: by mail-wr1-f72.google.com with SMTP id
 t20-20020adfba54000000b002be0eb97f4fso1160861wrg.8
 for <qemu-arm@nongnu.org>; Tue, 17 Jan 2023 09:54:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=user-agent:in-reply-to:content-disposition:mime-version:references
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=OjgstlamuylfDiM6J62Gz76c1zI/KKwYNW5GH181734=;
 b=TLt+7NEcSO0Q9UAs0GMIbrZ2JOhvxkOR2lHInNgt9Izl6dnrnJyUWaIjlCF4f0e/Ha
 Y3itv0aAl9MiwevKltdWTUNJ+CpVimr0MI2mZDy7z7dz9G+7fADsoyoyMI5jnRCLSrBR
 c4p3Q9P0sfKn4E1DeF2wTANxykG4NpCX67UdhO/MHm0SNv8K1uZcDI1y5m+qyrVZtBge
 b7462w783Utf7pA2iEAazuw23aIUXUGZgmpLCzrCfPUYUBcRyFE6V8vFpd4VcRmzvtA/
 dH1hkbYull6fSXjXyLMVjAErpiu1VeowzT/Czz/cREYedwfSx5Cn62m7zHlDwPZ9pM22
 RYSQ==
X-Gm-Message-State: AFqh2kqZRKhunN6ME3wtWOtN3aNbRHP2vx7BEHSdYl2tSyvQ1zyn85hF
 T+ReEz2FLGC7SB7q+OPfVv0X7hdjVFHKO+Mdxcevw947PQDsn15p2Z5qXH+by9zCdKr9HtwCEnl
 2GrftJpO6g+wu
X-Received: by 2002:a05:600c:2281:b0:3da:c07:c5fe with SMTP id
 1-20020a05600c228100b003da0c07c5femr12579117wmf.5.1673978042178; 
 Tue, 17 Jan 2023 09:54:02 -0800 (PST)
X-Received: by 2002:a05:600c:2281:b0:3da:c07:c5fe with SMTP id
 1-20020a05600c228100b003da0c07c5femr12579100wmf.5.1673978041977; 
 Tue, 17 Jan 2023 09:54:01 -0800 (PST)
Received: from work-vm
 (ward-16-b2-v4wan-166627-cust863.vm18.cable.virginm.net. [81.97.203.96])
 by smtp.gmail.com with ESMTPSA id
 l6-20020a05600c4f0600b003db0b0cc2afsm2285976wmq.30.2023.01.17.09.54.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Jan 2023 09:54:01 -0800 (PST)
Date: Tue, 17 Jan 2023 17:53:59 +0000
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: Cornelia Huck <cohuck@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org, kvm@vger.kernel.org,
 Eric Auger <eauger@redhat.com>, Juan Quintela <quintela@redhat.com>,
 Gavin Shan <gshan@redhat.com>
Subject: Re: [PATCH v4 1/2] arm/kvm: add support for MTE
Message-ID: <Y8bgtwNjXn/icLX5@work-vm>
References: <20230111161317.52250-1-cohuck@redhat.com>
 <20230111161317.52250-2-cohuck@redhat.com>
 <CAFEAcA9BKX+fSEZZbziwTNq5wsshDajuxGZ_oByVZ=gDSYOn9g@mail.gmail.com>
 <Y8bR7xrsCMr5z6xI@work-vm>
 <CAFEAcA-rnb=fSW+ZiZkX7EAgTnmksr4Grow3P=UdQR1yhay4TQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAFEAcA-rnb=fSW+ZiZkX7EAgTnmksr4Grow3P=UdQR1yhay4TQ@mail.gmail.com>
User-Agent: Mutt/2.2.9 (2022-11-12)
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=dgilbert@redhat.com;
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
X-TUID: AgDeN6eiZWeF

* Peter Maydell (peter.maydell@linaro.org) wrote:
> On Tue, 17 Jan 2023 at 16:51, Dr. David Alan Gilbert
> <dgilbert@redhat.com> wrote:
> >
> > * Peter Maydell (peter.maydell@linaro.org) wrote:
> > > On Wed, 11 Jan 2023 at 16:13, Cornelia Huck <cohuck@redhat.com> wrote:
> > > > +MTE CPU Property
> > > > +================
> > > > +
> > > > +The ``mte`` property controls the Memory Tagging Extension. For TCG, it requires
> > > > +presence of tag memory (which can be turned on for the ``virt`` machine via
> > > > +``mte=on``). For KVM, it requires the ``KVM_CAP_ARM_MTE`` capability; until
> > > > +proper migration support is implemented, enabling MTE will install a migration
> > > > +blocker.
> > > > +
> > > > +If not specified explicitly via ``on`` or ``off``, MTE will be available
> > > > +according to the following rules:
> > > > +
> > > > +* When TCG is used, MTE will be available iff tag memory is available; i.e. it
> > > > +  preserves the behaviour prior to introduction of the feature.
> > > > +
> > > > +* When KVM is used, MTE will default to off, so that migration will not
> > > > +  unintentionally be blocked.
> > > > +
> > > > +* Other accelerators currently don't support MTE.
> > >
> > > Minor nits for the documentation:
> > > we should expand out "if and only if" -- not everybody recognizes
> > > "iff", especially if they're not native English speakers or not
> > > mathematicians.
> > >
> > > Should we write specifically that in a future QEMU version KVM
> > > might change to defaulting to "on if available" when migration
> > > support is implemented?
> >
> > Please make sure if you do something like that, that the failure
> > is obious; 'on if available' gets messy for things like libvirt
> > and higher level tools detecting features that are available and
> > machines they can migrate to.
> 
> If we have a plan for how this ought to work when we eventually
> implement migration support that's great and we should document
> it. My point is really "we should make sure we don't box ourselves
> into a set of defaults that we regret in the future, eg where
> TCG and KVM always have different defaults forever". If we don't
> have a plan for what the future is, then I'd rather we delayed
> adding MTE-without-migration-support until we've determined that
> plan.
> 
> Though the default for the CPU property is a bit moot, because
> at the machine level we only implement tag memory on the virt
> board, and there we disable it at the machine level (ie the
> machine property 'mte' defaults to 'false').

Oh, if you're disabling it at the machine level that's fine;
with versioned machine types the answer then is to turn it on
at the machine level when it all works, and that keeps the old
machine types with it off, and then VMs migrating with the old
machine type don't get confused.

(Having said that, there are always odd rules around CPU flags and
machine types and what libvirt thinks of them, but I'd ask a libvirt
person (jdenemar) for more details if needed).

Dave

> thanks
> -- PMM
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK

