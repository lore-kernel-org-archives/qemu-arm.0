Received: by 2002:a17:504:3f1b:b0:1be9:327d:8ee3 with SMTP id x27csp262774njk;
        Tue, 16 Jul 2024 08:46:06 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVW/WGC0s4HdZrzWk27kNfWw9Nj8mZqEr9OCvI2j5vLGyPvz5N4YColTtKGJ4j9YJM0dHtnUA+YNZ7PJBIUIDAKBZKkDrq5
X-Google-Smtp-Source: AGHT+IE219H7s3qsY4p2u0I14xPVh67AP5wnfDeDW+Ga3xxx+KqODzFCKLG0jHRHcK/3NNupZAE9
X-Received: by 2002:a05:6102:2b84:b0:48f:dfdc:8cd2 with SMTP id ada2fe7eead31-4914c4f18f2mr3533970137.13.1721144736464;
        Tue, 16 Jul 2024 08:45:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1721144736; cv=none;
        d=google.com; s=arc-20160816;
        b=sa1nXliJj2MioJbpWeVGwIU8GkqY4PCCrZp3wy+5d9fg0gE2at5d/BqcVG8InbbIQJ
         x0HQSWuwA6uKJCN25KpZzWS03PJkS5WTSFQUjRcc05R8u4xMQV9D0XKBYf8j8i01olwv
         iEoGvDd8fqyowuGKGQVmpVbTIgf8tunUySkEKzdDVF4EoHb3nUz7S9w/RJv20QwCFtIC
         u5haC4IUPNCILmGX0D7QBIJi7gy8rVrtYJprpeM/602zP1yy1KJht6neY2EUtKUuU0tX
         aI4eaGvqqlvnyznRkpT8YQeHY8J2SsVuCljxxGy/K7ZfFWGxorz2eXPkyC/yrebnse7y
         TomQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=tnC94CA6Wtnoc/KfdjZwVUh67iEETLFKI5zEbjRRUA8=;
        fh=T6hsfikVel4LMt3p2nUYNB1im59flzN6qQEepX3cE1o=;
        b=Eqij+AzE0pUZsDoNMNUenz2UqCvfaeYbk8c72t+Vc0imu0QV8kGnMQJPVsi9OXnDSY
         qshqKIBWQaIelpsqn66GCmoIvMOoFruGlwIf4Y4CmcJsuE0a9Mu2AJ8lXxYMkvy8LAMP
         NUU8sFBfUA5wBz5kAEKtTsS3k2VPyj4lkGFE0zGzn4ozkzOEx0HnsZEfob8MmE89/Z51
         MHPwjmW7JFoRyEG9J6wcMx7V8szwfAqbudr8WaiKb12krq+ufMhtqz5n3cksdrDan6+w
         4h8kISP+7Ejz8z2I1+5Hbou1E9jG3BBOgpIkeXCBnGTKxxcAEoriO49f48CJ4jKO19sL
         WKIg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=VgM1KUNA;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ada2fe7eead31-4912b242214si1227214137.613.2024.07.16.08.45.36
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 16 Jul 2024 08:45:36 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=VgM1KUNA;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sTkMq-0000gK-BH; Tue, 16 Jul 2024 11:45:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1sTkMo-0000dl-7t
 for qemu-arm@nongnu.org; Tue, 16 Jul 2024 11:45:26 -0400
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1sTkMj-0005Ru-47
 for qemu-arm@nongnu.org; Tue, 16 Jul 2024 11:45:25 -0400
Received: by mail-ed1-x533.google.com with SMTP id
 4fb4d7f45d1cf-58be2b8b6b2so7067607a12.3
 for <qemu-arm@nongnu.org>; Tue, 16 Jul 2024 08:45:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1721144717; x=1721749517; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=tnC94CA6Wtnoc/KfdjZwVUh67iEETLFKI5zEbjRRUA8=;
 b=VgM1KUNAc2dhMu7RUNpdWGxB1RBHBcsdRs+AidnAocZI4vN/BQ1EBKzJ3B2jONEfAN
 fSqCD/c6vMbzvMGoZSMscWLj7HRxY9PMo3yD7SjU9QYIp9Lns7Y3Aq3UR0kTAJ9kmIdd
 GM54Yb0Pp8/4sIQvDqFwu196q/6TxIAZuljLZsD381o4lDFx3lF4NpVKLJcCPRT/G9Nt
 s32EvsW86KxnAFXtOSYSGxp+HZSCmr6lZEWX4WRRAhE7ifVbQ2GtGHdQB/Nm/KuRHfdk
 C0kl5HOLvrRMBZ2KPn+vAwjPzfF+vEVr/11301yAlFO0cZ6gFsQMSr9Uhs9yE7Vzrw9o
 cKZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721144717; x=1721749517;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=tnC94CA6Wtnoc/KfdjZwVUh67iEETLFKI5zEbjRRUA8=;
 b=KPmYta/KRneHmApUWNXwjijzM/fnfhN65CWv4iRWI5aydCTAOZ+5ct3gPhgdup4WyW
 7w5d1aO6GqytR8oHw0ZqaDqmH2GXmyybQVD5n8ExgH9dw0IjrShGaqpvd9VHsQc+/Dt8
 lhEauLHT8IDHTRSCEpUne7Q9nuPzmHhFa8jwC8Kw9XfU/12/dU1sS9D9RQnfNXJ1XTcR
 uSnMqERrV5nRc7/QuD2ncS1vDxiw9+dSrrCI+F7KgG717H+zNscv1+Wiiy8srSp0o28l
 OXYq5CoV2NBVBmIroWeJxPNc9gUGM8rVlWHi8TMyroJOw+PrzV8kwRvSe6PGrrSFuFju
 hKZA==
X-Gm-Message-State: AOJu0Yz0NIPOqQ3VTzpJp+6v6qFeZ1ZGuIorphEliPvxHAXnk6DNEeuT
 qh8roOUj+94W3Vd8UPyaF5d97qVl+pe+GuNktdyObtNuM5QxhFPpR5Pmfii3iwNKq6GmPapfMFN
 t+wJTsbTicj4x86W9VWC24cM2gQ8msC1A+3YV4g==
X-Received: by 2002:a50:8adb:0:b0:57c:f091:f607 with SMTP id
 4fb4d7f45d1cf-59ef00b4020mr1733294a12.29.1721144716935; Tue, 16 Jul 2024
 08:45:16 -0700 (PDT)
MIME-Version: 1.0
References: <20240709060448.251881-1-gankulkarni@os.amperecomputing.com>
In-Reply-To: <20240709060448.251881-1-gankulkarni@os.amperecomputing.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 16 Jul 2024 16:45:05 +0100
Message-ID: <CAFEAcA_7BOXSLXJ=VV0pWDvrN=2dWrM3bRTG+31ivPjeVbWGKQ@mail.gmail.com>
Subject: Re: [PATCH] arm/kvm: add support for MTE
To: Ganapatrao Kulkarni <gankulkarni@os.amperecomputing.com>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, richard.henderson@linaro.org, 
 darren@os.amperecomputing.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::533;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x533.google.com
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
X-TUID: zLD8esxjQN29

On Tue, 9 Jul 2024 at 07:05, Ganapatrao Kulkarni
<gankulkarni@os.amperecomputing.com> wrote:
>
> Extend the 'mte' property for the virt machine to cover KVM as
> well. For KVM, we don't allocate tag memory, but instead enable
> the capability.
>
> If MTE has been enabled, we need to disable migration, as we do not
> yet have a way to migrate the tags as well. Therefore, MTE will stay
> off with KVM unless requested explicitly.
>
> This patch is rework of commit b320e21c48ce64853904bea6631c0158cc2ef227
> which broke TCG since it made the TCG -cpu max
> report the presence of MTE to the guest even if the board hadn't
> enabled MTE by wiring up the tag RAM. This meant that if the guest
> then tried to use MTE QEMU would segfault accessing the
> non-existent tag RAM.
>
> Signed-off-by: Cornelia Huck <cohuck@redhat.com>
> Signed-off-by: Ganapatrao Kulkarni <gankulkarni@os.amperecomputing.com>
> ---

In target/arm/cpu.c:arm_cpu_realizefn() there is this code:

    if (cpu_isar_feature(aa64_mte, cpu)) {
        /*
         * The architectural range of GM blocksize is 2-6, however qemu
         * doesn't support blocksize of 2 (see HELPER(ldgm)).
         */
        if (tcg_enabled()) {
            assert(cpu->gm_blocksize >= 3 && cpu->gm_blocksize <= 6);
        }

#ifndef CONFIG_USER_ONLY
        /*
         * If we do not have tag-memory provided by the machine,
         * reduce MTE support to instructions enabled at EL0.
         * This matches Cortex-A710 BROADCASTMTE input being LOW.
         */
        if (cpu->tag_memory == NULL) {
            cpu->isar.id_aa64pfr1 =
                FIELD_DP64(cpu->isar.id_aa64pfr1, ID_AA64PFR1, MTE, 1);
        }
#endif
    }

With this patch, for KVM we will end up going through the
"squash ID_AA64PFR1_EL1.MTE to 1" codepath, because KVM doesn't
set cpu->tag_memory and this is still using that as its check.

More generally, how does the enabling of the MTE KVM cap
interact with the ID_AA64PFR1_EL1 value that we read from
the host in kvm_arm_get_host_cpu_features() ? We care that we
have the right ID register values because we use ID field
checks to determine whether the vcpu has a feature or not,
even in the KVM case.

Since Cornelia first wrote the patch this is based on, we've
landed gdbstub support for MTE (so gdb can find out which
addresses in the memory map have tags and read and write
those tags). So I think the KVM MTE support now also needs to
handle that. (See aarch64_cpu_register_gdb_commands() in
target/arm/gdbstub64.c.)

thanks
-- PMM
