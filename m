Received: by 2002:a17:906:bc5b:b0:a47:c39e:cbe with SMTP id s27csp4064019ejv;
        Tue, 2 Apr 2024 09:18:42 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUxUnzMSlQySqki+fj+kx4JN+o6+y8v4RFnFBVzD/Oat3VMXxQdSHVh00I7ckMmN/PAuFCvviXcz+ROV/xH37EN5jlQPGvk
X-Google-Smtp-Source: AGHT+IE3HVJyCy3nZyDDRVUnT5yUr0poAPjTMqESi+BB2GZTPeauZr8rSOhHEHx03eRV9q8/h5M0
X-Received: by 2002:a05:622a:4d3:b0:434:39f3:8cb5 with SMTP id q19-20020a05622a04d300b0043439f38cb5mr2088407qtx.24.1712074721741;
        Tue, 02 Apr 2024 09:18:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1712074721; cv=none;
        d=google.com; s=arc-20160816;
        b=0akdqtoLH4gFIZgig8S6nySwDUdniF5Y2l9lG5cpD/gojObrfFc+NCJIjH2iBVjtLR
         5CvWpKm+nDcrAJeqxkVNr278mIM8DnOZ98oqI1+UZisKhPf/bXm10MNPxPt2d0aAbB1S
         tUuUf441watyezeB6qd+57GBhsuZbhUO/3HUX2B3DYSd1kxP9MgS/zaG2kKW0yqmd8WY
         2N30B+UiTWz58og6hR08b96zraVbkgzcy8vku3/V6SCpYq2PN2eswjQHCFhYE1yC4MD9
         IwuL9HmqZC7kJM/csa978kWX3QBYZA1e8/tMH5r2jNY/af9siYyewE4rl+CT4Tyz+Sxc
         hsfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=jjf1Luvdff/hXyCBhND4zPlm17RoRT+L4gZCFbR1dCg=;
        fh=rcf5KGtCzMYiI2ZiksyqPDP2mp4Fu6M0Gk1X/fdp5q4=;
        b=XbS7TePitnoTkkW9qRopECUpbpBIRkva7RsM1QT3aQ5e7qQ6cvn5+Q+bnCZoWs4QAx
         G2I9XguX6LBno+N6lQvaLGKWfD+K2utDTM/hogbjv9xX+4qDsO+E1P+mG3ujqW7MF6FR
         ywP00B+WiF8JsihrEkOD7x3mTDfCySaWkOPZTBU2P2PazvMxKTHrfrt839vl5tR/Le7U
         UrhjyS/FqtlAzQwNakHOemD4Opa0cuz74hGMloXYbzIU2dTNV97+Yrl4zG+RN/zIW8ak
         sdQE57U5YJhLtwITr8/FRRKXR8PtqdG/DCjQsKbXqh5YSGN8SCfvP6xmS2nsojj7xJzd
         XdeA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=WZPBCkjE;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l11-20020a05622a050b00b00432b780f63dsi11573570qtx.728.2024.04.02.09.18.41
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 02 Apr 2024 09:18:41 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=WZPBCkjE;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rrgqD-0006Do-6W; Tue, 02 Apr 2024 12:18:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rrgqB-0006BQ-F4
 for qemu-arm@nongnu.org; Tue, 02 Apr 2024 12:18:27 -0400
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rrgq9-0001Aa-Bp
 for qemu-arm@nongnu.org; Tue, 02 Apr 2024 12:18:27 -0400
Received: by mail-ed1-x536.google.com with SMTP id
 4fb4d7f45d1cf-56df1dbb15dso986965a12.3
 for <qemu-arm@nongnu.org>; Tue, 02 Apr 2024 09:18:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1712074704; x=1712679504; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=jjf1Luvdff/hXyCBhND4zPlm17RoRT+L4gZCFbR1dCg=;
 b=WZPBCkjEiuUH3VA6152zF7gWEhzCFds3WWV1U27o5dqXybyWQVTkpF/JAMhESVSRi/
 PsoGzPneF0R3LrC/EuYu5PwXaDkeHacR6sZcElRP8YsT5KjKReGsZalwPi5gpG2CDv/a
 Ng3gKEENc7Fp9eMlguAy0EojRDOvd744ASNGF6UDLAZvKdRRrCLltQZwdRzFOUpsFMue
 Pkd6kcuj7N4r7Lv893JHqZG8pCcPhQqI/AWI+G3RJ2MVF0V8UW1A2w66/0XFGdTDkrZS
 it8SdMg1H5gii+JUpfpx06SDJKphAtYVUVLuEKaY47ls8uzjjUjv2jz6xGfcTZn7TVDU
 l89w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712074704; x=1712679504;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=jjf1Luvdff/hXyCBhND4zPlm17RoRT+L4gZCFbR1dCg=;
 b=jap4UmkwNoDPlivfenh6FrZ4MHbvJFjP6v6Df+xJ0VQZwqnLlrQOa+Ul5lv1lXNCuR
 A5bdoNlGuuqa0JSImazuFeTCwuRhHBMxbCoIwO6ygeokt2LGKBwLicrGwyjJT5PCCyXZ
 2L9D6sisfzpiXkGYuETtZx3Az8j2sgZLCUK8oKl4vHuT4m714+PSJ25tm3baPAEGVcB3
 omMKpcY1gTLBHNegQP+AOBSQJ5QFlEm89gJkapFU4qjBWKqiRhYgFi22EDKOOMSRA5j2
 gqTz2Offq9Wa7JgcbdJcmLMBlQmN6HozmfNjd+2oyfO/2NsTNg+dY4Ym5rWpLsX8iwCX
 bd3w==
X-Forwarded-Encrypted: i=1;
 AJvYcCWQU+TPPrpiQe0eF2YbNbr34XtlXrvj3vrRYJanQHJ0fk12uslmWqoChBE2SrTK4rvhIShaikXYzsKnuBDmeoPaORSD
X-Gm-Message-State: AOJu0YyHtfDBTsW4EFCVclXR87V2NyqJGtYKNL1iM+EfO+R3N8WGbZH/
 KwtbpRuEs1ONn6LaeS7mYdIDuAgQ8vQ37+GD1639KCcTs4DilYrRl+DqnJ1MT1/sx8rVURyRegp
 21DG9WB2aZCJBwcVKWhu36lsVGY75FlG+U/b9gw==
X-Received: by 2002:a50:9ec5:0:b0:56d:eeb0:cfde with SMTP id
 a63-20020a509ec5000000b0056deeb0cfdemr1340083edf.25.1712074703865; Tue, 02
 Apr 2024 09:18:23 -0700 (PDT)
MIME-Version: 1.0
References: <20240330103128.3185962-1-ruanjinjie@huawei.com>
 <20240330103128.3185962-23-ruanjinjie@huawei.com>
In-Reply-To: <20240330103128.3185962-23-ruanjinjie@huawei.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 2 Apr 2024 17:18:13 +0100
Message-ID: <CAFEAcA92Vsxot7kgVK5VDZ-H6di11LUOZJoX8kfG6-kRONgV2w@mail.gmail.com>
Subject: Re: [PATCH v11 22/23] target/arm: Add FEAT_NMI to max
To: Jinjie Ruan <ruanjinjie@huawei.com>
Cc: eduardo@habkost.net, marcel.apfelbaum@gmail.com, philmd@linaro.org, 
 wangyanan55@huawei.com, richard.henderson@linaro.org, qemu-devel@nongnu.org, 
 qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::536;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x536.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: u3J4fiAK11sI

On Sat, 30 Mar 2024 at 10:34, Jinjie Ruan <ruanjinjie@huawei.com> wrote:
>
> Enable FEAT_NMI on the 'max' CPU.
>
> Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
