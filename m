Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA365F9EDCA
	for <qemu-arm@archiver.kernel.org>; Wed, 22 Apr 2026 12:54:45 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wFX5m-0007Hh-QP; Wed, 22 Apr 2026 08:54:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1wFX5i-0006xF-Kc
 for qemu-arm@nongnu.org; Wed, 22 Apr 2026 08:54:06 -0400
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1wFX5g-0006Cn-Kw
 for qemu-arm@nongnu.org; Wed, 22 Apr 2026 08:54:06 -0400
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-4891d7164ddso21192675e9.3
 for <qemu-arm@nongnu.org>; Wed, 22 Apr 2026 05:54:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1776862443; x=1777467243; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:user-agent
 :references:in-reply-to:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=00AJ7UrUeXPy7ZqKcucMiGTlG4wrum92TpmohAq+VBM=;
 b=yPBUgZsIdLaQU/x6QlxIdhfwtYEn6sLvFOuNq4DyLMJ1jhpxuT5xi7FxulTcbF4eeO
 Fl8qDfl3IyqJBVoT8DPhDVf43RZyuhWkzmvHkWfRcDLm/i3k864ihv0fVrjVy14IMekt
 5so1hp6yUOUs3/3Fy0ZrUKx8D9F4BhsHIDk+tUYxNFLF4jfEd8zzbudAQTKHekl6OVAq
 shoVYkY83D3RAWnZiQMAdrkU9USjXGiVv/av2VFAVfRN+zPE8tYY1Tcfc6Hsrs9eDspc
 /fm+LmDsUXMOdvUJqE+9I/WmDF6TON9f88zzBY1VH3X6FsJoDomR3wCq5Y5h/uYoH8we
 kjoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1776862443; x=1777467243;
 h=content-transfer-encoding:mime-version:message-id:date:user-agent
 :references:in-reply-to:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=00AJ7UrUeXPy7ZqKcucMiGTlG4wrum92TpmohAq+VBM=;
 b=QuAbXpSseIQWeyMPYNq+bH1sPrAt7+fKPIHblU63ZG/P4Jy8d+VbYvn7EuTC1Co2Fq
 wZNGi6SdLo0CVu6MqBiXNklqOYy0vMDEphEuJjvIUc/0kkUPjTxsvrwM2KZwOKQSNAPh
 FkT613JNJo684lp1GMq428xfOnAzv0wRpJEbEF0Z+AuziiV59zQP/udu6N6CqjttWNBi
 veHgB86kgRqNOmylI9HRPZvXXL+gtClobwCXT5tD38+YVz6eVyWxiHEXqm/qGs9iDBts
 jkvIuVlgKbqKatbYcpp4RofYHGBhhZ2hV17U5HqcbIe5gz+5eeLNZCO7mrOGXL8tUpBZ
 Q5XA==
X-Forwarded-Encrypted: i=1;
 AFNElJ/eLI96E13dj0MM0m4N+rG+9VcKvJ4q9FggOHTxq4Juvqvc/SLeUWJnRobInyQOpzn86wekqal3cg==@nongnu.org
X-Gm-Message-State: AOJu0Yza36xE05pzN+eqHBof9J0OEX4r6Z/X1+Dva8jor0DsZx1Hsavx
 SoJsraJyCpABWXLy32UuVD5nGxY678qFuG9n1Ce+uQESQzg/IY/6R96Sl0KgbasevWQBGIgGmBD
 VApIYIK4=
X-Gm-Gg: AeBDieuvUFMO9WOUepp3+ohFRMfVBlVbCxfZRtnAbFRORNodgnkzxSfFjbalPL3ITFd
 vEG0mQ6u4qWJbllx2bH5GBKq7Pi5yVKPF0KFnJlF3cvw9UN7RQJw7VdFU97yV+zMQFvFVehY0W/
 LwQviBdOdKxBg0xOEjgsN5P+7BgtB3UmxVv6o05L+vT6P2gwor+p2oj+wy4I9bIjJpg3tq/p0P5
 3I7xukJ2ZkNtKreyG/tFAiAv8St5WtAANrzVkm2fBB/j9snZfvi9ulG6mRkhlMIvLvLcg4zLXzo
 iZibjm3uIojXgS02AUzlvBesQ7CLIjXR9bJkVtwVJQf26+WA4dtM02S79IjZVCzY2WAXZ75+D1T
 FD3wj6rRTKc1WK13r808bj51aSo/me6Ty7u/G9eQh1pum+izNwfZG9WJrbZcv+Rj+wgXEC7xDoJ
 wc36pNTCJYlX9hyXXamVUw/r+4wDLoWi316gb0UCSP/IUq
X-Received: by 2002:a05:600c:4f0c:b0:489:1c1f:35e6 with SMTP id
 5b1f17b1804b1-4891c1f38c8mr201641885e9.6.1776862442605; 
 Wed, 22 Apr 2026 05:54:02 -0700 (PDT)
Received: from draig.lan ([185.124.0.195]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-488fc0f82bbsm753110215e9.3.2026.04.22.05.54.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Apr 2026 05:54:02 -0700 (PDT)
Received: from draig (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id 38A1C60342;
 Wed, 22 Apr 2026 13:54:01 +0100 (BST)
From: =?utf-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Alexander Graf <agraf@csgraf.de>,  qemu-arm@nongnu.org,  Peter Maydell
 <peter.maydell@linaro.org>,  Paolo Bonzini <pbonzini@redhat.com>,  Mohamed
 Mediouni <mohamed@unpredictable.fr>,  kvm@vger.kernel.org,  Pedro Barbuda
 <pbarbuda@microsoft.com>
Subject: Re: [PATCH v2 00/31] target/arm: fully model WFxT instructions for
 A-profile
In-Reply-To: <20260422101043.1234229-1-alex.bennee@linaro.org> ("Alex
 =?utf-8?Q?Benn=C3=A9e=22's?= message of "Wed, 22 Apr 2026 11:10:11 +0100")
References: <20260422101043.1234229-1-alex.bennee@linaro.org>
User-Agent: mu4e 1.14.1-pre3; emacs 30.1
Date: Wed, 22 Apr 2026 13:54:01 +0100
Message-ID: <877bpzxija.fsf@draig.linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x330.google.com
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

Alex Benn=C3=A9e <alex.bennee@linaro.org> writes:

> This series fully models the behaviour of WFxT instructions. We
> already had support for WFE for M-profile but we left off A-profile as
> it has more potential sources of wake-ups. The main one is the event
> stream which includes events from significant bits of the timer
> ticking over.
>
<snip>
>   target/arm: enable event stream on WFE instructions
>   target/arm: implement WFET
<snip>

I've posted v3 to handle the missing WFE exception and fix a minor
syndrome bug on the WFET exception.

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

