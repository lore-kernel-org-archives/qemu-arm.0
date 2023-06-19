Received: by 2002:a17:906:494e:b0:982:8c08:340e with SMTP id f14csp2812428ejt;
        Mon, 19 Jun 2023 06:31:57 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ6rmdsNUt83PH/HGM8Klr/psQjoHVwgx9byTfiPAwCLrOc2FY0D09DAFQv0JQwqprSPSfOT
X-Received: by 2002:a05:620a:f89:b0:75e:bdee:367e with SMTP id b9-20020a05620a0f8900b0075ebdee367emr6849995qkn.47.1687181516951;
        Mon, 19 Jun 2023 06:31:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1687181516; cv=none;
        d=google.com; s=arc-20160816;
        b=UJPKyEbm8ckiNYVJA0+YLYyOjfvBEl1bFMzOYBqLErq1bHdN6+imS2ian/XK7EtSci
         FwKWf2iy5vTdlCjkZv6dhOo4t/WphAR0u3Xtx22fPYjBNbJR77nrEAGdVbwburD3eGWJ
         axgnPbxhwAatvnF8hmyoP1+PJnSoWAbR+YbexoxZ0R50/M/aFE17OCg/Etke6P70UHz0
         sbb3rVQSHTozZI7W8FiANpktAbnMqVVaM1Wc+sZXqgmV151CFJwBCccBulM+gF5ApX83
         7K/DiLrhjgdyx6CD2TBkNC4wcCasEnXLOxbler+uhf1HDYq067dM08FhfQSzkycWXbxe
         T31g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:cc:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=Gs3S7YVy4Ut559ccseAcaMLNlFLchAIeC7draST7rDY=;
        b=cQT6H8CEFuguFTmeABJRx5v1SMcTGbyL2M5RrYBUOfCwGQdMQ3iRp41++xK5GcHqE+
         ulIxyEV2FVBX/vL64VMnrjQaQEA67jLDMKnaFHVuEX4ynrrJfDl1XW6nrLeu3qDIlc2F
         KVC9etXyU/AMJcCLYfqhXNTDacbvHxxszPvHopo9uzd88voh4yl4etQ2ScfuZPH6jbbM
         LGfMLL7qdtaPz+/VFiv2OgRXNHlsT7Z5G/1gNaYD5qEKNly6UZI6x+43MPLZmLKioWn8
         Se8kK+g0+0Bo9ije/1pQg/8OeF31Efd3GYx4e2FOFgyKx7xh0bREjNWb7ST9SAic/8l+
         78FA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=v2iRqR0R;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f1-20020a05620a20c100b00757aec57d12si13550902qka.181.2023.06.19.06.31.56
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 19 Jun 2023 06:31:56 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=v2iRqR0R;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qBEz3-0004ZI-W2; Mon, 19 Jun 2023 09:31:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1qBEyy-0004WT-LK
 for qemu-arm@nongnu.org; Mon, 19 Jun 2023 09:31:49 -0400
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1qBEyw-0001rx-Mv
 for qemu-arm@nongnu.org; Mon, 19 Jun 2023 09:31:48 -0400
Received: by mail-ed1-x52d.google.com with SMTP id
 4fb4d7f45d1cf-51a3e7a9127so5942725a12.1
 for <qemu-arm@nongnu.org>; Mon, 19 Jun 2023 06:31:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1687181505; x=1689773505;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Gs3S7YVy4Ut559ccseAcaMLNlFLchAIeC7draST7rDY=;
 b=v2iRqR0RRsXPkBQyFOUO/TcxGQPTt4C/WH2PMluUObdSWYn2pg6tBVoi2+CxnfAA95
 kecKvQY6fb9oE7L8o6CpzLDty/Roy5dMf/7Wc3gCrbcAtFyovRnUXq2FFN3+PDlGXENO
 XUqLbCt4q5dw/3IptT4KyLZ7Emrwp2sakajYOutw+mpb4tCvuPx0gpF7qlP0/WsawDxp
 Y0Mm3Ykf2lrEJZ3pMjXo5W/eMqacbPIiGc4FEdHjL40No7rMYDkfgAd3r6RHWSKxMc85
 J+btPEVnyGzJkQYzMpg86gqbetOCMWg8cJ/L5xUmkaR9FJWyJcY/+/H1bIwihcmvbH/s
 UKKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687181505; x=1689773505;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Gs3S7YVy4Ut559ccseAcaMLNlFLchAIeC7draST7rDY=;
 b=OtUqGYil4H7OT2qWsWFmSpq1vyyeWXbgMSfl+er0w2nVbZkBmnjJ/AXlee8rVMROJx
 C5yEc/ykzhJZLe0fPpoXkLvHtxrMuRiCHMLjRqiL1nWHcC0Pn3g5PGGO5wzJKlx40Wnn
 11lmeONyb5005Ax29Z0QSkoJCKnKigTp9DnpKySQeEtABZPzNxptilpZQC+Ux9rFbsmS
 enAj0Sfn8QuDGUGh6DxrIZ9hAu+aRW6eRl4LY7Q8gv0TGh2OpfGxZmWwLbnnZYucEfLR
 1UQs71SDAZxaGMgn2k0/WSrcNxZwhdcp6ipuks0iFhZval/AVnvmgxo6fTIdwX2TJidL
 U+/g==
X-Gm-Message-State: AC+VfDyoh0D8SOUop9AwasizKEAW/X6y7ZStZvGMIHWdUetkDgNynybD
 DBXFrX0CR9S/LbhG45kj5qXt4a8DGfGE8XvGHNbZvubmAlc0Lvnp
X-Received: by 2002:a05:6402:350b:b0:514:9311:e83a with SMTP id
 b11-20020a056402350b00b005149311e83amr13905254edd.8.1687181505365; Mon, 19
 Jun 2023 06:31:45 -0700 (PDT)
MIME-Version: 1.0
References: <20230612223456.33824-1-philmd@linaro.org>
In-Reply-To: <20230612223456.33824-1-philmd@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 19 Jun 2023 14:31:34 +0100
Message-ID: <CAFEAcA8VNj31LTQQgqbYWFPVfTRFYTMSraVLfNRd_vGa-BvUzg@mail.gmail.com>
Subject: Re: [PATCH v3 0/4] hw/arm/raspi: Use named constants in BCM props
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, Sergey Kambalin <sergey.kambalin@auriga.com>,
 qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::52d;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: ZZc4kexT/t1A

On Mon, 12 Jun 2023 at 23:34, Philippe Mathieu-Daud=C3=A9 <philmd@linaro.or=
g> wrote:
>
> v2: https://lore.kernel.org/qemu-devel/20230612115950.5002-1-sergey.kamba=
lin@auriga.com/
>
> This is a respin of Sergey's patch but
> - split in multiple patches
> - removing redundant comments

Applied to target-arm.next (with the comment I mentioned
added to patch 4), thanks.

-- PMM
