Received: by 2002:a19:ee0a:0:0:0:0:0 with SMTP id g10csp323481lfb;
        Thu, 3 Dec 2020 04:31:11 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyUEMCqMDksgO51WJMNqluCdbPtXKRl64V242oJZiZ2kL4USTGygXcYDwll1f2cedD6pbyN
X-Received: by 2002:a25:6801:: with SMTP id d1mr4127177ybc.9.1606998670935;
        Thu, 03 Dec 2020 04:31:10 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1606998670; cv=none;
        d=google.com; s=arc-20160816;
        b=LolsAnFrfhKsU4gzGX/AYEes8/cmjiPmgTHEgSBKSZSrZ2KzDCESnZ65o/Zcd5RlUt
         i9x3LeeO8YRiM4eLqnwO+1kKiXbtTeu4tviUgYOCxLuxRpvZ439Ex3R5ExOyWWw11m5p
         DH96VnJFUotIZUHpeRE9M0VM2eebNFIse3UBVtXpEGTamt5SB6KnnznE+JE8F5tVqXyK
         lXcYRxEAyBjPdj7nR03m38bo44LKfyvGIV3yk1wLLltJZG/JQ9zq/oNIhvjW1soziCag
         LdgZSq6lpNtD2OrncLiGggxF/vmj72l3r/4w9HH3pRtBOV/CCnrjfHkRqOzgEaLQEjzs
         ADyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=7kS5OzR9MaP4rg6v65bO9wp7fuT8Mlo97khH7RfT/8A=;
        b=wKagkFClowQj3WDmSjuqZN7ITM7dWJvY1vqzl4JN5D7tSQqegUWiFizE5UGfR8KyUa
         JY0DiaZ4gEAZy4VGyWc8yLVLP9kL49aqjzcwBKe/jjNGXOeRKAecJclvjkxuUby+hF8H
         iJvmhiFBt4cSh6lpnVj1z7Dod2CVibyL/BwAPrskUAKn6cDIIqEYduqXCtb/rrrR0wD0
         cLcIoMNMb/2zkI07lGPMsPtldPsawc9dUaKrksIFoIT2fUEO6RlnpNHsi3ItLhKja3m7
         mrAT5QgVkZPt7cp4O+l6mO+sU7/PkBAubACeHrXWYWuY5qs9/UVPkoyIz+U8QvKooW0r
         +bjw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=cOUtf14H;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v190si1574615ybb.310.2020.12.03.04.31.10
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 03 Dec 2020 04:31:10 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=cOUtf14H;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:59624 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kknlO-000642-AU
	for alex.bennee@linaro.org; Thu, 03 Dec 2020 07:31:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41554)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kknlD-00062X-4k
 for qemu-arm@nongnu.org; Thu, 03 Dec 2020 07:30:59 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:46910)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kknlB-0001ZX-0c
 for qemu-arm@nongnu.org; Thu, 03 Dec 2020 07:30:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606998656;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7kS5OzR9MaP4rg6v65bO9wp7fuT8Mlo97khH7RfT/8A=;
 b=cOUtf14Hxuu8lpI1dlOogmafbyaAmuQAxYBUCPY7DBMc3D3qjjjB/MdRNmfdqGB4Lz8z3P
 jTnlynyp4ip/28TaSUX/XewM4LikH8TEwZoyEYSKytuNI1L6Uf9rPFGyZZ8sDkCV9bxDtY
 KpDsCI6d2etaocGPIzlMGa2PtV9oXMY=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-57-wAAPLmfENYm2dryyZIHCVQ-1; Thu, 03 Dec 2020 07:30:53 -0500
X-MC-Unique: wAAPLmfENYm2dryyZIHCVQ-1
Received: by mail-wr1-f72.google.com with SMTP id 91so1140586wrk.17
 for <qemu-arm@nongnu.org>; Thu, 03 Dec 2020 04:30:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=7kS5OzR9MaP4rg6v65bO9wp7fuT8Mlo97khH7RfT/8A=;
 b=TXHGvR7I9JhWp9Gx8g0wMeyi8K/Vm2vWegmY28Qv+KNDEwjS7BFAHVLeF3hmfr3a1t
 fALnnKEvGAU2RetEvVJY9PfuuHmlEsI3qioXcwIf1jep/9o8NVY+xqnwkbT/gJKJMOV9
 CuWg2152cZiEUccIWxY4HVbrvcxvkGQWNFQNTppgKzeCu/Sq02zoIia7s4LVty6TT6ak
 xEDm/DdzWgrw+5irpq8qxC2zpoV/2/BnkhXEf7uixaLi7YiVteUhfvs1AxmNxD6j/cdn
 LZjAkwyYK2oZREcUIBWgd3F+IoA/VDhpyhndHMnKYp4uXOcNIt5MrvhKNXt4BGkolkgn
 5N6g==
X-Gm-Message-State: AOAM533UZ/YOBgOZbdsOmshuHyNGSYaALCyRabs36irfuSfsyGiNPczV
 63JEMHMrUfAWJlyVbUBqB0LQsbBGJycIybKAg0ielIFqZ1/QAouVjmmYaz2YeMlFWkAKsWjG2aE
 V/jYGMjwHLmHY
X-Received: by 2002:a1c:2ec6:: with SMTP id u189mr3154406wmu.31.1606998651841; 
 Thu, 03 Dec 2020 04:30:51 -0800 (PST)
X-Received: by 2002:a1c:2ec6:: with SMTP id u189mr3154389wmu.31.1606998651603; 
 Thu, 03 Dec 2020 04:30:51 -0800 (PST)
Received: from [192.168.1.36] (111.red-88-21-205.staticip.rima-tde.net.
 [88.21.205.111])
 by smtp.gmail.com with ESMTPSA id 20sm1299479wmk.16.2020.12.03.04.30.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 03 Dec 2020 04:30:50 -0800 (PST)
Subject: Re: [PATCH for-6.0 00/11] target/arm: enforce alignment
To: Peter Maydell <peter.maydell@linaro.org>,
 Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>
References: <20201125040642.2339476-1-richard.henderson@linaro.org>
 <CAFEAcA9XFGbyYfcpoOVhtV_wySi9=DyMGe84C4uwYG14Z6bD6Q@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <56701347-e0a0-ae47-8bba-f5cdff253475@redhat.com>
Date: Thu, 3 Dec 2020 13:30:49 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA9XFGbyYfcpoOVhtV_wySi9=DyMGe84C4uwYG14Z6bD6Q@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.495,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: qemu-arm <qemu-arm@nongnu.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: p/IX8KEx1/kL

Cc'ing Pavel

On 12/1/20 4:55 PM, Peter Maydell wrote:
> On Wed, 25 Nov 2020 at 04:06, Richard Henderson
> <richard.henderson@linaro.org> wrote:
>>
>> As reported in https://bugs.launchpad.net/bugs/1905356
>>
>> Not implementing SCTLR.A, but all of the other required
>> alignment for SCTLR.A=0 in Table A3-1.
> 
> Something in this series breaks the 'make check-acceptance'
> record-and-replay test:
> 
>  (30/40) tests/acceptance/replay_kernel.py:ReplayKernelNormal.test_aarch64_virt:
> PASS (9.14 s)
>  (31/40) tests/acceptance/replay_kernel.py:ReplayKernelNormal.test_arm_virt:
> INTERRUPTED: Test interrupted by SIGTERM\nRunner error occurred:
> Timeout reached\nOriginal status: ERROR\n{'name':
> '31-tests/acceptance/replay_kernel.py:ReplayKernelNormal.test_arm_virt',
> 'logdir': '/home/petmay01/linaro/qemu-from-laptop/qemu/build/arm-clang/tests/result...
> (90.19 s)
> 
> The log shows the "recording execution" apparently hanging,
> with the last output from the guest
> [    3.183662] Registering SWP/SWPB emulation handler
> 
> thanks
> -- PMM
> 

