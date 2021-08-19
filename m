Received: by 2002:a19:e212:0:0:0:0:0 with SMTP id z18csp336100lfg;
        Thu, 19 Aug 2021 06:38:12 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwX6IhLbISJf3B+VzL/175K3TrI3SXQySOPURci1fc+InQWzLFoo+Qkq6LEt4W3g8XQny0p
X-Received: by 2002:adf:dd11:: with SMTP id a17mr3948457wrm.132.1629380292122;
        Thu, 19 Aug 2021 06:38:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1629380292; cv=none;
        d=google.com; s=arc-20160816;
        b=IQa/arqxQMBjAf++aCmydx74ivedIP8XeHLsv+MS6DxUlw1vG5au8fH+uPmsdxBEyE
         Oi9rwuHTJddUr6XCKToW0F4Uftkco/Je0modBYoGJyPiJMKtlOLIZ3ftquvLY1yrufFi
         jAjMRIQ8k8D5OpuzO8lkhJ86a67Mw0b16vDITDdXK9OZBtomBN/1HwdaeEwvAMRJ1WE5
         dFunPTCha04F25KKBi2PXqhc9lWso1oDJVyGNtGt3VivejjaBk+QTwBfs0aqrCin7p2W
         sSEtAVZ66JS+/174HWZLYaD/7WSBXwG/cae5vfHNH3T0FVygjhSh2Wu1UZTsX/sqNv07
         l65w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=MfJCObmEGkvFyp2DjbtgejYNsDF6rAIfOCms2Hq3mKY=;
        b=OK+r3d5Gpkz5xc5xxTkWFb2xr/4/AYnh5GWgGVlIV31oVIBOdYcUmiTftzBN6DV/AD
         RJtb4ze0gV+igThNgryMrZmVqcznaawjs4+2nRJ9CDlnZXBilswXjgH2/Nc6d2ovLK9P
         Hz8LUDH97g944Czi0D3JZokIbngMFWJQD9M17c1g6fmqZ7LpyI4bcj84KKQA69kg4VwF
         AbCJBZPl93r+e0wACv7T5K3vRXkC7LLq3lz6pxFG+sB8J/twv0pVB0e/4XwB5HmptxmQ
         jVa8DocrKW0nhwzal8WLPIcZvaAWClUjX/qzhsjYRZsFCswALomw8CaElVS8zkM4NJZe
         2sHQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=m2mlo+nG;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id r14si3174670wrt.494.2021.08.19.06.38.12
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 19 Aug 2021 06:38:12 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=m2mlo+nG;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:45072 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mGiFH-0001iv-7I
	for alex.bennee@linaro.org; Thu, 19 Aug 2021 09:38:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44292)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mGiEt-0001g7-KA
 for qemu-arm@nongnu.org; Thu, 19 Aug 2021 09:37:47 -0400
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b]:39744)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mGiEs-0002Sd-6p
 for qemu-arm@nongnu.org; Thu, 19 Aug 2021 09:37:47 -0400
Received: by mail-ej1-x62b.google.com with SMTP id gr13so13016125ejb.6
 for <qemu-arm@nongnu.org>; Thu, 19 Aug 2021 06:37:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=MfJCObmEGkvFyp2DjbtgejYNsDF6rAIfOCms2Hq3mKY=;
 b=m2mlo+nGzeC9Z7UEhl6Dp2UUIeD7jpEvmXF/4yLCz7/BTROjpGDe3kqni2b5bmjKHh
 y/w3gOZNeShjA85DPjA3QPeWzuB81FiCtjizfH+uFP7GfQxfhKWzRpDr+TbqtZsRQUrU
 LcHNH+lWTxjiuUx4zZgVLifp89LORjJf3o8z7gtRpqQ5iPpqJli2YUi0UUPyM9YDiAp/
 VMDrnzlfiaxCB+zxnSXUdP6zF1DbrnJd3B07yHRLtI4L44ekVS3NibsxwkxAXqmnNgxq
 i6bwC0P9P9E3f1nQLSU2F3LMA85Pk08MlCo3KzmCfnZ0zOPjqXUIJzcNC5mvSBq12hx+
 A+NQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=MfJCObmEGkvFyp2DjbtgejYNsDF6rAIfOCms2Hq3mKY=;
 b=Q9lBAvpfOLcHhYKIDEJtlGbMOgyDg/fw65BGkx+2iayIRiBJ1AEUrx1+Zs1IINaOYe
 PxwCdFa4gxrAuBmUN3apP5m/WFAF1v24XIon8lhI4EhbxoW5waxE+PT7wByyVQNibNWI
 V0tzLTQkD/vz0hrRmlEBlLUfZEcOkCazuCMoPJCD/B2o2+ePnra96LjzOEZZqSk4vZYA
 weCgXIGG4mTmcoMRxWgEJu3AbEWu2goGu71M4keJ66Cbn/DUUH5hd/ICtmMzSmjDxGvP
 3QWYusZ6SFIjXyxXZffxpsCUlLdqvyKRd6/UG7/BDP6UHPhPWEmQPlca6+YFtn+Jje5V
 dH2A==
X-Gm-Message-State: AOAM531a9FEpncvlEZq2Or9hW9OXcDAr8/R2OfUZ4ZgGTKwYAfA80BZ4
 TmblzF7dHpcwBWP0Y1/pnXttGauz/SsKT8Rn/YNeng==
X-Received: by 2002:a17:906:e8d:: with SMTP id
 p13mr15965084ejf.85.1629380264709; 
 Thu, 19 Aug 2021 06:37:44 -0700 (PDT)
MIME-Version: 1.0
References: <20210818010041.337010-1-richard.henderson@linaro.org>
 <20210818010041.337010-3-richard.henderson@linaro.org>
In-Reply-To: <20210818010041.337010-3-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 19 Aug 2021 14:36:58 +0100
Message-ID: <CAFEAcA9XR8MebdL7+GXLjeHvyayvGL+u__e6Go7wq-wiDfFS_w@mail.gmail.com>
Subject: Re: [PATCH 2/4] target/arm: Merge disas_a64_insn into
 aarch64_tr_translate_insn
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::62b;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62b.google.com
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 6N3HL75YiN5J

On Wed, 18 Aug 2021 at 02:01, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> It is confusing to have different exits from translation
> for various conditions in separate functions.
>
> Merge disas_a64_insn into its only caller.  Standardize
> on the "s" name for the DisasContext, as the code from
> disas_a64_insn had more instances.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
