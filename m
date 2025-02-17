Received: by 2002:a17:504:f96:b0:1be9:327d:8ee3 with SMTP id oa22csp41410njb;
        Mon, 17 Feb 2025 05:44:38 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCX+1kd1qWGIX9B8Ui3m/B+gE2pKAYG/3HA1FY+a+vx61he0SDUyQkk528ml2gKSAr7ysWhQq/6GZRpaGg==@linaro.org
X-Google-Smtp-Source: AGHT+IFhOWYoZHu7KNXEboji0vri6KHLUNbxuS0Qnxi/iT/aWn4Fpl2k6yHh1taR5NYdKU+1eR9T
X-Received: by 2002:a05:620a:1912:b0:7b6:dd32:ec99 with SMTP id af79cd13be357-7c08a99ab54mr1188587585a.5.1739799878281;
        Mon, 17 Feb 2025 05:44:38 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1739799878; cv=none;
        d=google.com; s=arc-20240605;
        b=Q65bV2vu3avtbTudNxN2hJ6Z3D4F9vHImMHtwrfv677adbHPo3p+O05WQtlR+6WXfP
         YZ7Vu782AzyQHN0r9ZCVxUILCNUOmaqajJcVLOTMkaGAlnIuwLuFglmOrMrW++KEuckX
         nUxAqm0lfXIUhjyglQBsH73mrsrOWHXpDDcwFXutjw92TW+00gS0+ZfWB2c6jgrzhJZP
         rqkDMXSEl/Gc2qESUQ1+w1CfItWPpbj4UqNj5HAYMFtlPNITB5rrtzY8Zb0QaViIjnwl
         CQqWD3E1K9hHn2MizQGrJ/Echlp/zyE/Ii5J3Az3vGQEAmAesJxFE++OfVeyR/L7oJtk
         anwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=WS8aRhGy5QA2hi62bCSGIx+KXYqVLDd1iSXzxjgysrc=;
        fh=pWNRCrO7QgUhVJ01Lpet3L5YxckoNzFcVfU87ZsjmfY=;
        b=F+FyhyXDbLAH8MD8wvvnhqXvmvCYh+CVZ5ZGjos/84zJk8Oj3R89pg8OHnp3u33v5o
         CGffvdkoLHg7r/sp8hdn0LkFsDeid/lXBNYV+H08NWUbq6yppcd7Y/xX5Wl9msOJ06gY
         2s0nuejbKDAAqbndaFoXeFuJ3uyLLHUhjE4/FfeTmPHwg4lWCt0NfB6wY5bzMBvx23G1
         j5NbtiIS6CWoDsQs/aHvxflTtPbNbPv0U4RVH/SwQlgaO9mMwTU11OInWyjuXzkKwy0P
         WmPBKFPwlmRYEueRKh86LpocETx8z+txKiQ6jWF1uk30sq146jIS9jVeM0ZvHWf7r+P+
         clTw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=LKe+vXdO;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7c0a8195a31si25186585a.272.2025.02.17.05.44.38
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 17 Feb 2025 05:44:38 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=LKe+vXdO;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tk1QC-0005Xq-Fc; Mon, 17 Feb 2025 08:44:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1tk1Q6-0005Wu-Hd
 for qemu-arm@nongnu.org; Mon, 17 Feb 2025 08:44:22 -0500
Received: from mail-yb1-xb35.google.com ([2607:f8b0:4864:20::b35])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1tk1Q5-0003Mq-5w
 for qemu-arm@nongnu.org; Mon, 17 Feb 2025 08:44:22 -0500
Received: by mail-yb1-xb35.google.com with SMTP id
 3f1490d57ef6-e5db2d767f2so3203719276.2
 for <qemu-arm@nongnu.org>; Mon, 17 Feb 2025 05:44:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1739799860; x=1740404660; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=WS8aRhGy5QA2hi62bCSGIx+KXYqVLDd1iSXzxjgysrc=;
 b=LKe+vXdOicQdqV+JKQLQCAOukvuxL4tQ1tCc8nCtiLbaEdGYdhnrAgQjy0m98Q82D6
 EXMYszwZAN3YHE+iKx6ao/4qCVdyggF8xIV9Ib6s8yuOgH0IKItdRJzVi4SQ2bmeyrx/
 BBZgNeVUuICFbiDGlBev4W+q3H828nxe2STtjn/e/dzqvHfz9Dna2d/lymTPhQ73YjMN
 s4F/e6mkzASclURG9Lv+i1gVONLwVb3AA84zntR2VkJzNaj2r5IJKQH7TAw5okalcEE3
 VeoJB/zL6MYX/eQkjGVwzViXfY4AHT4QtFA6A72CT5pLq0ctCCAdAELEhwNszitbw3C9
 OyIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739799860; x=1740404660;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=WS8aRhGy5QA2hi62bCSGIx+KXYqVLDd1iSXzxjgysrc=;
 b=ZchGWOxkhlTgYl5lNQ6QpMg9lk/9bJYQqcUCE139SvyvKSpFdHTlHyY1QL4f3GzpR7
 IfyupHTIyojkVhjb0xQ3Zzz7KeRIS40u1t/pAr/hGh7WUZZbHmFMXsYlZWh1kTbwGFfE
 bSN/A2+fiI5XphIKpJFG5JAZz6skS265/IBosMO+O8CeKTf8l3ST/DrcVpFyQHC77XX1
 /ahj0vWbhHff3RcXMZBojnuvyfAL8j3LOQUf2xzJGbQJqYwBZchQhkqa/jgOoWieJMGV
 cX+NkO4vQfOr98aP4Jzqg8ijFpYlaknEFESgNtEVVJSkN4ILPanDixXyblwUKl2uRmKw
 kXAQ==
X-Gm-Message-State: AOJu0Yz+KU/mLQOgxChf/W4BDInaxacSdvXyMCIy0sPFU5ajIPMco8PD
 Ubbnn59lo7q3g2J/Nz5gEpkXSbEdumM1FusKwBD9kd8aL2KghJx4bEcbrh+9xarpZhv2azzDi/3
 HPz8zUFwNQwQlKdt6xYXl0B4vMTXeKpMbVOXtQw==
X-Gm-Gg: ASbGnctJw9c6XvXEM9+i3g7FVzdT0nEiWypuUCvayfEo58HXCTs/klpjJGKU7t/GLFr
 83i6qUEzxy67x9qrlNIPYgQ48xtw84ggfDhB5ylDF/MLQSvmOIpM48qZdVBU6foFfmg4mojip7g
 ==
X-Received: by 2002:a05:6902:18c2:b0:e57:fd58:ad51 with SMTP id
 3f1490d57ef6-e5dc9034483mr6835945276.1.1739799860058; Mon, 17 Feb 2025
 05:44:20 -0800 (PST)
MIME-Version: 1.0
References: <20250206221203.4187217-1-wuhaotsh@google.com>
In-Reply-To: <20250206221203.4187217-1-wuhaotsh@google.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 17 Feb 2025 13:44:08 +0000
X-Gm-Features: AWEUYZkIurlXyk2t7ZCXtPjqmpDt3saChc5MUpnmDuZY1poxEqfhiNYUXlKBaIs
Message-ID: <CAFEAcA-LVKy3pEhGsJO8+hASjoafnAbTSRoNZ9vBjKJL0BYrKQ@mail.gmail.com>
Subject: Re: [PATCH v4 00/17] hw/arm: Add NPCM8XX Support
To: Hao Wu <wuhaotsh@google.com>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, venture@google.com, 
 Avi.Fishman@nuvoton.com, kfting@nuvoton.com, hskinnemoen@google.com, 
 titusr@google.com, chli30@nuvoton.corp-partner.google.com, 
 pbonzini@redhat.com, jasowang@redhat.com, alistair@alistair23.me, 
 philmd@linaro.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b35;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb35.google.com
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: pEGkVfIq20/p

On Thu, 6 Feb 2025 at 22:12, Hao Wu <wuhaotsh@google.com> wrote:
>
> Changes since v3:
>
> 1. Removed REGS_END constants according to code review.
> 2. Added a few asserts according to code review.
> 3. A few minor style changes.
>
> Changes since v2:
>
> 1. Update doc to include npcm845-evb description
> 2. Add g_assert for register size in CLK and GCR enter_reset function
> 3. Fix various 8xx SoC and board file issues.
>
> Changes since v1:
>
> 1. Updated vbootrom and pc-bios
> 2. Split out CLK/GCR patches into refactoring and adding new features
> 3. Fixed a few misc items from the patches.

I had a minor comment on patch 15, and as Philippe notes
you need to bump the vmstate version number where you
change the size of something that's a vmstate array field,
but I think this is very close to being ready to go in.

thanks
-- PMM
