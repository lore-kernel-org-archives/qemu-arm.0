Received: by 2002:a17:907:1627:b0:8ed:b3f:fd98 with SMTP id hb39csp2648730ejc;
        Sat, 25 Feb 2023 01:40:03 -0800 (PST)
X-Google-Smtp-Source: AK7set/QVJkUmZ/IaDFxGx20SCpewjJdJm+TMNxRS6PZGmuSfFxs01tyTlC59jDox4hf2jW1Usw8
X-Received: by 2002:ad4:5b8a:0:b0:56f:154:2517 with SMTP id 10-20020ad45b8a000000b0056f01542517mr35303826qvp.10.1677318003735;
        Sat, 25 Feb 2023 01:40:03 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1677318003; cv=none;
        d=google.com; s=arc-20160816;
        b=WmD7GGxCWciP+FF2fbX3bP9u8cBWlPGtW9BUXzBydcFzn+iMwTVyPDNMyO9cd/UxQX
         vWUzyaTDr9wiaX4V2CPusiPndNX4sLrU9Mb0YwNpWfcOQNvOsM+6w1pH8FZjed0+BGhJ
         /QmyqB6dWP0CMSWvH7tk+5LokZBbOEFW64pkezjggpJqs3vwd+Rmj8Af3f6DrZ9V4fmB
         DESempGlfdQ85sQPhKCgCSUQpUID23YgwZNjmUQTfV8Js6mg7akP7mw+x1IMb0NJ4v+J
         sMqCWKB+lVYJJJSTEYu/uUKOLxFJRHbuaQMs2TKbv7GIVLJH/hKtNXjrop/ZAQZIRxli
         FyEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:cc:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=UWweWqgTlzg6lQ9hIdt/Y4EAsDyF7ZAeuN0el3jcy+c=;
        b=if/4v4xpu6/76KuURcYEI9PZI/+8nLclLX7rvetQ5mWi80OaCBV/Cw2KmB/K++wIEE
         YFmcGKQg/eK0WPBIiSGQpjL6DrHh9Oc0TnjXUaoZnIpQI7g6XzWoWqN4ylK4mJf0wC+K
         JoVQw960FwOZDDEb9uudkEeCekA3JzUpuKxlfjFpYY/BgbwDA5hn0G+wBe518x7Fa0ND
         LQix63HGFiLPbBTznDKPVMdmqZOHlH4oiAQyBWWJ2ilzdwcL810nDGDcV6PEmH9LJD6s
         XW+FpZCRY3n6xOU3KaMZ744AtryT1nCu3CdHtBM85fQ7zvtDvopZaFCEPd/cub6i3+Wo
         ITnA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20210112 header.b="V2R/0FGi";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a23-20020a0ca997000000b0056eb58eedb6si1459332qvb.499.2023.02.25.01.40.03
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 25 Feb 2023 01:40:03 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20210112 header.b="V2R/0FGi";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pVr1e-0001pa-7b; Sat, 25 Feb 2023 04:39:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jcmvbkbc@gmail.com>)
 id 1pVr1c-0001ou-OX; Sat, 25 Feb 2023 04:39:28 -0500
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jcmvbkbc@gmail.com>)
 id 1pVr1b-0004Ik-0j; Sat, 25 Feb 2023 04:39:28 -0500
Received: by mail-pl1-x62c.google.com with SMTP id n6so526275plf.5;
 Sat, 25 Feb 2023 01:39:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=UWweWqgTlzg6lQ9hIdt/Y4EAsDyF7ZAeuN0el3jcy+c=;
 b=V2R/0FGiZCWqecEaLaMQ6FTz3zuSRTGlAO0DlwNs0DyKd5ZSrDh2mv5X0A4pO3fEP1
 GcqdCoOpRN7gHil5YF1FifQvfVzJ6VnRF7kGSqpw+r8S725L0Ru2eV6clcX+buadXg/5
 KQWp7L5W7wMNhkkUIy0UTrgjFpsSfm9bJ5ud+3X00p9Nod4GPMqALqwynqpYUeRyAQ80
 C+hen9IDSam0mV/zJg5XoImutPgUUIi+3ECFmxGCUry/fKJZwnsZKQ/yEEpJP7vLuWTv
 xxfvCHA6d7P0IGQKZUwMeHvfNW5Kxvtn8757yBS5HphTxg4rH38lFyrfT6unpSi+F/4t
 tr6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=UWweWqgTlzg6lQ9hIdt/Y4EAsDyF7ZAeuN0el3jcy+c=;
 b=FtEM1AzlUzqQ533dPXUHYOSNtX5nYFVqVA5DIiKptZa9MMbrAOd4zTeF3h+iA/LOy7
 kUvazQKPTlAw8qQcD+CfOTUMfcIymlLHPLFLAsXghs16gkRW5deCgn0I2pD5heZICq7t
 eFbDSdts3rfkAu36eIpJlpFxZIm9/49Gt+B0vL4UJUxL/1NFPzpoIjRIooUNjLd+vn0T
 QJoiddkboDpoPz9M6ROBxSZD9ieDfS4QS7YUMzT1KTVN2W3Rk6yfhyod6h/0G1LIORmO
 i2vdJBVQNLE17xCBbUbYBXZzVxfel9lrTFH5IzhVIXCNr7fQEoJFdkyZzvmovdLbIoNs
 Jr0g==
X-Gm-Message-State: AO0yUKVdX7dXT9qi0H61p1cCExDkhJgrsZr7DH+5fYdJMUwrNmznl/Ex
 Ml+VB6T+rrPBjwUAShCtMf9p91ekHOv3BcSgz80=
X-Received: by 2002:a17:90a:8a0f:b0:236:67f4:e575 with SMTP id
 w15-20020a17090a8a0f00b0023667f4e575mr1977874pjn.3.1677317963299; Sat, 25 Feb
 2023 01:39:23 -0800 (PST)
MIME-Version: 1.0
References: <20230225091427.1817156-1-richard.henderson@linaro.org>
 <20230225091427.1817156-72-richard.henderson@linaro.org>
In-Reply-To: <20230225091427.1817156-72-richard.henderson@linaro.org>
From: Max Filippov <jcmvbkbc@gmail.com>
Date: Sat, 25 Feb 2023 01:39:11 -0800
Message-ID: <CAMo8Bf+vJupWz08e9xSf7+yMTQUebqAaqR2Pryg50_u5RQ+o8A@mail.gmail.com>
Subject: Re: [PATCH 71/76] target/sparc: Drop reset_sar_tracker
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, qemu-ppc@nongnu.org, 
 qemu-riscv@nongnu.org, qemu-s390x@nongnu.org, kbastian@mail.uni-paderborn.de, 
 ysato@users.sourceforge.jp, gaosong@loongson.cn, jiaxun.yang@flygoat.com, 
 tsimpson@quicinc.com, ale@rev.ng, mrolnik@gmail.com, edgar.iglesias@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::62c;
 envelope-from=jcmvbkbc@gmail.com; helo=mail-pl1-x62c.google.com
X-Spam_score_int: -5
X-Spam_score: -0.6
X-Spam_bar: /
X-Spam_report: (-0.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 FROM_LOCAL_NOVOWEL=0.5, HK_RANDOM_ENVFROM=0.001, HK_RANDOM_FROM=0.999,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: 1UPyHqaeOTE3

On Sat, Feb 25, 2023 at 1:20=E2=80=AFAM Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Translators are no longer required to free tcg temporaries.
> Remove sar_m32_allocated, as sar_m32 non-null is equivalent.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/xtensa/translate.c | 14 ++------------
>  1 file changed, 2 insertions(+), 12 deletions(-)

There should be 'target/xtensa' in the subject.
Reviewed-by: Max Filippov <jcmvbkbc@gmail.com>

--=20
Thanks.
-- Max
