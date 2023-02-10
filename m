Received: by 2002:a17:906:dac7:b0:886:babc:7eeb with SMTP id xi7csp1902499ejb;
        Fri, 10 Feb 2023 06:24:37 -0800 (PST)
X-Google-Smtp-Source: AK7set/0aMtYw/rdhhoo6ljk6O72qFoFSschg3tv/PY1D3o+jUNxyFF+DY3dA57aDpCsfs8Y+DwH
X-Received: by 2002:a05:6214:260f:b0:56b:fe6a:df87 with SMTP id gu15-20020a056214260f00b0056bfe6adf87mr28690897qvb.52.1676039077094;
        Fri, 10 Feb 2023 06:24:37 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1676039077; cv=none;
        d=google.com; s=arc-20160816;
        b=M+7z0PygN5PztGAoZPIkw27aP88Nj1zOPmJskUdx8F6DsdTglnwcJt51hsZq2h6d2T
         psBKavV0jXCaedq3MqkRE0p5yNvsweZC5FCDy7ttkN1KLumkJMGmP2VMmioR5wMI/+TX
         Q9PhRBjSoJQbK2OBwilUz1wd5E8SSGs/p0cCAH7q8CzGdX9D0FK0ZjxFvkEs0AoN8cFx
         lWqHjdXJxC/Nlrgd0YVYgk3FcDUU3NmS4PgqMxNhmuNhdmzqOnlk+tLIZwIuTwjBdlsq
         DIBfSAU2qTO0p9JLULjHBqUq78lV5FKqezbpvUzXCgknXmsUp6zV6GWTMUatDfn71fi1
         hOjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=h5CTwu82D4llRMqd0n/PsY1zh98gMrZarjEsHM/uAng=;
        b=N0lr0cQ+UH+3CDdieHdB+YEZUFKBm9aNn2+0LRgzKiaQalPOzx1ih3pW811m0Y2/C/
         3eZq1S2EecqPBBWtYU6DRsi/KVvLm3o9uyIOdXB9jo45G+p3uex29jjZAY6iXlGVCHk4
         2JjqQSTg5X1/7zzj88dvglhLJlJiY+5q3Rq4UmqeYETfhq9A+35qbTRjFoVwCzgd+EPO
         0ynSIOsjzERHfKZp7S9tr4DlLkzlmgl4v59VAP+ov7B8p2CkjDisRZuj+8KHuTAyY30h
         Aez9G8HTuvsId5P7rN3KtZfeuIfWng2MMSzUff4iEOutMDlZkLD28W0iC6pNx94Z2SoI
         7ybA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=T9GK9rTf;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 18-20020a370812000000b00708eb13b241si3727287qki.211.2023.02.10.06.24.36
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 10 Feb 2023 06:24:37 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=T9GK9rTf;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pQUK6-0007lA-Md; Fri, 10 Feb 2023 09:24:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pQUK4-0007kL-PQ
 for qemu-devel@nongnu.org; Fri, 10 Feb 2023 09:24:20 -0500
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pQUK3-0007rR-92
 for qemu-devel@nongnu.org; Fri, 10 Feb 2023 09:24:20 -0500
Received: by mail-pl1-x635.google.com with SMTP id d8so5403766plr.10
 for <qemu-devel@nongnu.org>; Fri, 10 Feb 2023 06:24:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1676039057;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=h5CTwu82D4llRMqd0n/PsY1zh98gMrZarjEsHM/uAng=;
 b=T9GK9rTfLF9/aVp5NjAgBIcLeYh9fUYSdrmNrQk9+J52Era89QXPnYmp/ZKjDqdeuH
 AVzSxE0HwERqeNKGucpD83Cn3JBMyRjIVK6Asy0XKG2wJHZXfFPJ5UZSI3Ixu9gzJarR
 GpBjrnb6Z7Y7LQpeVI1aeq99aqyAKhTXeEhX+0xHZcYfcnSWlS8WUxfPg/Cout9ccSqH
 KhUI4kSnjKDeshqyNKk1YPbdlW1FW71tPIJJ1Tt1RPr4jRhAxhUzigEmyBJWClGJpre/
 s6iLfv5Ex2gS9P5gMrz1t52oh+tMNKN8o29UlRiHgYzXcGm1xdsK5FV91hkhAxtdjr66
 vOOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1676039057;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=h5CTwu82D4llRMqd0n/PsY1zh98gMrZarjEsHM/uAng=;
 b=UnLJpYwVNIaOkOVrjTNpsPLRKFMnP/N75bEdO6KH2rrirrjs045JLzV6b6ATHa3FHn
 m2RoYXJEvtQiGbPUHa2FhV8KJZ1FFOKjqc1r1gled+RC/4DAIaFysgMjmyntvjk2CnEx
 VRzfQ1VFg1i1K3Xhe/k/O8VWu2UlUrJ4j9JnUk0TZmjjr2YhWYTL+oBLcdJ/xpJOktsX
 bY9rvpV4jbDeRGYlNz2kDwBJKSegOy2ZwPcSabx8JRCgTRsdu1U+Q4Zi5l/jn42wBckc
 JmgYugH7lsiguEJBW4fkenqYYlXSRQEMBfweDBu60wqQjnveDviVUJJVy1uBQe1rvWBe
 aGGA==
X-Gm-Message-State: AO0yUKV4y7feyKvAOIByDYc4A7n1oNB3gZIUfyFkc8WIUf9bZLxOWphO
 hhesAspVcUhzF+MCT8Mo1rmlbS7zAH8UZrW9jYyByQ==
X-Received: by 2002:a17:902:9a87:b0:199:5374:b831 with SMTP id
 w7-20020a1709029a8700b001995374b831mr2116762plp.11.1676039057667; Fri, 10 Feb
 2023 06:24:17 -0800 (PST)
MIME-Version: 1.0
References: <20230124000027.3565716-1-richard.henderson@linaro.org>
 <20230124000027.3565716-23-richard.henderson@linaro.org>
In-Reply-To: <20230124000027.3565716-23-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 10 Feb 2023 14:24:05 +0000
Message-ID: <CAFEAcA8wha00jzsGFEXAQ5eMe+68=u_gce3D80jxPs=RKaQe3A@mail.gmail.com>
Subject: Re: [RFC PATCH 22/22] hw/arm/virt: Add some memory for Realm
 Management Monitor
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, yier.jin@huawei.com, 
 jonathan.cameron@huawei.com, leonardo.garcia@linaro.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::635;
 envelope-from=peter.maydell@linaro.org; helo=mail-pl1-x635.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: GsJLmkfxTQUN

On Tue, 24 Jan 2023 at 00:02, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> This is arbitrary, but used by the Huawei TF-A test code.

I guess we should look at how TF-A expects this to work in
real-hardware setups. Presumably the idea is that TF-A
carves out the RAM it wants to use for the RMM and
modifies the device tree / ACPI tables accordingly ?

Also, are we going to want to have more link properties
for the board to be able to pass in MemoryRegions corresponding
to the different physical address spaces, the way we do
today for Secure vs NonSecure ? Or do we think we can
create suitable board models with "just" a lot of MMUs?

thanks
-- PMM
