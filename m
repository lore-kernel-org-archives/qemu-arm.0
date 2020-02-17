Received: by 2002:a05:6512:3aa:0:0:0:0 with SMTP id v10csp4893942lfp;
        Mon, 17 Feb 2020 01:57:19 -0800 (PST)
X-Google-Smtp-Source: APXvYqwevrFQKgRE582+qUQ7ei7oFmEuApOekix1THOEQ5MbhgFLrGBJxcFyAM/9LH0E3XkA20y8
X-Received: by 2002:aed:2a32:: with SMTP id c47mr12108073qtd.289.1581933439052;
        Mon, 17 Feb 2020 01:57:19 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1581933439; cv=none;
        d=google.com; s=arc-20160816;
        b=uZ/x5K6YLtzQKHiCMYRuJM4aFq/PgFL+LEzw+fNHaggkqSe0XRzbfLUZc1LwtqSXKl
         90iHpRADjVdLqf16yc7YKn7Owt0fY7OffiUdl4o7YPkWEl/wkAlv1NeSPy3a2bAPGbW9
         HJdVBqSYFaHRKz4n8VgZarqWGM4p5bgAYBZwfY6JGIazq5O1GeZFOYVI6ViSS1Esk5tr
         fLtfmpflicQ+mkiANHyq6R6z9hTg0hRpPBJWjOHyDE7hnMv1S2Rjv8OwcXxfO/wyFwaP
         Zd7Bgo68hUfu9yxsKj1atCP+T4kiRhfxuIqqTalNkOVTU8M9DcIksyXXOcFx6DmfUfJ7
         yX8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=sg+UkZAgfr2THYTi41XlM+2CEPbUNU/g6/JClAJlFcM=;
        b=Vy/1g7M5m6rY60um6SC+uXRHnj9/IrJXg1JomzcFsxm6lnWQ7PsXekZ7UdFrGAIWBh
         9dLNyKTcLjLS2Y0qxtA3b91+slqVWgccXOkQNJi2B4OUnjoSNZDvXjTNBxGLp45GlXF3
         tXjMLPNlZHNvfLnnwrwJeHs3rpOW54MeiuiOfaiLry9zHrC00w782o8h8iHDoZpIJxDH
         zTbb2AjJauNR1ewdwsv0RojNL/o1Rz5gI2bMInFmAhCYk6BG74bvSc+OGsQeg40Ws+D5
         hMqNlxrq437kJpUfHOd+kvGdRYL63Y47fOvCaWdyJ8sncl67AeP9FlXBVswai3EU1vtw
         L4kw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Qop5AkN+;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o58si2455qtj.134.2020.02.17.01.57.18
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 17 Feb 2020 01:57:19 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Qop5AkN+;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:42884 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1j3d9R-0005bn-0v
	for alex.bennee@linaro.org; Mon, 17 Feb 2020 04:57:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55843)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1j3d9E-0005aD-SH
 for qemu-arm@nongnu.org; Mon, 17 Feb 2020 04:57:05 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1j3d9A-0003oT-OR
 for qemu-arm@nongnu.org; Mon, 17 Feb 2020 04:57:04 -0500
Received: from mail-oi1-x242.google.com ([2607:f8b0:4864:20::242]:37392)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1j3d9A-0003np-Jb
 for qemu-arm@nongnu.org; Mon, 17 Feb 2020 04:57:00 -0500
Received: by mail-oi1-x242.google.com with SMTP id q84so16139967oic.4
 for <qemu-arm@nongnu.org>; Mon, 17 Feb 2020 01:57:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=sg+UkZAgfr2THYTi41XlM+2CEPbUNU/g6/JClAJlFcM=;
 b=Qop5AkN+18R/lWpboztqm0Ydf8U2lga/d4wByIZtpMlSPSga0UUQxWnCSiABWWFRzA
 gPyioncINFTxdJZ42V0O0ZgUNA7LnnFYhZmGJ0by1OXxB6pFJXEC7qXbSGqXWtQzWF0j
 BAyHx6fz7+rT+5C1QOHGtgX03w83y5NdVm3atM/Ff653YJaHmqUE/JVLebgeSNr9dNVo
 ud8ADDzBFoZ4+e0HZvIYY54PrPPLbMEsvyXtalNU9XH1+keKB1N3AWdoP/JMcFUeJtZX
 6eJdIGD3uo6zExTPh2LCMB8uVxymBemtp9b4sjMgH7FxRqi+OF0HoN//JvjXASSCbhvw
 UaBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=sg+UkZAgfr2THYTi41XlM+2CEPbUNU/g6/JClAJlFcM=;
 b=gCV9XoORFS2qah981K5Hgr2Px+DzYHnKS9RcV7AFndI8kGfa/8KRzrKUSZp2nRAQsy
 RkXRGwzg9hjpAANsutV7leuo3IhrBOCl+eSgiRz5Gj7a2zUmuZt4txhcLShVZgtkNgz7
 K9ttn9vQ1AgkdwdTEiaG644Wf8Il1iZlW2pnOtbYUpcKx5lH8J1xJkgcFmVLfo0vshex
 UC90m+3Vrp5Q1jLUMqlxvBrAm3boeoukbgpXi9EhqeaVeqPwBYGBHF/6lfG+6K+YBii+
 0sYceW0MYsSbYmvo2sp6wQcucTz6QhY3TYUqxWXrNTwuH30ZFhv3o0jluN1miF6b0Di/
 hk0w==
X-Gm-Message-State: APjAAAV2Lv7Q4I7X3NXyIpLp9i+8blPk32uZr2tH/SIR2+iQtZVMUaBs
 pULDWBP9HtR7KVkQV9J0aPm2AEDgTazPWB6FCOipdQ==
X-Received: by 2002:a54:4f16:: with SMTP id e22mr9691959oiy.170.1581933419718; 
 Mon, 17 Feb 2020 01:56:59 -0800 (PST)
MIME-Version: 1.0
References: <1581925888-103620-1-git-send-email-xuyandong2@huawei.com>
In-Reply-To: <1581925888-103620-1-git-send-email-xuyandong2@huawei.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 17 Feb 2020 09:56:48 +0000
Message-ID: <CAFEAcA9ioqVhsBjZZXJDSnSRi-rbz80DZvSv1DsOfN0+NTGA6g@mail.gmail.com>
Subject: Re: [PATCH RFC 00/16] Implement Microvm for aarch64 architecture
To: Xu Yandong <xuyandong2@huawei.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::242
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
Cc: wu.wubin@huawei.com, qemu-arm <qemu-arm@nongnu.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Sergio Lopez <slp@redhat.com>,
 zhanghailiang <zhang.zhanghailiang@huawei.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: h7FAYY3725bJ

On Mon, 17 Feb 2020 at 07:42, Xu Yandong <xuyandong2@huawei.com> wrote:
>
> Implement Microvm for aarch64 architecture
>
> This series attempts to implement microvm for aarch64
> architecture.
>
> Just like how Sergio Lopez does for implementing microvm
> for x86 architecture. We remove parts of emulate devices which
> are not needed in microvm, compared with normal VM,
> We only keep PL011 (UART), PL031 (RTC) and virtio-mmio
> devices for microvm of aarch64.

For x86, 'microvm' makes sense, because the standard
PC models are models of real hardware with a lot of
legacy baggage. The situation is different for aarch64.
The 'virt' board is already intended as a "minimal
machine for booting a VM that knows it's a VM".
Why do we need another model that's intended for the
same purpose?

It would be more interesting to look at whether there
are reasonable places where we could allow command
line options to have the 'virt' board not provide
some devices where that makes a significant speed
improvement. Analysis of where the extra time is
actually going would also be helpful.

NB: I'm pretty firmly against dropping PCI. This is
a pluggable discoverable bus, and it's a much better
way to provide virtio than virtio-mmio.

thanks
-- PMM
