Received: by 2002:a17:906:f20a:b0:98d:b2f5:1316 with SMTP id gt10csp1569795ejb;
        Mon, 7 Aug 2023 09:24:51 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHT4MfCBP014pUUMNxkFUHtbiBFzrTYwRigFa/ZjKwidjLYLH6Qv+aMlmhrAmA2E7+fh0Hz
X-Received: by 2002:a0c:8c4f:0:b0:63d:f8d:102f with SMTP id o15-20020a0c8c4f000000b0063d0f8d102fmr7809238qvb.18.1691425490804;
        Mon, 07 Aug 2023 09:24:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1691425490; cv=none;
        d=google.com; s=arc-20160816;
        b=LTVBsz96JH9hA25OF38ry7Wb70FWwndi3YPu2KH6WJbTsVMNl+gUbpQaymYFEvXodM
         M5a3TzJrLNeCQI07PnIX8fiElfW3TZx+oeKB9IjRCSIMnoTWBAE92PSxsAhBQ4rNX0+T
         NkoB5UMZXMUOZs2eE0L+RMwC1GRBbfrfx8JRG4lbmP9NwXA88xkn6T/53UCEU0f5NdUP
         HoR7jpvaniSgUCWxIdtalyd9wTINnV8u8H1nCpSACFUhj8zoCT/jg6iP61wucgok682A
         DSAONM/R6MdSukesEWSVGT+ZtqaW8SF1iE4HAt620jzjGxDdj18HoVaTV73a9XUvZe2i
         M3oA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=HkWJFcvv7HzX/+P9B1oBKExc219KhaCWc74BdKmMF+g=;
        fh=vaDpLBJmz5JjobJK3RXWYZonZ7WwqDVHFeS4aZ+rLcg=;
        b=NP2VJ2z8LIBNadCqKE64w+fUcXFA8PazwYCLw3rBcz0LFSKmbUu6Bjnyst3A5eSs/b
         /OwymnPfP7BjKzte2kBY9eKsMhTp/YcOEQdA8yOle7V6m9CRK1flFjqMm9JoP0jzO93J
         upXYIGR5D5XeT2vYqedjxvwwOuW+DfzpUpLYUHm6beQGEi7VTtCxD+zJUbRpRjEMN78I
         jbsDpzVEtUVgS0eVMZsDSNhXq8LLX0CVD9yxaSiKgAR0OiUisUNWu2PZxOWVHKzXFD1B
         8fpD9HRtmHDgh6idobXKiFo+sg89xtKhh2HnKa0IQUDYDvJNcoRMiMYsJmfxDDdf3d10
         BNWg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ieavqA94;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id b8-20020a0cf048000000b0063d315cf72csi4858440qvl.187.2023.08.07.09.24.50
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 07 Aug 2023 09:24:50 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ieavqA94;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qT325-0001KW-22; Mon, 07 Aug 2023 12:24:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1qT323-0001KD-J6
 for qemu-arm@nongnu.org; Mon, 07 Aug 2023 12:24:35 -0400
Received: from mail-lf1-x130.google.com ([2a00:1450:4864:20::130])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1qT321-0008Nx-OY
 for qemu-arm@nongnu.org; Mon, 07 Aug 2023 12:24:35 -0400
Received: by mail-lf1-x130.google.com with SMTP id
 2adb3069b0e04-4fe11652b64so7309218e87.0
 for <qemu-arm@nongnu.org>; Mon, 07 Aug 2023 09:24:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1691425471; x=1692030271;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=HkWJFcvv7HzX/+P9B1oBKExc219KhaCWc74BdKmMF+g=;
 b=ieavqA94BEAkKOCPX9xusHknIczpnODy8Y2pSgsQR2QX6GNWFQa69iLjchyay9zvdR
 yTxJYcku3t3JuBD41+IMBc/BfI6hNU1knM5vKZ9eyAKhq6QJnbnUECsfG5haweIRSLEF
 8ey10jV+Ztux5OADI9T1l2hvMZhxP6dUMMRfGxsU3RlP2xlz781FG8E2sfpcow+wSAFw
 iGrGGUhk9lw5DxeTDEy8O6ehTAUF1b5uE6wcv3QLy9aVZbs6DrS1nXC14wA026p/yII+
 YhpWsL1iTufkSU1BgUbjXAVW4jZAfvEtzxJXrhri7lorGZdIpZAL8VWRlhhm44xQtnUb
 08Zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691425471; x=1692030271;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=HkWJFcvv7HzX/+P9B1oBKExc219KhaCWc74BdKmMF+g=;
 b=ehEsiVjG+yze0iST3j4bRQxlgMay4nJc1ZRwApDf+f6rnMAR7C9BgLXRPFBKEz196A
 YoHSnfz3NAZ9H4VTE+Yla8rj2wYQQGbs2J0g7pbF6N2FHVDj6M7cakmXtQtVYR40efbE
 1eODEDC3E85KbO/LMUOIZlmguOhgNHHLuioobQ9iTv35NOrR4r6TWdQ9bq8LtYV8gNUl
 PLDAdQ878ZDjHyEuAgCCy6t4Or9fOKf6wk7HlbGwTOfczhuo9gm9SZCb/hz2DYi43bg+
 iJ37WNpVRRDcIBZktODEuxt7focF/Pr+v6OUFHN4Q+DkqF+EtLiAuM9XKmsiAi7C2WeD
 5YjA==
X-Gm-Message-State: AOJu0YzJTvEUpCxzLojJn6MFWKRQMwfT2DR+owHpMjEE0+M1M5UXGb0r
 we/VkNq/UvS8dEGHBsP0lCwackxsfxYf9m7bmvtcRgZ6aIPx6exs
X-Received: by 2002:ac2:465d:0:b0:4fb:8cd1:1679 with SMTP id
 s29-20020ac2465d000000b004fb8cd11679mr6389696lfo.44.1691425471383; Mon, 07
 Aug 2023 09:24:31 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1691010283.git.jcd@tribudubois.net>
 <011393f8c5be2d382955dceb7bc5d78a77b99c31.1691010283.git.jcd@tribudubois.net>
In-Reply-To: <011393f8c5be2d382955dceb7bc5d78a77b99c31.1691010283.git.jcd@tribudubois.net>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 7 Aug 2023 17:24:20 +0100
Message-ID: <CAFEAcA85aDf6+0B=hu12K1+n9w9s_D+MyPHDqVuo8saLETa-SQ@mail.gmail.com>
Subject: Re: [PATCH v3 3/5] Refactor i.MX7 processor code
To: Jean-Christophe Dubois <jcd@tribudubois.net>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::130;
 envelope-from=peter.maydell@linaro.org; helo=mail-lf1-x130.google.com
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
X-TUID: +HNRZZxDym5a

On Wed, 2 Aug 2023 at 22:09, Jean-Christophe Dubois <jcd@tribudubois.net> wrote:
>
> * Add Addr and size definition for all i.MX7 devices in i.MX7 header file.
> * Use those newly defined named constants whenever possible.
> * Standardize the way we init a familly of unimplemented devices
>   - SAI
>   - PWM
>   - CAN
> * Add/rework few comments
>
> Signed-off-by: Jean-Christophe Dubois <jcd@tribudubois.net>
> ---

>      /*
> -     * IOMUXC and IOMUXC_LPSR
> +     * IOMUXC, IOMUXC_GPR and IOMUXC_LPSR
>       */
> -    for (i = 0; i < FSL_IMX7_NUM_IOMUXCS; i++) {
> -        static const hwaddr FSL_IMX7_IOMUXCn_ADDR[FSL_IMX7_NUM_IOMUXCS] = {
> -            FSL_IMX7_IOMUXC_ADDR,
> -            FSL_IMX7_IOMUXC_LPSR_ADDR,
> -        };
> -
> -        snprintf(name, NAME_SIZE, "iomuxc%d", i);
> -        create_unimplemented_device(name, FSL_IMX7_IOMUXCn_ADDR[i],
> -                                    FSL_IMX7_IOMUXCn_SIZE);
> -    }
> +    create_unimplemented_device("iomuxc", FSL_IMX7_IOMUXC_ADDR,
> +                                FSL_IMX7_IOMUXC_SIZE);
> +    create_unimplemented_device("iomuxc_gpr", FSL_IMX7_IOMUXC_GPR_ADDR,
> +                                FSL_IMX7_IOMUXC_GPR_SIZE);
> +    create_unimplemented_device("iomuxc_lspr", FSL_IMX7_IOMUXC_LPSR_ADDR,
> +                                FSL_IMX7_IOMUXC_LPSR_SIZE);

This is a behaviour change -- we used to create 2 stub
iomux devices, and now we create 3. Also, we map the
iomuxc_gpr at FSL_IMX7_IOMUXC_GPR_ADDR here, but we also do

 sysbus_mmio_map(SYS_BUS_DEVICE(&s->gpr), 0, FSL_IMX7_IOMUXC_GPR_ADDR);

below. Which is correct ?


>      create_unimplemented_device("caam", FSL_IMX7_CAAM_ADDR, FSL_IMX7_CAAM_SIZE);
>
>      /*
> -     * PWM
> +     * SAIs (Audio SSI (Synchronous Serial Interface))
>       */
> -    create_unimplemented_device("pwm1", FSL_IMX7_PWM1_ADDR, FSL_IMX7_PWMn_SIZE);
> -    create_unimplemented_device("pwm2", FSL_IMX7_PWM2_ADDR, FSL_IMX7_PWMn_SIZE);
> -    create_unimplemented_device("pwm3", FSL_IMX7_PWM3_ADDR, FSL_IMX7_PWMn_SIZE);
> -    create_unimplemented_device("pwm4", FSL_IMX7_PWM4_ADDR, FSL_IMX7_PWMn_SIZE);
> +    for (i = 0; i < FSL_IMX7_NUM_SAIS; i++) {
> +        static const hwaddr FSL_IMX7_SAIn_ADDR[FSL_IMX7_NUM_SAIS] = {
> +            FSL_IMX7_SAI1_ADDR,
> +            FSL_IMX7_SAI2_ADDR,
> +            FSL_IMX7_SAI3_ADDR,
> +        };
> +
> +        snprintf(name, NAME_SIZE, "sai%d", i);
> +        create_unimplemented_device(name, FSL_IMX7_SAIn_ADDR[i],
> +                                    FSL_IMX7_SAIn_SIZE);
> +    }

Any reason for moving the SAI device creation up like this? It
makes the diff confusing.

>
>      /*
> -     * CAN
> +     * PWMs
>       */
> -    create_unimplemented_device("can1", FSL_IMX7_CAN1_ADDR, FSL_IMX7_CANn_SIZE);
> -    create_unimplemented_device("can2", FSL_IMX7_CAN2_ADDR, FSL_IMX7_CANn_SIZE);
> +    for (i = 0; i < FSL_IMX7_NUM_PWMS; i++) {
> +        static const hwaddr FSL_IMX7_PWMn_ADDR[FSL_IMX7_NUM_PWMS] = {
> +            FSL_IMX7_PWM1_ADDR,
> +            FSL_IMX7_PWM2_ADDR,
> +            FSL_IMX7_PWM3_ADDR,
> +            FSL_IMX7_PWM4_ADDR,
> +        };
> +
> +        snprintf(name, NAME_SIZE, "pwm%d", i);
> +        create_unimplemented_device(name, FSL_IMX7_PWMn_ADDR[i],
> +                                    FSL_IMX7_PWMn_SIZE);
> +    }
>
>      /*
> -     * SAI (Audio SSI (Synchronous Serial Interface))
> +     * CANs
>       */
> -    create_unimplemented_device("sai1", FSL_IMX7_SAI1_ADDR, FSL_IMX7_SAIn_SIZE);
> -    create_unimplemented_device("sai2", FSL_IMX7_SAI2_ADDR, FSL_IMX7_SAIn_SIZE);
> -    create_unimplemented_device("sai2", FSL_IMX7_SAI3_ADDR, FSL_IMX7_SAIn_SIZE);
> +    for (i = 0; i < FSL_IMX7_NUM_CANS; i++) {
> +        static const hwaddr FSL_IMX7_CANn_ADDR[FSL_IMX7_NUM_CANS] = {
> +            FSL_IMX7_CAN1_ADDR,
> +            FSL_IMX7_CAN2_ADDR,
> +        };
> +
> +        snprintf(name, NAME_SIZE, "can%d", i);
> +        create_unimplemented_device(name, FSL_IMX7_CANn_ADDR[i],
> +                                    FSL_IMX7_CANn_SIZE);
> +    }


thanks
-- PMM
