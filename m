Received: by 2002:ac2:5ccb:0:0:0:0:0 with SMTP id f11csp1523651lfq;
        Mon, 11 Apr 2022 03:47:44 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxxO+HHe1uady+zBMeIfcTE0xLx1VU54Bq8iBd4UmG+mYO0TrhfamF7+v22pkTtTAUmxu+/
X-Received: by 2002:a05:620a:4148:b0:69c:297b:4050 with SMTP id k8-20020a05620a414800b0069c297b4050mr1356163qko.532.1649674064206;
        Mon, 11 Apr 2022 03:47:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1649674064; cv=none;
        d=google.com; s=arc-20160816;
        b=Xe35oo2bpx1NDWRpEs/TySrrZ2Qx9q7RscQpDeBSASy+KcDREGPxd6CYivRJEOjCE6
         YHm9O07jxRsAaMl3S/0yp3iYMvh0fZUwCHvhur/hSrDg1Mpx/VGRCFgeZY9W57dOO1GL
         N91HyqVtOQwvWzNTHIT89YBi5JK7FITJ0XOwxjWtQRgZRaHNd33/RzPt9mHZgI2ZQG8B
         kTYw4ZCZNTp+V8edt/fOdamZXxldAWeSmY0gHlVNAM+PLDfL6Qqwt8Jjzlvn2Li71ppv
         VV+Pv5gQ4/LLvB+OsplLW/f9GIdVvUlMBilioMH3ZHt50oIIfAoSWF0BJA3jzz+7oQ2E
         STfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=QwQVheaIV+CeYBMx/lhmKEyMdlHL+FGj1dnem+foXWc=;
        b=OYn6sKhULdOub3sbKrQOu0fw9bm20NJaCB+ieivLLFZeI5WJX6Rqc+W4jTlywxz5PO
         MsnwB5SgX8a8iozTJK3ZYiivZwuOC/EAPeWK06cErs7lzLy/iKIpoQJ5c5SOrUkslOKz
         M1IQ+LU5jwhEyrWahobtjN/eYL/lLTYfV00CXEs3RodyDrINJatesjl913KEeadKWQLC
         RTNsfjUaNQHq9Y1RqqxJoNq3e1Ay06NIF5w0mSEDWC9nXIPm2o8t9xyK+H0oFFAGnHbk
         7qShXUVga1JO4RPq7iXoCeNFZeYPYtoivL0XJcsWG9pXroX9AFMnPblyMrRBzn2LIj4F
         PnWA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=UirbG4hY;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id p6-20020ac84086000000b002e1fbf3be53si4708773qtl.68.2022.04.11.03.47.44
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 11 Apr 2022 03:47:44 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=UirbG4hY;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:48464 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ndraB-0006au-Nq
	for alex.bennee@linaro.org; Mon, 11 Apr 2022 06:47:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:32952)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ndrYM-0005ju-Sv
 for qemu-devel@nongnu.org; Mon, 11 Apr 2022 06:45:51 -0400
Received: from mail-yw1-x1129.google.com ([2607:f8b0:4864:20::1129]:35297)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ndrYL-0002Ey-BL
 for qemu-devel@nongnu.org; Mon, 11 Apr 2022 06:45:50 -0400
Received: by mail-yw1-x1129.google.com with SMTP id
 00721157ae682-2ebdf6ebd29so89135227b3.2
 for <qemu-devel@nongnu.org>; Mon, 11 Apr 2022 03:45:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=QwQVheaIV+CeYBMx/lhmKEyMdlHL+FGj1dnem+foXWc=;
 b=UirbG4hYXYykrHGtnJs/IljpRq9ChYsK+iyXhvxJagf2nMkMHqjVVOucFZVlpzaEgN
 BUGHwNncIAneysgbFy1WrKOi8TmiW4+VojrbQRvpK5m00gzHH832KuOLGOVs/KboOmrM
 0J4Q+hRV8Nr4Q/ZEkRjwa1U0OEitPJ+N8WGZ+5yGDIHYRYq80Dqb2F48q6GcjQadI6oX
 f5aDZcs3embnp+wzlCodpdIW4cnrNX0xlfVn133rXBp0gRjZvM0Y/x+zNX8ST3wNqqdr
 JQeJHMl6t8ZHo9hjs4VqH/0oqGLq06WDYjvfLVZPn1En91uu0W3EHvWHLSFHsSIr2CB8
 OxEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=QwQVheaIV+CeYBMx/lhmKEyMdlHL+FGj1dnem+foXWc=;
 b=Cd24wRtkYwDkUjKF59JF9aqiJZ5MjidsN9sG32u2Kt5GbFAV8asjvE4a4HiPBVpErU
 jsVTmqvVD52rA0cYvC6IXMQuHJ+cfiuyFtz0mwmfnZU83hDLntSVoQrigmlZKBq5r099
 4S0y7IzL91nOH26Q2Ohat56fAK1oR8c0DL9VhW641y9CM2rNRlj59NFcb1UhsuMQeBho
 H79wNaz/M5fc+doYTMzso0pFYIYCJkehArdbQXiXc5A4XYIO6xn2fqsaNq1VbdjPGRa8
 4DJIzBuicrWsJmH+RsN65oIE2UmYzKr6P1nbCX8oWIj6BHe/5nxyvfvIIek/7KCGkrnP
 N5SA==
X-Gm-Message-State: AOAM533D8CScSYbDBblk1kmnoBjpHOxNjdtqhYY9yF1FcPu4wDbQynqt
 l0dUgxKJXspSGzqnvW2wPPEkK1t5djkn2iWhtPs3Ig==
X-Received: by 2002:a81:4655:0:b0:2eb:2e0e:9d47 with SMTP id
 t82-20020a814655000000b002eb2e0e9d47mr24568797ywa.455.1649673948321; Mon, 11
 Apr 2022 03:45:48 -0700 (PDT)
MIME-Version: 1.0
References: <20220331222017.2914409-1-edgar.iglesias@gmail.com>
In-Reply-To: <20220331222017.2914409-1-edgar.iglesias@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 11 Apr 2022 11:45:37 +0100
Message-ID: <CAFEAcA9Cjkz03R9Pkqa24BZBQsrXHz0Tin_Ppf3f8sPihkSreQ@mail.gmail.com>
Subject: Re: [PATCH v1 0/2] hw/arm: zynqmp: Add the 4 TTC timers
To: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1129;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1129.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: edgar.iglesias@xilinx.com, luc@lmichel.fr, asifsiddiqui120@gmail.com,
 edgar.iglesias@amd.com, sai.pavan.boddu@xilinx.com, frasse.iglesias@gmail.com,
 alistair@alistair23.me, richard.henderson@linaro.org, qemu-devel@nongnu.org,
 f4bug@amsat.org, francisco.iglesias@xilinx.com, frederic.konrad@adacore.com,
 qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 1QT5Rje9HZ2m

On Thu, 31 Mar 2022 at 23:20, Edgar E. Iglesias
<edgar.iglesias@gmail.com> wrote:
>
> From: "Edgar E. Iglesias" <edgar.iglesias@amd.com>
>
> This adds the 4 TTC timers in the Xilinx ZynqMP.
> This is for after the 7.0.0 release.
>
> Cheers,
> Edgar
>
> Edgar E. Iglesias (2):
>   timer: cadence_ttc: Break out header file to allow embedding
>   hw/arm/xlnx-zynqmp: Connect 4 TTC timers



Applied to target-arm.next for 7.1, thanks.

-- PMM
