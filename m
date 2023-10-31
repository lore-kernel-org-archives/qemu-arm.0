Received: by 2002:a17:906:70a:b0:9d0:bf65:29fa with SMTP id y10csp192880ejb;
        Tue, 31 Oct 2023 04:07:16 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGAB1d3CQd+1ZfZXQhmP/BgRnXqFvu1eeNyTXtevscGRXqErOqM9wBWxUSyW8PUCyWVr/SY
X-Received: by 2002:a05:6871:4307:b0:1ef:b4ae:e2a3 with SMTP id lu7-20020a056871430700b001efb4aee2a3mr10666150oab.5.1698750436376;
        Tue, 31 Oct 2023 04:07:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1698750436; cv=none;
        d=google.com; s=arc-20160816;
        b=jmanWZv9VA22auBPIiLPO9/6QpfOk9piHx4LfX9el5dMjNcyIb8R0sXYj9wFC306wk
         6siY2H0Pu7WQF9eI63IwqCgYrV65m+wLW7XwflR2DDDvoVYnBaPNMnrqYmHcTBhugGzr
         Fft0pajEtmvVcgMEpXAswHWkaFD00RQO7dY4aaAhkSMWIf2afLtoJwcQxSfSWDfGosPT
         f5GZHHcZ3bDar2tCSQlKVtKGGMNf33Ek+WJN9EMEPdEmjSic4ayrZXeDooitKnPysm4C
         +25JALKffQBvHAS3SQa4PqnnhUqWKygBWkOZom9ZaB0ZWzg0ooo0ps0jZtU5RKRFhmqi
         VIfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=wFJAz4K+qfoI7oxuIztYbc0PlUD3sJ/KSADLnFFqx2Q=;
        fh=MrxszEF/F4kIHHArArVMcXFfLXBu24bCPd92Q4XIY3E=;
        b=SrDeTHD0m1HUyPM9s7pP/9TlNsnsSYz50taz5QBsy648SxNVctX9lkLlmYbK088ZKg
         YbUF8oIBHqaFA4fr2gPnM9BIv7Pz3T1+PN3FAEyTK4R9RC165JHzXtkWtms44l/iR4p8
         h4PPR41q32IrnnJEAu4opsmmU0bgP10YOc/6whxAlvvl0lGztK/V3WIbdq4BUC0RWMdI
         iWr70nZGGCPxAiajpNFbVvy1CCcXvPTmkIFsQ2JjJr3uNrdje9vsTuEQaoX4fIDx0ptZ
         HTsLqskoETFKUQJl+oK+R/4CFFNcOCn82A7jWGd63/13wESA0OfmyS/aOp13S295PRa7
         1kMw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=MryQEKYi;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s11-20020a0cf64b000000b0065b02de7317si834206qvm.573.2023.10.31.04.07.16
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 31 Oct 2023 04:07:16 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=MryQEKYi;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qxma5-0000fY-E0; Tue, 31 Oct 2023 07:06:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1qxma3-0000bj-4e
 for qemu-arm@nongnu.org; Tue, 31 Oct 2023 07:06:43 -0400
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1qxma1-0005xm-H7
 for qemu-arm@nongnu.org; Tue, 31 Oct 2023 07:06:42 -0400
Received: by mail-ed1-x52c.google.com with SMTP id
 4fb4d7f45d1cf-5437269a661so951914a12.0
 for <qemu-arm@nongnu.org>; Tue, 31 Oct 2023 04:06:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1698750399; x=1699355199; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=wFJAz4K+qfoI7oxuIztYbc0PlUD3sJ/KSADLnFFqx2Q=;
 b=MryQEKYiSZm+LVv5SrVMuLp9ingYVpoUKK3RBGqFHnucIK5AF0QOgyDPWhZfEpzI94
 rvdNlvIQOOWByYoQhqiz/733M37E6MvskwpPs4gk1cQwVbtDctjrceRDOKhSiCV8tgxT
 gDz/8fKVUNr4VLl10Va/h4adBtEhiyd/ijtmFzPQcnO3zKxRwK0JFmj6XD7pieuDhfTP
 wP8t5vl/ugRSyoWCwDrs+XlhdEubI/IQ6xtNUMf4wXQLWhQhD4NsueAMn2jNTMg6gf80
 v/+eDAv09LHqzUSKHSTDpIEtHhsZrT1EwYNnrv0/lLVIruTJ6M0NvSunSg+gF/Y8rHpP
 9tAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698750399; x=1699355199;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=wFJAz4K+qfoI7oxuIztYbc0PlUD3sJ/KSADLnFFqx2Q=;
 b=Qrg2uw7g/R/9hv0SafdI4UiL/eq8D1BPQpglCvh1gzLD5q10wNFptDwqsZdFYYrQ4n
 8dyIwoP/oP2LAfHZ/xwLdHeY4+4U3sOIP8g6F5X65iJmwcQ2CGNV/m7yvXzCyftL5XAA
 i3wopm0u0TVJmJ9LtB6qyRlRpLGGdET7qQyotDQr8xOvanxl0UDNpyBJRIdjw9afneF0
 8Thc5mIiiyISKXFhehbBIHfD/TBL1wlWr56kmNxokSuJmzXui+MEIYpR6YqqNitIuwxb
 L49VndOvr5QvSEyxTazxvFDlfDK9964DCIf48AgQfAZdOb6bYnO0WNOT/WSW6ihNn/s7
 ssmQ==
X-Gm-Message-State: AOJu0Ywcy90NkA1P1BaPl073Zk+CnoGjTMxUSdSAEBFOj2lQlV2WApWC
 kFTlbFMnF51wyIolU9qKgJeEeBHK18GKalCd9/sj1w==
X-Received: by 2002:a50:ab12:0:b0:540:911b:72b1 with SMTP id
 s18-20020a50ab12000000b00540911b72b1mr2064670edc.7.1698750399080; Tue, 31 Oct
 2023 04:06:39 -0700 (PDT)
MIME-Version: 1.0
References: <20231029210058.38986-1-marielle@novastrider.com>
 <CAFEAcA8ELCiGy3jDKjJhAd9Zn7Sse9ZSoJ6uQ=u4ROvV3rNcyQ@mail.gmail.com>
 <7DBF1391-69C2-4FA7-BB3B-378767DF42D4@novastrider.com>
 <834B7660-49CF-4704-9AE4-EB18B374BCB7@novastrider.com>
In-Reply-To: <834B7660-49CF-4704-9AE4-EB18B374BCB7@novastrider.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 31 Oct 2023 11:06:27 +0000
Message-ID: <CAFEAcA_JsEB1DZCt=v5h-TAdQi_OsfTdyXjnK+xBaZV3U7Z0pA@mail.gmail.com>
Subject: Re: [PATCH] linux-user/elfload: Add missing arm64 hwcap values
To: Marielle Novastrider <marielle@novastrider.com>
Cc: qemu-devel@nongnu.org, Laurent Vivier <laurent@vivier.eu>, 
 "open list:ARM TCG CPUs" <qemu-arm@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52c;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: p0NgzC8PBUme

On Tue, 31 Oct 2023 at 09:23, Marielle Novastrider
<marielle@novastrider.com> wrote:
>
>
>
> > On 31 Oct 2023, at 00:56, Marielle Novastrider <marielle@novastrider.com> wrote:
> >
> >> On 30 Oct 2023, at 09:52, Peter Maydell <peter.maydell@linaro.org> wrote:
> >>
> >> ...but we don't implement FEAT_MTE3 yet. We would add this feature test
> >> function, and the GET_FEATURE_ID() line, when we do, but we don't
> >> need it until then.
> >
> > Understood.
> >
> > I made this patch as I noticed the discrepancy between cpuid and hwcap output.
> >
> > The following code produces the value of 3 on current master, which would be erroneous if FEAT_MT3 is unimplemented:
> >
> > #include <stdint.h>
> > #include <stdio.h>
> >
> > int main() {
> >    uint64_t aa64pfr1;
> >    __asm__("mrs %0, s3_0_c0_c4_1" : "=r"(aa64pfr1));
> >    std::printf("%lu\n", (aa64pfr1 >> 8) & 0xf);
> >    return 0;
> > }
> >
> > I can submit another patch to correct this.

> I note that commit 86f0d4c7290eb2b21ec3eb44956ec245441275db suggests that FEAT_MTE3 is already implemented.

I'm sorry, you're right -- we have implemented MTE3. I was
confused by the lack of an existing feature test function for
it, but we didn't need the feature test because FEAT_MTE3 only
added behaviour to previously-reserved values of the TCF field,
so we allowed our behaviour on non-FEAT_MTE3 CPUs to be
"happens to behave like FEAT_MTE3".

Your patch as it stands is correct, and I've applied it to
target-arm.next. (There's a trivial conflict as a change has
just landed which moves all the feature test functions to
their own header, but I have fixed that up while applying.)

Thanks for the patch!

-- PMM
