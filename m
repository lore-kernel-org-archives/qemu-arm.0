Received: by 2002:a17:907:1627:b0:8ed:b3f:fd98 with SMTP id hb39csp1792791ejc;
        Fri, 24 Feb 2023 05:54:23 -0800 (PST)
X-Google-Smtp-Source: AK7set9glKq8zRdnEgZupgrNTcZfyHZksqltko4SaeawaW+hg4d4R45EkJzKZ896SUxSTHCaWfGQ
X-Received: by 2002:a05:6214:cc3:b0:53b:d514:724 with SMTP id 3-20020a0562140cc300b0053bd5140724mr28448748qvx.26.1677246863649;
        Fri, 24 Feb 2023 05:54:23 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1677246863; cv=none;
        d=google.com; s=arc-20160816;
        b=iygLJaLzDM0buJnfNHvWJymGKaLyAjjfjBf4FWAe6Gu/Rinzac7NT3a9ydRAfpxVMU
         fGDgU3xI5HKiLJW1i7x83KhxZ1Qrk8Leebuwdqn1NwlRRKP7XFNVmz7WTbeomAHXgCnd
         KVNtdxE7lTz3AMFehz6NXWOiTLDd5a8z8Bum3WHd3YLOBU2c1HWTTlIHZfbjrxdbSMNX
         dPRJmiJ5+LD2dMHmoExxsRq+9aRlbhrCILgLSUI5IPdV6RBSw2W/o/3zGt5y/xb4/CCU
         UUnqVz5QMWvYrLSGrvVFe0vI466g6Nltn8M8tad2ht0Rxc+T0xtV+D3JirBzPyvOW0kD
         w9bg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=KfDAnPFWBRG+VjGaHVnTNPd15rQOW11NyQTPxEG11GI=;
        b=fp2DO0jOIOalewAfuiD4lQkGOz8bDl+RYXYwr729TFOj7GzMEHX/5aviaSrscfZIIZ
         lqJzKL28Iv/4CeiYS2mlDKW1jr2xyjV2vqQV/4CKT7p06QMAVeYv8h+++8+h27fe7ssS
         NDeCelDQ8VYDbTv+AOpogNvjacI0RcMnHBbcIi6Tj2N+bAio6VRWLHWaVm1bxX0dfw+n
         xM1GqCrvsk5vBBN/s3R+o8C5MnBFIQORPztRevbmi2gkHPtWaK5w+FJkyqhAn0seJ+a+
         H1wjV7BwEi7bwPZ3IfujlVgbBfvXMLbB0f99twYWxw2M5Ra81gq8hHbzSYV/9hxI1LDk
         KD4w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=lnDVGRCD;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id z20-20020a0cda94000000b005724870333dsi4133100qvj.411.2023.02.24.05.54.23
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 24 Feb 2023 05:54:23 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=lnDVGRCD;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pVYWg-0004k9-0c; Fri, 24 Feb 2023 08:54:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pVYWb-0004jE-Hy
 for qemu-arm@nongnu.org; Fri, 24 Feb 2023 08:54:14 -0500
Received: from mail-pg1-x52f.google.com ([2607:f8b0:4864:20::52f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pVYWZ-0002Bw-OY
 for qemu-arm@nongnu.org; Fri, 24 Feb 2023 08:54:13 -0500
Received: by mail-pg1-x52f.google.com with SMTP id s17so7599988pgv.4
 for <qemu-arm@nongnu.org>; Fri, 24 Feb 2023 05:54:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=KfDAnPFWBRG+VjGaHVnTNPd15rQOW11NyQTPxEG11GI=;
 b=lnDVGRCDt9orEeDTuBKJaOYKdkxRYcR4yZIl+9oIWE4/uDrPmUEDY41fy5r/jLCI2B
 XVO0QIk9kLiK0sYY8IZeBWtADdEYyMAXI26zHOrjqbNTSP2AtIvicg+nfz7RcaKUjGc8
 23xJifiOxHByR3Ck9PIh4iXtiT15a1ltC6xuM83lEBaRuvFtdJOjZaXc7d7wTd/MJS3h
 T+dkApC6avC5S6wGqcc/84I0urLoYZEyydxC71EtifctmZUJKfN1KaupgoVE45xxZMlY
 5iRh/PeszzaqyGpR/ni+MxoQsT96w5uEar1+hxMqB7Ua7vzbVqh7fLmBp3zsFhl93mIm
 tsgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=KfDAnPFWBRG+VjGaHVnTNPd15rQOW11NyQTPxEG11GI=;
 b=Ttijp5AwJjErajvGxN2gjcxRWt3TIrh8z+oIfQiZvaqNwz/Y1CJC/5/AnYrEAKYx4b
 bRGeXTVGpl18EaXDAVI/o0E+kXjMtcmeW13t+RRKH0YsQqw5LkCtM6+q1gnaQLop5BEW
 L+CLNrn8A8cYydNQwrIxioCmRl9sTe+zXJLgKjcksJhjXgVRakqJqq9jdlIxc6DYU0Mu
 vynup2fLBoVC2SNhPXrfqPywNMMmJOhpJMPjFAJgXCEikpGJ728KRBN9h8FGdwW8d6Op
 FdTSPbJQ+M+EINMLzkUU5S3l7rRl0zAts8mMcqdAoEXUbQofrjexALbKxpXWKBnswjTz
 wgWA==
X-Gm-Message-State: AO0yUKVxrZrDe3rqSwgLOjTVzVrSFS+r2B+l0Qcwepdv5ySSYHYqhehu
 9I30AearzGNwySnY0Tg8MXerjVV17MHvyr6to7+H9Q==
X-Received: by 2002:a05:6a00:2d94:b0:5a8:aaa1:6c05 with SMTP id
 fb20-20020a056a002d9400b005a8aaa16c05mr4400918pfb.2.1677246849809; Fri, 24
 Feb 2023 05:54:09 -0800 (PST)
MIME-Version: 1.0
References: <20230222023336.915045-1-richard.henderson@linaro.org>
 <20230222023336.915045-5-richard.henderson@linaro.org>
In-Reply-To: <20230222023336.915045-5-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 24 Feb 2023 13:53:58 +0000
Message-ID: <CAFEAcA-mzXuxgfrkU85k2PDgvRwy5_e1cBb-_1gwXdH6eQJAQg@mail.gmail.com>
Subject: Re: [PATCH v3 04/25] target/arm: Rewrite check_s2_mmu_setup
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::52f;
 envelope-from=peter.maydell@linaro.org; helo=mail-pg1-x52f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: Ww2Dcl3Xy4nj

On Wed, 22 Feb 2023 at 02:34, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Integrate neighboring code from get_phys_addr_lpae which computed
> starting level, as it is easier to validate when doing both at the
> same time.  Mirror the checks at the start of AArch{64,32}.S2Walk,
> especially S2InvalidSL and S2InconsistentSL.
>
> This reverts 49ba115bb74, which was incorrect -- there is nothing
> in the ARM pseudocode that depends on TxSZ, i.e. outputsize; the
> pseudocode is consistent in referencing PAMax.
>
> Fixes: 49ba115bb74 ("target/arm: Pass outputsize down to check_s2_mmu_setup")
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
