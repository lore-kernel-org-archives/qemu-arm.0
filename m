Received: by 2002:a17:505:8f44:b0:1be9:327d:8ee3 with SMTP id jy4csp1710185njc;
        Tue, 11 Mar 2025 02:08:47 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVjMCnIQNmn086bHI08wOx4jsm1EVi0YNZN7Gy02a17dwN+GCe3dg7f9ZoHngj0atJzHc49eLzjJ7yoJQ==@linaro.org
X-Google-Smtp-Source: AGHT+IHAo+nIYV62T4Ngss1BfYB5ZhLDT6rXOo9bmmsLv+jebE6Sa0DM1swRdEwzAnJjJOyYHtMk
X-Received: by 2002:a05:6214:230b:b0:6e6:6a82:4989 with SMTP id 6a1803df08f44-6e9006ad0c5mr241524806d6.44.1741684127156;
        Tue, 11 Mar 2025 02:08:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1741684127; cv=none;
        d=google.com; s=arc-20240605;
        b=drql4XUDs57IHV4haHUfNe0Gs3UtA+b5psCSAyKlCRFqYnj1APAomCFu63vajzjjWP
         l3D11QBn9gtfi7fo9LkhsXXvEUcWsvbY88imifEc8dteA+lnBS1vcZ9niMKUSdBD+F/2
         GbuKJDWissT+EZntCXh7rwMR8mzSyNdiT5uw8VTXFBqClOWkSWFiAtR57/m9LbBirvvG
         Sl+97zdsQdo1Js0ECyIE5zp+5C4cRJYua8EjQVCQ3MR/y51o5Y4bEOy8DChnQvWH6AfD
         FKHV5gunkRJeszLSo4/n0g8Gj8ufSPZ4klOiH0hjavgcIgMaGBR4LUJ3DOET0G5rB7H6
         T26w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:cc:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=CJxI/ZRVueyO0n8sjn5AWKSzXjyVt2i10kz6Me5oZbg=;
        fh=q4D4BfiDISrjEW8c0LqrfYizTVr/PYqF1atBTPnGv34=;
        b=R0OMi87YgECCxwS1ra02ozjwGXZIpkKtESrcQLOH2f9bRkgsNuBqHSbPKbwumSvnjT
         oOb9ARWo9f95OBy7HFctQmwFAWvmnT9TzDdBoHsxqzMmU6uFcdeNsXfw1YcshLvGaiz5
         XKfvTfyzoOjjjEqQTdDcmoIGaFfbbX7Fq8ryspTStAE+e2oz4s8cWOCAcM1AJJsSmjRf
         u0JkUnvxX6XEEG8wupDOzfV7ZKk7jSWAc58ySr1ppKmeLOoUpnXeLIsIUHnxii9EyCO3
         /dHBV3SY0/Rb1VS0iWAj5n4JtRpr2EbsjdjBw2ZYFODKsGdTiWJ6u3OERzAP0tmMcgZ6
         COCA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=N4ni96xZ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6e917d355edsi42757846d6.93.2025.03.11.02.08.47
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 11 Mar 2025 02:08:47 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=N4ni96xZ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1trvbF-0000C4-Nf; Tue, 11 Mar 2025 05:08:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1trvbE-0000BV-51
 for qemu-arm@nongnu.org; Tue, 11 Mar 2025 05:08:32 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1trvb4-0003H0-Fw
 for qemu-arm@nongnu.org; Tue, 11 Mar 2025 05:08:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1741684099;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=CJxI/ZRVueyO0n8sjn5AWKSzXjyVt2i10kz6Me5oZbg=;
 b=N4ni96xZ27Uw7H7GI6H5HnzaO4kiXToUwwmSo/roO3Glth1iPm4Y5hNVLYVgTsuxEtyQr5
 UdVzemAt4fpx4jS3aotJSEJB+W4NCapGcmaxevTyK/lV9DfSRU000GhE5KzmKmbHv+aejn
 +PEPcd4PNYBAuDePTL5LJBYqxLyMtLA=
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com
 [209.85.214.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-396-3mCbR24hNsuaa9ouNq1c4w-1; Tue, 11 Mar 2025 05:08:17 -0400
X-MC-Unique: 3mCbR24hNsuaa9ouNq1c4w-1
X-Mimecast-MFC-AGG-ID: 3mCbR24hNsuaa9ouNq1c4w_1741684096
Received: by mail-pl1-f198.google.com with SMTP id
 d9443c01a7336-2241ae15dcbso108724855ad.0
 for <qemu-arm@nongnu.org>; Tue, 11 Mar 2025 02:08:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741684096; x=1742288896;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=CJxI/ZRVueyO0n8sjn5AWKSzXjyVt2i10kz6Me5oZbg=;
 b=rhITy3GUCN6O8l2hX52BGvOe69LlXG63/nyZM5Hb9ESLboHQuL/jpAujHnJs5i+2ov
 gDwSUeHU138wjCtExBhZdL7qwFhMYyND/zR6CGpQ46W3Hrc91vzwRsl/zyp1ibRBkw39
 oLBzGA+LETbBzQ/ZucHr9vQmhyOddMY+mRvnMa3fwgCw8stsKSrxishJlv3QK25bbu3x
 T14E3ADoxzwQGizspKujjGPj45t5H3LCXmviIwR6TxV3tbtJ4zB6TxYCaK/itGOipYr0
 BgAwES6zZ/GUN4zVDvcaBLeLPCIEd9Rps01So+1NrXU4hVkkF02E372jvzt8DsXVybgQ
 A0Ow==
X-Forwarded-Encrypted: i=1;
 AJvYcCWCkym6cejo41XIWT60LVY/I8T4EmeL/ZBmVJy+jDyQbcdwpbl6SsEy4iLO6CFYB5lkC8hTlFV5pA==@nongnu.org
X-Gm-Message-State: AOJu0Yzhb6tcCevW3tZV52TvhnRK+dTggJN9r8KBGsZY0I9TN074nxcY
 YnqsBCTOb9t07RQ56nt9TVSI/2f7P0OPItdMLwODBtfvl+IE8YE+/aqNUq/MLbSBs9Ku5TSke2U
 XhQOOBCv3VFPchqwlBYwR2c0HW/yqMoe3d36Ag9EccPxXtyeH8Ce6hR6d3WP/FYNNAL/qTX8zMD
 SMm6r75WVFenrWmq9Uvzu3DdEl
X-Gm-Gg: ASbGncsRhHuQjwVXBGyEv5rV189tM7uRhrgCNSE/QJ5a5Gkv1rwCzu85wWq11Fs6sQR
 ZLiWZxvMqis0Bby4cCWuEu7VhUVWH3L7y4Q6Sr3Nv2+E28DDUJj7hdYO5wn55o6HAhnkNRQ==
X-Received: by 2002:a05:6a00:987:b0:736:46b4:bef2 with SMTP id
 d2e1a72fcca58-736aa9dbf8emr24954733b3a.6.1741684096327; 
 Tue, 11 Mar 2025 02:08:16 -0700 (PDT)
X-Received: by 2002:a05:6a00:987:b0:736:46b4:bef2 with SMTP id
 d2e1a72fcca58-736aa9dbf8emr24954708b3a.6.1741684095953; Tue, 11 Mar 2025
 02:08:15 -0700 (PDT)
MIME-Version: 1.0
References: <20250228174802.1945417-1-peter.maydell@linaro.org>
 <4f0367df-d873-414e-96fc-1a874ee1f501@linaro.org>
In-Reply-To: <4f0367df-d873-414e-96fc-1a874ee1f501@linaro.org>
From: Jason Wang <jasowang@redhat.com>
Date: Tue, 11 Mar 2025 17:08:03 +0800
X-Gm-Features: AQ5f1Jou4RX-6MRy8XHQm6pIwfeJzWq_Mtge16jAw4TSc5nRdLnRIzcgFBpwNZw
Message-ID: <CACGkMEu6wngc6oiyVGP7O5BUUPGS4sfWEi66cMDmteihR9nuHw@mail.gmail.com>
Subject: Re: [PATCH 0/3] hw/net/smc91c111: Fix potential array overflows
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org, qemu-stable@nongnu.org
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 41MTLJEFy-40TmYTYK2eWG1C2mRtqRRohDq6NTHASbU_1741684096
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=0.001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: JDzOCTV3eBHn

On Tue, Mar 11, 2025 at 5:00=E2=80=AFPM Philippe Mathieu-Daud=C3=A9
<philmd@linaro.org> wrote:
>
> Hi Peter, Jason,
>
> On 28/2/25 18:47, Peter Maydell wrote:
> > This patchset fixes some potential array overflows in the
> > smc91c111 ethernet device model, including the one found in
> > https://gitlab.com/qemu-project/qemu/-/issues/2742
> >
> > There are two classes of bugs:
> >   * we accept packet numbers from the guest, but we were not
> >     validating that they were in range before using them as an
> >     index into the data[][] array
> >   * we didn't sanitize the length field read from the data
> >     frame on tx before using it as an index to find the
> >     control byte at the end of the frame, so we could read off
> >     the end of the buffer
> >
> > This patchset fixes both of these. The datasheet is sadly
> > silent on the h/w behaviour for these errors, so I opted to
> > LOG_GUEST_ERROR and silently ignore the invalid operations.
> >
> > Patch 3 tidies up the existing code to use a constant defined
> > in patch 2; I put it last so we can cc the first two patches
> > to stable without having to also backport that patch.
> >
> > thanks
> > -- PMM
> >
> > Peter Maydell (3):
> >    hw/net/smc91c111: Sanitize packet numbers
> >    hw/net/smc91c111: Sanitize packet length on tx
> >    hw/net/smc91c111: Use MAX_PACKET_SIZE instead of magic numbers
>
> Since Jason just sent his network pull request, I'll take these
> patches via my hw-misc tree (with patch #2 fixed up), except if
> one of you object.
>
> Thanks,
>
> Phil.
>

Fine with me.

Thanks

