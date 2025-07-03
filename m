Received: by 2002:a05:693c:2909:b0:17e:9665:bf4c with SMTP id rk9csp513528dyc;
        Thu, 3 Jul 2025 05:54:14 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWAskd/QC4xEpEtB5GHc+U06KFfx20xZTcDCm4iWNmj5db/xqug0U55k75966ufqiUoGpJYGNT3jtxusQ==@linaro.org
X-Google-Smtp-Source: AGHT+IGH/eZVJN0HSD1R3poVNbQ9xBIIi0GxO6bOMSQ8FMUC6TGGBAdIQbIIoEqx2ReuXEpGg3NB
X-Received: by 2002:a05:6214:dcd:b0:6f5:3cae:920f with SMTP id 6a1803df08f44-702b1b376ffmr109128596d6.27.1751547253841;
        Thu, 03 Jul 2025 05:54:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1751547253; cv=none;
        d=google.com; s=arc-20240605;
        b=ERWcFOiHMx09DakGM4ZjdFEmgjfUbmk4QPs3eo+OTGjQ5bVvUDW4fBVx8ARfIgigGQ
         q4HpMctiERh0C8Xbr430tZ17nV9U8TOmBOygjbBz2CgoNegpKy1M7JgoFLShlG5zUGDm
         UO7cLfcXYumSe6odqwkz3C2sqNJvZgPcPV5UfL0CbQYbJ7BVnPhPEzLQWnSxNumiNfBa
         7tfEx73ZyTcUmaUghd1a9N5V7TBZRz3DuUIH56Ef4gdeFc2iEnm35LxAv6xj/t9Qyo47
         Pnf4MqmjQfibyV4r+CGGj+kHBAvLrL/xZnRVu9hhHzB9PD4xXz9IzwgiKPwJyppX72mL
         y/Eg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=q48XdcF4tFMmxzGzPCV/CG5KN8deHO+RM21kqPZKR5A=;
        fh=c+vyGLrV35gjXUp2e8vxzBk/2g8N6FCsOmYY2YRb8DU=;
        b=T/yzKe6w06UfCM4NL6o8WL9GFdp2UIJ1RWoJ5EkRuEACBLAtzIyt+gKcPUBDUG7Vbl
         I4PaF7uKRKLgrrcDj0eH/wsRzf01xLP07vUvrO9oGO8BQwVeGuichsJObMTyMoJmu7xK
         z/EbnIYH9ROl6Hkeqxhh/dGlKOWl6BTz1+vsuzgiTpsmlQP98F8wLKU+EKJyKlnpe/K0
         MrJuWTeUd3mIJBut0vUfNZOGs0hKI5N+bhcLl+7RzKnRRAStQwi8n603L12lUgoU8dV6
         +wgqmpmMyAp7LjbvC2P80iy/axMpNKjAHWDLEIFrMPOfZ2RMwtgUPkhpq77vULxR+bgS
         2gqA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="uQiRzq/v";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7d443275be2si1500191985a.455.2025.07.03.05.54.13
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 03 Jul 2025 05:54:13 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="uQiRzq/v";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uXJK8-0003tf-M6; Thu, 03 Jul 2025 08:45:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1uXJJz-0003iP-VI
 for qemu-arm@nongnu.org; Thu, 03 Jul 2025 08:45:48 -0400
Received: from mail-yb1-xb34.google.com ([2607:f8b0:4864:20::b34])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1uXJJv-00065s-B2
 for qemu-arm@nongnu.org; Thu, 03 Jul 2025 08:45:47 -0400
Received: by mail-yb1-xb34.google.com with SMTP id
 3f1490d57ef6-e812fc35985so6439312276.0
 for <qemu-arm@nongnu.org>; Thu, 03 Jul 2025 05:45:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1751546738; x=1752151538; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=q48XdcF4tFMmxzGzPCV/CG5KN8deHO+RM21kqPZKR5A=;
 b=uQiRzq/vGtu6rIg9hNxADiofnrNxTkRgxbw8FnTgVsABpgJ/LFxDn0PCa6PCKnQ8gE
 7pgzShtcl9UzqHthTpWVltJqOK33tsSQNgq+2zRWxN0NYZzdiv5pvD+dC958AOi/F4Lb
 1DdCO2nv+qYwDEEkVMPrUOAhftFUMjAzi4akpSFB+wniGNsGM/dolggqXzRbpBvtqaCm
 Us9/3pO7qwosueZdELWLTmCrg/d4yPvFNRdn7z5THMHa0qSWhG1sWK1vQcwiyovDtJqS
 xrnXv0ey9plGxvGIzGunbJDN370qBFewlQpkDeaLUw6tKe9OHjp2ITJlEMKzYIR1c+dw
 RY3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751546738; x=1752151538;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=q48XdcF4tFMmxzGzPCV/CG5KN8deHO+RM21kqPZKR5A=;
 b=piuqHW6k6L9vFyCB1ERJYfnF9klk+lmlaNmIt3NfA2z+5E+hSoO5BnR4O1f4AZNqGb
 eckCdfmuN0joKnnHK3frz048Mj2Ofrn2zZVgeDBkTCUJi9w0ZVcIiGqIyBAtkjWpv/QI
 MCUMEKsXYq72NN8B5URX+jYVj37E2ju+Xq/yBKYWvGvDU8sIJx2fPFtqYMyOGAFUARAy
 sCclpC0TQG9Ymry7vWK0ecVty4P3KJ9xLW1IhsrIvi7WCwDHF6r/xK8EBkKt5hDLQTBq
 IQ0aPH1iOeYqSGj8nQ/uBylIZvNcxbiTt23P+50MlgquUDNDk6XmaMkqpQcTfqS0+0Ux
 6TLQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWIhqvhmLxqTthKz7PMmEHy84nLmD5YnNEO54UyrkrDUEi89UPvS3/6s2HRs3G9lpzPJ7DJ73DYew==@nongnu.org
X-Gm-Message-State: AOJu0YzhXbCYMIMUr/qyyTuYeMzF87lPRM95faG9XUOT2g+Sa+AO+vAw
 uj/jOuppaIR2Q9RupPMT9aRVBhjSK2E1uDc1CvdyE0JfbMm3kh6Qrd+F7hCaJQeuLCL0WiCojHh
 8bi/Juaut9ri+NOBRUe+L0cQzDkEN4zvuiZ47Z42B0Q==
X-Gm-Gg: ASbGncvjnyM68hRMaMbE0mOVQm6ygu9BB4aogxccJACD29KKMxTTlPPxcOQY9IIhiDh
 7MCEywH7WNv3fQyVuDzNihEPSy6/7hXGc3fmX7+kmZHidf27EQxTFbAMXoNYpYFRslvCMg388IE
 ka7eKheYZKtVz1OhFQT2PHDiV0e+VKWaAsud8AuMRL14fQ
X-Received: by 2002:a05:690c:b90:b0:714:583:6d05 with SMTP id
 00721157ae682-7164d525662mr87271757b3.32.1751546738286; Thu, 03 Jul 2025
 05:45:38 -0700 (PDT)
MIME-Version: 1.0
References: <20250702123410.761208-1-richard.henderson@linaro.org>
 <20250702123410.761208-93-richard.henderson@linaro.org>
In-Reply-To: <20250702123410.761208-93-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 3 Jul 2025 13:45:27 +0100
X-Gm-Features: Ac12FXwVHmd_e5dx9NMu0qyzSvuR4RmrHw72xD9iaSWMhpMPXz52R8z130dj58I
Message-ID: <CAFEAcA_PHOjoqhUjDZ-V+MYp4bDXm5inuq3MDXRWA+mxMNgjCA@mail.gmail.com>
Subject: Re: [PATCH v3 92/97] target/arm: Support FPCR.AH in SME FMOPS, BFMOPS
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b34;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb34.google.com
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
X-TUID: U+iHpO9jVCGt

On Wed, 2 Jul 2025 at 13:42, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> For non-widening, we can use float_muladd_negate_product,
> For widening, which uses dot-product, we need to handle
> the negation explicitly.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
