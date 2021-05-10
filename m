Received: by 2002:a19:e20e:0:0:0:0:0 with SMTP id z14csp2712472lfg;
        Mon, 10 May 2021 00:27:08 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyOu3IhEzs7TefXNPsZzFoeRW3i+RUX5S+GOprL6/D9PpSSj8zKeN/OkzgErXhFNvJwAyKn
X-Received: by 2002:a92:c20e:: with SMTP id j14mr7799462ilo.259.1620631628161;
        Mon, 10 May 2021 00:27:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1620631628; cv=none;
        d=google.com; s=arc-20160816;
        b=fLNyBWzTQDAEz7d2/efpQ2xPGNQ3x1r19CFaf856GpHfxNmfmE8MZ0Dl2lBCkZaMH0
         tQENYZO5MByCZULS6g8lz8JY7ygUPkiiggX4Va2IvHmnLLIAW613tkJjs2+47sGIRxXn
         JJDS2BwvuOl145ZGZsYVn7dAGj89isIZtv/vI0lrd4lS2nDNXYxV4HTC5RhreysLb+p9
         qII/KlBUUee59KIVK3+qmFZ/EE4YYofEDa9l73NDwYQj4SARQ0/6/MfPgqTF4h4BwcOr
         TVvvVX09zsvfnmc8TYl9+x9az36sWIphkDTAq6jJ/ZmHhDEsln83yoSEHw5IzTiKVTHd
         bXLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ovlal3ivnJLfkChQIvnliHyQyS9mA0b9CW3j65F46qI=;
        b=AagddZV1gjigvFF2QqYqz3BuBvBwxB65I4KfEuzMpgu+s40ElFEIaPQAjvBe01Vf8b
         WAcAhlirzKQoOdbKuHLV78Y7engytjApXD0AZ8O8Ul/0fasPIs1F1iLrjXWsmlTGKeHm
         yU8BpdEzWYkDgDRYSG3ooIxxEUwv1bS6wHSyzzVeFfH7nNgEmoJ7UUdetmbeyfAfIs7u
         UPETmX5rLejCjuJ0YkCTDH/8/UJaQ+5tgZh6bzCD1xc+S4nwBaJaAbVIOxWWdfSkIRAk
         N1MiP74hjadcUhyaeA2BL1jFQiegmZbG6xVWhxS3SEfzSm5+uICBuz+LfXA1uPGLVy94
         Gl3w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@jms.id.au header.s=google header.b=YNEmBDhp;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h8si14516766jas.102.2021.05.10.00.27.08
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 10 May 2021 00:27:08 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@jms.id.au header.s=google header.b=YNEmBDhp;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:60710 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lg0Jn-0008S2-4v
	for alex.bennee@linaro.org; Mon, 10 May 2021 03:27:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38242)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joel.stan@gmail.com>)
 id 1lg0JC-0008QS-J4; Mon, 10 May 2021 03:26:30 -0400
Received: from mail-qv1-xf36.google.com ([2607:f8b0:4864:20::f36]:38748)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <joel.stan@gmail.com>)
 id 1lg0JB-0006jO-5j; Mon, 10 May 2021 03:26:30 -0400
Received: by mail-qv1-xf36.google.com with SMTP id jm10so7867648qvb.5;
 Mon, 10 May 2021 00:26:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ovlal3ivnJLfkChQIvnliHyQyS9mA0b9CW3j65F46qI=;
 b=YNEmBDhpfwIXA5itAZXZvW4sd2LlnQ3is9cZJFv8qK5t6dwmbtHO7iaAM8q9sxAYAW
 S2q8dn7ELzO5Faa6Kf7br3eIuH7WW4O5FGn123I19IqaQ4+YxRXVnTIV2mb8dOCOGh16
 s4N7VmfSWEnPzKOe8MN0gaLkrEzdEn7xg/T3k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ovlal3ivnJLfkChQIvnliHyQyS9mA0b9CW3j65F46qI=;
 b=HQosoj6lQcDzZMmoDilcInfwlyShVsTiPF2b3Mm1evYgTcY1uAcTzJeQo/uUnPSPVJ
 IZZ0m1WKUdG8YHjpXOrHzETjVkYlPeFtPZ8bCqg+Y/upSvs0rK732jX1sNzqq5jMm3Ef
 KrMVi8t+MD1emSEaPgGEmZ/zdWWLSFKSNQiYioPBVGyQ0+L1PeZl93B3VX9uctzM+nj9
 3Ex4YW4pMsVMp/GLk5BjnJDPcMZwBJT71E8Q9FQY8+/H6t2Pz945wesvmbLd63v9qJIs
 6LH3oNyQDro86kuTI6sj2UT1eyJdd87reUiV9F1hoE7HM9sLSWVXcSwsAX1PA0kxagi6
 byVQ==
X-Gm-Message-State: AOAM532jGgOASJwowdnVUIjLYlVA0BHKIrVMdESLSdIbdNqPHQUiCQH0
 a6svs1AVIF8/ja00Ot1xEOHnmzznp8OtAdIi5wg=
X-Received: by 2002:ad4:4c49:: with SMTP id cs9mr22186204qvb.43.1620631586518; 
 Mon, 10 May 2021 00:26:26 -0700 (PDT)
MIME-Version: 1.0
References: <20210505170101.3297395-1-titusr@google.com>
 <20210505170101.3297395-4-titusr@google.com>
In-Reply-To: <20210505170101.3297395-4-titusr@google.com>
From: Joel Stanley <joel@jms.id.au>
Date: Mon, 10 May 2021 07:26:14 +0000
Message-ID: <CACPK8XfX+Cod4thCE8rbmV+h3fL7Jt6ndW9u=-H_YRxz_aNOag@mail.gmail.com>
Subject: Re: [PATCH v2 3/5] tests/qtest: add tests for ADM1272 device model
To: Titus Rwantare <titusr@google.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::f36;
 envelope-from=joel.stan@gmail.com; helo=mail-qv1-xf36.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Corey Minyard <cminyard@mvista.com>, qemu-arm <qemu-arm@nongnu.org>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: uRFDHXVQNwT4

On Wed, 5 May 2021 at 17:10, Titus Rwantare <titusr@google.com> wrote:
>
> Signed-off-by: Titus Rwantare <titusr@google.com>

Reviewed-by: Joel Stanley <joel@jms.id.au>
