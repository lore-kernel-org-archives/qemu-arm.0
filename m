Received: by 2002:ac2:4841:0:0:0:0:0 with SMTP id 1csp2553288lfy;
        Mon, 24 Aug 2020 06:18:36 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyIWwHXe2MR1LZLusVM1mWLlQ+6bvYY99JIEaujhlioRe43/UkChFGLNQZw/C/wcDyjMKRp
X-Received: by 2002:a05:6122:2c:: with SMTP id q12mr2599322vkd.39.1598275116651;
        Mon, 24 Aug 2020 06:18:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1598275116; cv=none;
        d=google.com; s=arc-20160816;
        b=jyt98CtpLGdMeCHBr4SY/WhkXYDVWV2xGOsmc2lemA8oBhwqsEF14oPgeEB5BjNxFq
         gZY6ge6l5bE2H8Ac8vSb/C6kQdMZkXEDJJJuUfyYsRf8n9DAOYC6M/y3XLMnLdw7u3gk
         L3psFphSQFo9JKnT+jubg2MeIMi+uoz0puu07YeMFriBVKpY61IbtaE6v2tjNbMmQ+Qa
         2TJy5zR73/pRtVe+fQRLzwIEIJWJinZFRiRRAooBVyzMqIGyiSqfVSb+mA1kETSTew3I
         R21Zs83EBy/MizAhCu3tSwifzSJuEncvLFeJ+dp0fL/EfwyqzFfjILudrMb3dwcBGJXW
         iEeg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=zntdPPS1QFYpvxxzmh8hC0pXrmmiO5RgZChYOynAOBE=;
        b=D6Y2WTSRi92eDd4iS782Aq6b+fk8ilKU9vBo8S6/b8GEJRybEf+MsxzFLmG0Vuj1a8
         5+z21HW4BmQn9hwI/Qk1K4SG8F5CvZKsDWjLwWsT5rHVSchiUoT1CVpv+71HsiixgED8
         xStsYjbVBx7T4scvoBlbqsz9TQBWMbmiuB5P3cYiOlCLxTGhhPvnTgzNDmgXHX2MMfbl
         drT8KkdGmUCCVM60L8emRgLtmIfS5oLRM+yBAhR73gN5AESxGrmsjzxl9SiXwufMgkcA
         CKirqSrHLHFJGYokteYFEQ7pRsnZ+A8G5lEVgVkUBpnz8VU0zeQGbiD4SJ7RzsxzwzHl
         5W5g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=buzVZHJO;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id n9si1537328uad.77.2020.08.24.06.18.36
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 24 Aug 2020 06:18:36 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=buzVZHJO;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:59356 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kACMt-0001Ms-VS
	for alex.bennee@linaro.org; Mon, 24 Aug 2020 09:18:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51296)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kACMl-0001JP-90
 for qemu-arm@nongnu.org; Mon, 24 Aug 2020 09:18:27 -0400
Received: from mail-ej1-x644.google.com ([2a00:1450:4864:20::644]:41348)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kACMj-0001QO-Nc
 for qemu-arm@nongnu.org; Mon, 24 Aug 2020 09:18:26 -0400
Received: by mail-ej1-x644.google.com with SMTP id b17so3566713ejq.8
 for <qemu-arm@nongnu.org>; Mon, 24 Aug 2020 06:18:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=zntdPPS1QFYpvxxzmh8hC0pXrmmiO5RgZChYOynAOBE=;
 b=buzVZHJOjD5yYBP7vOPgcNftYEHbPsKCFBdNqTgiuBpMlOinMKkdjsDN3j2Qv68lu8
 vJXKm/B7CyQfGXgbmhL5ACS75q8Xr9gS3gyY6/XMC1TvBJyOKL7U8fAeILMh2bmNMHs4
 kcj9YQ0xAj9JSdXwfofATe45GsuwETtmbWnkPowt0S4jcylGa2RGD39HsLHCpaj5XIMI
 L2sSwmj4uMkbrPEEze3N1xlq4lYlMSEMgJaF0Q7NRyqwY9hZpj4OKeiPL8Lpss7bC5F1
 imnFG1FSZ/MSDfWm1rf87wXYoroO+GxAVVc7xMMUdde7Rigath0phDcsmhFEdEF7YaBp
 wHRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=zntdPPS1QFYpvxxzmh8hC0pXrmmiO5RgZChYOynAOBE=;
 b=U1wdv1JClBvZ3zBi9a+V60d/KUBAkhmTU/fPff26cnXQMQWyHzw8pUgPBrBcuYiiBY
 OcMpbKvRw4Sivv1apdWbIOjk3f8Kig37NO+mkM4hSK2mgUFxDk6QXFaZ150ZrYaAfPgj
 yDUaocVkNwKx/sp7zsf4C/Rrh9lQj8bcpNXMfZoubVbbHkdw9CGhjsv7zH6VpBEFR8CB
 atgBryAmZMviBr8omRTtcDZBKNjQhmNl0QGGz4yZhvXvo6vmnnLZlijYX03jxTdD1Urn
 JNHv9FewiD73gVzuXLsxwxhzLdkaays1ru/XfFWm1E6FD296XlfEdCPpwOSYLXTuWZwc
 U38Q==
X-Gm-Message-State: AOAM5321FyTWpKLkUa520lEeb/fTrXyMbDg9/GFPyNsfZ3XNXtlOhUkg
 YBSuaRnXq4wMu+o1L8f2CPdJaUCLaOrG72xiS07B9Q==
X-Received: by 2002:a17:906:59b:: with SMTP id 27mr5855113ejn.56.1598275103823; 
 Mon, 24 Aug 2020 06:18:23 -0700 (PDT)
MIME-Version: 1.0
References: <20200824130114.41368-1-thuth@redhat.com>
In-Reply-To: <20200824130114.41368-1-thuth@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 24 Aug 2020 14:18:12 +0100
Message-ID: <CAFEAcA97pa2eUx2-c-YmuBGaVA9jUDZ-VTd5fCpcyJ1rigiEww@mail.gmail.com>
Subject: Re: [PATCH] disas/libvixl: Fix fall-through annotation for GCC >= 7
To: Thomas Huth <thuth@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::644;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x644.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: qemu-arm <qemu-arm@nongnu.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: dwl4RLJx1ZsR

On Mon, 24 Aug 2020 at 14:01, Thomas Huth <thuth@redhat.com> wrote:
>
> For compiling with -Wimplicit-fallthrough we need to fix the
> fallthrough annotations in the libvixl code. This is based on
> the following upstream vixl commit by Martyn Capewell:
>
>  https://git.linaro.org/arm/vixl.git/commit/?id=de326f850f736c3a337
>
>  "GCC 7 enables switch/case fallthrough checking, but this fails in
>   VIXL, because the annotation we use is Clang specific.
>
>   Also, fix a missing annotation in the disassembler."

Maybe I should just update us to a newer upstream vixl...

-- PMM
