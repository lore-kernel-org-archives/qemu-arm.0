Received: by 2002:a17:906:43c7:b0:78d:9f02:16a1 with SMTP id j7csp568702ejn;
        Fri, 14 Oct 2022 11:10:41 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM7n/9H9GLzRK18S0jxwjGoiLVtnMRvCHjFD4MhKocVK5+Z6MxIVzwxEJ4i80zM/XRXi+fEY
X-Received: by 2002:a37:afc7:0:b0:6ed:bca6:f552 with SMTP id y190-20020a37afc7000000b006edbca6f552mr4580920qke.283.1665771041292;
        Fri, 14 Oct 2022 11:10:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1665771041; cv=none;
        d=google.com; s=arc-20160816;
        b=zBUb2lQrV/9jNecO1rkO7+MFZCE3e76ENqdtfv3r0wucMXhR6KtihLcfVNz+K2PyY5
         CR6vki4f1IAzq7TneTFPjhXR7/64BwiWqPar1iPiSExVemEIZ0qYYXNACGVjnTU8Zwr0
         0NST/OBCtCI5tKz4QmL2rjPqnKCKypkUhxWcoy3z3zkNdWGxW/zdvZ4AiLY21QyjQEgi
         uDt5Sa8xVtE1scuIlGS+GCQZP8UhXb7M4YHU0PWtbsGpT5RnQqvy8/he/iC7G6s4eEvV
         35RsiBWxH6Z+ExLx+S4G8BU6ojOvU5Gt2o9VfJWTmfM7A4Zsh+rn226/9llr35WHQ+ki
         GDwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=5ZvFMqfrgF41x4VjPAZ5hsY8jpRwoneASmxanG1vGS0=;
        b=byZx9nF46/gjaVE+TQOPmtQ9Y5B46LtIX+OT08deDWkm/aLo3N0Cz6ZB9VTrolZh7p
         YU385mpqo38ykREe7ZDdd2isZ81tFeAJdDF7yhtekTQd5aMBoVyNz+KUmu5WEgwKdPh4
         edfCRzVM8jItqR7Ms4gCjfwADHkSsFrkl+lq/YbnQt268lyhTgmSA3zXvC93jTsMBo5P
         /mAdIAfCLGuDysgx/UcVgVC4Pcluy9BhvTX53flONqEXpjLeJ2GFtK2T2AiVjOCPE+7+
         ciDnszh86sfbd+hm/T1vudY7qR/Jgo2QXYEdDQ3sKW31iEsvLFYwnG9mh5m9IGjuG0uK
         gYZA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=J78WzcJr;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 15-20020a0562140d6f00b004b19a7f0795si2029321qvs.25.2022.10.14.11.10.40
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 14 Oct 2022 11:10:41 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=J78WzcJr;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:42528 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ojP8q-0001Mn-87
	for alex.bennee@linaro.org; Fri, 14 Oct 2022 14:10:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41640)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ojP8A-0001LJ-Dn
 for qemu-arm@nongnu.org; Fri, 14 Oct 2022 14:10:02 -0400
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d]:41488)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ojP85-0004I2-9b
 for qemu-arm@nongnu.org; Fri, 14 Oct 2022 14:09:57 -0400
Received: by mail-pj1-x102d.google.com with SMTP id
 q10-20020a17090a304a00b0020b1d5f6975so5489290pjl.0
 for <qemu-arm@nongnu.org>; Fri, 14 Oct 2022 11:09:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=5ZvFMqfrgF41x4VjPAZ5hsY8jpRwoneASmxanG1vGS0=;
 b=J78WzcJrI1hIQTPbFC3zD4xOn33AUiui0bZ1soK8co0CHhWEETBNnWsCKNJBqA/Bu9
 DeufTeoNIM95bA86KPvjEzNpFi0aHJA5UHY0l8adCmjD1D3zwVAFmlzVHGuvugmhxV/K
 qrsmWImC6B2JgnsEeZ2CNps0vuPHHGRPICc+864Zhj9iihSAMya8WE3+vZdoQb0ApJxr
 Ccc93gpkdyvQPmV9CqM2Uv2OMZg/3UbEIC6kT8RYUfk5Vpg0V2Dv70dvSYw69qAcR2jO
 AEcLsFLlIfbAEnYxSXs8hKbRjliN1bbLgtZPJwewktBrWZAH11yDZyF0KDgO1lV/tZ9P
 LbpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=5ZvFMqfrgF41x4VjPAZ5hsY8jpRwoneASmxanG1vGS0=;
 b=4EGPfXdppi25SEpmCNEBL0k85RBvCDlDVrP7zxvCxU4KOSWG4NadQbyFyW4Y6ZBXjq
 qfRmukHNWEbCNpt9fWBMXG8SmrijuWPomeZ+F342oZQLla+CJq3RYzuFdG7Qdkgf9Zha
 ZjLsS8F7mCvgLgWjo3kUKoxghqjMD8e3UkwV8abO+HhbNCzjYh1HkypeZOKDkz0NBc7Z
 VVpHO7qCbWbVAF6/7fl0/tzft5DZ5gbvnXGQox7mkEl+qaCmV+g/ZUQc0CZ5G0aYWFba
 eN01PSkrfdLlhSCoVVJq7cWccbeG1wwCDXtfNUSwcuzPt4IFs1RY96F22BZvkNez0En7
 od1g==
X-Gm-Message-State: ACrzQf2xXxsi+DAgWgtgArbMfA//B6m8V4uWu7HoddlKqFwmrosn86Rh
 YcbtwIF+yvMnWgwywi1jOvQUzypEI+MBgn5Xl97K9A==
X-Received: by 2002:a17:90a:fe92:b0:20a:daaf:75ea with SMTP id
 co18-20020a17090afe9200b0020adaaf75eamr18094454pjb.221.1665770990616; Fri, 14
 Oct 2022 11:09:50 -0700 (PDT)
MIME-Version: 1.0
References: <20221011031911.2408754-1-richard.henderson@linaro.org>
 <20221011031911.2408754-6-richard.henderson@linaro.org>
In-Reply-To: <20221011031911.2408754-6-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 14 Oct 2022 19:09:39 +0100
Message-ID: <CAFEAcA_xq2_Poco1++6BNOfnDZirrsXyB5mfauETD_8CUL2SNw@mail.gmail.com>
Subject: Re: [PATCH v4 05/24] target/arm: Move ARMMMUIdx_Stage2 to a real tlb
 mmu_idx
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::102d;
 envelope-from=peter.maydell@linaro.org; helo=mail-pj1-x102d.google.com
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
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Z1taEntAwrPa

On Tue, 11 Oct 2022 at 04:26, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> We had been marking this ARM_MMU_IDX_NOTLB, move it to a real tlb.
> Flush the tlb when invalidating stage 1+2 translations.  Re-use
> alle1_tlbmask() for other instances of EL1&0 + Stage2.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
> v4: Implement the IPAS2 and RIPAS2 tlb flushing insns;
>     Reuse alle1_tlbmask to fix aa32 and vttbr flushing.
> ---

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
