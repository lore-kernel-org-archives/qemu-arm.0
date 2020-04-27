Received: by 2002:ac2:52b1:0:0:0:0:0 with SMTP id r17csp3874151lfm;
        Mon, 27 Apr 2020 02:27:42 -0700 (PDT)
X-Google-Smtp-Source: APiQypIzb4qPAP92p7iY9WV8xKMPHn+CiM0ZkRCenVcpB5N7XYRN8HZEaUuA0Wdc/tC7tGVM3LgK
X-Received: by 2002:a37:67c4:: with SMTP id b187mr21866037qkc.296.1587979662374;
        Mon, 27 Apr 2020 02:27:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1587979662; cv=none;
        d=google.com; s=arc-20160816;
        b=KQ2TTZfaYWJ9temB4NY4hao4JBKEqlaYe/pXMFTpfphthD3CmGakvhXW2Pxq6PIcQe
         6agWXW9p0ab7mrcDlYR+2RwIJcdsZRdQrC8s0Kdlsx5FQOOFMd/NBHgKNsoXHwD7Ur8e
         4oQIwoKXUJcpkI9N097QzfL3Es8KatHTuFVVamVI/o8d13qzW58pqGO+WHGGIr8RveA7
         htfaFVVrUUKx0elIDeSw3DDMSOYADIQXWkqgcb0voLvVKlMI78has0HvG9k8WIku3TEv
         63IOFwf6S1ZybC8AXUdzKcBXYBpCJ6y0dtqCWX/DBKQozPd6V3XY9YgN6fHnww6S/YZP
         fl5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=jUW7ujg8+1frTiwl+Vw+rEehy9pjVQUkbwS6EcBELuA=;
        b=fvTevaMP+b/W/VFd+hpzg1hPjz96kUpAy4PIdnHWUM0FUPa/r1+qVjD5d4vHYrtSB9
         iUjnCMp3PkXdW9X7ZrZzTELc+bp5i3RNWEY23uUKBn9ArDAz3y3TuOG+CsiWLCOVqN1A
         ZbgDJ02G647tsdPJW5sDKPQVXoNp5CXYHQcQxtVyMsN+4ATJqsSpvwpMF+i2PKBNxMp5
         8aoDB+AOjGA/5X8ARI7H6oANr6Wi8xypnt2KTfgE+WOuEoc3HZrLpcer8KVv9QYqp7nY
         o5CKn5a+tZemXVtzI/y6EniLI9572thAOurOSvbcEqJ2XHfimHtQNn82XRnfpNZwRRD+
         ERRg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=P3PrNN8J;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f6si7530009qkl.90.2020.04.27.02.27.42
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 27 Apr 2020 02:27:42 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=P3PrNN8J;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:33750 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jT03B-000623-PG
	for alex.bennee@linaro.org; Mon, 27 Apr 2020 05:27:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60800)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1jT032-000605-P0
 for qemu-arm@nongnu.org; Mon, 27 Apr 2020 05:27:33 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1jT032-00012k-DH
 for qemu-arm@nongnu.org; Mon, 27 Apr 2020 05:27:32 -0400
Received: from mail-ot1-x342.google.com ([2607:f8b0:4864:20::342]:45914)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jT031-00010z-OE
 for qemu-arm@nongnu.org; Mon, 27 Apr 2020 05:27:32 -0400
Received: by mail-ot1-x342.google.com with SMTP id e20so25010716otk.12
 for <qemu-arm@nongnu.org>; Mon, 27 Apr 2020 02:27:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=jUW7ujg8+1frTiwl+Vw+rEehy9pjVQUkbwS6EcBELuA=;
 b=P3PrNN8JuxA/zfmxELudhpK6rfjeMiYhEnbIJEG/WVsu9zUvFHcEaHvcw0cAbiCDml
 WSBF8AOU2MdZIJf6AC9Fcx8MA5TmhH96ooHsa+er/MyNJOgxcMUue1AVLRB7ZjP3kEHh
 NKPBl1VEE7HRL8BXEBCBRMmFkGfWwNdHNHt3CDxtrV8sT0imZQAEf5ZwuYCsUwgcSFJh
 fVLtIYpvCvS1b7dQ+rDpIkAehz1Spvit22p1vIkbM4yT6Xl6xwT9XaAtpwGRfEte4Pi8
 heXm8oQimewBWU2PX1/efIdaznISR1ceYQDsrT7SIZHEJlhOLeRon/qiIY1Lqe1BkhtB
 zj3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=jUW7ujg8+1frTiwl+Vw+rEehy9pjVQUkbwS6EcBELuA=;
 b=XLGKi++r6n/ogYPgIdk/dDLTxjEpH7h3xcOza4+wwv7C3lD7z73utn+Vmsiei8cMzr
 hsfQntbVkme/9ttBgSD/tx1GXAMfkwiJhbUwHk5MlXi0u+gB46SdS85vY2O+G87Go1j9
 SZv8vY7kED4GulkH6zhy7z+TYXgNDcDiXTEEVtYoGHembLWPVVx+m9oKkTB21sYO82O3
 hw+RtkyG/rPGQxcdWADtQiS7sgMkEGTRDl0Zg00A+QA2caKAin8F4ujlsXTepC8iwhiX
 sUbPSQuMw41A9bK4hP4/jHTUfOIQAByaXA1NYRAkovGZgDTBc9PQ4YJynQwK8ZziRfvW
 pWDw==
X-Gm-Message-State: AGi0PuY+Zkga7jGkYaThv32Hzy+Qg0kfLO3EtCYPCJ9UwXnna132xLQg
 YdEpITZNEhzbVSNW7nHBJRXRu9bObi6Et0saw2LJXw==
X-Received: by 2002:aca:c751:: with SMTP id x78mr15234690oif.163.1587979649842; 
 Mon, 27 Apr 2020 02:27:29 -0700 (PDT)
MIME-Version: 1.0
References: <20200422043309.18430-1-richard.henderson@linaro.org>
 <20200422043309.18430-2-richard.henderson@linaro.org>
In-Reply-To: <20200422043309.18430-2-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 27 Apr 2020 10:27:18 +0100
Message-ID: <CAFEAcA-hLN349aQYList5f7oBzoKp9CrCOu1+zMXmfKVU_G_cQ@mail.gmail.com>
Subject: Re: [PATCH v3 01/18] exec: Add block comments for watchpoint routines
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::342;
 envelope-from=peter.maydell@linaro.org; helo=mail-ot1-x342.google.com
X-detected-operating-system: by eggs.gnu.org: Error: [-] PROGRAM ABORT :
 Malformed IPv6 address (bad octet value).
 Location : parse_addr6(), p0f-client.c:67
X-Received-From: 2607:f8b0:4864:20::342
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 56/2Ubec0epO

On Wed, 22 Apr 2020 at 05:33, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  include/hw/core/cpu.h | 23 +++++++++++++++++++++++

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
