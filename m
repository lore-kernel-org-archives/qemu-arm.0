Received: by 2002:a17:906:535b:b0:a20:43fc:1f40 with SMTP id j27csp293835ejo;
        Mon, 11 Dec 2023 07:48:55 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHRASd5KXqKLVS3chattwaei44TvkfOWNRgW2cmIs5wnBRHNsxRKHqzD0i9GK+fsV/qukQH
X-Received: by 2002:a05:6214:d0c:b0:67a:bc33:4c2f with SMTP id 12-20020a0562140d0c00b0067abc334c2fmr6715183qvh.61.1702309735068;
        Mon, 11 Dec 2023 07:48:55 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1702309735; cv=none;
        d=google.com; s=arc-20160816;
        b=0oLCwLdSAFjjidqy1RopHs8dcHmIumYeyZCqiskbWEbHH1deoZGRvxTtoj8/p0kH0w
         EtKei03bTx5S8H3nJ0SNGGYyVwsTeCSnQqAIJCoUbYitlzDJifvPiMeiztB+5s+bvPEx
         g34fl2G0X4tNS3c02KpyZZHxturGu8Oi2hdF+Rw8KPUCdX3ypocasHW5vpk4G1Y+RYKd
         GPF0g9ka9RFAWxszsr7UMRV+M4x/LkZmmukxIOottyrXyq+Ls2txf0kLzCgJnr8og1A7
         N0A3qy/hHeVi2Fuu3z6EkFJoRvambwv/sNxM4987OxgWnV+oyV2hcinjiwShoZdbnM9I
         o+pA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:cc:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=Eom5AItaUxFhc9i8+0u7HL8DfpB+lgfj8kGQWf44GpQ=;
        fh=ZunbYo7vBCjqSWc9622LTLPHQcfFJMelhG0lIzAt0Bo=;
        b=osEPtg0iFxWsmhSkGPrK86auYjLsFogpPDEFTSTsZ3nMT9lQZD4IE+w/omtgkZRKSe
         g1E3KnYylvAgWBJSTgGnQJZRLgdPBfmrxdhuSNXlSa3+FOxtREbzOuvdNErwCJjdCJjj
         ofq+o2O914XbboD/E4QmbQq5jux1QeqTAgMD3DZOLMrLB3gYM3psVFFOx6J4uuOcgRJV
         yebH4eYE8vb6Am7HSdD53h5sAmAcSpbsWsMyJOeT39B4g4e2PzR3QbY20inrqwvlo5w7
         a4CGSSYCTjG3Y0jSPpF4IcmtzuZjIpFRPhx2fOuPFypENMWO4PqnIE3OvqP7ohJDjSF7
         mIHQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=xNPs2zGH;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id dk13-20020a056214092d00b0067a3ba3085dsi8204255qvb.515.2023.12.11.07.48.54
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 11 Dec 2023 07:48:55 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=xNPs2zGH;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rCiW0-0000v8-1E; Mon, 11 Dec 2023 10:48:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rCiVx-0000tn-Sl
 for qemu-arm@nongnu.org; Mon, 11 Dec 2023 10:48:13 -0500
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rCiVw-0000o2-0i
 for qemu-arm@nongnu.org; Mon, 11 Dec 2023 10:48:13 -0500
Received: by mail-ed1-x531.google.com with SMTP id
 4fb4d7f45d1cf-54dcfca54e0so5887831a12.1
 for <qemu-arm@nongnu.org>; Mon, 11 Dec 2023 07:48:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1702309690; x=1702914490; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Eom5AItaUxFhc9i8+0u7HL8DfpB+lgfj8kGQWf44GpQ=;
 b=xNPs2zGHwMG8oTpmTa/WnUe+6UBoKbEyVpMjC6XPTvxzObvQCEW1LcVdlzG2oAr21B
 oXYHXc9cNYabubWJ+bYxFKlNLYWf0z+XuUnNKqzb9k8lG7DlYc/QKdh18A7Z7FONnm1F
 /3PjnA7kwA6DQH7m9TmEqRek9h+B8i9CWvkTmo0JgXnk3JHM0oTWqPIxn1z8QLAIgpQ+
 3vLZ0pNRO5tpX3uwYzH58D4QABHXzmPTnN6NzUxy0lAfqRX8WqXjPdq1tpzaoo3Ovew6
 23VT1AgNEo0a1RdIMgbrD7hfnowHamd1sphp3usFXwy2SMWC/nGys5doDWME9PhF7Tsz
 vvpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702309690; x=1702914490;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Eom5AItaUxFhc9i8+0u7HL8DfpB+lgfj8kGQWf44GpQ=;
 b=AfmnBj5tO+1NgAdcp9RCE+cLcNixg6XD+xpjukMQ6BUtvtOBJYLrcPg9UCBSGBGrIO
 6aj5gDU5W54RMhxJcvfw4q/QX6arsNZPJ8Kaosrsg3Gr7xQNlZVoKKMsxmMxCFfti2gB
 j3Ts1nkunn5BuGB519uLMOngMEErLAEOfhCI5THroTw/FiiXcPQww/GxmNNJIKkryCDh
 sjLl4UZs9myaWmZJHlxuarlwnBxi4zCj2n3GNUYNz5e795SYszAUiLy2wHD5QutgPfTN
 bzQSyfQ9D0yk08kA0kSNmXmlU8Nt7WjADG7p+fmDHf9tmgZnfrjVri7/u7rhix6f/iyT
 VIBg==
X-Gm-Message-State: AOJu0YxbQ0SZumZKoSZpwwqPHnlhqNBcM8dzuyUv8yAohTXZmqxi2ygm
 chA/c8McNL2A6e94tIgnsvYvoWBOcUtZC4dRssxq3w==
X-Received: by 2002:a50:9558:0:b0:54c:97c6:fc74 with SMTP id
 v24-20020a509558000000b0054c97c6fc74mr2789415eda.34.1702309690367; Mon, 11
 Dec 2023 07:48:10 -0800 (PST)
MIME-Version: 1.0
References: <20231130142519.28417-1-philmd@linaro.org>
In-Reply-To: <20231130142519.28417-1-philmd@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 11 Dec 2023 15:47:59 +0000
Message-ID: <CAFEAcA9rXVtH6K6-iJQkK1MdF4mG3EjxrDwOXfn9UUf0sKsPnQ@mail.gmail.com>
Subject: Re: [PATCH-for-9.0 0/3] target/arm/tcg: Few non-TCG cleanups
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::531;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x531.google.com
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
X-TUID: /HRddCkSjApo

On Thu, 30 Nov 2023 at 14:25, Philippe Mathieu-Daud=C3=A9 <philmd@linaro.or=
g> wrote:
>
> Few non-TCG cleanups extracted from a bigger rework.
>
> Philippe Mathieu-Daud=C3=A9 (3):
>   target/arm: Restrict TCG specific helpers
>   target/arm: Restrict DC CVAP & DC CVADP instructions to TCG accel
>   target/arm/tcg: Including missing 'exec/exec-all.h' header



Applied to target-arm.next for 9.0, thanks.

-- PMM
