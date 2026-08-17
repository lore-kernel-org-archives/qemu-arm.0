Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52348C5DF77
	for <qemu-arm@archiver.kernel.org>; Mon, 17 Aug 2026 15:35:39 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wvzMp-0004XK-HO; Mon, 17 Aug 2026 11:35:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wvzMk-0004WX-0B
 for qemu-arm@nongnu.org; Mon, 17 Aug 2026 11:35:13 -0400
Received: from mail-yw1-x1132.google.com ([2607:f8b0:4864:20::1132])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wvzMe-00078e-Qx
 for qemu-arm@nongnu.org; Mon, 17 Aug 2026 11:35:06 -0400
Received: by mail-yw1-x1132.google.com with SMTP id
 00721157ae682-836cda225c1so49508427b3.2
 for <qemu-arm@nongnu.org>; Mon, 17 Aug 2026 08:35:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786980901; cv=none;
 d=google.com; s=arc-20260327;
 b=Ia/9vHJZP4hC66yE7V6bxE9rTF+bTxgE4Lhvffc/hJUZYnh4LHu1stmi4yyo+vNBzE
 Nq9ZF/9yuDA6ToL2UwpX8rakcZHaz7gl6cQi0xJ3Oysp4EPD++5fCspoE71TS8MdgC7+
 OhawAvZDttpNYU7o4H2Y3I+XOWwOVG8yZHKaIaMjnj37v0/8E88YQcQJ/siiFql7KULV
 H2iZQSHXkL7KbvKeZIKd6zIWiEMt+Q5RmKPxNSJtRF188vR2zPxaO50o0MgugTqHd5NW
 wuz4Mwcc3x0Sn7jybf4HZ5opWexIO7ntoD7jnlOtnzKEXv4yvf9HX/7oAkJrNy3Oei0X
 bLUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=MmjSya6t6MsCWp6oHkwzpWJlKR5JnMtoXgEi7EGW03M=;
 fh=rN8SVAQk09JbTaAqURTzlmLziTq2ugx4is88fT4ogq4=;
 b=U5O0N9YSW4zTERZLWZtk86wz3omQ1Hpr7wf2BDUID+zuxwE6/Bu4c26kVuHKRR5wf5
 WJlgdejSn+1MbHu4DYinfSxHgbvlhikLWoPZG61i/zOgCjO6ipxZnM3W3hs8BS0u67Mt
 LoogKK+MubCnRSYjNSAH7xQiMbUGT369Gcz3vJeWeXDBcbHirlCqHzq7u7WEUEmUksIP
 560Vf5c/kcGsxjubDWy12Q9ScmED94Oy+vfXaa2iJF4Nj35fiGYAHQQFrdFSbKYacsq8
 5I4dn69pxILj/pxbrCy24PxBLCLFi2Ipe8xWE6UgZF6AJonjx+oXfs+/TFXwHDLQoFXW
 +EtA==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1786980901; x=1787585701; darn=nongnu.org;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=MmjSya6t6MsCWp6oHkwzpWJlKR5JnMtoXgEi7EGW03M=;
 b=ubRQjr9LozUXZIZ131HNOhygapfQF1XY94IdDlq6S9BwEaQ+i9vvCbOIzSIHbmiYEk
 c2E+GoDTFUiLofqFjrRKnT74dt+Rr+Hdu9Hy0rXC7N12n9lpClrrzzvTn7F5QfIrcOF0
 w5Q6QPrVC5ejwJLKxI+wwr8UmVF1NvlttLT5UY8wOv4HQmbnFbffaq7JYowcJYG+FyLA
 n1li6UKBY/2ztJAzZ3K/QxBGMQS1kQVPTftdR+E4+jGWazsfh2S/5G/F2cC+HhC72uXG
 silsvcSU3/pToOew6Fb/1kFjk8iuYPGOZss4RCEzuqognrNLNAx+lkyZhnuuRFz56gJu
 LeXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1786980901; x=1787585701;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=MmjSya6t6MsCWp6oHkwzpWJlKR5JnMtoXgEi7EGW03M=;
 b=rBAhogvpnU14DTYMr5Z/UWcSXrwjmZdRqjK4zD6VBszVmu+r4BRuiHPL58qmcWPLKa
 8/cQyufK4wd1Q0NObWDqv+zp3pBbf3uQ7QJ/VrsmwuXaKOq7/oVh6SfdFZjnWU6VTBmm
 D8Ew14Iv5WiErZk/s1I5lFs4CqF8A3kPguUJAolCVwmrugFinLFBfY4Nlr7eMqlfSilu
 9drW2CM83/HEN3KIOO8C8z9DRqZH4QVBhdj16W4nHwMCyOA6lspoNNp/nm7LlzqrOVpi
 inJNi2vSpQN1CiX7WfpzBv6kv8ygdOOSQ3BTnbQo39HVFTpnPLkp67tiS0BC2/T7WRoK
 3ZIg==
X-Forwarded-Encrypted: i=1;
 AHgh+RpvwjrYxZWkdIxIlP7ySdOUEL6JqBX5bv+CszbrGspYzBAyRJBUvl4abBgO/ShqPYFRW5p+NIRpvg==@nongnu.org
X-Gm-Message-State: AOJu0YxmoF7tPcQCWuP8dZqeWqxHYWnflnEIpIVW1Wnv8tYI5FR8IXsq
 gbNRpaV6c3vZD77regwg/k+ELR18pKl9SalBgTX9iN3DrW3wrKqk/YS3oXGLNkucQiBMyqBeXnS
 djQGspnbbe9ku8i2x04evhEN4uOkK9zbx5e+M9LBqcg==
X-Gm-Gg: AR+sD13nv0C/0cvLqKHdYInD5sg8fJGKkNpapbKGF+N2zyT/hRuV0eh/f89wOt8DESv
 52/xzOfBqOHEoNvah/j182oeOfuFfmXu0IRuWgKDw8bD4tKlzywt+3h0n1u8MpXI3iyRxW3KVX9
 e3XGVGYxjz/qn8DO6YpBO7gXabAf7fEBolmh2C46R1zrgAIZjt+WB/uv2BFnU8hm5diVSifHMox
 FCZ2R98tMPRHDCuGfBsWloDsZ975l25+NPRCM9o0mvwGb/GOqteAguSvY+7FJhxoLDhv2RcoQ9g
 VJ1A9hBPa+w3KVGvgtyk7DjAuACCrTWAHT4piGneVEE0CrL/AV1IfTiNDfbvAgU2l80iAmptvI2
 /BVW81zvGxXYWBDUesPICLVirNIm3
X-Received: by 2002:a05:690c:9a12:b0:81e:89b2:91ae with SMTP id
 00721157ae682-837118357c9mr100882887b3.21.1786980900633; Mon, 17 Aug 2026
 08:35:00 -0700 (PDT)
MIME-Version: 1.0
References: <20260805153005.9989-1-simonxhy0404@gmail.com>
 <20260805153005.9989-6-simonxhy0404@gmail.com>
In-Reply-To: <20260805153005.9989-6-simonxhy0404@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 17 Aug 2026 16:34:48 +0100
X-Gm-Features: AcwNN1V5EVpivNd8Np0xC72WLDNGwcpeBvYwYsIKeinYArScF7RDCRQQP4fQKgY
Message-ID: <CAFEAcA_r40M4SpC5jLUoi2n2PcsYODCRot=io9xCOFyqBHXtaA@mail.gmail.com>
Subject: Re: [PATCH v2 5/9] hw/misc/iotkit-secctl.c: add SSE-310 support
To: Simon Xu <simonxhy0404@gmail.com>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, 
 Owen Giles <owen.giles@hpe.com>,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>, 
 Robert Elliott <elliott@hpe.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1132;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1132.google.com
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

On Wed, 5 Aug 2026 at 16:30, Simon Xu <simonxhy0404@gmail.com> wrote:
>
> Add SSE-310 secure and non-secure ID registers.
>
> Reviewed-by: Owen Giles <owen.giles@hpe.com>
> Reviewed-by: Robert Elliott <elliott@hpe.com>
> Signed-off-by: Simon Xu <simonxhy0404@gmail.com>
> ---
> v1 -> v2
>         With the bug fix from the previous patch
> ---

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

