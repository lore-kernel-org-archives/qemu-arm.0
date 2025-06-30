Received: by 2002:a05:7300:232a:b0:178:84eb:402c with SMTP id r42csp2517965dye;
        Mon, 30 Jun 2025 07:42:48 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVAWAbA1VjofmfsND/TcytoZKvKev9tVefwlGRYNUW3ztSoNjGlHCVAMGEOQ+NnQlNRCxT6/gNqIF556g==@linaro.org
X-Google-Smtp-Source: AGHT+IHcOd70heuDgsrw34VXTv7lAcP6mIIdMn/Oy8KAN82Vuf42ELSgMYzekLutJDgV7w1Sc+5k
X-Received: by 2002:a05:6214:2608:b0:6fa:cce8:3bdd with SMTP id 6a1803df08f44-7000291701dmr239536746d6.36.1751294568335;
        Mon, 30 Jun 2025 07:42:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1751294568; cv=none;
        d=google.com; s=arc-20240605;
        b=djnIY3kEHq6n0lSDz+lQrrbL0aY4/u1780JvdKRTX46mZqJio1BS1a6mrDo8nMmzdb
         BLU8EXsbal4CzOJq7JbB5zVWZ1J0f1oYFDwYnUWujy2uiNR6uDOvvFEhwLuYzGRHJJ8E
         wYkLRAp2RFBTFl4T0jlmtE1x568gMskEX6Ec9RawO0joqPQM0uSSj72DyPRtixIn2DuB
         TYlKhtQAzfZfuvlm03tgYbHO6LnJkBo2QG9Z7imXdon1InnlR9qEMe6XJbxWXQLGK01p
         6qYROgqxoU9/kgt70mc1ZSw/7Gkc9PkMUKfGPWEKBCN6zwD+DhThXgxi65W5YeRL189y
         wBrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=Gw3pshEDuG5m8wQHnpPxuFF7G24ZNHeA8enyCxVD3xg=;
        fh=4CvdsZCB0C4ksd8THQ5bRQrVWuc8+I234yBno5EMEEI=;
        b=JH2FFFqIpNHLz/RWdfuH2fJEsRgxnSYOfR05jOCCamVO4A+TQvjty9qT97/QQVURPc
         fd8ABVlBbi5PEg9AABN2PU6Sj3uR3Ej8zdRNKFttN2TYk9Epy8Vu6rwtRuyTZFCbD3wV
         ry0u0Ebgm2Xq7vI/YcJdooxx3fRzMn9E3w8jBBQ11bPlu67JuHL7Uc3ztZA//O3sHZ0Z
         +/oQIpMlM/xfehjLxJCZ/UkcGgJ7K77YJPfoTjynzVDIecHAs8PnYRLiEBomMTR6ul63
         IA6mNydDSHn8B3ia7OOg1yPTacMT6lmRbTf5q3w5uOts4n3pu5F+Dn8zEeNZb5xqUxPS
         olWQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=qACRAgYp;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6fd77288d26si102209896d6.14.2025.06.30.07.42.48
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 30 Jun 2025 07:42:48 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=qACRAgYp;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uWFi7-0005Um-NN; Mon, 30 Jun 2025 10:42:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1uWFi6-0005UE-DI
 for qemu-arm@nongnu.org; Mon, 30 Jun 2025 10:42:18 -0400
Received: from mail-yw1-x112c.google.com ([2607:f8b0:4864:20::112c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1uWFi4-000318-HR
 for qemu-arm@nongnu.org; Mon, 30 Jun 2025 10:42:18 -0400
Received: by mail-yw1-x112c.google.com with SMTP id
 00721157ae682-712be7e034cso20387557b3.0
 for <qemu-arm@nongnu.org>; Mon, 30 Jun 2025 07:42:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1751294533; x=1751899333; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=Gw3pshEDuG5m8wQHnpPxuFF7G24ZNHeA8enyCxVD3xg=;
 b=qACRAgYpRk1TOpYvlGHtIljvV4h4fOo/YPpkVasRRwOWVygAJ3jLK+yAchjJiYoYkL
 cf8077Nxiyp2NHMmLawA48R6EUjs+wUN1Yaw/zR7bYOMFhom0vbG/cGeWcijxX4D3++F
 Rc0eVE3JBSeqLgsGI9ZPMSeRhtCHvTD+w044Za5576rFMNjatAJadjm5VZiTmdRGbiiu
 iwJ5DMm3ooHXCM1OG+6uSao65u+OK5Yw2BzF7VaFHL6ZZaA71LTtPjXfJ88nxNkrWKo/
 cCEI/3U7kJ1acXNtv16bd93S2nZOWbPhxOADNj6litQsS22I3P2DWIcuhSfU94Qzj5uM
 s2LQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751294533; x=1751899333;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Gw3pshEDuG5m8wQHnpPxuFF7G24ZNHeA8enyCxVD3xg=;
 b=Ncqo/T01on387F9nt41gMPfs21dwOBEZYzbq+T4r3E/dMbtXZvwTPnXHUUSZy+Wjpn
 JhWKC2ekXUAmRfA0k7XrqJQ1LJSsHw1GwbH9BWPboHabXbghIsCXY5dAV+hy3+BzAJ/E
 AYQk/pkejXf8vxDEV5rmcFfdM9yOuHK3p28v2BY4EAUPauu0Dpt2Cjzv1MoK8PLbc396
 G6cPhkYu9ghyc+Ljpj4L/vAqHdsbr8l9hIMkhxsioEIy7+alvTC2IytvYjunKGA40Jg6
 3UK5NN1Q5/JK/GUE+PdXrO9GcIL13h7/eXBCsJDiPEz3xFRxqBWfV+b0AR3vMhtkDAUo
 HlNg==
X-Gm-Message-State: AOJu0Yyk43j1XFgXNiVZbDeVIctjTW3D9aW8iWO+E69n35Fu1RBHJTYV
 HN+xZ6dqkoOjuplO7CCrNVuAo6rsMnOubtYqDuTVxZB6cgF3eKNBMrb8g0o1ivDFcmo2INNtWKv
 VjXLsWOBERSXf0hCvVhwSRvesBhNHqos8eB4LgVeU4x0AVgn2b6cV
X-Gm-Gg: ASbGncskfoprs7q9nrTNEb+VbJDTGBcMltv99EQVzPPILZTx+Rj4HOICRcW4GCUzmy4
 qgX+7o7K4j1Bv3DWHo6wOl3wZUTGbwI9d7zlPrwP5pqlJgj4tF5LqxpxivpCrKzbXxO90onm3Mo
 e7clRwVib1aZYodEe/RToknkl6QVSULsw7GLwflEg2cXjU
X-Received: by 2002:a05:690c:ec1:b0:702:d85:5347 with SMTP id
 00721157ae682-715171bd0famr209094617b3.36.1751294533411; Mon, 30 Jun 2025
 07:42:13 -0700 (PDT)
MIME-Version: 1.0
References: <20250616171549.59190-1-root@wjsota.com>
In-Reply-To: <20250616171549.59190-1-root@wjsota.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 30 Jun 2025 15:41:59 +0100
X-Gm-Features: Ac12FXxaR2RpH4nY5-6Z3GSaypeVZVjT6XfD35APqIWFsEaMijhiD5JgmfURhbw
Message-ID: <CAFEAcA9PTTbRjh+eYb9uoBFhV7JqaSjRN5_8mp1bsCCPbACQzg@mail.gmail.com>
Subject: Re: [PATCH] target/arm: Make RETA[AB] UNDEF when pauth is not
 implemented
To: Solomon Tan <root@wjsota.com>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::112c;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x112c.google.com
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
X-TUID: 0OpMth3mEbMX

On Mon, 16 Jun 2025 at 18:15, Solomon Tan <root@wjsota.com> wrote:
>
> According to the Arm A-profile A64 Instruction Set Architecture,
> RETA[AB] should be decoded as UNDEF if the pauth feature is not
> implemented.
>
> Fixes: 0ebbe9021254f ("target/arm: Convert BRA[AB]Z, BLR[AB]Z, RETA[AB] to decodetree")
> Signed-off-by: Solomon Tan <root@wjsota.com>
> ---
>  target/arm/tcg/translate-a64.c | 4 ++++
>  1 file changed, 4 insertions(+)

Thanks for your patch! I've applied it to target-arm.next,
and it should get into upstream git within a week or so.

-- PMM
