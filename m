Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0BBEC88E64
	for <qemu-arm@archiver.kernel.org>; Mon, 14 Sep 2026 07:30:52 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1x618t-0000KS-51; Mon, 14 Sep 2026 03:30:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1x618q-0000Ju-CN
 for qemu-arm@nongnu.org; Mon, 14 Sep 2026 03:30:17 -0400
Received: from mail-pz2-x10.google.com ([2607:f8b0:4864:3b::10])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1x618n-0006Qc-3S
 for qemu-arm@nongnu.org; Mon, 14 Sep 2026 03:30:16 -0400
Received: by mail-pz2-x10.google.com with SMTP id
 41be03b00d2f7-cc4ae61629fso1167008a12.2
 for <qemu-arm@nongnu.org>; Mon, 14 Sep 2026 00:30:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1789371011; x=1789975811; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=S7+AL5afegpb0To3hlGT44wY+oi7DzN3AXe14w/8OVo=;
 b=SH5lbHwpU+xvOzMLCxSbmaLXqTdCCCSdGiIUF5YGqmZJ9Q65eL87SRQ47D3LYqugAD
 OIsWR8az3hN8cPpYogVJeinwzQZCFXWwY+WRObq2+duo1zdwTMQ9XDZNiZRKsD9mG6qi
 /XEZcrMQZZRITahnS10TTXT5fcO/qr7xoDGUuzaM2pdgxDpXLUcqVLxzCuXpWWN/y2Na
 kHXU9KEtsVb51g16xKd65ZqnTHGednse0k9ckqYCE1kAMp2QxD78V9RETVGNhSQVIgTA
 oGC2gYd5zkIOkX2g7Tux0rdkY6o0sxHLYK0VhgiuNGzHR8YlgVDfD8dPjUhXRtvrpNMI
 G34w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1789371011; x=1789975811;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=S7+AL5afegpb0To3hlGT44wY+oi7DzN3AXe14w/8OVo=;
 b=AgirnQm7Vt/6wxsjldI4iU1vJtiZ9BgZccsczs02IZr/goFAbyE4X35gY1e8F5lAFT
 CzPjItjAd8YvjM72b2+JqqnrtqXk4mYZ+iX6/HpABtgtv4q3mLftYjWeYKC8IS49iWBp
 ANWc5qPKj0RD7SeFFFNTK63wqa3QnqnuPC55J8GnNUoVSHviQCbNOwUEganeEb8SeVTD
 63KXly1ZkPXxtxH7nOsoGJ7G0fn7S+iNZ9z1UFBbvWMDCLOyCKJcvh93xu6SFSHsK2TO
 ETtgAkN0ZQX+w/DCCLCZBBo5pNH0tkQUDX/L6AN4PJTANOubtOCFykGLDOWLw8F6CGcF
 F/SQ==
X-Forwarded-Encrypted: i=1;
 AKwUvByTpelBLcPR62WLN3KvszVbsgYByaeoc+8aco3K6AxMyMJJDqnV/yVnbnep/KAmj7fvYlye3KBsDQ==@nongnu.org
X-Gm-Message-State: AFuF++kogxcxdalTjTOSbKCPEhCXoXlZ+aFABsAMXrQA+jizCq1rmTmB
 eRcdprndTVN4jtKXIVwEH99G54knS3eF3EwV2GMDrT1sG8x2iM5rRkKWDxS8cyxqgVEchcUc49t
 GGFTD/l8=
X-Gm-Gg: AYBFou23o9CYDplqDjWaqjtQ682vp5hgBiqyLHmif4OoGADW3KA4i+fGXYvFVv8OWG7
 BzFQTmQKiWmMjJOXSQyca/F98+rxgWNg++jB5MA93D1W+mJwttBgIYocgN0x0Nb65q8UdMidfJN
 0oW0PqcZBSpKVoyRNf1a66wI6iBsH6f6O7ApDIRY7gFvBFrYwVn9fCe/0h86kEoCdR7SNMt1Bop
 JW+Z3dgulJ4fh6Jm50n1LkQmBDaTzlOljWpDP9nbBArqZ285JHfI0OJ662nrfxqcWD5yMVa/lmX
 8u/w9s6OFJJQLni/nydTeGkhUzr7pxXpYFz8wsUQeGMmzawnNiIXHxD3+tIA9XpR/bWRXPDnd0/
 OE42GDEIU7XY/oXAT23s2UpWe/pDMMwNPosRe0L0eXu2V47Sd+ytfUnMTPrnX4QmNAYvrRpah/Y
 PcMYb6NQXGjegP4nmoTury7pcZnFNE/q2SEdeAZXndY39n+mdlGwrDG95tkrnmDU7k2mW0sj3lX
 8jyRSZMjuQI40v4UWDZAouxqwnBGYMNOUNfpkPDQDujE/vm3jQgXqEhlhRiAg==
X-Received: by 2002:a05:6a20:c901:b0:3cf:a7a5:e310 with SMTP id
 adf61e73a8af0-3db404aebb2mr2897193637.9.1789371011433; 
 Mon, 14 Sep 2026 00:30:11 -0700 (PDT)
Received: from ?IPV6:2603:800c:7900:ed00:7164:7976:4c53:31bc?
 ([2603:800c:7900:ed00:7164:7976:4c53:31bc])
 by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-33bd8ad03ccsm4847348eec.2.2026.09.14.00.30.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 14 Sep 2026 00:30:11 -0700 (PDT)
Message-ID: <39f55a2a-8cf8-47a6-b218-042f31f4b572@linaro.org>
Date: Sun, 13 Sep 2026 21:30:06 -1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 10/18] accel/tcg: Replace size with first/last in
 probe_access_internal
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, qemu-riscv@nongnu.org
References: <20260815203730.1468365-1-richard.henderson@linaro.org>
 <20260815203730.1468365-11-richard.henderson@linaro.org>
 <CAFEAcA-MVRya=Y8i+rURHqizQzJLh=Gp5tQxHSK_VNBUQCAzdg@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Content-Language: en-US
In-Reply-To: <CAFEAcA-MVRya=Y8i+rURHqizQzJLh=Gp5tQxHSK_VNBUQCAzdg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:3b::10;
 envelope-from=richard.henderson@linaro.org; helo=mail-pz2-x10.google.com
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

On 9/1/26 05:28, Peter Maydell wrote:
>> @@ -1440,6 +1440,7 @@ int probe_access_full_mmu(CPUArchState *env, vaddr addr, int size,
>>                             MMUAccessType access_type, int mmu_idx,
>>                             void **phost, CPUTLBEntryFull **pfull)
>>   {
>> +    vaddr last = size ? addr + size - 1 : addr;
> 
> This can never overflow for the convenient reason that all four callers to
> probe_access_full_mmu() pass a size of zero :-)
> 
> Do we update probe_access_full_mmu() to the first/last convention later
> in this series ? I couldn't see anywhere we do that, but maybe I missed it.
No, I didn't do that one -- perhaps a mistake.
This function is supposed to be only for page table walks.

r~

