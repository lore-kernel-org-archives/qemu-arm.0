Received: by 2002:adf:c793:0:0:0:0:0 with SMTP id l19csp209457wrg;
        Thu, 13 Jun 2019 14:28:03 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwOtRh1YY6d0sPSxfbKLE/H9IQJv6aFWpbOdHlOJWK/dkurGx5Rujuw+9pLgPKf/bZP+EaR
X-Received: by 2002:a05:620a:1310:: with SMTP id o16mr70994997qkj.196.1560461283678;
        Thu, 13 Jun 2019 14:28:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1560461283; cv=none;
        d=google.com; s=arc-20160816;
        b=Lfy9qA+lY8JArp9VrsSQkPkioTGs9FAU4nMiJ64BkDJpvdCai6Jm1HUe+IECvSXI1f
         O6gqffofqTOi5OXQBF28ngQeZwkuWLI5qOFR2h3NfuRN7YdTjFjgaE2xadasksXPYjz4
         teLHDs0Ix5hk/eCMZb5d25HHh83tHAehd17GIL3FMTDp9NYBeSYFFqBJxhbvJBP8A2Pw
         ASy4y07Fa3C+Ye0PS0kucWKmaeq6IekW6sl/35bTwqBVSJMZfVVko/JeVbiGA5nDRDjW
         Pw/jx801OrQJIdSJbJCULwLVx/XnVwgBDCD9l4NcJMzhHu0lS9PaZk0TXfJvKawcf6+F
         YCTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to
         :dkim-signature;
        bh=InjAVFYXBl3GO/57PaoNQaNvJqjPduaNKa2tmuWIaII=;
        b=iVPLu0zZjwQRxi1FmY2Gd0Q/6SuY9S4FZU+CotJ8ciZXNi0Rr+siNesRhAtACElInd
         QoHRDdcASrJNmObcuIuxyZUGfw7Q2X/+/uL09V0zDiimWMzQQFet8a0uBrhAKecV87Z5
         elWIZbVWA+g6XRLk5ylmOUECWcM9Yjcpux2kWqaEbW+SJuFkjt0vR2jw94l4kDx524to
         JWO2yb5u4KVvMQ+bJKjUWZYJFX8vzGySmG4i9A7mgoGqLdwbeGjAH29czyUtXPoVpCEb
         t6OyrF09+hqZ54IKiHOWSj1nTkwkaofViTSODw4K3i5smuLcorvMhEtebPsiPjja9Ikt
         KJxw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=r5KC9PQ3;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 138si405311qke.245.2019.06.13.14.28.03
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 13 Jun 2019 14:28:03 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=r5KC9PQ3;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:45702 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hbXGN-0002Nh-63
	for alex.bennee@linaro.org; Thu, 13 Jun 2019 17:28:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48953)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <richard.henderson@linaro.org>) id 1hbXFo-0002IP-Lq
 for qemu-devel@nongnu.org; Thu, 13 Jun 2019 17:27:29 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1hbXFn-00087e-Jq
 for qemu-devel@nongnu.org; Thu, 13 Jun 2019 17:27:28 -0400
Received: from mail-pf1-x443.google.com ([2607:f8b0:4864:20::443]:34605)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1hbXFn-00087C-Ed
 for qemu-devel@nongnu.org; Thu, 13 Jun 2019 17:27:27 -0400
Received: by mail-pf1-x443.google.com with SMTP id c85so66486pfc.1
 for <qemu-devel@nongnu.org>; Thu, 13 Jun 2019 14:27:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:openpgp:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=InjAVFYXBl3GO/57PaoNQaNvJqjPduaNKa2tmuWIaII=;
 b=r5KC9PQ385E1UtOo0TV+RRYz6oEx6HYnDQ51A5aspG8VWYmW+H4J/1pboXvR+Zx99+
 iunLqowxyd7HF/D5sKqLyPZjuIM0ZRaXFBX96v6yrNdECli9WskMBl9WoashxxaD9l92
 oAjSe4JGlVsobFqkYxH4m59sbLOQHKaZFTV2kZyfZw8YM05ci5Bv00xUjGJpSCq5Q/SU
 j8kNf9cuDlqntgmhXOcQHkw4ycRFQzzhEaloEEhXQn1wucZrD3/2eq/izbz2gZit9xo5
 pu2BDVZ9wLQgMkMyGNwoW0L9EBhZGEyICnK46cX0eAxoCVxUlsYRIuYgEj9WjWn/W84+
 Xxeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=InjAVFYXBl3GO/57PaoNQaNvJqjPduaNKa2tmuWIaII=;
 b=Cywn9voHdxpvRpWvSNHViq51hl+zp3NTK4r0D0bFl4V42P1XsfzJCLvEmW6u9dRvCN
 iRnJOLNT650neCq1DCvDPgxyelLcBO9Vdp9NxI6qU0+lT2jCxvFRQkj2wBSnbRFdfySE
 c+lzWcKZYRUKPc4Vao4z7fDF+kOS+i/XETZixBPaIQ2eJaA7842HKrQtivOarBm49PWE
 TOhXw2XTcsfUY9UIW0jp0UWtCU7nknQgmL3qb5ibGk3fO0/7knB65kwOSe5uPFSU8/9D
 jTC+HYoBB/8+s44Vhy6LKOpVShHlIKOwhnBovLkt4GNxVgRcMtB73jtam+aAMZ3qOA0u
 aMOA==
X-Gm-Message-State: APjAAAUVO8hcWDh9D248+YfMg69PoWNjUfALvRzg9fxNd9pWst4zyOld
 563uQRmq7gJjEus3P4tfTjazMNmUqRY=
X-Received: by 2002:a63:441c:: with SMTP id r28mr32540324pga.255.1560461246117; 
 Thu, 13 Jun 2019 14:27:26 -0700 (PDT)
Received: from [10.10.150.239] ([149.199.65.200])
 by smtp.gmail.com with ESMTPSA id 27sm804454pgl.82.2019.06.13.14.27.25
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 13 Jun 2019 14:27:25 -0700 (PDT)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20190613163917.28589-1-peter.maydell@linaro.org>
 <20190613163917.28589-7-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <409b6e38-eea8-5ae9-aba9-0780ba3bd053@linaro.org>
Date: Thu, 13 Jun 2019 14:27:23 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190613163917.28589-7-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::443
Subject: Re: [Qemu-devel] [PATCH 06/12] target/arm: Stop using cpu_F0s for
 NEON_2RM_VCVT[ANPM][US]
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
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: IjLzVAUn4CpD

On 6/13/19 9:39 AM, Peter Maydell wrote:
> Stop using cpu_F0s for the NEON_2RM_VCVT[ANPM][US] ops.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  target/arm/translate.c | 7 +++----
>  1 file changed, 3 insertions(+), 4 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

