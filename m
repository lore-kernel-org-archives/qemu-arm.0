Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp2477504lfm;
        Tue, 16 Jun 2020 03:13:59 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw3z2nyhbhQ6px7Y55PgYCHULtHEfWBVTADpIwPU87iHDq9RB4nLxM44vlbQfJorfq9qd1R
X-Received: by 2002:a25:3bca:: with SMTP id i193mr2873611yba.327.1592302439310;
        Tue, 16 Jun 2020 03:13:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1592302439; cv=none;
        d=google.com; s=arc-20160816;
        b=R6bL+TU9Ix3JuN8cboVIF639JcLZNDWNw1iN0HknKsYXTsw4Oo4bBe9EYfulTRc62Z
         1uly7wtfK8+GT54XiJ9oHQ8KhRnTGheHFa0bRNAHeIZNUmRAS/5Q+2quxbTxIpFYssfN
         QturRPfLDWPTfda2Ixzvig7HDL7pzDIGrlScJt7ycYMoDx82sU6RI/qAvDz/y8A2rCRX
         pjP6YPowVdSkstTejKnK8Gn/HpMNWOiKT5JwYqBbiaw8Z5DeqNVWtlx3UtnTovsP14Dd
         c7qpJFIX+KCJHiQUiHWJ8eRUBJNH8rzcAFvowEDpAZzTq5QGVryzCPmb6ZPnIDfhL4Jn
         A25A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=Iqf+E7Lc/C/hU/fg4UjLMNDzGzNqvCjv2hStizLZDG4=;
        b=pPJwkFgdPgq/uiWdrnMDrGT/HF9DfI2T/zXbWdo8fMzQoN94VrPqbbSkjA3SnbmTN6
         hgSLAPN0oc7B+2GlW9mdNMTl210AfR6JN4sG15Bf6glJOtps0UtRt7kOaxk9L0Yk/Vg2
         7/hrNTCwt05UWI6KVel7wmvdQyhd10OD8KFLEKOOHy0WE2yPEBaMbayRnnhcnS8hML7F
         w8dAubNRfkmyLtALK5/6TfqiNfK0/9OWMEO33NUlPsP+SQkLT8nJhwt9UiNMv0vnN961
         s8+kYcIsOTUO9FsA9OTgGuqTznSvnLMxNrG/d+VuoGy5ZbICHPq8BQ7UeO7+d/SMSo45
         DdPQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=UN1YM6y5;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c84si15558990ybf.33.2020.06.16.03.13.59
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 16 Jun 2020 03:13:59 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=UN1YM6y5;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:41206 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jl8bO-0006Tf-L1
	for alex.bennee@linaro.org; Tue, 16 Jun 2020 06:13:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54782)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jl8bG-0006Rp-2u
 for qemu-arm@nongnu.org; Tue, 16 Jun 2020 06:13:50 -0400
Received: from mail-ot1-x343.google.com ([2607:f8b0:4864:20::343]:36102)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jl8bD-0006hw-11
 for qemu-arm@nongnu.org; Tue, 16 Jun 2020 06:13:48 -0400
Received: by mail-ot1-x343.google.com with SMTP id 97so15526345otg.3
 for <qemu-arm@nongnu.org>; Tue, 16 Jun 2020 03:13:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=Iqf+E7Lc/C/hU/fg4UjLMNDzGzNqvCjv2hStizLZDG4=;
 b=UN1YM6y5gj69VwVeZ3YM8AQzKqEeObAoOgcyqjQnHktoI5EQ7AM8HdFG150pE3D9ht
 a15Nb+IaH7VYpNo7BgUqA9J7iekeT+aVxHkfch6OoNFOSTodF8+LzYrX1rcz7CwdF60L
 RiZYJar5PeRDS5L/pL+2/UIoCqDEL9lr5nSwCFWvvMGYJ0t2ycXmEHJPik4h67tSmmbZ
 M93+2R9ip2nfW67tYyNZKuzdxG443tymmPHIw4eVMcqyOCA9HVPQGnQhRW/tbMHjNE88
 vLy59CgZ3H04PMvPUCGPC5YsvGkZxTbT90bnOOMnFaHtrQ/mXikRvQB6k8lYWvv1u35n
 B1wQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=Iqf+E7Lc/C/hU/fg4UjLMNDzGzNqvCjv2hStizLZDG4=;
 b=jG6IfYwTHL/V1HyBuoB5Nz8CeulKGye78YV6Wk9lADYmbg7BipZyf6FKAlfep2Abj8
 JkCw+WEHgchLVb5Lz0k/weBRNwEsZrpkvGW89re3kSAy5kpGke6OIrA/aiV3FqHLk3dY
 tj1qTsbSIxBKnQqZG3uDzH20HEbngy+UY+gA7K1hC9Zu+AE+5kExxi8jEfYBOL6sO7s6
 S11pGLKWp8+bN5A3PJA9iqms7PijzXvAYCGkDlcAX5PE7I+FgV02wGTzvoGNncwDK1oq
 fUe/88MYvoRyyXybdeVSNeDBJv9UOUqnFxmm9ja3W/2/drfGmM0onSF8nRxxN0C2EKP5
 HdtA==
X-Gm-Message-State: AOAM530RM9Qsp80q5HbViEXy+jNG2WZDhWy7UNw0s67SvdJEnjemjQ9+
 LCwxTy9INyo1lblGfAbmMh3FCSlrdWwLjdNMkIIQ5w==
X-Received: by 2002:a05:6830:18da:: with SMTP id
 v26mr1842558ote.135.1592302425772; 
 Tue, 16 Jun 2020 03:13:45 -0700 (PDT)
MIME-Version: 1.0
References: <20200616063157.16389-1-f4bug@amsat.org>
 <20200616063157.16389-2-f4bug@amsat.org>
In-Reply-To: <20200616063157.16389-2-f4bug@amsat.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 16 Jun 2020 11:13:34 +0100
Message-ID: <CAFEAcA-JwBo-A9go4sHG=Gn-+fBkWBicnGNXJX0FJYwZJiuJGA@mail.gmail.com>
Subject: Re: [PATCH 1/7] hw/arm/mps2: Rename CMSDK AHB peripheral region
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::343;
 envelope-from=peter.maydell@linaro.org; helo=mail-ot1-x343.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: Esteban Bosse <estebanbosse@gmail.com>,
 Joaquin de Andres <me@xcancerberox.com.ar>, qemu-arm <qemu-arm@nongnu.org>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 3aEJM25qEDXw

On Tue, 16 Jun 2020 at 07:32, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>=
 wrote:
>
> To differenciate with the CMSDK APB peripheral region,
> rename this region 'CMSDK AHB peripheral region'.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
