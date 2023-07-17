Received: by 2002:a17:906:1917:b0:98d:b2f5:1316 with SMTP id a23csp5742702eje;
        Mon, 17 Jul 2023 07:33:44 -0700 (PDT)
X-Google-Smtp-Source: APBJJlFlJe3p6Molym5PkxS7n+JJTwiuyENvac5s0LonqaDVUL0WzIRvqAtAxWBkv+47mFpcDsJE
X-Received: by 2002:a05:620a:390f:b0:765:ac1b:9218 with SMTP id qr15-20020a05620a390f00b00765ac1b9218mr10295432qkn.22.1689604423834;
        Mon, 17 Jul 2023 07:33:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1689604423; cv=none;
        d=google.com; s=arc-20160816;
        b=CDBm04XdcL5VqxNzSy5QzDcljl2/ALYBOi1Gyv0Z8Lh7tuKapTNq0K1xDT7ajOFWrr
         TMKQhH1PQK5/lk1JdZp9OdfijAiBslF0+RaEj2jmC60XsISPeXvjhiYVbYvfKFNlQLhw
         lZ8VwnOaS2BU8iurQe3JvXEFPjkBZXlGqAYWhZe4sIBEGa4V95kUdJSiMy3K5NP1ka1z
         WYcRUGw52vfIJL0/TI/yBx/zECwsNg0HEk/2G/Ny0eIw7atN8VRZ/W7IRUQcVAUxFV1C
         478LiJin7hrSMgDIHsKgOuDgPGCKvS9CJumpuoTAuLLo0lIMSF2FiEDr5ICDOwu6IzLD
         TSIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:subject:cc:to:from
         :date:dkim-signature;
        bh=vNCpJAmwgrPSeDRQexGz0QIWYNoG0DOP3OmWchGGEnA=;
        fh=PTjazQW9+EFdxyzc2cewT1OGb0WFYDr6H/kuXQBPDlg=;
        b=mZf3WW67fC2PHsgUVu556k/WTAd1Le7J4ucoL1Hvha0O9cA+RSv1xMUfbIAEEmuRBo
         k6kVKETgPkAVJQI0OxC10e8yt/O7WpEv63mUSREedjDbkHawPMjtN7YFC3im9kUlEigk
         5q22WxPifExTsPepCUrBsPsZWDYeMID49qINoJImtlK2T6Gu49j/nfIvaiU+eVZk+IRQ
         sEJUIalXsRvWjdCp9slxdCGfpcmrJ+GIGbRov9lzfkSzAXeVsQbVDgj71qdr8Mpk/Xro
         UdIcVLp2AsMOBHXsBaAxm62b3pEJN0MRoGJDDztXKToCD3ea4LTuImzKRl1t8Je78ORm
         XjtQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=jWkYvy1Q;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w12-20020a05620a444c00b0075f02d4d67fsi8413760qkp.212.2023.07.17.07.33.43
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 17 Jul 2023 07:33:43 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=jWkYvy1Q;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qLPHk-0003DC-PU; Mon, 17 Jul 2023 10:33:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1qLPHi-0003Cz-ME
 for qemu-arm@nongnu.org; Mon, 17 Jul 2023 10:33:10 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1qLPHg-0006OF-7e
 for qemu-arm@nongnu.org; Mon, 17 Jul 2023 10:33:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1689604387;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vNCpJAmwgrPSeDRQexGz0QIWYNoG0DOP3OmWchGGEnA=;
 b=jWkYvy1QBa11eOa/kgyEJXeCnWB4ivQhshIBEFWF1dG+f6w4nVakNhCzsvKHhorSycGyF3
 fXTjHMtUwj3NdfMsj8qSAdWTY6pTIi9v6sCftqsKsHkkPHlMYedgJZNikra0GQcAS46NQm
 6EN5rgc4OKgV4EY8aS8Vv04D6sMGfoc=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-235-bShyrjvHO9WfsWtfJQvhFA-1; Mon, 17 Jul 2023 10:33:05 -0400
X-MC-Unique: bShyrjvHO9WfsWtfJQvhFA-1
Received: by mail-ed1-f69.google.com with SMTP id
 4fb4d7f45d1cf-50a16ab50e6so2692639a12.0
 for <qemu-arm@nongnu.org>; Mon, 17 Jul 2023 07:33:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689604384; x=1692196384;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=vNCpJAmwgrPSeDRQexGz0QIWYNoG0DOP3OmWchGGEnA=;
 b=d0zO7B2gMXKA6N4XFS6Vka2uJlR1BDq8nJ7MBIHP4rA1m1jokec8j8QjxM5gE3LHdi
 XPx6kY6kDdChPlB1wqbZgBnojA+HGJgFPvePE4zxuwS6xePiDrriMMrXOhlr+xOQJaGg
 i+08p7xmUMgFgxnF+lvVBzEH9tyXwcpzIn8RnpCcPv5ZebHRtHuOciIOy+Mig+wK77Pi
 GybasDxoHMF0gNS7apmQgAzTy8VjGb02IWbAjTLg+RulIPOb4yowp0gyxLUe9OcmnE3D
 7mFM01QlLqS+mSJNH+siyLKgU9WrqJSf+8ih/qkTJuD61JMNyuuVTp97FqV/Q+zQusqc
 kUPg==
X-Gm-Message-State: ABy/qLYsBuu4ofD6gIgsfYrnnonBfgrFrf0YcpoOJ7R8IYHUBYw4j693
 mKHTc7wc/dElMuc0gQBlDSAevFoeBtyhhJLN9QnP3p2HEneKHG2I/nG/EF5X+bY85ThCMZ1pxzu
 03GR1xQZ2yekD9ZmONudP
X-Received: by 2002:aa7:ce0c:0:b0:51e:26a3:1bad with SMTP id
 d12-20020aa7ce0c000000b0051e26a31badmr12841559edv.16.1689604384086; 
 Mon, 17 Jul 2023 07:33:04 -0700 (PDT)
X-Received: by 2002:aa7:ce0c:0:b0:51e:26a3:1bad with SMTP id
 d12-20020aa7ce0c000000b0051e26a31badmr12841543edv.16.1689604383785; 
 Mon, 17 Jul 2023 07:33:03 -0700 (PDT)
Received: from imammedo.users.ipa.redhat.com (nat-pool-brq-t.redhat.com.
 [213.175.37.10]) by smtp.gmail.com with ESMTPSA id
 c21-20020aa7c995000000b0051d9de03516sm10003256edt.52.2023.07.17.07.33.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Jul 2023 07:33:03 -0700 (PDT)
Date: Mon, 17 Jul 2023 16:33:02 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Joelle van Dyne <j@getutm.app>
Cc: Stefan Berger <stefanb@linux.ibm.com>, qemu-devel@nongnu.org, Stefan
 Berger <stefanb@linux.vnet.ibm.com>, Juan Quintela <quintela@redhat.com>,
 qemu-arm@nongnu.org
Subject: Re: [PATCH v2 11/11] tpm_crb: support restoring older vmstate
Message-ID: <20230717163302.1458a9bc@imammedo.users.ipa.redhat.com>
In-Reply-To: <CA+E+eSC_Hg5zxepaeCZTNiYS8oq6hNUqO8Pijft45O7vhD2q6Q@mail.gmail.com>
References: <20230714070931.23476-1-j@getutm.app>
 <20230714070931.23476-12-j@getutm.app>
 <581b037d-ccb7-8df7-8946-df8198cb04e6@linux.ibm.com>
 <fe8ea892-0690-2308-5036-f31e10da0351@linux.ibm.com>
 <CA+E+eSCC2F-2bsO7OiCoS0weo7bh4daL7M5GYxa=6r-6qKcGmg@mail.gmail.com>
 <67a2b78d-8eea-7c9c-cf1b-50444e481006@linux.ibm.com>
 <562ec838-2714-2bb2-d1a5-7b98bb43a60b@linux.ibm.com>
 <CA+E+eSC_Hg5zxepaeCZTNiYS8oq6hNUqO8Pijft45O7vhD2q6Q@mail.gmail.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
X-TUID: Ff6BxwOEtEFP

On Fri, 14 Jul 2023 11:49:03 -0700
Joelle van Dyne <j@getutm.app> wrote:

> On Fri, Jul 14, 2023 at 11:41=E2=80=AFAM Stefan Berger <stefanb@linux.ibm=
.com> wrote:
> >
> >
> >
> > On 7/14/23 14:22, Stefan Berger wrote: =20
> > > On 7/14/23 13:04, Joelle van Dyne wrote: =20
> > >> On Fri, Jul 14, 2023 at 7:51=E2=80=AFAM Stefan Berger <stefanb@linux=
.ibm.com> wrote: =20
> > >>>
> > >>>
> > >>>
> > >>> On 7/14/23 10:05, Stefan Berger wrote: =20
> > >>>>
> > >>>>
> > >>>> On 7/14/23 03:09, Joelle van Dyne wrote: =20
> > >>>>> When we moved to a single mapping and modified TPM CRB's VMState,=
 it
> > >>>>> broke restoring of VMs that were saved on an older version. This
> > >>>>> change allows those VMs to gracefully migrate to the new memory
> > >>>>> mapping. =20
> > >>>>
> > >>>> Thanks. This has to be in 4/11 though.
> > >>>> =20
> > >>>
> > >>> After applying the whole series and trying to resume state taken wi=
th current git
> > >>> master I cannot restore it but it leads to this error here. I would=
 just leave it
> > >>> completely untouched in 4/11.
> > >>>
> > >>> 2023-07-14T14:46:34.547550Z qemu-system-x86_64: Unknown ramblock "t=
pm-crb-cmd", cannot accept migration
> > >>> 2023-07-14T14:46:34.547799Z qemu-system-x86_64: error while loading=
 state for instance 0x0 of device 'ram'
> > >>> 2023-07-14T14:46:34.547835Z qemu-system-x86_64: load of migration f=
ailed: Invalid argument
> > >>>
> > >>>      Stefan =20
> > >>
> > >> To be clear, you are asking to back out of 4/11? That patch changes
> > >> how the registers are mapped so it's impossible to support the old
> > >> style register mapping. This patch attempts to fix that with a =20
> > >
> > > Why can we not keep the old style register mapping as 'secondary mapp=
ing'? =20
> >
> > I think the first goal should be for existing TPM CRB device not to cha=
nge anything, they
> > keep their .read and .write behaivor as it.
> >
> > If you need different .read behavior for the sysbus device due to AARCH=
64 then it may want to use its own MemoryRegionOps.
> >
> > I am fairly sure that you could refactor the core of the existing tpm_c=
rb_mmio_write() and have it work on s->regs and mmio regs.
> > The former would be used by existing code, the latter for CRB sysbus ca=
lling into this new function from a wrapper.
> >
> >     Stefan =20
>=20
> I agree that new QEMU should be able to read old QEMU state but vice
> versa is not always true. There's been many changes in the past that
> incremented the vmstate's version_id to indicate that the state format
> has changed. Also, we are not changing the .read behavior because in
> the old code, the only field that gets a dynamic update is
> tpmEstablished which we found is never changed. So effectively, .read
> is just doing a memcpy of the `regs` state. This makes it possible to
> map the page as memory while retaining the same behavior as before.
> (We are changing the code but not the behavior).
>=20
> The issue with Windows's buggy tpm.sys driver is that fundamentally it
> cannot work with MemoryRegionOps. The way MMIO is implemented is that
> a hole is left in the guest memory space so when the device registers
> are accessed, the hypervisor traps it and sends it over to QEMU to
> handle. QEMU looks up the address, sees its a valid MMIO mapping, and
> calls into the MemoryRegionOps implementation. When tpm.sys does a LDP
> instruction access to the hole, the information for QEMU to determine
> if it's a valid access is not provided. Other hypervisors like Apple's
> VZ.framework and VMware will read the guest PC, manually decode the
> AArch64 instruction, determine the type of access, read the guest Rn
> registers, does a TLB lookup to determine the physical address, then
> emulate the MMIO. None of this capability currently exists in QEMU's
> ARM64 backend. That's why we decided the easier path is to tell QEMU
> that this mapping is RAM for read purposes and MMIO only for write
> purposes (thankfully Windows does not do a STP or we'd be hosed).

CCing migration and ARM folks for more exposure

