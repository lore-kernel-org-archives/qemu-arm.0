Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34D00CC6B33
	for <qemu-arm@archiver.kernel.org>; Thu, 15 Oct 2026 10:17:53 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xHIWN-0007cw-Ol; Thu, 15 Oct 2026 06:17:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1xHIW8-0007bb-TG
 for qemu-arm@nongnu.org; Thu, 15 Oct 2026 06:16:58 -0400
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1xHIW6-0002Ny-M1
 for qemu-arm@nongnu.org; Thu, 15 Oct 2026 06:16:55 -0400
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-4a022fee0caso48011605e9.1
 for <qemu-arm@nongnu.org>; Thu, 15 Oct 2026 03:16:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1792059412; x=1792664212; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=j+ho3eZAykYHTNcMhKzS1hZjZRUt5Z/ez0TMcgJut2E=;
 b=tmRZUt9Gw1wSNKWehHnarSXkngAjpGKPq3CwqCgFtvjQdKssYmdmpxNR8UqIWmkYU0
 5pvDl9BVDhSAISv7WYT4IXNOnN/S4mDMEHMpCvdo6u1AqQLvpEDOnvipRjCSwv4VkKzK
 6FS9nQDkqriOizqKLd60AXNkIL5en3n6rGgyI7ar/VuzQMXyytpNVwMSA7nc1i/uYvV2
 vU6F0yaqBc2OSIcXlaKs6TYBcs6JTih0yHopD2j2UV/RDRiDIJtM869OMFCHHrXVi7NU
 rlKZFpVLO5IhEyEIgxcb48iwEoD6GcZHuBV5zRLN+ODLiyH3jrIeSyy75Q9me0qXVduF
 gRFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792059412; x=1792664212;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=j+ho3eZAykYHTNcMhKzS1hZjZRUt5Z/ez0TMcgJut2E=;
 b=riXbIjQMhCcQJsuebyPnL8kOPI5n+eRnBVIHudag/1+oHgtrLZDZb8ro4710KcX4w1
 iEiqM56xe3dWG8NduP/NIWoLG7oVfH7hgzwSmRHwlBd0Fis7a+0vR/WLaC2qTMzl5kyi
 wSOkQN583fFFAUzwHDP3zxuNCAm8+8LBB5bOGUp6bo//+OzLhYyUSTFNANufWWwFSVyQ
 HqsrkdGyy0buHsnbXUomE//9y4PeKyrSVydGYVbpbaEFM3zVkg71BQeRrWbIJaiBsfIr
 SKIwQlNv2mwjZq0fGpcqm3o5osWbKSRiGc7O6WZSwfpekuLWES9CSwsumzzvEewpHJdy
 ToWw==
X-Forwarded-Encrypted: i=1;
 AKwUvBzOs8ZKPaM14bga+ZyJSOXcWEpJDAbfDTKHlX/cuC15RBu69deAKozByT5W6XX62hPwvMvoZ20BzA==@nongnu.org
X-Gm-Message-State: AFq9FYLO/n+MyQZ5uwhC4P/fls+wsxTVBwHjY+v+383qNLy7r/+bWkec
 +SpRQnCsmZHURg6Bf5D39L+WQcstq1/vIqHRE7RlPDEXn2mItbeAT5I1nRWyDpr5H9c=
X-Gm-Gg: AYBFou2LXC5nhLPtRA67c0MC1wc9zwPC4AZNZSv5I36Hjy/+zKHHPdbM/Hzcfee5bGj
 M/h1k4RqKTEPl+CF5mXQryqvz/16b2fIxGjfBtIqgklAS8pUA8zJdWN/Jux0NZmpe0eAw6bnNBN
 K6NxyaD1GMe1X7xlHYJyOfHSvOubbdGn37MwI5478yiN4yQg/H56zF06QEr46k/DbLnyR+f09EW
 kVt+91Pko8Ew5Pn32eXypeDf+tLM63kjHsgtlOJaRuvfwToGflE77BmEPDYq+6wqO8MhujtZw69
 CKcgOxZM+wH5vUJDM88HA72AnI63elzowQliFJXqM5lpsvVh7Ulcjl0RrmBPPK8urm0ARV+/5m4
 vrBqGHmGYrgtVNRhnJLoCbQFyyYYGD78DaPk8pDHlfsFQVcCOhiZajZ//DlkBz0TElEWaKel6Gq
 gwu56eTcS8EopSZ2LC1p7R0Fxjuq1WY500kPeXoB4lHx13FfWwAVpa3BdhbNzP3IW0VrzTU/d0x
 8rRlbzY+xmT2blIn/M3D1az5n23nWEAPYGD9fQZOWLNHDEN+n+aR4R1w6cNJSnWlXemKKGBxLz7
 ++yhhAfoz3PsDlygzHvxrgQ3gb/fGFMwHuIrVpQPiMw=
X-Received: by 2002:a05:600c:8b70:b0:4a0:108:3b48 with SMTP id
 5b1f17b1804b1-4a18e4a174amr377909595e9.7.1792059411858; 
 Thu, 15 Oct 2026 03:16:51 -0700 (PDT)
Received: from ?IPV6:2003:ca:3f0f:8b00:6e0e:d1a6:87ab:6860?
 (p200300ca3f0f8b006e0ed1a687ab6860.dip0.t-ipconnect.de.
 [2003:ca:3f0f:8b00:6e0e:d1a6:87ab:6860])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a1bdbb4a30sm57319715e9.15.2026.10.15.03.16.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 15 Oct 2026 03:16:51 -0700 (PDT)
Message-ID: <6cf70acd-8fb1-4b0c-b4b4-eb013bb4d007@linaro.org>
Date: Thu, 15 Oct 2026 12:16:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH] target/arm: hold bql when SEV sets the event_register
To: =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 "open list:ARM TCG CPUs" <qemu-arm@nongnu.org>
References: <20261012134840.1051969-1-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Content-Language: en-US
In-Reply-To: <20261012134840.1051969-1-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x32a.google.com
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

On 10/12/26 15:48, Alex Bennée wrote:
>   void HELPER(sev)(CPUARMState *env)
>   {
>       CPUState *cs = env_cpu(env);
> +
> +    BQL_LOCK_GUARD();
> +
>       CPU_FOREACH(cs) {

As an aside, cs is used here as a loop variable. Initializing it from 
env is pointless, and we can in fact remove the env argument.


r~

