Received: by 2002:a19:ee0a:0:0:0:0:0 with SMTP id g10csp724305lfb;
        Wed, 11 Nov 2020 11:59:32 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxsZF8rc1IweEnuhDDQ/OCf3wYjfhvT+eeEC9telQ5HHp3Ky2JilguRQhnfncoMDDohOh3i
X-Received: by 2002:a25:af8c:: with SMTP id g12mr34558386ybh.511.1605124772729;
        Wed, 11 Nov 2020 11:59:32 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1605124772; cv=none;
        d=google.com; s=arc-20160816;
        b=p7qGSufSzzeGyOjyeIA8eWsTgae/eOsR1X6VpmBIM3/D4YK7DSoBz0ELdTLVSYhmD4
         1b8fa6SXmfNJUgbGI4r8KIeQqOuoltASORhXIOgZZScJv9B1xmMoTgtAlakmQ9lsHuxt
         Brm+2xkFn3VXZBVqijga2DMvJVI6+1ak5UcgX4mngXwdjShVCzuJhB3zvLf/4HH+AH9W
         x5eSdlVMcncyX713ePqMXi4iCb7j/LW3mbMXNzHSdYy7EPm59h1AZdC76DtfPVegU/48
         tnhEzUhPqJdPZOUZ1e4yo1fzL24pNSnAFO9tKNxrpq4qruxTJPmPm6ZFr0u+UrdIQnVQ
         c74w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=7A1Rl/rV2uCmB7Lrj5LwXqDoZGGvupBU/KDhtULmBlM=;
        b=DyswUuGE3u0s9/+TG/kIIeuIRlgL1CHMXze6lHCFaaOa3nPil0MdAZ3nWB4lg+oVRZ
         co5BFxwr3wntee6enrdYIuupjQB1ghNwXairemIxIYbc1lLsKGVvSZS08yVD1DBjusfY
         1VY5EDssKTDu/EycjA+HM5FdhDdAllmuQJQ9YzhIshLh0aFg0LHGUnz9JkpcKIPRLGbG
         72bvTXfwRYaXe0SA11BWVYgRJTFiBinKQww/I8IKNm+l4+kwGTaChTD56HfN58URcScc
         shtSxXCM4lgG+4ddEGw/IxVN1l6xwjKWuOwGej96xwRq8lKKgMsmJNyb3B0I7HE5PFhm
         Wkgw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=DoHPMKoR;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id q77si2852702ybq.221.2020.11.11.11.59.32
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 11 Nov 2020 11:59:32 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=DoHPMKoR;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:38060 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kcwHE-0002w5-4j
	for alex.bennee@linaro.org; Wed, 11 Nov 2020 14:59:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39598)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kcwH0-0002uT-QP
 for qemu-arm@nongnu.org; Wed, 11 Nov 2020 14:59:18 -0500
Received: from mail-ej1-x641.google.com ([2a00:1450:4864:20::641]:38350)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kcwGz-0008OP-6K
 for qemu-arm@nongnu.org; Wed, 11 Nov 2020 14:59:18 -0500
Received: by mail-ej1-x641.google.com with SMTP id za3so4436000ejb.5
 for <qemu-arm@nongnu.org>; Wed, 11 Nov 2020 11:59:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=7A1Rl/rV2uCmB7Lrj5LwXqDoZGGvupBU/KDhtULmBlM=;
 b=DoHPMKoR9LBVbKE5K9+6Db6K0FDy2xkxespiiO8tAzgLGkwnVl//z16LES/jRvzHhy
 /RQyAx4FqzEj7rVtbI+puHEl5kDulFdImpQl2v5g28AGzDysPevqKumPHYr4beI9yiHV
 A4VQVxJs7bx5Bh0aIRuL7wCd+kyEAlycwmUiXJz0xZpL6vD4S0ZZ8wSxDqEeiFWctRWR
 /WjvtZ6yowzcvJaVl3LY6pYf0Xx54W2OM8xg8LOPp9EmrXuP+sxpV51ej4bG9nVUnt5m
 uwpCnsRXL/HoDT62Fe7a69xVjDQFG3ZUxkoQjx5vYThFWcNXCov5j8WS+QJvJj6hoR4A
 Y+XA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=7A1Rl/rV2uCmB7Lrj5LwXqDoZGGvupBU/KDhtULmBlM=;
 b=M1a+agmUWnnDSr2D11dBEi5mQn6LxB96FJHGtTFQzOs0BbYumbnmdlxMd1yoK2r0cj
 3B6YupsNeenLymgq7PziRDxBZ8IU53++e33+mulFW7ZCX6FjUGykS8S0h79whNpk6W+u
 aGdJ71bCQH+0/LaKohFuJD+LmhkfMvo4cRXBcIPRmyZZFZKObEvUtk6ePO34thSf5kGz
 j1G//38GpF1vxaClUcDYFK6OYhaJO9u2uUhIPIsdxgfFrsWgFzq2NmtBau/xHXZraOVB
 C9/hGnsskqgYj9JOvmFFQcB872/Lfj3kT15yiUT1jCZ7ZhGwfEdvSK0Njq6Gb6lDKfVU
 tCBg==
X-Gm-Message-State: AOAM532aDatjHP+UbCy6oZat1rEKhamkVNtdUlFz2ZmgZSVYzHbiAube
 BN2D6seHIERKXCyFMrmo+pvlywfQ8o32eHgjxKlZEA==
X-Received: by 2002:a17:906:af8c:: with SMTP id
 mj12mr25969140ejb.85.1605124755573; 
 Wed, 11 Nov 2020 11:59:15 -0800 (PST)
MIME-Version: 1.0
References: <20201111183823.283752-1-ehabkost@redhat.com>
 <20201111183823.283752-2-ehabkost@redhat.com>
In-Reply-To: <20201111183823.283752-2-ehabkost@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 11 Nov 2020 19:59:04 +0000
Message-ID: <CAFEAcA-VSwkO06HskbQMgcTgGwG5++MTasn179KArXaYo4WdDA@mail.gmail.com>
Subject: Re: [PATCH v2 01/12] vexpress: Register "secure" as class property
To: Eduardo Habkost <ehabkost@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::641;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x641.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: John Snow <jsnow@redhat.com>, qemu-arm <qemu-arm@nongnu.org>,
 "Daniel P. Berrange" <berrange@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: N+42RH3y2lGQ

On Wed, 11 Nov 2020 at 18:38, Eduardo Habkost <ehabkost@redhat.com> wrote:
>
> Class properties make QOM introspection simpler and easier, as
> they don't require an object to be instantiated.
>
> Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
> ---
> Cc: Peter Maydell <peter.maydell@linaro.org>
> Cc: qemu-arm@nongnu.org
> Cc: qemu-devel@nongnu.org
> ---


Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
