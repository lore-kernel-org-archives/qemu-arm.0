Received: by 2002:a17:906:6698:b0:a28:f940:7a27 with SMTP id z24csp2354773ejo;
        Mon, 8 Jan 2024 07:36:23 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFscdslEEWbx9rg+7aV1mjQVG0ifQEkqDgW/E/NxrkIVPeiFkGEo0XWqiDFfNkKXKiritte
X-Received: by 2002:a05:6214:1304:b0:680:aedb:72fe with SMTP id pn4-20020a056214130400b00680aedb72femr5879570qvb.81.1704728183121;
        Mon, 08 Jan 2024 07:36:23 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1704728183; cv=none;
        d=google.com; s=arc-20160816;
        b=LgkqSrSgxcDpdXmYMwKRSE0+bz802WKYb9qipqKic29uk/gJnv8UbXJfTZqvEE03JT
         4wJ3NLW8p+APXwKPKUsLziAxj9KfinKNQXtAcqi0axsmTop9YQ022z7hPyNxLBbA1MZe
         VJPZUV9N2iYCTc0V1tZQWOFfacvl8A62SzAyp4FNsFD0K7MpTlD+0QAvrZnnv/qnxnqO
         wfaLbY1NiBcx4UOIIGe2gbzx/imXyuxuRO8Xe1myUGT4h8nWWyvy75bEJdiefdHI5Qp4
         DuQVqOx1qfkT3EoAw9shrFp8D8Wr9Dqoi6kN2ay/n3xKK3AGkEZN5pQi/vV4dSdabrdT
         UNEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:autocrypt:from:references:cc:to
         :subject:user-agent:mime-version:date:message-id:dkim-signature;
        bh=LvwV0TOqkoGSlixMO7zV1TtypS8ZUFgPx4R8cAsUgY8=;
        fh=htij+yRFubsGpRN93rRInsGGZyUnvDjA3jXB9SaLLvA=;
        b=WzmA9mxBukMoOGXONnBKXxZVY3CoRQqG+SwP7aW07Bq7M4Cy5o2aNVwn/Yv+KNF3av
         Es8zc/6nD17ynLbfNgnYZBGpXmXMQQ8EdvDQsglAn8BFUIrcP6WhC6YUxT9ulyJP1S8f
         sLiNToDpM3KyKE5nud+jxsmjzBo8omq+92i8JeL60rweZB2cn9Mka+rhhzE4ocZLsp+U
         l+ln7ZERpJeIp3btVJyD63YshfoklVbeYut/XiGAu7VrHhQ7PDpxByxfx2F74gp7Cn1U
         bEaPOpyijEPHoGj98n1xvDKwDocN50J6kUexdEOcfs51z9ArjilqwZX7IoC0TMOvqUrM
         NBog==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Oxt65Z2N;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o20-20020a05620a111400b0078322974c11si2222325qkk.628.2024.01.08.07.36.22
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 08 Jan 2024 07:36:23 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Oxt65Z2N;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rMrfZ-0005Am-Hv; Mon, 08 Jan 2024 10:36:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1rMrfX-0005AM-UG
 for qemu-arm@nongnu.org; Mon, 08 Jan 2024 10:36:03 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1rMrfW-0005co-5y
 for qemu-arm@nongnu.org; Mon, 08 Jan 2024 10:36:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1704728160;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=LvwV0TOqkoGSlixMO7zV1TtypS8ZUFgPx4R8cAsUgY8=;
 b=Oxt65Z2NfNl6EKNVrpg9cD/bYCB/OIVSXgW/uXslYNaGXy6KyjZmYeLfjPq6EYQxQCtOu4
 x+YiKZ3Z++XQjQnF9R+lBpFLtGYHxsinCi/aObEOrKZw3cv4Ot5UfitgeI/g09p5+j7fH2
 cwSp0+d4B9sCj4gcMuyA6SFm26tJOq4=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-298-d8wEd2uhP0qKRggQpzDh7A-1; Mon, 08 Jan 2024 10:35:58 -0500
X-MC-Unique: d8wEd2uhP0qKRggQpzDh7A-1
Received: by mail-qv1-f69.google.com with SMTP id
 6a1803df08f44-67f8c9542c6so41934226d6.0
 for <qemu-arm@nongnu.org>; Mon, 08 Jan 2024 07:35:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704728158; x=1705332958;
 h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
 :to:content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=LvwV0TOqkoGSlixMO7zV1TtypS8ZUFgPx4R8cAsUgY8=;
 b=uLO854ZqzdUD3rNslXLev6qO0BvFNBNH5SiKhklJ8fLaEXlDUrD97ao5RV+GgyyDeT
 f5Aa8V25xDNgfmv2RKb7BJvPoC8odtwhBRByqJUji1lgKTLOTkZ8M65jPMoJj2OAGz56
 n6I0wv8Qc/A7km3+U8hzOYEBVxRjRvEZNT5LoF1D3Cohq8iuhxBayqnyx7xBnBanGN1E
 Oet1+9hbEbXmRyOkGXyY4BzffbVEOM5e0BLwFiJq8NEpFxOcYuT0H5f7PUGQzKLm4uA2
 aIkv+Eao+TMgQWYJtCh+1Y011ICsgA+S/7iZTUAHXyhfmkNsZ7vR2VQNg9q0rwcJle4t
 xp4w==
X-Gm-Message-State: AOJu0Ywo0y9rr8GBnaEDGFn6I8tvtM/CAtYZS1NhBqO9ZZIbsfLw6EIE
 Ol1mJjQKnfD6eFC3ZsJMvVrbfVysOsO4zKmOKfupKDF/a3Xng0Uya75WeeFCl8roSPCuobe/9Bs
 RSFWAOpf3u+81maiHa/KH
X-Received: by 2002:a05:622a:f:b0:429:9a0e:d2e9 with SMTP id
 x15-20020a05622a000f00b004299a0ed2e9mr928491qtw.108.1704728158269; 
 Mon, 08 Jan 2024 07:35:58 -0800 (PST)
X-Received: by 2002:a05:622a:f:b0:429:9a0e:d2e9 with SMTP id
 x15-20020a05622a000f00b004299a0ed2e9mr928481qtw.108.1704728157955; 
 Mon, 08 Jan 2024 07:35:57 -0800 (PST)
Received: from [192.168.0.9] (ip-109-43-179-78.web.vodafone.de.
 [109.43.179.78]) by smtp.gmail.com with ESMTPSA id
 v21-20020ac87495000000b00429a0688f8fsm60292qtq.68.2024.01.08.07.35.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 08 Jan 2024 07:35:57 -0800 (PST)
Message-ID: <ee980401-5640-418b-a9f1-dc03169f020b@redhat.com>
Date: Mon, 8 Jan 2024 16:35:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] docs: use "buses" rather than "busses"
To: Pavel Pisa <pisa@fel.cvut.cz>, Samuel Tardieu <sam@rfc1149.net>,
 Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, qemu-trivial@nongnu.org,
 Vikram Garhwal <fnu.vikram@xilinx.com>, Jason Wang <jasowang@redhat.com>
References: <20240103172817.2197737-1-sam@rfc1149.net>
 <202401032234.12134.pisa@fel.cvut.cz>
From: Thomas Huth <thuth@redhat.com>
Autocrypt: addr=thuth@redhat.com; keydata=
 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
In-Reply-To: <202401032234.12134.pisa@fel.cvut.cz>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-2.243,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_SORBS_WEB=1.5, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: w6HIe41qmtIW

On 03/01/2024 22.34, Pavel Pisa wrote:
> On Wednesday 03 of January 2024 18:28:17 Samuel Tardieu wrote:
>> If "busses" might be encountered as a plural of "bus" (5 instances),
>> the correct spelling is "buses" (26 instances). Fixing those 5
>> instances makes the doc more consistent.
>>
>> Signed-off-by: Samuel Tardieu <sam@rfc1149.net>
> Reviewed-by: Pavel Pisa <pisa@cmp.felk.cvut.cz>
> 
> PS: there is waiting my previous CAN FIX from December 14
> and I have received any feedback if it will be taken
> by somebody with commit rights
> 
>    https://gitlab.com/qemu-project/qemu/-/issues/2028
>    https://patchew.org/QEMU/20231214104623.31147-1-pisa@fel.cvut.cz/
> 
> Should I resend it?

Since you (and Vikram) are listed as a maintainer for the CAN subsystem,  so 
if there were no objections, it's maybe easiest if you send a pull request 
for it. See this page for some more information:

  https://www.qemu.org/docs/master/devel/submitting-a-pull-request.html

Basically:
- Stick your patch(es) in a branch on your public repository
- Create a signed git tag ("git tag -s ...") and push it to your repo
- git format-patch --cover-letter --subject-prefix=PULL ...
- Use "git request-pull" to create the contents of the cover letter
- Send them to the qemu-devel mailing list

  HTH,
   Thomas



