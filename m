Received: by 2002:a19:ee12:0:0:0:0:0 with SMTP id g18csp457382lfb;
        Thu, 9 Jun 2022 07:01:11 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzGrarJxDz9K0ShZdcIU+6ZN2RGws7Hp2TxrAYCwUdLMP6VrJafuMMYPgAKa3kjFBlQaVv/
X-Received: by 2002:a05:620a:370e:b0:6a7:2471:b3eb with SMTP id de14-20020a05620a370e00b006a72471b3ebmr2853050qkb.631.1654783271431;
        Thu, 09 Jun 2022 07:01:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1654783271; cv=none;
        d=google.com; s=arc-20160816;
        b=oZn5yS2ihiWqChPeKrZNLLG/Mpe3kTtmj33l5fqf1/wGVNewxmEtXOAn2IKyP5M/CE
         uPSuOhHUQm6GdzdeIcYdp/U8Dx0ypoYM4Gf9wwVrNTEKjvF/32C2wK+BuatMg6/tFHB9
         xz4iOHTs9m9zs7/QbOW30K1b7BvLAJnOV047ikBUJ81rsJLxka3H9YwYLqGxZUL5vtUB
         FdJ/GcvIazBN79xJva3OM7DQ5G6pPbbJIjwVFD7D91ymMTVjkkEShfxnm3QeElZF6+74
         6ZoVJ+RqnKqCsIjxyfLss+ArzA2UmzeHhroVExVP6WIzai89BJV3i8xzsvafAQtBQMUM
         o4HA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=qVNZfRY74nrsw3BKedvtnR0OOFztiB2FWQkpeU/LUWE=;
        b=vkc7uLTFsfTHmx4+h/BNU9Q/4kKUXcqZpApkACb/XORUCArtwCAkcaK9HPSQbL3BRL
         +RliI1g9JlaLd+8jQZM/hk4PmzSYG7LnnpymqrOfOChkzcBBPoaNzw+MuFKgP2a8X6fm
         L10WFPG1yKf/D2uKtsdK8slh1KvY/Ndt9/D8vcGkcX2fbgUGqGzwyX3If5m8xnFgjsDp
         7hr67Si7Yjj6Ca97eWjz4TZEPvoWAF/0+g96mA/yQ0PUyV7RhCL0viFSBRV57Ymh7CS3
         CufHtPy0/mGkjR27Ae26D/21D9tuc9lxrXbOFlA6X4EqJlD+sREeLh1gq9peCjRYsG4S
         VcGw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ZznWU+Mj;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d17-20020a05622a101100b00304ef50afa2si5617912qte.77.2022.06.09.07.01.11
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 09 Jun 2022 07:01:11 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ZznWU+Mj;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:45672 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nzIik-0007Pc-Tb
	for alex.bennee@linaro.org; Thu, 09 Jun 2022 10:01:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36164)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nzHcO-0002eC-30
 for qemu-arm@nongnu.org; Thu, 09 Jun 2022 08:50:35 -0400
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b]:34446)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nzHcL-0003Gh-KC
 for qemu-arm@nongnu.org; Thu, 09 Jun 2022 08:50:30 -0400
Received: by mail-pl1-x62b.google.com with SMTP id i15so3409446plr.1
 for <qemu-arm@nongnu.org>; Thu, 09 Jun 2022 05:50:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=qVNZfRY74nrsw3BKedvtnR0OOFztiB2FWQkpeU/LUWE=;
 b=ZznWU+MjFIux7dMTljOb8dEVXJWkKdD0mjFWJj+JJ0/+9umr8ycQYQOZPIlsewKaf8
 3BSvb/uU7i+FkIecbfXa3Vw2RLiVqMd+cxlNyE7q+NzuPQGUJ7/YRela0ydrTE9YeKz1
 NEm5WvGA0uymRw1uMArb/ZymOBFw3e4wAPpYxrej145sW42AiVy6QeaPkRUupzXNfIW1
 XvkT6sMSAIzQDYcp53KjForHEHNiEMfnvtMBKb3WDdWuBDg2884LtaBiomZVKSfKxEv5
 zDdGazODbp/Ylz/D2TR1MaNuSOOTzL3kkgOjqhi3a6xRSjqEjOhOWF3Nm8xocqG6X0hc
 oW4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=qVNZfRY74nrsw3BKedvtnR0OOFztiB2FWQkpeU/LUWE=;
 b=5ao2P5B7CVGIZP8JZfdhMwGfcBUuFsg8nDUZICant9Xiz+TAVVhYCcB5Yg0lt7yyOQ
 mVjTf8zP2fO6ci49qndRkxJ+iEXEhC9UMnwdqi239UMAZzwhXYaOz1hxvdDFcgFRHQJH
 af/0/sgpEZcmUe3P3EB4MhBTIGfVXWtA6+0wv0KK2IJ1v44U73iLgV3wUqGXUiyprw82
 9vli6tfCHwN9CYcewgjZgI99WrGSWUrB1xXCi+fUt/wjgl2ANCNj4RrdCyi/IxlUdCQ9
 Ny1DDIkTF5QpSEZyv6T9G9UAAec+wu/4hxl/Un7dXFQ83nIS0spEU4c9cG3cyy+r/wkW
 M0/g==
X-Gm-Message-State: AOAM5330UthptsQhCYAiI9Y6vec4za31UkdbMrdss2t7BOuC3ekVHbug
 aSj/eYRS42lNwxXbho1HupMh0QdsgF/djvBxIS4Ybw==
X-Received: by 2002:a17:903:1205:b0:15e:804c:fab4 with SMTP id
 l5-20020a170903120500b0015e804cfab4mr39545730plh.112.1654779027991; Thu, 09
 Jun 2022 05:50:27 -0700 (PDT)
MIME-Version: 1.0
References: <20220522181836.864-1-mark.cave-ayland@ilande.co.uk>
 <20220522181836.864-49-mark.cave-ayland@ilande.co.uk>
In-Reply-To: <20220522181836.864-49-mark.cave-ayland@ilande.co.uk>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 9 Jun 2022 13:50:16 +0100
Message-ID: <CAFEAcA_RiYABeiioTdHOL50F+zw5uQ53yJkf=Q0CmWaUc4zq+Q@mail.gmail.com>
Subject: Re: [PATCH 48/50] pckbd: add i8042_reset() function to I8042 device
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Cc: richard.henderson@linaro.org, deller@gmx.de, mst@redhat.com, 
 pbonzini@redhat.com, hpoussin@reactos.org, aleksandar.rikalo@syrmia.com, 
 f4bug@amsat.org, jiaxun.yang@flygoat.com, qemu-arm@nongnu.org, 
 qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::62b;
 envelope-from=peter.maydell@linaro.org; helo=mail-pl1-x62b.google.com
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
X-TUID: 8CVrWjGZhRpj

On Sun, 22 May 2022 at 19:20, Mark Cave-Ayland
<mark.cave-ayland@ilande.co.uk> wrote:
>
> This means that it is no longer necessary to call qemu_register_reset() manually
> within i8042_realizefn().
>
> Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
> ---
>  hw/input/pckbd.c | 10 +++++++++-
>  1 file changed, 9 insertions(+), 1 deletion(-)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
