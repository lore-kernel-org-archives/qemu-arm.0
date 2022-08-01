Received: by 2002:a05:6512:1086:0:0:0:0 with SMTP id j6csp2432654lfg;
        Mon, 1 Aug 2022 04:31:57 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1uP2FSnzEmj0LXUYuan58Ixkxc1PmxLl6RJyw1o7cXAFUviQolWuFyKWxJOIOGkEnVWOX5r
X-Received: by 2002:a05:622a:1387:b0:31f:25ba:224c with SMTP id o7-20020a05622a138700b0031f25ba224cmr13923142qtk.338.1659353517542;
        Mon, 01 Aug 2022 04:31:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1659353517; cv=none;
        d=google.com; s=arc-20160816;
        b=dD4Jsm0nd1/fciuQoG6BrXlk2VebZ825oNuXmZ3tHxLztn4sIpRpnb9fxfVN1v7vLe
         Qcvljsmo1sNU98B/2xXqABXZfVonLNptDA5c4LZL6UmYT2shlKfv3XH3Kxe0vDzHjB+P
         wu8bypC5OMM8YbyDL5Tof6Rj27zQCUZaDjqNPDdXpQWjQmpIXbLs2J0GdNEqMqpAQX6t
         lqCD0yvzh/6m5YE6wDj0F0Jyn2PF3aAIO75gQVN3PN6OhPaIviB94KzsdpcavX8GiYdu
         yiwhViinESrVDKCuESOLX6usbOx31rr++k1e5uXoYNR4TSbnfQSiC4sfWvcitkW9DIDm
         T0Ew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=sfMvC1fmM99uQNOPXZ6oX6GZ/7gfkj3DTq9Wq3MObkU=;
        b=i+NUFCkTcowIq66Ifb+gV1pQMwmOFlu5OWU+fUUz10q6HKkCDJhLeqC7lSwl5ovZZn
         54Dh/uVM6YhoMfXX1rwJzNhO2kTNke5fm5AwF1+V3kdqM/NlXTFEzMSNjv/OeL1ci62X
         Z59Xb3JMIs1l6NJxi9VDd7jxKeNsy0F4FhxAVNkswxbTL59IZOu7HtKgA7oTVQQl6RWo
         CnM0p3qoaHSTUIPUF8o1N67C5cJxSl1tJqIpetyNdkrVdXq7ayQOlq1geBJv9m4Gl+Iq
         EN3zHkp/dAcbNYLhbGXjpUrKhlzZGiE9Uopjf4HMdQkE85vDWUIAhPhGzmo3wdvBpCuQ
         Su7w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=nF8h7HZP;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y21-20020a05620a44d500b006a68d8b7b93si7763289qkp.684.2022.08.01.04.31.57
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 01 Aug 2022 04:31:57 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=nF8h7HZP;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:49200 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1oITeP-00038I-2T
	for alex.bennee@linaro.org; Mon, 01 Aug 2022 07:31:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34268)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oITdb-00033h-AV
 for qemu-arm@nongnu.org; Mon, 01 Aug 2022 07:31:07 -0400
Received: from mail-yb1-xb2a.google.com ([2607:f8b0:4864:20::b2a]:42753)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oITdZ-0006B5-VN
 for qemu-arm@nongnu.org; Mon, 01 Aug 2022 07:31:07 -0400
Received: by mail-yb1-xb2a.google.com with SMTP id p71so125975yba.9
 for <qemu-arm@nongnu.org>; Mon, 01 Aug 2022 04:31:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc;
 bh=sfMvC1fmM99uQNOPXZ6oX6GZ/7gfkj3DTq9Wq3MObkU=;
 b=nF8h7HZP8TFNl0JFcQ/onEkOFOMx+y5ev32NeAzJ7/7rF4ezEdXbUhXYVP0V4eJ0TK
 bsHdn/+sW1YIlhr2jFoUk8tTtOAQeQNnXRVnvV2pKoJs/CzF5WWvwBQ9x5XFbBCWtWOh
 0zp4YM/Ne8jZVJEXd1f6ka8ug57RClqKbhv4O1lpxt8QAJDb1IIgExd3s6scHrM+t4aF
 u4V5sWgAj9L5H31HltmlE8vHIni7igK6s8adhZjo8yBI+nalfxayVC3Ttwgfvu9jfqHl
 4W2Q5KWma2Pqgp/Roe8NNGepcHqqGe9bA5ymZnHrY+vPcLaeQixmrNx/i4LtknQmtyqp
 EfGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=sfMvC1fmM99uQNOPXZ6oX6GZ/7gfkj3DTq9Wq3MObkU=;
 b=kZ28RS+h0/zcfQaciFp8KhjXRtky/QoAsyEMXV216D33PeD5zhsVU2rF2bI9Wzowo3
 qHHVT1DmZN+zLgDbodeLa9im/bwdaSlol6HidvlO7GOoRMb9Xt9hTFJcJ5A3Vqhr13ln
 y17ZmzWTf8NLKli0LX+9i2fFScNU0F6an619Zc0BG/yWThkjL5BPES5acKR+JdRi1fiL
 qsQL5CbjeZcwGFBlj4kY9mZ+VbcapKV6wIICSTEKlArf/CizrQl5wqO6Rj7a97Mn0sYf
 ZgSmspfiI8tjnRB6hHEw6wG5+hP7lcwS9SR+Bu8UBEmHodVUgs5R7dHHO7uMR7BFnbcR
 SRSg==
X-Gm-Message-State: ACgBeo0YkfFtGGq8BHbFGbE/hpemccd+AWK4r2DzE0CqJgYYynnUk5s+
 JJn7cTDJo/2mn+VX51tDJlv+4eCmI/YiRuKUKut3lw==
X-Received: by 2002:a5b:7c6:0:b0:670:6ba6:d046 with SMTP id
 t6-20020a5b07c6000000b006706ba6d046mr10583789ybq.140.1659353465054; Mon, 01
 Aug 2022 04:31:05 -0700 (PDT)
MIME-Version: 1.0
References: <20220727223905.624285-1-qemu@ben.fluff.org>
 <20220727223905.624285-5-qemu@ben.fluff.org>
In-Reply-To: <20220727223905.624285-5-qemu@ben.fluff.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 1 Aug 2022 12:30:54 +0100
Message-ID: <CAFEAcA8JLLcPfMSfnKhsZdtXzWCkfLEFrzwL0BVh9+4ncZCTDQ@mail.gmail.com>
Subject: Re: [PATCH v3 4/5] hw/mips: use qemu_fdt_setprop_strings()
To: Ben Dooks <qemu@ben.fluff.org>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, 
 Alistair Francis <Alistair.Francis@wdc.com>, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2a;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb2a.google.com
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
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 4HWjlLonzj5K

On Wed, 27 Jul 2022 at 23:40, Ben Dooks <qemu@ben.fluff.org> wrote:
>
> Change to using qemu_fdt_setprop_strings() helper in hw/mips.
>
> Signed-off-by: Ben Dooks <qemu@ben.fluff.org>
> ---
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
