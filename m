Received: by 2002:a19:ad09:0:0:0:0:0 with SMTP id t9csp329085lfc;
        Wed, 2 Sep 2020 01:15:50 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxtAehPs55TE8s9hMzLEbwbM2QDxQDV3tguTF3fBKsOOwEdZNNHWIinzf3momkUJLK3FuM1
X-Received: by 2002:a5b:186:: with SMTP id r6mr8722085ybl.295.1599034550147;
        Wed, 02 Sep 2020 01:15:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1599034550; cv=none;
        d=google.com; s=arc-20160816;
        b=xVHqEMMiiWA22ahOZwmVjpwco416AzRvt4S/ziQyyW8k6rfbVvpUO6og7CLsSnnZ+p
         6z24daKKFTrjh4YajUhNqGLrG2J9ishQCkqMEbP/t8VsIY1e86y7lkQQg6XDHF+Svrer
         5rrNTeCgowpWhpcct8yglgBTrz6kxULalJaHMSkKw+2KqnnSA0OXsntKLQr9nkqEFomf
         WIDnI0b9jIUySdh4xfCLNBK0gAqvXLQzXkEJiH8+/kZGaew5Br4C1LCAgxJJAPQEH+If
         hBCuyfFgyhHI7Bd98k46AXdoUpQi+esAP3bNAJnjGBxWyL42lubJn5Qq/aV863RTQrnb
         ca0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=YQJKHpot4c6uspshmywfzJykIZy5wv13h4yti1lCgAs=;
        b=n2M4qGbYbnQoh/CFv8WycLwfLR0aUQjOhFXddquGRQGAOevEIBkJFtCzepe4L1CMYG
         dJZ0OFLGwopMnCSnggjry8PS59xftqAbkTtzqc2tQEFA3dOkavVihWk4InbSC/WOU4ro
         9Mh7IP/ZzWu4DmVdHmmTUjMW0mLzY+lUoShtN1qfVNwG5Hg7VeHFOt3VCFKIotxR4Y+r
         9UgAizIr+hjvPnLYqo4jM8yvVTq2356wBg3MMQU4RjahaSZ1PO7MpGRB56k5g1xCa1jd
         D7UTFSFq9mQx+UlCsKOCIBMGut4KwUYhRlmkXcOeuxckJEZLgcLiE3NSO0i6kPv8q5nf
         HQYA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=h9mxHDBg;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s4si3517689ybq.70.2020.09.02.01.15.49
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 02 Sep 2020 01:15:50 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=h9mxHDBg;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:35432 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kDNvp-0000Ti-HZ
	for alex.bennee@linaro.org; Wed, 02 Sep 2020 04:15:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43922)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1kDNvY-0000Sr-VS
 for qemu-arm@nongnu.org; Wed, 02 Sep 2020 04:15:33 -0400
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:59513
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1kDNvX-0002rv-G2
 for qemu-arm@nongnu.org; Wed, 02 Sep 2020 04:15:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1599034530;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YQJKHpot4c6uspshmywfzJykIZy5wv13h4yti1lCgAs=;
 b=h9mxHDBgPcppZ1NfHG9kcRx47SOuLI19lEfZoRwgpFRpDMYp29/v6dAYz3BKHyYee4btaI
 PZUOyXt28e2q/GeaQVDQJrI2Xw3xYiHm1bCeUnGuyrgaOPbzI8pmzqjrOmWdhxGQBKBc1X
 Q4ylsdddRdXrXed4tx5uFPq3rpWfDMQ=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-401-l-kBiMn6OymcuNNb1kMIPw-1; Wed, 02 Sep 2020 04:15:28 -0400
X-MC-Unique: l-kBiMn6OymcuNNb1kMIPw-1
Received: by mail-qk1-f197.google.com with SMTP id y187so2852288qka.10
 for <qemu-arm@nongnu.org>; Wed, 02 Sep 2020 01:15:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=YQJKHpot4c6uspshmywfzJykIZy5wv13h4yti1lCgAs=;
 b=Sa93Zvof1p3K2m4pIcuzV7ohsfWgfotZ1bJ60/YeotvQ1kqwQAPszFP65kh0xik2Se
 TxeUf3YrhIfyxL1wdSkvPf8VRbhUKcdZyTbLLAGR0YOH+Gl3cQr0/MLKhSjh8ndK1qJo
 IKPsXKxbkMMfb3GmJx4N0fe/bp/IWw8558vCyymN19HWYIIcWq3K9glFpD7RQRdZL3j8
 NBc6hHIIJrRURaTHau3DxXRgOQ55OslWgaZhDUdwQxmNqUEVQ1Pz9rpDIOge+wYioxFu
 oS17gtK2R8emY+0KIcH4g4hP1DcFyQXZIth8Se+e3XT2bY4gLRe36YtoXWQ+xG9Rq4M0
 VQmA==
X-Gm-Message-State: AOAM530FYBMvmZ8dqBaz9R+C6JovcHLFPNHnxvlinzVvQnLK9quNPuoU
 YKvMq3yXb2rGWK48UMhsiGeb126BFhHtVAKYP0md+jqnp5rBZyrLC8/mF9PmfPnYR09d8i9vrN5
 bLeBL8YuN7m7yA82m+lGvdB2VvUT6
X-Received: by 2002:a05:620a:b1a:: with SMTP id
 t26mr5745401qkg.353.1599034528183; 
 Wed, 02 Sep 2020 01:15:28 -0700 (PDT)
X-Received: by 2002:a05:620a:b1a:: with SMTP id
 t26mr5745387qkg.353.1599034527966; 
 Wed, 02 Sep 2020 01:15:27 -0700 (PDT)
MIME-Version: 1.0
References: <20200901142608.24481-1-eperezma@redhat.com>
 <20200901142608.24481-3-eperezma@redhat.com>
 <20200901205458.GD3053@xz-x1>
In-Reply-To: <20200901205458.GD3053@xz-x1>
From: Eugenio Perez Martin <eperezma@redhat.com>
Date: Wed, 2 Sep 2020 10:14:51 +0200
Message-ID: <CAJaqyWfSHPH=ULrGxEZc+bvWhN7Sk_YBU194a7YPJv9MTHCjNQ@mail.gmail.com>
Subject: Re: [RFC v8 2/5] memory: Add IOMMUTLBEvent
To: Peter Xu <peterx@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eperezma@redhat.com
X-Mimecast-Spam-Score: 0.001
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=207.211.31.81; envelope-from=eperezma@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/02 02:33:32
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Yan Zhao <yan.y.zhao@intel.com>, Eduardo Habkost <ehabkost@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, qemu-ppc@nongnu.org,
 Jason Wang <jasowang@redhat.com>, Juan Quintela <quintela@redhat.com>,
 qemu-level <qemu-devel@nongnu.org>, Eric Auger <eric.auger@redhat.com>,
 qemu-arm@nongnu.org, =?UTF-8?Q?Herv=C3=A9_Poussineau?= <hpoussin@reactos.org>,
 Avi Kivity <avi@redhat.com>, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Richard Henderson <rth@twiddle.net>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: LG9+IsQTG5pz

On Tue, Sep 1, 2020 at 10:55 PM Peter Xu <peterx@redhat.com> wrote:
>
> On Tue, Sep 01, 2020 at 04:26:05PM +0200, Eugenio P=C3=A9rez wrote:
> > This way we can tell between regulars IOMMURLBEntries (entry of IOMMU
> > hardware) and notifications.
>
> s/regulars IOMMURLBEntries/regular IOMMUTLBEntry/
>
> >
> > In the notifications, we set explicitly if it is a MAPs or an UNMAP,
> > instead of trusting in entry permissions to differenciate them.
> >
> > Signed-off-by: Eugenio P=C3=A9rez <eperezma@redhat.com>
>
> [...]
>
> >  struct IOMMUTLBEntry {
> > -    AddressSpace    *target_as;
> > -    hwaddr           iova;
> > -    hwaddr           translated_addr;
> > -    hwaddr           addr_mask;  /* 0xfff =3D 4k translation */
> > -    IOMMUAccessFlags perm;
> > +    AddressSpace            *target_as;
> > +    hwaddr                   iova;
> > +    hwaddr                   translated_addr;
> > +    hwaddr                   addr_mask;  /* 0xfff =3D 4k translation *=
/
> > +    IOMMUAccessFlags         perm;
> >  };
>
> If these lines are identical, then we can avoid touching the spaces.
>

Thanks for the catches! Didn't notice them rebasing.

> With above changes, please feel free to add:
>
> Reviewed-by: Peter Xu <peterx@redhat.com>
>
> --
> Peter Xu
>

