Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09880CA0FFD
	for <qemu-arm@archiver.kernel.org>; Mon,  1 Sep 2025 12:06:31 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1ut3I4-00036t-AJ; Mon, 01 Sep 2025 08:05:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1ut3I2-00035k-1K
 for qemu-arm@nongnu.org; Mon, 01 Sep 2025 08:05:38 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1ut3Hs-0005L7-7B
 for qemu-arm@nongnu.org; Mon, 01 Sep 2025 08:05:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1756728321;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=CtjrNjm9P4VLKQJHvgWNakCdJEbbGz3VqKCLMX+JkAc=;
 b=Tyu0AxiKLa5UIq2Qgnu/Z5tu9J0xtJhfdN+VEUWX7ZK1JJqFBQqNsvU+XMtVp1W67p3utY
 yKCuYAjMM9Ayecbfnudef3Fz4mOZOvmYEtO05NchBz6lSm6fEWbOUuhjywHRgeoVVtSlDA
 qqSNsfFdjmgYpqKrwf5or4GA3PKsUqg=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-60-6gtm7PFBNwaNqYOMdUxiBA-1; Mon, 01 Sep 2025 08:05:19 -0400
X-MC-Unique: 6gtm7PFBNwaNqYOMdUxiBA-1
X-Mimecast-MFC-AGG-ID: 6gtm7PFBNwaNqYOMdUxiBA_1756728319
Received: by mail-qk1-f199.google.com with SMTP id
 af79cd13be357-7e870317642so870797385a.0
 for <qemu-arm@nongnu.org>; Mon, 01 Sep 2025 05:05:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756728319; x=1757333119;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=C92Jb1vPx6AsO3XUCz+MmXZ+Q5EFx3phYwlyl4ZRlic=;
 b=hEYPu+Nqw7ug70Dgwed0WYj+N6mfICfmp/JKXyDQfKU/QzRCdNwcP+l/8Zi82VQTuk
 a3wFq659E67hsoVUJnXbKVVFRCROxbqa1xjgPV5woq2kml0gMzR6TgjKUggGZ6LxDuq3
 K5GExQKDIoZucVKbIeh0MF8NHHWjl9RCKFftewIA4a0MurreRw6aktn82/Ijwp6zmdSd
 HmpXB1DmURS6Equ81hrIU1rB0cOYZAMLJtxzwJtbN2LIpq7YmQsLtcX81yNbJ9njpTwz
 ueyTyBRY5+ulvF+7sXrMRuCt0xQlA9UHQHVi2rt+mbOnSXPbwJ9WkLnpwdMaW8D5DRKA
 NOtQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVQ1MFBUPY5TZxbGXyfZ9dttEGw6FejjHiQNgVKpduBMq7HfgGCuz4tLOtcPuWxQSeAetkANlf2tA==@nongnu.org
X-Gm-Message-State: AOJu0Yy7png+52iOUr1j1xwaWZsVzMR68/s9KVLl+s46XUXxf0Ey0W1S
 HBMY0LaOKPqS9mgCKOSzmLkj/un8NYcgNbZV4h9X382p8R/S4L03WKdQpaaXsI1Dk4rX+HmEeql
 zEc/QKwZoxbZpr4ntUci7H8BANauvIZMOd04aDXAkPaVNebGw11DJ7g==
X-Gm-Gg: ASbGncvweVGtt98IJ5PzYPEoaWu55CINwy5meWvarneJEvZKTiYnEplUuGTnMN/7weO
 AGm46ZVF6otu37gmk5MONNx7lNXuVciMzf7oitpsEsYfkzRM2036RH5GVQPte7HqPNCg2jEa8At
 HfeRJrGHTPqcvFk6Xc6+M/pHiLgGEcendmfGX+vIwKia0FK/e1EHhhyf6nKZOdpA4QfGCHPRDFw
 7x5nqDXHlC/dIoMGsYkuMh0/pPTgW9rhQcPxf3hCurN2COeI2kTrquNs0WLR3eEKlzGVeYHWoZh
 5RGKYC2kFBoVHRwNGw+8gFYLnGsfzQ==
X-Received: by 2002:a05:620a:6cc3:b0:7e8:1f79:67a2 with SMTP id
 af79cd13be357-7ff284b2c5fmr783426585a.34.1756728318909; 
 Mon, 01 Sep 2025 05:05:18 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHtBrtcXrGIJbqCN4Edb1D5QpCc4HBMbgnLBa9zENiXovXI79he47XgyPCvhKxRlfUIwsTbUw==
X-Received: by 2002:a05:620a:6cc3:b0:7e8:1f79:67a2 with SMTP id
 af79cd13be357-7ff284b2c5fmr783417285a.34.1756728318190; 
 Mon, 01 Sep 2025 05:05:18 -0700 (PDT)
Received: from fedora ([85.93.96.130]) by smtp.gmail.com with ESMTPSA id
 af79cd13be357-7fc16536012sm651323685a.66.2025.09.01.05.05.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Sep 2025 05:05:17 -0700 (PDT)
Date: Mon, 1 Sep 2025 14:05:10 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: Zhao Liu <zhao1.liu@intel.com>, qemu-devel@nongnu.org,
 peterx@redhat.com, mst@redhat.com, mtosatti@redhat.com,
 richard.henderson@linaro.org, riku.voipio@iki.fi, thuth@redhat.com,
 pasic@linux.ibm.com, borntraeger@linux.ibm.com, david@redhat.com,
 jjherne@linux.ibm.com, shorne@gmail.com, eduardo@habkost.net,
 marcel.apfelbaum@gmail.com, philmd@linaro.org, wangyanan55@huawei.com,
 peter.maydell@linaro.org, agraf@csgraf.de, mads@ynddal.dk,
 mrolnik@gmail.com, deller@gmx.de, dirty@apple.com, rbolshakov@ddn.com,
 phil@philjordan.eu, reinoud@netbsd.org, sunilmut@microsoft.com,
 gaosong@loongson.cn, laurent@vivier.eu, edgar.iglesias@gmail.com,
 aurelien@aurel32.net, jiaxun.yang@flygoat.com, arikalo@gmail.com,
 chenhuacai@kernel.org, npiggin@gmail.com, rathc@linux.ibm.com,
 harshpb@linux.ibm.com, yoshinori.sato@nifty.com, iii@linux.ibm.com,
 mark.cave-ayland@ilande.co.uk, atar4qemu@gmail.com, qemu-s390x@nongnu.org,
 qemu-arm@nongnu.org, qemu-ppc@nongnu.org
Subject: Re: [PATCH v5 6/8] add cpu_test_interrupt()/cpu_set_interrupt()
 helpers and use them tree wide
Message-ID: <20250901140510.2925ac85@fedora>
In-Reply-To: <CABgObfb6Hs8EOeLQeG_S=Y8j8dj6A9fAMn0DzSSVKZYBG_rP-g@mail.gmail.com>
References: <20250814160600.2327672-7-imammedo@redhat.com>
 <20250821155603.2422553-1-imammedo@redhat.com>
 <aKyBFlCtnxnP9kt/@intel.com> <20250825171912.1bc7b841@fedora>
 <aK1mHGan+n9NSAOk@intel.com> <20250826104731.1440e3ed@fedora>
 <33661ea1-b0aa-45b3-8923-0b47a40dcea8@redhat.com>
 <CABgObfb6Hs8EOeLQeG_S=Y8j8dj6A9fAMn0DzSSVKZYBG_rP-g@mail.gmail.com>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: wtrQcvnkakxkJP9hqTQ_5HRMWSmSYiFOBAlP_Bckaw0_1756728319
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On Fri, 29 Aug 2025 14:33:57 +0200
Paolo Bonzini <pbonzini@redhat.com> wrote:

> On Fri, Aug 29, 2025 at 10:18=E2=80=AFAM Paolo Bonzini <pbonzini@redhat.c=
om> wrote:
> >
> > On 8/26/25 10:47, Igor Mammedov wrote: =20
> > > While overhead might be issue, it's better to have correcteness 1st.
> > > (that's why blanket tree wide change to make sure we don't miss place=
s that
> > > set/test interrupts). =20
> >
> > Looking more at it, I found at least one place that sets interrupts
> > without bql:
> >
> >      if (ctl_has_irq(env)) {
> >          cpu_set_interrupt(cs, CPU_INTERRUPT_VIRQ);
> >      }
> >
> > I'm going to squash this in: =20
>=20
> Rethinking about it - this can be a separate patch that also affects
> cpu_reset_interrupt(), as well as all cases where
> cpu_reset_interrupt() is open coded.

I can take care of replacing open coded cpu_reset_interrupt() cases
(I've already looked through them, while answering reviewers questions)

>=20
> Paolo
>=20
> > diff --git a/include/hw/core/cpu.h b/include/hw/core/cpu.h
> > index 1dee9d4c76e..5c3397fe108 100644
> > --- a/include/hw/core/cpu.h
> > +++ b/include/hw/core/cpu.h
> > @@ -959,12 +959,13 @@ static inline bool cpu_test_interrupt(CPUState *c=
pu, int mask)
> >    * @cpu: The CPU to set pending interrupt(s) on.
> >    * @mask: The interrupts to set.
> >    *
> > - * Sets interrupts in @mask as pending on @cpu.
> > + * Sets interrupts in @mask as pending on @cpu.  Unlike @cpu_interrupt=
,
> > + * this does not kick the vCPU.
> >    */
> >   static inline void cpu_set_interrupt(CPUState *cpu, int mask)
> >   {
> > -    qatomic_store_release(&cpu->interrupt_request,
> > -        cpu->interrupt_request | mask);
> > +    /* Pairs with cpu_test_interrupt(). */
> > +    qatomic_or(&cpu->interrupt_request, mask);
> >   }
> >
> >   /**
> > =20
>=20


