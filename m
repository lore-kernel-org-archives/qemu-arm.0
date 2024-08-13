Received: by 2002:a17:504:9188:b0:1be9:327d:8ee3 with SMTP id i8csp133417njf;
        Tue, 13 Aug 2024 06:54:37 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXkVf7B6ca1pUEcXNSPIrr/H1DM6+woi/SsDc5A5vu8NFPycd85X9fJX2uug4lgUrRIdDCtI72EOFSx1GDS9tcTE8QEPCrP
X-Google-Smtp-Source: AGHT+IH5cwkxGM7kMkswir4ROpUjVbKPb0sNZGIWfQYfHp7RUs2i5yT1q//GnfZVsCgejk2Z0DT6
X-Received: by 2002:a05:6102:3913:b0:493:de53:9bac with SMTP id ada2fe7eead31-497439fd562mr4207080137.11.1723557277582;
        Tue, 13 Aug 2024 06:54:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1723557277; cv=none;
        d=google.com; s=arc-20160816;
        b=cwynA7zyS8KTfiErrXoEQS8H8AoUwm6xw0H5GwRJLuQVgLCwqd1kSdbho300q+tXim
         +CbeRhLQpbnKgx0S8ntd/QZSbpuad34UKp+5HPrL6TRub9/PrMIaEZQVC3W5UQtGTic7
         DwyRA/+wGe2RqS8BMciNZz33RvJLWtHx8Dq+kSnE7sX9fDxJCR/hDQY1+tbM4R3XfwcE
         V3h30FfdWAzJVqTbd2Dj0Qw3sy+dvnh4j54Rgt8jPn4idrQ0P0xRW/vXZ/+UUAEOxeNc
         xkv8H8TqJCsPhaJx00uE/moGZuLtZ5TsAUW1bmhd2Q1irHQHWW2c7WwEdMD36qmIwlQj
         C4Fg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=GC3sjzsVx1oXybeAQAVIsuyVVLrVbcvE/J8NE6DIB38=;
        fh=O66rIMHtjp4v6luaRtNQkRosJNqM3HQACZgNHN3VDeg=;
        b=v9we9Bqxl/DRv1S42V5PeucUZ81WbhBxgmpQHHkac3Z+SMyUXao9gI78A2YWT/Oa43
         GNbBHPdB4Q9RGuzYaqqFLD6pLZ7q8W+bHV18nReJPS6t0vNy0BTeBmqn0/QNQXOj3X5I
         BOK0sQDPyW6JqmVV5X2mm0VBt2yaZZgoeHGep5nilvhWCQcuwINHtmAFdsxKnZW8Czec
         jR2aoJNGYqtJBO4+z0Izqzg7Oq2BxDXnR+vJuHn/C35+O0k/fv978sl91lfAtSrEh853
         mEjsJUoOnIMvI8Q7jREeOL1IYVxv8G10yFyjCZPU4PJV9eOIOomClTXDlGtfBYaidTJ1
         VN1w==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=bpIBXRWp;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6bd82e6eab5si83682546d6.416.2024.08.13.06.54.37
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 13 Aug 2024 06:54:37 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=bpIBXRWp;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sdrym-0004ao-V0; Tue, 13 Aug 2024 09:54:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1sdryj-0004H1-H5
 for qemu-arm@nongnu.org; Tue, 13 Aug 2024 09:54:26 -0400
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1sdryh-0007tJ-PX
 for qemu-arm@nongnu.org; Tue, 13 Aug 2024 09:54:25 -0400
Received: by mail-ed1-x530.google.com with SMTP id
 4fb4d7f45d1cf-5af6a1afa63so6423302a12.0
 for <qemu-arm@nongnu.org>; Tue, 13 Aug 2024 06:54:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1723557262; x=1724162062; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=GC3sjzsVx1oXybeAQAVIsuyVVLrVbcvE/J8NE6DIB38=;
 b=bpIBXRWphRE3o+pkhlpRUcILo8qylXvxfUVEO8eefKYtbDVBvjDnt52l9KDQfg/rye
 FLQBah7G32c2sEXX7GNtiN9Uj6UpaJZwUhJuHZj8Euv8uwDb3FzF4l4M7Zyg9jgXfeM3
 yGh5YGg6kws37CRBGOaF64kxex+1IdrBDmmmSO3ajCKYACBOvA/Nv2VZTa8iJOL2W4td
 gdVixF4wFA3mzpAJspK/4RJfMgHk5ZIW9N+W9s0LaFYGmaYFsTx09f3tcipnGTgaUXIx
 OcgFgMxMOZ2dDb+3r8VAUewlgI81T5RbXY/H598A/MNtkMeqMpZOXBMXYUCRrBvF0c3g
 WB3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1723557262; x=1724162062;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=GC3sjzsVx1oXybeAQAVIsuyVVLrVbcvE/J8NE6DIB38=;
 b=gVz+zh5j6ikOqPWDRR5+dTKBMMR6rFm4Z/hmW2nY1zTmmoj4mV6T5eS7uT9CM0BTOq
 Ci+/ViGE9qRwsKINqiiRW3gs+5NTRUS9JxtV1a6KmFoy81gQ3f/DbgikOxHiMZQbXNiy
 XTzebceieY0KX83UTrggg2OYHJBdzWgqyr8SAOIyCpjtNFG5SBgH9qHJinjUCIejbHXY
 L3z6QzHLRoBrVihoUOI+kptYrc17X3/vb1mQgPh0ftOzzHjiLaikUTba39KW65kcE74k
 bvlwy6Kk5tVOQbmEqEGvS1CGmUvfBECG+LuKzsPSxCUsjI1vBmBCWN6YywOHK8KMNxuY
 B/sw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWbK9TZAVlwNwdeZNSUzdGh2FiPQ69ULlqtG4r8wasK7AaQa+SFmVCCn/w95Er3UcgbxeS1JL9xlNnPpBlSF3v4VqJ4
X-Gm-Message-State: AOJu0Yy7TnLV5FNXFCP4V0FCzaBQrqLIeqnQ02ymeXYW5W1r0FltQ1Wg
 FvnROcwIVkfuwYSlojp+Tzd8NyM7MOZeC7mcpQgJBRhDLX8CsgkLhi185JITK7dCI9xumXpnoF2
 xCHCe0euQ8kcEo5RqaGmZ8xZc/qkLhs2Hq/PsOmJ0OvPNP1zb
X-Received: by 2002:a50:c8ca:0:b0:5b8:d362:3f46 with SMTP id
 4fb4d7f45d1cf-5bd44c79953mr1858768a12.35.1723557261788; Tue, 13 Aug 2024
 06:54:21 -0700 (PDT)
MIME-Version: 1.0
References: <20240813125638.395461-1-sw@weilnetz.de>
In-Reply-To: <20240813125638.395461-1-sw@weilnetz.de>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 13 Aug 2024 14:54:10 +0100
Message-ID: <CAFEAcA_+A9TFPLiR=R+7oUdXND0gpDXa6sSC-_cVdQOPB1KiPQ@mail.gmail.com>
Subject: Re: [PATCH-for-9.1] docs: Fix some typos (found by typos) and grammar
 issues
To: Stefan Weil <sw@weilnetz.de>
Cc: Peter Xu <peterx@redhat.com>, Fabiano Rosas <farosas@suse.de>, 
 Michael Roth <michael.roth@amd.com>, Konstantin Kostiuk <kkostiuk@redhat.com>, 
 Eric Auger <eric.auger@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>, 
 Jiri Pirko <jiri@resnulli.us>, Eric Blake <eblake@redhat.com>,
 qemu-arm@nongnu.org, qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::530;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x530.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: 8d4tNgl2JRqw

On Tue, 13 Aug 2024 at 13:57, Stefan Weil <sw@weilnetz.de> wrote:
>
> Fix the misspellings of "overriden" also in code comments.
>
> Signed-off-by: Stefan Weil <sw@weilnetz.de>
> ---
>  docs/devel/migration/uadk-compression.rst | 4 ++--
>  docs/interop/qemu-ga.rst                  | 2 +-
>  docs/tools/qemu-vmsr-helper.rst           | 4 ++--
>  hw/arm/smmu-common.c                      | 2 +-
>  include/exec/memory.h                     | 2 +-
>  qapi/rocker.json                          | 4 ++--
>  qga/main.c                                | 2 +-
>  7 files changed, 10 insertions(+), 10 deletions(-)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
