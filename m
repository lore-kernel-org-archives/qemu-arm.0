Received: by 2002:a17:906:4810:b0:965:a47e:1721 with SMTP id w16csp6592182ejq;
        Mon, 15 May 2023 08:28:32 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ7/qH4miradlYh3mZBSeLDreYnclldN6wn4KKCty0YQ+cCFG7gVvT1H+OUsiERDHOoeZqi8
X-Received: by 2002:ac8:57cb:0:b0:3f4:fd87:a5c8 with SMTP id w11-20020ac857cb000000b003f4fd87a5c8mr19315301qta.39.1684164511863;
        Mon, 15 May 2023 08:28:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1684164511; cv=none;
        d=google.com; s=arc-20160816;
        b=qf7bkCLaXM18hBq4aXMaaQJphLBH5e01uKvk4XcF3jkSYs1V9tZs0N6ke8qi3XCgFf
         UhbvoT96Sxz1Dw/6JRg3JxRRGBvbiITfkBGFxcfa8/abnFCJvSqJZe4x642OhwlztgyE
         6Yr/KCmoYg7OCU9juEAuat0Le0QyOZ+M6FTVlc/tHBHVqot1paRTYFThPuzQgkV90fLd
         4CE3Yg4ArMyJnXYrT/d6y2H6flIBpVUZYEs6ayNRGIPGHKLJh+L3Otsn2q1QfO8IdiWI
         z7EO0YL9mCIFGvR62bfALEU9Rx8sZ42iyIsFl04/LQeFyN0e/enrpZxjhnT68V+vL+3n
         s2LQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=uws9FIAaaYwX2PwdPVre/nN5mC8VFkyKLBItlzcAiM8=;
        b=EAgVY/ZY4I6XdGUJz14hkWQ6x8ocW7ZdjCGLNqZr8OypH3Pqow0oj1VEOleIoKm/Os
         QXOweF0ryeE0pMROyTrkNzAYlgG7r5sNxx2S5AOJaAQqHdL8HirZZiVn5MXtMM3lx+JN
         Q7KJ8xdvACqqiLtujn1JZ8bjb124NlR2lbTU/Xez0huZC+mptKj4QMqc0IlhLtYa9Wmc
         NEwqfsQEKd829N3qECwoWgWcFqcBEsIyrjQTPUOeX5r2/lfpGdqo2x4NOQml3z5Wu/X8
         AK25UX1we0qb4sPDWvh8MXlBRv/MqfJSoxmyEFBFWI9q4SqX+Vi8xaEZgKMxvHXuokjE
         ToLw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=xWE1qPF0;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f24-20020a05620a15b800b007579f4e7fabsi61296qkk.215.2023.05.15.08.28.31
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 15 May 2023 08:28:31 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=xWE1qPF0;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pya7U-000768-1N; Mon, 15 May 2023 11:28:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pya7S-00075X-QV
 for qemu-arm@nongnu.org; Mon, 15 May 2023 11:28:14 -0400
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pya7R-0001kR-7F
 for qemu-arm@nongnu.org; Mon, 15 May 2023 11:28:14 -0400
Received: by mail-ej1-x62a.google.com with SMTP id
 a640c23a62f3a-96649b412easo1657744366b.0
 for <qemu-arm@nongnu.org>; Mon, 15 May 2023 08:28:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1684164491; x=1686756491;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=uws9FIAaaYwX2PwdPVre/nN5mC8VFkyKLBItlzcAiM8=;
 b=xWE1qPF0uJJN0GRNX9CTyABDusUikQtTw/DMr7J8VEyoy4Zpud45giO9fy4UCzP12L
 p5kWL+mUuwAnO5SbByhaHOupAxJVKTuuhqff5JDvb2jW+wBvQOGJ7mbiyztLgPSsXf+l
 3wfb2kXKROB/5G5v/3oNTkMlG79CrJv0a7nqqGCRXtXnksUZ+LNIik0BS1EEM3FPv0Ny
 KjOuI4allN1kHL0gZKMFt3z5K8i6juzkrztWUXz7ncchzevCUTO2MMIpzw4sCCdv6JIi
 0wMD3lp4ti5dv/JXpaVexpYXGYIs1c7QXSvlJwmyRkSBHxkEhz3vXAG6EKHbUwbb374L
 hc7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684164491; x=1686756491;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=uws9FIAaaYwX2PwdPVre/nN5mC8VFkyKLBItlzcAiM8=;
 b=JsDBlGi9U3xUiB2QBlrARwJFV71+f2OIK3krb3MVowgc9CE3r6R1mqm/2ZM/hAr0U2
 dphpx/vU21V1azsNW1pjP+4AZsqaPgLsFMD8533RLkabGaubhJ4xibeU9h0CRTMIAt9k
 iFEw1elxRftcDiHY44dZ4pDAIwm7c2boQpjRh45Og5kIdiHm1D7xwYMTcmVSktujS+6+
 1W0/JkCHOGk+ZAUO9OwjtpdrETnVk58oRkdgL5hMQvW/EBFwe6VesxoCr8K3WUP1QzsL
 eGZDiTjJovU0X0L5j84qjjqU/w3hnVU5YNxMNKwtgTp2OviwSoxox6eANfTpExilkxxg
 WZVA==
X-Gm-Message-State: AC+VfDxgmv5qLwv20Q5vFdOFthxWvJTnhFITp/VK8y8+yVbIsTAgKhOS
 9ph3qGsZexNo3I3j3lPRApKJPAJu47UWQvqeyi3K7A==
X-Received: by 2002:a17:907:3e27:b0:962:9ffa:be22 with SMTP id
 hp39-20020a1709073e2700b009629ffabe22mr31329461ejc.7.1684164491573; Mon, 15
 May 2023 08:28:11 -0700 (PDT)
MIME-Version: 1.0
References: <20230506183417.1360427-1-marcin.juszkiewicz@linaro.org>
 <CAFEAcA-d2_3xXMNwMG+-WOw=y=zandSM24-GfcJ8s=3etqACcQ@mail.gmail.com>
 <88e30a90-71c3-0ded-8412-0f3af6ec3b37@quicinc.com>
In-Reply-To: <88e30a90-71c3-0ded-8412-0f3af6ec3b37@quicinc.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 15 May 2023 16:28:00 +0100
Message-ID: <CAFEAcA-MuBoy81GB472G5thCy8n10gYQfOMOPxu_3tb60BL5vA@mail.gmail.com>
Subject: Re: [PATCH] sbsa-ref: switch default cpu core to Neoverse-N1
To: Leif Lindholm <quic_llindhol@quicinc.com>
Cc: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>, qemu-devel@nongnu.org, 
 qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::62a;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62a.google.com
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
X-TUID: T/n3SO0lVnGm

On Fri, 12 May 2023 at 17:02, Leif Lindholm <quic_llindhol@quicinc.com> wrote:
>
> On 2023-05-12 15:50, Peter Maydell wrote:
> > On Sat, 6 May 2023 at 19:34, Marcin Juszkiewicz
> > <marcin.juszkiewicz@linaro.org> wrote:
> >>
> >> The world outside moves to newer and newer cpu cores. Let move SBSA
> >> Reference Platform to something newer as well.
> >>
> >> Signed-off-by: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
> >> ---
> >>   hw/arm/sbsa-ref.c | 2 +-
> >>   1 file changed, 1 insertion(+), 1 deletion(-)
> >>
> >> diff --git a/hw/arm/sbsa-ref.c b/hw/arm/sbsa-ref.c
> >> index 0b93558dde..a1562f944a 100644
> >> --- a/hw/arm/sbsa-ref.c
> >> +++ b/hw/arm/sbsa-ref.c
> >> @@ -852,7 +852,7 @@ static void sbsa_ref_class_init(ObjectClass *oc, void *data)
> >>
> >>       mc->init = sbsa_ref_init;
> >>       mc->desc = "QEMU 'SBSA Reference' ARM Virtual Machine";
> >> -    mc->default_cpu_type = ARM_CPU_TYPE_NAME("cortex-a57");
> >> +    mc->default_cpu_type = ARM_CPU_TYPE_NAME("neoverse-n1");
> >>       mc->max_cpus = 512;
> >>       mc->pci_allow_0_address = true;
> >>       mc->minimum_page_bits = 12;
> >
> > Seems reasonable; Leif, any objection?
>
> None.
>
> Longer-term, I still want to move to "max" as the default, but that is
> likely to require some invasive changes to TF-A, and this is already a
> huge improvement. So:
> Reviewed-by: Leif Lindholm <quic_llindhol@quicinc.com>

Thanks; applied to target-arm.next.

-- PMM
