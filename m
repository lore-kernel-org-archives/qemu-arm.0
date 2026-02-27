Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 623F9FEFB62
	for <qemu-arm@archiver.kernel.org>; Fri, 27 Feb 2026 15:42:25 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vvzyK-0007gv-Qf; Fri, 27 Feb 2026 10:41:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1vvzyI-0007g8-R2
 for qemu-arm@nongnu.org; Fri, 27 Feb 2026 10:41:42 -0500
Received: from mail-yx1-xb12b.google.com ([2607:f8b0:4864:20::b12b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1vvzyH-0001AV-24
 for qemu-arm@nongnu.org; Fri, 27 Feb 2026 10:41:42 -0500
Received: by mail-yx1-xb12b.google.com with SMTP id
 956f58d0204a3-64c31ca77b4so2061263d50.2
 for <qemu-arm@nongnu.org>; Fri, 27 Feb 2026 07:41:40 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772206899; cv=none;
 d=google.com; s=arc-20240605;
 b=LkqzjItxEErg7CIj1okvFuUhQvebIf/zhPT9VsYxPVeUHTh/823s2huneaFz/uw/FB
 B2YyVVvEYt/tT/+PXqD2V3X/qODp8pFv/d5twGS839yYhqjK77waO1NqpgDqSTvtkHV8
 n6SsGpoihWqn0fCuIZgA/Pk6gZLkg4oIw3pwDT9t+KZxsUqnhAwTjcHk5lQC6KiiUNn6
 nbgNzXHo5ABb2AsDQ3eMuP0Cy7+7Nj3pccS9zYARVDWxQoopjqptB1bPdh1on8x7GUTo
 76xKwKEGsBluvvSyKIUyddMRJJvRrhjv0QM1QOpX2wJJ1fsZBqqChCtXcIlYdz97/ot1
 MmEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=sdhfb2hbydWQTQXwnX9sfwR4aytZTPxQ9Ec0YgcPDFc=;
 fh=eS0G2abyfiSM9g/Mf4wgJKj/x2UlBjow/CAn6090MHQ=;
 b=VKbYej5In7oX00H00I9wiP8VW3ZODSl2lStvDRYdc9jwDNnI2JraIzJjXM05jMpyag
 Ft9VcZ7LsVis3MQ29GwAddb2tWHohxGUVzOKPTCc5K4XkZJgYuLfYUde4IeGrnqTZlFQ
 bROM1NPZgVe6swXidkuw/YydukgA5lX2oDlhIWz0NQLb+lkLZoD7mk+7FLOV+tetFl8o
 JqLWGAnPVyzxcM291NCzhLgVuerYbhBNY40lHAC5DVtm8yx5psNa1u0gsi1Etx5QnBNs
 F6o6/2NlQT/7cCSGg3z39aajE/kJiBm6op+z/8V32TMyIhWim+bg/gHyFJZzi3lL9kdQ
 mZow==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1772206899; x=1772811699; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=sdhfb2hbydWQTQXwnX9sfwR4aytZTPxQ9Ec0YgcPDFc=;
 b=uWG8lfhD93/ETVWny9xkjIOEWLzvrHMqfIbR7hmZWpNo0+OvRpNj9m6CNRpG0+Ji4M
 dFj4vZhau3EQcIKpKPJeiv25JwsvbmCrkiJoxxlJYZ//pTWyNIgekJZBaSyFUpsNAYdO
 oXcQfHs0XBrHRi4h4txTUeqwO4Jfeb55mq3nfT2sjiO12RY0v92MeU0YyxodMAm8uDM7
 +CFbqu3INhSF6RTGOruaBxGAtE/PsuW/bX/ak+UaxrmUl8oEWj3e1X25mrNeBZ5L1Hmd
 D0cffOI9zzNwiRfUl/lObSSI6JdHHk5/t0gxewA7nSDogT8ESbD1tfkvD22I/8WY/+VL
 KL5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772206899; x=1772811699;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=sdhfb2hbydWQTQXwnX9sfwR4aytZTPxQ9Ec0YgcPDFc=;
 b=l0bg212bukGgvSgycKjWXQTZEZhFpuniZLJvoWJGy2Bgyyw0c5mCAvCISbhFKFkI1/
 iqEdyqnO/kOqvX37HQGY+g3iATpuxU24JZ0Qsml0wdm2Gsh4JP1h/yCKLhO6QVMbJ4jh
 dHXMGTxBmmM9dpTTGMlzHnz37fYgF4gO/vKS8WiB53ZHrdfRH0nC0sD01syGD+7cSKP8
 3bckhGnzUySALgjZThwLhZg2atK9SH1GGGHUrFMRzrhBRen6po1X6T/v4oaJI+NFdSzr
 NIrF4YkLPqGf07d8mF3k4uaC9UuIwTDEziMLDndpL0WsH/sV6VgpOTJ7akRFBTCUJLNn
 d0cA==
X-Gm-Message-State: AOJu0YxcZyVWDfmSMKjPIVWEbR+qg+n415jv61h1ve70T8R4nWFrXUk4
 zWUPSuHkdqrby6ON2t65R8D/eZIkvx4IItels98ze8vD9UauiBzCN1tyUBe7jkguZPPXTqOyazK
 0uOTGxD9uX2RpLO+c+pE2dfcAEI5uKuNs89OMy8U+2A==
X-Gm-Gg: ATEYQzwyLGl6xJCysuqHo/SkNwlyydZnX7q7V1DtmVlJIWFlbsi9dq35XEDOr5ZbmV7
 +9izdc8t0TOw0oCvO6IPE0HHSZnNmf2PSUm1WXiIm2+HB+caeENUuNhA7FwgLcUPKWE1Xqr87Cy
 9rIiJ+QNOKw7iikLrajqbYnR0oYcjlyaiFF8qbORjfWvO0AoEroUUXVHb8jLtRAYcEcq5aUeevB
 MxzRwSgXzZTjjgrW38AhiZzYFMUTRXgJNEYUGuEB0DM8SGTF7CoIU8fkmAMbm+k5KmUPVFON+TZ
 eW+VvQShZpBqVzdcvlzMoR/2bWr6G6oTmwyqKTjcerAlO8SC5hl+BTM4IsX7q+bDeNHUu+z+uMm
 OFg==
X-Received: by 2002:a53:cf46:0:b0:64a:e959:b3be with SMTP id
 956f58d0204a3-64cc22d70c6mr2119452d50.71.1772206899311; Fri, 27 Feb 2026
 07:41:39 -0800 (PST)
MIME-Version: 1.0
References: <20260227135736.2280161-1-peter.maydell@linaro.org>
 <20260227135736.2280161-2-peter.maydell@linaro.org>
 <CAFEAcA853KSRD7yJKjyoM-E2R4YNou=x+BCR9EWrjym==-tQjA@mail.gmail.com>
 <6b0d1396-63bd-48cd-bfc3-2b0dc34327e9@yodel.dev>
In-Reply-To: <6b0d1396-63bd-48cd-bfc3-2b0dc34327e9@yodel.dev>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 27 Feb 2026 15:41:27 +0000
X-Gm-Features: AaiRm50zEKLwcKtVxa6EY25rb6orP1q_vda45rmeYjyWdtzKOgVJ6-LfBs6kJZY
Message-ID: <CAFEAcA9xXoD505V4wzfTZHt_ajRGYVRN3KRd3BQgGx=YRDYXNQ@mail.gmail.com>
Subject: Re: [PATCH 1/4] scripts: Move lsan_suppressions.txt out of oss-fuzz
 subdir
To: Yodel Eldar <yodel.eldar@yodel.dev>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, 
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>, 
 Alexander Bulekov <alxndr@bu.edu>, Paolo Bonzini <pbonzini@redhat.com>, 
 Stefan Hajnoczi <stefanha@redhat.com>, Fabiano Rosas <farosas@suse.de>, 
 Darren Kenny <darren.kenny@oracle.com>, Qiuhao Li <Qiuhao.Li@outlook.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b12b;
 envelope-from=peter.maydell@linaro.org; helo=mail-yx1-xb12b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On Fri, 27 Feb 2026 at 15:32, Yodel Eldar <yodel.eldar@yodel.dev> wrote:
> Also, there's a missed reference in the docker test script (diff below).

Oops, thanks for catching that.

-- PMM

