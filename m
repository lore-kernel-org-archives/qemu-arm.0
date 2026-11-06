Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C016A606A326
	for <qemu-arm@archiver.kernel.org>; Fri,  6 Nov 2026 14:52:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Z5A9k2i1
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xPLJ8-0003N6-Af; Fri, 06 Nov 2026 09:52:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1xPLJ6-0003MV-HZ
 for qemu-arm@nongnu.org; Fri, 06 Nov 2026 09:52:44 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1xPLJ4-0002FY-Sn
 for qemu-arm@nongnu.org; Fri, 06 Nov 2026 09:52:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1793976762;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+hAG1lMR6EpyUF8Mo/bczfeHpe//nmcoFZfecTgTJ8Q=;
 b=Z5A9k2i1Y6iowoqiPOoIgP+yq0dsL9AL2LyI2phGU5l8yqmJGqBP5CyYOHE/IeVLXv8hmm
 YwWiCXtPH47v1POunSEbyKn0E0DB/2dOj1Cn8q7I/vRMrQIwAOwhaz/e/g3oyD7UWB+C2d
 VaGSYbHvxYBEqwEqrPCnJ6+C0HKQxKU=
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com
 [209.85.214.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-676-GhSRjtujMiKj9n-0RT4LlQ-1; Fri, 06 Nov 2026 09:52:41 -0500
X-MC-Unique: GhSRjtujMiKj9n-0RT4LlQ-1
X-Mimecast-MFC-AGG-ID: GhSRjtujMiKj9n-0RT4LlQ_1793976760
Received: by mail-pl1-f199.google.com with SMTP id
 d9443c01a7336-2ed283cb5b9so10789765ad.1
 for <qemu-arm@nongnu.org>; Fri, 06 Nov 2026 06:52:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793976760; x=1794581560;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=+hAG1lMR6EpyUF8Mo/bczfeHpe//nmcoFZfecTgTJ8Q=;
 b=U6BdXzKYTBaVRsnzgBMyhPFHS+MM6GSc15mdk6nxaoQjOzCKesvvYQdFcHqh71DCB0
 jFZ9OiNc1/56MnG7i8Pj1FeXkbAdEwBvTIaPWyJNhp1uaoli5qyhl8X+PqBVjdAnSa0j
 hYdqzRap89bUDtLQq0B6QNGWo7dgD6FIlrAk3yq8CnSIVtASHJ2cNHn5g7WCRI/3RDnV
 YixvsC6teBpyHG/XSI2lnzxtJfD46l5Qb2ONpATLtroLl0N0i1jlT0IGSroIDoR59rWl
 RZE6hb4ZO5huraaXdmXpUkcWm1p+DtNiBjejfjPerrfodNjS3a/evqkjfIbk17j+jsHG
 nyUA==
X-Forwarded-Encrypted: i=1;
 AL+hErHOnZe6PEl1xcIiFaQ0a3dPJZzUrqJVxsE/OZbF7z7F00+C2BQXuyy+BfjmI8tBURmUuzoVVpcZvw==@nongnu.org
X-Gm-Message-State: APuU4Z+LnbFEOpie63vyul87sN/hf/kGXbCZUJZrU1gqRt+yISGQVd+U
 fm7tBsPak+8uutRFlFfK1q9vhLsfJecd1HBMh5JGaA1R2dJZSuPRdEw/IBQ1O84YqadmDPL6EIB
 Xclb3T75P1fXP/QnbGJyLi5zwL2XvoWBWnTdWjLH6xQjiW68jckCpLgadoUexteFbUsFIRduEt4
 t8R6siNWzFoJl01ppCiknqja+MhU8/
X-Gm-Gg: AYBFou2UWIM4VA0ozu7RYMBSyPb6gi/yjob1bd0Y9G8WpN4Lnd68BFNjRp7Qv4GV1u7
 htsj8ZCk3LsLU8cyD1hq0NiEvzuATtloU405HY03vLeHMYg0ovrDIJsdxMSqQij4UpGnIfF8hRc
 Yn6P+FjF+ycK0Oz0GTxss0fzcYGTCl+6NXcpL9pXJFBXaom6Sbq5HzgWtTg1bwYIhJgef5a3+Vk
 Lv38WZkqtHxTHcOb3+feJNtokKoMtnKoCGQQsRyY7fZl5SWdHhOQPJrCIpFeqcCOTj4xIale+2p
 xg==
X-Received: by 2002:a17:90b:35c5:b0:3ad:677f:567f with SMTP id
 98e67ed59e1d1-3b0db70daffmr1759562a91.40.1793976759696; 
 Fri, 06 Nov 2026 06:52:39 -0800 (PST)
X-Received: by 2002:a17:90b:35c5:b0:3ad:677f:567f with SMTP id
 98e67ed59e1d1-3b0db70daffmr1759539a91.40.1793976759161; Fri, 06 Nov 2026
 06:52:39 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261029131241.2275706-1-berrange@redhat.com>
 <20261029131241.2275706-5-berrange@redhat.com>
 <fe7f7d29-8ca3-4ced-afcc-c768b84c4888@redhat.com>
 <CAMxuvazfhfGSZCiSi+viwJ7f7XDWAZfjmW39n3a7a-qQyw-YSA@mail.gmail.com>
 <au3mwO32b0-PSXKu@redhat.com>
In-Reply-To: <au3mwO32b0-PSXKu@redhat.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
Date: Fri, 6 Nov 2026 18:52:27 +0400
X-Gm-Features: AclHuK8PkA73Zsh95_t7Twce7oOByDLrT6UMHFSQfVJqhUHCjhh81u-PlI46tLQ
Message-ID: <CAMxuvayhYcOvH2QPptrKUQGFHoRxQcM1USF5OwuZYR_g2c4zgw@mail.gmail.com>
Subject: Re: [PATCH v2 04/28] hw: mark all remaining virtio object types as
 secure
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Cc: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
 Paolo Bonzini <pbonzini@redhat.com>, qemu-ppc@nongnu.org, qemu-block@nongnu.org,
 qemu-riscv@nongnu.org, qemu-s390x@nongnu.org
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: Xwt4J0mmrzOofD1ipr1yJk8kKAdlWmHOtRWCi14v1AA_1793976760
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mlureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi

On Fri, Nov 6, 2026 at 6:40=E2=80=AFPM Daniel P. Berrang=C3=A9 <berrange@re=
dhat.com> wrote:
>
> On Fri, Nov 06, 2026 at 06:35:29PM +0400, Marc-Andr=C3=A9 Lureau wrote:
> > Hi
> >
> > On Fri, Nov 6, 2026 at 3:53=E2=80=AFPM Thomas Huth <thuth@redhat.com> w=
rote:
> > >
> > > On 29/10/2026 14.12, Daniel P. Berrang=C3=A9 wrote:
> > > > These are all intended for use in a virtualization scenario and mus=
t
> > > > provide a security boundary.
> > > >
> > > > Acked-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> > > > Signed-off-by: Daniel P. Berrang=C3=A9 <berrange@redhat.com>
> > > > ---
> > > Reviewed-by: Thomas Huth <thuth@redhat.com>
> > >
> >
> > I have a second thought about this, I'd like to exclude all
> > gpu-accelerated paths for now. virgl/mesa/rutabaga expose a very large
> > attack surface, so I'd like to drop them from the secure boundary
>
> Rather than repost, please see my response for patch 2:
>
>   https://lists.gnu.org/archive/html/qemu-devel/2026-11/msg01530.html
>
> TL;DR: we have already promised anything virtio related is in scope
> for security handling for a long time, as they are all unambiguously
> "virtualization use case".
>

the value of a secure policy enforcement is low if we know those
devices are unsecure and don't have the resources to make them secure.

> With regards,
> Daniel
> --
> |: https://berrange.com       ~~        https://hachyderm.io/@berrange :|
> |: https://libvirt.org          ~~          https://entangle-photo.org :|
> |: https://pixelfed.art/berrange   ~~    https://fstop138.berrange.com :|
>


