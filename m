Received: by 2002:a19:ee12:0:0:0:0:0 with SMTP id g18csp1930500lfb;
        Tue, 7 Jun 2022 01:45:28 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJycTAwgABkf6pVK/RClVC8f37kVWiHSwGM2sK1Q+7jlHB1JGfkpkPV45LqceQT8jWc4/qfe
X-Received: by 2002:a05:622a:486:b0:304:ec30:8c0f with SMTP id p6-20020a05622a048600b00304ec308c0fmr7365508qtx.236.1654591528364;
        Tue, 07 Jun 2022 01:45:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1654591528; cv=none;
        d=google.com; s=arc-20160816;
        b=RqFLbji0rGb1FQ9PbzZKyl9DO9K8LA7F4VPGuLRYrCwxQbqvfwQ5I5unK1fA/UFmVd
         yrLRdFsHJ3Gv/p8iFZuYwYP3h2I032+x7DzKZgmszlBVS6/v3sc6pto0F+tDaAJNCP+R
         ngxWHaMlvpVx0NbRZKtz4a7ifF/CVKmpYhVLQByDTBwtHGEn5MbYsfABBuBTRMcJdCzb
         Cy8p/VG+NuT8t4wBnn578mMN4Rr5www1KKW8fy0G9knsd00+PKu4Mc2BGhsAxibZuvzR
         5JzjlsC0zjNoJQW5GdeNkBtiLLSSfkw8bDAFjsI3OCiTwahohtsiBSs3EjwqsSRY0bHV
         nlig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=iyISAeioh2CaW8L/inA2jGkm3DFaAWCMGjH+BtYaVTA=;
        b=ZUyKAjOrzFdWZ1Jd3zjukgmPzw+YEs+8VEBfOYWKsYtjCCrxZZh8IP1euIUcMIjIoA
         VVvJ7gYRM1Yi2oLDN+2VCwG8tC4/A9fwTPRe+gg3QKSFQX3F/DCzLlRHe/CiltlXadxI
         1qi5QPgz1sguBcKLc29KPDJrVLJWMVwOSfko9Z+8JU2X1XfE10kachf3VfXwdD+XNrTA
         LFKXtY4TJbd4E9QilXWIhE+koTABiKoqOsByuJ12oSsO98zMkeOWvCy38Cgs9m6A2Pek
         DaA5EVNO52ulajQ87aTJdVCfSi9FrlzmsN/M7UkjN2sVu8XLUxPpPVWhl+LisknUq5nW
         2rhQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=eKGdEPlr;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id js8-20020a0562142aa800b0046463cd3d5asi8621101qvb.233.2022.06.07.01.45.28
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 07 Jun 2022 01:45:28 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=eKGdEPlr;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:33324 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nyUq7-0001Gx-OA
	for alex.bennee@linaro.org; Tue, 07 Jun 2022 04:45:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51534)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nyUpG-0001E2-42
 for qemu-arm@nongnu.org; Tue, 07 Jun 2022 04:44:34 -0400
Received: from mail-yb1-xb2b.google.com ([2607:f8b0:4864:20::b2b]:33712)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nyUpE-0002cV-Is
 for qemu-arm@nongnu.org; Tue, 07 Jun 2022 04:44:33 -0400
Received: by mail-yb1-xb2b.google.com with SMTP id s39so2414239ybi.0
 for <qemu-arm@nongnu.org>; Tue, 07 Jun 2022 01:44:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=iyISAeioh2CaW8L/inA2jGkm3DFaAWCMGjH+BtYaVTA=;
 b=eKGdEPlr74ZIb0j97Zf3F7/K9xeSK94WqZbeMr0U+tw1/FxS8BTmfU2Lgium5TqvfI
 3oh5Z/LJyFsQc1pPNibqQrHKxuQuBNDFK8wDKcs8FYjocJBYtRnepzS1n4QFzsrlDj98
 r5FOdezCx+9ToXSozRcGsNMvypPF6EeRRGjKrPSQ7xjiK8dSj0xerCFfu/GCX//3n0U2
 wUes+UQvMQ812CUIVv+Zfb4ffYVIA2kyFJZfO0GmyzAQ3tMMJNIHIJmSrsq9PEbE/i8W
 nIcKU73Sr3JgkObR33ky7orlZb1rSHFmq7y4IpgpPDrAin+Uh4JKJl4lazVL4ft1ZWMT
 z4Uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=iyISAeioh2CaW8L/inA2jGkm3DFaAWCMGjH+BtYaVTA=;
 b=EExgs1L+6N4B494tRe6KYZxH8xaRMJmAqaTncHMXNygA4Lpl/TVeSJt68FVVkmMEIw
 Vgo6fnM4ndueHTcm1ky4OU51SflAO0Z+Gt+8i+ozSkKg1sNCOVyH5cqxG/6RbZ/m80Kh
 tDqvjBxQByC1Ajp2pmgEIEkG7cFyU10Fh5sFq/peVk6zPYkWVnLKHn2Su6Uq6/BSKFXt
 s1IsFpxc7KgBoNKlUd9iih7EtAvQx6vIU6fAqmQrBoWnoCuSwiiF7ojdCPK+qa2+5QAB
 nULpSzxvn9zhjRij0vbaAzc9Gj61JE2WcNu95tKBcDeooVxlKmE54hKclgBHYtQdJ0Af
 kMCw==
X-Gm-Message-State: AOAM532JUHCCYr2gELezVyquscUypwyTV0HeBIk3fIPAEQiKpjkws+CC
 UfzY7cvJtp81+gReU7zoM+ECwBe6pRoMICKRT3hpHA==
X-Received: by 2002:a25:47d4:0:b0:65d:510e:c8de with SMTP id
 u203-20020a2547d4000000b0065d510ec8demr28896849yba.39.1654591471695; Tue, 07
 Jun 2022 01:44:31 -0700 (PDT)
MIME-Version: 1.0
References: <20220602214853.496211-1-richard.henderson@linaro.org>
 <20220602214853.496211-32-richard.henderson@linaro.org>
In-Reply-To: <20220602214853.496211-32-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 7 Jun 2022 09:44:21 +0100
Message-ID: <CAFEAcA_uU32pw0Z4hQ1rmL3irhjvVFhchVL7is0LLzWcSgLSeA@mail.gmail.com>
Subject: Re: [PATCH 31/71] target/arm: Move error for sve%d property to
 arm_cpu_sve_finalize
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2b;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb2b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: fAIY/9btcs4S

On Thu, 2 Jun 2022 at 23:10, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Keep all of the error messages together.  This does mean that
> when setting many sve length properties we'll only generate
> one error, but we only really need one.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/cpu64.c | 15 +++++++--------
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
