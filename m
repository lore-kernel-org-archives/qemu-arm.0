Received: by 2002:a05:6512:230d:0:0:0:0 with SMTP id o13csp1699434lfu;
        Thu, 28 Apr 2022 05:42:29 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJywJyX6DqPsud3diTwnfEzdNva//3own67Wv1BCEp0buuAAZn8bBXfP+uNC19s4EftHayO3
X-Received: by 2002:a05:620a:4148:b0:69f:8e5e:1aa6 with SMTP id k8-20020a05620a414800b0069f8e5e1aa6mr4458496qko.145.1651149749553;
        Thu, 28 Apr 2022 05:42:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1651149749; cv=none;
        d=google.com; s=arc-20160816;
        b=tGP4TaqWiHIqwQtsYMb5741CqT1DlNrVGq+aWmFVMUDT4QDM4dbzuocQ2qvM7TpRsm
         8CsV9hrE7EA+YHhZdSicCYNkEAx6GeIcLKWCIsNhkOHqzwBEM6/6SrJHYMyjmPI5VjoV
         AlarkhO2B+2jpuM1ITIaOO26ep6Qoh2rOFVgZfH3j7WctLRVweoQB0LFKadHxk1o3wbD
         FSr6F3AHGho9Db4SFtl1aVzouGBMczAEDthQJwtB9r/8VHBX/bRWmsUqQKQbfkofTLpc
         TQH5ACTMqzZtZs+xIxVuGtF1HSVS86Y1tKfCfqL1anw3AXloaZq2o9vDzfHTuNBuYKbs
         96Lw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=jKiJG9/P3+5Ek/VD/EAMdXBUP7thKn8Nzr7duu81UHs=;
        b=LdzUK09DZb0gVpD+Xn9R9cYr+iHxZhCnIPAMwqlimawBRTYrP5IbGB6BhzR/HlMmM+
         4VsyeseoBUWac2dYoYokXAwhZfPJ1z7Vv5+gd9mHJgosRBw6agYAVJfoYRD1T4NQ4PY0
         7xBP+HX9xtTd0JitxCcmxUUzL3wWDYQSBa5AdTbCqdg8h2E0WKFt/qJu+G8odYFAglWB
         hqYN+aLnnY8d0y1xyg2xUIAK0dzEg315JW2r0T952h4BSt4CP6yzfVoMmw3Dp+hjG74B
         5K3t2THDxYarauYBkX8fe9u8xkNtol/H65YtZJkWzJhls0cICWm/eYIvhyoN5IWvGjai
         imnA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=KDS7wNgV;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id kl9-20020a056214518900b00446730e29a4si1574943qvb.459.2022.04.28.05.42.29
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 28 Apr 2022 05:42:29 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=KDS7wNgV;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:51264 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nk3TY-0001id-V1
	for alex.bennee@linaro.org; Thu, 28 Apr 2022 08:42:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33370)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nk3RC-0007g7-5h
 for qemu-arm@nongnu.org; Thu, 28 Apr 2022 08:40:02 -0400
Received: from mail-yw1-x1135.google.com ([2607:f8b0:4864:20::1135]:36149)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nk3R9-0007CN-D6
 for qemu-arm@nongnu.org; Thu, 28 Apr 2022 08:40:00 -0400
Received: by mail-yw1-x1135.google.com with SMTP id
 00721157ae682-2f7b815ac06so51497237b3.3
 for <qemu-arm@nongnu.org>; Thu, 28 Apr 2022 05:39:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=jKiJG9/P3+5Ek/VD/EAMdXBUP7thKn8Nzr7duu81UHs=;
 b=KDS7wNgV05EHSdkMWdnAZ0emY0W4F496nDZ+wmonC960+UBjJHnyAWCz59+69z+N1s
 V1cCycQMMXcsiV5SuNuHDd9nDOpsiWab4vGUvjuIyzM/YIv7QXxPS2p4dhjAVQSX8HAb
 3tHMYf/2QVJ9XmAlo0oBBhQ05OKubsZQX75hu8awPUKgQHXlkmYNivnAcM4qmpSNWBF5
 pFfLlA9yHUWC+jwwQX9/JabTMMm7oO/8TLyx3qbO+REAbf4IzjgYyAzL9VKUBTM19L9q
 IIhqgao8zjOmuiDj56Jyd87wewR+SCq2qZF6PzRHb3kJKb3EE9AgS9spwfsMfhWfnCtU
 gJvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=jKiJG9/P3+5Ek/VD/EAMdXBUP7thKn8Nzr7duu81UHs=;
 b=QvN05bgCdymBfD2IOuypQZA01vMrkRMR1OFex/nCqZ3GJVJsDfp/61umxpdlxPtgse
 jcNKicSyXiRoI4SDVy4sV7niH/8OdQraAZpCfOlOo/Tp556JND6fcrcR6B4mMjOkg5VW
 G4jwevWLuree8AubggugCSjbsro4iggvy9L0fR6ZZ3CXpwvWl6CF/AANi3OJVLzl2Pjk
 zYmVWiQ1DyCdxNWtW58VvkHzrlXM3DXk3+S+p8tEKXnMM4enUpMSH78PyhvKwb3aMIz9
 g3d0ydGHaiy/lQtVl31oDog3LKAVtfvrsl/irrkaun/ijVyynNBikmWed9/G1eALm27I
 TgmQ==
X-Gm-Message-State: AOAM532Ua44QC2cnHT2VtLKCZm3ZsJBl1KkBPTbHfF9z5jSCJ5uuYIh1
 cMX1SU/uo7W99zxef7QV+b9tmOQcSHnNcpvZ6wkHfMo8Te4=
X-Received: by 2002:a0d:fc83:0:b0:2e5:b0f4:c125 with SMTP id
 m125-20020a0dfc83000000b002e5b0f4c125mr32740287ywf.347.1651149566058; Thu, 28
 Apr 2022 05:39:26 -0700 (PDT)
MIME-Version: 1.0
References: <20220427090117.6954-1-damien.hedde@greensocs.com>
In-Reply-To: <20220427090117.6954-1-damien.hedde@greensocs.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 28 Apr 2022 13:39:14 +0100
Message-ID: <CAFEAcA84F=WLfVdo1SvYmu_7p4-HZPL3boJcUu=XJDf7m_gxMA@mail.gmail.com>
Subject: Re: [PATCH v2] target/arm: Disable cryptographic instructions when
 neon is disabled
To: Damien Hedde <damien.hedde@greensocs.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1135;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1135.google.com
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
Cc: "open list:ARM TCG CPUs" <qemu-arm@nongnu.org>,
 richard.henderson@linaro.org, qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: gJG6xVWqEvy9

On Wed, 27 Apr 2022 at 10:01, Damien Hedde <damien.hedde@greensocs.com> wrote:
>
> As of now, cryptographic instructions ISAR fields are never cleared so
> we can end up with a cpu with cryptographic instructions but no
> floating-point/neon instructions which is not a possible configuration
> according to ARM specifications.
>
> In QEMU, we have 3 kinds of cpus regarding cryptographic instructions:
> + no support
> + cortex-a57/a72: cryptographic extension is optional,
>   floating-point/neon is not.
> + cortex-a53: crytographic extension is optional as well as
>   floationg-point/neon. But cryptographic requires
>   floating-point/neon support.
>
> Therefore we can safely clear the ISAR fields when neon is disabled.
>
> Note that other arm cpus seem to follow this. For example cortex-a55 is
> like cortex-a53 and cortex-a76/cortex-a710 are like cortex-a57/a72.
>
> Signed-off-by: Damien Hedde <damien.hedde@greensocs.com>
> ---



Applied to target-arm.next, thanks.

-- PMM
