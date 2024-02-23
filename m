Received: by 2002:a17:906:e92:b0:a3e:79c1:d636 with SMTP id p18csp687073ejf;
        Fri, 23 Feb 2024 08:59:36 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCW9YTG/6SGmXl4ajeeRpklXctomC3cN0zFhm8r6elGgl4tELy4GY6HjjwyHRjteViCi8xK352Xietc+1vXgoUoeYnxSkV14
X-Google-Smtp-Source: AGHT+IGi7aNi5tLQKjk6oq0JAn44P0rsBZzPWrQZiWWnQg5rI4azmAajp/+v3vNl1nQerG5Q6GXo
X-Received: by 2002:a05:620a:40ca:b0:787:b785:d07 with SMTP id g10-20020a05620a40ca00b00787b7850d07mr684806qko.0.1708707576102;
        Fri, 23 Feb 2024 08:59:36 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1708707576; cv=none;
        d=google.com; s=arc-20160816;
        b=za4s5xtjqlbUWJ9/rkAOCe4/FVKC4JCIzNCEwqAU6cRpdnJb6suic4CSRwoQdQClZf
         lS7+xG95KVwmQ91dX8E5hmSCr+7PUXAgwx8efcWDg2uDwHXJgTJbdySJMGUbxGKK8mqB
         kKgfnpW2yttcvE8BBx+kteKRvHLUFJdoskxpLxY6eju1J0IpoG838XsxUX8qoGXqhW86
         xR8/8NTeBvlVjdFsxq2W/b9frV5NJYwHQ6hOF6AU+39GoxYY61WehNELKVg6qhbTgdbE
         v0mI2B5mbWNKfE+pVu2+nilnhEgzHax0WLKOyuszw+o72ZzyPAPEWAgVqW5klxTs+0Fa
         SNBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=OFrg0IBE8NWD9ilXgxLCsyY0rk2YMPmyszGTfwc2OgE=;
        fh=+guAF90Gb2cH9oPsx+ha/rN/Yi6ZduD7NqNskd1UGmM=;
        b=HHahPKZ82WIC8uiy2HHQqoY3y7GVIGyihwJ4gIyLWQe9VqrofaZ+iwQND660e0CRUw
         BcdvN2jeFccyAV7lbdcu6kVmckYqy3MrJO7zjMqRNZXXzr/xhwiUZqJc2YAj7O0/7Z/6
         z1centsiIeCu79hH9Vwr0xwAmRe2mwEku81c87A/jW0sTwdjXJi6R9zqhbisN8T5izsO
         +YLuTCiCae70VN5nh0xt3Mc/QnxHQVJ0mgY/mwGoKNE56JzIjiFpl1R6zhhS/RHiUxIL
         Vuaf2JS8lJpsa1rhw1mnzCY0nyiZeHuZ3OeLH94/Ac9Ys/82r+Iluh8YnhSteSVNp61Z
         YE8g==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=cJPOIyah;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id wh13-20020a05620a56cd00b00787b67659f0si1049466qkn.442.2024.02.23.08.59.35
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 23 Feb 2024 08:59:36 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=cJPOIyah;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1rdYtV-0005Ir-Gu; Fri, 23 Feb 2024 11:59:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rdYfV-0008Ri-Aq
 for qemu-devel@nongnu.org; Fri, 23 Feb 2024 11:45:04 -0500
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rdYfS-0001YV-Rb
 for qemu-devel@nongnu.org; Fri, 23 Feb 2024 11:45:00 -0500
Received: by mail-ed1-x533.google.com with SMTP id
 4fb4d7f45d1cf-564fd9eea75so791228a12.3
 for <qemu-devel@nongnu.org>; Fri, 23 Feb 2024 08:44:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1708706697; x=1709311497; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=OFrg0IBE8NWD9ilXgxLCsyY0rk2YMPmyszGTfwc2OgE=;
 b=cJPOIyahsKU0qiFt3PbDtQELQWWu93Bc0UZaNGYAVihSZqBny5PTZdvo+41ws/mgZ4
 ACf5E76wfOEO2Ikzxh4X22YVgg3ULlgabXa3pBOAYYwhEhCXTys5mp8dZ7NAEvArBPLY
 TZhkAn/PxxXDJvLnCdMUp1POocoaafTWONrl36uSWOGjBdkO8fLrsnwfOEC4ai1NXMUw
 /MKYEGhosB2TnsDo1ERf01fEoDUujwAQqleLYBTgbhmCGNJ9+RywOJt15ZZTGUxiX9LS
 lCr+tARW1Vg4u0KBfSOnK1kPTOp60y/5GjUWezTPwazj0Y/pUcRKlS7gS9ZNyiZvrrik
 UM1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708706697; x=1709311497;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=OFrg0IBE8NWD9ilXgxLCsyY0rk2YMPmyszGTfwc2OgE=;
 b=wbdJSBQ9Skq/7tGd8U7nEAx7Jii28Fs78v2n+/vwsw/fSpWSIFxObCLVi0Byhsq+3e
 w+KGXuVpRCWBYSmU0RGv1XW/ZwI0jEgxR2F17Aha5085TupT5Euuo//wqHjzCshd9jsh
 WW4117NAEqSOBLSwMoROAfDurCu/tS3huLS+mbdTz+9M+TWlDE8TnJRHJCuBpWQ8RI9o
 pqOveQTmv5Wgf9zMlX3Xw8JYnNtzZ7/YJUNY/Hw+JZYgFjyluSXxISW0ex0K+wy4qpwP
 CWCqSIYKL6K6HGhiryk/HyyHNMeA0yZyAIt6ZW2YmPgUO6ugGSMMlthLMO/VYBu/d31S
 JriQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWueLiKCI+EFkk2qMHLsgUVlVaffkdbD7jrdz+LcX8Q7GetlIoY0deDQIAxlwXCFDOqje07/X7hk9KiRUBdDQ8dQjy//u8=
X-Gm-Message-State: AOJu0YxJrirx1+pKke47cLYXVuNMb58tPCFLl8iCQmsin+CmjIvuiFUJ
 sf/jRKzD3U12Lvu2VtMZ4s3cX3bLMmQMM0DudiThVhpjzQ2rW5xlA/dduWLwk+qnE5JFamydZu5
 RQFHN5UZ1ObM9C5CnEhXNvbOYcJcmnMgFD4hZow==
X-Received: by 2002:aa7:d989:0:b0:565:833b:639c with SMTP id
 u9-20020aa7d989000000b00565833b639cmr250793eds.23.1708706696972; Fri, 23 Feb
 2024 08:44:56 -0800 (PST)
MIME-Version: 1.0
References: <20240219011739.2316619-1-sergey.kambalin@auriga.com>
 <20240219011739.2316619-10-sergey.kambalin@auriga.com>
In-Reply-To: <20240219011739.2316619-10-sergey.kambalin@auriga.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 23 Feb 2024 16:44:46 +0000
Message-ID: <CAFEAcA91wZ2S83gASvnAmH+db48B7ubh=3vcvb5w4vaM=3An9w@mail.gmail.com>
Subject: Re: [PATCH v5 09/41] Add GPIO and SD to BCM2838 periph
To: Sergey Kambalin <serg.oker@gmail.com>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, 
 Sergey Kambalin <sergey.kambalin@auriga.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::533;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x533.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: BeWsT/B13DIE

On Mon, 19 Feb 2024 at 01:22, Sergey Kambalin <serg.oker@gmail.com> wrote:
>
> Signed-off-by: Sergey Kambalin <sergey.kambalin@auriga.com>
> ---
>  hw/arm/bcm2838_peripherals.c         | 143 +++++++++++++++++++++++++++
>  include/hw/arm/bcm2838_peripherals.h |   8 ++
>  2 files changed, 151 insertions(+)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
