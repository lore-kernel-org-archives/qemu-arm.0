Received: by 2002:a17:906:b2c6:b0:930:eaf4:5c09 with SMTP id cf6csp2380872ejb;
        Mon, 3 Apr 2023 06:54:55 -0700 (PDT)
X-Google-Smtp-Source: AKy350YAXYwivjpSin2BZzKiAlwuVhrq1EELsv5pKa6IagsNsOiXqKHGgH9GcX66n+lJD3q48xjp
X-Received: by 2002:a05:6214:4007:b0:5a3:79cd:8ef7 with SMTP id kd7-20020a056214400700b005a379cd8ef7mr53502717qvb.23.1680530095487;
        Mon, 03 Apr 2023 06:54:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1680530095; cv=none;
        d=google.com; s=arc-20160816;
        b=cBzsYDOQl5nOA9L6BW2DK4s+wXkxc2kJJ9SXAktEt105lLuVEe9ToTY5koJJ3gNVwd
         ca+dMuWOfFWCOdFWYHQpjLM/6KoAjKhuOARxmK6S+rWuWDmG+nFsh/vD++pRCmJDBCth
         JPf0ddx6KcK0Gatv/R3T4iynxKwKWCdpbOHAcxboqHIXtxK0gNcnCdUs7fZH1NCMue0E
         FZy3tNv1z4XupaaBO2vLygILziWY/WsZLAwNRtnrqrAMbVr28wm7hhZv6J1t9EthFsjU
         1l3aorBhA1//GPua+NDMjHLlDtMVZcK0TSrulbz2HU+9sS3RsXdh+7V37pHVSLwJVtEj
         QSgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=O63RSbGTNRHKa70AimcDILSKXnM2Bbeq2uBasOeJ6X0=;
        b=c0gnWrLOudZZa4pSY/46+ypMOdzUp9JIhbl8tYNnUA2YH0tlat3kmmiz5Dn6xBgGqp
         1+VAhL1obtS1RSxnwieB59qI/r+0HHWlJ9jmKe/+rqSi2X/SNptb3njnGBw/wSAjbWWH
         zICHiC1vclsonjRIshL+4XohESWCwo1+KYdvZ0RbRCjMUXg5nmx48XYfvmOxXITEWokF
         +p3ziLQ7jLtGkZOCfnSXgTahZ3QiQUYKvmIa43ep/32iUNQU6vH7c5YCzuZb6b37/YxL
         Ixpe0o0Orrq6Yp4uoQb7tEtk31hd2tUJk9+bZkh2xT5kk+xv78IOrnbuPPv2TwHS+2zT
         bUhg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=b3KhXdWj;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s1-20020a0562140ca100b005ace58ed442si6148531qvs.86.2023.04.03.06.54.55
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 03 Apr 2023 06:54:55 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=b3KhXdWj;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pjKdw-0003Qf-Ho; Mon, 03 Apr 2023 09:54:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pjKdv-0003QU-Po
 for qemu-arm@nongnu.org; Mon, 03 Apr 2023 09:54:43 -0400
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pjKdu-0006Gd-7g
 for qemu-arm@nongnu.org; Mon, 03 Apr 2023 09:54:43 -0400
Received: by mail-ed1-x52f.google.com with SMTP id r11so117684691edd.5
 for <qemu-arm@nongnu.org>; Mon, 03 Apr 2023 06:54:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680530079;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=O63RSbGTNRHKa70AimcDILSKXnM2Bbeq2uBasOeJ6X0=;
 b=b3KhXdWjmt11ii5EU4KSZDPZpXqTKp4krQcikdRIAjVuwXFT3etlfHfWFXDHMCY7TU
 Pmjh9q41prtCMVM6Tq/5jro3h7stcKTyBppUyG6fZgvuLIL8lJQj3bkDGBMDWtUDIVtt
 lCB5880eyjnO2csiptZasGoj5BocPo4W2898hZ6QvpC2yaEtmfCrdsXJztKU/aHUqaFr
 A/oS4QStlsi2r70gxBfsMuAL6iyHtMLnXYhieEo0ifWYLSjwJ7sYZgiPxN8+tK2tTJGg
 ZDjdG/6oSay8gWCwEYxnwCwnNNAJ913ns2RxFSK9TW+pM/kja8uhtWftygNSpF++4kOd
 iy+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680530079;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=O63RSbGTNRHKa70AimcDILSKXnM2Bbeq2uBasOeJ6X0=;
 b=ZLd00WFWDNSZLlUlkO/J6wQrIp1FoH5SXc8cL3ICAn1+V7LAVE5fJY69qfn8+JHJha
 hsheajR35vvvQDdbT2oUhR6aH8aFNYgbcQ0HBMwzBgcjmyQS4eUs7GkCAK3HksAFulkc
 X7uVS47oe7tIw5If7FR+xx1rhlgy7eM4tMrDteGkC48n3jvErQ+KZevtsGRFSVLUKXjx
 loyJW7biGL5rJFmYTvJS5AdUxDp0Mt2MqlPOs7js22XnpZRZ5xqu58CDC3r9r76ScdPR
 724XXZeQlO/luFJh4j0fI/W3PQ64K8+l+rrn3hXrXghS20sm1ZQrcz2JWu9110ZjjSgd
 4U6A==
X-Gm-Message-State: AAQBX9cOMFQuo8jiskRUtO020VgehEzQlHsGcY4NWfTdKlVF3FCi7BuL
 ozeTzYGRW0/0hWjTo7khjFD854gjdi1qYMFX/0GdYQ==
X-Received: by 2002:a50:9e89:0:b0:500:547b:4e1b with SMTP id
 a9-20020a509e89000000b00500547b4e1bmr18124132edf.6.1680530079218; Mon, 03 Apr
 2023 06:54:39 -0700 (PDT)
MIME-Version: 1.0
References: <20230403121537.71320-1-lucas@osdyne.com>
In-Reply-To: <20230403121537.71320-1-lucas@osdyne.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 3 Apr 2023 14:54:28 +0100
Message-ID: <CAFEAcA9ERb4a8kwcgtr3VAxnjaCuOVnKFJ56FfkNx=F73a0o-A@mail.gmail.com>
Subject: Re: [PATCH] stm32vldiscovery: allow overriding of RAM size
To: Lucas Villa Real <lucasvr@gmail.com>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, erdnaxe@crans.org, 
 lucas@osdyne.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52f;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52f.google.com
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
X-TUID: jHPk34hUoevv

On Mon, 3 Apr 2023 at 13:51, Lucas Villa Real <lucasvr@gmail.com> wrote:
>
> stm32vldiscovery comes with 8KB of SRAM, which may be too low when
> running some workloads on QEMU. The command line argument "-m mem_size"
> is not recognized by the current implementation, though, so one cannot
> easily override the default memory size.
>
> This patch fixes that by adding a memory subregion according to the
> value provided on that command line argument. If absent, the default
> value of 8KB still applies.
>
> Signed-off-by: Lucas Villa Real <lucas@osdyne.com>

Does the real hardware have (options for) more than 8K of SRAM here ?

thanks
-- PMM
