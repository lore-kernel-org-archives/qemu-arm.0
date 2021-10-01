Received: by 2002:ac2:5978:0:0:0:0:0 with SMTP id h24csp1446333lfp;
        Fri, 1 Oct 2021 09:34:57 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx4ZuIH458WOJjMFJXeFnMpG2XZW39W6Zi5ekOoN0sD+W8BzCw067ZbVIxLD7+2oIIVjTM/
X-Received: by 2002:a37:b686:: with SMTP id g128mr10523097qkf.68.1633106096825;
        Fri, 01 Oct 2021 09:34:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1633106096; cv=none;
        d=google.com; s=arc-20160816;
        b=rjF3c5iCL1XQBeST/PKVWrX78GV+v1hH9Qy6bVPqNlboPcA6EInWnz60jofKonBgN9
         zmebr/Hvu48WBrT6Liqe116+PDxcTxXP3EutVghkaoifbvhvEaw6GEneemvD3Bd6ABmP
         4oAazQ5mTngc+A+4+BNCYFFoBe004JVCwsvU6sCrTMEK7+lYi+YCfrXgx+Cj6KrJNzdo
         wwGeDQG0JVXvTQfM6NzMhlC1axiF/NeyxSrzs9RE60zp305g1d9f/DC8ZO7c8RWnY8Ci
         +3eimKrHcb+G0XKEKyLiCtwJ8D2Aigc7VSTJoBC9O7tj/KP33Teb3VeUV+HU6MRuCNB0
         AykQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=fXM9N5tnq2moWBT/kcjda9tO0kiSuwnQK43uWjgag+Y=;
        b=EcAPyYVRm/eytGSjdJD82C2tBCNAKaxzpQ237y6VHN7kqQjNgYlcBAd2kyf8c6L6nE
         GN+HJiTyW7DFr7JLsKnq40U2Fi3ed5+qaUVyeFzYqEld28zWjM72VCGKclYSzReEFzfe
         BU2bnOsNfwVOS6b4Pr1mAC9Tp+IfLHvTO/7omCffVf0Waw9G/ImPZWgTKhhtN3G2UqHH
         q/zQDCQ6qyIuhtn19mpJ57uhgHZuys0I27hUNb3RtV0VPHZoixaWixKhI4k0YnM/p/+j
         ZIKCqs1//q7gMJb9h7ia+Ha6eLNVKMTidsUd47TRXuLqzsgleMMpbkOTk32i+mnDrZYl
         jf9g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=YHo54dhr;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y26si4421513vsg.352.2021.10.01.09.34.56
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 01 Oct 2021 09:34:56 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=YHo54dhr;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:41574 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mWLUt-0003kI-DE
	for alex.bennee@linaro.org; Fri, 01 Oct 2021 12:34:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46030)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mWLUW-0003jv-SH
 for qemu-arm@nongnu.org; Fri, 01 Oct 2021 12:34:32 -0400
Received: from mail-qk1-x72d.google.com ([2607:f8b0:4864:20::72d]:46902)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mWLUV-0006k7-CB
 for qemu-arm@nongnu.org; Fri, 01 Oct 2021 12:34:32 -0400
Received: by mail-qk1-x72d.google.com with SMTP id b65so9674784qkc.13
 for <qemu-arm@nongnu.org>; Fri, 01 Oct 2021 09:34:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=fXM9N5tnq2moWBT/kcjda9tO0kiSuwnQK43uWjgag+Y=;
 b=YHo54dhrrl5J8RQmeqaEu7SM7A+sJ0iK6tSlQAebn9PQLnD2rQU25aD2D3TBveseZ4
 3w4ok9C//unX6lPdbUeC0zeATDd4YegpwGNAzmui8ewwlSUY5nEyX3eEXgA7arnz5HgQ
 32afKpLfQRwABvGluv7zCiGwfvL89GcLtKIh5kWqHHG++THORaLK3lhfsRq1bodzsMfk
 zJ/0mLKIrNqwdz4gLY90TySA0grkvGdyawE98ekPJ/L32PN/hOsoQaaEeDO5R3JiuFdX
 ium+Jk4y8vuQrkl9Tk5l8NTnle3OUhwdn3x0UeoAG7L+c6ku3pPajHit4VPCEvLtC04y
 h95Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=fXM9N5tnq2moWBT/kcjda9tO0kiSuwnQK43uWjgag+Y=;
 b=QPPj/hgT42UQqMPRVIvFQGRAxMEpB2o0yN9rKcSrxmD9ovXefZtCEEqgy/fhpH3ZyM
 7resKujscxqWnCi7RWogvJi5jTHzp9hbqG9kNPSVTcWp3OMKAKcgcDh8tyd4+YaRD9pM
 o3MpsLocUz+noBtYpbbvnZQrYQ40loNKyzMb1AOAXXk1Rl5xgazc2yxqRpDRchUudbaX
 6bXMslXuB58tNWCuRA2oX876smWOb9qDpT+Fghp8AbAVC9WV7llSQ1NvERRry9kyULAu
 rOZNkPORQMWMyoMz+At+tMA+ONAE6dH9YSSKDPKvDGPPMCv+2OGUbXT/aOA2kyrt0Y8o
 n48w==
X-Gm-Message-State: AOAM5305bByDXlezCdWfn1Oq4fpm1n2eZ0zKGbdoRyec2i7APUQa6JJP
 gzvEzsnxk6XYyjsGCiuj1iPhq8mDkQzvUg==
X-Received: by 2002:a37:9144:: with SMTP id t65mr10507841qkd.170.1633106070276; 
 Fri, 01 Oct 2021 09:34:30 -0700 (PDT)
Received: from [192.168.3.43] (c-67-174-166-185.hsd1.ga.comcast.net.
 [67.174.166.185])
 by smtp.gmail.com with ESMTPSA id b20sm3481676qtt.2.2021.10.01.09.34.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 01 Oct 2021 09:34:29 -0700 (PDT)
Subject: Re: [PATCH 3/3] hw/intc/arm_gicv3: Support multiple redistributor
 regions
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210930150842.3810-1-peter.maydell@linaro.org>
 <20210930150842.3810-4-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <ee2ee990-b939-b99c-2cda-ed24ed0fccbb@linaro.org>
Date: Fri, 1 Oct 2021 12:34:27 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210930150842.3810-4-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::72d;
 envelope-from=richard.henderson@linaro.org; helo=mail-qk1-x72d.google.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.127,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: iy4m8tYfBHAC

On 9/30/21 11:08 AM, Peter Maydell wrote:
> Our GICv3 QOM interface includes an array property
> redist-region-count which allows board models to specify that the
> registributor registers are not in a single contiguous range, but
> split into multiple pieces.  We implemented this for KVM, but
> currently the TCG GICv3 model insists that there is only one region.
> You can see the limit being hit with a setup like:
>    qemu-system-aarch64 -machine virt,gic-version=3 -smp 124
> 
> Add support for split regions to the TCG GICv3.  To do this we switch
> from allocating a simple array of MemoryRegions to an array of
> GICv3RedistRegion structs so that we can use the GICv3RedistRegion as
> the opaque pointer in the MemoryRegion read/write callbacks.  Each
> GICv3RedistRegion contains the MemoryRegion, a backpointer allowing
> the read/write callback to get hold of the GICv3State, and an index
> which allows us to calculate which CPU's redistributor is being
> accessed.
> 
> Note that arm_gicv3_kvm always passes in NULL as the ops argument
> to gicv3_init_irqs_and_mmio(), so the only MemoryRegion read/write
> callbacks we need to update to handle this new scheme are the
> gicv3_redist_read/write functions used by the emulated GICv3.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
