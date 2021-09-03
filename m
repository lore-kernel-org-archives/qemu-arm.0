Received: by 2002:a19:5205:0:0:0:0:0 with SMTP id m5csp1649961lfb;
        Fri, 3 Sep 2021 13:42:27 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzjE6WQp8KAZR2EKpaYpGx7q76KQqb8u7OBrJw3gBOdISvGmZVRyXYIL/6JckUjEbrH7LtA
X-Received: by 2002:a17:906:b183:: with SMTP id w3mr747978ejy.394.1630701747510;
        Fri, 03 Sep 2021 13:42:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1630701747; cv=none;
        d=google.com; s=arc-20160816;
        b=Fkfb5NDIjRPx3xFxKnPFN+1jKIf4gZSs1McM4eELUwbn5+lfCk63TGsFEziMagBQlS
         aSl6/T+HO4LjHcyRk9Xw9sasv+yYRcufGMAhBVhm+tWhN3falDXpGvd0AemYu7dnqHEb
         swvnkk5G75iFL27swlGHTdVlbqBjS4gHntIN0T2FGU3sVI+qSjJc6ZhJr2caAIoCKTs7
         WmeD/FeAakrmp6j4Nx0Y5aMTY/dsm6OX+g6wSdiGZGCm2bGh7hAHUPG7jiON8iuG9kTm
         dFqTkr+hRKOBRzdz292E10K5qYWCh34Em6h7jqrvYB56OHj/d/4X4sbqiNlGjNvZlM+G
         B3rg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-id:precedence:content-transfer-encoding:content-language
         :in-reply-to:mime-version:user-agent:date:message-id:from:references
         :cc:to:subject:dkim-signature;
        bh=KO1an/5CmjrwEhdc2mhCZ+S9p7TgIYwX9ZNZ9M9TFAE=;
        b=VyVJVcktP1F4g9sUu/1bpAauS+fjF9Nojm+/B1phyBXfSRUcEYoh3dkOoRKfqYYNlI
         mT2MHq8ntCRNrPPj/FeqyeU/VBx+P725FmQpJgK9QmiLviwXww0jYOBPh/l6NfIIZ+oH
         xD4/cIdWBPHZ677Pr4Dub6wKOYWI/ltMmKZIidF5qlfe+IplisQdi+LJLizUMfJbQzrn
         wPLPeGc4NXJ5rDIinWYRTyiQYEbR18+g4RmuPDgGQdal1dz6B6ALe+4KqUUOJTCqUdwm
         9fTbcrxBEKddTF2R+KbA3yXSK6/Y3eC9NDRXGSI90qOt7/9Ij/2F72o9aeGaO1mZ4vo8
         lCwg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=cu2bS4up;
       spf=pass (google.com: domain of kvm-owner@vger.kernel.org designates 23.128.96.18 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <kvm-owner@vger.kernel.org>
Received: from vger.kernel.org (vger.kernel.org. [23.128.96.18])
        by mx.google.com with ESMTP id m1si336116ejj.198.2021.09.03.13.42.27;
        Fri, 03 Sep 2021 13:42:27 -0700 (PDT)
Received-SPF: pass (google.com: domain of kvm-owner@vger.kernel.org designates 23.128.96.18 as permitted sender) client-ip=23.128.96.18;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=cu2bS4up;
       spf=pass (google.com: domain of kvm-owner@vger.kernel.org designates 23.128.96.18 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1350875AbhICUnM (ORCPT <rfc822;naresh.kamboju@linaro.org>
        + 5 others); Fri, 3 Sep 2021 16:43:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40484 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1350618AbhICUnL (ORCPT <rfc822;kvm@vger.kernel.org>);
        Fri, 3 Sep 2021 16:43:11 -0400
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com [IPv6:2a00:1450:4864:20::332])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 01CA8C061575
        for <kvm@vger.kernel.org>; Fri,  3 Sep 2021 13:42:11 -0700 (PDT)
Received: by mail-wm1-x332.google.com with SMTP id 79-20020a1c0452000000b002e6cf79e572so353580wme.1
        for <kvm@vger.kernel.org>; Fri, 03 Sep 2021 13:42:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=KO1an/5CmjrwEhdc2mhCZ+S9p7TgIYwX9ZNZ9M9TFAE=;
        b=cu2bS4up1KUaZFvfqZzOd2qoAgEXmB9czyJg7Ld9C9RhrRFPlF7SwFqEwPUxttKJHP
         I1xS+ex3bHbMetfNUUCLVWvrfESiUFlOEywVjEsNBviabapOnUNOdhvyN9zKTl2NKPkI
         oFLzpz1YOXk4f6pHR/sY67Y1o2wn+XVbP1qwIi2sdi5BDgf0tM7J6FGdCmto3LcLIaIX
         PKJGhIKO37mpf5Ce+QN4EnowFcFFR+4AUTl4t3FVeWIkVZSObVUv39QZ23RCI1PJPmoc
         scHBKkHA2wztn0q+7QOHwGhnRETaGgrejgdp9/upgRUBCHz7lFrOigJB0pB0zh/LJOTn
         XY+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=KO1an/5CmjrwEhdc2mhCZ+S9p7TgIYwX9ZNZ9M9TFAE=;
        b=J6VFNafc5UdNQl9RXtZdumEeqckgGEfa1RkRZBfm9Nz/7fy/ddoamVWpEcSRV3Nmx6
         T/HMPKNtGJslSQT0ABCg2PdBRqz9IB+4MJ+SePXlwMzial2Vtv3l7uPGY+9xmwzHnB0h
         OTO88gp9JAuuG1gwkGfWp99VBi5OyXJVEzxmaEICs/3NCNM4co+X4E2jEdR0hBWatnH2
         3V4ZF4gm0npKQyU85vDGF4fv3QzoVIUlQXvosML+q7am93C3d+x2rsrJlbOeDEM9OmuD
         ZRyygmMfF/AWp6kcRRrIGTSTHrAOr+qdfo4jRG8VgrhVgVxMSsHI2GooHT//vwUwfXx9
         emFA==
X-Gm-Message-State: AOAM531+G4i5Om6fDPFNlTU61y84Fi8P2AhzVKxis5mnC5f7iK95y4bL
        +ecjDgMBckYse5nqAYEjCMON+ok9A74pBaPoNto=
X-Received: by 2002:a05:600c:a08:: with SMTP id z8mr522391wmp.165.1630701729599;
        Fri, 03 Sep 2021 13:42:09 -0700 (PDT)
Received: from [192.168.8.107] (190.red-2-142-216.dynamicip.rima-tde.net. [2.142.216.190])
        by smtp.gmail.com with ESMTPSA id y15sm462739wmi.18.2021.09.03.13.42.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 03 Sep 2021 13:42:09 -0700 (PDT)
Subject: Re: [PATCH v3 21/30] target/ppc: Introduce
 PowerPCCPUClass::has_work()
To:     David Gibson <david@gibson.dropbear.id.au>,
        =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Cc:     qemu-devel@nongnu.org, Bin Meng <bin.meng@windriver.com>,
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
 <20210902161543.417092-22-f4bug@amsat.org> <YTFxZb1Vg5pWVW9p@yekko>
From:   Richard Henderson <richard.henderson@linaro.org>
Message-ID: <fd383a02-fb9f-8641-937f-ebe1d8bb065f@linaro.org>
Date:   Fri, 3 Sep 2021 22:42:02 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <YTFxZb1Vg5pWVW9p@yekko>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <kvm.vger.kernel.org>
X-Mailing-List: kvm@vger.kernel.org
X-TUID: bX0tDPBTKXyh

On 9/3/21 2:50 AM, David Gibson wrote:
> On Thu, Sep 02, 2021 at 06:15:34PM +0200, Philippe Mathieu-Daudé wrote:
>> Each POWER cpu has its own has_work() implementation. Instead of
>> overloading CPUClass on each PowerPCCPUClass init, register the
>> generic ppc_cpu_has_work() handler, and have it call the POWER
>> specific has_work().
> 
> I don't quite see the rationale for introducing a second layer of
> indirection here.  What's wrong with switching the base has_work for
> each cpu variant?

We're moving the hook from CPUState to TCGCPUOps.
Phil was trying to avoid creating N versions of

static const struct TCGCPUOps ppc_tcg_ops = {
     ...
};

A plausible alternative is to remove the const from this struct and modify it, just as we 
do for CPUState, on the assumption that we cannot mix and match ppc cpu types in any one 
machine.


r~
