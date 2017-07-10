Received: by 10.25.44.15 with SMTP id s15csp3636726lfs;
        Mon, 10 Jul 2017 09:37:17 -0700 (PDT)
X-Received: by 10.200.48.38 with SMTP id f35mr5756485qte.88.1499704637809;
        Mon, 10 Jul 2017 09:37:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1499704637; cv=none;
        d=google.com; s=arc-20160816;
        b=HSM4hDueOIE4s9S8p8rM2LserTRZ/VH2KHaAc4kw4GRVP++Zcc1Mh1rXyGylKfGKm8
         IvJndSdMAnLeLwn1SZ3/5XZUZoPzbO5pNIBh9kp+E1KwpeZYJBQtEjBfFhBM54qrz+gL
         pY/XBya4s0EwLDxPfRkpCVU/JnMU666TL6/SgETOsT8n3wDnq9/smFG41xKuJXwXVH9u
         jmJINxLvv+j9JCGqjzj2wo4sqvL7RUaeO1T8OFl9INVmViriXTTcd3UZgNTYGCpuw2Or
         GCd2Ag/QruQA7is+9e5X62R4rKFH/4HTDXvQ/0PvC70mOjNa7paaCkySaK6lJsSKV5+A
         Zl6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject:sender
         :dkim-signature:arc-authentication-results;
        bh=Kf3nvL5hR579uzfFNtk7En3nQWkfG+mIPNRatIb1auo=;
        b=DiDZ57qEps4i/yGh+kHiWbjKNtCyU83xTo+UiTnrJCtFSz5xW5Sa1xUC5KB7MQTboE
         CfJXzXZzeD8B8bwFqKJ4EjIz2Duyb5/rBWkTz/n6z8ItC+mbA4QkDHSbLJYl8iYFw4Jg
         WfMoqVFT4hOywWlSI1rC8rAcdyz83eNHzOlSiDPYjTFcQka3EkLJSWAoD4fdQIOniMi8
         m16td2a5g98ei+fNwx+SHFq3195wk292YLFuNF6U8Llbpqn1Bpv6MosRqEaYHIM2zz5V
         A6YqX8ZMG7loylWdQdPxCkhD6dsLFKaoCKh4uQrXPf1WBx7j/vW8zachWYxJc2FI/kh/
         hPPg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.b=V1QZ9kEZ;
       spf=pass (google.com: domain of rth7680@gmail.com designates 2607:f8b0:400d:c0d::242 as permitted sender) smtp.mailfrom=rth7680@gmail.com
Return-Path: <rth7680@gmail.com>
Received: from mail-qt0-x242.google.com (mail-qt0-x242.google.com. [2607:f8b0:400d:c0d::242])
        by mx.google.com with ESMTPS id n188si10998124qkb.292.2017.07.10.09.37.17
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 10 Jul 2017 09:37:17 -0700 (PDT)
Received-SPF: pass (google.com: domain of rth7680@gmail.com designates 2607:f8b0:400d:c0d::242 as permitted sender) client-ip=2607:f8b0:400d:c0d::242;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.b=V1QZ9kEZ;
       spf=pass (google.com: domain of rth7680@gmail.com designates 2607:f8b0:400d:c0d::242 as permitted sender) smtp.mailfrom=rth7680@gmail.com
Received: by mail-qt0-x242.google.com with SMTP id w12so13322891qta.2;
        Mon, 10 Jul 2017 09:37:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=Kf3nvL5hR579uzfFNtk7En3nQWkfG+mIPNRatIb1auo=;
        b=V1QZ9kEZaeyZxABu8PDF8uvxQMHykdVvDiRG9+p184dVhjD8Ow5F9cQq4BCBlQBzKj
         Ndl13HVNGl2IpAP8SiSblyf2czXbqCw/jQat8arR5qAI3bULy96he7I3Pf7wN7lOCwR8
         G/+JdxFTrBvmZrF2G23q6p87Np9N66J4ACKEnkIGQ1FSeeVxbYHs5y8Xyvxgv/onmzyz
         VLkBXsQq5v8P4cDxCdjvhz7gi+BNtaQ6RCw0GkWIwGCoqqocx/03AGvt0OwWq70kimp/
         BFPrGpi80DWQuTnNXWje/Ezx0Ix1JyNlZ6flrTKKn5DGOcVUxobze7YWenGZexlSjLzt
         KpMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=Kf3nvL5hR579uzfFNtk7En3nQWkfG+mIPNRatIb1auo=;
        b=ERPm9i4l255XAHP3MKzQZxAh4vZUERvrcpVA531lA7SXREaSyR9GQ98rBov9F0mKYd
         XmkzUBGOSGr8q7YX6tdHiOJ3LIEtVvu/ltZLJMfKMJYzs1W/0Xy35GuWlnpYzCIJ8XaU
         wSnYuRbrpgV4JeIqd7F7DkBbq00aoLEUjOmnhTircOd2rsmUkJCz7li+RQQ5YpB6cpc0
         DkyJ6idbv7q0F56bAuWLmMSLrBeljYvjchGteQMRAUt7isGju1eHyYX3uBCbuMHkFy1Z
         Y9u3xSHjH6NZ5uwuOGGUA24Onk7bmRy2bRaHWxPHIbFQMDCTNTd7SZHINj2SC+QwSZEW
         v6aA==
X-Gm-Message-State: AIVw1128Ya9kQaezoZuVchzLUF0GwVynDRq8dww6BfmuLTE45/3C3h9Q
	TyodfI0vUsmiEzHxM7g=
X-Received: by 10.237.42.226 with SMTP id t89mr5844171qtd.73.1499704637197;
        Mon, 10 Jul 2017 09:37:17 -0700 (PDT)
Return-Path: <rth7680@gmail.com>
Received: from bigtime.twiddle.net (rrcs-173-197-98-123.west.biz.rr.com. [173.197.98.123])
        by smtp.googlemail.com with ESMTPSA id z5sm8726619qkz.53.2017.07.10.09.37.14
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 10 Jul 2017 09:37:16 -0700 (PDT)
Sender: Richard Henderson <rth7680@gmail.com>
Subject: Re: [PATCH v1 4/6] target/arm/translate-a64: get rid of DISAS_EXIT
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 peter.maydell@linaro.org, cota@braap.org
Cc: qemu-devel@nongnu.org, "open list:ARM" <qemu-arm@nongnu.org>
References: <20170710154749.13624-1-alex.bennee@linaro.org>
 <20170710154749.13624-5-alex.bennee@linaro.org>
From: Richard Henderson <rth@twiddle.net>
Message-ID: <1e6a695b-92b1-578d-5467-569ec28b6a30@twiddle.net>
Date: Mon, 10 Jul 2017 06:37:11 -1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <20170710154749.13624-5-alex.bennee@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TUID: F2u12xBAxGJz

On 07/10/2017 05:47 AM, Alex Bennée wrote:
> We already have an exit condition that declares we should exit to the
> run-loop because wider CPU state changes have been made. Use
> DISAS_UPDATE and kill the architecture specific DISAS_EXIT.
> 
> Signed-off-by: Alex Bennée<alex.bennee@linaro.org>
> ---
>   target/arm/translate-a64.c | 3 +--
>   target/arm/translate.c     | 6 ++++--
>   target/arm/translate.h     | 4 ----
>   3 files changed, 5 insertions(+), 8 deletions(-)

I really thought it was clearer the other way around.


r~
