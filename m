Received: by 2002:adf:b2b8:0:0:0:0:0 with SMTP id g53-v6csp5005942wrd;
        Tue, 18 Sep 2018 02:51:19 -0700 (PDT)
X-Google-Smtp-Source: ANB0VdY5QKs+wRMUH6RcAJ9yTMSzi/qGXBR8nxcJFN1IR7VNtHARrQf6OCKNoxORR3tv+An+k0Gk
X-Received: by 2002:a17:902:768c:: with SMTP id m12-v6mr28734055pll.56.1537264279056;
        Tue, 18 Sep 2018 02:51:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1537264279; cv=none;
        d=google.com; s=arc-20160816;
        b=B6spltzDIhJKxW0WeiIv7bkvcbo9hKyBLDbULAo6K7QLny39kFkyCXDsKFAXbRPol1
         rRvaDebhfntjkwLZS8Tg/2BqKTbt0cBqLi102VgT127m8Q+CW+wQQJkHfImmuwb/u2nh
         rlOMmjr/TTq9zFYy5bYlALWX6zKKOiXDHckhimrH9U5pHz3UMitoCsyn3UVXTDwVJq2Q
         uvu53s/H0jUJY5PYqytHdQu1A5JOEu7stMJZwcdTuDvOZNFa4MAz83iiis3zlR61qzXZ
         wugyBYvSqs+oCrx/LLf/33t0yma40cZGpx0IsKliFnt9CYwOwBEgLF1b8GhEE/bKg4C3
         u9kg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-id:precedence:sender:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:organization:autocrypt:openpgp:from:references:cc:to
         :subject;
        bh=ydaurBK9Ra31PBP7eWCxSww69BbKX/X5abI2H7veQZM=;
        b=Fxt7xgqsRFekwsBQtbPSOfyhIpSeKJuDQRyr4X3c3qw5/6OlgD4twHBxmtA8qVZaio
         RZlPJNqqHOKQYnyk+V64hDq/TSzu8DqZhEPW8anZEqunEpmKblOCjj81pkNgCh3Zhrka
         uo3FOoCE0uVTG5HPUAT89p52KC9E7aaS2Dweonip0m/+Idzp7MAAQwblA0yCGHt4AMG8
         Z+7w9KSlJE4ZjRuSU6nTV0u1UCz/ITCPeB65WEBPRHEvlz6HU6OdhPXcEpYvuRkF48v6
         blihbIRiWNXyDL+6oKezeXJ71HJxl+SrcUA4CktLga5ac/mY/W77ABP+5aEuyST4wtWC
         ZfdA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <kvm-owner@vger.kernel.org>
Received: from vger.kernel.org (vger.kernel.org. [209.132.180.67])
        by mx.google.com with ESMTP id l7-v6si17991876pgi.261.2018.09.18.02.51.18;
        Tue, 18 Sep 2018 02:51:19 -0700 (PDT)
Received-SPF: pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) client-ip=209.132.180.67;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729379AbeIRPXG (ORCPT <rfc822;francois.ozog@linaro.org>
        + 4 others); Tue, 18 Sep 2018 11:23:06 -0400
Received: from mx1.redhat.com ([209.132.183.28]:50070 "EHLO mx1.redhat.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728645AbeIRPXG (ORCPT <rfc822;kvm@vger.kernel.org>);
        Tue, 18 Sep 2018 11:23:06 -0400
Received: from smtp.corp.redhat.com (int-mx11.intmail.prod.int.phx2.redhat.com [10.5.11.26])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mx1.redhat.com (Postfix) with ESMTPS id 1BED73082131;
        Tue, 18 Sep 2018 09:51:15 +0000 (UTC)
Received: from [10.36.116.248] (ovpn-116-248.ams2.redhat.com [10.36.116.248])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 2CB8D30912F4;
        Tue, 18 Sep 2018 09:51:07 +0000 (UTC)
Subject: Re: [PATCH 00/35] exec: drop BQL from interrupt handling
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
From:   David Hildenbrand <david@redhat.com>
Openpgp: preference=signencrypt
Autocrypt: addr=david@redhat.com; prefer-encrypt=mutual; keydata=
 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
 SE+xAvmumFBY
Organization: Red Hat GmbH
Message-ID: <ddc5feb0-6a52-d511-4744-11c1ef8e8691@redhat.com>
Date:   Tue, 18 Sep 2018 11:51:06 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.0
MIME-Version: 1.0
In-Reply-To: <20180917163103.6113-1-cota@braap.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.26
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.42]); Tue, 18 Sep 2018 09:51:16 +0000 (UTC)
Sender: kvm-owner@vger.kernel.org
Precedence: bulk
List-ID: <kvm.vger.kernel.org>
X-Mailing-List: kvm@vger.kernel.org
X-TUID: COFsgwUP3XdB

Am 17.09.18 um 18:30 schrieb Emilio G. Cota:
> This series comes originally from a series of patches that Paolo
> sent to me a long time ago. I have kept most of his S-o-b tags,
> but I have done the forward port of the patches to the current
> QEMU code base, so please blame all possible bugs on me, not him.
> 
> The goal of this series is to push the BQL out of interrupt
> handling wherever possible. Many targets do not need the BQL
> to handle interrupts, so for those targets we get rid of the
> BQL in interrupt handling. In TCG mode, this by itself does
> not yield measurable performance gains. However, it is a
> necessary first step before tackling BQL contention when
> managing CPU states (i.e. exiting the exec loop always
> involves taking the BQL, which does not scale).
> 
> The patches:
> 
> - Patch 0 accesses icount_decr.u16 consistently with atomics.
>   This is important because we use it across threads to signal
>   that an interrupt is pending.
> 
> - 2-28: convert direct callers of cpu->interrupt_request
>   to use atomic accesses or CPU helper functions that use atomics.
>   I have broken these up into individual patches to ease review.
>   Note that in some cases I have added many atomic_reads, most
>   of which are probably unnecessary. However, I'd leave this up
>   to the maintainers, since I do not want to break things by
>   doing a single atomic_read(&cpu->interrupt_request) at the
>   beginning of a function and then miss subsequent updates to
>   cpu->interrupt_request.
> 
> - 29-31: drop the BQL requirement when handling cpu->interrupt_request
> 
> - 32-33: drop now unnecessary BQL acquisitions in i386 and ppc
> 
> - 34-35: push down the BQL acquisition to cpu->do_interrupt
>   and cpu->cpu_exec_interrupt. Here I am Cc'ing everyone so that
>   we can make sure I am not missing any target that requires
>   the BQL on either do_interrupt or cpu_exec_interrupt.
> 
> This series is checkpatch-clean, and can be fetched from:
>   https://github.com/cota/qemu/tree/cpu-lock
> 
> Note that the series applies on top of patches that are
> already on the qemu-devel list and will hopefully soon
> be upstream. This series begins after commit
> 4ece0cbd74 ("cpus: access .qemu_icount_bias with atomic64")
> in that tree.
> 
> Thanks,
> 
> 		Emilio
> 

I just did a (very slow) make -j32 of QEMU on my 16 core notebook inside
a MTTCG s390x-softmmu guest with 32 VCPUs. I used the same test when
reworking floating interrupt support to make sure there are no races.

As I got no deadlock, I assume you series does not break anything for s390x.

Thanks!

-- 

Thanks,

David / dhildenb
