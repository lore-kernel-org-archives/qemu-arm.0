Received: by 2002:a17:907:8744:b0:9bd:85f7:2662 with SMTP id qo4csp3302748ejc;
        Mon, 16 Oct 2023 09:26:57 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFG7yzE1ASjpq6Z4YrzTR8J7lzt8m3YnoHMUmnnWedOlN4ucQFul5w539/ONuGjeDwFRqqg
X-Received: by 2002:a25:5f4a:0:b0:d9a:54d1:f874 with SMTP id h10-20020a255f4a000000b00d9a54d1f874mr17624121ybm.35.1697473617297;
        Mon, 16 Oct 2023 09:26:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1697473617; cv=none;
        d=google.com; s=arc-20160816;
        b=uM4vgoj7vbayzSBBcZNGqtJSjiOaq5hSgw8307RB6FKJVlS+t2DPRpxmKWfI2qcbSJ
         BQCE96+cuXBMAkvw7B+6tOReXUaUZHOPH4xc4ILYGJiylh7VWzAOV8RTyb208f0/4RAz
         wyDVhWnmJtOZanXLrIWVxbQ61WOxmqXJAlzJrRyyK5iR5IaeSyVDLar0cIgIamSKBHUK
         MxLyIJ6g8ZnmYA82sr+CLmJVtMqLcAobpOfgRpT06dcaWwtRxGUogzAlNECjKD/3bIJT
         Z5igu5P5UZJZqm2n/36LFo26/xOzGiK5xAP8E2yj/LG9nzgRS1zLNWume1oucO13Xvsf
         oFZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=3KXegPJz+GGOTIta3r6kQb9Lp4pQ77rh9DVgDUgNd+I=;
        fh=hGMrc/dEc0Y3grXVhr/zAChg6Po104HUSspZoy5ikvs=;
        b=XtewlshR36NGN/r0/0tpir5h0c41nOh63Tax23Ar9zLYzHm51vH9efF1+FBvYZDgE8
         +kbwR81m4gSl66zVtPEfu2vaC2LxmcXqwFdINDkvhe031XDD9+gI0UXnRiqZ/Zfjf0BM
         M+RgGLkbBCi8u8uPdH+fyihmM0Igxz9ECXrbj4/YZBKwt/YGzas7kbIAdoQqyQn+Pk/s
         ed7ubJxF3dU5O60zLpw4cy0yTHiMRS2N0mBPBeSQWnWZyylQloYb5oLZR33MUSOn//q6
         QlL9UpdW2SmwYuU9HNAfkuNZY6EGAO3kQVceKcFmogRIo1Jpk/xoLFr8zP9AfFDZOyIx
         Mu1g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=IWbuOqwj;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f11-20020a05620a408b00b0076cb1c1cd67si5709387qko.655.2023.10.16.09.26.57
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 16 Oct 2023 09:26:57 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=IWbuOqwj;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qsQQV-00018L-L3; Mon, 16 Oct 2023 12:26:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1qsQQU-00017l-8E
 for qemu-arm@nongnu.org; Mon, 16 Oct 2023 12:26:42 -0400
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1qsQQS-0000Aj-No
 for qemu-arm@nongnu.org; Mon, 16 Oct 2023 12:26:41 -0400
Received: by mail-ed1-x529.google.com with SMTP id
 4fb4d7f45d1cf-53b32dca0bfso9797036a12.0
 for <qemu-arm@nongnu.org>; Mon, 16 Oct 2023 09:26:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1697473599; x=1698078399; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=3KXegPJz+GGOTIta3r6kQb9Lp4pQ77rh9DVgDUgNd+I=;
 b=IWbuOqwjcvxf5uHVa4v/xwBmaceMNtLHZfAR8tjWXlF7o2dh5V8pnNj9Q3JQMLKIoo
 OKV7Y6bvRhnB9VfTF7ngzROruB9hddFeihTnpVYj0Fdc8no3HDDCTdFKSAd7BWVZ+65o
 46uqz+uLcIpcqJBIBoWWKRP5f3/tH0Z19CPU2mPiTHbwpFWB8QZAMB2UJUFtGOYs/axF
 GAiQbRTD4+kL/F/HgWfwBVA9fNJtiXrnINbNVHnmmSQyLdfKgwN7HueQS9v1tq3Frl6i
 fDP8ozx6s5EmfVDwsz2JYPFJtmNxSePw8XRA04ZRm+WKwcPlTxkGBHIA3G7m38dzZ62q
 GLPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697473599; x=1698078399;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=3KXegPJz+GGOTIta3r6kQb9Lp4pQ77rh9DVgDUgNd+I=;
 b=XW0rERRKmt8f2kKUSxJHZMDL/xEwGQ25IVMNG7qw03t51rV6eiL1pY+hUIpPVaC+Ls
 FWHKZ6xiBl9eshSezAK/rsYLp4qlh3Yz7WBcPe5AvsQNwtjBftImwfacvqum7NwWXs6U
 l8E9zfCOj6eaEK+kHiYpk7gPeN99Kjcy5qrFfDWCZX3TUJohuMslD2Z3dYiRK+eSRehW
 JU3zvtmKv3YwRPBT9HwLAsWkk5kir9qU3jCVc3T7hGwjzdQZdGyF937VvO6aSlG39r/R
 9qDsxUD2qd3sS9WNNGjqVzrtN3KzNosYyrdEaXafvzh9rhxaGCsJlEORNR+WYjndRSW5
 1JmQ==
X-Gm-Message-State: AOJu0YyeG1lweRexWeMdgrSmlgNgXenS7OGLIbSrPw322X8+kqPwFfFo
 sHFpzWmRvnys1Zh2yw+lPBNmGjmeO4+rX39zJ8Z0cod9bncfo4Ko
X-Received: by 2002:a50:c8ca:0:b0:530:ec02:babd with SMTP id
 k10-20020a50c8ca000000b00530ec02babdmr6868429edh.9.1697473599226; Mon, 16 Oct
 2023 09:26:39 -0700 (PDT)
MIME-Version: 1.0
References: <20231012073458.860187-1-thuth@redhat.com>
In-Reply-To: <20231012073458.860187-1-thuth@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 16 Oct 2023 17:26:28 +0100
Message-ID: <CAFEAcA8Kg_nAQPwvb800UbRcHB1qQ6DYogbm62SuSy=0tZC22Q@mail.gmail.com>
Subject: Re: [PATCH] hw/arm: Move raspberrypi-fw-defs.h to the include/hw/arm/
 folder
To: Thomas Huth <thuth@redhat.com>
Cc: qemu-devel@nongnu.org,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 qemu-arm@nongnu.org, qemu-trivial@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::529;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x529.google.com
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
X-TUID: /QLt0XisyECJ

On Thu, 12 Oct 2023 at 08:35, Thomas Huth <thuth@redhat.com> wrote:
>
> The file is obviously related to the raspberrypi machine, so
> it should reside in hw/arm/ instead of hw/misc/. And while we're
> at it, also adjust the wildcard in MAINTAINERS so that it covers
> this file, too.
>
> Signed-off-by: Thomas Huth <thuth@redhat.com>



Applied to target-arm.next, thanks.

-- PMM
