Received: by 2002:adf:ef42:0:0:0:0:0 with SMTP id c2csp5489693wrp;
        Sat, 28 Sep 2019 23:58:44 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzZFAmOWmyiolHrvJLXwjCglGsphMAs+mqNK7+uwOwe/aCpX3GUdS6jsPzPzZz2WIiOkbzf
X-Received: by 2002:ae9:ee17:: with SMTP id i23mr12863703qkg.179.1569740324565;
        Sat, 28 Sep 2019 23:58:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1569740324; cv=none;
        d=google.com; s=arc-20160816;
        b=ffG6HrhF1eutHbSiz3LeNtLZ9gnCKV/rbuRd5naF42RPDFZI/Obqrs/src6BkXc1gh
         QzRzl8KlQCpnHzOmawGw4bXcKqZcbSenvvR0MFp/XAv+eLfK6II1fLXo7oJ9Zr4RLe3K
         MafLz/mHHDrL+MVl0dKZQZDWH83n3gfF3RP6aRY3UOXeiQEYMsF/TqeiWCbhLo9lNEBU
         nbVAYObHD0UPqeCqQYlUcMkKNXfzCkfQ+50mvsYJ4uchCytyEl1jXFPFAwNv+tcsqFxf
         +QsqsO0Qc3lm6ea2PInF3eC8D75Oz3+b1euch1faRRcCWwqNYEl1qp6VvwopTOJilPXp
         L8VA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:user-agent:references:in-reply-to:date:to:from:subject
         :message-id:dkim-signature;
        bh=rqYk9EkDk9gyOaNdTxkh8oeo+Du3GR0cKc17NNYoo+o=;
        b=ChBe2+x3RLgP1J8sTpl7tVDa/1zBGCMUoe2cxPsMa8PZr7YkqjhN8ysMuQtBwqV/FR
         5UmHIPlvEi2b89LXdE1gdSWAHBvHymekKSPdkb8zMF4iWpoy8JUTABGN4iD/WQb8WwEd
         j7MXpfZVvc5yixA7DFoCpvsprx1apk1B43KkL48FBfDtHEnY+Q6ku3Htuf3cO8T3xwWe
         jdnui9CBsrs2qvgdGRv4uGyRmGQrfxtgbbobbObFrL471boYi56i1hcWE85+l/gPTTPt
         ujOTeZWFb+wiciXIuhQkgqtAQxP4hfDq1ePn7cbE0uIGAhlatpMmPVHI+KbQeiOOw6Ca
         1Q1A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=IdbqH6xg;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f65si9332174qtd.338.2019.09.28.23.58.44
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 28 Sep 2019 23:58:44 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=IdbqH6xg;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:37108 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iETAK-0008TV-21
	for alex.bennee@linaro.org; Sun, 29 Sep 2019 02:58:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52708)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <estebanbosse@gmail.com>) id 1iET9b-0008Sb-9z
 for qemu-devel@nongnu.org; Sun, 29 Sep 2019 02:58:00 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <estebanbosse@gmail.com>) id 1iET9a-00019R-5A
 for qemu-devel@nongnu.org; Sun, 29 Sep 2019 02:57:59 -0400
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342]:35416)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <estebanbosse@gmail.com>)
 id 1iET9Z-00017x-Vk; Sun, 29 Sep 2019 02:57:58 -0400
Received: by mail-wm1-x342.google.com with SMTP id y21so9398437wmi.0;
 Sat, 28 Sep 2019 23:57:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=message-id:subject:from:to:cc:date:in-reply-to:references
 :user-agent:mime-version:content-transfer-encoding;
 bh=rqYk9EkDk9gyOaNdTxkh8oeo+Du3GR0cKc17NNYoo+o=;
 b=IdbqH6xgjUu5kyNbK8KULoAgMsf73GOmGLXP3Lc8oAXIC4BMpEBAkmCtGn7vjc8+UK
 y1Tm8iMjkqGwf/SP/Z8Ie3PYJtbt/5hqKIAlUswMqlpImT5xWbbdeqQYGVI4LxR5GUiw
 IIHFzO+9cAwr6QSnleyOodhODhcdWDtS0WOXTAgpZcFFbBovLqq6xO1d8SyGZRCWprWC
 3ElpXTZdX4M6gZ43tshKdf6AMhw2BJK4/iind9sQs+8QQayWvLy8gEgjuthXoe90/yK+
 qR/OwXQQSfj2VOFDTivomf4J8Qj3zUMZKcqqbb2OHJCPrFJMXg0vWcYTBxzOs8C0r0h9
 rs9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:user-agent:mime-version:content-transfer-encoding;
 bh=rqYk9EkDk9gyOaNdTxkh8oeo+Du3GR0cKc17NNYoo+o=;
 b=Oh2EWVEhsRMJLPlkos+kZIIxSIGPrPGoWwAEN3OPQFtPdFKRvaBvnklKT7XZ2QSC57
 kROQWMAYbrK/2HneHcaBJOJNSGFbqB49dnf8CPVEktpRPTqUF5knPKzYtPNjG3bcquFl
 aKNduQM4qbqm+xO1OhWcVAZjejyszkkayTCTZZkcoXBvXyVeluS03VM6Mg+XogPXqrHH
 VqzUbr1f6bNfDPvgwIrkT+8xcjq+z9wgdZKaBQy1YaQsf5PtyewCzBko7qLEOkrj54yF
 kB18frr77iYttSm2uJ7EQV6LXJFsELgyLzzIBhSh252zankK87K2x513KjbFr56rgX5C
 /D9Q==
X-Gm-Message-State: APjAAAWcpzD9VVh1M8KeK8knRq6dT8OVWJa0WwBWyXtVypPD+2QjtKXC
 6Ax+8Tv+3JoNvy8IoNx0G0U=
X-Received: by 2002:a05:600c:295b:: with SMTP id
 n27mr12831652wmd.128.1569740276225; 
 Sat, 28 Sep 2019 23:57:56 -0700 (PDT)
Received: from ?IPv6:2a01:c22:b04f:b200:7a70:bbc8:8101:45be?
 ([2a01:c22:b04f:b200:7a70:bbc8:8101:45be])
 by smtp.gmail.com with ESMTPSA id o22sm24158457wra.96.2019.09.28.23.57.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 28 Sep 2019 23:57:55 -0700 (PDT)
Message-ID: <5232fe825315f265a9cd7f73404bc2713cbf0b04.camel@gmail.com>
Subject: Re: [PATCH 01/14] hw/arm/raspi: Use the IEC binary prefix definitions
From: Esteban Bosse <estebanbosse@gmail.com>
To: Philippe =?ISO-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>, Peter
 Maydell <peter.maydell@linaro.org>, Andrew Baumann
 <Andrew.Baumann@microsoft.com>,  qemu-devel@nongnu.org, Pekka Enberg
 <penberg@iki.fi>,  =?ISO-8859-1?Q?Zolt=E1n?= Baldaszti <bztemail@gmail.com>
Date: Sun, 29 Sep 2019 08:57:45 +0200
In-Reply-To: <20190904171315.8354-2-f4bug@amsat.org>
References: <20190904171315.8354-1-f4bug@amsat.org>
 <20190904171315.8354-2-f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.30.5-1.1 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::342
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: qemu-arm@nongnu.org, Clement Deschamps <clement.deschamps@antfield.fr>,
 =?ISO-8859-1?Q?Marc-Andr=E9?= Lureau <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Philippe =?ISO-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>,
 Luc Michel <luc.michel@greensocs.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: T+RgGdPkZCxq

El mié, 04-09-2019 a las 19:13 +0200, Philippe Mathieu-Daudé escribió:
> IEC binary prefixes ease code review: the unit is explicit.
> 
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>  hw/arm/raspi.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/hw/arm/raspi.c b/hw/arm/raspi.c
> index 74c062d05e..615d755879 100644
> --- a/hw/arm/raspi.c
> +++ b/hw/arm/raspi.c
> @@ -230,7 +230,7 @@ static void raspi2_machine_init(MachineClass *mc)
>      mc->max_cpus = BCM283X_NCPUS;
>      mc->min_cpus = BCM283X_NCPUS;
>      mc->default_cpus = BCM283X_NCPUS;
> -    mc->default_ram_size = 1024 * 1024 * 1024;
> +    mc->default_ram_size = 1 * GiB;
>      mc->ignore_memory_transaction_failures = true;
>  };
>  DEFINE_MACHINE("raspi2", raspi2_machine_init)
> @@ -252,7 +252,7 @@ static void raspi3_machine_init(MachineClass *mc)
>      mc->max_cpus = BCM283X_NCPUS;
>      mc->min_cpus = BCM283X_NCPUS;
>      mc->default_cpus = BCM283X_NCPUS;
> -    mc->default_ram_size = 1024 * 1024 * 1024;
> +    mc->default_ram_size = 1 * GiB;
>  }
>  DEFINE_MACHINE("raspi3", raspi3_machine_init)
>  #endif

Reviewed-by: Esteban Bosse <estebanbosse@gmail.com>

