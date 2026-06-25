Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3D60CDE000
	for <qemu-arm@archiver.kernel.org>; Thu, 25 Jun 2026 17:31:04 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wcnuh-0002B9-H2; Thu, 25 Jun 2026 13:30:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wcnug-0002Ao-0c
 for qemu-arm@nongnu.org; Thu, 25 Jun 2026 13:30:54 -0400
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wcnue-0008Rm-61
 for qemu-arm@nongnu.org; Thu, 25 Jun 2026 13:30:53 -0400
Received: by mail-pj1-x102f.google.com with SMTP id
 98e67ed59e1d1-37df416c44bso71180a91.2
 for <qemu-arm@nongnu.org>; Thu, 25 Jun 2026 10:30:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1782408650; x=1783013450; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=efIV4HiKqZhjnGt3wXoH+9AKlr90U3vrVx9XRDB36xM=;
 b=zj7geBOiKxpLyFmLwLzf2KgziXn868XY3zxkQCRYDuHWXt+czSRM8oe9v0beaWTkW6
 BIA5tEHGHTGuDfc44m9UPouhFCYfqH/aJUedF0BXcV3dD0DGGuOt2aXm7quGJsITS0se
 iUCPlbRME1L+3K8dfEf+1jzS2Ov/np+egiNijkc0cJCMEWzKBvcN8gv1ADJKHItJ6svk
 CqAGQwJ//mvEGo6JFuco/FkrdAtFokr8dxI2L/3hQ87MKWNvdasXTewPEZs3z0JRjC6B
 h/FTgTC4zLiJ6qpqOYw5QnyJk0jz5L0VSwFcW5pvaC6NS8dSosWehdnF39ZrTJPwO7hu
 UMpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1782408650; x=1783013450;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=efIV4HiKqZhjnGt3wXoH+9AKlr90U3vrVx9XRDB36xM=;
 b=TEiS2DEyg3XDL/Mb6gx3YlIno5doClHpdBC4fn2+IjkLsmCRy8/D86STpEV1NZ8x7c
 FCXlNy5nl/3g6ZDDVs31FbYB091FfVk4B4JOeNVmPw/gDCgfN4ddMa9XsSvqC5Xjo9O9
 RnIt9FZTUSNLYRkHIc74PFLZIBJ7XuolipDgC+NnrVLvbOZYAsmwFkiWeZJOP2W6D51n
 U4L2B9J6y40d66+1Wg/tGoVIvdW3i+7kjVDqkmdwW+bzE2kbC3hOGC0f4sFCwSPDuJ7P
 Yxt0LIpVF24jiE2HIcq4G/nz1IXt/+0/sanNB4TCsaGFQuve7/PPfAFMHvjhLX3D02Dw
 cYQQ==
X-Forwarded-Encrypted: i=1;
 AHgh+RqvF4wvgIBK6tCXTnovaQm5V+IlUUxw7OTC88o55uvVdYHjTRCreShXFr3ZN6Y8ALfe9GyK8HwpMA==@nongnu.org
X-Gm-Message-State: AOJu0YzZaNCFWEuOsZkbIF4wcsTyHSTKNpFjPGSNzBhbiKGyHw2YQW4f
 hZa5nHalDIkOucol0l3R9S/KeUaj9Nmcc7LnViZ2n6lI9Qi1zDnOXD0hk5v2tb877r0=
X-Gm-Gg: AfdE7cmYKkgAxHhtUyiGWrXvhVwYRaME7Bzd1GzONo2vsoIITspoVxYdAqQII3gBhHR
 PTum91D1ZqkSHrp1efJroWjCNvfSSWNuDg4NUP5af2ko0EfctzaWY7WIBiJT/0eE+PW3437bDWY
 aZFF6MPdIr1InkSoX7raQrdGhVlQ0qr/jRCxu5hUhah94pcvKKdzmoxSthBpxCLEdmQPCLVGxUF
 YZPeU2NFTXsaW94Mv+xD/Ny5B6Y6ZrJtATBjcSHTL0J3YeX66WdiPK8xJY0+U/MXNCvMb7wsxHI
 1CUvETLx14SNvRFRHJO0Hj41Vqjugb7a0bLVqiKgFfg9KxhuAhs2Dbg0jIHvKguwDlEubGuy+4U
 q0QorqMYL6rDdUa1URb9ohu/ylAffq31NxMovjrCrtimeuP7wTIV/fb94DMYqvcrdOvjmQSnvyG
 I7Da9Gdcc8q7ITY5j/VgYVPEsezP3w0UMQpy4QCtfP+qdr+QP2+StvCvsQioWX2GGlhnJ+
X-Received: by 2002:a17:902:c410:b0:2c7:f464:79d0 with SMTP id
 d9443c01a7336-2c7fc797f76mr38778905ad.10.1782408649999; 
 Thu, 25 Jun 2026 10:30:49 -0700 (PDT)
Received: from [192.168.0.4] (174-21-129-215.tukw.qwest.net. [174.21.129.215])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2c7f5afb1e0sm25325055ad.29.2026.06.25.10.30.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 25 Jun 2026 10:30:49 -0700 (PDT)
Message-ID: <c8b5aef6-c4ee-40a8-b232-877b84595ea9@linaro.org>
Date: Thu, 25 Jun 2026 10:30:47 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/6] target/arm/tcg: Implement new instructions for
 FPRCVT
To: =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Jim MacArthur <jim.macarthur@linaro.org>
Cc: qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 qemu-arm@nongnu.org
References: <20260624-jmac-fprcvt-v2-0-dc6cf8e512b6@linaro.org>
 <20260624-jmac-fprcvt-v2-1-dc6cf8e512b6@linaro.org>
 <87y0g2h9sm.fsf@draig.linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Content-Language: en-US
In-Reply-To: <87y0g2h9sm.fsf@draig.linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On 6/25/26 09:19, Alex Bennée wrote:
>> +/*
>> + * Floating point to int conversion, but puts the result
>> + * in a SIMD register.
>> + */
>> +static bool do_fcvt_simd(DisasContext *s, arg_fcvt *a,
>> +                      ARMFPRounding rmode, bool is_signed)
>> +{
>> +    TCGv_i64 tcg_int;
>> +    int check = fp_access_check_scalar_hsd(s, a->esz);
>> +
> 
> I did test with:
> 
>    g_assert(s->is_nonstreaming == false);
> 
> which shows trans_FAIL or aarch64_tr_translate_insn setting had done
> whatever it was supposed to.

By default -cpu max will never set is_nonstreaming, because FEAT_SME_FA64 is enabled.  We 
do have an sme_fa64=off property exactly for such testing.


r~

