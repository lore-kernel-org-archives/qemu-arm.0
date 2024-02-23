Received: by 2002:a17:906:e92:b0:a3e:79c1:d636 with SMTP id p18csp686281ejf;
        Fri, 23 Feb 2024 08:57:51 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCVLMbbyIrg5IRNogM+uA531YUmQF+dR0BZ4CkLcddfobTWmkfkErA0U0gjMeYcyz6Dm9vjcDK8aAHXdT3ZpHbdDW6gFd7bJ
X-Google-Smtp-Source: AGHT+IHC8PLw+IwJqDyZ91Tz5iIngQ+R74f1iZkE3GocMYAH7baamNKfc9T4v7xoz/jz6062Wa+9
X-Received: by 2002:a05:620a:13c6:b0:787:3e51:742b with SMTP id g6-20020a05620a13c600b007873e51742bmr379553qkl.33.1708707471108;
        Fri, 23 Feb 2024 08:57:51 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1708707471; cv=none;
        d=google.com; s=arc-20160816;
        b=T4fD6ub7m2/4LavCZjXElxknXDCSPG9Di6eplxBitt4tTDRxa8S8VrIs1rmvVO6IAz
         CxMlzXJIm5abVrdSwq7ZeLxTYVEe6FXR2PbypzsiKL6dMFbNbpQUo2GIR0kZ49EUW+Jr
         2DaVKO/WjgzK9NUBp6WFdkaZeoInheqY4qKNtGMgRlZVAnSTBnhAsIvPoAk9KwQ600H8
         FmXuoWvNZPTwWbD07bVhTF+qyn4cYPHueTNC6TKHNcNB29U5/ksx4DLwQYNGqnvZOx7Q
         CGO+v2nl2SHk3Cp/mzWn/uVUzlm/8bXk0pTX/mBigvhaRO72fAFQrINhe9DMCzZAJ/mP
         jk9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=imIyy1yU4+V/5GglsXerEJ0xPA/D/u9TGek4A5LhKG8=;
        fh=mWsiPp0V/9htJ/G9DT07l5e8id053EHKbQ0FVEqdBAg=;
        b=iEW5JdV9zTvp0OX4NKO8OM7tyrGceR1uYjN2S3vsNgTXYITxhk+iqFmCut6BKP3VV3
         t67Ovm7rW18sHEXFm+Y9sFpLYSb1g9G5I2IxuaCOjphYQY8Hqo4abVHzFW1gRoekce/j
         KDFFclQtw9uVPSR4lrEz3AdyRXHCIeqZnwVJ7ZrCJLjWNhheLge/ENpCuzKg4mkYaVwI
         tHnnIGa0KLmwIXBIwNPmjT7LXJPpKUNILySjezB9r/OSiWNgwZPB8XYJsQo7OjK2oHcf
         EG4gMnOfoNvICZI14yNHuE2CHzxuwiBU6QUTmj5xnK+zAh/DhiKIORrIkMToQbneSrpx
         VHog==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=BF5a9VKC;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g1-20020a05620a40c100b00787bae6b0a5si642756qko.589.2024.02.23.08.57.50
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 23 Feb 2024 08:57:51 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=BF5a9VKC;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1rdYqh-00080i-Du; Fri, 23 Feb 2024 11:56:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rdYgP-0002b8-Ka
 for qemu-devel@nongnu.org; Fri, 23 Feb 2024 11:45:57 -0500
Received: from mail-lf1-x134.google.com ([2a00:1450:4864:20::134])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rdYgN-0001rA-EA
 for qemu-devel@nongnu.org; Fri, 23 Feb 2024 11:45:57 -0500
Received: by mail-lf1-x134.google.com with SMTP id
 2adb3069b0e04-512e4f4e463so1479037e87.1
 for <qemu-devel@nongnu.org>; Fri, 23 Feb 2024 08:45:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1708706754; x=1709311554; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=imIyy1yU4+V/5GglsXerEJ0xPA/D/u9TGek4A5LhKG8=;
 b=BF5a9VKCMzih3giA1qHeFldgfJwczfBPlENZf5WM5/l5SNBbD+9LBAjAxBkZtSn9b8
 ftXmzSJKn810ZXeYB0xlBSW2+t7SVvduJftWkcEP2DxJXgMqvkWZNYBXLwwgN+9nH6c5
 jvzb1jw475g7A0bi9frCKCCM4neH2TiExyr4ux814eT4jeBIWdhxKspva4yDsDX8e52+
 tqiSKvurCCJxQnl0g2oM7aZaIdkCh50IHrHLJlISHwXNtTVQcrhNkH7p+Kw6VAeZaCDl
 iv6UV0wqiGPGMys6hDda/p9ayGV0AVsThAbLhFMUjNaf/bzQaaSi6ni4cmQGkptqHrxZ
 wNVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708706754; x=1709311554;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=imIyy1yU4+V/5GglsXerEJ0xPA/D/u9TGek4A5LhKG8=;
 b=cjfPc+N6tqqjfhXj+h180ze/Hei4HPN3uulwD3uBV1Tw4RhLFN/dk2R34pLr+GGZxb
 KFqzLzbRmq3kUmWacQOiy2kxjUCUOmgXppcUUIdq8ThoB4vfYlC1BRpOP2geNhHAPX72
 Z932SBM3hqGTaQcptkXvIJDUa+3KeQp11jbXyZzQAI+ZwEX+elPMwqZ2mCwyVW4Pc0Ez
 GCj/4Eg3ftz9deZ4NRngkabEVb/KRG/rGrW38sBov43E4fHbze0MyGv9kHL4ZST3gG7A
 YrOojxB2lLX90ff9flYbKFAQVPwj9t6njbrrSf6W0itVcNlf2njSN5YBegZweqzZz9KF
 5rdg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUTPiT5u3Jo2JqXi5uP0rTUxNlth2kOO2dlB3ssDwKLVFJR+UcsUixMB5OuV7ON/IGE9mJhOS0gIIQCNZQVs2bXRTvZE08=
X-Gm-Message-State: AOJu0Yz51ZfUWKI250kqQBDHGTTEPshQje4l4qaqXY1+3A9ZqV8U8X1K
 Q8KNtqjlWBfYt7sCvqmiUUudDfHKt+jT9x6XbB+VloUfISyeSXlV3c97qwS0yv9PR81j0jlbSAg
 wmPE2TlfbVfZ0LuECU/GCAqQJNJxhvQPOHo2HBw==
X-Received: by 2002:a19:e045:0:b0:512:d6a5:bb3c with SMTP id
 g5-20020a19e045000000b00512d6a5bb3cmr197987lfj.12.1708706753695; Fri, 23 Feb
 2024 08:45:53 -0800 (PST)
MIME-Version: 1.0
References: <20240219011739.2316619-1-sergey.kambalin@auriga.com>
 <20240219011739.2316619-11-sergey.kambalin@auriga.com>
In-Reply-To: <20240219011739.2316619-11-sergey.kambalin@auriga.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 23 Feb 2024 16:45:43 +0000
Message-ID: <CAFEAcA8BdYwcadk_upGrtSLGadM50gvEYi-FLgi9Kg-SUGkrfw@mail.gmail.com>
Subject: Re: [PATCH v5 10/41] Introduce Raspberry PI 4 machine
To: Sergey Kambalin <serg.oker@gmail.com>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, 
 Sergey Kambalin <sergey.kambalin@auriga.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::134;
 envelope-from=peter.maydell@linaro.org; helo=mail-lf1-x134.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: jO5EV//aDjH7

On Mon, 19 Feb 2024 at 01:24, Sergey Kambalin <serg.oker@gmail.com> wrote:
>
> Signed-off-by: Sergey Kambalin <sergey.kambalin@auriga.com>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
