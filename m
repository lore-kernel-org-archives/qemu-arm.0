Received: by 2002:a19:5205:0:0:0:0:0 with SMTP id m5csp1670443lfb;
        Fri, 3 Sep 2021 14:11:53 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzGoRNgG17mIO3WhYeDT1PRK5wBvrg6g4RYeDVwEkXH2As8YH7+IyI7/s2iLGR95BtMvC1c
X-Received: by 2002:a92:4b01:: with SMTP id m1mr685203ilg.50.1630703513103;
        Fri, 03 Sep 2021 14:11:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1630703513; cv=none;
        d=google.com; s=arc-20160816;
        b=pA3+kFwXTiPfk7I3z4JWsVl1Q3vY4ta8gZTbh0DmY9xDg1Bi60KM+lame2y6RGfpcI
         iH8daPpDzoRXcIO0cJTSAKx4tcd7RsT5AFECkxHCYKFpCy0zXBaxNFuOBQr0DWmDGv+V
         xdTGMDniYocl3v/RVO/vlSdRDRwmXoRlVTTL6MLHx/c3BQvnkdMW+Bc/h5Vlz82N/I23
         WnRvPxpraDKL92jLRx4hrxcgJVbODzJB0z8A4GS9zawlb4poE6AhtaXQiJGDfKx5QRN2
         8cl0woPuUi2Z7eH/zCiaDavgyvbK17PEiBJvCJ5ctkE0s6QkAta41xyv+M3IhyCn6SA5
         Cqtw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-id:precedence:content-transfer-encoding:content-language
         :in-reply-to:mime-version:user-agent:date:message-id:from:references
         :cc:to:subject:sender:dkim-signature;
        bh=jI43SKJbesP12DNmL3/e0Usr50r2XgSNCcYV6kiyq6k=;
        b=AZCFsT8VQ3Bft24Wbwycny7lpg4F6ca0cAyIKQrExoa38ys4sZXoSs4b4zixpqEOE6
         imvABIMDx1EByY+xDQKwohRoQpDg1ErKusfafx98J5wfNwokhrzaJcwebHfvlm/hVBOS
         5EhIK/CiYjwMvPLJILXtdDOInwweuEjJ7oI7RRajuJ1h8HpKEY7hzSYLMWfrvy2xJkTr
         byWmo79XgLYxWEhnAzUWF0iTyqJ+ghb+EYYcPIa2pn9AM5tY+UsdJdMifQMayIho3Hw8
         LJfai64stEpxVVqhCPtaLJkFUEbINtrINuy6YecV70fW6Uvcse+HzQ9HF+m23BYQ7jKQ
         HZCQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20210112 header.b=XH5LRShQ;
       spf=pass (google.com: domain of kvm-owner@vger.kernel.org designates 23.128.96.18 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org
Return-Path: <kvm-owner@vger.kernel.org>
Received: from vger.kernel.org (vger.kernel.org. [23.128.96.18])
        by mx.google.com with ESMTP id h13si419520ilc.131.2021.09.03.14.11.52;
        Fri, 03 Sep 2021 14:11:53 -0700 (PDT)
Received-SPF: pass (google.com: domain of kvm-owner@vger.kernel.org designates 23.128.96.18 as permitted sender) client-ip=23.128.96.18;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20210112 header.b=XH5LRShQ;
       spf=pass (google.com: domain of kvm-owner@vger.kernel.org designates 23.128.96.18 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234568AbhICVMw (ORCPT <rfc822;naresh.kamboju@linaro.org>
        + 5 others); Fri, 3 Sep 2021 17:12:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47330 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233367AbhICVMv (ORCPT <rfc822;kvm@vger.kernel.org>);
        Fri, 3 Sep 2021 17:12:51 -0400
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com [IPv6:2a00:1450:4864:20::42c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BAFA7C061575
        for <kvm@vger.kernel.org>; Fri,  3 Sep 2021 14:11:50 -0700 (PDT)
Received: by mail-wr1-x42c.google.com with SMTP id b6so457038wrh.10
        for <kvm@vger.kernel.org>; Fri, 03 Sep 2021 14:11:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=jI43SKJbesP12DNmL3/e0Usr50r2XgSNCcYV6kiyq6k=;
        b=XH5LRShQJoZBhky3eh03Pmb9SkQ32XBteRsyogRiPstHFr6orcBCJeqTh6+8uA9Ugj
         hwUHRkbv3Iki29kH6SULZWWaPVeHLm9dOZGMJp/KvL+iV9qeA3IsgO7aPDi6dPOxdM5Q
         ws2BSkCdqzZ3QGSkRU4XFRPZC9C8RO5eAPwO0xHZyZ51hswyi5ZlgnIK0hazE40GI5Vy
         pDzx5Z2/NQxO+YOF01K7Wot3MRs8tFcfTdIvEFWt3PL9aHwjDLKgNplb2i8xQwHyzDKi
         JVFun0OPCzM5tItFSKRVH8Yfw5eizrEfOkYRFD8WnJK9txMG72i4kstdXmKL8/qxt3TH
         7oMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=jI43SKJbesP12DNmL3/e0Usr50r2XgSNCcYV6kiyq6k=;
        b=l8tIMBqQhjpZgUYf8RpNjKBXrEqH8hptUlTFU96Z8+6hkdY4XH6XrwoNHyds/4TnYH
         xhup//p4EnoVnt4LVRrIciOs+o/ugAWPaxZWV27Wx2CP134egGXePx/xVTm0/xgfWjJm
         MTgHYJeqDb1T1CBHQfTaTPPSg5PjuPo1D1WILNNlcBQHqRg2tiXyln2GaKHISjVhbpnN
         rhCcBtA1dU4w38ra1YfQPzxafXQimHqRNaUvzuqKVwf5iGBf/b7gn2N+CbvsJAJPzZ0A
         aGPhwfDmR+6SGKyHtwJBWBNknkrh0S6dw9eUia8xskbgF38c4JB1SsSCR1uskb3HSEdp
         LL1g==
X-Gm-Message-State: AOAM533b0SCILYpTG03A6sVIokmabhEKj1hAePDoX94a4dot3U8bEa2B
        06nApbqgDj/Ej//yX0Do6r4=
X-Received: by 2002:a5d:40d1:: with SMTP id b17mr974069wrq.47.1630703509319;
        Fri, 03 Sep 2021 14:11:49 -0700 (PDT)
Received: from [192.168.1.36] (21.red-83-52-55.dynamicip.rima-tde.net. [83.52.55.21])
        by smtp.gmail.com with ESMTPSA id s205sm411532wme.4.2021.09.03.14.11.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 03 Sep 2021 14:11:48 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= 
        <philippe.mathieu.daude@gmail.com>
Subject: Re: [PATCH v3 21/30] target/ppc: Introduce
 PowerPCCPUClass::has_work()
To:     Richard Henderson <richard.henderson@linaro.org>,
        David Gibson <david@gibson.dropbear.id.au>,
        =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
        Greg Kurz <groug@kaod.org>
Cc:     Peter Maydell <peter.maydell@linaro.org>,
        Cornelia Huck <cohuck@redhat.com>, kvm@vger.kernel.org,
        David Hildenbrand <david@redhat.com>,
        Bin Meng <bin.meng@windriver.com>,
        Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
        qemu-devel@nongnu.org, Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Laurent Vivier <laurent@vivier.eu>,
        Max Filippov <jcmvbkbc@gmail.com>,
        Taylor Simpson <tsimpson@quicinc.com>, haxm-team@intel.com,
        Colin Xu <colin.xu@intel.com>,
        Stafford Horne <shorne@gmail.com>, Marek Vasut <marex@denx.de>,
        Stefano Stabellini <sstabellini@kernel.org>,
        Yoshinori Sato <ysato@users.sourceforge.jp>,
        Paul Durrant <paul@xen.org>,
        Kamil Rytarowski <kamil@netbsd.org>,
        Reinoud Zandijk <reinoud@netbsd.org>,
        Claudio Fontana <cfontana@suse.de>,
        Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
        Anthony Perard <anthony.perard@citrix.com>,
        xen-devel@lists.xenproject.org,
        Artyom Tarasenko <atar4qemu@gmail.com>,
        Laurent Vivier <lvivier@redhat.com>,
        Thomas Huth <thuth@redhat.com>,
        Eduardo Habkost <ehabkost@redhat.com>,
        Greg Kurz <groug@kaod.org>, Cameron Esfahani <dirty@apple.com>,
        qemu-s390x@nongnu.org, qemu-arm@nongnu.org,
        Michael Rolnik <mrolnik@gmail.com>,
        Sunil Muthuswamy <sunilmut@microsoft.com>,
        Palmer Dabbelt <palmer@dabbelt.com>, qemu-riscv@nongnu.org,
        Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
        Chris Wulff <crwulff@gmail.com>,
        Roman Bolshakov <r.bolshakov@yadro.com>, qemu-ppc@nongnu.org,
        Wenchao Wang <wenchao.wang@intel.com>,
        Alistair Francis <alistair.francis@wdc.com>,
        Paolo Bonzini <pbonzini@redhat.com>,
        Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
        Aurelien Jarno <aurelien@aurel32.net>
References: <20210902161543.417092-1-f4bug@amsat.org>
 <20210902161543.417092-22-f4bug@amsat.org> <YTFxZb1Vg5pWVW9p@yekko>
 <fd383a02-fb9f-8641-937f-ebe1d8bb065f@linaro.org>
From:   =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <fc98e293-f2ba-8ca0-99c8-f07758b79d73@amsat.org>
Date:   Fri, 3 Sep 2021 23:11:46 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <fd383a02-fb9f-8641-937f-ebe1d8bb065f@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <kvm.vger.kernel.org>
X-Mailing-List: kvm@vger.kernel.org
X-TUID: qYybDcDZjaEe

On 9/3/21 10:42 PM, Richard Henderson wrote:
> On 9/3/21 2:50 AM, David Gibson wrote:
>> On Thu, Sep 02, 2021 at 06:15:34PM +0200, Philippe Mathieu-Daudé wrote:
>>> Each POWER cpu has its own has_work() implementation. Instead of
>>> overloading CPUClass on each PowerPCCPUClass init, register the
>>> generic ppc_cpu_has_work() handler, and have it call the POWER
>>> specific has_work().
>>
>> I don't quite see the rationale for introducing a second layer of
>> indirection here.  What's wrong with switching the base has_work for
>> each cpu variant?
> 
> We're moving the hook from CPUState to TCGCPUOps.
> Phil was trying to avoid creating N versions of
> 
> static const struct TCGCPUOps ppc_tcg_ops = {
>     ...
> };

Ah yes this is the reason! Too many context switching so
I forgot about it.

> A plausible alternative is to remove the const from this struct and
> modify it, just as we do for CPUState, on the assumption that we cannot
> mix and match ppc cpu types in any one machine.

I thought about this case and remembered how it works on the ARM arch,
i.e. ZynqMP machine uses both Cortex-R5F and Cortex-A53. Even if no
similar PPC machine exists, IMHO we should try to generally allow to
possibility to experiment machine with different CPUs. Restricting it
on PPC goes the other way around. Thoughts?
