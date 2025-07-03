Received: by 2002:a05:693c:2909:b0:17e:9665:bf4c with SMTP id rk9csp412421dyc;
        Thu, 3 Jul 2025 02:34:05 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVHTFG5W2VZa7W+VCnnnPbbMjcsW3+4CoHuZGayUcuEL5Q0UooTsjRDPCHIwo8PGnYWiWx7ARJJL4p+Fw==@linaro.org
X-Google-Smtp-Source: AGHT+IFtfWlm2VE1ip+6AhWmya5vMcoVZQOqlKn9uD43OeBY0z7LsZKgLBogbk9kkh/h3SHGhLef
X-Received: by 2002:a05:622a:293:b0:4a6:fac6:fa1e with SMTP id d75a77b69052e-4a98af9e7f2mr23030801cf.8.1751535245082;
        Thu, 03 Jul 2025 02:34:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1751535245; cv=none;
        d=google.com; s=arc-20240605;
        b=J/7eluZIbdDtsRF29gCCdeTKbVNcSao1RXY9OuALT2XzzVlZ2rbk5PTs/DCu3DG0oJ
         jqC7RrX4DdIwz2CXaFe1fLyH7Y4BEkwb2kZtF6ov9DCgeNwXCkdc54iyqWmIDVmvAl/6
         VJxQYJK/6RlfcWoCk4SXCjvOCEjB4wv59SJzLXj4OqkX39HERltvNhvMc1Xrei9VB9Wd
         7p17x5RICXx6eCgzVUupks1/PuGdV6zGHyAJ5IxrWyiPkO9SFT1kuG2IH4J4L4DGFT/1
         U8Wf88j+FJR51ulnlaz1zDixkYdcOTu5MXGZn62bEu5JraVPgn39vfsJs7qc+WPUiQ7+
         JTnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=qDNzk/7Z8Ql5XkmBp2VnyJwQr7oP/mQM40aWPFYuK2c=;
        fh=EKZkEkCy4jNECEiulMl+tqEUpFlYl/V9F1cgJR2fwmw=;
        b=KF5duq0FkQOYCezcDkZXFzduqOF+7u05423hruOrVCl8kkq7Ap6wA8PMbqk6GRwAN8
         PZcWGf9LU3R0jexzxiIQJS/+5pCGFWN8xr+lrpLZmre70uP7Oe+ICCRpRgejZw+icAPC
         tQzQdWPRKjITfJKQSX7caFx3+Gq6Dq9WosRptx8K3rcp3Tx/k1/11q6fhqAnbUVoZZz2
         5S4LgVvRpZKRV7HbqVwKLHq7hcGL9bfErJNN2jV61zbo0euz6opWupvydN45aUTaYLkv
         YOxj86B6JRGldeaku5+ERN1jPuwIww37+uZ3+Xv9/ewpCa3bbMT09/a8cOgP1Cos8K/V
         dBgA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=SykqcK90;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-4a8040f14d0si130165651cf.21.2025.07.03.02.34.04
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 03 Jul 2025 02:34:05 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=SykqcK90;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uXGKL-0008D1-0z; Thu, 03 Jul 2025 05:33:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1uXGK7-00082P-Fa
 for qemu-arm@nongnu.org; Thu, 03 Jul 2025 05:33:43 -0400
Received: from mail-yb1-xb35.google.com ([2607:f8b0:4864:20::b35])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1uXGK4-0001H1-DE
 for qemu-arm@nongnu.org; Thu, 03 Jul 2025 05:33:43 -0400
Received: by mail-yb1-xb35.google.com with SMTP id
 3f1490d57ef6-e81877c1ed6so696727276.0
 for <qemu-arm@nongnu.org>; Thu, 03 Jul 2025 02:33:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1751535219; x=1752140019; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=qDNzk/7Z8Ql5XkmBp2VnyJwQr7oP/mQM40aWPFYuK2c=;
 b=SykqcK90E5SnPpXRU6hhXUtx8o79qkGo0tAGcEhbsn5ltcDtzzQbz1zWfV8zwAK7fR
 aW3tkLI0pQ1KAuIEGql2n5QCDmddDUOwY4dDj8pj59O56J3w/ZZ0NutM+ebZii5hYOUZ
 q3mU/R4q55mmnIj0NEq6QH+b5Cp6PlFJAa7ocLKox0onUI8E5SueTag8DebXz+cv0QvP
 Pm1LHWGgIGUXHQMCjv704FJ2aD+BNFjSO7m37GRNeF5bEfPREnk3p8IGVEWHgA4/PB/b
 riWgLsN4hBFfgtvzfmNk2mdmZgufxdk5LOyY9pJP6glyXTVKoIf1h3s1hAgxl5BhLvKB
 dWDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751535219; x=1752140019;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=qDNzk/7Z8Ql5XkmBp2VnyJwQr7oP/mQM40aWPFYuK2c=;
 b=qk4XkztRxHIrvCTSLbk+bOqFIcaNdSSJtWJbEs9O5S5LFCQ34RRDdIe/gpXhkmipNA
 8jIPrkTfMD7uA5ceof+FIL23jUZ1pjD0189QOxQ7/XuCA+deeekOw+C3PDZ7khzsBW4y
 0ML7krb/+ox6GJR4DkECHPLiNfFMUUeQIFMA227/mGNXMs/BAgtT4TfXr55t8Wzeg7Ff
 lqjvI/nmHXFHXoC4Vz64YfLnysMNo4GOhkT6Vrsz0UmFwvxwGQlwiV+LqsuqnoRzszpm
 3u9T20AIpa0mz8yecT29X3TKtZm3i4G7EGHX5UTEtjFn6CMbApLOWdLnK05n83AtchDw
 bnIA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUPyEezyaD4ONefEUP2h+pKDrxQ2xSMTpPvSAbRKMe5Ci4cLPv6+gdA/ZZvhmT872dpwT70czI3sw==@nongnu.org
X-Gm-Message-State: AOJu0Yy8HuT35L51iDNKcaOgJowpxJN4rqkdQzYwMdFMOD0rKJdliBG3
 cq5dHcbb1uXBG9Y3MjWK0ctLjnsmBj94hytm50s8YmFyxyBmDvqFgX+bg0cofmVwJCKsMFxOBls
 H8sNds4P5y44EN8W1MghNuuv3PXg+B+v3JrpcpL7KaA==
X-Gm-Gg: ASbGncuq9dr1VYf7lBxUxhULG4C9o5LcAbYqONnkWsgbqj08HPzvfjYZYUeQ5zueFxc
 dH+/zhxLoCTUEjGFHGrVX4pJvf5mfH9Ge1uhkcPuUkY6hplNZ5x/VptKUzy+ekze4j163MKRAcd
 Ptx0OH9qqYqFWaX/QDl5f/MFz4Vbm6XuxaPr/lN4v0O5/a
X-Received: by 2002:a05:690c:3610:b0:70e:6c9c:e123 with SMTP id
 00721157ae682-7165c8affb2mr17761407b3.0.1751535219085; Thu, 03 Jul 2025
 02:33:39 -0700 (PDT)
MIME-Version: 1.0
References: <20250702123410.761208-1-richard.henderson@linaro.org>
 <20250702123410.761208-15-richard.henderson@linaro.org>
In-Reply-To: <20250702123410.761208-15-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 3 Jul 2025 10:33:24 +0100
X-Gm-Features: Ac12FXxe2aRH_m_GhpTXtuqo8m_T0t3Cv_XqmpU0PR5p9rzvS6cq6SbJSHbHAD4
Message-ID: <CAFEAcA-6mEnG1BKoP3FfhgrqVUg04Y1MY-pV0M69M8cvkKCo7A@mail.gmail.com>
Subject: Re: [PATCH v3 14/97] target/arm: Introduce ARMCPU.sme_max_vq
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b35;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb35.google.com
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
X-TUID: BmdTEK/UM0XA

On Wed, 2 Jul 2025 at 13:34, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/cpu.h   | 1 +
>  target/arm/cpu64.c | 1 +
>  2 files changed, 2 insertions(+)
>
> diff --git a/target/arm/cpu.h b/target/arm/cpu.h
> index 2f2c131613..b5c4fa1e80 100644
> --- a/target/arm/cpu.h
> +++ b/target/arm/cpu.h
> @@ -1118,6 +1118,7 @@ struct ArchCPU {
>
>      /* Used to set the maximum vector length the cpu will support.  */
>      uint32_t sve_max_vq;
> +    uint32_t sme_max_vq;
>
>  #ifdef CONFIG_USER_ONLY
>      /* Used to set the default vector length at process start. */
> diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
> index c5c289eadf..8400c7b567 100644
> --- a/target/arm/cpu64.c
> +++ b/target/arm/cpu64.c
> @@ -343,6 +343,7 @@ void arm_cpu_sme_finalize(ARMCPU *cpu, Error **errp)
>      }
>
>      cpu->sme_vq.map = vq_map;
> +    cpu->sme_max_vq = 32 - clz32(vq_map);
>  }
>
>  static bool cpu_arm_get_sme(Object *obj, Error **errp)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
