Received: by 2002:adf:e804:0:0:0:0:0 with SMTP id o4csp1620811wrm;
        Wed, 9 Oct 2019 17:46:42 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwN1Bkh9TP2/sHBKzJe7CIc3hXUrFmQZDSLjrLkEaiV7VSmO7LR1SIRVgMqtBodo7CpV594
X-Received: by 2002:a37:a74d:: with SMTP id q74mr6331128qke.441.1570668402038;
        Wed, 09 Oct 2019 17:46:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1570668402; cv=none;
        d=google.com; s=arc-20160816;
        b=BWe7nb6RWFJDQrfo7Cl0B4bQD3qbHvf2aSfe6VN8jiZKIjZ4msddvOxT7hGfdpn0VO
         jJb1KV0ps/bTiKkFFsQp50ortbx2i+sBDHOjEUvVT6mf4ryHE2+YDL43rlfGYOoR6RSO
         usiWjfJnHAv4KsqXgLQSkN8uQjc5HAzOPGVZsS7HvLeE2zdSFsIvpaMhXch6KAs93BcY
         fV9fIMPadd+vKbUoV9yFuTdRRxUJqQy1egVdbOU+NRpQjIzOYh5waRSkveA6mXE5P2fC
         TJ+ae6RCGddkquJ+AzQaDd5BleVOLjAMFfGnHD+Tpkc9GIae+fvBM/GQW2xdV/Cv1DeM
         Zh7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:openpgp:from:references:to:subject:dkim-signature;
        bh=il4vGgq+RyucRseA0Lwk5HiCmrP4D1q9Jv4fY3atrRY=;
        b=TE1JwSdx7WnNE+SjWS/aQqxNt9dsOttc3wb0XyZRAidO7iyWDw4UvWhJwkBCrXuLRa
         3Iq7irM6+aZyh5X858+t/o4JB2SQ1pQgaU9SMpsrDkaNVVQOJ3mucGrr4SuQu+rd3U/+
         jbuHc+T+Z/hmnY7mhB48VXl7GnsTMq3I7hHhvijBirGtII0HvK9kaAKohMM9ZRD53aE6
         7rOr20BbZ6hZ+OE4RUZnpSW/QQDOEocdCQLyGSBcKAcnFLsc1aR6AdCqc7efQzb/gIls
         LgxYbI065to+Lf4eSfVTosfqwT5W4elv56r6fN15Irn12fFHZTwFB3fbYb0xI8Kh+68K
         tLmg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=m+R+zKx+;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m23si3833719qtp.225.2019.10.09.17.46.41
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 09 Oct 2019 17:46:42 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=m+R+zKx+;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:32884 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iIMbJ-0002TL-EY
	for alex.bennee@linaro.org; Wed, 09 Oct 2019 20:46:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47027)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1iIMaL-0002RQ-SS
 for qemu-devel@nongnu.org; Wed, 09 Oct 2019 20:45:43 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1iIMaK-0003ob-U7
 for qemu-devel@nongnu.org; Wed, 09 Oct 2019 20:45:41 -0400
Received: from mail-yw1-xc42.google.com ([2607:f8b0:4864:20::c42]:37492)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1iIMaK-0003oQ-Pp
 for qemu-devel@nongnu.org; Wed, 09 Oct 2019 20:45:40 -0400
Received: by mail-yw1-xc42.google.com with SMTP id m7so1530699ywe.4
 for <qemu-devel@nongnu.org>; Wed, 09 Oct 2019 17:45:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=il4vGgq+RyucRseA0Lwk5HiCmrP4D1q9Jv4fY3atrRY=;
 b=m+R+zKx+iNFpWvfmxrdDGKyBc0xhr/CZ42Cd9eAic6n7IArw6YkjShUkwOf/fWUc3I
 BWNflj/ustUXERqvICYmuDgvF7VdH55J/jYnIHwxunvKaj5Mw7L+/mfBBmv02SBao3Nk
 Nih8htuK/oTAEXZHhTxWKgdzPLpPNPleg2Hlaxv9LFE8h35qVHAHLEjq0GHRuQ/vcEH2
 gSiWH1UBE6uA8O6PR48OGVS47ixsjDblBtprhrwQRKXbzkB+Jmtj9EQQ2eTHWfHeVNW6
 M5iSreEMJOfZLedCEtru19NOvgyojMS7mnyII3FBvyd5FsmYl0VMYrAdWIcDvA5SEYZz
 swxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=il4vGgq+RyucRseA0Lwk5HiCmrP4D1q9Jv4fY3atrRY=;
 b=uG8iU/G1CUOrScevL8wMPOLduv6PAYcY3WE/iONXy/XyuG8VSXtZ+GgtnqpMW7E9oj
 R0blkTIxGsdq2vRcJs+1lv3PIRosmK7dEEMkjsJE7VVJd2JgxtXdwsHqFxzrESqMZt02
 FVsc9Kg1svm0ca+2yXE2c1gWqfxoMQeTJVt3hOsUl9f4VGTCMJEmzbyJA5yYhZqSC2e5
 V8MLEtF0vi9cIY05l/9Evc3YnaJ4LZLHUw203rUHmsB7GWt6K6q4lFWFOvREsaBIxRzs
 jasbavCyBLo7QnyTJ8iDuqJAxztCo34cT9cc2ZlHtcKhJQbWwQdkT3y+zrSTwJCJksQc
 8Urw==
X-Gm-Message-State: APjAAAWyF9siLQHxTTTP2y02VG9mmLXtni/Llg12n8p3I0AqP9Ua/zTt
 VDZGqXgc3L/i87b4aK//6l53uQ==
X-Received: by 2002:a81:2b09:: with SMTP id r9mr4764566ywr.346.1570668340115; 
 Wed, 09 Oct 2019 17:45:40 -0700 (PDT)
Received: from [192.168.1.44] (67.216.151.25.pool.hargray.net. [67.216.151.25])
 by smtp.gmail.com with ESMTPSA id q124sm1066661ywq.8.2019.10.09.17.45.38
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 09 Oct 2019 17:45:39 -0700 (PDT)
Subject: Re: [RFC PATCH 1/5] target/arm/kvm64: kvm64 cpus have timer registers
To: Andrew Jones <drjones@redhat.com>, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org
References: <20191007170622.1814-1-drjones@redhat.com>
 <20191007170622.1814-2-drjones@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <e9b7710e-72a5-8bba-cf78-b7d692657fd7@linaro.org>
Date: Wed, 9 Oct 2019 20:45:37 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20191007170622.1814-2-drjones@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::c42
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
Cc: peter.maydell@linaro.org, bijan.mottahedeh@oracle.com, maz@kernel.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: /2Znk76c/iUm

On 10/7/19 1:06 PM, Andrew Jones wrote:
> Add the missing GENERIC_TIMER feature to kvm64 cpus.
> 
> We don't currently use these registers when KVM is enabled, but it's
> probably best we add the feature flag for consistency and potential
> future use. There's also precedent, as we add the PMU feature flag to
> KVM enabled guests, even though we don't use those registers either.
> 
> This change was originally posted as a hunk of a different, never
> merged patch from Bijan Mottahedeh.
> 
> Signed-off-by: Andrew Jones <drjones@redhat.com>
> ---
>  target/arm/kvm64.c | 1 +
>  1 file changed, 1 insertion(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~
