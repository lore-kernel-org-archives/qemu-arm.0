Received: by 2002:a17:907:8744:b0:9bd:85f7:2662 with SMTP id qo4csp3861132ejc;
        Tue, 17 Oct 2023 04:55:07 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEhlVqCP+ZjAOElc/5HP11GKCeqNoQCnL7Nv7rgPBRpM3BIlQ7Tgh+P6n66SOHfVx0iOhlv
X-Received: by 2002:ac8:698d:0:b0:41b:7f87:b2c9 with SMTP id o13-20020ac8698d000000b0041b7f87b2c9mr1392785qtq.45.1697543707201;
        Tue, 17 Oct 2023 04:55:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1697543707; cv=none;
        d=google.com; s=arc-20160816;
        b=DEcxPks5XFKW23CP5Q5haVG1rPVBP/PCLaQsGTtrHIM7pyAJQqQx7mOpJDrmJhrva8
         tronuiUJAwrQTuZOyZpZkfALLbkifaVyAe78dgW3cn5HqVjre3eRLdwZ7D/pjtgjSO4B
         toab7phmN+4kS8+0aD0vKDcY8OsMKDDlygq3x2jAq90la9mXO6q1UhyL01bzMOE+9Skm
         5VKD7YkCEp4A2jC1LP2Izq4rIlQs3u9bsoeHSqmQAse8gtWvwJGTVMWYUIHpuFOlKszL
         lj9M5fZSS3tNUA9WS73s/ewaOMGv8rNlu/9cihW2SVeH7lVdTC/RtgkDmLbV0GxSBUp1
         yT4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=QOOY5JrfO4GpTG8CZNRDaBIYx08D0HRbf1Tnt5GUlMA=;
        fh=1+iHolRYECe2ybtGU55u4K8H4b0+ghpL8z/BMNYY7WM=;
        b=Aa1jI+LGQWEDGo1CfoQFu5jdBpUF5ii2vdW9cLqJOJIJhdeVcPsgbMXfKqf6JfALN3
         E9r61oFmyvCpT62rCg3TIApeA8dHonhmUtDiA3u1nBC602rCm6198wN1qv/OYJy8zKOZ
         Rx4qpswWw7Bw0zk1IjKBrz6P/wJbEbPT4Y/YJr2SZpo0ch4igSLf5W2MJnDqZNsYd7Dz
         mhYeQpf+VvVJd+WP5HV/tCFZFTSWwKjsECs5qDRmMcJcj28a2nqbKKBw0jHSJaWsDJgQ
         nEB5aZWQ49Dx0wupVt9wTIUhD5BiVHXCdRdpfLEmxZ97pzjVyFlRV4c+qq1TvjROrOrR
         Zo1w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=npyDSJRJ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x6-20020a05622a000600b00417a3aa1fb5si985801qtw.573.2023.10.17.04.55.07
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 17 Oct 2023 04:55:07 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=npyDSJRJ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qsidy-0005GO-7E; Tue, 17 Oct 2023 07:53:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1qsidu-0005Am-GK
 for qemu-arm@nongnu.org; Tue, 17 Oct 2023 07:53:46 -0400
Received: from mail-lf1-x133.google.com ([2a00:1450:4864:20::133])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1qsids-00057W-4z
 for qemu-arm@nongnu.org; Tue, 17 Oct 2023 07:53:46 -0400
Received: by mail-lf1-x133.google.com with SMTP id
 2adb3069b0e04-507a62d4788so4159747e87.0
 for <qemu-arm@nongnu.org>; Tue, 17 Oct 2023 04:53:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1697543622; x=1698148422; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=QOOY5JrfO4GpTG8CZNRDaBIYx08D0HRbf1Tnt5GUlMA=;
 b=npyDSJRJ4FBaS0CFzXijHNEqd/mElgDHp38XfO+dWerYPh40w9VGqkHrEnDbW10WN2
 6AXZtELf6w2RWViT7j0f3NlzExxT2hQpdHr6C95/VK1L+rL2Bi7kigdkHKIQiOR7ZuLB
 7jFdDXa+J9SUdIw4IipSKbNI/H14mAsDD1XAnasHn9YjoqssWbWZvXbqliWns72Ze4t+
 x0Rz+8kCzHqvYszlZWppox77oFONYSNqGDTtzbIY1p1/cEUKERstjilkNSGjBC4PYDhD
 rmtWXDGT7ickPioJn9HECWCKHQLHIQRNVm01mG8tLei4OsYd5d6KSPmhkxVp85b10nm0
 DA9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697543622; x=1698148422;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=QOOY5JrfO4GpTG8CZNRDaBIYx08D0HRbf1Tnt5GUlMA=;
 b=DOoXnBlgtx0Q1tp716ojNlZ3gbyYyjQfBqrDAY1H0gfBrhWo+Ka2RzzlON+EZOwInx
 CLtXoOWDKkOEDR2WqJ8IAx1V/Cj4CSaH9pSlRzZ0SZy+XVEO1+eXSbA1vt4E4pB4f2s9
 asgX4SN4zXmX5etyFaB5p4bHCWUJ+CnAAuBOK0JEZ184TAVgUnlREygdGtnIWD+bJPyN
 olDPvvghmhM3hcrVInLYPjMHjhzvcId6riVYbDOcfvR9tyMtD1spb5Ax4qRX6/RaoXMm
 BdPIE7Pir9rZnAahVPaDVyZnOp1QF4LYwklaZ5b9yZtPjBBvU7jj1Osii/9mueBRRbj3
 Sjww==
X-Gm-Message-State: AOJu0Yzqi2ZGrVlV4qd+l24H7gsvALoYZwIbHowhHh3sky8rLhkZ1CEt
 bHgflJ2HAjPGKUVQETElKy/QClNnJAmLRSAIP/kppbbzjsQ/OH5F
X-Received: by 2002:a05:6512:450:b0:503:1d46:6f29 with SMTP id
 y16-20020a056512045000b005031d466f29mr1489862lfk.37.1697543622302; Tue, 17
 Oct 2023 04:53:42 -0700 (PDT)
MIME-Version: 1.0
References: <20230919090229.188092-1-quic_llindhol@quicinc.com>
In-Reply-To: <20230919090229.188092-1-quic_llindhol@quicinc.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 17 Oct 2023 12:53:30 +0100
Message-ID: <CAFEAcA8_05mkFSqsA7NR3dP3UYqF3h0O6_SEEn_7N90FcKCQ1Q@mail.gmail.com>
Subject: Re: [PATCH v2 0/3] Refactor PPI logic/definitions for virt/sbsa-ref
To: Leif Lindholm <quic_llindhol@quicinc.com>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, 
 Radoslaw Biernacki <rad@semihalf.com>,
 Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::133;
 envelope-from=peter.maydell@linaro.org; helo=mail-lf1-x133.google.com
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
X-TUID: HlmSdGNyOI8w

On Tue, 19 Sept 2023 at 10:02, Leif Lindholm <quic_llindhol@quicinc.com> wrote:
>
> This set reworks the handling of private peripheral interrupts in virt
> to use INTIDs instead of PPI IDs, to make it easier to cross reference
> against Arm's Base System Architecture specification.
>
> It then breaks those definitions out into a separate header and switches
> sbsa-ref to use the same header instead of defining its own values
> locally.

I've applied these patches, with a few tweaks to patch 2:
 * the macro PPI_TO_INTID is unused, so I dropped it
 * I sorted the defines into numerical order
 * I added ARCH_TIMER_NS_EL2_VIRT_IRQ, which fixes up a
   minor conflict with the recent sbsa-ref change which added
   use of that IRQ

Applied to target-arm.next, thanks.

-- PMM
