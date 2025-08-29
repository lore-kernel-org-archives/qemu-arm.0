Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C8EFCA0EFF
	for <qemu-arm@archiver.kernel.org>; Sat, 30 Aug 2025 15:10:38 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1usN9W-0004Ok-P0; Sat, 30 Aug 2025 11:06:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1uruB5-0003bn-0I
 for qemu-arm@nongnu.org; Fri, 29 Aug 2025 04:09:44 -0400
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1uruB1-0001zs-FP
 for qemu-arm@nongnu.org; Fri, 29 Aug 2025 04:09:42 -0400
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-45b7d497ab9so10588055e9.0
 for <qemu-arm@nongnu.org>; Fri, 29 Aug 2025 01:09:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1756454976; x=1757059776; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:user-agent
 :references:in-reply-to:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=uYEqRHgbV4dj/zidZbTo09wctcjJATrJIMMftyItbto=;
 b=SyaQmP0ve9WxSUuhkLG70fPWNo9iIgNYQGW0Zopgjl3pAK1efj+CQPmuvsxXCmzIvb
 7ECOI/3yUoKjTTszQXtg9sQQww9noGYWBpmTxP/2hjMp61OSjE8gZymvDdMMWDLuy2kZ
 yU+r++ndvCYxGirMAbi1ZPAnWXi2aJ1eeadN6Yc+2TTL2N9d+saJ7V9uYknXNXwdRL3w
 7vCUoC1iiPVZRU9Za1+V5ksaUNY7Gx1I1PERU/0tj2ik8f5SqSFkbzIeQ5hUsz+pATRn
 EUqemrpO3HYJD4r085LasZQs7Dlao2rMn631WWfzf53mxchxK8qtC6YwqpQFQ+ifxxnE
 bH5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756454976; x=1757059776;
 h=content-transfer-encoding:mime-version:message-id:date:user-agent
 :references:in-reply-to:subject:cc:to:from:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=uYEqRHgbV4dj/zidZbTo09wctcjJATrJIMMftyItbto=;
 b=FHNE+BL/F5ItTbzEzIsGi9o93gpzdOxdIy1KdonxuT2Ze/lOpiL56omYZcqw6dQZ0q
 Bpehq/HvlGLH845ZEpDMfy0To6biCnWz5mKPbR+EyOsBkG/WHJ0dLGwlBu5N4Bt9UkJ2
 3PeEf5M/lf+luH6ce+fBS+5LfuQ+Qz3vPi5Dj//J5WhmVxnLe6I2a9BAo3J3L8c7Qgi6
 LEh9pE/T6O1UEZ4BJwzlc9qd++DARMPscZYiKAE06jeLVeEeCAiZ50u+Lj18ByzxaXIz
 mqAOmweYz1x97nUTwmenkgYZW3JmMTfCWoGkO6ZAETrLSxvTw96yfKTwKQ5R3dKECBNN
 uCPw==
X-Gm-Message-State: AOJu0YyGfEmeZ89Aw8AGgmAhTYoyWM7YvBTEsU3O9R03uZ7oZfk4mL4o
 c0WdtyXEts7HF4GCCyytJT4GwMMgAiJh91nn22+CC1toaxv+zxsp5Y1w3gjMkXaH0RnSkFB/ocu
 S7nrWw5c=
X-Gm-Gg: ASbGncv4VF0q/0OGajvPXU+hocuySdxXoGD2EFGQLGgwkKEpfuz7oBnedu6JHrygPBH
 uYFaFmtKD6Dx5SeUlMr90Zt14YHQRMjd0wj1pTJ70aHb0HdnEChpeMvXdqdIuNjI7m4KKzvoN/o
 IZc2vM3hLHUa6qS3PEtSpGlA7CGnSoEFKFKG8J6r7S41dtm6Uwn1UAKeEMHJS7Nosi2Q3NHi6w0
 Ep/+5bgTddWVPd5EeOeASYDbMNpDzvn/6bYfJ1xZMwj9/wf6AwURnXvYB0yz0yzOQlbAE+MH6+9
 zQSBrJw9dEb5ho0tiOk3m4fGYkLXUNIKTijgwk9PlRT1sG3s+ioW9XLcdNt1wgvcBJPhWxlRya+
 cGPJOFidM8wXOjr2ZP2p+dIw=
X-Google-Smtp-Source: AGHT+IHWSncY8t16Gat2oF1IXj0YlNyyddkee5hGNfgNIv6CUTjZIlCqXsjtUmztQd8y/JQTBGuFKA==
X-Received: by 2002:a05:600c:4705:b0:458:bf0a:6061 with SMTP id
 5b1f17b1804b1-45b517d49d4mr253939295e9.24.1756454975590; 
 Fri, 29 Aug 2025 01:09:35 -0700 (PDT)
Received: from draig.lan ([185.126.160.19]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-45b7e89920dsm29880545e9.16.2025.08.29.01.09.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Aug 2025 01:09:34 -0700 (PDT)
Received: from draig (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id D4A305F80C;
 Fri, 29 Aug 2025 09:09:33 +0100 (BST)
From: =?utf-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-arm@nongnu.org,  qemu-devel@nongnu.org
Subject: Re: [PATCH] system: drop the -old-param option
In-Reply-To: <20250828162700.3308812-1-peter.maydell@linaro.org> (Peter
 Maydell's message of "Thu, 28 Aug 2025 17:27:00 +0100")
References: <20250828162700.3308812-1-peter.maydell@linaro.org>
User-Agent: mu4e 1.12.12; emacs 30.1
Date: Fri, 29 Aug 2025 09:09:33 +0100
Message-ID: <87wm6my2f6.fsf@draig.linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

Peter Maydell <peter.maydell@linaro.org> writes:

> We deprecated the command line option -old-param for the 10.0
> release, which allows us to drop it in 10.2.  This option was used to
> boot Arm targets with a very old boot protocol using the
> 'param_struct' ABI.  We only ever needed this on a handful of board
> types which have all now been removed from QEMU.
>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

