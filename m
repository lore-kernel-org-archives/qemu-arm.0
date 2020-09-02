Received: by 2002:a19:ad09:0:0:0:0:0 with SMTP id t9csp643021lfc;
        Wed, 2 Sep 2020 08:43:52 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzjQDqOpmVN+b3qM2wgRo5K9WyImJvFIIr7KaYFCHtgixwgFOBmqtk+ENSRy+Xd9cXWc4hn
X-Received: by 2002:a25:9d89:: with SMTP id v9mr10873041ybp.108.1599061432511;
        Wed, 02 Sep 2020 08:43:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1599061432; cv=none;
        d=google.com; s=arc-20160816;
        b=YDMDgOSfxANfqgkHz2OUpjHSg0Sy3S9bW6Fl+gjisr0cm4KYcMmTBpR0Yr7uqz5hGy
         YyTdwZCqVXXGJ02/nRchqi1XW0zgGnv1z0fS8q3C+2JDKg3Vl4xoQ+ebWvMat+q1QGBV
         tRAhYItKScLipQSKbAVppC001QvR4H6Y8n0DPgv/u00lb23bC0W6jvRa691r8Z/aScfN
         0KsyvaiDONfRxQ9YKAGUnE0XUWiDbPNnAY5UFpkOE2lYshmCZkFehU1J6ehRPgLrRum0
         9BeQkg2SLkviErKa8ZbQay8hblesYqz2kCSMYvqOqwIhmj6QnZVVGXrOK6ABICAvs7lu
         n+Jw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-language
         :content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=h2L6L0qFjWkPIVsxz6ldRrSbsxoL1mUZcWnz5ZRb8SY=;
        b=OZbkvLqCObisgO3UKpQCFU/mbDZpoMDEyrvIGg35b6BRzdErJZ6pCG89Xj16fvUkzQ
         MR27kA2vnVm6FGWB4ntsaWYTaNjfglmjOxxYrO71DMtwo1D4QfZoAtqqGMd2m6Ib2M8O
         5UeZ6SZ0VfK9RGmxfG4vA9EjzKMSnwCn1PZsqI13mvUsJEdspQnTSh0o2zLjsiGm/DSN
         9DPoEAw1CQy4LSADYpDBRsneVsSrn1183KqeADO2/fqw2aOEG0a3cv8pxZ/WXrx+AFY4
         p7jLSDsrbJLn2wKl99Vx4NNcAXM8TfyA+sKURL0BphHkEya4XiQFnxMHUbEhZOqFQxFv
         Arug==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=IWkRVr3E;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id p18si8311ybl.164.2020.09.02.08.43.52
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 02 Sep 2020 08:43:52 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=IWkRVr3E;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:43170 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kDUvP-00050c-S4
	for alex.bennee@linaro.org; Wed, 02 Sep 2020 11:43:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52680)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kDUv8-0004zs-TW
 for qemu-arm@nongnu.org; Wed, 02 Sep 2020 11:43:34 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:55320)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kDUv5-0004Vs-Oa
 for qemu-arm@nongnu.org; Wed, 02 Sep 2020 11:43:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1599061409;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=h2L6L0qFjWkPIVsxz6ldRrSbsxoL1mUZcWnz5ZRb8SY=;
 b=IWkRVr3EzbAGZbEP4KBhvkX88SGrW0O5r0SJfhY2BT4kdmAgJbmul1TzOu36S997YhL49V
 76sDP4x7Fw1xwkkEnpz9IyrFkCfbZNp6WKXmJ3a+Y1Padqr62+zQ848oH1Sclm+Rwk/KTl
 5BlJXQ7h6AK8aH38YPYR4oAYOqII6WA=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-272-eNHzbql-OZGqeBWSJJArDw-1; Wed, 02 Sep 2020 11:43:28 -0400
X-MC-Unique: eNHzbql-OZGqeBWSJJArDw-1
Received: by mail-wr1-f70.google.com with SMTP id f18so2220448wrv.19
 for <qemu-arm@nongnu.org>; Wed, 02 Sep 2020 08:43:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=h2L6L0qFjWkPIVsxz6ldRrSbsxoL1mUZcWnz5ZRb8SY=;
 b=l/15y3a7Ad7FogZz1ee4f8AvlSdPWOgDQ5Onte2Ow5mBJJeS0li0jOFw5xpw6rBjjt
 rqSYlkiC86y7Gj+69pvm1NundbPCfEtpY6mwxcQmIYOuc+gHT9pZ4+JgNIyDy6DKPKwh
 0gtvdpsZTnuis1TmCfLPRMKdF0O15a5CEqe3zvqszSOhjU+zcuHS+ccS2PXCmbPCnta/
 n14X1SCxByPJTXbHrWSMPxZd6Nqba8DJHTZDTN++aS+2GX6wMjYV4ikOtJZc5KQOW7Aq
 H92pdQR96YUu/TuuC3uhEKZPWekuAzoGieOfuu6X5p3+Upp9DqmeQgbF6YqQFQzrfGGo
 7sgQ==
X-Gm-Message-State: AOAM5303B86fQHlZ0LReR0KncAPKigaUnV0PBnCVKQNYiMOw5/6EGtdC
 9xwRF4C5DpvlAPZ14z+CcYS/qqrZ7aR32YNrg7CDgSzzsQ4ZZgaEfqoE8H5FWjpnYhYJqA570kG
 dXnANNM/8KUOF
X-Received: by 2002:a5d:5404:: with SMTP id g4mr7375929wrv.134.1599061407150; 
 Wed, 02 Sep 2020 08:43:27 -0700 (PDT)
X-Received: by 2002:a5d:5404:: with SMTP id g4mr7375915wrv.134.1599061406962; 
 Wed, 02 Sep 2020 08:43:26 -0700 (PDT)
Received: from [192.168.178.58] ([151.21.173.193])
 by smtp.gmail.com with ESMTPSA id a83sm42007wmh.48.2020.09.02.08.43.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 02 Sep 2020 08:43:26 -0700 (PDT)
Subject: Re: Cirrus CI for msys2 are working now, but still buiding failed
To: luoyonggang@gmail.com
References: <CAE2XoE_SkH-2dNULFAZNiRNRNP=OncwCy=xrDk0J3bzS1Th=tg@mail.gmail.com>
 <c61f6420-ffdb-b2b1-44ec-60b8a55f9c8a@redhat.com>
 <ac9ee76a-bc7f-0715-4324-d33c2fb2bb66@redhat.com>
 <CAE2XoE-uu35tMOu=OHjhOnv5jHxegv+3vdKaU2Ue16=6E1Wt9w@mail.gmail.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <d59a63c4-8080-85a5-d171-df082f5c11b7@redhat.com>
Date: Wed, 2 Sep 2020 17:43:25 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <CAE2XoE-uu35tMOu=OHjhOnv5jHxegv+3vdKaU2Ue16=6E1Wt9w@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0.001
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: pass client-ip=63.128.21.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/02 02:42:29
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.324, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Thomas Huth <thuth@redhat.com>, "Daniel P. Berrange" <berrange@redhat.com>,
 qemu-level <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>,
 "qemu-ppc@nongnu.org" <qemu-ppc@nongnu.org>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: pt0eL//Kq8D2

On 02/09/20 17:06, 罗勇刚(Yonggang Luo) wrote:
> I've already making CI green match the cross version, and the fix is not
> just about -L, but also need to move the git submodule update to the end
> of the file

Ok, please send the separate patch for the git submodule update.

Paolo

