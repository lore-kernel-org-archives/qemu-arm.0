Received: by 2002:a17:906:eec5:b0:a5d:17e5:aef9 with SMTP id wu5csp1472537ejb;
        Mon, 20 May 2024 07:15:53 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXJZAIw0N5MjiJLvZp019Xf1WRkPxpsQLywGNRpKmQTUVmY5DVi2tPCJ5f/4VP7t/w34G/t8Wu3r4J8BB3h4SbCL5NZXkh5
X-Google-Smtp-Source: AGHT+IHhuxleKHOdxQmzyEfnkgemItkR0kC7FsAB8yzaGFgiishu9yVqs+dkwrYjPhgfxnmWfN1A
X-Received: by 2002:a05:6102:b0e:b0:486:2c0:1d7d with SMTP id ada2fe7eead31-48602c02adcmr9751658137.9.1716214553056;
        Mon, 20 May 2024 07:15:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1716214553; cv=none;
        d=google.com; s=arc-20160816;
        b=SazgOXq1E69vdiC3So9NCQ3LjWqBpws2u4HRWKP8TaAfwMwDkaPH7sV49tmsaEgYo7
         8CwBaOC5sLOV+9a6yfldE1TPjLB5Dmzqu2Nx7XnfaEt/mnywIqwa5hpUXSlYlDxPL4Qb
         sqZhb4gIRaC0ScaT/pVpwAxUPNdL3ryk1qG7orgUUtgmfRTbHIjXaVnYsP2Co/uq0Phe
         s0PhIS7rM80skQSv3uf8DxljF/0DJsjsWwvVuzXvWeNuTb2b4dmx6qNhKEkoVqVfTy9+
         g2YnTXA3aSZ5STLQljZJkwAj65KKrPk9jbjI6WkldRvk9MlZuNrXU4wotqYNCjbMeyuV
         +O9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=ALlY3T5mHqa0dpyeVD3Hy5ttQjKpBHU5EMFvaAEy0dc=;
        fh=DQ8hLhx9NdM9JW5Rf9DK+sU4BVksDkWa6qlkfTKhvto=;
        b=sou0ccZH7aK05YQvxo4bqQyRMRDUjvXCd2Hq5X0CSjjZEucN5oBAv7bI3Z5u3KMp91
         Vt4EI54SOwgMQhyISI5o9WYRezJu6TLriZsfLSynkEa25g/DlKus1L8XHM0tWuj+Udm+
         e3JUNxGdMTn3R3uCgRVAy9wEKN69DcWcm4LfYMTabqglciY8NCoazq0Fxwj8Raw7p3+7
         efnQrpiYurYVH+GSfmutuJzaHcPYl3sz/qArq6mB+g8BLOYXZqAJebzmgSYu/Oxj2zNq
         w85yzeD02O8t6QWCf0TuIKtV/BCnSaatkrmMbP2981ApEHsduohO/1fBPnn+eli3w3un
         eEmw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=FLKyk7Fy;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ada2fe7eead31-488d6ba0b60si510884137.43.2024.05.20.07.15.52
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 20 May 2024 07:15:53 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=FLKyk7Fy;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1s93no-0002zQ-Db; Mon, 20 May 2024 10:15:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1s93nn-0002yy-4y
 for qemu-arm@nongnu.org; Mon, 20 May 2024 10:15:47 -0400
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1s93nj-0003i9-LP
 for qemu-arm@nongnu.org; Mon, 20 May 2024 10:15:45 -0400
Received: by mail-ed1-x52c.google.com with SMTP id
 4fb4d7f45d1cf-572e8028e0cso6933625a12.3
 for <qemu-arm@nongnu.org>; Mon, 20 May 2024 07:15:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1716214541; x=1716819341; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=ALlY3T5mHqa0dpyeVD3Hy5ttQjKpBHU5EMFvaAEy0dc=;
 b=FLKyk7Fy6oXKJZddCUEvZSXb/FB+70koGrm+s4oXbGG+2LtOlgzA97AimGEHBtnxXN
 vZ9WV7I+yplSmTVcYG1x7WrjyG9n/SihvJaMFw01bKkdopQKpj/Vnrd9oKics+grUK0I
 2OmjeKJDiLAYv3tvR4x9MrcL0UTBOJ047f5sdeNTxl26/FfBIh7HY0G4UQfvW8E2p2JG
 /a4C7kyJPaaBDEAYSdnWLrANETe1YLjPWi+jRosw+Dj0OJUa8hXIZG21vQNGYYNZf/je
 eevI2/B8XQ8IRu2M1YLCx2eqcbtpVOuN/zlHPOSyKV0lHUwkBO8O+DRzHOWj2J3ZdilP
 cBhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1716214541; x=1716819341;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ALlY3T5mHqa0dpyeVD3Hy5ttQjKpBHU5EMFvaAEy0dc=;
 b=Sq5ge/w++un+w8X6E22SzdbxA/O2tZPxCiHwJ2IJxWCK2/oPKFATSsbv4NnH8KmTY/
 NQnOJBMDNileJ1xYsOhYZYC501/g3o4barjOCIlJ6rP3x6KlU6eFUdFNZuF41tWtVQ+7
 NCJiJ3GLz+ittRpjhw3tNCEsxX218uDiO/l5zZ4P6RKQOBUBzJ2KpuE7LTWdvda5ZKvO
 6L+mnmtq3KDveALQG00P6Tdi9l9gHO32itaPLLsQhUmnbdjXtvQu2hbhEL8NhiGn2B79
 5Ds06/dGGpIoAaea+ZJYeECtnIJRDseb7hhhg/cB0YAZcGOTk6ayEslsOwPQjCCgmsKf
 V6jg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUff+VAKFq+UTDE6ZIDaoMSjLzDkvLDb7Bp4BVBs7EBsye1HzSfu858MC12gmsF69wK53mygkaGLXiRCSUsQglwVZxI
X-Gm-Message-State: AOJu0Yxfg8c1rnYGzcCscsJCxwjbzThq6Iy8NH7WY9u4LnKxWXicj3Ze
 v7i9kM6c3xh7VwDGq8zXo0uw2ekUt4jM8AD9OpoGWcRa/LNZqx8boRpHBN6cogh351FoPO1QDlM
 5F0/N3MO8Cus50BhUq4wjt6P9df3tyWLZWS6D/w==
X-Received: by 2002:a50:d5dc:0:b0:56e:60d:9b16 with SMTP id
 4fb4d7f45d1cf-5734d5974e6mr19437342a12.6.1716214540992; Mon, 20 May 2024
 07:15:40 -0700 (PDT)
MIME-Version: 1.0
References: <20240512085716.222326-1-rayhan.faizel@gmail.com>
In-Reply-To: <20240512085716.222326-1-rayhan.faizel@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 20 May 2024 15:15:29 +0100
Message-ID: <CAFEAcA_Aj49nB0HqteWpgRi83ZvVHTdUwma4PE4DDhhodB0omg@mail.gmail.com>
Subject: Re: [PATCH] docs/system: Remove ADC from raspi documentation
To: Rayhan Faizel <rayhan.faizel@gmail.com>
Cc: qemu-devel@nongnu.org, qemu-trivial@nongnu.org, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 "open list:Raspberry Pi" <qemu-arm@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52c;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52c.google.com
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
X-TUID: 3kk4IaFRHO6g

On Sun, 12 May 2024 at 10:00, Rayhan Faizel <rayhan.faizel@gmail.com> wrote:
>
> None of the RPi boards have ADC on-board. In real life, an external ADC chip
> is required to operate on analog signals.
>
> Signed-off-by: Rayhan Faizel <rayhan.faizel@gmail.com>



Applied to target-arm.next, thanks.

-- PMM
