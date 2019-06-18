Received: by 2002:adf:c793:0:0:0:0:0 with SMTP id l19csp3101551wrg;
        Mon, 17 Jun 2019 17:27:56 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwxcIpEPXeEjw3HIX2XI3ebeIt8/z5p5fytriTwaHD1JsBRNSs7i0jVz/gVkefWl1VN7BtW
X-Received: by 2002:a17:906:892:: with SMTP id n18mr71945939eje.10.1560817676684;
        Mon, 17 Jun 2019 17:27:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1560817676; cv=none;
        d=google.com; s=arc-20160816;
        b=fU92UnBH7nh/NQcQVfkSoyQ5nR2g3h5krOhbL1W4OCTRsNnoaJPG7XyM/xcPBiEivR
         B8U/OJn4df0isAe2sl8EmsFbLJfPTRvGtfBVq/x1UUWsAkw7InKlerpZjLczwZopHgDh
         E4fjwH1leJ1XSb7Ks4hJ9+MroeWnjY/+KHeZortoFB+flnOmXPwTPmEVAllqSZaAq9Cd
         7eU7cy3eP500CYVlDu1coMYY4vYeKIloyigMiEAc3s7htC9RKjgm7AoYHpFzDlD4oX2c
         OKrnADlaxkcrqR/NPsADi1BCEgO+6UGF8MZCtORtHwtiURVPvNSidG8e1BrXXv4mOfi6
         +iBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=t9WIkMCJzUsCK/kU6QU/SflM6UsK/eYNYbFEXibPnKg=;
        b=FwoIWJlk+yYXcBmzatmvgnR4ALi98CZ+6Zp2WUGR+LD7No1KY8ik3ivzSSduizoZh8
         xK1WgwP/j7TqMJgd3qHp6WvU1OmX8l90pu4nmSfBoAKeo4Ntgj8QpUS5BwPWC2gONqTs
         Xf5Y7okLApj3ojb9lc49O9ZYMAoaBHsVFyB+kapIGgrsWJqXtcFA51n1PlMdem1H0ZRe
         4MDMsjEUji+LKa0NgizsH0JbAtH9S6rzOXaat7uGPQKO0ySnMgGEQLlgvXBUuxDQPw73
         crvZ9BdweS52RFwZYZfDj5CdAK2j03+9BSVRYa4PHA/ZtHdfvXsUwPGBGkycNVVb51EU
         rE0Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b="nm/46+e+";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id b33si9904483eda.75.2019.06.17.17.27.56
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 17 Jun 2019 17:27:56 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b="nm/46+e+";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:52770 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hd1yd-0000RU-QW
	for alex.bennee@linaro.org; Mon, 17 Jun 2019 20:27:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57623)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <andrew.smirnov@gmail.com>) id 1hd1yJ-0000Pm-RA
 for qemu-arm@nongnu.org; Mon, 17 Jun 2019 20:27:37 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <andrew.smirnov@gmail.com>) id 1hd1yI-0007EH-1U
 for qemu-arm@nongnu.org; Mon, 17 Jun 2019 20:27:35 -0400
Received: from mail-io1-xd44.google.com ([2607:f8b0:4864:20::d44]:34747)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <andrew.smirnov@gmail.com>)
 id 1hd1yE-0007C6-4i; Mon, 17 Jun 2019 20:27:30 -0400
Received: by mail-io1-xd44.google.com with SMTP id k8so25741485iot.1;
 Mon, 17 Jun 2019 17:27:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=t9WIkMCJzUsCK/kU6QU/SflM6UsK/eYNYbFEXibPnKg=;
 b=nm/46+e+FHzsWTPIIAhMwNsrhLG5uaMDMwhJgyn4AsmvpNYFHi6A4STUSLGJrk1bIO
 9NwUk2X+xmnUVfkdXhnk3gRX/G64CL6iaZMh4qXWzus1tYctrb5wDDG0GvJGLDi9MPr2
 eGAxxsJZc5XU8w+m23nBC/0LAiuvXL/FRXPu8nfHxT8XaeKWA3OX99RKD9ZPCLdkZZoo
 x5SumdkvOHiAZECqyayoYy5TZHXplRZqHbmCdpyxPbHklHQm7xeZa3lACA5lFLDxeL9j
 +E8WyqAj4IAmCSRIfwd9MnJyS+b6FSY5CxggPBczj2r+ddo3rpzOxpdmN+B3skFYkRFH
 qIlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=t9WIkMCJzUsCK/kU6QU/SflM6UsK/eYNYbFEXibPnKg=;
 b=mKpagwIC1r2QhhAULdH7pG/wU1Y6ZFMWSXiUUY32Udq0K6+YUFQjFK1KvIdyeeh5ze
 ZW1TQhdo4MCAXXNQHSCJHoFwlYFdmaqR1t05WIOBPWlidU+JqXivGFPfXnXX8zpgOoMb
 0Oijr6/Nr0LQRc0Rk7eNIYuI6lNOZFfizGM6+olECs18kpp5aP96nPJGGyEXrvHbK4n5
 kDd0v7Aln46z8GHhRSsymMwkLykikC2dS+vZq/RYUM62fiAS7BWee/eHMqK5f6sdqd+e
 TZ8A8gklu22itfYe95fj/BEnY6XRiNyyw8q9oyqDlWDXxL0+GM6ZjmGIZPHGnhXwXrba
 MN4w==
X-Gm-Message-State: APjAAAX7nlzlndg+Mz3BDjbFgVuv/VZJA4JsRngGXShUfQc+Kp6OGOm8
 9Olz65PXQ8QOLGmX6D4ncFFtjt/0rO3+a9xhvhE=
X-Received: by 2002:a6b:f00c:: with SMTP id w12mr1556777ioc.280.1560817648660; 
 Mon, 17 Jun 2019 17:27:28 -0700 (PDT)
MIME-Version: 1.0
References: <20190416013902.4941-1-andrew.smirnov@gmail.com>
In-Reply-To: <20190416013902.4941-1-andrew.smirnov@gmail.com>
From: Andrey Smirnov <andrew.smirnov@gmail.com>
Date: Mon, 17 Jun 2019 17:27:17 -0700
Message-ID: <CAHQ1cqE5RZVYB1N2+CxGKNDb5NrtBOiQANhruZ6_6EbOThNwiw@mail.gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>,
 "Michael S . Tsirkin" <mst@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::d44
Subject: Re: [Qemu-arm] [PATCH 0/5] Various i.MX7 fixes
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
Cc: "open list:ARM" <qemu-arm@nongnu.org>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 94O0VRSnocFu

On Mon, Apr 15, 2019 at 6:39 PM Andrey Smirnov <andrew.smirnov@gmail.com> wrote:
>
> Everyone:
>
> I recently revisited my i.MX7 work and this series contains all of the
> fixes I had to make to get it to work with latest (5.1-rc1) Linux
> kernel again as well as fixes for genuine bugs that I somehow missed
> during original submission ("pci: designware" patches). Hopefully each
> patch is self-explanatory.
>
> Feedback is welcome!
>

Is there any changes necessary for this to go in?

Thanks,
Andrey Smirnov
