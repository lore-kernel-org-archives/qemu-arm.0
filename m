Received: by 2002:a19:f015:0:0:0:0:0 with SMTP id p21csp542402lfc;
        Thu, 12 Mar 2020 05:02:28 -0700 (PDT)
X-Google-Smtp-Source: ADFU+vvHhdCZORDkZDm58oX8XJIGM8iIsczQq5JqlTVRE4J3ihAEQJDiO7aEK3OoHJ5kl2xDPnXK
X-Received: by 2002:a0c:c246:: with SMTP id w6mr5718450qvh.250.1584014547843;
        Thu, 12 Mar 2020 05:02:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1584014547; cv=none;
        d=google.com; s=arc-20160816;
        b=W1GjUrGup9JzXcuDXDC5fQNNlBHiLsdiflKeWrP8xl5Q8+jaskgN1p8+OI8FXYPbVG
         fk9roe44cW+wWw+QplHYG2flXxzA/HowhLqnd4QTe9tJzFEIsPFx+alM1ysw63vG6l7T
         fIKTX5AGeVio3O7MtrJo13ZalNavHB5tAOCuD6Sfs2qMzkT2SyFPJCWW/fE06pUflvZ7
         4eUKFlWZdPD0Af6FZ3g+c5PJganWn7kYZ3+pv1bktFEkEJT82yVbDECpUqRozAhFu//G
         m6gEAUr8EC3/lfeUu/X75PIbOxf4FV/Tb1yHI+nhnUmutbO5NjLI6DZGqbxdy8wijDqL
         X6oQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=IRb3q7xJfL5+vXHXGwz8U5inAv46mTYP07kXeoTT3xQ=;
        b=LA1S2bbHFJlelgYNRCuAP1MvTQEZ6eXRe9/HdXguNc/T6ag7DoHSLwraSuda2tQqa3
         YVqYydoKHKT83XiHslwr7SOmKT538/yVFqQQxdWwfeiuS5hrMVZYOo2hyNWIpf+L3CXs
         avowtuDEjJfkITdP5lCP1BYxGaO0evlf9j4P/UvPDAdz/R2htTMaPocF9PmvvjoAFcIM
         eQaMoWAwXFPuVPKFfC+1s+aI82F8zqJH9G1IAbqtB/yr00+4OHhtiyN4rT2lSAcFKEPh
         ZV3m6Qdv8Dij/WhTiMvFX2RVrKvXu385tFknfJJ2wwoyG82thxLQDK0mnaVErGPoc+eY
         YFZg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=zeOL0FXb;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u4si2667746qtj.173.2020.03.12.05.02.27
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 12 Mar 2020 05:02:27 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=zeOL0FXb;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:40408 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jCMXj-0004UG-8l
	for alex.bennee@linaro.org; Thu, 12 Mar 2020 08:02:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33648)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1jCMXV-0004T2-74
 for qemu-arm@nongnu.org; Thu, 12 Mar 2020 08:02:14 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1jCMXT-0006Xu-Kv
 for qemu-arm@nongnu.org; Thu, 12 Mar 2020 08:02:12 -0400
Received: from mail-ot1-x344.google.com ([2607:f8b0:4864:20::344]:39316)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1jCMXT-0006Wb-DJ
 for qemu-arm@nongnu.org; Thu, 12 Mar 2020 08:02:11 -0400
Received: by mail-ot1-x344.google.com with SMTP id a9so5867842otl.6
 for <qemu-arm@nongnu.org>; Thu, 12 Mar 2020 05:02:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=IRb3q7xJfL5+vXHXGwz8U5inAv46mTYP07kXeoTT3xQ=;
 b=zeOL0FXbVXcL2wnXdHkObOO7QEulmXlsS6auZ4AzZJ0s6rfZKL2Z/u4gRbt4d6yauG
 NR68rho52kqizcGXqPCrKJqQk7oQK+LqLMdoeocgXNFtAQ7ES3KgeD+TLhmb7l3Kj+xs
 WHygSLgwEULn0QExHU+CF93Z7C37tLVtLQWVIO+kcE0awuyCA83uVFCvB6sgvJL1GUsT
 TCuKMlwS6p34e/hjxkpmooY6kSqvz0loU/3VFqIgk1NQur08fSTRQBJrzm1BProdBhAd
 4YWD1wWuXDQOI2ACcPFk7LwJphXnsHX0ZBNbr9ZHcwdR7yXhRWC415Y8aXJr2FPCerc7
 cwFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=IRb3q7xJfL5+vXHXGwz8U5inAv46mTYP07kXeoTT3xQ=;
 b=ueSa6XdyXKKqEPi6HXLrrsaeNiigtd1D9FF9dpjx82ctFWZ/NcbNtRPxE8gUfbcji7
 7lVJeyjnfrH0uZ972YxRMJK/TB6ZCu+/yZdW/S8SXT+gtJqL4csVgj1Uij0UORCqPcUl
 3icbcHtAWSIthVXcLgt1IZCl8M612R7jruW+p6F3MaXehLCgbu55MDEj+iDZKHC2cQNt
 xdApJjdyllE/QkCQtx080xHyX6ZPobm951dwLK3XdXTITW0DsUqSkrKhr6XE4E5owM04
 PzR9j/zuHQ7aogYngDna1Z84c+VIR/Z59OGNr4Fis0ho5AM5SCK4jpN4ZBhle0Wiqd65
 n9dA==
X-Gm-Message-State: ANhLgQ3LfwE+IAkjmtXAJ6Yt5nFv509EbnUwxjM/CjhK5+eGqOUp8Got
 CS18gvlTCnyjHiPB8WNhBXSP687EinJXRjltPGxvOA==
X-Received: by 2002:a9d:76c9:: with SMTP id p9mr6047003otl.135.1584014528828; 
 Thu, 12 Mar 2020 05:02:08 -0700 (PDT)
MIME-Version: 1.0
References: <20200303091254.22373-1-imammedo@redhat.com>
In-Reply-To: <20200303091254.22373-1-imammedo@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 12 Mar 2020 12:01:57 +0000
Message-ID: <CAFEAcA9wwa_y5fhpj=qjgp4RV3gx=7AuWa6QGE0m815UQwDmFQ@mail.gmail.com>
Subject: Re: [PATCH] hw/arm/cubieboard: make sure SOC object isn't leaked
To: Igor Mammedov <imammedo@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::344
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
Cc: Beniamino Galvani <b.galvani@gmail.com>, Andrew Jones <drjones@redhat.com>,
 qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 7O4/fDWWlOhV

On Tue, 3 Mar 2020 at 09:13, Igor Mammedov <imammedo@redhat.com> wrote:
>
> SOC object returned by object_new() is leaked in current code.
> Set SOC parent explicitly to board and then unref to SOC object
> to make sure that refererence returned by object_new() is taken
> care of.
>
> The SOC object will be kept alive by its parent (machine) and
> will be automatically freed when MachineState is destroyed.
>
> Signed-off-by: Igor Mammedov <imammedo@redhat.com>
> Reported-by: Andrew Jones <drjones@redhat.com>
> ---
>  hw/arm/cubieboard.c | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
>



Applied to target-arm.next, thanks.

-- PMM
