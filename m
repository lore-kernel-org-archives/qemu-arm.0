Received: by 2002:a17:906:4810:b0:965:a47e:1721 with SMTP id w16csp389713ejq;
        Fri, 5 May 2023 05:45:44 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ7itfmyTO8Ho+YxY9sMuqi9QF8W/jLMevCp1sw2gjwEZvPZwnJAbVa32C83d3qCo45DTUuc
X-Received: by 2002:a05:622a:286:b0:3db:6f27:60b9 with SMTP id z6-20020a05622a028600b003db6f2760b9mr2205817qtw.15.1683290743820;
        Fri, 05 May 2023 05:45:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1683290743; cv=none;
        d=google.com; s=arc-20160816;
        b=KYXNPLMVc3/DhJPxss2bn3djTXfHVPRf4PblNHNmSGdZwBV9n285FVpPNtM8sGcAhS
         obj10OitRiyTZQBGK16R/Cn6az3JO20hGc00LUmQX2nItaXRh5sxIAW3q2qcMv0nhpDl
         QId9PNK70/ecI7ckYGRHHB62vSw7983cVrcy0qf8QranQjzv0fWWyddHHXVNoOqRgMJY
         uRbJ7Ms1jBd+FfoTOzHEz84xCVWx48quF4fExidZcyTrQJX0kFS3eGQaYv7kyUFgDeZ6
         LXcGOpiOwmK9pMkESUPq4mKDzXMWVSXXEHnqYFdwShVow135DLcybD7DgY1RCCxTHTbm
         Qp3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:cc:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=eNfk1QD5fFBnKIxIsXqmQGResbmawGI2lSHAgxBoI6Q=;
        b=losvTmji+OLiogk4XanoriUFt2h4LsIuOPnQ5eKl338D+QqaAp/Rj35O3oaTfULxw/
         TAM/idBJiSEsFsaG94gpyAD+6KFMzQhkmlIBUFnbbJUyaJimqD07jN0nNLwvcVJeejwD
         Rdwpa+G8ZxjaUslMw5cuur3tbtNik6dD2abN5QOkXRCncjvROOaKamAVGVr8OgjHpykS
         z64qSO/iUroXzM0eIu/+w71xDKf9weTkTI59OG+wlnG5vybUdqDjenn89lHXSEoevwzr
         FOCUrxLUsoIhVKNwsjlfPRqJvQanf6terRb35MN458wod15NmaH4wBah4hDn8VSICgxD
         dlZA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=vpLytoj2;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id k21-20020a05620a143500b0074adf0d8894si621502qkj.226.2023.05.05.05.45.43
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 05 May 2023 05:45:43 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=vpLytoj2;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1puuoJ-0002ks-F6; Fri, 05 May 2023 08:45:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1puuoH-0002jv-PZ
 for qemu-devel@nongnu.org; Fri, 05 May 2023 08:45:17 -0400
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1puuoG-0000je-Ab
 for qemu-devel@nongnu.org; Fri, 05 May 2023 08:45:17 -0400
Received: by mail-ed1-x533.google.com with SMTP id
 4fb4d7f45d1cf-50bc070c557so3297461a12.0
 for <qemu-devel@nongnu.org>; Fri, 05 May 2023 05:45:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683290714; x=1685882714;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=eNfk1QD5fFBnKIxIsXqmQGResbmawGI2lSHAgxBoI6Q=;
 b=vpLytoj2TCNHz8id3LF61ZPuGXm/ymlzp0eBzjf1Irh3m5gm/mtxcpzsbj9PrrGY4l
 iQnb8TW0U9NGPdV3PmKGJUD/R47K3JfT7OPbLjpkoBlkJrCoxwYxof9IU9QEZ5Oe0v9W
 fSTWvKb2xlxPCzhuPAOggMjnVCvDUZJJO66Klyfopvz+WPGnq6hLnN9/jZGEcuMAkTKA
 L/aOQtd/YtkmNdmjrsGGPoeRD5e2rvyqpW5Vep8JGm2nq8NA/nDncZAuZ9Rb4pvNlUxD
 mxVEu+DS21WS0k83JIfnbuQVkR3W6E1A56z42htiZOv8MIfGUAftNhcgBelBarWGle7V
 jfCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683290714; x=1685882714;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=eNfk1QD5fFBnKIxIsXqmQGResbmawGI2lSHAgxBoI6Q=;
 b=fhwTstVrP0rZd9JjxyVXxVKc8c2nEzNfyWf7kBvkONafEkso30G/qG1KjFwQv3v6kH
 xxvZa38zxIbkb1Qm1Da9FKa+9giUXcFE+j0Fzzp/Hcn95rcBwxargcXjXz7MFVxHL5Bg
 nVc2pMqi8OaKb87fqeI23XfazUXl5hAcdXJhEx7eQhJqzIT+AxSad/nY3UkIFVeo4drS
 RGD58HWoSDk/jWcYEpz0g9ffbDj0SYwBSv76kaLVjW37uKiBrBTa80Hcd9gdyVICIUF2
 zu0qBqpLTTifnWDSPAQcWBqa/0qzThAEVpIKBrIIMrCsiLb/CqwDFUTrHJ1jprYFUYel
 zGNw==
X-Gm-Message-State: AC+VfDyLim5M//KSgLi1A2ZrYjUPPeTuoi0bboxS3MOWQ2s1oWZsZrMc
 L3TatrEJJutqpnzirQtZgMc1VlwaWANWKfPcJ48M1A==
X-Received: by 2002:aa7:d686:0:b0:50b:f9d8:ff72 with SMTP id
 d6-20020aa7d686000000b0050bf9d8ff72mr1235617edr.31.1683290714506; Fri, 05 May
 2023 05:45:14 -0700 (PDT)
MIME-Version: 1.0
References: <20230503070656.1746170-1-richard.henderson@linaro.org>
 <20230503070656.1746170-41-richard.henderson@linaro.org>
In-Reply-To: <20230503070656.1746170-41-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 5 May 2023 13:45:03 +0100
Message-ID: <CAFEAcA9yr-7zDWJkbxEJVBO+FtRcK=TAOw+PMjsK_pYg06zRww@mail.gmail.com>
Subject: Re: [PATCH v4 40/57] tcg: Add INDEX_op_qemu_{ld,st}_i128
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, git@xen0n.name, gaosong@loongson.cn, 
 philmd@linaro.org, qemu-arm@nongnu.org, qemu-riscv@nongnu.org, 
 qemu-s390x@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::533;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x533.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: aZjQIJf2SIki

On Wed, 3 May 2023 at 08:13, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Add opcodes for backend support for 128-bit memory operations.
>
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
