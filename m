Received: by 2002:a19:ad09:0:0:0:0:0 with SMTP id t9csp140134lfc;
        Tue, 25 Aug 2020 12:56:28 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyntpP079FTjO6RcmSWOrsk8xVMZLCaWnz/WJkcBxn+8KFYRrJFhMAVhxoQc1owqAwuj2/9
X-Received: by 2002:a25:5887:: with SMTP id m129mr18278601ybb.11.1598385388536;
        Tue, 25 Aug 2020 12:56:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1598385388; cv=none;
        d=google.com; s=arc-20160816;
        b=qMCMeUOUq/mlIRGh5zeMTNdSd3CX7a7qaSDfEThpmNFa0SP95PMe6yPiESGDxuHE05
         bpKiH5wn3GYnbCEJPNfvJ5QALA8r4LOPO0D5Vda8jXkmhHcNrP7PPRfWILPzOJlZg/qh
         WLnK6aIqdg9XEVmpaZfQ4tf3+FWw+fGgHTeLDWR/x/HP5Zy9LhbVCilCQxYOCEDORjX3
         vMSe7do+BUdihNQ6KGxFhWIR0rz89sgWbbRKbshMcgDdm7OuFE8RhlnXte5dZBJvY3r9
         2cLVxyfZaRrgUbIsOzCcE2cBAQshadhSGJiF5Gjy67WL4WAsKaaIetnciz9WYYuuXw3j
         Mcfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=Vl2wvYes1LVzVyAGXqUfvKxadFKaJVw4GEr+AwGhehk=;
        b=uyaLR7sxfGKxeyP1Rp9j9SPR7qcgIDEyVCVr9THp5xvcLAcpVLSnrKFS8EyB39PFr7
         xpy0akg1f3NVKNeXIzznwKv4fOESD25RDwX2UJnJMa3gZHx0pF3GRtVj4NeGuZsDD25o
         zrE10RtX/WDEA12JhBGDVfnfz4UfjYelVoGEHrCEYkNcYlgcVDDdgRQfHyru3j/1BmkW
         XYjkeQMt2Mfdhhen/i3ztB8tCZawC14VG9pkeQUtlMrTCCmQBjr0YqvUhc5CXT1b+PxH
         8m1mhJMth79dhdAl0h5gVyKs3Dt2fWflwHhTPai6j+CHrp14GVVl4ZTcZhWpL7e0yVep
         elgg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=St77CbLP;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l7si14605629ybf.409.2020.08.25.12.56.28
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 25 Aug 2020 12:56:28 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=St77CbLP;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:58472 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kAf3T-0001EB-WC
	for alex.bennee@linaro.org; Tue, 25 Aug 2020 15:56:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41734)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kAeZa-000772-8W
 for qemu-arm@nongnu.org; Tue, 25 Aug 2020 15:25:35 -0400
Received: from mail-pg1-x543.google.com ([2607:f8b0:4864:20::543]:37319)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kAeZX-0006hK-R1
 for qemu-arm@nongnu.org; Tue, 25 Aug 2020 15:25:33 -0400
Received: by mail-pg1-x543.google.com with SMTP id g33so7513383pgb.4
 for <qemu-arm@nongnu.org>; Tue, 25 Aug 2020 12:25:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=Vl2wvYes1LVzVyAGXqUfvKxadFKaJVw4GEr+AwGhehk=;
 b=St77CbLP/7u1ai3nL9pCBygPa2vg9b23xe+a5BZzbOU05NhLPg9hJowouViXdZVTP1
 N69hNfLy+6Qy6+1D/kakb4Qz0/t7jKHls3aLg88FFsGzjsx062g0Uh6YmMmwD234pqjn
 zVnpHpeEjT7Q6ChDG76XDoHvJVXiTTWMSZfEtKrE9v2/PJeA39loVgzbFSYgRLMRKugK
 vYITXkmgUXG/nuT7KV0cisjRJ+cSsXN+KfR46+yYggJFAVEZo4UYMcs0ETq7RSq6I2Uv
 Fv0Pz2DBwtjBcTDiesf3FHmT9tHuPZDyY/EuMXd2JlgvFKoobYwroJGea0jAgaUtIoFK
 oFFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Vl2wvYes1LVzVyAGXqUfvKxadFKaJVw4GEr+AwGhehk=;
 b=RABtLmyk1sos6EkIEWZ6eH6UGWd47uAeYhGWsHOx9C6cC6GjeDvyh27XCKClDqLnaN
 niuXIJ4vvAyWZ4BMLiiYfCbPG5/KHTmRpig3Q4F0m/pubcyrh2H5Yd8Mc7ql+eWhaIMU
 rhYSlmgaewiTN5wv8ZQiBYPNqHacIc7kdFhOV3XzCfry3BfalDxgWCYw/vtBObChQjc2
 IG3w/+gKAfxCW4FM897YHZ/okDXtH2COb1eK84jkjZhUrPc2qYllYIRIMZmFKehPp0rb
 Bxzx2t1pUDDUttrN0r+2qVum76EvtuaJARptq0Xx7faDxlxN/H6Rvt6/KmjHxJCqOl8U
 Q3nw==
X-Gm-Message-State: AOAM533We4opk0EZAk8trkj0n52kkQHSBDRk1n63yCKp40ApFeoLKK/A
 fMDukP7rU7gb0sbuwtzg5wNYaw==
X-Received: by 2002:a17:902:c3d3:: with SMTP id
 j19mr9339443plj.62.1598383530149; 
 Tue, 25 Aug 2020 12:25:30 -0700 (PDT)
Received: from [192.168.81.79]
 (h216-228-167-147.bendor.dedicated.static.tds.net. [216.228.167.147])
 by smtp.gmail.com with ESMTPSA id e16sm19685pfd.17.2020.08.25.12.25.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 25 Aug 2020 12:25:29 -0700 (PDT)
Subject: Re: [PATCH 20/22] target/arm: Implement new VFP fp16 insn VMOVX
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20200824142934.20850-1-peter.maydell@linaro.org>
 <20200824142934.20850-21-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <fd00def9-8fd7-6259-ff4c-44d65664f3d5@linaro.org>
Date: Tue, 25 Aug 2020 12:25:27 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200824142934.20850-21-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::543;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x543.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -46
X-Spam_score: -4.7
X-Spam_bar: ----
X-Spam_report: (-4.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.602,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: zvz7BAHH3GKO

On 8/24/20 7:29 AM, Peter Maydell wrote:
> The fp16 extension includes a new instruction VMOVX, which copies the
> upper 16 bits of a 32-bit source VFP register into the lower 16
> bits of the destination and zeroes the high half of the destination.
> Implement it.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  target/arm/vfp-uncond.decode   |  3 +++
>  target/arm/translate-vfp.c.inc | 25 +++++++++++++++++++++++++
>  2 files changed, 28 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~
