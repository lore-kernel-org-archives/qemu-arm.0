Received: by 2002:a17:907:7006:b0:a35:eedd:80b0 with SMTP id wr6csp394863ejb;
        Thu, 1 Feb 2024 09:37:09 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHj/XvxOCOn9cruC9DE/I5j4BDx8JhzpQvEAJwjGf9f9nLBzXjh0cdK+GG/WwrH3hZPY5YE
X-Received: by 2002:a05:6871:150:b0:206:746b:5e96 with SMTP id z16-20020a056871015000b00206746b5e96mr3326412oab.41.1706809029215;
        Thu, 01 Feb 2024 09:37:09 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1706809029; cv=none;
        d=google.com; s=arc-20160816;
        b=T4rk3gSzYz+TVDeX6E/pW2vA6ORt/FQ2vK2/Uo/mfmtk1DAKQlf3IMrNttmr046B2W
         uXtHwltYDx/9Z7y9Nuz1nNKlpmt+jyYMp7InsSRMMQzT7CHzfBvd6w3vzYYd27RUdEqQ
         IGpeec6g4tGrJjNxjo9tXtdr5h5jjwQkvQWJc6nF9PoowazxfRxmm6JjAy+IRv9Q+Pej
         3gucQJ2k5+7WmrVyK0Kc6nei4ZGLZgyaFJKqK2b+eHf5Mp1si6mW44/dhQTyHg5UFqtO
         L7Bj8QegZtqXOji5hi53ir60Ibuwrm2Ta58JdU4uHu8CsbiZg0NAktINAm1iQb3C4/tA
         RFiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=o7HgMUcJYDwFYei9UXNeIyNP7q17jjzr/VJlzAOm+Hw=;
        fh=yG+hwBtdoSdmoI0/JaJR07TLBn7kgQbnwrbsO+/58A8=;
        b=hoWymotlxIAItK7kcQN36dZZ3TWfdDGPXL0p3mvjMRRbQOgkid1LnMordEbQivcGUL
         +CT8mB8WG/EK47UH7sDIxQ1UsiQYrX8aYYHYLsYvr1adrIwEmTME8zwiQc8ZkzvMPQZ0
         wUAnSG6h8ihlkRz9KCmhyaH5sNLwaEkR0eXZVKZta/kxLtm1nJeopGceAsEtU67KbiMZ
         SaNG3pjFmKDU0neOWyi6PR61T7tBQ2PFCMrRyRaMD2zxLXPCNSmIwJSNe7+6urP6r13O
         16De72xZeOnSeBs6kWq+ftBJIPd/qCW4z0l1JzgzQ8VtsNRmFexm6Px++wjqR30C6PFc
         c3vg==;
        darn=linaro.org
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=zjXQ8v0r;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
X-Forwarded-Encrypted: i=0; AJvYcCX+wK+g7Lp9cJS6EGAMc298kgxDP2kJzFsRqmQmaoz7lRWGWzVB+hocKzTnz7XOtgBWmjMWHhO2+gQYgPdyj4MBeo5mhvZB
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c12-20020a0ce64c000000b0068c63f42470si1242747qvn.496.2024.02.01.09.37.09
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 01 Feb 2024 09:37:09 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=zjXQ8v0r;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rVazN-0002QC-Uz; Thu, 01 Feb 2024 12:36:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rVazK-0002MA-H4
 for qemu-arm@nongnu.org; Thu, 01 Feb 2024 12:36:34 -0500
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rVazI-0003Eo-Sc
 for qemu-arm@nongnu.org; Thu, 01 Feb 2024 12:36:34 -0500
Received: by mail-ed1-x534.google.com with SMTP id
 4fb4d7f45d1cf-556c3f0d6c5so1480155a12.2
 for <qemu-arm@nongnu.org>; Thu, 01 Feb 2024 09:36:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1706808991; x=1707413791; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=o7HgMUcJYDwFYei9UXNeIyNP7q17jjzr/VJlzAOm+Hw=;
 b=zjXQ8v0r6V4DJjhc/XQVsyTeOgAaAw/SG9omhPRVn7iaveFNxU2EpXHrJGqbuxcATJ
 jHqeWzip24GHgyzfu8cc5w0ukr96OhbzFQR4nlY/jGoRXd/5f4npb5pfhvMdSMbhf/t8
 wOljCm2hGSNgu5OoblTtrY3NhNCHxp505WCS6d+5U54PeZ9muCyNKzu9uL+5xzFiT8EO
 qlnO479YbkTj+QW2imb82cGWlni72iErhtEkWGQWmUIbcwXfyaQy92777kGd4FPk0hDY
 CXoT9yQ5Cx+eBSxasA1elAfDJj66QQs51fGdE98FQpC1mXtjZMdG7G/2U/SLwnoaNvJ9
 51tQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1706808991; x=1707413791;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=o7HgMUcJYDwFYei9UXNeIyNP7q17jjzr/VJlzAOm+Hw=;
 b=nyFM/+PUeO4T9f4vhnGWO0DQi5bR8kWHeehC89GLGTcf6JCC4FHqGYwzG0oS7rU/5k
 AkEXVpVRb9FYLa9YddH6+Qv63jwiOL5S9EAlYKeOlRQjQZhCnB9XAdLJNXStUGubCKcB
 qE4yw6FFwoqsvDUtAQicw0yRaP5Ou7XcNabl2uFCZYZkJjuNDA780WBM+aFInSbrGZHo
 Xkh6fCI99XlTYBRKStIIt2KYayxi6pywOx/vbmcoNiJrHS66fsGlo2y1lS4Cns/Wg2gx
 xTfenqqczw7J8Zwb+ai+0WnIUN+rRTJY700BAkyn4Rghsm5bjWHpMgdXcWy4Vu34WpzO
 ZtOg==
X-Gm-Message-State: AOJu0YzVioOGiVOzx3rN2w76zgS23/AmhZ0giUsbK9niCMmjX2xa/aaR
 qwm4cP8FoFJ7o3xP9d6Jr91msiEZg8LzdNQyCCWReMBJIOPucRSP2bjUdnXCHxpzHU7BHsBuDry
 Ox82x0xOmn6V2NZTKRPOdG1ymzcjY7IyqOGg8Bg==
X-Received: by 2002:aa7:dcc6:0:b0:55f:6b8:b2f7 with SMTP id
 w6-20020aa7dcc6000000b0055f06b8b2f7mr2255153edu.8.1706808991065; Thu, 01 Feb
 2024 09:36:31 -0800 (PST)
MIME-Version: 1.0
References: <20240131002800.989285-1-nabihestefan@google.com>
In-Reply-To: <20240131002800.989285-1-nabihestefan@google.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 1 Feb 2024 17:36:20 +0000
Message-ID: <CAFEAcA9dC=voU+1jRqrnVgk1_-WQhz5R=+7qq1um4mEnWNY8cg@mail.gmail.com>
Subject: Re: [PATCH v16 0/6] Implementation of GMAC Networking Module
To: Nabih Estefan <nabihestefan@google.com>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, kfting@nuvoton.com, 
 wuhaotsh@google.com, jasowang@redhat.com, avi.fishman@nuvoton.com, 
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
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: OXNFq9rQGdzu

On Wed, 31 Jan 2024 at 00:28, Nabih Estefan <nabihestefan@google.com> wrote:
>
> From: Nabih Estefan Diaz <nabihestefan@google.com>

> Hao Wu (2):
>   hw/net: Add NPCMXXX GMAC device
>   hw/arm: Add GMAC devices to NPCM7XX SoC
>
> Nabih Estefan Diaz (4):
>   tests/qtest: Creating qtest for GMAC Module
>   hw/net: GMAC Rx Implementation
>   hw/net: GMAC Tx Implementation
>   tests/qtest: Adding PCS Module test to GMAC Qtest



Applied to target-arm.next, thanks.

-- PMM
