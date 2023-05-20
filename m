Received: by 2002:a17:906:d7a2:b0:96f:a786:ac5c with SMTP id pk2csp157045ejb;
        Sat, 20 May 2023 05:20:43 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ6meJONWDwlYpWWCTloPpTFzxXVCZxfK0ZkPm4za6JuVbd9/FAZ3HkjQucmUzO0JoihJJK0
X-Received: by 2002:a05:622a:58d:b0:3f4:8612:6d84 with SMTP id c13-20020a05622a058d00b003f486126d84mr9660985qtb.60.1684585242768;
        Sat, 20 May 2023 05:20:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1684585242; cv=none;
        d=google.com; s=arc-20160816;
        b=PAGpVB1IEH/gooUDOzQ/0ZKo9z1f3nwkW/h49Zv7NENpoWpGgjJDfjjW/EXn26TK+A
         9Yh4lbCUkZEWAa/IgoCmJpvBDzJzohqZLK0wsi3RX09TLraf7jTISkTp7yiN5P0LTFHd
         o+kkzuHYBWX8wfMLBsubLcxyFiZlN/4lVW8dxUhoNwQnFWFeu9dq7TXBJhDUqRPVbK8D
         /3CWtksEljnR5wQMgtVZWLtGwG/SM7IKgTH9yqApBD4xyYp+9kSprgi73mse36ifYu5o
         aPnOLHoPPVxKDYQkiPvrv4Y775e5xpmK+1H9fRLsA1Pn23qOhZs8OJcl5vcQHDUuPp30
         vYXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=cK2OLndQxxE4H8lE1N9iKIKScSgYh8rHPOnonKuMCng=;
        b=LM9Xbb/yY4rM7aFc1y1UFV293w2E2HPoAF6/uP06fDZCLAB7mHLQBNv6MVBWQQMkrw
         T/30khMppuWhv2KWWRVOBySoln80BrdKHasa04GZoQMFPe7A/qxXByopRkVo3NYwuqOU
         W5ZU7Lo9HH6fxuVAbgRgCtmyFnaJEfNIWIhzVX2NiK+qpXCHWoeQdS6M0+8FbgdG4yuV
         HmQG/h12SiIdNWNVMCaRbrgAYpjcApKTkw1BGaXv6uGdBWyZy1kdb6+rADWHabqDU1bp
         VWvVOJmT5q1N+LrMHV4Xj9s0OIS39l6u1iYip5ZRG9AjxgIslcBbggzKd2TSnB4ocSZ/
         VkvA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=e5Ukbd1z;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 24-20020a05620a06d800b007592fc5f814si718638qky.489.2023.05.20.05.20.42
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 20 May 2023 05:20:42 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=e5Ukbd1z;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1q0LZS-00054x-1s; Sat, 20 May 2023 08:20:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1q0LZR-00054m-4w
 for qemu-arm@nongnu.org; Sat, 20 May 2023 08:20:25 -0400
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1q0LZP-0000rh-IJ
 for qemu-arm@nongnu.org; Sat, 20 May 2023 08:20:24 -0400
Received: by mail-ed1-x529.google.com with SMTP id
 4fb4d7f45d1cf-510d92184faso6711633a12.1
 for <qemu-arm@nongnu.org>; Sat, 20 May 2023 05:20:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1684585220; x=1687177220;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=cK2OLndQxxE4H8lE1N9iKIKScSgYh8rHPOnonKuMCng=;
 b=e5Ukbd1z52DwgiVI+uowJ/AYb/mR+Ep379uTfYywt4e6LA0/imyHpO1vUDj5bV37/C
 7JS98oU/QAqTneUfr0EVNgGGPMQDXLrhUIlueWWIlGN2KHvqIomkOxCYvLH8lKe2BUQO
 UxPxyMprO3aWJF9GGeK363pQ21c4ihfy2Y9lkgeKm2l1uGFbF2D7CVOUoOV4SWkTQ82S
 w5S+JJLQIaPEBAlie+bZeLVfnJOZO1hsHkqUqmazcCAecTr5OU6M0k/9k1Fkdub/ZwCf
 hP9X0vUt3TQDqncS5j7zVEDHZAkNLOcPvIWVVFmuU8ofUskP1aJZGDTJPMW4eehdou2r
 Tqfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684585220; x=1687177220;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=cK2OLndQxxE4H8lE1N9iKIKScSgYh8rHPOnonKuMCng=;
 b=GP6fFYpXaPmlJJBI8DniQqKlF4JSk/7iXUHfc/kV//ZD0XMwhwzoe2UlKSGHdsfv/e
 kAEcEf6OQ4MXyn4gfsRfS8Trn0mLKWSPDhFtFScPv+8UlqG2IQnPvF1+N+QGg1qrVOMU
 pHBQzUa51G8gonAspxUh3omCi/LCFxX+3gXvlRBZ2tNg24IDmUHFFvv2QYQY9cxdOJf5
 c/yCvdMicoQuoQVo9FbLBcGdHHCcu5nCPwaxAfy4/0mK6a+/GNyq9438OnOY9nLWDb9v
 PpriUyncl6XPp1H39mztbquVdHf505l3Vx0DKRMePSJiH9kcEPexa5igB+oZKDJUHtl9
 Hn4g==
X-Gm-Message-State: AC+VfDwxM463AQezS5Tr/+IGXoCPMwh9GoUmZp/79tdcvOX5mOfZa09V
 +uef+N5qwlofDWioHa5UssgSMS6H/blR9NYlbr7/BQ==
X-Received: by 2002:a05:6402:180f:b0:50d:91c8:9e10 with SMTP id
 g15-20020a056402180f00b0050d91c89e10mr4191825edy.10.1684585219933; Sat, 20
 May 2023 05:20:19 -0700 (PDT)
MIME-Version: 1.0
References: <20230519212412.3362107-1-ninad@linux.ibm.com>
In-Reply-To: <20230519212412.3362107-1-ninad@linux.ibm.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sat, 20 May 2023 13:19:56 +0100
Message-ID: <CAFEAcA87xyjb7r9vXDA-kF-FJEAR51-ZCc9=pLohDWPqkAMmYA@mail.gmail.com>
Subject: Re: [PATCH v1 0/1] Add vpd data for Rainier machine
To: Ninad Palsule <ninad@linux.ibm.com>
Cc: clg@kaod.org, andrew@aj.id.au, qemu-arm@nongnu.org, joe@jms.id.au, 
 Ninad Palsule <ninadpalsule@us.ibm.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::529;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x529.google.com
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
X-TUID: fwgjBJ9tAt1i

On Fri, 19 May 2023 at 22:24, Ninad Palsule <ninad@linux.ibm.com> wrote:
>
> From: Ninad Palsule <ninadpalsule@us.ibm.com>
>
> Please review the change for vpd data for rainier.
>
> Ninad Palsule (1):
>   Add vpd data for Rainier machine

Please can you send all patchsets to qemu-devel (cc'ing
qemu-arm) -- we have automated tooling which only looks
on the main list for patches.

thanks
-- PMM
