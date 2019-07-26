Received: by 2002:a5d:51d0:0:0:0:0:0 with SMTP id n16csp29866wrv;
        Fri, 26 Jul 2019 07:56:49 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwR+x5lwPwNKLqTxmJ9MZQWNxCCAWBElD/lI6MVcJD01HWb4Dy3+k8MfuSj+llCo7KaHVCR
X-Received: by 2002:a05:6402:1612:: with SMTP id f18mr82569026edv.231.1564153009267;
        Fri, 26 Jul 2019 07:56:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1564153009; cv=none;
        d=google.com; s=arc-20160816;
        b=KmdiUiZGrtlKV9S9Akrte6GE4KUKztdYK1CC2Hgj9dGi1IROplUtuUq7/rdH/TcCyO
         8mAICyHqxaoRaqLmLb4+6sGegDxQjoLmiGdA2hMfS++1JAYvkc0FKpCObmsAbBvk69Wp
         OVXX7kuAkp/ydCiq9Zmicg/QM2PAO0Eu3zw7u7OszsCF68qtQ0QPMU8cV1wzDo0HBtpW
         sj9JCNzFbWf9MbILNzvhlAbwxBb/GCnDxGjH/VHXgy9r1REhbzgbFC6+7PHUo/X/JF0m
         WqPGX7C3C8yt9ZCG/2JY6WfeKJZixYOyc+5+Hdnznu8OkcxEcFGYfLVawYAyH2N2sEYB
         SToA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to
         :dkim-signature;
        bh=pQDFBSwsYIydUY+TzvjuDb7i3I61Qwr/Ai6uGnN+5dc=;
        b=IizoOT9gEeOpqLJOaVJ602QHlfNwdWm2fwpAaGEU/TbopHQNh1V1924cORcyz1jhcK
         B3Cd5An84XFU6lgX6ExdolVn8ey/4oNOKftKshDa280NXSTseX9DcDURBXHivk7oZ5qe
         E18Z3/drFddVp1RHq8NnzVuJcu4iCO2pw47YtgN1EbWf4v+3NHZ7wkymwF2biT0Lnjoh
         RZtugI4vQeHK4fAq/EkE10vzbEq5hXKCMSMhKhRnlUS6MDksRrN8wa7MIeCaQaZsD44T
         zjrhRQl3hQbLiDYpLJCrBIVWDNV5broj/+Um72ecM0LJIgacMgb6hRaMwKHB4Gxd6SNk
         IAyA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=A8IogMer;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f6si10609419eja.338.2019.07.26.07.56.49
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 26 Jul 2019 07:56:49 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=A8IogMer;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:40872 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hr1eK-0002XB-1z
	for alex.bennee@linaro.org; Fri, 26 Jul 2019 10:56:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42245)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <richard.henderson@linaro.org>) id 1hr1eD-0002FQ-Do
 for qemu-arm@nongnu.org; Fri, 26 Jul 2019 10:56:42 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1hr1eC-0007PN-8z
 for qemu-arm@nongnu.org; Fri, 26 Jul 2019 10:56:41 -0400
Received: from mail-pf1-x443.google.com ([2607:f8b0:4864:20::443]:37553)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1hr1eC-0007NS-2M
 for qemu-arm@nongnu.org; Fri, 26 Jul 2019 10:56:40 -0400
Received: by mail-pf1-x443.google.com with SMTP id 19so24644597pfa.4
 for <qemu-arm@nongnu.org>; Fri, 26 Jul 2019 07:56:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=pQDFBSwsYIydUY+TzvjuDb7i3I61Qwr/Ai6uGnN+5dc=;
 b=A8IogMerOKkjEb3ZeQgo0a3/blo1UmoiJ9biLr18rlvMOz737NJ1Dl/IYkEl1xRk8i
 3EHuW3XJ8M8kZgxT+Eiwbt2plfTLsSsf+VL/CA6cbUSLeIGWALdB5AqhJfaOJAfsRjRM
 bdlakpf8wtDXOTvAOXkjtBxMqN+q6kKmqtOpDb5YuUlDoxHmKgrJqOlWrbTqNf1mCNV+
 swIHAjrFhIOIXze2joj0AdtsI8pnaQq3WhXtht/NZK0mIzdcTvUg4rMGuS+h3jBwQJS/
 vkV3iJv7zD3LtbYRkahX+aeifzHCEAvN26C68rpDnUx50uUjpIiBb7rv2X2NOjwJLHMu
 3Pzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=pQDFBSwsYIydUY+TzvjuDb7i3I61Qwr/Ai6uGnN+5dc=;
 b=GIl/RJgiWbyrENLm8ungNhDjt2dOw8J6ibGQ1iz2X894SrVvhQ39TOyVqepJqbOPxZ
 2upu6rA+qKu2LFWTOnmVy/+gPG3P3rtHzlVoaAZAdEpWUiji/G5B49waoWE00XnLpn+K
 Lkr2jNb+LUz7a0/i4PMa+nJEUc12ck+yTonYTkO681uka4v3yAvV6HCtYqQ0pHML5zxe
 dbOOOlQf14vCps4g4eSU232aYu42CI2pnHNkeIOoucuLEw0PI4RW8VCZTDp/Zswdlh1x
 XbEI28x9zIGU0fzMwSrSfUuOuEHkpqREoM7jX2vAVvvAcrQP9H9zAshI4pslbHmU7YZ9
 obhA==
X-Gm-Message-State: APjAAAVm3wjrZK526zoFSTG3dOQ5Z9KjXnbjIS4KAL+oVbDazjcxbR6u
 wcRHK85S9H28zohWYpW1VwcyBQ==
X-Received: by 2002:a62:8f91:: with SMTP id n139mr23132118pfd.48.1564152999052; 
 Fri, 26 Jul 2019 07:56:39 -0700 (PDT)
Received: from [192.168.1.11] (97-126-117-207.tukw.qwest.net. [97.126.117.207])
 by smtp.gmail.com with ESMTPSA id u1sm50177390pgi.28.2019.07.26.07.56.37
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 26 Jul 2019 07:56:38 -0700 (PDT)
To: tony.nguyen@bt.com, qemu-devel@nongnu.org
References: <3106a3c959c4498fad13a5799c89ba7b@tpw09926dag18e.domain1.systemhost.net>
 <1564123758372.45776@bt.com>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <7ab88ef1-55cd-fbe0-e25a-7449b8a3ffc3@linaro.org>
Date: Fri, 26 Jul 2019 07:56:36 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <1564123758372.45776@bt.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::443
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v5 15/15] target/sparc: sun4u
 Invert Endian TTE bit
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
Cc: peter.maydell@linaro.org, walling@linux.ibm.com, sagark@eecs.berkeley.edu,
 mst@redhat.com, palmer@sifive.com, mark.cave-ayland@ilande.co.uk,
 Alistair.Francis@wdc.com, alex.williamson@redhat.com, arikalo@wavecomp.com,
 david@redhat.com, pasic@linux.ibm.com, borntraeger@de.ibm.com, rth@twiddle.net,
 atar4qemu@gmail.com, ehabkost@redhat.com, qemu-s390x@nongnu.org,
 qemu-arm@nongnu.org, stefanha@redhat.com, shorne@gmail.com,
 david@gibson.dropbear.id.au, qemu-riscv@nongnu.org,
 kbastian@mail.uni-paderborn.de, cohuck@redhat.com, laurent@vivier.eu,
 qemu-ppc@nongnu.org, amarkovic@wavecomp.com, pbonzini@redhat.com,
 aurelien@aurel32.net
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 9PU1s8cYZ/PU

On 7/25/19 11:49 PM, tony.nguyen@bt.com wrote:
> This bit configures endianness of PCI MMIO devices. It is used by
> Solaris and OpenBSD sunhme drivers.
> 
> Tested working on OpenBSD.
> 
> Unfortunately Solaris 10 had a unrelated keyboard issue blocking
> testing... another inch towards Solaris 10 on SPARC64 =)
> 
> Signed-off-by: Tony Nguyen <tony.nguyen@bt.com>
> ---
>  target/sparc/cpu.h        | 2 ++
>  target/sparc/mmu_helper.c | 8 +++++++-
>  2 files changed, 9 insertions(+), 1 deletion(-)


Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~
