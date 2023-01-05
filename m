Received: by 2002:a17:906:a84b:b0:7c1:2a22:dc39 with SMTP id dx11csp250796ejb;
        Thu, 5 Jan 2023 04:03:03 -0800 (PST)
X-Google-Smtp-Source: AMrXdXucynkmd9wE7iYG09BTjfi1pn3b8W9LVihPLD/Lb4EM3Z5hRfWqiRn1EPs31XKap4yfAu1n
X-Received: by 2002:a05:7500:1e17:b0:f0:25f1:69f with SMTP id dx23-20020a0575001e1700b000f025f1069fmr69034gab.58.1672920182929;
        Thu, 05 Jan 2023 04:03:02 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1672920182; cv=none;
        d=google.com; s=arc-20160816;
        b=AmSYQzWII2iwXpNJI3L31GsJCrvpcgMlaOrBFHfMufBYUsoq4drBT90fMNLhVN9+Kc
         jFZVA9AbwCFA5b60WPh/pH5jSABfcqG4fysdmCymj/Bf4WIJW8Rt6KlnzHx5Kjr14pzI
         FEshHP5JgCbf8mR7UEoP8re/OVYeyiJGtULmkdIz0VrL1Nygs2fWZHmLCnGZ6f7gZet3
         BYV5Ik2GhP6xRMbJXveq+CQ/ob9G9ZsZvMf6vrvRkysrG5JMScnb5S+H8AW1uk367c/u
         61nOaYcZ1QBT6QgsngF5eVLKA4y6fJ87280avnmcEu6MLQOHwXJgAbgXVfSrm9dS38IW
         k2Ww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=LHvmOn8wyCNEuBNpRFuAPJKZnG1VWFc8K4QEkp1Ac30=;
        b=tbww9h3ydDpNCTlgz6lGwN59Ro3T9LEEC+vnYMWOuflbkYyfRtfbNigii8kCoMkd+5
         uXAZs4MeKMrq6dcf1r1gOeM9pzq3j1BR7FQ/vyy8mDyzE1vzinMtBXZ/go+8Pmgk1879
         YXEHZ8f2KONK1lJ91qzemEhyvY7JsHUfkwOtPxfnDqssUP15zCe+rkzPO/7dR4qf8WbN
         9NbQDb8jhnpU9qZwjiP8mz1a05lK3dTXj2tjlBMnBCilGSQVVatxSjgLNZ6c4UL2P5YE
         0OsmOO0/zwxYHPe+jf0vXNPyT+YovrDkLLbDc7z4WHRX605s+QlHXkAlqJo6iWN8olEi
         +ZUQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=S9QzF6lM;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id jm9-20020ad45ec9000000b004c7369b76f4si19312172qvb.50.2023.01.05.04.03.02
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 05 Jan 2023 04:03:02 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=S9QzF6lM;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pDOxO-0001K8-Q6; Thu, 05 Jan 2023 07:02:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pDOww-0001C5-Rz
 for qemu-devel@nongnu.org; Thu, 05 Jan 2023 07:02:29 -0500
Received: from mail-pg1-x532.google.com ([2607:f8b0:4864:20::532])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pDOwj-0000Zt-U5
 for qemu-devel@nongnu.org; Thu, 05 Jan 2023 07:02:16 -0500
Received: by mail-pg1-x532.google.com with SMTP id r18so24351220pgr.12
 for <qemu-devel@nongnu.org>; Thu, 05 Jan 2023 04:02:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=LHvmOn8wyCNEuBNpRFuAPJKZnG1VWFc8K4QEkp1Ac30=;
 b=S9QzF6lM8vYdq9oetEOaQDYEEJGPBQmc/LtoTWABcDhuFqVstr1K9G6ZghJoCMlYM4
 95K3z6YRxX684Yk8hkEZfnLwbRrnLrWl+CpMUe9aK5i3UJdAHCbYyZhJCAWu0kNkPxOx
 ujY3Jms5Y3n10eZSLjZOb+Byj0nis0wxfsYxw89urenizd0xipREjjIP8ZF6CMJ8xizq
 GxZ0ukZEdXSlRfbFsv+RLBGfGgNQ8c94T0aTEVrDCj0wzIsYGu1t+DUJA6/wqQP5vnxC
 cGVQzs/jgzmoSU4xnr52V9IJHpkZzcgO8WFqKVxhXBnl2VChP9/JJmTFQ8/gIDpx9bN8
 S+2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=LHvmOn8wyCNEuBNpRFuAPJKZnG1VWFc8K4QEkp1Ac30=;
 b=ap76439vV7UPKLg4vIY7b84YvFd9i2zvcoCgnOJYY0kFszfOjKM9SWoIkSGUfjKx+Q
 5FOyVKaY/1zN+RLsxHVIgznbTRoCv6oZms+j6MfK4tj/aS81vANpjpM9/LAZj6eTOEh+
 n980MX/fciIm51ix0E59sVS7G8W1ypbB2bXBJPGz2TxpjbIhBwVuZJ2gO98SBt9dDKVm
 CA8e2Nd9//LxfiS9M7CQU71HkrFHdq10F8oFrV3GPrfdoDK1zo3SSKQxPm8NJ5eD2Tmf
 fUf5rqi3U+w2KZAcpKDLAsq2qivBq05dak3WGlyXkyzkeaQKlt8l9BNQIgdgJ8TpWN5l
 0pXA==
X-Gm-Message-State: AFqh2kpwE1Mx2jLG4AOTdkUeIsNvtF31cMI0aimaLypBJCxcd1g44Bae
 vNjK3ej7CFlR6B8B9bWtVWoPKzJHGj3SvLdvlIhasN1tobGzPw==
X-Received: by 2002:a65:694b:0:b0:477:86c1:640f with SMTP id
 w11-20020a65694b000000b0047786c1640fmr3346380pgq.231.1672920125596; Thu, 05
 Jan 2023 04:02:05 -0800 (PST)
MIME-Version: 1.0
References: <166990932074.29941.8709118178538288040-0@git.sr.ht>
 <166990932074.29941.8709118178538288040-3@git.sr.ht>
In-Reply-To: <166990932074.29941.8709118178538288040-3@git.sr.ht>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 5 Jan 2023 12:01:54 +0000
Message-ID: <CAFEAcA_C+-JGJfuu1pea_w09-a1LFBOF2M24cOdVm-wVgT2DiA@mail.gmail.com>
Subject: Re: [PATCH qemu.git v3 3/8] hw/timer/imx_epit: define SR_OCIF
To: "~axelheider" <axelheider@gmx.de>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::532;
 envelope-from=peter.maydell@linaro.org; helo=mail-pg1-x532.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: 21emTxPO5eU/

On Thu, 1 Dec 2022 at 15:42, ~axelheider <axelheider@git.sr.ht> wrote:
>
> From: Axel Heider <axel.heider@hensoldt.net>
>
> ---

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
