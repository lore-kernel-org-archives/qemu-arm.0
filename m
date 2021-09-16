Received: by 2002:ac2:5978:0:0:0:0:0 with SMTP id h24csp1051518lfp;
        Thu, 16 Sep 2021 05:01:26 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx6eq8tz9mGscdZ+IRUvOGzqxrTn3FJx0bDocHoaHO88T8woB0CIt7DA0oVIGUao495Grw8
X-Received: by 2002:ab0:81a:: with SMTP id a26mr237617uaf.6.1631793685843;
        Thu, 16 Sep 2021 05:01:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1631793685; cv=none;
        d=google.com; s=arc-20160816;
        b=t7tlYaqBvQV93I588q8J7DSUnmrAT9Fr9akX/e+9m+ZBu6tyE1BC7iBbw12XY0imd1
         knju9jlT5TJP5sMmOGW06MbCiTDWMcuYLkmdF09CxOfcJ7SRxHb7258aS+vGYLvQJWwJ
         eZnUanYGLxcQPrTIomUOtZHFZzufZullH/c+a6y4dAvC70NvA8u6Iuf/HFCennO0VXpa
         v9cX8jo/SumcT0G71lw8UBPihpVt41dGqc8tpX0+S9/Iy8EdTPmRLABNt9pp9vQ3PIYf
         Txe0+aUBRNNF08lXFuknISuDCdCycuQung8jesPnQrWHtcLP3A1yz8kuMvm0GwmcWDWI
         S5BQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=RuuMHracPQA6J4gTHFCFbuTFO31MGbcwnN6iafFSFGM=;
        b=IdDFvWgp4Ni16zFqA0S9IyNnKww+/DwvVVYF7CAqrPZSOJFeClBUVHu7M7VNE5qD30
         MOM5meGcNp4Ve8RR3xgE2VuCWq8v/F7mmyYVxJriPicFc2apaVw15qG6CT2dZvJm92hC
         wHEEejXsvoHEyxBS/h5TJVAd9wQwCux+pb5TalTC/LJ7YRvGwDZEiX3n6Z38LEI0FgXb
         qjnql3J47sPSiPJiV/LD1bgCQLinIwgCcxiw7S1BrodN0ZCgknK/Q7wJa1e5LDBj1DCa
         WMC5E8P9b3uqygkY44RW8ZyEdIAyS4NepsHQd7WnJRiWI9hy3vt1+dU1evXtTi84FEQW
         FtfQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Ob1EVF5P;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u76si1164590vku.36.2021.09.16.05.01.25
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 16 Sep 2021 05:01:25 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Ob1EVF5P;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:56712 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mQq4y-0006Q4-TH
	for alex.bennee@linaro.org; Thu, 16 Sep 2021 08:01:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37068)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mQq3e-0006Pl-Pw
 for qemu-arm@nongnu.org; Thu, 16 Sep 2021 08:00:03 -0400
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435]:46846)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mQq3c-00085H-9a
 for qemu-arm@nongnu.org; Thu, 16 Sep 2021 08:00:02 -0400
Received: by mail-wr1-x435.google.com with SMTP id x6so9011348wrv.13
 for <qemu-arm@nongnu.org>; Thu, 16 Sep 2021 04:59:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=RuuMHracPQA6J4gTHFCFbuTFO31MGbcwnN6iafFSFGM=;
 b=Ob1EVF5PdhRoMbZe3jegXqRjp1KB76XXxBMRx67Y+JF1YbPGHdvPopfplTpHMQnisN
 xbiQINlJzgJSpq9uzrgmPBqglaUvPzQT0ym4KspjyWXtt/e0sdqy361NEJ85TMvuG7uN
 jzuJmzdcxziwoLRxLfh58LfvqeE5+Rwu1UvJeXwjQBA06n8qmWNeL9aDrNjC24JDOucM
 5Jx5OZ92tNMD4V9to9Lu8iOQtVSShRA9YTDhNPW2tSjfKwDXtKQ8D4g1lHH8rrgTSb+1
 SLTTF/4le7qsBcOu9jhJqupGq0cJtljqUs3D8IzkVbZKai6Gc/W/lkhXdPgkoKnsZe0m
 /ZBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=RuuMHracPQA6J4gTHFCFbuTFO31MGbcwnN6iafFSFGM=;
 b=wcKY6r2+m+SlGmgmgiO+2Wjj3EFKb8kMTefqNFxR6jrpswIpXgQzkzHJIJ8JWzkZGD
 QoXktR2taNvNKqFMhmxpD6/2+4ldARLCKHnfBDIeW4xmaWpRhRssRC6fwCLnSfa0KDMZ
 AmXYvBBSWYa72BEP+ZwG/W6neONce37I93hVYOk22OMQUgX/NlmI5y7SH9bBLsd90LOh
 eoU2HWr1ZowXGIVgIEt7L5kLtnk2b+sMLNXIUUr5CfeHqfBbgLPeLroe+vvlAZ3eIE8z
 2ICO06v/RAocVWdNF/0fFbH4i9aekkypAzy94WjTo0QJjukUnveEE6z4WJaxrT7Y2rj8
 bP7Q==
X-Gm-Message-State: AOAM530j+0kDy/nNbxtLbPmqQ72l7/vPSvEMTWMdvMWC2qb40Hw+PF33
 B12ZDM+1RmH+cfBnN2TaOdCA6Xs+Ekze6TsIfE2V7g==
X-Received: by 2002:adf:fd12:: with SMTP id e18mr5649945wrr.275.1631793598048; 
 Thu, 16 Sep 2021 04:59:58 -0700 (PDT)
MIME-Version: 1.0
References: <20210915181049.27597-1-agraf@csgraf.de>
 <20210915181049.27597-3-agraf@csgraf.de>
In-Reply-To: <20210915181049.27597-3-agraf@csgraf.de>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 16 Sep 2021 12:59:07 +0100
Message-ID: <CAFEAcA9e+tnF56J11AWcsyKGH+h+3VKKADOFGaM37JhYR_HqDA@mail.gmail.com>
Subject: Re: [PATCH v11 02/10] hvf: Add execute to dirty log permission bitmap
To: Alexander Graf <agraf@csgraf.de>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x435.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Eduardo Habkost <ehabkost@redhat.com>, Sergio Lopez <slp@redhat.com>,
 Peter Collingbourne <pcc@google.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Cameron Esfahani <dirty@apple.com>,
 Roman Bolshakov <r.bolshakov@yadro.com>, qemu-arm <qemu-arm@nongnu.org>,
 Frank Yang <lfy@google.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: MeyatkNpMSkH

On Wed, 15 Sept 2021 at 19:10, Alexander Graf <agraf@csgraf.de> wrote:
>
> Hvf's permission bitmap during and after dirty logging does not include
> the HV_MEMORY_EXEC permission. At least on Apple Silicon, this leads to
> instruction faults once dirty logging was enabled.
>
> Add the bit to make it work properly.
>
> Signed-off-by: Alexander Graf <agraf@csgraf.de>
> ---
>  accel/hvf/hvf-accel-ops.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/accel/hvf/hvf-accel-ops.c b/accel/hvf/hvf-accel-ops.c
> index d1691be989..71cc2fa70f 100644
> --- a/accel/hvf/hvf-accel-ops.c
> +++ b/accel/hvf/hvf-accel-ops.c
> @@ -239,12 +239,12 @@ static void hvf_set_dirty_tracking(MemoryRegionSection *section, bool on)
>      if (on) {
>          slot->flags |= HVF_SLOT_LOG;
>          hv_vm_protect((uintptr_t)slot->start, (size_t)slot->size,
> -                      HV_MEMORY_READ);
> +                      HV_MEMORY_READ | HV_MEMORY_EXEC);
>      /* stop tracking region*/
>      } else {
>          slot->flags &= ~HVF_SLOT_LOG;
>          hv_vm_protect((uintptr_t)slot->start, (size_t)slot->size,
> -                      HV_MEMORY_READ | HV_MEMORY_WRITE);
> +                      HV_MEMORY_READ | HV_MEMORY_WRITE | HV_MEMORY_EXEC);
>      }
>  }

Makes sense -- this matches the premissions we set initially
for memory regions in hvf_set_phys_mem().

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

Should we change also the hv_vm_protect() call in
target/i386/hvf/hvf.c:ept_emulation_fault(), for consistency ?

thanks
-- PMM
