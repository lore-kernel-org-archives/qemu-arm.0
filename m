Received: by 2002:a19:e20e:0:0:0:0:0 with SMTP id z14csp174621lfg;
        Wed, 5 May 2021 03:47:34 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx4l55t8sgJwT5mtJSI6p1yO7pTUhka87x9Ee4EHIdwcejQVaIxg4NLjGK331QktSrq13Vs
X-Received: by 2002:a6b:7413:: with SMTP id s19mr21897682iog.151.1620211654134;
        Wed, 05 May 2021 03:47:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1620211654; cv=none;
        d=google.com; s=arc-20160816;
        b=JW7lb23TUD6figxauhN/G1PDLVORwZzkoKZDuUt5Ro8Eyfk20uHDz1pUayYxl0D0o9
         1Hw4WO8UqYbjzeg4jl3bVicTnZvdcC26LtZoT/3E2bo/IVepyZPgkL2FL/TbSomVyir+
         BDHGqfP5omUOmMLRTI7L9DrqZ0QqMW6nDHg7SiWGs0fpTR9LwCZU6c0eKA0uktWyOSsX
         O9fK7TiwnHXGoYTzfthAfQClrvjIGIU6Nns43uycEBS/Oe/F9yYZXDIFZ4w7e9c/L1gN
         9T3a1X0wAnk1uzBkUbuM1sjLdkN0FSSKw2EYNzf6r8lXhElTP2bobHzAScywfOS3oHW3
         ia1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=THr0mjNKzPmZVI6XM/GT1xMzhTITjljxUc0ohXhalw4=;
        b=aG5JpnQ29B5zIkFHoyZS2GDzfGBVcx1aSCSWW8rAtTCNFj1m9hDRv2F7yZsPFlJdJe
         YbIN/1XMlm/o+U0jU8IUIdAZ7HxmPpFO9dYqS1ZoRZd+usjrJ4M/GyjaBvZs7aqpgzCM
         O2cRCsN26XZpYXMfSi1R87UoW8Xcc4/AnZ2oMW8TujY9Xs1p5axi5cHc6u89nPn1QEXR
         TKn2NBUfQ/hw/yFN3/0BzDdVubsek2tsQv7/3e2G7EnZBNyiQys6r/QPmPCvNP2KtmWp
         9ceE7eEboOWIMO5Nb1hEvdw9XTUFFLahWipwdk2z8c7ZXooCW3um8LIRMRBK/8pvK7S1
         offg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="gdVpW/ON";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s201si985667ios.76.2021.05.05.03.47.33
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 05 May 2021 03:47:34 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="gdVpW/ON";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:59256 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1leF41-00047S-Dt
	for alex.bennee@linaro.org; Wed, 05 May 2021 06:47:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41914)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1leF3o-00042q-Qr
 for qemu-arm@nongnu.org; Wed, 05 May 2021 06:47:20 -0400
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635]:44948)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1leF3l-0004Ne-Rf
 for qemu-arm@nongnu.org; Wed, 05 May 2021 06:47:20 -0400
Received: by mail-ej1-x635.google.com with SMTP id gx5so2072040ejb.11
 for <qemu-arm@nongnu.org>; Wed, 05 May 2021 03:47:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=THr0mjNKzPmZVI6XM/GT1xMzhTITjljxUc0ohXhalw4=;
 b=gdVpW/ONpDoo3/P1kYIiNw6fvdrNOw4FhIC5cfH3eeSxNVJP/OTOLhcVTw7GbUFlmp
 bRcXMDzfdplDmSkXAYD/gBxU9UY5kgPHoJ+3uPmpVlth231FumhxzRI+41LbGw4qtPpv
 71ngI5DPKEQeFKoHUcFrCFmjt3Mow9FfiehTp56EgJH1pQr85N/bCw/11AkX72elcFEf
 7YFOKcpc9CVwN9SmloNF4D9AganJBcsztDb8xtt30F+ds3tzsm9uoNIrMePuFjxsIgeF
 7hetphLSFYiL/iSMEJma8WNIWIlv2gNFwKkJnxDhu9UqteuMFVZl6ajllFkL3QxbClzn
 MVSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=THr0mjNKzPmZVI6XM/GT1xMzhTITjljxUc0ohXhalw4=;
 b=WCF5jcZGvMwYkbLuhJmpoEJZRTCJGHo8uUwH4Pz7C5Gwhooy5Fd2wmQLP1A2RHOOAS
 SwEYMkJ+mqblQvMeiOO2uAKMKwULKm8ULym9PbxdwUgZFayrMcW25ZvJ/kqBDdwNMHu4
 6W9vZlg5ODqoh4kR+euvsDSVpbrf0A/8qYP580Yz3LRH6NVnx95zwNMglTqOlvzgcfhx
 1yP23ln3Pm8E5BTRBWWBXfIPeu6LheAz2e1RgqRAeKVyKQjgU1IqJ8wCkTC8cox1U5UK
 eAT+5CO0RwGL0tVwvCSQkkOCaCMHAS8qd2p0zLNzNhZCYX34aUjZ0CwC+cPAsMRWXY6V
 gK4Q==
X-Gm-Message-State: AOAM5326kFUxExEn4ZMIUniODLdyhpmEPBImdM1PQUXpU2zwuC3t6U7T
 QDirAed3LE/Bh98tnHpMfs55f4g3SDHPE1dAcWO/8Q==
X-Received: by 2002:a17:906:eced:: with SMTP id
 qt13mr26487351ejb.382.1620211636290; 
 Wed, 05 May 2021 03:47:16 -0700 (PDT)
MIME-Version: 1.0
References: <CAA5qdn1D5DMfqdQhG+p26F7cVx=Qy4GstRDqfCrJgbE62yi_Hw@mail.gmail.com>
In-Reply-To: <CAA5qdn1D5DMfqdQhG+p26F7cVx=Qy4GstRDqfCrJgbE62yi_Hw@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 5 May 2021 11:46:09 +0100
Message-ID: <CAFEAcA_rjN_q6pfLa_S9gQROwqhYVjg06DLJFjZXufyR6vWUYA@mail.gmail.com>
Subject: Re: AArch64 code running on QEMU ...
To: ovidiu nastai <ovidiu.s.nastai@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::635;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x635.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: qemu-arm <qemu-arm@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: PdRAzca6RDG3

On Tue, 4 May 2021 at 23:25, ovidiu nastai <ovidiu.s.nastai@gmail.com> wrot=
e:
> Please help me with this, I am new to QEMU: I need to run some AArch64 co=
de, to verify functional correctness, and code generation. The code sources=
 will be mainly high-level syntax (C/C++), then I'll disassemble and inspec=
t.
> Question: can I run AArch64 sources on QEMU, that's it, on a x86-64 host =
machine, or, I need an AArch64 host for QEMU, to start with.

Yes, you can emulate AArch64 guest code on an x86 host.

> I saw this "For example, the aarch64 CPU feature, which, when disabled, e=
nables the optional AArch32 CPU feature, is only supported when using the K=
VM accelerator and when running on a host CPU type that supports the featur=
e. " at "https://qemu-project.gitlab.io/qemu/system/arm/cpu-features.html",=
 and need to understand that, before deciding about the tools I will use.

The feature which is not supported here for TCG is
"create an AArch64 CPU but then run an AArch32 guest kernel on it".
For TCG, if you want to run an AArch32 guest kernel you need to
create an AArch32 CPU.

thanks
-- PMM
