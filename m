Received: by 2002:a17:906:d149:b0:a5d:17e5:aef9 with SMTP id br9csp1075406ejb;
        Thu, 23 May 2024 06:53:17 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWaYXEM+zlBIdH4OdOGqMIyIG/3M4drk5BOGQ6nDGOluhP/tjfaJUOrW3KDBqXn4dIG38Ydi55mueznUp0HOxvwEY34mmYW
X-Google-Smtp-Source: AGHT+IEr5cbSXtikLsZ8C2PbfD/h9WYnX3Tlsw/0kFnoum8uCSuHgQzsT1HZrMLJoyvEggtl3o0g
X-Received: by 2002:a05:620a:1983:b0:792:bf65:8860 with SMTP id af79cd13be357-794a0989bfemr507095585a.25.1716472396961;
        Thu, 23 May 2024 06:53:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1716472396; cv=none;
        d=google.com; s=arc-20160816;
        b=UhJ43Zjb1+u/gyRIpxBzHv95rmBht8hRjOtopx0qo7fronrNoLJdx0VFti9XuE3FYW
         Y07tKCAAYqBAJNCGJoeF/ke0uzyXVZ9FyZoXfZmRiB2t0CYZFc+2EKZCFxGxCk8NRYPd
         YgER7Wd7+Jr5xf17Xok/b0CBx4TYEkfQII0Wv6+5GnmpW8IRHVFevAGd3tXdNvFwk0mH
         FZ2OVRb5mjhD0x0YFglroa1E4PG/z3CdGHSq2v8SrwwsThwmicfz2f0ERbPxXXNxRybF
         fN/bzY/DtInX3STkgBeANulF0K3/blUoov73q6FYQ//C0+psx1xZIXSAC7dd6bbHsJop
         2M5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=ynhGzRyr87pQBh0sgLhYoNHNZQ7rJJWetUh4AtMRnG4=;
        fh=2NE7uReCDJv12FTQX2I0/+XfNkpnfZwi7xKvRArxSvE=;
        b=W2OeVFxN+Q/3T9UJGbtSTv4683pKa3Diij41LajrrOLSNxwfJxISAkcCjFo2PiHhFv
         YoouhpRdMWpoJv0f1/8F0HRZMrJSM71mBKzMKpGMJXaMESFPigvVDugrThUvqD1kTiGO
         BCIP3Kvp8Y2QER1OBvMH4MHpVGdmsPvF/NVlLkYjWZ/1MHiyPHMm6jzzQeB6y4bd1474
         QC41oeDuDGiJ/5C1gsQxQSYAVm+tRWWPdG65PYbOtNayl0SdjaLOjbObXlHsvTTIsrPq
         /bhgc71fqODKRatjBZOyswOB0Wom7J2LUlotRUdmLLvOHNXF/BmTiZV/PtEyxJjQVZDo
         DNCA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="M/wuAOFW";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-79318f7a7d6si61734685a.414.2024.05.23.06.53.16
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 23 May 2024 06:53:16 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="M/wuAOFW";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sA8sC-0007xw-E1; Thu, 23 May 2024 09:52:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1sA8sA-0007xK-MG
 for qemu-arm@nongnu.org; Thu, 23 May 2024 09:52:46 -0400
Received: from mail-lf1-x134.google.com ([2a00:1450:4864:20::134])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1sA8s9-00078V-4I
 for qemu-arm@nongnu.org; Thu, 23 May 2024 09:52:46 -0400
Received: by mail-lf1-x134.google.com with SMTP id
 2adb3069b0e04-51f45104ef0so7764245e87.3
 for <qemu-arm@nongnu.org>; Thu, 23 May 2024 06:52:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1716472363; x=1717077163; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=ynhGzRyr87pQBh0sgLhYoNHNZQ7rJJWetUh4AtMRnG4=;
 b=M/wuAOFWPS9+w/xmXRz/TTF7YajVUWHX4w3CBbJXuJdryHWlXmPEGyGjMRfVbdNDMD
 XwqPM3WC8y16dRFpV/YelSFhx8ThAuF9SQbPMGm0Ct4mhhdcX2/l9pRdmatjLH3GkKn0
 rPZTg7+JEW8za+kixI/Yp9+HYm/V/89li1NbTJEj6gY71vFQQHSZTTz4Y+L61nwKZiSV
 8NUh7MH1dJE84UJHXOMkF7dScMACMg2AigdSmbkJVt8xcvlFtC2661S9J8iBlqdRDkuw
 QZnqgK89pGTH1SD010GmmXDjJjczCSfAjQaSE+gynKUhyd1U5JaKaXJ4IjJpGeW2saF5
 v1TQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1716472363; x=1717077163;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ynhGzRyr87pQBh0sgLhYoNHNZQ7rJJWetUh4AtMRnG4=;
 b=fKIVPQTpiPrfvc94BkUSOBt2tKU2TFBMrpY9J+YuBjRkELIZ3rpFzDpsngtMJIVg6y
 QqdtIrTdB/WvOV09x4eK2lUEDVTMeakX85yWQS1ZmOEUvt2jj6daCllmlB/oF+vC9UZO
 U19mBFD5xPHO0+r9YhWWRjRFpkRNZQ7BP5YZq5lwIt6C18aXuDN2SibQXPC3YkNGGBSP
 tH62itogbA230brTaoua22bM1gnV81NxqeAau5Jbk4+y674kZO33RzSBeDxIwnxc1+wB
 5aiddzKIL7mLGDrCESQUfQKT3iGfVG3492V+B4xAaPPAQT2vMpkgkQNcoa+huW2EKZa5
 0N5g==
X-Forwarded-Encrypted: i=1;
 AJvYcCWDqRggbD/LAdFDBPsAww5O2I1vHZnFw5eZ1TQZybz+ndaTUNNRKDc1XFcIwzMf8WF1sk9vEl2QGnmPVVTvps7K187F
X-Gm-Message-State: AOJu0YytZUQnS+5Zp2jno2ArWUNR+OAMdgkYpPwUFKHpTqVh+zaAowQ6
 aKjcosL17zZst2INZqM0ige8U9BCjLcA80g5xSFOSus5O8l4BRJ2nehGz6GSES8SvmIWA8eHVCX
 dZaFJW2Fzu9XYSN9fX6GtdAjpjNccfHSpLyBbZQ==
X-Received: by 2002:a05:6512:3e22:b0:516:d219:3779 with SMTP id
 2adb3069b0e04-526c0d4a203mr3760312e87.58.1716472363021; Thu, 23 May 2024
 06:52:43 -0700 (PDT)
MIME-Version: 1.0
References: <20240506010403.6204-1-richard.henderson@linaro.org>
 <20240506010403.6204-23-richard.henderson@linaro.org>
In-Reply-To: <20240506010403.6204-23-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 23 May 2024 14:52:31 +0100
Message-ID: <CAFEAcA9CFW8cgKG7atPqOdpFcBZ-91dkZi1ooAfirLgO-MPvkw@mail.gmail.com>
Subject: Re: [PATCH 22/57] target/arm: Convert FMAXP, FMINP, FMAXNMP, FMINNMP
 to decodetree
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::134;
 envelope-from=peter.maydell@linaro.org; helo=mail-lf1-x134.google.com
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
X-TUID: yOvx1Sc0EClH

On Mon, 6 May 2024 at 02:08, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> These are the last instructions within disas_simd_three_reg_same_fp16,
> so remove it.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
