Received: by 2002:a17:907:8744:b0:9bd:85f7:2662 with SMTP id qo4csp3306639ejc;
        Mon, 16 Oct 2023 09:32:22 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGgJu2uwmLAGBxrhjLNEfdRgwIj6wkiFchNDQsV2BFOqZ38WcvUw23lx1ymfP976nMb6Uio
X-Received: by 2002:a05:622a:13d1:b0:412:d0b:12c0 with SMTP id p17-20020a05622a13d100b004120d0b12c0mr43404794qtk.22.1697473942355;
        Mon, 16 Oct 2023 09:32:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1697473942; cv=none;
        d=google.com; s=arc-20160816;
        b=j9kvfLMpc4+vOzovGr6+WryQXIPvMEm2adm4s+xBlVyyqUIbd48XcrpDBnubthT1oo
         RBqPGMWizUaqfSYQ238d99qlYB551j4luEyXKyEmS+fGw9Sw9KOiUGsfgw1NswF8+Nte
         MFqN/P2xBnFXSMTJv+aBBsXMisFqAyN5d6VzB4xsMy/HJhqDVvYUnsgqeEa+ewvluihS
         w6TNYMSkBCASqLo7bR/iuf3QAximXjap1iOMhlEr5YarmO/tEt6eHXCwVZ22E7NhSdZn
         KV2jq3P0UUmWPhlboz0TNeYRP94WBBDnUfbn9ZD6d0IIrRRFnbnsWkzRQFu5t9R68JWt
         bbQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=qOs686La6Yfor4hdI45g0uJv/XusOOLiHD/JINbFSUI=;
        fh=j/v/ufwsVFWAxDisQ+bUJlpLZ9J2BcNZvMYjnEqO56I=;
        b=NZhJWznmLtSBy5Y7/CGGgBCk1BsCqXd8NGD6xQ4swzPsgsNs8ntA8/53E+9+Q7yWeW
         suiL4YUJ3iTkwkan0PTcrG3xCwdY9AMLCAx6Rbc3z+qzeMxPeVYZlhL0iKvWyFPCpDSZ
         0yIoHyfvziPaSWihHzc8loFPqNK7WupSiT1xlWq2zsb5QQ5txAkuWTndclSEmmeKGSUC
         LgghJKXhrOg4hs+sTXcxtG6SYxik9z5CQNftyK6U3sUTy09acSial3HfKhJK4XjADUNN
         zxf6CTUsM3LkqXbzOlHzK8pLVQk4cpcdaecrtOTEBbnsXbVCgf0HTsIT98RMXr5QuvlB
         p5pQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=hCVU095M;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c19-20020ac87dd3000000b00417f817da78si5762464qte.565.2023.10.16.09.32.22
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 16 Oct 2023 09:32:22 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=hCVU095M;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qsQVl-0005Wv-U5; Mon, 16 Oct 2023 12:32:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1qsQVk-0005Vn-Iy
 for qemu-arm@nongnu.org; Mon, 16 Oct 2023 12:32:08 -0400
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1qsQVi-0001cA-Ud
 for qemu-arm@nongnu.org; Mon, 16 Oct 2023 12:32:08 -0400
Received: by mail-ed1-x52b.google.com with SMTP id
 4fb4d7f45d1cf-5230a22cfd1so8301028a12.1
 for <qemu-arm@nongnu.org>; Mon, 16 Oct 2023 09:32:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1697473925; x=1698078725; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=qOs686La6Yfor4hdI45g0uJv/XusOOLiHD/JINbFSUI=;
 b=hCVU095Mk/FFy1GpRbU4q/ZFa62jUFzvlKyfuzpprkmfVev9jZ4QR8TbaPKvKskCdI
 ZuaC0H0ioBECOHEEgiNtXDvoRubkzFfUGUYQtYhNY9EbVzvn9Gglkzt6o5RN/RND8nar
 TVHXo2SpdmuBMrYUziXBWcQud4YGk5Wffyp2/NITr9mTTDq9R8xjCOnSs/ibNqZVxB7L
 ArIU0YxTPWFSKtl6nQSxeorEwjwjusVSpmH76tMNLw7CsjiGJA8vthVTIUj3VDXolPRC
 wJCG5ID/jPtnFa5fpU+4u3srAVW0W7j5Ft27KoxB8orT9pWGWSgZ3+X2bRX3nweTxknz
 UF1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697473925; x=1698078725;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=qOs686La6Yfor4hdI45g0uJv/XusOOLiHD/JINbFSUI=;
 b=taInX5B9jPkHnUP74VrMrLS8sLIIbxvyJ2jzZtH07Ol2kJ9cdfXEpX/D27dzenMu6r
 a8JeWjsteMP9AePyOmHroa9vFp0pSJFH88TYjvPTGFR+qLsPQK1xri5V6hWSxYyfd+eS
 ClsXy9jwxLss5a4hI+uFuXSMd+DGMmUQvK8wiRhSYT5oUzK0z0J1ertjubv4o5jv92kG
 x5OGqcF3yBh2xIMTMwfxlqIZJuBUTJPplLhROK1gCM4H3S6wQmhyVLwUlGbPeAXULcpf
 8k586gdvlOfa2YyfvnEygNDcV6VPqQ0rtSQEY+b2OadG8H7GIsmpCDrgZ84FGh3I09g4
 KQdg==
X-Gm-Message-State: AOJu0Yzk2zblO/Wl57sbV5TmdOq2NqPkVyVk5K6Q9hjKhJkxApoRqECW
 51lJGg932KZxI5dkMU2cVgAOVzVwTv4QRAoRVYgKsw==
X-Received: by 2002:aa7:c998:0:b0:527:ab3f:4350 with SMTP id
 c24-20020aa7c998000000b00527ab3f4350mr29494909edt.38.1697473925339; Mon, 16
 Oct 2023 09:32:05 -0700 (PDT)
MIME-Version: 1.0
References: <20231004055713.324009-1-tong.ho@amd.com>
In-Reply-To: <20231004055713.324009-1-tong.ho@amd.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 16 Oct 2023 17:31:54 +0100
Message-ID: <CAFEAcA-vTFaQNeKRAN9hKX+jGR4uK4qbj3YeFNr3jz5vfv-tjA@mail.gmail.com>
Subject: Re: [PATCH] xlnx-zynqmp-efuse: hw/nvram: Remove deprecated device
 reset
To: Tong Ho <tong.ho@amd.com>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, alistair@alistair23.me, 
 edgar.iglesias@gmail.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52b;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52b.google.com
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
X-TUID: yLREnlxJ16It

On Wed, 4 Oct 2023 at 06:57, Tong Ho <tong.ho@amd.com> wrote:
>
> This change implements the ResettableClass interface for the device.
>
> Signed-off-by: Tong Ho <tong.ho@amd.com>
> ---

Applied to target-arm.next, thanks.

For the future, if you have a small set of basically
similar patches to related devices like these reset
ones, it's a bit less effort for me if you send them out
as a patch-series rather than as separate individual
patches.

thanks
-- PMM
