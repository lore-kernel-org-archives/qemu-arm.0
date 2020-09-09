Received: by 2002:ac2:4c26:0:0:0:0:0 with SMTP id u6csp198675lfq;
        Wed, 9 Sep 2020 00:37:27 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz/wTKQt64OjoiO1r78bxa4ldl3KTJbAt0g6ue2Kvw4f1NulxgvxTtZQN60ocAFbT/xdROO
X-Received: by 2002:a25:ab91:: with SMTP id v17mr3996736ybi.76.1599637047599;
        Wed, 09 Sep 2020 00:37:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1599637047; cv=none;
        d=google.com; s=arc-20160816;
        b=dm86La+MSat81aX2jwUgnEYeysE8FUUjBk+NmuwhdyG8at4MoXUB2HntQ8hMuLtYed
         XZsnNg3iR24SB4GvAABsV37xMVc62mFMpwDWnvpn0zHNpJHPhtPojEZSCkLUnDW3HioQ
         HzD2ORvy164Hm7oKFenLxc0hdtcjOL303mys2bK0MyvxWNxsw3aIqhuyTMoAWYScvdCc
         z5unlG/oYMFZA8JMUWj+ezkdO7vpU0b1dHMwFezMYrm+AAmEJRVVLSN0JaxdAZvzFIvW
         1qiY1Kr3yuMagytdR6pE73oS8bpc4BX7IiGrJUQwfpPPhBFwfFYN/OkNTfDcDqX0TtuN
         fNGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-disposition:content-transfer-encoding:user-agent
         :in-reply-to:mime-version:references:message-id:subject:to:from:date
         :dkim-signature;
        bh=hWHW9HXxS92WKXjyL8njPb14LX19TCc+AKUT+azy5O4=;
        b=v9ixSjbKVAW8JECUU/hSEjZYTiTlbLMYk87fm8s2cQPSvUR8xCULc/GkC4NZK8/vwY
         WfiwWgblNcF9KqM5kKcCpq4DyAaCUTvGFDvST6XEtsWKu1iAfM3nh7Ud2MRfYEw28Zna
         TVGElbQu78A749jQucUITBNObj8kYsEwD2yXIZColZ2J+fNgX2HOBHr2PeyRzZrK0qVf
         YOciWILmz8UBByiV7Uz34qwW4xGwYfFPvwmIl026wva5PfHcbBbWS9ECd2lm1MqzdvTG
         R2lskgczXvHAR4xihbnqAI4jHTfRSpk9sdMc6JhJwosPIwZMH5k3nTMgP3Nr3VXrKQtT
         sVYA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=Lwrk3762;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s11si2180589ybb.401.2020.09.09.00.37.27
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 09 Sep 2020 00:37:27 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=Lwrk3762;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:33568 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kFufX-0008PA-06
	for alex.bennee@linaro.org; Wed, 09 Sep 2020 03:37:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51818)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1kFuer-0007cs-Dy
 for qemu-devel@nongnu.org; Wed, 09 Sep 2020 03:36:45 -0400
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:49798
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1kFuep-00074N-G9
 for qemu-devel@nongnu.org; Wed, 09 Sep 2020 03:36:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1599637002;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hWHW9HXxS92WKXjyL8njPb14LX19TCc+AKUT+azy5O4=;
 b=Lwrk37625TRO4n7ddbTC1FIT6o1AxTdd0ak0jJVtq238Od7ZchAgwsD7al90vLHRW1YY3U
 Iaw7p2gGZOxFMGdPbvBCt/samw8QR6CqD/yY3w0OQ2dJJeUF/EHoLA7pBgDY3+apHvGphv
 crgf3QtXmxGs75po8mKjdcpvdwMHF0g=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-266-_GJ6EpWsNrSd9ov4fAB02w-1; Wed, 09 Sep 2020 03:36:41 -0400
X-MC-Unique: _GJ6EpWsNrSd9ov4fAB02w-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E50851005504;
 Wed,  9 Sep 2020 07:36:39 +0000 (UTC)
Received: from redhat.com (ovpn-112-207.ams2.redhat.com [10.36.112.207])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 137D0838BF;
 Wed,  9 Sep 2020 07:36:33 +0000 (UTC)
Date: Wed, 9 Sep 2020 08:36:31 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: Re: [PATCH 4/5] hw/smbios: use qapi for SMBIOS entry point type enum
Message-ID: <20200909073631.GC1011023@redhat.com>
References: <20200908165438.1008942-1-berrange@redhat.com>
 <20200908165438.1008942-5-berrange@redhat.com>
 <d450186c-f0e6-19e8-fd27-99ef70b06d47@redhat.com>
MIME-Version: 1.0
In-Reply-To: <d450186c-f0e6-19e8-fd27-99ef70b06d47@redhat.com>
User-Agent: Mutt/1.14.6 (2020-07-11)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0.002
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Disposition: inline
Received-SPF: pass client-ip=205.139.110.61; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/09 03:20:45
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 qemu-devel@nongnu.org, Markus Armbruster <armbru@redhat.com>,
 qemu-arm@nongnu.org, Igor Mammedov <imammedo@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Laszlo Ersek <lersek@redhat.com>,
 Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: X/RfAYgIrfko

On Tue, Sep 08, 2020 at 08:29:43PM +0200, Philippe Mathieu-Daudé wrote:
> On 9/8/20 6:54 PM, Daniel P. Berrangé wrote:
> > This refactoring prepares for exposing the SMBIOS entry point type as a
> > machine property on x86.
> > 
> > Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
> > ---
> >  hw/arm/virt.c                |  2 +-
> >  hw/i386/pc_piix.c            |  2 +-
> >  hw/i386/pc_q35.c             |  2 +-
> >  hw/smbios/smbios.c           |  9 +++++----
> >  include/hw/firmware/smbios.h |  9 ++-------
> >  qapi/machine.json            | 12 ++++++++++++
> >  6 files changed, 22 insertions(+), 14 deletions(-)
> > 
> > diff --git a/hw/arm/virt.c b/hw/arm/virt.c
> > index acf9bfbece..fd32b10f75 100644
> > --- a/hw/arm/virt.c
> > +++ b/hw/arm/virt.c
> > @@ -1450,7 +1450,7 @@ static void virt_build_smbios(VirtMachineState *vms)
> >  
> >      smbios_set_defaults("QEMU", product,
> >                          vmc->smbios_old_sys_ver ? "1.0" : mc->name, false,
> > -                        true, SMBIOS_ENTRY_POINT_30);
> > +                        true, SMBIOS_ENTRY_POINT_TYPE_3_0);
> >  
> >      smbios_get_tables(MACHINE(vms), NULL, 0, &smbios_tables, &smbios_tables_len,
> >                        &smbios_anchor, &smbios_anchor_len);
> > diff --git a/hw/i386/pc_piix.c b/hw/i386/pc_piix.c
> > index 32b1453e6a..1c5bc6ae6e 100644
> > --- a/hw/i386/pc_piix.c
> > +++ b/hw/i386/pc_piix.c
> > @@ -179,7 +179,7 @@ static void pc_init1(MachineState *machine,
> >          smbios_set_defaults("QEMU", "Standard PC (i440FX + PIIX, 1996)",
> >                              mc->name, pcmc->smbios_legacy_mode,
> >                              pcmc->smbios_uuid_encoded,
> > -                            SMBIOS_ENTRY_POINT_21);
> > +                            SMBIOS_ENTRY_POINT_TYPE_2_1);
> >      }
> >  
> >      /* allocate ram and load rom/bios */
> > diff --git a/hw/i386/pc_q35.c b/hw/i386/pc_q35.c
> > index 0cb9c18cd4..cc202407c7 100644
> > --- a/hw/i386/pc_q35.c
> > +++ b/hw/i386/pc_q35.c
> > @@ -204,7 +204,7 @@ static void pc_q35_init(MachineState *machine)
> >          smbios_set_defaults("QEMU", "Standard PC (Q35 + ICH9, 2009)",
> >                              mc->name, pcmc->smbios_legacy_mode,
> >                              pcmc->smbios_uuid_encoded,
> > -                            SMBIOS_ENTRY_POINT_21);
> > +                            SMBIOS_ENTRY_POINT_TYPE_2_1);
> >      }
> >  
> >      /* allocate ram and load rom/bios */
> > diff --git a/hw/smbios/smbios.c b/hw/smbios/smbios.c
> > index 3c87be6c91..c99c9b01ae 100644
> > --- a/hw/smbios/smbios.c
> > +++ b/hw/smbios/smbios.c
> > @@ -61,7 +61,7 @@ uint8_t *smbios_tables;
> >  size_t smbios_tables_len;
> >  unsigned smbios_table_max;
> >  unsigned smbios_table_cnt;
> > -static SmbiosEntryPointType smbios_ep_type = SMBIOS_ENTRY_POINT_21;
> > +static SmbiosEntryPointType smbios_ep_type = SMBIOS_ENTRY_POINT_TYPE_2_1;
> >  
> >  static SmbiosEntryPoint ep;
> >  
> > @@ -383,7 +383,7 @@ static void smbios_validate_table(MachineState *ms)
> >          exit(1);
> >      }
> >  
> > -    if (smbios_ep_type == SMBIOS_ENTRY_POINT_21 &&
> > +    if (smbios_ep_type == SMBIOS_ENTRY_POINT_TYPE_2_1 &&
> >          smbios_tables_len > SMBIOS_21_MAX_TABLES_LEN) {
> >          error_report("SMBIOS 2.1 table length %zu exceeds %d",
> >                       smbios_tables_len, SMBIOS_21_MAX_TABLES_LEN);
> > @@ -831,7 +831,7 @@ void smbios_set_defaults(const char *manufacturer, const char *product,
> >  static void smbios_entry_point_setup(void)
> >  {
> >      switch (smbios_ep_type) {
> > -    case SMBIOS_ENTRY_POINT_21:
> > +    case SMBIOS_ENTRY_POINT_TYPE_2_1:
> >          memcpy(ep.ep21.anchor_string, "_SM_", 4);
> >          memcpy(ep.ep21.intermediate_anchor_string, "_DMI_", 5);
> >          ep.ep21.length = sizeof(struct smbios_21_entry_point);
> > @@ -854,7 +854,7 @@ static void smbios_entry_point_setup(void)
> >          ep.ep21.structure_table_address = cpu_to_le32(0);
> >  
> >          break;
> > -    case SMBIOS_ENTRY_POINT_30:
> > +    case SMBIOS_ENTRY_POINT_TYPE_3_0:
> >          memcpy(ep.ep30.anchor_string, "_SM3_", 5);
> >          ep.ep30.length = sizeof(struct smbios_30_entry_point);
> >          ep.ep30.entry_point_revision = 1;
> > @@ -939,6 +939,7 @@ void smbios_get_tables(MachineState *ms,
> >      *tables = smbios_tables;
> >      *tables_len = smbios_tables_len;
> >      *anchor = (uint8_t *)&ep;
> > +    g_printerr("Total len %zu\n", smbios_tables_len);
> 
> This seems to belong to patch 2 of this series:
> "hw/smbios: report error if table size is too large"

Actually it doens't belong anywhere. This is debug junk from
investigating EDK2/SeaBIOS flaws

> 
> Otherwise:
> Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> 

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|

