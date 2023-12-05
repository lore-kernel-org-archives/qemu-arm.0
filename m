Received: by 2002:a17:906:fa94:b0:a1c:d2de:9065 with SMTP id lt20csp478400ejb;
        Tue, 5 Dec 2023 13:53:05 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGf7yucZJnUF6MYNSfg7eCpzjHubuhyGfRBbIc19bAJwfFzrkieehC708Hxvryr7VB2/Oh4
X-Received: by 2002:a05:620a:674a:b0:77e:fba3:93af with SMTP id rq10-20020a05620a674a00b0077efba393afmr1762036qkn.145.1701813184918;
        Tue, 05 Dec 2023 13:53:04 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1701813184; cv=none;
        d=google.com; s=arc-20160816;
        b=0fsUVRUO4TEyT1ymNIW6LiLO23i2MhxCWLycBlfaQ4p8Ukzw8cZJkx3PwiZxraav7N
         eo+jWYGPvjjb3U7C7F9KP7kfmcEUjt9Z1kK4cZH3JIX3gwDHA42S5Hqy5KyPxfH04m7h
         pL/T/NfiYhC/Q144hwJCHBRq6q77U4YnpJ+JCaT8Z6dDIfxWZhBn13pKERS7UtOnHHXd
         2hAkSl658itefHrZd9cJ3vDV65RgKmBB6cdkfjCVbo1M14C2O6foHocF/+oR79Hd0GdO
         GQ9/9fdm2P3XBkL6LAoMHF6n07k64vKxYjRx5G+HHI+7lMfpNLkM0cCW0PVU901+NsSl
         45pg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=6eqcRBQW2PIknQPtTc482e6pz2NBoXegoZrSwxIDtjI=;
        fh=Fynti4igEyd80lPm5jsUDnPPmXGC+AeBht9O6m1eJ68=;
        b=po8ow9Nz2sCocV4hvP3y2W6isf+yMhT/0PcwIAoB0AKs93Qz7/G1PV0bpIY46shNN0
         sfelFkMuI8hoVEF+/C8rnKQCz0d0vqn3oOYJ48OjcRbZRYVXNA/pLIVZJFKagnYI0gTN
         0Ycgvc7pUxbltJDqFGKL0ADhUpvG+jmtgwfwfww+7Pti1FJ1gMZFbHXnfO5B+cFyvobr
         0BOy1AD+upVZC32bAw22Qtr/bM1Mf4grYQxcQgm12XxtgT6sdqj6L2hNEatSHSyZ86sW
         pqeQ8qZAT0O6RQ5K+n3HFnDfH531csgreBiZ7QCzdO4stPX34cHOvv6ZXn50H20aBUdj
         gUNQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=vPpn2PHC;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id du49-20020a05620a47f100b0077d75093ef3si11918955qkb.606.2023.12.05.13.53.04
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 05 Dec 2023 13:53:04 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=vPpn2PHC;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rAdLE-0004M5-IG; Tue, 05 Dec 2023 16:52:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rAdLD-0004La-CI
 for qemu-arm@nongnu.org; Tue, 05 Dec 2023 16:52:31 -0500
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rAdLA-0003ga-Vk
 for qemu-arm@nongnu.org; Tue, 05 Dec 2023 16:52:31 -0500
Received: by mail-ed1-x534.google.com with SMTP id
 4fb4d7f45d1cf-54c4f95e27fso4836421a12.1
 for <qemu-arm@nongnu.org>; Tue, 05 Dec 2023 13:52:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1701813147; x=1702417947; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=6eqcRBQW2PIknQPtTc482e6pz2NBoXegoZrSwxIDtjI=;
 b=vPpn2PHCD/57AWMi5HLrTSThr14kTvEsMzKRk3Or1mhY9f9cOHohWWx4KO7FrXZu1x
 u2FVGbHzyhd+1mHQ9oUtAf6gOmxqOqszG9PTq9w0UAOH0wuH95clPW9qqvIxUSJFNZd4
 L1g4QceeoJO3lbTUPKHkl4OPUAicrKETV+tAvUyZkhiAQNI540+p6uqDHgZNNzaIZ+ew
 1gQ6JID92/EDHPxYrORxI7GCsQ8+xkAhI9Gq0/DMygbqDYbz0Q6VZaTaPa/xPWzdLg0a
 6MIxr5BhlwUXMFwMz2/sPo7+/OdgPMZhr9+q/ErrF6yZduB3a7KQDGOUM8G/G4YG50j1
 xqfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701813147; x=1702417947;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=6eqcRBQW2PIknQPtTc482e6pz2NBoXegoZrSwxIDtjI=;
 b=e1DwduqHJ+9ofEbm6jAYJrPyjf54OzcIbWrePCvz0X1WieT7Wx9K/GV4w+hocjMCMH
 pWjiYC0qf7Z6wq0gxGzdku0PHdjpVbtbmq7C6IA40ks3PlV7JK3L7b/3T6cyGarrFIpu
 kam8UWRWO2PweRTJfZ4GHqi6lUqIsCZr4bI9+SHf/sUUKFb2ewAl7l7+8XIkDjYhU+AM
 9gdlNzKePA+6m/wqlTizyDZu6AKmuT7GF0KCGtTCM7sP+cOW/PZ1/aDK9bDhEgei1t35
 QAVwqrxpNSV1klpBn5+rRDJ1vLeKV8HsZl0pAGT40vCV1aBfPq8fgM5LKmxUgYlp0Mvw
 nn+A==
X-Gm-Message-State: AOJu0YxZcu4Yz4ghaLDBaJkEI/M/ovtKKrBcuSs1LdTM3DgmTab2ArYm
 B92ff/kyr4Gl08QUcA6pDNDiDKp6x2bQIY1Mz7sQ/g==
X-Received: by 2002:aa7:c1d9:0:b0:54c:d896:e433 with SMTP id
 d25-20020aa7c1d9000000b0054cd896e433mr4644edp.25.1701813146939; Tue, 05 Dec
 2023 13:52:26 -0800 (PST)
MIME-Version: 1.0
References: <20231027175532.3601297-1-nabihestefan@google.com>
 <CA+QoejW--t61WoJm8-gz2WV25owoKHg4dbOm2+_+Zrdu1DuFnA@mail.gmail.com>
In-Reply-To: <CA+QoejW--t61WoJm8-gz2WV25owoKHg4dbOm2+_+Zrdu1DuFnA@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 5 Dec 2023 21:51:47 +0000
Message-ID: <CAFEAcA_H1SV6uk7=-HhtydShYX=kpD6LrGjUs_BEmeU9QyW91g@mail.gmail.com>
Subject: Re: [PATCH v5 00/11] Implementation of NPI Mailbox and GMAC
 Networking Module
To: Nabih Estefan <nabihestefan@google.com>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, kfting@nuvoton.com, 
 wuhaotsh@google.com, jasonwang@redhat.com, avi.fishman@nuvoton.com, 
 kwliu@nuvoton.com, tomer.maimon@nuvoton.com, Hila.Miranda-Kuzi@nuvoton.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::534;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x534.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: hUf8bi5sbZya

On Tue, 5 Dec 2023 at 17:54, Nabih Estefan <nabihestefan@google.com> wrote:
>
> Hello,
>
> Since all patches for this change have been reviewed, is it possible
> to apply it to the current branch so it can be fully upstreamed?

Thanks for the ping; this is on my list of patchseries to look
at, but it won't go upstream until we unfreeze after the 8.2
release (which will be a couple of weeks yet).

-- PMM
