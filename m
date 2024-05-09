Received: by 2002:a17:907:a184:b0:a52:4db9:938b with SMTP id om4csp1287953ejc;
        Thu, 9 May 2024 07:40:28 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWs02ZaPS9ulce2qwv0uJdufvpK53BtQg0aPS/0X2cpiutwbOR05cAE/+Of7UcsT5XyjdItHMdbjGj+x9zgjTeYic8TMRFO
X-Google-Smtp-Source: AGHT+IEa5uqwAoqnAkm/wsxOxF8qcOmUOeAcj/CiIeq5YgC8CBuSpv2HaKDtBR1hPyCfl9258RjQ
X-Received: by 2002:a9d:6259:0:b0:6f0:577c:b29c with SMTP id 46e09a7af769-6f0b796392fmr6191036a34.15.1715265627975;
        Thu, 09 May 2024 07:40:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1715265627; cv=none;
        d=google.com; s=arc-20160816;
        b=xuNtjpF4JNy7Xewk3HYZlN3wf8s6DOtnEkN3Bku2WEGxzDNGcXMCegyPHIGIi5mK3E
         q0EsLofPUx3YmQTr2junLArU4NkiK/6ryRsA7t/nki7OAC/VKm8c0na8+ws/otlU1XPp
         EDLPjFALOc2QEqomHpE53UYDZZaw5QYOo5vK3yQPdEwrJrwR3IZysjV9gAjGqRkv5k4P
         uMcvy10QiLiVnnJBqHstuCsYrxxryWO0sls8DBcXOp5YWEBOfiljZ6pLquWnD2w+9FMM
         Oj46i8CNv4xOMgTtHvYprojxTbK25NL5GXGIlXsKr+RA69ceee1Bt/QGRujy7A1kuFwq
         YrhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence:user-agent
         :in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :dkim-signature;
        bh=927kGMV0fQxaTR2ZxiLdImjjB1frzAi3EvjJjjIqpUo=;
        fh=faGEeiKwcDc4ePUY+f5rnZ23h/67xk8gCIYnlfSDwo4=;
        b=ljyDgB0EVvj09/tt+EXVIG1N6rt98mdH4RbQGcdEVAXrMU9kn8HytK0Acc5+hh4/BD
         hYT0WND7QMbEU21PFqbDS2ro/vnuDT8lI4DwrhNSBe8f/YnztWCaDONxxlxv0F9FVzkv
         +nS7uvMv6cRcPlsMd1BD1cBM46vI53qOAAEgF6wN85yWUYWpzg3I1Pl/SpAXI0brdfxV
         azGRY1YElHMEzcbC7Y0XDX5LIIgcNpRjVvKIlWwBPEUEDLXw1aljM7P1VnQbJ757UCN0
         I2pc2zFrkdLjkK1TP7t6aMO5v43ZeHB8m1U5PnsdWBs73uJXDnz2kkZy8TemPKFlfTg2
         Rgbg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Jf4qnhBI;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-792bf27895dsi44654685a.148.2024.05.09.07.40.27
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 09 May 2024 07:40:27 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Jf4qnhBI;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1s54wL-0006sj-WA; Thu, 09 May 2024 10:40:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1s54wH-0006ng-GE
 for qemu-arm@nongnu.org; Thu, 09 May 2024 10:40:08 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1s54wD-0007yy-Jt
 for qemu-arm@nongnu.org; Thu, 09 May 2024 10:40:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1715265600;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=927kGMV0fQxaTR2ZxiLdImjjB1frzAi3EvjJjjIqpUo=;
 b=Jf4qnhBIJ3lEdtRXMcNa3bMt8QA/wUimj83ozbViZ/iOFc9oIL/PDeIdRf8p/ARytnN9Kq
 RJBwf1shVfVFNMdlVbCCjXvEJtjse9SPberc4gue0bdqVepAwKAFhS7OUSYa9G81m1UP1c
 wZdJ7AhOgtPOUu29YxjNiJjeQMjAks8=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-567-Ymmo9ysrPuqKIG-7bSJzVw-1; Thu,
 09 May 2024 10:39:57 -0400
X-MC-Unique: Ymmo9ysrPuqKIG-7bSJzVw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3A8211C05132;
 Thu,  9 May 2024 14:39:56 +0000 (UTC)
Received: from redhat.com (unknown [10.42.28.79])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A70A7208BC1F;
 Thu,  9 May 2024 14:39:52 +0000 (UTC)
Date: Thu, 9 May 2024 15:39:50 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Eric Blake <eblake@redhat.com>
Cc: qemu-devel@nongnu.org, Harsh Prateek Bora <harshpb@linux.ibm.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Nicholas Piggin <npiggin@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Yanan Wang <wangyanan55@huawei.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 =?utf-8?Q?C=C3=A9dric?= Le Goater <clegoate@redhat.com>,
 Halil Pasic <pasic@linux.ibm.com>,
 Laurent Vivier <laurent@vivier.eu>, qemu-arm@nongnu.org,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Eduardo Habkost <eduardo@habkost.net>, qemu-ppc@nongnu.org,
 David Gibson <david@gibson.dropbear.id.au>,
 Ilya Leoshkevich <iii@linux.ibm.com>, Eric Farman <farman@linux.ibm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 David Hildenbrand <david@redhat.com>, qemu-s390x@nongnu.org
Subject: Re: [PATCH 01/14] include/hw: add helpers for defining versioned
 machine types
Message-ID: <ZjzgNlXw6R-_OwSg@redhat.com>
References: <20240501182759.2934195-1-berrange@redhat.com>
 <20240501182759.2934195-2-berrange@redhat.com>
 <6lfkvaovs4tz5nep43zw5ueudqy2zrns6fttu4bmq3q5wqvgqx@hxnvw7sqsyzo>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <6lfkvaovs4tz5nep43zw5ueudqy2zrns6fttu4bmq3q5wqvgqx@hxnvw7sqsyzo>
User-Agent: Mutt/2.2.12 (2023-09-09)
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.6
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -26
X-Spam_score: -2.7
X-Spam_bar: --
X-Spam_report: (-2.7 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.581,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: /fIASID6B0+S

On Thu, May 02, 2024 at 09:57:21AM -0500, Eric Blake wrote:
> On Wed, May 01, 2024 at 07:27:46PM +0100, Daniel P. Berrangé wrote:
> > The various targets which define versioned machine types have
> > a bunch of obfuscated macro code for defining unique function
> > and variable names using string concatenation.
> > 
> > This addes a couple of helpers to improve the clarity of such
> > code macro.
> > 
> > Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
> > ---
> >  include/hw/boards.h | 166 ++++++++++++++++++++++++++++++++++++++++++++
> >  1 file changed, 166 insertions(+)
> > 
> > diff --git a/include/hw/boards.h b/include/hw/boards.h
> > index 2fa800f11a..47ca450fca 100644
> > --- a/include/hw/boards.h
> > +++ b/include/hw/boards.h
> > @@ -414,6 +414,172 @@ struct MachineState {
> >      struct NumaState *numa_state;
> >  };
> >  
> > +/*
> > + * The macros which follow are intended to facilitate the
> > + * definition of versioned machine types, using a somewhat
> > + * similar pattern across targets:
> > + *
> > + *  #define DEFINE_VIRT_MACHINE_IMPL(latest, ...) \
> > + *      static void MACHINE_VER_SYM(class_init, virt, __VA_ARGS__)( \
> > + *          ObjectClass *oc, \
> > + *          void *data) \
> > + *      { \
> > + *          MachineClass *mc = MACHINE_CLASS(oc); \
> > + *          MACHINE_VER_SYM(options, virt, __VA_ARGS__)(mc); \
> 
> Nice to include example usage of the macros.  __VA_ARGS__ is getting
> expanded quite a few times here, but I don't see that as being too
> much of a problem.
> 
> > + *  // Normal 2 digit eg 'virt-9.0'
> > + *  #define DEFINE_VIRT_MACHINE(major, minor) \
> > + *      DEFINE_VIRT_MACHINE_IMPL(false, major, minor)
> > + *
> > + *  // Bugfix 3 digit  eg 'virt-9.0.1'
> 
> Inconsistent on whether you are using one or two spaces before 'eg'.

Will fix

> 
> > +
> > +#define _MACHINE_VER_PICK(x1, x2, x3, x4, x5, x6, ...) x6
> 
> This helper macro is powerful; it may be worth a short comment, maybe
> along the lines of:
> 
> /* Helper macro used to pick the right macro name based on the number
>  * of extra arguments passed to the containing macro; usage:
>  *
>  *  _MACHINE_VER_PICK(__VA_ARGS__, \
>  *                    MACRO_FOR_5_ARGS, \
>  *                    MACRO_FOR_4_ARGS, \
>  *                    MACRO_FOR_3_ARGS, \
>  *                    MACRO_FOR_2_ARGS)(optional prefix args, __VA_ARGS__)
>  */

Yes, will add something like this

> 
> But once understood, I see it comes in handy in several places below.
> 
> Reviewed-by: Eric Blake <eblake@redhat.com>
> 
> -- 
> Eric Blake, Principal Software Engineer
> Red Hat, Inc.
> Virtualization:  qemu.org | libguestfs.org
> 

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|

