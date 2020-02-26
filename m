Received: by 2002:a19:cb43:0:0:0:0:0 with SMTP id b64csp2867896lfg;
        Wed, 26 Feb 2020 02:15:25 -0800 (PST)
X-Google-Smtp-Source: APXvYqwk9L55cgfZWyJ0+2hbfuxlWGFw4+skDvDkNl8J+J2FaVR3mcX1wKm9dh8SHTG1sWIg1JeW
X-Received: by 2002:aed:3022:: with SMTP id 31mr4215961qte.282.1582712125598;
        Wed, 26 Feb 2020 02:15:25 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1582712125; cv=none;
        d=google.com; s=arc-20160816;
        b=xIfItkFdTR9KjRJhRAnYwL0aRjl0+1bfTxD0k9Y8z323XtOi9VjJXQQo3wu46fH1M+
         dmI1GAwRm+s1BeYu6PWIwo53H8aBtXOW0PfS4PlWLjqm742EV8HHyTLgJR6AZTLAmV2w
         tlvGPdCtPWdnOUD6fVBOb22hBzT+IrOM9/KsKdZJYftdT7LBP6BCfeOE6qOhavgr+6a+
         z/23ZURf051WASVcGEcL7i+J94gheb0+KRS/AQ7nsa9HpUQ5uGCO546BmbE6zS/ygMEs
         31lzSaPLPiM4fvTS/jhnaNJYrGrL7+Tlu4TFH7jnxo4SUv3nMUdeNomwoVlIWXcd61rs
         diuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:subject:to:from:date
         :dkim-signature;
        bh=om53qjwnSjS90lVeCMzUxfnCbW/2PR9vmbVCQeD5U9w=;
        b=rpuN/9ssq4Vej6hrTyH3cv25cYBk1h/r46jAJEz3AoS+1SjMbsj2gGzMLcUX34z2iw
         bBCUXOQ52amdrDAM/pmY0xU9iWOzwWlZ/S+j1qleqnYit4Tu4VIV+Y6nCeYO8d8mJ2oA
         d7ZgrMcN6gVc7WFJ1NxhFVkVWn3e0uKTbYTKtpBr+sW3Esmodfa592yfRcuDAmFRyIKU
         Zmqa/1Geg/MxiufriXAEDX32Tfsg0dvUB84pdPn2yJTtVX34auzk+n11ZB2sKOkxxUvL
         57jQbb7cpY1cCAX9E+4kIwAHKcie4uvSAKe4oc+Q2ChDrnuIo53qIEjVlcXHekwbvtT4
         jD1A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=gp0+l4XQ;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m18si720341qka.225.2020.02.26.02.15.25
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 26 Feb 2020 02:15:25 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=gp0+l4XQ;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:41816 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1j6tiv-0006Vx-0K
	for alex.bennee@linaro.org; Wed, 26 Feb 2020 05:15:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45819)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <imammedo@redhat.com>) id 1j6tiS-0006TW-Lz
 for qemu-devel@nongnu.org; Wed, 26 Feb 2020 05:14:57 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <imammedo@redhat.com>) id 1j6tiR-0000WO-JG
 for qemu-devel@nongnu.org; Wed, 26 Feb 2020 05:14:56 -0500
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:20347
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <imammedo@redhat.com>) id 1j6tiR-0000UW-EB
 for qemu-devel@nongnu.org; Wed, 26 Feb 2020 05:14:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1582712095;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=om53qjwnSjS90lVeCMzUxfnCbW/2PR9vmbVCQeD5U9w=;
 b=gp0+l4XQNXoDEOJjz0C/HAwDhfyPuXKHZjT4hSFyQm491X3otRetvD1mymHgBiecGqGiQy
 Yd3DIxk6UYyxr5IpHeE+Z6tzhp7Ev62CThH5ZRbAA3WdUC4xw3cqB2fJp8RqoEtP4lD8Pw
 54CkmRqTKXjsAqVSAIBr/rqQ3bBXL0I=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-395-royBeu5qPTWcSnczuQIqMg-1; Wed, 26 Feb 2020 05:14:53 -0500
X-MC-Unique: royBeu5qPTWcSnczuQIqMg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 49A7A1005512;
 Wed, 26 Feb 2020 10:14:52 +0000 (UTC)
Received: from localhost (unknown [10.43.2.114])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C78B819C58;
 Wed, 26 Feb 2020 10:14:50 +0000 (UTC)
Date: Wed, 26 Feb 2020 11:14:49 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: Howard Spoelstra <hsp.cat7@gmail.com>
Subject: Re: Sudden slowdown of ARM emulation in master
Message-ID: <20200226111449.27530c6b@redhat.com>
In-Reply-To: <CABLmASFMv5MziuMKBdi0wydB9bKVZ-uYJ4_B_0a-YUQVk0nHYw@mail.gmail.com>
References: <CAPan3Wq-MVwcJQELP8n+g33CR7tsiGXQ698gA177nd2my9hWCw@mail.gmail.com>
 <20200226101948.786be4b0@redhat.com>
 <CABLmASFMv5MziuMKBdi0wydB9bKVZ-uYJ4_B_0a-YUQVk0nHYw@mail.gmail.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.120
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>,
 Niek Linnenbank <nieklinnenbank@gmail.com>, qemu-arm <qemu-arm@nongnu.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Philippe =?UTF-8?B?TWF0aGlldS1EYXVkw6k=?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: w1ZwbsYVE2x1

On Wed, 26 Feb 2020 10:32:38 +0100
Howard Spoelstra <hsp.cat7@gmail.com> wrote:

> On Wed, Feb 26, 2020 at 10:19 AM Igor Mammedov <imammedo@redhat.com> wrote:
> 
> > On Wed, 26 Feb 2020 00:07:55 +0100
> > Niek Linnenbank <nieklinnenbank@gmail.com> wrote:
> >  
> > > Hello Igor and Paolo,  
> >
> > does following hack solves issue?
> >
> > diff --git a/accel/tcg/translate-all.c b/accel/tcg/translate-all.c
> > index a08ab11f65..ab2448c5aa 100644
> > --- a/accel/tcg/translate-all.c
> > +++ b/accel/tcg/translate-all.c
> > @@ -944,7 +944,7 @@ static inline size_t size_code_gen_buffer(size_t
> > tb_size)
> >          /* ??? If we relax the requirement that CONFIG_USER_ONLY use the
> >             static buffer, we could size this on RESERVED_VA, on the text
> >             segment size of the executable, or continue to use the
> > default.  */
> > -        tb_size = (unsigned long)(ram_size / 4);
> > +        tb_size = MAX_CODE_GEN_BUFFER_SIZE;
> >  #endif
> >      }
> >      if (tb_size < MIN_CODE_GEN_BUFFER_SIZE) {
> >
> >  
> 
> Nice, for me, that brings qemu-system-ppc back up to speed. (applied to
> ppc-for-5.0)

thanks for confirming.

My patch a1b18df9a4 'vl.c: move -m parsing after memory backends has been processed'
moved ram_size parsing after accelerator init, but tcg allocates
buffer based on global ram_size and since ram_size is still 0 it
falls back to MIN_CODE_GEN_BUFFER_SIZE (see size_code_gen_buffer)
and if ram_size were too large it would cap buffet at
MAX_CODE_GEN_BUFFER_SIZE.

 *-user doesn't use ram_size, it uses DEFAULT_CODE_GEN_BUFFER_SIZE
and static buffer so it's no affected.

For softmmu it should be possible to postpone buffer allocation
till accel_setup_post(current_machine) time and fetch ram_size
from current machine dropping random access to global variable.
That would put buffer allocation after ram_size is parsed.

Does it look like a feasible approach?

> 
> Best,
> Howard

