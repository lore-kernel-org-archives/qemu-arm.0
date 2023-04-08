Received: by 2002:a17:906:b2c6:b0:930:eaf4:5c09 with SMTP id cf6csp890790ejb;
        Sat, 8 Apr 2023 06:52:42 -0700 (PDT)
X-Google-Smtp-Source: AKy350ZkTF34yCQ2QxEAhvzkWjDGqmQSCLX76BWti3A9lzBMsnH8g7u6feML1hrczqHPLhk7OfjQ
X-Received: by 2002:a05:622a:1c4:b0:3e6:3257:94ba with SMTP id t4-20020a05622a01c400b003e6325794bamr3100816qtw.29.1680961961960;
        Sat, 08 Apr 2023 06:52:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1680961961; cv=none;
        d=google.com; s=arc-20160816;
        b=VPms3N/iERl/4EqZBvPQyyt+vVytBBQV0DV1Kc54IZE5JdgQ+nOkRNBHh2ZSRf1o2J
         ha90sXR5pQqF2sQysZZICdQ6pITP6/KBYViJMA8KTNGfRgtnDtll+lNLNixoYWPu3wm5
         gb0pucyzpvAamJNRxSTojMPx/RvSVk+RYfznFsz7edIhEXUgNM9JJ7ltnnDUEMMNxIg+
         kt/KML9OAlc/1uuJsTilr3BZbcayXvkU5OqDqhXyHMG/5T6qStpKjbKcgde3A7QTg6GP
         LwPdZAH7AeYLUtyItWxkd5fJuKGLwmXhBCt7/7mDTrHKY2c5Z/KRdhqhznI/wM7DtcI/
         cPAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=3CNDWoamjsf5MiGR8eh7cg7n+vECFA2qV3423wVkc4k=;
        b=dBfqzMpKIhaiWcIJ1832yr9//irHCkPLn9OtYxpxn/JXcwTXFqn0A8PK/t/aB+rZwV
         7uViIpWBCUB2JAXtvkm+yzCW0wPYMikbmANLaOD4DHQnPUfct0Y4VQBIZ/DJZEG7kWCX
         yeZ1lQ2FFpSvJR+/7E2Xcb9Uyn5NiI2NOXb+YkijE+onQjhIjjc3x5DgnCfd4jto+Jd+
         1ZqZkthj8iS9owdDWozIwwdIFcd+c1X9E4shkrmVGjgOGIH5wWW1tIDDPJgolKuet7LR
         rnY3gBuTayF1pqlthmGfW+RqVVtJ1Oc1lS6RM/byb1eKDruGPjgrkief1hBMATlFsd/4
         bssw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=OtafJBhL;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j127-20020a378785000000b007423e1f17a5si4324656qkd.118.2023.04.08.06.52.41
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 08 Apr 2023 06:52:41 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=OtafJBhL;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pl8zW-0007LU-Jn; Sat, 08 Apr 2023 09:52:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pl8zR-0007L4-98
 for qemu-arm@nongnu.org; Sat, 08 Apr 2023 09:52:25 -0400
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pl8zP-0003tH-Nu
 for qemu-arm@nongnu.org; Sat, 08 Apr 2023 09:52:25 -0400
Received: by mail-ej1-x636.google.com with SMTP id qb20so2347598ejc.6
 for <qemu-arm@nongnu.org>; Sat, 08 Apr 2023 06:52:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680961942; x=1683553942;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=3CNDWoamjsf5MiGR8eh7cg7n+vECFA2qV3423wVkc4k=;
 b=OtafJBhLPaz0ogKwxqNhmXbocKtupWyhjUP0O+2CSMZPyZVbGozsZtp2tHnakTaVws
 vuXjjDcj2YDgKL3K6NaCzZTcCy7BU9NynX/e4vG8IxY9qZQbHbaKXE1LJyQCXNpy7Lpm
 AHgThlvI6q6HQ3h7lS6K8isSiZopMbQIUIsiuevEEQ7trhKnjT7og+S7lquNb7PFjTVq
 O8WaloZxhj5gQ1ZkztJvzYdQFa9U0eNlJVDm6iqwzvKkKHCKuRi1Nnt88UgW87lw93eI
 d8LkCRW+f1vADkOgHQVEpYC7pwtjr8soIrrbK4Y9PPr7Txq21e2Bfn6k+RmsvMJA16O5
 fibg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680961942; x=1683553942;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=3CNDWoamjsf5MiGR8eh7cg7n+vECFA2qV3423wVkc4k=;
 b=cFw0taHn/DNGkHC+XjURrtMJForZ19KITfsdzqMxyTPhOm5GAfrUh4mEYqcVBc69iZ
 wjun64ZaW9HawtYCGHDXG9fcizHWpErCsiGK2GZK93lyhbkAcdozJ6yzwB/FHM1GJHMd
 ga787zZf/bE2pHSUB/GhJWuVTZf24rUGeRLtVyND0IKgTibka/HUVQwX02wdyub+iStq
 /OzpriwuFEpUfOH8Y08nedQUyQq0Pe3TCWbocfGpKgnSKpQxA/sFK5f6iFo3C6A3vMD/
 yDja2Ui/8gb8FT5+rSQRsVK6Wjxztzvq9Ji6IWZG3jwjaNDZT6k/qxcmbY5f+LwaDNES
 wYrA==
X-Gm-Message-State: AAQBX9fiMBA6Rw0dTuTN0dVkxGzQ9nj9oIpf+3SFgYzWYDLwQ19Qys+N
 xZzmhqnaDmvFhSr2s1btkAgqa2tjqu/K34sBL3phZ0VhxcpwzrsI
X-Received: by 2002:a17:907:8b99:b0:924:efbb:8a8b with SMTP id
 tb25-20020a1709078b9900b00924efbb8a8bmr1175693ejc.6.1680961941944; Sat, 08
 Apr 2023 06:52:21 -0700 (PDT)
MIME-Version: 1.0
References: <20230407185149.3253946-1-richard.henderson@linaro.org>
In-Reply-To: <20230407185149.3253946-1-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sat, 8 Apr 2023 14:52:11 +0100
Message-ID: <CAFEAcA89EfOzFdcvaxqzvbSTCgL3t7+Wsxqr=ON7onHJJVwutw@mail.gmail.com>
Subject: Re: [PATCH for-8.0? 0/2] target/arm: BTI guarded bit fixes
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::636;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x636.google.com
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: /NU5PPuMP6cH

On Fri, 7 Apr 2023 at 19:52, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> As reported by Coverity and triaged by Peter.
>
>
> r~
>
> Richard Henderson (2):
>   target/arm: PTE bit GP only applies to stage1
>   target/arm: Copy guarded bit in combine_cacheattrs
>
>  target/arm/ptw.c | 11 ++++++-----
>  1 file changed, 6 insertions(+), 5 deletions(-)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

It looks like we'll need an rc4, so I guess these are safe enough
to go into it.

thanks
-- PMM
