Received: by 2002:a0c:fd46:0:0:0:0:0 with SMTP id j6csp4095714qvs;
        Thu, 9 Jun 2022 06:19:50 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx411ygZ2D/hKt44JktnDBOWrfcfIELuM/1cQzUo13F7XMfyoaYrOfD79FPMYSXKOybxg2f
X-Received: by 2002:a05:620a:69c:b0:6a6:b662:6fb with SMTP id f28-20020a05620a069c00b006a6b66206fbmr15485991qkh.728.1654780789886;
        Thu, 09 Jun 2022 06:19:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1654780789; cv=none;
        d=google.com; s=arc-20160816;
        b=EBda0+1MlW4mpaXEOM/TiDZcN3rympyM/+MO51ly4P6G4L6v71RTsY2kYpSOe7v6HC
         LfmYWMrg6TdhV4KyT//3/0YNr7t/mTvcMzIJ6dJV5boKTBe99schq2Vsk9t5MKYwiaKU
         ZmnadJVMccHoaeZWd4l+hJDzpQFJzzEkHuicQLiigD0vX07FtdO3VLqhUsC7p8eVHDhS
         Z8Q5XtFbM6WGq8Owl6C5O07td8mUVsnVvu/ODnPZYpcrbxkNC6y7Mm/Vi3Scz5bOtCv8
         GSkQdtanQ/NzmVcw9j3JYMs1kI/O87c+Qj+J+YIIR7k455h0Z+UmGNorGmXJ2cd7DgWq
         B9Xw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=wD4ZkGxPPATX+5NRHOqrcIfoQx7UZqGQ4oooBmRZh5g=;
        b=kENINp67MXBsfE3n+HPl5AOCla+yYxIZe6j98qgHaLqJ5wnHGX0hfctUYvtiqiiPI8
         wVc4GdQN/VCInPdwXAbviDEh3uy7F843DvPEs8ewsEZo0DsP/QTBOG83XZqjnw5gxgkX
         rfaICJ0cWZa2Y6evcTLqMZccwfuslL1Spl5SPQSNwZzGhiiahtdNKkJFFwgss33wdN1W
         kQm4lpqtQ8iu4+5DSqoMu1KMVU0eTZFfQKTgcBgkMt2o8kKO962UGqjeHqWnMq/EcRR5
         DEnTvbC6w9Q+EB5kDMZoEqGiTrDcCi3ToG8Zd0iACgrerLlI26Wik/6LaOziI/rSx6pP
         0a9Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=AMXlQbW0;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id k16-20020a05620a415000b006a62faa6c11si15258608qko.548.2022.06.09.06.19.49
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 09 Jun 2022 06:19:49 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=AMXlQbW0;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:60028 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nzI4j-0006iV-9V
	for alex.bennee@linaro.org; Thu, 09 Jun 2022 09:19:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44936)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nzG3F-00033j-Q7
 for qemu-devel@nongnu.org; Thu, 09 Jun 2022 07:10:11 -0400
Received: from mail-yb1-xb32.google.com ([2607:f8b0:4864:20::b32]:36544)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nzG3C-0001Ge-S2
 for qemu-devel@nongnu.org; Thu, 09 Jun 2022 07:10:08 -0400
Received: by mail-yb1-xb32.google.com with SMTP id k2so1816860ybj.3
 for <qemu-devel@nongnu.org>; Thu, 09 Jun 2022 04:10:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=wD4ZkGxPPATX+5NRHOqrcIfoQx7UZqGQ4oooBmRZh5g=;
 b=AMXlQbW0s5t4hUElj/4MnvlWvfZPNod82GHmIpwv+1M+S+Je67qfJTkHGb7Hh4P3Io
 z95QtGdmofjbfpRb6uPZWpHtdKRlOzoABYtUrX/neS4EnM8UJweYghosojrTdCOqym/0
 43/cW9I/mXeC9gc7RdSbtPzRTARpQfaeNiQMLVLu1GcZpZEPZvXx6Sj5JaXuFrcuJKGw
 XY0N0CyxPW1NiDYAdJOAX4qYHDH25pk1P6CbhI2IphNHPWqcnNnRdPCTJrR2HhJOqRFt
 Q/uo/HoehsIGBcywhfYggmblW/rWmI4pMQTQ3GT7vXUSKoyuTgukr1TAHWVMpJp4UqM3
 nyRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=wD4ZkGxPPATX+5NRHOqrcIfoQx7UZqGQ4oooBmRZh5g=;
 b=Ijzx6gZ7z8/4zdKeONLrwPGh5hqcDoVNP61vNhlCLvcWQ8cJ8s7FWeixHAUa/LbDgc
 2vcfQIE2wL00hpHwINXganR2AIBW6Kb1X7AvmkCR8uTzyQqf3xPQhENooymDPo2MGIol
 8NN/nxc40GUP+H+iXCeNtVz8FR0mUSB5k7DxWLJCS8wlO82p9w6+HfAJ+unnUJITWEbc
 //mcNgfPbLPbjTYS0LBc04KJkSGb66muagRmhy8ZrD247ytBu3sWClUKkmOv9tH23qEx
 +/DXENhphBU5BcH/YsUBZtJziqNrAmgWWI4kXfFRD2LrbQnspZz5tuDd+63adJ75T8X7
 S98g==
X-Gm-Message-State: AOAM532EhvKVwdxHmxBkvT9LZE+rdp6sUiG8jLm1WG5Eq0DxIQklfqOm
 IkyXz5VFVM1xV6ZLiGL+0FsZ/9Yg0dIwZ6XWQgyztQ==
X-Received: by 2002:a25:1bc3:0:b0:65d:46e8:6322 with SMTP id
 b186-20020a251bc3000000b0065d46e86322mr37451765ybb.140.1654773005315; Thu, 09
 Jun 2022 04:10:05 -0700 (PDT)
MIME-Version: 1.0
References: <20220522181836.864-1-mark.cave-ayland@ilande.co.uk>
 <20220522181836.864-39-mark.cave-ayland@ilande.co.uk>
In-Reply-To: <20220522181836.864-39-mark.cave-ayland@ilande.co.uk>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 9 Jun 2022 12:09:54 +0100
Message-ID: <CAFEAcA_yZBG7XkbTyLd41DFaH6_fTk=223GMw_dnaHTEZ2ciEw@mail.gmail.com>
Subject: Re: [PATCH 38/50] lasips2: move lasips2 QOM types from lasips2.c to
 lasips2.h
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Cc: richard.henderson@linaro.org, deller@gmx.de, mst@redhat.com, 
 pbonzini@redhat.com, hpoussin@reactos.org, aleksandar.rikalo@syrmia.com, 
 f4bug@amsat.org, jiaxun.yang@flygoat.com, qemu-arm@nongnu.org, 
 qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b32;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb32.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 2U7VIqdB5oKG

On Sun, 22 May 2022 at 19:20, Mark Cave-Ayland
<mark.cave-ayland@ilande.co.uk> wrote:
>
> This allows the QOM types in lasips2.c to be used elsewhere by simply including
> lasips2.h.
>
> Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
