Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3EC4CCD5BB0
	for <qemu-arm@archiver.kernel.org>; Fri, 22 May 2026 19:19:33 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wQVP1-0006U8-Qe; Fri, 22 May 2026 15:19:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wQVOx-0006Th-K5
 for qemu-arm@nongnu.org; Fri, 22 May 2026 15:19:19 -0400
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wQVOv-0005wQ-QA
 for qemu-arm@nongnu.org; Fri, 22 May 2026 15:19:19 -0400
Received: by mail-pj1-x102b.google.com with SMTP id
 98e67ed59e1d1-365d8e43759so4054806a91.0
 for <qemu-arm@nongnu.org>; Fri, 22 May 2026 12:19:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1779477556; x=1780082356; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=eke3vKVtCxkeFjCaXMC8k+BkwbXLPNx+dOO230/acSg=;
 b=CxP5lm1On3w2R3XnFTXif5z4JNuD0PDGYfNr9aspnOVJF75Eh8UkLqnfqKOYgdRxSW
 6gcnd3CXhcDRkNg0zk+dUOerDhYAOVgJg7TFEXxRsL5vUxCBD0it1fI7AGG8gCRX2sqc
 L/Q2Uuvdm6/+WbXPO3iD7/R9Jy798mnyP20Cwxfv4CZGAOElAfyCJrbOyNIrDtVD5KPa
 2cPBkBoGLQYrAzplUgweh0hbAxgPciLNpBFbtdu9IE0tuxUfhEnqIXXEgZnCCicdSDUc
 lm3xIfr5xV2K09uAq9s74J2o2S+7H44YkZC1Gn2HCJxkD2j2ffOk93B/tAWXqEzeXFl+
 7oPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1779477556; x=1780082356;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=eke3vKVtCxkeFjCaXMC8k+BkwbXLPNx+dOO230/acSg=;
 b=iLypbAudPdxkK9jO2w0/9yvP9PQdK6StkQZ2vTMO45+nXg/VFdrqF8+JzLVIfcvmMP
 OsvpeumPdnLCCbq+TosNw3FvNNvxqsOAlnKigv1UrMREpi/OfKGQCqAaAqIqYW6r1h//
 QI8uctfyefcIcQeVB9roZd79fHS5iTPLivmtMeBeR1ymAaUPAXeVkHKmnU0Bk3D+yBDy
 qH3IZCuhFsmSzL4P3vMhDy/jK7yRIxye78PzqVok4knbpMkfyyEXtMxmSZVF6YlN2dZ0
 gMoQKeaNkpnD4JjIoOxuYvfuqd+Yr+zcMaGXHg63FfSZbiVP2HO8XmXmA99Wk8uDoESF
 EAkw==
X-Forwarded-Encrypted: i=1;
 AFNElJ9BDckKIQR5GVt1ElzQwb2YfWQIDlw4bWIS7LLBltTWnXYgx8yGMFU4HvEXJFS7Oe72TmrCmx+02A==@nongnu.org
X-Gm-Message-State: AOJu0YztJkW8KZXbUREVSYOhwTE0sBoKhkXw1mFwqmLiYWNSVI3VnY69
 ZsIfsuEFRqnwl9Muq9xsP0nFSRjsoON3g1k5BytpswiSkw2qyuMz6imcwqBB6k8P9Wo=
X-Gm-Gg: Acq92OELiHI7/MHkDY3UKevjncKsjR6YvkVabHm8A838c4CshTzm4dA/esi3SsGXTVy
 o+X2ojs7DoLjoGFB3h+HGtBn4IfECkkoUxq1O4SQQfMpdPCEg+fs3u407FGXgGPmtHuwUaTS42i
 27iIfexayWnWrhzhEhpq3mTpN2x74/3w/vJKbUOjPvTpHdZHg1ND/X4EPp0edzvDCdCqdIlCDdF
 2ntXGnShOb6or9sWcvdZCQKyMhI9IjWeIqDfn2lh/U87y+4Wepr8XbAyw8tyaojYRqe1zluh4Xj
 7CHlzS/YjsG0UWVwSDlNy+DD6xdjAAWEqEtRz849cnxnGstMWlATao9Tf8tTRYFnhlt4cei1ZQJ
 eHu9s0zBilbqHomMoMTN3g4fkGJqf4Zf1vgRf/RIy0s03v2xyFOXVZ1d5fBFgaoGzncnl5v6Hkp
 5YLbdnr2MrA6xyW7WJrERIAmG82vKhjxs+6iyaoTi9LWsQGVlV8ZY=
X-Received: by 2002:a17:90b:224d:b0:369:9469:aeba with SMTP id
 98e67ed59e1d1-36a6ba2a4a3mr3190673a91.1.1779477555535; 
 Fri, 22 May 2026 12:19:15 -0700 (PDT)
Received: from [192.168.64.111] ([50.78.183.177])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-36a7265a400sm2607175a91.5.2026.05.22.12.19.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 22 May 2026 12:19:15 -0700 (PDT)
Message-ID: <98346699-02ad-4305-a02c-aa11d2c5a50e@linaro.org>
Date: Fri, 22 May 2026 12:19:13 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 19/64] target/arm: Implement FSCALE for AdvSIMD
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
References: <20260520182213.872945-1-richard.henderson@linaro.org>
 <20260520182213.872945-20-richard.henderson@linaro.org>
 <CAFEAcA-4yuOQgbP7AcV0_eOXNkh9ZtFjaLOxGZk=re8UvWGtXw@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Content-Language: en-US
In-Reply-To: <CAFEAcA-4yuOQgbP7AcV0_eOXNkh9ZtFjaLOxGZk=re8UvWGtXw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

On 5/21/26 08:35, Peter Maydell wrote:
>> +float64 float64_fscale(float64 n, int64_t m, float_status *s)
>> +{
>> +    /*
>> +     * Given the 'int' parameter of float64_scalbn, we have to saturate
>> +     * the 'int64_t' parameter of the operation to some value.  Since
>> +     * float64 has an 11-bit exponent, saturating to 12 bits is sufficient
>> +     * to ensure that DBL_TRUE_MIN can be made to overflow.
>> +     */
>> +    int sat_m = MIN(MAX(m, -0xfff), 0xfff);
>> +    return float64_scalbn(n, sat_m, s);
>> +}
>> +
> 
> I just noticed that this seems to be reinventing the
> existing scalbn_d() in sve_helper.c. Could we share the code?

Ah, thanks.  I knew this seemed familiar.
I've moved scalbn_d to vec_internal.h.


r~

