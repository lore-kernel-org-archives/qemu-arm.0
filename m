Received: by 2002:a19:e20e:0:0:0:0:0 with SMTP id z14csp3278733lfg;
        Mon, 10 May 2021 12:38:45 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz71nPLqDK10PgOKwkRk6KUI0TGqriqsrQE+S43kFsLBJuDjh0J2GdSP0JrODVAj11/SIJS
X-Received: by 2002:a05:6e02:168e:: with SMTP id f14mr23334779ila.292.1620675525230;
        Mon, 10 May 2021 12:38:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1620675525; cv=none;
        d=google.com; s=arc-20160816;
        b=0Q+ytD9z6utIZte26uhPc+7UuVshpNKFNfZtgMG/gYLrqYvSplMYEikTVSoYWF2QKj
         TftKzGiFDR+V65CmOxkaI3fch+ncGRs9lzweMQxOBKeVpJpJWWmPT8B7BGQvDfRIIm8M
         Vu1sDE+rYpmt6+JinAVTb+IAg/UMPpqOKP+sTFzpO+IHVlXPjrCnNZHWQPO2ZBB9wZpV
         Z7LoHNsivxdRA0MruwEPFGxlklARJshM9f9c3ld++OauBkVQhI3qK+x2EroqaVlJtz1G
         T4S0tJNhwspnn1n3LxyT6LKsi/e0/wCyYvroabBqJtzSurwRvM0DNhB+izxAcryNVLY8
         CFtQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=OxL4eyduhFG08wBLSX8Edl4A1+GWoqutuGYlt2ApjCo=;
        b=F28wgo2LiVzEVEupVilddWzYBYnJiSmUaK3OC/z7jRpwI0qix9kTwFRlZe9fYn1Axo
         Ssqz/bN1ilPejtmSgk/SOHa61v7MV0J1bOmAveh4z0KQU6cSWnKuJUTaDNQHfoeKnZlm
         kAfYO6oldN+A1uXmnsauKo5FsfNuvkgJ/if2HW46vN+UAge0tLTBJbZgQO54ZV8b5Sxx
         w18s+SpmNP4/s8yMWeaX9e9MB3DG3WwJsBXAEQ83+GufOX89fiNkP1Vqn1HyOmSxNaRn
         AaTQy8tDkFsp3SX86LEcWfX+fpcAnv4jnmDz4pGfjUR5VvXF3CA7dKQFfm8ZrKV1xGI4
         EBJQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=dZv3ZCcF;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g19si20585885jat.91.2021.05.10.12.38.45
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 10 May 2021 12:38:45 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=dZv3ZCcF;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Received: from localhost ([::1]:58550 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lgBjo-0004KY-K0
	for alex.bennee@linaro.org; Mon, 10 May 2021 15:38:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43152)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lgBiP-0002t1-Ki; Mon, 10 May 2021 15:37:17 -0400
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e]:45686)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lgBiN-0003sA-Ic; Mon, 10 May 2021 15:37:17 -0400
Received: by mail-ej1-x62e.google.com with SMTP id ga25so460245ejb.12;
 Mon, 10 May 2021 12:37:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=OxL4eyduhFG08wBLSX8Edl4A1+GWoqutuGYlt2ApjCo=;
 b=dZv3ZCcF9yDwBrMMTKDAKFmSg1ME5eA+W3HC8I39xGi7qq6udLnzEcBII11dTYjIdD
 hkAmiWHyJ7ulP8TWUhp1ooIhNeh+DIijK17k4lm7b2kJGshsbe9W/Pc+eaM3OVbDfNX9
 JEaaYR39HI+E5WBJU3DhyR5KJUBWL1YpzhBfPa3aO6dwuzgQsTjcjTSAhWpV5Y26L4pB
 ENAWtfVkwYqdUWpZlq1VTD/u0AveD1Llt367NQ1V+5NAiYrE6agvie6Vr42Uot13CXAb
 x1TrmoXJUW40H5EJNNhZ00HJ3GaJbTYFAbjyN4I3j2lc25qfACKVmvgaAk3Mt7/Zgzhv
 bxUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=OxL4eyduhFG08wBLSX8Edl4A1+GWoqutuGYlt2ApjCo=;
 b=ovj1dPcBqhiUeO8EvsCWQ7QJ1/qVgZOz9QdYBikUfz8jnnaOV2BlckadhwSz+C9J25
 OwAJQuUL7O4HrjdJujCOs0WjdCMBpjBgZtAAdSu7DSKg2zUDgD4lMMXzZsnL5B1J9Mrh
 tR1N0/Kcb3clobbnHKKlHCpLQhOxSMX3kFTymIAn505WHjRMoUdF5PejT47ci+g59//X
 5DgwscQj0LQtp8UEYscXTVFsyPrhZ8bztD4ghhiyb46gioIcdZdPm2qe/tnKu6QxViRr
 1IJQP9/zfnknkjPNYfSNiBKDoCUM4aD8Dpb+lAJ7dxr1brGqoT9Q56LcxXx+GedOd01N
 FiFA==
X-Gm-Message-State: AOAM530wXDIXOAHCsi/g2lNjIfq6YHQtK2vttiamwrGoFazmpLM1Qoh7
 K05b0nUbTSPQ4c9nmEmTmSw=
X-Received: by 2002:a17:907:1181:: with SMTP id
 uz1mr27445037ejb.194.1620675431752; 
 Mon, 10 May 2021 12:37:11 -0700 (PDT)
Received: from [192.168.1.36] (39.red-81-40-121.staticip.rima-tde.net.
 [81.40.121.39])
 by smtp.gmail.com with ESMTPSA id n15sm10181575eje.118.2021.05.10.12.37.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 10 May 2021 12:37:11 -0700 (PDT)
Subject: Re: [PATCH 0/6] hw/arm: Fix modelling of SSE-300 TCMs and SRAM
To: Peter Maydell <peter.maydell@linaro.org>
References: <20210510190844.17799-1-peter.maydell@linaro.org>
 <71d9367e-efbf-5051-68ac-df1dc7f53531@amsat.org>
 <CAFEAcA8L=iPhyxuJo49eNHuy+0zPAuKeHxxhMJRwoxcFhptuQQ@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <6757b72e-715e-2fc7-aa4d-fa2803081c80@amsat.org>
Date: Mon, 10 May 2021 21:37:09 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <CAFEAcA8L=iPhyxuJo49eNHuy+0zPAuKeHxxhMJRwoxcFhptuQQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62e;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ej1-x62e.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
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
Cc: Kumar Gala <kumar.gala@linaro.org>, QEMU Developers <qemu-devel@nongnu.org>,
 Devaraj Ranganna <devaraj.ranganna@linaro.org>, qemu-arm <qemu-arm@nongnu.org>,
 Kevin Townsend <kevin.townsend@linaro.org>,
 Jimmy Brisson <jimmy.brisson@linaro.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: qsD19FHmL1PL

On 5/10/21 9:22 PM, Peter Maydell wrote:
> On Mon, 10 May 2021 at 20:14, Philippe Mathieu-Daudé <f4bug@amsat.org> wrote:
>>
>> Hi Peter,
>>
>> On 5/10/21 9:08 PM, Peter Maydell wrote:
>>> This patchset fixes some bugs in how we were modelling the
>>> TCMs and the SRAM in the SSE-300 which were preventing
>>> Arm TF-M from booting on our AN547 model; there are also
>>> some fixes to things I noticed while I was in the code.
>>>
>>> The specific bugs preventing boot were:
>>>  * SRAM_ADDR_WIDTH for the AN547 is 21, not 15, so the SRAM
>>>    area was too small
>>>  * we were putting the SRAMs at the wrong address (0x2100_0000
>>>    for SSE-300, not 0x2000_0000 as for SSE-200)
>>
>> How can we test it?
> 
> I tested using a binary that Devaraj provided me. As usual,
> I don't know if there's anything that would be a sufficiently
> "publicly hosted, with associated source for licensing purposes"
> binary that we could put into tests/acceptance.

OK, thank you.

Phil.
