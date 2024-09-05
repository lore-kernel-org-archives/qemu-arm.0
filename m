Received: by 2002:a17:505:1f8d:b0:1be9:327d:8ee3 with SMTP id pt13csp601372njb;
        Thu, 5 Sep 2024 11:28:39 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUiLW9hlMQCVMT0TEtAp460hodp/cPffX5JVunf0w2RoL85fxHh5Me6APYB3hlY4OQl269dtvBH/k4ARQ==@linaro.org
X-Google-Smtp-Source: AGHT+IFGVe8PuN2FbZjwDvdVLrBB/Ddr9aJEPoK6V5nWSCV8nOudWQfocf9o8hA71oxxCjycC4Us
X-Received: by 2002:a05:620a:430e:b0:7a2:d64:1b57 with SMTP id af79cd13be357-7a89aca9da2mr2144744185a.43.1725560919495;
        Thu, 05 Sep 2024 11:28:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1725560919; cv=none;
        d=google.com; s=arc-20240605;
        b=OpnvoePSCDV55VEVAX4aIseZqBPzA91uE7hUxNJdz2rnUJrRhtSLPqbg9ml9a6RZyb
         cg+5I4bAr3EgsmxuXw9JBJSOlYIEcDIu+9I2LZKG6eIGI0U9bCYzEeZMyi0HzS0eBZgW
         lRI9snRJ1R2dcDSCF2ZYzs4XBuwu07qNEKkTBQSbmCzB/9tQWLRxdVCtoP5Ao3dDAKa2
         vE07ew1NMEOPBGN7IBbEMqgEsFd5BAdRFe8Sbu/hs/nMDWMmO+AQBOkt7UcIFq31mirv
         B78/snRwZjQ1yCTN8G6Eur9hZZeAoRJ4GSIIrZJadWsO/iJgu9qyKk90X1ZQfGRGW2Hm
         eeLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence:user-agent
         :in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:to:from:date
         :dkim-signature;
        bh=gN6fCe6L4FARQ2MSXXVhC5BzIkTJf78xxsfYBwi9L4Y=;
        fh=Wbw/SUKrVS1f6/QZxDdyukebNjtI0ypMahM8NfAUSI8=;
        b=gUbU/tcm2pzzB4BV7VkKqvaGtrF7OWe9nQ4B3bJtWk2k6MY4tYkgpJ2u/1WB6vokdC
         XA/FBqhhnlrBwTw39z1EkWDTmWw9iH7czqEWg1IACP7i6qkRjCT2iA7xI38/rECgFHQJ
         1HoJdxWS4QcROFd7cgUVVrBzSLk1tZE/UmFlUQzyXX1LsiWifl0AgqZ2RobAesjnm2Bw
         /HcVnVLNWtgW97bUOR3qg2uKfVUZEOXQqVlLyUD1z7Letb0x816sdgQ96s96gg1BYPbR
         BOeGVKeRmCk19WYPLrBcLjRzCJQp77TjlARTEWaDyr8JWIlY6uNyowT5usif6rz62tTf
         m5Rg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=LgB+TCUp;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7a98ef1e2c1si255654685a.112.2024.09.05.11.28.39
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 05 Sep 2024 11:28:39 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=LgB+TCUp;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from [::1] (helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1smHBY-0006cM-NX; Thu, 05 Sep 2024 14:26:26 -0400
Received: from eggs.gnu.org ([209.51.188.92])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1smHBI-0006Zd-TP
 for qemu-arm@nongnu.org; Thu, 05 Sep 2024 14:26:13 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1smHAj-00021y-Gy
 for qemu-arm@nongnu.org; Thu, 05 Sep 2024 14:25:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1725560640;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gN6fCe6L4FARQ2MSXXVhC5BzIkTJf78xxsfYBwi9L4Y=;
 b=LgB+TCUp8Sh4FosY8px1oNyddo4QlaCUO4Tn4S+j/d1g/H+U5wDYqc5jJ19xEI4z08uaqz
 oDrhkeecX6rWVeoReP0pdBiLbhHu5pLb4j8umLEajS4Q7oWRELy6QlBVFy8sVNsX6a8OsI
 pifkZYiDLR28rgDGsdCo8a1c18+tzcQ=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-609-dZH23qfiNMa50GmyKrBZgA-1; Thu,
 05 Sep 2024 14:22:34 -0400
X-MC-Unique: dZH23qfiNMa50GmyKrBZgA-1
Received: from mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.40])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 071DD1955D4E; Thu,  5 Sep 2024 18:22:27 +0000 (UTC)
Received: from redhat.com (unknown [10.42.28.53])
 by mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 1FFE61955F45; Thu,  5 Sep 2024 18:22:18 +0000 (UTC)
Date: Thu, 5 Sep 2024 19:22:15 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Cornelia Huck <cohuck@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Yanan Wang <wangyanan55@huawei.com>, Zhao Liu <zhao1.liu@intel.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Laurent Vivier <laurent@vivier.eu>,
 Nicholas Piggin <npiggin@gmail.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 Harsh Prateek Bora <harshpb@linux.ibm.com>,
 Thomas Huth <thuth@redhat.com>, Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Eric Farman <farman@linux.ibm.com>, David Hildenbrand <david@redhat.com>,
 Ilya Leoshkevich <iii@linux.ibm.com>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org, qemu-ppc@nongnu.org, qemu-s390x@nongnu.org
Subject: Re: [PATCH for-9.2] hw: add compat machines for 9.2
Message-ID: <Ztn21z0ZR3_MiVQJ@redhat.com>
References: <20240816103723.2325982-1-cohuck@redhat.com>
 <Zr8uNB8gaJTroMBU@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Zr8uNB8gaJTroMBU@redhat.com>
User-Agent: Mutt/2.2.12 (2023-09-09)
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.40
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 T_SCC_BODY_TEXT_LINE=-0.01, T_SPF_HELO_TEMPERROR=0.01,
 T_SPF_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: GQqQFBekoeZO

On Fri, Aug 16, 2024 at 11:47:16AM +0100, Daniel P. Berrangé wrote:
> On Fri, Aug 16, 2024 at 12:37:23PM +0200, Cornelia Huck wrote:
> > Add 9.2 machine types for arm/i440fx/m68k/q35/s390x/spapr.
> > 
> > Signed-off-by: Cornelia Huck <cohuck@redhat.com>
> > ---
> >  hw/arm/virt.c              |  9 ++++++++-
> >  hw/core/machine.c          |  3 +++
> >  hw/i386/pc.c               |  3 +++
> >  hw/i386/pc_piix.c          | 15 ++++++++++++---
> >  hw/i386/pc_q35.c           | 13 +++++++++++--
> >  hw/m68k/virt.c             |  9 ++++++++-
> >  hw/ppc/spapr.c             | 15 +++++++++++++--
> >  hw/s390x/s390-virtio-ccw.c | 14 +++++++++++++-
> >  include/hw/boards.h        |  3 +++
> >  include/hw/i386/pc.h       |  3 +++
> >  10 files changed, 77 insertions(+), 10 deletions(-)
> 
> Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
> 
> 
> > diff --git a/hw/i386/pc_piix.c b/hw/i386/pc_piix.c
> > index d9e69243b4a7..746bfe05d386 100644
> > --- a/hw/i386/pc_piix.c
> > +++ b/hw/i386/pc_piix.c
> > @@ -479,13 +479,24 @@ static void pc_i440fx_machine_options(MachineClass *m)
> >                                       "Use a different south bridge than PIIX3");
> >  }
> >  
> > -static void pc_i440fx_machine_9_1_options(MachineClass *m)
> > +static void pc_i440fx_machine_9_2_options(MachineClass *m)
> >  {
> >      pc_i440fx_machine_options(m);
> >      m->alias = "pc";
> >      m->is_default = true;
> >  }
> >  
> > +DEFINE_I440FX_MACHINE(9, 2);
> > +
> > +static void pc_i440fx_machine_9_1_options(MachineClass *m)
> > +{
> > +    pc_i440fx_machine_9_2_options(m);
> > +    m->alias = NULL;
> > +    m->is_default = false;
> > +    compat_props_add(m->compat_props, hw_compat_9_1, hw_compat_9_1_len);
> > +    compat_props_add(m->compat_props, pc_compat_9_1, pc_compat_9_1_len);
> > +}
> > +
> >  DEFINE_I440FX_MACHINE(9, 1);
> >  
> >  static void pc_i440fx_machine_9_0_options(MachineClass *m)
> > @@ -493,8 +504,6 @@ static void pc_i440fx_machine_9_0_options(MachineClass *m)
> >      PCMachineClass *pcmc = PC_MACHINE_CLASS(m);
> >  
> >      pc_i440fx_machine_9_1_options(m);
> > -    m->alias = NULL;
> > -    m->is_default = false;
> >      m->smbios_memory_device_size = 16 * GiB;
> 
> Feels like we should be adding an "_AS_LATEST" macro
> variant for piix/q35 too, so it matches the pattern
> in other targets for handling alias & is_default.
> 
> Not a thing your patch needs todo though.

I've just a patch that does that now. If it looks good & you want to include
it as a pre-requisite for your patch here feel free to grab, otherwise I can
rebase it after your patch merges.

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|

