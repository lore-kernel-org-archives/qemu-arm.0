Received: by 2002:a17:504:2a14:b0:1be9:327d:8ee3 with SMTP id p20csp1108355njl;
        Mon, 16 Sep 2024 07:25:39 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCW/yGtF9e/RZtqI2xVNvJxjDz20poseu2Yc4JXtQnhau1MIumufaA9Fj8Zsu63qCqtYBdcVmNCL8Scbcg==@linaro.org
X-Google-Smtp-Source: AGHT+IGS2B0GMvNjhGVJzS2rq4aYldYEr97lFsMEcHgEzmjHUddrJ8wWrOak/WIib+ZdW7HrsLhp
X-Received: by 2002:ac8:5d15:0:b0:458:34fb:5d65 with SMTP id d75a77b69052e-458602dd741mr247117221cf.23.1726496739267;
        Mon, 16 Sep 2024 07:25:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1726496739; cv=none;
        d=google.com; s=arc-20240605;
        b=bMwImWw3wPK3WvpvBgnAlNx8Z20oROYtEbYhiyQboYwXdPfhzxEXHyuNjapUQ1wMBR
         xz1ZjURSN7/bargQiARprU/iItXb9RNmfN0t4FXjWjie8oPI5DGuBsgbcUBiXJsVjQ0Q
         Q7Z7cqUVSmXU4ufw0f/mR9X1qR8+fnbUEnzmlaYPZOV0tMIgoEddIG5dwNo41aDsM7l0
         VRq+qQ2iZ3b5gEBO2zymN2iAzbgNhT5X2yYUMAb0dUztuEnr2S8iTV+lrTzKB0ytGPEx
         rP+7p9kH+rJXmLlm88EnEtSsKPzpg2MxVG07+A00KkhrHn7DyQDmEJ8dBxRNxtm0XZ0e
         K1oA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=KaPhIxZpgC0ZKYVE0HMI0s/8VDfo9L4b/ntZuZ2jzhE=;
        fh=2hBaBg1MBlNDo6GJdjiZ1iOfKiRb11kAAT7TlAB3a7E=;
        b=NGpy527I5bFuPtBWXkPb9yvYR1hy9ZGe8m0JXhPFcILoskNJNXpsSgr1YWc6A1TCfZ
         Z4Agv3U15Ckx2K7AGWtN5AzeRjE50vdelck7W8OHfg9I1ed8VMmjMTgkEqLQo8kWDABq
         AW4OsNzoIAakUe6IF12rwkOfU+YfUzDaoMYveybI9soCwBWwxCEeh0Pf6RKmaVRw0wVh
         YhPXpx9duAKFHylgHzvMacPYQc/nZcyUuia9UQ8DCuw7D5xXga8JHTCJVcHFFLPJLKE6
         VyWt8ObiFM983D5ZUCFsJ96+5VN6yGZE5NwP+YcCO20mR+luyKBwkog+Ew8fxol93SEy
         S1ug==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=A3wOvQgt;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-45afc4d8766si1725901cf.638.2024.09.16.07.25.39
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 16 Sep 2024 07:25:39 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=A3wOvQgt;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sqCfS-00050N-9w; Mon, 16 Sep 2024 10:25:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1sqCfG-0004v4-7K
 for qemu-arm@nongnu.org; Mon, 16 Sep 2024 10:25:22 -0400
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1sqCfE-0007UA-5Q
 for qemu-arm@nongnu.org; Mon, 16 Sep 2024 10:25:17 -0400
Received: by mail-ed1-x52b.google.com with SMTP id
 4fb4d7f45d1cf-5c24c92f699so4848598a12.2
 for <qemu-arm@nongnu.org>; Mon, 16 Sep 2024 07:25:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1726496713; x=1727101513; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=KaPhIxZpgC0ZKYVE0HMI0s/8VDfo9L4b/ntZuZ2jzhE=;
 b=A3wOvQgtoVU1niNYNGlclW8OSd7SHxYupRxbe5y5qSYGY7vlt5M7QRnHiKjFup/CMt
 h46xoY//KdEXZRKRJDtjQr6QpsZqSmy8Hm23aRP3vGJuMQcD96OXItQqb6NSzYnaqjUQ
 aMOu5Bg/4pI2qCq/E+kpqjSUhIF4Zj+OWTYJSlX9CVsatZdzzgPkaP1BReFMW8Au8xVm
 akB2GgVFvMSjj0IRq/rzYW70GAVRUmDr51KJ3NJjNnjNs8teW9GSxZ86blV5Er1/X1ps
 Nb2RgH7KKhvBfcT2lT7xr2H5q0/q/OpblAfg3SzE/qz/VFfCvtsN3hi503Pl+ot7LXJe
 2x+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726496713; x=1727101513;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=KaPhIxZpgC0ZKYVE0HMI0s/8VDfo9L4b/ntZuZ2jzhE=;
 b=QJVELiVlpmsBHSwQP3PhltN2EDisVk3L2yJygmBbrTOkMZijW9fpxQxMCuyB/8UofX
 n24dnf0Y85hUmEi2KGSlFm83+ZZJIgvBBgy/CQgQ5OMq+5SEIbpFbZbWKZfdIn1yR9BT
 2ATvyWtbuO7RHIjQcSXR1Z5dRctN3gxsCLCKowl6hDBmzDtgt+OtvBhdgwSNrXw8KdRN
 /wWB+s27WDqVaJVW3I09Hmk7Pch4pPp5bU/f/x7r/zYbFlzFdHpvetqR/TVbva1fmqXO
 mgEig9QLPUgT2abZJ1I9T1OKJfmbtBF4mA35p4ZsROZH7tSPDAGKy3i8ShZqLLQNS4WF
 Dxng==
X-Forwarded-Encrypted: i=1;
 AJvYcCU43YxvDzkaD0bBYBa9fPkXr3dBtL0oFRdz8L/wglIW6dsf1gAyOr5FOnIULFvYqWyZA7FRYZ8XKg==@nongnu.org
X-Gm-Message-State: AOJu0YzGT+aTHbPvUNKrt+FRcGhTE5kXRS7WyHubzwfHFH+wmjxMR44F
 rb0t5vl7P8rURZYVExmMW3hxrNvawHP/gMQ+kujObWpbQ1XgwHtAvfikqx4PnSz1BOWxOohJJxF
 l2MXVUwm51u/G25YA0cRLw9aXWiGSc8xKyaWKa7o715Cn/V0H
X-Received: by 2002:a05:6402:1a34:b0:5bf:f1:908 with SMTP id
 4fb4d7f45d1cf-5c413e4faecmr9962308a12.24.1726496713289; Mon, 16 Sep 2024
 07:25:13 -0700 (PDT)
MIME-Version: 1.0
References: <20240912024114.1097832-1-richard.henderson@linaro.org>
In-Reply-To: <20240912024114.1097832-1-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 16 Sep 2024 15:25:01 +0100
Message-ID: <CAFEAcA_rc6hVe6m-WZQ5b6n5ACjCEF872KExw09jt6KNJ3tz-w@mail.gmail.com>
Subject: Re: [PATCH v3 00/29] target/arm: AdvSIMD decodetree conversion, part 4
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52b;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52b.google.com
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
X-TUID: 6PblE7dQ9edV

On Thu, 12 Sept 2024 at 03:43, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Changes for v3:
>   - Zero-extend results in Widen NeonGenNarrowEnvFn return to 64 bits
>
> Only patch 26 needs review.
>



Applied to target-arm.next, thanks.

-- PMM
