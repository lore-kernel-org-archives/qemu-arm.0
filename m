Received: by 2002:adf:e804:0:0:0:0:0 with SMTP id o4csp1624929wrm;
        Wed, 9 Oct 2019 17:51:40 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwAWB3Y36AeS36IMkIC8WfIBbFEIMDQ5WzimiCxdHp2VEhy7WfgWhuijxRyK7C31OwJzBce
X-Received: by 2002:a37:8d05:: with SMTP id p5mr6431977qkd.271.1570668700593;
        Wed, 09 Oct 2019 17:51:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1570668700; cv=none;
        d=google.com; s=arc-20160816;
        b=mFXAqy+jifo1qKyQXl0XHdqBIoJ2Sp35FizbkYBkZ0rdYuuLGwxcjWvs0pu7OUySm1
         YlQdyvohwyH+DRPhMXHr0XD8kXOzlwarmFVqvQJ7nHqSDxnomGMRFyku9wgN+04YPDqA
         5NBlJmtDR0z5Ah3PDFAAZSZ2sY/Xiy5mx2mavhaKQqbPiv9GfexTb15jnOSKsyH52M0t
         gasRFD7q0NaSEhNIWNZgDKFNLLIAmS2+XJefYXat1uk5b1ieID/bFi9cVlRagFxIZsh7
         5gwcCRGU4aelUOu8y1gogaoRdGyTVB0IVK9rfzLDNL3SuCeS5r6oKYlnELXZjT1KkB3f
         72pw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:openpgp:from:references:to:subject:dkim-signature;
        bh=ynBfoBkoBXRx80zqs+EHh2J4aJ9l8PJLh5DgksZACP8=;
        b=Ebh5vHFpN99KulNIWNGbNE7telWBxDuhVUxerVQHlumxc3GwHTou/ceDh7MqChwHLR
         kxYeSOdNMO9EEqrLH1WC0EJYzeeofT6sWI2lmc352lnYMXLBVUhgsZAz4fUoKRzwibvv
         OXigVEVDRLgAul8AibUrGTR2XqYOGBLmE8Shg/sWsVAPsjS/c1QUU5RSgk040R/7gOKk
         Hge358gmjVZDvUtUp/fbZw3EWgq6KceTrJNiT8xulD6tE5U6AjeVMmhnZPfwmJOIi8z9
         w8ajWYC29r0CC2he8yk8jsGK/UE7aX7uH5fa6h/T+/c+c3rH68bJEM6udm87JFR4cOkm
         qpFg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=jO6HC9TI;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c21si3717267qvc.160.2019.10.09.17.51.40
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 09 Oct 2019 17:51:40 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=jO6HC9TI;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:32962 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iIMg8-0005Wz-2H
	for alex.bennee@linaro.org; Wed, 09 Oct 2019 20:51:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47387)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1iIMfx-0005Tw-SP
 for qemu-arm@nongnu.org; Wed, 09 Oct 2019 20:51:31 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1iIMfv-0005l4-S4
 for qemu-arm@nongnu.org; Wed, 09 Oct 2019 20:51:29 -0400
Received: from mail-yw1-xc41.google.com ([2607:f8b0:4864:20::c41]:35342)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1iIMfv-0005kO-Bb
 for qemu-arm@nongnu.org; Wed, 09 Oct 2019 20:51:27 -0400
Received: by mail-yw1-xc41.google.com with SMTP id r134so1539371ywg.2
 for <qemu-arm@nongnu.org>; Wed, 09 Oct 2019 17:51:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=ynBfoBkoBXRx80zqs+EHh2J4aJ9l8PJLh5DgksZACP8=;
 b=jO6HC9TISuf/dOOJnquQsRGH73cn9eFNvqsMhb6B3lCYQPbxrhJn222OSdu4niGXtn
 fZUUNVmNsJBR3zgjBpKND45sZl1NvTA7HglECdppkdIUKRSICnRI/tW8d6oeCg98IlFx
 rf1e4V0QBsAH5vD+nb+p9W8qpffM0CvnH9Wc6Zm0JgczaOIgvQT/b89gxHAJ8hQpEebn
 5DzFAyPEQbDr0dpl9xpYH2i2m+9tUxDbN1xuqR6jpl4tCO1ILihwJAqvpw4WkHpq9JbZ
 o1Jzx4bmENPrtm0eIOjGxskX+E3aKjF7YttxtaRqUv3W2gkCSQDkCo2n5kbJahs9H4e2
 eDCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ynBfoBkoBXRx80zqs+EHh2J4aJ9l8PJLh5DgksZACP8=;
 b=lbadiNjKGGQtG5/J8Pvij7wburHjjY9obhzJ7ufPkfj9p8josErmAnja6OUJxwH3up
 XyBPgFVyb9OH9ygX/4vx3A5XT6kakbfQlg1JCacU7IN5kFwbaD0Uubrd4GzgjBb4WLoQ
 b+CpCQqmBFaQopF3Owzy0IQmQZ9ZgXAUPOXW6Fi0P99CUYIBXKk/BWx4jveaQS0mzmWO
 hEwsM0PPfz5ouDVazb8TUXO2dVI85jB3xd4tZBTe/oZCbjKrHiHSanuIMGKFpg2ZaRua
 yaHHhi9VSDJ8snIcLO+AROnHH6WjskcRKCTwAOyXGGMq+i7Egp3Wn2Da5HpeeJcibN9V
 Egsw==
X-Gm-Message-State: APjAAAXrdIQlkcd4ChRZTy8v7LGoinnf7qi4TmuBmmdOHh3gguH9T4zd
 MQtFa7rwfaDrsqAvhA+gXWCIKQ==
X-Received: by 2002:a81:2d57:: with SMTP id t84mr5338152ywt.164.1570668685566; 
 Wed, 09 Oct 2019 17:51:25 -0700 (PDT)
Received: from [192.168.1.44] (67.216.151.25.pool.hargray.net. [67.216.151.25])
 by smtp.gmail.com with ESMTPSA id p199sm986568ywe.1.2019.10.09.17.51.24
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 09 Oct 2019 17:51:25 -0700 (PDT)
Subject: Re: [RFC PATCH 4/5] tests/arm-cpu-features: Check feature default
 values
To: Andrew Jones <drjones@redhat.com>, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org
References: <20191007170622.1814-1-drjones@redhat.com>
 <20191007170622.1814-5-drjones@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <80b5ee3a-bb6a-a151-d989-144d7faf535f@linaro.org>
Date: Wed, 9 Oct 2019 20:51:22 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20191007170622.1814-5-drjones@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::c41
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
Cc: peter.maydell@linaro.org, bijan.mottahedeh@oracle.com, maz@kernel.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Mn3+U+2DOJwD

On 10/7/19 1:06 PM, Andrew Jones wrote:
> If we know what the default value should be then we can test for
> that as well as the feature existence.
> 
> Signed-off-by: Andrew Jones <drjones@redhat.com>
> ---
>  tests/arm-cpu-features.c | 44 ++++++++++++++++++++++++++++++++--------
>  1 file changed, 35 insertions(+), 9 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~
