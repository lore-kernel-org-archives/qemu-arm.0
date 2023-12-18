Received: by 2002:a17:906:d96:b0:a23:4dac:818 with SMTP id m22csp926997eji;
        Mon, 18 Dec 2023 08:49:34 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGE4LoIe89ZfQecgl2THJ80YmUrRIpWZqAqI4Rr6RCkMF5ROu6E8VOvowDD59uREERhVlbx
X-Received: by 2002:a05:6358:718c:b0:172:de50:3763 with SMTP id t12-20020a056358718c00b00172de503763mr587756rwt.24.1702918173705;
        Mon, 18 Dec 2023 08:49:33 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1702918173; cv=none;
        d=google.com; s=arc-20160816;
        b=PLVhYXJy8rCoB+vcA/mKNPLPcRI1wGGjA4yG+M2lDxFqe7fRAejbhZrb2zhUDbEVil
         9OjxnbN0KMVJbkkQnJ8wPG3exhwZrSzdWB+/HVjemaHdzQWj22siQvA0HPRzDcx25p34
         H0J2eTxGXzNjq8Uv7PT6I8hAmOqttx0pSui2TAm6gVWdO4Z9+Z1PNRJV1rw2R5NfVszy
         R24ZRgzQODmceCERJy9BNWJ21xAm9+BCunfhiK/5cZHY8GKenhullO/1JfJOA96rFK+J
         jq6+jHwmzotxAIlfB/nc1gWxNxdOyxjltG5kjxBfovdfhylL6V4l800CbHfdSek6yulQ
         bqVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=pb/IYZRuRvxWme5LBdMifCbl4VpN4Dh2bV6K0o8fkrk=;
        fh=gdBed72JnSifzQdV0PLkUCrNnp2PjbNCgzXbyzmTG1w=;
        b=KgGH+Nl+w1ChwCEpVUXIGMa/UWWMOqaWF0B7YHzvM1XJ0g+ROWXpfXJN7u5S9HY0M3
         6jOjkBLe62sTCVQVd4Om8nXLaZpBRRpL9rKN4gTlRLsB0PEDW5MwCqsy+/FaYEAVIsoe
         txB1bNpmqIL8HVseTbVGLddQ+Rt/FtwS5R5WDDa82gOkqAmt/zuyaG+yoQfEcnbnSegC
         okoLUvlcAYRBgnUfHQsY0cJyqBkWw/e+pJ5og38bcoEFeUG48kfKlC7MQl3EHqH0TwUA
         myTn7SjMp1a/enp+e64RJy9RbKM0mYp8Tw1WgyBycFcKHNaSY9oKpK+Ormp6gi8RnAC4
         GqBQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=h9czcw7c;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f4-20020a0ccc84000000b0067f3a788cd4si3280296qvl.349.2023.12.18.08.49.33
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 18 Dec 2023 08:49:33 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=h9czcw7c;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rFGnn-0000wg-4W; Mon, 18 Dec 2023 11:49:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rFGnj-0000ux-JO
 for qemu-arm@nongnu.org; Mon, 18 Dec 2023 11:49:08 -0500
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rFGnh-0002yu-Ma
 for qemu-arm@nongnu.org; Mon, 18 Dec 2023 11:49:07 -0500
Received: by mail-ed1-x52d.google.com with SMTP id
 4fb4d7f45d1cf-54cd2281ccbso3994586a12.2
 for <qemu-arm@nongnu.org>; Mon, 18 Dec 2023 08:49:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1702918144; x=1703522944; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=pb/IYZRuRvxWme5LBdMifCbl4VpN4Dh2bV6K0o8fkrk=;
 b=h9czcw7cWn8Ka5kS8TAnOV5BCJXSxzxed/fLh2fCQMwi/pZZxSpe1DXeLspw9Uld4H
 jl60gIq09jZFV2TxLiRPB7yEwcNHLEwxhj3XHH0e6To7XAokticrYefC0cHcAuUFwTDq
 NBGg2YcvwoYsdY2xfur58Dn/a8CWQq5usUVElgdzXLoB/C0Ei7lwMFvVEt8RMWDd31WX
 dbEam+ybwi6eEVLXMKbvFDQS6uqb6wrcMuEKaNDo4TfD+u4JOnX8q4OwWX7HRg1yuA5b
 /yygogPXK14pOwGMEyFwAD/otPsd2EHhuiH+bVvWPxHCvueXIs0nmhehdWq6A8jYF4Fb
 SV9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702918144; x=1703522944;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=pb/IYZRuRvxWme5LBdMifCbl4VpN4Dh2bV6K0o8fkrk=;
 b=p6RWn+XGFC7DcmMYnmUhHqG5lqngfP1s4Dz44Pbs2ygNbMHU8z0vgcnUpzI8vPEnIa
 ICB9Dvq94c1zh3YOYT//460Fl28kcZ/xY83F9mvQ74+KncdQen7Yxi9VoWaodwG1CtK8
 2TB4E2S/YnAwJre9DxqHk7FEZMNOrfFVnGSvq90H/1bpcPPGOgCxL+EVCcrkTa3dYbIi
 BkokIqj3HEI7C0PLmzQa7w9H7kYWTTPY3PtEuNu6ZCE1SJG8gFJC2vP73Xc7Grt2BFNS
 GUGqMKkShz88YzwZOVufYhe2MzKidv9fn91CL44aSu/GPxbWs12qdbT75L0RLcWKZQiw
 jA1g==
X-Gm-Message-State: AOJu0Yz3lSmR7frUH7ayGLdneev+83NJD1utnTAAA5SrkI/k3jHa/KpG
 8X7NIo149Ds6/j+oheIIkQEyo/7K13Ta0OQIAH8uKg==
X-Received: by 2002:a50:d51c:0:b0:553:4ec4:6980 with SMTP id
 u28-20020a50d51c000000b005534ec46980mr1036199edi.80.1702918143848; Mon, 18
 Dec 2023 08:49:03 -0800 (PST)
MIME-Version: 1.0
References: <20231204002619.1367044-1-sergey.kambalin@auriga.com>
 <20231204002619.1367044-12-sergey.kambalin@auriga.com>
In-Reply-To: <20231204002619.1367044-12-sergey.kambalin@auriga.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 18 Dec 2023 16:48:52 +0000
Message-ID: <CAFEAcA9V+U_hQ+U_8MqQfG0jEeupBmMFvEAOBygX5haGJ+tH5Q@mail.gmail.com>
Subject: Re: [PATCH v3 11/45] Introduce Raspberry PI 4 machine
To: Sergey Kambalin <serg.oker@gmail.com>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, 
 Sergey Kambalin <sergey.kambalin@auriga.com>
Content-Type: text/plain; charset="UTF-8"
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
X-TUID: AqWqe63Zfiye

On Mon, 4 Dec 2023 at 00:27, Sergey Kambalin <serg.oker@gmail.com> wrote:
>
> Signed-off-by: Sergey Kambalin <sergey.kambalin@auriga.com>
> ---

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
