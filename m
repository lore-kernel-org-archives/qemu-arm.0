Received: by 2002:a17:907:2c4d:b0:94e:1233:1117 with SMTP id hf13csp582406ejc;
        Tue, 11 Apr 2023 08:25:05 -0700 (PDT)
X-Google-Smtp-Source: AKy350afsYdo4hMSN6LgE4HBWCQD6RhQJRvoSyMzjIZS5U5/kyqU31jiEfu76MY16T03M+2UN9wb
X-Received: by 2002:ac8:58ca:0:b0:3e2:e71e:ff78 with SMTP id u10-20020ac858ca000000b003e2e71eff78mr19924955qta.55.1681226705767;
        Tue, 11 Apr 2023 08:25:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1681226705; cv=none;
        d=google.com; s=arc-20160816;
        b=WtEFF0BddjXEYeOMw9iULqpBLtEXyotoqsm05UjgRWygpvUFMPsjXPGxE1jsdx5NHx
         eI2bvRZwqIBYB/z3geLkaagQkveRhSqcsrqKs3O5ntv55e8GCgkHg8xrlU/F9WQAYNgp
         SqSZ/ehHs7D/xujJNsDqsV/wPui4cTydx4XtI51mUI3Q+JVyeP/14BBPJKHU+7JJJg4O
         iAWbV8LiCAwmqMmDhOiqpmJDF8fe172qe9Ql9nDIP/+f8Qfz/qhF1EKRYbqpGNpw8jyC
         4J1FJCaJngvp+fkITwk8DT/rXjH3mCxSdD0seD0OesqzQE1ujY/Xshn8fzjkuBM0dWHv
         dGaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=uqXJKldNs6ZkRC2QswOKIpXD0Aq3/zbZCFwDsT+PsrM=;
        b=xLLHl+qj9aX1gQEduC60D1vp68yW3Hva5ol22YAbu/FBbyIAoiVQKZb9dubBf+w53D
         TVbg7AsFXk/AsSTeJUPolZjMfdzNGUn6AK1/IxwYeZXR08ktdXyEZckathMo+D6BzLaL
         pVE4htnXyH6g8Gsu3jnLGm2PsTWTpVB/sJK+tLEfvwbsuR6pu4uP6h5jGp9N+YZNY/oe
         nDDi/PJNvQSwiU/3fjaCB17qW+sf39ESc12mrTox0Gp3+1HHyaojU86qDSsOj0LUDNbV
         DteRI+hAB8K+CmCC6olyyYZrdtqkFQN+5vOeE99MDg7veYbnFyE89RmKyLx8KXZbpvrm
         O4xQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=qkaqy2Uq;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id q140-20020a374392000000b0074a9516e752si5127832qka.780.2023.04.11.08.25.05
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 11 Apr 2023 08:25:05 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=qkaqy2Uq;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pmFrR-0000Go-7N; Tue, 11 Apr 2023 11:24:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pmFrK-0000FV-Pm
 for qemu-arm@nongnu.org; Tue, 11 Apr 2023 11:24:39 -0400
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pmFrI-0006oT-Mv
 for qemu-arm@nongnu.org; Tue, 11 Apr 2023 11:24:38 -0400
Received: by mail-ej1-x633.google.com with SMTP id f26so15239695ejb.1
 for <qemu-arm@nongnu.org>; Tue, 11 Apr 2023 08:24:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1681226670; x=1683818670;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=uqXJKldNs6ZkRC2QswOKIpXD0Aq3/zbZCFwDsT+PsrM=;
 b=qkaqy2UqZ0uQh/QhiNHySK1TH3rdE20Pz+qlgFg/g0BDNO92U6nZimPCzgtaXe+RuG
 VVTp/LtLC4mwC56bM6vqLa6QeaWs2dgLG4VIyl+yIweWb65XnsBQGagVajt4oIidIflj
 fUkOKawq30bIL2gTontuha9ao8Jtfes9Wgx8HiLbS70HunkOcLSbdGYqzCC021EtRbKq
 HGcbXituEXNwopYujAuMfXjCWsbgpEguVPPxREgqFke1VSCaE0AMIfWPB1bqRL24oq3O
 NMpPkbjXDo7tM2+9MsJitpayXSN2ZNkCM3X/P/4ujvaVD6MGcXvlTgb33MZ+dW7V7xZ6
 tu2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1681226670; x=1683818670;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=uqXJKldNs6ZkRC2QswOKIpXD0Aq3/zbZCFwDsT+PsrM=;
 b=paJcz5dB2vAyx9wBCqof7NdjKCeGpEQdwYIm766bi7N5dIxUQDbkYwlrFwuolZmEb+
 uO6O7FkLtTAK8MBdPGrm4nB9EqNr9aZPOkZ6TyANqlJWHXjdleiTi/YGH5Vopn9rop9/
 bGO+xza40ZCmnBZsGTB9AphWC8dBhKneGQttu08+e4kdt+9//hG39kL1jayLThgQaoVy
 ldEa981JhuptbP/N1/MDW3lH9wiLBNCFP95zWvovYYmuefbDy75+ow71WwoIa2TX4r2o
 tJd9CtdGo2mgKh8ib4gaE/Uoaj9uf3JYxecqKtl0JmNayHBysR8kJIJbhN50SwUSxWVW
 adcA==
X-Gm-Message-State: AAQBX9fScCGD1HsMz9DooG2Du+56JoO4gzVzR+Z8celPyPwOclOGsYA+
 GOkP4X62tsEbTBOlJxVZsBanswAwzxovsK3yHbfgJQ==
X-Received: by 2002:a17:906:b301:b0:930:90ce:a1a6 with SMTP id
 n1-20020a170906b30100b0093090cea1a6mr4576902ejz.6.1681226670194; Tue, 11 Apr
 2023 08:24:30 -0700 (PDT)
MIME-Version: 1.0
References: <20230408000118.50854-1-pbartell@amazon.com>
 <c56f4f56-6cba-ceaa-9f89-228fafcbc2ac@linaro.org>
 <E3A05628-86C2-42B7-B17B-64972FE60834@amazon.com>
In-Reply-To: <E3A05628-86C2-42B7-B17B-64972FE60834@amazon.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 11 Apr 2023 16:24:19 +0100
Message-ID: <CAFEAcA8pSvbFwcbstF1q5y3yE8S3R-X4LKgihq-PFY0F02fw7Q@mail.gmail.com>
Subject: Re: [PATCH] target/arm: Fix debugging of ARMv8M Secure code
To: "Bartell, Paul" <pbartell@amazon.com>
Cc: Richard Henderson <richard.henderson@linaro.org>, 
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::633;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x633.google.com
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
X-TUID: 3Ow2KogFHjAF

On Mon, 10 Apr 2023 at 15:38, Bartell, Paul <pbartell@amazon.com> wrote:
>
> You can reproduce the problem by running gdb against an ARMv8M target running secure mode code (the default).
>
> Running qemu with the following arguments : qemu-system-arm -machine mps2-an505 -m 16M -cpu cortex-m33 -nographic -semihosting -monitor null --semihosting-config enable=on,target=native -d guest_errors -kernel /path/to/binary.elf
>
> With the following .gdbinit file:
> target extended-remote :1234
> compare-sections
>
> Upon startup, every symbol in the elf file reports the following error:
>
> Section .text, range 0x10000000 -- 0x10009298: MIS-MATCHED!
> Section .text.main, range 0x10009298 -- 0x10009300: MIS-MATCHED!
> Section .text.prvQueueSendTask, range 0x10009300 -- 0x10009338: MIS-MATCHED!
>
> Attempting to debug results in errors constantly (unable to read or write memory at all).
>
> init_data_sections () at /project/Demo/ARM_MPS/startup.c:95
> 95      {
> (gdb) info locals
> pCopyTable = <error reading variable pCopyTable (Cannot access memory at address 0x381fffec)>
> dataIndex = <error reading variable dataIndex (Cannot access memory at address 0x381fffe8)>
>
> Does that clarify my report sufficiently?

Could you (a) file a bug and (b) attach a sample test executable
that demonstrates the problem, please?

thanks
-- PMM
