Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3442CC5B572
	for <qemu-arm@archiver.kernel.org>; Mon, 17 Aug 2026 22:34:44 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1ww5uc-000142-TT; Mon, 17 Aug 2026 18:34:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ww5ub-00013b-G3
 for qemu-arm@nongnu.org; Mon, 17 Aug 2026 18:34:33 -0400
Received: from mail-pg1-x52f.google.com ([2607:f8b0:4864:20::52f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ww5uZ-0005oC-Te
 for qemu-arm@nongnu.org; Mon, 17 Aug 2026 18:34:33 -0400
Received: by mail-pg1-x52f.google.com with SMTP id
 41be03b00d2f7-cbb8b54fcf8so3601065a12.0
 for <qemu-arm@nongnu.org>; Mon, 17 Aug 2026 15:34:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1787006070; x=1787610870; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=BaaZvlNe7aydluBl82HSBJ+zgp4NFADzCcccrgiurrI=;
 b=Hs8YhSSADnhb8K653N1J26N5h/Qhw4YrM4fjKgc3ewmUHso27Zr5kx2tLQSYnrt4x8
 /dVp5c7pB2/P9IrhQg6bWOAQsN2bD00oVkgiu24MmEk1XKLgQhir6SGSHY8ZlahXzvDo
 VjHA+K32rxGYl+QW2nfiHhRGhnj1i5yeZ8hZnR+w3ifBJE126F2JLGRjv30to6kEyCap
 0qZiju2cZMihGTTlurQ9B8pYlaB2w1r2UkYfv/5MtQhzvkyqYU7WmngrOwYc8KneK/X/
 x3K9kXrbMJgjoZ9tn/rit5vquJTkz6UFftqqEtvliTYF7vzeugfT71DXJTiq+BosjrSL
 AdGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1787006070; x=1787610870;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=BaaZvlNe7aydluBl82HSBJ+zgp4NFADzCcccrgiurrI=;
 b=TX0gCUM6fKUuBzeCt/ixHNXh8oQW3rWgME3W1h7rJKjQ1e77ZaATKJpSLUgwciolrt
 TUpcvK1BHWwCujLiaIVDtAVVpKj86P/w/vnliA4tAQhHz2ln8qB40qiu06cNm2gLGGjn
 iN+1BdPPQN6HoHXNQnhtzET5MqfkvwYIwNDXX1L5TBYGV7iCMbP7uxcViVr3ashqcVMV
 foMYZjOl9cftp+TLzmxFRkChq8VKhixCZhRaK5wSMSHmjRZ6WISaNgWwqQ6AhV/8KMlT
 mjHrn2UJpKWI2VAB4M8akoWxXMfwrEOkbSGEl06vKNmn5e2op1KKP/1h+k26HtnKsLmE
 edDw==
X-Forwarded-Encrypted: i=1;
 AHgh+RqadRkSJHzllZi23xjA8xPGRGSlfuYzv5RVQg7t/e7jW3xtDNB1kBUzDabbg7InIn5GEL4XPPcxkg==@nongnu.org
X-Gm-Message-State: AOJu0YwzMREB8xMkWIQe54q4leJLF3rIDrN+wQWDzXRbAGDSM4ch2DvP
 oq6lDcpcBXi0Fz/EIE36PyoFcztUOWARtVl4G11IImCXjzCqZJ/qG7oEQTfJ5KcnHbc=
X-Gm-Gg: AR+sD139lTnD7+4rlJV1XAiZhuvdLIYYORUksI92M/MvI255y8dEE2eCwlhammFDGti
 QxUd3JFkb+dxcnJmSLtEh3jOAXxRTCdKF8CYik5GzsOLTKqV8jqo5r+ewAGvAvdsBUI2tOFcAPd
 7vHXQFhEUmSxN3uhkvgdHhkXM5beqfScCA3AuuYtz8EHdvROYfXO1/ceoNsQC6hZ/oDlXRN2J2Q
 K2X06JmE6LU5waFmcj5pv5G9tiuKAmMXT1t9RcHn7awJRZYG/8PNpSWyv7USkamG9mkngzL6Cs6
 c9e0WxmgcF7/04r1NcbjM2jLgjY2aQPeqyutGLJ3RzG0c7sh7KtvcTFmJUc3GDPRI0dq9d5PHYS
 s+lECgEB3t69nd0cmjncLP5fl/YFMnlvzfsDv4x+wfRxtCrnCaitSLfhdvD/iEhml/r5l679zRs
 PWh/TKKWgkQceVkwJhHfKy42zX0wpkOwiKceO7Vf8BU300A5+XlEHbTpdyaXyAuTzR4hUwU65l3
 Y3LxmfUBoKP7xyEllgdUd3OYOgQRyrbGU5v5rc9dWj0Bl0=
X-Received: by 2002:a17:90b:2684:b0:38f:2168:b9cb with SMTP id
 98e67ed59e1d1-3955a756226mr3569133a91.9.1787006069491; 
 Mon, 17 Aug 2026 15:34:29 -0700 (PDT)
Received: from [10.213.131.227] (c-73-181-156-132.hsd1.wa.comcast.net.
 [73.181.156.132]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-39531e31a9dsm6448395a91.4.2026.08.17.15.34.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 17 Aug 2026 15:34:28 -0700 (PDT)
Message-ID: <c931ce6c-1146-4bd7-8769-02e98ede0f82@linaro.org>
Date: Mon, 17 Aug 2026 15:34:26 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] target/arm: Fix SVE2 WHILEWR/WHILERW zero diff
 boundary case
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, yang.yanjun1@sanechips.com.cn, qemu-arm@nongnu.org
References: <20260811191540.79882-1-richard.henderson@linaro.org>
 <20260811191540.79882-3-richard.henderson@linaro.org>
 <CAFEAcA98oxLs-w1PNuoM9mArit=toTCTucD5xOmN29Rbk6XBTQ@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Content-Language: en-US
In-Reply-To: <CAFEAcA98oxLs-w1PNuoM9mArit=toTCTucD5xOmN29Rbk6XBTQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52f.google.com
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

On 8/17/26 09:37, Peter Maydell wrote:
>> +    tcg_gen_addi_i64(diff, diff, -1);
>> +    tcg_gen_umin_i64(diff, diff, tcg_constant_i64((vsz >> a->esz) - 1));
>> +
>> +    /*
>> +     * Since we're bounded, pass as a 32-bit type.
>> +     * Sink the diff += 1 from above into the 32-bit type.
> 
> Is it worth doing that? Hosts are all 64-bits now, and surely there's
> not going to be a perf or codesize difference between "add 1"
> on a 32-bit type vs a 64-bit type ?
Technically one byte difference on x86_64.
But we could drop the whole truncation thing it you like.


r~

