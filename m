Received: by 2002:a17:906:1c8e:b0:a51:b7b1:b069 with SMTP id g14csp1926736ejh;
        Tue, 9 Apr 2024 07:04:26 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXgm9LF4ktjp+UNVxkboHpux7GRdObITO+FyFFBDYUbxUTJJqH3MEXqeUwgv8gaxH/EU87aTolP83Z882u99UiybOzkC267
X-Google-Smtp-Source: AGHT+IF0PCi6LcAA2h3ZuCSV4bRrY3KeqnlRVlU5bFCHDmHmj68lIOK0GAbNBXVzmw+3UKNypfTJ
X-Received: by 2002:a0d:eac7:0:b0:611:200c:9229 with SMTP id t190-20020a0deac7000000b00611200c9229mr12289759ywe.8.1712671465836;
        Tue, 09 Apr 2024 07:04:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1712671465; cv=none;
        d=google.com; s=arc-20160816;
        b=JtWwR0SjOgj2M7p8T6nOVvf+ifIQRB1IzSlTdMsUDXYcjtjnOu1XZ1PM+v32Pr781a
         C9bFzhlkZL8CmDXXyMD/uKgWkrA5dWTg3xol020FkorU4VraMNHKzYUclw4rrb6zMkc+
         AU4ma7wz9FoDQPbUshh70f2dA0299q6wH42NxeyPPQRzWsREQplOfvDJ6mL3ZPhtAxXS
         OFrHGDB72Zh1jRaY+2BNBSxbCEPRTHGKPezq0Zn0cb8aTOR8jN4/YH768rhm7cwzKV7Q
         DyFANNtaJuI1mrMH5++LUyZZJNgxQReEaUvGpkDi74B63j8PVlutL0bldUokL8cRw7qC
         o+3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:cc:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=vzmYBdZ5mYJb9oSJsGiax8oqSCMQV8SWF1raZ7Z6dPw=;
        fh=lMr66YWO2NNsKPKpMDQNKa75STa8w1P0wpumtLrUy6U=;
        b=cfGtCse/ojKPoMELTfGzVY/ZKw4iM0o5gaeB2d36DX3I2nfx3hV4DfHnKjJJpkAdPz
         vi9Y/g33viIiMpfNnqridjWGtpPSVmBORkNHhCkELdXHYqUqaLvHXhf32ggmAgk3QgZu
         KIJxPuBu0K4Dn6rupHKSSXqHSkF68jv5Ot/bm6/YS6hXzJEow91d80/3mr6r7wOQrSwt
         JX/xORql2GbfytIMuP5oIqWwd3KfpE8U08Znl1hfahiDbxJQjiPrjSyCu6vYzrVA8Nva
         1DU4xH42DLPXrgmjN302C5s3X9FYsesU9+65BftT1YF/Gy3zTa3S5l3Jk4ktgMj63Hpy
         nm6Q==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=myuQHTul;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id k38-20020a81ac26000000b00615183ab185si4059648ywh.155.2024.04.09.07.04.25
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 09 Apr 2024 07:04:25 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=myuQHTul;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ruC4w-0002Oh-1M; Tue, 09 Apr 2024 10:04:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ruC4t-0002Ny-V6
 for qemu-devel@nongnu.org; Tue, 09 Apr 2024 10:03:59 -0400
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ruC4s-0005CO-0p
 for qemu-devel@nongnu.org; Tue, 09 Apr 2024 10:03:59 -0400
Received: by mail-ed1-x536.google.com with SMTP id
 4fb4d7f45d1cf-56e449187fcso3245035a12.3
 for <qemu-devel@nongnu.org>; Tue, 09 Apr 2024 07:03:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1712671436; x=1713276236; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=vzmYBdZ5mYJb9oSJsGiax8oqSCMQV8SWF1raZ7Z6dPw=;
 b=myuQHTulG68B7fYUVbuKghJVjTgiQTVAjXL7EZI80aQvTJtav8GA8ChrQLWQ814naX
 4jGsRPo2QudIOFmxjV3Cnysf+uAdbcGWHt2UNn3M+9Q9YyCMKIAFH2MEHkjPvOeBWAA7
 wUdpM76gCRnK0+XzQLdJe3tS9UTalRg1wkVtSjGtnsffXfwbQ008fNosW5ztun99UYti
 +FEhx9lkw6DIgn5g3+/J99iQoFtjQMU5yrOkNUq08Fgvr3AVpjfjMYgOmdn4ZZrd+99/
 K9Webv6NLXTdczfcvyLy50r6U31zvmky8vUFjVW7s4FQj+zilmaXBXOuiIeFYcneyA+P
 Nd5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712671436; x=1713276236;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=vzmYBdZ5mYJb9oSJsGiax8oqSCMQV8SWF1raZ7Z6dPw=;
 b=fUICdqbkiXTC1Cgnz1wqlkihjegQc13QfAhGoLcie0ICi1gfCAJcK1FI5FgdR1bQj5
 9MT8Sa6QApA3VXq1bYrEfYDL6be/XvU7AMZw6quxIOYsBtkXyJaTnOfCvAynR5bgL3l2
 TyaFHOApAlBPb7i6cBlm1oUWd1Bnyecjh1Eg97byQqOxGNp1crqbtSKXMzRud/VL3YjK
 AR9AmlzQA7CyhnJmA71eRYJ0Qi6bBoNBzdb2Awr4itexp6Qq02g2yBNvQf1TxDMLUbjF
 XMyosqkvopPZJTeXhqw4jvwz30e7gD3fvF3YVtnJaDCbOkBLl24D0A5/87QIcJaTzvWK
 lm0w==
X-Gm-Message-State: AOJu0YyneZ7byve2AuQ9rcpbbRI+pc2xwWrn1KwgmfyuqWmHVXRpsTy8
 FS9VxClZmZF2JEZ1KjAghPA8ox4lyNvxCx5VwiI4N1ycg8UoURiWHdwPmGXE5CEICCvJKTBt1h0
 roWqZf+ipysshoZw9us/sYrj2yNABNkqNk0kLoA==
X-Received: by 2002:a50:c016:0:b0:56e:de1:f427 with SMTP id
 r22-20020a50c016000000b0056e0de1f427mr7883074edb.25.1712671436235; Tue, 09
 Apr 2024 07:03:56 -0700 (PDT)
MIME-Version: 1.0
References: <20240409133801.23503-1-philmd@linaro.org>
 <20240409133801.23503-10-philmd@linaro.org>
In-Reply-To: <20240409133801.23503-10-philmd@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 9 Apr 2024 15:03:44 +0100
Message-ID: <CAFEAcA8fFyU+WkS=SkUAW7g8kydNiV9Z-YK5+aPH3hagOzKTeg@mail.gmail.com>
Subject: Re: [PATCH-for-9.1 v2 09/11] hw/net/lan9118: Rename
 rx_status_fifo_size -> rx_status_fifo_wordcount
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, Chuhong Yuan <hslester96@gmail.com>, 
 Jason Wang <jasowang@redhat.com>, Alexander Bulekov <alxndr@bu.edu>,
 qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::536;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x536.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: Tk52nWY7ualT

On Tue, 9 Apr 2024 at 14:38, Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org=
> wrote:
>
> rx_status_fifo_size is a word count, rename it to avoid confusion.
>
> Suggested-by: Peter Maydell <peter.maydell@linaro.org>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
> ---
>  hw/net/lan9118.c | 16 ++++++++--------
>  1 file changed, 8 insertions(+), 8 deletions(-)
>
> diff --git a/hw/net/lan9118.c b/hw/net/lan9118.c
> index cace22381d..663776f575 100644
> --- a/hw/net/lan9118.c
> +++ b/hw/net/lan9118.c
> @@ -259,7 +259,7 @@ struct lan9118_state {
>      int32_t tx_status_fifo_head;
>      uint32_t tx_status_fifo[512];
>
> -    int32_t rx_status_fifo_size;
> +    int32_t rx_status_fifo_wordcount;
>      int32_t rx_status_fifo_used;
>      int32_t rx_status_fifo_head;

True, but rx_status_fifo_used and rx_status_fifo_head
are also word counts. Should we try to indicate units in
all these names, or is that getting unwieldy?

-- PMM
