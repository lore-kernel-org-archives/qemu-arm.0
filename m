Received: by 2002:a19:5205:0:0:0:0:0 with SMTP id m5csp1650558lfb;
        Fri, 3 Sep 2021 13:43:26 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwbefvgwMQDB9ftRADVWyLSFe8dlTRNSYyXsWtgvx7dFg2w780fT/s4R2nyM8kIPR2UY1qd
X-Received: by 2002:a5d:9693:: with SMTP id m19mr667670ion.72.1630701806254;
        Fri, 03 Sep 2021 13:43:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1630701806; cv=none;
        d=google.com; s=arc-20160816;
        b=QF8/stKSFUmgkHhrQ9YqJ7H3sJGuYcCnCdOiSIe0Rh89Xtc5J4cUv9HqFLMFRovu0R
         bL9+cyXYP/QmVpeaYxQr/uJU8CL2fbY6BJ87T8L99Lw6brzMLmysKpX4aMLb5BrgIjuh
         scV+Ot4bf4TOfATxCG3y16ZW1A9twz7ZvXYq03JwLhAabBoOvMXwNA6qXBhsb2SCxlHd
         21HERvISGx5q/A0SB5AnwqCOaQS7mYLJzxcfY8L2IO+vepCwb2Cgv+CMpqFJvfW0Pfzu
         F74idhE8x41cul1jkz3O6x2TIgcVA7cuTEOZSJE0SwI8O/Po3Up8MnTzgo/WSmW5zyE2
         L3Xw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-id:precedence:content-transfer-encoding:content-language
         :in-reply-to:mime-version:user-agent:date:message-id:from:references
         :cc:to:subject:dkim-signature;
        bh=vBLdwX3ZChNXVS/9UqNF4wJjMelZK55qA391msJX3qU=;
        b=x110DU0opri+ssDOpEqbxw+haUQzknMPLaX5gsh2ux3OShX5nBgv8sJaLMVgUCjL8W
         BojEnB21HKmSAGbvhLhLXrWbhhnCO7CKeq27vVfShm3ZPIG37gwSYTw22HqodmUEl2Mk
         DsNGRAQcmC6FNKr2mbShHirJbJZIhDd4JBQL95Dik2CpK6qcQzBYbZfAadwQ90bSbB6f
         AS9UEiFYVqh3C2JGmFWzZ4uM8urx+TSqQ/vpBYaWr9bl4zWZpEJiIfQCb1KaB4PTbHDG
         jZTsJfGDZ1LL/ek7J2Pvc/M3Lnj1qjGNG6SVdVBjzU+S1svXf7ZMiZGZjV/CXIsBXup7
         Xwyw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=sz9Kbnkk;
       spf=pass (google.com: domain of kvm-owner@vger.kernel.org designates 23.128.96.18 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <kvm-owner@vger.kernel.org>
Received: from vger.kernel.org (vger.kernel.org. [23.128.96.18])
        by mx.google.com with ESMTP id v17si351404ilm.40.2021.09.03.13.43.26;
        Fri, 03 Sep 2021 13:43:26 -0700 (PDT)
Received-SPF: pass (google.com: domain of kvm-owner@vger.kernel.org designates 23.128.96.18 as permitted sender) client-ip=23.128.96.18;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=sz9Kbnkk;
       spf=pass (google.com: domain of kvm-owner@vger.kernel.org designates 23.128.96.18 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1350931AbhICUoZ (ORCPT <rfc822;naresh.kamboju@linaro.org>
        + 5 others); Fri, 3 Sep 2021 16:44:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40772 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1350995AbhICUoT (ORCPT <rfc822;kvm@vger.kernel.org>);
        Fri, 3 Sep 2021 16:44:19 -0400
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com [IPv6:2a00:1450:4864:20::32c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2DE80C061575
        for <kvm@vger.kernel.org>; Fri,  3 Sep 2021 13:43:18 -0700 (PDT)
Received: by mail-wm1-x32c.google.com with SMTP id g138so104037wmg.4
        for <kvm@vger.kernel.org>; Fri, 03 Sep 2021 13:43:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=vBLdwX3ZChNXVS/9UqNF4wJjMelZK55qA391msJX3qU=;
        b=sz9KbnkkagCr/GFF3OMVQhtS6VhgzaCiOfnUEvPJVL2O8jwbbscHft/H9IJkpP0NsU
         TGizEk76lcvi8mLRugPLNXDpebTnYO3vqlZQK48MJI9TPSqJFF4fhUuswhN7CqY2Ghwk
         3vqpHJ2pzTxkD4Alw5fP1VVDaMLadtQr5cqiT1MBE/uvf9J116rMMc6TMrhbx3UMJdIj
         /DMhuBGeqgleldVui5C3jsYuqvxxkrLkQtp2u6KAbqe0LNNwZJBYdNlmGqmCrDRJX6/D
         H9oo/QoelvlvKhE6ZH5vxKSx6LJafL8LYNlCMQZjRXX4mct49OSCXeOxBiNBVInXZevi
         wD3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=vBLdwX3ZChNXVS/9UqNF4wJjMelZK55qA391msJX3qU=;
        b=cCW2g7IukL3Bry6hYkdPnO54oMjuT4p8DLmraASeROlNT+/qGX9osUFNCCMEco1r7m
         YZOQP6bIKJfgzvrBrcOaHZeqty7YHh6cQaM0e/oqEdzfnNenKcbHpG5qnrMvfzDfcf+3
         hpx0hVtTdqzKnHM4YlYn4hdvGnNMg9QTw1ZKXBx4+sXstbO5moSqN7H8ujkXqaoXfdBY
         0gBs+6YE0OEaHT2YVKVi2486SfRBJtRvFfl4fpMllR7LQ098+j7eD6CbZMkHi5Rd3cpc
         7ixcAEczquB9XODoxdpC1AI+Q49gew1kz+aPcQdSxHmNnh1/A2Tdodp7/jQd/59s0dNb
         evlg==
X-Gm-Message-State: AOAM532hoLaB92/RX5YZUFViDPJrI4puBnWdwYqlwrYMGstEZxfAknDp
        Ek2AmGpTyY73sjK2ZgcDqV39IPADWJgYZeQA/uw=
X-Received: by 2002:a1c:1c2:: with SMTP id 185mr479522wmb.11.1630701796724;
        Fri, 03 Sep 2021 13:43:16 -0700 (PDT)
Received: from [192.168.8.107] (190.red-2-142-216.dynamicip.rima-tde.net. [2.142.216.190])
        by smtp.gmail.com with ESMTPSA id w9sm294701wrs.7.2021.09.03.13.43.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 03 Sep 2021 13:43:16 -0700 (PDT)
Subject: Re: [PATCH v3 22/30] target/ppc: Simplify has_work() handlers
To:     =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
        qemu-devel@nongnu.org
Cc:     Bin Meng <bin.meng@windriver.com>,
        Eduardo Habkost <ehabkost@redhat.com>,
        Greg Kurz <groug@kaod.org>, haxm-team@intel.com,
        Kamil Rytarowski <kamil@netbsd.org>, qemu-ppc@nongnu.org,
        Anthony Perard <anthony.perard@citrix.com>,
        Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
        Michael Rolnik <mrolnik@gmail.com>, qemu-riscv@nongnu.org,
        Paolo Bonzini <pbonzini@redhat.com>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Thomas Huth <thuth@redhat.com>,
        David Hildenbrand <david@redhat.com>,
        Chris Wulff <crwulff@gmail.com>,
        Laurent Vivier <lvivier@redhat.com>,
        Cameron Esfahani <dirty@apple.com>,
        Sunil Muthuswamy <sunilmut@microsoft.com>,
        Max Filippov <jcmvbkbc@gmail.com>,
        Taylor Simpson <tsimpson@quicinc.com>, qemu-s390x@nongnu.org,
        Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
        Yoshinori Sato <ysato@users.sourceforge.jp>,
        Artyom Tarasenko <atar4qemu@gmail.com>,
        Aurelien Jarno <aurelien@aurel32.net>,
        Paul Durrant <paul@xen.org>,
        Peter Maydell <peter.maydell@linaro.org>,
        David Gibson <david@gibson.dropbear.id.au>,
        Alistair Francis <alistair.francis@wdc.com>,
        "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
        Roman Bolshakov <r.bolshakov@yadro.com>,
        Laurent Vivier <laurent@vivier.eu>,
        Cornelia Huck <cohuck@redhat.com>, qemu-arm@nongnu.org,
        Wenchao Wang <wenchao.wang@intel.com>,
        xen-devel@lists.xenproject.org, Marek Vasut <marex@denx.de>,
        Stefano Stabellini <sstabellini@kernel.org>,
        Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
        Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
        Colin Xu <colin.xu@intel.com>,
        Claudio Fontana <cfontana@suse.de>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Stafford Horne <shorne@gmail.com>,
        Reinoud Zandijk <reinoud@netbsd.org>, kvm@vger.kernel.org
References: <20210902161543.417092-1-f4bug@amsat.org>
 <20210902161543.417092-23-f4bug@amsat.org>
From:   Richard Henderson <richard.henderson@linaro.org>
Message-ID: <007f0874-b82f-5853-0c08-00528fb22bcb@linaro.org>
Date:   Fri, 3 Sep 2021 22:43:03 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210902161543.417092-23-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <kvm.vger.kernel.org>
X-Mailing-List: kvm@vger.kernel.org
X-TUID: pjSyJIRYRl23

On 9/2/21 6:15 PM, Philippe Mathieu-Daudé wrote:
> The common ppc_cpu_has_work() handler already checks for cs->halted,
> so we can simplify all callees.
> 
> Signed-off-by: Philippe Mathieu-Daudé<f4bug@amsat.org>
> ---
>   target/ppc/cpu_init.c | 294 ++++++++++++++++++++----------------------
>   1 file changed, 138 insertions(+), 156 deletions(-)

Well, I'm not actually a fan of this; I'd rather the outer function merely dispatch here, 
or preferably arrange to arrive here to begin.


r~
