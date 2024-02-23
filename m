Received: by 2002:a17:906:e92:b0:a3e:79c1:d636 with SMTP id p18csp690796ejf;
        Fri, 23 Feb 2024 09:03:53 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCXebhv7hxKUHo+YjJ99XqczVGi9mYuMsWYZhPrlfgIL5OwEhWP0l2YpUDrERdjm0Be3F5RZBWsrvpktV2cFr/KOhIVmNyjm
X-Google-Smtp-Source: AGHT+IE59NYYIbUYK02Z0WyPwjH+8+gW1HOYTcYRG8+Fx1Ah56XZ/kDYQyNe3NyHvXIqyNVMK5iH
X-Received: by 2002:a05:622a:1307:b0:42e:697a:ecf7 with SMTP id v7-20020a05622a130700b0042e697aecf7mr365527qtk.66.1708707833078;
        Fri, 23 Feb 2024 09:03:53 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1708707833; cv=none;
        d=google.com; s=arc-20160816;
        b=wsswmVMsN2SEsNv8h2ySKPwAvKGVn7VJG+yCEZapcIDfNJ6uRcPhSVJQvthBuPUx86
         ms3zM6oVueJf+PgFOpOmJeyKkfX1HS3u0AobRr92DuzNqbrLbZai6i/ya9hNWJKPYUCV
         Q/EfdN8pq77cAvUoRcBPsZ/Wscii6IJ1F9Nj5Nii1sYegq1h+WTgxbGNt+Pbp03F7vmN
         9HFlioK5uQ4DQjn/Wi5a7Ep3P2jFWxL7d4WmMJTkOvCADB3cex0rPZ9kGMcHJTHwkBfP
         kLXUMAC0eWlyyUYGdNdgZHr9jVcmWLPfmJ8CLJH2Q6LGF7mUBkcTEm/y6FtJkKlnabSI
         H+Jg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=huUmAK/bhJXRWo6E4DM+CeHMOoTn2QBzs+TkIBIcbD8=;
        fh=gdBed72JnSifzQdV0PLkUCrNnp2PjbNCgzXbyzmTG1w=;
        b=wuyjARFG23CNNYcjc2taLI8i9NVoGU5ww5jM4nZuILSRVRLBoY7ksOS+d86jszWnl4
         l8/NpUP+9yeT2nPP08J5OZAsJ1l2yhTssO25zYcEt9/BAk0QgMMqBwXN6I6V5Ai/rU75
         +5o8aKSsxBmHaChc5OsuQUkAXCxkUUfEmcBHX2J/nK3fhRBVuGT2gRhNNsOdWXf55BGO
         5Ejf/Wn0fuyfHKpXI/sJiAEPS25LHuLWSpWnLqFfETbCSzbtfBGWXPpUNlV4upC4DHan
         FTosqEYIESashNJ7kYaXKr5KiPDwKVaOFWP41MFL7clXRzGxnQA/xTVTTY1MTXn3x0dN
         /xIg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Ysp3t9y2;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y23-20020ac87097000000b0042e0b35554fsi3589247qto.588.2024.02.23.09.03.52
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 23 Feb 2024 09:03:53 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Ysp3t9y2;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rdYwm-0000Xw-9Q; Fri, 23 Feb 2024 12:02:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rdYej-0006Ed-OL
 for qemu-arm@nongnu.org; Fri, 23 Feb 2024 11:44:14 -0500
Received: from mail-lf1-x12b.google.com ([2a00:1450:4864:20::12b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rdYeh-0001R0-6M
 for qemu-arm@nongnu.org; Fri, 23 Feb 2024 11:44:13 -0500
Received: by mail-lf1-x12b.google.com with SMTP id
 2adb3069b0e04-512db550e3fso1352566e87.2
 for <qemu-arm@nongnu.org>; Fri, 23 Feb 2024 08:44:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1708706649; x=1709311449; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=huUmAK/bhJXRWo6E4DM+CeHMOoTn2QBzs+TkIBIcbD8=;
 b=Ysp3t9y2dAHXDiC9gSYAXHpeAATMVyNKmd0J7EwpdrTC5Cb8MYjW5Kn7Q2AahrkNqJ
 46sZrOADLnUqvzGHWB3GOS5mVkkWcPphQRyGaMX3MTLPB/AAE8s9aefPEst7xn2Cez6U
 7Qc40009HrPoeLeNU5IuV8WKRW+d4P04Da58CWYJJJL4BZoUDbB8JiLpTZSQD/mpMClj
 hPU2V6m49heSdL5MPloFlXp8YnI597Z05kn0nI6d5CKdZjMJMO6P1jzzclZnRFBTdiMf
 9aJbxVquXxFduoCuaUrsJvsCd39UYF7gALkpuCgJdP1EJAfwJ1yoGHHM+Ut3OPz2QW50
 StHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708706649; x=1709311449;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=huUmAK/bhJXRWo6E4DM+CeHMOoTn2QBzs+TkIBIcbD8=;
 b=LIxt8tcdndDQmub8tXb+847Bp+Fb4VUYcVw78WtbaHuXu8iT/BSC5R6teK+3bFU2/4
 KPpBrfZFNmauSpcrzS3vIVc2smkE7Pr7LSIyDlVU+b9K/xJQSwWLOiWck5F+jaINAhvX
 lXYKafDOu5k7sydxQ9iJmAWG6OM3tEvdUKPuYGa/oh+VrHCZ2PU729wRk6NdNVRT3L82
 wwUiLhHRXuTY4LqM+b9GcsUJ+zLK+fILzEx23E6upcEbvU1J3XdjGG5Ee5QL/LzPYudJ
 koJcyJwpa3tpOfYvS+Q6byotDbAUtY58AJlAX/KiYBu2sU7rADqmoQxFOwLgcOiZOVPG
 7ILA==
X-Gm-Message-State: AOJu0YyzEU4z+4nsgyLQnk/7ey86d5ss48bEMQ9Sm80KMSG9QRZgFc+I
 z5mlzwYlgmjCaprTPe+LcrDKOK0Qeq51x2TfDBX6S9yYnZdlklbbWd73umXjA2goxCZUFWVuwpO
 /ZDqwpLojCHQZ9JLvzC0myvAw27RnaHqOvk/1FQ==
X-Received: by 2002:a05:6512:4005:b0:512:b3f8:81d2 with SMTP id
 br5-20020a056512400500b00512b3f881d2mr312805lfb.12.1708706649416; Fri, 23 Feb
 2024 08:44:09 -0800 (PST)
MIME-Version: 1.0
References: <20240219011739.2316619-1-sergey.kambalin@auriga.com>
 <20240219011739.2316619-9-sergey.kambalin@auriga.com>
In-Reply-To: <20240219011739.2316619-9-sergey.kambalin@auriga.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 23 Feb 2024 16:43:58 +0000
Message-ID: <CAFEAcA_6EL4268U5=Q9mXHwZBv2NVWc6vuLbYk7d+p8LHMMsWg@mail.gmail.com>
Subject: Re: [PATCH v5 08/41] Connect SD controller to BCM2838 GPIO
To: Sergey Kambalin <serg.oker@gmail.com>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, 
 Sergey Kambalin <sergey.kambalin@auriga.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::12b;
 envelope-from=peter.maydell@linaro.org; helo=mail-lf1-x12b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: lQUZqWjFz+TA

On Mon, 19 Feb 2024 at 01:18, Sergey Kambalin <serg.oker@gmail.com> wrote:
>
> Signed-off-by: Sergey Kambalin <sergey.kambalin@auriga.com>
> ---

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
