Received: by 2002:ac2:5937:0:0:0:0:0 with SMTP id v23csp774637lfi;
        Wed, 25 Mar 2020 08:56:50 -0700 (PDT)
X-Google-Smtp-Source: ADFU+vvofRXWs8PYyHQw9fbSzDqDSJi757Cvbj8DR8j5uNfNgdgii8t9WFGQVmJ060g1EnhmN+oU
X-Received: by 2002:ac8:312e:: with SMTP id g43mr3736424qtb.360.1585151810269;
        Wed, 25 Mar 2020 08:56:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1585151810; cv=none;
        d=google.com; s=arc-20160816;
        b=fEPCNyPhXi00TpAJnGQhwjmSWqvSMvgx1d3xPmp7hNsEEi3QnGxAcEQg0+Ilq0YVvs
         u//36vANlS0Rk0cHpyc3/u9DT6hRnHU1skhUvP9bmssuQtwlvZldoDpT/X0DxPpT+VVH
         vfCY/pam4UXIBNxJG+JXkW5lXBAeq4VwdvUeC/PDqU94RBHYQulOg8MlZyE5hW4/FTFw
         NE5P7MnGSsKlH7sVPChVPQsb4nfMVgli3yWXa/Px0K2ad/fU5aGfPjgYsoN/qyrgFilk
         +Wlo0BTItBzfcSmwEBgfbWfgtbU+f6AZ0uYHlLy5M4pDJR8CGJq7fElaYrky7W8v1WWQ
         dYhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=if4nHKgfpw8B1AsCEBhVgAmrqo1dvIsWXXvDq7Z93T8=;
        b=dqCo1ebWS43X+SpD+zncuRbyaJN2HAWX0h5NEK8vLvvMlpT3JHaGD3a8kSoY0K1+Xn
         tHoxfpc0Cp77UbGmOdd/zzu8zZvVKNFzNBiob1NYPgXCG9M4tixs1upkyPldvBKRrYwv
         6py4ZTUiHKfzMutKW4IBO9kOS8bX2pIiEA/hw6L9Z6EzMD2pF3cP0reeT6yIWk/Bx1IR
         H7PT22ROav943HdHcSqDq8hKpn/+/0MKwe6tnknvKpGUTVyyyiF8E9BD29+0iy017SJT
         gPxv4ZLmMX0qm7LPJOxAQ9jjqWhP2QZyns+Rt33sggYmRgEDpwirJFzZZwzI2WmJ/kCy
         6gOA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=aDtIv2gH;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f145si12718081qke.0.2020.03.25.08.56.50
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 25 Mar 2020 08:56:50 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=aDtIv2gH;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:38752 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jH8Of-00071U-MR
	for alex.bennee@linaro.org; Wed, 25 Mar 2020 11:56:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47362)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <pbonzini@redhat.com>) id 1jH8OX-00070J-Ts
 for qemu-arm@nongnu.org; Wed, 25 Mar 2020 11:56:42 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <pbonzini@redhat.com>) id 1jH8OW-0001wi-FW
 for qemu-arm@nongnu.org; Wed, 25 Mar 2020 11:56:41 -0400
Received: from us-smtp-delivery-74.mimecast.com ([216.205.24.74]:31526)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <pbonzini@redhat.com>) id 1jH8OW-0001wD-7M
 for qemu-arm@nongnu.org; Wed, 25 Mar 2020 11:56:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1585151799;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=if4nHKgfpw8B1AsCEBhVgAmrqo1dvIsWXXvDq7Z93T8=;
 b=aDtIv2gHVrP3SKQM1AMGytEGHr7+hacxT0Qc9Qs48kOmT5zNxxLkxZLF/pAEeliqSoQSRS
 Dd6v4eaixxGHpR+zw0SV7DNgKh67MTahye9K8fVGs2W6HT/T+zpTjp+eL4CGp/wvUPjLL/
 l4f3kRXUTc77bEk8fV8IqT1RA5Gj0Os=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-243-_rULEcH8MKaZ6Uxjpw0pSw-1; Wed, 25 Mar 2020 11:56:37 -0400
X-MC-Unique: _rULEcH8MKaZ6Uxjpw0pSw-1
Received: by mail-wm1-f71.google.com with SMTP id w9so849218wmi.2
 for <qemu-arm@nongnu.org>; Wed, 25 Mar 2020 08:56:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=u0ucPd8wZZF8yHJ+IxpLkbR+ZBVaadk/NDa5B5PcHks=;
 b=GDp9OzaOEGmJOpFiuWWiomHRjPVEczHnooztcUJutuK/QXFKMMDFcUyUiu3vkD4M28
 YXUX4WHdjPhMMYooxnboaMBCACiCfTtokRsg3MJcNnpR6DK0g0G8bPHCR4x39KJO0wzW
 f2ww/6am4+arDr5t8ho/vXKI/H0O+VVMqngTEofXFcNBHYCr0oqZ3modXPizYN5WaBU7
 vFhEdB9C8nDWValAXdjg5uQniJBPJGLqJT28wTIHt3VXCFR4dsSksdEyd2Qz/EFsstGZ
 nI0GdfzHaZixVqaLP4rT5nNwvJiHxSBm+tL8FObJOQ2fA+UBjwdkYFkQ3IJ5S8yVAmP4
 5Sig==
X-Gm-Message-State: ANhLgQ3dCKCV0eOfVCfrO45zPKfX9ASBdF1eRy3fLbx6/YnnbkaHwA16
 s4yxbCS5o9uLF9xDo0WEYaoTA9HLQqeaa0FFn5/1wuT0z/XB+zhubJpzjyADZ69jyyGrns5YCIb
 kj7jibNwYajzK
X-Received: by 2002:a5d:640a:: with SMTP id z10mr4382119wru.301.1585151796712; 
 Wed, 25 Mar 2020 08:56:36 -0700 (PDT)
X-Received: by 2002:a5d:640a:: with SMTP id z10mr4382100wru.301.1585151796506; 
 Wed, 25 Mar 2020 08:56:36 -0700 (PDT)
Received: from [192.168.10.150] ([93.56.170.5])
 by smtp.gmail.com with ESMTPSA id t10sm11716010wrx.38.2020.03.25.08.56.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 25 Mar 2020 08:56:35 -0700 (PDT)
Subject: Re: [PATCH v3] hw/char/pl011: Enable TxFIFO and async transmission
To: Gavin Shan <gshan@redhat.com>, qemu-devel@nongnu.org, qemu-arm@nongnu.org
References: <20200311040923.29115-1-gshan@redhat.com>
 <4c32dbe0-7d96-5e60-addc-b1bf43e17f47@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <da34a58a-0474-c46e-7bbf-cb150bddc717@redhat.com>
Date: Wed, 25 Mar 2020 16:56:35 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <4c32dbe0-7d96-5e60-addc-b1bf43e17f47@redhat.com>
Content-Language: en-US
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 216.205.24.74
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
Cc: peter.maydell@linaro.org, philmd@redhat.com, marcandre.lureau@gmail.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: lAkOl6fMieGJ

On 25/03/20 03:32, Gavin Shan wrote:
>>
>=20
> Marc-Andr=C3=A9, ping. Could you please review when you get a chance? Tha=
nks in
> advance :)

Or Peter; generally arch-specific changes (as opposed to fixes in
chardev API usage) are generally reviewed by arch maintainers.

Paolo

