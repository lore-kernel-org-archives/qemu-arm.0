Received: by 2002:a17:907:10c8:b0:98d:b2f5:1316 with SMTP id rv8csp1920525ejb;
        Fri, 4 Aug 2023 10:51:41 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHxOiixZDmdSGZUGdcA/tzaLDVcOqxodE2rHs5sZh0Ai3TZJF/ThzQYrNNWmUvBHLkEXIyb
X-Received: by 2002:a05:620a:404a:b0:765:449d:1397 with SMTP id i10-20020a05620a404a00b00765449d1397mr717217qko.13.1691171501302;
        Fri, 04 Aug 2023 10:51:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1691171501; cv=none;
        d=google.com; s=arc-20160816;
        b=Yna0B76PReHnJMm6hqLZkzckzuLNxVFCygHtevPz18Y1+2Rgw2W/W5sAYSpuFWoDCG
         25wQdh24z2WttmDA56G/cfaEcO/xhM7R9kxnY5E1qPB+tdkO3rbLzbZ+Z8QVgKZxIdwo
         6KYcuJSZ9DpSDhNpQu136c/XuyV3eNYvCR7Aq6nBQbCHIXpW73k1F0bPSVUgZd+zcg+b
         MrLFft1Z3r+AW33SmUM1eEp2XCXUlJBRCpsTMs9WgCrdtU6fBXWk8xZ0ndh7ynDw1sG0
         ECTXpaG0bHVcT7Vr6HGkrUb3YixXmtXrKBcLAp7QxC//OHhcnIuQHuriohp1jfHIrLLo
         TZig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=SuqwA+jWcK0nu8too/95HUTw3J81LpQ/HWQYusStQL4=;
        fh=CEa3UdY0L+UQ/2T/5R8rkDkdq4jlW1F1hWJjDNQD42w=;
        b=IaR/XQ9/wJG/JFzU8KKbZuKW2AKVzOdNvmQ+KD17HuKcDo3ReL7QUqyg4ewiaL1nqS
         Kqxr59eXGwjJQ9ZmhYgb8Y/pqFd2b2Z5gv4aWFPhE4fSR1MGRoWMMq2rcMLRKiO/MAhb
         pg4qlOZAmpOjHhdWZXqyIwph5T9X9DyFjxQRNsuQffG7vQVNh8bZir9o4PKYzik+E5Ua
         3olglSVsaEiMNeDpj13lZOdzBrVaa3c46oBNh9ABxum+x/7pg0IF8CvZZm5T4P75KcnB
         kfF9oTEPS5234tIQmz3Fnbc8k1/uw2+xlHI5BumgIDDWvkTGcGCREl38wC504VHvQRiV
         RQJA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=QlyD+eiW;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u7-20020a05620a0c4700b007672ac73968si1651849qki.519.2023.08.04.10.51.41
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 04 Aug 2023 10:51:41 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=QlyD+eiW;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qRyxI-0002fH-LP; Fri, 04 Aug 2023 13:51:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1qRyxD-0002cr-On
 for qemu-arm@nongnu.org; Fri, 04 Aug 2023 13:51:12 -0400
Received: from mail-lf1-x130.google.com ([2a00:1450:4864:20::130])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1qRyxA-0003fp-Tt
 for qemu-arm@nongnu.org; Fri, 04 Aug 2023 13:51:11 -0400
Received: by mail-lf1-x130.google.com with SMTP id
 2adb3069b0e04-4fe0c566788so4026124e87.0
 for <qemu-arm@nongnu.org>; Fri, 04 Aug 2023 10:51:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1691171467; x=1691776267;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=SuqwA+jWcK0nu8too/95HUTw3J81LpQ/HWQYusStQL4=;
 b=QlyD+eiWIpjsWIgOXrgJ/9103YqpBUfgfYeo53n487dty+hek/enx4n4NafXEghHM+
 QinKP0zFIyUdzrNk11UJOS9hsPngiL9mDnX8AQ331+VmVEsaURiY8DKDWDSpIXqRJQPY
 AYs4GXR9iw8u+lWEagehS/b2y1kk9CGbl6jhrTCpOjWDF9QRTIo2vQth+gCWcTrdgy3F
 XEAV00Mg4IXs4GOoJfwfT6WCzZsXhRgqyql5eWEjuSFUuwis2PvL9Wa3hW16lrs2atwB
 StAxbiu61mOQa+CEfp4M02bU6wO1BEZ72fRbQWqn/PvpXiynfEQOi2QJ0w++dGP/NfbF
 mhkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691171467; x=1691776267;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=SuqwA+jWcK0nu8too/95HUTw3J81LpQ/HWQYusStQL4=;
 b=Ffzj7O51GaAeOfSvuuZZp25qka6Qy2fKxO+S8Nymb/FY1gTBJKAkwZCYe9hzKdHTaY
 cEWmnyPEcolFIpJwesI1M5JIJiU2Af6eUMi+TiJGwYcYEMEA5IpURnbG08lg270MbVXz
 XlH23vMjl/rVKyGpyTjJPuyqkrQ9RLuiU54/8e3k06ZA+JExH2GftwgSUDdvmSW37/3L
 O6+NAHI6d/65iFKSKi7arB81rsvUtYI549zPY2AN5OT3H8cqyQdvdRX0k1sNV0GkFucZ
 LRcBepkGqMwD4um2cYZymBhD7+IwS3bQnrD5r7NvfzrJz7jllJknUTSSSL027zWsobs7
 b2pQ==
X-Gm-Message-State: AOJu0Yznag2NJ3mDPIloTILrX3n/zMVZhuh9g8kq5jRKAzy5OxAKkWc+
 eH6p6ZkVyvOIvST5kA/50DjaOlac9ig8OBMib2GNlg==
X-Received: by 2002:ac2:5e64:0:b0:4fd:f7e7:24fd with SMTP id
 a4-20020ac25e64000000b004fdf7e724fdmr1420907lfr.64.1691171467059; Fri, 04 Aug
 2023 10:51:07 -0700 (PDT)
MIME-Version: 1.0
References: <20230802170157.401491-1-jean-philippe@linaro.org>
 <20230802170157.401491-2-jean-philippe@linaro.org>
In-Reply-To: <20230802170157.401491-2-jean-philippe@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 4 Aug 2023 18:50:55 +0100
Message-ID: <CAFEAcA_W8r-qxrdqHZaCBCxTFiDOh+cXu0ywSOxB_oqvVBCJtA@mail.gmail.com>
Subject: Re: [PATCH v2 1/6] target/arm/ptw: Load stage-2 tables from realm
 physical space
To: Jean-Philippe Brucker <jean-philippe@linaro.org>
Cc: richard.henderson@linaro.org, qemu-arm@nongnu.org, qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::130;
 envelope-from=peter.maydell@linaro.org; helo=mail-lf1-x130.google.com
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
X-TUID: DNqQMhDJHeQy

On Wed, 2 Aug 2023 at 18:02, Jean-Philippe Brucker
<jean-philippe@linaro.org> wrote:
>
> In realm state, stage-2 translation tables are fetched from the realm
> physical address space (R_PGRQD).
>
> Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
> ---
>  target/arm/ptw.c | 26 ++++++++++++++++++--------
>  1 file changed, 18 insertions(+), 8 deletions(-)
>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
