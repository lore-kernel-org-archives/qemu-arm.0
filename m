Received: by 2002:a19:6b17:0:0:0:0:0 with SMTP id d23csp3864021lfa;
        Mon, 2 Nov 2020 04:02:28 -0800 (PST)
X-Google-Smtp-Source: ABdhPJx4k8Qi7flcgXwMQVI5hnsYs+3FAQyUXlLthmXZlEH7dT+uFYFJ9pYSPSocdtuCXV3u57bJ
X-Received: by 2002:a67:fb4a:: with SMTP id e10mr13973300vsr.50.1604318548510;
        Mon, 02 Nov 2020 04:02:28 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1604318548; cv=none;
        d=google.com; s=arc-20160816;
        b=BPZjHczxUh3vRPcFw37qMajMeWKV7N6CXFhNKbYXaoKAw9v/+fG4FPKIz9dZhMbDaR
         P9r4/Td23el0kDEszqpjtbzd9BTfWVw5CoNTxwz09EdPj5cizhk9uU45JkgmoiDg+zJJ
         dGyslmSk1DU3wkLskxEwXKf8SRJDgbI3NUSrO68HhnbuI7GaSx8k3l1qGWiBUu6tiKoI
         Ykt9MwMcreSeDkSHl2EpgEO+BtX9JetgJEKW+OFfvRNMMI8kqWOAyb++7dNzZwN6rUnI
         12c9nV/03YwB5yR74k+IxGLwGc3bkmrBYN/wjyXya5jsfFKbDaou3WDCS0J25rkDqJ3Z
         N9Rw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=jkzWocvmBlBIpVDb4D3N24qjnp3Vi1uGUcZoWRXSxs4=;
        b=aIZcU7hLBPE9VNF/WDryv2AgB/LpWrS0YZRZYSDdvSyEp7UVuRzSoq0XKPWT1UKKX3
         tzVppwHBC3nilTj8kmNkVGvIGaShhs/AUGeSQTHG6OmzxnGksm4hz1I+ZQlM0Ef01eFw
         RDTKYA7MT1mXLbkGVR9PdpGxNxSa/9HbSQPjYARr7ySmEYjAmk6PjeL8pQkjzbtUJTZT
         vCuIjP3vgaJeEchQWN2Q1ZN+4GgngBWEeq6IWtMIkJCPaWq5TupZqMvDxghRh7KFHjPa
         wXnqkvvNTxkiDpzPG5/vZNjo05v+LMSL7VmBqbd1AfgaBeVXZZgoV+vIN1VdlapLjpYG
         746A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=ZK9Fiouc;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e9si2302843vsr.365.2020.11.02.04.02.28
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 02 Nov 2020 04:02:28 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=ZK9Fiouc;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:58238 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kZYXb-0006fT-QM
	for alex.bennee@linaro.org; Mon, 02 Nov 2020 07:02:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52670)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kZYXT-0006f6-Gh
 for qemu-arm@nongnu.org; Mon, 02 Nov 2020 07:02:19 -0500
Received: from mail-ej1-x644.google.com ([2a00:1450:4864:20::644]:38486)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kZYWz-0004lt-9u
 for qemu-arm@nongnu.org; Mon, 02 Nov 2020 07:02:19 -0500
Received: by mail-ej1-x644.google.com with SMTP id za3so18525665ejb.5
 for <qemu-arm@nongnu.org>; Mon, 02 Nov 2020 04:01:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=jkzWocvmBlBIpVDb4D3N24qjnp3Vi1uGUcZoWRXSxs4=;
 b=ZK9FioucVXTl4UPNHfBBC49O0Hgr5TKHThBOqPo027j2Hx/NYZNNXItMghYpuvPnc7
 P2c89fCjOUEsoJU5s6Hs6bPXtp+M/27ZF5qtYJgrri4e5SWl4u6LYG02Kq95DYjQplQs
 i8IAKOi3RusKCnzchQFHqPuMFSIN0JVYtNW3BVrfjC02D5Gsc865dvaR1HBfIgbZy/QQ
 EsFmAy4EWVoPtUbebpStGAQuOedCx7r6u5YrkFf5nf12GQmpJOFPJfsdN03iJFe/Ieu5
 JrysVb7D48wpxV1ZNAcVoYsQ4Upt2QOY6A3yr716J7Ozx/QkYW+13zj1DGKH21f/HiQG
 jz9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=jkzWocvmBlBIpVDb4D3N24qjnp3Vi1uGUcZoWRXSxs4=;
 b=tgNPyebNv0zzBoFVmclyfQswLejTXbqBkJweKZhAm5UqlPB2eRg5+32fAubZxp0QP1
 ICp9hFtziGV0ux9UM/ZBfExhNX46zZtL95EfLFgQKB6IPc/uX4TKGxapYuHWMaBw7NsZ
 WOnyIKyln5tZftEoTIVqCqHcaBUief7FRel3H47pVcFhQJ8RzmKF47aqh4cwgZff+u/L
 o+YSnho/8VZrTLJsV6jANKmqRUYsii5+Mr50RH00TZl78qYENjyg4YdPkUX2wy5iymld
 LKg48Ygf0ddAMX962hZWs48Y3tWU2UlkK8xxse2ipZqDBQxbQV57R+eIdr7bq4UBDiC6
 310Q==
X-Gm-Message-State: AOAM5333K04CXCIyfssT/7vsr3h1gAPMegyThb8lVIURxQcW6LYk4b25
 lZCajLqI2sUmu35HG0oHWL4cIixs9k0SNZaunh7+Ng==
X-Received: by 2002:a17:906:3b59:: with SMTP id
 h25mr15773660ejf.56.1604318507431; 
 Mon, 02 Nov 2020 04:01:47 -0800 (PST)
MIME-Version: 1.0
References: <5F9CDB8A.9000001@huawei.com>
In-Reply-To: <5F9CDB8A.9000001@huawei.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 2 Nov 2020 12:01:36 +0000
Message-ID: <CAFEAcA9jBfGS-hG1SxurS3k98XOGpLzka2siw+BZTCHx6fg1Cw@mail.gmail.com>
Subject: Re: [PATCH V2] hw/display/omap_lcdc: Fix potential NULL pointer
 dereference
To: AlexChen <alex.chen@huawei.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::644;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x644.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
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
Cc: QEMU Trivial <qemu-trivial@nongnu.org>, zhengchuan@huawei.com,
 qemu-arm <qemu-arm@nongnu.org>, QEMU <qemu-devel@nongnu.org>,
 zhanghailiang <zhang.zhanghailiang@huawei.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Nsd1MQfBRtCh

On Sat, 31 Oct 2020 at 03:35, AlexChen <alex.chen@huawei.com> wrote:
>
> In omap_lcd_interrupts(), the pointer omap_lcd is dereferinced before
> being check if it is valid, which may lead to NULL pointer dereference.
> So move the assignment to surface after checking that the omap_lcd is valid
> and move surface_bits_per_pixel(surface) to after the surface assignment.
>
> Reported-by: Euler Robot <euler.robot@huawei.com>
> Signed-off-by: AlexChen <alex.chen@huawei.com>
> ---
>  hw/display/omap_lcdc.c | 10 +++++++---
>  1 file changed, 7 insertions(+), 3 deletions(-)



Applied to target-arm.next, thanks.

-- PMM
