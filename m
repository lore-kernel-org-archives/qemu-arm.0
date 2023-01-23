Received: by 2002:a17:907:c68a:b0:84d:2074:29bb with SMTP id ue10csp2902760ejc;
        Mon, 23 Jan 2023 04:54:41 -0800 (PST)
X-Google-Smtp-Source: AMrXdXvGrzhJrddr+nvdJk1n5u8UP0IcW37TFFxt0FJpPrwa078WJwXq6hHkWzSskfl+AgwkuFkH
X-Received: by 2002:ac8:1202:0:b0:3a7:f2b0:c4b7 with SMTP id x2-20020ac81202000000b003a7f2b0c4b7mr31817040qti.57.1674478481286;
        Mon, 23 Jan 2023 04:54:41 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1674478481; cv=none;
        d=google.com; s=arc-20160816;
        b=ivqKowhjOfaB8dnQVZgJ1iF8O19DOw3Rrnf+6pUKPEnIelIG9r77YZSBlk7jraXiMC
         jLO/dR0K83Je1qxTcFsG/Aj5EviMwOwG64Q/1wdvU+AK9amU/zGScAr/IevopguEtk5b
         Vz/nIclcj4p4oys6hEo37piT+6oFrfb3JWQSIA3CFNunwMuwLXAF+hOmDU7j6eEKxCi0
         93X/C5YMElSi0GHtTM3bchkCXHRHLWJ2/AmW7JmmtJhjXr9dvL8bklCT3smF22eYEYfL
         KNieZ8ok3udejMEYnwk28tnn4vZ9k63OXOYmXSjx5I5rVFj2aBKx7ZXAt78gHbD+HYdK
         esYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=+smmb3mI+a1EFRHgpJeD30hVN6Eff9iGXB7D5qsN/vs=;
        b=FbDyU1i+/tRO8YebCzY5Ino1AeJcZXISIYHARzvahkv/C8rahpQP7JApvOTTEvhRHm
         9YqMASUeb7bvAyK6UV/rqn6G99cAieQtjEWAVqyeHFEZHzCRe/woD6nhmZzhrlJCR9XY
         8NLGoQWSN0CHi2pVLo2Kor3A2MkEfJWtw96UxxzdZzR8Ddcf58YEqNcv5cJrTy2JvN/f
         wno4LRrwpVNC/cRafMc682FpOq4SURlFvf6Bji5uFzb4uL1CMhMdjh0hAg0uHf2cdcj3
         Lv1k6LxQzA8paSyjXZ2R4RrGzU/Yv2itzdU0bBtQCSFA/X568VnNjhCtIxrf78dM9hrb
         ktVg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=IsxDx30b;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t10-20020a05622a01ca00b003b62d1ccd80si18179919qtw.228.2023.01.23.04.54.41
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 23 Jan 2023 04:54:41 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=IsxDx30b;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pJwKq-0008Ph-8i; Mon, 23 Jan 2023 07:54:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pJwKo-0008PK-K3
 for qemu-arm@nongnu.org; Mon, 23 Jan 2023 07:54:02 -0500
Received: from mail-pg1-x52c.google.com ([2607:f8b0:4864:20::52c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pJwKl-0002Gx-Ti
 for qemu-arm@nongnu.org; Mon, 23 Jan 2023 07:54:02 -0500
Received: by mail-pg1-x52c.google.com with SMTP id g68so8858932pgc.11
 for <qemu-arm@nongnu.org>; Mon, 23 Jan 2023 04:53:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=+smmb3mI+a1EFRHgpJeD30hVN6Eff9iGXB7D5qsN/vs=;
 b=IsxDx30bSiq0zHO+RN17Qswb336l9T0oLRDjn6WKu77dlT7Th2HUsD8ao31wCJsScr
 6+zSUXXedmObzDgKk76qoHG9CywKdfAJY+fzys1T0NGUNqcRar16eaLSJk2z80l7+WiI
 cmubWCi9UEH525SAFj4EUc9rl2bA/tMZTdCMcvMT9vz1FROKk0sGnn5xPBWMAsTfohF6
 XTqxM2esx7MxTz0j+ttMmyLl9zzhX1T//wR023vcYiMHfGrI2FkAyPvrnlxv+rONUbnB
 p9C+sWhAlydq2UnvUuCz8D4Drudj01fECaO47ghYflyq/Cn8SAADUeso0eqqqlxF4lHK
 Lt6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=+smmb3mI+a1EFRHgpJeD30hVN6Eff9iGXB7D5qsN/vs=;
 b=0idhVh9dLBLJomiP4ojpYv+9QlY/wFP7/SjHMkmYyarqL3MqIkr4JLOd//+lQijL/U
 AG4zSRJdaJ3Chs79izNoXl3trg3gvjasBuzidnNKXDI3sSEnFKvSAghw+hC2/70Tnnlt
 nlE5yc32mZ22gGW8kwQNHY92UicD2mtCDXc8XdTUuPfOsftoyH2RwbJ+SiJ8AxzVBuDQ
 WVJZtIa69NcYnpbecogWl615WVSEsyHtU5wIaPzEv+dMaAoBD9kPaSXuwylzzmF3PLna
 9tmVP3WSF9aeOpIXFsn5dLAMkM6rKfUsyUU1OML39jdNxbKp7yEx9MUFdGG7Z6s2O0hi
 3tdw==
X-Gm-Message-State: AFqh2kr0vXv/Gv+wf+U71vtwah95lN9KeMhGj3qjs785MhqQCNRIdUgh
 tn47DOM53qRphdXSU0MrKaeu/8FWoyMC0KvErECE/A==
X-Received: by 2002:a63:31c8:0:b0:4cd:418b:3d2d with SMTP id
 x191-20020a6331c8000000b004cd418b3d2dmr2193189pgx.221.1674478438286; Mon, 23
 Jan 2023 04:53:58 -0800 (PST)
MIME-Version: 1.0
References: <20230106194451.1213153-1-richard.henderson@linaro.org>
 <20230106194451.1213153-3-richard.henderson@linaro.org>
In-Reply-To: <20230106194451.1213153-3-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 23 Jan 2023 12:53:47 +0000
Message-ID: <CAFEAcA9mh+eS8rHwqmyjOAmcnPDJ7K54QbJPd7itKZskQeox5g@mail.gmail.com>
Subject: Re: [PATCH 2/2] target/arm: Look up ARMCPRegInfo at runtime
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::52c;
 envelope-from=peter.maydell@linaro.org; helo=mail-pg1-x52c.google.com
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
X-TUID: 0fIqe6lfWYA2

On Fri, 6 Jan 2023 at 19:45, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Do not encode the pointer as a constant in the opcode stream.
> This pointer is specific to the cpu that first generated the
> translation, which runs into problems with both hot-pluggable
> cpus and user-only threads, as cpus are removed.
>
> Perform the lookup in either helper_access_check_cp_reg,
> or a new helper_lookup_cp_reg.

As well as the use-after-free, this is also a correctness
bug, isn't it? If we hardwire in the cpregs pointer for
CPU 0 into the TB, and then CPU 1 with a slightly different
config executes the TB, it will get the cpregs of CPU 0,
not its own, so it might see a register it should not or
vice-versa.

So I think we need this patch anyway, even if we're going
to try to do something to improve sharing of cpreg hashtables
across CPUs.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
