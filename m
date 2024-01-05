Received: by 2002:a17:906:6698:b0:a28:f940:7a27 with SMTP id z24csp869869ejo;
        Fri, 5 Jan 2024 09:56:09 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGnz3BYnlPXJjm+FFIFxepx4tXQQvAS1OIcaWI4Af7nFv2eirjAxJ4bDcQcNa7Pd1Odq4gn
X-Received: by 2002:ac8:58d5:0:b0:429:7ce0:bcd9 with SMTP id u21-20020ac858d5000000b004297ce0bcd9mr596947qta.22.1704477369356;
        Fri, 05 Jan 2024 09:56:09 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1704477369; cv=none;
        d=google.com; s=arc-20160816;
        b=slTfTIn2dt5bJ0EY9HFDOcwcel22T4Tb+T3urR0M+fJ4frUwuKLUcXURLWzqD2xU2t
         WjWLWMHSoqYTRh2V5kughLSK2Z6LkqmoylVN40F9vqt5na18zZ7E4mzQtPfd40JYWSd7
         60KGd2UN9zlAwI3ECFoBf5k9Ht6Qg2oxEJH4Z07aGwUVCFlnGTkNHndmMjqOxdjZ7Rpy
         nA+ud0u4BYuyGZ94UtFIizI/cibtoetkL09zjidFBvGb6UTYzDVOIM9AAvYVfGxK0s59
         eqT4kYDDdVnUqQnXV5yguh2kf6WqoOgn2gb8OEHNkesUOuBkxxNZ/aLfNCGo+rTuaaxr
         /YRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=elohRhapRXRLisFPupz54RHCVYVrr8bTqmeGSIcKb3c=;
        fh=qdExgS/EC9wfn+jhDNphFdE7zpmUpTklI58gaAWmHTw=;
        b=cjRA8S6C+6YeCSrOzfca+9vdwzDmNN8REEy2NdHC0J4FaD5EIQybhSvVBrErAKPHQK
         tlXCjtZt01Q9Kcg83fRAftsxRoohCXhLFRyzO6+vlbUvqGOWD8BEdZZVZSfI4cdYt5I9
         et4s+o0C8IatC1Jm+Ilw+bwhshVfvBwmmFiH3qmcYmkq6Z8DMNphY7moVtVcWDva+9V/
         FwBdxCPKyAOcPDOqV6lKO3WBeQzdk/qVv2EDia0MJNJ8X5dQV5DjrmJ2E6bklt1tHlKN
         ofk2XeNGV74s1PPer/GFxZ+X/Fb0zLwmci9V7mmim/UWJUC82Bq0VExFLdQBaykENhmL
         zeZw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=SsmDlFg2;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s19-20020a05622a179300b004282639384bsi2421521qtk.126.2024.01.05.09.56.09
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 05 Jan 2024 09:56:09 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=SsmDlFg2;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rLoQD-0000MC-MY; Fri, 05 Jan 2024 12:55:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rLoQA-0000HN-Em
 for qemu-arm@nongnu.org; Fri, 05 Jan 2024 12:55:51 -0500
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rLoQ8-0003ih-H9
 for qemu-arm@nongnu.org; Fri, 05 Jan 2024 12:55:50 -0500
Received: by mail-ed1-x534.google.com with SMTP id
 4fb4d7f45d1cf-5572ffdba53so904149a12.1
 for <qemu-arm@nongnu.org>; Fri, 05 Jan 2024 09:55:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1704477346; x=1705082146; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=elohRhapRXRLisFPupz54RHCVYVrr8bTqmeGSIcKb3c=;
 b=SsmDlFg21gzOfGR2KbiRBrkiL04EXgKLFm5XteMKt7A510uF70oMg4hlacvzad7aoA
 7FjA7OfgBRF/nZXxX2Mc+pnylNFU7YtUdLHqoOMSivr0AGWV2BSp3QYITTZvPl8fH0w+
 73pe2fMTwraHkElBmrSQpVaKpEtBbqApif4lUuGenjhZNJNIETiBrpCtwePTZqJ9zTXg
 XY42aPIglnII8DDTJ05xajIkZoq9l+Qi1+EkKHUyBJl5Ui18p/WnSl+obqCGjp6o0Vhn
 6KTDQzSSIkt1jyK1+D84TT0kil9ExW+OV/5pgzuR3xhyETeft3nj1oUlaG5cbutPIws+
 2nZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704477346; x=1705082146;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=elohRhapRXRLisFPupz54RHCVYVrr8bTqmeGSIcKb3c=;
 b=e0VjB5J+bYYlgAB0RG8UQjMaDldvH2SdmUM+enw1a0z9nFzE+nuQJjXWkPMIs4LkNz
 +UlkQ6TCtNgYWAcA/dmX6dAfIATDlp55SFxQFdLYDUy9tYl9Aa8INs/5w4wrD/NZLBNq
 PVWBHtwA5uOLH8BPD395VLlMBYWFJNsq4Fo78VIoiAYhg+R2bQ1c/6q5YdC1p5imotlx
 XzrcKFyxA9xYMc37F5dmJZPHmAf68NbWUSbk+stkAWIuD10T4vh3dA0fah54sNb2T1lJ
 JzPsciP/2UdP9U8IDr8VPIqbCZ4yjrMQ1w6ag3iQa1JG50XSPYVnSIToYwobCus/eapk
 iJiA==
X-Gm-Message-State: AOJu0YxgrDb+gOu5cLK2jIrnuAOLe/kC8iV3gN9usp6n+nMj4QFRYzOq
 10lXMO0LA3m6aQ2VlDC8hvnwtRj7p+uenSBdyEnkI1OQ0wADmA==
X-Received: by 2002:a05:6402:b46:b0:553:ee28:b97e with SMTP id
 bx6-20020a0564020b4600b00553ee28b97emr1153592edb.26.1704477345886; Fri, 05
 Jan 2024 09:55:45 -0800 (PST)
MIME-Version: 1.0
References: <20240103155337.2026946-1-sam@rfc1149.net>
 <20240103155337.2026946-4-sam@rfc1149.net>
In-Reply-To: <20240103155337.2026946-4-sam@rfc1149.net>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 5 Jan 2024 17:55:35 +0000
Message-ID: <CAFEAcA8Pv4Hy-T_PhgiDSgO4yhfROH_=847qP_pQYdBxGnxY=A@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] hw/arm/socs: configure priority bits for existing
 SOCs
To: Samuel Tardieu <sam@rfc1149.net>
Cc: qemu-devel@nongnu.org, Arnaud Minier <arnaud.minier@telecom-paris.fr>, 
 qemu-arm@nongnu.org, Anton Kochkov <anton.kochkov@proton.me>, 
 Alistair Francis <alistair@alistair23.me>,
 =?UTF-8?B?SW7DqHMgVmFyaG9s?= <ines.varhol@telecom-paris.fr>, 
 Alexandre Iooss <erdnaxe@crans.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::534;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x534.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: 3BXYdMtet7Vh

On Wed, 3 Jan 2024 at 15:53, Samuel Tardieu <sam@rfc1149.net> wrote:
>
> Update the number of priority bits for a number of existing
> SoCs according to their technical documentation:
>
> - STM32F100/F205/F405/L4x5: 4 bits
> - Stellaris (Sandstorm/Fury): 3 bits
>
> Signed-off-by: Samuel Tardieu <sam@rfc1149.net>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
