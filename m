Received: by 2002:a5d:4850:0:0:0:0:0 with SMTP id n16csp856743wrs;
        Fri, 23 Aug 2019 10:35:58 -0700 (PDT)
X-Google-Smtp-Source: APXvYqw6ElXJlWKR5EXJRbVUAmJ/j2nlIpSFEJisuyEhzqy/KucBg/MtBV4tcm8wsopchdy3Muia
X-Received: by 2002:aa7:ca02:: with SMTP id y2mr5715982eds.205.1566581758620;
        Fri, 23 Aug 2019 10:35:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1566581758; cv=none;
        d=google.com; s=arc-20160816;
        b=H4GE0xUuxs8vy4PR7OG3EqUNcLWfYA5Hzr/iXreTm/16qKvsm9wtSEBe2aKTyQKQOz
         TD3bHpSdQHCAe1Qnyxapm4N/dZ4z+B3RT1DI22ajVj7Le+TtdrNqWpCjViGQd4yuQwxk
         aHZCYsBddCjFa7/1P+UcJj+sRbdIZrM4gGj1o8Z8m4QdT8UXA0ugX2gav7GNgB0qXhy2
         rXAeRjYDFOq62Lu6l8L3/cg79z5Y3/CjyZUMbV/ftjC3AMD2W84dB7sInYgkB52PaCFO
         lDbI/M+egQIjB8mqi5Xjz+F669exQo4xumKv1lrjGszE/2NVr0HsbDvIvPDiVDDhwxP3
         NLvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=1WwUpIyiIJfVQIp4aZAQTCnturoa3nri/sQ8XonAXU8=;
        b=lxMTyAk1apYr5MbMKBkEStBjBXGb3LSqzGJrrwY/k5k0UB0/S33cmyoVV7Ayo0MX5U
         18ygENdduQecG49T/W6zh8+5w3SX7+n+UAY1B4mqVVq9tyRwpqP8UGqfpYwwe1ZKPCJ8
         64rRZaROw1OOXKVw1ql0DXvSSx2qI63D/eYgRiVZTXWkCquHVQ5Zp1h0yx8UOszL8htD
         3OHa3LdOkzDGV8sxaYZoiRSQdJaBM95oGdNXY2unrVtbafhTOVStQm+OwblOGFiNjtso
         MNX9Pw5DAnZECZrVZmlO7uS+XvEZHtZCm0BuXMy1Dv1QfheLOjHQ4U2S7B42yFuyvgpj
         INgQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=nAgojLgS;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id p50si2152546eda.338.2019.08.23.10.35.58
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 23 Aug 2019 10:35:58 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=nAgojLgS;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:60296 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1i1DTh-0002Lz-4X
	for alex.bennee@linaro.org; Fri, 23 Aug 2019 13:35:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58920)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1i1DPh-0007Vn-Oa
 for qemu-arm@nongnu.org; Fri, 23 Aug 2019 13:31:50 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1i1DPg-0005k1-LK
 for qemu-arm@nongnu.org; Fri, 23 Aug 2019 13:31:49 -0400
Received: from mail-oi1-x244.google.com ([2607:f8b0:4864:20::244]:40996)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1i1DPg-0005jY-Fz
 for qemu-arm@nongnu.org; Fri, 23 Aug 2019 13:31:48 -0400
Received: by mail-oi1-x244.google.com with SMTP id g7so7596050oia.8
 for <qemu-arm@nongnu.org>; Fri, 23 Aug 2019 10:31:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=1WwUpIyiIJfVQIp4aZAQTCnturoa3nri/sQ8XonAXU8=;
 b=nAgojLgSwMLqL4BP4tkh5A8dW4tJSYpWPqXoKHrrI9cJK4oH8VPONoW7hK7UMg8LTO
 CNMFTIL2S+NAOMFOhnzq/RnNcQg+tWFqK9iL1JZ4Cql53m0X5LqvDjDnD9MpRRFLeu1R
 5wpFqt9qgJfuxA6wJh6H/uBHhlZOmoAISYMFBZ+rThM+Xpi00MxkUZYmsjmS6xZm+T8s
 k8hWOc/ETDe2jU9kVUMtOT7Tj1zz6h8vmrhtrfY14btguR8ZPnerypVQJi3i2L1LSVMQ
 4W8gcOdMntEw6Q1stslm9mFCbsXF0AikRZlfBqVHZQSaaugDvm6clqnFi3CTO+pHZWI1
 A1Eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=1WwUpIyiIJfVQIp4aZAQTCnturoa3nri/sQ8XonAXU8=;
 b=NFvvaJ+/3OizbvQxnE89BUl+wxbz5ySIQRN5JEnp9GWl3oj5uzQQoGFaTqtHdtZh0b
 x5qDGlrspRruaJFuaSg5+5EF1OBqa0FmeUDvLxdJXY+R1kCNOWiYVEsvHRLXNaQRUr/Y
 jtQOhGmK3AnYNq8N09BOZ+EkHrS+N+bhAjfwRjRND2sn9cC1dZEyqmCqSxIHg4XEoEfU
 75YJZ3Tv26Z1k3YZ3bye/PqsJ6hiuWKwt/fTSS5SKLmqDuFxkpMYPnws6yZuZApq+ZBI
 PbGLHEMnn+fFkrI2aMJw/IyC5IRoZ+hcyvs+E0joH++3V9gXjgVEMLHFkIx1mQxUiuYa
 0lqQ==
X-Gm-Message-State: APjAAAXoGDFfemwHnWc+gL9+J6Q2lT8mOSqezP/BEH+FIXFtB1RAPyo+
 Nj7mlbkOI+oauFpGimu0fR8eAZsk8Xyj3PG9mRjCmA==
X-Received: by 2002:aca:4b86:: with SMTP id y128mr3968587oia.163.1566581507620; 
 Fri, 23 Aug 2019 10:31:47 -0700 (PDT)
MIME-Version: 1.0
References: <20190819213755.26175-1-richard.henderson@linaro.org>
 <20190819213755.26175-31-richard.henderson@linaro.org>
In-Reply-To: <20190819213755.26175-31-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 23 Aug 2019 18:31:36 +0100
Message-ID: <CAFEAcA_NqFk9Xpmxk_rG8KxUYQeV7gSVp2JAwHRt4Q4h1jJe4g@mail.gmail.com>
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::244
Subject: Re: [Qemu-arm] [PATCH v2 30/68] target/arm: Diagnose base == pc for
 LDM/STM
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 223JTAH5S+qx

On Mon, 19 Aug 2019 at 22:38, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> We have been using store_reg and not store_reg_for_load when writing
> back a loaded value into the base register.  At first glance this is
> incorrect when base == pc, however that case is UNPREDICTABLE.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
