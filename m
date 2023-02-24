Received: by 2002:a17:907:1627:b0:8ed:b3f:fd98 with SMTP id hb39csp1764092ejc;
        Fri, 24 Feb 2023 05:16:59 -0800 (PST)
X-Google-Smtp-Source: AK7set8TnEyKf9NjITvpMZegvnHS05dT/e7dmgbLv+5Io5LmLFXNTy82RMUzGzhu7em2EJqs684F
X-Received: by 2002:a05:6214:624:b0:56e:9e34:9298 with SMTP id a4-20020a056214062400b0056e9e349298mr26183175qvx.8.1677244619357;
        Fri, 24 Feb 2023 05:16:59 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1677244619; cv=none;
        d=google.com; s=arc-20160816;
        b=VaxitK/NNDiLkvLoLAek0juKxNwwQsflW7YsIYFFVvAhD0DKMhEDJczmVpS0zqeRxq
         dhacaPrBYBa4wQ1j5Po0lfKzwmtR5jvbtWKwvtRL+K8f/pn8/spSz8ohBx7yLpkTSHqi
         NYg/Ccz4qeR69eFCoJU0NsOEdI5CznQNFYfrFlCStNkQgIc9ODuUkRF6vmpAyFUoERIc
         4OzPPsp8L/i3TSmCrV9Ft5ISvwnwLk5750O555E99mwuj58tRX8K71xpmKHxfRPxd2iH
         CHQ5yhqtJOTqOm9WoPa4qrlJl0Pt+sM18LrHdMrdVln1K84biqFLaVnCVD1KDikfP77R
         KWcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=TymG5Qdxlj2e6/kLciKqFvOE7kSo5QeuxUG+AjSTkRg=;
        b=MA1jFB4iMVPtnxxlLG3F4lLMcbZ/irokc8zqhSGGRJurc30y02bydTQ9h/N/T754a0
         1i/ZEPLukWFypL3OjNI9fiIxM6ZcJHlKi6DoczLc65b/YQtgeY9QQZhvSw1VIRvBZaWP
         CGxNZr8ydKt9qONrcDsRZnVQ82//zOLcT3goXMx9FXJIYxxKDIjb1f2m3v0fSoGK3Oov
         zY35uIDoMOqiWJIHnziXaTzsCUL97EFkOY859PurOL9R2yLWB5Ib2lZ6DRmICqHumhLK
         KBc6XHD/Il/wxFsjle2tBysvmSh/hFfLJAMnDJLxl7luLvcRj6gQdMOrgQqTBqlUWQyA
         v3+Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=WeJgBX21;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h13-20020a0cf20d000000b0056eb364bd43si2975550qvk.429.2023.02.24.05.16.59
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 24 Feb 2023 05:16:59 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=WeJgBX21;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pVXwN-0007pA-EX; Fri, 24 Feb 2023 08:16:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pVXwL-0007ok-R1
 for qemu-arm@nongnu.org; Fri, 24 Feb 2023 08:16:45 -0500
Received: from mail-pg1-x52b.google.com ([2607:f8b0:4864:20::52b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pVXwK-0002UR-Cj
 for qemu-arm@nongnu.org; Fri, 24 Feb 2023 08:16:45 -0500
Received: by mail-pg1-x52b.google.com with SMTP id s17so7540922pgv.4
 for <qemu-arm@nongnu.org>; Fri, 24 Feb 2023 05:16:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=TymG5Qdxlj2e6/kLciKqFvOE7kSo5QeuxUG+AjSTkRg=;
 b=WeJgBX2111EZ/pq/nnHnGhfHgQjPQj8qrm1CpUL39CcuRJ/qluuX3j169UPX39x+UZ
 p3BSPry2nMHLLGAMfelfgqmz/fraKPVqla4+pFIAe4g4/krj2zkInGgiTvp1wOcN8nJH
 ANqu6vWKkwyZ1wFaX5WIkORP/xzYySNxQOdgqquzjIEJPFYhwrCIrwYKiy1EWKo4zaoR
 PZKMsG6xQWW9YZ5ekk18I+oAMztB6g9s5AeySgs7mYfFnaOfo6CK7XyWoGB630KDC94+
 WqUC5RbCR+Jr9IsQhwuEpPqI9q/hIcj0g3zipaSvTppcCrKe7vssHHAW7GRN4LiAje9w
 vqAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=TymG5Qdxlj2e6/kLciKqFvOE7kSo5QeuxUG+AjSTkRg=;
 b=fOFTkjPDFM/IlC9qdg+y14AKRY73rcJqcsbgZpQfzeffbh3VWo9YYTOXFPY8Y7HSou
 ZeZI52N0DokToionA5T4zXRdRFxQWMdCxOlrCGr+xnniUsBqifC68SksU0M2/L/AMBVn
 maUIc3N4Ce3QYFayPvmaxZWmY4+wd2sE9qiy34sEYESVosdoMUJbVBwGM8rrHQaVFhR8
 FSSjnOS2frI/xZ0cENSCrp6i+cSDc35DNUQK+fq0dnL6sNxoZrJgpNhF4T/KZ6xRHQi3
 816Dp+vhYS991q+4qASK2+XyJgcd1rvIYb5PLdeo2L+/7KX43qIflL9pe8Y/nxHJH/ij
 jveQ==
X-Gm-Message-State: AO0yUKVjbWmMqWSpDWvJZgzzd55gEqRkNA9n8NAsb4bdQUEbiisPO1Au
 XFOH3B2M97iWaQ/yQgUJ6IoxWPsrnh2hM5NWlEel/w==
X-Received: by 2002:aa7:858c:0:b0:593:c9dd:9069 with SMTP id
 w12-20020aa7858c000000b00593c9dd9069mr2935064pfn.5.1677244603083; Fri, 24 Feb
 2023 05:16:43 -0800 (PST)
MIME-Version: 1.0
References: <20230222023336.915045-1-richard.henderson@linaro.org>
 <20230222023336.915045-4-richard.henderson@linaro.org>
In-Reply-To: <20230222023336.915045-4-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 24 Feb 2023 13:16:31 +0000
Message-ID: <CAFEAcA8bcCp7jPKTSMTb7b-Sr4pcCDdXODoftXqk9AntnpXT0w@mail.gmail.com>
Subject: Re: [PATCH v3 03/25] target/arm: Diagnose incorrect usage of
 arm_is_secure subroutines
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::52b;
 envelope-from=peter.maydell@linaro.org; helo=mail-pg1-x52b.google.com
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
X-TUID: sJowiPLxfGlx

On Wed, 22 Feb 2023 at 02:34, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> In several places we use arm_is_secure_below_el3 and
> arm_is_el3_or_mon separately from arm_is_secure.
> These functions make no sense for m-profile, and
> would indicate prior incorrect feature testing.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/cpu.h | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
