Received: by 2002:ac2:5937:0:0:0:0:0 with SMTP id v23csp2501509lfi;
        Mon, 30 Mar 2020 02:14:04 -0700 (PDT)
X-Google-Smtp-Source: ADFU+vsWe1nR8NIz5aOyeuAmagZ7kBXtxRpj/Xf1FNGxSJ4OLbmVCD08ToXtiU0xzw9LGg3sYn7D
X-Received: by 2002:aca:5210:: with SMTP id g16mr3239473oib.174.1585559644017;
        Mon, 30 Mar 2020 02:14:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1585559644; cv=none;
        d=google.com; s=arc-20160816;
        b=ACMmrkWVqMQgKFIY2MmyDXHZz4h1sqUV9YB1Vt/L1DqP4EHWYCoIQxAGQ9h6BiqT5w
         lLbPBkDJUVbPIeOxRSgJf9sGomNorZj1R9wILLNpqHKXcdCsD2NkQlyHgVAteWbXRrGv
         i7F3Iy26vtDJ2RVJ9hXEcSFjVaneVSh0DKecAGy0eDcL4c6GZAHg9F15knWxnAJWLOVy
         2hj0y5M5wpAljuHe10145E8hpenBY7Y7OqgqCMOKpfT8t98z8WpcXuyyyqBoF6VGMxY5
         x9KLgRAUoqyckOt2pSLtpc9pwVoqlq7jbnu0OYm2rV8JVZMdlNS7o5Ou6mItW3/37Bml
         pssQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-id:precedence:sender:content-transfer-encoding:in-reply-to
         :content-disposition:mime-version:references:message-id:subject:cc
         :to:from:date:dkim-signature;
        bh=G3YtU9cQSu/MJLCZpAjz+jBQ87NL+MN25O2wNM+ILfI=;
        b=wRmgkSEb+4XVToQwIbPrdRoRUUrfM06L4CoMv18A0atAoLoBF6qk/hGtFY1N1jAiO0
         l9v1iXIl7RqioB/zNcV98AejyzrUxJ7DLWo2TF4eiSIQPBab04OQaih/RmGYs5OTa+ZP
         DcRfmbfWB2QKTQ2YoBV8q5wV5e7+vXK/qgcJBrBRieYYic7Z6CQ8nabWygEn7GqiGT2r
         hNy5L1rIGI6Q8SF/zg/z9Ur9YzM3jWu/v1umzlV9pnjLk+X2flLcsST6Q/IWLn/0WcK0
         LLdbGzxGn6QmKNYpvapA3MSV4PnygAj7r1BnIKn7NY1Xdon8zBAxqAxYonjX4PrWJ9hM
         iYeA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=WK4kMj6z;
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <kvm-owner@vger.kernel.org>
Received: from vger.kernel.org (vger.kernel.org. [209.132.180.67])
        by mx.google.com with ESMTP id c28si6710455otd.215.2020.03.30.02.14.03;
        Mon, 30 Mar 2020 02:14:04 -0700 (PDT)
Received-SPF: pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) client-ip=209.132.180.67;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=WK4kMj6z;
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728071AbgC3JOD (ORCPT <rfc822;naresh.kamboju@linaro.org>
        + 5 others); Mon, 30 Mar 2020 05:14:03 -0400
Received: from us-smtp-delivery-74.mimecast.com ([63.128.21.74]:32667 "EHLO
        us-smtp-delivery-74.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726385AbgC3JOC (ORCPT
        <rfc822;kvm@vger.kernel.org>); Mon, 30 Mar 2020 05:14:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1585559641;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=G3YtU9cQSu/MJLCZpAjz+jBQ87NL+MN25O2wNM+ILfI=;
        b=WK4kMj6zCr5+qw+2ycIG/TM/Bq/kM+FYz52zsCNfccygywmOvqf5aeYwASbj0Ej9ArJxtn
        eSHTlCXpME7zSjbw7+ns9/Ndu0RLPV7XMFS92E/4dHEVRREtyx3I+q1oA4uIGtJS0y4Bqb
        VFRWsqYHFhJc3WGE/11k7bhZ4EJYnT4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-174-htfeA-L7OCOCs7vXl5OVkQ-1; Mon, 30 Mar 2020 05:13:59 -0400
X-MC-Unique: htfeA-L7OCOCs7vXl5OVkQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 23080801A06;
        Mon, 30 Mar 2020 09:13:58 +0000 (UTC)
Received: from kamzik.brq.redhat.com (unknown [10.40.193.172])
        by smtp.corp.redhat.com (Postfix) with ESMTPS id C066D1036D00;
        Mon, 30 Mar 2020 09:13:51 +0000 (UTC)
Date:   Mon, 30 Mar 2020 11:13:48 +0200
From:   Andrew Jones <drjones@redhat.com>
To:     Auger Eric <eric.auger@redhat.com>
Cc:     Zenghui Yu <yuzenghui@huawei.com>, peter.maydell@linaro.org,
        kvm@vger.kernel.org, maz@kernel.org, qemu-devel@nongnu.org,
        qemu-arm@nongnu.org, andre.przywara@arm.com, thuth@redhat.com,
        alexandru.elisei@arm.com, kvmarm@lists.cs.columbia.edu,
        eric.auger.pro@gmail.com
Subject: Re: [kvm-unit-tests PATCH v7 08/13] arm/arm64: ITS: Device and
 collection Initialization
Message-ID: <20200330091348.izdzq5ekc47vg2y3@kamzik.brq.redhat.com>
References: <20200320092428.20880-1-eric.auger@redhat.com>
 <20200320092428.20880-9-eric.auger@redhat.com>
 <63f3d8aa-c1e3-f40f-32a1-fb6d22e70541@huawei.com>
 <c5ce7101-9ea3-8b04-7ec0-cb27dfbdc116@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
In-Reply-To: <c5ce7101-9ea3-8b04-7ec0-cb27dfbdc116@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Content-Transfer-Encoding: quoted-printable
Sender: kvm-owner@vger.kernel.org
Precedence: bulk
List-ID: <kvm.vger.kernel.org>
X-Mailing-List: kvm@vger.kernel.org
X-TUID: ARQQX9eZh2Uu

On Wed, Mar 25, 2020 at 10:20:43PM +0100, Auger Eric wrote:
> Hi Zenghui,
>=20
> On 3/25/20 9:10 AM, Zenghui Yu wrote:
> > Hi Eric,
> >=20
> > On 2020/3/20 17:24, Eric Auger wrote:
> >> Introduce an helper functions to register
> >> - a new device, characterized by its device id and the
> >> =A0=A0 max number of event IDs that dimension its ITT (Interrupt
> >> =A0=A0 Translation Table).=A0 The function allocates the ITT.
> >>
> >> - a new collection, characterized by its ID and the
> >> =A0=A0 target processing engine (PE).
> >>
> >> Signed-off-by: Eric Auger <eric.auger@redhat.com>
> >>
> >> ---
> >>
> >> v3 -> v4:
> >> - remove unused its_baser variable from its_create_device()
> >> - use get_order()
> >> - device->itt becomes a GVA instead of GPA
> >>
> >> v2 -> v3:
> >> - s/report_abort/assert
> >>
> >> v1 -> v2:
> >> - s/nb_/nr_
> >> ---
> >> =A0 lib/arm64/asm/gic-v3-its.h | 19 +++++++++++++++++++
> >> =A0 lib/arm64/gic-v3-its.c=A0=A0=A0=A0 | 38 ++++++++++++++++++++++++=
++++++++++++++
> >> =A0 2 files changed, 57 insertions(+)
> >>
> >> diff --git a/lib/arm64/asm/gic-v3-its.h b/lib/arm64/asm/gic-v3-its.h
> >> index 4683011..adcb642 100644
> >> --- a/lib/arm64/asm/gic-v3-its.h
> >> +++ b/lib/arm64/asm/gic-v3-its.h
> >> @@ -31,6 +31,19 @@ struct its_baser {
> >> =A0 };
> >> =A0 =A0 #define GITS_BASER_NR_REGS=A0=A0=A0=A0=A0=A0=A0 8
> >> +#define GITS_MAX_DEVICES=A0=A0=A0=A0=A0=A0=A0 8
> >> +#define GITS_MAX_COLLECTIONS=A0=A0=A0=A0=A0=A0=A0 8
> >> +
> >> +struct its_device {
> >> +=A0=A0=A0 u32 device_id;=A0=A0=A0 /* device ID */
> >> +=A0=A0=A0 u32 nr_ites;=A0=A0=A0 /* Max Interrupt Translation Entrie=
s */
> >> +=A0=A0=A0 void *itt;=A0=A0=A0 /* Interrupt Translation Table GVA */
> >> +};
> >> +
> >> +struct its_collection {
> >> +=A0=A0=A0 u64 target_address;
> >> +=A0=A0=A0 u16 col_id;
> >> +};
> >> =A0 =A0 struct its_data {
> >> =A0=A0=A0=A0=A0 void *base;
> >> @@ -39,6 +52,10 @@ struct its_data {
> >> =A0=A0=A0=A0=A0 struct its_baser coll_baser;
> >> =A0=A0=A0=A0=A0 struct its_cmd_block *cmd_base;
> >> =A0=A0=A0=A0=A0 struct its_cmd_block *cmd_write;
> >> +=A0=A0=A0 struct its_device devices[GITS_MAX_DEVICES];
> >> +=A0=A0=A0 u32 nr_devices;=A0=A0=A0=A0=A0=A0=A0 /* Allocated Devices=
 */
> >> +=A0=A0=A0 struct its_collection collections[GITS_MAX_COLLECTIONS];
> >> +=A0=A0=A0 u32 nr_collections;=A0=A0=A0 /* Allocated Collections */
> >> =A0 };
> >> =A0 =A0 extern struct its_data its_data;
> >> @@ -93,5 +110,7 @@ extern void its_parse_typer(void);
> >> =A0 extern void its_init(void);
> >> =A0 extern int its_baser_lookup(int i, struct its_baser *baser);
> >> =A0 extern void its_enable_defaults(void);
> >> +extern struct its_device *its_create_device(u32 dev_id, int nr_ites=
);
> >> +extern struct its_collection *its_create_collection(u32 col_id, u32
> >> target_pe);
> >=20
> > Maybe use 'u16 col_id'?
> fair enough. At this point, not sure this is worth a respin though ;-)

I'd like all the virt_to_phys calls removed where there are not necessary=
,
which was pointed out in a different patch. This can be fixed up at the
same time.

Thanks,
drew

> >=20
> > Besides,
> > Reviewed-by: Zenghui Yu <yuzenghui@huawei.com>
> Thanks!
>=20
> Eric
>=20
>=20
>=20
>=20
> >=20
> >=20
> > Thanks
> >=20
> >=20
>=20
>=20
