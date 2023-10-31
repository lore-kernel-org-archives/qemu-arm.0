Received: by 2002:a17:906:70a:b0:9d0:bf65:29fa with SMTP id y10csp369593ejb;
        Tue, 31 Oct 2023 08:37:23 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEMVe6m68RPmiI35a2BR2+ZmqxpMCGStPoLniPC1aekfXE8+UBjQemsVkHXAoZ8IGYNk3+p
X-Received: by 2002:a05:6808:1889:b0:3a9:bb4f:9efd with SMTP id bi9-20020a056808188900b003a9bb4f9efdmr17163309oib.29.1698766643683;
        Tue, 31 Oct 2023 08:37:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1698766643; cv=none;
        d=google.com; s=arc-20160816;
        b=X80M4p3BK8X1VuKkhad4QSpNBQ4h0MAiXcWZTUDk762CQ+o7ALAWmpn5UJ85laWRel
         KJGVh50NQ6b+j9jxKT8h7NJ1jQlOYuuniQzL+BbdgTEnTA+VFGKVs0mDSXUPXzLf56A4
         jnVWmMP23PETZCDnWQFuM5EO0bSLg77bL0MCiK2JPma0YSEwlGIpBomdsOLXrE3LSFKk
         KmfZ44l2AWDRr6isPMFzQvplzIoAJYUbJMI//6tsIF+snmPLmnfsgC3cnPPOVkhCbl7w
         CLiFm0wkliTTLMOuCUsmCsjWtv0/yY1as3DjJxdINq1cGPExvQdZNy7orLovwKmonzSt
         mQ6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:cc:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=J94TLVmxpl0XnRjKblCQ373JUKXqYHNbMQKHGSlFu3c=;
        fh=giCHlKppfOgmdvLAMagRFWW2RCPUlCMrCS/S3knKnVE=;
        b=AYHTfiWLQ6ahzZvB6F9BQWDabDQGB6udZYeDAr6nLDqTpDYShO4WDqOT54k6iOcc8Q
         IKRcfxKdtrUje/eH7Aiz8JTIzYJ7D0em9zXgLV3nVaJ8zTEMeWmPjczLgaImJmB7N54R
         lAvk2hBunxxoHrXG3FYu636aWAQW3bxEHNLhTUF34TpB67gTsscqjlces+Rwd0wzrDM2
         C6aqDXfLQKtrJUmBys/JvcXKKh6ntVV6Ko4T/OVScx0fA/lHNQQmBqN/IhhgcqNSoqLZ
         ynDOw0TNfXo8WSSdQThPMxOS0TR09pHa5MRgZWi+TPpbK7Lvw4jlU9fdFuCmUkJ1YUVI
         YIsg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=TbovjNLe;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v4-20020ad448c4000000b00671c0c3730esi1258513qvx.423.2023.10.31.08.37.23
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 31 Oct 2023 08:37:23 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=TbovjNLe;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qxqno-0000sD-Dh; Tue, 31 Oct 2023 11:37:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1qxqnl-0000n6-Al
 for qemu-arm@nongnu.org; Tue, 31 Oct 2023 11:37:09 -0400
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1qxqnj-0003AN-Q0
 for qemu-arm@nongnu.org; Tue, 31 Oct 2023 11:37:09 -0400
Received: by mail-ej1-x631.google.com with SMTP id
 a640c23a62f3a-9a58dbd5daeso893224466b.2
 for <qemu-arm@nongnu.org>; Tue, 31 Oct 2023 08:37:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1698766626; x=1699371426; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=J94TLVmxpl0XnRjKblCQ373JUKXqYHNbMQKHGSlFu3c=;
 b=TbovjNLebta0uJG+EHLa1Ndze5oDKC6v64hoWVbhJEVhpF9SUE5DtSckjNDAQv2Hck
 Veu5F1KS4ipjETO7f5vMt0JX5swkh8jztfKChYWREvSGIyruDoKfmV725QC2xs+pF2P+
 5ASJe5Rd+FHfUCWdFesLCUmS0Hnf3rBDzSNPkSG5vmHykZxKw3K6GYRW1deiaTIrqA0M
 CvUz0g+XgrkN+Nj/yAs9Wq0njtD1E2GyrMMvP+/AmriNXukGhQPWjM8x18moesaw785a
 /85imbKF01QqFuNg6TeNKcvIC235SYrAQvG+ye5tmw8Nzdm/KzL7yPJXAld7SRwgYwh9
 JFnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698766626; x=1699371426;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=J94TLVmxpl0XnRjKblCQ373JUKXqYHNbMQKHGSlFu3c=;
 b=t8KhcvsPxSZWvyT/7KlN2M6wbTxzub/hoBkIUJoPEXqtyBNgQ7ZqGoRKBIIbDMuw7+
 sZfB0c3z30G1tjFuO+j3QDyEDu8LIuZiElj1vD3w+owXTBLtJ3Vmg/spIrDZCbZtJs79
 8jDTOLEEJm26TLM1ieJ4DCskTmiWXdQ9h84KOfDdT6iNb86QBjVhwXQhsZtw8P7LBztH
 CTv/ldUYts1SZaqTU9WYUJ8sCql/p7GIoJRb8Z8nKEfTjQrwxpRwpbTP0WEjmyn7oOHT
 keHXuGskEUiRcz//0g3iHYEKos+aAKsjBGotfcZITTuM7GIWfNbaciFQBtPQKDznzz4O
 yjOw==
X-Gm-Message-State: AOJu0YyosOCKqyxf726BUzhdOqOu1g+Iv5kiyMu6BlORXxGxJNJSaL5D
 6RDY70ND3poI4fiGOJjReX4ovFSC1vXhS5P8CKd2FQ==
X-Received: by 2002:a17:907:318a:b0:9be:21dc:8a9a with SMTP id
 xe10-20020a170907318a00b009be21dc8a9amr10630988ejb.39.1698766625947; Tue, 31
 Oct 2023 08:37:05 -0700 (PDT)
MIME-Version: 1.0
References: <20231030114802.3671871-1-peter.maydell@linaro.org>
 <20231030114802.3671871-6-peter.maydell@linaro.org>
 <9ea5c9b8-d740-4cec-9896-568babeca9aa@ilande.co.uk>
 <CAFEAcA9dJnp0CVOzVWV+Q-U4ji9c8=14ggztKGktCSsDDp_F0g@mail.gmail.com>
 <CAFEAcA_4wqP7G+gXnunJx85OTvUr-3kx6HGABGb6Kt3y=b_Nvw@mail.gmail.com>
 <59d6df3c-95ee-4ac4-9ac4-3f4ed49708fa@linaro.org>
In-Reply-To: <59d6df3c-95ee-4ac4-9ac4-3f4ed49708fa@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 31 Oct 2023 15:36:54 +0000
Message-ID: <CAFEAcA9tipCFVfnR0Z9P8rvmtFdvzsn7dkz3FUAkTEuH+35d2g@mail.gmail.com>
Subject: Re: [PATCH v2 5/6] hw/input/stellaris_input: Convert to qdev
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-arm@nongnu.org, 
 qemu-devel@nongnu.org, Kevin Wolf <kwolf@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::631;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x631.google.com
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
X-TUID: 2Km0k/yZEWVF

On Tue, 31 Oct 2023 at 14:55, Philippe Mathieu-Daud=C3=A9 <philmd@linaro.or=
g> wrote:
>
> On 31/10/23 15:05, Peter Maydell wrote:
> > On Tue, 31 Oct 2023 at 13:55, Peter Maydell <peter.maydell@linaro.org> =
wrote:
> >>
> >> On Mon, 30 Oct 2023 at 20:38, Mark Cave-Ayland
> >> <mark.cave-ayland@ilande.co.uk> wrote:
> >>>
> >>> On 30/10/2023 11:48, Peter Maydell wrote:
> >>> Is it worth converting this to use DEFINE_TYPES() during the conversi=
on? I know Phil
> >>> has considered some automation to remove the type_init() boilerplate =
for the majority
> >>> of cases.
> >>
> >> I could, I guess. It seems a bit awkward that DEFINE_TYPES()
> >> wants you to pass it an array even when you only have one type,
> >> though, which is going to be a very common use case.
>
> For single type, there is no point beside enforcing a QOM style.
>
> I'll update docs/devel/qom.rst...

I do like that the macro means you're not writing an actual
function for the registration.

We could I guess have a DEFINE_TYPE() macro that was similar
to DEFINE_TYPES but emitted a function that called
type_register_static() instead of type_register_static_array().
Is that worth having? I'm not sure.

thanks
-- PMM
