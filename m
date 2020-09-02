Received: by 2002:a19:ad09:0:0:0:0:0 with SMTP id t9csp343077lfc;
        Wed, 2 Sep 2020 01:40:50 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwdgDvOtlDlXlnYF0zP5DQalxHIc6XmUq5YDT0uaut3LTPlhETYXGozYqDLrvUWpVDucgOg
X-Received: by 2002:a25:1fd5:: with SMTP id f204mr9181887ybf.236.1599036050088;
        Wed, 02 Sep 2020 01:40:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1599036050; cv=none;
        d=google.com; s=arc-20160816;
        b=zedSnJwedy93vRyEjdeNajApppJIF0MdCwZVFeGb4R/rN2RzwAee2MW7k4g1h9kNFs
         tUk/e7L5MIrSmYjz9gsrv3uRXuFumWkkHi0pO1N/LCCt4GzqGT2tCe0xSPrhL7qbgC/1
         dpolOhj0QhuT09DN0cSksKwZ2Kx+hreotbFPWcUyeW1Zni86+NTsyiR5jjmsdeByTyVy
         9rOa8TzbW8ZXLG9V1fQEGuZFVuCOkkXTKZtrf/EF/o9TGlLnt0vqD7SL5oVWXGNzG7z4
         vOzFAMxKSvA/dGV+McBbAexFvpyvK3pOt7Y1vtPXkx0TnyjvKS2BP0GEbENjcq6BDwwx
         efbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=4AHlCLlqmcmE+6uLWQAq0dRJmN6qkZrwy0hyROQlqxE=;
        b=wIfMFyhqq1ANGjfAZmy2VhcM+cbeG7Z0YhfuKrhDq9uaO1xRvqeb8Ot7TpHOUKFZty
         Ss1VvcQsNdVoin81y9WnvV4HWwYnqrvlJCkOyNvPk920wN5Deu/fe+pwVZPXC275OLhk
         Tkn+BA6GES4xDRPVKl+ow2DCQMcFw8XhSKD+IIQ4VAARdkQyrG3Pcuqz8SY6+P6u2BX9
         U1hBcoMMcsUPjZLojmbnm1UAsS8slpsbz0VdviqwRhZqigD/1WhyeqqIOj10I8MYMaxt
         CjHjEXGZ9tT0tAaVcFLmxGvdABAbPN9bSF52BKolHUCYMxQKwx18egJkGICsIvGiAQcQ
         5ruQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=LPuv+9IE;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e77si2206521ybb.141.2020.09.02.01.40.49
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 02 Sep 2020 01:40:50 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=LPuv+9IE;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:52040 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kDOK1-0007aM-FF
	for alex.bennee@linaro.org; Wed, 02 Sep 2020 04:40:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51928)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1kDOJr-0007XG-S9
 for qemu-arm@nongnu.org; Wed, 02 Sep 2020 04:40:39 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:38186
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1kDOJp-0006JI-W6
 for qemu-arm@nongnu.org; Wed, 02 Sep 2020 04:40:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1599036037;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4AHlCLlqmcmE+6uLWQAq0dRJmN6qkZrwy0hyROQlqxE=;
 b=LPuv+9IE3CfTnGHpaho6TMKQUZPR3gwGumYlOGWyyRW4IOr/rcNd5ZJ0egCz2zH7k46B6Y
 PrQQI6fPyVICSbpgBqcedzMccfEY0x4GnZpwV1gJrodo97joVLZOqg5wR8C2VHrasPPrgy
 EkU9Vne5PgUDRChSCYHm55o8YuBXL28=
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-261-luGngDQlOyusDhazTw538A-1; Wed, 02 Sep 2020 04:40:35 -0400
X-MC-Unique: luGngDQlOyusDhazTw538A-1
Received: by mail-qt1-f198.google.com with SMTP id e14so3018148qtm.5
 for <qemu-arm@nongnu.org>; Wed, 02 Sep 2020 01:40:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=4AHlCLlqmcmE+6uLWQAq0dRJmN6qkZrwy0hyROQlqxE=;
 b=B/e6/6bzCYCe79Bg/HTvo/lVV/0kn3cJC0zYMm7XXPEzkToorOYt2zF+8YPswXrgsM
 8Fd16J8rSAa3xTSohSbcYPc0/u4yVjo3qObw/FRRxd0XQU/Z7ny2iGhHoLvLztG0gp6H
 tEDUNWeH8xOowyo6vQIupy2EYx6Cr+FDlK0kkIMtNx6vWARbyQn4erG+1ZbJNP7QfUMC
 zxA+sN0r2RGtyvqCKwCpyBNWA6wsE+wIgVPWygovaqv3kUqWxDlesGv++0wseO7PQfD8
 oGlzdbe4y27l5jasB7vccWctaHf8lEbd4jRKAiB9M2ai8loppJxQB5PvuZxie+ig0CA4
 H2FQ==
X-Gm-Message-State: AOAM5334Wca1LMazugeItAXYE1N/VPoRy4iKKg224ujSU2EulZzvbLmG
 cmzjnlEvZX50TUXNhCsEZgd7bqEDTATmI7G7HLdPQTejIgk9w2VaksLj6ZOXdHTXLll4glnOS5y
 eSz8V+mNbBN0EfYMYx4P9FFTisDKv
X-Received: by 2002:aed:3882:: with SMTP id k2mr5710761qte.308.1599036035253; 
 Wed, 02 Sep 2020 01:40:35 -0700 (PDT)
X-Received: by 2002:aed:3882:: with SMTP id k2mr5710740qte.308.1599036035042; 
 Wed, 02 Sep 2020 01:40:35 -0700 (PDT)
MIME-Version: 1.0
References: <20200901142608.24481-1-eperezma@redhat.com>
 <20200901142608.24481-3-eperezma@redhat.com>
 <87a6y8r4ut.fsf@secure.mitica>
In-Reply-To: <87a6y8r4ut.fsf@secure.mitica>
From: Eugenio Perez Martin <eperezma@redhat.com>
Date: Wed, 2 Sep 2020 10:39:59 +0200
Message-ID: <CAJaqyWcwhVhJnPRmb4Laee+Wrp4MZ5wsm0Ec+YM288CxY8CDUA@mail.gmail.com>
Subject: Re: [RFC v8 2/5] memory: Add IOMMUTLBEvent
To: Juan Quintela <quintela@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eperezma@redhat.com
X-Mimecast-Spam-Score: 0.002
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=207.211.31.120; envelope-from=eperezma@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/02 02:07:24
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
 Jason Wang <jasowang@redhat.com>, qemu-level <qemu-devel@nongnu.org>,
 Peter Xu <peterx@redhat.com>, Eric Auger <eric.auger@redhat.com>,
 qemu-arm@nongnu.org, =?UTF-8?Q?Herv=C3=A9_Poussineau?= <hpoussin@reactos.org>,
 Avi Kivity <avi@redhat.com>, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Richard Henderson <rth@twiddle.net>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: rSKqhE8m6JtZ

Applying both, thanks!

On Wed, Sep 2, 2020 at 9:54 AM Juan Quintela <quintela@redhat.com> wrote:
>
> Eugenio P=C3=A9rez <eperezma@redhat.com> wrote:
> > This way we can tell between regulars IOMMURLBEntries (entry of IOMMU
> > hardware) and notifications.
> >
> > In the notifications, we set explicitly if it is a MAPs or an UNMAP,
> > instead of trusting in entry permissions to differenciate them.
> >
> > Signed-off-by: Eugenio P=C3=A9rez <eperezma@redhat.com>
>
> Reviewed-by: Juan Quintela <quintela@redhat.com>
>
> if you have to respin for whatever other reasons, two suggestions.
>
>
> > @@ -1430,10 +1435,10 @@ static int vtd_dev_to_context_entry(IntelIOMMUS=
tate *s, uint8_t bus_num,
> >      return 0;
> >  }
> >
> > -static int vtd_sync_shadow_page_hook(IOMMUTLBEntry *entry,
> > +static int vtd_sync_shadow_page_hook(IOMMUTLBEvent *event,
> >                                       void *private)
> >  {
> > -    memory_region_notify_iommu((IOMMUMemoryRegion *)private, 0, *entry=
);
> > +    memory_region_notify_iommu((IOMMUMemoryRegion *)private, 0, *event=
);
>
> I know that it already was there, but if you respin, you can remove the c=
ast.
>
>
>
> > @@ -1281,12 +1286,12 @@ void memory_region_notify_iommu(IOMMUMemoryRegi=
on *iommu_mr,
> >   * notifies a specific notifier, not all of them.
> >   *
> >   * @notifier: the notifier to be notified
> > - * @entry: the new entry in the IOMMU translation table.  The entry
> > - *         replaces all old entries for the same virtual I/O address r=
ange.
> > - *         Deleted entries have .@perm =3D=3D 0.
> > + * @event: TLB event with the new entry in the IOMMU translation table=
.
> > + *         The entry replaces all old entries for the same virtual I/O=
 address
> > + *         range.
> >   */
> >  void memory_region_notify_iommu_one(IOMMUNotifier *notifier,
> > -                              IOMMUTLBEntry *entry);
> > +                                    IOMMUTLBEvent *event);
>
> I didn't catch the missing of indentation on the previous patch ....
> O:-)
>

