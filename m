Received: by 2002:a5d:4850:0:0:0:0:0 with SMTP id n16csp4316429wrs;
        Mon, 26 Aug 2019 12:41:18 -0700 (PDT)
X-Google-Smtp-Source: APXvYqyVpm3/e8sevnfWEEhgHRWZAAkl6CSPcnMo8KTe4UE/qUAkAxpHrp1+3LNABfqsb+j9r2H7
X-Received: by 2002:a50:9eab:: with SMTP id a40mr20385365edf.20.1566848478063;
        Mon, 26 Aug 2019 12:41:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1566848478; cv=none;
        d=google.com; s=arc-20160816;
        b=shKHXl7wgpVuO+KzWksR7n+IqeGpS1MNGwyYf7erND8XfV/MyLaEAGjmUMPlucKTCl
         WJSmgX6A3IE/VhgXYGytMTVTTq+GGcGfB2CVy6vT6kAhxJC0hJto/Pu0bEsOrQMOZySu
         oB9wjhbKyTHCwIn+JkIY94zOV8G5i1hFzhL1tnPBUpibs+QbzUAU3Hftp40PivJHCtkz
         kuAIeUNaI1XiVyM/3CGA1A++LiNrLxKPmC/syoxKyz0xha3SIGHobYKtuqRrksSVNLY+
         1QvTY8GyGNmIMVhhnO1pe1RVz67Vt0+em1hJKdv5ULmr6jvtP12ndZxzOdWORqHmZAif
         DzLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=NZSSeZtnXvtNng9emjct5L5Tp8giMMagrPLdTUJ8td4=;
        b=K2PUjEVzkAsOGSMPglAsJY3Cu0V67VmWpUrQFfFtqNsKqQRFYR6iOeqNYIaG5Cj6fJ
         HO7XzfZYljGlGbYRWnGPa459XjUGB1IcGLZxx+tGmdMabUS8yazoQJgWO1ZQBA5FAoUR
         Z8alcs410gyt4YyXs+ju5dr+iOfmVAAC09n5BcBli2gwThhb8ROGJS2YoNzqTmqpfWqo
         WSqT6LIcabgz9yEPaFbMo7eZT15rahTU20lGd9O6RGbnPakW7Fc2jGMe5+VhgswFR+iL
         yGyeFtadQj75S4fiiQ9tccOeSzFSLASHODjuAZq/QfjyIt6UXZKtVgCPXmSzXhR02UMS
         tpcg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="lc/zL4s8";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id mj10si6323247ejb.281.2019.08.26.12.41.18
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 26 Aug 2019 12:41:18 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="lc/zL4s8";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:57130 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1i2Krd-0002B3-0J
	for alex.bennee@linaro.org; Mon, 26 Aug 2019 15:41:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43574)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1i2KrG-00027S-JJ
 for qemu-arm@nongnu.org; Mon, 26 Aug 2019 15:40:55 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1i2KrF-0002KA-Br
 for qemu-arm@nongnu.org; Mon, 26 Aug 2019 15:40:54 -0400
Received: from mail-oi1-x242.google.com ([2607:f8b0:4864:20::242]:40651)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1i2KrF-0002JM-5E
 for qemu-arm@nongnu.org; Mon, 26 Aug 2019 15:40:53 -0400
Received: by mail-oi1-x242.google.com with SMTP id h21so13059235oie.7
 for <qemu-arm@nongnu.org>; Mon, 26 Aug 2019 12:40:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=NZSSeZtnXvtNng9emjct5L5Tp8giMMagrPLdTUJ8td4=;
 b=lc/zL4s845VczecveRn+y5Zj3SaGBFVx8qr0J3+kTdCgBeS/1mJ6PqGCwzN/qJo6c8
 lQTdBR6ZhPSUehOHPiS8WfV14PckBg6UzrgqE5YEfUIBu+MdohTK3BrQeE4mlmVHjB+y
 jjkqxRRMiBJarm6GNuaBGAn1SIIsr06gUkUStCmM0LooPk/Pirp/ayCrtjLQke8DplO0
 b+u1tcQ7f9u9t/FcwfebN2Fi0ERqWDTsTp8rz/Oc9rdWfgXW0/qTuFJXJipKlyoeRHmW
 fj00arrUCCVfhT/6ceCLjYOby60j2kWcqL8QjctZFytyagAOvvzW2ZsZJvJZadUao458
 rPpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=NZSSeZtnXvtNng9emjct5L5Tp8giMMagrPLdTUJ8td4=;
 b=iP4i7YdYU8OcfvSSzam1GdZyfNbWjFbRJt7vLzzsMXjLsY5lFXm+8uHDUzFvKJAin9
 LVcisGPGgw0wlxyO/uuAKH+TTEp6ZzUugU4bsd8Qc1XUXny+Ki7fds65IC9QcGeczX0N
 WpGqpKQzlusNQc8HF4jlBZX5R0ozkGwnbRPH86ozB+mxxZ6gVFFuhU/PmjqxkI+uVexf
 901BuVDOCCFM3aDYDu9pfy14WD4X8PXrLN9z6KgNgIMBtujo5Y7SDSPh3ZhvERv0erc0
 2KD4HTLvXan54KYb/5qcBSfiIIXbAuis8PU6FeWrwnvDWbC7RL7TTkohlQMT9ZukJDri
 vnTw==
X-Gm-Message-State: APjAAAV0AZeVEKI8X+Uml53CAo1f9OYgEg9HhIQoJVlgDctUYXvm81TF
 EvD9TGKO3tTUf4Jx1I3x217VeN09sRIgpP4lcjwPjw==
X-Received: by 2002:aca:4a57:: with SMTP id x84mr13846359oia.170.1566848452125; 
 Mon, 26 Aug 2019 12:40:52 -0700 (PDT)
MIME-Version: 1.0
References: <20190819213755.26175-1-richard.henderson@linaro.org>
 <20190819213755.26175-60-richard.henderson@linaro.org>
In-Reply-To: <20190819213755.26175-60-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 26 Aug 2019 20:40:41 +0100
Message-ID: <CAFEAcA-uCorXduHVFiJVdxz=QazcCrzxQFbdJcWiVhqurqXkaw@mail.gmail.com>
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::242
Subject: Re: [Qemu-arm] [PATCH v2 59/68] target/arm: Split gen_nop_hint
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
X-TUID: gIecCKVDB7pD

On Mon, 19 Aug 2019 at 22:39, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Now that there all callers pass a constant value, split the switch
> statement into the individual trans_* functions.

s/there//. Otherwise
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
