Received: by 2002:a05:6512:3aa:0:0:0:0 with SMTP id v10csp2346000lfp;
        Fri, 14 Feb 2020 12:27:21 -0800 (PST)
X-Google-Smtp-Source: APXvYqyX1a6RhaefDSaWUiLb7137D/os8a7tL7ltdfxIQ+5VEsZbTkTB10qsvJWO2fdAY+I7CqCL
X-Received: by 2002:a0c:c310:: with SMTP id f16mr3838880qvi.65.1581712041701;
        Fri, 14 Feb 2020 12:27:21 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1581712041; cv=none;
        d=google.com; s=arc-20160816;
        b=giiQEJtz8Y0jlqgP/Re4Cih77lafd+guGw6vQ45TTXTwG/7+LPFLbsuO8CRLREYEji
         KcGiO+zCCllFFsK526i1mwqMLVHBFSnuD+/LoMGLXxJrNlnwSz0ncfay0EbvnM2sqhCa
         tvt035W9Y5llSLpcFryatu+T8uQG3EfNveJIxmdo/o82V5vdLJ3/KWLcGZphK6hXB4vj
         vh4lYbSqm55dj3DaxxkIFd2jJV8uljI1ihJtWo5WwCO970YcFByxk+GTfewOXuE1a6nx
         QvNeZYWe5sltPAvx4EQ2sYCYAzymmMQs0kIUrM/8en5SrOIKdUCRNfu96vwwsmzc7cCr
         z+Mw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=M7j4CG8nV+0KgYUGMZ6IOG13oj6Se74LLRKpGWdiWoc=;
        b=ueabLMA3vAIGgPPLl2E12Op6tlluQwJaTTTYZsuBi+TltzxEG5gSiJKIvAxgmxkcDY
         YOXlDS+SiiC6PY50YseLJYZIKKnO6/JdgEzwJ5GMAmbGqdJWcMwV5uAvwmZWJ8Cq7tb+
         698Uo+oUm1KvN+VDwwaviYhBqGU4KYJRX7f7927afDVk6EMvPFHdETEqUCTXuUA0GEaE
         CKhuYwNG/TlXAhz83B56HD5DBXSwim9GAqmPpngq02wC4GyjEO0OR66JNAz904RdDBxz
         pN8mh4aZ9gGkBcN8RB97o3BQVwOGBf+L3m3FQELaeySqA0TFL7jaUQU1cekMJkeTZ0YO
         0czQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=nsq8F6eT;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x15si3051995qvn.51.2020.02.14.12.27.21
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 14 Feb 2020 12:27:21 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=nsq8F6eT;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:45360 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1j2hYX-0000Is-5w
	for alex.bennee@linaro.org; Fri, 14 Feb 2020 15:27:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54385)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1j2hYP-0000Hs-Oh
 for qemu-arm@nongnu.org; Fri, 14 Feb 2020 15:27:14 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1j2hYO-0007ph-Fs
 for qemu-arm@nongnu.org; Fri, 14 Feb 2020 15:27:13 -0500
Received: from mail-pg1-x541.google.com ([2607:f8b0:4864:20::541]:37174)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1j2hYO-0007ni-8t
 for qemu-arm@nongnu.org; Fri, 14 Feb 2020 15:27:12 -0500
Received: by mail-pg1-x541.google.com with SMTP id z12so5509175pgl.4
 for <qemu-arm@nongnu.org>; Fri, 14 Feb 2020 12:27:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=M7j4CG8nV+0KgYUGMZ6IOG13oj6Se74LLRKpGWdiWoc=;
 b=nsq8F6eT7Fi/2tYJJkvW7py8OfZPXn5znkyI4ewMJ1HEY0aun8j71wTrDV7qw3epHU
 /OLR9y+jvpvsPxJ1qty6VSVrpV9TPm804oITIZEEfDxH2qpLjiMDMA3h/IyU9aW8+n0j
 H+MRxILoOeSWhNY4m0Mm2mCokgaYFVX9o8x2TGc+wkIJsVK17hqjCN/9dbaF9fDe1tN0
 APjR/fRucLcqDEfbwKMbseu6uoPU+qOSJwYYxQpusZtENT7kHcvVA5nt5q6XYe9gjWS7
 uPpDF44QFG/5VeOyyd44bHjiuI2qHhbwuSo1I+tTw0S/hTeVl84s1OkZFZGKevxcBAzM
 R2Cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=M7j4CG8nV+0KgYUGMZ6IOG13oj6Se74LLRKpGWdiWoc=;
 b=ORgyyCbvkqTyEHV/nmMlDD68dr4mY+7tLEH7Z7Xql3A1Sll+OaIYRHUhVr3O/QboVx
 6W0edNn6hl+zlixFJrlZ2WM+Dc6qBNux/NpxelqRStz3rY0WH2QxCskSjCvDXUiQTNk6
 dWIOjWmGha3XosDmaN6BvkvXtCx/XMBpKsptymfS8EpClXMJg11gFQxWJFA71MD58ec9
 IfgZcgqTU5U0cQyFv2eFm0KP5Rg07RJgHyK5AvDDcf6g8y78kbq0Fi74ju4+kKnJaaKj
 MRlRu9MoGsVgccKBNxb6P+6TSYrDMVYul3iINtVFv0z1uRx2oRdUcskn/ZDME0RFCebf
 3QIw==
X-Gm-Message-State: APjAAAWBNG0KYeqaZtTxBVG3iHTyo+XcewYtn25dBy+2OaDC8KWo0+jx
 WFyE7+OU+Iy0buRR29kG3GEnNw==
X-Received: by 2002:a63:7c4d:: with SMTP id l13mr5353961pgn.275.1581712030128; 
 Fri, 14 Feb 2020 12:27:10 -0800 (PST)
Received: from [192.168.1.11] (97-126-123-70.tukw.qwest.net. [97.126.123.70])
 by smtp.gmail.com with ESMTPSA id
 c1sm8030081pfa.51.2020.02.14.12.27.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 14 Feb 2020 12:27:09 -0800 (PST)
Subject: Re: [PATCH v2 12/21] target/arm: Read debug-related ID registers from
 KVM
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20200214175116.9164-1-peter.maydell@linaro.org>
 <20200214175116.9164-13-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <4bb63598-4eef-18a8-9dbc-4f6652ba12e2@linaro.org>
Date: Fri, 14 Feb 2020 12:27:07 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200214175116.9164-13-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::541
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
Cc: Eric Auger <eric.auger@redhat.com>,
 Aaron Lindsay <aaron@os.amperecomputing.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: sfdxNUo/Ka3n

On 2/14/20 9:51 AM, Peter Maydell wrote:
> +        /*
> +         * DBGDIDR is a bit complicated because the kernel doesn't
> +         * provide an accessor for it in 64-bit mode, which is what this
> +         * scratch VM is in, and there's no architected "64-bit sysreg
> +         * which reads the same as the 32-bit register" the way there is
> +         * for other ID registers. Instead we synthesize a value from the
> +         * AArch64 ID_AA64DFR0, the same way the kernel code in
> +         * arch/arm64/kvm/sys_regs.c:trap_dbgidr() does.
> +         * We only do this if the CPU supports AArch32 at EL1.
> +         */
> +        if (FIELD_EX32(ahcf->isar.id_aa64pfr0, ID_AA64PFR0, EL1) >= 2) {
> +            int wrps = FIELD_EX64(ahcf->isar.id_aa64dfr0, ID_AA64DFR0, WRPS);
> +            int brps = FIELD_EX64(ahcf->isar.id_aa64dfr0, ID_AA64DFR0, BRPS);
> +            int ctx_cmps =
> +                FIELD_EX64(ahcf->isar.id_aa64dfr0, ID_AA64DFR0, CTX_CMPS);
> +            int version = 6; /* ARMv8 debug architecture */
> +            bool has_el3 =
> +                !!FIELD_EX32(ahcf->isar.id_aa64pfr0, ID_AA64PFR0, EL3);
> +            uint32_t dbgdidr = 0;
> +
> +            dbgdidr = FIELD_DP32(dbgdidr, DBGDIDR, WRPS, wrps);
> +            dbgdidr = FIELD_DP32(dbgdidr, DBGDIDR, BRPS, brps);
> +            dbgdidr = FIELD_DP32(dbgdidr, DBGDIDR, CTX_CMPS, ctx_cmps);
> +            dbgdidr = FIELD_DP32(dbgdidr, DBGDIDR, VERSION, version);
> +            dbgdidr = FIELD_DP32(dbgdidr, DBGDIDR, NSUHD_IMP, has_el3);
> +            dbgdidr = FIELD_DP32(dbgdidr, DBGDIDR, SE_IMP, has_el3);
> +            dbgdidr |= (1 << 16); /* RES1 bit */

I see the RES1 bit as 15.

Otherwise,
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~
