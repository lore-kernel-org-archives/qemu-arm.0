Received: by 2002:a17:906:5a52:b0:9d0:bf65:29fa with SMTP id my18csp1952103ejc;
        Tue, 14 Nov 2023 02:58:43 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGI5dHz6vBR6G4yDP/MvuBlfaU0jUP7UMCIqUJwENM89u5sSUiqQwx+DYkfWDh8NTsjicQt
X-Received: by 2002:a0c:fc4d:0:b0:66d:6439:4383 with SMTP id w13-20020a0cfc4d000000b0066d64394383mr2044164qvp.58.1699959522764;
        Tue, 14 Nov 2023 02:58:42 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1699959522; cv=none;
        d=google.com; s=arc-20160816;
        b=Q7RIbcBsr4ijnSE92Pix7UBj3n8Q/IUFwBCQ8r5F9/qGruBMIypPizxg05NcfphGAH
         CP1ZL26klxu1aGQJUY5SB2KHnVrxbzqqLE6B9TQ3geLOqhmzwt2JvfDVKSl6YBh/MCA6
         HPeP2e8DNQPJQpsS9UwmZCG4oUbc/AYlePevCxsVq4Itu7IdEDTEDll8SldQQLXmcZ6c
         ot82of77RUR5xoR2spBycjUAIl2OAapvaKE4NmlvBdUUTDx5ck2RJpAX0VlQsVT9lUVx
         nICm1SzY+QERQCrFgsAKf4ukR14Yd/Yp6t47cdr9V1gQQC3Zc1n6jZiWnjHsYKwtzLLl
         Z7aw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:cc:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=sZiNat6q6RWy3UbweNCQFauNKXiIFAfNH6RZUmCVylY=;
        fh=ZJX8q1NrDt/0pzTKhUhwmAfIl1DQrhGtzlBYSVMrS6c=;
        b=b4uezYoxk6iac6egEEb7MZtFJiIVN+nSZNyN8U2EerhSxXq0ZR7D6a9stN66F6VHmR
         UbqzxVmJH1hewhwMhTHsfHE6qpnpkuvlsUOUD0uKB0I1JIm/v3jh3+dnv5uf0on38FAe
         4WCenW+eNQb55xmPSrSVsbPpC0vMXWimxngCi1NJJAtnZxaMoHNJwxklLz2mFi04QBWt
         oSKv41MyapsS19ehjM8YrjjMwinQyZhdRzJ/it7BeXAx/bJ2oGuWHVyQmJMy/XWPYrpD
         wd4fe+gXbMctq5gmjK4kndMWPu/+qTmPHsnzNGALT2UEAmFtwPfCHheVQKXmHUVTyzu5
         mxPA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=X8UYiB8V;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s16-20020ad44b30000000b00656304f4f1esi6476503qvw.421.2023.11.14.02.58.42
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 14 Nov 2023 02:58:42 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=X8UYiB8V;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1r2r7a-0005vU-Dk; Tue, 14 Nov 2023 05:58:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1r2r7Z-0005u0-9O
 for qemu-devel@nongnu.org; Tue, 14 Nov 2023 05:58:17 -0500
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1r2r7X-0005BJ-L9
 for qemu-devel@nongnu.org; Tue, 14 Nov 2023 05:58:17 -0500
Received: by mail-ed1-x534.google.com with SMTP id
 4fb4d7f45d1cf-5441ba3e53cso8161480a12.1
 for <qemu-devel@nongnu.org>; Tue, 14 Nov 2023 02:58:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1699959493; x=1700564293; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=sZiNat6q6RWy3UbweNCQFauNKXiIFAfNH6RZUmCVylY=;
 b=X8UYiB8Vs4GH0wgGI5DftOL9EElhSMMPGkA6ZwdINEg0Pe067IUxBujMMpm8xAIaxd
 /URWVrr2xq63RzgCW4RR/XNzR3mHQdkflsMYtOawBFJbrEH8S2g3fQ+bdTfuwMD8DRzh
 FoRDDtHW2LolOeLlC1oBmrAPMMSD3veY2OO3QybKRazesksmt1tTJEjUQrEvInvc9CCk
 jqHblsEAgR8GipeKrO3yfqXAUGB02J2K3VOcM836oVrgZD7IRcueLkedzJ+uf5YhS8HH
 1fdvdswcIIQtQc4rqtCfAUUMYJ1LN4PG3UrZW+g1z4lKIzzAFOqFv/4dPUJe25q8Xarg
 OgsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699959493; x=1700564293;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=sZiNat6q6RWy3UbweNCQFauNKXiIFAfNH6RZUmCVylY=;
 b=UTCaX7ATHb/WVMKlDMJU+1zXy5SznnZjQZSHsfh8GJfQTNexCbylHm0VZQiYk9EPuj
 DiFSPNRleSIm8DPaQvit5Ws3/BJ5kwn5cJb8kWQOXhPmnfWytDQyMH9cC9nS1kv9/vr6
 oUA6mlPT4WVV2u9PkKxgj5XgLcDvpH6XuhMgE8Y9rEOLr/lhXi+neZ38Yy0aRonernOc
 jqL7vKzUxxI/Z4OWUnlH+b/cGYwTa/nejS876KHnZ6beZr1g7BP8t5bcAyhzABkz8JD2
 jT6ZPIwksRPLkmE5imsOXOKz4/v5nuo99r3L0wIY4UCt3mJIPJqVbyQd/6quZ9LZZeTc
 FE0A==
X-Gm-Message-State: AOJu0YzZNORwYmmvP0WIK+fOgfVFFEE+snCylIgkUwp9aZ2X9RLd7obA
 xBnpTcaJKsccynve7/yfuaLZmfsyO8oky2rIO3N7cw==
X-Received: by 2002:aa7:d682:0:b0:544:5b1d:ff87 with SMTP id
 d2-20020aa7d682000000b005445b1dff87mr6072387edr.38.1699959493547; Tue, 14 Nov
 2023 02:58:13 -0800 (PST)
MIME-Version: 1.0
References: <20231027175532.3601297-1-nabihestefan@google.com>
 <20231027175532.3601297-4-nabihestefan@google.com>
 <KL1PR03MB7744A70A81045E5DC49C8191DBB2A@KL1PR03MB7744.apcprd03.prod.outlook.com>
In-Reply-To: <KL1PR03MB7744A70A81045E5DC49C8191DBB2A@KL1PR03MB7744.apcprd03.prod.outlook.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 14 Nov 2023 10:58:02 +0000
Message-ID: <CAFEAcA_9HT=tccyTu9RffMxq7Cm5GEanM+OcSxfkpbnJW2m6hQ@mail.gmail.com>
Subject: Re: [PATCH v5 03/11] hw/misc: Add qtest for NPCM7xx PCI Mailbox
To: "KFTING@nuvoton.com" <KFTING@nuvoton.com>
Cc: Nabih Estefan <nabihestefan@google.com>,
 "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>, 
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "wuhaotsh@google.com" <wuhaotsh@google.com>, 
 "jasonwang@redhat.com" <jasonwang@redhat.com>,
 "Avi.Fishman@nuvoton.com" <Avi.Fishman@nuvoton.com>, 
 "KWLIU@nuvoton.com" <KWLIU@nuvoton.com>,
 "tomer.maimon@nuvoton.com" <tomer.maimon@nuvoton.com>, 
 "Hila.Miranda-Kuzi@nuvoton.com" <Hila.Miranda-Kuzi@nuvoton.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::534;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x534.google.com
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
X-TUID: e7E1dNGCL/PU

On Tue, 14 Nov 2023 at 01:24, KFTING@nuvoton.com <KFTING@nuvoton.com> wrote=
:
>
>
>
> -----Original Message-----
> From: Nabih Estefan <nabihestefan@google.com>
> Sent: Saturday, October 28, 2023 1:55 AM
> To: peter.maydell@linaro.org
> Cc: qemu-arm@nongnu.org; qemu-devel@nongnu.org; CS20 KFTing <KFTING@nuvot=
on.com>; wuhaotsh@google.com; jasonwang@redhat.com; IS20 Avi Fishman <Avi.F=
ishman@nuvoton.com>; nabihestefan@google.com; CS20 KWLiu <KWLIU@nuvoton.com=
>; IS20 Tomer Maimon <tomer.maimon@nuvoton.com>; IN20 Hila Miranda-Kuzi <Hi=
la.Miranda-Kuzi@nuvoton.com>
> Subject: [PATCH v5 03/11] hw/misc: Add qtest for NPCM7xx PCI Mailbox
>
> CAUTION - External Email: Do not click links or open attachments unless y=
ou acknowledge the sender and content.
>
>
> From: Hao Wu <wuhaotsh@google.com>
>
> This patches adds a qtest for NPCM7XX PCI Mailbox module.
> It sends read and write requests to the module, and verifies that the mod=
ule contains the correct data after the requests.
>
> Change-Id: Id7a4b3cbea564383b94d507552dfd16f6b5127d1
> Signed-off-by: Hao Wu <wuhaotsh@google.com>
> Signed-off-by: Nabih Estefan <nabihestefan@google.com>
> ---


> Signed-off-by: Tyrone Ting <kfting@nuvoton.com>

Hi; can you clarify what you mean with this Signed-off-by: tag?
Generally we use those where either you're the author of the
code or else when you're taking somebody else's patch and
including it in work you are sending to the list, and it
doesn't seem like either of those are the case here.

thanks
-- PMM
