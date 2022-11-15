Received: by 2002:a17:906:80c3:b0:7ae:d8f:8937 with SMTP id a3csp3739706ejx;
        Tue, 15 Nov 2022 08:02:37 -0800 (PST)
X-Google-Smtp-Source: AA0mqf6ux1UGGDlg01rUiIbhDe4wNnwYCG6+2rMgtMciykIJNl8Fa67N3zncIuKbz1XU0YHBVYTI
X-Received: by 2002:a05:6871:284:b0:13b:c794:18e4 with SMTP id i4-20020a056871028400b0013bc79418e4mr760121oae.122.1668528156941;
        Tue, 15 Nov 2022 08:02:36 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1668528156; cv=none;
        d=google.com; s=arc-20160816;
        b=ydEjn7icEV8wu2oodRRG7QsLDa67CiwSW7e/wlSvBP2GKf5hoFGixYByA1niH18vw+
         V2vH6XiEROqpbOH/4TuZfL9TdUtuABTC7RqbmGuR5b9qbyH70oer4TrHBUacy92VHEme
         9WI3ILpES4HN3DLe93dmv0nd+NhZuNOuv+ixotI/pQsDSLgCRaq8C+WmlH7EVzhR/w/9
         gbgoOThmzhyzYoan1/iH69x9ev5e6GXVBJgJq5evjaoN4WoNU5J9RJTWkGkLsJ2ZoT7I
         yBmfIgg4yz+Dsg3x/cIk+8Ytc4WMYbXM8wb5mMRW3viTe4gOchkwR4EqTCwDg7uRa6Tt
         wMNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=9ZxBXQSyuqkkxQIJknN3fHMFrPp1FRL5mhjUM6c3Qsg=;
        b=Hrvk+e+0VBL8ee6MlbR5RCShgzkcIGDmfMTQXbVkQkfK4nxO4184Z2ClWOEMKFgr4Y
         SyL8L27lPKoCFJQpmZd9YG28UEl5LJmMQmtuf1bb+GKG7RYm8wbkrGX8uNLPEltLVHE2
         bvyslSMO5wdFGQy2UtAvBYDgxt3h7KCoAxicE4s0QGjjdZ4cuKkIjdXLl3xcHl/5wQ3F
         U23VYlwsYDNxmcmJj+a0Yxi561eXQwR8M8431pCvEtnH0toXyClZ5MJGYOd9n1mc3I+g
         YC3DF1/pGJufdtEgmToAkB62wzQIaI3Vi6ldcXwOglb25nhcIQEzyU3Yjmyw3MAVmGGQ
         NiTA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=vtz3E5b8;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l189-20020a6770c6000000b003a9db3af50asi2455912vsc.466.2022.11.15.08.02.36
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 15 Nov 2022 08:02:36 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=vtz3E5b8;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1ouyOO-0000iF-TU; Tue, 15 Nov 2022 11:02:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ouyON-0000gq-8N
 for qemu-arm@nongnu.org; Tue, 15 Nov 2022 11:02:31 -0500
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ouyOL-0004qd-NX
 for qemu-arm@nongnu.org; Tue, 15 Nov 2022 11:02:30 -0500
Received: by mail-pl1-x632.google.com with SMTP id k7so13554562pll.6
 for <qemu-arm@nongnu.org>; Tue, 15 Nov 2022 08:02:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=9ZxBXQSyuqkkxQIJknN3fHMFrPp1FRL5mhjUM6c3Qsg=;
 b=vtz3E5b8a1cWhSAbUrQXWXAVLltQV9Q1tjRHpTFHXQMxYKIFvEMZwucAN8s3HUKWVH
 ySX6Tq0Y8OtbgOI7QYGgkQAE3jcQ7+bSLdn8Z446lvlmVkKJGWqcUb6ehM1c4vXOub3r
 vZ/Lo08kKZNpN1NYar8B1FKNI0UuucrS1CIZduSDBVnt1zc6McIo5qT1tNV18/oYm1Qc
 0RI2+AHdxsQIbjNg2bOmvQ2ZcoUpu5b+2k6fJ3uXez33VuSefnsAWZNKVdAFTIRZOAQO
 zwPdxPeSaL7vnLkQtOUOQSIsST1mOP4Up2JRh3b2zQKLWn09zSU4Pj2ZribMrZc7429c
 Yyvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=9ZxBXQSyuqkkxQIJknN3fHMFrPp1FRL5mhjUM6c3Qsg=;
 b=c+g0126ZquAG7RmZ6iTYk7sNyyUOAPMaRT7mSpFyLFB0+RhuVfx5n88ZAurf1oHpuT
 nCdb9elMiUtBuOUf78AP6pj67yUwH3pynvDawRmwjE210AdkUrQaM44KQfOTKaEFIZtd
 PbDfNWGfMJpJKuWyCwIdoBKdGJDYBdpLE6raJoBIzPdSg7d/L41BB1NKt/HjBjBr9S1w
 A4JaaF7Z6O5FED4bhi4hpMkaPMJ4cGKoAdm6GRM9MPt0NQvrTfElqVCpuKxgNSjM/NlX
 pzK0lqND5642oBPUvVQAhRxtf0cA1deg+4A0ozGJ4yoiYJ558bYtsn+jRzXJCBBb3KOx
 oHlA==
X-Gm-Message-State: ANoB5pkHRH33vp5CX5BfBUfLA/lZrgDySuAVUOeWoBdM9Vsap9ZWyEMi
 MVIev8CvCyAO+8DCxXIkU7u+Y3ozwPTsLs6xe3NWfw==
X-Received: by 2002:a17:90a:bd0a:b0:212:f169:140e with SMTP id
 y10-20020a17090abd0a00b00212f169140emr2807659pjr.215.1668528148065; Tue, 15
 Nov 2022 08:02:28 -0800 (PST)
MIME-Version: 1.0
References: <20221112214900.24152-1-strahinja.p.jankovic@gmail.com>
 <CAFEAcA_F0jcjviRGjgmb4J_Kos22+UE0vPbcXoTbPCP7xz-nXA@mail.gmail.com>
 <CABtshVRnwQiTypOFaOqVE69+1wbVoVJEy_x7ELez8Mo6aXT=Yg@mail.gmail.com>
 <CAFEAcA-s9a2zCy6O0j6=OXZOcYbj=_mS=aa2vxbKbuSMKNjMoQ@mail.gmail.com>
 <CABtshVRjHMwoN+itKsty-==J8OpZFzuGUB5SsJ+UFPrZ97d6uw@mail.gmail.com>
In-Reply-To: <CABtshVRjHMwoN+itKsty-==J8OpZFzuGUB5SsJ+UFPrZ97d6uw@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 15 Nov 2022 16:02:16 +0000
Message-ID: <CAFEAcA9e+--A-8-1S-sgvEhCwhsMB3ALAN3XO5NTKs+B7R7fJw@mail.gmail.com>
Subject: Re: [PATCH] hw/sd: Fix sun4i allwinner-sdhost for U-Boot
To: Strahinja Jankovic <strahinjapjankovic@gmail.com>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, 
 Beniamino Galvani <b.galvani@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::632;
 envelope-from=peter.maydell@linaro.org; helo=mail-pl1-x632.google.com
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
X-TUID: TNXydYyJCY65

On Mon, 14 Nov 2022 at 19:22, Strahinja Jankovic
<strahinjapjankovic@gmail.com> wrote:
> Ok, I will start preparing that separate patch for error logging for sun4i.
>
> Since this is my first time submitting a patch, is there anything else
> I need to do with this one? Thanks!

No, I'll take the patch from here. Since this is a bug fix
and we're not yet at rc2 I think we'll be able to get it
into the upcoming 7.2 release.

Thanks for submitting the patch!

-- PMM
