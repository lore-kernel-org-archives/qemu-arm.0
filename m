Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2090CD4F25
	for <qemu-arm@archiver.kernel.org>; Fri, 15 May 2026 14:32:28 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wNtaO-0000Ho-Mp; Fri, 15 May 2026 10:32:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1wNtaA-0000EY-JK
 for qemu-arm@nongnu.org; Fri, 15 May 2026 10:32:07 -0400
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1wNta8-0003JM-R2
 for qemu-arm@nongnu.org; Fri, 15 May 2026 10:32:06 -0400
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-48a3e9862f0so6389035e9.1
 for <qemu-arm@nongnu.org>; Fri, 15 May 2026 07:32:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1778855523; x=1779460323; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=ZtyRfEg0ttR0bdwcOABvR/6hIat/MC3GjjR3PsW6nH0=;
 b=yYwAwxMV5VAzcKPEOPk7UVH2TCLWeokpKTYdK9zXjlFugCzRIkoEog/f9PqwGqBh8m
 9uYqLiKGgk9CiSGLAwUD+wI1yHKmiMu9NkBLYHR02o6xrb0DwBsj91kwKaY+p8hTLw0S
 f0Ha8bp0/Gi/LgXuRQ2i2TNLDXGj+sopHMuxhVh6LR1WWMxm2T9S8AC+s8a/ahn9Xkim
 H2OcKHQZOY0Q2IxWG2DbOxB/jJ9GoQ7bz6q4/DYBywf7uQ1EK/e3WcDSYjKYq4uPpWPm
 g3n2FbXeORM35u1ao4HUQ78oYzdyDzsdQgTQzily7Sc/+JbF/HKqUzu48j3Is1G2PTi3
 pB4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1778855523; x=1779460323;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ZtyRfEg0ttR0bdwcOABvR/6hIat/MC3GjjR3PsW6nH0=;
 b=p8cx8kOE4xnLnTQWeDmdCB14hQNQ9QGebyq88FD7ikg0g9VjipkVigWJP3AY270c2P
 bATMG21e6HgwjtLHUWV+090xw2YoP7z1f43vto2bCjfkqfysx3JZfRoLleKozhH7wtEH
 L+qXd44PIuw3W9B6NXbpiJFbNufx3PoM0Hn86EVFI7hwRP/0QHyvtKwCo6LcNtWc2Neh
 BzUXgK7pINtfXDKe1dtU/jkBRixQ1zfeKx9fCUy+k+6iRXsAA4myZB9uNyOlxN9Z2aF9
 CBGYHZdSbi4uPI9+8ZSx3hBnOpVFLzSLeHuaeGu0+ODpD7bGYJn7N5ZPpQ2ITGJodZ/Q
 rcDg==
X-Forwarded-Encrypted: i=1;
 AFNElJ+am5KuZjN8aDoZsckZB/AYeUICs7XZdyW6q2oUAHvQuWsZsLx0OLMvyVuY2Iq/2wTdAF9I/m/Gtg==@nongnu.org
X-Gm-Message-State: AOJu0YwK8lQT+hZEG4iiRdcH1XoBUcA4Oj7/ZZd/jmP03mQVxFAGa6La
 OsIWkCt47x17/hq2Q730psa09nhVdVUofqc1qM47ByDH7I7rvDUK0rQNE479q8+ZQAsBiyqOdAf
 gsjo2Nbw=
X-Gm-Gg: Acq92OH9dpqvIHIaVktDejXVaMzNRAPkg6QRKymJywvZ8ccpAPOrYS8YVXJravb+xfK
 0pOEeHuu+yt/6jbOu+oik2h925y/0tQBgE0aMpE6B1bxYHUCI2BRkjBYeI6GayOuTPESot3FQYn
 0qJwRIm++dXTcazzWv3QaABERGEiLeOEbUeGZHYf1R2NNl3O0JBjKIRwmW6Hy+MtQcsXJZ5C9yL
 lHFEvx2ajvVHcqn4mbDZwAjPMnoXlXL9eHQmAH/hBYa+KWwvc6/9ReRhEJtTt3/dxbMIXdAxODm
 ioKlI52QlEwF8AKDmeGEal60BiS+C5xw7DA/7+cM0nfIXKEISDXODfXucrvPftDJHxKz550fAw8
 y2AjrW1XN+Jh+986je4OVK1sbz5ZiedXFz5m/glM6vEsevNB3ff+LlodkJZP8kpV0Z+l0eOJi8Q
 577S5Q+1NshhxI0mUIkL0YGkQ7HEMPCPLXopyy+WoAebp9Z2doMzdqKrbuqTa0Mrbzjw==
X-Received: by 2002:a05:600c:1914:b0:48f:d620:c27f with SMTP id
 5b1f17b1804b1-48fe4dac5efmr57126435e9.4.1778855522527; 
 Fri, 15 May 2026 07:32:02 -0700 (PDT)
Received: from [192.168.69.200] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48febe5821fsm15087125e9.14.2026.05.15.07.32.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 15 May 2026 07:32:01 -0700 (PDT)
Message-ID: <9da789f9-c06a-4551-99f4-891f8c28e87d@linaro.org>
Date: Fri, 15 May 2026 16:32:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 00/14] target/arm/ptw: Flip sense of get_phys_addr*
 function return values
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20260515142541.571911-1-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20260515142541.571911-1-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32c.google.com
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

On 15/5/26 16:25, Peter Maydell wrote:
> This patchset changes all the get_phys_addr* functions in the arm
> page-table-walk code so that instead of "return true on translation
> failure, false on success" they are "return true on success, false on
> failure". This convention seems more intuitive and it matches the
> sense we use for the translate_for_debug and tlb_fill_align methods.
> 
> I've marked it RFC for two reasons:
> (1) I'm on the fence about whether the upheaval is worth it; I
> think on balance yes, especially now I've done the work, but
> you could argue the other way
> (2) I'm open to suggestions of whether the patchset could
> be better structured for review
> 
> On point 2: I opted to convert one function at a time, on the theory
> that you can then review each patch by checking (a) are all the
> function's callsites updated to invert the sense of the return value
> (b) do all the "return" statements in the function change.  It does
> mean that the patchset has a lot of places where we add a "!" logical
> NOT and then remove it again at a later point in the patchset.

FWIW this is exactly how I'd have structured it, to feel safe and be
able to test each step (ensuring bisectability).

Series:
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


