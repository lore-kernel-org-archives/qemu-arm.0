Received: by 2002:a19:6d5:0:0:0:0:0 with SMTP id 204csp226626lfg;
        Thu, 11 Mar 2021 04:06:21 -0800 (PST)
X-Google-Smtp-Source: ABdhPJw5f3REJK0GC/ZwOOGO56IpWCR6TTqmtXfIwz6NvCj9jsjCMhVRryKYmjEG6dK0rtngsxvl
X-Received: by 2002:a5d:81d1:: with SMTP id t17mr6037008iol.208.1615464381363;
        Thu, 11 Mar 2021 04:06:21 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1615464381; cv=none;
        d=google.com; s=arc-20160816;
        b=cE3wEJ4zvLkQ8/n7Q6jBGdp1V32BQDrEloNLWmLuXKBRSQ8ZWs8qmKhTIrg5BolXoa
         0NP0n34xVw1qCsDoWCLEKwDjpry7SqtlqHCc+zol4PI8LtSUPfmEsWuyzjEreNntGPFG
         Uf7AVp6oUADMS4RhZANVUY4SzxiE6Gy6HDqs5EfLCt6qKazK/zCzIjsEdEmnvzx6Bg3W
         cKBYHGFDhdPwfVDlPtMT6ZZYTDYF/vFK9p6PflF1JmhtHZ32ouU4OwO/5LH0tinhgJNX
         BsIaiNSUozoWtziIaCIBYm4Q86lfvetfHhAnqoZFOzH0PqREUxfSuzA9Jg76tVjYrPC/
         HdfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=h5bMIguoe+D8vNWZVVWbFfeOSJivUwgl76UwADiXiiY=;
        b=jk+vtSNgiDOKJC6vp963OjiBiOd3e8hEvyWJ2uNy5nbsOsqDm6JuAbxZelhPzMEGpb
         5njbooUVHLcaDrMzY/LOWn0vfv30/KI6u3JwHn9O6aK2/tnNX0S/LPeVTTDtV7Ufmd77
         vcTIu6UZRBQRx78sHOnmZB1hOQuQA+mamL1zY6sT7wJd5s7OgU7pcko+5RX74JMGOaxX
         IqWSCNts0t5LHh5RwNDF/VvWsT5YpazNWNM1FU6UmLd1ujlF2lcIAmgcLtjGpUowno3g
         LYDUD72Z+fv2L6VKn2BuOYEhVnpla00TQhmb4+YQwx3zl4boWu5BJZ2pJqM45WS8i2fW
         4M/Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=VXrEZi21;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h2si2385416ild.106.2021.03.11.04.06.21
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 11 Mar 2021 04:06:21 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=VXrEZi21;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:33778 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lKK56-0003uf-LV
	for alex.bennee@linaro.org; Thu, 11 Mar 2021 07:06:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44420)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lKK4w-0003uX-Dc
 for qemu-arm@nongnu.org; Thu, 11 Mar 2021 07:06:10 -0500
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636]:35948)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lKK4s-0005Oe-Dp
 for qemu-arm@nongnu.org; Thu, 11 Mar 2021 07:06:10 -0500
Received: by mail-ej1-x636.google.com with SMTP id e19so45762463ejt.3
 for <qemu-arm@nongnu.org>; Thu, 11 Mar 2021 04:06:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=h5bMIguoe+D8vNWZVVWbFfeOSJivUwgl76UwADiXiiY=;
 b=VXrEZi21b0Bcf1oJKvvqllU+zjC4bWp43XX31/gSmmdAnd/XfH19l8wygWsJfZyUch
 C4MSrOP3EIdUSQ59eoHciJizv1m5YNnw/98vSEX4/3wIVOidqOXzYlEWr0EUAILHKM6Z
 TGlqFS5LGOLbW5DpLfsxEg3s+V4VtOGb4kD1KMGSEPwK9A8AI4RZ5LtVhR7b80dUfK3q
 n9wLcqhDWk7VruJt407lJLY+gh6pamjfYRjxFmZ4gK9Jf3rpIv7vUhFdv0qz8Oflp4q4
 +Yu6jJYhATtbhTMKXX0bOHEmcwoNOEK4zKO0Xr+Jo0K8Hai/vsX+aLx+KUkNsjcdbIpO
 Z2jQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=h5bMIguoe+D8vNWZVVWbFfeOSJivUwgl76UwADiXiiY=;
 b=dADX/C+umYAI/gdf2soXZkXqpjJgkXVBfXDX8L9/9BTKpTot5qPkqlgvqM+FGr8xeY
 VTygun6irQOpojQLP9ADFpbEcx/j8MqALL3xr+wDs2gQSOF75FQcrV60dUUjXefyY4wi
 s9/jNiMdL8xbrM3rOKh8/YOnM9gofagArMUQfiyAjlfvpxHBscZ5DxvtZ/WLi7FGYIPa
 brXYicEKGbeWtTFNmtFfFF0W8mJZjFUyKBAqJKqOxyjkjHWjwYQMkqV+yBq1ZVlAeRoP
 U3eMTIF+FaiYnGXhGwmJs8taX+VW3CORNNy8CdewcHx8VUPQ7hWk4c90TjMyMdbPBnUF
 G1yQ==
X-Gm-Message-State: AOAM533+lhQJ5gV7BKqHoRbHZ8njD0UQAV8G8AbtFfPPBJ4ahmwEXdqE
 z1rOsrUevnM3OkP9p85a/zxFi82n3VkH9jNcU97ahQ==
X-Received: by 2002:a17:906:c301:: with SMTP id
 s1mr2691468ejz.382.1615464364802; 
 Thu, 11 Mar 2021 04:06:04 -0800 (PST)
MIME-Version: 1.0
References: <20210305183857.3120188-1-wuhaotsh@google.com>
 <20210305183857.3120188-2-wuhaotsh@google.com>
In-Reply-To: <20210305183857.3120188-2-wuhaotsh@google.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 11 Mar 2021 12:05:46 +0000
Message-ID: <CAFEAcA_vd3MQAGWgH-4mBvi7qWfeELewAqcj6VD22G3krRhtDQ@mail.gmail.com>
Subject: Re: [PATCH 1/4] hw/misc: Add GPIOs for duty in NPCM7xx PWM
To: Hao Wu <wuhaotsh@google.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::636;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x636.google.com
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
Cc: Patrick Venture <venture@google.com>,
 Havard Skinnemoen <hskinnemoen@google.com>,
 QEMU Developers <qemu-devel@nongnu.org>, CS20 KFTing <kfting@nuvoton.com>,
 qemu-arm <qemu-arm@nongnu.org>, IS20 Avi Fishman <Avi.Fishman@nuvoton.com>,
 Doug Evans <dje@google.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: PbyxiClvDh9I

On Fri, 5 Mar 2021 at 18:40, Hao Wu <wuhaotsh@google.com> wrote:
>
> This patch adds GPIOs in NPCM7xx PWM module for its duty values.
> The purpose of this is to connect it to the MFT module to provide
> an input for measuring a PWM fan's RPM. Each PWM module has
> NPCM7XX_PWM_PER_MODULE of GPIOs, each one corresponds to
> one PWM instance and can connect to multiple fan instances in MFT.
>
> Reviewed-by: Doug Evans <dje@google.com>
> Reviewed-by: Tyrone Ting <kfting@nuvoton.com>
> Signed-off-by: Hao Wu <wuhaotsh@google.com>
> ---

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
