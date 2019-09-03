Received: by 2002:adf:ef42:0:0:0:0:0 with SMTP id c2csp283650wrp;
        Tue, 3 Sep 2019 03:56:12 -0700 (PDT)
X-Google-Smtp-Source: APXvYqz3TGWEydEVQAILmqkBzeZS9Gan0p5yoETl66oy6E5+fya8bbHuwFWiyhVC0AhHm6DWlKUH
X-Received: by 2002:a17:906:6d52:: with SMTP id a18mr12698898ejt.56.1567508171929;
        Tue, 03 Sep 2019 03:56:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1567508171; cv=none;
        d=google.com; s=arc-20160816;
        b=gs1ZmWu9WGupOdbnEXV5hYPRn6wRKkKqllzeR+/PwR9mARq9HXufsFb7pFtZ2GzVXR
         Z5xoOS5AhFl3XPhg7eKIS+QOaa9xLvhQZnAANLi6XL03Iz3i7GPlcvyr4H9gtUcymk4n
         RVeIiHQlIQXUV3CI0s1pY+MSTU7y3lHP/79+dTqdOpbOLo7oFZpSJEGE7nXR1727Vrbt
         bqD7uQJ9dkSWNk8tJ8tJDiXVqhrZoo/RwihnKOYFxuW5HdLOlksdzYqa/rd/0xnUf5pO
         rBCOBzA6MAqMMk9JEuzcfGhKc1Ct/Lai/IkiEhhQuWZHP/Kvddk6B//9fuTlqJwf3Ibx
         EPLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=4AuSqKxqun6TlKh0JT+UXYcVeve7rtoGZH9FW811eRM=;
        b=vHp4+u5F0iKD4EuoyMXRvzHL9r4It7RQqFcB59CjzLqaHNljZEzXoP2BLN/WQG284Y
         Jtp5kW/5EVn3lrsAMVI3NlYKN5LMmiELNU8lgH67Km6olS5FZOR1ls6euLdDiwqdb0Ep
         WnunsYQbMcSfJdxjYsUSvNg+PsOtd1cENxjkcmxoyElGC5dDFB9FWfkLrMKzbdBCRgZe
         W2kpifZKKFtdvzCZmfeoJT5zKvEcriKDtg7sYyg5+hmL/bCDLkrRV58OUtaL7o/SqjtT
         g9s/PyVzG0Owht1EZQ0IMPniIYxvDfbLrIGBQ1yLi3y5Fbf2oIF8HrRAWgfbe1R9zFqb
         1XCg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=uUM9rbY6;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x12si1027781edx.228.2019.09.03.03.56.11
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 03 Sep 2019 03:56:11 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=uUM9rbY6;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:44002 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1i56Tq-0005k6-TI
	for alex.bennee@linaro.org; Tue, 03 Sep 2019 06:56:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47883)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1i56Tg-0005jV-FJ
 for qemu-arm@nongnu.org; Tue, 03 Sep 2019 06:56:01 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1i56Tf-0001tH-Gt
 for qemu-arm@nongnu.org; Tue, 03 Sep 2019 06:56:00 -0400
Received: from mail-ot1-x341.google.com ([2607:f8b0:4864:20::341]:33640)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1i56Tf-0001sg-B5
 for qemu-arm@nongnu.org; Tue, 03 Sep 2019 06:55:59 -0400
Received: by mail-ot1-x341.google.com with SMTP id p23so16285089oto.0
 for <qemu-arm@nongnu.org>; Tue, 03 Sep 2019 03:55:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=4AuSqKxqun6TlKh0JT+UXYcVeve7rtoGZH9FW811eRM=;
 b=uUM9rbY6MBe2CNN1dhfFPPCYVRDTofe3+0o/xB35Jz91ZDCBS0anzqZLIDrerInUuT
 GEieAgAa4QHXfZWXwsc0lk1SpNuXkvl8CuIRTczNDO9AZjZmHgqRQWo2hSSpEtJPgR1V
 NkmLYfVFZFdJoHM1/E1urAXkLfQ+6mndbG1peO01e2mMqhan8yqZbxpbmbeHa11XibXK
 Ie2qeoq74DR2ZLgxVIC1hfR3Gj3PUYxr8e44yXgfrPlnjnLY/zNBhDNBZbrtOpOyi6Yk
 6cTGXRUnh14gvY9eC3KI9Cqi5ryJwDJmVFLEdGu5YSk+Rm3cLwJVAI/sA48oThGUGSl1
 J/Cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=4AuSqKxqun6TlKh0JT+UXYcVeve7rtoGZH9FW811eRM=;
 b=onNf9rmIhYWrdZXXycmQ4echfSHKCYPbys4Vghjjls/jt2sUEf992UX4tSS/xuqpnL
 SFqrb7JN0hXSo3BRV/H+ZfZ3X/goESbStgkhd/Q5P8Tu4Ihd9qHgxW29JUDbcGYNP+54
 Dl8GfJTSqn0rzY3GWEqXTcEDdYqUTrMEeNi3LTi30l+r74jAhz8rvrsaFEJrO0ZhShTa
 5bftwED8gj31qhAYzLD8V9JYqXPb8ScNQrgBnHCPFFhYaJ3zTPosA3yaop90cJ0z94Ri
 RfO7O53eHmSEfWup17ZLW/DYWZnResCXPEroP2ycNhaIYUzEU11xFUxh3SY3fbO/d8ZF
 Pnfg==
X-Gm-Message-State: APjAAAVHU+L6H1IGsZES4c7ArTQsOK8i6qMwgOqJrLx9rJVRbFtkAY+h
 V4E0JzZSGox9tJSko6z896LyGuftGS1rGCoWLOcmeg==
X-Received: by 2002:a9d:7504:: with SMTP id r4mr10178369otk.221.1567508158317; 
 Tue, 03 Sep 2019 03:55:58 -0700 (PDT)
MIME-Version: 1.0
References: <20190828190456.30315-1-richard.henderson@linaro.org>
 <20190828190456.30315-58-richard.henderson@linaro.org>
In-Reply-To: <20190828190456.30315-58-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 3 Sep 2019 11:55:47 +0100
Message-ID: <CAFEAcA-pVrF2oj5EMtVTd9REdig__J96YgHNSzYgctFiFFnW1w@mail.gmail.com>
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::341
Subject: Re: [Qemu-arm] [PATCH v3 57/69] target/arm: Convert T16,
 Change processor state
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
X-TUID: sttrynMoeNjC

On Wed, 28 Aug 2019 at 20:06, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Add a check for ARMv6 in trans_CPS.  We had this correct in
> the T16 path, but had previously forgotten the check on the
> A32 and T32 paths.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
> v3: Fix cps architecture checks.  Rename s/v6m/v7m/g
> ---

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
