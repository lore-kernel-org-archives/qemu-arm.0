Received: by 2002:adf:b2b8:0:0:0:0:0 with SMTP id g53-v6csp4899754wrd;
        Tue, 18 Sep 2018 00:48:15 -0700 (PDT)
X-Google-Smtp-Source: ANB0VdbqGQIIcyjihtBwtFazI6djd3EC8kkivKT41tQxKbFKKxI2hu5pUIlTXtYnz1VAmzWTjQBZ
X-Received: by 2002:a63:5055:: with SMTP id q21-v6mr26680730pgl.397.1537256895823;
        Tue, 18 Sep 2018 00:48:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1537256895; cv=none;
        d=google.com; s=arc-20160816;
        b=0yX5yrY9qLztgVyEaB7u+QYPjOBPwv71oWpGFPMfWG4ydkkHL+4yXvyWV7OkaHM26O
         DwMYEOa3P59eH0s3YNq4ovN1SwibP9UoO+Xfa1pCg2KqgFOhWLGfHfHJMx0JVzupeKiH
         DezOz0IampnNE/n1b1nW8fG2sYd/0cO0ZzV8u9g5Dfq6a/7UwBD0NTra54g9xB2FbXiU
         lqX1mD+sHWxZ0qYP0gN3a/iPlLCuo58O4hv3qvUWQp0KZWNvSDUqeab8/hKnb4rcuIJi
         UscVUn7WsIZbxzqz1BXO7iWDoV7FY8qLkla+yf8GtPbdKjGTiRPHB/Y0TnV7aHqZjuiz
         48Mw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-id:precedence:sender:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:organization:autocrypt:openpgp:from:references:cc:to
         :subject;
        bh=V52ql1JZQyHG+GMM76B+qCkmSVjxrq2+cQ6Z2oHm9F0=;
        b=gqZhSrefl3Twea+vyyRqOiJzLMmalmv1rnJmLQGOlHsry0ZuG3rgD65jrW5IyUPPDD
         ySg9ZMvrAJKoRYQQFJHqKtsBx73qTxDShsNE5nhpqvJht0DAM/Q2DPCE/CiDdVIb9yAe
         yclgUBhfYmN/83MpuiFDLfZIvYXg2NO7jsCR2Rku2CRj8Jljyuf7Srolr+8Q7i/LKpi8
         8kLqD2UWehBi5UiGrs8Qn6DIMgWMBWEVwmm3Jo78oEVJvpXgi0lZOtyCPemRtPNTZK5I
         7LfGKPPgXz1WgRfx1DAHqfPFZNaOGpXKAdGW3izNHjOJr8PWyfQDSWHM+E/v0d0UpPIL
         OgmQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <kvm-owner@vger.kernel.org>
Received: from vger.kernel.org (vger.kernel.org. [209.132.180.67])
        by mx.google.com with ESMTP id u11-v6si14370004pgc.460.2018.09.18.00.48.15;
        Tue, 18 Sep 2018 00:48:15 -0700 (PDT)
Received-SPF: pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) client-ip=209.132.180.67;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728787AbeIRNTh (ORCPT <rfc822;francois.ozog@linaro.org>
        + 4 others); Tue, 18 Sep 2018 09:19:37 -0400
Received: from mx1.redhat.com ([209.132.183.28]:51720 "EHLO mx1.redhat.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727140AbeIRNTh (ORCPT <rfc822;kvm@vger.kernel.org>);
        Tue, 18 Sep 2018 09:19:37 -0400
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mx1.redhat.com (Postfix) with ESMTPS id 6AB0A31649A6;
        Tue, 18 Sep 2018 07:48:12 +0000 (UTC)
Received: from [10.36.116.248] (ovpn-116-248.ams2.redhat.com [10.36.116.248])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 999FE104255A;
        Tue, 18 Sep 2018 07:48:04 +0000 (UTC)
Subject: Re: [PATCH 35/35] exec: push BQL down to cpu->cpu_exec_interrupt
To:     "Emilio G. Cota" <cota@braap.org>, qemu-devel@nongnu.org
Cc:     Paolo Bonzini <pbonzini@redhat.com>,
        Aleksandar Markovic <amarkovic@wavecomp.com>,
        Alexander Graf <agraf@suse.de>,
        Anthony Green <green@moxielogic.com>,
        Artyom Tarasenko <atar4qemu@gmail.com>,
        Aurelien Jarno <aurelien@aurel32.net>,
        Christian Borntraeger <borntraeger@de.ibm.com>,
        Chris Wulff <crwulff@gmail.com>,
        Cornelia Huck <cohuck@redhat.com>,
        David Gibson <david@gibson.dropbear.id.au>,
        "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
        Eduardo Habkost <ehabkost@redhat.com>,
        Guan Xuetao <gxt@mprc.pku.edu.cn>,
        James Hogan <jhogan@kernel.org>, kvm@vger.kernel.org,
        Laurent Vivier <laurent@vivier.eu>,
        Marcelo Tosatti <mtosatti@redhat.com>,
        Marek Vasut <marex@denx.de>,
        Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
        Michael Walle <michael@walle.cc>,
        Peter Crosthwaite <crosthwaite.peter@gmail.com>,
        Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
        qemu-ppc@nongnu.org, qemu-s390x@nongnu.org,
        Richard Henderson <rth@twiddle.net>,
        Stafford Horne <shorne@gmail.com>
References: <20180917163103.6113-1-cota@braap.org>
 <20180917163103.6113-36-cota@braap.org>
From:   David Hildenbrand <david@redhat.com>
Openpgp: preference=signencrypt
Autocrypt: addr=david@redhat.com; prefer-encrypt=mutual; keydata=
 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
 SE+xAvmumFBY
Organization: Red Hat GmbH
Message-ID: <a0232ed4-33f9-e06e-5308-1c096d518662@redhat.com>
Date:   Tue, 18 Sep 2018 09:48:03 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.0
MIME-Version: 1.0
In-Reply-To: <20180917163103.6113-36-cota@braap.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.41]); Tue, 18 Sep 2018 07:48:13 +0000 (UTC)
Sender: kvm-owner@vger.kernel.org
Precedence: bulk
List-ID: <kvm.vger.kernel.org>
X-Mailing-List: kvm@vger.kernel.org
X-TUID: uuacFtMqzC/1


>      return false;
> diff --git a/target/s390x/excp_helper.c b/target/s390x/excp_helper.c
> index 931c0103c8..f2a93abf01 100644
> --- a/target/s390x/excp_helper.c
> +++ b/target/s390x/excp_helper.c
> @@ -480,10 +480,13 @@ bool s390_cpu_exec_interrupt(CPUState *cs, int interrupt_request)
>                 the parent EXECUTE insn.  */
>              return false;
>          }
> +        qemu_mutex_lock_iothread();
>          if (s390_cpu_has_int(cpu)) {
>              s390_cpu_do_interrupt(cs);

You can directly use s390_cpu_do_interrupt_locked() here.

> +            qemu_mutex_unlock_iothread();
>              return true;
>          }
> +        qemu_mutex_unlock_iothread();
>          if (env->psw.mask & PSW_MASK_WAIT) {
>              /* Woken up because of a floating interrupt but it has already
>               * been delivered. Go back to sleep. */
> 

-- 

Thanks,

David / dhildenb
