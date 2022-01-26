Received: by 2002:ac2:54ba:0:0:0:0:0 with SMTP id w26csp3057549lfk;
        Tue, 25 Jan 2022 19:04:49 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxlN/HKOHUXWxDXabNwYTLojo+LtzG1NYKYm7vhNN1s/nUlkb9Go2P0sN8dnrqBfW5pQlPO
X-Received: by 2002:a25:b8c6:: with SMTP id g6mr36002487ybm.371.1643166289783;
        Tue, 25 Jan 2022 19:04:49 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1643166289; cv=none;
        d=google.com; s=arc-20160816;
        b=sK+JvbGK0NFnMTQSKE4Cymhzk/zZRjAPwp96OUdlRCRLQsgc3K3YsmtsnLi5MeQ8OG
         R/THKLjYMcEY3YES9ntr1e300BU3m0Vs+tlNAxuM437t6GEyAro41aZb3JEm0ZA5lP6u
         0HjDw7uczGIyhiwkUm6I+gvuvvuaYx0nWgyP7i412USwj/ULYV1W2NpHK1JG0drD6bfW
         BeZRLqzfwd4AohNYlbdhOfm3K3r2uMoMxXCvMOzk0+nGHShiifkoK95cu7NDs1Ubpzpb
         QlGiMQwy0KjsmqEXqOrpxhcRHeYZS8z95v31nVosD7y7PUt4/lXUwV5jPYUj0GJjbnI1
         NkpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=from:reply-to:sender:errors-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:in-reply-to:cc:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=wZYQgSQwR0DSDv/sJ4O4TGIxqP5GJY9/3ixuUwUGhn0=;
        b=Q2sfgcZgRS2N5R42lN/aQYDDmycvWLW+V8oo8Bv42oaMf0jd3hiQ0Pa8eaJyF69ht4
         SQgL4kqHi21YDzjaqkQ004XCP+IK9QtD2h0fcv5BdkvVVhX3KpVWC82DPtJUfDOftb1u
         cuuJZEJs971tIdqrUyjdBXmpMBD5L7kEKsehorDlaywSwNxbHD0SweKZOgSS0MbcqLFC
         74ND2Jza6L1K4GHkFhXpCiK5nDxJB/X7IhQZAAMmarOannKP3cmfb0R/lNe+wM9kyiVu
         nXNiilaI/kzDWJu0GjYptDHXpoG66A3eP3nK/myki7YAgpOaGmerHfhllFyAWGVQQyy+
         MOzg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20210112 header.b=TvggB3ad;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id k3si3622411ybo.154.2022.01.25.19.04.49
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 25 Jan 2022 19:04:49 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20210112 header.b=TvggB3ad;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1]:48746 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nCYc5-0004SO-7i
	for alex.bennee@linaro.org; Tue, 25 Jan 2022 22:04:49 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60626)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nCYXQ-0000GG-Cn; Tue, 25 Jan 2022 22:00:00 -0500
Received: from [2607:f8b0:4864:20::42b] (port=42581
 helo=mail-pf1-x42b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nCYXO-00050e-QP; Tue, 25 Jan 2022 22:00:00 -0500
Received: by mail-pf1-x42b.google.com with SMTP id i65so21478886pfc.9;
 Tue, 25 Jan 2022 18:59:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:cc:from:in-reply-to
 :content-transfer-encoding;
 bh=wZYQgSQwR0DSDv/sJ4O4TGIxqP5GJY9/3ixuUwUGhn0=;
 b=TvggB3adE6DUp0kV1sOId+8onPGD2eSY3/vbTY47ZRXjTPtfooRY2EJm9TRk0DVg/7
 n8ghV+rXf8ccqXsKCXOjft743gzXnll8j28c6DhJ/5ypZowRueXluxZTVnCoHn8uN0eT
 a/tWL1WkRrRuBU2ltiA1lOmRfABmM2DeA/4p1KPoELMkxp1F8oaAsG1DAO3Fk9s6oiyK
 7cVgRS3SQPezCoNOzltgWXkCSVE6dYK6tbpaQpIT7/sSnABwMSmqYRcYJ/pQ1VLPoRot
 4sixo2fIf3UMFPxBbUWrfM+X0uHYT574Lxg/ji1ncLaHj0y4ehnfUyipsTSB+JkZgIpE
 1CyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:references:cc:from:in-reply-to
 :content-transfer-encoding;
 bh=wZYQgSQwR0DSDv/sJ4O4TGIxqP5GJY9/3ixuUwUGhn0=;
 b=1EVO/M5T9cTCHOzYQA0/Xs3ze9BqtGEZG3DADyxw2aKBmrZz4G3MKh771c1fZe06LG
 1dDmHTsRFtjeiOvfKtLOScRy8FX8aZz/CCY6AL3+sUvvd7FE5y+x8ZJYdiKeMBRQRUCd
 wEyQupWNgQMHkdFF6jhB5zG3/IBrx8H+54tgzus4EA6O9TlS7K0n9qvdNOjx4kJbjtjd
 PXE/fWPI5p5r9Qj8cdfSPlfMz4MZ8u5ZJXMrGa/g27kt0+fSa9nJaB12qHL/pcw7lERv
 7jdnr+8BiRkSU80quTVSR+2MEM+HfeQ9OTxPeOXZr6Gc/VVP4lPbfNQCmMLTxgLdTpat
 O56Q==
X-Gm-Message-State: AOAM531VmeZrraysvIraY1GwyoNJmCrlHqTitFmttwaD3/b8Nv83WqyE
 ZLQ9L9sKf/qfl9QK/r9FRZM=
X-Received: by 2002:a63:2c93:: with SMTP id
 s141mr17277224pgs.337.1643165996441; 
 Tue, 25 Jan 2022 18:59:56 -0800 (PST)
Received: from [192.168.1.33] (154.red-83-50-83.dynamicip.rima-tde.net.
 [83.50.83.154])
 by smtp.gmail.com with ESMTPSA id h12sm15907093pgh.79.2022.01.25.18.59.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 25 Jan 2022 18:59:55 -0800 (PST)
Message-ID: <1e98b4ec-3476-387c-9dda-99a13121e22f@amsat.org>
Date: Wed, 26 Jan 2022 03:59:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.5.0
Subject: Re: Raspberry Pi?
Content-Language: en-US
To: Kenneth Adam Miller <kennethadammiller@gmail.com>,
 QEMU Developers <qemu-devel@nongnu.org>
References: <CAK7rcp9pFFvYnvwgX_9ganFsc8V5+c7keofM7PPSY3Fp82J15w@mail.gmail.com>
Cc: qemu-arm@nongnu.org
In-Reply-To: <CAK7rcp9pFFvYnvwgX_9ganFsc8V5+c7keofM7PPSY3Fp82J15w@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::42b
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::42b;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pf1-x42b.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
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
Reply-to:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
From:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= via <qemu-devel@nongnu.org>
X-TUID: pptEj1LyTRwR

Hi,

On 26/1/22 00:59, Kenneth Adam Miller wrote:
> Hello all,
> 
> I would like to emulate something on a pi so that I don't have to pay as 
> high of a translation penalty since the guest and host will share the 
> same arch. I'm finding that on some forums that people have been having 
> trouble getting QEMU to run on raspberry pi. The posts are kind of old, 
> in 2019.
> 
> Does anyone know if this has been addressed since then?

What you asks is if you can run an Aarch64 guest (virt machine?) on a
Raspi4 host, is that right? IIRC it should work straight away using
"-machine virt,gic-version=host". Cc'ing qemu-arm@ list to verify.

Regards,

Phil.
