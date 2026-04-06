Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2E9BFB5177
	for <qemu-arm@archiver.kernel.org>; Mon,  6 Apr 2026 22:44:43 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1w9sg0-0008U2-EJ; Mon, 06 Apr 2026 18:44:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1w9sfz-0008Tj-IU
 for qemu-arm@nongnu.org; Mon, 06 Apr 2026 18:44:11 -0400
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1w9sfx-0002eH-VJ
 for qemu-arm@nongnu.org; Mon, 06 Apr 2026 18:44:11 -0400
Received: by mail-pj1-x1033.google.com with SMTP id
 98e67ed59e1d1-35d9923eec5so2603507a91.2
 for <qemu-arm@nongnu.org>; Mon, 06 Apr 2026 15:44:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1775515448; x=1776120248; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=M11ac1jgVgQnt5Wzks1ifzVoDU7mRNTtajjdxSUdSz4=;
 b=qLOrX84RbHX9byAE2kxQet30BFF0G0biGEtAAz+rRewhDjGNiivKOcen7OImDBaQxe
 BApJ0g40xDX6ygTQUl1Q8NpkkOJ/CbJ3EIPp8o0VPNf9FiF7ZaDgQpu+mvT8QUmvyhdT
 I1xwk7CTjm6yNmTea+mxoyjmPtGdo1epqeV6Wqw9WlabB/q+USCkV+Klrpxv2HxfnaFy
 T7uPgl0DgWfxZk8ygTaNfQlGlX86rB9GklPy/walvLLmWQY9unzoBuoS0XcdhZmWmotO
 jFWGj3cmUSUXBW9glRz5SkBnNjfD1EtEyAdSA7FKl54UUvTi8Ros3R6FdpGM0xCVCCps
 vPnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1775515448; x=1776120248;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=M11ac1jgVgQnt5Wzks1ifzVoDU7mRNTtajjdxSUdSz4=;
 b=SaVsVoBDsTUKW5+/adWUe3YEdRzWk8UUBIvgtjQr0trcDoG4qwUl3nxdwsCFAOUNtI
 9/U/0C/hQy3AGoQdoL04JGA6TrxBXkNAyt/+eCgs9Czex97fwwVlzJpTeYSDAvVsklTZ
 OuI8dzi0HFVE2yQAdTTDhvOMoZHMTWOnInozVsnXAbfcaR5ZMPqSvKIei08LbUc1LA+I
 GZ9H/jQF+LANPDUPKgj5CQK5ssDpDQKyI7ZESZriyf4HIN9tXIgznhhluh0ynoPRpo+7
 oXkHdIWljyl9YO8spdNsgA5GP/sdEyQ5rNijwVlHakJ+w/aGmLfhpQxemmn2DGwNDfBv
 hEWg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVY52l/vee2OCDRV6eLNm48+exe7uuCRPSZHEJrty2q6ijz5U64yuVeATvl391DAzC2Ppa18FndnQ==@nongnu.org
X-Gm-Message-State: AOJu0YwK6kcrhAdd4W+5dYYvkwvrTrl+g5p9JVH0xQhw/zUcAtGfy2FX
 JRCOKZ3mmwjlZS/hvOLxXLzEGyLs5hnMBElKBAvBAoXbd0ZWvPV01Q5zz8kP4bxuDeWGQ7goT5G
 wXVv1Pq0=
X-Gm-Gg: AeBDiesBOOZq9cfeYm2ajVtheRmBKfS7lpLBPvOTfEzxqmG0R7DL7vb+3vlkC7wwrDr
 bt7AWItgAwmyVxGMU0Lmzf9MzmLN9ey5JV5PdzWMvc1Yh8enlw0/RYFINy1fWXGT+MtEHXqUSce
 NKSBnr0QhCB5CP04tJYcb4rx04oV8zXgpdqINO4SdZ9JOYSTDAYSB/avrup4gjeN6bQLwXMBh7i
 qH/H6PG+VXh5tCnGxZNGYsrY/LBfyuNNnPE0S35IOMi6/HgFBmauJ/wHfKJ265L59jKC5ahiIVf
 e28cwzrV4IR5+TJI3ZQquctPDoKjPJRqGSIvQoZh1epZi3NpqJo8bencwCV1X1YACArlHiIhGEg
 +azk/Qvu6U5k2JCepJwgCbCKyYDUZV3ADJJ1zuBlv7UkQLnYloq/va241wvnclc7Ail5+tDojia
 SQCB8bm0m6dn8KBy7YszGn5dkzq+oyBADoMOCrUKwUpmI1givWduq3sS6A00D3ALFbHXNfk8sEn
 QDBuQ==
X-Received: by 2002:a17:902:ccc9:b0:2b2:539b:d2b1 with SMTP id
 d9443c01a7336-2b2816cfd51mr139861165ad.16.1775515447827; 
 Mon, 06 Apr 2026 15:44:07 -0700 (PDT)
Received: from [192.168.1.105] (124-150-69-109.tpgi.com.au. [124.150.69.109])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2b274979500sm201236585ad.44.2026.04.06.15.44.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 Apr 2026 15:44:07 -0700 (PDT)
Message-ID: <7b15c854-64f7-4996-a831-d03480a40776@linaro.org>
Date: Tue, 7 Apr 2026 08:44:00 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 17/20] target/arm/tcg/translate.c: replace
 translator_ldl_swap with translator_ldl_end
To: Pierrick Bouvier <pierrick.bouvier@linaro.org>, qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, jim.macarthur@linaro.org,
 Paolo Bonzini <pbonzini@redhat.com>, philmd@linaro.org, qemu-arm@nongnu.org
References: <20260406182609.193886-1-pierrick.bouvier@linaro.org>
 <20260406182609.193886-18-pierrick.bouvier@linaro.org>
 <c73bee03-82f8-4529-9db1-7857a049f59d@linaro.org>
 <626fdf02-7114-47ad-997a-a7c64a83f9de@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Content-Language: en-US
In-Reply-To: <626fdf02-7114-47ad-997a-a7c64a83f9de@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1033;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1033.google.com
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

On 4/7/26 08:27, Pierrick Bouvier wrote:
> I noticed you added a similar comment on v0, but I was not able to understand what you 
> were expecting.
> Could you please send a snippet of which change you would prefer instead of current patch?

Delete bswap_code.

In arm_disas_set_info:

      info->endian = BFD_ENDIAN_LITTLE;
-    if (bswap_code(sctlr_b)) {
-        info->endian = target_big_endian() ? BFD_ENDIAN_LITTLE : BFD_ENDIAN_BIG;
-    }
      info->flags &= ~INSN_ARM_BE32;
-#ifndef CONFIG_USER_ONLY
     if (sctlr_b) {
         info->endian = BFD_ENDIAN_BIG;
         info->flags |= INSN_ARM_BE32;
     }
-#endif

In arm_ldl_code:

-    return translator_ldl_swap(env, s, addr, bswap_code(sctlr_b));
+    return translator_ldl_end(env, s, addr, sctlr_b ? MO_BE : MO_LE);

In arm_lduw_code:

  {
+    MemOp end = MO_LE;
+
-#ifndef CONFIG_USER_ONLY
-    /* In big-endian (BE32) mode, adjacent Thumb instructions have been swapped
-       within each word.  Undo that now.  */
      if (sctlr_b) {
+        /* In BE32 mode, adjacent Thumb instructions are swapped. */
          addr ^= 2;
+        end = MO_BE;
      }
-#endif
-    return translator_lduw_swap(env, s, addr, bswap_code(sctlr_b));
+    return translator_lduw_end(env, s, addr, end);
  }


r~

