Received: by 2002:a17:906:fc07:b0:9bd:85f7:2662 with SMTP id ov7csp1071213ejb;
        Sun, 22 Oct 2023 18:39:10 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGYEa/bGMpLj1eY2lBSMewoTjTWw3MV+Ae34d3w6v/hgMRQAiAOcIl82QEkwn6yM+xWKEfV
X-Received: by 2002:a05:620a:2496:b0:775:cf5f:8a57 with SMTP id i22-20020a05620a249600b00775cf5f8a57mr9045589qkn.7.1698025150037;
        Sun, 22 Oct 2023 18:39:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1698025150; cv=none;
        d=google.com; s=arc-20160816;
        b=nB00gtZ+Mg9pIUkaCNh9IlN3DStpqCHi9Q1+n29nmEVlFhjWJ556cveMrMRcdDgYNm
         PhT9Npp5XZCSF2tpO8R2bKoXuqrj7LZLjs0/HJwxQpJNcUKmTaPYLrNtwfUMrIlHiTf6
         vMuAGQk7hKpcBnd0OzdCPFmHYZ4DBPbUz6lIaAUYOx8dTgp8Bu8uvpxbYNS2DjiZmchS
         eHmT703RlibXtX5nZgJ+liuNmXjScnuhDdllcybLfU2SwIutbvBOkntb4XQd79ELL+IQ
         mSiDoGdH22GW/bF6pSlH7byWugWR46ncCxEGq2QFDGhr2fQTxsDpNex8o787h8KyCgcg
         shGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:cc:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=ZWIlbeaQFd1CLw+TIe+ZDHatnBw+FkEOm4UgcCTcIwU=;
        fh=iY95LQ2EZGL5gum0JNZHT+G5f2E2xCqAEJaN82odp0I=;
        b=wRISoXNzuLkQ1EOyeI0ABVoMSPXVuQtxpsaRtlJOduDasIH+xMgxcHK9aFVXz8hBQR
         aS0cr0Ui7H+y9EedpX6t9kaoFKfVVz2fq3XFIKYpF1NdMy87RnQzlc1SrAn8HuOC4F+M
         Y/ePoEqa89JuhvhBNQnf9B3NcoBC9KVMYP2WmVD06alWMqd0bX410zzP7G7zXHGHswC4
         SsHm7gvBk8iy3FLkFNKZFtQf/K9/GEoK922jwAuYXo4efAMgMbVZVhYZGdjIgy5jdZv4
         LRw0DixkT4DyUztnVfNAMNV5soRibi4dYr5S3bVI6eAohVAv2ZsBu8qzoY6mwcj8neVi
         3O6g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=fG7AX3J9;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y7-20020ae9f407000000b00767ccf42f41si4495311qkl.29.2023.10.22.18.39.09
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 22 Oct 2023 18:39:10 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=fG7AX3J9;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qujuO-0003sB-U6; Sun, 22 Oct 2023 21:39:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1qujuO-0003ry-2R; Sun, 22 Oct 2023 21:39:08 -0400
Received: from mail-ua1-x92c.google.com ([2607:f8b0:4864:20::92c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1qujuM-0002zc-If; Sun, 22 Oct 2023 21:39:07 -0400
Received: by mail-ua1-x92c.google.com with SMTP id
 a1e0cc1a2514c-7ab9f1efecfso925762241.3; 
 Sun, 22 Oct 2023 18:39:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1698025145; x=1698629945; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ZWIlbeaQFd1CLw+TIe+ZDHatnBw+FkEOm4UgcCTcIwU=;
 b=fG7AX3J9D+mePwTjwgfO9Zlf8uuconlQ3hocfdWwz7gl0oUCvtGOAcgSvpQ32EcYsa
 giUxsiEhyc67XwkwH4mNxRgBMsCPmnp5ttVvaCvrATa+4kgh2blFA5mEzMaTTcvtguLq
 G8pqXJF0/9YnbtnCvKP2Yc9LrUsLVSC4WFxcLedMnO6xnnmVeojTOR1IKRfcaMuXMRKZ
 Cwn4WWniTD1SUbII4ojJgTsSdEHjjA8mLKWLWoNuDmWwZ5vLfYe4mrwSRqYqVrpqqGbG
 UgJg915pf33QnovV1cmIs3Lw/3IA1DPJEh2r5iSGaBrkuI2GwuKIu/Nnxv7a1+D3gNiG
 42lA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698025145; x=1698629945;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ZWIlbeaQFd1CLw+TIe+ZDHatnBw+FkEOm4UgcCTcIwU=;
 b=GH99OB3c9IVEEi7RRZrjFXNwM8YmyA9mHXnlQARUtCt9x4n4IoanqBg0OfkcW8VIsC
 vAZ8/E4ivWvFsX1A3ouWxCIUPD9EgY6ekD6Doa7tCWTVwC65X4fLFcFfqyEU7SDyBBIk
 Kt5jicbrRdtDr2c3dsYuWvFhIWXL8RUUs1DyLlF3uxsg5KRUl+X+TNQ0SZBBN0SUbJ23
 IlujvxlMRU7gcachJJkhcl9082vjo0tjY8ujM5ip7bi6Phomsxg3Vm/uDMJAo3KRbNvK
 HfTVroXv92apG/sPiP8OKJ8dX3VHIRj6IBxXCQwPM/TCHG9doDMkrdAf++JKHBT7WBU0
 uXZw==
X-Gm-Message-State: AOJu0Yx3VbkDzfdm8rwzzt6P13nLdqNHJOgnoiI4yZc3c/QNBz3UllfI
 yfrQ9H4hhjQFuaMxeNcn2PfR7U2UuTNPlDLFwu8=
X-Received: by 2002:a67:c309:0:b0:457:bf4d:2ee1 with SMTP id
 r9-20020a67c309000000b00457bf4d2ee1mr7701237vsj.13.1698025145007; Sun, 22 Oct
 2023 18:39:05 -0700 (PDT)
MIME-Version: 1.0
References: <20231020170009.86870-1-philmd@linaro.org>
 <20231020170009.86870-5-philmd@linaro.org>
In-Reply-To: <20231020170009.86870-5-philmd@linaro.org>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 23 Oct 2023 11:38:38 +1000
Message-ID: <CAKmqyKPZZVT6yG9BB5-7CGwrucA5EAywJU2S1WS9m+UmndzeWA@mail.gmail.com>
Subject: Re: [PATCH v2 4/4] hw/char/stm32f2xx_usart: Add more definitions for
 CR1 register
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Cc: Hans-Erik Floryd <hans-erik.floryd@rt-labs.com>, qemu-devel@nongnu.org, 
 qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>, 
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>, 
 Paolo Bonzini <pbonzini@redhat.com>, Alistair Francis <alistair@alistair23.me>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::92c;
 envelope-from=alistair23@gmail.com; helo=mail-ua1-x92c.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: 6/MoEVVOXruy

On Sat, Oct 21, 2023 at 4:20=E2=80=AFAM Philippe Mathieu-Daud=C3=A9
<philmd@linaro.org> wrote:
>
> From: Hans-Erik Floryd <hans-erik.floryd@rt-labs.com>
>
> Signed-off-by: Hans-Erik Floryd <hans-erik.floryd@rt-labs.com>
> [PMD: Split from bigger patch]
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
> ---
> Useful if unused?

Still useful I think

Acked-by: Alistair Francis <alistair.francis@wdc.com>

Alistair
