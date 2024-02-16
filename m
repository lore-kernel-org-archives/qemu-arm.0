Received: by 2002:a17:906:d9da:b0:a3d:1c09:7d3d with SMTP id qk26csp1227588ejb;
        Fri, 16 Feb 2024 05:33:04 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCXWeTzSYbtcCrVIPwiXD/QqQLJPmJ6InSpfIAE5sTEV2AAdOqMMark0SY+5Ex4b99EdmZm/JXcPiCJBMZmR9aimhXA+7LKX
X-Google-Smtp-Source: AGHT+IHey92UHX28JDoc1Zdqf3T641h8qqmsx19kgEwym+uUaEyoJ4LSZGnGFDhjkKZfma8KlTS/
X-Received: by 2002:a05:620a:2450:b0:787:2045:f065 with SMTP id h16-20020a05620a245000b007872045f065mr5464667qkn.76.1708090384284;
        Fri, 16 Feb 2024 05:33:04 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1708090384; cv=none;
        d=google.com; s=arc-20160816;
        b=H4zPJX8XhvMrhJZJonAxUcKJoJicO/8ftdjPd6EDubBd8ahowzjupxrkGJTCLr5rsy
         ObbDbNEBkz/CJOCL7DdHloEq91U0YDnLCX7G3In6URE77Iws7AqzzN7lQ3J18/89b3pg
         X2nkr+BUkF3DRuRLKZGkUCsDLYSNgvnTKA8nwavfemA0Hs6Cgyb6q1PHnMFeDJIEsWMq
         Jyj6d+CGV6wI2aTTn2HuiYU8KJhPNQGwxbhuGd6mWKCqyDa911NEc5MUiLpuyv7lMCst
         lrudDKFi8mjjWDo4rIOWkQxnUxQ+QtbYFd0HMfwVOhDi/Coz2GaEq7Ow+t21Q1cpBr2i
         fx7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:cc:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=PzJgKTk6oQCLti81wrouZx7gcFOfV6hihKb+qQVWWns=;
        fh=NYRA6SbmiRfDSD/J6PzXBGJru7UbL3oojuGHy+Aahsw=;
        b=aUsZ+xJANcosk3+qp42gUbaQDTFNyvZoZB5WU3+gfDpUoTkW213BnDcJmbgwBQ4eb1
         deYwX8L20Tj2ehdVqCHkY6pOXNNz5JR2IhaxUqlGNx/o9yarMPrVZ7BLTrZTbuLF30YI
         hs5tifDVUxynbMa3BXIyVVUSnhYE2aZFkBk8URvpUVo8NlhNDt9jrK8VTSqcCxatUqQD
         tbMjYFHkxT0cFLZKQmHmPchaHSXOQ4uUh96a5yWNzFC3JCEQVsPInmD5886atvAm1NnV
         28vZfFtusvGyodgSKIoQoNhHtR2idbasG9t4nFmNv+IeBTAM5xaLe07GsnABJUk2uD9/
         TQHw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=t8gB6k65;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id bj24-20020a05620a191800b007871ffcba48si4520853qkb.311.2024.02.16.05.33.04
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 16 Feb 2024 05:33:04 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=t8gB6k65;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1rayKT-00084R-0I; Fri, 16 Feb 2024 08:32:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rayJl-00080v-6z
 for qemu-devel@nongnu.org; Fri, 16 Feb 2024 08:31:54 -0500
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rayJj-00069V-9X
 for qemu-devel@nongnu.org; Fri, 16 Feb 2024 08:31:52 -0500
Received: by mail-ed1-x52e.google.com with SMTP id
 4fb4d7f45d1cf-55a5e7fa471so924923a12.1
 for <qemu-devel@nongnu.org>; Fri, 16 Feb 2024 05:31:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1708090309; x=1708695109; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=PzJgKTk6oQCLti81wrouZx7gcFOfV6hihKb+qQVWWns=;
 b=t8gB6k65uxKSg1UmjlNl8z1WYysQF/lv+6W2AAvxBZVPaX+NdLa/o2+gt8Y5hZZRAG
 Xhs223KhZVKe8a2rUJASklvpJc0NVYMp0cEmfNTzyk5QQy1PJOOOcsHQSrb1UvOzqBZN
 DuJ98rnX8z0fSF5mxtYnODbpgyj5e/IbMIh7JOgC9KBE0N8buM9VrbtE3oo86cyd/KUs
 PIX5exuwzwdEXBjomoDQaFGB+jYIBYRkQP9aDIbK2fqYlYW6V217gfI1rFOYM9ZZDOc2
 zYBDg/zf811ThDhoHA/QJAtPkecTRs9aYfyT4W2W2A1MVcPGDGNa2IDM+dAfk+kSaop5
 0t7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708090309; x=1708695109;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=PzJgKTk6oQCLti81wrouZx7gcFOfV6hihKb+qQVWWns=;
 b=dUNvYhez4MaUzSP+ILemPkN025UEcZ/35C6wnca1sdE3VK3YUmIcImqDELubLb2yeV
 EC5lJ9Nv8sdPxUEZNW1Z1Mai22SIDD606fjLeQZOxeWxK+q/6tSvFs0VHmd434OgRHwf
 WxiRDEReEuAfDb73WB9jfRgjZPpK66NoHyUn6+bphH9KPSrhudo7sOZkbiNlOTgKGL+W
 ej9laCrGszTSdWd/ySsDfaeWD+ib+m5NYxbn8evc3W5Tzud7/YKb9UUCnD6vBYG3wn2L
 EIDbx8y9oxE0cDTftp5/CbIgKYvrH1l0MApIwv67RKgcM1uf/j7HAmMvoXEpmWMniRj9
 Gfog==
X-Gm-Message-State: AOJu0YxiKYTNiq4vbXi8bmer2Da31od/Z5jaYcb5n1scZlGog/496d6Q
 MeKJ+8Wb9/GN9GYEeL0rh3cftKLMdp0JsdoOFQ7rcYDj27F48pnsu+J1K8kos++GvXqr+lCV5Hv
 Ik77SBJkbJLkABKD1mdJqWbqqmtKw5K5TVVHS/g==
X-Received: by 2002:a05:6402:2812:b0:563:c54e:ee with SMTP id
 h18-20020a056402281200b00563c54e00eemr4336911ede.2.1708090309554; Fri, 16 Feb
 2024 05:31:49 -0800 (PST)
MIME-Version: 1.0
References: <20240215175752.82828-1-philmd@linaro.org>
In-Reply-To: <20240215175752.82828-1-philmd@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 16 Feb 2024 13:31:38 +0000
Message-ID: <CAFEAcA_UUiJkpkBfxJhWPfM+WecX3cU-md22pXCjeeb9aPeaDA@mail.gmail.com>
Subject: Re: [PULL 00/56] Misc HW patches for 2024-02-15
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-ppc@nongnu.org, qemu-arm@nongnu.org, 
 qemu-block@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::52e;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52e.google.com
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
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: kun4+41y0FOO

On Thu, 15 Feb 2024 at 17:58, Philippe Mathieu-Daud=C3=A9 <philmd@linaro.or=
g> wrote:
>
> The following changes since commit 5767815218efd3cbfd409505ed824d5f356044=
ae:
>
>   Merge tag 'for_upstream' of https://git.kernel.org/pub/scm/virt/kvm/mst=
/qemu into staging (2024-02-14 15:45:52 +0000)
>
> are available in the Git repository at:
>
>   https://github.com/philmd/qemu.git tags/hw-misc-20240215
>
> for you to fetch changes up to 9a4b35f57eefbfc6977ed47d1f19d839e9e4784d:
>
>   hw/ide/ich9: Use AHCIPCIState typedef (2024-02-15 16:58:47 +0100)
>
> ----------------------------------------------------------------
> Misc HW patch queue
>
> - Remove unused MIPS SAAR* registers (Phil)
> - Remove warning when testing the TC58128 NAND EEPROM (Peter)
> - KConfig cleanups around ISA SuperI/O and MIPS (Paolo)
> - QDev API uses sanitization (Philippe)
> - Split AHCI model as PCI / SysBus (Philippe)
> - Add SMP support to SPARC Leon3 board (Cl=C3=A9ment)
>


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/9.0
for any user-visible changes.

-- PMM
