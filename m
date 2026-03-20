Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74B05108B8EC
	for <qemu-arm@archiver.kernel.org>; Fri, 20 Mar 2026 10:29:02 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1w3X5w-0006y6-IB; Fri, 20 Mar 2026 06:28:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1w3X5u-0006wn-Su
 for qemu-arm@nongnu.org; Fri, 20 Mar 2026 06:28:42 -0400
Received: from mail-yw1-x112b.google.com ([2607:f8b0:4864:20::112b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1w3X5t-0008Hn-Gh
 for qemu-arm@nongnu.org; Fri, 20 Mar 2026 06:28:42 -0400
Received: by mail-yw1-x112b.google.com with SMTP id
 00721157ae682-798374d0f44so42501067b3.0
 for <qemu-arm@nongnu.org>; Fri, 20 Mar 2026 03:28:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774002520; cv=none;
 d=google.com; s=arc-20240605;
 b=OF5e3KqlKGya9ykXs5KCTpZQ3NXGDdiqZAVFrOVSGFW9jq192CW0VTuHS8DRvw1uzz
 bRwY734jB2KsjJcP047aAr7R42DxO4fFPve5TYVf5vt5Br49yuxVwLLeV44/S3/Nzjhp
 QSOzL5w9xBMwY7z+4o+tw7P8Rfgxvfo6sm0uASEOJs4aaFIp6LnKgdz5DLTmRjw7OS8F
 kvJ64Dg/6hamozkoQWN77+I8mWrSQ2oEW+3K5KWzkIPkkHuFUzgYGLiXRABjl2s8H4u8
 nDC/z+q6hH9R5t94fAATxvelpVJb+6Cj3tJv2OwFTo648pWpPbGfR/JWfpadU8fidUhC
 em3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=ftDVjc1lykJ4+8OQ8IymmDv9IAZH6bBmh1T4cjf25S8=;
 fh=1gYfMFLXoUcRwdHoMekF2/45MX7S7KSGLmt4PmsuJKo=;
 b=ThLe/w1FX15Q2/1ydeEVRMPhXZC6uTEN94ZMBf6rVWBmKLuuSa2GAloQU2b/YyKfIv
 7lF4D44eojp9fpH+WeUBe/b50+rTPbwttP1ZGyQB9czx5Nm+20wIiwrFYPE5mlXVwfXQ
 UET4FdTwpJ8p3RNt2JTFHBxPKmcdnjgVIq71NA7rZO4DWGWagiW80V6r8fYKyGdH/uUJ
 iUX2vnle4pkm8syNOA2xEn4PXI9a6c1oqr9skcGXNk5VcKz83iRwwmYejAGFLapYzYlW
 Rhbuw2N38THo/40LVfz9Oihwh4RCq+rZpEEvbJFZCpCR+deWmzD97L/CWI1yPZFDX4y0
 YtuQ==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1774002520; x=1774607320; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ftDVjc1lykJ4+8OQ8IymmDv9IAZH6bBmh1T4cjf25S8=;
 b=eeAI/eK6h61uIMib+U61KNxxaMLMHJYHBIx0SrrT4t0oL0G2/led4Z76/iiD5QcMDm
 k6Q8Pa4JotYuNRRPY0/T6XxIQkXm5v1XttP+i/OTQtWp6RfRAvIxZXfzn7KUyRvzCVmz
 oENBqfL+FUWWGCpXQQZ/yoL8pHjEUK1DWd02F3xBY5pbSNfy2EM6T6mySBP+D9Bh67ba
 ONSBcQ/HGMM/raFUj6ZYseCPqKelg8kah+tLRujMd3ap5ZjKMFjpmsLVEKS6WBLThn0E
 MVQaAGJvsH6kJHW4Fz7lpmuG/xGWGmhV7hMHaYY0gjBkfa8afE4KQtxJOERHWk8CqWjf
 UDcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1774002520; x=1774607320;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=ftDVjc1lykJ4+8OQ8IymmDv9IAZH6bBmh1T4cjf25S8=;
 b=K1oKYfnPfYB+G+IJyoujTjwiiMcOprqYJkroa6nW58V6RJCL4t1oc7fw0K6t30hnfW
 URjXdeAKc8lkahIB+ZzHgpnjmYSK2leFbt7vvHwLnSoxUQg694/rPPMg4/iUhA6uMeQY
 48YNVrRAj0mswdLbI8ldJ+HT5VuUrisVKqE5ac0CwcITzyGXBaynDku+5m6e+i6LAs+H
 HiGY0raDc96poO5NoPFY977bAmx4/wUYHOL634l9NKeZ71mgs2A9Ya0LKG54q5vGHDqh
 grZMf9jR7MeYU8Lm3OrPGZ40UPhfkQdTzT4h1Lrdrcg0OM4sqxKObJzOYvPJLyw5Sye+
 OlHw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVKbR17KoidLvzx4sPZQknc3YezX5DWKoNGPFokJUYMHSK3Ii30TRVCMxWTIpKB1mPOZHleqXahlA==@nongnu.org
X-Gm-Message-State: AOJu0YzuiJSu3KJGDKobPYn57lyJn346b6zVEu2rodJ+Lz4L5bVzYz6H
 20JFE+T9uq4Zix7Ru0jWKscRH++hn3UBjOeFInw2lbfTbkx3dWg1xyX9tKSBFOg35KN/vT8pSG4
 u7J97jA7CdYD12oTY7jWS7uPSxKH8Q2HImGKq84I37w==
X-Gm-Gg: ATEYQzzY+Z7hcJLG81jLLSpukd475PAqllrAim3W3RLkilsv4kbR02f0QEiw49GDaNw
 ne+5jtsnAeVdvdwCyjWBwyULpBi3a3HzdXSGybCAcWOpMp8Sw2r1RRKikgNWgl+TqM8plm6dfB3
 Tn9eDir34UF7+8BwpV0IJo0XRaPlSA0R3F0Tyh2u0Xs6O9GLlOJZPzuQ1eSAs6UHXHmz8YHEScz
 3kwPfMMZb2hHcyFgT+H7U2821z4+/eMaExsvziGA6w6GRDicEu5HInvXXGBc1TFiyQOJrn00u8A
 wQNtmoxdYEYDqpb6MAvX9UgAnOShzPgoqQowYze0EO2xfNoo07xvIchqCUTJ6ACslthBjyzuZry
 53A==
X-Received: by 2002:a05:690e:1341:b0:63f:b6c0:23f8 with SMTP id
 956f58d0204a3-64e9ce746e4mr5909433d50.33.1774002519945; Fri, 20 Mar 2026
 03:28:39 -0700 (PDT)
MIME-Version: 1.0
References: <20260319104414.66367-1-philmd@linaro.org>
In-Reply-To: <20260319104414.66367-1-philmd@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 20 Mar 2026 10:28:27 +0000
X-Gm-Features: AaiRm52qN88KA0k1C2AETQcj-KBNSPO9j0WdvTs_ZM-sGPPlrjz7HD8GNPvVRbI
Message-ID: <CAFEAcA9kmZp-ExsV-8k7fZ1nsGOyvnPZQ9tD1hrCTihxy=uRpQ@mail.gmail.com>
Subject: Re: [PATCH-for-11.0?] configs/targets: Restrict the legacy
 ldst_phys() API on ARM / Aarch64
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, Anton Johansson <anjo@rev.ng>, 
 Pierrick Bouvier <pierrick.bouvier@linaro.org>, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::112b;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x112b.google.com
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

On Thu, 19 Mar 2026 at 10:44, Philippe Mathieu-Daud=C3=A9 <philmd@linaro.or=
g> wrote:
>
> Commit d751921cffd ("hw/arm/omap1: Remove omap_badwidth_*
> implementations") removed the last use of the legacy ldst_phys()
> API. Set the TARGET_NOT_USING_LEGACY_LDST_PHYS_API variable to
> hide the legacy API to the ARM / Aarch64 binaries, avoiding further
> API uses to creep in.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
> ---
>  configs/targets/aarch64-softmmu.mak | 1 +
>  configs/targets/arm-softmmu.mak     | 1 +
>  2 files changed, 2 insertions(+)

We might as well take this now, it's pretty safe.



Applied to target-arm.next, thanks.

-- PMM

