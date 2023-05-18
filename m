Received: by 2002:a17:906:4810:b0:965:a47e:1721 with SMTP id w16csp374099ejq;
        Thu, 18 May 2023 03:14:49 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ7lup0qo8BJ/ExPy81br+bjHFnGp2jW8P5tt7MbGXgEQMSVvuxWUB26o9EIDkmiQrJD539f
X-Received: by 2002:ad4:5e88:0:b0:621:363c:ea9f with SMTP id jl8-20020ad45e88000000b00621363cea9fmr4696524qvb.19.1684404888999;
        Thu, 18 May 2023 03:14:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1684404888; cv=none;
        d=google.com; s=arc-20160816;
        b=0gTpv56BogOFSydA1e381b6wB6cx/NrxIIT6dBM+ZfLOmVW4Cyv/PGNNsSdYqSgtW4
         4e0cntQbgK3q0QL70tOeSCrJ7dAkOE4S+tKwiFz2lIg+eo5Z52TZoPojK+tqqenJ6z0V
         OMfIEbCk6L8KtUcf/Nk1Uj/ZOTAiH3E9QFqIrpjiw6BhjdptW4w2LZXsFTjXoNpbHBqq
         u3yTy66ORHEHfrw5wF3bxOavnXg+R80M2lBhuUem3CeTNK2BsidTSI54ePN4q9iQylhR
         yvmwwtSf0Fbvpi0/dM5jNfNOZYysPlB1gO5uI0kaEjFJimArRFwrXp7phs6qlwr8Qp8F
         H7Og==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=tykwjg27hapnRImi6qarWqlaeMlnB1oJTRTSY29t998=;
        b=xs9ZSqX/hv24lYhLb2qk/iuN3ZJbvdaE6bcSIqJ0BA1jRKgbUc0iBBWrotkXnDQpL7
         K2+bZ9g75KQkkHjqQSgfiQnaZ8miAJib27U7FJ3jUe9/WSBBz37OcsUOAxgZ+3kTNWqD
         /i1DJ/J8/RpV1opX+SGJzuqZZ9wSLnZ36xmIiQbQaAq90Nbjo3MYR6KiVoj9UNIvufDh
         Pfru3DV3nqHAmWfAtTtDpTm4PPmRXOlzzGn7FNNgULcKe5xaEg5QMgEKFXgeznYlzZRY
         gVYDsMhJDCiFhSVuyq7z6ezVdmEorKTPEWkoFCk8SVowD7FRfcr5x3N0ma6Lo2JznB0b
         lBOQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Njrm0N7u;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d2-20020a05621421c200b005f644c4af6dsi925073qvh.513.2023.05.18.03.14.48
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 18 May 2023 03:14:48 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Njrm0N7u;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pzaea-0004VB-DI; Thu, 18 May 2023 06:14:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pzaeT-0004U6-8M
 for qemu-arm@nongnu.org; Thu, 18 May 2023 06:14:29 -0400
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pzaeR-00040o-Ib
 for qemu-arm@nongnu.org; Thu, 18 May 2023 06:14:29 -0400
Received: by mail-ed1-x52a.google.com with SMTP id
 4fb4d7f45d1cf-510e682795fso876203a12.3
 for <qemu-arm@nongnu.org>; Thu, 18 May 2023 03:14:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1684404865; x=1686996865;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=tykwjg27hapnRImi6qarWqlaeMlnB1oJTRTSY29t998=;
 b=Njrm0N7u5pqaqM6QCFd79gbuBZ2IVG959L7XvDF50mRg+OC3BeXTHmL0iZV+26aNwn
 d26NXRk8TgVsbR7duNJFb8lQbdsyuPnmKhWVk+j4Jd+HZEoRsspXTb+oiGwkERsVoQWT
 RIy987i/YXm9+bKWJZD4aHZhg560/dG0G8/DV3wKIbFvd3Ul0Wl/SxlPZe9jl+t6ck/M
 4UCjnGYv8BuNezYkEauEVruEr8T12Wr0Tw3KjTdE5KAoOm+hF0WKMS4uzuOyl3zT4k2g
 OJf1ZmD8rdhFMiDe6IAUaWXVAenxkwDdRpNUCQ/6P1jGSZ1oSeN7lx4NF8FjcfQU3LTq
 3Qow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684404865; x=1686996865;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=tykwjg27hapnRImi6qarWqlaeMlnB1oJTRTSY29t998=;
 b=lKvEg0Z1o4x6zRICVKVsggdZQiNykkQ/An/XLFb2mw5bmf5ebaLx8yqS5lgY/XNC8U
 S4f4qY5f5HNFlJHmc2n8afYXGFjJXMPqlUz8gQbfo3GAONT88WVbgH5t6laL1cqXBvbL
 BXPD3xkYqGF2vAb70KRjgU5xCJEeljw20ie/Ggy2gfGje5eqeioN4ZTSWqmfd+YmEd4p
 SwNFCpWa1/zT7Jlvvpu4NPO7gii2qDngMBKijoobSmHUu7qAUw17hTr7wjIABaEKvmO8
 TM94Sj67lY7uO5R4Ze7KOGOdbbrjZdo7buLqC7w7+5uNslVC1dqyRHwKMZJBPHT8PwLx
 WheQ==
X-Gm-Message-State: AC+VfDww14Z++4PSnTYaodFxmjbfoImo0DqpOzFhwvyhQEPH6Q9lLxkc
 QWamtIOnI5Aujk71fkLqryOFwZWHgCWHfLJcZy/QSg==
X-Received: by 2002:a17:907:3202:b0:965:cf39:ed7a with SMTP id
 xg2-20020a170907320200b00965cf39ed7amr44676570ejb.56.1684404865569; Thu, 18
 May 2023 03:14:25 -0700 (PDT)
MIME-Version: 1.0
References: <20230505120936.1097060-1-marcin.juszkiewicz@linaro.org>
 <1d08d306-a4ce-5744-b1d0-90d17aaa4f02@quicinc.com>
In-Reply-To: <1d08d306-a4ce-5744-b1d0-90d17aaa4f02@quicinc.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 18 May 2023 11:14:14 +0100
Message-ID: <CAFEAcA_-bpDfX25tNrtkn+me=jyeqt5p5SZUJwr0NOt2dUo4Lg@mail.gmail.com>
Subject: Re: [PATCH] sbsa-ref: use Bochs graphics card instead of VGA
To: Leif Lindholm <quic_llindhol@quicinc.com>
Cc: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>, qemu-devel@nongnu.org, 
 qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52a;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52a.google.com
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
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: UYsVzK0NZMwl

On Wed, 17 May 2023 at 11:55, Leif Lindholm <quic_llindhol@quicinc.com> wrote:
>
> On 2023-05-05 13:09, Marcin Juszkiewicz wrote:
> > Bochs card is normal PCI Express card so it fits better in system with
> > PCI Express bus. VGA is simple legacy PCI card.
> >
> > Signed-off-by: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
>
> Reviewed-by: Leif Lindholm <quic_llindhol@quicinc.com>
>



Applied to target-arm.next, thanks.

-- PMM
