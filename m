Received: by 2002:a17:906:dac7:b0:886:babc:7eeb with SMTP id xi7csp1991215ejb;
        Fri, 10 Feb 2023 08:02:33 -0800 (PST)
X-Google-Smtp-Source: AK7set/6yzP+OZlHM/l8aFvrxWaQne6bScTXDzwMFmzd1en9LKg8snwijRffKFdXbLf9WlKoNRve
X-Received: by 2002:a81:d803:0:b0:506:e5b5:4f5f with SMTP id d3-20020a81d803000000b00506e5b54f5fmr10242485ywj.0.1676044953151;
        Fri, 10 Feb 2023 08:02:33 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1676044953; cv=none;
        d=google.com; s=arc-20160816;
        b=J06vpxs47MNNR7uWFmFKlOZzV7VgxOWhTJtcvLWaqruQGZ4trGooFgIQaOLb2oTZLz
         8dOHcZxBMQzgM/NGl0aB1QvQpbQQ8PixP9tRdFgM2Z8aFFLtPiDuNZE4MvUg2xv9Fu6i
         ui831Prijbr0dla/G/ZjYCTpv/I8ymL2flDQxJKXbBjqF7dHpc/XA/1ToruvMML1cmam
         TeQvslLm8QofPYjxRYy3e3Meswmi2DkdQzePGsFeYN0T59XbaCbN9avCXeMeMQRIbEPw
         MsLlDr4nfJH2F6kzW5sfT+L1N7wTVn3kO/KqOJJIgF0BQOKFcmbV69vvY1cR21BlAmWe
         /d8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:cc:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=TORpY+CV4pZM0oxj7Ob80QOc34Qbno2BF1gpgA/A9PU=;
        b=HcZBgnSA69pGHuk4lGpyivQu8/oc/xDZyz/UuPKVzEM72RKEORBIpaYkgnxPRPZ0uo
         Nu6J9psr/jWOgxCZYCOnAmfOST0lN1FEz7Vj2kcBztzHDiqYXtDu7jLz51jIKPl8hAut
         ULDLpH2rHl5npsrpqB1fqaAnJ3DGQ63soyV6gXmhKVksCiS2wYXgVUb60Nc8t4GwKl4K
         8lgOAYaIRWp0PzS1KNp/SGZ3a4EgFRMIlfpgzKEhaFcoPzbbn1Gu1Go6266rIEousVpm
         E1014kHxTEdzpvetXim/OwgeT5FhHrPKF4A2WP4cRiafmGTJhfkYlRIL+/A0ld3910yT
         hOcg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=R3fea7sO;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id r203-20020a37a8d4000000b006ffb7e57ba6si3943621qke.238.2023.02.10.08.02.33
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 10 Feb 2023 08:02:33 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=R3fea7sO;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pQVr0-0006G5-Nj; Fri, 10 Feb 2023 11:02:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pQVqv-0006BD-1x
 for qemu-arm@nongnu.org; Fri, 10 Feb 2023 11:02:21 -0500
Received: from mail-pg1-x52b.google.com ([2607:f8b0:4864:20::52b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pQVqs-0001mz-9W
 for qemu-arm@nongnu.org; Fri, 10 Feb 2023 11:02:20 -0500
Received: by mail-pg1-x52b.google.com with SMTP id v3so4014607pgh.4
 for <qemu-arm@nongnu.org>; Fri, 10 Feb 2023 08:02:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=TORpY+CV4pZM0oxj7Ob80QOc34Qbno2BF1gpgA/A9PU=;
 b=R3fea7sOdlptBe5Rph6s8IGQgZqW/mUm37+zJ4DCKC73JnWfrEKuZCWcYrxnZFpxpu
 etCzs1gASdLxNmW8s4pVp2RQMJws84eO4DGja6UlrAlqIhWMKzZ/JKayaXYT1lmFbdxb
 FkUlN53xK5V2L4AZK7SzxsaI2/E0vcOaGRhQhQJTsA+Xb7j292SH29CLGTNbU19Juno2
 2KWz7jfvGPoZyIdgTN5ONc5ELyewCkuGWmdUco4NtHzmGoL38Ip0typjnQBr5HUeDVgK
 l2IFG/vppPDdSyhfVTqAxYL81w8dxvC15S49cEangYC0LLkbNyHXKZ5TmoG4MPX3w19I
 nLVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=TORpY+CV4pZM0oxj7Ob80QOc34Qbno2BF1gpgA/A9PU=;
 b=uk0WHnANMlO0EDqe0vw42Ohsu48HDMaeamQ5EEEuyICCL79Yih+yoW5SIcDaegkP4m
 f5GF8xNUDEPhgxw7IYPjJzVdjrwL0CDbVTBBRelT3gVT31j2DDzK7u5ywhFMc4o3jvkG
 rdppqNpOSIR/E1Iecmo4zHbnWVKxG78c4GM6Me0QNuFwy1WBfp2CZQqydST/5yXvj9GR
 dk8/IAoCieFO8CIDT+NQifVvh+Qul9TCUb95kQ+3qcOzoLzEycUEJANSCmAcCqqKT7iy
 nTY/DJYK51vjNQicaB7tC71aT618ou/7vWZYLWkNmwrZ9N36w/nCbT+pHUCV3jCtFB3f
 PDWw==
X-Gm-Message-State: AO0yUKU5YEIPMR3dcdZZB7GexPNynHEWzuCTkZUQ2CNalqQOWDGAptKr
 soDnGxsOTU1qHh1lIoPBdMmTUtclXr6F7VMmSZPSEQ==
X-Received: by 2002:a62:53c6:0:b0:58d:a84a:190b with SMTP id
 h189-20020a6253c6000000b0058da84a190bmr3420526pfb.48.1676044936361; Fri, 10
 Feb 2023 08:02:16 -0800 (PST)
MIME-Version: 1.0
References: <20230206223502.25122-1-philmd@linaro.org>
In-Reply-To: <20230206223502.25122-1-philmd@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 10 Feb 2023 16:02:05 +0000
Message-ID: <CAFEAcA_o_aoKpSeR-YFj8xPsdHR6GUgvBtYF-iTO0+qnYi7H+A@mail.gmail.com>
Subject: Re: [PATCH v2 00/11] target/arm: Housekeeping around NVIC
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, 
 Laurent Vivier <laurent@vivier.eu>,
 Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::52b;
 envelope-from=peter.maydell@linaro.org; helo=mail-pg1-x52b.google.com
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
X-TUID: ED7vyWUu3w7p

On Mon, 6 Feb 2023 at 22:35, Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org=
> wrote:
>
> Missing review: 1-3, 5, 9-10
>
> Few cleanups while using link properties between CPU/NVIC:
> - Simplify ID_PFR1 on useremu
> - Move NVIC helpers to "hw/intc/armv7m_nvic.h"
>
> Since v1: addressed Richard's reviews
> - Do not restrict v7-M MMU helpers to TCG sysemu since they can be
>   used for user-emu. Hardcode ARMMMUIdx_MUser
> - Convert CPUARMState::eabi to boolean
> - Split 'Restrict nvic to sysemu and store as NVICState' in 3 patches
> - Dropped following (RFC) patches:
>   - neg_prio_requested / unrealized property problem
>   - use object_property_add_const_link()



Applied to target-arm.next, thanks.

-- PMM
