Received: by 2002:a17:906:6698:b0:a28:f940:7a27 with SMTP id z24csp818150ejo;
        Fri, 5 Jan 2024 08:25:27 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEnWSNDysyEVSrmKeqstK3PXW/L+RanCpNFBxjFlDzzE+OUFJjPBz8NBiBm38MwtuVh8l+/
X-Received: by 2002:a05:6871:72c:b0:204:2102:3b39 with SMTP id f44-20020a056871072c00b0020421023b39mr2441057oap.31.1704471926844;
        Fri, 05 Jan 2024 08:25:26 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1704471926; cv=none;
        d=google.com; s=arc-20160816;
        b=JoKlZHNDbxRpLaVRo+pCzTw5Xkv4/8JLkKZDIy8+m8S+cU/9G0BHY+giSuFjnJMxpD
         TkRQbZFOz3jcEU4/j6KDAImV4Q7Q/h+D3SW39fWDvfyundya/QyraQzEHhGHV9ar6UiO
         L4RZyr3dEsex0F6Ai6NV2on3Owa2Lnu1w6gDLATG/3AK8edaHem0mFIiZhSDXl2WxF5I
         rRgBDkfoFiDuOYHopIHJBDdHYcITu/zR/1EM3K6S4tj737TPthj0ZjNI/ysZaz0UxGbk
         l61nux+iKSCQwlPFJBZUtcpnsV74fXjjzMQ1/RZQVdsHeZnXj2NGYQO6+9Vxbs1vffuN
         9VQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=bPxmnGEKVKERyV/TgKUKv8tQHqdf+3rHoSl/s84PVlc=;
        fh=H19HlRgGKAhn6lqWKp5xylUXdiNkDPy0h4o3FOzP1nc=;
        b=REUJq5CMc5wzDkVssW6M4sVLNu9RVe2qYZeQ3L/2gVpQ+PzV17OLW+QtD/JtxihThD
         B8uq+ennlo5z48f/WUCgUOeHKB5AU+h+RS+ZSdEdd8Mdf/U9tVbkSI0L2vdq8SW3yMlQ
         aB/5iDzzECJ33H/VqKDJvmrsRctIkVkDNwJUgFmKG6qa7RA0ixyv78rCdLUBYp7dBGh+
         wKQEaXnJg0ZqF9/jFURUp1UAFO4McywhMoAiq9jbX107rJRz6JZ42IUHoYlxYmEywClG
         Cqq4bpoXoYH6f+znv2WtUiHed9i8W0nWvJOYDuQtLOVFB7+c4YivPUu9yCgFuSsdLfBu
         qG8w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Zl0lYyNt;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h4-20020a05620a400400b0077f4e80e131si2163191qko.692.2024.01.05.08.25.26
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 05 Jan 2024 08:25:26 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Zl0lYyNt;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1rLn05-0003g4-MJ; Fri, 05 Jan 2024 11:24:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rLn04-0003fg-OX
 for qemu-devel@nongnu.org; Fri, 05 Jan 2024 11:24:48 -0500
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rLn03-0001JE-8W
 for qemu-devel@nongnu.org; Fri, 05 Jan 2024 11:24:48 -0500
Received: by mail-ed1-x534.google.com with SMTP id
 4fb4d7f45d1cf-5537dd673e5so1434018a12.0
 for <qemu-devel@nongnu.org>; Fri, 05 Jan 2024 08:24:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1704471885; x=1705076685; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=bPxmnGEKVKERyV/TgKUKv8tQHqdf+3rHoSl/s84PVlc=;
 b=Zl0lYyNt0Fd7+L5ex5vtxsTwsBo6Jxp9r6CVrqH8/EsSL+8BTujooc+bQJ+faulg9+
 D4+2UxCLsB0xC1TvtJoTffFiEwQOV42Vl5zrVbha0he9GNeTOSVhxGwm+wQTE/mYEO2v
 NFyHqPFZ1VC9Xx7E3Ez/1gOsf1KhPCfZ9qyTel8bX9gB5QRu7jYGsjbrktBeAOgcaU39
 PeK1GBQNZLzbcrKhKKHARvc1JNv16ZzhUghtu7CW0uxnXt4Z4mo64czFT5ymxcgZt63D
 YeMiW42sy3jrSeYGCYfNxaS1cEnzYZ1YGwsJ0CECGz7LAUMX+mfymxJceIjh34naNbVY
 aGzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704471885; x=1705076685;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=bPxmnGEKVKERyV/TgKUKv8tQHqdf+3rHoSl/s84PVlc=;
 b=geISH03zPm4wXGIo4yw1BEnENh5VStM+bSSmkq8WhkZqjRBpMEslO4uZedHBCCyBnd
 XIfHQsAdTKfYNAwTUksLxXakCKMr2/5iDcurQXcnu5Jm1Leglg1YP8mF4SIcIMjRC8K5
 q4BUoY5XLOsKCiMmMwvxpr/FqcvF+iwDjcZL79JWEEOrCVmY/7Nq86z3aFOHYpck/wpx
 r+u5MltC08zhN67Vpa6gi789s4ABaS33XAEzGb6yyd5lmA0B3Fo+CvDeQqHD+mUqQBkg
 YZj+RhXdVIx8251ZwsNWuwcDyZ8NEdHFpPpyXSza1E3ooBiA5CTsDjYpqWDrvp55IeRK
 4Nyg==
X-Gm-Message-State: AOJu0YwLL99A2ye0d/eKRAFr6fJf/A5h1hVJCVRLwACH2Fe9KsPTHG8b
 EMKP0GttwW4VrZourzBuHOUMm0gps/f84aRKPxHLLq5MJIlGxw==
X-Received: by 2002:a50:d615:0:b0:557:1132:11da with SMTP id
 x21-20020a50d615000000b00557113211damr1247909edi.80.1704471885520; Fri, 05
 Jan 2024 08:24:45 -0800 (PST)
MIME-Version: 1.0
References: <20231219105510.4907-1-n.ostrenkov@gmail.com>
In-Reply-To: <20231219105510.4907-1-n.ostrenkov@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 5 Jan 2024 16:24:34 +0000
Message-ID: <CAFEAcA__ZXyznnNJ9yhE+jkCD0jfXnjtXqVX778EbKJYj+igtw@mail.gmail.com>
Subject: Re: [PATCH] hw/arm: add cache controller for Freescale i.MX6
To: Nikita Ostrenkov <n.ostrenkov@gmail.com>
Cc: qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>, 
 Jean-Christophe Dubois <jcd@tribudubois.net>, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
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
X-TUID: ovq6jtnPX/pp

On Tue, 19 Dec 2023 at 10:55, Nikita Ostrenkov <n.ostrenkov@gmail.com> wrote:
>
> Signed-off-by: Nikita Ostrenkov <n.ostrenkov@gmail.com>
> ---
>  hw/arm/Kconfig    | 1 +
>  hw/arm/fsl-imx6.c | 3 +++
>  2 files changed, 4 insertions(+)
>



Applied to target-arm.next, thanks.

-- PMM
