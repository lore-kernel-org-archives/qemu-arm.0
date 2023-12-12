Received: by 2002:a17:906:535b:b0:a20:43fc:1f40 with SMTP id j27csp1036106ejo;
        Tue, 12 Dec 2023 08:47:17 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHbsMGaUoyGZLRqnSgWXAtWXuH+Q+e1SzSgNRazbzGQJNdoS2lrQOJ4et+pTunAs+LXtXsh
X-Received: by 2002:ad4:4210:0:b0:67e:e816:8eed with SMTP id k16-20020ad44210000000b0067ee8168eedmr1414896qvp.11.1702399637009;
        Tue, 12 Dec 2023 08:47:17 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1702399636; cv=none;
        d=google.com; s=arc-20160816;
        b=Qq/edaetS+V/cbOYxk0S+GnjZ28yIA+bzKOSIFp9Dz2nbmHWhaCWxDOazKr3DC2p4W
         pMXrCrRtXEXB+X18s3rQonXDefMSRrMoUb9w/yyMZdutkUSIVcP7qi7UW23ECIfLXD8S
         mTr3aHHNlxnE8l/UDYknF4TQJldLGvwmLhbGsAsFz+6EmsLe24uqg19wHrb2evk3FTfu
         EbTeyG1XefFIhA9y4K4ixGyzb9WrEo+TW6SwCiykFnFyhZj7z6f3aSqWrXn+RykZGRY/
         DphhfVJfu8gzG+H2X55oNmd3I3cYupClMb1X4ve+J5Dsmlif6VyiX7SbxjQaXjqfSmMa
         yp0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:cc:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=uFzyQFyEoKLJOk8HnGBv3xF46rshezAwR/jjNtDoTVc=;
        fh=oSak0SfGtiLsfNmzdEAK2zLhe/BB9IXTK0i2wATuAS4=;
        b=ZGTJcObcI/KFVxsAz5ri2hKLlEQfNCqenvfRnxkQglXhBHyqelDVwMI0N8OtMNgSAw
         Y0NRNmTFi3u7FJbgT6kb+KzJJFbwfuDFHRLQ9VWfN/uNcZOoua9TdbUzCxuWHoJ1x5k7
         a6rNUnaUdytBD7o+i7QO0sWku8sMj01ubKKXCvgY8GXtkVOuSqwzfxl3s8aFFWoVWuzY
         ezhBiboBCxbterKxdeEWkItn6SPVwSv8dN9rCsBk3rB6Mph1lMoXq5u85IcKoe6Gr0HU
         bhfFxCpw1AFL/Wf2IWSltcIyDgUaEEJHd1MphFjzHB6L2QEX8rbirERRVx0P5j4VsejW
         VV8w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="VC59p/c2";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y8-20020a0cec08000000b0067a69bd3970si10764926qvo.480.2023.12.12.08.47.16
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 12 Dec 2023 08:47:16 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="VC59p/c2";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rD5uZ-0005XC-Gp; Tue, 12 Dec 2023 11:47:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rD5uT-0005WR-0i
 for qemu-arm@nongnu.org; Tue, 12 Dec 2023 11:47:05 -0500
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rD5uP-0005Zu-LO
 for qemu-arm@nongnu.org; Tue, 12 Dec 2023 11:47:04 -0500
Received: by mail-ed1-x52a.google.com with SMTP id
 4fb4d7f45d1cf-54dcfca54e0so7641231a12.1
 for <qemu-arm@nongnu.org>; Tue, 12 Dec 2023 08:47:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1702399619; x=1703004419; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=uFzyQFyEoKLJOk8HnGBv3xF46rshezAwR/jjNtDoTVc=;
 b=VC59p/c2qZ0qqIHEhnmzDEzQ+BT3+S4AG7utsBl1FB+J31+VYiRuc1Df5jlcMQqB88
 V21wI+qyhcVczvGUanSUnZjrqo3zEntLBvy05o6Oo5D1087Yj/Dlzq9wBgR5iA0uG4SF
 PfcQbpfkh8StHHpig7mWq/YmYWD4L/YWmMpTqgh0r03L9cHoH53aiUYI8J3s3JRgT4aQ
 oJ2k/z82gm0R474ixJG1ymH6ejNrjFdOCh8wEvU2IPmIMOKgGGTHow4uoWZfPWrJ30vX
 Frvbll2i+96CGHs47w3Fd1ijh2lR/7YKxEYZkvSfLqc4lIiLb7rPwLqK5inpQZUtIVx4
 qRhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702399619; x=1703004419;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=uFzyQFyEoKLJOk8HnGBv3xF46rshezAwR/jjNtDoTVc=;
 b=g8ciILevt7UcwrsBaatKfLPJmbgsWRMkNAT/mMWaz/pHtSQ9UaSR3jNdCHlmA8snxq
 3WgPVAc/UUZpjUK7FXQgGEfXRPTdFFHKTbucXlmBBFIsJLVdOgOQUFVsmud/OYkXejGm
 7euEZ2u4R+7jqxCXSvt3Qtv2euG5nuJxd1wvUL1+YYDGy5FsPxoq4JBVUiguT9LRWjOD
 BFzVJJVDwdRVun1uI+i+AgEUiyk7q0Fu8pAo0bi1eZmLSb3E83XV8JJNxq0vd3A0EVTd
 44ZjaekqDgKwDKhYDaPeUT5flDl6/NtFKqaiDJDhl8BHVbam4nU6rmPOwN9Ti/oxAVsB
 nd9g==
X-Gm-Message-State: AOJu0YzVjyxxu3dd7WFrPVb1IKc6B6z/2x8Mb+ktdy9FZq7nbBalgr8O
 8rc7CqXCEyIheqeKLxznq2zAQoNIZC/1r5t+uqaOuA==
X-Received: by 2002:a50:cc49:0:b0:54c:87a1:34fe with SMTP id
 n9-20020a50cc49000000b0054c87a134femr3896078edi.10.1702399619570; Tue, 12 Dec
 2023 08:46:59 -0800 (PST)
MIME-Version: 1.0
References: <20231123143813.42632-1-philmd@linaro.org>
 <20231123143813.42632-5-philmd@linaro.org>
In-Reply-To: <20231123143813.42632-5-philmd@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 12 Dec 2023 16:46:48 +0000
Message-ID: <CAFEAcA9s31674uBNiSN0tV0geyWdscH-5oT=buWuKmJk3QWLSg@mail.gmail.com>
Subject: Re: [PATCH-for-9.0 v2 4/8] hw: Simplify accesses to the
 CPUState::'start-powered-off' property
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Cc: Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, 
 Alistair Francis <alistair@alistair23.me>, Joel Stanley <joel@jms.id.au>, 
 Artyom Tarasenko <atar4qemu@gmail.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, 
 Ani Sinha <anisinha@redhat.com>, Eduardo Habkost <eduardo@habkost.net>, 
 David Gibson <david@gibson.dropbear.id.au>,
 "Michael S. Tsirkin" <mst@redhat.com>, 
 Andrew Jeffery <andrew@codeconstruct.com.au>, 
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>, 
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Niek Linnenbank <nieklinnenbank@gmail.com>, 
 Andrey Smirnov <andrew.smirnov@gmail.com>, Tyrone Ting <kfting@nuvoton.com>, 
 Jean-Christophe Dubois <jcd@tribudubois.net>,
 Strahinja Jankovic <strahinja.p.jankovic@gmail.com>, 
 Harsh Prateek Bora <harshpb@linux.ibm.com>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>, 
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
 Aurelien Jarno <aurelien@aurel32.net>, Igor Mammedov <imammedo@redhat.com>,
 qemu-ppc@nongnu.org, 
 Hao Wu <wuhaotsh@google.com>, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, 
 Beniamino Galvani <b.galvani@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>, 
 Nicholas Piggin <npiggin@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::52a;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52a.google.com
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
X-TUID: 7ruvVmH56IJA

On Thu, 23 Nov 2023 at 14:38, Philippe Mathieu-Daud=C3=A9 <philmd@linaro.or=
g> wrote:
>
> The 'start-powered-off' property has been added to ARM CPUs in
> commit 5de164304a ("arm: Allow secondary KVM CPUs to be booted
> via PSCI"), then eventually got generalized to all CPUs in commit
> c1b701587e ("target/arm: Move start-powered-off property to generic
> CPUState"). Since all CPUs have it, no need to check whether it is
> available. Updating this property can't fail, so use &error_abort.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
> ---
>  hw/arm/armsse.c  | 6 ++----

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
