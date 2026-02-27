Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6B31FD9E30
	for <qemu-arm@archiver.kernel.org>; Fri, 27 Feb 2026 03:01:50 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vvo6r-0005Zt-Ja; Thu, 26 Feb 2026 22:01:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1vvo6q-0005Za-E9
 for qemu-arm@nongnu.org; Thu, 26 Feb 2026 22:01:44 -0500
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1vvo6o-00074Z-Cp
 for qemu-arm@nongnu.org; Thu, 26 Feb 2026 22:01:43 -0500
Received: by mail-pj1-x1032.google.com with SMTP id
 98e67ed59e1d1-3562212b427so666161a91.1
 for <qemu-arm@nongnu.org>; Thu, 26 Feb 2026 19:01:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1772161301; x=1772766101; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=uKOAVA9B8bemDOxyE9wlnutso3V4zsT+pJhQ+huAKCk=;
 b=EZS/mFfUTkv7q/XFWMpYg/mR/gn/77UOlmtGeFrgpgqxCj13miGDH2pRl8uzOnUs2w
 soms7djfTkwcQPjYSt5KZinjYz1fRhTQAOeerrVLz318CPTIddREAvEvAOmrS6UJSyRV
 oKVypWPimle7X8Nj9UisiXctrW8REntSZtleS+7tLrS5SO1bVWc66q3s4VRlSp0KPotT
 rzrP8VJzeyBEg1e091B/JRHMuyeA7OEWnNS1uPI6VaKn0SoNnimJ42Y+Gg6FF1Ux6rKc
 Y4Gfl4tWJp7qoKnz4PdsxLuvRJUXltPItJNz1ZA2XM0CmdgtOEcxKq2EvgDVIt97lloT
 s2IQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772161301; x=1772766101;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=uKOAVA9B8bemDOxyE9wlnutso3V4zsT+pJhQ+huAKCk=;
 b=C1tP8Yvp+UwbrHXndxiO8K6UrjRd4ExsjG2XZtzSv2F1PtJy2YnnUwQMVwxdb6Jnn2
 ZifZRvT/tdIVNXuGmeZHD/rjFmwiuZF9LDuJNpk2GZUcqhF8M7fXaFzsGyX75emlXvzs
 klJGGn2rzWvztpdgyvkZUZ9Q/e/ZBzYlmCCrH9kSTy0LfINVEhlxSDJS5F/+4RROUmdH
 OpocoXUrXWO276IIKUKEDiopdRxnWqESJoNbPgW2iUYk9qv+/31D9z2Y284WWell8wQC
 7nd90TG7QIibcoAKDCradySt3Z1CPBvfQCUdBvqte8ZKQuiDzbk84B6eOJnIGuUYFpkM
 vWYA==
X-Forwarded-Encrypted: i=1;
 AJvYcCV2zdmsjH9Hd0IljNJpIftpYxQEfO8OWyp9NmHhcCCbb40lx+uQLHlvjiLzt6kJ5oK94cTZZXvRew==@nongnu.org
X-Gm-Message-State: AOJu0YwzzcpEbSbVCxlEH6b2GgrEd6SWT7hZrFRU3Vq37vbv577L1ViA
 mCj7EpNqd5v4BKUNpgXh2x5F924kAdR2e8iD3tcpTCKPmjqa9o9jfhQ3lZxvPhtNwAc=
X-Gm-Gg: ATEYQzwOa0PTKTxPTeXX4OUs/hr+WN2GKh64FwIWtuf1/kKRzfEX3Gtv/Mueczu2ceE
 I1LBLfsh4+gNWo1Nmvk3r4oAViTXjKpWQG9NUIlq21SruF3RuIEJnGEMMECYHGMFpd0nLQw3BgS
 MIfTBa0alRxM2Q0TRcI0KSxHH523ULUEFn8wg5fI5FQR0nMgjIvoH29TohcTjBgUGe2sRVcZn13
 6fpGRmYine5l13K7Tk8w0/CxYYGU/PATg62a7/tzKAShFICIlqmuV/JUCzJDcLfSbJdEXlfjSWr
 ETAdkG9hYIwImzz6RMpXm1dlwNekb8dkvM9U1j1IbDIW31Vssr2UPYiSC2r3AsrP7eMZzSsYYZ9
 6ceFY/5w3NiESzuhaoMiUvrtGw3mBXWpIS8C5YVXlRukM/rj8hNZnCa2WLXhmrlA0mbe6Z33ZMp
 HcY1v6x5hk+pb8B5CVu1YQOObCPloRsh7vjKfK7+Y=
X-Received: by 2002:a17:90a:f950:b0:356:22ef:57ba with SMTP id
 98e67ed59e1d1-35965c17f28mr1074569a91.7.1772161300557; 
 Thu, 26 Feb 2026 19:01:40 -0800 (PST)
Received: from [192.168.1.38] ([180.233.125.15])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-3593db82627sm3551465a91.0.2026.02.26.19.01.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 26 Feb 2026 19:01:40 -0800 (PST)
Message-ID: <a865e4fc-04a9-42d3-9793-f1d7242565b0@linaro.org>
Date: Fri, 27 Feb 2026 14:01:35 +1100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 08/84] target/arm: Skip AF and DB updates for
 AccessType_AT
To: Zenghui Yu <zenghui.yu@linux.dev>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>
References: <20250830054128.448363-1-richard.henderson@linaro.org>
 <20250830054128.448363-9-richard.henderson@linaro.org>
 <c805cd6f-e69c-4cf1-8773-0a45bfb677f8@linux.dev>
From: Richard Henderson <richard.henderson@linaro.org>
Content-Language: en-US
In-Reply-To: <c805cd6f-e69c-4cf1-8773-0a45bfb677f8@linux.dev>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1032;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1032.google.com
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

On 2/27/26 04:12, Zenghui Yu wrote:
>> +    /*
>> +     * For AccessType_AT, DB is not updated (AArch64.SetDirtyFlag),
>> +     * and it is IMPLEMENTATION DEFINED whether AF is updated
>> +     * (AArch64.SetAccessFlag; qemu chooses to not update).
>> +     */
>> +    if (likely(!ptw->in_at)) {
>>           /*
>>            * Access flag.
>>            * If HA is enabled, prepare to update the descriptor below.
> 
> |           * Otherwise, pass the access fault on to software.
> |           */
> |          if (!(descriptor & (1 << 10))) {
> |              if (param.ha) {
> |                  new_descriptor |= 1 << 10; /* AF */
> |              } else {
> |                  fi->type = ARMFault_AccessFlag;
> |                  goto do_fault;
> 
> This also skips the access flag fault which could be generated by an AT
> instruction. Is this an expected change?

Yes.  As mentioned right there in the comment, the access flag fault is IMPLEMENTATION 
DEFINED.


r~

