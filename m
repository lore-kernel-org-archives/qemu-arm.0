Received: by 2002:ac2:5978:0:0:0:0:0 with SMTP id h24csp1469106lfp;
        Wed, 15 Sep 2021 01:50:04 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw5/nKG16Nm/WMhzyXL7/49kwPvOPEUamqWbgur6K1CCowgyh+YPKJjfUb05Suu8rj8b/Jn
X-Received: by 2002:a25:6c04:: with SMTP id h4mr4912862ybc.429.1631695804188;
        Wed, 15 Sep 2021 01:50:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1631695804; cv=none;
        d=google.com; s=arc-20160816;
        b=SAEi7VAZScoJUbo9TihB6+sr6g1XpqRRRNShe1/CLyNDCnlfjMsXbsNCJTXH+dTLQC
         N7OBBmpfZRw8F014L1OTo+pRe9aHxA05SQFXTUcRRTgawz8NyflG9oCJVu/Wqpw+OB1n
         NmfCrJhernjQB4XEFk6n6xN9nXLZ6ogFNwf4mGsLOY3uv8cQv8I0xtQiQ9TiK2I/4Jjl
         O7PebFjXu8BwyC3XU6v8fsYtwhAKAHgKDNLACt6tpXQsuViyNh/p23Oef+FHPLhdGKDo
         bmhz4GCHSZU/7QwajEThJ05c72HClr7mRkzrAPGMFiQwWKamJxOardd/3yzlAwBUUpKM
         2u5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:content-disposition:user-agent
         :in-reply-to:mime-version:references:message-id:subject:to:from:date
         :dkim-signature;
        bh=UbsWX5ThNzbLSLppNv0zipcECBhQ1lONYygbF5FVZZg=;
        b=u0wMxfYNM77KoPWYOyg/GZDXPgDJHra5B+eNHIM25LXxRXVycK268UBuYe7zr+JsP5
         7naLlekKj2F89TK2GHKOlMOmemjU0a++0ZFyz6h7nK9CuxQ4rE/7jxXdVsWXT/lGQBGs
         qCFOnZCrcLxMUEjLrA8DNFsGvdq8F3dgndGzZX0uG01LuQAPpOOxvzPjSnk/x1L7Ss+U
         yr2NyrZdwpV+zU0sC4NUhnTuhzTMd9ibDiWYS4c4+3qGWKC8TA0VeO0VioS8J4ONElIy
         79mwTyKbaqMA7eiqde48EOC3/s5ck2XdVjL8JM5TJkIs7Oa3jES46HRTKVFFtZPZ9UD1
         +3Bg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=K0NkoRp9;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j14si14367125ybp.305.2021.09.15.01.50.04
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 15 Sep 2021 01:50:04 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=K0NkoRp9;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:51100 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mQQcF-00053B-Hc
	for alex.bennee@linaro.org; Wed, 15 Sep 2021 04:50:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45856)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mQQc6-00050u-Mb
 for qemu-arm@nongnu.org; Wed, 15 Sep 2021 04:49:54 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:53858)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mQQc4-0000ry-5J
 for qemu-arm@nongnu.org; Wed, 15 Sep 2021 04:49:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631695791;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UbsWX5ThNzbLSLppNv0zipcECBhQ1lONYygbF5FVZZg=;
 b=K0NkoRp9NHoz3nyYMRSpvnSs1Y9DDzkefj2QjiTnmx0V6mMwcKt7SiTEP+vna2dV/WENdQ
 EDLsC4g7FLJh6ccJ5RsaNXVKXphsHx+oFK4bydQwCOxbxMrQEZ3gjhWejEJ5Sjk28iLzSV
 r2AZNCxxqlkpcWsMNQzGdQKJ7uW6NuE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-235-fke9A7PLMHqixdvWp5O0SA-1; Wed, 15 Sep 2021 04:49:48 -0400
X-MC-Unique: fke9A7PLMHqixdvWp5O0SA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5F03F802928;
 Wed, 15 Sep 2021 08:49:44 +0000 (UTC)
Received: from redhat.com (unknown [10.39.194.233])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 7AFF06B54B;
 Wed, 15 Sep 2021 08:49:24 +0000 (UTC)
Date: Wed, 15 Sep 2021 09:49:21 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: Re: [PATCH v2 09/53] target/avr: convert to use format_state instead
 of dump_state
Message-ID: <YUGzkcTjgsTjO5PQ@redhat.com>
References: <20210914142042.1655100-1-berrange@redhat.com>
 <20210914142042.1655100-10-berrange@redhat.com>
 <e0ca8f7b-0e88-4548-1b24-2a3b79e56ad5@amsat.org>
MIME-Version: 1.0
In-Reply-To: <e0ca8f7b-0e88-4548-1b24-2a3b79e56ad5@amsat.org>
User-Agent: Mutt/2.0.7 (2021-05-04)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Cc: Peter Maydell <peter.maydell@linaro.org>, Cornelia Huck <cohuck@redhat.com>,
 David Hildenbrand <david@redhat.com>, Bin Meng <bin.meng@windriver.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-devel@nongnu.org,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Max Filippov <jcmvbkbc@gmail.com>,
 Taylor Simpson <tsimpson@quicinc.com>,
 Alistair Francis <alistair.francis@wdc.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Eric Blake <eblake@redhat.com>, Marek Vasut <marex@denx.de>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Markus Armbruster <armbru@redhat.com>, Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, qemu-ppc@nongnu.org,
 Artyom Tarasenko <atar4qemu@gmail.com>, Laurent Vivier <lvivier@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, Greg Kurz <groug@kaod.org>,
 Yuval Shaia <yuval.shaia.ml@gmail.com>, qemu-s390x@nongnu.org,
 qemu-arm@nongnu.org, Michael Rolnik <mrolnik@gmail.com>,
 Peter Xu <peterx@redhat.com>, Stafford Horne <shorne@gmail.com>,
 David Gibson <david@gibson.dropbear.id.au>, qemu-riscv@nongnu.org,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Chris Wulff <crwulff@gmail.com>, Laurent Vivier <laurent@vivier.eu>,
 Palmer Dabbelt <palmer@dabbelt.com>, Aurelien Jarno <aurelien@aurel32.net>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: BqXNtZfyBygI

On Wed, Sep 15, 2021 at 09:13:14AM +0200, Philippe Mathieu-Daudé wrote:
> On 9/14/21 4:19 PM, Daniel P. Berrangé wrote:
> > Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
> > ---
> >  target/avr/cpu.c | 57 ++++++++++++++++++++++++------------------------
> >  1 file changed, 29 insertions(+), 28 deletions(-)
> > 
> > diff --git a/target/avr/cpu.c b/target/avr/cpu.c
> > index ea14175ca5..17ff21f8be 100644
> > --- a/target/avr/cpu.c
> > +++ b/target/avr/cpu.c
> > @@ -145,43 +145,44 @@ static ObjectClass *avr_cpu_class_by_name(const char *cpu_model)
> >      return oc;
> >  }
> >  
> > -static void avr_cpu_dump_state(CPUState *cs, FILE *f, int flags)
> > +static void avr_cpu_format_state(CPUState *cs, GString *buf, int flags)
> >  {
> >      AVRCPU *cpu = AVR_CPU(cs);
> >      CPUAVRState *env = &cpu->env;
> >      int i;
> >  
> > -    qemu_fprintf(f, "\n");
> > -    qemu_fprintf(f, "PC:    %06x\n", env->pc_w * 2); /* PC points to words */
> > -    qemu_fprintf(f, "SP:      %04x\n", env->sp);
> > -    qemu_fprintf(f, "rampD:     %02x\n", env->rampD >> 16);
> > -    qemu_fprintf(f, "rampX:     %02x\n", env->rampX >> 16);
> > -    qemu_fprintf(f, "rampY:     %02x\n", env->rampY >> 16);
> > -    qemu_fprintf(f, "rampZ:     %02x\n", env->rampZ >> 16);
> > -    qemu_fprintf(f, "EIND:      %02x\n", env->eind >> 16);
> > -    qemu_fprintf(f, "X:       %02x%02x\n", env->r[27], env->r[26]);
> > -    qemu_fprintf(f, "Y:       %02x%02x\n", env->r[29], env->r[28]);
> > -    qemu_fprintf(f, "Z:       %02x%02x\n", env->r[31], env->r[30]);
> > -    qemu_fprintf(f, "SREG:    [ %c %c %c %c %c %c %c %c ]\n",
> > -                 env->sregI ? 'I' : '-',
> > -                 env->sregT ? 'T' : '-',
> > -                 env->sregH ? 'H' : '-',
> > -                 env->sregS ? 'S' : '-',
> > -                 env->sregV ? 'V' : '-',
> > -                 env->sregN ? '-' : 'N', /* Zf has negative logic */
> > -                 env->sregZ ? 'Z' : '-',
> > -                 env->sregC ? 'I' : '-');
> > -    qemu_fprintf(f, "SKIP:    %02x\n", env->skip);
> > -
> > -    qemu_fprintf(f, "\n");
> > +    g_string_append_printf(buf, "\n");
> 
> This would be g_string_append_c(buf, '\n') but in this particular case
> it doesn't seem helpful so I'd directly remove it.

I don't want to change output format of the commands, with exception of
error reporting, as this is intended to be just refactoring patch, not
a cleanup patch.

I'm not convinced it is worth special casing single byte strings to
use g_string_append_c either really.

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|

