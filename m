Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35C1DC5B572
	for <qemu-arm@archiver.kernel.org>; Mon, 17 Aug 2026 15:00:42 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wvyp9-0000Hv-Ef; Mon, 17 Aug 2026 11:00:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wvyp7-0000HC-Rw
 for qemu-arm@nongnu.org; Mon, 17 Aug 2026 11:00:25 -0400
Received: from mail-yw1-x112a.google.com ([2607:f8b0:4864:20::112a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wvyp6-0005K2-5p
 for qemu-arm@nongnu.org; Mon, 17 Aug 2026 11:00:25 -0400
Received: by mail-yw1-x112a.google.com with SMTP id
 00721157ae682-836c590b61eso52723437b3.0
 for <qemu-arm@nongnu.org>; Mon, 17 Aug 2026 08:00:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786978823; cv=none;
 d=google.com; s=arc-20260327;
 b=bMftoPWEfVpFb0To6aZH/1Ce29HFnOPR7411NOCCtDvS5sokCyHB8pxyYtIo9MD7cK
 IcKmLodyn9R0oPDuxd2d6jQYTaSGkQjJocyneOzr20pr6fVgkYM2m5nHGul2uiYIF/GZ
 I0LAdfE9CiE2FpyVpu461DmUPMG0Jt9WN6F5zaJ3B16F1G/EDxh7LZNFI8W1uwlXD1S0
 xj5HIJfF+evnvIBhft2kBwT6+UyAIwv0pRskIrMLV6/WCnjsOayZ6yV8gNU+IPMp0kme
 v5HDUiqC7e8LJh8q4s5lAoXWznfKJHcNtNFzoeRdc3PifAnLZzax5OthpUmFkcYsXudL
 1UxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=aB2m+BEwHXwBW5rkwDofc3v6qq7ek2Q94aJJS3tSN6E=;
 fh=hzIQ2IayhJQ7AUfBEdMzQ/FBhvwZ0JvMrZvhpNYT78c=;
 b=RvrtVPZQawMMIunUGUqezY3K5uRM/T+n2Fg7CjqaxOM60rIaDN4SRsKwTimraurZIL
 QY70J4lziVB3SWr1eVrndr0IgrrRDAxTO/+CcbU6UZbOHDEKANTKgYdYdisQK076semw
 JgQ4/NtBQIE5KCKgF4Wu28LWmL+K9a1UrDNIgHOsFO2351htNV9cWox6AJiRrLJTpn5i
 JT9OnPxqZCs7omydelYDfNth5PE4ggfmJV8Hdo0X2PuBqX+gN4Ps5Z6hYkW7prQvgNVQ
 b9NnsZEMUk9B9e7bN1TCGq+gp0d8TAvmanOn2GE716mXjLW3Nx2t9JXkXgVMTSrbK1IQ
 QqLg==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1786978823; x=1787583623; darn=nongnu.org;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=aB2m+BEwHXwBW5rkwDofc3v6qq7ek2Q94aJJS3tSN6E=;
 b=iILl+9rIoKVLgGyCJCxjt+lW0oqMPuv8E1b83yMV0LQmuW3xH2bqt/uy7tNcunKHyl
 BIpYC+1STDGFJazqwkxHtgaH63nrdfERvnoQG3LWzDTnHd6FETO+MyvON+AYpeoD2Qbk
 KjMzjMQItilhtomnhwQsGRN0IPe5qx6gFW74Vcg1GOZpc3X1VIxsvnNXY+akkRFpCk1L
 8Izv/VXW78EexliwWdiYu1d+nI1uAq/KVWd6Pb9667soL7J8WmzJZET0xypBgjTe3Z/b
 nWD7TtxXi8HeEdXQqK8edyaIrnhRFvO6wYxmubtyIBC3MQ7RbMGxseXvmcAvtiU1VkEk
 Tg6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1786978823; x=1787583623;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=aB2m+BEwHXwBW5rkwDofc3v6qq7ek2Q94aJJS3tSN6E=;
 b=TqvJNhFRt3grTV8ACKn0zEYNdVKkmeE+zBJZxRrxmu2AI9Q0u0UY4ZleyDrK9d2cZC
 dLfbGsJb0rIN+TTNXSEHacSv9TrgWjcN1ZVOvuuAVOLFsNdtsaHL9VAcSEqo3k3x8GXU
 NjwK9NP60KucAWeOk0AUSrR16JYWj35RhXLi0tf/8M2v+duPPnOaZ2sSyc7vwJEgzbWY
 b/y7AAH+nHQtUOKqkl/mpUz3+DUfJN10MuDSrmzSpf0bpU1Nuy7AjD8nJmWt7P8dxO4S
 R9SwZNJ60iQ12kRClYBP26kRTfdY9K9PRbRtezJNgPBhHIIvaFf1Sa7loKzmfGE/T/eX
 YK+w==
X-Forwarded-Encrypted: i=1;
 AHgh+Ro2fxIytM4RLHhBo+6TFPaQzZUDzaCPjidw7QVCDGpdTQ4I3r0TkUd8Krj359opxV+v88wJO9FVqA==@nongnu.org
X-Gm-Message-State: AOJu0YxfPjpdJHCEN3lxh9+oSDdwzFEjuAMX+sUtfoR1E0OopLFnF9sN
 eE9LjOpvwjRsC8JgHwXQZ87QnLP8h/sOyaoB8hRZR/frpdNa0mgcYsz+st4AJMI0pl8+rwiBULq
 0fkcctYlR8JuMs15fxG/nS8N+Ae+KsQPUomq+C7zvFQ==
X-Gm-Gg: AR+sD12WcQdzp2BqpImZiwtxSeCB7U7O6iBoyoBmAiQGNKfpRKb8JO2ZEMVau4qNwvv
 h2oalVMvwRaerLmgAk7Gh8ocp7NS4Ir+ghUr9XC8c7blmxG9azt9/cDPsUCJ2usLSpI2N7KcYqC
 j0P4voH9M561nUVdVigQQSS9s2EBXktBEe/gYjZLuwh6P82EiMgrvN8FSmLEvw0Yyz24jwb+MzP
 aKYFIocxkkrOypkQMpgKwl0xVObU9lTtccytGR/JpDZc0lsHp6YBJqArzwv9DLCzOiKWXorUuke
 OryST5JTztZ2n2aoznAxdR/nhm0SVZcO5ckjq+ofsByl2toOJ4kMCvM8zAjeb51yi4lc0vR9DWR
 QmEyxt0H1OPNtMqKWvjy7hqc3zaGG
X-Received: by 2002:a05:690c:c511:b0:81e:6cdf:b2f5 with SMTP id
 00721157ae682-837077121e3mr97009827b3.0.1786978822481; Mon, 17 Aug 2026
 08:00:22 -0700 (PDT)
MIME-Version: 1.0
References: <20260812204435.295067-1-richard.henderson@linaro.org>
 <20260812204435.295067-10-richard.henderson@linaro.org>
In-Reply-To: <20260812204435.295067-10-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 17 Aug 2026 16:00:11 +0100
X-Gm-Features: AcwNN1XYF2deQOsQyFiaeo04BEmMyTUmVuoEO80-1SviVzPGjFqkZS02qKhQypE
Message-ID: <CAFEAcA_yvCYpmmgs9N23c5HkB7+BZEvYB67HbbPPTt_eBC5HaA@mail.gmail.com>
Subject: Re: [PATCH v2 09/10] target/arm: Annotate arch revisions in
 aarch64_max_tcg_initfn
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::112a;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x112a.google.com
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

On Wed, 12 Aug 2026 at 21:46, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Annotate the minimum revion from which each feature is OPTIONAL.
> Modulo some sorting of properties at the end, comment changes only.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/tcg/cpu64.c | 303 +++++++++++++++++++++--------------------
>  1 file changed, 159 insertions(+), 144 deletions(-)


>      t = GET_IDREG(isar, ID_AA64ISAR1);
> -    t = FIELD_DP64(t, ID_AA64ISAR1, DPB, 2);      /* FEAT_DPB2 */
> -    t = FIELD_DP64(t, ID_AA64ISAR1, APA, PauthFeat_FPACCOMBINED);
> +    t = FIELD_DP64(t, ID_AA64ISAR1, DPB, 2);      /* v8.1: FEAT_DPB2 */
> +    t = FIELD_DP64(t, ID_AA64ISAR1, APA, PauthFeat_FPACCOMBINED); /* v8.2 */
>      t = FIELD_DP64(t, ID_AA64ISAR1, API, 1);

Out of scope for this series, but this value for API is wrong:
if we implement FEAT_FPACCOMBINE (as we report with APA = 5)
then we should also report API = 5. aarch64_cpu_pauth_finalize()
fixes this up because it always rewrites these fields, but
probably better to start with a consistent set of values here.

-- PMM

