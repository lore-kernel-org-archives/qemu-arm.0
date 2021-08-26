Received: by 2002:a19:5205:0:0:0:0:0 with SMTP id m5csp629058lfb;
        Thu, 26 Aug 2021 06:48:25 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzjpLE4nClJZrjfuUuHIjxMaO6r3LiXzjWhagzSV16zcnNlITpWuY3Rh+asB6xRCWJcV7UH
X-Received: by 2002:a4a:e085:: with SMTP id w5mr3196468oos.89.1629985705769;
        Thu, 26 Aug 2021 06:48:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1629985705; cv=none;
        d=google.com; s=arc-20160816;
        b=CWENua2v4OYOpNHzYxqs0iWE6QAlAbEOQCtulSsImoxRmzUu/o7Jjl+KDUsDGWn+ti
         1KtggzRpPBWuLK0WoYzM74pjtzORAQArW87jg9evRF8dMdwmpNIjV4BsqFAdmoqC+y75
         JYbaj3SfX9lFJwpp/t2pqPgXU3PsWkDP8az85UU6W+6lXrb0jK/uJlIbUxy3nec6ssqq
         GDKaG4oQUJUW0jcN33L7UWxJCTMRBpdjfMLz8APOoN3Iewr0s9j5H7gJ+WaEjNLGXM8W
         PvO5xKumaFYBMDChBV9I4dEomlXDCtPnJKMFwMDxKNjnuq6/A2ZGCEAypFF5CmuUkI/i
         zBzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=OVWfDsVaV5t53ZokKe7R9bEkloebB8cnpF/r/G9b7oc=;
        b=ZxB16QYsg9kbSPnjOLbKWFyzzWOR7ZZJ31a77R2HQC5IwPEvAcByGmMNOQf2tMsSG6
         Rf8Ds/nG3OSfYIjMLjtEpqEToSPcy7IIPEIoqktk7qJDsFb7qaFVIy1yJ76Jmyq664+F
         Bu0RsvW5eqjlStnKt6KTJY8fW/C64s5MlMasAkBWzIMmV46flQC9A9ghdbpxzA21FbYN
         gSMbjlkdRaA12LXxhkMkhybPmFx7pvkpLZiOxu5hAnkn9h8vSSlwJ3vgMOelcMDlKXTr
         STALPlsB60eGcrgnXpQUnzdq5u08t4v2wotrQOAPeq41akvzNEKVw1kiXgR+jrdQP5Bo
         yLiw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=JaIDUOGk;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a23si2522403oie.46.2021.08.26.06.48.25
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 26 Aug 2021 06:48:25 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=JaIDUOGk;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:47060 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mJFk1-0002fu-1F
	for alex.bennee@linaro.org; Thu, 26 Aug 2021 09:48:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58512)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mJFiy-0001Hf-UD
 for qemu-devel@nongnu.org; Thu, 26 Aug 2021 09:47:20 -0400
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533]:42929)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mJFix-0000jO-E8
 for qemu-devel@nongnu.org; Thu, 26 Aug 2021 09:47:20 -0400
Received: by mail-ed1-x533.google.com with SMTP id z19so4740822edi.9
 for <qemu-devel@nongnu.org>; Thu, 26 Aug 2021 06:47:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=OVWfDsVaV5t53ZokKe7R9bEkloebB8cnpF/r/G9b7oc=;
 b=JaIDUOGkdrZtI7eEUYK9LMse3lEcj5KAOpfTQ+Qitf9dV3VeaM2Svcw2G4nrxJXsIu
 vDKTrJ93NcvG2Nj83hk4SHp/U8GtfyN8zf0O+BjDqJARj46YPIK9cSb6yvSw5UaUmpC0
 RWjhoK7OdbEti7yn1y4ykrYTCzyPhrsK2kKEOCHQ+pppyeMHgtG//IJQCpZSPlhb/tXj
 xOirW/q8RfYhhvJDSnLAu05gzxqA2vTGzO//fiSKP+579Y9mpTGzr4jHxSF2ug8J98C6
 SBxhlNiQKl2WhEsRVK10fYi1q7XFKDugB1UtorNNyrazVi8avcYEZ6tOZnSj3nLgHq8S
 9eeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=OVWfDsVaV5t53ZokKe7R9bEkloebB8cnpF/r/G9b7oc=;
 b=MKZB07TluRtpAgR77G7CY+x6SFfcftJvoAU4qXybJnb9B8xVHChJpH6HdPsDiG4JSR
 wV+c4HAdX1GyOZh2PMOXa7KtqT3L44rL3BvvcrBluOIfOoxvbzGfoBRasO7qnjSDFucm
 1oxKISR1BXTChFtCYBs2XB1y3f0kZFhsboSpUk75T67TeedDe8Lmy7/q000wHV2tfMOm
 iNec4FIak2JoTCeUsNQ6J8rik4uwtE3U8uLazasyg8hS2txc28p/cI5WZ+E8QoseE8Ln
 oRtO9LvB8lWHHLA6GO6SR0SNf9dlTbhgAQp/4niOH/fospxJwcS9YNJhG00iTpDSnjWD
 qSxA==
X-Gm-Message-State: AOAM531GKrXhwaP+FAGZkBZ0M46pRYzlF0cXNXobms6eSWfLPhNnusSM
 Y+5c/N9Hz6P9rnmC/B/r/pCTrJRqrNLW5nedM60wMQ==
X-Received: by 2002:aa7:cc0b:: with SMTP id q11mr4258175edt.251.1629985637414; 
 Thu, 26 Aug 2021 06:47:17 -0700 (PDT)
MIME-Version: 1.0
References: <20210821195958.41312-1-richard.henderson@linaro.org>
 <20210821195958.41312-7-richard.henderson@linaro.org>
In-Reply-To: <20210821195958.41312-7-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 26 Aug 2021 14:46:30 +0100
Message-ID: <CAFEAcA-9ThC78GAeTQwEBADAfjcz5HYZwKT9ttMfzyQ4J4aqpA@mail.gmail.com>
Subject: Re: [PATCH v2 6/8] target/arm: Assert thumb pc is aligned
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::533;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x533.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: u2YhYnpJ/3G4

On Sat, 21 Aug 2021 at 21:04, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Misaligned thumb PC is architecturally impossible.
> Assert is better than proceeding, in case we've missed
> something somewhere.
>
> Expand a comment about aligning the pc in gdbstub.
> Fail an incoming migrate if a thumb pc is misaligned.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
