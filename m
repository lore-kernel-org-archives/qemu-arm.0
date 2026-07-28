Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21769C53219
	for <qemu-arm@archiver.kernel.org>; Tue, 28 Jul 2026 15:24:37 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wojes-0001hf-JW; Tue, 28 Jul 2026 11:23:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wojer-0001ff-6W
 for qemu-arm@nongnu.org; Tue, 28 Jul 2026 11:23:53 -0400
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wojep-0000RJ-Ld
 for qemu-arm@nongnu.org; Tue, 28 Jul 2026 11:23:52 -0400
Received: by mail-ej1-x62f.google.com with SMTP id
 a640c23a62f3a-c1c52d920b8so540867766b.2
 for <qemu-arm@nongnu.org>; Tue, 28 Jul 2026 08:23:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785252230; cv=none;
 d=google.com; s=arc-20260327;
 b=OwdOeN6UnFtMLnyXJQfRbQ90saSUZxAKFcpsqATNkOnuHeRaWgEbezJP6078TQResN
 WcFl65megoGXC/PuZmhm1IKkz6v86gl4rFb+HOgBLc+WEXzZlzV+u8byvfSrAeFtUiON
 GGcLi47bjGOqG263S4/vEJUb3LHhpHRyl3o65YyOdsTiomADzHRuxXpMcp308OR5q4f5
 zRe/oYFshqEsxSnPeiurU+VPFcznasb4m5DPDXT4nnj1E35cD6NsG187CoSSov0dLzVK
 SiHqsWwuG4JUIpzGluCl01wtzCTkLI1pfdJj89HxKviVbRveZmQWgKvO91xrQjek3gjh
 zqQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=Ju/BwTJTrWRsQz4A/m4bJpmm3fjfHhSK8gGCKoeWa9U=;
 fh=yAUSwIvmN9P6bmdtcUEHwCKH28h3jm6YIGMXyZcX4GA=;
 b=YQ928Z3UxT7yj13J8IxymsTwCZ3w0Jw5QvF8kKoGNO6AeM5M7l5EWGKW3uTsRPNu4A
 OUlBLK+YL1H5mrdIkF2p1Vuprljr3iLBRHPGRVskmzc9aH7zdm/uLaXMTdGlNjwGT7vb
 TyGQIn5PXjo0WuRer3FJMIsx+YQvIX4b7vfXybBdhuQor1pJ1o2EYvPffFfyXmxF/iEW
 R7eSTwtIr3Frg4qgc02Rzesozf1YLqU1zJPKMkhfTtIJvKVqdgTy18Gp0l7OSdqQX1nx
 hF2xAghx1gbjLij29nQtX+l1s2iIj6AuNiWJ037DjrZfOHTkd6HQd6WlPeVI5S/qhhKm
 Fsqw==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1785252230; x=1785857030; darn=nongnu.org;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=Ju/BwTJTrWRsQz4A/m4bJpmm3fjfHhSK8gGCKoeWa9U=;
 b=QMWEwQMRaASqrw80Tc1bOjZpSAVtW5i+mbAQ2Tfe/MHoawMVGttu35Jbfx5/kurtD/
 T+EDlc2Rg62DaWQh78EdLhi9VglkdvDL+ktcb1XwMXkZcp5O6h7pc0gdBzKHctp+Dvnm
 fc+xjpvZs+hOzmuaXhUBSwCmwzrBpKRwYdU1LzmVmsCWbrzWDOk16tUZXxPwHgzgaGJA
 zicOYYbZwK4q7szs6iA5AtsXnne9aTJxQttc1ssSRUUW2kkzurOVd21e8jkUvkwnCwTJ
 f+bhC9HRBBxA5p+UehckfRnSgxJSRJCm9ZIMvlRQvAd8yB67RG/VQRNnkb0OydwkN5t6
 92kQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1785252230; x=1785857030;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=Ju/BwTJTrWRsQz4A/m4bJpmm3fjfHhSK8gGCKoeWa9U=;
 b=srcGRzhKfPAN+hPKDpnvRnhsf8VnvHrRFqZJHBxrupnRYvAjv7fh/uG5Q2ycq+sObZ
 ztHE3yyzMqSd1bixqk1eVt1W8ReMvhru0/J2bJfSzPOJihrMHpPnef2yIH1D4uzaRjXj
 ubersHtZsw3WY6RfrOax8I15YM6lh/qr8eg14VcwBCTax7JU40Ty/UHCWcYrZ/NcIqnB
 SmJncC6p/3bNTWHT9ZlexVzDoa0/qi5qJduJKBIO/mFFY+mUFNMTU+afOE532S/YuWEp
 TTwK1EKl6PTdet2Oy304xDvH9IbKhgES20LBH5Mi4uFa5jP8oKQ6i/doT0xHfuMOnyzP
 UyZA==
X-Forwarded-Encrypted: i=1;
 AHgh+RrZLHgE6dqQECnnzOlT6HNDggaSX30c0ZL/EMruFa0n1JZAxSRrPcvOxlLJUl9GVKnTHeX2n0JXMg==@nongnu.org
X-Gm-Message-State: AOJu0YwPPosXQLXU4mQ5f3Qa0Z7HYZnrUfztvZKkroLXU314FsPKMcQM
 EeqGG8j+dgaUmsH7XfphAWo6yObKyfFY5mGZQ1N4zrKMcjbmsivw4MaQHJVCBXlq+1XH3Btm2lz
 TfU8dr/sTO7KUv7lxQgeSE3SYmTAS6H1fNyp+E/YYaJoi4m8JE0ns
X-Gm-Gg: AR+sD12sm3yO0vfBsin4+usBtc7z7NlG56K3N2AryeNwJ04zJUgjLcwvU81S3c8jRCA
 caCfit1RRRwSlikgafXGMAEMvy3nRFKb8H9Uh9LGgvHSRZM0Q1RVK7VMeDFSamO6thcDN7oqO6A
 7NuuldQ/eyybySYZpUnNfqKcIs+rZS8FrH00Vi8YdRfBNjV0zoxrrUb070mQITR68MOBnjENe76
 1jQHT0VwfrbUEbn0++YdBSoWHlapD33NkqVPCYF0cQPcnhXPzg6mJc2tZfMIcNfFybzrhmIh+/W
 v1yQDAc7SptLHhDBVTMQh9sbt/RGjYNBHmLWKXd2cMpgRSOncZPVWcIjtidiZd4BgJU=
X-Received: by 2002:a17:907:c80e:b0:c1c:25a2:45b with SMTP id
 a640c23a62f3a-c1f727c57efmr139498266b.63.1785252229658; Tue, 28 Jul 2026
 08:23:49 -0700 (PDT)
MIME-Version: 1.0
References: <20260721184656.530230-1-richard.henderson@linaro.org>
 <20260721184656.530230-6-richard.henderson@linaro.org>
In-Reply-To: <20260721184656.530230-6-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 28 Jul 2026 16:23:36 +0100
X-Gm-Features: AUfX_mwuY_zwTDPumOvLSmePIH4ezUKTaLBo3cMa2ve12KO4Hxt0xHPUl8w-PHw
Message-ID: <CAFEAcA-FrNMiU5WqqbXim-QZPNk-HL4a=CkAV5F65_wa1+=vLw@mail.gmail.com>
Subject: Re: [PATCH 05/20] target/arm: Split decode of BFloat SVE FADD, FSUB, 
 FMUL, FMIN*, FMAX*
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::62f;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62f.google.com
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

On Tue, 21 Jul 2026 at 19:49, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Split decode so that feature detection can be handled
> external to gen_gvec_fpst_arg_zpzz
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

