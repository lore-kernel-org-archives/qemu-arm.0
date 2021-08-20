Received: by 2002:a19:e212:0:0:0:0:0 with SMTP id z18csp1103641lfg;
        Fri, 20 Aug 2021 02:03:09 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwiWuxTQp6PW7V0z9P24fnYqG4lybfL9sMcnGV81Y648IPnKUtjZ7gmsFwRhmc5pJ6//9OJ
X-Received: by 2002:a05:6102:3651:: with SMTP id s17mr15568958vsu.29.1629450189181;
        Fri, 20 Aug 2021 02:03:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1629450189; cv=none;
        d=google.com; s=arc-20160816;
        b=nRaV97kaWGlBiaSXiDjTBwv+ZcWpq8rvfT8gwqaAMDuYVLI7xu5DxyGbe5zhYvuaEu
         2Pgf5w+5Hc0lgwpZxlGYeMHeCqT1x6iOxvI5wtkWYayo8+6CyOkew7EvU2OYI1FmkUmt
         1c02pC/xre96u5SDypJ1HFfyejZEtmX1hrxHpj8+D4TViIuBvxx8XXl6juvZDXJq0Ygz
         Wua9utehfMifJuDBXCIaP+MBcgNqvHD3QhinS7ksATe1u9JU1eGfTNl6wRTQ7l9rm2Qp
         wG0c5bW8t2nknDUBulkSUyQknXL23xxJhTCX3TX3B+IAVLXgaar7ugsFRPoB7iW8GCDk
         zzMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=Q4azZTLAV8Q3cPup83a4JGlOdytY8TYbbUTbb80QnzU=;
        b=dVT6kMxpsqjunBGG3wKONdswe7WDZosW1isxtMv4CPhqg3lNC41Crv6FhC7Tn8CXi+
         oYAS3OpkoKk2dacLQ2nJd+V0Nbpr9qJbi6CuGoQygDBA62BeWfDCBZgQnBnX5JEU0gfq
         0WtoaDsbOjlmLR5zD+WChQ4M5KYe9sx5ycLBj2zbo8Si3sW5yZnhMwpr8dGFAeXebW5Q
         bLLnvWS9eOaBba8yuHTxKmpxE47v8VRXfc83FZnmaCO/O68Mp1HDX8sFF8lz4hcsbFml
         IZNdZR2NVWIrQyIerMMXPCAQ9Xm+/s/FMEpAdq3DkEvwF5JarFnFxXlS3kv88K1ym/SA
         E+HA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=hsJ6ey8p;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id n13si3191837uab.202.2021.08.20.02.03.09
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 20 Aug 2021 02:03:09 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=hsJ6ey8p;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:53444 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mH0Qe-00005w-Ht
	for alex.bennee@linaro.org; Fri, 20 Aug 2021 05:03:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58622)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mH0QF-0008W2-09
 for qemu-arm@nongnu.org; Fri, 20 Aug 2021 05:02:43 -0400
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e]:41772)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mH0Pg-00065f-AJ
 for qemu-arm@nongnu.org; Fri, 20 Aug 2021 05:02:42 -0400
Received: by mail-ed1-x52e.google.com with SMTP id n12so12944418edx.8
 for <qemu-arm@nongnu.org>; Fri, 20 Aug 2021 02:02:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=Q4azZTLAV8Q3cPup83a4JGlOdytY8TYbbUTbb80QnzU=;
 b=hsJ6ey8pR1tqSM7X+wD6WZE4y4PBE3Tr3OWCfqxIuAvF9xuK/H3pI4IYZLM2t5nSfZ
 ZP4MOzZGmQEdX5ooAwlnfGncvof7z0VnJlek1HNLpzzNTYlu75EZaG1JL+ovHHGaVVqi
 6d38ScmQZt5ihiQYirbQyA4wQGVr4iEedyDSKAI+icsmXlxA076TORfGTO+iWWVfspvx
 tpZ+w3VSKKpot22ckd2vyafk1XAPGQ1Vl1H4Opi/MQ9R3iwlBlgZn1A0PocD2keeUbb7
 8gsuJCl7tvMI14Nb2/95NFBKR40UjhK/Vv+s2NivR+vNHFMR9y8hNzRUWUAdSJFIBhs5
 CoNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=Q4azZTLAV8Q3cPup83a4JGlOdytY8TYbbUTbb80QnzU=;
 b=oD8Di5AfQ+DYQL9G61nmrilZCZ6QFrndsWEdV5G2F6uQczihZEZgURiB2rxPuDKyW8
 DHagxSelAU1O9zdOIY1cCtW4q7smQ2jGVoZDaoGrGPLCmubhcBWgJqP9jZXbNRZr5+Lm
 ze9dk3loEQDzIHOFghbODPbtaAsDXHI2GqivK8A2AgPNvxMklMIhPjK2/tnGKb8gfaht
 btkQh/VUtoh3uUrdpTZ0WS3VjMwjjm8SKG/JubPbEXpM0VZi/C6SMg1p5cHKg3StIBcH
 xck6MooDHcDhrA7LoVfRMjgrwrUJkkj1ogYjG+XB8KzX/fqGKYcdhqP+VXCrmIiF9H/M
 Cfrw==
X-Gm-Message-State: AOAM530xiYdLhaBrmz1T3ZFEhFKEQoOmMnvWhxFNqwVSvwIxUWVPokr/
 QitlD4C3cmV90K9zHgEMOrpehVQkn9f/4kj5ctXVUA==
X-Received: by 2002:a05:6402:3099:: with SMTP id
 de25mr20990212edb.36.1629450125940; 
 Fri, 20 Aug 2021 02:02:05 -0700 (PDT)
MIME-Version: 1.0
References: <20210819163422.2863447-1-philmd@redhat.com>
 <20210819163422.2863447-4-philmd@redhat.com>
In-Reply-To: <20210819163422.2863447-4-philmd@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 20 Aug 2021 10:01:19 +0100
Message-ID: <CAFEAcA9LP5LWW1FUM7MpNQgS3RC8KGyMRcRFxTQ4B4JD08A7+Q@mail.gmail.com>
Subject: Re: [PATCH v2 3/4] hw/dma/xlnx_csu_dma: Always expect 'dma' link
 property to be set
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::52e;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
 Alistair Francis <alistair@alistair23.me>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: sv3eipv9nAVz

On Thu, 19 Aug 2021 at 17:34, Philippe Mathieu-Daud=C3=A9 <philmd@redhat.co=
m> wrote:
>
> Simplify by always passing a MemoryRegion property to the device.
> Doing so we can move the AddressSpace field to the device struct,
> removing need for heap allocation.
>
> Update the Xilinx ZynqMP SoC model to pass the default system
> memory instead of a NULL value.
>
> Suggested-by: Peter Maydell <peter.maydell@linaro.org>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
