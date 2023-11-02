Received: by 2002:a17:906:33ce:b0:9d0:bf65:29fa with SMTP id w14csp509267eja;
        Thu, 2 Nov 2023 09:28:55 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFi7HXukdS8CO+Rkrv049y6Ozo0qDFIDWl+9aFKzrZwu+TgMUBAT29Q80X8cwmI48wZhGXv
X-Received: by 2002:a05:6870:1394:b0:1e9:b811:da13 with SMTP id 20-20020a056870139400b001e9b811da13mr19572936oas.49.1698942534782;
        Thu, 02 Nov 2023 09:28:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1698942534; cv=none;
        d=google.com; s=arc-20160816;
        b=QfPCQ/S32Lbh5CjxK+S/Q9lq8FBmWYmWD6+fZA6Q42so1PEi4cClFmUJnER81gir0v
         Go9icxn2gmTaJLx2J774QTj0zrGFe3PE++w7yYu9kYj9zwghkW4SBCXNCBf4ppwoOyO6
         cpYUNnjaPpXsNgH9aSFCef2ovVub484Bvo5IwrLRNwsIsSTM6eqcAqRip6YdxBr9GMA2
         HiDoiRW5zxzWsBzTI8Z6nqltANCp5QFETsxXOicUQPHVmphBGt0xQz+GCrWXY/H6Ceup
         gcvv0L/KKPBIJdZWTantNH4NluVCtop0enFqiTOmLF4lYZJVg+EEiF0O/AwRjLiSPikJ
         TGRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=aS/RoEt1TrnY877Sd45bYPfga+bIKxaDZM5rmeWiXxk=;
        fh=wqfvLaBYopGyGisjq/k8ulPaCl1xshcoDnGh5kvEEbE=;
        b=q9SeJorLfK5QmTazCyYtEz2ZynkoPOryaa+a68paXLUrpOQFsNx5CkmvbqZUjYb9eZ
         4Pnd+oNVeW0mHl27zqY9+g6sGAYgqQA1eHvX/9ZW0qfH+d1piOoLPwKNG3YIrO0DYQHe
         QRY7chpB9IbmVdNNaslWrVNqAOykvV7yk1H4MIUFB0q4dCFQsVTIl+t5i1giJQm8v1h+
         fzvPn/gBNjV9msTC/UAxEaiZ/cdlauyIjL8NnBVTNI1Fk7thtJmd+LRzjb/+zbUds7SU
         dqZK6NkeNMp3ZmVQgRxB8hDhj8TYA4OEcM89FYLLJsQqCo7EofOL79bj4FyWAMnOEs0g
         twFA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="oylguF/T";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e9-20020ac85dc9000000b0041e3e49e944si179773qtx.174.2023.11.02.09.28.54
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 02 Nov 2023 09:28:54 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="oylguF/T";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qyaYn-0001v2-Qi; Thu, 02 Nov 2023 12:28:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1qyaYg-0001tl-5u
 for qemu-arm@nongnu.org; Thu, 02 Nov 2023 12:28:39 -0400
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1qyaYb-00078L-O4
 for qemu-arm@nongnu.org; Thu, 02 Nov 2023 12:28:35 -0400
Received: by mail-ed1-x52d.google.com with SMTP id
 4fb4d7f45d1cf-54394328f65so1901771a12.3
 for <qemu-arm@nongnu.org>; Thu, 02 Nov 2023 09:28:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1698942511; x=1699547311; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=aS/RoEt1TrnY877Sd45bYPfga+bIKxaDZM5rmeWiXxk=;
 b=oylguF/TUrjNPnSb+Av/wD3mhReMFOnOcfh3en0mUDiWxbVcS4zE6HoVrnoIoK6JXt
 D/dKv1lTS1p6c10UjgNiTtGX6N+FQjOZDSsGY2TWO+VJpwzhPZQqvwlFzbO9cr7oW0Vj
 ZpnfQ5mctctlcM2gWZSwbYVYCRt+cunuRgrkzftreBSioHc3Verw8vF5dtEKg2ySe4F+
 THA1yd8MaEcu60Pr4Rw8XTtjnv4gD3EL1nGhtUe4ddfuyVdbYM60RhJdX54CR0abBlsJ
 Ok5toNiY9S7d8AenlP+fCCk7T072hxVDmbsDOQdNbLi/STmc2LWGcgG5sNJJKe46axK3
 ulZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698942511; x=1699547311;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=aS/RoEt1TrnY877Sd45bYPfga+bIKxaDZM5rmeWiXxk=;
 b=HrQt51oZJNqkaafwg0N8oLiB/oRvtckC6jCWWjFsFdiexjXxv8jQ+lsE/NEp4IJNaw
 qdQsSP8gyT+eNI9OFrUJ9cq8HPFjtyJlLppGhgbCu4O10NJVxZ98hUYiU4loZr3R1qf2
 4zvgTrU3D983th3VpyIJPXGkaqfYbs7TsQfdXePIX9j7XyYr7mZGrYsHAx5DuMJT1ffE
 zsF+G8hl3h6mKrHuIItuzLgtvS5+79Ui2QNAKpuTDCabfedL2YJ5+3IKyGz7I7vVC5u9
 Su6BCyJVUnE14VqZ8qOX5z19As8uWO4e7fa2R6+V81L7YYPRo+RKganf+7+0ux3P5j5O
 kZGg==
X-Gm-Message-State: AOJu0YyY4lri47SPM7Sjd6LB71KOuv5uCFWxRO3MUibhceCk9dUMxFbZ
 N/+mjYeYHBJLBSii0sL/Us3dlNlW9x+EabPx5WDmA1NJphTxNDjo
X-Received: by 2002:a05:6402:1bc4:b0:53e:3b8f:8a58 with SMTP id
 ch4-20020a0564021bc400b0053e3b8f8a58mr15017202edb.11.1698942511413; Thu, 02
 Nov 2023 09:28:31 -0700 (PDT)
MIME-Version: 1.0
References: <20231031134505.4110877-1-peter.maydell@linaro.org>
In-Reply-To: <20231031134505.4110877-1-peter.maydell@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 2 Nov 2023 16:28:20 +0000
Message-ID: <CAFEAcA-Z-eLYgoqbzUjay-nkSQXjm6w-z7DkOcCDi_L58z7Jtg@mail.gmail.com>
Subject: Re: [PATCH v2 0/3] virt: Report UART correctly in ACPI DBG2/SPCR
To: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Cc: Udo Steinberg <udo@hypervisor.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52d;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52d.google.com
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: JUNRNHKM5Mb0

On Tue, 31 Oct 2023 at 13:45, Peter Maydell <peter.maydell@linaro.org> wrote:
>
> This patchseries is Udo's patch, plus the necessary extra patches
> that update the golden-reference files for bios-tables-test so that
> 'make check' continues to pass. I'm sending these to the list for
> completeness, mostly: review is of course welcome but I plan to put
> these into target-arm.next fairly soon.
>
> Patch 2 has already been reviewed.

This turns out to break the Avocado test
machine_aarch64_virt.py:Aarch64VirtMachine.test_alpine_virt_tcg_gic_max
(which boots Linux under UEFI) -- UEFI boots and hands off control to
Linux, which never produces any output, presumably because it's
getting confused by the new ACPI table.

I need to investigate further, but for the moment I won't put this
patchset in the target-arm pullreq I'm setting up.

thanks
-- PMM
