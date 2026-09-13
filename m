Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8C10C88E53
	for <qemu-arm@archiver.kernel.org>; Sun, 13 Sep 2026 02:46:24 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1x5aAu-0001bl-5m; Sat, 12 Sep 2026 22:42:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1x5aAt-0001SU-7Y
 for qemu-arm@nongnu.org; Sat, 12 Sep 2026 22:42:35 -0400
Received: from mail-pj2-x11.google.com ([2607:f8b0:4864:39::11])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1x5aAq-0001rU-SH
 for qemu-arm@nongnu.org; Sat, 12 Sep 2026 22:42:34 -0400
Received: by mail-pj2-x11.google.com with SMTP id
 98e67ed59e1d1-396ccafb751so1014666a91.2
 for <qemu-arm@nongnu.org>; Sat, 12 Sep 2026 19:42:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1789267351; x=1789872151; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=yj8SiO0dYeas5u3bsy4kIe6iZb51M2JYTIFBms44mis=;
 b=jVr5HtVGBguf+cYi42lajpgT/9kINdbHEvx79cPfqtgvulj7XBS2DYfvwzdyBaB7Mc
 oImwAOSptXB/oibbdxeSaV4Lq723kj+yvUA1ul2yLYtSRv9NgFryttZtOXKkNwDT5vQ8
 61QPbTJVpwgsHynWFhHsy7+3EwQovBq3i90dlMOuLSEpbUVR0nnRlU6iNCPbWGKECM9h
 Aci46roaMI3NJ1NjqTdqf3XLipMtEH/BY8OXRJ4uEYQdbjZ4onPQ6vjKp+RQQljAQxVz
 Oq7eTNfmQYl8FiwjswGxIDgHxWIVzScgdnDwejEu4TsdMqUGV1osOPxMf3fuKOR/NoLi
 0oeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1789267351; x=1789872151;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=yj8SiO0dYeas5u3bsy4kIe6iZb51M2JYTIFBms44mis=;
 b=oGZYTFJ02eH46koljuhH1vznx+UT80b8t63MfeqM/Bgq6hqahnye8woy4HZ1bGwEeN
 n5NkrKcPWCEGls62vQSEfnVIdLFy5rCJhv6tidaEFXVfyDyJRSBcKKofICetDDL0cP5r
 Fbfh0VFZHo525Ma7QCZu5hl24qDgyZ1IZsaAxk1cHMzQPv0hPkDxon9OAYyHXseGxf5H
 5rMZg/ENga4orZET1jYEUwiwqIXwRhghM5fXnQ0EVSu7tZPmUQib/Jl+uxRreGJHnisr
 4ijL8ioypoLWM1mngpK3V7ZaWg+ikrK042BnAmBmyYWqUYDOd0NwGpNc9qINnavHZku5
 qWOg==
X-Forwarded-Encrypted: i=1;
 AKwUvBxL7OC2Mh+Oo4p16HASRNaV07Hy539QUhdTMC/1mxHSwpjV/7YD1NOLosP9R1d0m6DY/32X7EBfaQ==@nongnu.org
X-Gm-Message-State: AFuF++nz+wNic2lipysevVklIVR2MzwHdCDJMTrcV4dNkFr/Ovsw27A6
 HptEIjeNIGEGUGaCB5uft6Co0o3jvhtUzAryEnZdHbwPWPrcnC/v/j+4aclmeA/y52Q=
X-Gm-Gg: AYBFou2DND2WRoC4SWftd+vKTovB+RFPx6rgpWVvlZGucRBglDtB3GmUjNyyejGVyXo
 PBjSYBnlTsdisc8yPQtcsZeRsm1C86KDlAayAql/WQ9y0A5WU23XFoTbs9PrwhEptDogQhUbPMt
 LaWIDA2VvsdK3YMZHHZ0dgbgEZ8t/3C0qxtM0m/KbFLAuLYjgxXoJrxRqxXd04GAETg0S2Ng08k
 psi7PTQCyCzOuMjOfg3UbKD7Xl4h19yPsf40nmDnr4ADrenkrssij3TA9YO3lXCdQ4bm4vZ/CcZ
 C+V8Css+cISpx1PjydqKqVbtD4hsufVNcDqKU2qg1D+9onDynlkQk/7eiXO42XtjuRR1mckAD31
 tLuxbhcch7iBmg/aIJodVhVRw9diYgcw2G1TlWSGHbxs+UtM0XvZnanRn7R+T9/g7p47y9qvEk9
 yYBfX8tQ3iAWLw/dRENn667EV67gzh7uhGggsCui5jNcYXCxOpOt5VyyckunlVRQ//s2+g3Kz0Y
 VODm1lGxnhigR1fXyzeEkkDBgh068RrWFLP5IPo0enkH/feazdPuftPjPsYoly4WoLIZz7w
X-Received: by 2002:a17:90b:2547:b0:398:9be8:ea64 with SMTP id
 98e67ed59e1d1-39d9c225ceemr20661294a91.17.1789267351365; 
 Sat, 12 Sep 2026 19:42:31 -0700 (PDT)
Received: from ?IPV6:2603:800c:7900:ed00:bf2d:a6f5:e308:cd27?
 ([2603:800c:7900:ed00:bf2d:a6f5:e308:cd27])
 by smtp.gmail.com with ESMTPSA id
 a92af1059eb24-14365ba71cesm16679059c88.13.2026.09.12.19.42.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 12 Sep 2026 19:42:30 -0700 (PDT)
Message-ID: <b6680d48-d6ff-4b3b-b19c-29989b8f9ef9@linaro.org>
Date: Sat, 12 Sep 2026 16:42:28 -1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 01/11] target/arm: Call arm*_cpu_do_interrupt directly
 instead of via TCGCPUOps
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>,
 qemu-devel@nongnu.org
Cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Peter Maydell <peter.maydell@linaro.org>, Paolo Bonzini
 <pbonzini@redhat.com>, qemu-ppc@nongnu.org, qemu-s390x@nongnu.org,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>, qemu-riscv@nongnu.org,
 qemu-arm@nongnu.org
References: <20260902152044.31291-1-philmd@oss.qualcomm.com>
 <20260902152044.31291-2-philmd@oss.qualcomm.com>
From: Richard Henderson <richard.henderson@linaro.org>
Content-Language: en-US
In-Reply-To: <20260902152044.31291-2-philmd@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:39::11;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj2-x11.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
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

On 9/2/26 05:20, Philippe Mathieu-Daudé wrote:
> The TCGCPUOps.do_interrupt handler is a target-specific
> callback installed for use by target-agnostic TCG core methods.
> Target-specific code should not dispatch through this indirection;
> call the ARM implementation directly instead.
> 
> Reported-by: Richard Henderson<richard.henderson@linaro.org>
> Signed-off-by: Philippe Mathieu-Daudé<philmd@oss.qualcomm.com>
> ---
>   target/arm/cpu-irq.c     | 2 +-
>   target/arm/tcg/cpu-v7m.c | 2 +-
>   2 files changed, 2 insertions(+), 2 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

