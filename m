Received: by 2002:a8a:1930:0:0:0:0:0 with SMTP id be48csp468978ocb;
        Thu, 6 Oct 2022 06:17:04 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM7NTu5urmBGpkiQjKDYcE+CjnjZJi9q58+aQzu8bhP0rF+p+h9zGrNvMLHIINV1WvgwUPfp
X-Received: by 2002:ac8:5d91:0:b0:35c:dfee:b28b with SMTP id d17-20020ac85d91000000b0035cdfeeb28bmr3273865qtx.459.1665062224822;
        Thu, 06 Oct 2022 06:17:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1665062224; cv=none;
        d=google.com; s=arc-20160816;
        b=OLdA/xf62uT7dktOeHko+UVD7AzG37ocSvQi1NA4YJTJ9SxoZsGl35QvbSpuyR98wO
         rxwsEB/OVku66Ogg+riapHm/+zLFxzUGdUyQVSVlNHlkFjLsnwenxakCDLuscLbaHeUi
         /KXtcpF72edCZjdRJISN6Os0y34RofOVjgsw+Xd80Wk8S1BCLFMKy2i3aKDIwtV/f7Dw
         wYKXC1Lvk5P/FA0hribB9JkxtC8CeSqbLdKRH1J97cOHOUycyyeh5SEjCCvsL1I64q8m
         5jkGrGwLojOKXpLqM0ZcfBMVelS2FNKsf2XyXt9ya+sosh4w9kA1NxAJciRDnTw03TCc
         043Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:cc:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=2I99ksWFeoPKPyLJ3JmpEldStn68qCYKtSieEF5FCyU=;
        b=08tActkIG+0mZXyUJbxPUXcLP/fdYxHmkdCe3pjKTvgv71Obw3XmMhLWOQ52D+oVj9
         WMktQtUvBTMM2eRo4uxjcLNhdT/qy60jlHMvQ1TV7wmg8nmSs8QXsjQivmyYaky9TFfr
         kuiDcZdZdAIYS3hGk3lEM3bT39L5zWrSVEKwJP4Oe9G9lP5Kv7Jc4aQDud/hTIxmjRIe
         V3z+EbD/nJE7ujxJU+1/lISSQADfdGcGiqqtG0P0dbS/d4gdzDEWZEq4FjxyBB6Eq3dp
         /DwZXnwqeKDO/ajWYxL/GfZizObupX1yNfZIuz3jAOkKnzqBqNYTRvYBDNwkabHHj/hB
         DmHg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=NPcrlabu;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id r9-20020a05622a034900b0039368f72e7esi1464647qtw.695.2022.10.06.06.17.04
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 06 Oct 2022 06:17:04 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=NPcrlabu;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:57278 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ogQkK-0007We-BT
	for alex.bennee@linaro.org; Thu, 06 Oct 2022 09:17:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40790)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ogQbu-0007Cc-O5
 for qemu-arm@nongnu.org; Thu, 06 Oct 2022 09:08:37 -0400
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e]:34490)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ogQbq-0000GX-Hz
 for qemu-arm@nongnu.org; Thu, 06 Oct 2022 09:08:20 -0400
Received: by mail-pl1-x62e.google.com with SMTP id n7so1694880plp.1
 for <qemu-arm@nongnu.org>; Thu, 06 Oct 2022 06:08:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=2I99ksWFeoPKPyLJ3JmpEldStn68qCYKtSieEF5FCyU=;
 b=NPcrlabuO/HadxG8ISpu/B99RlWt6vE3WPilombiyJHnB6h+wQEJX35E+gdLkNalC8
 CqolnaOQ2Xn7xIXYGhgeNcdrwHO1c3N358atl0iiTQBb5IWbqK35HJh4wqQpSV9RVB9/
 XDEOQX7MuiU5JtGjpydo4X3KhugiLEwETdYinvN1IyQSCszC1Ypj5usGsoCPwf274tRu
 SdKeYtQCaetd/HFTQx6eT2OQsMjTy2mQK7dvTpHLoOfdJCMiVvX2vJmTB4m1loOAmpq1
 eT7Ej7ZaX9JHrI/bnjWIOkHddkxvuH1AFgXBiw6Bp8LHDHPTJZsp5ETiRFPwoOsQM6+4
 wk7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=2I99ksWFeoPKPyLJ3JmpEldStn68qCYKtSieEF5FCyU=;
 b=AK6EwHWe3DeBkSM1oAlx6gxTEFqEcRG864n2Aopsk4/LdbPbbKf4iFjtsHkN73vR9z
 PGx7tpJn/wUGQN3tk8c2eaKfmY5yQ0o7OrtNE0E7QibYEi5la5SXqfFGM1hLO4ccg51q
 kSJ268FjSq+3+rPhPF9REG4UWFYqFYlSzAUWePJqOvskJ72cFpkCYNUorLT+ecO71tnJ
 +WwfQq0uCe4UlEk4jyXgZHZmWbzOwSRERGEtaCo3mBO/oo2LLFmL2t/z4CkMvHKwYtAu
 lfU/AG0VVAOCFS+2LbGuuTO9NfJ/IAplZt7uC5xk1Au4qHQq+mrcCXfjsEqDX5TR34LW
 bKXA==
X-Gm-Message-State: ACrzQf3inS4j8gGvPKenVldiKm89+PqYIYl/5yKw2CAem+kexkQzDQTk
 5dibpCQzFeWPsdnvMUSK758OIfBGnQM9+7Jmw9TA7Q==
X-Received: by 2002:a17:902:7c97:b0:17f:5abf:9450 with SMTP id
 y23-20020a1709027c9700b0017f5abf9450mr4667809pll.19.1665061697030; Thu, 06
 Oct 2022 06:08:17 -0700 (PDT)
MIME-Version: 1.0
References: <20221004050042.22681-1-joel@jms.id.au>
 <f98d71c2-994d-28d5-b5e0-52913cc656df@amsat.org>
In-Reply-To: <f98d71c2-994d-28d5-b5e0-52913cc656df@amsat.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 6 Oct 2022 14:08:05 +0100
Message-ID: <CAFEAcA9d6TyPMWownfBmawo+Ox6d3y2FbBn0=OPFZvu5ghxdgg@mail.gmail.com>
Subject: Re: [PATCH] docs/nuvoton: Update URL for images
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Cc: Joel Stanley <joel@jms.id.au>, Havard Skinnemoen <hskinnemoen@google.com>, 
 Tyrone Ting <kfting@nuvoton.com>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::62e;
 envelope-from=peter.maydell@linaro.org; helo=mail-pl1-x62e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_PDS_OTHER_BAD_TLD=0.01 autolearn=ham autolearn_force=no
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
X-TUID: oQbW/yWWqPrc

On Thu, 6 Oct 2022 at 12:29, Philippe Mathieu-Daud=C3=A9 via
<qemu-arm@nongnu.org> wrote:
>
> On 4/10/22 07:00, Joel Stanley wrote:
> > openpower.xyz was retired some time ago. The OpenBMC Jenkins is where
> > images can be found these days.
> >
> > Signed-off-by: Joel Stanley <joel@jms.id.au>
> > ---
> >   docs/system/arm/nuvoton.rst | 4 ++--
> >   1 file changed, 2 insertions(+), 2 deletions(-)
>
> Tested-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>



Applied to target-arm.next, thanks.

-- PMM
