Received: by 2002:adf:ef42:0:0:0:0:0 with SMTP id c2csp1946634wrp;
        Thu, 19 Sep 2019 21:56:00 -0700 (PDT)
X-Google-Smtp-Source: APXvYqyjgRuJFxcE9LXlwlxwm7MRijhLm1rdRBu891kptkAyowQ524r7m4lrbUckW/Yx1f154D5F
X-Received: by 2002:a37:8104:: with SMTP id c4mr1801417qkd.367.1568955360135;
        Thu, 19 Sep 2019 21:56:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1568955360; cv=none;
        d=google.com; s=arc-20160816;
        b=FNhuZjaT4R6bjNICA8hai8d5bJfI7Lufeja6Vk2rnl5ncaYun29aVywmA6uXGKjMCT
         Yc0A6M+KIGyiB1C9F2gwH85IxVzmohDzz0orDRgLR6VaIkYtOAw1B0tRoWDPBpbL0+o8
         JH4h0md5xl8zu3uBmA+6DLA9BFz8pHhIMr/wB/9LfLZR+LG0Dt1lHbBhAGE9fW9P6ums
         M9sOU4/kJL/mNKJg+iVSdPsOzcN6WR9g7AajpudvsaGcmHiYvSrWuYIVGtkRIlwIY3Y9
         KIrxflOOEvuLgFdG2kHdABL/VvplQmO49Uw/zUh8vL/8heXhTDR6zYZgdlsNuTKn6g6N
         saog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=/giK7s/qcGhdKTojWdVT7kLrXHw/1PpReGqg19nsVYo=;
        b=gxDA6nkfZZVoHd1bb0NtqrrilC11Ogi85WNDY8DM6e27boda4UvzzDMFJr+5zOJYnd
         GrQLdQ6gJoneFpRhwGLhF88+gQhmrkTTeBpOgdkaGI/nqzZ6+POq4WKbfJ5yUUaHbdCe
         BgcWTxOvSGhAZKDXQX6R3T3xst2kM6tKxCkupmRNdI8dtWdbeKqC0H4Aqvrm89DSDLce
         fQiO0qaBat6FWoE1ZW4UE0NQABThVFY5Fpdf9DZFIP0g7WqRcrElJrTwJbiw1DWKeTAn
         VQ+wmbD7GhQfoE26Ww6p8cndJfo6LWVgYgwPJYKDzbpZinYOUpl29KEGQf5nFl2IMJr3
         WMIg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@jms.id.au header.s=google header.b=cBS0kAN4;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 28si1342262qkb.81.2019.09.19.21.56.00
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 19 Sep 2019 21:56:00 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@jms.id.au header.s=google header.b=cBS0kAN4;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:51114 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iBAxb-0007N9-Cx
	for alex.bennee@linaro.org; Fri, 20 Sep 2019 00:55:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36966)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <joel.stan@gmail.com>) id 1iBAwZ-0006vr-47
 for qemu-arm@nongnu.org; Fri, 20 Sep 2019 00:54:57 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <joel.stan@gmail.com>) id 1iBAq4-000899-Qz
 for qemu-arm@nongnu.org; Fri, 20 Sep 2019 00:48:13 -0400
Received: from mail-qt1-x842.google.com ([2607:f8b0:4864:20::842]:41762)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <joel.stan@gmail.com>)
 id 1iBAq4-000894-Na; Fri, 20 Sep 2019 00:48:12 -0400
Received: by mail-qt1-x842.google.com with SMTP id x4so7194188qtq.8;
 Thu, 19 Sep 2019 21:48:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=/giK7s/qcGhdKTojWdVT7kLrXHw/1PpReGqg19nsVYo=;
 b=cBS0kAN4NzKv/lCmsd6dmK3DbcH+y3Mc7vyn/LCVnPfah4pIzZBOlGnHp54BWBXVaW
 9oEs1x+9zlEYA1P3HaEVyC7EzxHTjADzFTzwkg5ffcFizu461r+okN3kMsODIgBXh+f0
 b5HHvnnLo8LQelKqmI6ve8KFnr7PwKnAk25PM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=/giK7s/qcGhdKTojWdVT7kLrXHw/1PpReGqg19nsVYo=;
 b=Bst5mF9oRZkd/WMWuB+n+zYwdjfjYHv8IS6QAR7KsSAzWpUaP+X2IK+jLVVzyT5x8F
 nEZIX2y7IJoQuRthV411bSM/9ggZ9hEKjJ9oa7C0lR19LHIXjxmRKyVmWb3CADOIrNku
 cVDxiE8nq0ADiBoklz3kmFJHh6bFs9WYcDzTGU9myYjxbL2AD56mDfdgA80ERuoDb+Wy
 6/HXzX2WjyoEqh/Q1HZJdLWc6BHXhG/h+CN45/QvCQysoJ2L2HrYfW4RWRaMZBWu7FSx
 N/PMdQEc66NSB92LnogptUcDw7n/e1FtvxroYQIDGt2CT+pXhHryhSm0HrSzGd6Z9ER9
 C6vQ==
X-Gm-Message-State: APjAAAVx1mx7z5Tnz47dTuXNe0vhxm4n4LA8fGRyfv3K59QPoYyx7FQ3
 tAsNmRJ8MJ8uUuN7RcxxW6xYb/FoESqPN6dVi+E=
X-Received: by 2002:ad4:55b2:: with SMTP id f18mr11583990qvx.16.1568954892112; 
 Thu, 19 Sep 2019 21:48:12 -0700 (PDT)
MIME-Version: 1.0
References: <20190919055002.6729-1-clg@kaod.org>
 <20190919055002.6729-16-clg@kaod.org>
In-Reply-To: <20190919055002.6729-16-clg@kaod.org>
From: Joel Stanley <joel@jms.id.au>
Date: Fri, 20 Sep 2019 04:48:00 +0000
Message-ID: <CACPK8XeJpE9YoA=d-j4kHxA6Ffn6Me782OJBqtSHrx=YfHbioA@mail.gmail.com>
Subject: Re: [PATCH 15/21] aspeed/i2c: Add AST2600 support
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::842
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
Cc: Andrew Jeffery <andrew@aj.id.au>, Peter Maydell <peter.maydell@linaro.org>,
 qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: iVnIaUfa+6vo

On Thu, 19 Sep 2019 at 05:51, C=C3=A9dric Le Goater <clg@kaod.org> wrote:
>
> The I2C controller of the AST2400 and AST2500 SoCs have one IRQ shared
> by all I2C busses. The AST2600 SoC I2C controller has one IRQ per bus
> and 16 busses.
>
> Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>

Reviewed-by: Joel Stanley <joel@jms.id.au>
