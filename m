Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96917C43458
	for <qemu-arm@archiver.kernel.org>; Fri,  3 Jul 2026 12:32:15 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wfd3v-0007eR-Dm; Fri, 03 Jul 2026 08:32:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wfd3t-0007e9-O1
 for qemu-arm@nongnu.org; Fri, 03 Jul 2026 08:32:05 -0400
Received: from mail-yx1-xb12d.google.com ([2607:f8b0:4864:20::b12d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wfd3e-00006f-Cb
 for qemu-arm@nongnu.org; Fri, 03 Jul 2026 08:32:05 -0400
Received: by mail-yx1-xb12d.google.com with SMTP id
 956f58d0204a3-664d78637f8so704937d50.3
 for <qemu-arm@nongnu.org>; Fri, 03 Jul 2026 05:31:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783081908; cv=none;
 d=google.com; s=arc-20260327;
 b=T9COXIRzhh44i7R8qVfIcCelMKzIHHgV9jyEr8DS5fX/74y6crGE+W38pA8hx08UyE
 v+oDBEgGY+FDatCvpdaEHPZwuwDxBClT2KlR6hxUMcearqXkSt6kw/xyIoU+VNw7I8vw
 dL/2GBVPyyxZozwvlzyChgL5ByHFhL6qWKwY2A7gucJu0YMwepVZ08NckED10qjPvUde
 0ylqn9LsBC1SME2qc3ElPcds+ZzNou7pNChesa3H6SDi7Rcrb/DhZxVv3SIdrbWXdXc+
 tI/lYewS4LFLg2/CfOsNDKuL+q3pXj5tVg9fv/ewhSZU2LCmPGkzZTVSwp3WWXowhcf3
 EODA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=cH5pEr5Aa42QpwXY8XBAi9u/QJ7yeOm7vvinpj3m4hc=;
 fh=8IY67QzJRZK5Q6xHpco5ZsLKCOku7G50Z5/ShSSac9g=;
 b=cwTtsHT8uFhM2iIU1QUxRKjBEvQXpSu/OKmLUMs3QGWl1SRkiQWQGjNne4XJHfk3km
 8OLKbSB7uAamAa6mj26UlVcJLt+5LvAadlcG0NYnSH6i+4KPhFhMiJV96uDQcL6xI8Ro
 llrC42YPASzWR/WNc1ugNdnwYOyYhRV5LdslWVFahdhRENUyJ/n1/gn0tY/cpuoU6K3A
 OlhjoamDvs4NO01FnbL4RfHB1L6RqZ73zq5mODCCWjhfOO3wwfqhew1x/TKWNXQq3amF
 pPn7/8ScOwiyVzY/GK2z10PrscNxHOUg3pwDY0yVnmrV00JjvLGN4rUGmESnbUoXTFVo
 Gf+g==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1783081908; x=1783686708; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=cH5pEr5Aa42QpwXY8XBAi9u/QJ7yeOm7vvinpj3m4hc=;
 b=xFdsog0nKBGSNrEDrSoEHpxniUeVRT2ldqreGy+tDn3QTdoGkioG2FwPczF1mqShYz
 1QBIW0jNRTshl+Odvv74i+h/FQ3RgsNVYHbA98XtR40QGkDTF3YSCE11UtqqdaXxrOoV
 H82e0QBIHt/VKdR2fmqTuxmZmAFPenEX2X1IyFl3QBLLI0zmVyJLKMhVctTUt15sMp68
 B2UnUDp+h8WG/GZqh7AjSQnT3a/Tf7nbm2lp66m/7BOSk9tknRBAnr9o/cZcPTBNP8Kq
 KrdXSB1dO9YfaBUPt4Mz2CmmQM9tRWaxDXb6zrcPk3pq3LsP5tdMm27BbkyYr2sptWSQ
 CM+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783081908; x=1783686708;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=cH5pEr5Aa42QpwXY8XBAi9u/QJ7yeOm7vvinpj3m4hc=;
 b=n7lWg1ckIdn91tffIiuWNNemz4ctnQvPTOZA5aLro1c2AI4F1RKLHOQ6HkSdWPO3cJ
 FxxAX99Tgv5DxSkyA+Zz5v8d2vArVE6vifok9bPJRxnqnedf0SnvtP+RORkz8L8qz5mc
 ZHE3SpJVrnCloGyc2iQ6KEU3JU0XTD+JdZn20WLZYODFL8YtFJ9mBriKsuRNqJMsSwdN
 +j2JlAytsqJLVevtTNBHZmayRDdlO9nIdun9GWIn7muYLHAm5dguc7AEDW5rt7NI7tcV
 qrHMGnWG39iztbfYoXA9Rd1Y7aAaaOl68cPbqGRPBGjfRTZjohc3h69LXcjLBdOJas0B
 Dmsg==
X-Forwarded-Encrypted: i=1;
 AHgh+Rp7SQrQ174S0/xcBOjRnDXepuqUvmi9Czo/Dgp5SOyxH0zBOih1jcwSJrkxYxtPkiPlD6KDZjLHFw==@nongnu.org
X-Gm-Message-State: AOJu0Yx3TBuudXfndPFC5ZB2z1UKs3al1sFz+kCoeTyh1QwklCo/zeNG
 zuqmOep6cbuALkjZ3C0PpdgOV4zTEu0Z0N40teL6tIVIccFb8/r3eVrC+XbRk7rOCGEphgSbQjP
 XS6DK8vKCE1n2YAS5NaV26j+rMeVNCZUOkEpCZBR3+A==
X-Gm-Gg: AfdE7cli0MBG2ZytCAhNcO+1UKOy04Dgycfnqe2RqtR++Aaaild4Vh+B25AWXwR3tcR
 s9MmY20eHpnQmRRaVCLQC6WuLZjbQTr9IIDred3AVRpk9Alu8K0+s1muUBwMuuPLT0FMRX2tali
 3okC7egH+YfYUYG4ET99cGAhzkdGgWej2S7RrSeJV8w7KOLyq3AXQJHPSbyWsjN5H04CsFWJYY6
 WVMayNdYxpRI6wlsuQ7LqkSrphhbcmDsB61v6X+CqLH36SqrmpJM80OpIemnV/IHT8ORajopT4r
 H5ElpqhzlAF4TLIMKIbzgUDIdIx2HVl3T7hUMy4pcNsSk7ju5sL9KpzTyB20krDD5tk=
X-Received: by 2002:a05:690e:d50:b0:664:b3c0:6546 with SMTP id
 956f58d0204a3-66521d485b4mr8860949d50.57.1783081908321; Fri, 03 Jul 2026
 05:31:48 -0700 (PDT)
MIME-Version: 1.0
References: <20260702204314.79224-1-richard.henderson@linaro.org>
In-Reply-To: <20260702204314.79224-1-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 3 Jul 2026 13:31:36 +0100
X-Gm-Features: AVVi8CeVLa5RC2aLQpvW1fcbYz-IRiGWH1aknUzhSpBFj_yPRYFsTHJwwnG4gV8
Message-ID: <CAFEAcA_50HH6P=0+T-ESvaY=9FOs8LHtC1t3SdxR=Tg2-TkntQ@mail.gmail.com>
Subject: Re: [PATCH v2 00/15] target/arm: Implement FEAT_SME_MOP4
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b12d;
 envelope-from=peter.maydell@linaro.org; helo=mail-yx1-xb12d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_PASS=-0.001,
 T_SPF_HELO_TEMPERROR=0.01 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

On Thu, 2 Jul 2026 at 21:44, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Changes for v2:
>   - Rebased on master,
>   - Two typos fixed,
>   - All patches reviewed.
>
> r~



Applied to target-arm.next, thanks.

-- PMM

