Received: by 2002:a17:504:998a:b0:1be9:327d:8ee3 with SMTP id i10csp3992488njn;
        Thu, 16 Jan 2025 11:45:52 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCXrQzelv3es1VKrxucgmqNw/Bqbjaw26XoFb8wOa8MFpMe4LFFmv1A9HWnLBj2JkHtYGzo1Wvs21wJW5w==@linaro.org
X-Google-Smtp-Source: AGHT+IGd9dfRsHDOL+tt3VU4W72reGAVO+6qlumCbww/j9axygfAwMR8QBXPkIHksfZaIaycnJio
X-Received: by 2002:a05:6214:5f12:b0:6df:8c25:2c81 with SMTP id 6a1803df08f44-6e1b2140b9amr1666366d6.5.1737056752365;
        Thu, 16 Jan 2025 11:45:52 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1737056752; cv=none;
        d=google.com; s=arc-20240605;
        b=Sohl3aIRhGwxbQljMhucZZP6XvXGd8HZO3pE4mkxWDEjvWOqj82J/MzmhjGCS/G0uU
         dlI4W/KbDBC4h3MlwMoeq3WtAit7ESJuaSIMo4F5Jk0cZKxWfdVvqiR6JlYUjq0rjqU3
         mOC3bzyszPebkGW63CgiVlX5HXodFO3MAYcaBAcI/mP2BGN++NbzJjPap+JopGPd+j5L
         91rZZu9BsVQBZvyd7jvntIz2Hq/ejZp/QHj+8UVQZFizJyCfq9bH7NELayHMLKv5167r
         UyWUrg6zts632cVibXVPZ5nCTt3tS1eMrklpO8QRWq0M7Fn530UnhTVLvRIDEOxU03oV
         hO1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:autocrypt:from:references:cc:to
         :subject:user-agent:mime-version:date:message-id:dkim-signature;
        bh=X1OxdtHqhQlGlXIQ+Xa4QBGNqzVrhE8uklyYo9oDzvk=;
        fh=gZ7KKGahDeAc83ddzynggRafpTPf1eCd6dFSLfUOeao=;
        b=WeVydyEcUUs3V/WxxQuhLYWeiSwZjO9Votnzmmdso+PBJKk9jMprihg83pNuTSqWP7
         5vny9dShZlhAnXey1XORdK91H9JuLoPoccAanxUOeEt02ipIxi7y1vyR/rHyqbyeX6JV
         eGLqzDZCKJvZ2auHr980Lcz80I9ObdnEfXV2haq/ATf+oxuE8VSGyZ7AW5kcHvtTbROF
         AIr09hwgKWuAm58Hsqk06BBSSKFf4vfFN2SauCTvXsMT7DrSAY03XHY9N1EuaWQLftLp
         FwzxY0l1zxcpQjRiTBBRFV/5Bch8BBwQ/RLSBLfs1pD9o+fMlJ4yVFw9/0Vrs8ADPTsQ
         ZbFA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=h3w50vTM;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6e1afcd982bsi6204026d6.196.2025.01.16.11.45.52
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 16 Jan 2025 11:45:52 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=h3w50vTM;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tYVo0-0003zX-Sm; Thu, 16 Jan 2025 14:45:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1tYVny-0003yg-Ai
 for qemu-arm@nongnu.org; Thu, 16 Jan 2025 14:45:26 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1tYVnw-0004y4-0w
 for qemu-arm@nongnu.org; Thu, 16 Jan 2025 14:45:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1737056722;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=X1OxdtHqhQlGlXIQ+Xa4QBGNqzVrhE8uklyYo9oDzvk=;
 b=h3w50vTMdMxRYgkL1Sz9ynS+TEZAIXDybZk1JYDA9pJq/ZZndwAaXi6q+URo084cfsGD56
 2+UMXTouU/7FsMF3sphPsJMJPtA8enG0jHATCTgBZrU41zxLi+CHVYeAsJnT9+tBqA9/Ua
 uZbWacabkOJrcwImkzb8yqL+rNpiKo4=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-294-9qwliNjLMS-2fDe-7oa0Wg-1; Thu, 16 Jan 2025 14:45:18 -0500
X-MC-Unique: 9qwliNjLMS-2fDe-7oa0Wg-1
X-Mimecast-MFC-AGG-ID: 9qwliNjLMS-2fDe-7oa0Wg
Received: by mail-wm1-f70.google.com with SMTP id
 5b1f17b1804b1-43673af80a6so8994055e9.1
 for <qemu-arm@nongnu.org>; Thu, 16 Jan 2025 11:45:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737056717; x=1737661517;
 h=content-transfer-encoding:in-reply-to:autocrypt:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=X1OxdtHqhQlGlXIQ+Xa4QBGNqzVrhE8uklyYo9oDzvk=;
 b=JBGV1bHNxCQI7j+JepeswzVU95Vfwiea5saMkxvdfUoNDfEXqS+bvCQg7wsmgwAWRk
 p6kIOgA6C0ztMJ8ms+GKGPOgbzE0vl2gzf3DZea/e9uE1B67Ec5LMID8IXlvTAPHJCJU
 b8y3POnisC6c5CMg5YE40g6WOD+p82iCrp1UtXbmVQWnEIlUQKOfRV0qeHskEKQtdjQP
 iLTAnDw4N23PxuCyr1Pn9Ld8SEarpzT2Nu9JW9ewbLhiF1zgOart+FEUTRq5zpQ5rOMw
 QjnQNXOFcZM4kyRnicDLo2VuvpQBhl7hGV7dMYkVIawet9EmQpl8ttW0VMciebew0oMK
 YBmg==
X-Forwarded-Encrypted: i=1;
 AJvYcCULD+YMm3DRKB87L2Xjc5uB2FMqY3smTYYjavs4btoCQYH9PN3Jh8SuuDAWJzUixkUho3Uf2QcQCQ==@nongnu.org
X-Gm-Message-State: AOJu0Yx23YJYBKaxOj0Z/6H3m20XvVrOfWmYUghhXRRzgYUVUXfSWSs2
 7cbmSkudRTbz71RYlM8C6oie5rJtLyzmagcmFN+5ezvnOC8AV61i0QBAage/HQRtkM2rSFjI48w
 TLktyQabePGLpYmhb39RaBk9EX5TLSbeG/o2VIXsbqtBQwE6HBtl87oabCg==
X-Gm-Gg: ASbGncuWyR6YhVFch2JbS1bxyIpn1bpjvAGjDNclpi8EyZP4c8wogDJULo+ypWVJEkK
 rUwopA1idoju6Jpm1fcnLBffG7RCsF3Rhvd63iEZCc/SGywQWWwChbtZPkzy04zHePl/g6HYC2H
 CIVYZ7ItC7mU6Fj9P4A7bnNLzKpp7P27Sf7Oipf54nIUCoS38rnJ9twf5v7KcBNv0VBVlAXjf7e
 tYC2HrEd3Z97MtBPGUL+Ohg0iZY/ffxGbgKmqi/aE8jPjqdWKwNSdWXe6I7FGpyRS2NY7mt5RTy
 B+a8k0bQmH+e
X-Received: by 2002:a05:600c:4713:b0:436:9227:915 with SMTP id
 5b1f17b1804b1-438913caa3cmr50745e9.9.1737056716970; 
 Thu, 16 Jan 2025 11:45:16 -0800 (PST)
X-Received: by 2002:a05:600c:4713:b0:436:9227:915 with SMTP id
 5b1f17b1804b1-438913caa3cmr50555e9.9.1737056716588; 
 Thu, 16 Jan 2025 11:45:16 -0800 (PST)
Received: from [192.168.0.7] (ip-109-42-51-119.web.vodafone.de.
 [109.42.51.119]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-437c74ace90sm70177015e9.16.2025.01.16.11.45.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 16 Jan 2025 11:45:16 -0800 (PST)
Message-ID: <66d1701e-473c-4d5c-a987-5f985d2251c3@redhat.com>
Date: Thu, 16 Jan 2025 20:45:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH-for-10.1 v2 10/13] hw/arm/virt: Remove deprecated
 virt-2.11 machine
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Igor Mammedov <imammedo@redhat.com>,
 Andrew Jones <ajones@ventanamicro.com>,
 Shannon Zhao <shannon.zhaosl@gmail.com>, "Michael S. Tsirkin"
 <mst@redhat.com>, Ani Sinha <anisinha@redhat.com>, qemu-arm@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>
References: <20250116145944.38028-1-philmd@linaro.org>
 <20250116145944.38028-11-philmd@linaro.org>
From: Thomas Huth <thuth@redhat.com>
Autocrypt: addr=thuth@redhat.com; keydata=
 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
In-Reply-To: <20250116145944.38028-11-philmd@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: QrdAFVsQaclOM_bB--cj9EcHMeoePZWgmrtFqpAkT0M_1737056717
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -39
X-Spam_score: -4.0
X-Spam_bar: ----
X-Spam_report: (-4.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.093,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-1.797,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: qjJwYC8Y/W4R

On 16/01/2025 15.59, Philippe Mathieu-Daudé wrote:
> This machine has been supported for a period of more than 6 years.
> According to our versioned machine support policy (see commit
> ce80c4fa6ff "docs: document special exception for machine type
> deprecation & removal") it can now be removed.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>   hw/arm/virt.c | 10 ----------
>   1 file changed, 10 deletions(-)

Reviewed-by: Thomas Huth <thuth@redhat.com>

