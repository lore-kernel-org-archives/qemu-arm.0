Received: by 2002:ac2:5978:0:0:0:0:0 with SMTP id h24csp1471190lfp;
        Wed, 15 Sep 2021 01:53:56 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwPY/fR3FJITcxQIKGAeIvV8rnmBQAT24aGpDCmWhYaDIQrjl4Sw97z9QU3ykZ1ltuHxDvb
X-Received: by 2002:a25:5683:: with SMTP id k125mr4963054ybb.447.1631696036051;
        Wed, 15 Sep 2021 01:53:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1631696036; cv=none;
        d=google.com; s=arc-20160816;
        b=h0fRSx+LmqdwgHF8SEkLpOOoDsptuJOvl+zK3pl5IlfYQeM8hsLwdpXm6rfBDH29LP
         1S5OOBEscBGYlhXVwM97hsg9kkJy1RxbB+fLctspjpjx6/zyEahJ0u1oc1ZCZTXX/Fte
         LHp1BG7Au07f0r7Ly+Ewd5lWO0QXDwIJYg6ObgttpW5NnHI748NOegyc4pQKfmpL8WZ6
         v+EnUC6EmHmzsGpkA4IpdB5ehHzUKuUsnSeN2+Fxvu1tHhkUMzk7c9O4bR6g4X9oo0vJ
         9V+pAsSwVd/nOKrjXYEjysR1+yWbOP9wHudpYrtxwe9AnEibZ+hXEleVn4IAxert1oom
         tE4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:content-disposition:user-agent
         :in-reply-to:mime-version:references:message-id:subject:to:from:date
         :dkim-signature;
        bh=TBaKNBu639ZEHh/xMX97nJQu/PlaKwVBQMbzZpIXLbg=;
        b=bohReroW5bg1xnDo2aoxMFAdFOsJcv/6is1ugErYywDDL6GPnBhA9LWOdYEARWC1uC
         p1rxU0vu9XoY5vnMioCQlZJnayKJjq1pUNfPuasqGs/G1GwB9oqYqM26DogULZc/TlrB
         qv4GqSnQ0c6AnwGeRF52Qw5HjkROKOUinmGjGd5hBl1cTELWwD81NyRZetwDCALpTaEd
         Hw5Sh+qVZp0AjV9tv4FSDYMeoNlw7p78AkZZmi0gnBPSmdtGBzlG4MBo1NBnM7S8slko
         Yd3k3ZNQR8Iu9H27anWxzhpKpSpAPzzF9T7hP4I58UnTSwjY95ZPbwZHKd5m2xKVOn93
         jEDg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b="UqP4eW/C";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u3si13711367yba.114.2021.09.15.01.53.55
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 15 Sep 2021 01:53:56 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b="UqP4eW/C";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:57246 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mQQfz-0000vg-D9
	for alex.bennee@linaro.org; Wed, 15 Sep 2021 04:53:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46502)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mQQfP-0000Jq-Ko
 for qemu-arm@nongnu.org; Wed, 15 Sep 2021 04:53:19 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:46211)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mQQfM-0003kp-N1
 for qemu-arm@nongnu.org; Wed, 15 Sep 2021 04:53:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631695995;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=TBaKNBu639ZEHh/xMX97nJQu/PlaKwVBQMbzZpIXLbg=;
 b=UqP4eW/CP4ydYEg9ccuRKR7GtgoJyKDeE0Y8FKBQyFng68rJpc9mcVv/ElOEur4so+lqnq
 c4qoYbP86e8fjNgPN1ZOHNLPEtzFyFl8xZjezmDCYs/hptq23kgPv/kIjAtEraPGAL0pVY
 K3IBrTRNAJuFW0Zrh/ajntar8k4x5cU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-201-Z3tcu2TcPT64z57HgXjrXw-1; Wed, 15 Sep 2021 04:53:12 -0400
X-MC-Unique: Z3tcu2TcPT64z57HgXjrXw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 250A31015DA3;
 Wed, 15 Sep 2021 08:53:09 +0000 (UTC)
Received: from redhat.com (unknown [10.39.194.233])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 91F4B10016FE;
 Wed, 15 Sep 2021 08:52:53 +0000 (UTC)
Date: Wed, 15 Sep 2021 09:52:51 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: Re: [PATCH v2 27/53] target/xtensa: convert to use format_state
 instead of dump_state
Message-ID: <YUG0YwV1om2bmD9L@redhat.com>
References: <20210914142042.1655100-1-berrange@redhat.com>
 <20210914142042.1655100-28-berrange@redhat.com>
 <1cb38e8f-cc05-461a-c722-efb18519f6fe@amsat.org>
MIME-Version: 1.0
In-Reply-To: <1cb38e8f-cc05-461a-c722-efb18519f6fe@amsat.org>
User-Agent: Mutt/2.0.7 (2021-05-04)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.398,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Cc: Peter Maydell <peter.maydell@linaro.org>, Cornelia Huck <cohuck@redhat.com>,
 David Hildenbrand <david@redhat.com>, Bin Meng <bin.meng@windriver.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-devel@nongnu.org,
 Peter Xu <peterx@redhat.com>, Max Filippov <jcmvbkbc@gmail.com>,
 Taylor Simpson <tsimpson@quicinc.com>,
 Alistair Francis <alistair.francis@wdc.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Eric Blake <eblake@redhat.com>, Marek Vasut <marex@denx.de>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Markus Armbruster <armbru@redhat.com>, Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>, qemu-ppc@nongnu.org,
 Artyom Tarasenko <atar4qemu@gmail.com>, Laurent Vivier <lvivier@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, Greg Kurz <groug@kaod.org>,
 Yuval Shaia <yuval.shaia.ml@gmail.com>, qemu-s390x@nongnu.org,
 qemu-arm@nongnu.org, Michael Rolnik <mrolnik@gmail.com>,
 Stafford Horne <shorne@gmail.com>, David Gibson <david@gibson.dropbear.id.au>,
 qemu-riscv@nongnu.org, Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Chris Wulff <crwulff@gmail.com>, Laurent Vivier <laurent@vivier.eu>,
 Palmer Dabbelt <palmer@dabbelt.com>, Aurelien Jarno <aurelien@aurel32.net>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 0o2bfFt2h/+7

On Wed, Sep 15, 2021 at 09:32:38AM +0200, Philippe Mathieu-Daudé wrote:
> On 9/14/21 4:20 PM, Daniel P. Berrangé wrote:
> > Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
> > ---
> >  target/xtensa/cpu.c       |  2 +-
> >  target/xtensa/cpu.h       |  2 +-
> >  target/xtensa/translate.c | 45 ++++++++++++++++++++-------------------
> >  3 files changed, 25 insertions(+), 24 deletions(-)
> 
> > -void xtensa_cpu_dump_state(CPUState *cs, FILE *f, int flags)
> > +void xtensa_cpu_format_state(CPUState *cs, GString *buf, int flags)
> >  {
> >      XtensaCPU *cpu = XTENSA_CPU(cs);
> >      CPUXtensaState *env = &cpu->env;
> >      xtensa_isa isa = env->config->isa;
> >      int i, j;
> >  
> > -    qemu_fprintf(f, "PC=%08x\n\n", env->pc);
> > +    g_string_append_printf(buf, "PC=%08x\n\n", env->pc);
> >  
> >      for (i = j = 0; i < xtensa_isa_num_sysregs(isa); ++i) {
> >          const uint32_t *reg =
> > @@ -1340,55 +1340,56 @@ void xtensa_cpu_dump_state(CPUState *cs, FILE *f, int flags)
> >          int regno = xtensa_sysreg_number(isa, i);
> >  
> >          if (regno >= 0) {
> > -            qemu_fprintf(f, "%12s=%08x%c",
> > -                         xtensa_sysreg_name(isa, i),
> > -                         reg[regno],
> > -                         (j++ % 4) == 3 ? '\n' : ' ');
> > +            g_string_append_printf(buf, "%12s=%08x%c",
> > +                                   xtensa_sysreg_name(isa, i),
> > +                                   reg[regno],
> > +                                   (j++ % 4) == 3 ? '\n' : ' ');
> >          }
> >      }
> >  
> > -    qemu_fprintf(f, (j % 4) == 0 ? "\n" : "\n\n");
> > +    g_string_append_printf(buf, (j % 4) == 0 ? "\n" : "\n\n");
> >  
> >      for (i = 0; i < 16; ++i) {
> > -        qemu_fprintf(f, " A%02d=%08x%c",
> > -                     i, env->regs[i], (i % 4) == 3 ? '\n' : ' ');
> > +        g_string_append_printf(buf, " A%02d=%08x%c",
> > +                               i, env->regs[i], (i % 4) == 3 ? '\n' : ' ');
> >      }
> >  
> >      xtensa_sync_phys_from_window(env);
> > -    qemu_fprintf(f, "\n");
> > +    g_string_append_printf(buf, "\n");
> 
> g_string_append_c(); pre-existing but better to move it before
> xtensa_sync_phys_from_window().

I don't want to be re-arranging the code in this series. It is just
a straight search/replace of qemu_fprintf with g_string_append_printf,
with the bare minimum of other changes,  to minimize risk of breaking
something unexpected.

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|

