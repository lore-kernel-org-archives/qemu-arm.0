Received: by 2002:a17:906:e92:b0:a3e:79c1:d636 with SMTP id p18csp642261ejf;
        Fri, 23 Feb 2024 07:46:18 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCU3YMO0Lgxt0cwqk/6FAywWfo6YS5b76WRzAI4ZK1n9KgRNOykRCASt9iOei0SeHeWhTTCalSWp+dJ+Rgg3qMCM6IvwbqDg
X-Google-Smtp-Source: AGHT+IHPfzyOUnNrO2GxjNpJHBzqPfS8+aWYBwBcqua0wRkb65ipMEPx21MwJn8g2N2GjfetBib6
X-Received: by 2002:a67:c798:0:b0:470:430b:154d with SMTP id t24-20020a67c798000000b00470430b154dmr198171vsk.33.1708703177948;
        Fri, 23 Feb 2024 07:46:17 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1708703177; cv=none;
        d=google.com; s=arc-20160816;
        b=QcDhNojYORij2ejVbzFKYzXcn3wuuCQvHCIGswevoQUZ1vvlgHiVk4OeGe7Iod3C+I
         tLePzogC6FKYqKSUQXjVASSoyAbYraS0xRPNRKVMlDWOKWuhUt7+PCRYFj36AzxvCvYq
         5wZAu4YwTsdd5fTBjo7W3CXm1DfYth3TSnrmYzIx55ZLXDzCx1Dzv4F6YOcg70s7hHs5
         +VLnb1sgRNTqAojfe0s2xfc9ArV5srIgCdxMA/2C7jxG7w7IlOaSU0Zb2G5Xo/CAql3G
         8eSk/fplMgxV3765het4PG3nfSw/7rCGYi2VB1xCaukMw9zmmldqGRHcU9+PPKRSYLwE
         4pfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:cc:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=1J3UoHjFJPKnl6Qoer8WhClUd9Q0ATYTkqVr3fZbVRw=;
        fh=KhV850wtWN4G5xkUxbLw9rvzY40R9RzCzMQhG5cdjvE=;
        b=y3SAGvc+fFfBM3H9D1DMyLa4IfMhAwp6Ay/wfkq+WdFIVqyWpJTtkw0kJW+4ggXpHg
         xSl0fVQCNLH9ClxjLLQ36Ce4fZnPapoYdWKiCAz4+gVOJgHP4/zZNlGkPVUhYrcGL48Z
         dSbdz2MdTgoLVrDUn/Keoni7rCUaa6yYq/+SfF+eN5uskYt9T2IbBNoHLOGurlMjKz1S
         axMLc9H5gIxm2Tsbdb218nO3jLjxVV5WkVqZKuvsI2d1HCutFaWiv5tAA5bObnrdqDZj
         vlxkfURB+U8g65sTINX5FyPFO8VjNB2tb/mAejaDviHfxhQMmkZzfXTVwdepCZ1UFMBL
         DdVw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="v/SZeMlj";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g11-20020a67e20b000000b0046ec5daf5f4si2069669vsa.575.2024.02.23.07.46.17
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 23 Feb 2024 07:46:17 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="v/SZeMlj";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rdXkd-0007pv-Jb; Fri, 23 Feb 2024 10:46:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rdXU5-0000C6-16
 for qemu-arm@nongnu.org; Fri, 23 Feb 2024 10:29:09 -0500
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rdXU2-0003b8-I6
 for qemu-arm@nongnu.org; Fri, 23 Feb 2024 10:29:08 -0500
Received: by mail-ed1-x52e.google.com with SMTP id
 4fb4d7f45d1cf-563d32ee33aso1161538a12.2
 for <qemu-arm@nongnu.org>; Fri, 23 Feb 2024 07:29:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1708702145; x=1709306945; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=1J3UoHjFJPKnl6Qoer8WhClUd9Q0ATYTkqVr3fZbVRw=;
 b=v/SZeMljtH8ahuFES9nrqIviv8ezt7RB1xvmbUzQ3++NhOmdGeTZ+eLHb1W6G4YpI5
 UCxVcpdy5mrOId2xv8XRqTGJvWMuAE+XSENjMaJ435Jk3nEIjmtIAITsRAd95pg+Tb8K
 qaUHh0pZ2mSbUxg77xI/etdN0O0QQhaawyI98y1JY3qzbrzfGrFjWeSr+dQxwfW9l2yP
 l2dVhOEj6n+zg6qRhJynn3tVlLyDSqFhKA0gEsrY/Ekr9x8Q12phah6sF+mzndvlpfJr
 URZEwcDuiHgi7HG8J+SsQQeQnIH9bsdLTc36tQoTi9I91tkSTy2u5yH6wHYwp8UGGPqn
 WFFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708702145; x=1709306945;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=1J3UoHjFJPKnl6Qoer8WhClUd9Q0ATYTkqVr3fZbVRw=;
 b=GBPCey+Zctk19mmyCkwg3lm0uP7YuUebNMdRlv0lTfXBQ77FhsUP6qrWWQxTz1FzUa
 l9iHKWx49uModSQrq97tLVOMTuNww93xs/KVaFkmk8UDw15+f7v2runlYfP+YATBvt1Q
 ZnaWtAitsG3BKKXhTHqORBuI2ZeioDj8E0kWJSZYnrhy30Dndx/Asxkp0yxeV0cw0kg/
 gPaevcfGwAzISuCeoUDO2kBJgVs2YbM662sC3DQu6KizWxOZLOpGqSedd8kpEIvKavc4
 eUwgpoJ1Pn9CdlPa2r1D0xUm4J7mO/GTP3liytbA5aSSoey2Uv91hDz8cFCaZqg2gvoY
 cpxQ==
X-Gm-Message-State: AOJu0YyLJT13B8kKyVo1ThH9uCTpku8HTidRu+50EtxpXSQ3Z56us1RD
 M67pspqaOKfojvxZZ+3xaG20s1cmiQIpRGsFqLTuKT0e44eGwp6DMxM55v16PMMchtIbbMkCOc7
 vHhkHk9ri5ynNXwqq7Q8kVZ6Mn5/ORGHSjqYCoA==
X-Received: by 2002:aa7:cf18:0:b0:564:9019:d9b1 with SMTP id
 a24-20020aa7cf18000000b005649019d9b1mr85895edy.40.1708702144720; Fri, 23 Feb
 2024 07:29:04 -0800 (PST)
MIME-Version: 1.0
References: <20240221173325.1494895-1-nabihestefan@google.com>
 <20240221173325.1494895-2-nabihestefan@google.com>
In-Reply-To: <20240221173325.1494895-2-nabihestefan@google.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 23 Feb 2024 15:28:53 +0000
Message-ID: <CAFEAcA9rhq=kA0zFde=95xcA6DYWNO-bYhZ9paVLN4h3V7-HmQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] hw/intc/arm_gicv3_its_common: Increase DeviceID to 32
 bits
To: Nabih Estefan <nabihestefan@google.com>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, qemu-block@nongnu.org, 
 its@irrelevant.dk, kbusch@kernel.org, roqueh@google.com
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
X-TUID: gxX6PZwHunvZ

On Wed, 21 Feb 2024 at 17:33, Nabih Estefan <nabihestefan@google.com> wrote=
:
>
> From: Roque Arcudia Hernandez <roqueh@google.com>
>
> According to the =E2=80=9CGICv3 and GICv4 Software Overview=E2=80=9D the =
DeviceID is
> IMPLEMENTATION DEFINED. This patch increases the DeviceID in send_msi vir=
tual
> function to 32 bits to allow the possibility of a redefinition of it with=
 a
> bigger DeviceID.

It's IMPLEMENTATION DEFINED, and our implementation defines it
to be 16 bits (see the ITS_DEVBITS #define). So uint16_t is fine.

Again, this change is missing any context that would motivate it,
and needs to be upstreamed along with whatever the actual code
is that needs it, not as a single thing on its own.

thanks
-- PMM
