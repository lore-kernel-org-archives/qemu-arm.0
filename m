Received: by 2002:a17:907:8744:b0:9bd:85f7:2662 with SMTP id qo4csp3870842ejc;
        Tue, 17 Oct 2023 05:09:46 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF7QTwc7gy39Ae5sHxJIyOyaMOo04ZJrXIZKkxnybWXhOlfJevWI7gLQD/ozhFVIw0KD2uj
X-Received: by 2002:a05:6214:2686:b0:66d:55d9:bc7b with SMTP id gm6-20020a056214268600b0066d55d9bc7bmr2929678qvb.31.1697544586744;
        Tue, 17 Oct 2023 05:09:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1697544586; cv=none;
        d=google.com; s=arc-20160816;
        b=N7EX7ufaRNzo1Md4jawviL5fzDXE88tlSuyJoerGePmxHls4NEzLLxoxlu+1vU/yRH
         QATEsCFTVpcQB3bKFJNxoE+E1TMj6kbkxT6R5j1CRL/rR4IgCOlZx8j10ZS4Qbiyc7VW
         fdfFjKgZYQ5xc9fBA944MD+DFJKvWLkdFqrgx7jKx9C5T4wRQtEyhgVcvWAPLiRyRd8+
         P6xwAnosr8GiLn/dzDdaS84GHn9kIPajIAcmVpoOwykM0BnLUIK9yfFqVzsVKkv+ZwpK
         9vch59nUeAkQwL/mMQxOwXwHd8B5DBcMNnrKHYwhOL+634UBKXmXEEZ7BmbFs8RS+uM8
         2QZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=ZH0F3f+uCOPEXSYjYgewFnE5Faf1m9Z5ZRrf3gXOZSQ=;
        fh=EaL8vpFTtKEklWwwD6O/c+T8TzXw1DOSm5u3xOKG98U=;
        b=Rk4cneDAtpB1127mUZk1SwpD+QUq25C5tpPZeRWrKFDRmEhh0mhkVnNV1zwojUoTPZ
         QLu4MB73b74nvgEYNS7Q5MvS6TazdbM3XnScamkz2+iW39XYOkYpTG+vtuzaBfS66M+s
         IPBlo2G0ONa6Z3JL7d2WG9spLvnbS9wV2OwSJiU9eedDEEidJ6UYrRgwpcFkY7ED3KIT
         x5BXG9YuoFXbsAMyWzhS6Jr5D0ibfA56vXctbm+8XfCRuQCu4NXIU5XLx4qKBGTX6kRL
         UfpqnT4zEvoLXpJ+XjCNOlc7i8dr9U3ob1hQnDvuzjaFa/gGFsXx/I+0R4V+7ujfMbm+
         w8IA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=qmhn+M8Q;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a1-20020a0cb341000000b0065b0fa8e10fsi834655qvf.324.2023.10.17.05.09.46
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 17 Oct 2023 05:09:46 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=qmhn+M8Q;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qsit3-0000WM-DL; Tue, 17 Oct 2023 08:09:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1qsit1-0000Vl-5U
 for qemu-arm@nongnu.org; Tue, 17 Oct 2023 08:09:23 -0400
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1qsisz-0000b7-FF
 for qemu-arm@nongnu.org; Tue, 17 Oct 2023 08:09:22 -0400
Received: by mail-ed1-x52e.google.com with SMTP id
 4fb4d7f45d1cf-53e08e439c7so9280625a12.0
 for <qemu-arm@nongnu.org>; Tue, 17 Oct 2023 05:09:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1697544559; x=1698149359; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=ZH0F3f+uCOPEXSYjYgewFnE5Faf1m9Z5ZRrf3gXOZSQ=;
 b=qmhn+M8QDs2IFeLjmU+OEaG9vz+JENgQNnH4g+/yN/c52f0/iEgNNNLkUuQS8a2c93
 wC6O2LpaUIpVfafqZyjCXUXvOyB8NPtSjiYO6jNGZrI35LLykLUUF9mWYT22Cr/1SQOY
 JWRRBA2a6SpUXancq3WSBHD3P7Cb3RVrsszy8Ck5/k05kAxg3/icuCIHdjfx6Q8RJwgV
 mujb6Q6CHaHKnHl2WKOWYLi2zpLKB4fj9VcPuNqrMyZCusBqoFUWXlo/UUY4kkHcjTiI
 5Ur8RAChdFqEkFM7fY8tR1cCWSSwYry7gt7zXFBfQj8mR/5ZNwziBFhk+2MUXjCVYOoA
 sR8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697544559; x=1698149359;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ZH0F3f+uCOPEXSYjYgewFnE5Faf1m9Z5ZRrf3gXOZSQ=;
 b=Ka13vP3wUt4NDycWM1g2VvQim0hWYahy8vAoyJOpP8GTpPYyvuA9ML/2JkRsXjsr9a
 X6RArkRHpC31gFxMB4cv2kFZsOFRKZw1NmdJQZpOLNN6Mr3HEN3HfzaHt5MYdVcp+zCE
 CbZ1spCvfj0YYywiEoiKB7F9TawMv9Dv7rnhG0ihrPDpAH+zymX/l5JXyy03V79eh8b4
 6hUMbYY6tjmK5gshw+nnWAloAAQoW9OzbN7LeL2BwdhRIiam9w5YebVq78ysrreJ57bh
 cmZKonGzkCjzFMCzIVEsLZWR7Yv2yCnSHfQeMW4vqmjTUxo+Tidcrun40wkJFyHauz33
 mJeA==
X-Gm-Message-State: AOJu0Yz+bOGp7JOdgoMF+HDPKHo7KtIh0m4qyEebZ7BR6MYFXYENfDpi
 HU8uUtNNq/50YByxVudc5/JLN2kdrAfxcYn4M0+ufg==
X-Received: by 2002:a50:9e24:0:b0:53d:a0c9:dbd4 with SMTP id
 z33-20020a509e24000000b0053da0c9dbd4mr1427326ede.21.1697544559610; Tue, 17
 Oct 2023 05:09:19 -0700 (PDT)
MIME-Version: 1.0
References: <20231010142453.224369-1-cohuck@redhat.com>
 <20231010142453.224369-4-cohuck@redhat.com>
In-Reply-To: <20231010142453.224369-4-cohuck@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 17 Oct 2023 13:09:08 +0100
Message-ID: <CAFEAcA88O-VDq2rRfVhZ_6OShFq1ANEMmHWHVtNS5hCPQNYtdg@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] arm/kvm: convert to read_sys_reg64
To: Cornelia Huck <cohuck@redhat.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Gavin Shan <gshan@redhat.com>,
 qemu-arm@nongnu.org, qemu-devel@nongnu.org, kvm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52e;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52e.google.com
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
X-TUID: xIw0CaPe2Mm3

On Tue, 10 Oct 2023 at 15:25, Cornelia Huck <cohuck@redhat.com> wrote:
>
> We can use read_sys_reg64 to get the SVE_VLS register instead of
> calling GET_ONE_REG directly.
>
> Suggested-by: Gavin Shan <gshan@redhat.com>
> Signed-off-by: Cornelia Huck <cohuck@redhat.com>
> ---
>  target/arm/kvm64.c | 6 +-----
>  1 file changed, 1 insertion(+), 5 deletions(-)
>
> diff --git a/target/arm/kvm64.c b/target/arm/kvm64.c
> index 558c0b88dd69..d40c89a84752 100644
> --- a/target/arm/kvm64.c
> +++ b/target/arm/kvm64.c
> @@ -500,10 +500,6 @@ uint32_t kvm_arm_sve_get_vls(CPUState *cs)
>              .target = -1,
>              .features[0] = (1 << KVM_ARM_VCPU_SVE),
>          };
> -        struct kvm_one_reg reg = {
> -            .id = KVM_REG_ARM64_SVE_VLS,
> -            .addr = (uint64_t)&vls[0],
> -        };
>          int fdarray[3], ret;
>
>          probed = true;
> @@ -512,7 +508,7 @@ uint32_t kvm_arm_sve_get_vls(CPUState *cs)
>              error_report("failed to create scratch VCPU with SVE enabled");
>              abort();
>          }
> -        ret = ioctl(fdarray[2], KVM_GET_ONE_REG, &reg);
> +        ret = read_sys_reg64(fdarray[2], &vls[0], KVM_REG_ARM64_SVE_VLS);
>          kvm_arm_destroy_scratch_host_vcpu(fdarray);
>          if (ret) {
>              error_report("failed to get KVM_REG_ARM64_SVE_VLS: %s",

read_sys_reg64() asserts that the register you're trying to
read is 64 bits, but KVM_REG_ARM64_SVE_VLS is not, it's 512 bits:

#define KVM_REG_ARM64_SVE_VLS           (KVM_REG_ARM64 | KVM_REG_ARM64_SVE | \
                                         KVM_REG_SIZE_U512 | 0xffff)

So this change would trip the assert on a host where SVE
is supported and enabled.

thanks
-- PMM
