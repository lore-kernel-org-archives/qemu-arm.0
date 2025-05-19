Received: by 2002:a17:505:bc8:b0:1be9:327d:8ee3 with SMTP id pe8csp4171495njb;
        Mon, 19 May 2025 07:58:19 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXGAjJ8a/XtMKQIHc0lM4ZistZU6P4GQiuhUku1X7+5gxJ+Y6HIfyMuUHWk6o7LChbI1zhB3tVb0Ynxdw==@linaro.org
X-Google-Smtp-Source: AGHT+IFduhDeSZcpQq25ysJuP1uXJK+soFlrZkIChBdJiqAsXhFVqh3Vhv5L8rfnK5GyvC7mVHcq
X-Received: by 2002:ac8:5fca:0:b0:494:b1f9:d677 with SMTP id d75a77b69052e-494b1f9dbe3mr153788791cf.48.1747666699251;
        Mon, 19 May 2025 07:58:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1747666699; cv=none;
        d=google.com; s=arc-20240605;
        b=dw7y57JhhEB5lXc78NZSBq2BMaX1XT971Lqr/WBRn6Uk9LdEz7RMNG9Cwoo0Fj0DlQ
         RDJwoxiayIIzAWV/jz+USjE3Sfe5dVIbQSto0r6p1+psWKZ1TaByAHc6M9sIYz11zOjN
         Vn2+10F/eIu7VBTM2+5R8+NPslYHFzzug3wuRS0WeZWVHxlyJxUfn7KUSwryJgXZqS9H
         JNxpgFhIW8RR82wZYpU5BK2iw11Izac1/jORQ8Zb52wl6EOvPMb2Dbl5kbyN9Hb2pV0u
         QvTb08aZIzffAtSJ4W2KcI8lTOMTbM/azCbULtMPgixEK7pHeBvFHsK9BoXVYsBw4QAK
         xRUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:cc:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=q47yyg4oDVwxnY52rN/cVcs8y/X6eSpHam9rzR7KJ+M=;
        fh=ILlKD5eMxZoltA+VKu8i0mQGp3kxZLCD7Jfd46e9rYI=;
        b=F8j3PQ8ySwjFAQqgvatODcdh5f3gi1pWu9FCpApsT3nIQA2sTVMc1J8csIZfqzSqa4
         3keMctjvfbXL9CLvne/A142lukzzH9Tj1lsJN+4sqN3h3Zk+wfOjUisJT2EhPd/BJika
         Ed549WC1yE5k3VORetFiffvPI9EDFXXHbWKOYJdtPIzMBDjwqEMIisrCuijme6DGjqWe
         KcGcHNUejxF3JfJpcgsbmZhGuprbc/iRIzd0XPF81vFMdbINAeG7HHQr4bwG79CsDo0z
         YbByW6FbAUbzbiG2eX9GzzZ5akhF7mutN2yAcP28ZvIOLf2br8PZ3LxtulnBzzWXzByU
         nW8g==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=jwn0ggUm;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-494ae40e362si96989371cf.118.2025.05.19.07.58.19
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 19 May 2025 07:58:19 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=jwn0ggUm;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uH1wR-00060X-KL; Mon, 19 May 2025 10:58:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1uH1wQ-00060B-Bp
 for qemu-arm@nongnu.org; Mon, 19 May 2025 10:58:10 -0400
Received: from mail-yw1-x1129.google.com ([2607:f8b0:4864:20::1129])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1uH1wO-0001fu-Ej
 for qemu-arm@nongnu.org; Mon, 19 May 2025 10:58:10 -0400
Received: by mail-yw1-x1129.google.com with SMTP id
 00721157ae682-70da0603e24so8827497b3.0
 for <qemu-arm@nongnu.org>; Mon, 19 May 2025 07:58:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1747666687; x=1748271487; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=q47yyg4oDVwxnY52rN/cVcs8y/X6eSpHam9rzR7KJ+M=;
 b=jwn0ggUmcXmjxMo3e4GABKVHDYyr0yy7K6SNm+eKF/NAaEpuQN6SJYvsoVKquan/aO
 LBdRwZyG+W9qQhAtcI/2D5ANzWpfRpE9d0m9zEGA6CuP8UE1ilfKHBkuAFDG+OA1NZXZ
 aJ0Z720pN4ocTF5Zn5Paie0B04yuFceSCaAEY74fW+L/7eoq1jAgsCScLxDBh0ZyUQkN
 OAPHDdXohwtPmpHNbcbota04K2NwICnojBOu7Z7fvwF4KdmxWtQQQxTEha2Hq7plqgyO
 1HRtF87mwQh/ftBr4uXVuQ5RtTuyB7lSQ8m75e8J9KrpKwXoJ24EluUfjsifJWvq2KpK
 ce2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747666687; x=1748271487;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=q47yyg4oDVwxnY52rN/cVcs8y/X6eSpHam9rzR7KJ+M=;
 b=fR3KZktaD2DE1oeaOWLo50hVREWXh+0wWwd7kDevngqZuh0S5jV4zRw/bjeVE7ixcj
 gl1G32wD5VESrlMLCDqn35AAZTwBCIwYfY8q0SUs5/ULhDCPyvEJKzSuUdT7cAaAuVTx
 mZ3sUKkxlgZK4xnxB2DZzpZ88Xq2jNkm5l4XHXeqmvteWtEiwrZll/pb/+F6bOQ4NYNp
 B3PxwKHUNZdQY+DzdK3p2a6eUKh5jEGam0cjlo0Rrx3xRLQ+N0tM9UgyhRMh4x6L/uT2
 uWU8zVgLiQFr7d/hf/pm54JVQp1ms6rAqwPLSuXRFLstPA2limOgvxXTaubvihzrPcNE
 q2zQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXgt0k8SNjfM1mvZveurj43tMe1SPS6DOgvxR2pOkJTyt15HAuyI10Hu3W1FItkXbDInNW+v5T3Xw==@nongnu.org
X-Gm-Message-State: AOJu0YwSY3q4pUvcMpKELnxqc8bXMuOtvPWSiPMuazxxJ3Amx3zZ6ZEj
 QL2KoFnS5W//62Sk6fo1Y1G58nUlIgrDZWWIQPxmZ6P6PH/HJAcfMcEmCVcl/oPZVS24fnEagcQ
 gqKpnsNkPngPiK1JYKt1zunRwOqJfwjrI0bXOOPTQDQ==
X-Gm-Gg: ASbGncs9YSWDHrSkqHeULGEy2EFMZssBE0zEEDEXq3cvixTrTVuhiZEqtKC7NuBQZfI
 SmWG9qfoTad2oz3A5RAqVAbC1HCM0gxr5+QnEXejZ3hBfDRwsy2sQnbV3lcWLJdVjc8KhRLv4oj
 oOvprtzzW/k9zekbouB7ZEX7gaPzlmiYMlYA==
X-Received: by 2002:a05:690c:560d:b0:70c:ae79:255d with SMTP id
 00721157ae682-70cae793035mr109872007b3.8.1747666686851; Mon, 19 May 2025
 07:58:06 -0700 (PDT)
MIME-Version: 1.0
References: <20250513141448.297946-1-chigot@adacore.com>
 <20250513141448.297946-2-chigot@adacore.com>
In-Reply-To: <20250513141448.297946-2-chigot@adacore.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 19 May 2025 15:57:55 +0100
X-Gm-Features: AX0GCFsf44bnVX2Sb__McfKp3vLQnJsSU3p3xxaeNK3yRm09X_jaS_06gk5-Cy0
Message-ID: <CAFEAcA_MkhLZcqWJCJhCQfinJK1DHM-cHs1-sa-Sr2YgQyq5Vg@mail.gmail.com>
Subject: Re: [PATCH 1/4] hw/arm: make cpu targeted by arm_load_kernel the
 primary CPU.
To: =?UTF-8?Q?Cl=C3=A9ment_Chigot?= <chigot@adacore.com>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, edgar.iglesias@gmail.com, 
 alistair@alistair23.me
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::1129;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1129.google.com
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
X-TUID: Ssp0T+H+ycsz

On Tue, 13 May 2025 at 15:15, Cl=C3=A9ment Chigot <chigot@adacore.com> wrot=
e:
>
> Currently, arm booting processus assumes that the first_cpu is the CPU

"the arm booting process"

> that will boot: `arm_load_kernel` is powering off all but the `first_cpu`=
;
> `do_cpu_reset` is setting the loader address only for this `first_cpu`.
>
> For most of the boards, this isn't an issue as the kernel is loaded and
> booted on the first CPU anyway. However, for zynqmp, the option
> "boot-cpu" allows to choose any CPUs.
>
> Create a new arm_boot_info entry `primary_cpu` recording which CPU will
> be boot first. This one is set when `arm_boot_kernel` is called.
>
> Signed-off-by: Cl=C3=A9ment Chigot <chigot@adacore.com>

Yeah, this makes sense, and every board currently passes
in the first CPU object so this isn't a behaviour change.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
