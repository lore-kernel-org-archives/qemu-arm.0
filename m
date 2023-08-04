Received: by 2002:a17:907:10c8:b0:98d:b2f5:1316 with SMTP id rv8csp1647704ejb;
        Fri, 4 Aug 2023 03:33:44 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHyxrnDGxgR4lwy5N9SSOt+XLOxBSM6AxgJy8/AyfAMpXEeXencayJISuATCpG4F6r1hd3M
X-Received: by 2002:a05:6214:3185:b0:635:ddf6:a026 with SMTP id lb5-20020a056214318500b00635ddf6a026mr1244462qvb.43.1691145224082;
        Fri, 04 Aug 2023 03:33:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1691145224; cv=none;
        d=google.com; s=arc-20160816;
        b=lk+5jYoWwUAu+LoAE8k7/ZPrN5aXT4J1rCAWKRjjaIh7792R9FvCtOtd5TSXFP7hYb
         q/9o/gbmv9sbppxo2XXIi1ai9/ln126CAnUluw2GV3mGvfmeN7oqQLRsMSaFkmSse1s1
         LslBuuiDA9SYpLIHHsl1w3RvQCGHOpYfPbRwEiqxMo3gQCPxFcnVwHhmN3W0VbJ4Pcmp
         YwvLgdnnkIa4sGviRLt1S7yub9QZZTnAp7Bkl1UvWH2WdHQmpeC5O5yI6nhvPcQ8nzfH
         F7QlUkeG4RFNC0doVlGrvwkC8pCEYXzYt7T4WEZpg0YN3PJzm8T5fso/e5bNp42KiKTl
         G0Vg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=1cjtnCd/iunW6iSmFX0+e9mYEXC91R32d9+KKXZ8Sdw=;
        fh=Pe/MIC7yvB073Sd6/4lunpd6aUW6AVi1jfN++S25pLo=;
        b=dWgIfcHytW9nVad0YquVwMtT++tECNkVyrYfM4mTSQorhaf0s2alpTKnPvqQ+Cbg9q
         LVrC9GZx356y99nO4CEUa6iKUoVlLM48WgDyOeoevLvxOpR6qcbSMfXp8le8vzXycplw
         eVuXoTI5tGnYFylZ0D4o5MFdD9AJE1aYo0pbjLtnC/qfo7IESS+TK7juOfk2nG6gWezE
         5qUND3b9TQWl0toShlpdxUB+x+qnM2pOIM6XYXEi9tmRzRsAWFCOhMdttNkggE2HIRCk
         0vqPfy6eIVI+6379gJdixDqteRFQOlvAM4ZVq4vV5KafBOttXl4hwTbSYxVK11yhThso
         PyFg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=OUKHGHyP;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h6-20020a05620a244600b00767cf28e420si1058658qkn.99.2023.08.04.03.33.43
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 04 Aug 2023 03:33:44 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=OUKHGHyP;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qRs7U-0001pG-QA; Fri, 04 Aug 2023 06:33:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1qRs7T-0001ob-IT
 for qemu-arm@nongnu.org; Fri, 04 Aug 2023 06:33:19 -0400
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1qRs7S-0002ob-3O
 for qemu-arm@nongnu.org; Fri, 04 Aug 2023 06:33:19 -0400
Received: by mail-ed1-x52a.google.com with SMTP id
 4fb4d7f45d1cf-522bd411679so2391725a12.0
 for <qemu-arm@nongnu.org>; Fri, 04 Aug 2023 03:33:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1691145196; x=1691749996;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=1cjtnCd/iunW6iSmFX0+e9mYEXC91R32d9+KKXZ8Sdw=;
 b=OUKHGHyP+SHTzoRV1VmfTidHRtQimf2EXOM9LKH1tXfKQt7LMJBli3Zs60ZEnU8G3G
 jAfss4MBbsDvcnydmpOiDB1OMBQK41N6Z/0x6WE3REtuGbknJhxKbNxwDKsnr7PLl633
 w6uGpI8A7cpzlU8U7dTO1JP9R2/65qKfQ6IsrU99t1Yt1cEoecYD0GYUKag60I5gx3Jo
 tV7V/l3EcagqQMURAc42sMe8xtwxiKKDvBVbLsSlp7y1bmKEVI/EiQ0eSHn5Hm8Xu280
 Y/bLy5d2/GocRE+yqDPTa2H183pRnI0jWCCuxuEGPD9sZpllzqU0KMJRFQ0gieyctw5h
 oI2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691145196; x=1691749996;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=1cjtnCd/iunW6iSmFX0+e9mYEXC91R32d9+KKXZ8Sdw=;
 b=AMYivCO3sbVPHj37Qmvn8hTpumaIcL/mkLUNHTjjgLXnxrOBC63by/kEnl4EiF0dpP
 3jNX7xN1egCqPb/6B2k4aRYnGBVmk5Tz8Yu30FZgbvY2Uo1hNkIMA7B7m5uHXLxr83Lf
 23qKmg/vkVOlclR2DDT/1KQE7HjnAZSomQDNwvi5HRcWLpVt+6cI2tUiLBbOw5oxCCjw
 HMkvDGCIa2Ljjkq5b6RVYNuWKGDfifRrpPDy+scOgeOVjlzF183XB9bn88tjlNstx9b9
 QesQp6lm5IJMOHwg+0XwmhFByIvymaWbE79VtoFJRTDT/OTSWjWCnyVjPoKJ4MJAnHuJ
 jQKw==
X-Gm-Message-State: AOJu0YxhAZ7YIhhLTOrxvMm/0aYy/edcVCLQrUP52VPt0QPnaQv2KEKW
 wf/phwvwaUfoB/pIF2irJOfMqmvWN8K/aTSIgjBiaA==
X-Received: by 2002:a05:6402:44d:b0:522:2aba:bc3b with SMTP id
 p13-20020a056402044d00b005222ababc3bmr1172508edw.28.1691145195816; Fri, 04
 Aug 2023 03:33:15 -0700 (PDT)
MIME-Version: 1.0
References: <20230726132512.149618-1-sergey.kambalin@auriga.com>
 <20230726132512.149618-4-sergey.kambalin@auriga.com>
In-Reply-To: <20230726132512.149618-4-sergey.kambalin@auriga.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 4 Aug 2023 11:33:04 +0100
Message-ID: <CAFEAcA8f_Z1LTbqfS89GKsXZbe8WX5f-5t+TChPZqfMnVK2O6A@mail.gmail.com>
Subject: Re: [PATCH 03/44] Split out raspi machine common part
To: Sergey Kambalin <serg.oker@gmail.com>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, 
 Sergey Kambalin <sergey.kambalin@auriga.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52a;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52a.google.com
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: agH6r9bW9k9a

On Wed, 26 Jul 2023 at 14:32, Sergey Kambalin <serg.oker@gmail.com> wrote:
>
> Signed-off-by: Sergey Kambalin <sergey.kambalin@auriga.com>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
