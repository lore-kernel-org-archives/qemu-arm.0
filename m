Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECBB8CD5BAC
	for <qemu-arm@archiver.kernel.org>; Thu, 21 May 2026 16:39:47 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wQ6Qu-000126-HK; Thu, 21 May 2026 12:39:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wQ6Qq-000119-T4
 for qemu-arm@nongnu.org; Thu, 21 May 2026 12:39:37 -0400
Received: from mail-yx1-xb132.google.com ([2607:f8b0:4864:20::b132])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wQ6Qp-0001qI-Et
 for qemu-arm@nongnu.org; Thu, 21 May 2026 12:39:36 -0400
Received: by mail-yx1-xb132.google.com with SMTP id
 956f58d0204a3-65c7492a2ceso5628185d50.3
 for <qemu-arm@nongnu.org>; Thu, 21 May 2026 09:39:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779381574; cv=none;
 d=google.com; s=arc-20240605;
 b=O5O/pmMm9HLS0FImnMzDEF/d3MVrP1sJ9vzM+5ZBOYRWUgnlAJyHaTKnJOaBxY6Khk
 RyIHqRyqpSS0r9GohWpTwHO9f57tfD0OpOa7X7fCZg2wBDP0y5uTWh6iOsPTP+KB5fXC
 WQF3Jv/wOIRNJKb6s4e+nLfQB2VNYDrnSN8ZCWp8jQHK/ezVTQb7hpgS7dXx3jNWRkhO
 qAgLVQoet0e7soiyeZUQPjWCJk8tLHGxyk9ZJ/696EgaSa+pGUpmKW+4Hx5sWBpee7DD
 OKlMElEmwFO2jkhcWVKo20eXW0kSEvdhMrxvfTet9FWsoqrEZQctKYjhNHigjnMEEBZn
 se7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=q6DedJq+Vq2REZyXEucN3PDFSSI/GYTuM1EzoART2O4=;
 fh=HK7V04vWjt6uZ+ENXJdKRg6PwIDWStCpGPsCHu6t8qw=;
 b=f6MEyg004Z0U+FlrZGgIx6rdUPQr2win2WGuLJcR6hZG9Ex3bdUltikwQ6XcCuplU2
 u38u/8KsNgxKdkK8TD6HJsLMSnnhf7nZG6ud0iea4kwW3mzUY4jxypIpPLFdeyCYsHbg
 6Ua/iFBRx+hJdDX2hH4gGiTXcMoNPUocjr3NWvkmFfxsnZBAY9MzCOSQ6uxAfRXMQfNE
 86Ti90ZJRpxUS4JBCxzdDxkXWvN/1HB3ziYCW6CMrsN6Cn03KpAiGwjVKCRYzeNRo3rD
 J9w72BEwW73cqkDuPTJ0O9tYlOnmHdMmEvA7uIt4ue4EqX9Sra0ZFD1YCqDoae+uvlli
 2Eeg==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1779381574; x=1779986374; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=q6DedJq+Vq2REZyXEucN3PDFSSI/GYTuM1EzoART2O4=;
 b=DLiWfdzY/aQj9uVS1maYHU1NW7IFnWXWT5zpZJp/SeyxlxBnFRyoIXyfB2cKVddCfN
 UyP9Av9dtNOCJGEGUhjNsNQCwPsOS6wO/fEwK9a/4KxweGt0jMkmmqJbfY7CEkbJXlmL
 DhgxhD6j/owacuhel+6lhTb22UliWdi0cSh0L/LN/PCkfMyyO5nkmYIrUcaK0C95kNpL
 tgy7urCRELZLR29Y+6jVcEU/AAQyxf2EONY2F8y9yvejsE8anCL/DF294kqZ4t6sSSHD
 cpqCzGN1uE2kp0q/bmVx1hpCS1nJOn3EsUoohIG8/s9rRbxXYOoRfHxl6zb0u+31L5M5
 rUKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1779381574; x=1779986374;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=q6DedJq+Vq2REZyXEucN3PDFSSI/GYTuM1EzoART2O4=;
 b=OIzF1aVJHqeQnd7l305U4q14oZrWeAIo9Usza94GIyyBqmxekeiTw435XPNnXwEvQI
 06jcM14E/1pP3fWj9xuWpd4oqWz6yzuEauKeYzTbDG6sqrfCSd9YWswZFgDfjkUoF9Vd
 gKPSL81hv6ryodzCvyC2EdIa1Jx+dQj++ohlrkZefZIMmHp2LzIxqinPwCplaS6VQsuW
 s0JGJ20cxctb6J0DfLFaVt0UzhGqiT2+m01lklya9UgpeTC4q4kVJiV3TfWfPyaqctGx
 jrDfHqcfNx77qv1L0n5Gne1Lwb7roAHycKiHIOpS1IRlpWUgCW5cfdF7izH/hKkFZch1
 rGuA==
X-Forwarded-Encrypted: i=1;
 AFNElJ8Tg32JHmdrjmYEHuewaycvJ1d1izeOa2kzI1fXJKe2mzgu8SOEkXnwo1oAfPW1LNKgCSWZiUWbSQ==@nongnu.org
X-Gm-Message-State: AOJu0YxIxoyw/M3qpr064Pq66jyQva/IcxzKoIp6MeoXXliwZWEzWxck
 MTOyKGsnyeA7oGb8NmI8swDOBoLQ0w5M0S0kSoTbwemKIAZs3kr42MNdeS5IYlwqm8tT/DJ0mxu
 G78liGhcFYv9+bXt3+Alh6MYYjWVr9wGTkSLoIvSvzg==
X-Gm-Gg: Acq92OEIuRhQogOXZ6/aMyDggiwy86smcD/YX5fAW5d0noqAgX/Lp2+AjcHd4n4teFp
 5OgTpZAaGmjsKY9Q/vYh8bpAPUm+MY0ic1Q6H0LynjXOOZTK0tBHcG3QzMau5hKUrM5BNN3Wssq
 p7Yn29mAYSre+QMliH1A6SVCQ8Kym9p1iVrIWmCBsGdaJRsp37RaLjEbQfRsFh3kIRVgs1jr5gB
 hLDnq15C8Voic50q+SsLY08kOh55/3VhdgRvSQl8WIxat3EIlazht+ayk2jFduVv5lc5OqyfZ/f
 z/LDIN1vwBsZtTX3Oa+MrOje9EuVvYG7aKIMY0GW4bHoL0HqEbUi4LYyLf6W0AERFNFbHJGzgyG
 hQA==
X-Received: by 2002:a05:690e:dc5:b0:652:f16e:952e with SMTP id
 956f58d0204a3-65eadfa6aa8mr3375708d50.14.1779381574152; Thu, 21 May 2026
 09:39:34 -0700 (PDT)
MIME-Version: 1.0
References: <20260520182213.872945-1-richard.henderson@linaro.org>
 <20260520182213.872945-27-richard.henderson@linaro.org>
In-Reply-To: <20260520182213.872945-27-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 21 May 2026 17:39:22 +0100
X-Gm-Features: AVHnY4IK3RqcEZBDglJPDxpf1LDrBco05vxsMSELj9YkVtoReUSDs_id5qlCtHQ
Message-ID: <CAFEAcA8LHourEkC9QCD5SJFrfrqB4bbrH_dUW3dOXZZ0et8CXw@mail.gmail.com>
Subject: Re: [PATCH v6 26/64] target/arm: Rename SME BFCVT patterns to BFCVT_hs
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b132;
 envelope-from=peter.maydell@linaro.org; helo=mail-yx1-xb132.google.com
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

On Wed, 20 May 2026 at 19:27, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> The existing pattern is BFCVT (single-precision to BFloat16).
> In preparation for introducing more insns of the same name,
> append the operand sizes.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

