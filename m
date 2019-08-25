Received: by 2002:a5d:4850:0:0:0:0:0 with SMTP id n16csp2953512wrs;
        Sun, 25 Aug 2019 09:29:03 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzOFOokQUZQ/bAlsUFeRoTbbuejmurLK+CviwJcRxeC52IU/gb1O9q+vZMBPDNW5xPeEjfM
X-Received: by 2002:a17:906:6bc4:: with SMTP id t4mr13539759ejs.256.1566750543902;
        Sun, 25 Aug 2019 09:29:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1566750543; cv=none;
        d=google.com; s=arc-20160816;
        b=cOtlAM7xDzRuWU/zU+CRfLMT6P9XRoY/3iXb3QM4Bai+Vb73OjmvRh7VJLZF7PQno1
         Kwjd6fAme/m/zDhI4OrXKDTXEYUND9voWTzc+AaJ2oOlhY7h1BXowvEESi72CZcswCtu
         JHiI+7E/FXNqhYl7qxmidBw5TlqYPZuEhEyaWQK/+WC49RYtRuUzz53xEblqAS+fTejC
         svXevocYGap4imM33yj6kDaDDutWPmH/gQOqhlrVuc4kdzGTBSn6p7FTL45PJo7qywOt
         0XDFJIc3+y2ByzruEpvLQptvOAuEAnGeqeIuyLqLdAPBHB9Q3Ya7yGvjJMv19cdQgEwC
         hQvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=MwSbF/9WJpnXKH997o1IVt/NweMeFi+XXUHsBj+m5Gg=;
        b=RHoBxynp1KY4k0QvnBMm0W5AwSoa3/YTLzSDzr/tuYAonx2+vIvbdew4xm9GG9L+o0
         rZc/8hCafwqcmRQe3itfvS3j1Czk0xFF5Ncyabk03l1qNHbYgK9cckiMss9gtUuv9wau
         yws5m1Yavbw3xFsLqQ53LQFv3gSmbsWBQoA3UV2VikjGrax2tIHc+xG2+dG03bRA6rQV
         TNwQLQ0YZIayaM9IRTg77FBmy73Ce3qRiNFI5T+DTM0fMNCZUGxCAVpajWTVlvqKlL2i
         9UO19TkfbyJU67l8OMZrEyBJYx8mzajRU8ngD0OAd5iRXRjDdY3R+QOowAr39+xC5s9F
         NdWQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=f8OBDrGD;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l56si5307524edd.41.2019.08.25.09.29.03
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 25 Aug 2019 09:29:03 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=f8OBDrGD;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:43732 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1i1vO2-0001qw-0r
	for alex.bennee@linaro.org; Sun, 25 Aug 2019 12:29:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34382)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1i1vNi-0001qb-6Y
 for qemu-arm@nongnu.org; Sun, 25 Aug 2019 12:28:43 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1i1vNg-0005IQ-Sp
 for qemu-arm@nongnu.org; Sun, 25 Aug 2019 12:28:42 -0400
Received: from mail-ot1-x344.google.com ([2607:f8b0:4864:20::344]:47068)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1i1vNg-0005Hc-O4
 for qemu-arm@nongnu.org; Sun, 25 Aug 2019 12:28:40 -0400
Received: by mail-ot1-x344.google.com with SMTP id z17so13008871otk.13
 for <qemu-arm@nongnu.org>; Sun, 25 Aug 2019 09:28:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=MwSbF/9WJpnXKH997o1IVt/NweMeFi+XXUHsBj+m5Gg=;
 b=f8OBDrGDv7N0G+3BjWZGECy2bwMz4cYdTZ5k9sIKWZquAFJ8jEY60kXjTl+8iNDAYN
 4xSaJFw7Qw7DgwkuihXjA+dUrTPkopR9a9avbHEcR3EWIeBetb6Jg5sVuNWblzyaBsEB
 Tm+7B13TmGMWnR3oCMcZPweTfu/AG2rnM0mCc2ufKiixqNKQZBFF1eQexBjOvwA8LuI6
 8YSbOJMPoHa10GPekYwHEe4GBvcn7vKKs6Iugh6gIpHXdKl2Sny6rz9hUJc6Sg00p1CL
 QDIzn556m8zTdO0gkH8kFA0BeWLSGdL3pnZEw1d8t47Umky2gEB5P+EgwA3mZbbuT+Fk
 gH0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=MwSbF/9WJpnXKH997o1IVt/NweMeFi+XXUHsBj+m5Gg=;
 b=m284ebw6CDmiwWdQExRCnmmqqflhVQGHvmdLSRnYEx9IpxvsckJg3idYy9nV+tEu9K
 WBUeuZlkUab0EhxhJds5ZN4ihYwv1xflWhhEHOUcMZo5CXtOSmiBhTlDh64OJkZWVf7k
 KKoYsLQunRyJpC2Oeq2ratuHyc/v6WM+Ba2ZatgoefzMsPSDWJ2j41pXCaUvZc/0Ub3H
 CNqtkRN27WwnUNtc3dDZBm1KFqRQwzC15kCxZZooxpuMeuqzK0HjsMHaW0KcQ3VtUQRI
 E0eTZ6gAC/vesCYPMShelLQQLztHNWP+hkjOe0ec5V+FQ4aIqx16AQc89PKft87mtwso
 mEzg==
X-Gm-Message-State: APjAAAVd5ayojDZEnuIHbNIeefpqEfRsPBgsVGO9AkK/YM2KWHFOEXfC
 DBLyX00KBQP0IMqHgN7vnkZ99NAiy3W/7avw3wMKS+0ixWE=
X-Received: by 2002:a9d:6a94:: with SMTP id l20mr11518417otq.221.1566750518887; 
 Sun, 25 Aug 2019 09:28:38 -0700 (PDT)
MIME-Version: 1.0
References: <20190819213755.26175-1-richard.henderson@linaro.org>
 <20190819213755.26175-41-richard.henderson@linaro.org>
In-Reply-To: <20190819213755.26175-41-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sun, 25 Aug 2019 17:28:27 +0100
Message-ID: <CAFEAcA9aT7yq+_NzfcDWxuS3W3PMVmWLkHJSEmYh=aMkHA4j9w@mail.gmail.com>
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::344
Subject: Re: [Qemu-arm] [PATCH v2 40/68] target/arm: Convert SG
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
X-TUID: up8HMF1bHeXN

On Mon, 19 Aug 2019 at 22:38, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/translate.c | 51 ++++++++++++++++++++++++------------------
>  target/arm/t32.decode  |  5 ++++-
>  2 files changed, 33 insertions(+), 23 deletions(-)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
