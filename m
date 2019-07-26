Received: by 2002:a5d:51d0:0:0:0:0:0 with SMTP id n16csp11932458wrv;
        Fri, 26 Jul 2019 06:44:05 -0700 (PDT)
X-Google-Smtp-Source: APXvYqyKXbaxpRPgmPbKHOTfMSufSJO1LCkc+OUaV0Sf3q7rVGDetfbCK3xD+s0C5+bQC1gXYrCH
X-Received: by 2002:a05:6402:1355:: with SMTP id y21mr7145660edw.169.1564148645701;
        Fri, 26 Jul 2019 06:44:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1564148645; cv=none;
        d=google.com; s=arc-20160816;
        b=WEPp3d1xx4WsD/iN1dtJXAjscmOhRUk71Ali10PUb+tHUxGVvUQy+8bUqyJZpNU01N
         hBFMY1epW2sAgBI0+YP4A/G/LsitxQJjpHpm2v9zxsPjAwhHrnwvd7EMroVMzpiA33gv
         byk8PEudu0d1N2vzTTvzsc0Kmk479jaMn5jo+0lxxKMnwjxM6Bm88yIPp/B/kxW2jW05
         OSy0ZMLGa7HPSW4QNRdDvCWzQ0escz8KajFDjk/pqCy8CJGEEQTw4r0hbZ2e85Uqf5jL
         1s0ytBjD85ZVrivccDFi4/MieBzzHmKZ6anBJsymqH0SEiMMo/7ktNyQNPJpp6r5ldB5
         lPUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to
         :dkim-signature;
        bh=VErsMOJrJsbZB59YG3aE240P/hZISZ5QmUyEKYzm9ZI=;
        b=qIglf5vQmM5IM2oQ6LhveHEAGfTYBi+MYsS1mQej+FYD5kuEDxG6JIO2JNTukGBqbg
         lREJpeu13vDYnjQ+dsSgcmviGqG1kmqubuVg+V1nCv4HsXMrijseOrvWUaY34yKBR9VF
         IYBC1Qf6D0j5AEK04jWsU7tsr7k9ZjijeWKUDO6AdkXnAq+owMwhQhgdcTObS+Fzgi6M
         UgAuiGK9vnFUiLX6sLvS/+pAMpho29lSfBIsRZTzG3iH+sGtOJ69QcJ5WaCqw7hUHRBO
         fkfkAVz8gsl2vCUGfnan1+flGVI8APFdIKSihdmyolwU03S1ZeiPAxsztrURwD61v3lD
         vqMw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="e8/u+UwU";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d16si10857339ejp.292.2019.07.26.06.44.05
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 26 Jul 2019 06:44:05 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="e8/u+UwU";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:40047 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hr0Vw-0003jI-Cf
	for alex.bennee@linaro.org; Fri, 26 Jul 2019 09:44:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41849)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <richard.henderson@linaro.org>) id 1hr0Vq-0003Uh-Hq
 for qemu-arm@nongnu.org; Fri, 26 Jul 2019 09:43:59 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1hr0Vp-0007f4-Fk
 for qemu-arm@nongnu.org; Fri, 26 Jul 2019 09:43:58 -0400
Received: from mail-pg1-x543.google.com ([2607:f8b0:4864:20::543]:42675)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1hr0Vp-0007e2-7v
 for qemu-arm@nongnu.org; Fri, 26 Jul 2019 09:43:57 -0400
Received: by mail-pg1-x543.google.com with SMTP id t132so24810484pgb.9
 for <qemu-arm@nongnu.org>; Fri, 26 Jul 2019 06:43:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=VErsMOJrJsbZB59YG3aE240P/hZISZ5QmUyEKYzm9ZI=;
 b=e8/u+UwUoAmX3gBOogCXhZTz8MaHjeBjHb0fQCgiBYqHiy3Q+mMRJOFizS1dcZcr4E
 OYHx3yL3jm+F5+gf8SPd0DHCeU9ZxoG6h37ZkSxOy/KekcCQzu3igasGHvzoipIeupDm
 o0AELlmBw/r4197Y0+/kqBFOafcwDsUCoKBRzTOpmu/5MccRjoxwu7roYK4Z70u/aDTm
 u/ReskFJqsMoWNE4v5XDirCcwdUbUqw+wEZQoSoc0x6Il+qF8RhfZCDyVbZ7I+qVZxjJ
 SBvtIe4dkM8GKh7nZuTB4p5mWsXVmVAqWU7FpPG3xaxNpZV3oZtC+HgOwgow+9cju+lt
 /VTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=VErsMOJrJsbZB59YG3aE240P/hZISZ5QmUyEKYzm9ZI=;
 b=PGDeocBCwwIpVtBhp677z6j/0lCHBrB71U1YPI3rgMONMg/4AIS4HsAWeu3ZzNN6Af
 7Z+IpBglOL8890mfaYOp5RSzU17vs/TIZPjhxkHmxvKp4DAbGGaEn2WDS9tc1oRQ6VOu
 YynLL3ZFZq/YQacu/pONkTEnJgQFhkZLwyL9dpoE1ASNQ8a+U6Sz5lX9IOY1mTSGyVjS
 7AAr5mH2f1XGs2Oq+ysZUn4N9dTXD5KTmbANti+KkSq+KBaoiZTDvyyb6Lxbjx8pX7sU
 pKskkbG4I6LAYI8zfzolXmxChLGeky1dd+VLbk/xUymNzwXkn7FG48x+UK++6BMIuVnC
 8yFw==
X-Gm-Message-State: APjAAAX4cxtTOCc3ZJ84f6ym8iRR8wvvwfBSJgecY7ZtT/H2YnAFLKo4
 iTjl9kMdDxqRjMTG5M0VL3WpuQ==
X-Received: by 2002:aa7:8502:: with SMTP id v2mr21799279pfn.98.1564148636344; 
 Fri, 26 Jul 2019 06:43:56 -0700 (PDT)
Received: from [192.168.1.11] (97-126-117-207.tukw.qwest.net. [97.126.117.207])
 by smtp.gmail.com with ESMTPSA id u134sm51392165pfc.19.2019.07.26.06.43.54
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 26 Jul 2019 06:43:55 -0700 (PDT)
To: tony.nguyen@bt.com, qemu-devel@nongnu.org
References: <3106a3c959c4498fad13a5799c89ba7b@tpw09926dag18e.domain1.systemhost.net>
 <1564123571442.48536@bt.com>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <055d6faa-fd5d-482c-7356-e48ab40089d3@linaro.org>
Date: Fri, 26 Jul 2019 06:43:52 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <1564123571442.48536@bt.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::543
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v5 07/15] hw/vfio: Access
 MemoryRegion with MemOp
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
X-TUID: VqsUB+Rv7XSM

On 7/25/19 11:46 PM, tony.nguyen@bt.com wrote:
> No-op SIZE_MEMOP macro allows us to later easily convert
> memory_region_dispatch_{read|write} paramter "unsigned size" into a
> size+sign+endianness encoded "MemOp op".
> 
> Being a no-op macro, this patch does not introduce any logical change.
> 
> Signed-off-by: Tony Nguyen <tony.nguyen@bt.com>
> ---
>  hw/vfio/pci-quirks.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~
