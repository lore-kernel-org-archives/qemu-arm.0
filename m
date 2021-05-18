Received: by 2002:ac2:51c9:0:0:0:0:0 with SMTP id u9csp462362lfm;
        Tue, 18 May 2021 07:24:43 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwHNSYjBwwQQS/dPJPkhL53TCJX+Vz55JK604qnVOFQK7dTmanxDCDANiFSw3ajfT1XnuZ/
X-Received: by 2002:a05:6602:114:: with SMTP id s20mr4466169iot.98.1621347883451;
        Tue, 18 May 2021 07:24:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1621347883; cv=none;
        d=google.com; s=arc-20160816;
        b=RAXkRRPTSa70zOEjFqr5J+N4XMTzzogC7VT7iTIYyUQP7J/sfETqRwUthdVxCRfqzR
         OWVfWq+KibctUtVFiHhvms5QmGeym9DgxR+CiBi1ODXT1+qUNkxQCWuvuSXaG2Fj7nzj
         fGqzCxU/pRQZ98Qhh7/Cochzetze+aubdplX79fyjwD9iWFk//MBq2yk0oGzIuIr7UTx
         c96PhDKcXRdD4h6jOxWrsNtaBG3Qh8T8gk3aZiWeqhrTs2k+Nvec6rHYMzN3V5XO7+5j
         2hiQ0JAoPyFWC/heS54Vx7dEJhQHoPXrME8+eVkRDF4Pc+jbuYKMdDTuAVZ5LF8rF3C+
         dT1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=fD5+JH+z+nRULNcjEPnUgqYNSG6uLIih6Ts1AftkTjI=;
        b=Fr8IRfIdaPZc1yEDDSx5bCnB2NT1OvXttsgQou7/4lEw1rdkS2gbkDmvhqxrViNmIf
         BgNJd754snDvjAJ3y4lUUj3aG6K433VDKvki3vwnxP/1Dz27PHzpEph9A8loRGQaj1wP
         DB4KMGzt6bb5vziHUJIzkcJY8QN4TMdzjyOmAmeLEkkeAcqdzqaiUVhG4HhBMsn3ueFK
         k5jEBoyKVKKQEBqncmkuGPCbkEuX2e9/zVyl26XWYzsZIZatlq2EzGqNo04pG7DFKpww
         rLo6dHuoi/9ZPuymnUZpSm29vXo482/gupDtv3hlXeAxhEyBEnVWhRXLXszmawCeFIQJ
         Yy7g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=v0ptJDPa;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l11si23044709jah.65.2021.05.18.07.24.43
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 18 May 2021 07:24:43 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=v0ptJDPa;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:39642 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lj0eI-0004x3-RB
	for alex.bennee@linaro.org; Tue, 18 May 2021 10:24:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47872)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lj0dv-0004vi-TZ
 for qemu-arm@nongnu.org; Tue, 18 May 2021 10:24:19 -0400
Received: from mail-vs1-xe35.google.com ([2607:f8b0:4864:20::e35]:46679)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lj0dt-0007Xg-NK
 for qemu-arm@nongnu.org; Tue, 18 May 2021 10:24:19 -0400
Received: by mail-vs1-xe35.google.com with SMTP id q6so793608vsp.13
 for <qemu-arm@nongnu.org>; Tue, 18 May 2021 07:24:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=fD5+JH+z+nRULNcjEPnUgqYNSG6uLIih6Ts1AftkTjI=;
 b=v0ptJDPaKklFXh7650xYxdpFM24ldWgYMtDeOjZ6S937XGoXPgJgALiazirWIf3UJ2
 diEAuZC/fJKuuTeJtT+jKmH1PAttSFo+iT5ZG5VgaOlPvovkmTvi4ICLtz38Ltuyqm5j
 O784EEisMEoQi0ALPwFSysZN3i4GHi6psKCg/ThxXsPpkpRdi7UxZabeRE9V/bvgZMg2
 qvbi8i8rjAbR7Wv0eVikiPg81qMTEUyrkDVcqmmIBCkg9qbURKBGqBHOhDzZUNImp6WO
 InaCdV+r2Skq7GgXOgzOi7kitxd+rs5uwRjQ3XtNtq3f+OZkhTwV5W/IIKN/fi6VMx+w
 rDIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=fD5+JH+z+nRULNcjEPnUgqYNSG6uLIih6Ts1AftkTjI=;
 b=ZynI9n38LxA2ZYMTNmI2Ah+LNkRQ3bCbgGyhsYfXiHmJj5GvGXzYklrQNTv5HJG/xn
 1h8o+yTDEChluV5saDrhaB7EdfcftFpvOSSHIesGxk+2DDpN9zbhEY1/WlMwh7TlRZE8
 XEGXDULeuTW8H8ikfrSSTOcVhj5rxx9yYjVDaLA1ek4gxdZK/Af4gtpabAbTx+4PBsaY
 Qszk4CMY1W4VpX/CVOWUL4iU0grKwvITVQm0DexvolQkEPZwGVNXOPHiRUMzOAZyoAfq
 fToz4rjND+K+x84ST+ruvPx77vqp986nPuk8XZjfs/470VzLjos5ZjAAp/ZurmVMmnMI
 Kh4g==
X-Gm-Message-State: AOAM531doHIiCMbpafdRu4/jNPsv59VOXY5RGjnFpc3cQunJx2iZfy8X
 ga9KK8eFVJTJIqcP4vDUsjitQalo51isDXwu
X-Received: by 2002:a05:6102:2322:: with SMTP id
 b2mr6622470vsa.52.1621347854300; 
 Tue, 18 May 2021 07:24:14 -0700 (PDT)
Received: from [172.16.22.144] ([45.235.253.15])
 by smtp.gmail.com with ESMTPSA id h129sm2951555vkb.36.2021.05.18.07.24.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 18 May 2021 07:24:14 -0700 (PDT)
Subject: Re: [PATCH v1 05/11] fpu: Add float_round_to_odd_inf
To: Peter Maydell <peter.maydell@linaro.org>
References: <20210416235928.1631788-1-richard.henderson@linaro.org>
 <20210416235928.1631788-6-richard.henderson@linaro.org>
 <CAFEAcA9_gDgL=QJASxS8ysDbFaNXYbMXAqg7X4jkYyM_5JTo2w@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <92a7f0d3-dcb2-1436-52e7-666cf9f4f9ba@linaro.org>
Date: Tue, 18 May 2021 09:24:11 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <CAFEAcA9_gDgL=QJASxS8ysDbFaNXYbMXAqg7X4jkYyM_5JTo2w@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::e35;
 envelope-from=richard.henderson@linaro.org; helo=mail-vs1-xe35.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
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
X-TUID: UsKaI+8DMrKQ

On 5/18/21 6:20 AM, Peter Maydell wrote:
> This code change looks OK as far as it goes, but there are a bunch
> of other places in softfloat.c which switch on the float rounding mode.
> If this rounding mode is only supported for a particular subset of
> operations we should at least document that in the comment.

Once the softfloat reorg is complete, there will be only one place to add this. 
  I didn't want to go overboard on that here, or necessarily depend on more 
that just SVE2 for now.


r~
