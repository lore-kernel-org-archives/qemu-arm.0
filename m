Received: by 2002:a17:906:ca8a:b0:a63:3083:985b with SMTP id js10csp454052ejb;
        Tue, 28 May 2024 05:29:15 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWOXqZoEis7XiLFamJwa22lUo+CtcitomhKASM7hj81Z0F9I4IkVIv3RMKbOrPhvKbI7DF34tPbv/PK2W21J6rtX5e6456v
X-Google-Smtp-Source: AGHT+IFedqUwp2q3fSdGbDVy04y/yqW/AiYndfrV3OdD5ltA5jlwnj4JHQFToJbR4y9ynZF3LUfW
X-Received: by 2002:a05:6830:1315:b0:6ef:9159:8915 with SMTP id 46e09a7af769-6f8d0b44f56mr12173688a34.37.1716899355158;
        Tue, 28 May 2024 05:29:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1716899355; cv=none;
        d=google.com; s=arc-20160816;
        b=s5DKGq1Mz3GtnVc69DWhOkMAP9C+6iUGAp/SUP9jCVcb/PHwlVraaoejBeaBSRnNGP
         OGEa49C0BBk4TVO3n9jEAUUmQLftlcjAHsoLkjvnaGI+kbII8PYNNpoB5XGOeRYdDLN1
         9G6O7us2Y7JVssbl+uSU5d/8FJvrfCAxC35v/78BANpGZZT9wofK5NfSl7nB4r2rJ5ia
         AptOIBuqo6A1Nfmn1iKWW3DwJg7BNbVFT+PKGgI1BN7smvipDpG0Uuzi/H9+iESsK/ce
         53ikZA8VZj2ZxWR5bYGA1hG0HJQ/+6PAQRlEglre/useF5/cv2JWE1xO+T+g5+bkyEDU
         MR2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=ZRWgvb+4gkYPGkIV8FKckvdCMeBsk/D0kJeBsTCwWME=;
        fh=zyieeRJ4xBYNdNyPD2G2Jfm2N4I6ubdUUME4/5orgaY=;
        b=CXVqS5JWdPlbD/Bmdwz1Kqg6W1DkFvk2N31KxaoAihkl5cNZqRG36eatqgh6vtJU+t
         QBSnTp9ZKMLPjKz1exOb0h2Yzkh5wphvNS4BLKtj+PpJdVww6LjzlNguco+hx/OqB2q7
         Gq9QfQMrOgLcIPjPjihKX2sZlNqTE5URe/Mkko98BSRydAhuaNbF9/9ZIUFHKDwocRf5
         wtgnP6QIXrIphVY8lKmXZObvR79EMCFS7ygojjcYAOX+mi+vxmQpcoWdn0VuOHNomV/N
         6A17RCGOooY3KykaBmsOCBA2YOtE9K2V925UJb6RRz8yg+Eau6MlRgu22PwMHTxIFrC+
         T2oA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=RnFmGJDK;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-43fb18c75bfsi113337821cf.672.2024.05.28.05.29.14
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 28 May 2024 05:29:15 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=RnFmGJDK;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sBvwh-00062w-Qk; Tue, 28 May 2024 08:28:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1sBvwf-00062T-Qm
 for qemu-arm@nongnu.org; Tue, 28 May 2024 08:28:50 -0400
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1sBvwW-0008Ql-Rm
 for qemu-arm@nongnu.org; Tue, 28 May 2024 08:28:49 -0400
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-42120e3911eso2200005e9.0
 for <qemu-arm@nongnu.org>; Tue, 28 May 2024 05:28:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1716899314; x=1717504114; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=ZRWgvb+4gkYPGkIV8FKckvdCMeBsk/D0kJeBsTCwWME=;
 b=RnFmGJDKMcdd+9YSoX0qvbr/kGxpfua15hW/5cYoVUb8rw1N6LXLlHZnO38pYjpIzS
 HDQYaQaaHy+1KRklT8/12HX6z8oiKBDQEo5057uWAxD7bLGDmtZkKKirhRO6z1ZCznxm
 pV2DDmku3N0AiAoa/Y8KyNUeJAwcEESxqodU5fRBdv2ZrbHe87CxbP+C/3BUL9rvWrYY
 qPKCbTlG9zRR3LbU30FSnMAbtIfit5ftfAW1n/nzqvU4thGd/uu22XroDo4YwKhLjAei
 aOYtAzIEs9ifQVYEfIos/kG2vCgz8V6rU1sYpbXvypAnALNMor5lQ8V1abjkU2G8iFRD
 DySQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1716899314; x=1717504114;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ZRWgvb+4gkYPGkIV8FKckvdCMeBsk/D0kJeBsTCwWME=;
 b=jDKGiqT0eJkF5QGJRX2HmhYdm8vEz0DWF9blQi0BTL5wlVfew6Oh8BndnYdfvQXa3x
 RBqj85Jh4caIGahJVFu6NNzR0MOEJh2YTOOdX/VbV1+EipoYeO9ipEYKTeznYT/C6RIG
 /y9sGYOrIoEx3fPetaSE+kYreArFHBBbPlnMJB8zsg5PTFNvDbn0gjj8P6yTup3nbZEm
 ZOVzH2sV+5qC0XJWYwLCCBa5bpQLvqqB3wswpxnMtnDwIIVaI8o/lJUmmN8sxork4oVr
 xEZVQ0YexYi79Qystak2ePPPhDb4xk8ACWliJARPQvNGb0erc+NyLFiDjtnTiytqqh6Q
 EQ/w==
X-Forwarded-Encrypted: i=1;
 AJvYcCU+6cCkho7nRTWamP/EYkRHEbEyzlgkhinChssjTj+O9mMDtEZOQ8mdebH5SrBOZ8Iq/Sai6bjjjBXHkjp8Uqi8mw6t
X-Gm-Message-State: AOJu0Yxk2W9L175LLa0szpn2OoQfXb6NsfJcfpWPXrgV0IwcU6Gf9ekn
 3URTFPStst/WAsdEXrYXa7DcsQCoMVBkc+1qpqS5Zz6sMNJuOEWMZX9T97u1v2+S5Vs2mWoA69L
 9fYxUKPbMeM+kOTsx32GyrRerRGMrp7SzllLHpq32oRXW6IHF
X-Received: by 2002:a50:950f:0:b0:56d:fca8:d209 with SMTP id
 4fb4d7f45d1cf-5785195c33emr8569608a12.10.1716898942747; Tue, 28 May 2024
 05:22:22 -0700 (PDT)
MIME-Version: 1.0
References: <20240524232121.284515-1-richard.henderson@linaro.org>
 <20240524232121.284515-22-richard.henderson@linaro.org>
In-Reply-To: <20240524232121.284515-22-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 28 May 2024 13:22:11 +0100
Message-ID: <CAFEAcA_k3S0mJntmJXH=48CreZJzFUvNspCyEDp4O-qEwcucXQ@mail.gmail.com>
Subject: Re: [PATCH v2 21/67] target/arm: Introduce vfp_load_reg16
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x329.google.com
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
X-TUID: /J8RQUVKnkft

On Sat, 25 May 2024 at 00:23, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Load and zero-extend float16 into a TCGv_i32 before
> all scalar operations.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
