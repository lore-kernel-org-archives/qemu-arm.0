Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33E79E67482
	for <qemu-arm@archiver.kernel.org>; Sun, 21 Dec 2025 11:17:07 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vXHQV-0003hT-6v; Sun, 21 Dec 2025 06:16:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vXHQS-0003gR-Ow
 for qemu-arm@nongnu.org; Sun, 21 Dec 2025 06:16:36 -0500
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vXHQO-0007Rs-W7
 for qemu-arm@nongnu.org; Sun, 21 Dec 2025 06:16:35 -0500
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-477563e28a3so19670375e9.1
 for <qemu-arm@nongnu.org>; Sun, 21 Dec 2025 03:16:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1766315791; x=1766920591; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=K+JqG1dpVPXEHeVjXWwxoJrpStoaekHAHNvFBOCNMFg=;
 b=cPgZrc+dDFC+X11JJQ363ECIQT+wQ/OMYEoanDoRiNQkCH/Nlc+V7djaHsD5MpfF9/
 H3mXWTacbu8csGiQXaKV7BEDGiTHDIfP4DQJ9rMS8KcsSSfxyOSyqjyuB2W5yZ9PUdCk
 V8HJTxEQnebbOd0eBNq5z2HszgeSrUAKofGfG7oTbJFbmz0Ipet+wDTrrcPZiPRH4x0b
 32UW4e3OR7Vm8tz+0nkwy7ojGqs8U0Xqcn8919qEp50Jin4Mv+d5bxxgalKP/bZtzzd+
 HFS5ibaOR/XEEmUHIU0ZHLHal43bGJ+CJP575BgG62zEG4KPew24CXtUmzfgRKgqe/HF
 1b+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1766315791; x=1766920591;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=K+JqG1dpVPXEHeVjXWwxoJrpStoaekHAHNvFBOCNMFg=;
 b=LxKa2Plud/lJhpZpHrYyvXtfWWxedNjlfq1L+zte/BiqpAu0sZzmtfYBHv9+Jf94o8
 osJi/pgfzyISx5TdWc7PJYi7c6rkwnoYBXcv2ygtbIy2T1Y1NSsDomaCrO9bNxs/Jpxx
 ZYZkGcWLhFV9GxETaQ6dF6CXrle1v9JwaalyCgtOcbW2iKElSwrKGrMeP0CDS1/r84uo
 v3qDe9oIWiIM6kiTapjo2CWuFaOYLh2JUUgyR1FLFiFftRtLe/fxL1TLbRdtDr+IU3+l
 8bd4Gv8dmLnVfauAcCgPc/SUNdTVIf1JTRVA1F4HYR7nUnq2m7ONVCHKP8xRkBx4Ddyt
 uQJg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUoffN2nBWPx3Jp2l21QfwRpisge6zl1TwnMyoWLKQtfpNy18oW2XLGplYpwAOrcJhVvhCQMCl4DA==@nongnu.org
X-Gm-Message-State: AOJu0YwdqYcNIAtg5DQqyYXbA0qxQQzyVskEDigzkW2fIpEUUoZCqu+7
 dD8i4zNbRKdVudvXAa6oZ0FdeD9Lwr8/q4Leq1zPLmU3xQNlXxIJPsQ1YFzmrtNwFcvFKF/Sv6s
 9R/fD/lI=
X-Gm-Gg: AY/fxX5YpvmNJFe6Qem5Ka90ba6Y0UPKbUkvl6ctEf3hbZlPsXAMLNSGeZkul8gd+NT
 rCb3jzxVAh7vD68jw46gaXbViwSwld7eyTTbuda8Ot1St62FXy9CMikH9r8PEfknhaJVtTjvVY3
 QnkGGw0cST3POIpJCMa97ID8RMsxR49TzQMNApfJOheHWET8c06S+4Eatl7f3hxaXuPOUL3R1Fa
 bQl24qrJKgwjMN+YyjO2JKHsk8EHIhlWAjEfm2utyFeal1gahCfE9MbiEyM7HKrIecIfMDlX+QC
 aGUvLenAOqPJ5k4sVnoTh095cHRjkBar7p0yq2DzP7nto5UDdpeOlao8+SXP/lCzMjiqxYDgcmJ
 H5SLcHOhtLvTqx9/OAEHsYeBPbwUtT3Gar+7nyMOMN+5SEhGVHBEh/klelJimW4obdJ7gHZswDG
 t7FGNtqo/QbPok0Rs3XCTUKAVOfGEGAS0eC+yZfEvduWfTO2xla+2gtw==
X-Google-Smtp-Source: AGHT+IFlYdeiUvXEUe/dfEL6ej5XRliCaXz5lhuEUCmtfmv109lSOckVUpZ1XbN8fibOB+0+xbydKQ==
X-Received: by 2002:a05:600c:6610:b0:477:a219:cdc3 with SMTP id
 5b1f17b1804b1-47d18bd56b8mr80040145e9.12.1766315791445; 
 Sun, 21 Dec 2025 03:16:31 -0800 (PST)
Received: from [192.168.69.202] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47be274e407sm187085955e9.8.2025.12.21.03.16.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 21 Dec 2025 03:16:30 -0800 (PST)
Message-ID: <8e9cc465-fc3a-4665-b754-6d5e20bc3651@linaro.org>
Date: Sun, 21 Dec 2025 12:16:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: MAX78000 machine needs a maintainer
Content-Language: en-US
To: Jackson Donaldson <jackson88044@gmail.com>,
 Markus Armbruster <armbru@redhat.com>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
References: <87ike27ucd.fsf@pond.sub.org>
 <CAMyd1rQ6CLN2FPic=4pNpZtcw46io2xftkBDSLfd8V9S+Jyu0A@mail.gmail.com>
 <878qex3ac7.fsf@pond.sub.org>
 <CAMyd1rR9HLwn-fzWfgqu=ZdtOq_Ae6Den-0oCmZpXAjxbup87A@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <CAMyd1rR9HLwn-fzWfgqu=ZdtOq_Ae6Den-0oCmZpXAjxbup87A@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x333.google.com
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

Hi Jackson,

On 20/12/25 15:51, Jackson Donaldson wrote:
>  > Out of curiosity, what was your motivation to add the machine?
> 
> I wrote the implementation for my university team in the 2025 MITRE 
> embedded capture the flag challenge

My understanding of Markus question is not why you implemented this
machine, but why you decided to contribute it, if you are not going
to maintain it, because then this is more burden for other maintainers.

