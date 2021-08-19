Received: by 2002:a19:e212:0:0:0:0:0 with SMTP id z18csp322156lfg;
        Thu, 19 Aug 2021 06:22:13 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxaXP+frK/T2SUuMSZtt/2wBlPuJRCQcvhb5Qtlx2mIvVsC/pHoaP2oBvQNjDb+9SNRov4I
X-Received: by 2002:adf:eac5:: with SMTP id o5mr3805439wrn.22.1629379333408;
        Thu, 19 Aug 2021 06:22:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1629379333; cv=none;
        d=google.com; s=arc-20160816;
        b=HxqVsn9raS+Oy5CDP/rCUgJhoVY44jyLbZQT1BETixUmTuMyvrTNWsjAxKR2zdmzI3
         a5PYMwLlF+BJtd06W/jHQFfjE26Vk7lK/ATN1fujndyWQ5Etimp3BYC+XBuQ3dYcaat8
         x5XjT0nU27ZWqN09wAjEuksiQ3Om3680H3Qp8lGdGfXWhaNEV42iH15fAw0NLZgaSqPD
         FOOqxJOBFN7Rl+u3b/MQq7jRupSRS0aPiFLEgkMTtxlw2YY7fNpxyhj5H6wnTOJQ+YuI
         zm1JJRLBIDcCvViM+ljXyA+DkdzDrbhha0djAsiKrJj/Xfu2RQoD83wdJfp1BJfVX8T1
         gdpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=3P9tLu4Pugn4i7b0YliXRSdNQuDxBhHiZRSkfFzNLYo=;
        b=IKVn8mbg74ORqBgjCf5XnVRD6Wa2zC2Qal8h/BiK4DUYNj/NHEGx6wxuUwXSEyefcB
         n0iJ0Yix59mymA822+H5IP8ySRXS+KthH0IY3vTC6kUbZPsu13POZ6YgB1GdDbYwLBL8
         PAInSqytFQk6Fp4zCx0HU7vqBjqJPZXx/kscsCJbDdvgghblSS5RT+c5389xALTO/A63
         n25X94N2o4ygZxZvZq5YUB9UqjeejZStkOwYwz+wo0kuvQbeMG6skIOONMRqkH5MU9Rq
         AczAf57caGQ7S0pr66er6NHwSQQFQodTCj6VxpYmwAxUYtPHkFDl0oMojpqYuX7O49iF
         0Dqg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Ww+kUbNI;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id n129si4323426wmn.200.2021.08.19.06.22.13
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 19 Aug 2021 06:22:13 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Ww+kUbNI;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:53362 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mGhzo-00040Q-H0
	for alex.bennee@linaro.org; Thu, 19 Aug 2021 09:22:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41108)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mGhzU-00040D-FY
 for qemu-arm@nongnu.org; Thu, 19 Aug 2021 09:21:52 -0400
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634]:46611)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mGhzS-00059B-HG
 for qemu-arm@nongnu.org; Thu, 19 Aug 2021 09:21:52 -0400
Received: by mail-ej1-x634.google.com with SMTP id gt38so12793935ejc.13
 for <qemu-arm@nongnu.org>; Thu, 19 Aug 2021 06:21:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=3P9tLu4Pugn4i7b0YliXRSdNQuDxBhHiZRSkfFzNLYo=;
 b=Ww+kUbNIiUza66YvnjfjQPzI0He+j5zgXBFOHICCaJ+umE5qFJQy2zwxlTes9Nrb3l
 /pIXaYqUE3UeLIsyGIQ4FYUL1w1E0wIJr+y8MV4vOMN5Bte6mZ64DI6gm/WHmA89BVbo
 wmmO9MhLKbFgJLmdahNe8K3UIBLA1vvPGU6g6cGTA9mfkBn6fuinE8sqV8ALnltaB8km
 4ErRbty3VqREk4Ji8DPC0nI1dywSiwjRXeqadSXREbijFoE/Y/0R//DPHEOiUfpYTv9B
 LQvraex4sM20Kdu6tIdLUTmUX3w15Yeo+b5x4s9q9pqy9kkw31BbW1wP8rCuDLmK0fSB
 xHqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=3P9tLu4Pugn4i7b0YliXRSdNQuDxBhHiZRSkfFzNLYo=;
 b=VfkcV05fzQat4qodqYLrHlRUc+OsIT7jZG/gtQJ2200txj6Tib/dvzzcuZ3iaglvjK
 R2bvzEsxCiMyfXaWV/3ZEXYXPPQCATdfj5dHotU+jkJ+OCWMrYnmjsCGZXPzON6A+X3g
 1jUpPGlHFKY78rRTK9CrPeZ2ZlcdKSxTgB0K09LGw4q6qm+qUreFK9BRHfbIhnemKBBv
 4ZBrMMxG+dthUSla99A8kj9C34v+Svt/5dD9rSY3SuESugfIGg0dk88sPcNsfHuIxroI
 FrwwPsOsGk5Mo5YBQUcKpvqjKd9yC/HG9pw0jJjauGokIFMh4lOp/azMnMamSKdgh2gg
 zBaQ==
X-Gm-Message-State: AOAM531UVX4MPboJHLNgGJ1WL0TMFnuh1JbiTWJbe5iqF9DmqT68hj0y
 41IE4yLn4apbZJV6vn2cqLhLNApUukLlUPBGYWsnxw==
X-Received: by 2002:a17:906:a108:: with SMTP id
 t8mr15645137ejy.407.1629379308094; 
 Thu, 19 Aug 2021 06:21:48 -0700 (PDT)
MIME-Version: 1.0
References: <20210812165341.40784-1-shashi.mallela@linaro.org>
 <20210812165341.40784-7-shashi.mallela@linaro.org>
In-Reply-To: <20210812165341.40784-7-shashi.mallela@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 19 Aug 2021 14:21:02 +0100
Message-ID: <CAFEAcA8ucnsnC0e4Oz8qxLSXRGCvYbEZRgR8ZiHJ1oJb7mFiKg@mail.gmail.com>
Subject: Re: [PATCH v8 06/10] hw/intc: GICv3 redistributor ITS processing
To: Shashi Mallela <shashi.mallela@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::634;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x634.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: "Michael S. Tsirkin" <mst@redhat.com>,
 Radoslaw Biernacki <rad@semihalf.com>, QEMU Developers <qemu-devel@nongnu.org>,
 narmstrong@baylibre.com, Eric Auger <eric.auger@redhat.com>,
 qemu-arm <qemu-arm@nongnu.org>, Igor Mammedov <imammedo@redhat.com>,
 Leif Lindholm <leif@nuviainc.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: qAXOT/r798yk

On Thu, 12 Aug 2021 at 17:53, Shashi Mallela <shashi.mallela@linaro.org> wrote:
>
> Implemented lpi processing at redistributor to get lpi config info
> from lpi configuration table,determine priority,set pending state in
> lpi pending table and forward the lpi to cpuif.Added logic to invoke
> redistributor lpi processing with translated LPI which set/clear LPI
> from ITS device as part of ITS INT,CLEAR,DISCARD command and
> GITS_TRANSLATER processing.
>
> Signed-off-by: Shashi Mallela <shashi.mallela@linaro.org>
> Tested-by: Neil Armstrong <narmstrong@baylibre.com>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
