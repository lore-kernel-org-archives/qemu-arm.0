Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A26D6CD5BAC
	for <qemu-arm@archiver.kernel.org>; Thu, 21 May 2026 14:40:15 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wQ4Z3-0000f2-Vk; Thu, 21 May 2026 10:40:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wQ4Yk-0000We-Gq
 for qemu-arm@nongnu.org; Thu, 21 May 2026 10:39:42 -0400
Received: from mail-yx1-xb12e.google.com ([2607:f8b0:4864:20::b12e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wQ4Yj-0000un-7L
 for qemu-arm@nongnu.org; Thu, 21 May 2026 10:39:38 -0400
Received: by mail-yx1-xb12e.google.com with SMTP id
 956f58d0204a3-65c21049dafso5559368d50.2
 for <qemu-arm@nongnu.org>; Thu, 21 May 2026 07:39:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779374376; cv=none;
 d=google.com; s=arc-20240605;
 b=HpuTdtNw0AKpN/DMXwiZAKPfW4xKCH0WHtjAj6f27e0ZFreKyJDsDYXBIcIInQuv+L
 0oTGsD4Q8F/nQRQaf6DD1Yi5onQ10noFkWrJL1pUa9dnzbuBQs+CX3/HwVcGKfTFa1g4
 rGzL/KVwn/0r64Lwl0LsQeYXxe/xvPQnIcZUyKbk755BkpHUuLg+h3toCEZ7SPvuEPm8
 XRsdJHPWikVIvj00298qUKdQVBQQ1y5EmkLov6umWp9w+zZaynPAsJSLrSr3IZq+9RVn
 HLoCkAh0rwCnUSB7BE4GcM7yqcrXOPUpB0fayEs55y2aex3kuf8j1hPngdodgDowJDqY
 LHJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=jhXwLY9+4lchqLsKMPkgNdoqmwJvKilxrM/k+zb6b0M=;
 fh=1tL7g5wv4xZ8fBXo5IMJrVbxsQp4OPSORmja6/eEj1U=;
 b=hNU5wbnAzSFZfUaIQsLWM+KiwhDJkrCjJaywCJRv5jSKtd3AkKBOB9PTdGQd5iVQyM
 RRy1KIqSNRGs/RK6nZbwIRTWykxOTzspCenb4BrfNvGLlt5KBRB5tZCKZIMpGtx+w7py
 IpoLMYDKVfSgTNSzm6lGpzMRVLuN0lZ/45ZWlvB++T0kZ7u+lwEynLwledBp3FblpHRf
 ostwkj3WdNRVMxHJLUFSM4CNFdh0rZVBVlZygMp6c2sSb/b9CbCPZiXEF5X/EBObY5JP
 YMe16qjUv3XdPCjEUbUYTqBbCLC6I4QXO0PgUT/Xrnv0v46KoV4tJ99EZsqPo863iOOa
 QZjg==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1779374376; x=1779979176; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=jhXwLY9+4lchqLsKMPkgNdoqmwJvKilxrM/k+zb6b0M=;
 b=lul5OqGmYGe4XKfvcMPIxxydnpHoKsu4RgzziEhYnyZlnzAjKUAsG9b0VE2fzHAYNT
 s3cS3+YbHXZrF1BkCJGgaaDHEvUktB5T07bmXYnBF72eNDCJ4PLLbfdUARRZq8zPIcIJ
 cvsSYru0DMgmnE5Q+JxJkWg2pKIK9NJbYhBV5e5ZRKOlvf+lfo9XqqsNVvGMRnUKhVGk
 NogOlGZKlmVX62o8Md4BU4KO9F/2eCF0ZW5zBcowvMmKsUvtOU3tFhJS223+yadpagXI
 IB3yRl61DnuC06pWoo18wukGDIBO6W19TGcSCvd+BEz56/UDUaL8iBu9bN6EGkZJjo4C
 h3cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1779374376; x=1779979176;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=jhXwLY9+4lchqLsKMPkgNdoqmwJvKilxrM/k+zb6b0M=;
 b=V57qkYNza9dJjjoFnYMjy2xZAnIKsftYhM8RktOfZMiAu1bK8jwDqz1CbAQpEN8GyH
 BfwwWsqc+rTx6xTAv9W4hGVtTIEx5ZMlOKEe7J6aWLFAbu4NAQwSZymeXsZRXaqKky6s
 snf7PWgslawA48zxV2jY87CNQjkdrNMz1AoD7TNbHNTncd8KHeZZy/qIWOMYCjfZ3hpA
 8m0P2ClanThI8Sne9eWTAGQp9UM31JdXkcUTjEG+9nP4xovtFcfxdSowYIiOwzywB7Tn
 ksahXoR7WhQuriB9Kz8jXYq68s0db6rXUOdzQdHWVUkuMGLvQO/WHoO+VBdtNKcgDXle
 j4vw==
X-Forwarded-Encrypted: i=1;
 AFNElJ9bvQKAz9dJD9NEPBtYgO5dgUrhCBH7xrYei1PhZlcSlQFAtqp1/Zq9RZAuri/7v4hQiqZdntEbFA==@nongnu.org
X-Gm-Message-State: AOJu0Yy2NsZrWdcLn1CV8FErk6emT1EAEm1JGs1zDPkXgMuc/tGvmjXx
 kK0+NH3VQShI/wNCa4xS5lTRc2bT0bticVvkaZIenE+VMSQfARCtjfBKPq7XmCUUhlXCcaOmUkH
 MAtu75vEq5uYTKWgRMx8GmSBsUESJk6cHlkdz9FynQQ==
X-Gm-Gg: Acq92OEUJ8nIXlUQqLp7q40tASTtG+q1tnkJpl+ucz7dSlCASJ8VH4m+MrDNM9LBc8P
 oKA1fH9TJOFEbQITYnOwWZ5U9LQV8JKxpTtM6t5sBgtIR9sxKLqyXq7PehJF7zXqr5A3fmuxuyX
 U6a1cikiva4RH/B3QLjRU4WmR1WMv8JZ3aErNPzJtsVQw3qKtD9Kdfn8426N3zQ/z4+KlvKloyN
 OdgkXFggcpPTDyeuR+EoKwjY2Z7ncGT7uyCnE0ToO2oU9xMKqIETix2lN2yTfyFZPeNDmzG2d3M
 rH8YApZC257k2VcnR8wvgtSyVxd6KvQ1jS/oGoQkQ+fNXCNasOsoB5W7fLBItus68HM=
X-Received: by 2002:a05:690e:1282:b0:65c:ed33:bda5 with SMTP id
 956f58d0204a3-65eadc277camr2650502d50.0.1779374375691; Thu, 21 May 2026
 07:39:35 -0700 (PDT)
MIME-Version: 1.0
References: <20260520182213.872945-1-richard.henderson@linaro.org>
 <20260520182213.872945-15-richard.henderson@linaro.org>
In-Reply-To: <20260520182213.872945-15-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 21 May 2026 15:39:24 +0100
X-Gm-Features: AVHnY4KZy8gwudKMPQNttwKlW59NIU8dyA1ugTwGRQoiXc4AmuR3ohSaKMmPoyc
Message-ID: <CAFEAcA9RE0ryq9Gq4Yxag2Mp0=H6VKZj4V9yPJh7ZuOb37w2rg@mail.gmail.com>
Subject: Re: [PATCH v6 14/64] tests/functional/aarch64/rme: update images to
 support FEAT_FP8
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, 
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b12e;
 envelope-from=peter.maydell@linaro.org; helo=mail-yx1-xb12e.google.com
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

On Wed, 20 May 2026 at 19:25, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> From: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
>
> As well, use -smp 1 since there is no visible speedup running with -smp 2.
>
> Signed-off-by: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

