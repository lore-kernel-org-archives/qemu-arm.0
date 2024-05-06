Received: by 2002:a17:907:a09:b0:a52:4db9:938b with SMTP id bb9csp1334338ejc;
        Sun, 5 May 2024 21:42:32 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUDOYrUsXwGPTacSh7l8VCkdDLihalzE7i9jHpS7IZrN0EkKATuMPKzFKW4xfUKPpEULXv0cEZRJt/UZQMoo6xMdeS1+gbQ
X-Google-Smtp-Source: AGHT+IEwErdvJ8clompXXn0EGQLQOA07LbNuSQyjQz35sOlaTXT9EW2zpECZ9Zep9LcahDsfSuHR
X-Received: by 2002:a05:6214:2621:b0:6a0:8201:7fa9 with SMTP id gv1-20020a056214262100b006a082017fa9mr12564269qvb.58.1714970552750;
        Sun, 05 May 2024 21:42:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1714970552; cv=none;
        d=google.com; s=arc-20160816;
        b=uHwWiyAYEDq1wG4ItgHGmTmVpcf1vePh/28huxM+mwfhzuZinwviJOQI6bldia159n
         EmNffrw7M0fumQmYoTD4geFJ8p8fdRAosm6joDjaFMozF2G6LSDMKUuCkFoKX5g6LN2t
         m/vz6/jwXYzKBqoGR3+q/7YSaEOxmTflUVNmprj0fSm0KQ8RMSZv2IOPSZ3d8A1wqFqt
         /jtgmDAKMF6Vb+a+24qJenPudCRRIOl+esnFKhN9skvLDxWDYshNps9g3vgP1jiJ/uLp
         TuyaCedIx0sn6Ko54ul+JEMHGZud0T22B37UPguKQLgtRkur27ZCIsaVwj6raSD12m5k
         Kw4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:autocrypt:from:references:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=JR8n/Tllmjm0G1lB8+ML5Tpv6SVFI1c7XPk5XjIsyD4=;
        fh=bBoVlmeddYKh4/n8yDDg134dZEjk5bu/8kC2z7E8/LA=;
        b=f1novydcT6S3eykI5cb7EH+nu3gyqByeCpihsQ8cVZX6U12F+puzadOqSpj5u/hywy
         VBqI0CsKdF5P0TX7btPeKFqQkYUcIoTzmwdmnX+wEnKJQTDiYQiPmjTWFdLL7FmR7EMJ
         qTV17+de4RPtM2APDgKwwkK1/1qx9r9vEVdjmvSOH+BGOMeJvNmIJoyg/6gPbbrffDX1
         UWoLmrYp8HvtydkVuHk4vVMOdAWd7MUDNmFAruYGvOMUkMUCpujEKmDbADGJp6//eEhx
         keyQmRvu6hnBDYpJTMDCsTiOPRniuYUWDl5uEzjSs7MKajLf4snoECVfPABKuZPJuhcV
         QTMA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=KCFYfxni;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u8-20020a0562141c0800b006a076f4d55asi8421689qvc.34.2024.05.05.21.42.32
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 05 May 2024 21:42:32 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=KCFYfxni;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1s3qB8-0001Y9-7G; Mon, 06 May 2024 00:42:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1s3qAq-0001TA-Vx
 for qemu-arm@nongnu.org; Mon, 06 May 2024 00:42:02 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1s3qAm-00028K-HZ
 for qemu-arm@nongnu.org; Mon, 06 May 2024 00:41:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1714970513;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=JR8n/Tllmjm0G1lB8+ML5Tpv6SVFI1c7XPk5XjIsyD4=;
 b=KCFYfxni4LZNNex7Z/mWNAoiqK6p1L+4F157R3db3seRcCp64i8ldnq3AbRUy14lJOr4Jo
 DY9aPU6K9d4JJoPg2JWVPnDMCgM/U8aba6eRAM2F7l3w7vPTIyTgWZ2nwGwtD2UYi3ZQ86
 Of1+sidhF7uQLRaU/IRpGyq7GNlKm2w=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-68-AYC_v5U5PsS4IdeI5oIR1g-1; Mon, 06 May 2024 00:41:50 -0400
X-MC-Unique: AYC_v5U5PsS4IdeI5oIR1g-1
Received: by mail-qk1-f197.google.com with SMTP id
 af79cd13be357-7925ddaaa87so185051785a.3
 for <qemu-arm@nongnu.org>; Sun, 05 May 2024 21:41:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714970510; x=1715575310;
 h=content-transfer-encoding:in-reply-to:autocrypt:from
 :content-language:references:to:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=JR8n/Tllmjm0G1lB8+ML5Tpv6SVFI1c7XPk5XjIsyD4=;
 b=pXUunrU5IOJub5TPkEl4Mo8kt+XD/Wwnx6Ty0FQlB/nMk9l7niPek4xf2lAlzJJuyC
 EhtLLM2pb0tsCBd7xFZT+SRAO7QKgdz4sSmGi4z0WyGFlC5kn2imO+mXgdfNZ2zalIjy
 lI28tKd7Qe4Y81WUKiLsjmvl48++KpXFLCylnMYqFvOIFGvVjSmlfA1mfVLBP+f3RIgt
 wQ1gwRRb6Og8bEIJkw+L7aubQUyk/DLL8GQyTW5o1nIbRfJNQNTMcP4B0DLBFEER5sXN
 zaaXtlrbf3kHRadxBML+gP/Wy1LrMqMnyRnsTO38VYo3vw39wLaaddyjhdwcFPe1QMG3
 npSg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXakSeAQLJbbYwXNrTOcJqbl9ydp4L0Dz788ipCMgvrL9sFZTYJ1P0UU4R8t6tiXRuOUFY9IXXENTEBFSV6OFgnJTat
X-Gm-Message-State: AOJu0YxMX68IVqkzSFP+74fo4q0Nv1xPB4tVLVRqXe68u6uE3kAyvJ6e
 3d9+JbsVad8+AdF/dL7mowhb+aAto7VgtWWfUgQfWfUMoUac3qckS379taSSW7RCoJhBQe8Dly1
 P0SK9iEQjNmkHsCTjsYcyqD5rPgrn7aUXzBeLQ0p1oFDeyb81Vg==
X-Received: by 2002:a05:620a:27cd:b0:790:f930:e1ca with SMTP id
 i13-20020a05620a27cd00b00790f930e1camr12220817qkp.26.1714970510244; 
 Sun, 05 May 2024 21:41:50 -0700 (PDT)
X-Received: by 2002:a05:620a:27cd:b0:790:f930:e1ca with SMTP id
 i13-20020a05620a27cd00b00790f930e1camr12220804qkp.26.1714970509751; 
 Sun, 05 May 2024 21:41:49 -0700 (PDT)
Received: from [192.168.0.9] (ip-109-43-179-34.web.vodafone.de.
 [109.43.179.34]) by smtp.gmail.com with ESMTPSA id
 g4-20020a05620a108400b00790676d0fe2sm3523983qkk.121.2024.05.05.21.41.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 05 May 2024 21:41:49 -0700 (PDT)
Message-ID: <b655fa90-d9a8-475b-ac65-27bf12a48916@redhat.com>
Date: Mon, 6 May 2024 06:41:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] Fixes: Indentation using TABs and improve formatting
To: Michael Tokarev <mjt@tls.msk.ru>, Tanmay <tanmaynpatil105@gmail.com>,
 qemu-stable@nongnu.org, QEMU Developers <qemu-devel@nongnu.org>,
 qemu-arm <qemu-arm@nongnu.org>, Peter Maydell <peter.maydell@linaro.org>
References: <CAHnsOnM6gzcjpmEqCN0cFjZKXZCK_ZGAphuf46xWmUyBcNrAxQ@mail.gmail.com>
 <df14595f-3a26-4b7f-948d-df522f487b92@tls.msk.ru>
From: Thomas Huth <thuth@redhat.com>
Autocrypt: addr=thuth@redhat.com; keydata=
 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
In-Reply-To: <df14595f-3a26-4b7f-948d-df522f487b92@tls.msk.ru>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.431,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
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
X-TUID: 0tlXk28cIOZc

On 04/05/2024 22.34, Michael Tokarev wrote:
> 04.05.2024 21:58, Tanmay wrote:
>> Hi,
>>
>> I have attached a patch file that fixes indentation and formatting for 
>> some files as listed in https://gitlab.com/qemu-project/qemu/-/issues/373 
>> <https://gitlab.com/qemu-project/qemu/-/issues/373>.
> 
> it is sort of good you posted this patch to stable@.  It has absolutely 
> nothing to do
> with stable, but it serves as a an example of things which should - in my 
> opinion -
> not be done at all.

I disagree. Yes, clean-up patches like this make it somewhat difficult to 
backport other patches to stable, but that should not be the reason to not 
do cleanups at all. If we keep badly formatted code in the repository, 
people will copy-n-paste it to other places, or if you have to do fixes in 
sources that have mixed TABs and spaces, you often get complaints from 
checkpatch.pl though it is not your fault. So we should get this straight at 
one point in time.

So, Tanmay, could you please resend your patch, this time to 
qemu-devel@nongnu.org instead of qemu-stable, and CC: qemu-arm@nongnu.org 
and the corresponding ARM maintainers (you can use 
scripts/get_maintainers.pl to find out the correct maintainers that should 
be CC:-ed). And if possible, please send your patch inline and not as an 
attachment (so it's possible to comment on the patch via hitting the reply 
button), preferably with "git send-email" instead of using your e-mail program.

  Thanks!
   Thomas

