Received: by 2002:ac2:5937:0:0:0:0:0 with SMTP id v23csp737529lfi;
        Wed, 25 Mar 2020 08:19:41 -0700 (PDT)
X-Google-Smtp-Source: ADFU+vtCnf1DpN1dsB0BxaAH4i/E2tEHRq8Ugm8PwtlhEQEuoe+E4W4cvex2LQloapclgPE5whR9
X-Received: by 2002:aed:3988:: with SMTP id m8mr3519358qte.9.1585149581395;
        Wed, 25 Mar 2020 08:19:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1585149581; cv=none;
        d=google.com; s=arc-20160816;
        b=WIzZ3FvGw4EIynvnYQ8bSPst7spg2oH8ZtcuN3CQ3N7fQlafM/p+D4sC0ikLH8hsT7
         jBY56BPfa/KA4AdxqOTbYJrZ5jzY1Uc72oR3VVwhe51BqmuQRBE0yrc0vei+OG3GVBDa
         8rU/r8L26Kp7+m0AnzuHpHLBENByp4gkyM0DJd8S3GoNAjStYYbIFTZs9IXNLozhHaEP
         OUtPXJAiQolCeelAHIYejr4Iq2QxonOym+oHYLXtorkaiwqfLqCDsQc6U+yswS1anfT0
         1gkkQWHuEgZgDoC1IbTyoG2dEaw/gpxFJhdbo5EbuYtRmlryCqW1f2XJz2GAAAQU9nEr
         484g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=cjQxdcEHAyyi77Hmi1EF0Jnp+aQ2HOZBpxIc6vZxveE=;
        b=hYa2fWXjtefO8HRQ4+bH9Nd3529ctDKfZ1VRyzobSLZENPf05deThRYqqpln8wWSNH
         7Oh0sFs4mXnj41uSTGpAglnzsTqNilRgXa3gLD/aKWiwDgqIqSCKi/MphHqZeRow+VWM
         htsno9yzNUlMsFF2I/jVJh5wOvBdbtbPyVcnpdKWPUOtsWoYju4JMk2wYDyPbQqVBxeX
         vvThQHNDxJym4fuCQ0/9w9UFuuKOB9Zmc0Z35cw0yxkaQeJ9k0cJQt9S5FlDg35M64Aw
         i6VJ6AM+lsWLgRU47AVmnYzYLO0+VaFKQsIgP72S/3nV9gvCGLr8VKElIKjL6be1MA2e
         fcVA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=rBGvsIRv;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d185si12855123qke.338.2020.03.25.08.19.41
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 25 Mar 2020 08:19:41 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=rBGvsIRv;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:37998 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jH7oi-0001As-Q7
	for alex.bennee@linaro.org; Wed, 25 Mar 2020 11:19:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41858)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1jH7nE-0007iw-QA
 for qemu-devel@nongnu.org; Wed, 25 Mar 2020 11:18:09 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1jH7n9-0001iM-R1
 for qemu-devel@nongnu.org; Wed, 25 Mar 2020 11:18:08 -0400
Received: from mail-pg1-x544.google.com ([2607:f8b0:4864:20::544]:42230)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1jH7n9-0001go-L6
 for qemu-devel@nongnu.org; Wed, 25 Mar 2020 11:18:03 -0400
Received: by mail-pg1-x544.google.com with SMTP id h8so1276780pgs.9
 for <qemu-devel@nongnu.org>; Wed, 25 Mar 2020 08:18:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=cjQxdcEHAyyi77Hmi1EF0Jnp+aQ2HOZBpxIc6vZxveE=;
 b=rBGvsIRvm5GCHHfaIEa2rqI9soqSjbb/IhZQOe5EWQle0DlU0AFLujshmZBJwaD6Kl
 KgIBthWBx2r2rm3YsBqCMRSouVBv9MzrUkInsFr/wlEI5iorAm5YrAwGoZsZoT3uRurr
 svLoa8GPNwKDw/TfjHPNV3twNU/SgTPI34MC7gHrFinAWvOiLqzmfCAatfB/I8wz6+ER
 aqJMJiFM5yCkY6GzJ6irSQdj4+D2QTzoM9KkXCPoTMHxe1rnDQO5r9v+O6avnGIi0zuD
 dPJytTJTdTZcDSPXuDmYd9QM5wo/BYLRLIsrTcUdCsjIDMbfZIONrj+vv8uP5+nxFKxC
 5iiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=cjQxdcEHAyyi77Hmi1EF0Jnp+aQ2HOZBpxIc6vZxveE=;
 b=Mn8gW8YYIpEptvbR/UnUnfFDf9i9EfEZCXYLJomX0Ft4utP1tDPum6Wq5cugJbMiVD
 svDFqXGLfYWkO/WGfdErzWuwMyTk7krHkBkPAtncGYw0ZIkP/rhehX9JWPYIf+rvbIVC
 95rnnsquuvIKm/S0wYaGiFXHI99o3MKusBGNhtxNxlOqglz56sOCTWybC18zZaX2vO7b
 cyHBT159Y0I3gE2ip2LnX9URyd0Kd84tNkddKH7hIUUcVPjpG/p/fONhoLaOZubzu/gS
 51qdctP6UQb3rMaNN80ivmbGvv1r7S+9BR+kcpPEhgkUA0JomYY9+0QTu8++ucsiYpO8
 J4LQ==
X-Gm-Message-State: ANhLgQ2tjDYZW3+fZLTEmwKazOWc3zjGRVbUowAINwfoy3srTepiecMF
 3VEf/8wfX4dXwrzuLcKbrj2lqA==
X-Received: by 2002:a63:602:: with SMTP id 2mr3556379pgg.356.1585149482026;
 Wed, 25 Mar 2020 08:18:02 -0700 (PDT)
Received: from [192.168.1.11] (174-21-138-234.tukw.qwest.net. [174.21.138.234])
 by smtp.gmail.com with ESMTPSA id x27sm18940865pfj.74.2020.03.25.08.17.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 25 Mar 2020 08:17:59 -0700 (PDT)
Subject: Re: [PATCH] hw/net/allwinner-sun8i-emac.c: Fix REG_ADDR_HIGH/LOW reads
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20200324212103.7616-1-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <3ebc92c6-3ce3-53ea-5d35-0da925825d05@linaro.org>
Date: Wed, 25 Mar 2020 08:17:57 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200324212103.7616-1-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::544
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
Cc: Beniamino Galvani <b.galvani@gmail.com>, Jason Wang <jasowang@redhat.com>,
 Niek Linnenbank <nieklinnenbank@gmail.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: /YQc3a7gFVwb

On 3/24/20 2:21 PM, Peter Maydell wrote:
> Coverity points out (CID 1421926) that the read code for
> REG_ADDR_HIGH reads off the end of the buffer, because it does a
> 32-bit read from byte 4 of a 6-byte buffer.
> 
> The code also has an endianness issue for both REG_ADDR_HIGH and
> REG_ADDR_LOW, because it will do the wrong thing on a big-endian
> host.
> 
> Rewrite the read code to use ldl_le_p() and lduw_le_p() to fix this;
> the write code is not incorrect, but for consistency we make it use
> stl_le_p() and stw_le_p().
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  hw/net/allwinner-sun8i-emac.c | 12 ++++--------
>  1 file changed, 4 insertions(+), 8 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~
