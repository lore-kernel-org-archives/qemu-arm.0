Received: by 2002:a5d:4850:0:0:0:0:0 with SMTP id n16csp842928wrs;
        Fri, 23 Aug 2019 10:21:59 -0700 (PDT)
X-Google-Smtp-Source: APXvYqw7rseYY0ACL/yrX2YxLa98fHpp3a8iu2naHOqKT52v8ipDx+Dv2+6WC2T6l3Kb5xEiOIl5
X-Received: by 2002:a17:906:318d:: with SMTP id 13mr5146438ejy.281.1566580919574;
        Fri, 23 Aug 2019 10:21:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1566580919; cv=none;
        d=google.com; s=arc-20160816;
        b=NWEbvT5WTk8R9rZ3TxDTB/o9JygXZ1Sb/JmdH+L+I5mlOfq40TbLH5y8Iroo9vYKBC
         UUACYvJu6tJLKOGa2EjDU73g3mJuRm9Lo7/AVkkB5JZYlLNiIzC3cKjPEoB+6zrPX4WA
         xkM4ZvpwXDkHNTL6bMo/N1sDqvFUJm0Yqe316ccj5cb2Cc9E1Ll0hIajQUcDDiv5DpHI
         WcYddkg3HV8E2oS51mhqJyGRdUGweXTRS32Vz/ROaonyBdLGo4QCdr0En7MZLtkwF378
         N5mJa65zGgKJMdlGbq2qu63fkFBY0ngrPEZ+b5q55ct5+WNn5Fo7DIHQT9lmh7/TClYK
         NI1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to
         :dkim-signature;
        bh=GjxqU995+mgVYP/D/PQvEgIjIycH7neC4TN5rf+9wRA=;
        b=vErX+xWD/lUo2t7AGZECGXXn4xcy+xkpaCDDnzulrl3rWeowzjBcuGFuQIrlLG2Vqi
         hNw1WpbkNZb5leXSUeXzGwlDowv//r4WFXDkYLJVt0Ax6LA56VviIgdgFQ78C+JsQRJr
         85uW4+AoNpEP94VuSuQ8O2mjpfVlN3AH74/dzbxJFJ4cgKSdoi3idvN6FYX18ZMvYcEN
         PupOSlvKlbVc1Ejl7bqsPxoNZibaoD4IlolZW/LLITeVMSj6V3HEIYhkYHyJJqZAY6pg
         R8spKT2D6QKbGjWFHAYs4T47KlP3XgrSxnMrUz4ZbfFoqcTCr1DT7N9L8lMFjIYfOpFp
         N5Zw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=dzjgBTQL;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 44si2229001eds.305.2019.08.23.10.21.59
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 23 Aug 2019 10:21:59 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=dzjgBTQL;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:59996 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1i1DGA-0007sN-NB
	for alex.bennee@linaro.org; Fri, 23 Aug 2019 13:21:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57507)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1i1DG3-0007rl-2t
 for qemu-arm@nongnu.org; Fri, 23 Aug 2019 13:21:51 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1i1DG2-0002VQ-7l
 for qemu-arm@nongnu.org; Fri, 23 Aug 2019 13:21:51 -0400
Received: from mail-pg1-x544.google.com ([2607:f8b0:4864:20::544]:33148)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1i1DG2-0002Ux-0H
 for qemu-arm@nongnu.org; Fri, 23 Aug 2019 13:21:50 -0400
Received: by mail-pg1-x544.google.com with SMTP id n190so6130013pgn.0
 for <qemu-arm@nongnu.org>; Fri, 23 Aug 2019 10:21:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=GjxqU995+mgVYP/D/PQvEgIjIycH7neC4TN5rf+9wRA=;
 b=dzjgBTQLSsNxDghtavmUoWpVjxfQasfilMidz6Kx+fzpJFJ3gTS9CGlYwCXdwwZHrO
 wBUyd9yFUksR/XT5wGqo80M696DzDKJPZTv4z1/3XRlKjFffdStyz2AB79VktnriNsOE
 0+mIRpKjtNp6q3b1HqQy4mTgzBA5kd4fq3+qVOjgsGgbXVces5E4ZIKiy2aDjfhLrJgE
 RozioY+3Cg7JrANXY/e7brpy8D8jXInvogm2ZbxHHl3nQ5syJESfHWzmOR7GroEvNVWx
 030ImehtAznn2Ya8Ik0C4T/hzN0p1JdytATzElbAmIZdMFx7uiQOUrYPh4GFHZ+Yqcc0
 7AdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=GjxqU995+mgVYP/D/PQvEgIjIycH7neC4TN5rf+9wRA=;
 b=Dr3+NCr14MS87KlpWCPjoz+eaoQG70gBTjxhdpLLfK5iHzE1FsrpRMZ0QgiIZXmFMw
 XisA4IWVXqQfVL9w9Qvj/61I4ctM2P5y0FxZ75QleeZQdMQ2AFACpRh5020bnFePlU+N
 KHMKm1ttT8PtyNBIbldduUvfkeI8tba+MSt273qUdgRBMAAJXsBzfxUjK/ofBqEsi4rM
 b59DeMX3G9FGAl0UlkpWGPSyoySkg9OLmVqQf3GVyjs4xg8U4deYW1UX/uFKlP7a2ydi
 uFbn5LaxHmcNF8aZDhQENsy74qllHTvf5TmXfhL7c377ZR06wYJwLu2gA3e4v2H7tG72
 ZSjQ==
X-Gm-Message-State: APjAAAWyps+XemOMfChUzoLnGRdMrfvToNd7yfgna6wTgZjhrM37BYOS
 pIyStgfa17l/sH+grHzDfK98hg==
X-Received: by 2002:a62:ed10:: with SMTP id u16mr6448724pfh.179.1566580908253; 
 Fri, 23 Aug 2019 10:21:48 -0700 (PDT)
Received: from [192.168.1.11] (97-113-7-119.tukw.qwest.net. [97.113.7.119])
 by smtp.gmail.com with ESMTPSA id z16sm2707496pgi.8.2019.08.23.10.21.46
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 23 Aug 2019 10:21:47 -0700 (PDT)
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
References: <20190823143249.8096-1-philmd@redhat.com>
 <20190823143249.8096-3-philmd@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <c084a635-f043-06bf-6226-9832978ca003@linaro.org>
Date: Fri, 23 Aug 2019 10:21:45 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190823143249.8096-3-philmd@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::544
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v2 2/6] hw/arm: Use
 object_initialize_child for correct reference counting
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Andrey Smirnov <andrew.smirnov@gmail.com>, Jason Wang <jasowang@redhat.com>,
 Alistair Francis <alistair@alistair23.me>,
 Jean-Christophe Dubois <jcd@tribudubois.net>,
 Beniamino Galvani <b.galvani@gmail.com>,
 Igor Mitsyanko <i.mitsyanko@gmail.com>, qemu-arm@nongnu.org,
 Peter Chubb <peter.chubb@nicta.com.au>,
 Antony Pavlov <antonynpavlov@gmail.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: jRAXP1mcDmrm

On 8/23/19 7:32 AM, Philippe Mathieu-Daudé wrote:
> As explained in commit aff39be0ed97:
> 
>   Both functions, object_initialize() and object_property_add_child()
>   increase the reference counter of the new object, so one of the
>   references has to be dropped afterwards to get the reference
>   counting right. Otherwise the child object will not be properly
>   cleaned up when the parent gets destroyed.
>   Thus let's use now object_initialize_child() instead to get the
>   reference counting here right.
> 
> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> ---
>  hw/arm/mcimx7d-sabre.c |  9 ++++-----
>  hw/arm/mps2-tz.c       | 15 +++++++--------
>  hw/arm/musca.c         |  9 +++++----
>  3 files changed, 16 insertions(+), 17 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

