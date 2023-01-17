Received: by 2002:a17:907:c68a:b0:84d:2074:29bb with SMTP id ue10csp2386062ejc;
        Tue, 17 Jan 2023 05:46:44 -0800 (PST)
X-Google-Smtp-Source: AMrXdXu2E/4YZeadzLxng8W9iYFmAFO/u3OP/1mBv2ZROrGhPKFu3EPktTjjYcAXvpHA2JPs6r7z
X-Received: by 2002:a05:6214:27c6:b0:535:17e2:f164 with SMTP id ge6-20020a05621427c600b0053517e2f164mr6653401qvb.6.1673963204426;
        Tue, 17 Jan 2023 05:46:44 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1673963204; cv=none;
        d=google.com; s=arc-20160816;
        b=sL21BqbcCGVJt6vqn0J7Wo7W37Eg9KVIBPxTuOHlmt4b66TXh5pYmllnAnXW7q66KX
         wCCU/wkF0OQGDYko/jIw9ayN5rrqKbUFknuM1LEYDH3txweZpupp/tLb69NuGLJ9BaTl
         MjIWm7UDl95AJ7MmcQuJP6wC5/tuWjTt79gYJ6/Mv+gh4hMRu3eDJHdzncG37x7s1unp
         7HgeXG6zGTCRWItYLJw2W36WU6lR4eaBnqGjn3s1YO6wdQaP/bOJgYlrbVgtlpCsZ/hc
         pUSVbyB9aOv9j8lRQLI6wTrl2NK9YwL+ejx4/9qB8cEJo2vIeiFYuektrzCLzdJoEozL
         4Saw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=c+jFfAOifm3pb1BL+sMlYdRXDLpW3TylbRRklTfoANU=;
        b=efvUjYHB6mZabenEMk71MQfnr7j8TxNsJU4JlFrk/7d6ive2H41Vme0WW6RcAwWxFM
         hulb9XqejQUX9daptW+SJgSuMB/fjehacONkl384pCkoqY4seKiI3tFQm49bsWOnVM1G
         Tgy+KH+koldpamqwjNe4NCqnUx3IPXAyiM2vUqEWOC5SgvKNY84na12ILHT3lYxVO5OL
         lsDaKU20PLjgT+1FH+XM0B4VaqrpJHlryFKPGRqrw9D3P4jYWUef7Q2f1YxjKIsZ79Aj
         +NQXOzaO4hVczMIk3Dpbn6eOWJ0m75IrUoraKEVN+dajSuJRKUV1pK+ZXODSbliQesfq
         IC1Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Bt3n5QYO;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 74-20020a37034d000000b00706950156c3si1310004qkd.646.2023.01.17.05.46.44
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 17 Jan 2023 05:46:44 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Bt3n5QYO;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pHmIQ-0004uQ-Vo; Tue, 17 Jan 2023 08:46:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pHmIB-0004h1-3X
 for qemu-arm@nongnu.org; Tue, 17 Jan 2023 08:46:24 -0500
Received: from mail-pg1-x535.google.com ([2607:f8b0:4864:20::535])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pHmI9-0004tn-CO
 for qemu-arm@nongnu.org; Tue, 17 Jan 2023 08:46:22 -0500
Received: by mail-pg1-x535.google.com with SMTP id g68so20882457pgc.11
 for <qemu-arm@nongnu.org>; Tue, 17 Jan 2023 05:46:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=c+jFfAOifm3pb1BL+sMlYdRXDLpW3TylbRRklTfoANU=;
 b=Bt3n5QYOuszyffbSlQxSWZYyeP2pbp94afJLvilVKk1zIhyXb88+AYliKh2a1kOJKA
 8MKTpoUSlt0MAN75i6444TN8Zbwag/e/KblKpCqbfIuPL+ADkEDpPd7VaIygmGk2FLhG
 MjTDw5CA1kuPE3UOiqauvPOmyj/9pjt+j40d7AMdo/MZb8vl6Vxm7D1ycS0BTMMGxBW7
 o8SMnM1DKKVnpX+5uCLjFjQFTYCbxFvrSIHNcTbg2EPuyLJwZf3ihMAOD4UJLB7VtH/3
 yv5d+vMp9pZ7ozHwHxHWI7j32MeoBb2j0j0pGOfWWOaNgLn51sUckV4t/LEJl49BNhke
 rw1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=c+jFfAOifm3pb1BL+sMlYdRXDLpW3TylbRRklTfoANU=;
 b=DsfbYaht8wIsMmSDVHyBCdLLd7d3CaYwHl/3D8jSv7FJQulrIAq3/snMjJDrMOG7QY
 GbEYVb+OrBooU1EPtub91j/4JSooOkPs/LLjkGAv5fUStsSMcZ6Se70yRw+zN1tmcWG3
 mlNJtMpGNb90cy8bGvtBVYpszz2BT1uMCYRvjEXAcOO/HyClsKVnIRs6sOgxgIoVD9BW
 iJcP3DrWMMOmIb3h2sJaW34v5rEDd8LuxjyignywAjqyJacfA1cjFCZ1QBQUqQU74RYl
 GQg/zLvkZvG/a49+KB6OCTBCxruaC5hTjTdEkKAe3vz4egCIk1ILMZFVaGWSEIroMh9i
 1xYQ==
X-Gm-Message-State: AFqh2kr4nABgrMIFn6Yu93GASs8n9JQuEd2orooUftclo4OVmi5/ZHLq
 wN4gWQ9b+qJy9lFIntmmb/E4IsKzbtxhFLZn/yOuCQ==
X-Received: by 2002:a63:1005:0:b0:4af:9f91:54d1 with SMTP id
 f5-20020a631005000000b004af9f9154d1mr154206pgl.192.1673963179837; Tue, 17 Jan
 2023 05:46:19 -0800 (PST)
MIME-Version: 1.0
References: <167330628518.10497.13100425787268927786-0@git.sr.ht>
 <CAFEAcA_50YsaEZ4KX5T6r01y8sFJZZ5fYccF9kBJgL+_epbTGQ@mail.gmail.com>
In-Reply-To: <CAFEAcA_50YsaEZ4KX5T6r01y8sFJZZ5fYccF9kBJgL+_epbTGQ@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 17 Jan 2023 13:46:08 +0000
Message-ID: <CAFEAcA9Jyq97b_0aTgDa+bgaYn9DgAFcyPtt_FwShgFe4QohmQ@mail.gmail.com>
Subject: Re: [PATCH qemu 1/3] target/arm: Unify checking for M Main Extension
 in MRS/MSR
To: "~dreiss-meta" <dreiss@meta.com>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::535;
 envelope-from=peter.maydell@linaro.org; helo=mail-pg1-x535.google.com
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
X-TUID: Fw0bkQURjcjh

On Tue, 17 Jan 2023 at 11:35, Peter Maydell <peter.maydell@linaro.org> wrote:
>
> On Mon, 9 Jan 2023 at 23:18, ~dreiss-meta <dreiss-meta@git.sr.ht> wrote:
> >
> > From: David Reiss <dreiss@meta.com>
> >
> > BASEPRI, FAULTMASK, and their _NS equivalents only exist on devices with
> > the Main Extension.  However, the MRS instruction did not check this,
> > and the MSR instruction handled it inconsistently (warning BASEPRI, but
> > silently ignoring writes to BASEPRI_NS).  Unify this behavior and always
> > warn when reading or writing any of these registers if the extension is
> > not present.
> >
> > Signed-off-by: David Reiss <dreiss@meta.com>
> > ---
>
> Hi; it looks like you didn't send a cover letter for this patchset.
> If you're making contributions in future, if you could send a cover
> letter for a multi-patch submission, that's helpful because our
> automated tooling tends to get confused by patchsets which don't
> have one. (A single standalone patch doesn't need a cover letter.)
>
> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

Since this patch is OK and not really related to 2 and 3,
I'm going to apply this to target-arm.next. I've left
review comments on the other two patches.

thanks
-- PMM
