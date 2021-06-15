Received: by 2002:a19:f807:0:0:0:0:0 with SMTP id a7csp2831639lff;
        Tue, 15 Jun 2021 04:00:28 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy78blZjUQvWX8HivQQcpqdA2i2GGhpFQTyfZX6a/wGP53OWx3M7SUqx489IKiKmBWvMvVQ
X-Received: by 2002:a7b:c4d0:: with SMTP id g16mr22117377wmk.181.1623754828645;
        Tue, 15 Jun 2021 04:00:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1623754828; cv=none;
        d=google.com; s=arc-20160816;
        b=UR3yNDkrLn4ZRbfG1QH16GPSWyziD1FLVm5KM2+2OjzHGo7thpti0NS/CLeSZrkY0N
         BuOqRRB41QcbYmGtZmcBthzNvA2VZNcl+ZipImkyCk+UAv85QVAXImsbcAOtXDg0QK+N
         1Hq1wIZ5YVcgelkyexKUqwkbV9PcXlQZqHuGKh953epGglpsVnYgtHNIOMKxoPIP+nLk
         6XdU3lFDiWir3DbgarthFbefg8fHmto0pCL+szCJcLY6Hkvk0cls1cc4Q+UxAVyzuQln
         iZoQNucwa/gY2yOKBQStON79fkuN87Ga72EGLbN+SMmpKyDTN2JD0u8FQYr5bZgTCsLs
         CZeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=DBsfqqGg/F1hbfQKagdoqc2bj4HLHyYfplQ9buiz5w4=;
        b=cyaTkIJp1/K56sYk9XfhNztuh8vPfw71UJ/2YtdfHw8/HM10IOv3vKjMW0Lp9tX9v7
         o8D+bRmzQpF126irmS++h7XubujFujGfs85MVeXEjGVIbhQSyKTZv9Ga7UrwIzc8kzLR
         YzxBv0TVa6013GtFp2l4vesL47Cri2QLCTVgMCpbSaDtcR2l7pJIbTmlqcJ7GjvmnKqK
         UDkjKYI4+1OM0Iah5QQM/LUFOlp0qZStQTuH2u4AI85CcrQh9OVTtHcLgyLuW2sZ4r9x
         FSDMHSi6I1BfQwHw/NjhHX/8W8fZw5rpA0KLOGqw2Ddhwvl85fUUalsgKlsmh6pMDzfd
         bqzg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="F51/0NTV";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c17si3003405wmk.154.2021.06.15.04.00.28
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 15 Jun 2021 04:00:28 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="F51/0NTV";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:35994 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lt6nz-0004QG-AK
	for alex.bennee@linaro.org; Tue, 15 Jun 2021 07:00:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44454)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lt6nX-0003y9-Ge
 for qemu-arm@nongnu.org; Tue, 15 Jun 2021 06:59:59 -0400
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f]:38716)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lt6nS-00023U-2u
 for qemu-arm@nongnu.org; Tue, 15 Jun 2021 06:59:59 -0400
Received: by mail-ed1-x52f.google.com with SMTP id t7so5293854edd.5
 for <qemu-arm@nongnu.org>; Tue, 15 Jun 2021 03:59:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=DBsfqqGg/F1hbfQKagdoqc2bj4HLHyYfplQ9buiz5w4=;
 b=F51/0NTVyq8Jomgm0dWAFEogCHgE2ZRbyj6CDyQEtxjsRTPOH4otlnniy9ebUnpco9
 YYFP2vR28Y9WB3hx2CytQHJbMuD8O1OYIrho7gYuWEZ16nlCIRNBUuun7h/zMK9jTEIO
 DRaBVaiRtfaRY5xsh6EJSFV1Y8BFr0k5EvzT8AA3bC+7MPCzRZpXeanXW6MXcTsKkIoe
 K9Uo813sdp1JkoCP9AfZmpoUFvCUT/X8nmssvsp2ET96OsviSOWg/lYuqttLwJtWGGeJ
 Jx71/cPoKivhbi/R/PtxlM2i+f/jUG3eAITSRLiapl0AZPYQXltNBdtcSZgf6Sf5s6Hi
 +ABw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=DBsfqqGg/F1hbfQKagdoqc2bj4HLHyYfplQ9buiz5w4=;
 b=MN1bTcvnjI8xrXFPlo7bJFy9wimrOtp+ULPInqy4iebX0r6ZlqZVWnKqsfnB9YU/rq
 W1x+B0PaBgCof33zRzZWT0wHb8fGWZ3jDknOMYfnH+S9sOsiwpjPzrl8e/0RPI5cNbl9
 KhOhtxh9sTZVQSiH35V0toPw4HPYpaV0pXTEgNaHj0105cMzieDA3duV6mioRhJi0SRM
 VnLw8ae1KebCA0kfkDXjvkNiIlbxZXVtSsiW9XKFlh9hG4DzOB+ApCRq1PhewYmI+P8u
 EoFR8XnDvkcXFhz3FyblYvU2q2nc9txJLIYYSBTG76XgH8E/crQ4BbkBw8UJ62ta/K7r
 uXDg==
X-Gm-Message-State: AOAM532Qn1YXP8QtvSuKihILJ6hg1VZD/OuCVgg6p3RELFfJsd1kZwGt
 OvnuDUFNDczQtoevFMQc0ivlycfX2tHEb97YlYs7hQ==
X-Received: by 2002:a50:a413:: with SMTP id u19mr22006423edb.251.1623754792692; 
 Tue, 15 Jun 2021 03:59:52 -0700 (PDT)
MIME-Version: 1.0
References: <20210519202253.76782-1-agraf@csgraf.de>
 <20210519202253.76782-18-agraf@csgraf.de>
In-Reply-To: <20210519202253.76782-18-agraf@csgraf.de>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 15 Jun 2021 11:59:17 +0100
Message-ID: <CAFEAcA91tkwO3ghBitmskOWHb-9p9Dfa8nENciEA1wRxzni4Wg@mail.gmail.com>
Subject: Re: [PATCH v8 17/19] arm: Add Hypervisor.framework build target
To: Alexander Graf <agraf@csgraf.de>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52f;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52f.google.com
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
Cc: Eduardo Habkost <ehabkost@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Cameron Esfahani <dirty@apple.com>,
 Roman Bolshakov <r.bolshakov@yadro.com>, qemu-arm <qemu-arm@nongnu.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, Frank Yang <lfy@google.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Peter Collingbourne <pcc@google.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: UHyuuR0/D//C

On Wed, 19 May 2021 at 21:23, Alexander Graf <agraf@csgraf.de> wrote:
>
> Now that we have all logic in place that we need to handle Hypervisor.framework
> on Apple Silicon systems, let's add CONFIG_HVF for aarch64 as well so that we
> can build it.
>
> Signed-off-by: Alexander Graf <agraf@csgraf.de>
> Reviewed-by: Roman Bolshakov <r.bolshakov@yadro.com>
> Tested-by: Roman Bolshakov <r.bolshakov@yadro.com> (x86 only)



Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
